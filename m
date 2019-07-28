Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E9977E9C
	for <lists.virtualization@lfdr.de>; Sun, 28 Jul 2019 10:36:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A983AAB5;
	Sun, 28 Jul 2019 08:36:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4EA9A9EE
	for <virtualization@lists.linux-foundation.org>;
	Sun, 28 Jul 2019 08:36:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DD029604
	for <virtualization@lists.linux-foundation.org>;
	Sun, 28 Jul 2019 08:36:47 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id h6so27030558iom.7
	for <virtualization@lists.linux-foundation.org>;
	Sun, 28 Jul 2019 01:36:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=JmcimYJf+Bna2bF5oHtnyvYwQab4h3brdRl3y+Yku3w=;
	b=bhEDzS2t5PujvyUd/FlbhEUDUAgaKZyFBQBvxmZjb70ff5w9z9962WmFr9qINfSQ/x
	7o911x10agCRC8lebYtyulf4Hw9nPh+WC5I1oxkEcGCLpV638/N+ky2rk/d/6E7gB/kX
	UaFhOXvrZ3TCRVR6+F8MqQcFaHddxweD//YmhttXLwASHBNzLUdtv3hxw4vKknwtxC58
	aOwxara3JCO5dL/xHq2Bh6EIYWFqKeW2b6KdDO1E2v5yhu/Ke3zjYet/e1I3XKl3gA61
	+Mkv9LYoGp6xBR+pQ+Q9CMR+boLFwSTbAfAjQT4vMADEJz244v/cwj8iXU56IU5t/T8y
	CLvQ==
X-Gm-Message-State: APjAAAX7BYlTzAV1SlWkYUq8RsoBrx8cLurQs/6JJHhDEHiEK8ZkTlO/
	6DOS3KyVuKQbRc7iJ10f46567g==
X-Google-Smtp-Source: APXvYqyHU6qTV7uMr9tjpRxhhvTuO4lK+5tp+FQOjsGxN+s/1qcSKnN7S1nMevwymEewifIu5iF5Gg==
X-Received: by 2002:a02:b883:: with SMTP id p3mr34245354jam.79.1564303007037; 
	Sun, 28 Jul 2019 01:36:47 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
	by smtp.gmail.com with ESMTPSA id
	o7sm48957845ioo.81.2019.07.28.01.36.42
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 28 Jul 2019 01:36:45 -0700 (PDT)
Date: Sun, 28 Jul 2019 04:36:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Hillf Danton <hdanton@sina.com>
Subject: Re: INFO: rcu detected stall in vhost_worker
Message-ID: <20190728043619-mutt-send-email-mst@kernel.org>
References: <000000000000b4358f058e924c6d@google.com>
	<000000000000e87d14058e9728d7@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000000000000e87d14058e9728d7@google.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: michal.lkml@markovi.net, kvm@vger.kernel.org, linux-kbuild@vger.kernel.org,
	syzbot <syzbot+36e93b425cd6eb54fcc1@syzkaller.appspotmail.com>,
	netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	yamada.masahiro@socionext.com, torvalds@linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Sat, Jul 27, 2019 at 04:23:23PM +0800, Hillf Danton wrote:
> 
> Fri, 26 Jul 2019 08:26:01 -0700 (PDT)
> > syzbot has bisected this bug to:
> > 
> > commit 0ecfebd2b52404ae0c54a878c872bb93363ada36
> > Author: Linus Torvalds <torvalds@linux-foundation.org>
> > Date:   Sun Jul 7 22:41:56 2019 +0000
> > 
> >      Linux 5.2
> > 
> > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=118810bfa00000
> > start commit:   13bf6d6a Add linux-next specific files for 20190725
> > git tree:       linux-next
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=8ae987d803395886
> > dashboard link: https://syzkaller.appspot.com/bug?extid=36e93b425cd6eb54fcc1
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15112f3fa00000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=131ab578600000
> > 
> > Reported-by: syzbot+36e93b425cd6eb54fcc1@syzkaller.appspotmail.com
> > Fixes: 0ecfebd2b524 ("Linux 5.2")
> > 
> > For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> 
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -787,7 +787,6 @@ static void vhost_setup_uaddr(struct vho
> 			      size_t size, bool write)
> {
> 	struct vhost_uaddr *addr = &vq->uaddrs[index];
> -	spin_lock(&vq->mmu_lock);
> 
> 	addr->uaddr = uaddr;
> 	addr->size = size;
> @@ -797,7 +796,10 @@ static void vhost_setup_uaddr(struct vho
> static void vhost_setup_vq_uaddr(struct vhost_virtqueue *vq)
> {
> 	spin_lock(&vq->mmu_lock);
> -
> +	/*
> +	 * deadlock if managing to take mmu_lock again while
> +	 * setting up uaddr
> +	 */
> 	vhost_setup_uaddr(vq, VHOST_ADDR_DESC,
> 			  (unsigned long)vq->desc,
> 			  vhost_get_desc_size(vq, vq->num),
> --

Thanks!
I reverted this whole commit.

-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
