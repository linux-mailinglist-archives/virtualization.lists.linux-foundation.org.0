Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 19603193998
	for <lists.virtualization@lfdr.de>; Thu, 26 Mar 2020 08:26:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B3CA725316;
	Thu, 26 Mar 2020 07:26:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NuxxooUpzTgc; Thu, 26 Mar 2020 07:26:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7295A22829;
	Thu, 26 Mar 2020 07:26:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4AF2DC0177;
	Thu, 26 Mar 2020 07:26:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 08D14C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 07:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E2B8287789
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 07:26:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zKpRUh6gyF27
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 07:26:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DE7F58774F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 07:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585207559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tmAet5y9Rsf9NYXP19teO+owPI4djxVX4/FYjX0fovI=;
 b=S+2qxHKYA66g8N96XFv1rhfHvFzIdV/0orn83GU9gYwT05nnOkWh4QdxsDzd35PwGi0nrE
 1lZ0tvIRAKthPUhLlupUJ+oZ+xXswhKuQHuhucYNE3RJPS6Uhip0PJbtGVsW26T1jVyMsH
 tzczgkBA7JMuYer7ZFWzIzdLfdos1r0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-iljnZYS3OU-QgpQN8xq9ZQ-1; Thu, 26 Mar 2020 03:25:57 -0400
X-MC-Unique: iljnZYS3OU-QgpQN8xq9ZQ-1
Received: by mail-wm1-f69.google.com with SMTP id y1so2087684wmj.3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 00:25:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tmAet5y9Rsf9NYXP19teO+owPI4djxVX4/FYjX0fovI=;
 b=nJmcfJ7cS9qfxRrxf1ClrPjb249EQlLlYYIbPDGESeKgycmMzZDsFbDpRYG39JUAwY
 nqY32uKHUlqeCFh3VNH7hjTpB2A9gN6VX4BGAcnZCSx/QvEocUuHIY/oCqkXVAs2gj2W
 hAzgDvkIWzsBuBWfymyrqYXGaOn18SVSnN5vzb1IAqIA3jdm0adwhQNScw6caTxZ87+5
 58W3FbPdKDMRyKk/m/KJYSab4s91+SrvwxOI/8X9dzH8A67mxhi0Ioj/+07lEyT+6fLc
 cZqxHbpibEatkqD384PgdM1LEOArH/Dwv277LztjCJz5/KLJBNoOeRTCkkikSjkLQ33/
 U+KQ==
X-Gm-Message-State: ANhLgQ2P3AgNp3EEaf0HtOJsR6pi7nlo+Alw+TXicKRfmBWwD5xBoOu9
 gVINMKiGP35UfEWwwFQD6rtTvcFqIpxiyRuH8sE8sDSk/UvZcW2ikcylvguCz0zp3XRFaC3bVhV
 vYc1RSV1hMXI2DXcHGJ1fgkp86oDlRRgd9cO7bl+Stg==
X-Received: by 2002:a1c:7d08:: with SMTP id y8mr1602169wmc.67.1585207555785;
 Thu, 26 Mar 2020 00:25:55 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtpEAwYXwXt7Kx4Cbwp2baZL8Nk8/DJVO/V8R9cbwVS/CVbXpyrfZI75a3gYBwC0lpw3ilwug==
X-Received: by 2002:a1c:7d08:: with SMTP id y8mr1602148wmc.67.1585207555488;
 Thu, 26 Mar 2020 00:25:55 -0700 (PDT)
Received: from redhat.com (bzq-79-182-20-254.red.bezeqint.net. [79.182.20.254])
 by smtp.gmail.com with ESMTPSA id c189sm2274665wmd.12.2020.03.26.00.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 00:25:54 -0700 (PDT)
Date: Thu, 26 Mar 2020 03:25:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Hui Zhu <teawater@gmail.com>
Subject: Re: [PATCH for QEMU v2] virtio-balloon: Add option cont-pages to set
 VIRTIO_BALLOON_VQ_INFLATE_CONT
Message-ID: <20200326032101-mutt-send-email-mst@kernel.org>
References: <1584893097-12317-1-git-send-email-teawater@gmail.com>
 <1584893097-12317-2-git-send-email-teawater@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1584893097-12317-2-git-send-email-teawater@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: pagupta@redhat.com, aquini@redhat.com, qemu-devel@nongnu.org,
 mojha@codeaurora.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 namit@vmware.com, Hui Zhu <teawaterz@linux.alibaba.com>,
 akpm@linux-foundation.org
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

