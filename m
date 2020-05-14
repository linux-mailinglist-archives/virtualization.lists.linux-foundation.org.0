Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B522E1D2FCB
	for <lists.virtualization@lfdr.de>; Thu, 14 May 2020 14:31:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 65FEB87560;
	Thu, 14 May 2020 12:31:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4KTozJc7_kXR; Thu, 14 May 2020 12:31:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E715187577;
	Thu, 14 May 2020 12:31:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C1BBFC016F;
	Thu, 14 May 2020 12:31:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A895C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 12:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 40A7D226B7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 12:31:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YM04RzdxPY8q
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 12:31:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 8356A20553
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 12:31:15 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id l17so3837891wrr.4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 05:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=5L3ztVTSKOLB244G65ZSGtUQqMEEP8hy+Z9x9uH8zas=;
 b=XP2/KMs+gTj7Eg8apXs3bcyaa/CJ9Cg2niFlnTGlqvE5RTQdQT7MpwKkBEqB+JQ8aL
 4UuBD6l5ST1XjJm02s9KnqjR8A0Y1UzmK1O1Om0k1jpP0vfs6D62Kyro76gDWMWI47HK
 HLOKTGmtd6jGITv2+c5urjo14QMTiHh/Mwycg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=5L3ztVTSKOLB244G65ZSGtUQqMEEP8hy+Z9x9uH8zas=;
 b=GS1JR4kxcAX2iASpiPwySNBd79eg+IHWRyv/BBqzdUY9RMoMjjBRTefklH3pGG3ktg
 ZqYeqqOVdT0kJDOlCStBJ0Zs9S+DLiBW6us1lb9PKtKhZyfjMwOXqFB5LQ9il7CYDwr6
 FlgRFXoUbs1nuz2I5cZmSvpgmhkkHME9LyuftKm+3ExnRsNT1LsV0rM7lcJOXpz1jxMa
 EVDh/W1HeSQ9mLCir7MKYeGevsZ9++IXt+8qoifZT/G0+ErA5w3a7q6qIcu/9v2ZrrGw
 NQeRehYWHZKYx7SxvxVktTOa6WHYgUMfYpzZM3OiLJktKjrOZfLaXLzoHwMGrk7FDK6O
 +13Q==
X-Gm-Message-State: AOAM530iRv50w+UkHCn58Ptm/irEMsWO3LQ6EhIWnKwJGRR1GYpvpYhH
 +W+fFtnsePNATuSJJ9GvdWN0xA==
X-Google-Smtp-Source: ABdhPJzO26HExPt8oSSN1CG6GZWaJbzzOwmK5nuzbTE+eMp+2gFxCEKVNXKRppRj4egecVynUjKUXg==
X-Received: by 2002:adf:f1c4:: with SMTP id z4mr5670993wro.25.1589459474052;
 Thu, 14 May 2020 05:31:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o15sm3194658wrw.65.2020.05.14.05.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 05:31:13 -0700 (PDT)
Date: Thu, 14 May 2020 14:31:11 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 1/4] dma-buf: add support for virtio exported objects
Message-ID: <20200514123111.GQ206103@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 David Stevens <stevensd@chromium.org>,
 Tomasz Figa <tfiga@chromium.org>, David Airlie <airlied@linux.ie>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 virtio-dev@lists.oasis-open.org
References: <20200311112004.47138-1-stevensd@chromium.org>
 <20200311112004.47138-2-stevensd@chromium.org>
 <CAKMK7uHFgiHLe9oiFBr-VR-6rU9-hLTpBTEVNh0ezyj54u70jw@mail.gmail.com>
 <20200514075952.zuc3zjtmasaqrw75@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200514075952.zuc3zjtmasaqrw75@sirius.home.kraxel.org>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 virtio-dev@lists.oasis-open.org, Thomas Zimmermann <tzimmermann@suse.de>,
 "Michael S . Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 David Stevens <stevensd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
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

On Thu, May 14, 2020 at 09:59:52AM +0200, Gerd Hoffmann wrote:
>   Hi,
> 
> > - for the runtime upcasting the usual approach is to check the ->ops
> > pointer. Which means that would need to be the same for all virtio
> > dma_bufs, which might get a bit awkward. But I'd really prefer we not
> > add allocator specific stuff like this to dma-buf.
> 
> This is exactly the problem, it gets messy quickly, also when it comes
> to using the drm_prime.c helpers ...

drm_prime.c helpers (not the core bits) exist becaues nvidia needed
something that wasnt EXPORT_SYMBOL_GPL.

I wouldn't shed a big tear if they don't fit anymore, they're kinda not
great to begin with. Much midlayer, not much of valued added, but at least
the _GPL is gone.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
