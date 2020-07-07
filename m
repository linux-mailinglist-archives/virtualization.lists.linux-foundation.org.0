Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0A6216B38
	for <lists.virtualization@lfdr.de>; Tue,  7 Jul 2020 13:15:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8B73E87952;
	Tue,  7 Jul 2020 11:15:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yQEYg2IcQNLI; Tue,  7 Jul 2020 11:15:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AA9A887937;
	Tue,  7 Jul 2020 11:15:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78B9AC07FF;
	Tue,  7 Jul 2020 11:15:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BBC90C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 11:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AD8E92353A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 11:15:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sT8LU8sNiCyK
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 11:15:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 83F1F234AC
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 11:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594120501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2SkfEvXWOe57lsdbNZpY7pfaCzkWkPb715oD3Syj+e4=;
 b=EfSyBn27v9h4W+6aK5JTy4Fvm4OGQaL9tjSB8cHxwT7mgFjEV/XvPbdY7G5EtspbKuWsXY
 zwt/F+a4HcSEFDQUOaR6/aFCyHZfFwC2sJKFHocx2A1qL9yvF45PlqvtpLrcaXi+kHl+uw
 Ch1/JhSbgqYZY88edJvQBgdiQCfQ7ko=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-fLwwbSmLMa-Q1xdmgVoDqQ-1; Tue, 07 Jul 2020 07:14:56 -0400
X-MC-Unique: fLwwbSmLMa-Q1xdmgVoDqQ-1
Received: by mail-wr1-f72.google.com with SMTP id c6so29153571wru.7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 07 Jul 2020 04:14:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2SkfEvXWOe57lsdbNZpY7pfaCzkWkPb715oD3Syj+e4=;
 b=j46LaPaoygiPWd8eobcIbXmrkIRu0e86Sdr0nmaMBQFayJPa4jNayeL6J8TaLnChEZ
 kJvR3oZZlPgVfB/CLO/rV/g1RA/SaRhuZSwPOk4cCfHL0+vbVRBkmkGOA/dSv35380sF
 HlUJ5o8DoIGWmZnZPATijrZnveY4QrFugixC1vdqsl47jU3557v/ifp1W1kCt/yLqkMT
 AbIfQJ6dyVAc4z2RVLGbmbSzWF8m1/DNIsi3WCV+0wb+3bJbBadKsETbYWRAin4t8dyQ
 CgtP0UYfb91+r/pkxcSVHlMzxWleS8lVjXzAADMMgdelPFw4vx3qhAFfJxZGUX+uT9oz
 Q8Qw==
X-Gm-Message-State: AOAM530FhAAg5x8XjcMl/zAaihw+JrtwezhtRwkvCKz6EVxYwgkd7nJa
 ik+nxEgv9skoRM+BnnGCNVx2ZjCkI7yR4DK2dVmE7T5/88clNRrX5SaUZpXYQya6xL4QUmGoBTV
 8Yyq07bQQaPm2fzjLQif58kIEng/coD3qnKtU2guqvw==
X-Received: by 2002:adf:de01:: with SMTP id b1mr52165612wrm.305.1594120495882; 
 Tue, 07 Jul 2020 04:14:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfrgQVHW0xPEz2qK4WxsyK5VqMd4mfiVNX7Uo+QjneR39/UAS7kA8HbpUGWt9XZF4TGRAOtA==
X-Received: by 2002:adf:de01:: with SMTP id b1mr52165596wrm.305.1594120495667; 
 Tue, 07 Jul 2020 04:14:55 -0700 (PDT)
Received: from redhat.com (bzq-79-182-109-139.red.bezeqint.net.
 [79.182.109.139])
 by smtp.gmail.com with ESMTPSA id 92sm597206wrr.96.2020.07.07.04.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 04:14:54 -0700 (PDT)
