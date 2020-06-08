Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C72A1F15B8
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 11:43:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 03B5687EA1;
	Mon,  8 Jun 2020 09:43:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HLEgOujJeYTZ; Mon,  8 Jun 2020 09:43:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8F8EB87EA6;
	Mon,  8 Jun 2020 09:43:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6FE60C016F;
	Mon,  8 Jun 2020 09:43:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1777DC016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 05B5985F0A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:43:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oK68wYi-UJ9F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:43:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 81CBE80CDD
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591609414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U5U6dQ9lCe7itmDsGxNs3cBdub7pl5VNIW2XNh4JFS0=;
 b=BlggRPRvj/nrdHOUdvQL0pw5laER4nXiMWuQo7gXZztcXk64wPoB11sDLKt3wlfWz3fQ1Y
 phyWmxMxktMv1uCnRDPQrEtAY4VE2eXl5XwwduGev02HaSAX9Xgq0r6MZmu2P5b5FN+s/j
 qIW4Qhk8JpxnGAU1wrlH5YryIXoj4As=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-3h5vKZDCOrC-uWybtSmsKg-1; Mon, 08 Jun 2020 05:43:33 -0400
X-MC-Unique: 3h5vKZDCOrC-uWybtSmsKg-1
Received: by mail-wm1-f71.google.com with SMTP id 11so3729355wmj.6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 08 Jun 2020 02:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=U5U6dQ9lCe7itmDsGxNs3cBdub7pl5VNIW2XNh4JFS0=;
 b=Ub02KfpgNv5g8o6Pm9efZ+OoJV4uWa5NGzTxj40k4FGbZAzLr+lt0wsw/OL0r3WTMl
 U6u8D6COmafs8BGlscqCj8TxRSbRCeGtTYN4yobtNnsaU6eWvAvZA8GXDl+wY9YHOV0b
 cZRfbK1tzO1P2utVw3sgCJpPeTfWyid779i9IAhFptFVxcv+g/lX965vqES3qntMqIYA
 ZZylj/Gzbc5+Nz9MgPJtrpj8/7KPWpkO6Pos/GGTfO3K2xaGK6upI6yr1LwxkKsaV8fS
 ZYe4ZNpdHzJ0gwUH7BGAJyimLCfnxnjYDqC8yzsK+gloGBpzIMfZvauPnWgbMYgzJj1y
 ozvQ==
X-Gm-Message-State: AOAM532BdP6U8xApjd3dnAiw2Okc0+0cP9NkgECGdnML1ajx6c+lOIjP
 MKzZ1mDH7ZmUbFVk9DNsudvcdcObPUthMEdbJJhIuTPdKJ6U8jBbKMiHM5Q2xpl0+NCZZv2nLC9
 tflyG6+BNZVKD7R3AEqfUb7QejxXL/8Wk5jaJDROctg==
X-Received: by 2002:a1c:7c0e:: with SMTP id x14mr15017568wmc.1.1591609411312; 
 Mon, 08 Jun 2020 02:43:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9ub5wP+xupLuBkOQ4No1b88FQ9dkWFcatrNsLpDTfEgifdZsj9YIaaEa0/E6d/CL6f3lWtw==
X-Received: by 2002:a1c:7c0e:: with SMTP id x14mr15017554wmc.1.1591609411160; 
 Mon, 08 Jun 2020 02:43:31 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 u9sm18951734wme.16.2020.06.08.02.43.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 02:43:30 -0700 (PDT)
Date: Mon, 8 Jun 2020 05:43:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v3 4/4] drm/virtio: Support virtgpu exported resources
Message-ID: <20200608054234-mutt-send-email-mst@kernel.org>
References: <20200311112004.47138-1-stevensd@chromium.org>
 <20200311112004.47138-5-stevensd@chromium.org>
 <20200513123326-mutt-send-email-mst@kernel.org>
 <CAD=HUj5qcMLw__LfJizR6nzCR9Qmu21Sjk3i0j_8+=rxt1Hk=w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD=HUj5qcMLw__LfJizR6nzCR9Qmu21Sjk3i0j_8+=rxt1Hk=w@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 virtio-dev@lists.oasis-open.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
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

On Fri, May 15, 2020 at 04:26:15PM +0900, David Stevens wrote:
> > > +     if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_UUID)) {
> > > +             vgdev->has_resource_assign_uuid = true;
> > > +     }
> >
> >
> > Just a question: this relies on DMA bufs so I assume it is
> > not really assumed to work when DMA API is bypassed, right?
> > Rather than worry what does it mean, how about just
> > disabling  this feature without PLATFORM_DMA for now?
> 
> By PLATFORM_DMA, do you mean CONFIG_DMA_SHARED_BUFFER?

Sorry, no. I mean VIRTIO_F_IOMMU_PLATFORM which in the
future will be renamed to VIRTIO_F_PLATFORM_ACCESS.


> Virtio-gpu
> depends on DRM, which selects that feature. So I think DMA bufs should
> always be available when virtio-gpu is present.
> 
> -David

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
