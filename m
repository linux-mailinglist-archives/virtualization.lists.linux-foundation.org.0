Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 347F61B1481
	for <lists.virtualization@lfdr.de>; Mon, 20 Apr 2020 20:32:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9F6798693B;
	Mon, 20 Apr 2020 18:32:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SJlYYnbnSENC; Mon, 20 Apr 2020 18:32:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B210F86933;
	Mon, 20 Apr 2020 18:32:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8E013C0177;
	Mon, 20 Apr 2020 18:32:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 58B0CC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 18:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3A34F2156C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 18:32:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZHkqPNizaCmt
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 18:32:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 98BF82152E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 18:32:44 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id q10so9509828ile.0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 11:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GTWdPFfZ2ScQFoIFp+fjxduB6uJy6nAYeG1kXUPCtRo=;
 b=h382vSAqJpQRJAbWTyWPa7JeOUZoPAjiV+w29S6+E53TEJTG0PCsLJvgZLjZn15FBX
 /ImappzpZK/ynncTsKPXkbT0wx3ObXYrRta8qhMKTTUKug9Fq9E22+0kmzJGmRkEgDvI
 WOcUTWSrGi90p8DmkQVM8DNaquUGhbt8iQ4QIDvTfIoFD2a8SzHwl2N0RRtmAwJmOvY8
 s6ldumdxyYckQjczGPSopdrrRuj7Zq4T0geT3D0Pv3CcwMgnGUTRp2E3X7Q6a74GJbso
 X1TTOkfKEBbNoFRD6MCJ+Im8Bd94uMJmxqXf7XLWcM8YYzVY3LGohldYMzoeuh86GQGy
 y/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GTWdPFfZ2ScQFoIFp+fjxduB6uJy6nAYeG1kXUPCtRo=;
 b=cC9dydOGyu8StjvGyeg+Yx9/Gl4sKlFMKeYxlUtRRgtqSKMav+FBuT5khhtqXbta0M
 x+9gwzVfnTzwIAO6datAAZevB16DDBo5Hzh/Rlwq1CbXQPtesiFbPGLH59MklkzzPIy5
 lH3dNlp3X0J7HvnIvJj+vG/mccnkCFwl7q2iad6xy7lntGFWAreaG8v1SoiKu4I+acTF
 j3yVjGAQ1OmB54VxlyjEGZlSfwXd0ih95srugR8u8BvSYYdi3vLi1/d1ymsPkj6Z/yIt
 gayJRFp6ouz0LMf5UwQVSBsSTa5d9fbjb1m8tVkAAf0qwttmclC18Q3tLivHtuISIyLX
 X+0g==
X-Gm-Message-State: AGi0Pub/24Qi/esszbIlUg1ffxopIdqZ/QGhBZfHauLocgkbA1TC00OL
 u2H30uu6fk+HjYC1ciqyXfYodAQIlyut08dLygc=
X-Google-Smtp-Source: APiQypJVsUlaxwp7tFIrCRXJNt76900apB6lEllfN9OnGqU39j/26v0aJ/D8Kr1ALYGG51Jk1N2QODYyWZfP/b7JVxE=
X-Received: by 2002:a92:584b:: with SMTP id m72mr16590692ilb.95.1587407563617; 
 Mon, 20 Apr 2020 11:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200416192809.8763.19308.stgit@localhost.localdomain>
 <20200416180845-mutt-send-email-mst@kernel.org>
 <CAKgT0UfWHHyCekU+dReNfhAa6u6FNbm7Ff5wmyN58d1VymmAMA@mail.gmail.com>
 <20200417021335-mutt-send-email-mst@kernel.org>
 <08d2c4e2-8c0f-7d3c-89f1-0e6c6a2756c8@redhat.com>
 <20200417044641-mutt-send-email-mst@kernel.org>
 <0f867029-aef4-72b9-356f-ec25c265db1b@redhat.com>
 <20200417051223-mutt-send-email-mst@kernel.org>
 <3447361c-4d07-1785-c59b-8c98ddaebd92@redhat.com>
 <20200417055217-mutt-send-email-mst@kernel.org>
 <1823d9be-d175-6cb5-0c7d-8a68d959a0d5@redhat.com>
 <CAKgT0UdV5+yknti+W4jDLmo9CH+BeS82pm9vDcy47nV8pkEwcw@mail.gmail.com>
 <93ccb738-4480-4c31-69c9-5fc349e2a278@redhat.com>
