Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4626324198C
	for <lists.virtualization@lfdr.de>; Tue, 11 Aug 2020 12:19:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id ECB2C869CA;
	Tue, 11 Aug 2020 10:19:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pNIgq4cu1EVH; Tue, 11 Aug 2020 10:19:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2AEE7876E4;
	Tue, 11 Aug 2020 10:19:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 10A7FC004D;
	Tue, 11 Aug 2020 10:19:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99EF7C004D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Aug 2020 10:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 95F8487B47
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Aug 2020 10:19:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eVO3zQR+iEgn
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Aug 2020 10:19:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C4663864EF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Aug 2020 10:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597141154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=09X4aaxeRy7786K3aAn8lJF+mFrpfZwelgc9Rj/h/cA=;
 b=TwOdQGiXLSb4+oIAcExRyiwB4IcCfCoDH4jsZSfk+ryJjqv8GR/VhXrbrmaNpP8a1u6mfD
 voukCYIj7YvzsUpGU+zx3hFpKyoSYGFd0Pmu/PSHcxxeN12E4Tn77yUCEAA25tzod6XNhK
 9PbaXKGnNYNXBkZZdD1qtKO29V38kBw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-JN9dpxtOPt6_ZkI0Flkbfg-1; Tue, 11 Aug 2020 06:19:12 -0400
X-MC-Unique: JN9dpxtOPt6_ZkI0Flkbfg-1
Received: by mail-wr1-f72.google.com with SMTP id b13so5426400wrq.19
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Aug 2020 03:19:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=09X4aaxeRy7786K3aAn8lJF+mFrpfZwelgc9Rj/h/cA=;
 b=NM3CRq9EJSm4WKCESSdfiaKvqrdkdBwGMmJxA3V3JSy67JvaQF9GKOlRx4m4mnKFL7
 /J3SxXxf/AZ3To2K2FWu6mvzhc+K462dxpXkiyGvnKvXTIU7W2u1RcqjXm4tZYc/NcxX
 a/0I9mM/NJb7uEgeezX+VXd8sUrAHCzAnF4PCRl2qxdfcKOWhZKt6sfdSRFrBOy30/0Q
 m9La7PC+GrEZ02hPPg6YCabYj0pg5FSytpp1LAO12lgRgWJj+OrzTyOgzH9lrgAuA/6u
 9si9nERjPkFhuMh2JWxACaFMEpKqpbHi5YHv+Q8/RmlKWoGZu8drgw7zFmq+IsIWUH38
 L9kg==
X-Gm-Message-State: AOAM533+8M5SqBG1EL4R/spXR5cCu54et0d0McjiHMYxIr8JiEOQaiGo
 GvjhYXqQDP2X2KmkYt6fIKRh2Qr9j934SNBzaT/8TMXmikYJNgcNxBFeOHDyJYSlXQgV4loaF/B
 FnGylBHLj0YJIeygnVuaub4v6Yqm9FXRLcrFcThBnGw==
X-Received: by 2002:a5d:5588:: with SMTP id i8mr28830874wrv.177.1597141151441; 
 Tue, 11 Aug 2020 03:19:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpVw0KHTkWj9zAvvQ6fy1E+bZP88HTv291tUDUPRHDJbOscx/iYuJW4Tswm9/demRPo6L7cQ==
X-Received: by 2002:a5d:5588:: with SMTP id i8mr28830856wrv.177.1597141151241; 
 Tue, 11 Aug 2020 03:19:11 -0700 (PDT)
Received: from redhat.com (bzq-79-180-0-181.red.bezeqint.net. [79.180.0.181])
 by smtp.gmail.com with ESMTPSA id
 b11sm17091195wrq.32.2020.08.11.03.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2020 03:19:10 -0700 (PDT)
Date: Tue, 11 Aug 2020 06:19:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] vhost: vdpa: remove per device feature whitelist
Message-ID: <20200811061840-mutt-send-email-mst@kernel.org>
References: <20200720085043.16485-1-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200720085043.16485-1-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm@vger.kernel.org, lulu@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 eli@mellanox.com
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

