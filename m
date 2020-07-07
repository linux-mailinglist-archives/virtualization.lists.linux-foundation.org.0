Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C92C216969
	for <lists.virtualization@lfdr.de>; Tue,  7 Jul 2020 11:46:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C28D087648;
	Tue,  7 Jul 2020 09:46:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ym5B3cvc0fop; Tue,  7 Jul 2020 09:46:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4EE3687647;
	Tue,  7 Jul 2020 09:46:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 293B3C016F;
	Tue,  7 Jul 2020 09:46:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 87951C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 09:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 60ACA8990C
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 09:46:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yathQ8iiVM4U
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 09:46:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8278F898F6
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 09:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594115206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=paElSljDoi/kRmElIyCEk5zdeibZul3cFtMLCVBiU6A=;
 b=BVEslWn7sf5c89KoPkivL5w65yIWXBhlWHh+0Lvyp2e09vhqMtHKHnsPxlstXYXv5q4usf
 qxSuzlVeJPO8r+iJGxpS//BbBX74ayr0lSbm6GKDFVfZakelVIsNMkcdjoL05urrR4plAt
 XWW2dS8g3NzF6YCpswPUQSyqH4+C0Ik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-vebczNtdNi-q_vVha5qWyw-1; Tue, 07 Jul 2020 05:46:44 -0400
X-MC-Unique: vebczNtdNi-q_vVha5qWyw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4893461;
 Tue,  7 Jul 2020 09:46:42 +0000 (UTC)
Received: from gondolin (ovpn-113-54.ams2.redhat.com [10.36.113.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 943B160CC0;
 Tue,  7 Jul 2020 09:46:36 +0000 (UTC)
Date: Tue, 7 Jul 2020 11:46:33 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH v4 2/2] s390: virtio: PV needs VIRTIO I/O device protection
Message-ID: <20200707114633.68122a00.cohuck@redhat.com>
In-Reply-To: <1594111477-15401-3-git-send-email-pmorel@linux.ibm.com>
References: <1594111477-15401-1-git-send-email-pmorel@linux.ibm.com>
 <1594111477-15401-3-git-send-email-pmorel@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: gor@linux.ibm.com, linux-s390@vger.kernel.org, frankja@linux.ibm.com,
 kvm@vger.kernel.org, mst@redhat.com, heiko.carstens@de.ibm.com,
 linuxram@us.ibm.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, thomas.lendacky@amd.com, david@gibson.dropbear.id.au
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

On Tue,  7 Jul 2020 10:44:37 +0200
Pierre Morel <pmorel@linux.ibm.com> wrote:

> S390, protecting the guest memory against unauthorized host access
> needs to enforce VIRTIO I/O device protection through the use of
> VIRTIO_F_VERSION_1 and VIRTIO_F_IOMMU_PLATFORM.

Hm... what about:

"If protected virtualization is active on s390, the virtio queues are
not accessible to the host, unless VIRTIO_F_IOMMU_PLATFORM has been
negotiated. Use the new arch_validate_virtio_features() interface to
enforce this."

> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>  arch/s390/kernel/uv.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/s390/kernel/uv.c b/arch/s390/kernel/uv.c
> index c296e5c8dbf9..106330f6eda1 100644
> --- a/arch/s390/kernel/uv.c
> +++ b/arch/s390/kernel/uv.c
> @@ -14,6 +14,7 @@
>  #include <linux/memblock.h>
>  #include <linux/pagemap.h>
>  #include <linux/swap.h>
> +#include <linux/virtio_config.h>
>  #include <asm/facility.h>
>  #include <asm/sections.h>
>  #include <asm/uv.h>
> @@ -413,3 +414,27 @@ static int __init uv_info_init(void)
>  }
>  device_initcall(uv_info_init);
>  #endif
> +
> +/*
> + * arch_validate_virtio_iommu_platform

s/arch_validate_virtio_iommu_platform/arch_validate_virtio_features/

> + * @dev: the VIRTIO device being added
> + *
> + * Return value: returns -ENODEV if any features of the
> + *               device breaks the protected virtualization
> + *               0 otherwise.

I don't think you need to specify the contract here: that belongs to
the definition in the virtio core. What about simply adding a sentence
"Return an error if required features are missing on a guest running
with protected virtualization." ?

> + */
> +int arch_validate_virtio_features(struct virtio_device *dev)
> +{

Maybe jump out immediately if the guest is not protected?

> +	if (!virtio_has_feature(dev, VIRTIO_F_VERSION_1)) {
> +		dev_warn(&dev->dev, "device must provide VIRTIO_F_VERSION_1\n");
> +		return is_prot_virt_guest() ? -ENODEV : 0;
> +	}
> +
> +	if (!virtio_has_feature(dev, VIRTIO_F_IOMMU_PLATFORM)) {
> +		dev_warn(&dev->dev,
> +			 "device must provide VIRTIO_F_IOMMU_PLATFORM\n");
> +		return is_prot_virt_guest() ? -ENODEV : 0;
> +	}

if (!is_prot_virt_guest())
	return 0;

if (!virtio_has_feature(dev, VIRTIO_F_VERSION_1)) {
	dev_warn(&dev->dev,
                 "legacy virtio is incompatible with protected guests");
	return -ENODEV;
}

if (!virtio_has_feature(dev, VIRTIO_F_IOMMU_PLATFORM)) {
	dev_warn(&dev->dev,
		 "device does not work with limited memory access in protected guests");
	return -ENODEV;
}

> +
> +	return 0;
> +}

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
