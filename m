Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEB143858A
	for <lists.virtualization@lfdr.de>; Sat, 23 Oct 2021 23:31:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD147400EF;
	Sat, 23 Oct 2021 21:31:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DOMfw1cXO102; Sat, 23 Oct 2021 21:31:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4DFC340164;
	Sat, 23 Oct 2021 21:31:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D6B46C000E;
	Sat, 23 Oct 2021 21:31:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 221DDC000E
 for <virtualization@lists.linux-foundation.org>;
 Sat, 23 Oct 2021 21:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFA5460654
 for <virtualization@lists.linux-foundation.org>;
 Sat, 23 Oct 2021 21:31:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QFaGUocjeq7i
 for <virtualization@lists.linux-foundation.org>;
 Sat, 23 Oct 2021 21:31:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F0206061D
 for <virtualization@lists.linux-foundation.org>;
 Sat, 23 Oct 2021 21:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635024691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UvbR/cosDB5PzrAtt66M/Vg3Eshkd4GIz0r0Njwdz8U=;
 b=VuFPmF+oeQ5le9gPFdz5Ba+NCL8otqFQkAZb74+GibhI9x5SKwKeHRmLZ8aE6UO42ImJSw
 5dVS7gFLjA/hUAhRqQxeabS9CnSUpq7YjGpVBpDZry0ppwvUKdu+uMJsiIWtVBdeM5QvwQ
 HzIzIKWdLK34zGHFSpfZDXyXAPCtxkM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-MU6UajoyNwW4uOJWvnWHKw-1; Sat, 23 Oct 2021 17:31:30 -0400
X-MC-Unique: MU6UajoyNwW4uOJWvnWHKw-1
Received: by mail-wm1-f69.google.com with SMTP id
 b81-20020a1c8054000000b0032c9d428b7fso2443915wmd.3
 for <virtualization@lists.linux-foundation.org>;
 Sat, 23 Oct 2021 14:31:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UvbR/cosDB5PzrAtt66M/Vg3Eshkd4GIz0r0Njwdz8U=;
 b=ht0Ys+Yh9JJ9vH5Aaw2lFrREhZLS3WlkJziiMqfD1pi0B3xwZ+tNTZmaTYDMiYdhvA
 Vh+LN6l4sZCeZfBKDvlQLbLWxXeE/sHSFl1+Px4h/tpvN97H/brn6ZGzd5pewtrMm2H5
 gRTV7H05s9vMKQnztpIXlWNqo/yZ19RC/JqTwC20r5ZA0XYXhWUDD8BFv7gMIfxDUDpg
 tc5tiSlib8sPgj9abO6MGXC2RkQtvx2FP0Wc8j0KpLK5foKYEPgrlouijQONhuRrivrD
 nabedNOg9MavtehqSVrPlB0U4bVsqoCLTxIX64X9UWwtBpNsEJEf5mJhw6/iX8ZtR6mS
 8JyQ==
X-Gm-Message-State: AOAM533TRCeIbVQrRWauXM+d8RzeFTWvOapVdKawdm/ep4vZS+U3OGQx
 MLyI7atYhwWkj0nR6NcZuMeiOPIwXx5HmgPdSMJFFRUEugYQzyeqBlZ9LxRz+pVGm6QYmtAxfcM
 KsObdCEdK5Isegc+lIpsnoZCEicDc/QshnM/GITT/Pw==
X-Received: by 2002:a5d:64cf:: with SMTP id f15mr10114801wri.40.1635024689031; 
 Sat, 23 Oct 2021 14:31:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1y608WZP9aSEm5XfV1q3IHejO+vI46FGmfXRmW672lUt8njZVZ9QYtKy9AW221jJLoqdo5w==
X-Received: by 2002:a5d:64cf:: with SMTP id f15mr10114785wri.40.1635024688881; 
 Sat, 23 Oct 2021 14:31:28 -0700 (PDT)
Received: from redhat.com ([2.55.9.147])
 by smtp.gmail.com with ESMTPSA id c15sm11597358wrs.19.2021.10.23.14.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 14:31:27 -0700 (PDT)
Date: Sat, 23 Oct 2021 17:31:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V3 00/10] More virtio hardening
Message-ID: <20211023171627-mutt-send-email-mst@kernel.org>
References: <20211019070152.8236-1-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211019070152.8236-1-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: konrad.wilk@oracle.com, f.hetzelt@tu-berlin.de,
 linux-kernel@vger.kernel.org, david.kaplan@amd.com,
 virtualization@lists.linux-foundation.org
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

On Tue, Oct 19, 2021 at 03:01:42PM +0800, Jason Wang wrote:
> Hi All:
> 
> This series treis to do more hardening for virito.

OK. So patches 7-10 caused a crash in virtio-blk.
I'm close to sure it's patch 10 actually, and forcing
validation seems to fix the crash.
I also suspect it has something to do with the fact that
blk submits requests in the middle of the probe function.

picked up 1-6 for now.


> patch 1 validates the num_queues for virio-blk device.
> patch 2 validates max_nr_ports for virito-console device.
> patch 3-5 harden virtio-pci interrupts to make sure no exepcted
> interrupt handler is tiggered. If this makes sense we can do similar
> things in other transport drivers.
> patch 6-7 validate used ring length.
> patch 8-10 let the driver to validate the used length instead of the
> virtio core when possible.
> 
> Smoking test on blk/net with packed=on/off and iommu_platform=on/off.
> 
> Please review.
> 
> Changes since V2:
> - don't validate max_nr_ports in .validate()
> - fail the probe instead of trying to work when blk/console returns
>   invalid number of queues/ports
> - use READ_ONCE() instead of smp_load_acquire() for checking
>   intx_soft_enabled
> - use "suppress_used_validation" instead of "validate_used"
> 
> Changes since V1:
> - fix and document the memory ordering around the intx_soft_enabled
>   when enabling and disabling INTX interrupt
> - for the driver that can validate the used length, virtio core
>   won't even try to allocate auxilary arrays and validate the used length
> - tweak the commit log
> - fix typos
> 
> Jason Wang (10):
>   virtio-blk: validate num_queues during probe
>   virtio_console: validate max_nr_ports before trying to use it
>   virtio_config: introduce a new .enable_cbs method
>   virtio_pci: harden MSI-X interrupts
>   virtio-pci: harden INTX interrupts
>   virtio_ring: fix typos in vring_desc_extra
>   virtio_ring: validate used buffer length
>   virtio-net: don't let virtio core to validate used length
>   virtio-blk: don't let virtio core to validate used length
>   virtio-scsi: don't let virtio core to validate used buffer length
> 
>  drivers/block/virtio_blk.c         |  5 +++
>  drivers/char/virtio_console.c      |  9 +++++
>  drivers/net/virtio_net.c           |  1 +
>  drivers/scsi/virtio_scsi.c         |  1 +
>  drivers/virtio/virtio_pci_common.c | 48 ++++++++++++++++++++----
>  drivers/virtio/virtio_pci_common.h |  7 +++-
>  drivers/virtio/virtio_pci_legacy.c |  5 ++-
>  drivers/virtio/virtio_pci_modern.c |  6 ++-
>  drivers/virtio/virtio_ring.c       | 60 +++++++++++++++++++++++++++++-
>  include/linux/virtio.h             |  2 +
>  include/linux/virtio_config.h      |  6 +++
>  11 files changed, 135 insertions(+), 15 deletions(-)
> 
> -- 
> 2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
