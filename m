Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC7A1C885A
	for <lists.virtualization@lfdr.de>; Thu,  7 May 2020 13:34:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 32CBB893CE;
	Thu,  7 May 2020 11:34:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GvFOeWPObQ9e; Thu,  7 May 2020 11:34:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 877E68945E;
	Thu,  7 May 2020 11:34:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 608A4C07FF;
	Thu,  7 May 2020 11:34:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 250D8C0865
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 11:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1D15189389
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 11:34:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wwjnel66NhcJ
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 11:34:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 35F478934C
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 11:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588851241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XwlnVfeL8zwiME3AXkx3OodZgfIVpDR8QDqNxlTyOzM=;
 b=Cp2JzWNXZC2wBfp5Ya6QW9ETP7PwBJzIO+DZNw+6albMmyYTidvRMZhhfk0b8Yn12X2zwo
 e52YrjT/Odl7Vhn1yKXI7zVpc0RbG8h/KeLsoeDUcrKf9B4Ai4sT+BCzQKtPbgMgpx0Qzl
 ciDShhaQzCPZdctGcbY7fOt+Zx/AcVk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-NlATQHz4OWm4c0vkBjZamw-1; Thu, 07 May 2020 07:33:57 -0400
X-MC-Unique: NlATQHz4OWm4c0vkBjZamw-1
Received: by mail-wm1-f69.google.com with SMTP id d134so3923182wmd.0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 07 May 2020 04:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XwlnVfeL8zwiME3AXkx3OodZgfIVpDR8QDqNxlTyOzM=;
 b=csdpthrh2Oncv56s8+g2fq6loB9im1VfSvHqJQZ6G1ALM9ycjHxLwF4wag1nx9qNwc
 H0o6m1D7vCd+MDoheFEHnNqlKohZcAfAaqxEzYV+xyOrAA3j7agwjxVQ6fMzGEB6xzDq
 BHYy60jdEVsUXQ/rGBvSdoKyKvxhS8wxfZ85oM6xS9Wppk7atNseicPcjLVDVVqGNAb2
 k2XYLQVhtzz8xEPTIdWXjWW/VWhxpCQBSXFH3x0DCd2JntADfIdqYdUiFaE6xCteparA
 /1ho+j8yJo55goEeQmoNt2q9KIX/quxJbjARvmYu1Uxc54sGIIAEb1sfx/8w66bac7ae
 FNCw==
X-Gm-Message-State: AGi0PuYiRWzsomasjkul7oaaFe/aHqtjKTgpH9UeNljgEEHB1Ka0fnn8
 cJqyzMkiFyrk+YM6k+XRK7EBg0roFeBIM3tKKR22e4RYRjiRYYfuWjUMkRTufrhOBTiq5i69Qza
 2TvOHZzADkiF3qvKO8hkPtCCl79A0zRHVyLS7Oy68dA==
X-Received: by 2002:a1c:f20c:: with SMTP id s12mr10636340wmc.83.1588851236206; 
 Thu, 07 May 2020 04:33:56 -0700 (PDT)
X-Google-Smtp-Source: APiQypKGIkZb1OCioKL4MfDtVCIXay4HVUxjU1z1uE6butvfdGNej6NGsQ5cSCDAt+neZC4D4zgsoQ==
X-Received: by 2002:a1c:f20c:: with SMTP id s12mr10636305wmc.83.1588851235952; 
 Thu, 07 May 2020 04:33:55 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 t4sm2834162wmf.33.2020.05.07.04.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 04:33:55 -0700 (PDT)
Date: Thu, 7 May 2020 07:33:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 07/15] mm/memory_hotplug: Introduce
 offline_and_remove_memory()
Message-ID: <20200507073302-mutt-send-email-mst@kernel.org>
References: <20200507103119.11219-1-david@redhat.com>
 <20200507103119.11219-8-david@redhat.com>
 <20200507064558-mutt-send-email-mst@kernel.org>
 <a915653f-232e-aa13-68f7-f988704fa84c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a915653f-232e-aa13-68f7-f988704fa84c@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Oscar Salvador <osalvador@suse.com>, virtio-dev@lists.oasis-open.org,
 Michal Hocko <mhocko@suse.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 kvm@vger.kernel.org, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 linux-kernel@vger.kernel.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Wei Yang <richard.weiyang@gmail.com>,
 Qian Cai <cai@lca.pw>, Andrew Morton <akpm@linux-foundation.org>,
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

On Thu, May 07, 2020 at 01:24:38PM +0200, David Hildenbrand wrote:
> On 07.05.20 12:46, Michael S. Tsirkin wrote:
> > On Thu, May 07, 2020 at 12:31:11PM +0200, David Hildenbrand wrote:
> >> virtio-mem wants to offline and remove a memory block once it unplugged
> >> all subblocks (e.g., using alloc_contig_range()). Let's provide
> >> an interface to do that from a driver. virtio-mem already supports to
> >> offline partially unplugged memory blocks. Offlining a fully unplugged
> >> memory block will not require to migrate any pages. All unplugged
> >> subblocks are PageOffline() and have a reference count of 0 - so
> >> offlining code will simply skip them.
> >>
> >> All we need is an interface to offline and remove the memory from kernel
> >> module context, where we don't have access to the memory block devices
> >> (esp. find_memory_block() and device_offline()) and the device hotplug
> >> lock.
> >>
> >> To keep things simple, allow to only work on a single memory block.
> >>
> >> Acked-by: Michal Hocko <mhocko@suse.com>
> >> Tested-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> >> Cc: Andrew Morton <akpm@linux-foundation.org>
> >> Cc: David Hildenbrand <david@redhat.com>
> >> Cc: Oscar Salvador <osalvador@suse.com>
> >> Cc: Michal Hocko <mhocko@suse.com>
> >> Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
> >> Cc: Wei Yang <richard.weiyang@gmail.com>
> >> Cc: Dan Williams <dan.j.williams@intel.com>
> >> Cc: Qian Cai <cai@lca.pw>
> >> Signed-off-by: David Hildenbrand <david@redhat.com>
> > 
> > 
> > didn't you lose Andrew Morton's ack here?
> 
> Yeah, thanks for noticing.
> 
> > 
> >> ---
> >>  include/linux/memory_hotplug.h |  1 +
> >>  mm/memory_hotplug.c            | 37 ++++++++++++++++++++++++++++++++++
> >>  2 files changed, 38 insertions(+)
> > 
> > I get:
> > 
> > error: sha1 information is lacking or useless (mm/memory_hotplug.c).
> > error: could not build fake ancestor
> > 
> > which version is this against? Pls post patches on top of some tag
> > in Linus' tree if possible.
> 
> As the cover states, latest linux-next. To be precise
> 
> commit 6b43f715b6379433e8eb30aa9bcc99bd6a585f77 (tag: next-20200507,
> next/master)
> Author: Stephen Rothwell <sfr@canb.auug.org.au>
> Date:   Thu May 7 18:11:31 2020 +1000
> 
>     Add linux-next specific files for 20200507
> 

Don't base on linux-next please. Generally base on the tree you are
targeting, or Linus' tree.


> -- 
> Thanks,
> 
> David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
