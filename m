Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FF740A3E2
	for <lists.virtualization@lfdr.de>; Tue, 14 Sep 2021 04:53:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B9FD403AA;
	Tue, 14 Sep 2021 02:52:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tUALKQ1KqBXp; Tue, 14 Sep 2021 02:52:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id F2A67403A5;
	Tue, 14 Sep 2021 02:52:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 84C30C001E;
	Tue, 14 Sep 2021 02:52:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 92CAEC000D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Sep 2021 02:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F540400C7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Sep 2021 02:52:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zpkHLNyyX7n7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Sep 2021 02:52:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BAA7C400AE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Sep 2021 02:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631587973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4XDZ2tkFeiXB4kEufTQP/b4VTW5syjeDvJ0p0wK3gec=;
 b=Td9QS4NZICDOIB7yhnjvkKVGALcF2Wa6ubCAQnQQo2+yXnHcm9+c3RJvy1V/vaunqdoxgU
 pXZaRGNtGnA5KPmCL4NXR0tNyYR8owFlI/sZw4OLMQNuClIl8keR+keJmbdg9UOtbOzOZR
 CyLYY9O69qoCgkqDEIXQVprBSZuFyCc=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-LPsqIa71P9GR0wD6rveTEw-1; Mon, 13 Sep 2021 22:52:52 -0400
X-MC-Unique: LPsqIa71P9GR0wD6rveTEw-1
Received: by mail-lj1-f198.google.com with SMTP id
 p11-20020a2ea40b000000b001d68cffb055so5171586ljn.6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Sep 2021 19:52:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4XDZ2tkFeiXB4kEufTQP/b4VTW5syjeDvJ0p0wK3gec=;
 b=wQ/MQ736jInFbj7SFpkau4X8ZXO+jwQPr7J1+mJklC4uTVxyEZcOZ1xXusc1qsxU2M
 BHzD+WwR58Yw3eppPCEcuW6CuYaJJBgWfsUASYsd6FX8qToUk97iGVbHu9FuAuQ59sq9
 22kci/fvQPpqh8a2bWdp41b6eRZ0Yg+olDA5m9z7vUV9It2S+YlVOu6nASHuyd8Ntmz0
 pkwisexrTHcLcZCRyGVFvWs5prHv2tr711gn674icXuCYy+sJpiI+SBZm5ihccxxMmAj
 etKNmdcqJOanIWPIIil5/Ce1q4GB7RBKtzbUq6WAXJincKADCbAnnJFutDrUO1UyEa3a
 d7fg==
X-Gm-Message-State: AOAM530PtFxL/Tzn4o0nKLK1MRvex04MT/xEjAORax5MXMoOXRua1H/s
 t/hdAnGvEy6/32EP5RHZuwgo6V7exO1hNdL1bDhU2np/qp0XhzDaEVsZWum1GdLqGvHe359JEqt
 uQ3gHvaNisJknaBynfkALfqsskGvmqnuHP/y5Xy4N2Bvgcrjg1SQnkmkJHw==
X-Received: by 2002:a2e:99d9:: with SMTP id l25mr13205550ljj.217.1631587970872; 
 Mon, 13 Sep 2021 19:52:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx98DmTLdoKBopJaOi6oamlYSV7CQtrW3e7weyzGjh2rkrlvCl7OOlgEhJzPo8druoAxekA86dJAbfFoQ1mhs4=
X-Received: by 2002:a2e:99d9:: with SMTP id l25mr13205533ljj.217.1631587970697; 
 Mon, 13 Sep 2021 19:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210909063652.46880-1-elic@nvidia.com>
In-Reply-To: <20210909063652.46880-1-elic@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 14 Sep 2021 10:52:39 +0800
Message-ID: <CACGkMEuNHXspEf=gQ7jSoDQBnXLnw8kR6z67YFZwfEBK5wVm3Q@mail.gmail.com>
Subject: Re: [PATCH] vdpa/mlx5: Clear ready indication for control VQ
To: Eli Cohen <elic@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: eperezma <eperezma@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 mst <mst@redhat.com>
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

On Thu, Sep 9, 2021 at 2:37 PM Eli Cohen <elic@nvidia.com> wrote:
>
> When clearing VQs ready indication for the data VQs, do the same for the
> control VQ.
>
> Fixes: 5262912ef3cf ("vdpa/mlx5: Add support for control VQ and MAC setting")
> Signed-off-by: Eli Cohen <elic@nvidia.com>
> ---
>  drivers/vdpa/mlx5/net/mlx5_vnet.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/mlx5_vnet.c
> index 294ba05e6fc9..64dfd0f500d2 100644
> --- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
> +++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
> @@ -2145,6 +2145,8 @@ static void clear_vqs_ready(struct mlx5_vdpa_net *ndev)
>
>         for (i = 0; i < ndev->mvdev.max_vqs; i++)
>                 ndev->vqs[i].ready = false;
> +
> +       ndev->mvdev.cvq.ready = false;
>  }
>

Acked-by: Jason Wang <jasowang@redhat.com>

>  static void mlx5_vdpa_set_status(struct vdpa_device *vdev, u8 status)
> --
> 2.32.0
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
