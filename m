Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DE41C8730
	for <lists.virtualization@lfdr.de>; Thu,  7 May 2020 12:47:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D22DD87D41;
	Thu,  7 May 2020 10:46:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vnwkxZndPL94; Thu,  7 May 2020 10:46:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1A34487BEE;
	Thu,  7 May 2020 10:46:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E0B70C07FF;
	Thu,  7 May 2020 10:46:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77C9DC07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 10:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 57B8726287
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 10:46:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4nNtnrKsiPkJ
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 10:46:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 505C624E36
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 May 2020 10:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588848414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jwFSP1qKPzAiDWVK6ecZi/lZRSGtCCdB3pW0dxf0VHw=;
 b=D0pXP0IUIMyXohYPb51/MwOqKX3cwc8P3CtBT1BmWOlAcovCp183l3rbTn1Px4Btyw5R//
 gNbfNHE5PRtqKcHOKz3qDV2dfoh6wXYpAbT2gtuddFNAXOUazg5TNJzXN041miT2NcPORQ
 dtQTNv7YqmwPF3o9p+o4GAb5jQ97E2Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-cVE8bENQO3CTMsCrxTpDGA-1; Thu, 07 May 2020 06:46:52 -0400
X-MC-Unique: cVE8bENQO3CTMsCrxTpDGA-1
Received: by mail-wm1-f69.google.com with SMTP id o26so2423353wmh.1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 07 May 2020 03:46:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jwFSP1qKPzAiDWVK6ecZi/lZRSGtCCdB3pW0dxf0VHw=;
 b=lDNAFoEYGA4l52zt7/HmUbkOcl22yzEkpu1cApu8iERw3hHPJqXr0Rhk9CHO6LK5SK
 TOvVP1OtKCoC10ArN/4duPE2kpHo/sM2dn17pcfguuQdaagg2w4goXd60FEg5uWoGSkK
 1Tc2oFsDf1WSxPR6CL5w4d8P32WswfhZKs5utD6fhcEm7oD0lo4S5jzyEleTd+mdp3oM
 6DoP5PdM6WJ1zhnbFFbRI3yXTJcAwPV/YR8ULo18NJQ6MBqX2WdclsnWmjDkrVXqSR5m
 fHrCKiCJdg4ga+7AyYv/bclrSNT68qwrL6tc1zZKnOaCrXM8L43oy5nhBbX43y/IwDvf
 1Ikg==
X-Gm-Message-State: AGi0PubIaTbGW/atOLYYw7EWuKGTgRILzaigZf8GvJNqrYyKf0HHRHw2
 LJ/2NvtYIm2TC9JHdUdADjO67F4zmdxxLI4KkGZpEUAcowFy7Qsl5JDIiwGHUkBo9sRnt6/aNtf
 Zjn5QksBWoDf5bg59PDFAkzBkXTMP4V4sklCR5JPA9w==
X-Received: by 2002:a1c:4b16:: with SMTP id y22mr9704519wma.170.1588848411507; 
 Thu, 07 May 2020 03:46:51 -0700 (PDT)
X-Google-Smtp-Source: APiQypJwkpcsvMDTihRmO/58UI/oBdWetzX3zNTW+RN5tQqtGOSRJ/Ox4DqJrFYHImjL7fq9CHlvYA==
X-Received: by 2002:a1c:4b16:: with SMTP id y22mr9704494wma.170.1588848411214; 
 Thu, 07 May 2020 03:46:51 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 v11sm7638062wrv.53.2020.05.07.03.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 03:46:50 -0700 (PDT)
Date: Thu, 7 May 2020 06:46:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 07/15] mm/memory_hotplug: Introduce
 offline_and_remove_memory()
Message-ID: <20200507064558-mutt-send-email-mst@kernel.org>
References: <20200507103119.11219-1-david@redhat.com>
 <20200507103119.11219-8-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200507103119.11219-8-david@redhat.com>
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

