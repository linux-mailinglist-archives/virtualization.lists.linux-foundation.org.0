Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 652741B2B90
	for <lists.virtualization@lfdr.de>; Tue, 21 Apr 2020 17:50:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E6E62869F4;
	Tue, 21 Apr 2020 15:50:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8VGvplZ0qbWh; Tue, 21 Apr 2020 15:50:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5118B869D9;
	Tue, 21 Apr 2020 15:50:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4322CC1DC9;
	Tue, 21 Apr 2020 15:50:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A6BC5C0175
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Apr 2020 15:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9C7CB869E4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Apr 2020 15:50:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tDb7uFV-dylh
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Apr 2020 15:50:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CC83F869D9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Apr 2020 15:50:20 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id 19so15457396ioz.10
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Apr 2020 08:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W31encQQxklSCZ1PdM+Ent+rXlzI9BNmMFhmDL1ArCc=;
 b=KGFOFzbckOaqANg7yBLjlsb9MDJlDuzvMrLs6LKb83vGlb+Pvl605QcYUtXiXiAy0r
 /mvw11yHAx8inQLJd3krEPxbos8icu9XDOX8m6vPjav/oO939frS6r7lxyvfdOdeVMBO
 ttXjbAEXGWzR6o1se2alSqG/8ydabicZ/aDsQI6Sy69zJHSnKrZck0Qjzbwd6m5ZZDk9
 MhTIRYEYFfjI+QrixS2QMwCxODr2QEPZE8DVxakGCPOdpTiJZ2PANAdxy8D+JM80TR5j
 X76TOQOAy6f1Nx5y84kQJhvstWpqtRJJGQdssTcPUWe5wFfTpLwxAWRY0lYMYoxIeEyu
 TsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W31encQQxklSCZ1PdM+Ent+rXlzI9BNmMFhmDL1ArCc=;
 b=NY0QYeuIFm9bAYYvTDh1G48ma56WnPHSmz0XDGbGV9dNgCco+1u0MONKoWVXL8FRYv
 4E16iUk1bRGgy+H96a8AS6i9FHrSvDFnHAVJgsojsOmuc37Os01Kc6HJN4pNlxU0vcsU
 TVIHopowykndpkAnf1UOUUHUmWmmrZ3wPgI7BxkDywVXcS3sHN3CEvv/ToAdt2ZjMDd4
 DQDmRSeti9aap0ThnhiIPH7COkbl1GETWX/wHPiS7UETwbbOePHGsmBCEaXi+yr9fwMO
 QSXNXlrmlVCc5pjQduYt6ImUkxKgicnoro1yqz4m9sMnz7vj9x4JUnezwXbF3RdVZRGk
 QbYg==
X-Gm-Message-State: AGi0PuYtFc/UMUnmCKwYASdAsOX1urNCM1ZBVhjk1y4YmFNotZWq0628
 hm7WjknhyqaO78bqdn4XRZadER5LhhGyRAQQWJM=
X-Google-Smtp-Source: APiQypLJfUNeGZgJxm1mYAs5p//a1sGYqBnsDfuXb0MdmyKuZZGtbLFtyaW0g1EF9PAlV/RN3aKloNug3MEvYIEizwM=
X-Received: by 2002:a02:5249:: with SMTP id d70mr21469340jab.121.1587484219975; 
 Tue, 21 Apr 2020 08:50:19 -0700 (PDT)
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
 <CAKgT0UddMDRvztirfikyhtHX7Jx+GJZoA5uEcGMhpY9Aw2N5dA@mail.gmail.com>
 <238a99b6-d127-c626-19fa-77824bd72d13@redhat.com>
 <CAKgT0Ucn-bKqaL0ML4fcm2W7-tGAkJJt2ExYXnBuP4yp2J-uZQ@mail.gmail.com>
 <cfcd4c7e-7737-21e3-dd31-d291f486d1b1@redhat.com>
In-Reply-To: <cfcd4c7e-7737-21e3-dd31-d291f486d1b1@redhat.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Tue, 21 Apr 2020 08:50:08 -0700
Message-ID: <CAKgT0UcJEfEy7qS-4r9sQxP9ANZ_gG4VEJ__Zkusg_XDfjBuSg@mail.gmail.com>
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

