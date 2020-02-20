Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DE21669D8
	for <lists.virtualization@lfdr.de>; Thu, 20 Feb 2020 22:30:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4785F20378;
	Thu, 20 Feb 2020 21:30:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lvp53mK1xdzq; Thu, 20 Feb 2020 21:30:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1B8A920452;
	Thu, 20 Feb 2020 21:30:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D9A3CC013E;
	Thu, 20 Feb 2020 21:30:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C84A1C013E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 21:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B639787C3F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 21:30:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wxoCFn8wDPCU
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 21:30:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5C99587C09
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 21:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582234202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lf3au2MSHJPbioLz91pJ+pe3QhvFI4k4CcE4NuKgsdw=;
 b=Z9QZQ6z+3Jg+cBZ4q/9oSXYT1ToM107VKQ3ai9+L2gdzWef4eq7Sb8YlSgOtRIYHO/plp5
 nKarORGw/cSjB22isEmbDfgGGKR12Hp72jdNSX/UQKM3dhoAdyce8VnNS4n22jywR6X3TL
 XPatCt1lSX0X3nEkk0aDFzACmQoQLQE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-ox5xs5cAP3SIKIcsSRKS7g-1; Thu, 20 Feb 2020 16:29:59 -0500
Received: by mail-qk1-f200.google.com with SMTP id v81so31901qkb.11
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 13:29:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Lf3au2MSHJPbioLz91pJ+pe3QhvFI4k4CcE4NuKgsdw=;
 b=uKv6txNBwG9TwtLKBJHWshwpWXEfABj5d+hknpquoivSO8iNgrMtqmS534wjYK66dQ
 uMNqvAzg9jOJVk8pk5Ne1qDl685LwjNoV4EkeWF78owImB2vOMWLuWtE1xITr7D8HM/N
 lNawmoXRS3VVo7l+VB4drf6t0bic3ax0NOIk/yOb0SDrlSUFkmz/S3l1F9yJ0QLP75by
 6FWB3d6gcHWvgjkWlXvvLq2ba3RoJD5yHdwiXoZHc7YHpV0nbeUVZ98P0/QCUOvEN1xp
 bx0TXfVAEc6OAvfFBrHs9NrI501mB6km8jkMxE9rSCHkltaSiyQds642RtPxJ7V2dWtV
 vQGA==
X-Gm-Message-State: APjAAAWL3Ml/nM1kJw82gnsSBuuU8aIs5ip4o4++gT3h/WbFnMRHzc3Q
 5K2rVxjvN+l651ABnjQD+KRqkIKWr5UvHm9bPnE/Zm6fZFNvHxpwrvq+9TS6F2425c7lbregCP0
 m+PIbQ1qD34n9vjHQ8mHLiw0Ny6pBm6tU0mq3Rkc/4A==
X-Received: by 2002:ac8:4616:: with SMTP id p22mr29036895qtn.368.1582234199363; 
 Thu, 20 Feb 2020 13:29:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqwCyE/IGRqPbb728yukodcrAAG8HoUGpZIWGc8w9a3plX9TiklcItDV0lrQNkao9NxMwpK5TQ==
X-Received: by 2002:ac8:4616:: with SMTP id p22mr29036863qtn.368.1582234199118; 
 Thu, 20 Feb 2020 13:29:59 -0800 (PST)
Received: from redhat.com (bzq-109-67-14-209.red.bezeqint.net. [109.67.14.209])
 by smtp.gmail.com with ESMTPSA id c45sm453698qtd.43.2020.02.20.13.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 13:29:57 -0800 (PST)
Date: Thu, 20 Feb 2020 16:29:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH 0/2] virtio: decouple protected guest RAM form
 VIRTIO_F_IOMMU_PLATFORM
Message-ID: <20200220162747-mutt-send-email-mst@kernel.org>
References: <20200220160606.53156-1-pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20200220160606.53156-1-pasic@linux.ibm.com>
X-MC-Unique: ox5xs5cAP3SIKIcsSRKS7g-1
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
> * This usage is not congruent with  standardised semantics of
> VIRTIO_F_IOMMU_PLATFORM. Guest memory protected is an orthogonal reason
> for using DMA API in virtio (orthogonal with respect to what is
> expressed by VIRTIO_F_IOMMU_PLATFORM). 

Quoting the spec:

  \item[VIRTIO_F_ACCESS_PLATFORM(33)] This feature indicates that
  the device can be used on a platform where device access to data
  in memory is limited and/or translated. E.g. this is the case if the device can be located
  behind an IOMMU that translates bus addresses from the device into physical
  addresses in memory, if the device can be limited to only access
  certain memory addresses or if special commands such as
  a cache flush can be needed to synchronise data in memory with
  the device. Whether accesses are actually limited or translated
  is described by platform-specific means.
  If this feature bit is set to 0, then the device
  has same access to memory addresses supplied to it as the
  driver has.
  In particular, the device will always use physical addresses
  matching addresses used by the driver (typically meaning
  physical addresses used by the CPU)
  and not translated further, and can access any address supplied to it by
  the driver. When clear, this overrides any platform-specific description of
  whether device access is limited or translated in any way, e.g.
  whether an IOMMU may be present.

since device can't access encrypted memory,
this seems to match your case reasonably well.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
