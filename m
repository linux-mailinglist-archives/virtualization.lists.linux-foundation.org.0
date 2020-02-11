Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B9634158D4E
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 12:12:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1B98A860FF;
	Tue, 11 Feb 2020 11:12:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EwcujDTznQ9d; Tue, 11 Feb 2020 11:12:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E87C381ECF;
	Tue, 11 Feb 2020 11:12:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9FD5C07FE;
	Tue, 11 Feb 2020 11:12:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3955EC07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 11:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 25D2087111
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 11:12:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rgfNaFEMlr26
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 11:12:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EEA6686CDC
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 11:12:47 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a6so3011643wme.2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 03:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=O5X47mhFdBLYII+ovipBMRQxOXlboZKFhxKg7XFoN3o=;
 b=ERJaH4WdRW0ujkxGNpUmtUfj0rViDwqFLC9BL1MevFpQfOGkTANgOPHTSLMrZjO6rs
 BMayBrXbRGPDa0buloq70PFLyGYcCbrY0i6XcrAshig/nVydh2dMJz3LDv33DgLUjjHx
 lHW9A4kLs9UpNzmcgEFwcBL5c8Ryv2EWHwwXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=O5X47mhFdBLYII+ovipBMRQxOXlboZKFhxKg7XFoN3o=;
 b=dqSHoIZjF3W1thmZgIvm4LrkmtpF8dwEHgNsAzhJcLvYxyXkIgxx7f8LHFZOmMUJRZ
 sFp7ypN2SSbmvmCTYSdng1WgX3UYghd1mTetvKjMw0fLY4QvB1kTPsPGC9H/8sg7Rnh5
 96gwwZ6/nSMBcI9SnXXV75bVNss45AatgaGDhTYU1PTf7LU+8LATXt2hiV+pEFBOUU2n
 TDu0ItyiKonrgIjubM69CcJhnTqANqcW5b6K+pTRKBMmT+6r+0+5ZCcLA6IfjTODvluG
 R7EQqWq9kZB/9FBlguE3eVM0i3DZGMdoMgJZaWiUWNea5tlTI2J6bap8TebzMP8LlaB7
 7dww==
X-Gm-Message-State: APjAAAV9pVQN1RRg6BwX0mOhMCrk62QDIdOhsZchrjjmzJ9oc90VoDL5
 lh59H9TX1/jmwZu+qMzR/PX0aQ==
X-Google-Smtp-Source: APXvYqwyriEXRgirz1+pAvxW4hFmbaoVms/VDpWOOn1vdmA234bgCJnsmZ4O4rizOcVpaq1uLsrWXw==
X-Received: by 2002:a7b:c19a:: with SMTP id y26mr5437918wmi.152.1581419566111; 
 Tue, 11 Feb 2020 03:12:46 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 18sm3378797wmf.1.2020.02.11.03.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 03:12:45 -0800 (PST)
Date: Tue, 11 Feb 2020 12:12:43 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3] drm/bochs: add drm_driver.release callback.
Message-ID: <20200211111243.GX43062@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, 
 open list <linux-kernel@vger.kernel.org>
References: <20200211095529.30449-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200211095529.30449-1-kraxel@redhat.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>
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

On Tue, Feb 11, 2020 at 10:55:29AM +0100, Gerd Hoffmann wrote:
> Call bochs_unload via drm_driver.release to make sure we release stuff
> when it is safe to do so.  Use drm_dev_{enter,exit,unplug} to avoid
> touching hardware after device removal.  Tidy up here and there.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Still no changelog? I mean if we'd have merge request or something I can
easily check the discussions, but with mailing lists it's all over and I
have 0 memory, so every time I see a patch without history I get to
reconstruct the review history again and figure out where we've been. Gets
old real fast.
-Daniel

