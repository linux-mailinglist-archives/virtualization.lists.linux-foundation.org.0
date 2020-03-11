Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B891518168F
	for <lists.virtualization@lfdr.de>; Wed, 11 Mar 2020 12:12:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 33671221FB;
	Wed, 11 Mar 2020 11:12:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PxV5JIyUrjbp; Wed, 11 Mar 2020 11:12:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E181220406;
	Wed, 11 Mar 2020 11:12:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CB370C0177;
	Wed, 11 Mar 2020 11:12:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E6750C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 11:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DDB1E88018
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 11:12:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BnM5uD-Vchvw
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 11:12:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 72D7787F9F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 11:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583925170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J27SQcQ8+CHD3vks6FCpV5FX2N8wFEgpobTli186cvI=;
 b=iszaDuIoc7Hxc0D+7p98+CAeIrliMQgMNA7Tde7P8shq3KMrUX2haTDBBf8lZ7k1WNSVTW
 yCEUl2GLaZhZAGooaiiXJYRCR/+iKUubNUU79QieA+mNdHXFrr1n5YgZJKrYeWlNLArWF7
 MJkUnGvpNROae5xMutXEzSqIu4UmdCs=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-ouO8b694PRC3hydPh-usoQ-1; Wed, 11 Mar 2020 07:12:47 -0400
X-MC-Unique: ouO8b694PRC3hydPh-usoQ-1
Received: by mail-qv1-f70.google.com with SMTP id s7so1069874qvl.21
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 04:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J27SQcQ8+CHD3vks6FCpV5FX2N8wFEgpobTli186cvI=;
 b=DbtmL2aQETZA6R3RjK1Zvxkv+eXRqYDM0Vu7mgQyDJs+QoYseuB5QUVr98Y+pihue3
 qmMxeI5PxO0VHMBBTGcqMGO0ZaUuddX5mpbZCFI6s92BCRjO7ZrQ+X5Vzwx1YN0Iol9B
 07FKDEmUTWro7kFKeYtbuJTj6nHTnjRlI3UEhVZJ1/G88V5uUmxCtoTSP9uFOMa94yRd
 vi9QkIL/afA/JTKzKJVJdN1PKY/hcY+Db7F/NyMaOCFWO4aZ/ZgYjz6+MVrqKQmhH912
 F3kvujEyiOZYriiY5+0PET3RZn7I7hGi6Ar2J3Zj9oO3r3crN7ZNtYzj5lM/7MRKDnk8
 tYWg==
X-Gm-Message-State: ANhLgQ2Ef+E8wlNr6R+9w4lGR1oqV6pWxGj8cmOjULNmVVI7IxFeIcnw
 R/H/t9LYr9FzqTks1OygNZkX6rdv+ygLb/vDZpuANMZHQitbZpNoQexixs+u9U203nuoNuFgOsA
 FlB3PsAV11BvYg/j+PO3PP0IAu7fOB1H+UTZBacJEdA==
X-Received: by 2002:a37:bc1:: with SMTP id 184mr2146578qkl.57.1583925165494;
 Wed, 11 Mar 2020 04:12:45 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuFYc5tFK7zblYvbrcTfg23/Z2VBpJF5tj1r6y1PoPqomX102twr6p25lkiLGbRFJbUQ7JMrQ==
X-Received: by 2002:a37:bc1:: with SMTP id 184mr2146542qkl.57.1583925165130;
 Wed, 11 Mar 2020 04:12:45 -0700 (PDT)
Received: from redhat.com (bzq-79-178-2-19.red.bezeqint.net. [79.178.2.19])
 by smtp.gmail.com with ESMTPSA id o7sm7446399qtg.63.2020.03.11.04.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 04:12:43 -0700 (PDT)
Date: Wed, 11 Mar 2020 07:12:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3] virtio-balloon: Switch back to OOM handler for
 VIRTIO_BALLOON_F_DEFLATE_ON_OOM
Message-ID: <20200311070952-mutt-send-email-mst@kernel.org>
References: <20200310113854.11515-1-david@redhat.com>
 <alpine.DEB.2.21.2003101204590.90377@chino.kir.corp.google.com>
 <890da35b-1ac2-9c2e-b42d-96d24d3e0f4c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <890da35b-1ac2-9c2e-b42d-96d24d3e0f4c@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Tyler Sanderson <tysand@google.com>,
 linux-mm@kvack.org, Nadav Amit <namit@vmware.com>,
 David Rientjes <rientjes@google.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Michal Hocko <mhocko@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
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

