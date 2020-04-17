Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A561AD8F9
	for <lists.virtualization@lfdr.de>; Fri, 17 Apr 2020 10:51:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9471585C13;
	Fri, 17 Apr 2020 08:51:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P0LAZmpdKgBB; Fri, 17 Apr 2020 08:51:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EB442855D8;
	Fri, 17 Apr 2020 08:51:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CCCBCC0172;
	Fri, 17 Apr 2020 08:51:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3C2B0C0172
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 08:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 304C78575E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 08:50:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D3alT1ZkiKpg
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 08:50:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E1D5885608
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 08:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587113406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z0TDdmU6yavuX8RBMN3HoyPPx9SmyEOEyoTzk/3PhQs=;
 b=TXvqJzT+ru074eJhRLoI3U9seahPf5vJaiMDpJhCiv2qR8IbZ17Z34guAkJEo9H/BOV/LP
 P1kboh/XWB1/16ePcLgrqEHlwrQKL604Bul/qtENTL9nko8Ml8PyPqns/YegKUH7T80LfL
 Y/dSgE9FBz20z5RBALTJ2C3SyCjsrO8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-fM6Agh7-MoyXxemYI2PZlw-1; Fri, 17 Apr 2020 04:50:05 -0400
X-MC-Unique: fM6Agh7-MoyXxemYI2PZlw-1
Received: by mail-wr1-f71.google.com with SMTP id p16so652677wro.16
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 01:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=z0TDdmU6yavuX8RBMN3HoyPPx9SmyEOEyoTzk/3PhQs=;
 b=Eh2kWhUVIoJgKEPD4mzRxM8+nNv5/DY1oOutahPqde7KHEqtxTEKQZHjCQpJs2OHWa
 MNVk4DyHevD6NKnjN+V+EwmmMukUFj96P6UIqWIoZSngNHI+C9BUFmpodKaM5MBTMHsv
 4LB2BrSS5NK8Pt2z+Y8WWTwWzG/K0AK1YQ6xPPBmQcocmoFjqL3tfh1ViXiRE1utODN/
 HAJJWtOnB864BeWnZ5Oh9O0tS6T1u3G++Rk54ilSLy8fkV2xG6/fymvHH2KTBmPaKEgX
 p7gHsUJD1ZfITTwUYXZbIbmLcq5NSgJ0e3oq9ECSJcySHJSezJq0HC3ylpDQ03mTCJdJ
 K6dg==
X-Gm-Message-State: AGi0PuaH47D5uRj4dndf5abx8A+7slBwa6z1D4Tgmdkx2P8NwcIWBg3H
 TSLL4FLcpUjOBbfXUxD8sFm44hAp6E2zeGvK6AGduBGY58V0KPDQ1C8wgo7oW7CTp96KtSTglp4
 3pmg3Eu/Nkjh/PM/RKsP1/N+QYImS5LlJmJHIMxdinQ==
X-Received: by 2002:a1c:bd8b:: with SMTP id n133mr2343128wmf.175.1587113403795; 
 Fri, 17 Apr 2020 01:50:03 -0700 (PDT)
X-Google-Smtp-Source: APiQypIMm6MNTpN0bqnr+Xe8DDPhy1yJhv3staKajXhI3m9XNDThHeB9p3Jci/PSGeVu9indfgp+qQ==
X-Received: by 2002:a1c:bd8b:: with SMTP id n133mr2343101wmf.175.1587113403580; 
 Fri, 17 Apr 2020 01:50:03 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id h6sm6875694wmf.31.2020.04.17.01.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 01:50:02 -0700 (PDT)
Date: Fri, 17 Apr 2020 04:50:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [virtio-dev] Re: [PATCH] virtio-balloon: Disable free page
 hinting/reporting if page poison is disabled
Message-ID: <20200417044641-mutt-send-email-mst@kernel.org>
References: <20200416192809.8763.19308.stgit@localhost.localdomain>
 <20200416180845-mutt-send-email-mst@kernel.org>
 <CAKgT0UfWHHyCekU+dReNfhAa6u6FNbm7Ff5wmyN58d1VymmAMA@mail.gmail.com>
 <20200417021335-mutt-send-email-mst@kernel.org>
 <08d2c4e2-8c0f-7d3c-89f1-0e6c6a2756c8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <08d2c4e2-8c0f-7d3c-89f1-0e6c6a2756c8@redhat.com>
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

On Fri, Apr 17, 2020 at 09:49:03AM +0200, David Hildenbrand wrote:
> On 17.04.20 08:28, Michael S. Tsirkin wrote:
> > On Thu, Apr 16, 2020 at 04:52:42PM -0700, Alexander Duyck wrote:
> >> On Thu, Apr 16, 2020 at 3:13 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >>>
> >>> On Thu, Apr 16, 2020 at 12:30:38PM -0700, Alexander Duyck wrote:
> >>>> From: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> >>>>
> >>>> If we have free page hinting or page reporting enabled we should disable it
> >>>> if the pages are poisoned or initialized on free and we cannot notify the
> >>>> hypervisor.
> >>>>
> >>>> Fixes: 5d757c8d518d ("virtio-balloon: add support for providing free page reports to host")
> >>>>
> >>>> Signed-off-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> >>>
> >>>
> >>> Why not put this logic in the hypervisor?
> >>
> >> I did that too. This is to cover the case where somebody is running
> >> the code prior to my QEMU changes where the page poison feature wasn't
> >> being enabled.
> > 
> > 
> > Hmm so that one looks like a QEMU bug (does not expose poison flag).  In
> > the past we just said need to fix the bug where it's found unless the
> > issue is very widespread and major.  Let's assume QEMU learns to always
> > expose POISON with HINT.  Then this configuration (HINT && !POISON)
> > allows us to detect old QEMU (pre your changes).
> 
> Don't see why this is a QEMU bug. It's just a feature it does not
> implement. Perfectly valid.

I'll need to think about this.
We need to remember that the whole HINT thing is not a mandate for host to
corrupt memory. It's just some info about page use guest
gives host. If host corrupts memory it's broken ...

> [...]
> >>
> >> The problem is we cannot communicate the full situation to the
> >> hypervisor without the page poison feature being present. As such I
> >> would worry about that backfiring on us due to the hypervisor acting
> >> on incomplete data.
> > 
> > 
> > I'll try to think about VIRTIO_BALLOON_F_FREE_PAGE_HINT situation
> > over the weekend. But for the new page reporting, why not
> 
> I shared my thoughts about VIRTIO_BALLOON_F_FREE_PAGE_HINT in the other
> thread and think we should simply not care at all for now.
> 
> > assume host implementation will be sane?
> 
> I don't think we should enforce having poison support around. See my
> reply to this mail for an alternative.

OK so you basically say leave this to host to handle? That's more or
less what I'm saying too.


> -- 
> Thanks,
> 
> David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
