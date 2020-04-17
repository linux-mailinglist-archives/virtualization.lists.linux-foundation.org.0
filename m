Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE561ADA9D
	for <lists.virtualization@lfdr.de>; Fri, 17 Apr 2020 11:59:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B4DDF86372;
	Fri, 17 Apr 2020 09:59:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fyhx+fMs5wwW; Fri, 17 Apr 2020 09:59:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 99C6E8507B;
	Fri, 17 Apr 2020 09:59:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D364C0172;
	Fri, 17 Apr 2020 09:59:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C89ECC0172
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 09:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C530E85DE1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 09:59:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vSMs_uJyuGlM
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 09:59:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EC3DA85593
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 09:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587117567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kmOSRMdaI6DYUFECTLpLTnfdG4rjBpzKLdsl0TTyVdE=;
 b=S2ma5oeYFh6hLfth86l+xLxG6z6avshLcB0pmGKut6L/5bj9BhKsUJpDDzPls6po+GWLGo
 fBrgexMv4awTLFKyOFOa8KvrRkra19ft+YUC70UveQHHd8UMDYIr9XEP8bYfdr6um+wHm9
 7o0zULKQQ9YT05WIaHC/TcXzb+O6W7k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-cD499ZXCP5Oa9dIunOx8cQ-1; Fri, 17 Apr 2020 05:59:25 -0400
X-MC-Unique: cD499ZXCP5Oa9dIunOx8cQ-1
Received: by mail-wm1-f72.google.com with SMTP id t62so754954wma.0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 02:59:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kmOSRMdaI6DYUFECTLpLTnfdG4rjBpzKLdsl0TTyVdE=;
 b=nn6+JPq0dZJw5t/gJzn+O4VehXJGJnYAU81UmqAoTE4Cl/KjRmx4BMC7GAO+hGhrAk
 yHuZuUsQ/yo2ys5z6sMKF4KA0Lci0DSBn/q+18mwNzCahQ/sK+neryITU+cQ0pOaypg1
 MCtYaG/h8YaJZkVTfPbDztPoRDByYtEQTdQ3MiaHNokeIQujUpSceQElW2lCO380u+2p
 5GS4QuX4E6CX4Hm+vOcgzi8hu1bAg5Sv/YnOZK7TNtSiVpCJpq/E0iyHMancd9I2WtJ0
 na75dkunuOacvHu0NuJPikHp7ixXNXCMKjOIO7MwVqU0y5d9RkQEObF0MI27rl8dD6Vs
 hxxg==
X-Gm-Message-State: AGi0PuaG3Dsn8Kxc99o2Lr5lB0OBLAzL+++6KfXRoOQ/y2UY/0/3G73D
 x+FQRpa4s4v2eSPQkOztVo/JHarYD4uJm9E1kfNxoKbyjRu4/Wn3AydcsvwHsfWMBdWYVjRtTMd
 ndldMcd0UHCl/tfhIHqbB/jS7OB8nME9DYTtpej/FjA==
X-Received: by 2002:a5d:6445:: with SMTP id d5mr2902497wrw.373.1587117564268; 
 Fri, 17 Apr 2020 02:59:24 -0700 (PDT)
X-Google-Smtp-Source: APiQypIL/BoF1tb0tJi2WWfOA+EXS4OmnbMSgWCfRFnV8nDXSTEd8d3jhhX2K5yf+eHv9i4mHga0GA==
X-Received: by 2002:a5d:6445:: with SMTP id d5mr2902480wrw.373.1587117563996; 
 Fri, 17 Apr 2020 02:59:23 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id k17sm5803550wmi.10.2020.04.17.02.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 02:59:23 -0700 (PDT)
Date: Fri, 17 Apr 2020 05:59:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [virtio-dev] Re: [PATCH] virtio-balloon: Disable free page
 hinting/reporting if page poison is disabled
Message-ID: <20200417055217-mutt-send-email-mst@kernel.org>
References: <20200416192809.8763.19308.stgit@localhost.localdomain>
 <20200416180845-mutt-send-email-mst@kernel.org>
 <CAKgT0UfWHHyCekU+dReNfhAa6u6FNbm7Ff5wmyN58d1VymmAMA@mail.gmail.com>
 <20200417021335-mutt-send-email-mst@kernel.org>
 <08d2c4e2-8c0f-7d3c-89f1-0e6c6a2756c8@redhat.com>
 <20200417044641-mutt-send-email-mst@kernel.org>
 <0f867029-aef4-72b9-356f-ec25c265db1b@redhat.com>
 <20200417051223-mutt-send-email-mst@kernel.org>
 <3447361c-4d07-1785-c59b-8c98ddaebd92@redhat.com>
MIME-Version: 1.0
In-Reply-To: <3447361c-4d07-1785-c59b-8c98ddaebd92@redhat.com>
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