> ---
>  drivers/gpu/drm/bochs/bochs_drv.c |  6 +++---
>  drivers/gpu/drm/bochs/bochs_hw.c  | 24 +++++++++++++++++++++++-
>  2 files changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bochs/bochs_drv.c b/drivers/gpu/drm/bochs/bochs_drv.c
> index 10460878414e..addb0568c1af 100644
> --- a/drivers/gpu/drm/bochs/bochs_drv.c
> +++ b/drivers/gpu/drm/bochs/bochs_drv.c
> @@ -23,7 +23,6 @@ static void bochs_unload(struct drm_device *dev)
>  
>  	bochs_kms_fini(bochs);
>  	bochs_mm_fini(bochs);
> -	bochs_hw_fini(dev);
>  	kfree(bochs);
>  	dev->dev_private = NULL;
>  }
> @@ -69,6 +68,7 @@ static struct drm_driver bochs_driver = {
>  	.major			= 1,
>  	.minor			= 0,
>  	DRM_GEM_VRAM_DRIVER,
> +	.release                = bochs_unload,
>  };
>  
>  /* ---------------------------------------------------------------------- */
> @@ -148,9 +148,9 @@ static void bochs_pci_remove(struct pci_dev *pdev)
>  {
>  	struct drm_device *dev = pci_get_drvdata(pdev);
>  
> +	drm_dev_unplug(dev);
>  	drm_atomic_helper_shutdown(dev);
> -	drm_dev_unregister(dev);
> -	bochs_unload(dev);
> +	bochs_hw_fini(dev);
>  	drm_dev_put(dev);
>  }
>  
> diff --git a/drivers/gpu/drm/bochs/bochs_hw.c b/drivers/gpu/drm/bochs/bochs_hw.c
> index b615b7dfdd9d..952199cc0462 100644
> --- a/drivers/gpu/drm/bochs/bochs_hw.c
> +++ b/drivers/gpu/drm/bochs/bochs_hw.c
> @@ -4,6 +4,7 @@
>  
>  #include <linux/pci.h>
>  
> +#include <drm/drm_drv.h>
>  #include <drm/drm_fourcc.h>
>  
>  #include "bochs.h"
> @@ -194,6 +195,8 @@ void bochs_hw_fini(struct drm_device *dev)
>  {
>  	struct bochs_device *bochs = dev->dev_private;
>  
> +	/* TODO: shot down existing vram mappings */
> +
>  	if (bochs->mmio)
>  		iounmap(bochs->mmio);
>  	if (bochs->ioports)
> @@ -207,6 +210,11 @@ void bochs_hw_fini(struct drm_device *dev)
>  void bochs_hw_setmode(struct bochs_device *bochs,
>  		      struct drm_display_mode *mode)
>  {
> +	int idx;
> +
> +	if (!drm_dev_enter(bochs->dev, &idx))
> +		return;
> +
>  	bochs->xres = mode->hdisplay;
>  	bochs->yres = mode->vdisplay;
>  	bochs->bpp = 32;
> @@ -232,11 +240,18 @@ void bochs_hw_setmode(struct bochs_device *bochs,
>  
>  	bochs_dispi_write(bochs, VBE_DISPI_INDEX_ENABLE,
>  			  VBE_DISPI_ENABLED | VBE_DISPI_LFB_ENABLED);
> +
> +	drm_dev_exit(idx);
>  }
>  
>  void bochs_hw_setformat(struct bochs_device *bochs,
>  			const struct drm_format_info *format)
>  {
> +	int idx;
> +
> +	if (!drm_dev_enter(bochs->dev, &idx))
> +		return;
> +
>  	DRM_DEBUG_DRIVER("format %c%c%c%c\n",
>  			 (format->format >>  0) & 0xff,
>  			 (format->format >>  8) & 0xff,
> @@ -256,13 +271,18 @@ void bochs_hw_setformat(struct bochs_device *bochs,
>  			  __func__, format->format);
>  		break;
>  	}
> +
> +	drm_dev_exit(idx);
>  }
>  
>  void bochs_hw_setbase(struct bochs_device *bochs,
>  		      int x, int y, int stride, u64 addr)
>  {
>  	unsigned long offset;
> -	unsigned int vx, vy, vwidth;
> +	unsigned int vx, vy, vwidth, idx;
> +
> +	if (!drm_dev_enter(bochs->dev, &idx))
> +		return;
>  
>  	bochs->stride = stride;
>  	offset = (unsigned long)addr +
> @@ -277,4 +297,6 @@ void bochs_hw_setbase(struct bochs_device *bochs,
>  	bochs_dispi_write(bochs, VBE_DISPI_INDEX_VIRT_WIDTH, vwidth);
>  	bochs_dispi_write(bochs, VBE_DISPI_INDEX_X_OFFSET, vx);
>  	bochs_dispi_write(bochs, VBE_DISPI_INDEX_Y_OFFSET, vy);
> +
> +	drm_dev_exit(idx);
>  }
> -- 
> 2.18.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
