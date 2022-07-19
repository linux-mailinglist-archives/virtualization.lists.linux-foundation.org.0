Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D69757A3B2
	for <lists.virtualization@lfdr.de>; Tue, 19 Jul 2022 17:52:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C72D60DE5;
	Tue, 19 Jul 2022 15:52:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C72D60DE5
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qAXQMW8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1A7Xq85Q11WV; Tue, 19 Jul 2022 15:52:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6244060B98;
	Tue, 19 Jul 2022 15:52:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6244060B98
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9C9DBC0078;
	Tue, 19 Jul 2022 15:52:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF084C002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Jul 2022 15:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3BC24151E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Jul 2022 15:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3BC24151E
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qAXQMW8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W-HNSA7xrEfu
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Jul 2022 15:52:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0477D41519
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0477D41519
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Jul 2022 15:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+h0WoIM0GD65cK906eJ1giltlZaSU/VsCeCwldoHsOg=; b=qAXQMW8EOeD/uqldsIJVJlIcGm
 t626hE0k0nFaCJq44GByF/8jtj/QxuoThGeKDA00ZfPpRpUPTphNj0G2Vp06ec0ahVSOd1z68DEsY
 Ww22F3HI+MtlLAQ/LLXocnSWCs0iHEVtLvPhHfSDeFSnqyRPZj1pm+sRIbii6MMs1DTZ+ftc8tDbo
 4FzvuMdXqcbL/Qi7/bcB5p125RMJh7huddmA0BtgRMyggCpybRyGScoxeqzeC7Har7ENHFfiENIdh
 3/2WZPGxysuW7KHpSGeNjDHKkkoM6lyMWBD53lCSapWhedYLFIwyBIiWBHdxjdyyqmclH4btl/VCG
 ilB6t61w==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1oDpVq-00AGSF-Od; Tue, 19 Jul 2022 15:51:54 +0000
Date: Tue, 19 Jul 2022 08:51:54 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Keir Fraser <keirf@google.com>
Subject: Re: [PATCH] virtio: Force DMA restricted devices through DMA API
Message-ID: <YtbTGjRw65QEKkQA@infradead.org>
References: <20220719100256.419780-1-keirf@google.com>
 <YtbMcBw4l0LAFn9+@infradead.org> <YtbRwO40CmIRWOUR@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YtbRwO40CmIRWOUR@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Christoph Hellwig <hch@infradead.org>, kernel-team@android.com
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

On Tue, Jul 19, 2022 at 03:46:08PM +0000, Keir Fraser wrote:
> However, if the general idea at least is acceptable, would the
> implementation be acceptable if I add an explicit API for this to the
> DMA subsystem, and hide the detail there?

I don't think so.  The right thing to key off is
VIRTIO_F_ACCESS_PLATFORM, which really should be set in any modern
virtio device after all the problems we had with the lack of it.

> Or a completely different approach would be to revert the patch
> e41b1355508d which clears VIRTIO_F_ACCESS_PLATFORM in the balloon
> driver. MST: That's back in your court, as it's your patch!

Which also means this needs to be addresses, but I don't think a
simple revert is enough.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
