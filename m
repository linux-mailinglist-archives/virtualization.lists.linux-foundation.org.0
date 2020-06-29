Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAC420CEE0
	for <lists.virtualization@lfdr.de>; Mon, 29 Jun 2020 15:44:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8A8F920525;
	Mon, 29 Jun 2020 13:44:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tNHzYoQDIZia; Mon, 29 Jun 2020 13:44:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E21E420500;
	Mon, 29 Jun 2020 13:44:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE33BC016E;
	Mon, 29 Jun 2020 13:44:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9E314C016E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 13:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 99852893C0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 13:44:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TTlsTLWTU3tQ
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 13:44:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CA1A5893BF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 13:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593438292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lmeklZemL80Q7lsiy/DTnr9n71S9umll3AkykzC+jhc=;
 b=O1lR9q5roGg2Dzrqq8uHoscYm4UgQw4/Ft37aAkDuCVPcX6awH3eaYJLWSfdvm7gFcQEQ5
 wz0M4JpJPflMnb3fOPmdqzr29fbuuBSL+Cyh7Z8yVjwLwPKU/8g5KCJ/vhf86xoJD/aaKg
 0RPFnyZcfpj8h/zqYtaXO/fhQYW/nkc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-qTZ19pRuPo682yuNxSFHLQ-1; Mon, 29 Jun 2020 09:44:50 -0400
X-MC-Unique: qTZ19pRuPo682yuNxSFHLQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99FC6107ACF9;
 Mon, 29 Jun 2020 13:44:48 +0000 (UTC)
Received: from gondolin (ovpn-113-61.ams2.redhat.com [10.36.113.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6FDB35C1D4;
 Mon, 29 Jun 2020 13:44:42 +0000 (UTC)
Date: Mon, 29 Jun 2020 15:44:39 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH v3 1/1] s390: virtio: let arch accept devices without
 IOMMU feature
Message-ID: <20200629154439.14cc5ae7.cohuck@redhat.com>
In-Reply-To: <7fe6e9ab-fd5a-3f92-1f3a-f9e6805d3730@linux.ibm.com>
References: <1592390637-17441-1-git-send-email-pmorel@linux.ibm.com>
 <1592390637-17441-2-git-send-email-pmorel@linux.ibm.com>
 <20200618002956.5f179de4.pasic@linux.ibm.com>
 <20200619112051.74babdb1.cohuck@redhat.com>
 <7fe6e9ab-fd5a-3f92-1f3a-f9e6805d3730@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: gor@linux.ibm.com, linux-s390@vger.kernel.org, frankja@linux.ibm.com,
 kvm@vger.kernel.org, mst@redhat.com, heiko.carstens@de.ibm.com,
 linuxram@us.ibm.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Halil Pasic <pasic@linux.ibm.com>,
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

On Mon, 29 Jun 2020 15:14:04 +0200
Pierre Morel <pmorel@linux.ibm.com> wrote:

> On 2020-06-19 11:20, Cornelia Huck wrote:
> > On Thu, 18 Jun 2020 00:29:56 +0200
> > Halil Pasic <pasic@linux.ibm.com> wrote:
> >   
> >> On Wed, 17 Jun 2020 12:43:57 +0200
> >> Pierre Morel <pmorel@linux.ibm.com> wrote:  

> >>> @@ -179,6 +194,13 @@ int virtio_finalize_features(struct virtio_device *dev)
> >>>   	if (!virtio_has_feature(dev, VIRTIO_F_VERSION_1))
> >>>   		return 0;
> >>>   
> >>> +	if (arch_needs_virtio_iommu_platform(dev) &&
> >>> +		!virtio_has_feature(dev, VIRTIO_F_IOMMU_PLATFORM)) {
> >>> +		dev_warn(&dev->dev,
> >>> +			 "virtio: device must provide VIRTIO_F_IOMMU_PLATFORM\n");  

[Side note: wasn't there a patch renaming this bit on the list? I think
this name is only kept for userspace compat.]

> >>
> >> I'm not sure, divulging the current Linux name of this feature bit is a
> >> good idea, but if everybody else is fine with this, I don't care that  
> > 
> > Not sure if that feature name will ever change, as it is exported in
> > headers. At most, we might want to add the new ACCESS_PLATFORM define
> > and keep the old one, but that would still mean some churn.
> >   
> >> much. An alternative would be:
> >> "virtio: device falsely claims to have full access to the memory,
> >> aborting the device"  
> > 
> > "virtio: device does not work with limited memory access" ?
> > 
> > But no issue with keeping the current message.
> >   
> 
> If it is OK, I would like to specify that the arch is responsible to 
> accept or not the device.
> The reason why the device is not accepted without IOMMU_PLATFORM is arch 
> specific.

Hm, I'd think the reason is always the same (the device cannot access
the memory directly), just the way to figure out whether that is the
case or not is arch-specific, as with so many other things. No real
need to go into detail here, I think.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
