Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 69862182B24
	for <lists.virtualization@lfdr.de>; Thu, 12 Mar 2020 09:25:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0F70622767;
	Thu, 12 Mar 2020 08:25:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IwYO+LH7Epir; Thu, 12 Mar 2020 08:25:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 437A5226CA;
	Thu, 12 Mar 2020 08:25:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27641C0177;
	Thu, 12 Mar 2020 08:25:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6D565C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Mar 2020 08:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6197B226CA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Mar 2020 08:25:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6KALdAvKue8S
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Mar 2020 08:25:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 37DE820398
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Mar 2020 08:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584001519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UqiBqBozQZrKbpqb6fps1Ub+53xZKmdnmK5P35tZZ6M=;
 b=RP56JGh0A5TITUXl3gMd+dX5JFOWxaYEEdepM5X9ak64QoyXZGqeOmUvpkomLKiTiKWB3m
 C5ru6nzc3LAcccjB+ynY4R2e4rUZtNpGHuvC0o1blMOQiAy+C5lrkmhuqsfKoRySMwNs39
 tJD6aAHIP0gq/YYWXgfGzVntR16NbNw=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-I3fdZi_uNqWAypNa_7vLdg-1; Thu, 12 Mar 2020 04:25:15 -0400
X-MC-Unique: I3fdZi_uNqWAypNa_7vLdg-1
Received: by mail-qt1-f197.google.com with SMTP id c13so2956406qtq.23
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Mar 2020 01:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UqiBqBozQZrKbpqb6fps1Ub+53xZKmdnmK5P35tZZ6M=;
 b=fIukLcWmiNZGicmNaBqhWWCZLsvqwPsLUJ4Pb5nhkROceniCOYsKHksZfT0PQFxvCi
 QTat6KA7GtBdBhXEzXgTC9fT+1GB+a/uuCWOliyfOFv0mx4IMsS/lE1QyTX0eOFodisF
 CfAig4WTffphIQW8W4v6fRjATuEp1874rbM76H2va/VFRkfkTrNTSjfNlAYPkxXsU07a
 2sWLSV9Yk9Ruz6QSyMGQJf3vqLb2mnS+Uxt/FiRr2Zez8EFwZglkFJGOxB7u3Qeg9vPF
 3fWH+AFc4D20Hb4KtWioTAJApYzU8JDJnh58B1q9h1DFd5KINB2mR1QbsFgZw7tJBh1n
 ihGA==
X-Gm-Message-State: ANhLgQ0yV0+R49PJWAZ9AroVnOqINnGCYX0bU39q3quQYWgmFKjLlFFN
 dnuT9awNcVfRZByj8nRmYpAQnlqQpt0TtIaHWdmMGLISBiwxvxLsN3TjBfQ8C2u34XihUdh54sm
 089BQlHLiEuZBecFUOA8p0Og3o8/Smez8JWfTSlvTDw==
X-Received: by 2002:a37:6215:: with SMTP id w21mr6548596qkb.149.1584001514433; 
 Thu, 12 Mar 2020 01:25:14 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vunTOq0UJjwugXSegnRqEyiS9dlQvVqcZDLsJQHR9PIHKEvp8WKkpEby0VCBTZybNkeotxyBA==
X-Received: by 2002:a37:6215:: with SMTP id w21mr6548575qkb.149.1584001514073; 
 Thu, 12 Mar 2020 01:25:14 -0700 (PDT)
Received: from redhat.com (bzq-79-178-2-19.red.bezeqint.net. [79.178.2.19])
 by smtp.gmail.com with ESMTPSA id 82sm10496917qkd.62.2020.03.12.01.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2020 01:25:13 -0700 (PDT)
Date: Thu, 12 Mar 2020 04:25:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Hui Zhu <teawater@gmail.com>
Subject: Re: [RFC for QEMU] virtio-balloon: Add option thp-order to set
 VIRTIO_BALLOON_F_THP_ORDER
