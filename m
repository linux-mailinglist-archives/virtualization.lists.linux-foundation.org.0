Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB6B488EBA
	for <lists.virtualization@lfdr.de>; Mon, 10 Jan 2022 03:44:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 485DF6080B;
	Mon, 10 Jan 2022 02:44:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l_FukuMWanmm; Mon, 10 Jan 2022 02:44:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 058F860792;
	Mon, 10 Jan 2022 02:44:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 743B2C006E;
	Mon, 10 Jan 2022 02:44:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA0A9C001E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Jan 2022 02:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 985C76080B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Jan 2022 02:44:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lspdA88qy3Ds
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Jan 2022 02:44:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C133260792
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Jan 2022 02:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641782679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SR5LJDR7Yuo7sdem+SKLe4DRKmUm4dsotpVpoRAp1vk=;
 b=eA0ndOS9H4NqskUg593/5V/ktI7rzM0susY7IW56A+F8v+I/K4oaH3dfTJ3v7CJfdAAvT0
 oZ0zSOYrCcXUg7xkai55+3KFGWgp+Ju5OU8MllkxQ98RlndB/q2f52mIXJ3fEuT4glwai/
 5nrIHdiNfC+JGpepp0Yw1QLZhIAdalQ=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-dOTyz-UVOdOolsprNPdpPQ-1; Sun, 09 Jan 2022 21:44:33 -0500
X-MC-Unique: dOTyz-UVOdOolsprNPdpPQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 28-20020ac24d5c000000b00425c507cfc0so5600837lfp.20
 for <virtualization@lists.linux-foundation.org>;
 Sun, 09 Jan 2022 18:44:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SR5LJDR7Yuo7sdem+SKLe4DRKmUm4dsotpVpoRAp1vk=;
 b=SJbcIfwPC0ORMmiU3wFjTUuGz1atcQsrsmHlMgHVlfny8r2+dEUT7/EYvDkJfU4CuE
 v4l/9l6khCLbpRzAM5Z2VWt0x8RflirPclowOPqyZTqFSY5xFaUA0DPDIEUi1MA5Tb81
 e4UlXPoHO33i2Zuim+dw/7/cGX1Vxk+wTLXIpXtWHWJDw8ILFGVvmAhjahFzrAHIsanU
 wxAdaYTKmepPW0VyoISRxdV3ow/xNF/KwLwUSnIGV+gfaB/nibkuOfikOlRb7br+3sjI
 psJ+6E2ErQ9JXHRH5Dv6wB0vipUT7Nsmm3vx0X7I5FRqo+U8r4nQ62drwEU0Y6jCzxLe
 S8kw==
X-Gm-Message-State: AOAM532yjOPAeM0n1SH+fZggtaEYauqDosmDWPT/yPs1nYi/g0DKfOmX
 kZSypO1cIEyNKoCXbDTk3IDtHVD1HyNVQll+U6B2qv8cbKDdqS7jk0x3TqC9o2mKdPkYABjB+3z
 qSMEnUyTo222YNW4DwYNyJeuX0o9tsvsRMPJJ+BXaVfj+ybhN0Cgsl62E3g==
X-Received: by 2002:a2e:a40c:: with SMTP id p12mr60731341ljn.369.1641782672102; 
 Sun, 09 Jan 2022 18:44:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyn4yn6mbjfPrY7TWHh0U6HAgbKlHep+6bMRtnLiIJiqqtpsxe5AgSHe8T+kBeNVWG30nDbYW36WR7C6Guxyhg=
X-Received: by 2002:a2e:a40c:: with SMTP id p12mr60731331ljn.369.1641782671854; 
 Sun, 09 Jan 2022 18:44:31 -0800 (PST)
MIME-Version: 1.0
References: <20220108180041.4601-1-mst@redhat.com>
In-Reply-To: <20220108180041.4601-1-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 10 Jan 2022 10:44:20 +0800
Message-ID: <CACGkMEv4YY7z2eF2EHt=KvmJ+se5cAs3vRP0Wi2HdRYFhe80Hw@mail.gmail.com>
Subject: Re: [PATCH] vdpa/mlx5: fix endian-ness for max vqs
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Eli Cohen <elic@nvidia.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>
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

On Sun, Jan 9, 2022 at 2:00 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> sparse warnings: (new ones prefixed by >>)
> >> drivers/vdpa/mlx5/net/mlx5_vnet.c:1247:23: sparse: sparse: cast to restricted __le16
> >> drivers/vdpa/mlx5/net/mlx5_vnet.c:1247:23: sparse: sparse: cast from restricted __virtio16
>
> > 1247                  num = le16_to_cpu(ndev->config.max_virtqueue_pairs);
>
> Address this using the appropriate wrapper.
>
> Fixes: 7620d51af29a ("vdpa/mlx5: Support configuring max data virtqueue")
> Cc: "Eli Cohen" <elic@nvidia.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  drivers/vdpa/mlx5/net/mlx5_vnet.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/mlx5_vnet.c
> index 84b1919015ce..d1ff65065fb1 100644
> --- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
> +++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
> @@ -1242,7 +1242,8 @@ static int create_rqt(struct mlx5_vdpa_net *ndev)
>         if (!(ndev->mvdev.actual_features & BIT_ULL(VIRTIO_NET_F_MQ)))
>                 num = 1;
>         else
> -               num = le16_to_cpu(ndev->config.max_virtqueue_pairs);
> +               num = mlx5vdpa16_to_cpu(&ndev->mvdev,
> +                                       ndev->config.max_virtqueue_pairs);
>
>         max_rqt = min_t(int, roundup_pow_of_two(num),
>                         1 << MLX5_CAP_GEN(ndev->mvdev.mdev, log_max_rqt_size));
> --
> MST
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
