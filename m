Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EF91668DE
	for <lists.virtualization@lfdr.de>; Thu, 20 Feb 2020 21:48:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BA46C863DD;
	Thu, 20 Feb 2020 20:48:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hu0Cb_qvyVEa; Thu, 20 Feb 2020 20:48:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 32DA086403;
	Thu, 20 Feb 2020 20:48:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17BCAC013E;
	Thu, 20 Feb 2020 20:48:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C13B4C013E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 20:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AA8EF87678
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 20:48:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HRLpBoFwffRK
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 20:48:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6FE718742D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 20:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582231728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ehW/C4q3o/MFSLK01WJohdnOjzA4tnd/QR6FiiqgjL0=;
 b=ihUeyTOaiPQyns6nlCwZ6sB8YIhFaaLMWzQIf3SMTGDc8wZCOE962N4E8/vGpL9mNNglqV
 aK5dSbPzHj1rm/kVAeDgor4oNqLm21v/ETkEVM24Um6aY+/SqxJ/x/tSjh1sUbCy+RCIKH
 3GIq0hIjMueHxLBBV22uuMUJq2HR1yY=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-sAx9HMD7O6qA9epxvf-mkw-1; Thu, 20 Feb 2020 15:48:44 -0500
X-MC-Unique: sAx9HMD7O6qA9epxvf-mkw-1
Received: by mail-qt1-f200.google.com with SMTP id c22so3474097qtn.23
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 12:48:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ehW/C4q3o/MFSLK01WJohdnOjzA4tnd/QR6FiiqgjL0=;
 b=CYcB1LmoeCrr0mJTrKpIFKoSgr6t8/7AukXdFz4b6Eys0BllNc2ZG5/0OwBOcZKR/i
 xIIq0YMIBVRqCCFzxomsmmeCBkczPKtqaNT70QL6L89gcem6wk+RuZtM8iguXXLiqvTN
 wpneb4f/Ttr8+kwO4/Ge4LMLfw9RCoSFNvGbIlzBPkUI6k/6eKW88dr3qvSxPRhHnYeP
 SDs8yyyQ4mpV7EPYcigkmpIPZVCDbUvA7CiMuRFmCDVeI1PZ+PZPu+CzwJXPH5RyQigW
 9tdwWNGiTrUQC8MdHXmbStoArNz1pS2RoTfTrPqoRZtXrT/2YGVVr4OFhr1O2Fs5r6BN
 74TA==
X-Gm-Message-State: APjAAAVuiRtvhM10mVYaUBuci/wTsn7k1tSKIsBC9I28PodlLMrawnld
 bMmHEYFMGwdkW2vFmGcL+L4bScEUMoFTtWBxmtDY+mQgM0gNooSSviEf5f1o6UJhwh7RKcU3g47
 J+Yy73qIQnM9U6Jz+gw+Xumxtq/F+5X1CTgTkMz4tPw==
X-Received: by 2002:a05:620a:1279:: with SMTP id
 b25mr27577874qkl.385.1582231723839; 
 Thu, 20 Feb 2020 12:48:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqx8/6ncIbfogJ3gGTu5AoGgDYIF/agRj+iWjgwKDztDiB0lAfpoI0718ywEcHd9ifb45n14Hw==
X-Received: by 2002:a05:620a:1279:: with SMTP id
 b25mr27577859qkl.385.1582231723602; 
 Thu, 20 Feb 2020 12:48:43 -0800 (PST)
Received: from redhat.com (bzq-109-67-14-209.red.bezeqint.net. [109.67.14.209])
 by smtp.gmail.com with ESMTPSA id p8sm358226qtn.71.2020.02.20.12.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 12:48:42 -0800 (PST)
Date: Thu, 20 Feb 2020 15:48:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH 0/2] virtio: decouple protected guest RAM form
 VIRTIO_F_IOMMU_PLATFORM
Message-ID: <20200220154718-mutt-send-email-mst@kernel.org>
References: <20200220160606.53156-1-pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20200220160606.53156-1-pasic@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>,
 "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
 Cornelia Huck <cohuck@redhat.com>, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 iommu@lists.linux-foundation.org, David Gibson <david@gibson.dropbear.id.au>,
 Michael Mueller <mimu@linux.ibm.com>,
 Viktor Mihajlovski <mihajlov@linux.ibm.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
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

On Thu, Feb 20, 2020 at 05:06:04PM +0100, Halil Pasic wrote:
> Currently if one intends to run a memory protection enabled VM with
> virtio devices and linux as the guest OS, one needs to specify the
> VIRTIO_F_IOMMU_PLATFORM flag for each virtio device to make the guest
> linux use the DMA API, which in turn handles the memory
> encryption/protection stuff if the guest decides to turn itself into
> a protected one. This however makes no sense due to multiple reasons:
> * The device is not changed by the fact that the guest RAM is
> protected. The so called IOMMU bypass quirk is not affected.
> * This usage is not congruent with  standardised semantics of
> VIRTIO_F_IOMMU_PLATFORM. Guest memory protected is an orthogonal reason
> for using DMA API in virtio (orthogonal with respect to what is
> expressed by VIRTIO_F_IOMMU_PLATFORM). 
> 
> This series aims to decouple 'have to use DMA API because my (guest) RAM
> is protected' and 'have to use DMA API because the device told me
> VIRTIO_F_IOMMU_PLATFORM'.
> 
> Please find more detailed explanations about the conceptual aspects in
> the individual patches. There is however also a very practical problem
> that is addressed by this series. 
> 
> For vhost-net the feature VIRTIO_F_IOMMU_PLATFORM has the following side
> effect The vhost code assumes it the addresses on the virtio descriptor
> ring are not guest physical addresses but iova's, and insists on doing a
> translation of these regardless of what transport is used (e.g. whether
> we emulate a PCI or a CCW device). (For details see commit 6b1e6cc7855b
> "vhost: new device IOTLB API".) On s390 this results in severe
> performance degradation (c.a. factor 10). BTW with ccw I/O there is
> (architecturally) no IOMMU, so the whole address translation makes no
> sense in the context of virtio-ccw.

That's just a QEMU thing. It uses the same flag for VIRTIO_F_ACCESS_PLATFORM
and vhost IOTLB. QEMU can separate them, no need to change linux.


> Halil Pasic (2):
>   mm: move force_dma_unencrypted() to mem_encrypt.h
>   virtio: let virtio use DMA API when guest RAM is protected
> 
>  drivers/virtio/virtio_ring.c |  3 +++
>  include/linux/dma-direct.h   |  9 ---------
>  include/linux/mem_encrypt.h  | 10 ++++++++++
>  3 files changed, 13 insertions(+), 9 deletions(-)
> 
> 
> base-commit: ca7e1fd1026c5af6a533b4b5447e1d2f153e28f2
> -- 
> 2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