Message-ID: <20200312042340-mutt-send-email-mst@kernel.org>
References: <1583999395-9131-1-git-send-email-teawater@gmail.com>
 <1583999395-9131-2-git-send-email-teawater@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1583999395-9131-2-git-send-email-teawater@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: pagupta@redhat.com, qemu-devel@nongnu.org, mojha@codeaurora.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
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

On Thu, Mar 12, 2020 at 03:49:55PM +0800, Hui Zhu wrote:
> If the guest kernel has many fragmentation pages, use virtio_balloon
> will split THP of QEMU when it calls MADV_DONTNEED madvise to release
> the balloon pages.
> Set option thp-order to on will open flags VIRTIO_BALLOON_F_THP_ORDER.
> It will set balloon size to THP size to handle the THP split issue.
> 
> Signed-off-by: Hui Zhu <teawaterz@linux.alibaba.com>

What's wrong with just using the PartiallyBalloonedPage machinery
instead? That would make it guest transparent.

> ---
>  hw/virtio/virtio-balloon.c                      | 67 ++++++++++++++++---------
>  include/standard-headers/linux/virtio_balloon.h |  4 ++
>  2 files changed, 47 insertions(+), 24 deletions(-)
> 
> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index a4729f7..cfe86b0 100644
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -340,37 +340,49 @@ static void virtio_balloon_handle_output(VirtIODevice *vdev, VirtQueue *vq)
>          while (iov_to_buf(elem->out_sg, elem->out_num, offset, &pfn, 4) == 4) {
>              unsigned int p = virtio_ldl_p(vdev, &pfn);
>              hwaddr pa;
> +            size_t handle_size = BALLOON_PAGE_SIZE;
>  
>              pa = (hwaddr) p << VIRTIO_BALLOON_PFN_SHIFT;
>              offset += 4;
>  
> -            section = memory_region_find(get_system_memory(), pa,
> -                                         BALLOON_PAGE_SIZE);
> -            if (!section.mr) {
> -                trace_virtio_balloon_bad_addr(pa);
> -                continue;
> -            }
> -            if (!memory_region_is_ram(section.mr) ||
> -                memory_region_is_rom(section.mr) ||
> -                memory_region_is_romd(section.mr)) {
> -                trace_virtio_balloon_bad_addr(pa);
> -                memory_region_unref(section.mr);
> -                continue;
> -            }
> +            if (virtio_has_feature(s->host_features,
> +                                   VIRTIO_BALLOON_F_THP_ORDER))
> +                handle_size = BALLOON_PAGE_SIZE << VIRTIO_BALLOON_THP_ORDER;
> +
> +            while (handle_size > 0) {
> +                section = memory_region_find(get_system_memory(), pa,
> +                                             BALLOON_PAGE_SIZE);
> +                if (!section.mr) {
> +                    trace_virtio_balloon_bad_addr(pa);
> +                    continue;
> +                }
> +                if (!memory_region_is_ram(section.mr) ||
> +                    memory_region_is_rom(section.mr) ||
> +                    memory_region_is_romd(section.mr)) {
> +                    trace_virtio_balloon_bad_addr(pa);
> +                    memory_region_unref(section.mr);
> +                    continue;
> +                }
>  
> -            trace_virtio_balloon_handle_output(memory_region_name(section.mr),
> -                                               pa);
> -            if (!qemu_balloon_is_inhibited()) {
> -                if (vq == s->ivq) {
> -                    balloon_inflate_page(s, section.mr,
> -                                         section.offset_within_region, &pbp);
> -                } else if (vq == s->dvq) {
> -                    balloon_deflate_page(s, section.mr, section.offset_within_region);
> -                } else {
> -                    g_assert_not_reached();
> +                trace_virtio_balloon_handle_output(memory_region_name(section.mr),
> +                                                   pa);
> +                if (!qemu_balloon_is_inhibited()) {
> +                    if (vq == s->ivq) {
> +                        balloon_inflate_page(s, section.mr,
> +                                             section.offset_within_region,
> +                                             &pbp);
> +                    } else if (vq == s->dvq) {
> +                        balloon_deflate_page(s, section.mr,
> +                                             section.offset_within_region);
> +                    } else {
> +                        g_assert_not_reached();
> +                    }
>                  }
> +                memory_region_unref(section.mr);
> +
> +                pa += BALLOON_PAGE_SIZE;
> +                handle_size -= BALLOON_PAGE_SIZE;
>              }
> -            memory_region_unref(section.mr);
>          }
>  
>          virtqueue_push(vq, elem, offset);
> @@ -693,6 +705,8 @@ static void virtio_balloon_set_config(VirtIODevice *vdev,
>  
>      memcpy(&config, config_data, virtio_balloon_config_size(dev));
>      dev->actual = le32_to_cpu(config.actual);
> +    if (virtio_has_feature(vdev->host_features, VIRTIO_BALLOON_F_THP_ORDER))
> +        dev->actual <<= VIRTIO_BALLOON_THP_ORDER;
>      if (dev->actual != oldactual) {
>          qapi_event_send_balloon_change(vm_ram_size -
>                          ((ram_addr_t) dev->actual << VIRTIO_BALLOON_PFN_SHIFT));
> @@ -728,6 +742,9 @@ static void virtio_balloon_to_target(void *opaque, ram_addr_t target)
>      }
>      if (target) {
>          dev->num_pages = (vm_ram_size - target) >> VIRTIO_BALLOON_PFN_SHIFT;
> +        if (virtio_has_feature(dev->host_features,
> +                               VIRTIO_BALLOON_F_THP_ORDER))
> +            dev->num_pages >>= VIRTIO_BALLOON_THP_ORDER;
>          virtio_notify_config(vdev);
>      }
>      trace_virtio_balloon_to_target(target, dev->num_pages);
> @@ -916,6 +933,8 @@ static Property virtio_balloon_properties[] = {
>                      VIRTIO_BALLOON_F_DEFLATE_ON_OOM, false),
>      DEFINE_PROP_BIT("free-page-hint", VirtIOBalloon, host_features,
>                      VIRTIO_BALLOON_F_FREE_PAGE_HINT, false),
> +    DEFINE_PROP_BIT("thp-order", VirtIOBalloon, host_features,
> +                    VIRTIO_BALLOON_F_THP_ORDER, false),
>      /* QEMU 4.0 accidentally changed the config size even when free-page-hint
>       * is disabled, resulting in QEMU 3.1 migration incompatibility.  This
>       * property retains this quirk for QEMU 4.1 machine types.
> diff --git a/include/standard-headers/linux/virtio_balloon.h b/include/standard-headers/linux/virtio_balloon.h
> index 9375ca2..f54d613 100644
> --- a/include/standard-headers/linux/virtio_balloon.h
> +++ b/include/standard-headers/linux/virtio_balloon.h
> @@ -36,10 +36,14 @@
>  #define VIRTIO_BALLOON_F_DEFLATE_ON_OOM	2 /* Deflate balloon on OOM */
>  #define VIRTIO_BALLOON_F_FREE_PAGE_HINT	3 /* VQ to report free pages */
>  #define VIRTIO_BALLOON_F_PAGE_POISON	4 /* Guest is using page poisoning */
> +#define VIRTIO_BALLOON_F_THP_ORDER	5 /* Set balloon page order to thp order */
>  
>  /* Size of a PFN in the balloon interface. */
>  #define VIRTIO_BALLOON_PFN_SHIFT 12
>  
> +/* The order of the balloon page */
> +#define VIRTIO_BALLOON_THP_ORDER 9
> +
>  #define VIRTIO_BALLOON_CMD_ID_STOP	0
>  #define VIRTIO_BALLOON_CMD_ID_DONE	1
>  struct virtio_balloon_config {
> -- 
> 2.7.4

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
