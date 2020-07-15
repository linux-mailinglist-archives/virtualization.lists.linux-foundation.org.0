Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 28673220931
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 11:50:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 97B648ADEE;
	Wed, 15 Jul 2020 09:50:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kMjor7RNUUby; Wed, 15 Jul 2020 09:50:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 78ED08AFC7;
	Wed, 15 Jul 2020 09:50:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4F818C0733;
	Wed, 15 Jul 2020 09:50:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9BAAC0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A5A5D8AB6E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:50:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6CcLvhvm08GR
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:50:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id ED28C8AB66
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594806626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ydFttueMnB9QE50pbDSZfOaR6o6M8obgxaWHaidDG2Q=;
 b=JsBG/JoarJjE3JQ323TT1hl+KmO+sc9Ws1cUt9TjQYpiNr2CRtB76zAxu8GuT1JqaSImBJ
 NaA3NIo0eIfMJy2ZGywoZDx4acMZwpO7zZBPVT2y5XgYZZ55F4/emuFYjL5fqVa6hBQXFv
 d6j85TyY93c2D9uQmrrNgMnHPlIfHZY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-T4ae8KyiN1eghbELxIKDnA-1; Wed, 15 Jul 2020 05:50:24 -0400
X-MC-Unique: T4ae8KyiN1eghbELxIKDnA-1
Received: by mail-wr1-f69.google.com with SMTP id w4so681691wrm.5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 02:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ydFttueMnB9QE50pbDSZfOaR6o6M8obgxaWHaidDG2Q=;
 b=RTTHpfAFfFBCG3j3DlajYrSZJH2pLGNX3/Xt0RynNmaRn1FejdeuT/+bjO4hSuyrxv
 YzqHuLyC9h0IhdUW8LxlOVV2chmOWODeBFvKyZ96tJOW886jRpPyW6FQx7LnAcs4KYTq
 E8mCyYkmXuw7X9uWtoxgworeEY2RtXhi/aLAsAFOoI6C1KiGVXMXDEsaTNI7iukPpf+8
 4FDmkrU0YXxFXuFpMfuxKcP6Jp1n73VrBCnkH+nludzzx5gsWnPM5eazmlkCw7wt0Pfu
 F85Fqv1lTwUag8XO1M7b49+zMMhIIChCltr8iJ3pDxt59CPuqEePCzYo3htFpAvHgbb9
 5oJg==
X-Gm-Message-State: AOAM531Yp0KD8tkutn5KAMLy56tdtKtCMQSDzjdXmKBjEsS0NqhCupTS
 FYXgTUeoS9ogBvGOxEJw4P/zKuxgGmdkT674tj56rYAmnwm1viNxAOSYrOnCgkyOgBGEbirp3ZB
 rPHNpL81YrnZoxC43FvatZrwvSTgDkZ4szhX34WEVkQ==
X-Received: by 2002:a5d:4607:: with SMTP id t7mr11055296wrq.251.1594806623782; 
 Wed, 15 Jul 2020 02:50:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw20b6gyhY20GeUJvuPDUu72KPwVkCnwFQFKSJcxw9a/Ovrygxf08Gs5s2zyW8+HvaG4R7Z8Q==
X-Received: by 2002:a5d:4607:: with SMTP id t7mr11055275wrq.251.1594806623576; 
 Wed, 15 Jul 2020 02:50:23 -0700 (PDT)
Received: from redhat.com (bzq-79-180-10-140.red.bezeqint.net. [79.180.10.140])
 by smtp.gmail.com with ESMTPSA id 14sm2563305wmk.19.2020.07.15.02.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 02:50:22 -0700 (PDT)
Date: Wed, 15 Jul 2020 05:50:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH v7 2/2] s390: virtio: PV needs VIRTIO I/O device protection
Message-ID: <20200715054807-mutt-send-email-mst@kernel.org>
References: <1594801869-13365-1-git-send-email-pmorel@linux.ibm.com>
 <1594801869-13365-3-git-send-email-pmorel@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <1594801869-13365-3-git-send-email-pmorel@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: gor@linux.ibm.com, linux-s390@vger.kernel.org, frankja@linux.ibm.com,
 kvm@vger.kernel.org, thomas.lendacky@amd.com, cohuck@redhat.com,
 linuxram@us.ibm.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, hca@linux.ibm.com, david@gibson.dropbear.id.au
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

On Wed, Jul 15, 2020 at 10:31:09AM +0200, Pierre Morel wrote:
> If protected virtualization is active on s390, the virtio queues are
> not accessible to the host, unless VIRTIO_F_IOMMU_PLATFORM has been
> negotiated. Use the new arch_validate_virtio_features() interface to
> fail probe if that's not the case, preventing a host error on access
> attempt.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> Acked-by: Halil Pasic <pasic@linux.ibm.com>
> Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
> ---
>  arch/s390/mm/init.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
> index 6dc7c3b60ef6..d39af6554d4f 100644
> --- a/arch/s390/mm/init.c
> +++ b/arch/s390/mm/init.c
> @@ -45,6 +45,7 @@
>  #include <asm/kasan.h>
>  #include <asm/dma-mapping.h>
>  #include <asm/uv.h>
> +#include <linux/virtio_config.h>
>  
>  pgd_t swapper_pg_dir[PTRS_PER_PGD] __section(.bss..swapper_pg_dir);
>  
> @@ -161,6 +162,33 @@ bool force_dma_unencrypted(struct device *dev)
>  	return is_prot_virt_guest();
>  }
>  
> +/*
> + * arch_validate_virtio_features
> + * @dev: the VIRTIO device being added
> + *
> + * Return an error if required features are missing on a guest running
> + * with protected virtualization.
> + */
> +int arch_validate_virtio_features(struct virtio_device *dev)
> +{
> +	if (!is_prot_virt_guest())
> +		return 0;
> +
> +	if (!virtio_has_feature(dev, VIRTIO_F_VERSION_1)) {
> +		dev_warn(&dev->dev,
> +			 "legacy virtio not supported with protected virtualization\n");
> +		return -ENODEV;
> +	}
> +
> +	if (!virtio_has_feature(dev, VIRTIO_F_IOMMU_PLATFORM)) {
> +		dev_warn(&dev->dev,
> +			 "support for limited memory access required for protected virtualization\n");
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +
>  /* protected virtualization */
>  static void pv_init(void)
>  {

What bothers me here is that arch code depends on virtio now.
It works even with a modular virtio when functions are inline,
but it seems fragile: e.g. it breaks virtio as an out of tree module,
since layout of struct virtio_device can change.

I'm not sure what to do with this yet, will try to think about it
over the weekend. Thanks!


> -- 
> 2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
