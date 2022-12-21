Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C95652BC9
	for <lists.virtualization@lfdr.de>; Wed, 21 Dec 2022 04:25:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B40AC61012;
	Wed, 21 Dec 2022 03:25:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B40AC61012
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ItIf7A/k
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5U30N1kWAZTW; Wed, 21 Dec 2022 03:25:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9532E61014;
	Wed, 21 Dec 2022 03:25:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9532E61014
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DDAE8C0070;
	Wed, 21 Dec 2022 03:25:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 78D4FC0070
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Dec 2022 03:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A89940B1D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Dec 2022 03:24:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A89940B1D
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=ItIf7A/k
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GhtR13Mn78lg
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Dec 2022 03:24:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D51040B15
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D51040B15
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Dec 2022 03:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671593044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qGspaHzQPxqTwdTzEM+6CxFY6yjXuHAKATnBqhR/cIw=;
 b=ItIf7A/kSmEM080v167pyAImRjonYafxaH8lttBz4NKhzR53v2T1HrS1KaNUWm/YMlFBfS
 oSNi0N55HR6pjh+It/i6xOWLmocd6R6mqCBF4To71/3G7UswBhlmm+somh9y470a1VPmdm
 aq2II+lWqmIBszNOy6mtiVP9dWDhdnQ=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-39-fEBoyeyKOgenLQQ2qvE4vQ-1; Tue, 20 Dec 2022 22:24:03 -0500
X-MC-Unique: fEBoyeyKOgenLQQ2qvE4vQ-1
Received: by mail-oo1-f72.google.com with SMTP id
 w18-20020a4a6d52000000b0049f209d84bbso6333688oof.7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Dec 2022 19:24:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qGspaHzQPxqTwdTzEM+6CxFY6yjXuHAKATnBqhR/cIw=;
 b=4UmwaqB0kVcHSHdHzRrRjGMeiraByC3+30lB2ipqlnWZFb7Euwao0kNwXVRbgjtQMg
 OZtK3gVJqz4Krecs0UdGfEkCZwEWf/G3JQRWYekjje98u2aTbcstN8CkbAj8VR8RJt8+
 fljMzWjcR0YttIEezgpvbi7/0EjmdbTeNKaQnYhugdY+ylq5IBasDxx18CO6G7Ju3Onm
 VYyEoy6N1qNpFD0Cv1+g8nZZRVPMi+Tk8MQdU1KxptFPnduSaYRyeD5xJwXKAtAwvNMD
 bgrRUPmmhu2B6ypBjeB85MkPEj5w9aaq3ubLMfo2e0iQ2gmn0MBa6WzMf9AtZbd+vJI5
 Xq1Q==
X-Gm-Message-State: AFqh2kqjcLS6s8bETBz+lA+9JnMF/oSLL9Kha9+XGDPAILml5B2+994K
 eEPswE9VcRNw+Jk98yby2SQc41bpqUQzCpoVKFRDxkbQbGJvOuWN5GwPo/0h2U5vQJMzbBulH4n
 vD7K21Jt1DPieIvdYYpiKb2GkFbnkEqnms5ZdUcPpnayciDV1HxwwHMc/3Q==
X-Received: by 2002:a9d:7843:0:b0:678:1eb4:3406 with SMTP id
 c3-20020a9d7843000000b006781eb43406mr25004otm.237.1671593042466; 
 Tue, 20 Dec 2022 19:24:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu6qY57e2GgcRHWrfthleF4uh/gauFFEArM3SE5nEJmGcPQ8lmsJLiuqe4JznhtR/YQJA67yWVZFf3UWvSworo=
X-Received: by 2002:a9d:7843:0:b0:678:1eb4:3406 with SMTP id
 c3-20020a9d7843000000b006781eb43406mr24997otm.237.1671593042237; Tue, 20 Dec
 2022 19:24:02 -0800 (PST)
MIME-Version: 1.0
References: <20221220112340.518841-1-mst@redhat.com>
In-Reply-To: <20221220112340.518841-1-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 21 Dec 2022 11:23:51 +0800
Message-ID: <CACGkMEvwwBSkeUaOJKYB2VTc0HT60sWfLFSNwcrEzyDWu9Aj2g@mail.gmail.com>
Subject: Re: [PATCH] virtio-blk: fix probe without CONFIG_BLK_DEV_ZONED
To: "Michael S. Tsirkin" <mst@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Anders Roxell <anders.roxell@linaro.org>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-block@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
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

On Tue, Dec 20, 2022 at 7:23 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> When building without CONFIG_BLK_DEV_ZONED, VIRTIO_BLK_F_ZONED
> is excluded from array of driver features.
> As a result virtio_has_feature panics in virtio_check_driver_offered_feature
> since that by design verifies that a feature we are checking for
> is listed in the feature array.
>
> To fix, replace the call to virtio_has_feature with a stub.
>
> Tested-by: Anders Roxell <anders.roxell@linaro.org>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

> ---
>  drivers/block/virtio_blk.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> index 88b3639f8536..5ea1dc882a80 100644
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@ -760,6 +760,10 @@ static int virtblk_probe_zoned_device(struct virtio_device *vdev,
>         return ret;
>  }
>
> +static inline bool virtblk_has_zoned_feature(struct virtio_device *vdev)
> +{
> +       return virtio_has_feature(vdev, VIRTIO_BLK_F_ZONED);
> +}
>  #else
>
>  /*
> @@ -775,6 +779,11 @@ static inline int virtblk_probe_zoned_device(struct virtio_device *vdev,
>  {
>         return -EOPNOTSUPP;
>  }
> +
> +static inline bool virtblk_has_zoned_feature(struct virtio_device *vdev)
> +{
> +       return false;
> +}
>  #endif /* CONFIG_BLK_DEV_ZONED */
>
>  /* return id (s/n) string for *disk to *id_str
> @@ -1480,7 +1489,7 @@ static int virtblk_probe(struct virtio_device *vdev)
>         virtblk_update_capacity(vblk, false);
>         virtio_device_ready(vdev);
>
> -       if (virtio_has_feature(vdev, VIRTIO_BLK_F_ZONED)) {
> +       if (virtblk_has_zoned_feature(vdev)) {
>                 err = virtblk_probe_zoned_device(vdev, vblk, q);
>                 if (err)
>                         goto out_cleanup_disk;
> --
> MST
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
