Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6C31C8A2A
	for <lists.virtualization@lfdr.de>; Thu,  7 May 2020 14:11:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 327AD873DD;
	Thu,  7 May 2020 12:11:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uJ5rEDi2sULN; Thu,  7 May 2020 12:11:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A409A873C9;
	Thu,  7 May 2020 12:11:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8341CC07FF;
	Thu,  7 May 2020 12:11:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 153FDC07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 12:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id F177F873C9
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 12:11:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WmVnaQU7teYM
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 12:11:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 478AE873A3
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 12:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588853487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EANwWfRY2fmMo9bV62Nn6bc92cfkBW2MVPtmjYJC3NY=;
 b=e+7YLxbkZcJS1Ulq3SCV/IqNG+q6ZNKtROJhiTwI4zZ5OfMxWMPnfG7yOg6f8LdtzgnZos
 y/RZy0OjFFTEi/fXwcWCg7ESRqYBJecjbqcms/0jTLXYPYJJ417e37hm26ip7ZJe2ve/py
 +M/sIV/SYexEslRsVfJi2eaaaseaMjo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-CKytGpKuPS-lelfT4TCx6w-1; Thu, 07 May 2020 08:11:25 -0400
X-MC-Unique: CKytGpKuPS-lelfT4TCx6w-1
Received: by mail-wr1-f71.google.com with SMTP id h12so3301920wrr.19
 for <virtualization@lists.linux-foundation.org>;
 Thu, 07 May 2020 05:11:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EANwWfRY2fmMo9bV62Nn6bc92cfkBW2MVPtmjYJC3NY=;
 b=atNvDo2+sNCAupTmJGkQsGSq16EQGrmI0uAM2Jq1VQxEk/g2NQeV2jSQxlsESyOhVM
 EnWWfEKixnufq/PS/pe4n4SqXM4jqHvdz2huHj+YVNQeEYEENz2p7q/DvbI24phvqmCX
 0frBdoxKi64CsUP0hUvsiT5UMviDSzQLiOrW0oqYWCOPGHwey7p9u/+5FTlXESVLh1Ea
 oHOimddh7Y4/cwDxiaVeyfbutIi+wifwRwZXHolVHDzjeGCFbUoiQzn0/bHrYEf2Bd8q
 mJNCHWCzhigYaA/wqh4CkxOTfhI84YlQYUODblIshXslKuEmlL12tY5/EpPXbahyfW+1
 DPEg==
X-Gm-Message-State: AGi0PubxB1LurizJOsXplH5sOgTXJRHI5x3i5sB3+HAv0DjNZB7XwIQr
 DYvYhPSV/lj4ns5M0g8HQKrRoq4VKyLMexCnXfG/qaXTJ6YWhc5J4WPSek5PR+TWwD6VPWOoiFJ
 a1hLSLYhHPm2dII8/8GAXzomKNMeadF8tjj7oczcqiA==
X-Received: by 2002:a5d:4389:: with SMTP id i9mr15945338wrq.374.1588853484091; 
 Thu, 07 May 2020 05:11:24 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ7D0RkcqeXu3YBCPljtvjPEqgvhppTkrE0OvAuBlPYmp89z6WlX+VSiChRymh96iq6D4Ha+A==
X-Received: by 2002:a5d:4389:: with SMTP id i9mr15945306wrq.374.1588853483876; 
 Thu, 07 May 2020 05:11:23 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 v2sm8092084wrn.21.2020.05.07.05.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 05:11:23 -0700 (PDT)
Date: Thu, 7 May 2020 08:11:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 07/15] mm/memory_hotplug: Introduce
 offline_and_remove_memory()
Message-ID: <20200507080849-mutt-send-email-mst@kernel.org>
References: <20200507103119.11219-1-david@redhat.com>
 <20200507103119.11219-8-david@redhat.com>
 <20200507064558-mutt-send-email-mst@kernel.org>
 <a915653f-232e-aa13-68f7-f988704fa84c@redhat.com>
 <441bfb92-ecfa-f54e-3661-b219ea166e55@redhat.com>
 <20200507073408-mutt-send-email-mst@kernel.org>
 <3bed2d1d-d94a-45ca-afe3-5e6ee660b0fc@redhat.com>
MIME-Version: 1.0
In-Reply-To: <3bed2d1d-d94a-45ca-afe3-5e6ee660b0fc@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Oscar Salvador <osalvador@suse.com>, virtio-dev@lists.oasis-open.org,
 Michal Hocko <mhocko@suse.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 kvm@vger.kernel.org, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 linux-kernel@vger.kernel.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Wei Yang <richard.weiyang@gmail.com>,
 Qian Cai <cai@lca.pw>, Andrew Morton <akpm@linux-foundation.org>,
 virtualization@lists.linux-foundation.org,
 Dan Williams <dan.j.williams@intel.com>
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

On Thu, May 07, 2020 at 01:37:30PM +0200, David Hildenbrand wrote:
> On 07.05.20 13:34, Michael S. Tsirkin wrote:
> > On Thu, May 07, 2020 at 01:33:23PM +0200, David Hildenbrand wrote:
> >>>> I get:
> >>>>
> >>>> error: sha1 information is lacking or useless (mm/memory_hotplug.c).
> >>>> error: could not build fake ancestor
> >>>>
> >>>> which version is this against? Pls post patches on top of some tag
> >>>> in Linus' tree if possible.
> >>>
> >>> As the cover states, latest linux-next. To be precise
> >>>
> >>> commit 6b43f715b6379433e8eb30aa9bcc99bd6a585f77 (tag: next-20200507,
> >>> next/master)
> >>> Author: Stephen Rothwell <sfr@canb.auug.org.au>
> >>> Date:   Thu May 7 18:11:31 2020 +1000
> >>>
> >>>     Add linux-next specific files for 20200507
> >>>
> >>
> >> The patches seem to apply cleanly on top of
> >>
> >> commit a811c1fa0a02c062555b54651065899437bacdbe (linus/master)
> >> Merge: b9388959ba50 16f8036086a9
> >> Author: Linus Torvalds <torvalds@linux-foundation.org>
> >> Date:   Wed May 6 20:53:22 2020 -0700
> >>
> >>     Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
> > 
> > Because you have the relevant hashes in your git tree not pruned yet.
> > Do a new clone and they won't apply.
> > 
> 
> Yeah, most probably, it knows how to merge. I'm used to sending all my
> -mm stuff based on -next, so this here is different.


Documentation/process/5.Posting.rst addresses this:


Patches must be prepared against a specific version of the kernel.  As a
general rule, a patch should be based on the current mainline as found in
Linus's git tree.  When basing on mainline, start with a well-known release
point - a stable or -rc release - rather than branching off the mainline at
an arbitrary spot.

It may become necessary to make versions against -mm, linux-next, or a
subsystem tree, though, to facilitate wider testing and review.  Depending
on the area of your patch and what is going on elsewhere, basing a patch
against these other trees can require a significant amount of work
resolving conflicts and dealing with API changes.





> I'll wait a bit and then send v4 based on latest linus/master, adding
> the two acks and reshuffling the MAINTAINERS patch. Thanks.
> 
> -- 
> Thanks,
> 
> David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