On Mon, Jul 20, 2020 at 04:50:43PM +0800, Jason Wang wrote:
> We used to have a per device feature whitelist to filter out the
> unsupported virtio features. But this seems unnecessary since:
> 
> - the main idea behind feature whitelist is to block control vq
>   feature until we finalize the control virtqueue API. But the current
>   vhost-vDPA uAPI is sufficient to support control virtqueue. For
>   device that has hardware control virtqueue, the vDPA device driver
>   can just setup the hardware virtqueue and let userspace to use
>   hardware virtqueue directly. For device that doesn't have a control
>   virtqueue, the vDPA device driver need to use e.g vringh to emulate
>   a software control virtqueue.
> - we don't do it in virtio-vDPA driver
> 
> So remove this limitation.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>


Thinking about it, should we block some bits?
E.g. access_platform?
they depend on qemu not vdpa ...

> ---
>  drivers/vhost/vdpa.c | 37 -------------------------------------
>  1 file changed, 37 deletions(-)
> 
> diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
> index 77a0c9fb6cc3..f7f6ddd681ce 100644
> --- a/drivers/vhost/vdpa.c
> +++ b/drivers/vhost/vdpa.c
> @@ -26,35 +26,6 @@
>  
>  #include "vhost.h"
>  
> -enum {
> -	VHOST_VDPA_FEATURES =
> -		(1ULL << VIRTIO_F_NOTIFY_ON_EMPTY) |
> -		(1ULL << VIRTIO_F_ANY_LAYOUT) |
> -		(1ULL << VIRTIO_F_VERSION_1) |
> -		(1ULL << VIRTIO_F_IOMMU_PLATFORM) |
> -		(1ULL << VIRTIO_F_RING_PACKED) |
> -		(1ULL << VIRTIO_F_ORDER_PLATFORM) |
> -		(1ULL << VIRTIO_RING_F_INDIRECT_DESC) |
> -		(1ULL << VIRTIO_RING_F_EVENT_IDX),
> -
> -	VHOST_VDPA_NET_FEATURES = VHOST_VDPA_FEATURES |
> -		(1ULL << VIRTIO_NET_F_CSUM) |
> -		(1ULL << VIRTIO_NET_F_GUEST_CSUM) |
> -		(1ULL << VIRTIO_NET_F_MTU) |
> -		(1ULL << VIRTIO_NET_F_MAC) |
> -		(1ULL << VIRTIO_NET_F_GUEST_TSO4) |
> -		(1ULL << VIRTIO_NET_F_GUEST_TSO6) |
> -		(1ULL << VIRTIO_NET_F_GUEST_ECN) |
> -		(1ULL << VIRTIO_NET_F_GUEST_UFO) |
> -		(1ULL << VIRTIO_NET_F_HOST_TSO4) |
> -		(1ULL << VIRTIO_NET_F_HOST_TSO6) |
> -		(1ULL << VIRTIO_NET_F_HOST_ECN) |
> -		(1ULL << VIRTIO_NET_F_HOST_UFO) |
> -		(1ULL << VIRTIO_NET_F_MRG_RXBUF) |
> -		(1ULL << VIRTIO_NET_F_STATUS) |
> -		(1ULL << VIRTIO_NET_F_SPEED_DUPLEX),
> -};
> -
>  /* Currently, only network backend w/o multiqueue is supported. */
>  #define VHOST_VDPA_VQ_MAX	2
>  
> @@ -79,10 +50,6 @@ static DEFINE_IDA(vhost_vdpa_ida);
>  
>  static dev_t vhost_vdpa_major;
>  
> -static const u64 vhost_vdpa_features[] = {
> -	[VIRTIO_ID_NET] = VHOST_VDPA_NET_FEATURES,
> -};
> -
>  static void handle_vq_kick(struct vhost_work *work)
>  {
>  	struct vhost_virtqueue *vq = container_of(work, struct vhost_virtqueue,
> @@ -255,7 +222,6 @@ static long vhost_vdpa_get_features(struct vhost_vdpa *v, u64 __user *featurep)
>  	u64 features;
>  
>  	features = ops->get_features(vdpa);
> -	features &= vhost_vdpa_features[v->virtio_id];
>  
>  	if (copy_to_user(featurep, &features, sizeof(features)))
>  		return -EFAULT;
> @@ -279,9 +245,6 @@ static long vhost_vdpa_set_features(struct vhost_vdpa *v, u64 __user *featurep)
>  	if (copy_from_user(&features, featurep, sizeof(features)))
>  		return -EFAULT;
>  
> -	if (features & ~vhost_vdpa_features[v->virtio_id])
> -		return -EINVAL;
> -
>  	if (ops->set_features(vdpa, features))
>  		return -EINVAL;
>  
> -- 
> 2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
