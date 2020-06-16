Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 859A51FB00E
	for <lists.virtualization@lfdr.de>; Tue, 16 Jun 2020 14:18:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2D219876D5;
	Tue, 16 Jun 2020 12:18:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m5Kc3XHQKqZG; Tue, 16 Jun 2020 12:18:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9096D87742;
	Tue, 16 Jun 2020 12:18:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6391BC08A0;
	Tue, 16 Jun 2020 12:18:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 67D26C016E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 12:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 53D8E20442
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 12:18:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bi1YRBxz2VAw
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 12:18:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 77013259C9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 12:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592309879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vju3588GEq9YcdXsm65at6pfHEf0IhlWVQ3WlBIC6pw=;
 b=Vzm+KiNMm+ycnwtpntB1yBcELn0kO2p7AKXh8iGfSIfqO8OdKcPFZbOa3qmzq6Qn+PcuvX
 rpULIP/RPlsdtCDMxw0h6MmnhyCDL+tXnWyub6UjJTVRafzw9UZbIHfyFMCnJizC4wZ8Vf
 bJOv8ZoJrGdnDTP2loqsbE2UhmTzFkM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-WwocTxxVNHGDoImqyIeBAg-1; Tue, 16 Jun 2020 08:17:55 -0400
X-MC-Unique: WwocTxxVNHGDoImqyIeBAg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E78541009456;
 Tue, 16 Jun 2020 12:17:52 +0000 (UTC)
Received: from gondolin (ovpn-112-222.ams2.redhat.com [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D8C2260BEC;
 Tue, 16 Jun 2020 12:17:46 +0000 (UTC)
Date: Tue, 16 Jun 2020 14:17:44 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH v2 1/1] s390: virtio: let arch accept devices without
 IOMMU feature
Message-ID: <20200616141744.61b3a139.cohuck@redhat.com>
In-Reply-To: <20200616135726.04fa8314.pasic@linux.ibm.com>
References: <1592224764-1258-1-git-send-email-pmorel@linux.ibm.com>
 <1592224764-1258-2-git-send-email-pmorel@linux.ibm.com>
 <20200616115202.0285aa08.pasic@linux.ibm.com>
 <ef235cc9-9d4b-1247-c01a-9dd1c63f437c@linux.ibm.com>
 <20200616135726.04fa8314.pasic@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
 frankja@linux.ibm.com, Pierre Morel <pmorel@linux.ibm.com>, mst@redhat.com,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 borntraeger@de.ibm.com, kvm@vger.kernel.org, thomas.lendacky@amd.com,
 David Gibson <david@gibson.dropbear.id.au>
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

On Tue, 16 Jun 2020 13:57:26 +0200
Halil Pasic <pasic@linux.ibm.com> wrote:

> On Tue, 16 Jun 2020 12:52:50 +0200
> Pierre Morel <pmorel@linux.ibm.com> wrote:
> 
> > >>   int virtio_finalize_features(struct virtio_device *dev)
> > >>   {
> > >>   	int ret = dev->config->finalize_features(dev);
> > >> @@ -179,6 +184,10 @@ int virtio_finalize_features(struct virtio_device *dev)
> > >>   	if (!virtio_has_feature(dev, VIRTIO_F_VERSION_1))
> > >>   		return 0;
> > >>   
> > >> +	if (arch_needs_iommu_platform(dev) &&
> > >> +		!virtio_has_feature(dev, VIRTIO_F_IOMMU_PLATFORM))
> > >> +		return -EIO;
> > >> +    
> > > 
> > > Why EIO?    
> > 
> > Because I/O can not occur correctly?
> > I am open to suggestions.  
> 
> We use -ENODEV if feature when the device rejects the features we
> tried to negotiate (see virtio_finalize_features()) and -EINVAL when
> the F_VERSION_1 and the virtio-ccw revision ain't coherent (in
> virtio_ccw_finalize_features()). Any of those seems more fitting
> that EIO to me. BTW does the error code itself matter in any way,
> or is it just OK vs some error?

If I haven't lost my way, we end up in the driver core probe failure
handling; we probably should do -ENODEV if we just want probing to fail
and -EINVAL or -EIO if we want the code to moan.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