Date: Tue, 7 Jul 2020 07:14:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v4 2/2] s390: virtio: PV needs VIRTIO I/O device protection
Message-ID: <20200707060838-mutt-send-email-mst@kernel.org>
References: <1594111477-15401-1-git-send-email-pmorel@linux.ibm.com>
 <1594111477-15401-3-git-send-email-pmorel@linux.ibm.com>
 <20200707114633.68122a00.cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200707114633.68122a00.cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: gor@linux.ibm.com, linux-s390@vger.kernel.org, frankja@linux.ibm.com,
 Pierre Morel <pmorel@linux.ibm.com>, thomas.lendacky@amd.com,
 heiko.carstens@de.ibm.com, linuxram@us.ibm.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, kvm@vger.kernel.org, david@gibson.dropbear.id.au
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

On Tue, Jul 07, 2020 at 11:46:33AM +0200, Cornelia Huck wrote:
> On Tue,  7 Jul 2020 10:44:37 +0200
> Pierre Morel <pmorel@linux.ibm.com> wrote:
> 
> > S390, protecting the guest memory against unauthorized host access
> > needs to enforce VIRTIO I/O device protection through the use of
> > VIRTIO_F_VERSION_1 and VIRTIO_F_IOMMU_PLATFORM.
> 
> Hm... what about:
> 
> "If protected virtualization is active on s390, the virtio queues are
> not accessible to the host, unless VIRTIO_F_IOMMU_PLATFORM has been
> negotiated. Use the new arch_validate_virtio_features() interface to
> enforce this."

s/enforce this/fail probe if that's not the case, preventing a host error on access attempt/



> > 
> > Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> > ---
> >  arch/s390/kernel/uv.c | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> > 
> > diff --git a/arch/s390/kernel/uv.c b/arch/s390/kernel/uv.c
> > index c296e5c8dbf9..106330f6eda1 100644
> > --- a/arch/s390/kernel/uv.c
> > +++ b/arch/s390/kernel/uv.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/memblock.h>
> >  #include <linux/pagemap.h>
> >  #include <linux/swap.h>
> > +#include <linux/virtio_config.h>
> >  #include <asm/facility.h>
> >  #include <asm/sections.h>
> >  #include <asm/uv.h>
> > @@ -413,3 +414,27 @@ static int __init uv_info_init(void)
> >  }
> >  device_initcall(uv_info_init);
> >  #endif
> > +
> > +/*
> > + * arch_validate_virtio_iommu_platform
> 
> s/arch_validate_virtio_iommu_platform/arch_validate_virtio_features/
> 
> > + * @dev: the VIRTIO device being added
> > + *
> > + * Return value: returns -ENODEV if any features of the
> > + *               device breaks the protected virtualization
> > + *               0 otherwise.
> 
> I don't think you need to specify the contract here: that belongs to
> the definition in the virtio core. What about simply adding a sentence
> "Return an error if required features are missing on a guest running
> with protected virtualization." ?
> 
> > + */
> > +int arch_validate_virtio_features(struct virtio_device *dev)
> > +{
> 
> Maybe jump out immediately if the guest is not protected?
> 
> > +	if (!virtio_has_feature(dev, VIRTIO_F_VERSION_1)) {
> > +		dev_warn(&dev->dev, "device must provide VIRTIO_F_VERSION_1\n");
> > +		return is_prot_virt_guest() ? -ENODEV : 0;
> > +	}
> > +
> > +	if (!virtio_has_feature(dev, VIRTIO_F_IOMMU_PLATFORM)) {
> > +		dev_warn(&dev->dev,
> > +			 "device must provide VIRTIO_F_IOMMU_PLATFORM\n");
> > +		return is_prot_virt_guest() ? -ENODEV : 0;
> > +	}
> 
> if (!is_prot_virt_guest())
> 	return 0;
> 
> if (!virtio_has_feature(dev, VIRTIO_F_VERSION_1)) {
> 	dev_warn(&dev->dev,
>                  "legacy virtio is incompatible with protected guests");
> 	return -ENODEV;
> }
> 
> if (!virtio_has_feature(dev, VIRTIO_F_IOMMU_PLATFORM)) {
> 	dev_warn(&dev->dev,
> 		 "device does not work with limited memory access in protected guests");
> 	return -ENODEV;
> }
> 
> > +
> > +	return 0;
> > +}

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
