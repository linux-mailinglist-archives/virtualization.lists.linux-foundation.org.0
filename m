Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B53D1D1B3B
	for <lists.virtualization@lfdr.de>; Wed, 13 May 2020 18:37:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A9DE684E24;
	Wed, 13 May 2020 16:37:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yMmQoCF6FL2c; Wed, 13 May 2020 16:37:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 808FA86DAF;
	Wed, 13 May 2020 16:37:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60DE2C016F;
	Wed, 13 May 2020 16:37:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3E8C8C016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 16:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3875288305
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 16:37:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mog2mq2JeXTM
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 16:37:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 985E688291
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 16:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589387843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=I8lzKK8Jo0TQLW03XcH79VW77ealySF8rgICQY7WKtg=;
 b=EOllfu/Ljv7UmQLbp0EovJ+neAgB74fvi816pHFNTNc2pgSPQYVZafgQQw1AOAicWdOi+W
 Igyahx2oX8E0LVZqT3cjTbFr13eqEral3CBakj7WtTwTcY6Z/G5RblSukxxpIUTU599tXZ
 DEGpiAm7yoQE+vY+Hg/eh5WQ8w9KL2s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-q4pa4wchPsSYxCQOKRQGEA-1; Wed, 13 May 2020 12:37:18 -0400
X-MC-Unique: q4pa4wchPsSYxCQOKRQGEA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2FCB835B5A;
 Wed, 13 May 2020 16:37:16 +0000 (UTC)
