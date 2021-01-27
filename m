Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B969305648
	for <lists.virtualization@lfdr.de>; Wed, 27 Jan 2021 09:59:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0DCB38663C;
	Wed, 27 Jan 2021 08:59:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FdPR8KoJ3-X9; Wed, 27 Jan 2021 08:59:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 76BA08641F;
	Wed, 27 Jan 2021 08:59:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 50023C013A;
	Wed, 27 Jan 2021 08:59:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8CCFBC013A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Jan 2021 08:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 72A6D2078C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Jan 2021 08:59:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xavmQdyoDrTl
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Jan 2021 08:59:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by silver.osuosl.org (Postfix) with ESMTPS id 89D1B2049C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Jan 2021 08:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611737972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8F3p75SyEOVyX3ahfiz9umwfm5OOcgRN90TvZg1YzTg=;
 b=YQ37sOpTPh9Wfptv1+7I4yQwqbvrNyQZwCf7QRK2/HGhOSdR/7nlGuOSkSm+pWRlp2nvuz
 OY4awsgESh6aMfTtYyhshDYH6weBQ9DtKVjrUPOrPd8z7VyPDsAUl65GgBxct7DePIOZWn
 dPW61iDhpG5ZiI95mehxbI5zsG8oEcU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-hYTQYJ3xPciXuXh4OgfmOA-1; Wed, 27 Jan 2021 03:59:28 -0500
X-MC-Unique: hYTQYJ3xPciXuXh4OgfmOA-1
Received: by mail-wr1-f69.google.com with SMTP id o17so606948wrv.4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Jan 2021 00:59:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8F3p75SyEOVyX3ahfiz9umwfm5OOcgRN90TvZg1YzTg=;
 b=jcJ6tdSe04gvqL7klL0kwPmWDcKvDRJkfmMGUufaCwUrcfAudvcx5Uviipl8ttdIqF
 vuLS5GLUwQMZQxErxFA5LCi98a4QkNp8Qo7+YiRgHvbm5u1iOJ2dthDjUqpIPX95Ifje
 MqQ7KRUTB2JCefeXPoRP0JDg4XbXFxh9MuqctyAgmUTp4gKSSD3TFvdmcyo6JEyj332s
 tYk1L64+TDGOpYq+gAOzz8gA90nbSCkROfjn6dWyC8qH4zoLsnIRntPJYvjNLYzpWXFs
 WxDg6CksyrYc8yQv+727XfeI3PpOxSFknu094PAap4VRSo4JsHh8piPhbglOcJUk/zx6
 VL0w==
X-Gm-Message-State: AOAM530OB5LkPeOacBxQL3TqM78r4C4okxoeIX6DUDQ209k6F9BzokfN
 TZzpBtibtAsQi4BoOs5gRUygtxAE6cckuBU9GOQHpN8zVn3tVrLLGpSHYlOKlvrwTsC9HNQ12wv
 dshVK6h8VLaw3xbqugFrvu78Xi6+5Gb2too9tg9Wy+A==
X-Received: by 2002:a7b:cbd5:: with SMTP id n21mr3389396wmi.5.1611737967364;
 Wed, 27 Jan 2021 00:59:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6IR+GVVU30LyX9/KtKDCb/OF5xsvG/DpsrTzfFCkbaLPd/jhOGfpVe/ATCJ4R5nOCfXI/lQ==
X-Received: by 2002:a7b:cbd5:: with SMTP id n21mr3389372wmi.5.1611737967139;
 Wed, 27 Jan 2021 00:59:27 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id w126sm1817491wma.43.2021.01.27.00.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 00:59:26 -0800 (PST)
Date: Wed, 27 Jan 2021 09:59:24 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Subject: Re: [RFC v3 03/11] vdpa: Remove the restriction that only supports
 virtio-net devices
Message-ID: <20210127085924.ktgmsgn6k3zegd67@steredhat>
References: <20210119045920.447-1-xieyongji@bytedance.com>
 <20210119045920.447-4-xieyongji@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20210119045920.447-4-xieyongji@bytedance.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: axboe@kernel.dk, corbet@lwn.net, kvm@vger.kernel.org, mst@redhat.com,
 linux-aio@kvack.org, netdev@vger.kernel.org, rdunlap@infradead.org,
 willy@infradead.org, virtualization@lists.linux-foundation.org,
 hch@infradead.org, bob.liu@oracle.com, bcrl@kvack.org, viro@zeniv.linux.org.uk,
 stefanha@redhat.com, linux-fsdevel@vger.kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Tue, Jan 19, 2021 at 12:59:12PM +0800, Xie Yongji wrote:
>With VDUSE, we should be able to support all kinds of virtio devices.
>
>Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
>---
> drivers/vhost/vdpa.c | 29 +++--------------------------
> 1 file changed, 3 insertions(+), 26 deletions(-)
>
>diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
>index 29ed4173f04e..448be7875b6d 100644
>--- a/drivers/vhost/vdpa.c
>+++ b/drivers/vhost/vdpa.c
>@@ -22,6 +22,7 @@
> #include <linux/nospec.h>
> #include <linux/vhost.h>
> #include <linux/virtio_net.h>
>+#include <linux/virtio_blk.h>

Is this inclusion necessary?

Maybe we can remove virtio_net.h as well.

Thanks,
Stefano

>
> #include "vhost.h"
>
>@@ -185,26 +186,6 @@ static long vhost_vdpa_set_status(struct vhost_vdpa *v, u8 __user *statusp)
> 	return 0;
> }
>
>-static int vhost_vdpa_config_validate(struct vhost_vdpa *v,
>-				      struct vhost_vdpa_config *c)
>-{
>-	long size = 0;
>-
>-	switch (v->virtio_id) {
>-	case VIRTIO_ID_NET:
>-		size = sizeof(struct virtio_net_config);
>-		break;
>-	}
>-
>-	if (c->len == 0)
>-		return -EINVAL;
>-
>-	if (c->len > size - c->off)
>-		return -E2BIG;
>-
>-	return 0;
>-}
>-
> static long vhost_vdpa_get_config(struct vhost_vdpa *v,
> 				  struct vhost_vdpa_config __user *c)
> {
>@@ -215,7 +196,7 @@ static long vhost_vdpa_get_config(struct vhost_vdpa *v,
>
> 	if (copy_from_user(&config, c, size))
> 		return -EFAULT;
>-	if (vhost_vdpa_config_validate(v, &config))
>+	if (config.len == 0)
> 		return -EINVAL;
> 	buf = kvzalloc(config.len, GFP_KERNEL);
> 	if (!buf)
>@@ -243,7 +224,7 @@ static long vhost_vdpa_set_config(struct vhost_vdpa *v,
>
> 	if (copy_from_user(&config, c, size))
> 		return -EFAULT;
>-	if (vhost_vdpa_config_validate(v, &config))
>+	if (config.len == 0)
> 		return -EINVAL;
> 	buf = kvzalloc(config.len, GFP_KERNEL);
> 	if (!buf)
>@@ -1025,10 +1006,6 @@ static int vhost_vdpa_probe(struct vdpa_device *vdpa)
> 	int minor;
> 	int r;
>
>-	/* Currently, we only accept the network devices. */
>-	if (ops->get_device_id(vdpa) != VIRTIO_ID_NET)
>-		return -ENOTSUPP;
>-
> 	v = kzalloc(sizeof(*v), GFP_KERNEL | __GFP_RETRY_MAYFAIL);
> 	if (!v)
> 		return -ENOMEM;
>-- 
>2.11.0
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
