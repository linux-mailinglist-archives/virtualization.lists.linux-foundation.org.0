Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BDB2F449
	for <lists.virtualization@lfdr.de>; Thu, 30 May 2019 06:37:46 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7D09F30E4;
	Thu, 30 May 2019 04:37:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3BD4130E0
	for <virtualization@lists.linux-foundation.org>;
	Thu, 30 May 2019 04:28:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 884F0619
	for <virtualization@lists.linux-foundation.org>;
	Thu, 30 May 2019 04:28:56 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::3d5])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: davem-davemloft)
	by shards.monkeyblade.net (Postfix) with ESMTPSA id 6F6C0136E07E5;
	Wed, 29 May 2019 21:28:55 -0700 (PDT)
Date: Wed, 29 May 2019 21:28:52 -0700 (PDT)
Message-Id: <20190529.212852.1077585415381753122.davem@davemloft.net>
To: sgarzare@redhat.com
Subject: Re: [PATCH 1/4] vsock/virtio: fix locking around 'the_virtio_vsock'
From: David Miller <davem@davemloft.net>
In-Reply-To: <20190528105623.27983-2-sgarzare@redhat.com>
References: <20190528105623.27983-1-sgarzare@redhat.com>
	<20190528105623.27983-2-sgarzare@redhat.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
	(shards.monkeyblade.net [149.20.54.216]);
	Wed, 29 May 2019 21:28:55 -0700 (PDT)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
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
Date: Tue, 28 May 2019 12:56:20 +0200

> @@ -68,7 +68,13 @@ struct virtio_vsock {
>  
>  static struct virtio_vsock *virtio_vsock_get(void)
>  {
> -	return the_virtio_vsock;
> +	struct virtio_vsock *vsock;
> +
> +	mutex_lock(&the_virtio_vsock_mutex);
> +	vsock = the_virtio_vsock;
> +	mutex_unlock(&the_virtio_vsock_mutex);
> +
> +	return vsock;

This doesn't do anything as far as I can tell.

No matter what, you will either get the value before it's changed or
after it's changed.

Since you should never publish the pointer by assigning it until the
object is fully initialized, this can never be a problem even without
the mutex being there.

Even if you sampled the the_virtio_sock value right before it's being
set to NULL by the remove function, that still can happen with the
mutex held too.

This function is also terribly named btw, it implies that a reference
count is being taken.  But that's not what this function does, it
just returns the pointer value as-is.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
