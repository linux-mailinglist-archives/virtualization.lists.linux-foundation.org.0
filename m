Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A4F196D6E
	for <lists.virtualization@lfdr.de>; Sun, 29 Mar 2020 14:43:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4700F2046F;
	Sun, 29 Mar 2020 12:43:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IN5j4Any136W; Sun, 29 Mar 2020 12:43:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6726B203A7;
	Sun, 29 Mar 2020 12:43:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 43653C07FF;
	Sun, 29 Mar 2020 12:43:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6BB2AC07FF
 for <virtualization@lists.linux-foundation.org>;
 Sun, 29 Mar 2020 12:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 548008822B
 for <virtualization@lists.linux-foundation.org>;
 Sun, 29 Mar 2020 12:43:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3GZhpYBx1XTn
 for <virtualization@lists.linux-foundation.org>;
 Sun, 29 Mar 2020 12:43:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 112BA88222
 for <virtualization@lists.linux-foundation.org>;
 Sun, 29 Mar 2020 12:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585485781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OF/D8EHGbyytv/23CLJxE5IcP7q9D311Sz/Dbk9y8I4=;
 b=B1EXQqs9T5Hst4W//ulABnwcVrmCY0CWIay5tcGTVxWzEgB0wMrBaKt0adDKcU3EFw8ApP
 FTGGalgZQAXYBuWCEiHQe0UhDjqjO+trGsmZbhdRWFLezE11SQ1fpvyS23E1+PZcLY/R9A
 vdzeRvddPZe+JqesrgRBlxcFN1CGZa8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-W_vZaJdIO3-e9sseGpNt2g-1; Sun, 29 Mar 2020 08:42:50 -0400
X-MC-Unique: W_vZaJdIO3-e9sseGpNt2g-1
Received: by mail-wr1-f72.google.com with SMTP id v14so8414120wrq.13
 for <virtualization@lists.linux-foundation.org>;
 Sun, 29 Mar 2020 05:42:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OF/D8EHGbyytv/23CLJxE5IcP7q9D311Sz/Dbk9y8I4=;
 b=DDPW8ZaqNMGa0b2tfLUOAriPNMf52Q9H5OJVzQ+7scs7IgceAN9Z2z1cirj2W78j10
 X2b+acg+3Wxtduny9YZ0WZkc82jHYo0aPjSDQMbeN/fxvB/EMaX4mJ/2UBPB6N11/O60
 +HSZEbY0+zVD61h0egfhhIzrF+x3/zCkQGu2se3nva7ef8KbCmc8fftolxZp2d5AHPQd
 iCUB14lczNhEHiZEnUkcjRaGuyKsN9XVYu2QpZfZ6+4/o3BFPOYRqrwoOpbxZB29AuQo
 ch6f6FAVSVYtIZyXiFhD53mlS+m6ysepwoORtJrDGDlEefhDSigoFgb/3DTAV4+lvQ/7
 17cg==
X-Gm-Message-State: ANhLgQ2nfE2ub34ck7oPsrbupB4RnUHgkF3rINa0C8Uo7wN9KK+tjHu8
 q2sTLqixB/GbA0UYRA78x1jEPSjfmmnWfuEpi1pyrk22O4oTFfML5Y2Snv7og2D3Hp/QmAZhNVz
 QbBygGPcMZULoj3KFAf5kQzAk2WmKOc7o4idvj1SbfA==
X-Received: by 2002:adf:8341:: with SMTP id 59mr9611715wrd.314.1585485769459; 
 Sun, 29 Mar 2020 05:42:49 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuUFOEjwNZKluUO33xv4QW+AxNoll3waC6BIkZh6y3l9o4Q5V/nH3vJXhpgtcmzq+mccXvnBw==
X-Received: by 2002:adf:8341:: with SMTP id 59mr9611667wrd.314.1585485769030; 
 Sun, 29 Mar 2020 05:42:49 -0700 (PDT)
