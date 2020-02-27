Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A716B172933
	for <lists.virtualization@lfdr.de>; Thu, 27 Feb 2020 21:04:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 571AD221CC;
	Thu, 27 Feb 2020 20:04:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BxAfiPUigNvf; Thu, 27 Feb 2020 20:04:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A59A822DB0;
	Thu, 27 Feb 2020 20:04:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 84557C0177;
	Thu, 27 Feb 2020 20:04:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0693C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Feb 2020 20:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B3C66221CC
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Feb 2020 20:04:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id plOsxwka75ii
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Feb 2020 20:04:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 by silver.osuosl.org (Postfix) with ESMTPS id 4801920408
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Feb 2020 20:04:26 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 370B2121793F1;
 Thu, 27 Feb 2020 12:04:24 -0800 (PST)
Date: Thu, 27 Feb 2020 12:04:23 -0800 (PST)
Message-Id: <20200227.120423.2054408641031093845.davem@davemloft.net>
To: sgarzare@redhat.com
Subject: Re: [PATCH net] vsock: fix potential deadlock in transport->release()
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200226105818.36055-1-sgarzare@redhat.com>
References: <20200226105818.36055-1-sgarzare@redhat.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 27 Feb 2020 12:04:24 -0800 (PST)
Cc: sashal@kernel.org, hdanton@sina.com, sthemmin@microsoft.com,
 syzbot+731710996d79d0d58fbc@syzkaller.appspotmail.com, kvm@vger.kernel.org,
 netdev@vger.kernel.org, haiyangz@microsoft.com, decui@microsoft.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-hyperv@vger.kernel.org, stefanha@redhat.com, kuba@kernel.org,
 sunilmut@microsoft.com, jhansen@vmware.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 26 Feb 2020 11:58:18 +0100

> Some transports (hyperv, virtio) acquire the sock lock during the
> .release() callback.
> 
> In the vsock_stream_connect() we call vsock_assign_transport(); if
> the socket was previously assigned to another transport, the
> vsk->transport->release() is called, but the sock lock is already
> held in the vsock_stream_connect(), causing a deadlock reported by
> syzbot:
 ...
> To avoid this issue, this patch remove the lock acquiring in the
> .release() callback of hyperv and virtio transports, and it holds
> the lock when we call vsk->transport->release() in the vsock core.
> 
> Reported-by: syzbot+731710996d79d0d58fbc@syzkaller.appspotmail.com
> Fixes: 408624af4c89 ("vsock: use local transport when it is loaded")
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>

Applied, thank you.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
