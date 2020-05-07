Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF411C873A
	for <lists.virtualization@lfdr.de>; Thu,  7 May 2020 12:49:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E927E87677;
	Thu,  7 May 2020 10:49:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QgQMi1+Zsht0; Thu,  7 May 2020 10:49:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6909C876DB;
	Thu,  7 May 2020 10:49:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 465DDC07FF;
	Thu,  7 May 2020 10:49:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 24922C07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 10:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 203F487669
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 10:49:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R9oIo7Rq9boF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 10:49:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3F96587527
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 10:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588848548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6TNeBJCWo89yL05TnTjwH8dcSijsVuy4nyFBYGcILew=;
 b=Ku3k30xU4JJa7SkNphRcMujHM5DLwpkR+zAoWF70DBEWNydWjBqJLSov52DBYZHiUDJWIh
 JACKSRYkQpPapY0izw+/qsSBJzbd/7Y2FxoAIHwKBnjFPkQAIgx5Rj5m9et+WzCC2gVmbA
 aKScTAw4m12IA8tOYAhVzGuJCstMZ8o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-yZM6gqGJM_-fGQFgpqezrw-1; Thu, 07 May 2020 06:49:06 -0400
X-MC-Unique: yZM6gqGJM_-fGQFgpqezrw-1
Received: by mail-wr1-f71.google.com with SMTP id q13so3195465wrn.14
 for <virtualization@lists.linux-foundation.org>;
 Thu, 07 May 2020 03:49:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6TNeBJCWo89yL05TnTjwH8dcSijsVuy4nyFBYGcILew=;
 b=Own+Pi2Q4YZvrbyxFGAghvs4KzMuWQEjwfQ/sUQwbbjHvCN4QMB9ey4JoxpNytp8iA
 TG7MM9MEopXBHryL/haS7jZp+oMiO1I1kTC4nCCg3O9/33UAAhlOMiR0S5f+7MGNctHE
 7jfhJPom51gT70SIGopjLmvCwyOXtEcF8hBiJMnGbRLoXOqZN2eFFgb50UtZx2w13Cxd
 1E+2jPVLXDcAWQJGKvdhPHDXefqWgCm6WxX5LqVoZ+x58UwytR4m1s6ppRE2vnTr2W5Y
 LWASEIcnyBjDZbIO4l3cSrWIu2UlNJenSoR4pqD9mrlbIw8zZ7as/DQyr1K2Vc13VXmg
 XY5g==
X-Gm-Message-State: AGi0PubKkW8COOVY6r8FUGd3YYp3IlcxjdzQVA5lhHVl2HxTh1pdgf82
 RkXvshBgMqSwtlGTEviH4qI05gII37qfzyyG5IJGnEr0ObbhBsyR9GB5SUH3BFVJRew+h8c81Gr
 5FSIzYNb2nJKDakn/n7Wi1z3I2OxQyIIBPdgPJs91PQ==
X-Received: by 2002:a5d:4389:: with SMTP id i9mr15542895wrq.374.1588848545319; 
 Thu, 07 May 2020 03:49:05 -0700 (PDT)
X-Google-Smtp-Source: APiQypJZNIpWHFCESwDQSs7+PMHyNfIcO5F7JwrpmUBB61yG1/h7N4ojiGa6GBHhpnaJfh9mBO8omA==
X-Received: by 2002:a5d:4389:: with SMTP id i9mr15542847wrq.374.1588848545108; 
 Thu, 07 May 2020 03:49:05 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 n6sm5623197wrt.58.2020.05.07.03.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 03:49:04 -0700 (PDT)
Date: Thu, 7 May 2020 06:48:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 00/15] virtio-mem: paravirtualized memory
Message-ID: <20200507064834-mutt-send-email-mst@kernel.org>
References: <20200507103119.11219-1-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200507103119.11219-1-david@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Oscar Salvador <osalvador@suse.com>, Michal Hocko <mhocko@suse.com>,
 Robert Bradford <robert.bradford@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Pingfan Liu <kernelfans@gmail.com>,
 Luiz Capitulino <lcapitulino@redhat.com>, linux-mm@kvack.org,
 Alexander Potapenko <glider@google.com>,
 teawater <teawaterz@linux.alibaba.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 virtio-dev@lists.oasis-open.org, kvm@vger.kernel.org,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Wei Yang <richard.weiyang@gmail.com>,
 Anthony Yznaga <anthony.yznaga@oracle.com>, Dave Young <dyoung@redhat.com>,
 Len Brown <lenb@kernel.org>, Pavel Tatashin <pavel.tatashin@microsoft.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Qian Cai <cai@lca.pw>,
 Stefan Hajnoczi <stefanha@redhat.com>, Samuel Ortiz <samuel.ortiz@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Michal Hocko <mhocko@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>,
 Juergen Gross <jgross@suse.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Igor Mammedov <imammedo@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mel Gorman <mgorman@techsingularity.net>
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