On Mon, Mar 23, 2020 at 12:04:57AM +0800, Hui Zhu wrote:
> If the guest kernel has many fragmentation pages, use virtio_balloon
> will split THP of QEMU when it calls MADV_DONTNEED madvise to release
> the balloon pages.
> Set option cont-pages to on will open flags VIRTIO_BALLOON_VQ_INFLATE_CONT
> and set continuous pages order to THP order.
> Then It will get continuous pages PFN from VQ icvq use use madvise
> MADV_DONTNEED release the THP page.
> This will handle the THP split issue.
> 
> Signed-off-by: Hui Zhu <teawaterz@linux.alibaba.com>
> ---
>  hw/virtio/virtio-balloon.c                      | 32 +++++++++++++++++++++----
>  include/hw/virtio/virtio-balloon.h              |  4 +++-
>  include/standard-headers/linux/virtio_balloon.h |  4 ++++
>  3 files changed, 35 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index a4729f7..88bdaca 100644
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

This doesn't look right to me. I suspect this is different between
different hosts. Fixing this would also be tricky as we
might need to migrate beween two hosts with different
huge page sizes.

My proposal is to instead enhance the PartiallyBalloonedPage
machinery, teaching it to handle the case where host page
size is smaller than the supported number of subpages.


> @@ -65,7 +66,8 @@ static bool virtio_balloon_pbp_matches(PartiallyBalloonedPage *pbp,
>  
>  static void balloon_inflate_page(VirtIOBalloon *balloon,
>                                   MemoryRegion *mr, hwaddr mr_offset,
> -                                 PartiallyBalloonedPage *pbp)
> +                                 PartiallyBalloonedPage *pbp, 
> +                                 bool is_cont_pages)
>  {
>      void *addr = memory_region_get_ram_ptr(mr) + mr_offset;
>      ram_addr_t rb_offset, rb_aligned_offset, base_gpa;
> @@ -76,6 +78,13 @@ static void balloon_inflate_page(VirtIOBalloon *balloon,
>      /* XXX is there a better way to get to the RAMBlock than via a
>       * host address? */
>      rb = qemu_ram_block_from_host(addr, false, &rb_offset);
> +
> +    if (is_cont_pages) {
> +        ram_block_discard_range(rb, rb_offset,
> +                                BALLOON_PAGE_SIZE << CONT_PAGES_ORDER);
> +        return;
> +    }
> +
>      rb_page_size = qemu_ram_pagesize(rb);
>  
>      if (rb_page_size == BALLOON_PAGE_SIZE) {
> @@ -361,9 +370,10 @@ static void virtio_balloon_handle_output(VirtIODevice *vdev, VirtQueue *vq)
>              trace_virtio_balloon_handle_output(memory_region_name(section.mr),
>                                                 pa);
>              if (!qemu_balloon_is_inhibited()) {
> -                if (vq == s->ivq) {
> +                if (vq == s->ivq || vq == s->icvq) {
>                      balloon_inflate_page(s, section.mr,
> -                                         section.offset_within_region, &pbp);
> +                                         section.offset_within_region, &pbp,
> +                                         vq == s->icvq);
>                  } else if (vq == s->dvq) {
>                      balloon_deflate_page(s, section.mr, section.offset_within_region);
>                  } else {
> @@ -618,9 +628,12 @@ static size_t virtio_balloon_config_size(VirtIOBalloon *s)
>      if (s->qemu_4_0_config_size) {
>          return sizeof(struct virtio_balloon_config);
>      }
> -    if (virtio_has_feature(features, VIRTIO_BALLOON_F_PAGE_POISON)) {
> +    if (virtio_has_feature(s->host_features, VIRTIO_BALLOON_F_CONT_PAGES)) {
>          return sizeof(struct virtio_balloon_config);
>      }
> +    if (virtio_has_feature(features, VIRTIO_BALLOON_F_PAGE_POISON)) {
> +        return offsetof(struct virtio_balloon_config, pages_order);
> +    }
>      if (virtio_has_feature(features, VIRTIO_BALLOON_F_FREE_PAGE_HINT)) {
>          return offsetof(struct virtio_balloon_config, poison_val);
>      }
> @@ -646,6 +659,10 @@ static void virtio_balloon_get_config(VirtIODevice *vdev, uint8_t *config_data)
>                         cpu_to_le32(VIRTIO_BALLOON_CMD_ID_DONE);
>      }
>  
> +    if (virtio_has_feature(dev->host_features, VIRTIO_BALLOON_F_CONT_PAGES)) {
> +        config.pages_order = cpu_to_le32(CONT_PAGES_ORDER);
> +    }
> +
>      trace_virtio_balloon_get_config(config.num_pages, config.actual);
>      memcpy(config_data, &config, virtio_balloon_config_size(dev));
>  }
> @@ -816,6 +833,11 @@ static void virtio_balloon_device_realize(DeviceState *dev, Error **errp)
>              virtio_error(vdev, "iothread is missing");
>          }
>      }
> +
> +    if (virtio_has_feature(s->host_features, VIRTIO_BALLOON_F_CONT_PAGES)) {
> +        s->icvq = virtio_add_queue(vdev, 128, virtio_balloon_handle_output);
> +    }
> +
>      reset_stats(s);
>  }
>  
> @@ -916,6 +938,8 @@ static Property virtio_balloon_properties[] = {
>                      VIRTIO_BALLOON_F_DEFLATE_ON_OOM, false),
>      DEFINE_PROP_BIT("free-page-hint", VirtIOBalloon, host_features,
>                      VIRTIO_BALLOON_F_FREE_PAGE_HINT, false),
> +    DEFINE_PROP_BIT("cont-pages", VirtIOBalloon, host_features,
> +                    VIRTIO_BALLOON_F_CONT_PAGES, false),
>      /* QEMU 4.0 accidentally changed the config size even when free-page-hint
>       * is disabled, resulting in QEMU 3.1 migration incompatibility.  This
>       * property retains this quirk for QEMU 4.1 machine types.
> diff --git a/include/hw/virtio/virtio-balloon.h b/include/hw/virtio/virtio-balloon.h
> index d1c968d..61d2419 100644
> --- a/include/hw/virtio/virtio-balloon.h
> +++ b/include/hw/virtio/virtio-balloon.h
> @@ -42,7 +42,7 @@ enum virtio_balloon_free_page_report_status {
>  
>  typedef struct VirtIOBalloon {
>      VirtIODevice parent_obj;
> -    VirtQueue *ivq, *dvq, *svq, *free_page_vq;
> +    VirtQueue *ivq, *dvq, *svq, *free_page_vq, *icvq;
>      uint32_t free_page_report_status;
>      uint32_t num_pages;
>      uint32_t actual;
> @@ -70,6 +70,8 @@ typedef struct VirtIOBalloon {
>      uint32_t host_features;
>  
>      bool qemu_4_0_config_size;
> +
> +    uint32_t pages_order;
>  } VirtIOBalloon;
>  
>  #endif
> diff --git a/include/standard-headers/linux/virtio_balloon.h b/include/standard-headers/linux/virtio_balloon.h
> index 9375ca2..ee18be7 100644
> --- a/include/standard-headers/linux/virtio_balloon.h
> +++ b/include/standard-headers/linux/virtio_balloon.h
> @@ -36,6 +36,8 @@
>  #define VIRTIO_BALLOON_F_DEFLATE_ON_OOM	2 /* Deflate balloon on OOM */
>  #define VIRTIO_BALLOON_F_FREE_PAGE_HINT	3 /* VQ to report free pages */
>  #define VIRTIO_BALLOON_F_PAGE_POISON	4 /* Guest is using page poisoning */
> +#define VIRTIO_BALLOON_F_CONT_PAGES	5 /* VQ to report continuous pages */
> +
>  
>  /* Size of a PFN in the balloon interface. */
>  #define VIRTIO_BALLOON_PFN_SHIFT 12
> @@ -51,6 +53,8 @@ struct virtio_balloon_config {
>  	uint32_t free_page_report_cmd_id;
>  	/* Stores PAGE_POISON if page poisoning is in use */
>  	uint32_t poison_val;
> +	/* Pages order if VIRTIO_BALLOON_F_CONT_PAGES is set */
> +	uint32_t pages_order;
>  };
>  
>  #define VIRTIO_BALLOON_S_SWAP_IN  0   /* Amount of memory swapped in */
> -- 
> 2.7.4

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
