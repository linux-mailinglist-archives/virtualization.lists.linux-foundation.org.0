Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8107420CFF8
	for <lists.virtualization@lfdr.de>; Mon, 29 Jun 2020 18:05:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2CF76887C3;
	Mon, 29 Jun 2020 16:05:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y8uEXV7zxQLT; Mon, 29 Jun 2020 16:05:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7B05B886EC;
	Mon, 29 Jun 2020 16:05:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 579FCC0895;
	Mon, 29 Jun 2020 16:05:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 79085C016E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 16:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 680DD87559
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 16:05:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HgQzhJ6tNI5f
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 16:05:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 32E478754D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 16:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593446742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LUfU3DwcJDvqG3254Hkil0FQVUF3NIrSHMy6nXbf4kc=;
 b=jNnlMSt5os8mht+c5svU5omYIc6fcP+IK4E0BaVjtBBBW2OCMceJN6YthdWNfTWwrroGB1
 SVhudwrqZ7x8pdbVN2okZqfU2ijnFHI0dY4JBAMcPH+6CLRF7k4ks8iQikC9coumF8vgNr
 eVoFLTJt0y5PS/nJtQ4Ao0zAvlpnJDA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-srnLdMb6O5SSjgOgzzj6JA-1; Mon, 29 Jun 2020 12:05:38 -0400
X-MC-Unique: srnLdMb6O5SSjgOgzzj6JA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4A4EBFC3;
 Mon, 29 Jun 2020 16:05:36 +0000 (UTC)
Received: from gondolin (ovpn-113-61.ams2.redhat.com [10.36.113.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DB1960BEC;
 Mon, 29 Jun 2020 16:05:28 +0000 (UTC)
Date: Mon, 29 Jun 2020 18:05:26 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3 1/1] s390: virtio: let arch accept devices without
 IOMMU feature
Message-ID: <20200629180526.41d0732b.cohuck@redhat.com>
In-Reply-To: <20200629115651-mutt-send-email-mst@kernel.org>
References: <1592390637-17441-1-git-send-email-pmorel@linux.ibm.com>
 <1592390637-17441-2-git-send-email-pmorel@linux.ibm.com>
 <20200629115651-mutt-send-email-mst@kernel.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

On Mon, 29 Jun 2020 11:57:14 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Wed, Jun 17, 2020 at 12:43:57PM +0200, Pierre Morel wrote:
> > An architecture protecting the guest memory against unauthorized host
> > access may want to enforce VIRTIO I/O device protection through the
> > use of VIRTIO_F_IOMMU_PLATFORM.
> > 
> > Let's give a chance to the architecture to accept or not devices
> > without VIRTIO_F_IOMMU_PLATFORM.
> > 
> > Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> > Acked-by: Jason Wang <jasowang@redhat.com>
> > Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
> > ---
> >  arch/s390/mm/init.c     |  6 ++++++
> >  drivers/virtio/virtio.c | 22 ++++++++++++++++++++++
> >  include/linux/virtio.h  |  2 ++
> >  3 files changed, 30 insertions(+)

> > @@ -179,6 +194,13 @@ int virtio_finalize_features(struct virtio_device *dev)
> >  	if (!virtio_has_feature(dev, VIRTIO_F_VERSION_1))
> >  		return 0;
> >  
> > +	if (arch_needs_virtio_iommu_platform(dev) &&
> > +		!virtio_has_feature(dev, VIRTIO_F_IOMMU_PLATFORM)) {
> > +		dev_warn(&dev->dev,
> > +			 "virtio: device must provide VIRTIO_F_IOMMU_PLATFORM\n");
> > +		return -ENODEV;
> > +	}
> > +
> >  	virtio_add_status(dev, VIRTIO_CONFIG_S_FEATURES_OK);
> >  	status = dev->config->get_status(dev);
> >  	if (!(status & VIRTIO_CONFIG_S_FEATURES_OK)) {  
> 
> Well don't you need to check it *before* VIRTIO_F_VERSION_1, not after?

But it's only available with VERSION_1 anyway, isn't it? So it probably
also needs to fail when this feature is needed if VERSION_1 has not been
negotiated, I think.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
