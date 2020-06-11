Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1151F655D
	for <lists.virtualization@lfdr.de>; Thu, 11 Jun 2020 12:08:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 69BF88871D;
	Thu, 11 Jun 2020 10:08:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id omzmPE4ndJXN; Thu, 11 Jun 2020 10:08:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 944E388725;
	Thu, 11 Jun 2020 10:08:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 68254C016F;
	Thu, 11 Jun 2020 10:08:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EFC64C0891
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 10:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E547F26881
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 10:08:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 03heKajbezNv
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 10:08:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 7DE5625AB8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 10:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591870081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hti1yQlaKXXa4b8vH7t/CX8EVQPiSGu8ey4rYtxv/ZU=;
 b=P7l1qcZHsWXr2t3VvsLQ19WcNaxqcNVNdqybRsm5jFkbpWVa+EbVurDtqDFR0nNJAEtXL2
 KGN6mJpOxj8/BirbBBcE2miiA9euE9X21/SWQWK4v2RSQ1AK6hg4DWAINTXRbRuqAlnwRU
 o4A4SB82R7UD/l5pEyqFOJ/koCT0H1U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-bc2SRTCmNnuESe-He1IyUg-1; Thu, 11 Jun 2020 06:07:59 -0400
X-MC-Unique: bc2SRTCmNnuESe-He1IyUg-1
Received: by mail-wr1-f69.google.com with SMTP id m14so2370158wrj.12
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 03:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hti1yQlaKXXa4b8vH7t/CX8EVQPiSGu8ey4rYtxv/ZU=;
 b=OhZZb/qnMpk4/do68D4tkKuRKZASFeH7+WGHEOBGa0PqM5uG+etIBz4uL9uJ1Ud9ZX
 AKurwg/Kh9339J3ZuDVTAwfEKg+xp68DDQg21wbr/knIHVofKEB3vQbN4tygy46VlxkL
 NIqu6SOxpY1xhzo/s5G06yf8blM0V0XI1T3zCDU55pfBtDe3vTj709r05X+2whEeBuj6
 tzhA5vnX7PGo/PA/cFGH2EYLbEMVoRMakcF+aI1IOjZR+yAU3+yTKqp5svaAkUJaTTKa
 TUhBR9GFxGAi4hoTHuVRzpCMNpcIcgiiC9po4ijEBhLIUgz6QhHcXONa+t9/RQq4ySGk
 QNnw==
X-Gm-Message-State: AOAM533uEZDWDOS7VgeKfiRir7PQdNwMETj28dUV+M7m/X0Q779/uaru
 hyaww6KSV6ovwQ3f5XTGzzbEq6LydZTrN39Hjw58yzBuzp0QQDsuBiHVq5hG9x3yAKDd/M1uEYE
 7Y0qKnuMg2cxIXz8PoSi0M2k5iuIQZb0LrrId8qPKkQ==
X-Received: by 2002:a5d:5449:: with SMTP id w9mr8887303wrv.106.1591870078453; 
 Thu, 11 Jun 2020 03:07:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7fUMwNnhBKL0yD4hzPZy5EKspCjidE0BlArAAtqV0VBMDwrTb+hVc8kTwnh7wCpCs88IQZw==
X-Received: by 2002:a5d:5449:: with SMTP id w9mr8887273wrv.106.1591870078148; 
 Thu, 11 Jun 2020 03:07:58 -0700 (PDT)
Received: from redhat.com (bzq-79-181-55-232.red.bezeqint.net. [79.181.55.232])
 by smtp.gmail.com with ESMTPSA id u4sm3363234wmb.48.2020.06.11.03.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 03:07:57 -0700 (PDT)
Date: Thu, 11 Jun 2020 06:07:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1] virtio-mem: add memory via add_memory_driver_managed()
Message-ID: <20200611060249-mutt-send-email-mst@kernel.org>
References: <20200611093518.5737-1-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200611093518.5737-1-david@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: virtio-dev@lists.oasis-open.org, kvm@vger.kernel.org,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 teawater <teawaterz@linux.alibaba.com>
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

virtio-mem: add memory via add_memory_driver_managed()


