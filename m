Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F3835C1B7
	for <lists.virtualization@lfdr.de>; Mon, 12 Apr 2021 11:42:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DC1E837C4;
	Mon, 12 Apr 2021 09:42:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lC-7Jeaqpr7v; Mon, 12 Apr 2021 09:42:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51576837CD;
	Mon, 12 Apr 2021 09:42:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E2699C0011;
	Mon, 12 Apr 2021 09:42:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 520F7C000A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 09:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F55A40217
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 09:42:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qn1-SzU-pDp4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 09:42:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F0CC40201
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 09:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=YS9rUfAaFraTST+vXue/0eDUYwela3jJ0Z8xBNf5UYk=; b=n7QXyakpl2KmOmEFeCivlGPDqb
 GVgsGtspChp4+CIRmPbUgA56GjXJ6t/hTQgt7VJIeu2WM/lIeU9+aBeLbWPz/PaoTdyBLORyevrp4
 MLFkLtmMQNLiFBTxB2EoYTvvd6WhDzDBDq9qxWKd0EK1fwRJkVurKRcJ2c/vz3YLz4SoWVzEKDuW0
 G/fjXsxhUUGxjXgfGF/xR//L/T2QYXqA9MX60tKreWQ3+7h7JMznbYNHAss/+jhWhulbn6f6Afkuy
 D2fwN6kgZD9MFuwwfWKL9WWms+949ZxtlqMcpy5IckEJjZuqgNw8BZIuYEanb1iocy3q/H6O+JL9F
 GwBS48nw==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lVt5F-0047XO-Jf; Mon, 12 Apr 2021 09:42:22 +0000
Date: Mon, 12 Apr 2021 10:42:17 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] virtio_blk: Add support for lifetime feature
Message-ID: <20210412094217.GA981912@infradead.org>
References: <20210330231602.1223216-1-egranata@google.com>
 <YHQQL1OTOdnuOYUW@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YHQQL1OTOdnuOYUW@stefanha-x1.localdomain>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: axboe@kernel.dk, mst@redhat.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org,
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

A note to the virtio committee:  eMMC is the worst of all the currently
active storage standards by a large margin.  It defines very strange
ad-hoc interfaces that expose very specific internals and often provides
very poor abstractions.  It would be great it you could reach out to the
wider storage community before taking bad ideas from the eMMC standard
and putting it into virtio.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