On Tue, Apr 21, 2020 at 8:18 AM David Hildenbrand <david@redhat.com> wrote:
>
> >>
> >> That leaves us with either
> >>
> >> 1. "Pages hinted via VIRTIO_BALLOON_F_FREE_PAGE_HINT might get replaced
> >> by zero page. However, as soon as the page is written by the guest (even
> >> before the hinting request was processed by the host), the modified page
> >> will stay - whereby the unwritten parts might either be from the old, or
> >> from the zero page." - a QEMU BUG.
> >
> > How is this a bug? This is the behavior you would see with the current
> > balloon driver. When you put a page into a balloon it has the option
> > to either madvise it away, defer it, or just skip it because he
> > balloon is disabled. Is the "zero page" a typo? If it was
> > uninitialized data that would be a bug, but I don't see how a zero
> > page or the old data would be a bug.
>
> Sorry, I meant if this was the original design idea of hinting, then we
> would have a QEMU BUG as of now, as we might get get uninitialized data.
> Makes sense?

Yes, that makes sense. So the bug is that we aren't doing this right now.

> >
> >>>
> >>>> The current QEMU implementation would be to simply migrate all hinted
> >>>> pages. In the future we could optimize. Not sure if it's worth the trouble.
> >>>
> >>> So the trick for me is how best to go about sorting this all out.
> >>> There are two ways I see of doing it.
> >>>
> >>> The first approach would be to just assume that hinting should be
> >>> disassociated from poisoning. If I go that route that would more
> >>> closely match up with what happened in QEMU. The downside is that it
> >>> locks in the unmodified/uninitialized behavior and would require pages
> >>> to be rewritten when they come out of the balloon. However this is the
> >>> behavior we have now so it would only require specification
> >>> documentation changes.
> >>
> >> Right now, for simplicity, I prefer this and define
> >> VIRTIO_BALLOON_F_PAGE_POISON only for explicit deflation (balloon
> >> deflation via the deflate queue) and implicit deflation
> >> (VIRTIO_BALLOON_F_REPORTING).
> >
> > I don't recall us talking about the explicit deflation case before.
>
> The interesting part is that drivers/virtio/virtio_balloon.c mentions:
>
> "Let the hypervisor know that we are expecting a specific value to be
> written back in balloon pages.".
>
> But I just realized that you introduced this comment, not the original
> VIRTIO_BALLOON_F_PAGE_POISON commit.
>
> Should this have been "in reported pages when implicitly deflating them
> by reusing them." or sth. like that?

Yeah, probably. I should have probably used "reported" instead of
"balloon" in the comment.

> > What is the expectation there? I assume we are saying either
> > poison_val or unmodified? If so I would think the inflate case makes
> > much more sense as that is where the madvise is called that will
> > discard the data. If so it would be pretty easy to just add a check
> > for the poison value to the same spot we check
> > qemu_balloon_is_inhibited.
>
> Okay, we have basically no idea what was the intention of
> VIRTIO_BALLOON_F_PAGE_POISON with basic deflation/inflation as well. So
> I think we can define what suits us.
>
> On the deflate path, we could always simply fill with poison_val. But
> there are nasty corner cases (esp. no VIRTIO_BALLOON_F_MUST_TELL_HOST).
>
> What would be your suggestion? Also don't care about
> VIRTIO_BALLOON_F_PAGE_POISON on ordinary inflation/deflation? At this
> point, I think this makes sense.

That is kind of what I was thinking. The problem is that once again
the current implementation works when page poisoning is enabled. Us
disabling that wouldn't make much sense.

The whole thing with the reporting is that we are essentially just
ballooning in place. What we may do at some point in the future would
be to add an additional feature bit to do that for the standard
balloon/hinting case. Then when that is set, and we know the contents
won't match we can then just skip the madvise or hinting calls. That
way it becomes an opt-in which is what the poison was supposed to be,
but wasn't because the QEMU side was never implemented.

In the meantime I still have to make more changes to my QEMU patch
set. The way the config_size logic is implemented is somewhat of a
pain when you factor in the way the host_features and poison were
handled.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