On Thu, May 07, 2020 at 12:31:11PM +0200, David Hildenbrand wrote:
> virtio-mem wants to offline and remove a memory block once it unplugged
> all subblocks (e.g., using alloc_contig_range()). Let's provide
> an interface to do that from a driver. virtio-mem already supports to
> offline partially unplugged memory blocks. Offlining a fully unplugged
> memory block will not require to migrate any pages. All unplugged
> subblocks are PageOffline() and have a reference count of 0 - so
> offlining code will simply skip them.
> 
> All we need is an interface to offline and remove the memory from kernel
> module context, where we don't have access to the memory block devices
> (esp. find_memory_block() and device_offline()) and the device hotplug
> lock.
> 
> To keep things simple, allow to only work on a single memory block.
> 
> Acked-by: Michal Hocko <mhocko@suse.com>
> Tested-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Oscar Salvador <osalvador@suse.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
> Cc: Wei Yang <richard.weiyang@gmail.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Qian Cai <cai@lca.pw>
> Signed-off-by: David Hildenbrand <david@redhat.com>


didn't you lose Andrew Morton's ack here?

> ---
>  include/linux/memory_hotplug.h |  1 +
>  mm/memory_hotplug.c            | 37 ++++++++++++++++++++++++++++++++++
>  2 files changed, 38 insertions(+)

I get:

error: sha1 information is lacking or useless (mm/memory_hotplug.c).
error: could not build fake ancestor

which version is this against? Pls post patches on top of some tag
in Linus' tree if possible.


> diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
> index 7dca9cd6076b..d641828e5596 100644
> --- a/include/linux/memory_hotplug.h
> +++ b/include/linux/memory_hotplug.h
> @@ -318,6 +318,7 @@ extern void try_offline_node(int nid);
>  extern int offline_pages(unsigned long start_pfn, unsigned long nr_pages);
>  extern int remove_memory(int nid, u64 start, u64 size);
>  extern void __remove_memory(int nid, u64 start, u64 size);
> +extern int offline_and_remove_memory(int nid, u64 start, u64 size);
>  
>  #else
>  static inline void try_offline_node(int nid) {}
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 936bfe208a6e..bf1941f02a60 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -1748,4 +1748,41 @@ int remove_memory(int nid, u64 start, u64 size)
>  	return rc;
>  }
>  EXPORT_SYMBOL_GPL(remove_memory);
> +
> +/*
> + * Try to offline and remove a memory block. Might take a long time to
> + * finish in case memory is still in use. Primarily useful for memory devices
> + * that logically unplugged all memory (so it's no longer in use) and want to
> + * offline + remove the memory block.
> + */
> +int offline_and_remove_memory(int nid, u64 start, u64 size)
> +{
> +	struct memory_block *mem;
> +	int rc = -EINVAL;
> +
> +	if (!IS_ALIGNED(start, memory_block_size_bytes()) ||
> +	    size != memory_block_size_bytes())
> +		return rc;
> +
> +	lock_device_hotplug();
> +	mem = find_memory_block(__pfn_to_section(PFN_DOWN(start)));
> +	if (mem)
> +		rc = device_offline(&mem->dev);
> +	/* Ignore if the device is already offline. */
> +	if (rc > 0)
> +		rc = 0;
> +
> +	/*
> +	 * In case we succeeded to offline the memory block, remove it.
> +	 * This cannot fail as it cannot get onlined in the meantime.
> +	 */
> +	if (!rc) {
> +		rc = try_remove_memory(nid, start, size);
> +		WARN_ON_ONCE(rc);
> +	}
> +	unlock_device_hotplug();
> +
> +	return rc;
> +}
> +EXPORT_SYMBOL_GPL(offline_and_remove_memory);
>  #endif /* CONFIG_MEMORY_HOTREMOVE */
> -- 
> 2.25.3

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
