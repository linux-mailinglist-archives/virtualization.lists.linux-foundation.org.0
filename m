Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0FB2E9E4B
	for <lists.virtualization@lfdr.de>; Mon,  4 Jan 2021 20:44:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AB666854EF;
	Mon,  4 Jan 2021 19:44:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K_SYowS61hrR; Mon,  4 Jan 2021 19:44:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1E88785450;
	Mon,  4 Jan 2021 19:44:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 07C37C013A;
	Mon,  4 Jan 2021 19:44:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 87401C013A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 19:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 77E0387141
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 19:44:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bxQ1PfACplPD
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 19:44:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 82E9287140
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 19:44:22 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id i24so28587749edj.8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 04 Jan 2021 11:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rP6JMMmN2qDx0vY3UL4gUA6b6UKruldSZyuo0iGykOg=;
 b=PjxBCzAlllrQggSRUGJfQNSuIopENh3Tqqzt/7RRTb6hLC/P7UDNt31vlXRBGg5zol
 3utT36Rb1LJGR8DknNAVpi/teLnQFlGGTK8EX8Dmh6q6BsBucmQW5TnK5y3oVvsjA2/E
 QeOr/wncwGiABC2S/A6PWGg8fp2CfwFCZQPRjISiuVB7dVbevqym7L2adJrqEZOEsYa3
 84weLdY46t5Rg9xJpTFFSZ47qKXQJJiXqRVeh08NSJND2xwvvzTs/XHUDOIP9AqAhGPD
 GHZbUVG/6lTNQOLvYgpPqGNS4BI757RkFAqhOaFwkXIEv+iHJH1uonwCIDZjGtGPnz3z
 f3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rP6JMMmN2qDx0vY3UL4gUA6b6UKruldSZyuo0iGykOg=;
 b=XGKieZbqLQCQmyGqUJ7cPrRF6/lhjuv0FI5U5KHmFXIBcbWRAm1bVHX3HCxP4zDtNG
 AkAUbTUw3QbtRgfk60dv9a5nihjsGgCx7ITRUqWKmb0XBmxqzs7wG00AcNLSQmCb1fBP
 FEHM31P16aYvkWLA3cThuE2x/QRgPWhRKGo/0wVSDzA3XSwOS7pQ+j2E5vCZRBYj6tyD
 waWrYGBvhdTYWAA/0zmmUoaxegT5ry657Gas+c8AJ48/ZZyz962YorjMQ61VY1LQGHAI
 Ato/9JfcGrF/B93GxFsTRf0AjMLgmDmmPNCjF7EAet/RrdMF7q2gsuSA0pb9J4dpPYd6
 LKCA==
X-Gm-Message-State: AOAM531RdyDORhOmm5xnzaKnz/LnBuxCkFv/791nd5A/n2Vj8SJpidzX
 3IpRFhYt/4v4TB29WZrxf3dsbEzKJdPZ7QKHNg7XFQ==
X-Google-Smtp-Source: ABdhPJxM5u0mPWYjqwv13UO1NgJU5Gjj6vsx1dKrs7kAvLR/LzlFcy/fYt6pCYA6VMk0dl4Dbt+XvD5Me2QpaPWn6Tw=
X-Received: by 2002:aa7:c3cd:: with SMTP id l13mr71465283edr.97.1609789461007; 
 Mon, 04 Jan 2021 11:44:21 -0800 (PST)
MIME-Version: 1.0
References: <20201221163024.GA22532@open-light-1.localdomain>
 <0e8b6a2f-527d-7c77-efcf-04f21ef2a77c@intel.com>
 <20210104192753.GD22407@casper.infradead.org>
In-Reply-To: <20210104192753.GD22407@casper.infradead.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 4 Jan 2021 11:44:15 -0800
Message-ID: <CAPcyv4ig_REkFOWJwFwuRnz-YinsBNYkH35TNo+=qY+3X_7FJA@mail.gmail.com>
Subject: Re: [RFC v2 PATCH 4/4] mm: pre zero out free pages to speed up page
 allocation for __GFP_ZERO
To: Matthew Wilcox <willy@infradead.org>
Cc: Andrea Arcangeli <aarcange@redhat.com>, Michal Hocko <mhocko@suse.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Liang Li <liliangleo@didiglobal.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, Dave Hansen <dave.hansen@intel.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Mel Gorman <mgorman@techsingularity.net>,
 Andrew Morton <akpm@linux-foundation.org>
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

On Mon, Jan 4, 2021 at 11:28 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, Jan 04, 2021 at 11:19:13AM -0800, Dave Hansen wrote:
> > On 12/21/20 8:30 AM, Liang Li wrote:
> > > --- a/include/linux/page-flags.h
> > > +++ b/include/linux/page-flags.h
> > > @@ -137,6 +137,9 @@ enum pageflags {
> > >  #endif
> > >  #ifdef CONFIG_64BIT
> > >     PG_arch_2,
> > > +#endif
> > > +#ifdef CONFIG_PREZERO_PAGE
> > > +   PG_zero,
> > >  #endif
> > >     __NR_PAGEFLAGS,
> >
> > I don't think this is worth a generic page->flags bit.
> >
> > There's a ton of space in 'struct page' for pages that are in the
> > allocator.  Can't we use some of that space?
>
> I was going to object to that too, but I think the entire approach is
> flawed and needs to be thrown out.  It just nukes the caches in extremely
> subtle and hard to measure ways, lowering overall system performance.

At a minimum the performance analysis should at least try to quantify
that externalized cost. Certainly that overhead went somewhere. Maybe
if this overhead was limited to run when the CPU would otherwise go
idle, but that might mean it never runs in practice...
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
