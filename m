Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C30B182340
	for <lists.virtualization@lfdr.de>; Wed, 11 Mar 2020 21:23:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A87F68879F;
	Wed, 11 Mar 2020 20:23:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mFqYY5M8C-ET; Wed, 11 Mar 2020 20:23:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3BC9D887A8;
	Wed, 11 Mar 2020 20:23:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 296AAC0177;
	Wed, 11 Mar 2020 20:23:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA7B6C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 20:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C456885EC6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 20:23:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IzghvN1sF7eu
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 20:23:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 704EE85E06
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 20:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583958184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PdHceSImpOs6CVFH+4WWRz5XkKao35jOzXo+8pbbF30=;
 b=bEBUvFBU8V/n31luNgSIHkJY3J/mtQ5De7PuzitqwCGLLVGsaWxxujX+rHGK6U2Ew4oZcY
 Lbj7nIq7ecNmdQTPb89g/Z7GbkAMHhP1pbZpdfM+U0rFdnkk2MUk2L0UiTphbqx6J+Whx3
 AvkmmVz4iV0+jHwJr9GvKnwqLh3TEAE=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-BUl1n8OXOeawFwQ-wXWO7A-1; Wed, 11 Mar 2020 16:22:59 -0400
X-MC-Unique: BUl1n8OXOeawFwQ-wXWO7A-1
Received: by mail-qv1-f70.google.com with SMTP id k1so2127139qvw.1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 13:22:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PdHceSImpOs6CVFH+4WWRz5XkKao35jOzXo+8pbbF30=;
 b=dHQukSH7CRgLNhjGEB0uvZAwhXA4ZGd97R4s2I2g1TThDnhb3oTFxwyHIRl13xwdHq
 WL3OAV4BmMjk/RQoqghPO+0sNkAZWwuZYFO6ex4csS3WN/HVEs9pa9AK6S6yXf0Pe2Tw
 1VXtNca60ifKUabMdw84H9Xf2RQi4nwqVIfnyX56y5IwmGm4uVZ4jBEmFMHFH3Sj53Mr
 qh20+HZWkqoPU7KJ3xrOsZJFrzNLLMn2F3pCJlgQHcRq78qECrRBKcGFNRfonI42sA+R
 0CxtZDhCzzyd3UmnKXnLUCazwvTStMo4766HSE3cV7DeADVNByN9IDZ9nhoQg2h4/9Hm
 I9HQ==
X-Gm-Message-State: ANhLgQ0ehxkkmf3Gs0dJnX/6xWikC73HxmHEPUbUFMw6g00K8MF43fa/
 dCqziGxoA2Df7oEqhiu3P/B4taZqnqvsnvCI6oZWuHo4K5hs6S09o47HObM0avs8ztFcOds9ELI
 cTDEGC41RNo5rSQiBfiBJxuglxfvi58iWCsZvKQFXeA==
X-Received: by 2002:ac8:2bf9:: with SMTP id n54mr4341674qtn.280.1583958179160; 
 Wed, 11 Mar 2020 13:22:59 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtYMiFrpDX7axDp/0tN80VnUfNwhdwRFbVcBrpyR+sVm+DN74jHBXdH09jbMEinw1MRgIwyBQ==
X-Received: by 2002:ac8:2bf9:: with SMTP id n54mr4341645qtn.280.1583958178798; 
 Wed, 11 Mar 2020 13:22:58 -0700 (PDT)
Received: from redhat.com (bzq-79-178-2-19.red.bezeqint.net. [79.178.2.19])
 by smtp.gmail.com with ESMTPSA id x6sm6089374qke.43.2020.03.11.13.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 13:22:58 -0700 (PDT)
Date: Wed, 11 Mar 2020 16:22:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v4] virtio-balloon: Switch back to OOM handler for
 VIRTIO_BALLOON_F_DEFLATE_ON_OOM
Message-ID: <20200311162218-mutt-send-email-mst@kernel.org>
References: <20200311135523.18512-1-david@redhat.com>
 <20200311135523.18512-2-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200311135523.18512-2-david@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Tyler Sanderson <tysand@google.com>,
 linux-mm@kvack.org, Nadav Amit <namit@vmware.com>,
 David Rientjes <rientjes@google.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Michal Hocko <mhocko@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
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

