Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C08383679FA
	for <lists.virtualization@lfdr.de>; Thu, 22 Apr 2021 08:32:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4ED1140574;
	Thu, 22 Apr 2021 06:32:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q3joCLx1203b; Thu, 22 Apr 2021 06:32:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF60140500;
	Thu, 22 Apr 2021 06:32:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6B3E4C000B;
	Thu, 22 Apr 2021 06:32:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 941BAC000B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Apr 2021 06:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D02B4054E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Apr 2021 06:32:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d1GCrGxiWORH
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Apr 2021 06:32:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 97F9040544
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Apr 2021 06:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=cJHhh3PcR/vv65+kUNeyJ8AL2c6DH0x6BTNjbnOkGTs=; b=eNOZRmnwHuZjmNSLwLDEWy2zHD
 7q1KvPWLyiYxPvbuqqphrAwRFMOhWK/wTPLPSU46WQ47Gm7AMYuKiu+d3Q1KpPDDD+PVWr4fcfq0b
 8r0ylnLMa6UyEsQ2VbNpWtc9UraUKGQmeXwM6pDX+7Qwl/hyId4D1hcO0xr/HtfEHtImC1QBX6qYW
 lPFCgUyhYdE5iL2426E8fYbw4ij6knNPwBMopLpBtDBqTEPfZaWFGkbAbbjARvut4rPHAR51rRAY5
 s+2k9zNwcSDVxAWUw1cBeyPmlckJ7OBV6Pdl+70E7mKF/Vc3IOA5Eb+dDk3G026w4Plwq1+k2Fp7K
 N7zrOCEQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lZSs4-00HX89-Rw; Thu, 22 Apr 2021 06:31:38 +0000
Date: Thu, 22 Apr 2021 07:31:28 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [RFC PATCH 0/7] Untrusted device support for virtio
Message-ID: <20210422063128.GB4176641@infradead.org>
References: <20210421032117.5177-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210421032117.5177-1-jasowang@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: ashish.kalra@amd.com, file@sect.tu-berlin.de,
 martin.radev@aisec.fraunhofer.de, kvm@vger.kernel.org, mst@redhat.com,
 konrad.wilk@oracle.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, xieyongji@bytedance.com,
 stefanha@redhat.com
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

On Wed, Apr 21, 2021 at 11:21:10AM +0800, Jason Wang wrote:
> The behaivor for non DMA API is kept for minimizing the performance
> impact.

NAK.  Everyone should be using the DMA API in a modern world.  So
treating the DMA API path worse than the broken legacy path does not
make any sense whatsoever.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