On Thu, May 07, 2020 at 12:31:04PM +0200, David Hildenbrand wrote:
> This series is based on latest linux-next. The patches are located at:
>     https://github.com/davidhildenbrand/linux.git virtio-mem-v3
> 
> Patch #1 - #10 where contained in v2 and only contain minor modifications
> (mostly smaller fixes). The remaining patches are new and contain smaller
> optimizations.


Looks like you lost some acks, in particular I'd like to preserve
Andrew Morton's ack.

> Details about virtio-mem can be found in the cover letter of v2 [1]. A
> basic QEMU implementation was posted yesterday [2].
> 
> [1] https://lkml.kernel.org/r/20200311171422.10484-1-david@redhat.com
> [2] https://lkml.kernel.org/r/20200506094948.76388-1-david@redhat.com
> 
> v2 -> v3:
> - "virtio-mem: Paravirtualized memory hotplug"
> -- Include "linux/slab.h" to fix build issues
> -- Remember the "region_size", helpful for patch #11
> -- Minor simplifaction in virtio_mem_overlaps_range()
> -- Use notifier_from_errno() instead of notifier_to_errno() in notifier
> -- More reliable check for added memory when unloading the driver
> - "virtio-mem: Allow to specify an ACPI PXM as nid"
> -- Also print the nid
> - Added patch #11-#15
> 
> Cc: Sebastien Boeuf <sebastien.boeuf@intel.com>
> Cc: Samuel Ortiz <samuel.ortiz@intel.com>
> Cc: Robert Bradford <robert.bradford@intel.com>
> Cc: Luiz Capitulino <lcapitulino@redhat.com>
> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> Cc: teawater <teawaterz@linux.alibaba.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> David Hildenbrand (15):
>   virtio-mem: Paravirtualized memory hotplug
>   virtio-mem: Allow to specify an ACPI PXM as nid
>   virtio-mem: Paravirtualized memory hotunplug part 1
>   virtio-mem: Paravirtualized memory hotunplug part 2
>   mm: Allow to offline unmovable PageOffline() pages via
>     MEM_GOING_OFFLINE
>   virtio-mem: Allow to offline partially unplugged memory blocks
>   mm/memory_hotplug: Introduce offline_and_remove_memory()
>   virtio-mem: Offline and remove completely unplugged memory blocks
>   virtio-mem: Better retry handling
>   MAINTAINERS: Add myself as virtio-mem maintainer
>   virtio-mem: Add parent resource for all added "System RAM"
>   virtio-mem: Drop manual check for already present memory
>   virtio-mem: Unplug subblocks right-to-left
>   virtio-mem: Use -ETXTBSY as error code if the device is busy
>   virtio-mem: Try to unplug the complete online memory block first
> 
>  MAINTAINERS                     |    7 +
>  drivers/acpi/numa/srat.c        |    1 +
>  drivers/virtio/Kconfig          |   17 +
>  drivers/virtio/Makefile         |    1 +
>  drivers/virtio/virtio_mem.c     | 1962 +++++++++++++++++++++++++++++++
>  include/linux/memory_hotplug.h  |    1 +
>  include/linux/page-flags.h      |   10 +
>  include/uapi/linux/virtio_ids.h |    1 +
>  include/uapi/linux/virtio_mem.h |  208 ++++
>  mm/memory_hotplug.c             |   81 +-
>  mm/page_alloc.c                 |   26 +
>  mm/page_isolation.c             |    9 +
>  12 files changed, 2314 insertions(+), 10 deletions(-)
>  create mode 100644 drivers/virtio/virtio_mem.c
>  create mode 100644 include/uapi/linux/virtio_mem.h
> 
> -- 
> 2.25.3

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
