Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 906E2292A1F
	for <lists.virtualization@lfdr.de>; Mon, 19 Oct 2020 17:14:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 567DF86DC0;
	Mon, 19 Oct 2020 15:14:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ycZqan0LrS4F; Mon, 19 Oct 2020 15:14:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B8EE486D84;
	Mon, 19 Oct 2020 15:14:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2068C0051;
	Mon, 19 Oct 2020 15:14:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4792BC0051
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Oct 2020 15:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 338662DE2A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Oct 2020 15:14:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4VLtbiLTZvn2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Oct 2020 15:14:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id 71F0C2D946
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Oct 2020 15:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=fPKhjFvX7s/li2p5PnTaBWubB/m1Dx3gc5qTCRzUVAE=; b=MtCaBtJ5IQ/x8oDWOCevBkygCj
 yEzyrsbN8NZUeRsNLZye91Ax14G4cADucQGCclbpc63l9DfUMm5hQ7fR+1N0RM34GBucA2FALk3kI
 qZpJHTNFSqLHo5DKTcrLrym4Kqtfb6GfHSLCojwq7Btx02s2pGX6M76pPttye73CTeoBwibx4xEYe
 5iCtKZmQTiLNmnbgs+7dNsuqiySxQSijkfd33Z60uD/z3rG5dHM8aGYhIxcctDeeM008zH3xPltyV
 JsHS34NYRkM/XY3Zp/3wzmfxMHBSrX0WZu0awfp8zxFN5L1NM40NbTaIFGgs3knyLheYTnLVsJce2
 0cAbqNQg==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kUWra-0008TX-8b; Mon, 19 Oct 2020 15:14:19 +0000
Date: Mon, 19 Oct 2020 16:14:18 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Xie Yongji <xieyongji@bytedance.com>
Subject: Re: [RFC 1/4] mm: export zap_page_range() for driver use
Message-ID: <20201019151418.GT20115@casper.infradead.org>
References: <20201019145623.671-1-xieyongji@bytedance.com>
 <20201019145623.671-2-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201019145623.671-2-xieyongji@bytedance.com>
Cc: linux-mm@kvack.org, virtualization@lists.linux-foundation.org,
 akpm@linux-foundation.org, mst@redhat.com
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

On Mon, Oct 19, 2020 at 10:56:20PM +0800, Xie Yongji wrote:
> Export zap_page_range() for use in VDUSE.

I think you're missing a lot of MMU notifier work by calling this
directly.  It probably works in every scenario you've tested, but won't
work for others.  I see you're using VM_MIXEDMAP -- would it make sense
to use VM_PFNMAP instead and use zap_vma_ptes()?  Or would it make sense
to change zap_vma_ptes() to handle VM_MIXEDMAP as well as VM_PFNMAP?

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
