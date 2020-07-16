Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4819C221CB1
	for <lists.virtualization@lfdr.de>; Thu, 16 Jul 2020 08:39:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 015F08AD79;
	Thu, 16 Jul 2020 06:39:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YnGl5lBrepG9; Thu, 16 Jul 2020 06:39:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D5D878ADD2;
	Thu, 16 Jul 2020 06:39:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A49A2C0733;
	Thu, 16 Jul 2020 06:39:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B076FC0733
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 06:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A65A62042E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 06:39:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 85XL9dMGh8ho
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 06:39:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id A4E532042C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 06:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594881588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LpP0mH47EUa4gYHjkk/BxjQD6yumtpgpcOHSj9loGxE=;
 b=HF15XlECGAJ9jMqad6NFpgrJf/KR+hIzCNZeF9GzsdKrsfcod1vfeWQCVI6un1l3XPsDk0
 beYxKzbF3Wkf8UnOB+oLNgpQKaPaNeaQySE1wuyQ7pjW1oUklsxj+ZYGtlguXJmGy+tFRY
 aFmldnTk33EQxtwxrx0nKQ8y4PDKs+U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-O8N3WQNkMoWOmcSSsSOciQ-1; Thu, 16 Jul 2020 02:39:45 -0400
X-MC-Unique: O8N3WQNkMoWOmcSSsSOciQ-1
Received: by mail-wm1-f72.google.com with SMTP id g138so4217766wme.7
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 23:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LpP0mH47EUa4gYHjkk/BxjQD6yumtpgpcOHSj9loGxE=;
 b=R4T7N69l+nb51p08wiDGTv8htVte4Q6A4QIHeE53jNXoEzmbjPApDAsDoooWen8lbH
 Da3hNRBMKYVes7KHHolD5YIHza+1Hh8B0i1OJKOhKDRTC0Vecnxc3swipyI2v2UjxEyV
 37D0I6NFKlShoGwz2nS9maQLxbRkEnv/1GxjnVqjK8meqoj/FRt5gNuW0mPpleqhmfCW
 QPADJP0GRW+HraCwxA6/yYoT7BzrHROU+Uf+yLLzt5vDXMl8gZEU8QvQSkPEgIWPhvxG
 QXJFmN+YmN+W52N80s+A0lAk9SXZrVaYYQKh5znxSYpYE/pQ/s1Hy+AMfVhiVWanaOWh
 L7ow==
X-Gm-Message-State: AOAM533D3cEHJHrXfr/r3JrRzgxmORm7H7R1mum2tEU5dINL+1y8C3em
 H3zFPo4/1jWjxjhwpHsNnib2041t8S+I9kfPonurBkVxvTy1dEcgdMHQNb4GhrWhls30wOWO2/M
 M0TE05C2PsE4HW2E0IncFk2A5h8QhuLbuYoSdQPeYvw==
X-Received: by 2002:a5d:4591:: with SMTP id p17mr3460239wrq.343.1594881583716; 
 Wed, 15 Jul 2020 23:39:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3VgldvMJ2su+01++hUBPJJNqM48adq88ynHNwf0eV6ZBA8mXoC0Vsx4p+YmzOHAxQ/sH+3w==
X-Received: by 2002:a5d:4591:: with SMTP id p17mr3460225wrq.343.1594881583537; 
 Wed, 15 Jul 2020 23:39:43 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 b23sm7588607wmd.37.2020.07.15.23.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 23:39:42 -0700 (PDT)
Date: Thu, 16 Jul 2020 02:39:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Hui Zhu <teawater@gmail.com>
Subject: Re: [RFC for qemu v4 2/2] virtio_balloon: Add dcvq to deflate
 continuous pages
Message-ID: <20200716023910-mutt-send-email-mst@kernel.org>
References: <1594867315-8626-1-git-send-email-teawater@gmail.com>
 <1594867315-8626-6-git-send-email-teawater@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1594867315-8626-6-git-send-email-teawater@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: virtio-dev@lists.oasis-open.org, qemu-devel@nongnu.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, Hui Zhu <teawaterz@linux.alibaba.com>,
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

