Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF9416B986
	for <lists.virtualization@lfdr.de>; Tue, 25 Feb 2020 07:15:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F41CF203EE;
	Tue, 25 Feb 2020 06:15:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pv-m0neW0nlz; Tue, 25 Feb 2020 06:15:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 22F5C20381;
	Tue, 25 Feb 2020 06:15:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0AE96C0177;
	Tue, 25 Feb 2020 06:15:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4CFD7C0177
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 06:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3C4E8863FD
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 06:15:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xVB0Woyh+YMP
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 06:15:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CE12486370
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 06:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582611345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hDZAej/jLK8gD+nYYr2L2sjjutU8DKWcsuwzak4gi7I=;
 b=YAXD9h8NSXonazapfa/pUr7rP+lyz88/GPyRKnBhFmAigbY0onCsQ4MFxUu29tAwy0DlpF
 PsSiqaNyfRxO/e1Hll1FSPmAwDuK4IdJk9HdV/b+Cyb0D928S6JjAT7v5xEtAMvZByEJKN
 R0qieby+aNVQl5xDplBygN/zHbFWlm4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-2nRtSc6BMcuaowpCU87-3A-1; Tue, 25 Feb 2020 01:15:43 -0500
X-MC-Unique: 2nRtSc6BMcuaowpCU87-3A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 281051005512;
 Tue, 25 Feb 2020 06:15:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-87.ams2.redhat.com
 [10.36.116.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42A105D9CD;
 Tue, 25 Feb 2020 06:15:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7CFCF1747F; Tue, 25 Feb 2020 07:15:38 +0100 (CET)
Date: Tue, 25 Feb 2020 07:15:38 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH 2/2] drm/virtio: Support virtgpu exported resources
Message-ID: <20200225061538.2qlkhfbhv2pl3oku@sirius.home.kraxel.org>
References: <20200219080637.61312-1-stevensd@chromium.org>
 <20200219080637.61312-3-stevensd@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219080637.61312-3-stevensd@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: virtio-dev@lists.oasis-open.org, "Michael S . Tsirkin" <mst@redhat.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
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

  Hi,

> +struct dma_buf *virtgpu_gem_prime_export(struct drm_gem_object *obj,
> +					 int flags)
> +{
[ ... ]
> +}
> +
> +struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
> +						struct dma_buf *buf)
> +{
[ ... ]
> +}

More code duplication.

> diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
> index 0c85914d9369..9c428ef03060 100644
> --- a/include/uapi/linux/virtio_gpu.h
> +++ b/include/uapi/linux/virtio_gpu.h

API change should go to a separate patch.

> +/*
> + * VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID
> + */
> +#define VIRTIO_GPU_F_CROSS_DEVICE        2

Hmm, how about VIRTIO_GPU_F_RESOURCE_UUID ?

> @@ -87,6 +92,7 @@ enum virtio_gpu_ctrl_type {
>  	VIRTIO_GPU_RESP_OK_CAPSET_INFO,
>  	VIRTIO_GPU_RESP_OK_CAPSET,
>  	VIRTIO_GPU_RESP_OK_EDID,
> +	VIRTIO_GPU_RESP_OK_RESOURCE_ASSIGN_UUID,

The "assign" doesn't make sense in the reply.  I'd name that
VIRTIO_GPU_RESP_OK_RESOURCE_UUID or just VIRTIO_GPU_RESP_OK_UUID,

> +/* VIRTIO_GPU_RESP_OK_RESOURCE_ASSIGN_UUID */
> +struct virtio_gpu_resp_resource_assign_uuid {
> +	struct virtio_gpu_ctrl_hdr hdr;
> +	__u8 uuid[16];
> +};

Same here.

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
