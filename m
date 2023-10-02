Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8327B4B74
	for <lists.virtualization@lfdr.de>; Mon,  2 Oct 2023 08:28:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 385D982161;
	Mon,  2 Oct 2023 06:28:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 385D982161
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wZl9gSkX
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hCdLVXMH_ESE; Mon,  2 Oct 2023 06:28:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 084D08215F;
	Mon,  2 Oct 2023 06:28:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 084D08215F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 450F0C008C;
	Mon,  2 Oct 2023 06:28:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C3AFDC0032
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Oct 2023 06:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EE1760E7E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Oct 2023 06:28:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EE1760E7E
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wZl9gSkX
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TBNSlnSLRXz7
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Oct 2023 06:28:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D9B2160E76
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Oct 2023 06:28:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9B2160E76
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ZMdkpPxBqBuLB1qTmV7JqN4JNT6W1zFmaXJs7hkvDC4=; b=wZl9gSkXIHzF800cPVU/NDbl4d
 rWXNsjMEV+yc+M+QKLnRBUOpj/2ud75qGUqt9y6OlThQ67l40Qfr1Yw8n05jkIJrmJuFvfbhFTS/1
 +4O4JPJyxQsIaS9TDIOeMo0u9xWqpmc780gXm37GGmgZUIc0CKzSnfPgNzJZG4LX2uz3T3qHKWrBP
 SIAslog9M0/b+lVXVWQGein+9hjmI47HK47/Lkhp6zn7rDxkH+QosjzCiSChSkH2pEvpVom1bjCgL
 9CUt/NM5HP0qI4HUyGn0zWynG93dsho5DshFKnUvIKUF7B1SDV7MVk37+e07Pds+XH6BmyzK4cz5g
 tEhvxt8Q==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qnCPq-00C1hQ-31; Mon, 02 Oct 2023 06:28:26 +0000
Date: Sun, 1 Oct 2023 23:28:26 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH vfio 10/11] vfio/virtio: Expose admin commands over
 virtio device
Message-ID: <ZRpjClKM5mwY2NI0@infradead.org>
References: <20230921124040.145386-1-yishaih@nvidia.com>
 <20230921124040.145386-11-yishaih@nvidia.com>
 <20230922055336-mutt-send-email-mst@kernel.org>
 <c3724e2f-7938-abf7-6aea-02bfb3881151@nvidia.com>
 <20230926072538-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230926072538-mutt-send-email-mst@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: kvm@vger.kernel.org, maorg@nvidia.com,
 virtualization@lists.linux-foundation.org, jgg@nvidia.com, jiri@nvidia.com,
 leonro@nvidia.com
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

On Tue, Sep 26, 2023 at 07:41:44AM -0400, Michael S. Tsirkin wrote:
> 
> Except, there's no reasonable way for virtio to know what is done with
> the device then. You are not using just 2 symbols at all, instead you
> are using the rich vq API which was explicitly designed for the driver
> running the device being responsible for serializing accesses. Which is
> actually loaded and running. And I *think* your use won't conflict ATM
> mostly by luck. Witness the hack in patch 01 as exhibit 1 - nothing
> at all even hints at the fact that the reason for the complicated
> dance is because another driver pokes at some of the vqs.

Fully agreed.  The smart nic vendors are trying to do the same mess
in nvme, and we really need to stop them and agree on proper standarized
live migration features implemented in the core virtio/nvme code.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
