Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD35175D00
	for <lists.virtualization@lfdr.de>; Mon,  2 Mar 2020 15:27:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4AF8B20399;
	Mon,  2 Mar 2020 14:27:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hoF9WrQKjl-g; Mon,  2 Mar 2020 14:27:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3F6BE203F5;
	Mon,  2 Mar 2020 14:27:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 15FB4C013E;
	Mon,  2 Mar 2020 14:27:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8D44AC013E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 14:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 76FB9203F5
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 14:27:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uFuPmjzQYwds
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 14:27:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 9F6CD20399
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 14:27:40 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a25so38344wmm.0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 02 Mar 2020 06:27:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wTQwmZBRvHVWlOUwzt39lRwPZP1PXvP9AI5qWhdX6Ho=;
 b=Zc0AsXneUux9qceUJWqKQo/uism1vnOKDcopFqligLVNh5Xw8azD2SMb9pvKBAXn5U
 EBwLmazogzIgIteiaEj6K8ycHVKPwcU4NX8tLIkeZSMq/nJfSdinyZqA9YPAhsHr/ur5
 DR6tUs7xxIU1EjPOg0uvc6zOITkyOw6Ifg0DMavmRz09Zu6mkJ0+ESzw+KhmRZBRnJV/
 Nq17p6ZYROb9o9+rKCATpTq5pLf6yjZKCJ2sLmIHTO5zrH4LBpkaWhc9Ixofo72O4HTn
 mUbyFmxp6Zwd08yhzCT/3faYkwSfw3xCgJASgWhmtgnoZ4rm1G6Ep53CHPFLq+cAIJG5
 Jt2Q==
X-Gm-Message-State: APjAAAVmY6Ma3ntUcouKTo8e8Rcjl8GC7ojPxiMnNiRiBnTfig44HEKc
 6/ZtNzlVsD0BMLpmCATDL4c=
X-Google-Smtp-Source: APXvYqwd+CHYryhKK2gAxaRfzTEgpelHGrh9Fbdww7O5/Nv7QJcXytR5reYcK2kbmxXWpKlqYuNkmw==
X-Received: by 2002:a1c:6884:: with SMTP id d126mr19396061wmc.38.1583159259142; 
 Mon, 02 Mar 2020 06:27:39 -0800 (PST)
Received: from localhost (prg-ext-pat.suse.com. [213.151.95.130])
 by smtp.gmail.com with ESMTPSA id v16sm10493929wrp.84.2020.03.02.06.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 06:27:38 -0800 (PST)
Date: Mon, 2 Mar 2020 15:27:37 +0100
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 08/11] mm/memory_hotplug: Introduce
 offline_and_remove_memory()
Message-ID: <20200302142737.GP4380@dhcp22.suse.cz>
References: <20200302134941.315212-1-david@redhat.com>
 <20200302134941.315212-9-david@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302134941.315212-9-david@redhat.com>
Cc: Oscar Salvador <osalvador@suse.com>, virtio-dev@lists.oasis-open.org,
 Pavel Tatashin <pasha.tatashin@soleen.com>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Qian Cai <cai@lca.pw>, Andrew Morton <akpm@linux-foundation.org>,
 Wei Yang <richard.weiyang@gmail.com>, Dan Williams <dan.j.williams@intel.com>
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

On Mon 02-03-20 14:49:38, David Hildenbrand wrote:
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
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Oscar Salvador <osalvador@suse.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
> Cc: Wei Yang <richard.weiyang@gmail.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Qian Cai <cai@lca.pw>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: Michal Hocko <mhocko@suse.com>

> ---
>  include/linux/memory_hotplug.h |  1 +
>  mm/memory_hotplug.c            | 37 ++++++++++++++++++++++++++++++++++
>  2 files changed, 38 insertions(+)
> 
> diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
> index f4d59155f3d4..a98aa16dbfa1 100644
> --- a/include/linux/memory_hotplug.h
> +++ b/include/linux/memory_hotplug.h
> @@ -311,6 +311,7 @@ extern void try_offline_node(int nid);
>  extern int offline_pages(unsigned long start_pfn, unsigned long nr_pages);
>  extern int remove_memory(int nid, u64 start, u64 size);
>  extern void __remove_memory(int nid, u64 start, u64 size);
> +extern int offline_and_remove_memory(int nid, u64 start, u64 size);
>  
>  #else
>  static inline bool is_mem_section_removable(unsigned long pfn,
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index ab1c31e67fd1..d0d337918a15 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -1818,4 +1818,41 @@ int remove_memory(int nid, u64 start, u64 size)
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
> 2.24.1
> 

-- 
Michal Hocko
SUSE Labs
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