On Fri, Apr 17, 2020 at 11:51:31AM +0200, David Hildenbrand wrote:
> 
> >>> I'll need to think about this.
> >>> We need to remember that the whole HINT thing is not a mandate for host to
> >>> corrupt memory. It's just some info about page use guest
> >>> gives host. If host corrupts memory it's broken ...
> >>
> >> I don't think that's true,
> > 
> > Do you refer to "If host corrupts memory it's broken"?
> > You think that's not true?
> 
> Let me think this through. IMHO it's a "hint with the option for the
> hypervisor to assume the content is X and optimize (e.g., not migrate a
> page) unless the page is reused before hinting ends".

What do you call "hinting ends" though? The fact we put
a page in the VQ is not a guarantee that it's been consumed
by the hypervisor.


I think a strict definition is this:
- hint includes a command ID
- hint implies "page was unused at some point after guest reading command ID"


Hypervisor can use dirty tracking tricks to get from that to
"page is unused at the moment".

> Whereby X is
> currently assumed to be 0, correct?



Now we are talking about what's safe to do with the page.

If POISON flag is set by hypervisor but clear by guest,
or poison_val is 0, then it's clear it's safe to blow
away the page if we can figure out it's unused.

Otherwise, it's much less clear :)



I'll have to come back and re-read the rest next week, this
is complex stuff and I'm too rushed with other things today.

> Assume migrated starts, guest hints a page, migration ends. Guest reads
> the page again.
> 
> a) It could be the original page (still migrated)
> b) It could be the zero page (not migrated).
> 
> And I think that's a valid corruption of the page content, no?
> 
> 
> Now, it's more tricky when we have the following
> 
> Migrated starts, guest hints a page, guest reuses the page (e.g., writes
> first byte), migration ends. Guest reads the page again.
> 
> Here, I (hope) always the original page content is maintained via the
> 2-bitmap magic.
> 
> Or am I missing something important?
> 
> > 
> >> and that's not what we currently implement in
> >> the hypervisor for speeding up migration. I still consider
> >> VIRTIO_BALLOON_F_FREE_PAGE_HINT as an alternative technique of
> >> temporarily inflating/deflating.
> > 
> > Reporting is like that. But hinting isn't, simply because
> > by the time host gets the hint page may already be in use.
> > Blowing it out unconditionally would lead to easily
> > reproducible guest crashes.
> 
> Agreed that the semantics are different. But "eventually getting a zero
> page after migration" was part of the whole invention, no? That's the
> whole point of the optimization.
> 
> > 
> >> E.g., we don't migrate any of these
> >> pages in the hypervisor, so the content will be zeroed out on the
> >> migration target.
> > 
> > Not exactly true. We do a delicate play with
> > the two dirty bits so they *are* migrated sometimes.
> 
> Agreed. Will something like this catch the semantics?
> 
> "Pages hinted via VIRTIO_BALLOON_F_FREE_PAGE_HINT will
>  always have the original page content when written before hinting
>  stops. However, if pages are not written before hinting stops, the
>  hypervisor might replace them by a zero page."
> 
> > 
> >> If migration fails, the ld content will remain. You
> >> can call that "corrupting memory" - it's exactly what it has been
> >> invented for.
> > 
> > Well no, original author repeatedly stated it's "hinting"
> > because page can be in use actually.
> 
> Agreed.
> 
> > 
> >>
> >> IIRC we decided to glue the semantics of VIRTIO_BALLOON_F_PAGE_POISON to
> >> VIRTIO_BALLOON_F_FREE_PAGE_HINT, which makes in my opinion perfect sense.
> >>
> >> So I propose:
> >>
> >> VIRTIO_BALLOON_F_PAGE_POISON not implemented in the hypervisor:
> >> - Pages inflated/deflated via VIRTIO_BALLOON_F_FREE_PAGE_HINT will
> >>   either have the old page content or will be filled with 0.
> >> - This matches what we currently do.
> >>
> >> VIRTIO_BALLOON_F_PAGE_POISON implemented in the hypervisor:
> >> - Pages inflated/deflated via VIRTIO_BALLOON_F_FREE_PAGE_HINT will
> >>   either have the old page content or will be filled with poison_val.
> >> - This matches what we should do also during ordinary
> >>   inflation/deflation and free page reporting.
> > 
> > It's a reasonable option. however ...
> > 
> >> Again, nothing is currently broken as we free_page() the pages and don't
> >> care about an eventually changed page content.
> > 
> > I don't see how you can say that. ATM on a host without POISON
> > and with HINT, with poison val != 0 and with validation,
> > host can blow a free page away and then guest will detect
> > that as corruption.
> 
> (At this point I start to hate the whole free page hinting feature again
> :D It starts messing with my brain again.)
> 
> As soon as we do the free_page(), the page will be written to and
> definitely get migrated, right? If the hypervisor would blow out the
> page after the free_page(), we would be in trouble. What am I missing?
> 
> -- 
> Thanks,
> 
> David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