On Wed, Mar 11, 2020 at 02:55:23PM +0100, David Hildenbrand wrote:
> Commit 71994620bb25 ("virtio_balloon: replace oom notifier with shrinker")
> changed the behavior when deflation happens automatically. Instead of
> deflating when called by the OOM handler, the shrinker is used.
> 
> However, the balloon is not simply some other slab cache that should be
> shrunk when under memory pressure. The shrinker does not have a concept of
> priorities yet, so this behavior cannot be configured. Eventually once
> that is in place, we might want to switch back after doing proper
> testing.
> 
> There was a report that this results in undesired side effects when
> inflating the balloon to shrink the page cache. [1]
> 	"When inflating the balloon against page cache (i.e. no free memory
> 	 remains) vmscan.c will both shrink page cache, but also invoke the
> 	 shrinkers -- including the balloon's shrinker. So the balloon
> 	 driver allocates memory which requires reclaim, vmscan gets this
> 	 memory by shrinking the balloon, and then the driver adds the
> 	 memory back to the balloon. Basically a busy no-op."
> 
> The name "deflate on OOM" makes it pretty clear when deflation should
> happen - after other approaches to reclaim memory failed, not while
> reclaiming. This allows to minimize the footprint of a guest - memory
> will only be taken out of the balloon when really needed.
> 
> Keep using the shrinker for VIRTIO_BALLOON_F_FREE_PAGE_HINT, because
> this has no such side effects. Always register the shrinker with
> VIRTIO_BALLOON_F_FREE_PAGE_HINT now. We are always allowed to reuse free
> pages that are still to be processed by the guest. The hypervisor takes
> care of identifying and resolving possible races between processing a
> hinting request and the guest reusing a page.
> 
> In contrast to pre commit 71994620bb25 ("virtio_balloon: replace oom
> notifier with shrinker"), don't add a module parameter to configure the
> number of pages to deflate on OOM. Can be re-added if really needed.
> Also, pay attention that leak_balloon() returns the number of 4k pages -
> convert it properly in virtio_balloon_oom_notify().
> 
> Testing done by Tyler for future reference:
>   Test setup: VM with 16 CPU, 64GB RAM. Running Debian 10. We have a 42
>   GB file full of random bytes that we continually cat to /dev/null.
>   This fills the page cache as the file is read. Meanwhile, we trigger
>   the balloon to inflate, with a target size of 53 GB. This setup causes
>   the balloon inflation to pressure the page cache as the page cache is
>   also trying to grow. Afterwards we shrink the balloon back to zero (so
>   total deflate = total inflate).
> 
>   Without this patch (kernel 4.19.0-5):
>   Inflation never reaches the target until we stop the "cat file >
>   /dev/null" process. Total inflation time was 542 seconds. The longest
>   period that made no net forward progress was 315 seconds.
>     Result of "grep balloon /proc/vmstat" after the test:
>     balloon_inflate 154828377
>     balloon_deflate 154828377
> 
>   With this patch (kernel 5.6.0-rc4+):
>   Total inflation duration was 63 seconds. No deflate-queue activity
>   occurs when pressuring the page-cache.
>     Result of "grep balloon /proc/vmstat" after the test:
>     balloon_inflate 12968539
>     balloon_deflate 12968539
> 
>   Conclusion: This patch fixes the issue. In the test it reduced
>   inflate/deflate activity by 12x, and reduced inflation time by 8.6x.
>   But more importantly, if we hadn't killed the "cat file > /dev/null"
>   process then, without the patch, the inflation process would never reach
>   the target.
> 
> [1] https://www.spinics.net/lists/linux-virtualization/msg40863.html
> 
> Reported-by: Tyler Sanderson <tysand@google.com>
> Tested-by: Tyler Sanderson <tysand@google.com>
> Acked-by: David Rientjes <rientjes@google.com>
> Fixes: 71994620bb25 ("virtio_balloon: replace oom notifier with shrinker")
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Wei Wang <wei.w.wang@intel.com>
> Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> Cc: David Rientjes <rientjes@google.com>
> Cc: Nadav Amit <namit@vmware.com>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

Andrew, pls merge through your tree.

> ---
>  drivers/virtio/virtio_balloon.c | 103 +++++++++++++++-----------------
>  1 file changed, 47 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> index 9e0177529bad..0ef16566c3f3 100644
> --- a/drivers/virtio/virtio_balloon.c
> +++ b/drivers/virtio/virtio_balloon.c
> @@ -14,6 +14,7 @@
>  #include <linux/slab.h>
>  #include <linux/module.h>
>  #include <linux/balloon_compaction.h>
> +#include <linux/oom.h>
>  #include <linux/wait.h>
>  #include <linux/mm.h>
>  #include <linux/mount.h>
> @@ -28,7 +29,9 @@
>   */
>  #define VIRTIO_BALLOON_PAGES_PER_PAGE (unsigned)(PAGE_SIZE >> VIRTIO_BALLOON_PFN_SHIFT)
>  #define VIRTIO_BALLOON_ARRAY_PFNS_MAX 256
> -#define VIRTBALLOON_OOM_NOTIFY_PRIORITY 80
> +/* Maximum number of (4k) pages to deflate on OOM notifications. */
> +#define VIRTIO_BALLOON_OOM_NR_PAGES 256
> +#define VIRTIO_BALLOON_OOM_NOTIFY_PRIORITY 80
>  
>  #define VIRTIO_BALLOON_FREE_PAGE_ALLOC_FLAG (__GFP_NORETRY | __GFP_NOWARN | \
>  					     __GFP_NOMEMALLOC)
> @@ -114,9 +117,12 @@ struct virtio_balloon {
>  	/* Memory statistics */
>  	struct virtio_balloon_stat stats[VIRTIO_BALLOON_S_NR];
>  
> -	/* To register a shrinker to shrink memory upon memory pressure */
> +	/* Shrinker to return free pages - VIRTIO_BALLOON_F_FREE_PAGE_HINT */
>  	struct shrinker shrinker;
>  
> +	/* OOM notifier to deflate on OOM - VIRTIO_BALLOON_F_DEFLATE_ON_OOM */
> +	struct notifier_block oom_nb;
> +
>  	/* Free page reporting device */
>  	struct virtqueue *reporting_vq;
>  	struct page_reporting_dev_info pr_dev_info;
> @@ -830,50 +836,13 @@ static unsigned long shrink_free_pages(struct virtio_balloon *vb,
>  	return blocks_freed * VIRTIO_BALLOON_HINT_BLOCK_PAGES;
>  }
>  
> -static unsigned long leak_balloon_pages(struct virtio_balloon *vb,
> -                                          unsigned long pages_to_free)
> -{
> -	return leak_balloon(vb, pages_to_free * VIRTIO_BALLOON_PAGES_PER_PAGE) /
> -		VIRTIO_BALLOON_PAGES_PER_PAGE;
> -}
> -
> -static unsigned long shrink_balloon_pages(struct virtio_balloon *vb,
> -					  unsigned long pages_to_free)
> -{
> -	unsigned long pages_freed = 0;
> -
> -	/*
> -	 * One invocation of leak_balloon can deflate at most
> -	 * VIRTIO_BALLOON_ARRAY_PFNS_MAX balloon pages, so we call it
> -	 * multiple times to deflate pages till reaching pages_to_free.
> -	 */
> -	while (vb->num_pages && pages_freed < pages_to_free)
> -		pages_freed += leak_balloon_pages(vb,
> -						  pages_to_free - pages_freed);
> -
> -	update_balloon_size(vb);
> -
> -	return pages_freed;
> -}
> -
>  static unsigned long virtio_balloon_shrinker_scan(struct shrinker *shrinker,
>  						  struct shrink_control *sc)
>  {
> -	unsigned long pages_to_free, pages_freed = 0;
>  	struct virtio_balloon *vb = container_of(shrinker,
>  					struct virtio_balloon, shrinker);
>  
> -	pages_to_free = sc->nr_to_scan;
> -
> -	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT))
> -		pages_freed = shrink_free_pages(vb, pages_to_free);
> -
> -	if (pages_freed >= pages_to_free)
> -		return pages_freed;
> -
> -	pages_freed += shrink_balloon_pages(vb, pages_to_free - pages_freed);
> -
> -	return pages_freed;
> +	return shrink_free_pages(vb, sc->nr_to_scan);
>  }
>  
>  static unsigned long virtio_balloon_shrinker_count(struct shrinker *shrinker,
> @@ -881,12 +850,22 @@ static unsigned long virtio_balloon_shrinker_count(struct shrinker *shrinker,
>  {
>  	struct virtio_balloon *vb = container_of(shrinker,
>  					struct virtio_balloon, shrinker);
> -	unsigned long count;
>  
> -	count = vb->num_pages / VIRTIO_BALLOON_PAGES_PER_PAGE;
> -	count += vb->num_free_page_blocks * VIRTIO_BALLOON_HINT_BLOCK_PAGES;
> +	return vb->num_free_page_blocks * VIRTIO_BALLOON_HINT_BLOCK_PAGES;
> +}
> +
> +static int virtio_balloon_oom_notify(struct notifier_block *nb,
> +				     unsigned long dummy, void *parm)
> +{
> +	struct virtio_balloon *vb = container_of(nb,
> +						 struct virtio_balloon, oom_nb);
> +	unsigned long *freed = parm;
> +
> +	*freed += leak_balloon(vb, VIRTIO_BALLOON_OOM_NR_PAGES) /
> +		  VIRTIO_BALLOON_PAGES_PER_PAGE;
> +	update_balloon_size(vb);
>  
> -	return count;
> +	return NOTIFY_OK;
>  }
>  
>  static void virtio_balloon_unregister_shrinker(struct virtio_balloon *vb)
> @@ -971,7 +950,23 @@ static int virtballoon_probe(struct virtio_device *vdev)
>  						  VIRTIO_BALLOON_CMD_ID_STOP);
>  		spin_lock_init(&vb->free_page_list_lock);
>  		INIT_LIST_HEAD(&vb->free_page_list);
> +		/*
> +		 * We're allowed to reuse any free pages, even if they are
> +		 * still to be processed by the host.
> +		 */
> +		err = virtio_balloon_register_shrinker(vb);
> +		if (err)
> +			goto out_del_balloon_wq;
> +	}
> +
> +	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_DEFLATE_ON_OOM)) {
> +		vb->oom_nb.notifier_call = virtio_balloon_oom_notify;
> +		vb->oom_nb.priority = VIRTIO_BALLOON_OOM_NOTIFY_PRIORITY;
> +		err = register_oom_notifier(&vb->oom_nb);
> +		if (err < 0)
> +			goto out_unregister_shrinker;
>  	}
> +
>  	if (virtio_has_feature(vdev, VIRTIO_BALLOON_F_PAGE_POISON)) {
>  		/* Start with poison val of 0 representing general init */
>  		__u32 poison_val = 0;
> @@ -986,15 +981,6 @@ static int virtballoon_probe(struct virtio_device *vdev)
>  		virtio_cwrite(vb->vdev, struct virtio_balloon_config,
>  			      poison_val, &poison_val);
>  	}
> -	/*
> -	 * We continue to use VIRTIO_BALLOON_F_DEFLATE_ON_OOM to decide if a
> -	 * shrinker needs to be registered to relieve memory pressure.
> -	 */
> -	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_DEFLATE_ON_OOM)) {
> -		err = virtio_balloon_register_shrinker(vb);
> -		if (err)
> -			goto out_del_balloon_wq;
> -	}
>  
>  	vb->pr_dev_info.report = virtballoon_free_page_report;
>  	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_REPORTING)) {
> @@ -1003,12 +989,12 @@ static int virtballoon_probe(struct virtio_device *vdev)
>  		capacity = virtqueue_get_vring_size(vb->reporting_vq);
>  		if (capacity < PAGE_REPORTING_CAPACITY) {
>  			err = -ENOSPC;
> -			goto out_unregister_shrinker;
> +			goto out_unregister_oom;
>  		}
>  
>  		err = page_reporting_register(&vb->pr_dev_info);
>  		if (err)
> -			goto out_unregister_shrinker;
> +			goto out_unregister_oom;
>  	}
>  
>  	virtio_device_ready(vdev);
> @@ -1017,8 +1003,11 @@ static int virtballoon_probe(struct virtio_device *vdev)
>  		virtballoon_changed(vdev);
>  	return 0;
>  
> -out_unregister_shrinker:
> +out_unregister_oom:
>  	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_DEFLATE_ON_OOM))
> +		unregister_oom_notifier(&vb->oom_nb);
> +out_unregister_shrinker:
> +	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT))
>  		virtio_balloon_unregister_shrinker(vb);
>  out_del_balloon_wq:
>  	if (virtio_has_feature(vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT))
> @@ -1061,6 +1050,8 @@ static void virtballoon_remove(struct virtio_device *vdev)
>  	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_REPORTING))
>  		page_reporting_unregister(&vb->pr_dev_info);
>  	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_DEFLATE_ON_OOM))
> +		unregister_oom_notifier(&vb->oom_nb);
> +	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT))
>  		virtio_balloon_unregister_shrinker(vb);
>  	spin_lock_irq(&vb->stop_update_lock);
>  	vb->stop_update = true;
> -- 
> 2.24.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
