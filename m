Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 679CC1D2B8B
	for <lists.virtualization@lfdr.de>; Thu, 14 May 2020 11:35:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2AFBB22270;
	Thu, 14 May 2020 09:35:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UBGPUOIOPom1; Thu, 14 May 2020 09:35:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A2EAA2262E;
	Thu, 14 May 2020 09:35:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 88D1EC088F;
	Thu, 14 May 2020 09:35:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0C668C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 09:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E967185E7C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 09:35:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I2kBU5if0X5W
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 09:35:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 66C7685E77
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 09:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589448935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MxlYjlDzOriDYwrln025WxRAPDTwzmlMvS6Zl9QdE7k=;
 b=XbaAlCnPhcttr+Qnr1ADKBJ8uumue5GFkvObHEYU8nkum3oB3AOCTcn6WfjANlp3L0vcJP
 gGPsYGEgP+gqrnFcdpUwpEfFnWbhQrPtPib1eVh4hz7xoK1uRBeByGnPsjpR2X4l6QjaZE
 ZKx11USwR6Clri9W0vmLkxQmiT94uUs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-70eEo4RJOPGNWUlQm1TMnw-1; Thu, 14 May 2020 05:35:31 -0400
X-MC-Unique: 70eEo4RJOPGNWUlQm1TMnw-1
Received: by mail-wm1-f69.google.com with SMTP id m123so6449167wmm.5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 02:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MxlYjlDzOriDYwrln025WxRAPDTwzmlMvS6Zl9QdE7k=;
 b=SVcJw741tsBvTTz/P1nHNoT4QT+8KI8bJ3ofZ7LxV+IE4GckAwc25OMDddq11ICs0c
 JWyiFHis5pmA3w12XrFS0dtTZkqnr6t/f3158cOzXx/E9qUjv5bevxbEkXq1smYaqtQs
 K95f28S6c9w2TW2PNKeeMTDD0HpQ+7QuCsf3XM3jg7DZRTp3AL86wKLvQSQSxFqD2zl1
 9s5+rmZ3i4TBBCiLB/94RNFlJ8StBIicHBO5nlFHagRh8oWeHN/d20KA/POz7Vc0oo54
 FJfi3fpdDWZryLLx3AjNixYDVY4U1FukNktVXZcr5ETmNMNc2VYGqgru/Ywo26IP6w6Y
 V+AQ==
X-Gm-Message-State: AOAM5318vo5tzJ+nQ2Fi8X+nKDDFVf02sJF+xpbnd6TiYt1ZTs1UqItj
 XOi9Ox3WxyTyjKWkeehx19OoDKZ570OA3m6lxr1MAeYMTHLegxp5gBApoC2AwASO3Sv/nT3Mqkz
 5oDrK45PCYMufl1nxfauTv6tN3sKt+krCHVOv/6onpg==
X-Received: by 2002:a05:6000:1241:: with SMTP id
 j1mr4448998wrx.42.1589448930113; 
 Thu, 14 May 2020 02:35:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKDl1RC/zcgEoqR2ytd9DBbtwExDt1svBWxxRRKPgfIhZSnBzZb6Xx0itJ9CusOfpzdLTyhg==
X-Received: by 2002:a05:6000:1241:: with SMTP id
 j1mr4448969wrx.42.1589448929833; 
 Thu, 14 May 2020 02:35:29 -0700 (PDT)
Received: from redhat.com (bzq-79-179-68-225.red.bezeqint.net. [79.179.68.225])
 by smtp.gmail.com with ESMTPSA id z11sm3069653wrr.32.2020.05.14.02.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 02:35:29 -0700 (PDT)
Date: Thu, 14 May 2020 05:35:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] vdpa_sim: do not reset IOTLB during device reset
Message-ID: <20200514053233-mutt-send-email-mst@kernel.org>
References: <20200514072549.29694-1-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200514072549.29694-1-jasowang@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

On Thu, May 14, 2020 at 03:25:49PM +0800, Jason Wang wrote:
> We reset IOTLB during device reset this breaks the assumption that the
> mapping needs to be controlled via vDPA DMA ops explicitly in a
> incremental way. So the networking will be broken after e.g a guest
> reset.
> 
> Fix this by not resetting the IOTLB during device reset.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>


That's a bit weird, and can be a security risk if state
leaks between security domains through this.
And there's 0 chance any hardware implementation can
keep the translations around across resets - there
is simply nowhere to keep them.

IMHO we need a different way to make this work, simulator
needs to look like a hardware device as much as possible.


> ---
>  drivers/vdpa/vdpa_sim/vdpa_sim.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
> index 7957d2d41fc4..cc5525743a25 100644
> --- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
> +++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
> @@ -119,8 +119,6 @@ static void vdpasim_reset(struct vdpasim *vdpasim)
>  	for (i = 0; i < VDPASIM_VQ_NUM; i++)
>  		vdpasim_vq_reset(&vdpasim->vqs[i]);
>  
> -	vhost_iotlb_reset(vdpasim->iommu);
> -
>  	vdpasim->features = 0;
>  	vdpasim->status = 0;
>  	++vdpasim->generation;
> -- 
> 2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