In-Reply-To: <93ccb738-4480-4c31-69c9-5fc349e2a278@redhat.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Mon, 20 Apr 2020 11:32:32 -0700
Message-ID: <CAKgT0UddMDRvztirfikyhtHX7Jx+GJZoA5uEcGMhpY9Aw2N5dA@mail.gmail.com>
Subject: Re: [virtio-dev] Re: [PATCH] virtio-balloon: Disable free page
 hinting/reporting if page poison is disabled
To: David Hildenbrand <david@redhat.com>
Cc: virtio-dev@lists.oasis-open.org, virtualization@lists.linux-foundation.org,
 "Michael S. Tsirkin" <mst@redhat.com>
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

On Mon, Apr 20, 2020 at 6:28 AM David Hildenbrand <david@redhat.com> wrote:
>
> >>> Now we are talking about what's safe to do with the page.
> >>>
> >>> If POISON flag is set by hypervisor but clear by guest,
> >>> or poison_val is 0, then it's clear it's safe to blow
> >>> away the page if we can figure out it's unused.
> >>>
> >>> Otherwise, it's much less clear :)
> >>
> >> Hah! Agreed :D
> >
> > That isn't quite true. The problem is in the case of hinting it isn't
> > setting the page to 0. It is simply not migrating it. So if there is
> > data from an earlier pass it is stuck at that value. So the balloon
> > will see the poison/init on some pages cleared, however I suppose the
> > balloon doesn't care about the contents of the page. For the pages
> > that are leaked back out via the shrinker they will be dirtied so they
> > will end up being migrated with the correct value eventually.
>
> Right, I think current Linux guests are fine. The critical piece we are
> talking about is
>
> 1) Guest balloon allocates and hints a page
> 2) Hypervisor does not process hinting request
> 3) Guest frees the page and reuses it (especially, writes it).
> 4) Hypervisor processes the hinting request.
>
> AFAIU, as soon as the guest writes the page (e.g., zeroes it/poisons it
> in the buddy, or somebody who allocated it), the page *will* get
> migrated, even if 4) happens after 3). That's guaranteed by the 2-bitmap
> magic.

Yes. Basically the page will be flagged as dirty as soon as it is
written to, and that will be dealt with after the current batch of
hints are processed so we should be able to guarantee that the page
will have a coherent value stored in it.

> Now, assume the following happens (in some future Linux version) (due to
> your "simply not migrating it" comment):
>
> 1) Guest balloon allocates and hints a page. Assume the page is zero due
> to want_init_on_free().
> 2) Hypervisor processes the hinting request.
> 3) Guest frees the page. Assume we are implementing some magic to "skip"
> zeroing, as we assume it is still zero.
>
> Due to 2), the page won't get migrated. In 3) we expect the page to be
> 0. QEMU would have to make sure that we always get either the original,
> or a zero page on the destination. Otherwise, this smells like data
> corruption.

I agree and that is my concern. From the time the page is hinted until
it is written to again it is in an indeterminate state. However with
the current Linux guest implementation it is being written to so
technically there isn't an issue. We would just need to make sure it
stays that way.

In addition it is already an exposed interface and this is the way it
works. I think if anything we are likely forced to document it as-is
and guarantee that the behavior is not changed.

> >
> >>> I'll have to come back and re-read the rest next week, this
> >>> is complex stuff and I'm too rushed with other things today.
> >>
> >> Yeah, I'm also loaded with other stuff. Maybe Alex has time to
> >> understand the details as well.
> >
> > So after looking it over again it makes a bit more sense why this
> > hasn't caused any issues so far, and I can see why the poison enabled
> > setup and hinting can work. The problem is I am left wondering what
> > assumptions we are allowed to leave in place.
> >
> > 1. Can we assume that we don't care about the contents in the pages in
> > the balloon changing?
>
> I think, we should define valid ways for the hypervisor to change it.
>
> "Pages hinted via VIRTIO_BALLOON_F_FREE_PAGE_HINT might get replaced by
> a zero page. However, as soon as the page is written by the guest (even
> before the hinting request was processed by the host), the modified page
> will stay - whereby the unwritten parts might either be from the old, or
> from the zero page."

Actually I don't think the zero page is accurate. A page that is
hinted basically implies we don't care about the content. I would
think that we could treat a hinted page as uninitialized memory.

