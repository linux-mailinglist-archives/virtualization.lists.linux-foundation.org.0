Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 607A2360F8B
	for <lists.virtualization@lfdr.de>; Thu, 15 Apr 2021 17:55:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EE5A6062D;
	Thu, 15 Apr 2021 15:55:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XYnvXyitTNmY; Thu, 15 Apr 2021 15:55:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C19F6088F;
	Thu, 15 Apr 2021 15:55:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0FA94C000A;
	Thu, 15 Apr 2021 15:55:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5CE99C000A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 15:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E54C82B93
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 15:55:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GHP9hQa85v7Z
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 15:55:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B94F181B4D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 15:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=mR6aTb9tMsehQ85JfxDLTFgtEG2ZF6gM+5hV07mju9w=; b=bB7Vy1Zyuc+VF+CnYkm3CktkTa
 /MfZtVhQNhvG9xlaabU2om/GEmDpDPqvpyS/dE0XsPBxvZbyb/wHnRJOAZTsUyQXV5lNuJ5B6lTSU
 9IBPI/4vphuH6cA2gG7PbA3UUNLGfeGboW3361tNpnY/tKjFpHtmAY4WrSJNJOTmM467Wwc35V9Zs
 w/sluGzUJ4YON/DZmCISR96XZsXL//cnLlMSh10oyYkemM5Oe2ZXEVYnbQqlyEQYrkknpQnAon4Am
 A4WdMGFtfMBJpUjjQEXXi3uLEeh+yV81Yj2u9W1YIt8tjBq2dikKGaqmtG96v2OeMB7Oc00j3K5WQ
 ycVjsp9w==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lX4Jn-008m2a-62; Thu, 15 Apr 2021 15:54:23 +0000
Date: Thu, 15 Apr 2021 16:54:11 +0100
From: Christoph Hellwig <hch@infradead.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] virtio_blk: Add support for lifetime feature
Message-ID: <20210415155411.GA2090820@infradead.org>
References: <20210330231602.1223216-1-egranata@google.com>
 <YHQQL1OTOdnuOYUW@stefanha-x1.localdomain>
 <20210412094217.GA981912@infradead.org>
 <20210412074309-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210412074309-mutt-send-email-mst@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Christoph Hellwig <hch@infradead.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 pbonzini@redhat.com, Enrico Granata <egranata@google.com>
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

On Mon, Apr 12, 2021 at 08:00:24AM -0400, Michael S. Tsirkin wrote:
> On Mon, Apr 12, 2021 at 10:42:17AM +0100, Christoph Hellwig wrote:
> > A note to the virtio committee:  eMMC is the worst of all the currently
> > active storage standards by a large margin.  It defines very strange
> > ad-hoc interfaces that expose very specific internals and often provides
> > very poor abstractions.
> 
> Are we talking about the lifetime feature here?  UFS has it too right?

Ok, the wide margin above ignores UFS, which has a lot of the same
issues as EMMC, just a little less cruft.

> It's not too late to
> change things if necessary... it would be great if you could provide
> more of the feedback on this on the TC mailing list.

I think the big main issue here is that it just forwards an awkwardly
specific concept through virtio.  If we want a virtio feature it really
needs to stand a lone and be properly documented without referring to
external specifications that are not openly available.

> > It would be great it you could reach out to the
> > wider storage community before taking bad ideas from the eMMC standard
> > and putting it into virtio.
> 
> Noted.  It would be great if we had more representation from the storage
> community ... meanwhile what would a good forum for this be?
> linux-block@vger.kernel.org ?

At least for linux, yes.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