On Thu, Jul 16, 2020 at 10:41:55AM +0800, Hui Zhu wrote:
> This commit adds a vq dcvq to deflate continuous pages.
> When VIRTIO_BALLOON_F_CONT_PAGES is set, try to get continuous pages
> from icvq and use madvise MADV_WILLNEED with the pages.
> 
> Signed-off-by: Hui Zhu <teawaterz@linux.alibaba.com>

This is arguably something to benchmark. Does guest benefit
from MADV_WILLNEED or loose performance?

> ---
>  hw/virtio/virtio-balloon.c         | 14 +++++++++-----
>  include/hw/virtio/virtio-balloon.h |  2 +-
>  2 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index d36a5c8..165adf7 100644
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -138,7 +138,8 @@ static void balloon_inflate_page(VirtIOBalloon *balloon,
>  }
>  
>  static void balloon_deflate_page(VirtIOBalloon *balloon,
> -                                 MemoryRegion *mr, hwaddr mr_offset)
> +                                 MemoryRegion *mr, hwaddr mr_offset,
> +                                 size_t size)
>  {
>      void *addr = memory_region_get_ram_ptr(mr) + mr_offset;
>      ram_addr_t rb_offset;
> @@ -153,10 +154,11 @@ static void balloon_deflate_page(VirtIOBalloon *balloon,
>      rb_page_size = qemu_ram_pagesize(rb);
>  
>      host_addr = (void *)((uintptr_t)addr & ~(rb_page_size - 1));
> +    size &= ~(rb_page_size - 1);
>  
>      /* When a page is deflated, we hint the whole host page it lives
>       * on, since we can't do anything smaller */
> -    ret = qemu_madvise(host_addr, rb_page_size, QEMU_MADV_WILLNEED);
> +    ret = qemu_madvise(host_addr, size, QEMU_MADV_WILLNEED);
>      if (ret != 0) {
>          warn_report("Couldn't MADV_WILLNEED on balloon deflate: %s",
>                      strerror(errno));
> @@ -354,7 +356,7 @@ static void virtio_balloon_handle_output(VirtIODevice *vdev, VirtQueue *vq)
>              pa = (hwaddr) p << VIRTIO_BALLOON_PFN_SHIFT;
>              offset += 4;
>  
> -            if (vq == s->icvq) {
> +            if (vq == s->icvq || vq == s->dcvq) {
>                  uint32_t psize_ptr;
>                  if (iov_to_buf(elem->out_sg, elem->out_num, offset, &psize_ptr, 4) != 4) {
>                      break;
> @@ -383,8 +385,9 @@ static void virtio_balloon_handle_output(VirtIODevice *vdev, VirtQueue *vq)
>                      balloon_inflate_page(s, section.mr,
>                                           section.offset_within_region,
>                                           psize, &pbp);
> -                } else if (vq == s->dvq) {
> -                    balloon_deflate_page(s, section.mr, section.offset_within_region);
> +                } else if (vq == s->dvq || vq == s->dcvq) {
> +                    balloon_deflate_page(s, section.mr, section.offset_within_region,
> +                                         psize);
>                  } else {
>                      g_assert_not_reached();
>                  }
> @@ -838,6 +841,7 @@ static void virtio_balloon_device_realize(DeviceState *dev, Error **errp)
>  
>      if (virtio_has_feature(s->host_features, VIRTIO_BALLOON_F_CONT_PAGES)) {
>          s->icvq = virtio_add_queue(vdev, 128, virtio_balloon_handle_output);
> +        s->dcvq = virtio_add_queue(vdev, 128, virtio_balloon_handle_output);
>      }
>  
>      reset_stats(s);
> diff --git a/include/hw/virtio/virtio-balloon.h b/include/hw/virtio/virtio-balloon.h
> index 6a2514d..848a7fb 100644
> --- a/include/hw/virtio/virtio-balloon.h
> +++ b/include/hw/virtio/virtio-balloon.h
> @@ -42,7 +42,7 @@ enum virtio_balloon_free_page_report_status {
>  
>  typedef struct VirtIOBalloon {
>      VirtIODevice parent_obj;
> -    VirtQueue *ivq, *dvq, *svq, *free_page_vq, *icvq;
> +    VirtQueue *ivq, *dvq, *svq, *free_page_vq, *icvq, *dcvq;
>      uint32_t free_page_report_status;
>      uint32_t num_pages;
>      uint32_t actual;
> -- 
> 2.7.4

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