> I think the debatable part is "whereby the unwritten parts might either
> be from the old, or from the zero page". AFAIU, you think it could
> happen in QEMU, that we have neither the old, nor the zero page, but
> instead some previous content. The question is if that's valid, or if
> that's a BUG in QEMU. If it's valid, we can do no optimizations in the
> guest (e.g., skip zeroing in the buddy). And I agree that this smells
> like "data corruption" as Michael said.

So if any part of the page is written to after it is hinted you will
be getting the modified page since it goes back to being "dirty". All
the hinting is doing is skipping the migration of dirty pages that are
"hinted" as long as they are not written to again. So the pages are
valid up until we migrate to the new system. At that point all of the
pages that are in the page hinting balloon will be stale data as we
skipped migrating them. Assuming something like page poisoning or
init_on_free are enabled they will be poisoned again when they are
transferred from the balloon back into the page allocator.

> > 2. Can we assume that the guest will always rewrite the page after the
> > deflate in the case of init_on_free or poison?
>
> Depends on what we think is the right way to do - IOW if we think "some
> other content" as mentioned above is a BUG or not.

So I wouldn't consider it a but as the zero page probably doesn't
apply. We are basically just indicating we don't care about the
contents, we aren't giving it a value. At least that is how I see it
working based on how it was implemented.

> > 3. Can we assume that free page hinting will always function as a
> > balloon setup, so no moving it over to a page reporting type setup?
>
> I think we have to define the valid semantics. That implies what would
> be valid to do with it. Unfortunately, we have to reverse-engineer here.

So at this point a "hinted" page is a page that can essentially
transition to uninitialized while it is sitting in the balloon. I
suspect that is how we are going to have to treat it since that is the
behavior that it has right now.

> >
> > If we assume the above 3 items then there isn't any point in worrying
> > about poison when it comes to free page hinting. It doesn't make sense
> > to since they essentially negate it. As such I could go through this
> > patch and the QEMU patches and clean up any associations since the to
> > are not really tied together in any way.
>
> The big question is, if we want to support VIRTIO_BALLOON_F_PAGE_POISON
> with free page hinting. e.g.,:
>
> "Pages hinted via VIRTIO_BALLOON_F_FREE_PAGE_HINT might get replaced by
> a page full of X. However, as soon as the page is written by the guest
> (even before the hinting request was processed by the host), the
> modified page will stay - whereby the unwritten parts might either be
> from the old, or from a page filled with X. Without
> VIRTIO_BALLOON_F_PAGE_POISON, X is zero, otherwise it is poison_val."

So the problem is, as implemented, none of the above is correct.
Basically what we get with VIRTIO_BALLOON_F_FREE_PAGE_HINT is either
no migration, or migration of some old stale state if the page made it
into the balloon. There is a chance X could be 0 in the non-migration
case as I believe that is going to be the default starting point for
memory, however it is just as likely that the page will have stale
data if it is in use during any of the bitmap sync passes. The problem
is the original code didn't take the poison flag or value into
account, so I think we are stuck treating a hinted page as
uninitialized memory as long as it is in the balloon.

With the VIRTIO_BALLOON_F_PAGE_POISON we could make it so that when
the page comes out of the balloon it is either unmodified or it is
poison_val. Without the VIRTIO_BALLOON_F_PAGE_POISON feature present
you cannot make that guarantee and are stuck with the page being
treated as either unmodified or uninitialized memory.

> The current QEMU implementation would be to simply migrate all hinted
> pages. In the future we could optimize. Not sure if it's worth the trouble.

So the trick for me is how best to go about sorting this all out.
There are two ways I see of doing it.

The first approach would be to just assume that hinting should be
disassociated from poisoning. If I go that route that would more
closely match up with what happened in QEMU. The downside is that it
locks in the unmodified/uninitialized behavior and would require pages
to be rewritten when they come out of the balloon. However this is the
behavior we have now so it would only require specification
documentation changes.

The second approach is to work on defining it such that
VIRTIO_BALLOON_F_PAGE_POISON switches us to the unmodified/poison_val
definition. However the side effect of that is that for now having the
flag set means that essentially page hinting is disabled until we
could come up with a way of guaranteeing the poison_val effect which
would be additional work. In addition it has to rely on the fact that
the existing guest solutions reinitialize the pages when they come out
of the balloon since the pre-5.7 driver was broken and only took
poison into account and didn't check on init_on_free. It would likely
be the much more error prone approach and create significantly more
work.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
