Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD7D2E0CDE
	for <lists.virtualization@lfdr.de>; Tue, 22 Dec 2020 16:44:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8C57B872D5;
	Tue, 22 Dec 2020 15:44:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8b7a0ZwRv7AQ; Tue, 22 Dec 2020 15:44:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D2BB0872AB;
	Tue, 22 Dec 2020 15:44:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B222FC0893;
	Tue, 22 Dec 2020 15:44:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 331D4C0893
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Dec 2020 15:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 21C3287288
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Dec 2020 15:44:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FeTpWaxnQWPI
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Dec 2020 15:44:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 44C8887281
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Dec 2020 15:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=GEu2oMLU4SSJqQIgd19YKJ2IS6X3GTZGvv9v3EFnUDQ=; b=jPX+n/KIeKI+9jn2zhyNTtGkxf
 AsDMTzxYpxyNtj8XeJ+ssHns9uZ4d6Fvrp8K6iQiR4Fg+Yhw+Ub87tyykvC9aRZzw33GghkbTZv3s
 fRtgd6tg8G8VpyNDCJNmzg//12oUUFuNDGHIXzln6dvWpA/VeUkotpB/u1sUwSo3aKJIZ9x8LPeaD
 2YSwcSdd3fLwypE/E0GMSluQ5ljTpmC6QcobueLFoz5UJw7B83pFLGGCECXggWnTX4kIwKr3Qvx5r
 Y8pNzk2HUQ2+Gtk9E1drAq68sTc2mG6Z3o2DYWcN031P/WbGf0SirQMQ+xBWlqqePWrdJebcS/IU9
 MM6rA71A==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1krjpt-00026T-Pv; Tue, 22 Dec 2020 15:44:29 +0000
Date: Tue, 22 Dec 2020 15:44:29 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Xie Yongji <xieyongji@bytedance.com>
Subject: Re: [RFC v2 01/13] mm: export zap_page_range() for driver use
Message-ID: <20201222154429.GA5557@infradead.org>
References: <20201222145221.711-1-xieyongji@bytedance.com>
 <20201222145221.711-2-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201222145221.711-2-xieyongji@bytedance.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: axboe@kernel.dk, corbet@lwn.net, kvm@vger.kernel.org, mst@redhat.com,
 linux-aio@kvack.org, netdev@vger.kernel.org, rdunlap@infradead.org,
 willy@infradead.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, bcrl@kvack.org, viro@zeniv.linux.org.uk,
 stefanha@redhat.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org
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

On Tue, Dec 22, 2020 at 10:52:09PM +0800, Xie Yongji wrote:
> Export zap_page_range() for use in VDUSE.

Err, no.  This has absolutely no business being used by drivers.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