Received: from [10.36.114.88] (ovpn-114-88.ams2.redhat.com [10.36.114.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD29D605FC;
 Wed, 13 May 2020 16:37:10 +0000 (UTC)
Subject: Re: [RFC v3 for QEMU] virtio-balloon: Add option cont-pages to set
 VIRTIO_BALLOON_VQ_INFLATE_CONT
To: Hui Zhu <teawater@gmail.com>, mst@redhat.com, jasowang@redhat.com,
 akpm@linux-foundation.org, xdeguillard@vmware.com, namit@vmware.com,
 gregkh@linuxfoundation.org, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, qemu-devel@nongnu.org,
 virtio-dev@lists.oasis-open.org
References: <1589276501-16026-1-git-send-email-teawater@gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <0e7c29be-dd2c-dd95-6f2e-a009c530ffb1@redhat.com>
Date: Wed, 13 May 2020 18:37:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1589276501-16026-1-git-send-email-teawater@gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: wei.guo.simon@linux.alibaba.com, qixuan.wu@linux.alibaba.com,
 Hui Zhu <teawaterz@linux.alibaba.com>
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

On 12.05.20 11:41, Hui Zhu wrote:

This description needs an overhaul, it's hard to parse.

> If the guest kernel has many fragmentation pages, use virtio_balloon
> will split THP of QEMU when it calls MADV_DONTNEED madvise to release
> the balloon pages.

This is very unclear and confusing. You will *always* split THPs when
inflating 4k pages and there are THPs around. This is completely
independent of any fragmentation in the guest. The thing you are trying
to achieve here is trying to *minimize* the number of split THPs in the
hypervisor *after* the balloon was completely inflated.

> Set option cont-pages to on will open flags VIRTIO_BALLOON_VQ_INFLATE_CONT
> and set default continuous pages order to THP order.

... and what you implement here is very x86 specific, hard-coding the
"9" as THP order.

"Set option cont-pages to on" -> 'Once the feature is enabled via
"cont-pages=on"'
"open flags" -> "unlock VIRTIO_BALLOON_VQ_INFLATE_CONT".


> Then It will get continuous pages PFN that its order is current_pages_order
> from VQ ivq use use madvise MADV_DONTNEED release the page.

I fail to parse this sentence. I assume something like

"current_pages_order is set by the guest and configures the size of the
pages communicated via the inflate/deflate queue by the guest. It
defaults to 0, which corresponds to the legacy handling without
VIRTIO_BALLOON_VQ_INFLATE_CONT - 4k pages."

Why is "max_pages_order" necessary *at all*? You never check against that.

I have to say, I really dislike that interface. I would much rather
prefer new inflate/deflate queues that eat variable sizes (not orders!)
- similar to the free page reporting interface - and skip things like
the pbp. Not sure if this interface is really what MST asked for.

> This will handle the THP split issue.
> 
> Signed-off-by: Hui Zhu <teawaterz@linux.alibaba.com>
> ---
>  hw/virtio/virtio-balloon.c                      | 77 +++++++++++++++++--------
>  include/hw/virtio/virtio-balloon.h              |  2 +
>  include/standard-headers/linux/virtio_balloon.h |  5 ++
>  3 files changed, 60 insertions(+), 24 deletions(-)
> 
> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index a4729f7..84d47d3 100644
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -34,6 +34,7 @@
>  #include "hw/virtio/virtio-access.h"
>  
>  #define BALLOON_PAGE_SIZE  (1 << VIRTIO_BALLOON_PFN_SHIFT)
> +#define CONT_PAGES_ORDER   9
>  
>  typedef struct PartiallyBalloonedPage {
>      ram_addr_t base_gpa;
> @@ -72,6 +73,8 @@ static void balloon_inflate_page(VirtIOBalloon *balloon,
>      RAMBlock *rb;
>      size_t rb_page_size;
>      int subpages;
> +    size_t inflate_size = BALLOON_PAGE_SIZE << balloon->current_pages_order;
> +    int pages_num;

reverse christmas tree please. squash same types into a single line if
possible.

>  
>      /* XXX is there a better way to get to the RAMBlock than via a
>       * host address? */
> @@ -81,7 +84,7 @@ static void balloon_inflate_page(VirtIOBalloon *balloon,
>      if (rb_page_size == BALLOON_PAGE_SIZE) {
>          /* Easy case */
>  
> -        ram_block_discard_range(rb, rb_offset, rb_page_size);
> +        ram_block_discard_range(rb, rb_offset, inflate_size);
>          /* We ignore errors from ram_block_discard_range(), because it
>           * has already reported them, and failing to discard a balloon
>           * page is not fatal */
> @@ -99,32 +102,38 @@ static void balloon_inflate_page(VirtIOBalloon *balloon,
>  
>      rb_aligned_offset = QEMU_ALIGN_DOWN(rb_offset, rb_page_size);
>      subpages = rb_page_size / BALLOON_PAGE_SIZE;
> -    base_gpa = memory_region_get_ram_addr(mr) + mr_offset -
> -               (rb_offset - rb_aligned_offset);
>  
> -    if (pbp->bitmap && !virtio_balloon_pbp_matches(pbp, base_gpa)) {
> -        /* We've partially ballooned part of a host page, but now
> -         * we're trying to balloon part of a different one.  Too hard,
> -         * give up on the old partial page */
> -        virtio_balloon_pbp_free(pbp);
> -    }
> +    for (pages_num = inflate_size / BALLOON_PAGE_SIZE;
> +         pages_num > 0; pages_num--) {
> +        base_gpa = memory_region_get_ram_addr(mr) + mr_offset -
> +                   (rb_offset - rb_aligned_offset);
>  
> -    if (!pbp->bitmap) {
> -        virtio_balloon_pbp_alloc(pbp, base_gpa, subpages);
> -    }
> +        if (pbp->bitmap && !virtio_balloon_pbp_matches(pbp, base_gpa)) {
> +            /* We've partially ballooned part of a host page, but now
> +            * we're trying to balloon part of a different one.  Too hard,
> +            * give up on the old partial page */
> +            virtio_balloon_pbp_free(pbp);
> +        }
>  
> -    set_bit((rb_offset - rb_aligned_offset) / BALLOON_PAGE_SIZE,
> -            pbp->bitmap);
> +        if (!pbp->bitmap) {
> +            virtio_balloon_pbp_alloc(pbp, base_gpa, subpages);
> +        }
>  
> -    if (bitmap_full(pbp->bitmap, subpages)) {
> -        /* We've accumulated a full host page, we can actually discard
> -         * it now */
> +        set_bit((rb_offset - rb_aligned_offset) / BALLOON_PAGE_SIZE,
> +                pbp->bitmap);
>  
> -        ram_block_discard_range(rb, rb_aligned_offset, rb_page_size);
> -        /* We ignore errors from ram_block_discard_range(), because it
> -         * has already reported them, and failing to discard a balloon
> -         * page is not fatal */
> -        virtio_balloon_pbp_free(pbp);
> +        if (bitmap_full(pbp->bitmap, subpages)) {
> +            /* We've accumulated a full host page, we can actually discard
> +            * it now */
> +
> +            ram_block_discard_range(rb, rb_aligned_offset, rb_page_size);
> +            /* We ignore errors from ram_block_discard_range(), because it
> +            * has already reported them, and failing to discard a balloon
> +            * page is not fatal */
> +            virtio_balloon_pbp_free(pbp);
> +        }
> +
> +        mr_offset += BALLOON_PAGE_SIZE;
>      }
>  }
>  
> @@ -345,7 +354,7 @@ static void virtio_balloon_handle_output(VirtIODevice *vdev, VirtQueue *vq)
>              offset += 4;
>  
>              section = memory_region_find(get_system_memory(), pa,
> -                                         BALLOON_PAGE_SIZE);
> +                                BALLOON_PAGE_SIZE << s->current_pages_order);
>              if (!section.mr) {
>                  trace_virtio_balloon_bad_addr(pa);
>                  continue;
> @@ -618,9 +627,12 @@ static size_t virtio_balloon_config_size(VirtIOBalloon *s)
>      if (s->qemu_4_0_config_size) {
>          return sizeof(struct virtio_balloon_config);
>      }
> -    if (virtio_has_feature(features, VIRTIO_BALLOON_F_PAGE_POISON)) {
> +    if (virtio_has_feature(s->host_features, VIRTIO_BALLOON_F_CONT_PAGES)) {
>          return sizeof(struct virtio_balloon_config);
>      }
> +    if (virtio_has_feature(features, VIRTIO_BALLOON_F_PAGE_POISON)) {
> +        return offsetof(struct virtio_balloon_config, current_pages_order);
> +    }
>      if (virtio_has_feature(features, VIRTIO_BALLOON_F_FREE_PAGE_HINT)) {
>          return offsetof(struct virtio_balloon_config, poison_val);
>      }
> @@ -646,6 +658,11 @@ static void virtio_balloon_get_config(VirtIODevice *vdev, uint8_t *config_data)
>                         cpu_to_le32(VIRTIO_BALLOON_CMD_ID_DONE);
>      }
>  
> +    if (virtio_has_feature(dev->host_features, VIRTIO_BALLOON_F_CONT_PAGES)) {
> +        config.max_pages_order = cpu_to_le32(CONT_PAGES_ORDER);
> +        config.current_pages_order = cpu_to_le32(dev->current_pages_order);
> +    }
> +
>      trace_virtio_balloon_get_config(config.num_pages, config.actual);
>      memcpy(config_data, &config, virtio_balloon_config_size(dev));
>  }
> @@ -693,6 +710,9 @@ static void virtio_balloon_set_config(VirtIODevice *vdev,
>  
>      memcpy(&config, config_data, virtio_balloon_config_size(dev));
>      dev->actual = le32_to_cpu(config.actual);
> +    if (virtio_has_feature(dev->host_features, VIRTIO_BALLOON_F_CONT_PAGES)) {
> +        dev->current_pages_order = le32_to_cpu(config.current_pages_order);
> +    }
>      if (dev->actual != oldactual) {
>          qapi_event_send_balloon_change(vm_ram_size -
>                          ((ram_addr_t) dev->actual << VIRTIO_BALLOON_PFN_SHIFT));
> @@ -816,6 +836,13 @@ static void virtio_balloon_device_realize(DeviceState *dev, Error **errp)
>              virtio_error(vdev, "iothread is missing");
>          }
>      }
> +
> +    if (virtio_has_feature(s->host_features, VIRTIO_BALLOON_F_CONT_PAGES)) {
> +        s->current_pages_order = CONT_PAGES_ORDER;
> +    } else {
> +        s->current_pages_order = 0;
> +    }
> +
>      reset_stats(s);
>  }
>  
> @@ -916,6 +943,8 @@ static Property virtio_balloon_properties[] = {
>                      VIRTIO_BALLOON_F_DEFLATE_ON_OOM, false),
>      DEFINE_PROP_BIT("free-page-hint", VirtIOBalloon, host_features,
>                      VIRTIO_BALLOON_F_FREE_PAGE_HINT, false),
> +    DEFINE_PROP_BIT("cont-pages", VirtIOBalloon, host_features,
> +                    VIRTIO_BALLOON_F_CONT_PAGES, false),
>      /* QEMU 4.0 accidentally changed the config size even when free-page-hint
>       * is disabled, resulting in QEMU 3.1 migration incompatibility.  This
>       * property retains this quirk for QEMU 4.1 machine types.
> diff --git a/include/hw/virtio/virtio-balloon.h b/include/hw/virtio/virtio-balloon.h
> index d1c968d..e0dce0d 100644
> --- a/include/hw/virtio/virtio-balloon.h
> +++ b/include/hw/virtio/virtio-balloon.h
> @@ -70,6 +70,8 @@ typedef struct VirtIOBalloon {
>      uint32_t host_features;
>  
>      bool qemu_4_0_config_size;
> +
> +    uint32_t current_pages_order;
>  } VirtIOBalloon;
>  
>  #endif
> diff --git a/include/standard-headers/linux/virtio_balloon.h b/include/standard-headers/linux/virtio_balloon.h
> index 9375ca2..b5386ce 100644
> --- a/include/standard-headers/linux/virtio_balloon.h
> +++ b/include/standard-headers/linux/virtio_balloon.h
> @@ -36,6 +36,7 @@
>  #define VIRTIO_BALLOON_F_DEFLATE_ON_OOM	2 /* Deflate balloon on OOM */
>  #define VIRTIO_BALLOON_F_FREE_PAGE_HINT	3 /* VQ to report free pages */
>  #define VIRTIO_BALLOON_F_PAGE_POISON	4 /* Guest is using page poisoning */
> +#define VIRTIO_BALLOON_F_CONT_PAGES	6 /* VQ to report continuous pages */
>  
>  /* Size of a PFN in the balloon interface. */
>  #define VIRTIO_BALLOON_PFN_SHIFT 12
> @@ -51,6 +52,10 @@ struct virtio_balloon_config {
>  	uint32_t free_page_report_cmd_id;
>  	/* Stores PAGE_POISON if page poisoning is in use */
>  	uint32_t poison_val;
> +	/* Max pages order if VIRTIO_BALLOON_F_CONT_PAGES is set */
> +	uint32_t max_pages_order;
> +	/* Current pages order if VIRTIO_BALLOON_F_CONT_PAGES is set */
> +	uint32_t current_pages_order;
>  };
>  
>  #define VIRTIO_BALLOON_S_SWAP_IN  0   /* Amount of memory swapped in */
> 


-- 
Thanks,

David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
