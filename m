Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2F1F2222
	for <lists.virtualization@lfdr.de>; Wed,  6 Nov 2019 23:50:45 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CFBA8C8E;
	Wed,  6 Nov 2019 22:50:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 15E2EC7D
	for <virtualization@lists.linux-foundation.org>;
	Wed,  6 Nov 2019 22:50:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A32C9196
	for <virtualization@lists.linux-foundation.org>;
	Wed,  6 Nov 2019 22:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
	Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=S+NDVwxnw7pUxx3P5o8f+I/8HtJJXwHD+rPflie4cnM=;
	b=pMQRdpKIQCx3SN9Vl5hh63a0q
	NN9hM0Rdx0FKjbRc5iGGjxbdKBzcS60ZVcKZX3pcxvoMr4KualdndEDr47JlzlgcGEmw70yQfewI1
	T7bj38nguBRwOjJHbfR5kz1aDqZ015cYLHqHBgeIMUOqld6zyuIA3N5V6zdW6x9UObSW4us0x+Qz4
	kUgZP3BVbKCZ2SoXTdv7WaUdAelz4i/YSG84yCv78On6N1pDStA1x/uK/u+lwrYTKCzIhLfi3J9bi
	+8mALHWxYMUbvB1tFVeq03G484MQcFQavQi2yCJuwxOzS9J58eV4AgmbpLY2iffnv5aR7Yu8gdBt7
	g9cvCQqnA==;
Received: from [2601:1c0:6280:3f0::4ba1]
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSU8G-0006ML-Gr; Wed, 06 Nov 2019 22:50:32 +0000
Subject: Re: [PATCH V9 6/6] docs: sample driver to demonstrate how to
	implement virtio-mdev framework
To: Jason Wang <jasowang@redhat.com>, kvm@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org, kwankhede@nvidia.com,
	alex.williamson@redhat.com, mst@redhat.com, tiwei.bie@intel.com
References: <20191106070548.18980-1-jasowang@redhat.com>
	<20191106070548.18980-7-jasowang@redhat.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <88efad07-70aa-3879-31e7-ace4d2ad63a1@infradead.org>
Date: Wed, 6 Nov 2019 14:50:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191106070548.18980-7-jasowang@redhat.com>
Content-Language: en-US
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: christophe.de.dinechin@gmail.com, sebott@linux.ibm.com, airlied@linux.ie,
	joonas.lahtinen@linux.intel.com, heiko.carstens@de.ibm.com,
	virtualization@lists.linux-foundation.org,
	rob.miller@broadcom.com, lulu@redhat.com, eperezma@redhat.com,
	pasic@linux.ibm.com, borntraeger@de.ibm.com,
	haotian.wang@sifive.com, zhi.a.wang@intel.com,
	farman@linux.ibm.com, idos@mellanox.com, gor@linux.ibm.com,
	zhenyuw@linux.intel.com, rodrigo.vivi@intel.com,
	xiao.w.wang@intel.com, freude@linux.ibm.com,
	jani.nikula@linux.intel.com, parav@mellanox.com,
	zhihong.wang@intel.com, stefanha@redhat.com,
	akrowiak@linux.ibm.com, netdev@vger.kernel.org,
	cohuck@redhat.com, oberpar@linux.ibm.com,
	maxime.coquelin@redhat.com, daniel@ffwll.ch, lingshan.zhu@intel.com
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

On 11/5/19 11:05 PM, Jason Wang wrote:
> diff --git a/samples/Kconfig b/samples/Kconfig
> index c8dacb4dda80..13a2443e18e0 100644
> --- a/samples/Kconfig
> +++ b/samples/Kconfig
> @@ -131,6 +131,16 @@ config SAMPLE_VFIO_MDEV_MDPY
>  	  mediated device.  It is a simple framebuffer and supports
>  	  the region display interface (VFIO_GFX_PLANE_TYPE_REGION).
>  
> +config SAMPLE_VIRTIO_MDEV_NET
> +	tristate "Build VIRTIO net example mediated device sample code -- loadable modules only"
> +	depends on VIRTIO_MDEV && VHOST_RING && m
> +	help
> +	  Build a networking sample device for use as a virtio
> +	  mediated device. The device coopreates with virtio-mdev bus

typo here:
	                              cooperates

> +	  driver to present an virtio ethernet driver for
> +	  kernel. It simply loopbacks all packets from its TX
> +	  virtqueue to its RX virtqueue.
> +
>  config SAMPLE_VFIO_MDEV_MDPY_FB
>  	tristate "Build VFIO mdpy example guest fbdev driver -- loadable module only"
>  	depends on FB && m

ciao.
-- 
~Randy

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
