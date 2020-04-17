Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 453C71AD9A9
	for <lists.virtualization@lfdr.de>; Fri, 17 Apr 2020 11:21:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D05D786758;
	Fri, 17 Apr 2020 09:21:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O3mXBzU4IK23; Fri, 17 Apr 2020 09:21:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 16E3886450;
	Fri, 17 Apr 2020 09:21:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E870EC0172;
	Fri, 17 Apr 2020 09:21:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3B577C0172
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 09:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2571A862C7
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 09:21:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8CRGmJGC-rDK
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 09:21:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5EB52862BE
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 09:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587115272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cIcd0S1mmfk0T+uE5G9fA/iMMG9suk0Ofi5pSdwex6k=;
 b=XUt2crO9BCSudqj7Z/8TSoQ70uWManUegYTW6lFzBFZqq07EZGGyfeTw5TmXEgKj3Zog17
 g2WrSmrlCqGQyeRGMJ8N+EulKDPdPA4V0MZhySCYGObLZ8OsEw8x7UvCGDgcGw1Ch+oR0s
 GtfW1j+Lkf6Jgs+wnEbvyHxahvBmizM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-U9WBTAPLO5WctzF-1OXjRA-1; Fri, 17 Apr 2020 05:21:10 -0400
X-MC-Unique: U9WBTAPLO5WctzF-1OXjRA-1
Received: by mail-wr1-f72.google.com with SMTP id p16so687075wro.16
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 02:21:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cIcd0S1mmfk0T+uE5G9fA/iMMG9suk0Ofi5pSdwex6k=;
 b=oGCghuIC64VZRpfLdfYbmK8+1alx20953pH+yWfiXqL1lf1S5uUZApJbQgxOcSWUHN
 8L51f7LKXe+NAdsuE2thBzG3K40VM60mSG7B/HuVotGpO2H0SGoRplWb5iKIVr/ky/71
 if5CSJDXQTKmokr0d4EL38coDLqU0FJInc6juIkv3M0+ph8V7lvk2C+42KBnSF/MwWaI
 CQQPIdN6usgCCClWy6h7k4adPq/r39URTAHQzdXLn8yHkm5UzRPdC+Wicu4pegKlehSC
 rkUMbKbTgSJbjWGyyW97dtN7SV2IIPxYu5j+SvsNAQlgNpWOW1Ejv/lQPDBGWt1C6NCl
 akbQ==
X-Gm-Message-State: AGi0PuZwN9uQ+8zbqvIXa8tA86xRa+D+IqDsQPMv7f0gjX9WToZhOff9
 uY6Txg4c+TpqAWNaEhtE3DaXBfT+VapB4B3hfupUmICh9aiwEUKKe+10oxCISWvnUGqUNnMmZWg
 N/ZPZGr6FuNqVJ0Iw+JOuwsP+cqOiUdok3pWfwSOc9A==
X-Received: by 2002:a7b:cdf7:: with SMTP id p23mr2426016wmj.33.1587115269399; 
 Fri, 17 Apr 2020 02:21:09 -0700 (PDT)
X-Google-Smtp-Source: APiQypL/1+XiGZN107a2bdizTJ82PWJ2FWavqeCzFdAgeZVjfM5YFrQS4BmQjLTw5Q25rdNYBnEw0w==
X-Received: by 2002:a7b:cdf7:: with SMTP id p23mr2425985wmj.33.1587115269071; 
 Fri, 17 Apr 2020 02:21:09 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id j13sm32312914wro.51.2020.04.17.02.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 02:21:08 -0700 (PDT)
Date: Fri, 17 Apr 2020 05:21:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [virtio-dev] Re: [PATCH] virtio-balloon: Disable free page
 hinting/reporting if page poison is disabled
Message-ID: <20200417051223-mutt-send-email-mst@kernel.org>
References: <20200416192809.8763.19308.stgit@localhost.localdomain>
 <20200416180845-mutt-send-email-mst@kernel.org>
 <CAKgT0UfWHHyCekU+dReNfhAa6u6FNbm7Ff5wmyN58d1VymmAMA@mail.gmail.com>
 <20200417021335-mutt-send-email-mst@kernel.org>
 <08d2c4e2-8c0f-7d3c-89f1-0e6c6a2756c8@redhat.com>
 <20200417044641-mutt-send-email-mst@kernel.org>
 <0f867029-aef4-72b9-356f-ec25c265db1b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0f867029-aef4-72b9-356f-ec25c265db1b@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: virtio-dev@lists.oasis-open.org,
 Alexander Duyck <alexander.duyck@gmail.com>,
 virtualization@lists.linux-foundation.org
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

