Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 505591669E7
	for <lists.virtualization@lfdr.de>; Thu, 20 Feb 2020 22:33:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E328187610;
	Thu, 20 Feb 2020 21:33:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e6B+cKZIJKeA; Thu, 20 Feb 2020 21:33:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DDB73875AD;
	Thu, 20 Feb 2020 21:33:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1C8FC013E;
	Thu, 20 Feb 2020 21:33:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49247C013E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 21:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3240F20378
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 21:33:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d-oGRv13JPIl
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 21:33:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 67BF81FEE0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 21:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582234425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4krYsiGh4Qek2SxgzuI/KbmEgksVX0a4JTAhD8CZkok=;
 b=i7KIDtT2qzdeIwMS+kdn6IK52lTALdEjC6u6zrd+LdWkpf3nqi5gn3luBkzwAhm9gtJDzu
 NscLpGEswyyFnrtTbuAorD8wtz3Ig0n1jgs27oJG4RJB4k4cGkPcQz35Ex3I9zzLKSGy0H
 hIXgpbJBSWKHSpBLWyfBPgBSVFH84nE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-lidI0CsxNb-3SttHvBEnXw-1; Thu, 20 Feb 2020 16:33:43 -0500
Received: by mail-qt1-f199.google.com with SMTP id c8so76080qte.22
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 13:33:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4krYsiGh4Qek2SxgzuI/KbmEgksVX0a4JTAhD8CZkok=;
 b=SMHZWCdYrYgpJiAM2Ob8eRgJBTK2anP5HiJRIMW2COYnaaRnuuf2Pu7xegrzDJNS3p
 g2VJowklqPmyFy0xwnAHtbRpqD48Sczv9DzIWd0EW7ligeRJ1OTNWDbiRr4GpkbE5aU2
 Nc6Rn1xxFjy7GodRFGQ3U7z2UmF0wRHRQa2hiNeRtdEtT6y08Ejv4mqxhSCjBTBe5gD9
 gyHzDHw1kpRS9FwNCnSTkU427OV9B0q5cJVthJCUbmCyYovRlDOs0KCAF2IZCn7nE8Ja
 UlpxUqHBkhZSP7E4yRLSxbKUASUXe8T/OVvR4VOPJBSXcNDu8Y9z8jtsepm2h9ogqkjD
 rAXw==
X-Gm-Message-State: APjAAAVJEkqvqDLDJO6bZFRXkTMU8e+61FilyeHqYWJchl0IJCrVTH6I
 v/a2wU/LC5SlSUL9N/uE3B628aK6W1YxhDdvOOJVnYRM0Y12wwPI6efp8OrLT9RkARo3hfjWFWD
 khIwEpUP4LUtFXz7Gp6X5QT/DYDJPAJVniT9CtAayfw==
X-Received: by 2002:ac8:4886:: with SMTP id i6mr27992250qtq.160.1582234423179; 
 Thu, 20 Feb 2020 13:33:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqykw+sIvY+6jifxdk4U8bBDoR068zA6NinyMfSe1te1gvQyzZNHuu8TE0YuobirJ95QLhxL3g==
X-Received: by 2002:ac8:4886:: with SMTP id i6mr27992229qtq.160.1582234422979; 
 Thu, 20 Feb 2020 13:33:42 -0800 (PST)
Received: from redhat.com (bzq-109-67-14-209.red.bezeqint.net. [109.67.14.209])
 by smtp.gmail.com with ESMTPSA id z27sm440818qtv.11.2020.02.20.13.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 13:33:42 -0800 (PST)
Date: Thu, 20 Feb 2020 16:33:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH 0/2] virtio: decouple protected guest RAM form
 VIRTIO_F_IOMMU_PLATFORM
Message-ID: <20200220163055-mutt-send-email-mst@kernel.org>
References: <20200220160606.53156-1-pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20200220160606.53156-1-pasic@linux.ibm.com>
X-MC-Unique: lidI0CsxNb-3SttHvBEnXw-1
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
> For vhost-net the feature VIRTIO_F_IOMMU_PLATFORM has the following side
> effect The vhost code assumes it the addresses on the virtio descriptor
> ring are not guest physical addresses but iova's, and insists on doing a
> translation of these regardless of what transport is used (e.g. whether
> we emulate a PCI or a CCW device). (For details see commit 6b1e6cc7855b
> "vhost: new device IOTLB API".) On s390 this results in severe
> performance degradation (c.a. factor 10). BTW with ccw I/O there is
> (architecturally) no IOMMU, so the whole address translation makes no
> sense in the context of virtio-ccw.

So it sounds like a host issue: the emulation of s390 unnecessarily complicated.
Working around it by the guest looks wrong ...

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
