Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D55F6166
	for <lists.virtualization@lfdr.de>; Sat,  9 Nov 2019 21:29:45 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0D797AE7;
	Sat,  9 Nov 2019 20:29:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E09F7A7A
	for <virtualization@lists.linux-foundation.org>;
	Sat,  9 Nov 2019 20:29:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E509B5F4
	for <virtualization@lists.linux-foundation.org>;
	Sat,  9 Nov 2019 20:29:35 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:1e2::d71])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: davem-davemloft)
	by shards.monkeyblade.net (Postfix) with ESMTPSA id 21D7B1474DF0F;
	Sat,  9 Nov 2019 12:29:35 -0800 (PST)
Date: Fri, 08 Nov 2019 12:19:46 -0800 (PST)
Message-Id: <20191108.121946.1084660860645163442.davem@davemloft.net>
To: sgarzare@redhat.com
Subject: Re: [PATCH] vsock/virtio: fix sock refcnt holding during the shutdown
From: David Miller <davem@davemloft.net>
In-Reply-To: <20191108160850.51278-1-sgarzare@redhat.com>
References: <20191108160850.51278-1-sgarzare@redhat.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
	(shards.monkeyblade.net [149.20.54.216]);
	Sat, 09 Nov 2019 12:29:35 -0800 (PST)
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00, DATE_IN_PAST_24_48, 
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, stefanha@redhat.com
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

From: Stefano Garzarella <sgarzare@redhat.com>
Date: Fri,  8 Nov 2019 17:08:50 +0100

> The "42f5cda5eaf4" commit rightly set SOCK_DONE on peer shutdown,
> but there is an issue if we receive the SHUTDOWN(RDWR) while the
> virtio_transport_close_timeout() is scheduled.
> In this case, when the timeout fires, the SOCK_DONE is already
> set and the virtio_transport_close_timeout() will not call
> virtio_transport_reset() and virtio_transport_do_close().
> This causes that both sockets remain open and will never be released,
> preventing the unloading of [virtio|vhost]_transport modules.
> 
> This patch fixes this issue, calling virtio_transport_reset() and
> virtio_transport_do_close() when we receive the SHUTDOWN(RDWR)
> and there is nothing left to read.
> 
> Fixes: 42f5cda5eaf4 ("vsock/virtio: set SOCK_DONE on peer shutdown")
> Cc: Stephen Barber <smbarber@chromium.org>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>

Applied and queued up for -stable, thanks.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
