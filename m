Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D8E16EC18
	for <lists.virtualization@lfdr.de>; Tue, 25 Feb 2020 18:06:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 53B148642E;
	Tue, 25 Feb 2020 17:06:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jdKm9CqONDyC; Tue, 25 Feb 2020 17:06:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A37BB86447;
	Tue, 25 Feb 2020 17:06:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 81AEFC0177;
	Tue, 25 Feb 2020 17:06:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6FDC3C0177
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 17:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 519E7860E1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 17:06:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aIEOCEM5hrbT
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 17:06:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5395A816F2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 17:06:22 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id y17so6833609wrn.6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 09:06:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qXpNRZ9xs/Twatu1bWavafSUFsQ4scxT0/RdhBW/8jk=;
 b=c/x/3jeuyjf75hN9JkGQ782cPOOpG8vEBr96LTpseVSTT0R7K6VcNaoiiyD0gfNghX
 Ye7wgsR8urbQwTLrvtViT1YnrxsC1FplI/jU91y5wkZe9YrlLlIRkLq23j3z1VJRF757
 u4lp9bclL/P2hPRtUvGRWP7FSGjQxA54BwBoCu60hCmdrZSd7I8717R2jHpN2HAV4UyL
 YRG9y33AWVuncJdyMCKldcBPSxZxTXfCDg/zz6lEjpdsT1nfxi1sZK+DK0Z8KpND7Rb5
 TU036DLMQM96eYhqaQJruPzvqhXx5OltSWqKbLe3yEEAB4Ce6cYMnehE2CoFCrVDF1aA
 tTmA==
X-Gm-Message-State: APjAAAUKuRm+spj0upT1Tj+E6efN5q0nl+n1jQ+ao5BmtXqJr/qJ+iLK
 VCrHV++FBvKXGHVzU1Oe4Mo=
X-Google-Smtp-Source: APXvYqzpvpcxN3LWok+bnCzox3t9IyXPxqeYk1sM9Majp9Pes3xoHsQ4h/KM6dXuKlBz1TOZ5uiKLw==
X-Received: by 2002:a5d:61d1:: with SMTP id q17mr164163wrv.156.1582650380799; 
 Tue, 25 Feb 2020 09:06:20 -0800 (PST)
Received: from localhost (ip-37-188-161-46.eurotel.cz. [37.188.161.46])
 by smtp.gmail.com with ESMTPSA id o2sm4901117wmh.46.2020.02.25.09.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 09:06:19 -0800 (PST)
Date: Tue, 25 Feb 2020 18:06:19 +0100
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC v4 12/13] mm/vmscan: Export drop_slab() and
 drop_slab_node()
Message-ID: <20200225170619.GC32720@dhcp22.suse.cz>
References: <20191212171137.13872-1-david@redhat.com>
 <20191212171137.13872-13-david@redhat.com>
 <20200225145829.GW22443@dhcp22.suse.cz>
 <afdf8600-2339-6d74-5e3d-fa1a23384318@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <afdf8600-2339-6d74-5e3d-fa1a23384318@redhat.com>
Cc: virtio-dev@lists.oasis-open.org, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
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

On Tue 25-02-20 16:09:29, David Hildenbrand wrote:
> On 25.02.20 15:58, Michal Hocko wrote:
> > On Thu 12-12-19 18:11:36, David Hildenbrand wrote:
> >> We already have a way to trigger reclaiming of all reclaimable slab objects
> >> from user space (echo 2 > /proc/sys/vm/drop_caches). Let's allow drivers
> >> to also trigger this when they really want to make progress and know what
> >> they are doing.
> > 
> > I cannot say I would be fan of this. This is a global action with user
> > visible performance impact. I am worried that we will find out that all
> > sorts of drivers have a very good idea that dropping slab caches is
> > going to help their problem whatever it is. We have seen the same patter
> > in the userspace already and that is the reason we are logging the usage
> > to the log and count invocations in the counter.
> 
> Yeah, I decided to hold back patch 11-13 for the v1 (which I am planning
> to post in March after more testing). What we really want is to make
> memory offlining an alloc_contig_range() work better with reclaimable
> objects.
> 
> > 
> >> virtio-mem wants to use these functions when it failed to unplug memory
> >> for quite some time (e.g., after 30 minutes). It will then try to
> >> free up reclaimable objects by dropping the slab caches every now and
> >> then (e.g., every 30 minutes) as long as necessary. There will be a way to
> >> disable this feature and info messages will be logged.
> >>
> >> In the future, we want to have a drop_slab_range() functionality
> >> instead. Memory offlining code has similar demands and also other
> >> alloc_contig_range() users (e.g., gigantic pages) could make good use of
> >> this feature. Adding it, however, requires more work/thought.
> > 
> > We already do have a memory_notify(MEM_GOING_OFFLINE) for that purpose
> > and slab allocator implements a callback (slab_mem_going_offline_callback).
> > The callback is quite dumb and it doesn't really try to free objects
> > from the given memory range or even try to drop active objects which
> > might turn out to be hard but this sounds like a more robust way to
> > achieve what you want.
> 
> Two things:
> 
> 1. memory_notify(MEM_GOING_OFFLINE) is called after trying to isolate
> the page range and checking if we only have movable pages. Won't help
> much I guess.

You are right, I have missed that. Can we reorder those two calls?

> 2. alloc_contig_range() won't benefit from that.

True.

> Something like drop_slab_range() would be better, and calling it from
> the right spots in the core (e.g., set_migratetype_isolate() see below).
> 
> Especially, have a look at mm/page_isolation.c:set_migratetype_isolate()
> 
> "FIXME: Now, memory hotplug doesn't call shrink_slab() by itself. We
> just check MOVABLE pages."

shrink_slab is really a large hammer for this purpose. The notifier
mechanism sounds more appropriate to me. If that means to move it
outside of its current position then let's try to experiment with that.
But there is a long route to have per pfn range reclaim.
-- 
Michal Hocko
SUSE Labs
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
