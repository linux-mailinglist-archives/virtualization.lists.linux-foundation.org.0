Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2615320CFFF
	for <lists.virtualization@lfdr.de>; Mon, 29 Jun 2020 18:09:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BF7D6204F2;
	Mon, 29 Jun 2020 16:09:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uJ72wvMX04kH; Mon, 29 Jun 2020 16:09:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0132E2042C;
	Mon, 29 Jun 2020 16:09:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E09C0C016E;
	Mon, 29 Jun 2020 16:09:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 20CC1C016E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 16:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0F83F86420
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 16:09:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A9w+xlfOhYzT
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 16:09:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3B1BB8160B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 16:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593446949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EKk9x1ZzFjGFJjDTJMw2AVFBxkCLtkiGAK1b50FnpyI=;
 b=MQhk68rViQSXM6nGglm/kulwNN+jd43bBnc3aK8OyA90t3JDGQxuy/i/8EOHguIiIu5uXz
 Wth8P5NziWytl3fkBl4UURDL/9uLutUYCq6jsey+LBaM310tTOQzObNfFIa0tGUrZ51DKB
 gKjPOywQATs+Y3JP2mObEAG6So58oCk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-EV31XtLwNseluMQ_cYfUEA-1; Mon, 29 Jun 2020 12:09:07 -0400
X-MC-Unique: EV31XtLwNseluMQ_cYfUEA-1
Received: by mail-wr1-f71.google.com with SMTP id f5so16631533wrv.22
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 09:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EKk9x1ZzFjGFJjDTJMw2AVFBxkCLtkiGAK1b50FnpyI=;
 b=tE0sbK1qiCaCwwDPYrI7y47d4YikNpoHtmNT9THFVmt6NzFonPEKr9uMDnB6+Z+ar2
 fump8ecPrPwcoEHtq6rPJYUpuzCm7Bm+Uarqx7DwYAQBFqpOYcMQgc//CnmYs1KoP5IK
 vwSXFUOZ8twgI59m+Y5KnGR0fkWADUfS/kBa6J0qv19giaiSFVkdLIR2wp539/plVxK7
 HzNs5bvIhQIEnpeMej49xQITgUbFIjRqd3nfynCv2hNlZrtZ0JL+bVf2V5S21rMWA1Uc
 3fcypo4hHs8NLhErNyKbUdrrg4ByhNmo4Rbb1MZIq4z8YOp/mFpxL2P3vNWnPIUH0VBe
 QaEA==
X-Gm-Message-State: AOAM533NleexRtzbG3grzbdNyQ0xhs+tsFAAsVj0h85uXXhSy/yMb0La
 Vl0Rs2SwfcxcPXU4b7OX8Rk1DTpZ9SHzAPuanRuhPkv0kc29mXHknhFo6/CncxmrqYbWX+wf4a5
 r4VgttBb+LYQ3qxWXfa8AvE9W3+cAdvzsuZ6PXNz2BA==
X-Received: by 2002:adf:b6a4:: with SMTP id j36mr17963497wre.260.1593446946504; 
 Mon, 29 Jun 2020 09:09:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDXOCSXxSQZMNZVOBwszvdjERPP6yUs2xp6RZO8HYxWfEU+82mznJ8Ra2CRJJQ8FwgVwFeLw==
X-Received: by 2002:adf:b6a4:: with SMTP id j36mr17963478wre.260.1593446946277; 
 Mon, 29 Jun 2020 09:09:06 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 j6sm274496wma.25.2020.06.29.09.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 09:09:05 -0700 (PDT)
Date: Mon, 29 Jun 2020 12:09:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH v3 1/1] s390: virtio: let arch accept devices without
 IOMMU feature
Message-ID: <20200629115952-mutt-send-email-mst@kernel.org>
References: <1592390637-17441-1-git-send-email-pmorel@linux.ibm.com>
 <1592390637-17441-2-git-send-email-pmorel@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <1592390637-17441-2-git-send-email-pmorel@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: gor@linux.ibm.com, linux-s390@vger.kernel.org, frankja@linux.ibm.com,
 kvm@vger.kernel.org, thomas.lendacky@amd.com, heiko.carstens@de.ibm.com,
 cohuck@redhat.com, linuxram@us.ibm.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, david@gibson.dropbear.id.au
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

On Wed, Jun 17, 2020 at 12:43:57PM +0200, Pierre Morel wrote:
> An architecture protecting the guest memory against unauthorized host
> access may want to enforce VIRTIO I/O device protection through the
> use of VIRTIO_F_IOMMU_PLATFORM.
> Let's give a chance to the architecture to accept or not devices
> without VIRTIO_F_IOMMU_PLATFORM.

