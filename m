Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9CEF3364
	for <lists.virtualization@lfdr.de>; Thu,  7 Nov 2019 16:35:22 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DE7AC1080;
	Thu,  7 Nov 2019 15:35:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A04CEE7B
	for <virtualization@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 15:35:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id D742D87D
	for <virtualization@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 15:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573140909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=BzEyez2H23edMWUzeroDzzDUe6EbJTfa2zTwff9g92s=;
	b=iytoKoHykz8YhCd5O48nU5ObA9o3jLo8P15TM0U2VcVQPg/x6e7Hr5Qa3j4gO0uSqttAOY
	OgwLfTp0x5ODyLzDUyK9cBN58lQJI3x2Gl4CSaSsetY0I49gmlFVL4x9U2Ft2tcqirL7Kp
	vnva7uDFSHOsVxHnhV4DEiFhMMeqIfo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-423-TZdOIwyWM0aw-ZFtUujj9Q-1; Thu, 07 Nov 2019 10:35:05 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 000FF477;
	Thu,  7 Nov 2019 15:35:00 +0000 (UTC)
Received: from gondolin (ovpn-117-222.ams2.redhat.com [10.36.117.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CCE1260BEC;
	Thu,  7 Nov 2019 15:34:51 +0000 (UTC)
Date: Thu, 7 Nov 2019 16:34:48 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V11 6/6] docs: sample driver to demonstrate how to
	implement virtio-mdev framework
Message-ID: <20191107163448.4d20b75b.cohuck@redhat.com>
In-Reply-To: <20191107151109.23261-7-jasowang@redhat.com>
References: <20191107151109.23261-1-jasowang@redhat.com>
	<20191107151109.23261-7-jasowang@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: TZdOIwyWM0aw-ZFtUujj9Q-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: christophe.de.dinechin@gmail.com, kvm@vger.kernel.org, mst@redhat.com,
	airlied@linux.ie, joonas.lahtinen@linux.intel.com,
	heiko.carstens@de.ibm.com, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
	rob.miller@broadcom.com, linux-s390@vger.kernel.org,
	sebott@linux.ibm.com, lulu@redhat.com, eperezma@redhat.com,
	pasic@linux.ibm.com, borntraeger@de.ibm.com,
	haotian.wang@sifive.com, zhi.a.wang@intel.com,
	farman@linux.ibm.com, parav@mellanox.com, gor@linux.ibm.com,
	intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
	xiao.w.wang@intel.com, freude@linux.ibm.com,
	zhenyuw@linux.intel.com, stefanha@redhat.com,
	zhihong.wang@intel.com, rodrigo.vivi@intel.com,
	intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
	oberpar@linux.ibm.com, netdev@vger.kernel.org,
	rdunlap@infradead.org, linux-kernel@vger.kernel.org,
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

On Thu,  7 Nov 2019 23:11:09 +0800
Jason Wang <jasowang@redhat.com> wrote:

> This sample driver creates mdev device that simulate virtio net device
> over virtio mdev transport. The device is implemented through vringh
> and workqueue. A device specific dma ops is to make sure HVA is used
> directly as the IOVA. This should be sufficient for kernel virtio
> driver to work.
> 
> Only 'virtio' type is supported right now. I plan to add 'vhost' type
> on top which requires some virtual IOMMU implemented in this sample
> driver.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  MAINTAINERS                        |   1 +
>  samples/Kconfig                    |  10 +
>  samples/vfio-mdev/Makefile         |   1 +
>  samples/vfio-mdev/mvnet_loopback.c | 687 +++++++++++++++++++++++++++++
>  4 files changed, 699 insertions(+)
>  create mode 100644 samples/vfio-mdev/mvnet_loopback.c

Acked-by: Cornelia Huck <cohuck@redhat.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