On Tue, Mar 10, 2020 at 08:13:19PM +0100, David Hildenbrand wrote:
> On 10.03.20 20:05, David Rientjes wrote:
> > On Tue, 10 Mar 2020, David Hildenbrand wrote:
> > 
> >> Commit 71994620bb25 ("virtio_balloon: replace oom notifier with shrinker")
> >> changed the behavior when deflation happens automatically. Instead of
> >> deflating when called by the OOM handler, the shrinker is used.
> >>
> >> However, the balloon is not simply some other slab cache that should be
> >> shrunk when under memory pressure. The shrinker does not have a concept of
> >> priorities yet, so this behavior cannot be configured. Eventually once
> >> that is in place, we might want to switch back after doing proper
> >> testing.
> >>
> >> There was a report that this results in undesired side effects when
> >> inflating the balloon to shrink the page cache. [1]
> >> 	"When inflating the balloon against page cache (i.e. no free memory
> >> 	 remains) vmscan.c will both shrink page cache, but also invoke the
> >> 	 shrinkers -- including the balloon's shrinker. So the balloon
> >> 	 driver allocates memory which requires reclaim, vmscan gets this
> >> 	 memory by shrinking the balloon, and then the driver adds the
> >> 	 memory back to the balloon. Basically a busy no-op."
> >>
> >> The name "deflate on OOM" makes it pretty clear when deflation should
> >> happen - after other approaches to reclaim memory failed, not while
> >> reclaiming. This allows to minimize the footprint of a guest - memory
> >> will only be taken out of the balloon when really needed.
> >>
> >> Keep using the shrinker for VIRTIO_BALLOON_F_FREE_PAGE_HINT, because
> >> this has no such side effects. Always register the shrinker with
> >> VIRTIO_BALLOON_F_FREE_PAGE_HINT now. We are always allowed to reuse free
> >> pages that are still to be processed by the guest. The hypervisor takes
> >> care of identifying and resolving possible races between processing a
> >> hinting request and the guest reusing a page.
> >>
> >> In contrast to pre commit 71994620bb25 ("virtio_balloon: replace oom
> >> notifier with shrinker"), don't add a moodule parameter to configure the
> >> number of pages to deflate on OOM. Can be re-added if really needed.
> >> Also, pay attention that leak_balloon() returns the number of 4k pages -
> >> convert it properly in virtio_balloon_oom_notify().
> >>
> >> Testing done by Tyler for future reference:
> >>   Test setup: VM with 16 CPU, 64GB RAM. Running Debian 10. We have a 42
> >>   GB file full of random bytes that we continually cat to /dev/null.
> >>   This fills the page cache as the file is read. Meanwhile we trigger
> >>   the balloon to inflate, with a target size of 53 GB. This setup causes
> >>   the balloon inflation to pressure the page cache as the page cache is
> >>   also trying to grow. Afterwards we shrink the balloon back to zero (so
> >>   total deflate = total inflate).
> >>
> >>   Without patch (kernel 4.19.0-5):
> >>   Inflation never reaches the target until we stop the "cat file >
> >>   /dev/null" process. Total inflation time was 542 seconds. The longest
> >>   period that made no net forward progress was 315 seconds (see attached
> >>   graph).
> >>   Result of "grep balloon /proc/vmstat" after the test:
> >>   balloon_inflate 154828377
> >>   balloon_deflate 154828377
> >>
> >>   With patch (kernel 5.6.0-rc4+):
> >>   Total inflation duration was 63 seconds. No deflate-queue activity
> >>   occurs when pressuring the page-cache.
> >>   Result of "grep balloon /proc/vmstat" after the test:
> >>   balloon_inflate 12968539
> >>   balloon_deflate 12968539
> >>
> >>   Conclusion: This patch fixes the issue. In the test it reduced
> >>   inflate/deflate activity by 12x, and reduced inflation time by 8.6x.
> >>   But more importantly, if we hadn't killed the "grep balloon
> >>   /proc/vmstat" process then, without the patch, the inflation process
> >>   would never reach the target.
> >>
> >> [1] https://www.spinics.net/lists/linux-virtualization/msg40863.html
> >>
> >> Reported-by: Tyler Sanderson <tysand@google.com>
> >> Tested-by: Tyler Sanderson <tysand@google.com>
> >> Fixes: 71994620bb25 ("virtio_balloon: replace oom notifier with shrinker")
> >> Cc: Michael S. Tsirkin <mst@redhat.com>
> >> Cc: Wei Wang <wei.w.wang@intel.com>
> >> Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> >> Cc: David Rientjes <rientjes@google.com>
> >> Cc: Nadav Amit <namit@vmware.com>
> >> Cc: Michal Hocko <mhocko@kernel.org>
> >> Cc: Andrew Morton <akpm@linux-foundation.org>
> >> Signed-off-by: David Hildenbrand <david@redhat.com>
> > 
> > Acked-by: David Rientjes <rientjes@google.com>
> > 
> 
> Thanks!

David could you repost with corrected commit log
so Andrew can merge? To make sure it's not missed,
it's probably a good idea to have a cover letter
mentioning mm in the subject.

> > Should this have:
> > 
> > Cc: stable@vger.kernel.org # 4.19+
> 
> I guess as nothing will actually "crash" it's not worth stable.
> 
> -- 
> Thanks,
> 
> David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
