Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 305B16A467D
	for <lists.virtualization@lfdr.de>; Mon, 27 Feb 2023 16:53:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BED3F60FDA;
	Mon, 27 Feb 2023 15:53:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BED3F60FDA
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=khClbTP3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3coOfAWNDKYP; Mon, 27 Feb 2023 15:53:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8365D60736;
	Mon, 27 Feb 2023 15:53:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8365D60736
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA606C007C;
	Mon, 27 Feb 2023 15:53:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 926B8C002B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Feb 2023 15:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B86240A2A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Feb 2023 15:53:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B86240A2A
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=casper.20170209 header.b=khClbTP3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fKM8fG6m_FuZ
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Feb 2023 15:53:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B221E4013D
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B221E4013D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Feb 2023 15:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=bvlf1VHk1x4xvDwdfAsxAYn57xQifDzQAqPs7VXtqzU=; b=khClbTP3Xxn/WqZX1ADFyDyk49
 kABJLMHLHQ/wE1ANrAXKWpa8ZZ0I2rTp+JhXWfm8oPnPXYQ2Fbi7hsjbJIQvTCiEguKibtlkdY2vH
 nQ6ANLtWvATjbtbhEvnvxHqwyUeQL5RRWfkjvHifqOkv105JaHnYiXLssxEAvMiAYxNNboFes5pVN
 lDuac9+LGbvzVOGdolueCGrWkSQPU2R/XRMFJj+ekB7Wq+vjuF0VRAD5XoniVMuwZCxj7xcNrtLiX
 uYpfYRrWrlyz9FnGCumC8T1W34GrTpBT2Pclc/q+3CpXbovlFr5Gpo74wnuzcmMvojXaWZcZuitea
 gyxopwEQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pWfop-000DxZ-R5; Mon, 27 Feb 2023 15:53:39 +0000
Date: Mon, 27 Feb 2023 15:53:39 +0000
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Subject: Re: [RFC][PATCH v2] splice: Prevent gifting of multipage folios
Message-ID: <Y/zSA+eSjJityj1/@casper.infradead.org>
References: <2740801.1677513063@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2740801.1677513063@warthog.procyon.org.uk>
Cc: Amit Shah <amit@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, Jens Axboe <axboe@suse.de>
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

On Mon, Feb 27, 2023 at 03:51:03PM +0000, David Howells wrote:
>     
> Don't let parts of compound pages/multipage folios be gifted by (vm)splice
> into a pipe as the other end may only be expecting single-page gifts (fuse
> and virtio console for example).
> 
> replace_page_cache_folio(), for example, will do the wrong thing if it
> tries to replace a single paged folio with a multipage folio.
> 
> Try to avoid this by making add_to_pipe() remove the gift flag on multipage
> folios.
> 
> Fixes: 7afa6fd037e5 ("[PATCH] vmsplice: allow user to pass in gift pages")
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Matthew Wilcox <willy@infradead.org>

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Cc: stable@vger.kernel.org

> cc: Jens Axboe <axboe@suse.de>
> cc: Miklos Szeredi <miklos@szeredi.hu>
> cc: Amit Shah <amit@kernel.org>
> cc: linux-fsdevel@vger.kernel.org
> cc: virtualization@lists.linux-foundation.org
> cc: linux-mm@kvack.org
> ---
>  fs/splice.c |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/fs/splice.c b/fs/splice.c
> index 2e76dbb81a8f..8bbd7794d9f0 100644
> --- a/fs/splice.c
> +++ b/fs/splice.c
> @@ -240,6 +240,8 @@ ssize_t add_to_pipe(struct pipe_inode_info *pipe, struct pipe_buffer *buf)
>  	} else if (pipe_full(head, tail, pipe->max_usage)) {
>  		ret = -EAGAIN;
>  	} else {
> +		if (PageCompound(buf->page))
> +			buf->flags &= ~PIPE_BUF_FLAG_GIFT;
>  		pipe->bufs[head & mask] = *buf;
>  		pipe->head = head + 1;
>  		return buf->len;
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
