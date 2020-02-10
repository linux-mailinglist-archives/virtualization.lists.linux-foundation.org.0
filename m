Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAE2157DEE
	for <lists.virtualization@lfdr.de>; Mon, 10 Feb 2020 15:55:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7B9FE824B0;
	Mon, 10 Feb 2020 14:55:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BgRs4Q15-HAz; Mon, 10 Feb 2020 14:55:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id ADBBD84103;
	Mon, 10 Feb 2020 14:55:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8A041C0171;
	Mon, 10 Feb 2020 14:55:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 98178C0171
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 14:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7E2F7203E1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 14:55:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BojSmHk+KO7e
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 14:55:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 08D26203BE
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 14:55:40 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id q9so626173wmj.5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 06:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=e6DHkRv/RjVLMoJccwFow7vvIDkBmRxpatiW9uqHzAA=;
 b=T3AIPwpHb40S1bpKetV7hO985S/I88xVqo8fkgncaFoZN33BL4HETEu++2ciOa8uFG
 4+msmny/lboaWn7mnopixrx1reZqDzIkhoAEflSmF/Rk01KUe7jk8RKOIWrN8RM8u+7m
 XKvVhnzIo54T6UE9cYaSQnZGDIP/Ql6gl7VIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=e6DHkRv/RjVLMoJccwFow7vvIDkBmRxpatiW9uqHzAA=;
 b=s0D+lSMV2Vzn3qpohk2ifNkSVDyuMJpHihm8n6Qhjx5K56Em7SZfd5iKKiCRgCSdix
 OOvQNuk8VDKjOtS7nQhIFKo6f5a1UjZo4pz3w1dNC415PyhtS4fA6I1ZEI3DZx+SAaMv
 EcdD/DK5unUvC7Nd3RjQduMdl/vk6GKFFf+CDh7ycz+I0WCtXbmPHH30BytSK2WB8Ufu
 hvIBpMY17e9UmqLAcWPzZydgVgMjpfrqUgRXqI3vlk8JoX0ipUcpJEzcjpuSeokndyrm
 isLPUJHcCjBfDeyg18r75I+rKN7+tHwnziH8kt+/E/pU9IqPb+pCE8e9g3AhyNPJ7+6u
 +WIw==
X-Gm-Message-State: APjAAAWC+oQH6e2K/K/eU7usoxWb81zdp3LfDBbWzF6UL8h9EqGT5E7b
 jt/pG9iBrREmBHS0fMq943DZlQ==
X-Google-Smtp-Source: APXvYqwyb3cBhEKTprq13qfJXLglASZPW0m/htnQi0Lz1UZwEiKsNxIUIoHqj1hTCGDthl5O4Ffi8A==
X-Received: by 2002:a1c:1b4d:: with SMTP id b74mr16308048wmb.33.1581346539278; 
 Mon, 10 Feb 2020 06:55:39 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n13sm887530wmd.21.2020.02.10.06.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 06:55:38 -0800 (PST)
Date: Mon, 10 Feb 2020 15:55:36 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2] drm/bochs: add drm_driver.release callback.
Message-ID: <20200210145536.GR43062@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, 
 open list <linux-kernel@vger.kernel.org>
References: <20200210093801.4773-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200210093801.4773-1-kraxel@redhat.com>
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

