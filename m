Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2846E1F7D7E
	for <lists.virtualization@lfdr.de>; Fri, 12 Jun 2020 21:24:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CD40D87E25;
	Fri, 12 Jun 2020 19:24:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VAXMqNdcTYIc; Fri, 12 Jun 2020 19:24:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B23C787E0E;
	Fri, 12 Jun 2020 19:24:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 93459C016F;
	Fri, 12 Jun 2020 19:24:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 164CBC016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Jun 2020 19:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0477289920
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Jun 2020 19:24:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4d2Gq7m1Vffq
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Jun 2020 19:24:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8231A8991E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Jun 2020 19:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=XNIkzHywKoH/b5FoSCgmMlwYaQtQXQo8Xsv8G4L19+I=; b=JWOkDkykP2kWcImMSx7orhKPGu
 HQqxsoObXbcgFBrMCclC291CBzUDZx+2r9YIPj5QmzHGlljusdNWhWkt6AC8D25b5ACpf9qxNGPMF
 f63BTFa3uWqJy4FaDGSz4Xh7rhJ4r9uMrqhzkGE4orGEFDDXzGymYhPSnJtz5/lqSNqF3bEFleH8F
 iZIIcvEQlPD6tS8dtKPW88CcpSZ5YBV3xOYh88RSIxEzL+FbipCq/pC+XntBHNCTHzsTXGM9zEmWU
 EZgqeVnfWg6mVgRLnanPIeMXv4T1rolzFIX4uMCeBAwTlkYXQvqQTjLYt+DHwJnFjLV3cRYpXlcq2
 w2uGuFGA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jjpHu-0007JA-Bk; Fri, 12 Jun 2020 19:24:26 +0000
Date: Fri, 12 Jun 2020 12:24:26 -0700
From: Matthew Wilcox <willy@infradead.org>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 1/2] docs: mm/gup: pin_user_pages.rst: add a "case 5"
Message-ID: <20200612192426.GK8681@bombadil.infradead.org>
References: <20200529234309.484480-1-jhubbard@nvidia.com>
 <20200529234309.484480-2-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200529234309.484480-2-jhubbard@nvidia.com>
Cc: Jan Kara <jack@suse.cz>, linux-doc@vger.kernel.org, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Dave Chinner <david@fromorbit.com>,
 LKML <linux-kernel@vger.kernel.org>, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Souptick Joarder <jrdr.linux@gmail.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>
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

On Fri, May 29, 2020 at 04:43:08PM -0700, John Hubbard wrote:
> +CASE 5: Pinning in order to write to the data within the page
> +-------------------------------------------------------------
> +Even though neither DMA nor Direct IO is involved, just a simple case of "pin,
> +access page's data, unpin" can cause a problem. Case 5 may be considered a
> +superset of Case 1, plus Case 2, plus anything that invokes that pattern. In
> +other words, if the code is neither Case 1 nor Case 2, it may still require
> +FOLL_PIN, for patterns like this:
> +
> +Correct (uses FOLL_PIN calls):
> +    pin_user_pages()
> +    access the data within the pages
> +    set_page_dirty_lock()
> +    unpin_user_pages()
> +
> +INCORRECT (uses FOLL_GET calls):
> +    get_user_pages()
> +    access the data within the pages
> +    set_page_dirty_lock()
> +    put_page()

Why does this case need to pin?  Why can't it just do ...

	get_user_pages()
	lock_page(page);
	... modify the data ...
	set_page_dirty(page);
	unlock_page(page);

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
