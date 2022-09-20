Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C655BDEA7
	for <lists.virtualization@lfdr.de>; Tue, 20 Sep 2022 09:46:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A05C640519;
	Tue, 20 Sep 2022 07:46:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A05C640519
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bYlIXRqx
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IdLu0GnzaXVJ; Tue, 20 Sep 2022 07:46:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7E4294051E;
	Tue, 20 Sep 2022 07:46:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E4294051E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A82FBC0070;
	Tue, 20 Sep 2022 07:46:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04807C002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Sep 2022 07:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6639408D4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Sep 2022 07:46:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6639408D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 90h3LG4aiwSk
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Sep 2022 07:46:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD7E24051E
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD7E24051E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Sep 2022 07:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=G3NIFnrmzcWaFuoZI3GRNQWQX/bz4ku17c0HJ8rpqNk=; b=bYlIXRqxsnvsmKAVlcgx5I2Lnz
 Ncu2ZXtPTEV6OZyaHxY7Yo3jNnDD1g9djJKUGjhYtdwVfQJ1i4PcQ/3z/sNXU+xMTAoRs/l+rUMrM
 4TDg6xHMYb7RJ57VSIPnLSJM5qExtrvzIngZ8leVqXTVd85/5JIWQMBKjf71KdBlGPSMb8t0P0ZK6
 DyYg/EuA1yhruurU19nbDsGfr8QIanTCivP+YOrc/U/pta//0K3QJ3TbgvZpLvMC5WFKwRjTl2yio
 9MLDhKJKTQrFQIcgVh0K7EhU+M8cJSoyXpTSQ0MHseT/nJ2vdmmI0TBH/0GEFaOlLHdmR9UvPxD7X
 SgaWYchw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1oaXxG-001T79-1L; Tue, 20 Sep 2022 07:46:06 +0000
Date: Tue, 20 Sep 2022 00:46:06 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Sarthak Kukreti <sarthakkukreti@chromium.org>
Subject: Re: [PATCH RFC 0/8] Introduce provisioning primitives for thinly
 provisioned storage
Message-ID: <Yylvvm3zVgqpqDrm@infradead.org>
References: <20220915164826.1396245-1-sarthakkukreti@google.com>
 <YyQTM5PRT2o/GDwy@fedora>
 <CAG9=OMPHZqdDhX=M+ovdg5fa3x4-Q_1r5SWPa8pMTQw0mr5fPg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAG9=OMPHZqdDhX=M+ovdg5fa3x4-Q_1r5SWPa8pMTQw0mr5fPg@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Jens Axboe <axboe@kernel.dk>, Gwendal Grignou <gwendal@google.com>,
 Theodore Ts'o <tytso@mit.edu>, "Michael S . Tsirkin" <mst@redhat.com>,
 Bart Van Assche <bvanassche@google.com>, Mike Snitzer <snitzer@kernel.org>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-block@vger.kernel.org, dm-devel@redhat.com,
 Andreas Dilger <adilger.kernel@dilger.ca>, Daniil Lunev <dlunev@google.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linux-ext4@vger.kernel.org, Evan Green <evgreen@google.com>,
 Alasdair Kergon <agk@redhat.com>
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

On Fri, Sep 16, 2022 at 11:48:34AM -0700, Sarthak Kukreti wrote:
> Yes. On ChromiumOS, we regularly deal with storage devices that don't
> support WRITE_ZEROES or that need to have it disabled, via a quirk,
> due to a bug in the vendor's implementation.

So bloody punich the vendors for it.  Unlike most of the Linux community
your actually have purchasing power and you'd help everyone by making
use of that instead adding hacks to upstream.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
