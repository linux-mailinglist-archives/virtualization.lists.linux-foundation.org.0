Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CFE1F374C
	for <lists.virtualization@lfdr.de>; Tue,  9 Jun 2020 11:53:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CB14C86DDB;
	Tue,  9 Jun 2020 09:53:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rsTmWhzTUDgW; Tue,  9 Jun 2020 09:53:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5A5D186E40;
	Tue,  9 Jun 2020 09:53:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41257C016F;
	Tue,  9 Jun 2020 09:53:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1702EC016F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Jun 2020 09:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 04CCB86E40
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Jun 2020 09:53:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qr-M_U5iyMgf
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Jun 2020 09:53:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9A71986DDB
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Jun 2020 09:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591696389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oMvGLtRSljs2Zi0kyxH/VTEK52jN8HKOE/cbjLGX1jw=;
 b=aBjhOjczUO39UzGvq8Ze7ZUbWq5WxTXhDZgBNsA4TpLC30SM1JwTJdCRXJzEIgEdded1i2
 GnBSTJxQ1uFAWE5Ld9mkflQGXAsGI2Z4mvwvGjR66/abrl69AiR4yJ4U5K55pNZ7sXWnPy
 iX5SvrfAyQ9nuQSrx1YckAqpkhlshYY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-inQMdQYzOIK_VnBDEF5dSA-1; Tue, 09 Jun 2020 05:53:03 -0400
X-MC-Unique: inQMdQYzOIK_VnBDEF5dSA-1
Received: by mail-wr1-f70.google.com with SMTP id l18so8445849wrm.0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 09 Jun 2020 02:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oMvGLtRSljs2Zi0kyxH/VTEK52jN8HKOE/cbjLGX1jw=;
 b=NqVrz06H5JPAIqtUc/8Dvbw9hb95LR82VrCK+bddSTPHI7K3rXNHzwSQ6aQiKu1ki4
 fAGRslOU1C5UnOPKCO12RhsEIoXhGV+oM2sxuZG5HKEYqQc4NH/UPx9kBxbK08syLLe1
 g8/LPT4qgVwXT5tL7p2Jtgxl40CNw4+QOZhahryZvDrb7pL1BjLlOvacmlIPbA4HHwQ2
 GYmea3C15Ykm/d1P2IwUX5vYFMv+H424BI7vNoE0cO5i/VdAqbgRs9JWBn2pBFRre4fm
 /UeI8Y0wFExeiWWZPRGHaq1NsjiTUuVEF6/wxphfiBCrVLfmQZWHOMrUlZtSJHn06VMh
 geyw==
X-Gm-Message-State: AOAM532DiHToE6lwe1+jBIRuzUI/bfu/F8N/ZHX2CmJbC7KTxz+Dda9n
 5FmSC9IZZFR2Upi2ZhUiX52UjAw9Qw3LxegFQmzVRL+66ETSc5xsCmI8+ibKMTrcqbF4w6sAUb5
 BqOcNzdXVVhfXtrfhNrAOsFluB1lW9smDAK1kIjwvqg==
X-Received: by 2002:a5d:6b8c:: with SMTP id n12mr3491101wrx.61.1591696382277; 
 Tue, 09 Jun 2020 02:53:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTG/Rft+RF7BlhKs9JeSNR5jpou7mamttZASGBrZIBust8+KQxMGXJalHNlqYd1izJlcOHBg==
X-Received: by 2002:a5d:6b8c:: with SMTP id n12mr3491075wrx.61.1591696382101; 
 Tue, 09 Jun 2020 02:53:02 -0700 (PDT)
Received: from redhat.com (bzq-79-181-55-232.red.bezeqint.net. [79.181.55.232])
 by smtp.gmail.com with ESMTPSA id 67sm2834452wrk.49.2020.06.09.02.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 02:53:01 -0700 (PDT)
Date: Tue, 9 Jun 2020 05:52:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v5 0/3] Support virtio cross-device resources
Message-ID: <20200609055021-mutt-send-email-mst@kernel.org>
References: <20200609012518.198908-1-stevensd@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200609012518.198908-1-stevensd@chromium.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: dri-devel@lists.freedesktop.org, virtio-dev@lists.oasis-open.org,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
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

On Tue, Jun 09, 2020 at 10:25:15AM +0900, David Stevens wrote:
> This patchset implements the current proposal for virtio cross-device
> resource sharing [1]. It will be used to import virtio resources into
> the virtio-video driver currently under discussion [2]. The patch
> under consideration to add support in the virtio-video driver is [3].
> It uses the APIs from v3 of this series, but the changes to update it
> are relatively minor.
> 
> This patchset adds a new flavor of dma-bufs that supports querying the
> underlying virtio object UUID, as well as adding support for exporting
> resources from virtgpu.

Gerd, David, if possible, please test this in configuration with
virtual VTD enabled but with iommu_platform=off
to make sure we didn't break this config.


Besides that, for virtio parts:

Acked-by: Michael S. Tsirkin <mst@redhat.com>


> [1] https://markmail.org/thread/2ypjt5cfeu3m6lxu
> [2] https://markmail.org/thread/p5d3k566srtdtute
> [3] https://markmail.org/thread/j4xlqaaim266qpks
> 
> v4 -> v5 changes:
>  - Remove virtio_dma_buf_export_info.
> 
> David Stevens (3):
>   virtio: add dma-buf support for exported objects
>   virtio-gpu: add VIRTIO_GPU_F_RESOURCE_UUID feature
>   drm/virtio: Support virtgpu exported resources
> 
>  drivers/gpu/drm/virtio/virtgpu_drv.c   |  3 +
>  drivers/gpu/drm/virtio/virtgpu_drv.h   | 20 ++++++
>  drivers/gpu/drm/virtio/virtgpu_kms.c   |  4 ++
>  drivers/gpu/drm/virtio/virtgpu_prime.c | 96 +++++++++++++++++++++++++-
>  drivers/gpu/drm/virtio/virtgpu_vq.c    | 55 +++++++++++++++
>  drivers/virtio/Makefile                |  2 +-
>  drivers/virtio/virtio.c                |  6 ++
>  drivers/virtio/virtio_dma_buf.c        | 82 ++++++++++++++++++++++
>  include/linux/virtio.h                 |  1 +
>  include/linux/virtio_dma_buf.h         | 37 ++++++++++
>  include/uapi/linux/virtio_gpu.h        | 19 +++++
>  11 files changed, 321 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/virtio/virtio_dma_buf.c
>  create mode 100644 include/linux/virtio_dma_buf.h
> 
> -- 
> 2.27.0.278.ge193c7cf3a9-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
