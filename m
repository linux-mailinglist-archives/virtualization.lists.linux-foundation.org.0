Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id F03EB1BF130
	for <lists.virtualization@lfdr.de>; Thu, 30 Apr 2020 09:19:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 030E988638;
	Thu, 30 Apr 2020 07:19:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pYp51LLU20al; Thu, 30 Apr 2020 07:19:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3698188629;
	Thu, 30 Apr 2020 07:19:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 026CFC016F;
	Thu, 30 Apr 2020 07:19:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E0697C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 07:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C89D086CC5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 07:19:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0EhkJdbt3-gc
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 07:19:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B71E486CAC
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 07:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588231181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1ZVQP21/gRpjdQaiA5iEEwLdE4gKxXG18sO+uoyk77w=;
 b=ileq5ABB/K7L1S2Ty5wugwGj2HPFWrlN+YFzd7/ncICcIYW1vY4wVOtb2/zlcB2BXQkN04
 MDeY+r2ooaQqkDT+g/2XYrvkAHraaEGX9Wz79ouhGPpct4jTlhXRyOLF6gzG8zOcz/QKv9
 qC+nhp02UGk90ICV+nvqib0R/h+7E9g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-rM1ylhAbMHiuxvT_teIprA-1; Thu, 30 Apr 2020 03:19:37 -0400
X-MC-Unique: rM1ylhAbMHiuxvT_teIprA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16BAAEC1A7;
 Thu, 30 Apr 2020 07:19:35 +0000 (UTC)