On Fri, Apr 17, 2020 at 11:07:38AM +0200, David Hildenbrand wrote:
> On 17.04.20 10:50, Michael S. Tsirkin wrote:
> > On Fri, Apr 17, 2020 at 09:49:03AM +0200, David Hildenbrand wrote:
> >> On 17.04.20 08:28, Michael S. Tsirkin wrote:
> >>> On Thu, Apr 16, 2020 at 04:52:42PM -0700, Alexander Duyck wrote:
> >>>> On Thu, Apr 16, 2020 at 3:13 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >>>>>
> >>>>> On Thu, Apr 16, 2020 at 12:30:38PM -0700, Alexander Duyck wrote:
> >>>>>> From: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> >>>>>>
> >>>>>> If we have free page hinting or page reporting enabled we should disable it
> >>>>>> if the pages are poisoned or initialized on free and we cannot notify the
> >>>>>> hypervisor.
> >>>>>>
> >>>>>> Fixes: 5d757c8d518d ("virtio-balloon: add support for providing free page reports to host")
> >>>>>>
> >>>>>> Signed-off-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> >>>>>
> >>>>>
> >>>>> Why not put this logic in the hypervisor?
> >>>>
> >>>> I did that too. This is to cover the case where somebody is running
> >>>> the code prior to my QEMU changes where the page poison feature wasn't
> >>>> being enabled.
> >>>
> >>>
> >>> Hmm so that one looks like a QEMU bug (does not expose poison flag).  In
> >>> the past we just said need to fix the bug where it's found unless the
> >>> issue is very widespread and major.  Let's assume QEMU learns to always
> >>> expose POISON with HINT.  Then this configuration (HINT && !POISON)
> >>> allows us to detect old QEMU (pre your changes).
> >>
> >> Don't see why this is a QEMU bug. It's just a feature it does not
> >> implement. Perfectly valid.
> > 
> > I'll need to think about this.
> > We need to remember that the whole HINT thing is not a mandate for host to
> > corrupt memory. It's just some info about page use guest
> > gives host. If host corrupts memory it's broken ...
> 
> I don't think that's true,

Do you refer to "If host corrupts memory it's broken"?
You think that's not true?

> and that's not what we currently implement in
> the hypervisor for speeding up migration. I still consider
> VIRTIO_BALLOON_F_FREE_PAGE_HINT as an alternative technique of
> temporarily inflating/deflating.

Reporting is like that. But hinting isn't, simply because
by the time host gets the hint page may already be in use.
Blowing it out unconditionally would lead to easily
reproducible guest crashes.

> E.g., we don't migrate any of these
> pages in the hypervisor, so the content will be zeroed out on the
> migration target.

Not exactly true. We do a delicate play with
the two dirty bits so they *are* migrated sometimes.

> If migration fails, the ld content will remain. You
> can call that "corrupting memory" - it's exactly what it has been
> invented for.

Well no, original author repeatedly stated it's "hinting"
because page can be in use actually.

> 
> IIRC we decided to glue the semantics of VIRTIO_BALLOON_F_PAGE_POISON to
> VIRTIO_BALLOON_F_FREE_PAGE_HINT, which makes in my opinion perfect sense.
> 
> So I propose:
> 
> VIRTIO_BALLOON_F_PAGE_POISON not implemented in the hypervisor:
> - Pages inflated/deflated via VIRTIO_BALLOON_F_FREE_PAGE_HINT will
>   either have the old page content or will be filled with 0.
> - This matches what we currently do.
> 
> VIRTIO_BALLOON_F_PAGE_POISON implemented in the hypervisor:
> - Pages inflated/deflated via VIRTIO_BALLOON_F_FREE_PAGE_HINT will
>   either have the old page content or will be filled with poison_val.
> - This matches what we should do also during ordinary
>   inflation/deflation and free page reporting.

It's a reasonable option. however ...

> Again, nothing is currently broken as we free_page() the pages and don't
> care about an eventually changed page content.

I don't see how you can say that. ATM on a host without POISON
and with HINT, with poison val != 0 and with validation,
host can blow a free page away and then guest will detect
that as corruption.

If guest crashes then either guest or host are broken ;)




> It's only relevant once
> we ant to change that - and then we can rely on
> VIRTIO_BALLOON_F_PAGE_POISON.

> >>>>
> >>>> The problem is we cannot communicate the full situation to the
> >>>> hypervisor without the page poison feature being present. As such I
> >>>> would worry about that backfiring on us due to the hypervisor acting
> >>>> on incomplete data.
> >>>
> >>>
> >>> I'll try to think about VIRTIO_BALLOON_F_FREE_PAGE_HINT situation
> >>> over the weekend. But for the new page reporting, why not
> >>
> >> I shared my thoughts about VIRTIO_BALLOON_F_FREE_PAGE_HINT in the other
> >> thread and think we should simply not care at all for now.
> >>
> >>> assume host implementation will be sane?
> >>
> >> I don't think we should enforce having poison support around. See my
> >> reply to this mail for an alternative.
> > 
> > OK so you basically say leave this to host to handle? That's more or
> > less what I'm saying too.
> 
> Yes, for now. We should at some point change the guest to avoid
> re-poisoning/zeroing by not using free_page(). For now, I don't think
> there is anything broken, it's just not as efficient as it could get at
> this point - tolerable as we don't usually expect our guests to poison
> pages or per-initialize them with zero.
> 
> -- 
> Thanks,
> 
> David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
