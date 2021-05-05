Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8970D3734C4
	for <lists.virtualization@lfdr.de>; Wed,  5 May 2021 07:45:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 057B140EC1;
	Wed,  5 May 2021 05:45:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V--HpuVhhFuo; Wed,  5 May 2021 05:45:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6A8F40F0C;
	Wed,  5 May 2021 05:44:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2CD6BC0024;
	Wed,  5 May 2021 05:44:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 002A2C0001
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 May 2021 05:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D917840EC1
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 May 2021 05:44:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1yaOgZDcl5aE
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 May 2021 05:44:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E683405FC
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 May 2021 05:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=tfIbCE5PtUo+T4UstmLUV156SoaNG1hVSxocsxbyORk=; b=eEM2HbGNb9sSh7hsqOhqfyxB0Z
 thYxLo4+xbOC3WxI1gvTX5KkEjiRsFwpOT+BRaYxeiPXge6wW5tJzJd9htNuYEQGWAEWPGvJDoQpg
 LLRtiDwLdJhyXjDBcrS/Dlmjn6yWG1Dt8YeLXLkmBHTp93Kv1BBAzUu/bYLOX4JItQEe9+pgeoSEd
 iOSh9fTyQ2gqqWf4gOy2fEC+yEVCDcgUp9Athd3cyFKewo2wK5dNxZL62/JhikurmFBN8iIUfjZQT
 E2o34wT+tCJuoBmPVtchozh9R/wIks5yVJh4GHLrY+LhzC9Tn8pQW43ZR00QI1KKEQ5qlk+7z6rwT
 PR1zt7nA==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1leAJW-00HXKA-L4; Wed, 05 May 2021 05:43:17 +0000
Date: Wed, 5 May 2021 06:43:14 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Enrico Granata <egranata@google.com>
Subject: Re: [PATCH] Provide detailed specification of virtio-blk lifetime
 metrics
Message-ID: <20210505054314.GA4179527@infradead.org>
References: <20210420162556.217350-1-egranata@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210420162556.217350-1-egranata@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: hch@infradead.org, virtio-dev@lists.oasis-open.org,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org,
 mst@redhat.com
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

On Tue, Apr 20, 2021 at 04:25:56PM +0000, Enrico Granata wrote:
> In the course of review, some concerns were surfaced about the
> original virtio-blk lifetime proposal, as it depends on the eMMC
> spec which is not open
> 
> Add a more detailed description of the meaning of the fields
> added by that proposal to the virtio-blk specification, as to
> make it feasible to understand and implement the new lifetime
> metrics feature without needing to refer to JEDEC's specification
> 
> This patch does not change the meaning of those fields nor add
> any new fields, but it is intended to provide an open and more
> clear description of the meaning associated with those fields.
> 
> Signed-off-by: Enrico Granata <egranata@google.com>

Still not a fan of the encoding, but at least it is properly documented
now:

Acked-by: Christoph Hellwig <hch@lst.de>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
