Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id F201A1BF27F
	for <lists.virtualization@lfdr.de>; Thu, 30 Apr 2020 10:18:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 749051FC94;
	Thu, 30 Apr 2020 08:18:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eBB7+BkrVFMd; Thu, 30 Apr 2020 08:18:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C008A204F1;
	Thu, 30 Apr 2020 08:18:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8CB24C016F;
	Thu, 30 Apr 2020 08:18:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46A84C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 08:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8AB601FC94
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 08:18:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OkOC2EErsMTp
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 08:18:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 1E886235AE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 08:18:35 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id h4so5474389ljg.12
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 01:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aPyH7cBulXkr69UeTYsLw8J8jsMaQ8KU1AV45QxO0GM=;
 b=aRdqN+obvpVV2A+fgMLJy4RekybxRVDiG7lp8OF4bnZx2Ywvd3iCU/W+kNS4ZeZMFO
 s2KHcqmsaIITIji0juOY7H6rW7Fc6dWrzMOI3EIosswh9jq3YYccKaX2xhcXTvz1nd5V
 aBV+pihhUiUdyrUO5BWYQElkaX6/osTUoFcDUd3gIMpaDgbgaWZ7XiKQfHXqUsjsTevr
 xcbBoOAzO8ZeJrHgjs2FlN5xkisQM2/NaUdROIGlFFS2pMP9xFv8klIZrmKxkYMDnngC
 ZkScurbP2qpL3FH2QS0j799ldY6mMF4VeS1bCDMrE9KedwDuMF2flKOw3iR6FucwjAe8
 uO/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aPyH7cBulXkr69UeTYsLw8J8jsMaQ8KU1AV45QxO0GM=;
 b=IIOoPYWeKML3RbgPLwqi5kpAdFgDypypTa/PclCHYVzvqgV9iMRTzBjDiXoB1cYbAq
 qaEp2enBm8VE965kZ6//ABnsLa982H4bReCuX3au7Huq6SCt67BVrywSPbMkrk0YQtJN
 DNETrqBfVFqf/9+2Iy/9+bcV7sxCa2lQwMfejMJ5yVy1DzbhT1rTFe09wBRuzPZFeKhL
 D6Wi5j8nmxzXZCVHJ1vxgEvbGiStCWaEEIMWmS61vvtDxl49D6FfDawk8ESLJpOmAign
 /qddfYNZ3KRwvb2SRqmqtssjdMCTWFchVToGhaZvgJIMoSBTleAcI7V35IlWaV9o1Myn
 UlPQ==
X-Gm-Message-State: AGi0PuafPaQaQLAmDThG+u5adB/ozHCUvYMGrUd7+m17D6ua7ZuXWjUS
 qQgod29JRb84IjX2wh34oukdrgoermIA0yhkEYnxu04hao0=
X-Google-Smtp-Source: APiQypKwCBG4S6M4oBR8TWLxl5ZHi3zkP+L9vXXaCbuE040rlsosdGPooBbFU8EQOuJGeo1PTMYPgjG4Ewt4MDGe5kI=
X-Received: by 2002:a17:906:7750:: with SMTP id
 o16mr1646531ejn.12.1588234325407; 
 Thu, 30 Apr 2020 01:12:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200429160803.109056-1-david@redhat.com>
 <20200429160803.109056-3-david@redhat.com>
 <a7305cd8-8b2f-1d8f-7654-ecf777c46df6@redhat.com>
In-Reply-To: <a7305cd8-8b2f-1d8f-7654-ecf777c46df6@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 30 Apr 2020 01:11:54 -0700
Message-ID: <CAPcyv4i04+QLxiOyz04_eef2DFetEFKBUmi2A4xxw9abQD8hNQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] mm/memory_hotplug: Introduce MHP_DRIVER_MANAGED
To: David Hildenbrand <david@redhat.com>
Cc: virtio-dev@lists.oasis-open.org, linux-hyperv@vger.kernel.org,
 Michal Hocko <mhocko@suse.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Baoquan He <bhe@redhat.com>, Linux MM <linux-mm@kvack.org>,
 Wei Yang <richard.weiyang@gmail.com>, linux-s390 <linux-s390@vger.kernel.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Linux ACPI <linux-acpi@vger.kernel.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Eric Biederman <ebiederm@xmission.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
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

