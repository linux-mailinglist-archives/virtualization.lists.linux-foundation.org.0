Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8564286133
	for <lists.virtualization@lfdr.de>; Thu,  8 Aug 2019 13:56:06 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B4453F3E;
	Thu,  8 Aug 2019 11:56:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DB918DC6
	for <virtualization@lists.linux-foundation.org>;
	Thu,  8 Aug 2019 11:55:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9245D14D
	for <virtualization@lists.linux-foundation.org>;
	Thu,  8 Aug 2019 11:55:58 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
	[83.86.89.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id DE75921874;
	Thu,  8 Aug 2019 11:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565265358;
	bh=DSDFumAChuko83ZMojcrTL89RmjY+E6uL9obeAU7zCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vVd2ZiaIf8AhF6R///cyKDe311FLAG7VrSH5UqsFnighSJFP88+QuiDBXUo/gqwmU
	WlXP7lVGaHwO2Lnd9CJ5DBWKs9XnS07Jkka55lHEB5X15uHP1zCCUGI2w3kD74fuoP
	TMzBOl3/GM2mMi7cbKgkVuZ8GPQ6BI3vatDP7ahM=
Date: Thu, 8 Aug 2019 13:55:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pankaj Gupta <pagupta@redhat.com>
Subject: Re: [PATCH v2 1/2] virtio_console: free unused buffers with port
	delete
Message-ID: <20190808115555.GA2015@kroah.com>
References: <20190808113606.19504-1-pagupta@redhat.com>
	<20190808113606.19504-2-pagupta@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808113606.19504-2-pagupta@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: arnd@arndb.de, mst@redhat.com, amit@kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

On Thu, Aug 08, 2019 at 05:06:05PM +0530, Pankaj Gupta wrote:
>   The commit a7a69ec0d8e4 ("virtio_console: free buffers after reset")
>   deferred detaching of unused buffer to virtio device unplug time.
> 
>   This causes unplug/replug of single port in virtio device with an
>   error "Error allocating inbufs\n". As we don't free the unused buffers
>   attached with the port. Re-plug the same port tries to allocate new
>   buffers in virtqueue and results in this error if queue is full.
> 
>   This patch removes the unused buffers in vq's when we unplug the port.
>   This is the best we can do as we cannot call device_reset because virtio
>   device is still active.

Why is this indented?

> 
> Reported-by: Xiaohui Li <xiaohli@redhat.com>
> Fixes: b3258ff1d6 ("virtio_console: free buffers after reset")

Fixes: b3258ff1d608 ("virtio: Decrement avail idx on buffer detach")

is the correct format to use.

And given that this is from 2.6.39 (and 2.6.38.5), shouldn't it also be
backported for the stable kernels?

thanks,

greg k-h
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