Received: from redhat.com (bzq-79-183-139-129.red.bezeqint.net.
 [79.183.139.129])
 by smtp.gmail.com with ESMTPSA id z21sm16557440wmf.28.2020.03.29.05.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 05:42:48 -0700 (PDT)
Date: Sun, 29 Mar 2020 08:42:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 00/10] virtio-mem: paravirtualized memory
Message-ID: <20200329084128-mutt-send-email-mst@kernel.org>
References: <20200311171422.10484-1-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200311171422.10484-1-david@redhat.com>
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

On Wed, Mar 11, 2020 at 06:14:12PM +0100, David Hildenbrand wrote:
> This series is based on latest linux-next. The patches are located at:
>     https://github.com/davidhildenbrand/linux.git virtio-mem-v2
> 
> I now have acks for all !virtio-mem changes. I'll be happy to get review
> feedback, testing reports, etc. for the virtio-mem changes. If there are
> no further comments, I guess this is good to go as a v1 soon.

I'd like to queue it for merge after the release. If you feel it's ready
please ping me after the release to help make sure it didn't get
dropped.  I see there were some reports about people having trouble
using this, pls keep working on this meanwhile.

Thanks!


> The basic idea of virtio-mem is to provide a flexible,
> cross-architecture memory hot(un)plug solution that avoids many limitations
> imposed by existing technologies, architectures, and interfaces. More
> details can be found below and in linked material.
> 
> It's currently only enabled for x86-64, however, should theoretically work
> on any architecture that supports virtio and implements memory hot(un)plug
> under Linux - like s390x, powerpc64, and arm64. On x86-64, it is currently
> possible to add/remove memory to the system in >= 4MB granularity.
> Memory hotplug works very reliably. For memory unplug, there are no
> guarantees how much memory can actually get unplugged, it depends on the
> setup (especially: fragmentation of physical memory).
> 
> I am currently getting the QEMU side into shape (which will be posted as
> RFC soon, see below for a link to the current state). Experimental Kata
> support is in the works [4]. Also, a cloud-hypervisor implementation is
> under discussion [5].
> 
> --------------------------------------------------------------------------
> 1. virtio-mem
> --------------------------------------------------------------------------
> 
> The basic idea behind virtio-mem was presented at KVM Forum 2018. The
> slides can be found at [1]. The previous RFC can be found at [2]. The
> first RFC can be found at [3]. However, the concept evolved over time. The
> KVM Forum slides roughly match the current design.
> 
> Patch #2 ("virtio-mem: Paravirtualized memory hotplug") contains quite some
> information, especially in "include/uapi/linux/virtio_mem.h":
> 
>     Each virtio-mem device manages a dedicated region in physical address
>     space. Each device can belong to a single NUMA node, multiple devices
>     for a single NUMA node are possible. A virtio-mem device is like a
>     "resizable DIMM" consisting of small memory blocks that can be plugged
>     or unplugged. The device driver is responsible for (un)plugging memory
>     blocks on demand.
> 
>     Virtio-mem devices can only operate on their assigned memory region in
>     order to (un)plug memory. A device cannot (un)plug memory belonging to
>     other devices.
> 
>     The "region_size" corresponds to the maximum amount of memory that can
>     be provided by a device. The "size" corresponds to the amount of memory
>     that is currently plugged. "requested_size" corresponds to a request
>     from the device to the device driver to (un)plug blocks. The
>     device driver should try to (un)plug blocks in order to reach the
>     "requested_size". It is impossible to plug more memory than requested.
> 
>     The "usable_region_size" represents the memory region that can actually
>     be used to (un)plug memory. It is always at least as big as the
>     "requested_size" and will grow dynamically. It will only shrink when
>     explicitly triggered (VIRTIO_MEM_REQ_UNPLUG).
> 
>     There are no guarantees what will happen if unplugged memory is
>     read/written. Such memory should, in general, not be touched. E.g.,
>     even writing might succeed, but the values will simply be discarded at
>     random points in time.
> 
>     It can happen that the device cannot process a request, because it is
>     busy. The device driver has to retry later.
> 
>     Usually, during system resets all memory will get unplugged, so the
>     device driver can start with a clean state. However, in specific
>     scenarios (if the device is busy) it can happen that the device still
>     has memory plugged. The device driver can request to unplug all memory
>     (VIRTIO_MEM_REQ_UNPLUG) - which might take a while to succeed if the
>     device is busy.
> 
> --------------------------------------------------------------------------
> 2. Linux Implementation
> --------------------------------------------------------------------------
> 
> Memory blocks (e.g., 128MB) are added/removed on demand. Within these
> memory blocks, subblocks (e.g., 4MB) are plugged/unplugged. The sizes
> depend on the target architecture, MAX_ORDER, pageblock_order, and
> the block size of a virtio-mem device.
> 
> add_memory()/try_remove_memory() is used to add/remove memory blocks.
> virtio-mem will not online memory blocks itself. This has to be done by
> user space, or configured into the kernel
> (CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE). virtio-mem will only unplug memory
> that was online to the ZONE_NORMAL. Memory is suggested to be onlined to
> the ZONE_NORMAL for now.
> 
> The memory hotplug notifier is used to properly synchronize against
> onlining/offlining of memory blocks and to track the states of memory
> blocks (including the zone memory blocks are onlined to).
> 
> The set_online_page() callback is used to keep unplugged subblocks
> of a memory block fake-offline when onlining the memory block.
> generic_online_page() is used to fake-online plugged subblocks. This
> handling is similar to the Hyper-V balloon driver.
> 
> PG_offline is used to mark unplugged subblocks as offline, so e.g.,
> dumping tools (makedumpfile) will skip these pages. This is similar to
> other balloon drivers like virtio-balloon and Hyper-V.
> 
> Memory offlining code is extended to allow drivers to drop their reference
> to PG_offline pages when MEM_GOING_OFFLINE, so these pages can be skipped
> when offlining memory blocks. This allows to offline memory blocks that
> have partially unplugged (allocated e.g., via alloc_contig_range())
> subblocks - or are completely unplugged.
> 
> alloc_contig_range()/free_contig_range() [now exposed] is used to
> unplug/plug subblocks of memory blocks the are already exposed to Linux.
> 
> offline_and_remove_memory() [new] is used to offline a fully unplugged
> memory block and remove it from Linux.
> 
> --------------------------------------------------------------------------
> 3. Changes v1 -> v2
> --------------------------------------------------------------------------
> 
> - "virtio-mem: Paravirtualized memory hotplug"
> -- Use "__u64" and friends in uapi header
> -- Split out ACPI PXM handling
> - "virtio-mem: Allow to specify an ACPI PXM as nid"
> -- Squash of the ACPI PXM handling and previous "ACPI: NUMA: export
>    pxm_to_node"
> - "virtio-mem: Paravirtualized memory hotunplug part 2"
> -- Squashed previous "mm: Export alloc_contig_range() /
>    free_contig_range()"
> - "virtio-mem: Allow to offline partially unplugged memory blocks"
> -- WARN and dump_page() in case somebody has a reference to an unplugged
>    page
> - "virtio-mem: Better retry handling"
> -- Use retry interval of 5s -> 5m
> - Tweaked some patch descriptions
> 
> --------------------------------------------------------------------------
> 4. Future work
> --------------------------------------------------------------------------
> 
> One of the next TODO things besides the QEMU part is writing a virtio-mem
> spec - however, that might still take some time.
> 
> virtio-mem extensions (via new feature flags):
> - Indicate the guest status (e.g., initialized, working, all memory is
>   busy when unplugging, too many memory blocks are offline when plugging,
>   etc.)
> - Guest-triggered shrinking of the usable region (e.g., whenever the
>   highest memory block is removed).
> - Exchange of plugged<->unplugged block for defragmentation.
> 
> Memory hotplug:
> - Reduce the amount of memory resources if that tunes out to be an
>   issue. Or try to speed up relevant code paths to deal with many
>   resources.
> - Allocate vmemmap from added memory.
> 
> Memory hotunplug:
> - Performance improvements:
> -- Sense (lockless) if it make sense to try alloc_contig_range() at all
>    before directly trying to isolate and taking locks.
> -- Try to unplug bigger chunks within a memory block first.
> - Make unplug more likely to succeed:
> -- There are various idea to limit fragmentation on memory block
>    granularity. (e.g., ZONE_PREFER_MOVABLE and smart balancing)
> -- Allocate vmemmap from added memory.
> - OOM handling, e.g., via an OOM handler/shrinker.
> - Defragmentation
> - Support for < MAX_ORDER - 1 blocks (esp. pageblock_order)
> 
> --------------------------------------------------------------------------
> 5. Example Usage
> --------------------------------------------------------------------------
> 
> A QEMU implementation (without protection of unplugged memory, but with
> resizable memory regions and optimized migration) is available at (kept
> updated):
>     https://github.com/davidhildenbrand/qemu.git virtio-mem
> 
> Start QEMU with two virtio-mem devices (one per NUMA node):
>  $ qemu-system-x86_64 -m 4G,maxmem=204G \
>   -smp sockets=2,cores=2 \
>   -numa node,nodeid=0,cpus=0-1 -numa node,nodeid=1,cpus=2-3 \
>   [...]
>   -object memory-backend-ram,id=mem0,size=100G,managed-size=on \
>   -device virtio-mem-pci,id=vm0,memdev=mem0,node=0,requested-size=0M \
>   -object memory-backend-ram,id=mem1,size=100G,managed-size=on \
>   -device virtio-mem-pci,id=vm1,memdev=mem1,node=1,requested-size=1G
> 
> Query the configuration:
>  QEMU 4.2.50 monitor - type 'help' for more information
>  (qemu) info memory-devices
>  Memory device [virtio-mem]: "vm0"
>    memaddr: 0x140000000
>    node: 0
>    requested-size: 0
>    size: 0
>    max-size: 107374182400
>    block-size: 2097152
>    memdev: /objects/mem0
>  Memory device [virtio-mem]: "vm1"
>    memaddr: 0x1a40000000
>    node: 1
>    requested-size: 1073741824
>    size: 1073741824
>    max-size: 107374182400
>    block-size: 2097152
>    memdev: /objects/mem1
> 
> Add some memory to node 0:
>  QEMU 4.2.50 monitor - type 'help' for more information
>  (qemu) qom-set vm0 requested-size 1G
> 
> Remove some memory from node 1:
>  QEMU 4.2.50 monitor - type 'help' for more information
>  (qemu) qom-set vm1 requested-size 64M
> 
> Query the configuration again:
>  QEMU 4.2.50 monitor - type 'help' for more information
>  (qemu) info memory-devices
>  Memory device [virtio-mem]: "vm0"
>    memaddr: 0x140000000
>    node: 0
>    requested-size: 1073741824
>    size: 1073741824
>    max-size: 107374182400
>    block-size: 2097152
>    memdev: /objects/mem0
>  Memory device [virtio-mem]: "vm1"
>    memaddr: 0x1a40000000
>    node: 1
>    requested-size: 67108864
>    size: 67108864
>    max-size: 107374182400
>    block-size: 2097152
>    memdev: /objects/mem1
> 
> --------------------------------------------------------------------------
> 6. Q/A
> --------------------------------------------------------------------------
> 
> Q: Why add/remove parts ("subblocks") of memory blocks/sections?
> A: Flexibility (section size depends on the architecture) - e.g., some
>    architectures have a section size of 2GB. Also, the memory block size
>    is variable (e.g., on x86-64). I want to avoid any such restrictions.
>    Some use cases want to add/remove memory in smaller granularity to a
>    VM (e.g., the Hyper-V balloon also implements this) - especially smaller
>    VMs like used for kata containers. Also, on memory unplug, it is more
>    reliable to free-up and unplug multiple small chunks instead
>    of one big chunk. E.g., if one page of a DIMM is either unmovable or
>    pinned, the DIMM can't get unplugged. This approach is basically a
>    compromise between DIMM-based memory hot(un)plug and balloon
>    inflation/deflation, which works mostly on page granularity.
> 
> Q: Why care about memory blocks?
> A: They are the way to tell user space about new memory. This way,
>    memory can get onlined/offlined by user space. Also, e.g., kdump
>    relies on udev events to reload kexec when memory blocks are
>    onlined/offlined. Memory blocks are the "real" memory hot(un)plug
>    granularity. Everything that's smaller has to be emulated "on top".
> 
> Q: Won't memory unplug of subblocks fragment memory?
> A: Yes and no. Unplugging e.g., >=4MB subblocks on x86-64 will not really
>    fragment memory like unplugging random pages like a balloon driver does.
>    Buddy merging will not be limited. However, any allocation that requires
>    bigger consecutive memory chunks (e.g., gigantic pages) might observe
>    the fragmentation. Possible solutions: Allocate gigantic huge pages
>    before unplugging memory, don't unplug memory, combine virtio-mem with
>    DIMM based memory or bigger initial memory. Remember, a virtio-mem
>    device will only unplug on the memory range it manages, not on other
>    DIMMs. Unplug of single memory blocks will result in similar
>    fragmentation in respect to gigantic huge pages.
> 
> Q: How reliable is memory unplug?
> A: There are no guarantees on how much memory can get unplugged
>    again. However, it is more likely to find 4MB chunks to unplug than
>    e.g., 128MB chunks. If memory is terribly fragmented, there is nothing
>    we can do - for now. I consider memory hotplug the first primary use
>    of virtio-mem. Memory unplug might usually work, but we want to improve
>    the performance and the amount of memory we can actually unplug later.
> 
> Q: Why not unplug from the ZONE_MOVABLE?
> A: Unplugged memory chunks are unmovable. Unmovable data must not end up
>    on the ZONE_MOVABLE - similar to gigantic pages - they will never be
>    allocated from ZONE_MOVABLE. virtio-mem added memory can be onlined
>    to the ZONE_MOVABLE, but subblocks will not get unplugged from it.
> 
> Q: How big should the initial (!virtio-mem) memory of a VM be?
> A: virtio-mem memory will not go to the DMA zones. So to avoid running out
>    of DMA memory, I suggest something like 2-3GB on x86-64. But many
>    VMs can most probably deal with less DMA memory - depends on the use
>    case.
> 
> [1] https://events.linuxfoundation.org/wp-content/uploads/2017/12/virtio-mem-Paravirtualized-Memory-David-Hildenbrand-Red-Hat-1.pdf
> [2] https://lkml.kernel.org/r/20190919142228.5483-1-david@redhat.com
> [3] https://lkml.kernel.org/r/547865a9-d6c2-7140-47e2-5af01e7d761d@redhat.com
> [4] https://github.com/kata-containers/documentation/pull/592
> [5] https://github.com/cloud-hypervisor/cloud-hypervisor/pull/837
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
> David Hildenbrand (10):
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
> 
>  MAINTAINERS                     |    7 +
>  drivers/acpi/numa/srat.c        |    1 +
>  drivers/virtio/Kconfig          |   18 +
>  drivers/virtio/Makefile         |    1 +
>  drivers/virtio/virtio_mem.c     | 1910 +++++++++++++++++++++++++++++++
>  include/linux/memory_hotplug.h  |    1 +
>  include/linux/page-flags.h      |   10 +
>  include/uapi/linux/virtio_ids.h |    1 +
>  include/uapi/linux/virtio_mem.h |  208 ++++
>  mm/memory_hotplug.c             |   81 +-
>  mm/page_alloc.c                 |   26 +
>  mm/page_isolation.c             |    9 +
>  12 files changed, 2263 insertions(+), 10 deletions(-)
>  create mode 100644 drivers/virtio/virtio_mem.c
>  create mode 100644 include/uapi/linux/virtio_mem.h
> 
> -- 
> 2.24.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