On Thu, Apr 30, 2020 at 12:20 AM David Hildenbrand <david@redhat.com> wrote:
>
> On 29.04.20 18:08, David Hildenbrand wrote:
> > Some paravirtualized devices that add memory via add_memory() and
> > friends (esp. virtio-mem) don't want to create entries in
> > /sys/firmware/memmap/ - primarily to hinder kexec from adding this
> > memory to the boot memmap of the kexec kernel.
> >
> > In fact, such memory is never exposed via the firmware (e.g., e820), but
> > only via the device, so exposing this memory via /sys/firmware/memmap/ is
> > wrong:
> >  "kexec needs the raw firmware-provided memory map to setup the
> >   parameter segment of the kernel that should be booted with
> >   kexec. Also, the raw memory map is useful for debugging. For
> >   that reason, /sys/firmware/memmap is an interface that provides
> >   the raw memory map to userspace." [1]
> >
> > We want to let user space know that memory which is always detected,
> > added, and managed via a (device) driver - like memory managed by
> > virtio-mem - is special. It cannot be used for placing kexec segments
> > and the (device) driver is responsible for re-adding memory that
> > (eventually shrunk/grown/defragmented) memory after a reboot/kexec. It
> > should e.g., not be added to a fixed up firmware memmap. However, it should
> > be dumped by kdump.
> >
> > Also, such memory could behave differently than an ordinary DIMM - e.g.,
> > memory managed by virtio-mem can have holes inside added memory resource,
> > which should not be touched, especially for writing.
> >
> > Let's expose that memory as "System RAM (driver managed)" e.g., via
> > /pro/iomem.
> >
> > We don't have to worry about firmware_map_remove() on the removal path.
> > If there is no entry, it will simply return with -EINVAL.
> >
> > [1] https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-firmware-memmap
> >
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Michal Hocko <mhocko@suse.com>
> > Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> > Cc: Wei Yang <richard.weiyang@gmail.com>
> > Cc: Baoquan He <bhe@redhat.com>
> > Cc: Eric Biederman <ebiederm@xmission.com>
> > Signed-off-by: David Hildenbrand <david@redhat.com>
> > ---
> >  include/linux/memory_hotplug.h |  8 ++++++++
> >  mm/memory_hotplug.c            | 20 ++++++++++++++++----
> >  2 files changed, 24 insertions(+), 4 deletions(-)
> >
> > diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
> > index bf0e3edb8688..cc538584b39e 100644
> > --- a/include/linux/memory_hotplug.h
> > +++ b/include/linux/memory_hotplug.h
> > @@ -68,6 +68,14 @@ struct mhp_params {
> >       pgprot_t pgprot;
> >  };
> >
> > +/* Flags used for add_memory() and friends. */
> > +
> > +/*
> > + * Don't create entries in /sys/firmware/memmap/ and expose memory as
> > + * "System RAM (driver managed)" in e.g., /proc/iomem
> > + */
> > +#define MHP_DRIVER_MANAGED           1
> > +
> >  /*
> >   * Zone resizing functions
> >   *
> > diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> > index ebdf6541d074..cfa0721280aa 100644
> > --- a/mm/memory_hotplug.c
> > +++ b/mm/memory_hotplug.c
> > @@ -98,11 +98,11 @@ void mem_hotplug_done(void)
> >  u64 max_mem_size = U64_MAX;
> >
> >  /* add this memory to iomem resource */
> > -static struct resource *register_memory_resource(u64 start, u64 size)
> > +static struct resource *register_memory_resource(u64 start, u64 size,
> > +                                              const char *resource_name)
> >  {
> >       struct resource *res;
> >       unsigned long flags =  IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
> > -     char *resource_name = "System RAM";
> >
> >       /*
> >        * Make sure value parsed from 'mem=' only restricts memory adding
> > @@ -1058,7 +1058,8 @@ int __ref add_memory_resource(int nid, struct resource *res,
> >       BUG_ON(ret);
> >
> >       /* create new memmap entry */
> > -     firmware_map_add_hotplug(start, start + size, "System RAM");
> > +     if (!(flags & MHP_DRIVER_MANAGED))
> > +             firmware_map_add_hotplug(start, start + size, "System RAM");
> >
> >       /* device_online() will take the lock when calling online_pages() */
> >       mem_hotplug_done();
> > @@ -1081,10 +1082,21 @@ int __ref add_memory_resource(int nid, struct resource *res,
> >  /* requires device_hotplug_lock, see add_memory_resource() */
> >  int __ref __add_memory(int nid, u64 start, u64 size, unsigned long flags)
> >  {
> > +     const char *resource_name = "System RAM";
> >       struct resource *res;
> >       int ret;
> >
> > -     res = register_memory_resource(start, size);
> > +     /*
> > +      * Indicate that memory managed by a driver is special. It's always
> > +      * detected and added via a driver, should not be given to the kexec
> > +      * kernel for booting when manually crafting the firmware memmap, and
> > +      * no kexec segments should be placed on it. However, kdump should
> > +      * dump this memory.
> > +      */
> > +     if (flags & MHP_DRIVER_MANAGED)
> > +             resource_name = "System RAM (driver managed)";
> > +
> > +     res = register_memory_resource(start, size, resource_name);
> >       if (IS_ERR(res))
> >               return PTR_ERR(res);
> >
> >
>
> BTW, I was wondering if this is actually also something that
> drivers/dax/kmem.c wants to use for adding memory.
>
> Just because we decided to use some DAX memory in the current kernel as
> system ram, doesn't mean we should make that decision for the kexec
> kernel (e.g., using it as initial memory, placing kexec binaries onto
> it, etc.). This is also not what we would observe during a real reboot.

Agree.

> I can see that the "System RAM" resource will show up as child resource
> under the device e.g., in /proc/iomem.
>
> However, entries in /sys/firmware/memmap/ are created as "System RAM".

True. Do you think this rename should just be limited to what type
/sys/firmware/memmap/ emits? I have the concern, but no proof
currently, that there are /proc/iomem walkers that explicitly look for
"System RAM", but might be thrown off by "System RAM (driver
managed)". I was not aware of /sys/firmware/memmap until about 5
minutes ago.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
