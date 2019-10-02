Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F375C4575
	for <lists.virtualization@lfdr.de>; Wed,  2 Oct 2019 03:24:07 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CFD452A5A;
	Wed,  2 Oct 2019 01:23:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2CCB21E42
	for <virtualization@lists.linux-foundation.org>;
	Wed,  2 Oct 2019 01:23:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D337B189
	for <virtualization@lists.linux-foundation.org>;
	Wed,  2 Oct 2019 01:23:57 +0000 (UTC)
Received: from localhost (unknown
	[IPv6:2603:3023:50c:85e1:b5c5:ae11:3e54:6a07])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: davem-davemloft)
	by shards.monkeyblade.net (Postfix) with ESMTPSA id 1003014D65306;
	Tue,  1 Oct 2019 18:23:56 -0700 (PDT)
Date: Tue, 01 Oct 2019 21:23:55 -0400 (EDT)
Message-Id: <20191001.212355.540884408544073853.davem@davemloft.net>
To: decui@microsoft.com
Subject: Re: [PATCH net v3] vsock: Fix a lockdep warning in __vsock_release()
From: David Miller <davem@davemloft.net>
In-Reply-To: <1569868998-56603-1-git-send-email-decui@microsoft.com>
References: <1569868998-56603-1-git-send-email-decui@microsoft.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
	(shards.monkeyblade.net [149.20.54.216]);
	Tue, 01 Oct 2019 18:23:56 -0700 (PDT)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: sashal@kernel.org, linux-hyperv@vger.kernel.org, sthemmin@microsoft.com,
	kvm@vger.kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
	haiyangz@microsoft.com, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, sgarzare@redhat.com,
	deepa.kernel@gmail.com, stefanha@redhat.com,
	netdev@vger.kernel.org, tglx@linutronix.de, ytht.net@gmail.com,
	jhansen@vmware.com, mikelley@microsoft.com
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

From: Dexuan Cui <decui@microsoft.com>
Date: Mon, 30 Sep 2019 18:43:50 +0000

> Lockdep is unhappy if two locks from the same class are held.
> 
> Fix the below warning for hyperv and virtio sockets (vmci socket code
> doesn't have the issue) by using lock_sock_nested() when __vsock_release()
> is called recursively:
 ...
> Tested-by: Stefano Garzarella <sgarzare@redhat.com>
> Signed-off-by: Dexuan Cui <decui@microsoft.com>

Applied, thanks.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