On Thu, Jun 11, 2020 at 11:35:18AM +0200, David Hildenbrand wrote:
> Virtio-mem managed memory is always detected and added by the virtio-mem
> driver, never using something like the firmware-provided memory map.
> This is the case after an ordinary system reboot, and has to be guaranteed
> after kexec. Especially, virtio-mem added memory resources can contain
> inaccessible parts ("unblocked memory blocks"), blindly forwarding them
> to a kexec kernel is dangerous, as unplugged memory will get accessed
> (esp. written).
> 
> Let's use the new way of adding special driver-managed memory introduced
> in commit 75ac4c58bc0d ("mm/memory_hotplug: introduce
> add_memory_driver_managed()").
> 
> This will result in no entries in /sys/firmware/memmap ("raw firmware-
> provided memory map"), the memory resource will be flagged
> IORESOURCE_MEM_DRIVER_MANAGED (esp., kexec_file_load() will not place
> kexec images on this memory), and it is exposed as "System RAM
> (virtio_mem)" in /proc/iomem, so esp. kexec-tools can properly handle it.
> 
> Example /proc/iomem before this change:
>   [...]
>   140000000-333ffffff : virtio0
>     140000000-147ffffff : System RAM
>   334000000-533ffffff : virtio1
>     338000000-33fffffff : System RAM
>     340000000-347ffffff : System RAM
>     348000000-34fffffff : System RAM
>   [...]
> 
> Example /proc/iomem after this change:
>   [...]
>   140000000-333ffffff : virtio0
>     140000000-147ffffff : System RAM (virtio_mem)
>   334000000-533ffffff : virtio1
>     338000000-33fffffff : System RAM (virtio_mem)
>     340000000-347ffffff : System RAM (virtio_mem)
>     348000000-34fffffff : System RAM (virtio_mem)
>   [...]
> 
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> Cc: teawater <teawaterz@linux.alibaba.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
> 
> Based on latest Linus' tree (and not a tag) because
> - virtio-mem has just been merged via the vhost tree
> - add_memory_driver_managed() has been merged a week ago via the -mm tree
> 
> I'd like to have this patch in 5.8, with the initial merge of virtio-mem
> if possible (so the user space representation of virtio-mem added memory
> resources won't change anymore).

So my plan is to rebase on top of -rc1 and merge this for rc2 then.
I don't like rebase on top of tip as the results are sometimes kind of
random.
And let's add a Fixes: tag as well, this way people will remember to
pick this.
Makes sense?


> ---
>  drivers/virtio/virtio_mem.c | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
> index 50c689f250450..d2eab3558a9e1 100644
> --- a/drivers/virtio/virtio_mem.c
> +++ b/drivers/virtio/virtio_mem.c
> @@ -101,6 +101,11 @@ struct virtio_mem {
>  
>  	/* The parent resource for all memory added via this device. */
>  	struct resource *parent_resource;
> +	/*
> +	 * Copy of "System RAM (virtio_mem)" to be used for
> +	 * add_memory_driver_managed().
> +	 */
> +	const char *resource_name;
>  
>  	/* Summary of all memory block states. */
>  	unsigned long nb_mb_state[VIRTIO_MEM_MB_STATE_COUNT];
> @@ -414,8 +419,20 @@ static int virtio_mem_mb_add(struct virtio_mem *vm, unsigned long mb_id)
>  	if (nid == NUMA_NO_NODE)
>  		nid = memory_add_physaddr_to_nid(addr);
>  
> +	/*
> +	 * When force-unloading the driver and we still have memory added to
> +	 * Linux, the resource name has to stay.
> +	 */
> +	if (!vm->resource_name) {
> +		vm->resource_name = kstrdup_const("System RAM (virtio_mem)",
> +						  GFP_KERNEL);
> +		if (!vm->resource_name)
> +			return -ENOMEM;
> +	}
> +
>  	dev_dbg(&vm->vdev->dev, "adding memory block: %lu\n", mb_id);
> -	return add_memory(nid, addr, memory_block_size_bytes());
> +	return add_memory_driver_managed(nid, addr, memory_block_size_bytes(),
> +					 vm->resource_name);
>  }
>  
>  /*
> @@ -1890,10 +1907,12 @@ static void virtio_mem_remove(struct virtio_device *vdev)
>  	    vm->nb_mb_state[VIRTIO_MEM_MB_STATE_OFFLINE_PARTIAL] ||
>  	    vm->nb_mb_state[VIRTIO_MEM_MB_STATE_ONLINE] ||
>  	    vm->nb_mb_state[VIRTIO_MEM_MB_STATE_ONLINE_PARTIAL] ||
> -	    vm->nb_mb_state[VIRTIO_MEM_MB_STATE_ONLINE_MOVABLE])
> +	    vm->nb_mb_state[VIRTIO_MEM_MB_STATE_ONLINE_MOVABLE]) {
>  		dev_warn(&vdev->dev, "device still has system memory added\n");
> -	else
> +	} else {
>  		virtio_mem_delete_resource(vm);
> +		kfree_const(vm->resource_name);
> +	}
>  
>  	/* remove all tracking data - no locking needed */
>  	vfree(vm->mb_state);
> -- 
> 2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
