Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A54E1A8FC8
	for <lists.virtualization@lfdr.de>; Wed, 15 Apr 2020 02:39:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A8E5184E8F;
	Wed, 15 Apr 2020 00:39:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wjx+l0HJFsp0; Wed, 15 Apr 2020 00:39:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2A6E186C46;
	Wed, 15 Apr 2020 00:39:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 20999C0172;
	Wed, 15 Apr 2020 00:39:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A5E3DC0172
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 00:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8F83D204F1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 00:39:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AzBepELXYATb
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 00:39:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id D6314204BE
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 00:39:20 +0000 (UTC)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 47F11206D9;
 Wed, 15 Apr 2020 00:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586910647;
 bh=jL66d2F3DmKs1s6SQQ+Gk7nBbbPMhZl6+fmVjYGZYK0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GPwWVfeCcSD4sp5mVFr9IDu41iwT/UEGE8CbjSF8HXKFDMv2LZp0R1EFTLZgTmfUY
 zrOhhvSS14vBZ2sye+oSCqGDhCp6DL1Qpf4iwi6WkQ2uEl5MsgOEAOo4LyS5RLvbLI
 RXpCxCZiweqq9m236ZzG6mYodR5MV59j5S5v24eU=
Date: Tue, 14 Apr 2020 17:30:46 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 07/10] mm/memory_hotplug: Introduce
 offline_and_remove_memory()
Message-Id: <20200414173046.dc097faf7062f76a8c68f580@linux-foundation.org>
In-Reply-To: <20200414123438-mutt-send-email-mst@kernel.org>
References: <20200311171422.10484-1-david@redhat.com>
 <20200311171422.10484-8-david@redhat.com>
 <156601a9-e919-b88f-2278-97ecee554d21@redhat.com>
 <20200414123438-mutt-send-email-mst@kernel.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Cc: Oscar Salvador <osalvador@suse.com>, virtio-dev@lists.oasis-open.org,
 Michal Hocko <mhocko@suse.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Wei Yang <richard.weiyang@gmail.com>, Qian Cai <cai@lca.pw>,
 Dan Williams <dan.j.williams@intel.com>, Michal Hocko <mhocko@kernel.org>
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

On Tue, 14 Apr 2020 12:35:02 -0400 "Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Wed, Mar 11, 2020 at 06:19:04PM +0100, David Hildenbrand wrote:
> > On 11.03.20 18:14, David Hildenbrand wrote:
> > > virtio-mem wants to offline and remove a memory block once it unplugged
> > > all subblocks (e.g., using alloc_contig_range()). Let's provide
> > > an interface to do that from a driver. virtio-mem already supports to
> > > offline partially unplugged memory blocks. Offlining a fully unplugged
> > > memory block will not require to migrate any pages. All unplugged
> > > subblocks are PageOffline() and have a reference count of 0 - so
> > > offlining code will simply skip them.
> > > 
> > > All we need is an interface to offline and remove the memory from kernel
> > > module context, where we don't have access to the memory block devices
> > > (esp. find_memory_block() and device_offline()) and the device hotplug
> > > lock.
> > > 
> > > To keep things simple, allow to only work on a single memory block.
> > > 
> > 
> > Lost the ACK from Michael
> > 
> > Acked-by: Michal Hocko <mhocko@suse.com> [1]
> > 
> > [1] https://lkml.kernel.org/r/20200302142737.GP4380@dhcp22.suse.cz
> 
> 
> Andrew, could you pls ack merging this through the vhost tree,
> with the rest of the patchset?

I wish the device_offline() return value was documented :(

Yes, please go ahead and merge.

Acked-by: Andrew Morton <akpm@linux-foundation.org>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
