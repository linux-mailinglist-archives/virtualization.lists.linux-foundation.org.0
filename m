Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DFA2245B
	for <lists.virtualization@lfdr.de>; Sat, 18 May 2019 19:52:10 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DFCE3AAE;
	Sat, 18 May 2019 17:51:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 800C1AA5
	for <virtualization@lists.linux-foundation.org>;
	Sat, 18 May 2019 17:51:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B0DB95E4
	for <virtualization@lists.linux-foundation.org>;
	Sat, 18 May 2019 17:51:49 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::3d8])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: davem-davemloft)
	by shards.monkeyblade.net (Postfix) with ESMTPSA id C611214DD9232;
	Sat, 18 May 2019 10:51:48 -0700 (PDT)
Date: Sat, 18 May 2019 10:51:48 -0700 (PDT)
Message-Id: <20190518.105148.796052200759156053.davem@davemloft.net>
To: jemoreira@google.com
Subject: Re: [PATCH RESEND] vsock/virtio: Initialize core virtio vsock
	before registering the driver
From: David Miller <davem@davemloft.net>
In-Reply-To: <20190516205107.222003-1-jemoreira@google.com>
References: <20190516205107.222003-1-jemoreira@google.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
	(shards.monkeyblade.net [149.20.54.216]);
	Sat, 18 May 2019 10:51:49 -0700 (PDT)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	virtualization@lists.linux-foundation.org, stefanha@redhat.com,
	kernel-team@android.com, sgarzare@redhat.com
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

From: "Jorge E. Moreira" <jemoreira@google.com>
Date: Thu, 16 May 2019 13:51:07 -0700

> Avoid a race in which static variables in net/vmw_vsock/af_vsock.c are
> accessed (while handling interrupts) before they are initialized.
 ...
> Fixes: 22b5c0b63f32 ("vsock/virtio: fix kernel panic after device hot-unplug")
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Stefano Garzarella <sgarzare@redhat.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: kvm@vger.kernel.org
> Cc: virtualization@lists.linux-foundation.org
> Cc: netdev@vger.kernel.org
> Cc: kernel-team@android.com
> Cc: stable@vger.kernel.org [4.9+]
> Signed-off-by: Jorge E. Moreira <jemoreira@google.com>
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Applied and queued up for -stable, thanks.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
