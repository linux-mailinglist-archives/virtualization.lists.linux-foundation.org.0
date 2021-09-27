Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id F17B84193BB
	for <lists.virtualization@lfdr.de>; Mon, 27 Sep 2021 13:56:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 747B681776;
	Mon, 27 Sep 2021 11:56:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1jrDTP0GiLjr; Mon, 27 Sep 2021 11:56:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5D77B8176F;
	Mon, 27 Sep 2021 11:56:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D9ADBC0022;
	Mon, 27 Sep 2021 11:56:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 41939C000D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Sep 2021 11:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 308B5607ED
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Sep 2021 11:56:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8eXStZvaNB-M
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Sep 2021 11:56:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A1814607E5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Sep 2021 11:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=kp6FeOUIHhYgVPfiiOHW1sPtqbzW+ISO9kJOVy2PM64=; b=gbiv35trJWrwWe+2U11BG6Mvk5
 Ju52pIrguiyp71eh7FLH3daleYHkPxHikVvxW7WL7dlroJYXDt5nknYh4tBD9P/OFMIeWUOdbk/W4
 VumM7z9XCSuYfHJs+SAS2kB1dXkb1vWJR/5KJwfTVZjHhzEMcwznsNB9+7Ql/4rpTBbLJFNOFcEbk
 4QYvRlgEr8mDLO9P7tSFSm7obAke/Mpjm/CusSD/TZL/Ql5Uqwj+kN+vhJTm8RSIXP1AThmkXCMYp
 KHgjOOQy3whbyBIh0yLelX+hO1dojDtiZUop42x+3SMbkQ0Wt5VVfxEI0MSc2GZCPFFHNwIi/P5PT
 hxB/t+Mw==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mUpDd-009iNp-Lg; Mon, 27 Sep 2021 11:55:18 +0000
Date: Mon, 27 Sep 2021 12:54:49 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Subject: Re: [PATCH 1/1] virtio-blk: avoid preallocating big SGL for data
Message-ID: <YVGxCdhPxu6vct1A@infradead.org>
References: <20210830233500.51395-1-mgurtovoy@nvidia.com>
 <YVGwqlOTY9GWQfwQ@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YVGwqlOTY9GWQfwQ@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, kvm@vger.kernel.org,
 mst@redhat.com, israelr@nvidia.com, virtualization@lists.linux-foundation.org,
 hch@infradead.org, nitzanc@nvidia.com, stefanha@redhat.com, oren@nvidia.com
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

On Mon, Sep 27, 2021 at 12:53:14PM +0100, Christoph Hellwig wrote:
> Looks good,
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Err, sorry.  This was supposed to go to the lastest iteration, I'll
add it there.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