On Mon, Feb 10, 2020 at 10:38:01AM +0100, Gerd Hoffmann wrote:
> Call drm_dev_unregister() first in bochs_pci_remove().  Hook
> bochs_unload() into the new .release callback, to make sure cleanup
> is done when all users are gone.
> 
> Add ready bool to state struct and move bochs_hw_fini() call from
> bochs_unload() to bochs_pci_remove() to make sure hardware is not
> touched after bochs_pci_remove returns.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/bochs/bochs.h     |  1 +
>  drivers/gpu/drm/bochs/bochs_drv.c |  6 +++---
>  drivers/gpu/drm/bochs/bochs_hw.c  | 14 ++++++++++++++
>  3 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bochs/bochs.h b/drivers/gpu/drm/bochs/bochs.h
> index 917767173ee6..f6bce8669274 100644
> --- a/drivers/gpu/drm/bochs/bochs.h
> +++ b/drivers/gpu/drm/bochs/bochs.h
> @@ -57,6 +57,7 @@ struct bochs_device {
>  	unsigned long  fb_base;
>  	unsigned long  fb_size;
>  	unsigned long  qext_size;
> +	bool           ready;
>  
>  	/* mode */
>  	u16 xres;
> diff --git a/drivers/gpu/drm/bochs/bochs_drv.c b/drivers/gpu/drm/bochs/bochs_drv.c
> index 10460878414e..60b5492739ef 100644
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
> -	drm_atomic_helper_shutdown(dev);
>  	drm_dev_unregister(dev);
> -	bochs_unload(dev);
> +	drm_atomic_helper_shutdown(dev);
> +	bochs_hw_fini(dev);
>  	drm_dev_put(dev);
>  }
>  
> diff --git a/drivers/gpu/drm/bochs/bochs_hw.c b/drivers/gpu/drm/bochs/bochs_hw.c
> index b615b7dfdd9d..48c1a6a8b026 100644
> --- a/drivers/gpu/drm/bochs/bochs_hw.c
> +++ b/drivers/gpu/drm/bochs/bochs_hw.c
> @@ -168,6 +168,7 @@ int bochs_hw_init(struct drm_device *dev)
>  	}
>  	bochs->fb_base = addr;
>  	bochs->fb_size = size;
> +	bochs->ready = true;
>  
>  	DRM_INFO("Found bochs VGA, ID 0x%x.\n", id);
>  	DRM_INFO("Framebuffer size %ld kB @ 0x%lx, %s @ 0x%lx.\n",
> @@ -194,6 +195,10 @@ void bochs_hw_fini(struct drm_device *dev)
>  {
>  	struct bochs_device *bochs = dev->dev_private;
>  
> +	bochs->ready = false;
> +
> +	/* TODO: shot down existing vram mappings */

Aside: I'm mildly hopefull that we could do this with a generic helper,
both punching out all current ptes and replacing them with something
dummy. Since replacing them with nothing and refusing to fault stuff is
probably not going to work out well - userspace will crash&burn too much.

> +
>  	if (bochs->mmio)
>  		iounmap(bochs->mmio);
>  	if (bochs->ioports)
> @@ -207,6 +212,9 @@ void bochs_hw_fini(struct drm_device *dev)
>  void bochs_hw_setmode(struct bochs_device *bochs,
>  		      struct drm_display_mode *mode)
>  {
> +	if (!bochs->ready)
> +		return;

drm_dev_enter/exit is the primitive you're looking for I think. Don't hand
roll your own racy version of this. btw changelog in the patch missing.
Personally I'd split out the drm_dev_enter/exit in a 2nd patch, but up to
you.

The remove/release split looks correct to me now.
-Daniel


> +
>  	bochs->xres = mode->hdisplay;
>  	bochs->yres = mode->vdisplay;
>  	bochs->bpp = 32;
> @@ -237,6 +245,9 @@ void bochs_hw_setmode(struct bochs_device *bochs,
>  void bochs_hw_setformat(struct bochs_device *bochs,
>  			const struct drm_format_info *format)
>  {
> +	if (!bochs->ready)
> +		return;
> +
>  	DRM_DEBUG_DRIVER("format %c%c%c%c\n",
>  			 (format->format >>  0) & 0xff,
>  			 (format->format >>  8) & 0xff,
> @@ -264,6 +275,9 @@ void bochs_hw_setbase(struct bochs_device *bochs,
>  	unsigned long offset;
>  	unsigned int vx, vy, vwidth;
>  
> +	if (!bochs->ready)
> +		return;
> +
>  	bochs->stride = stride;
>  	offset = (unsigned long)addr +
>  		y * bochs->stride +
> -- 
> 2.18.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
