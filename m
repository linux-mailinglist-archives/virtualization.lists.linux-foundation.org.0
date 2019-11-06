Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA3BF223D
	for <lists.virtualization@lfdr.de>; Wed,  6 Nov 2019 23:58:27 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C65D5C84;
	Wed,  6 Nov 2019 22:58:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E23642F
	for <virtualization@lists.linux-foundation.org>;
	Wed,  6 Nov 2019 22:58:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 671FA5D0
	for <virtualization@lists.linux-foundation.org>;
	Wed,  6 Nov 2019 22:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573081098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=9Clhu2rt+kpo43UbuiVcjjHoWtjEgIjo2tHeRtPjlyQ=;
	b=bZQe086k/IHnAuMY7ONkhRZddgHCeTz99r92g31HRvHEpYqODSOG66hMNdJeyg5OwNZjIh
	AMzG76nktxoFwj2Wb4bJOEsht7+aMBYXCoWM70wrBfiOa+3BFdCgfulYMCtZzg1AEUvdaU
	IMB6uxhYJFoFZ1Hx/p3oDZ/uKrI6tyk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-331-YbiNC0ioPxK3IgeNVq5zwQ-1; Wed, 06 Nov 2019 17:58:14 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2C16107ACC3;
	Wed,  6 Nov 2019 22:58:10 +0000 (UTC)
Received: from x1.home (ovpn-116-138.phx2.redhat.com [10.3.116.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BF7AB5C1BB;
	Wed,  6 Nov 2019 22:58:00 +0000 (UTC)
Date: Wed, 6 Nov 2019 15:58:00 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH V9 6/6] docs: sample driver to demonstrate how to
	implement virtio-mdev framework
Message-ID: <20191106155800.0b8418ec@x1.home>
In-Reply-To: <88efad07-70aa-3879-31e7-ace4d2ad63a1@infradead.org>
References: <20191106070548.18980-1-jasowang@redhat.com>
	<20191106070548.18980-7-jasowang@redhat.com>
	<88efad07-70aa-3879-31e7-ace4d2ad63a1@infradead.org>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: YbiNC0ioPxK3IgeNVq5zwQ-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: stefanha@redhat.com, christophe.de.dinechin@gmail.com, kvm@vger.kernel.org,
	mst@redhat.com, airlied@linux.ie,
	joonas.lahtinen@linux.intel.com, heiko.carstens@de.ibm.com,
	dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
	rob.miller@broadcom.com, linux-s390@vger.kernel.org,
	sebott@linux.ibm.com, lulu@redhat.com, eperezma@redhat.com,
	pasic@linux.ibm.com, borntraeger@de.ibm.com,
	haotian.wang@sifive.com, intel-gfx@lists.freedesktop.org,
	zhi.a.wang@intel.com, farman@linux.ibm.com, idos@mellanox.com,
	gor@linux.ibm.com, jani.nikula@linux.intel.com,
	rodrigo.vivi@intel.com, xiao.w.wang@intel.com,
	freude@linux.ibm.com, zhenyuw@linux.intel.com,
	parav@mellanox.com, zhihong.wang@intel.com,
	intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
	oberpar@linux.ibm.com, netdev@vger.kernel.org, cohuck@redhat.com,
	linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
	daniel@ffwll.ch, lingshan.zhu@intel.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Wed, 6 Nov 2019 14:50:30 -0800
Randy Dunlap <rdunlap@infradead.org> wrote:

> On 11/5/19 11:05 PM, Jason Wang wrote:
> > diff --git a/samples/Kconfig b/samples/Kconfig
> > index c8dacb4dda80..13a2443e18e0 100644
> > --- a/samples/Kconfig
> > +++ b/samples/Kconfig
> > @@ -131,6 +131,16 @@ config SAMPLE_VFIO_MDEV_MDPY
> >  	  mediated device.  It is a simple framebuffer and supports
> >  	  the region display interface (VFIO_GFX_PLANE_TYPE_REGION).
> >  
> > +config SAMPLE_VIRTIO_MDEV_NET
> > +	tristate "Build VIRTIO net example mediated device sample code -- loadable modules only"
> > +	depends on VIRTIO_MDEV && VHOST_RING && m
> > +	help
> > +	  Build a networking sample device for use as a virtio
> > +	  mediated device. The device coopreates with virtio-mdev bus  
> 
> typo here:
> 	                              cooperates
> 

I can fix this on commit relative to V10 if there are no other issues
raised:

diff --git a/samples/Kconfig b/samples/Kconfig
index 13a2443e18e0..b7116d97cbbe 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -136,7 +136,7 @@ config SAMPLE_VIRTIO_MDEV_NET
        depends on VIRTIO_MDEV && VHOST_RING && m
        help
          Build a networking sample device for use as a virtio
-         mediated device. The device coopreates with virtio-mdev bus
+         mediated device. The device cooperates with virtio-mdev bus
          driver to present an virtio ethernet driver for
          kernel. It simply loopbacks all packets from its TX
          virtqueue to its RX virtqueue.

Thanks,
Alex

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
