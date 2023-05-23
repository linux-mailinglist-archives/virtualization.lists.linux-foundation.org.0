Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEEF70D387
	for <lists.virtualization@lfdr.de>; Tue, 23 May 2023 08:03:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB97E41DEC;
	Tue, 23 May 2023 06:03:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB97E41DEC
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rhaw+64x
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eHt-rmtOEk5H; Tue, 23 May 2023 06:03:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 094BE41DEE;
	Tue, 23 May 2023 06:03:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 094BE41DEE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 47CE3C007C;
	Tue, 23 May 2023 06:03:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 48721C002A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 May 2023 06:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D242402D4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 May 2023 06:02:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D242402D4
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rhaw+64x
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eh8Wnz2UG9j1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 May 2023 06:02:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 673C0400C1
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 673C0400C1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 May 2023 06:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=bU2DX7e2UzcS97thLqd77+ycr3nV003/DwvXqCaVUt8=; b=Rhaw+64xhIzWgD/b/IBn6214AF
 bn3UuwCH53QNFTnakNqwGQGHh4Edp7Hw76iFkJv7HQ2ESgO75Bfgw6OE10IJ6KjcCl5durWa4PwDc
 GcbiUz8s8z1WErTRMeHSw2+B3xELch96vnCu5PX9Svu/ZFdXZ9iYamnCBHN2pJN85+aRPYs6ppwn+
 ijXSI+gqqr38U2CCVwmJzoDsHN2PFvUJOpkdCYwUj1sUV4S3mVD+E3XqAA/ZypPPmSwmYN7LzfXAo
 dZ66PtuLt0Lec38MqXJ1XPKggb2Q1cgPmbqiWtsRAsP110T5Kd88ssZ1y+pyDtLvqVmdAGzsC/iFj
 UYLtlL6g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1q1L6n-00926Z-2I; Tue, 23 May 2023 06:02:57 +0000
Date: Mon, 22 May 2023 23:02:57 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH vhost v9 01/12] virtio_ring: put mapping error check in
 vring_map_one_sg
Message-ID: <ZGxXEcZk1f2S2NVl@infradead.org>
References: <20230517022249.20790-1-xuanzhuo@linux.alibaba.com>
 <20230517022249.20790-2-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230517022249.20790-2-xuanzhuo@linux.alibaba.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Christoph Hellwig <hch@infradead.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org
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

On Wed, May 17, 2023 at 10:22:38AM +0800, Xuan Zhuo wrote:
> -static dma_addr_t vring_map_one_sg(const struct vring_virtqueue *vq,
> -				   struct scatterlist *sg,
> -				   enum dma_data_direction direction)
> +static int vring_map_one_sg(const struct vring_virtqueue *vq, struct scatterlist *sg,
> +			    enum dma_data_direction direction, static dma_addr_t *addr)

Please avoid making this unreadable by adding overly lone lines.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