Received: from [10.36.113.172] (ovpn-113-172.ams2.redhat.com [10.36.113.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9F7360BF4;
 Thu, 30 Apr 2020 07:19:27 +0000 (UTC)
Subject: Re: [PATCH v1 2/3] mm/memory_hotplug: Introduce MHP_DRIVER_MANAGED
To: linux-kernel@vger.kernel.org
References: <20200429160803.109056-1-david@redhat.com>
 <20200429160803.109056-3-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <a7305cd8-8b2f-1d8f-7654-ecf777c46df6@redhat.com>
Date: Thu, 30 Apr 2020 09:19:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429160803.109056-3-david@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: virtio-dev@lists.oasis-open.org, linux-hyperv@vger.kernel.org,
 Michal Hocko <mhocko@suse.com>, linux-acpi@vger.kernel.org,
 Baoquan He <bhe@redhat.com>, linux-nvdimm@lists.01.org,
 linux-s390@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Wei Yang <richard.weiyang@gmail.com>, Eric Biederman <ebiederm@xmission.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, xen-devel@lists.xenproject.org,
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Dan Williams <dan.j.williams@intel.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>
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

On 29.04.20 18:08, David Hildenbrand wrote:
> Some paravirtualized devices that add memory via add_memory() and
> friends (esp. virtio-mem) don't want to create entries in
> /sys/firmware/memmap/ - primarily to hinder kexec from adding this
> memory to the boot memmap of the kexec kernel.
> 
> In fact, such memory is never exposed via the firmware (e.g., e820), but
> only via the device, so exposing this memory via /sys/firmware/memmap/ is
> wrong:
>  "kexec needs the raw firmware-provided memory map to setup the
>   parameter segment of the kernel that should be booted with
>   kexec. Also, the raw memory map is useful for debugging. For
>   that reason, /sys/firmware/memmap is an interface that provides
>   the raw memory map to userspace." [1]
> 
> We want to let user space know that memory which is always detected,
> added, and managed via a (device) driver - like memory managed by
> virtio-mem - is special. It cannot be used for placing kexec segments
> and the (device) driver is responsible for re-adding memory that
> (eventually shrunk/grown/defragmented) memory after a reboot/kexec. It
> should e.g., not be added to a fixed up firmware memmap. However, it should
> be dumped by kdump.
> 
> Also, such memory could behave differently than an ordinary DIMM - e.g.,
> memory managed by virtio-mem can have holes inside added memory resource,
> which should not be touched, especially for writing.
> 
> Let's expose that memory as "System RAM (driver managed)" e.g., via
> /pro/iomem.
> 
> We don't have to worry about firmware_map_remove() on the removal path.
> If there is no entry, it will simply return with -EINVAL.
> 
> [1] https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-firmware-memmap
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> Cc: Wei Yang <richard.weiyang@gmail.com>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: Eric Biederman <ebiederm@xmission.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/linux/memory_hotplug.h |  8 ++++++++
>  mm/memory_hotplug.c            | 20 ++++++++++++++++----
>  2 files changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
> index bf0e3edb8688..cc538584b39e 100644
> --- a/include/linux/memory_hotplug.h
> +++ b/include/linux/memory_hotplug.h
> @@ -68,6 +68,14 @@ struct mhp_params {
>  	pgprot_t pgprot;
>  };
>  
> +/* Flags used for add_memory() and friends. */
> +
> +/*
> + * Don't create entries in /sys/firmware/memmap/ and expose memory as
> + * "System RAM (driver managed)" in e.g., /proc/iomem
> + */
> +#define MHP_DRIVER_MANAGED		1
> +
>  /*
>   * Zone resizing functions
>   *
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index ebdf6541d074..cfa0721280aa 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -98,11 +98,11 @@ void mem_hotplug_done(void)
>  u64 max_mem_size = U64_MAX;
>  
>  /* add this memory to iomem resource */
> -static struct resource *register_memory_resource(u64 start, u64 size)
> +static struct resource *register_memory_resource(u64 start, u64 size,
> +						 const char *resource_name)
>  {
>  	struct resource *res;
>  	unsigned long flags =  IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
> -	char *resource_name = "System RAM";
>  
>  	/*
>  	 * Make sure value parsed from 'mem=' only restricts memory adding
> @@ -1058,7 +1058,8 @@ int __ref add_memory_resource(int nid, struct resource *res,
>  	BUG_ON(ret);
>  
>  	/* create new memmap entry */
> -	firmware_map_add_hotplug(start, start + size, "System RAM");
> +	if (!(flags & MHP_DRIVER_MANAGED))
> +		firmware_map_add_hotplug(start, start + size, "System RAM");
>  
>  	/* device_online() will take the lock when calling online_pages() */
>  	mem_hotplug_done();
> @@ -1081,10 +1082,21 @@ int __ref add_memory_resource(int nid, struct resource *res,
>  /* requires device_hotplug_lock, see add_memory_resource() */
>  int __ref __add_memory(int nid, u64 start, u64 size, unsigned long flags)
>  {
> +	const char *resource_name = "System RAM";
>  	struct resource *res;
>  	int ret;
>  
> -	res = register_memory_resource(start, size);
> +	/*
> +	 * Indicate that memory managed by a driver is special. It's always
> +	 * detected and added via a driver, should not be given to the kexec
> +	 * kernel for booting when manually crafting the firmware memmap, and
> +	 * no kexec segments should be placed on it. However, kdump should
> +	 * dump this memory.
> +	 */
> +	if (flags & MHP_DRIVER_MANAGED)
> +		resource_name = "System RAM (driver managed)";
> +
> +	res = register_memory_resource(start, size, resource_name);
>  	if (IS_ERR(res))
>  		return PTR_ERR(res);
>  
> 

BTW, I was wondering if this is actually also something that
drivers/dax/kmem.c wants to use for adding memory.

Just because we decided to use some DAX memory in the current kernel as
system ram, doesn't mean we should make that decision for the kexec
kernel (e.g., using it as initial memory, placing kexec binaries onto
it, etc.). This is also not what we would observe during a real reboot.

I can see that the "System RAM" resource will show up as child resource
under the device e.g., in /proc/iomem.

However, entries in /sys/firmware/memmap/ are created as "System RAM".

-- 
Thanks,

David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
