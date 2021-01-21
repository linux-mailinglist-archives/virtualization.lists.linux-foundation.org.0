Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EF42FF147
	for <lists.virtualization@lfdr.de>; Thu, 21 Jan 2021 18:03:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A3288863CD;
	Thu, 21 Jan 2021 17:03:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ie_XoAuhQgXp; Thu, 21 Jan 2021 17:03:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 95136863A1;
	Thu, 21 Jan 2021 17:03:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6CBF0C013A;
	Thu, 21 Jan 2021 17:03:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 677D9C013A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Jan 2021 17:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2709E22CB0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Jan 2021 17:03:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 31kO39nHJQz3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Jan 2021 17:03:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id 0455B2152C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Jan 2021 17:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=QzyNyEp1YsTE5vSV+3cDru2rTzeX2CsFjS3xBz6a990=; b=m/sCpkjOMCVgP4VoWYhFT+pNFA
 XsN5cp/1QMUAEvRGYKVrcCWtT0K0Qc1rUYrY8tnWtvRBGAzYQF1aJcWF3PjXrGGN5DB6crvK52Uhq
 VmNi8hTrqhlV+i2i9NAfj+R5YQr9uVin10+P+GGGvl4s+Wro8U/2/QQy8nAXo/5hPnH9AZL+NWlnM
 toPoiBaqrmygPeFA0pi51swSnxTXmB2rXAaBa2z16O2JBwXvSZdc+MGy9skDIY3SNinDpyuqYtJ3N
 cyelbC61FxOX5f44I6+AYEzvIq/k8mhEfUgaLp9Knoar2TChae7OQQlHwtAFdMat/0mm5SWvcQ2ZF
 9pImn9Kw==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1l2dMH-00HI8V-2u; Thu, 21 Jan 2021 17:03:07 +0000
Date: Thu, 21 Jan 2021 17:02:57 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
Subject: Re: [PATCH 1/2] block: remove unnecessary argument from
 blk_execute_rq_nowait
Message-ID: <20210121170257.GA4120717@infradead.org>
References: <20210121142905.13089-1-guoqing.jiang@cloud.ionos.com>
 <20210121142905.13089-2-guoqing.jiang@cloud.ionos.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210121142905.13089-2-guoqing.jiang@cloud.ionos.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: axboe@kernel.dk, linux-nfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-nvme@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org,
 linux-ide@vger.kernel.org, target-devel@vger.kernel.org
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

On Thu, Jan 21, 2021 at 03:29:04PM +0100, Guoqing Jiang wrote:
> The 'q' is not used since commit a1ce35fa4985 ("block: remove dead
> elevator code"), also update the comment of the function.

And more importantly it never really was needed to start with given
that we can triviall derive it from struct request.

> -extern void blk_execute_rq_nowait(struct request_queue *, struct gendisk *,
> +extern void blk_execute_rq_nowait(struct gendisk *,
>  				  struct request *, int, rq_end_io_fn *);
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