I agree it's a bit misleading. Protection is enforced by memory
encryption, you can't trust the hypervisor to report the bit correctly
so using that as a securoty measure would be pointless.
The real gain here is that broken configs are easier to
debug.

Here's an attempt at a better description:

	On some architectures, guest knows that VIRTIO_F_IOMMU_PLATFORM is
	required for virtio to function: e.g. this is the case on s390 protected
	virt guests, since otherwise guest passes encrypted guest memory to devices,
	which the device can't read. Without VIRTIO_F_IOMMU_PLATFORM the
	result is that affected memory (or even a whole page containing
	it is corrupted). Detect and fail probe instead - that is easier
	to debug.

however, now that we have described what it is (hypervisor
misconfiguration) I ask a question: can we be sure this will never
ever work? E.g. what if some future hypervisor gains ability to
access the protected guest memory in some abstractly secure manner?
We are blocking this here, and it's hard to predict the future,
and a broken hypervisor can always find ways to crash the guest ...

IMHO it would be safer to just print a warning.
What do you think?



> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> Acked-by: Jason Wang <jasowang@redhat.com>
> Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
> ---
>  arch/s390/mm/init.c     |  6 ++++++
>  drivers/virtio/virtio.c | 22 ++++++++++++++++++++++
>  include/linux/virtio.h  |  2 ++
>  3 files changed, 30 insertions(+)
> 
> diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
> index 6dc7c3b60ef6..215070c03226 100644
> --- a/arch/s390/mm/init.c
> +++ b/arch/s390/mm/init.c
> @@ -45,6 +45,7 @@
>  #include <asm/kasan.h>
>  #include <asm/dma-mapping.h>
>  #include <asm/uv.h>
> +#include <linux/virtio.h>
>  
>  pgd_t swapper_pg_dir[PTRS_PER_PGD] __section(.bss..swapper_pg_dir);
>  
> @@ -161,6 +162,11 @@ bool force_dma_unencrypted(struct device *dev)
>  	return is_prot_virt_guest();
>  }
>  
> +int arch_needs_virtio_iommu_platform(struct virtio_device *dev)
> +{
> +	return is_prot_virt_guest();
> +}
> +
>  /* protected virtualization */
>  static void pv_init(void)
>  {
> diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> index a977e32a88f2..aa8e01104f86 100644
> --- a/drivers/virtio/virtio.c
> +++ b/drivers/virtio/virtio.c
> @@ -167,6 +167,21 @@ void virtio_add_status(struct virtio_device *dev, unsigned int status)
>  }
>  EXPORT_SYMBOL_GPL(virtio_add_status);
>  
> +/*
> + * arch_needs_virtio_iommu_platform - provide arch specific hook when finalizing
> + *				      features for VIRTIO device dev
> + * @dev: the VIRTIO device being added
> + *
> + * Permits the platform to provide architecture specific functionality when
> + * devices features are finalized. This is the default implementation.
> + * Architecture implementations can override this.
> + */
> +
> +int __weak arch_needs_virtio_iommu_platform(struct virtio_device *dev)
> +{
> +	return 0;
> +}
> +
>  int virtio_finalize_features(struct virtio_device *dev)
>  {
>  	int ret = dev->config->finalize_features(dev);
> @@ -179,6 +194,13 @@ int virtio_finalize_features(struct virtio_device *dev)
>  	if (!virtio_has_feature(dev, VIRTIO_F_VERSION_1))
>  		return 0;
>  
> +	if (arch_needs_virtio_iommu_platform(dev) &&
> +		!virtio_has_feature(dev, VIRTIO_F_IOMMU_PLATFORM)) {
> +		dev_warn(&dev->dev,
> +			 "virtio: device must provide VIRTIO_F_IOMMU_PLATFORM\n");
> +		return -ENODEV;
> +	}
> +
>  	virtio_add_status(dev, VIRTIO_CONFIG_S_FEATURES_OK);
>  	status = dev->config->get_status(dev);
>  	if (!(status & VIRTIO_CONFIG_S_FEATURES_OK)) {
> diff --git a/include/linux/virtio.h b/include/linux/virtio.h
> index a493eac08393..e8526ae3463e 100644
> --- a/include/linux/virtio.h
> +++ b/include/linux/virtio.h
> @@ -195,4 +195,6 @@ void unregister_virtio_driver(struct virtio_driver *drv);
>  #define module_virtio_driver(__virtio_driver) \
>  	module_driver(__virtio_driver, register_virtio_driver, \
>  			unregister_virtio_driver)
> +
> +int arch_needs_virtio_iommu_platform(struct virtio_device *dev);
>  #endif /* _LINUX_VIRTIO_H */
> -- 
> 2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
