Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9153FBA5E
	for <lists.virtualization@lfdr.de>; Mon, 30 Aug 2021 18:49:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD58A80CA1;
	Mon, 30 Aug 2021 16:49:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hGGTyy5omU2S; Mon, 30 Aug 2021 16:49:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A2A9A80D41;
	Mon, 30 Aug 2021 16:49:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2376CC000E;
	Mon, 30 Aug 2021 16:49:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6D60FC000E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Aug 2021 16:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E789606E9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Aug 2021 16:49:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GQWmWyW2Lqps
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Aug 2021 16:49:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B68260593
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Aug 2021 16:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=6rHApL/Np9+9ugLAs48I8ACfdCP2s/Ndc6zPCQ0cfq0=; b=f/rDqmUDQgkWbrA8o/5V0HBaL4
 nvG1ecXU08POhUXxJ0fFrvCemil25t6qZB9NY51MaQdPngfABasVxRDYEWat0fDdDMn5M+POL0DUm
 /o4gK5VwrFvqdh+McNmadh4EJpTbEbRtWHaNlPYjf4YW3oLqfRIEh5caabE2guzyHerkzNEIKj9xO
 S7egjaEm2UrVqVS98UCrS4g64L7N5nmEqRz2873j8dmhQde8Gx18kWRQK9LHI7G2WNJf4rPg9U2oJ
 ACi+HZ3ehMxleZOJhi5Yrdjd01ojYLPFPe/9e8BZm4muVHEEQLy5SgmVXk1Fwm8xw+mw4jNwXwqM9
 cvT3pCcQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mKkST-000L1o-4j; Mon, 30 Aug 2021 16:48:46 +0000
Date: Mon, 30 Aug 2021 17:48:29 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Subject: Re: [PATCH 1/1] virtio-blk: add num_io_queues module parameter
Message-ID: <YS0L3RIiPfb9d5Xx@infradead.org>
References: <20210830120023.22202-1-mgurtovoy@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210830120023.22202-1-mgurtovoy@nvidia.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: axboe@kernel.dk, kvm@vger.kernel.org, mst@redhat.com,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org,
 stefanha@redhat.com, oren@nvidia.com
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

On Mon, Aug 30, 2021 at 03:00:23PM +0300, Max Gurtovoy wrote:
> +static int virtblk_queue_count_set(const char *val,
> +		const struct kernel_param *kp)
> +{
> +	unsigned int n;
> +	int ret;
> +
> +	ret = kstrtouint(val, 10, &n);
> +	if (ret != 0 || n > nr_cpu_ids)
> +		return -EINVAL;
> +	return param_set_uint(val, kp);
> +}


Thi can use param_set_uint_minmax.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
