Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FC11BF2E6
	for <lists.virtualization@lfdr.de>; Thu, 30 Apr 2020 10:34:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 95BB387E1F;
	Thu, 30 Apr 2020 08:34:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oZBqmnYacBwb; Thu, 30 Apr 2020 08:34:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CDB0987E1D;
	Thu, 30 Apr 2020 08:34:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9485CC016F;
	Thu, 30 Apr 2020 08:34:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 70258C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 08:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 59DCD86940
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 08:34:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SghVAURLjlp5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 08:34:13 +0000 (UTC)
X-Greylist: delayed 00:22:05 by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B266987CAE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 08:34:12 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id s3so3992579eji.6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 01:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=87dIcS/jrU3IxflLIkdtnvU4qll0iHvEZNuLGZ4o7wI=;
 b=C7NzSwQeQ8r7hb6zu0mE43nN5BVsWOZy21t9s86oMspwPoqNG+2r9QwYXMI253bkO+
 f2NXbqJEZlVUDXw2jKOJXTdMksOMSeCU/1+d1/KW3kPK6bDnIkjaV85ydvslVx7+7VaK
 H/Wy8s3jtrbog9dFPbt+U8g4F9a/kPxAFzoHfDtTpSCDud/nTiDKxbIHNOx4gDT1cWli
 scShmtfTOkTf1D6LztaDjOZAMAIUOcl9E1Ehg4s+icpPrmffJn6TfhOtMJuuVZZemCWo
 u5q8IaOdIkls7C87+V/X7frCMtH72XB/et/faVXvhnFad5uP3/TQ8BbSLNTCllAusarT
 BwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=87dIcS/jrU3IxflLIkdtnvU4qll0iHvEZNuLGZ4o7wI=;
 b=NqfAvFG0jehikosUjHj8+x3WJ6tyZSDV0unxDzmAijyh0Nm6TWxE3S1G6DPCHT/Rny
 5ZCseo9uIpOkmPGxproZ0UeDtVu4r+SJkxPpMIH5ooxhYks+9yqR6ux6zuxNIXFR5Fvy
 2zvPZJfHlpJr/+3OYc/6QmWTvwaocjSgPz712JS6ttwK3vdDvBgAAyJE9+q9a1p8KmnP
 kRlIe3DKrs83PzXRue3S8jHAkRhGbDtPL9o+LKyTIIRb+8tW2Edkvk+DcW/vdbaEpTqw
 JDyuVhGbC/bWsoeuSfp1M0ivDdyj8W3OuQu4Jo1Qw0QE3zU+WJD7NiuFlD6gg1lILQem
 rWfA==
X-Gm-Message-State: AGi0PuZ3tguG9jG1aZxB4Cd5fuECyw480WZnUa+tqurZfZ8D4acWdNVg
 cd8kwUVXqohumB81XoKpJ16fZje9nlFsprygKQ3UNg==
X-Google-Smtp-Source: APiQypLBVztlIIHfr3wCtEt+MVa/TaJHl/O1nuNqStB0TwAKkS6wTTbCgFJlPXMDG8iI601GTPaB481cRsH+FNdImHY=
X-Received: by 2002:a17:906:7750:: with SMTP id
 o16mr1715515ejn.12.1588235651152; 
 Thu, 30 Apr 2020 01:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200429160803.109056-1-david@redhat.com>
 <20200429160803.109056-3-david@redhat.com>
 <a7305cd8-8b2f-1d8f-7654-ecf777c46df6@redhat.com>
 <CAPcyv4i04+QLxiOyz04_eef2DFetEFKBUmi2A4xxw9abQD8hNQ@mail.gmail.com>
 <e32522cd-31bb-e129-47a6-9ec13b570506@redhat.com>
In-Reply-To: <e32522cd-31bb-e129-47a6-9ec13b570506@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 30 Apr 2020 01:34:00 -0700
Message-ID: <CAPcyv4gjRE23BHsBAnaVWAPUHWdenxYMUwDBnDF7UmoejmmbNQ@mail.gmail.com>
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

On Thu, Apr 30, 2020 at 1:21 AM David Hildenbrand <david@redhat.com> wrote:
> >> Just because we decided to use some DAX memory in the current kernel as
> >> system ram, doesn't mean we should make that decision for the kexec
> >> kernel (e.g., using it as initial memory, placing kexec binaries onto
> >> it, etc.). This is also not what we would observe during a real reboot.
> >
> > Agree.
> >
> >> I can see that the "System RAM" resource will show up as child resource
> >> under the device e.g., in /proc/iomem.
> >>
> >> However, entries in /sys/firmware/memmap/ are created as "System RAM".
> >
> > True. Do you think this rename should just be limited to what type
> > /sys/firmware/memmap/ emits? I have the concern, but no proof
>
> We could split this patch into
>
> MHP_NO_FIRMWARE_MEMMAP (create firmware memmap entries)
>
> and
>
> MHP_DRIVER_MANAGED (name of the resource)
>
> See below, the latter might not be needed.
>
> > currently, that there are /proc/iomem walkers that explicitly look for
> > "System RAM", but might be thrown off by "System RAM (driver
> > managed)". I was not aware of /sys/firmware/memmap until about 5
> > minutes ago.
>
> The only two users of /proc/iomem I am aware of are kexec-tools and some
> s390x tools.
>
> kexec-tools on x86-64 uses /sys/firmware/memmap to craft the initial
> memmap, but uses /proc/iomem to
> a) Find places for kexec images
> b) Detect memory regions to dump via kdump
>
> I am not yet sure if we really need the "System RAM (driver managed)"
> part. If we can teach kexec-tools to
> a) Don't place kexec images on "System RAM" that has a parent resource
> (most likely requires kexec-tools changes)
> b) Consider for kdump "System RAM" that has a parent resource
> we might be able to avoid renaming that. (I assume that's already done)
>
> E.g., regarding virtio-mem (patch #3) I am currently also looking into
> creating a parent resource instead, like dax/kmem to avoid the rename:
>
> :/# cat /proc/iomem
> 00000000-00000fff : Reserved
> [...]
> 100000000-13fffffff : System RAM
> 140000000-33fffffff : virtio0
>   140000000-147ffffff : System RAM
>   148000000-14fffffff : System RAM
>   150000000-157ffffff : System RAM
> 340000000-303fffffff : virtio1
>   340000000-347ffffff : System RAM
> 3280000000-32ffffffff : PCI Bus 0000:00

Looks good to me if it flies with kexec-tools.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
