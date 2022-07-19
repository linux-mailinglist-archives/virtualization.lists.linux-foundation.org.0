Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB2457A2E1
	for <lists.virtualization@lfdr.de>; Tue, 19 Jul 2022 17:23:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C159782D57;
	Tue, 19 Jul 2022 15:23:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C159782D57
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RMLFIG0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hZcgdXdw-Y8C; Tue, 19 Jul 2022 15:23:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 98CDB82D45;
	Tue, 19 Jul 2022 15:23:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98CDB82D45
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A7E6EC0078;
	Tue, 19 Jul 2022 15:23:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6AB4BC002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Jul 2022 15:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 434F5409BA
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Jul 2022 15:23:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 434F5409BA
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RMLFIG0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 229M2F7wLA2k
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Jul 2022 15:23:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C2BF409A7
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C2BF409A7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Jul 2022 15:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=c9bLWd1eIP+e4V5D1L4BG6lCv4UzYp1WNkQVrUUxNW0=; b=RMLFIG0AqZXLjeQwLqkcXNb0qJ
 X6tACYuh+4mKivWUps4p4RGwGu0Mgs8veAIrTkj2Ze4/1pQo18woBvGs9Ab4AI2sdOCg2lFCu0un6
 XiwkE8I3jERQ8TegAfLi3XSXK6QV3diM8bjGLUH71lcpa2dLyGW3ZVbWHNKBwZtt1Un4bx/kZvAS5
 Fb5FIjWiHAKlhGV/iUkidpojD1JnjeuE+5GRao5XmcnQbQUP+f6PGqWujTbGjFx2WfcZGopgxan9L
 N6+ZVaPUjPRMFf2VrzBe2cws5YOB9dChn2p3OZcNDucQnEpQOHKuGbem3FGHIj5n9WTdr4qftrhGw
 wdorwe4Q==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1oDp4L-00A0JV-0I; Tue, 19 Jul 2022 15:23:29 +0000
Date: Tue, 19 Jul 2022 08:23:28 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Keir Fraser <keirf@google.com>
Subject: Re: [PATCH] virtio: Force DMA restricted devices through DMA API
Message-ID: <YtbMcBw4l0LAFn9+@infradead.org>
References: <20220719100256.419780-1-keirf@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220719100256.419780-1-keirf@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: virtualization@lists.linux-foundation.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>
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

On Tue, Jul 19, 2022 at 10:02:56AM +0000, Keir Fraser wrote:
> +#include <linux/swiotlb.h>

Drivers must never use this header.  We have a few pre-existing abuses
in the drm code, but they will go away.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
