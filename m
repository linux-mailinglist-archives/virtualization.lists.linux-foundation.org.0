Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E31EB1B5D69
	for <lists.virtualization@lfdr.de>; Thu, 23 Apr 2020 16:13:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8FB60875DC;
	Thu, 23 Apr 2020 14:13:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f49jggjaPjuo; Thu, 23 Apr 2020 14:13:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0B526875DB;
	Thu, 23 Apr 2020 14:13:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DD0E4C0175;
	Thu, 23 Apr 2020 14:13:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 449A3C0175
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Apr 2020 14:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3230022767
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Apr 2020 14:13:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2pbmclLAtduq
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Apr 2020 14:13:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by silver.osuosl.org (Postfix) with ESMTPS id 774042026D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Apr 2020 14:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=F6RH6jVuqtLpOUJiHYNSU4twCT8kCbptB6JR+OvixTE=; b=swS5ZZWPVv2ZNdoDtEloS7FPCQ
 9VkH59EYRVFIGHIQ09n/4DelunQqbADmE9Evrr/bW9PmjLiilFLbtcfkK7SlwD1TNafToBkXgOj05
 IRTrRzfdX1SfmG7lnggi89FfUNGkWhiBdYTuBTi0rYtmeXBHsS6zpMdgCi+qzCXZjNNv9n4pXcR/8
 l4vlwVRO7bAa2EKKMjjzCQPliiKoZivwbxj//NA3ToOeg8WNIqwi9m0E0pyv7peSyw5kM0s3Pz9nn
 pzCP9kKWcCGw/lOQsT4dl49x6yAAwbnlgvfdIlBaA1CcWthIuB0nNxkXspepp69INe8Yrv3AaR68K
 wsmwjKVA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jRcbi-0002wR-FU; Thu, 23 Apr 2020 14:13:38 +0000
Date: Thu, 23 Apr 2020 07:13:38 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] virtio-blk: handle block_device_operations callbacks
 after hot unplug
Message-ID: <20200423141338.GA29646@infradead.org>
References: <20200423123717.139141-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200423123717.139141-1-stefanha@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Jens Axboe <axboe@kernel.dk>, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-block@vger.kernel.org, Lance Digby <ldigby@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
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

On Thu, Apr 23, 2020 at 01:37:17PM +0100, Stefan Hajnoczi wrote:
> A virtio_blk block device can still be referenced after hot unplug by
> userspace processes that hold the file descriptor.  In this case
> virtblk_getgeo() can be invoked after virtblk_remove() was called.  For
> example, a program that has /dev/vdb open can call ioctl(HDIO_GETGEO)
> after hot unplug.
> 
> Fix this by clearing vblk->disk->private_data and checking that the
> virtio_blk driver instance is still around in virtblk_getgeo().
> 
> Note that the virtblk_getgeo() function itself is guaranteed to remain
> in memory after hot unplug because the virtio_blk module refcount is
> still held while a block device reference exists.
> 
> Originally-by: Lance Digby <ldigby@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  drivers/block/virtio_blk.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> index 93468b7c6701..b50cdf37a6f7 100644
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@ -300,6 +300,10 @@ static int virtblk_getgeo(struct block_device *bd, struct hd_geometry *geo)
>  {
>  	struct virtio_blk *vblk = bd->bd_disk->private_data;
>  
> +	/* Driver instance has been removed */
> +	if (!vblk)
> +		return -ENOTTY;

If this ever hits you have a nasty race condition and this is not
going to fix it, as it could be removed just after this check as well.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
