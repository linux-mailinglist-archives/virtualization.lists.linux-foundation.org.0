Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0595C1A851A
	for <lists.virtualization@lfdr.de>; Tue, 14 Apr 2020 18:35:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B45B586CC5;
	Tue, 14 Apr 2020 16:35:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OdXu0r9YDsGt; Tue, 14 Apr 2020 16:35:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4EAE686CC0;
	Tue, 14 Apr 2020 16:35:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 11E72C0172;
	Tue, 14 Apr 2020 16:35:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 50BA7C0172
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 16:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3D63C86CC5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 16:35:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AQimgdF7ewQw
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 16:35:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A0AA386CC0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 16:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586882115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a+z0V7RnGWnuMpMvNgwDiJGASaPb4ctVzlcABrxuV4A=;
 b=FqpJpJOFdPBw/8cyr4sc+pWm/u+SWmpVCEAzi4640Rmg83p7LyGhbPsKvocNcWBaTR8OP1
 ns3OGgO5HW/YS//hjxy1tWxPIVIX5LYVW51MCAQ55i1kM2sAGyPQ2X6zzT9547fAf5CoeA
 +g46QCt38uY5qetjdwXZ815vPflzBoM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-SieE9030MaOHzoEXVxCTBw-1; Tue, 14 Apr 2020 12:35:08 -0400
X-MC-Unique: SieE9030MaOHzoEXVxCTBw-1
Received: by mail-qt1-f199.google.com with SMTP id w12so7948259qto.19
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 09:35:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=a+z0V7RnGWnuMpMvNgwDiJGASaPb4ctVzlcABrxuV4A=;
 b=aJ1S5cILEV0ojr4S5POeV4WNyIsiHFEnwJoTrXq8rJVvMV8FYY3ejrcQyGKgx6StZj
 0AMz4BWix5cxJFHatDmIqnpFzpvhxk/Cw6pHWoJPtWy8uvG59oHAds9RKckJQlxKhJgi
 yXHavLToIwnUb8HLaoK5et56iRwHVmtjf/DPxUwaC/TRIR6tkgF+vgGKiR2evyHW06Wo
 uWiJYeblgZNoHs7Edzc72lQa2ES+LRaBuFxBv8KV7xfMIYQPKmiq4fZ6ZHHySBklbVlc
 lTOWtjr+a+OKIbX0mjB2cENlIPa/3IpPgjNbspT+/2qnG2gFrPP44qiiJpgYZR1v22fG
 NeOw==
X-Gm-Message-State: AGi0PuaYeREaPlued6SPDtNFisa+YfvO8yCXWupVUURA9WuymxeSDwBZ
 ecuh7t1EIDC7XlwktbF7dC4GtL7OAoT+Discp89dZw+RKBKFq0nvq0Pp7zKkEeXK/GX0xfdpceI
 5Qy3Ph4o3TBMRMGCIwdIjHYSSS2t12BIkYYErWlVn7Q==
X-Received: by 2002:ac8:1a8a:: with SMTP id x10mr16745179qtj.154.1586882108242; 
 Tue, 14 Apr 2020 09:35:08 -0700 (PDT)
X-Google-Smtp-Source: APiQypIakUO2krHIWdvhEXYjqdm92gTrXC3mv7zDEqds8YLz1XE2H5AqLw7LE95UTq5xyYwXK4VCyA==
X-Received: by 2002:ac8:1a8a:: with SMTP id x10mr16745153qtj.154.1586882108008; 
 Tue, 14 Apr 2020 09:35:08 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id f1sm10297177qkl.91.2020.04.14.09.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 09:35:07 -0700 (PDT)
Date: Tue, 14 Apr 2020 12:35:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 07/10] mm/memory_hotplug: Introduce
 offline_and_remove_memory()
Message-ID: <20200414123438-mutt-send-email-mst@kernel.org>
References: <20200311171422.10484-1-david@redhat.com>
 <20200311171422.10484-8-david@redhat.com>
 <156601a9-e919-b88f-2278-97ecee554d21@redhat.com>
MIME-Version: 1.0
In-Reply-To: <156601a9-e919-b88f-2278-97ecee554d21@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Oscar Salvador <osalvador@suse.com>, virtio-dev@lists.oasis-open.org,
 Michal Hocko <mhocko@suse.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Wei Yang <richard.weiyang@gmail.com>, Qian Cai <cai@lca.pw>,
 Andrew Morton <akpm@linux-foundation.org>,
 virtualization@lists.linux-foundation.org,
 Dan Williams <dan.j.williams@intel.com>
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

On Wed, Mar 11, 2020 at 06:19:04PM +0100, David Hildenbrand wrote:
> On 11.03.20 18:14, David Hildenbrand wrote:
> > virtio-mem wants to offline and remove a memory block once it unplugged
> > all subblocks (e.g., using alloc_contig_range()). Let's provide
> > an interface to do that from a driver. virtio-mem already supports to
> > offline partially unplugged memory blocks. Offlining a fully unplugged
> > memory block will not require to migrate any pages. All unplugged
> > subblocks are PageOffline() and have a reference count of 0 - so
> > offlining code will simply skip them.
> > 
> > All we need is an interface to offline and remove the memory from kernel
> > module context, where we don't have access to the memory block devices
> > (esp. find_memory_block() and device_offline()) and the device hotplug
> > lock.
> > 
> > To keep things simple, allow to only work on a single memory block.
> > 
> 
> Lost the ACK from Michael
> 
> Acked-by: Michal Hocko <mhocko@suse.com> [1]
> 
> [1] https://lkml.kernel.org/r/20200302142737.GP4380@dhcp22.suse.cz


Andrew, could you pls ack merging this through the vhost tree,
with the rest of the patchset?

> -- 
> Thanks,
> 
> David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
