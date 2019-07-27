Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0380C77799
	for <lists.virtualization@lfdr.de>; Sat, 27 Jul 2019 10:23:52 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 816C7AE0;
	Sat, 27 Jul 2019 08:23:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 24AAA265
	for <virtualization@lists.linux-foundation.org>;
	Sat, 27 Jul 2019 08:23:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail3-165.sinamail.sina.com.cn (mail3-165.sinamail.sina.com.cn
	[202.108.3.165])
	by smtp1.linuxfoundation.org (Postfix) with SMTP id DB000709
	for <virtualization@lists.linux-foundation.org>;
	Sat, 27 Jul 2019 08:23:40 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([222.131.77.31])
	by sina.com with ESMTP
	id 5D3C0A0300001999; Sat, 27 Jul 2019 16:23:34 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 64397645089200
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+36e93b425cd6eb54fcc1@syzkaller.appspotmail.com>
Subject: Re: INFO: rcu detected stall in vhost_worker
Date: Sat, 27 Jul 2019 16:23:23 +0800
Message-Id: <000000000000e87d14058e9728d7@google.com>
In-Reply-To: <000000000000b4358f058e924c6d@google.com>
References: 
MIME-Version: 1.0
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
Archived-At: <https://lore.kernel.org/lkml/000000000000e87d14058e9728d7@google.com/>
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	MAILING_LIST_MULTI, RCVD_IN_DNSWL_NONE,
	SORTED_RECIPS autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: michal.lkml@markovi.net, kvm@vger.kernel.org, mst@redhat.com,
	netdev@vger.kernel.org, linux-kbuild@vger.kernel.org,
	syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	yamada.masahiro@socionext.com, torvalds@linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


Fri, 26 Jul 2019 08:26:01 -0700 (PDT)
> syzbot has bisected this bug to:
> 
> commit 0ecfebd2b52404ae0c54a878c872bb93363ada36
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Sun Jul 7 22:41:56 2019 +0000
> 
>      Linux 5.2
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=118810bfa00000
> start commit:   13bf6d6a Add linux-next specific files for 20190725
> git tree:       linux-next
> kernel config:  https://syzkaller.appspot.com/x/.config?x=8ae987d803395886
> dashboard link: https://syzkaller.appspot.com/bug?extid=36e93b425cd6eb54fcc1
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15112f3fa00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=131ab578600000
> 
> Reported-by: syzbot+36e93b425cd6eb54fcc1@syzkaller.appspotmail.com
> Fixes: 0ecfebd2b524 ("Linux 5.2")
> 
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -787,7 +787,6 @@ static void vhost_setup_uaddr(struct vho
 			      size_t size, bool write)
 {
 	struct vhost_uaddr *addr = &vq->uaddrs[index];
-	spin_lock(&vq->mmu_lock);
 
 	addr->uaddr = uaddr;
 	addr->size = size;
@@ -797,7 +796,10 @@ static void vhost_setup_uaddr(struct vho
 static void vhost_setup_vq_uaddr(struct vhost_virtqueue *vq)
 {
 	spin_lock(&vq->mmu_lock);
-
+	/*
+	 * deadlock if managing to take mmu_lock again while
+	 * setting up uaddr
+	 */
 	vhost_setup_uaddr(vq, VHOST_ADDR_DESC,
 			  (unsigned long)vq->desc,
 			  vhost_get_desc_size(vq, vq->num),
--

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
