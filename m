Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF72360FA0
	for <lists.virtualization@lfdr.de>; Thu, 15 Apr 2021 17:58:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62002846CB;
	Thu, 15 Apr 2021 15:58:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WfmpGhOZ5pI3; Thu, 15 Apr 2021 15:58:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BB1E846D6;
	Thu, 15 Apr 2021 15:58:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AC9F3C000A;
	Thu, 15 Apr 2021 15:58:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2937EC000A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 15:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17B9C60864
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 15:58:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kXsx2y_6pRsV
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 15:58:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D2E86085A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 15:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Dcyz1074VpfC9/KG5fq4BgAjL98SX176tM5LVJKoiEc=; b=eN1BGaWmf8M9ZQhalJDr8k4uBz
 qL5onMzPFL/UYAEKhXJ1yTNpTLRi3rqmwcm8wQXQzCgkmMRXP7OFVbqDrX36e13UPqqHd0N1CtFGW
 4B47pGNNLyu060o1hR/Wacu81EEdvkI+HtZgsmjPOZZmNlx4GPOLjAMDZpX/eGrMtQv5Y1SNvfB5a
 o4PWxPWSgRj8NStUEai59hgNzLmy96BzX+isomGvWv7PGPdgms+yqKwDXYIdwdiewNpPrN5nY6zV8
 LudCeRZOFKT2/IUzv+bclFEVBfqRzfixM8ggc8xf2R2QsU3zWuJ0wWFQA23hSUFcdh8M0ALSplwWN
 lrRONqSQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lX4NL-008mEB-Fz; Thu, 15 Apr 2021 15:57:54 +0000
Date: Thu, 15 Apr 2021 16:57:51 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] virtio_blk: Add support for lifetime feature
Message-ID: <20210415155751.GB2090820@infradead.org>
References: <20210330231602.1223216-1-egranata@google.com>
 <YHQQL1OTOdnuOYUW@stefanha-x1.localdomain>
 <20210412094217.GA981912@infradead.org>
 <YHarc5gGgjyQOaA+@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YHarc5gGgjyQOaA+@stefanha-x1.localdomain>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, mst@redhat.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Christoph Hellwig <hch@infradead.org>, pbonzini@redhat.com,
 Enrico Granata <egranata@google.com>
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

On Wed, Apr 14, 2021 at 09:44:35AM +0100, Stefan Hajnoczi wrote:
> On Mon, Apr 12, 2021 at 10:42:17AM +0100, Christoph Hellwig wrote:
> > A note to the virtio committee:  eMMC is the worst of all the currently
> > active storage standards by a large margin.  It defines very strange
> > ad-hoc interfaces that expose very specific internals and often provides
> > very poor abstractions.  It would be great it you could reach out to the
> > wider storage community before taking bad ideas from the eMMC standard
> > and putting it into virtio.
> 
> As Michael mentioned, there is still time to change the virtio-blk spec
> since this feature hasn't been released yet.
> 
> Why exactly is exposing eMMC-style lifetime information problematic?
> 
> Can you and Enrico discuss the use case to figure out an alternative
> interface?

Mostly because it exposed a very awkward encoding that is not actually
documented in any publically available spec.

If you want to incorporate a more open definition doing something
like the NVMe 'Endurance Estimate' and 'Percentage Used' fields.  But
the most important thing is to fully document the semantics in the
virtio document instead of refercing a closed standard.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
