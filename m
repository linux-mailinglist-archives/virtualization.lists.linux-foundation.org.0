Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F5EF1483
	for <lists.virtualization@lfdr.de>; Wed,  6 Nov 2019 12:01:26 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 84DFFB9E;
	Wed,  6 Nov 2019 11:01:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B9A7EB6D
	for <virtualization@lists.linux-foundation.org>;
	Wed,  6 Nov 2019 11:01:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 3A751189
	for <virtualization@lists.linux-foundation.org>;
	Wed,  6 Nov 2019 11:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573038078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=SkN/IjzaoU90YgssHGz0WFlm7IPvbJWgcf9sbT5dqA4=;
	b=bST+wYKWEuVTBQB5ZAoyV/VuDWC/FISMa2b2/aMn+bcrrk+lROhQ9WxVMQJisDgG925I50
	LmqN6Y7DbujrAfSe25fDlBD4Kd6WCSPTU5tEdt8wlhXyxypPfCU2UErY49f+WgmzUy9Llb
	VKa2zs55iyLIUDX8m/bznOz1SWGyze0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-275-VRFnvVLZMmetEpaUZg4hvw-1; Wed, 06 Nov 2019 06:01:11 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A4B1477;
	Wed,  6 Nov 2019 11:01:07 +0000 (UTC)
Received: from gondolin (dhcp-192-218.str.redhat.com [10.33.192.218])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 484225D6D4;
	Wed,  6 Nov 2019 11:00:49 +0000 (UTC)
Date: Wed, 6 Nov 2019 12:00:47 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V9 5/6] virtio: introduce a mdev based transport
Message-ID: <20191106120047.5bcf49c3.cohuck@redhat.com>
In-Reply-To: <20191106070548.18980-6-jasowang@redhat.com>
References: <20191106070548.18980-1-jasowang@redhat.com>
	<20191106070548.18980-6-jasowang@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: VRFnvVLZMmetEpaUZg4hvw-1
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
	haotian.wang@sifive.com, zhi.a.wang@intel.com,
	farman@linux.ibm.com, idos@mellanox.com, gor@linux.ibm.com,
	intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
	xiao.w.wang@intel.com, freude@linux.ibm.com,
	zhenyuw@linux.intel.com, parav@mellanox.com,
	zhihong.wang@intel.com, rodrigo.vivi@intel.com,
	intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
	oberpar@linux.ibm.com, netdev@vger.kernel.org,
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

On Wed,  6 Nov 2019 15:05:47 +0800
Jason Wang <jasowang@redhat.com> wrote:

> This patch introduces a new mdev transport for virtio. This is used to
> use kernel virtio driver to drive the mediated device that is capable
> of populating virtqueue directly.
> 
> A new virtio-mdev driver will be registered to the mdev bus, when a
> new virtio-mdev device is probed, it will register the device with
> mdev based config ops. This means it is a software transport between
> mdev driver and mdev device. The transport was implemented through
> device specific ops which is a part of mdev_parent_ops now.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  drivers/virtio/Kconfig       |  13 ++
>  drivers/virtio/Makefile      |   1 +
>  drivers/virtio/virtio_mdev.c | 406 +++++++++++++++++++++++++++++++++++
>  3 files changed, 420 insertions(+)
>  create mode 100644 drivers/virtio/virtio_mdev.c
> 
> diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
> index 078615cf2afc..558ac607d107 100644
> --- a/drivers/virtio/Kconfig
> +++ b/drivers/virtio/Kconfig
> @@ -43,6 +43,19 @@ config VIRTIO_PCI_LEGACY
>  
>  	  If unsure, say Y.
>  
> +config VIRTIO_MDEV
> +	tristate "MDEV driver for virtio devices"
> +	depends on VFIO_MDEV && VIRTIO
> +	default n
> +	help
> +	  This driver provides support for virtio based paravirtual
> +	  device driver over MDEV bus. This requires your environemnt
> +	  has appropriate virtio mdev device implementation which may
> +	  operate on the physical device that the datapath of virtio
> +	  could be offloaded to hardware.

That sentence is a bit confusing to me... what about

"For this to be useful, you need an appropriate virtio mdev device
implementation that operates on a physical device to allow the datapath
of virtio to be offloaded to hardware."

?

> +
> +	  If unsure, say M

Building this as a module should not hurt (but please add a trailing
'.' here :)

> +
>  config VIRTIO_PMEM
>  	tristate "Support for virtio pmem driver"
>  	depends on VIRTIO

With the changes above,

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
