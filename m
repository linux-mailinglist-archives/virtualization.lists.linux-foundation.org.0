Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0962004DE
	for <lists.virtualization@lfdr.de>; Fri, 19 Jun 2020 11:21:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8A2C326F28;
	Fri, 19 Jun 2020 09:21:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bh3Cxfez2VXu; Fri, 19 Jun 2020 09:21:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 59B9327379;
	Fri, 19 Jun 2020 09:21:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 23BBCC016E;
	Fri, 19 Jun 2020 09:21:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A74A2C016E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 Jun 2020 09:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8DB3987211
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 Jun 2020 09:21:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hFtjdc-JD_lM
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 Jun 2020 09:21:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 55E158720A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 Jun 2020 09:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592558468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CSYuwtmT8b+8sMwO2HmTx/vO/pKshfycGSOo4nB9oQo=;
 b=Lw6X0BjqU22QDlPpt+IHpvQ9Q0DzUtvxStE79lDXnpWC3H7l6ReUmTY7VgTu7kXt2ycRZk
 AlKrkuaHY9DHhDxcAA/b9fg2Beb6LjPCDdxYA/bfh58Vw9+1i4ELrzBrLrS6x5c0XBFQnK
 wq0wjfultruu8izwj0T1h8x1FHkSO4A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-UBAxIcEyPSmqjbxnv0juBg-1; Fri, 19 Jun 2020 05:21:03 -0400
X-MC-Unique: UBAxIcEyPSmqjbxnv0juBg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 643A6107ACCD;
 Fri, 19 Jun 2020 09:21:01 +0000 (UTC)
Received: from gondolin (ovpn-112-224.ams2.redhat.com [10.36.112.224])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45F8F1002382;
 Fri, 19 Jun 2020 09:20:54 +0000 (UTC)
Date: Fri, 19 Jun 2020 11:20:51 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH v3 1/1] s390: virtio: let arch accept devices without
 IOMMU feature
Message-ID: <20200619112051.74babdb1.cohuck@redhat.com>
In-Reply-To: <20200618002956.5f179de4.pasic@linux.ibm.com>
References: <1592390637-17441-1-git-send-email-pmorel@linux.ibm.com>
 <1592390637-17441-2-git-send-email-pmorel@linux.ibm.com>
 <20200618002956.5f179de4.pasic@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: gor@linux.ibm.com, linux-s390@vger.kernel.org, frankja@linux.ibm.com,
 Pierre Morel <pmorel@linux.ibm.com>, mst@redhat.com, heiko.carstens@de.ibm.com,
 linuxram@us.ibm.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, borntraeger@de.ibm.com,
 kvm@vger.kernel.org, thomas.lendacky@amd.com, david@gibson.dropbear.id.au
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

On Thu, 18 Jun 2020 00:29:56 +0200
Halil Pasic <pasic@linux.ibm.com> wrote:

> On Wed, 17 Jun 2020 12:43:57 +0200
> Pierre Morel <pmorel@linux.ibm.com> wrote:
> 
> > An architecture protecting the guest memory against unauthorized host
> > access may want to enforce VIRTIO I/O device protection through the
> > use of VIRTIO_F_IOMMU_PLATFORM.
> > 
> > Let's give a chance to the architecture to accept or not devices
> > without VIRTIO_F_IOMMU_PLATFORM.
> >   
> [..]
> 
> 
> I'm still not really satisfied with your commit message, furthermore
> I did some thinking about the abstraction you introduce here. I will
> give a short analysis of that, but first things first. Your patch does
> the job of preventing calamity, and the details can be changed any time,
> thus: 
> 
> Acked-by: Halil Pasic <pasic@linux.ibm.com>
> 
> Regarding the interaction of architecture specific code with virtio core,
> I believe we could have made the interface more generic.
> 
> One option is to introduce virtio_arch_finalize_features(), a hook that
> could reject any feature that is inappropriate.

s/any feature/any combination of features/

This sounds like a good idea (for a later update).

> 
> Another option would be to find a common name for is_prot_virt_guest()
> (arch/s390) sev_active() (arch/x86) and is_secure_guest() (arch/powerpc)
> and use that instead of arch_needs_virtio_iommu_platform() and where-ever
> appropriate. Currently we seem to want this info in driver code only for
> virtio, but if the virtio driver has a legitimate need to know, other
> drivers may as well have a legitimate need to know. For example if we
> wanted to protect ourselves in ccw device drivers from somebody
> setting up a vfio-ccw device and attach it to the prot-virt guest (AFAICT
> we only lack guest enablement for this) such a function could be useful.

I'm not really sure if we can find enough commonality between
architectures, unless you propose to have a function for checking
things like device memory only.

> 
> But since this can be rewritten any time, let's go with the option
> people already agree with, instead of more discussion.

Yes, there's nothing wrong with the patch as-is.

Acked-by: Cornelia Huck <cohuck@redhat.com>

Which tree should this go through? Virtio? s390?

> 
> Just another question. Do we want this backported? Do we need cc stable?

It does change behaviour of virtio-ccw devices; but then, it only
fences off configurations that would not have worked anyway.
Distributions should probably pick this; but I do not consider it
strictly a "fix" (more a mitigation for broken configurations), so I'm
not sure whether stable applies.

> [..]
> 
> 
> >  int virtio_finalize_features(struct virtio_device *dev)
> >  {
> >  	int ret = dev->config->finalize_features(dev);
> > @@ -179,6 +194,13 @@ int virtio_finalize_features(struct virtio_device *dev)
> >  	if (!virtio_has_feature(dev, VIRTIO_F_VERSION_1))
> >  		return 0;
> >  
> > +	if (arch_needs_virtio_iommu_platform(dev) &&
> > +		!virtio_has_feature(dev, VIRTIO_F_IOMMU_PLATFORM)) {
> > +		dev_warn(&dev->dev,
> > +			 "virtio: device must provide VIRTIO_F_IOMMU_PLATFORM\n");  
> 
> I'm not sure, divulging the current Linux name of this feature bit is a
> good idea, but if everybody else is fine with this, I don't care that

Not sure if that feature name will ever change, as it is exported in
headers. At most, we might want to add the new ACCESS_PLATFORM define
and keep the old one, but that would still mean some churn.

> much. An alternative would be:
> "virtio: device falsely claims to have full access to the memory,
> aborting the device"

"virtio: device does not work with limited memory access" ?

But no issue with keeping the current message.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
