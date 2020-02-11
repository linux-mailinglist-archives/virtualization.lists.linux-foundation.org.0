Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 14172158B47
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 09:34:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8EE59824B0;
	Tue, 11 Feb 2020 08:34:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cd5DJh5jwZRs; Tue, 11 Feb 2020 08:34:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 936DD81B85;
	Tue, 11 Feb 2020 08:34:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7F864C07FE;
	Tue, 11 Feb 2020 08:34:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8B646C07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 08:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6B21D20450
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 08:34:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ty3oCYGdUWTP
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 08:34:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by silver.osuosl.org (Postfix) with ESMTPS id E7ADF20447
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 08:34:18 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id c84so2341114wme.4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 00:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=12qw/RFELavELZKsOq1yzoNyYhq/Ux+p6kyJPJeCcqc=;
 b=QI4VOXf3saIUDZus86WXKl/5G4HwG/Y1akgMO5N+Zghil5vjsjTK+Flc9x/BBjmGtf
 VbYX62Zkk1RcDpfJlb5YwCRepv0UavNrhSZsp7c+wuwoHBcbvfkUeRiuEGe6d2Hs2zx+
 HAz7E7DC78LgnltTfwXg24XFBDY5JYWfGFWBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=12qw/RFELavELZKsOq1yzoNyYhq/Ux+p6kyJPJeCcqc=;
 b=OZZXReflxDbj1TOM0VmbHgw9lVD4BOcfE8pBUoftcbl717BCMdMqGPC7HBFBMquVuZ
 oCuiVGkSBEDdKoXMGhklJJMsen4Gdpu0OfwBcMbEgenxtgL3QrR0i4CdK4efskUc7ymH
 bBXMXurs4ZGxsAm6A6545f2oWsiqMJ5ohyOFHzDZhaJOJjGXNOiccXxnwDLj3jgD9c0Y
 wm2ClAD9HGOjy35g6M0QBrnUrxW6Nz8/5NtGLJQTnl11eOR4gZzBHI4oJTymbmoPDVXr
 lb4Fm2P6W+uT2xd3ChQNi13maQL4Zm39lU89H4FptzKMXMjey3YIDIfSqvPQOuwyKWES
 QstQ==
X-Gm-Message-State: APjAAAUspH6Ci0jzveEYDN/PpXx8GizuBDCRMqx7k8hjxvrG7/ub0J5d
 qptRJuuaVIm1SDOxQjC09IYt9w==
X-Google-Smtp-Source: APXvYqyEaWqr2XnROAuhm5FRvC1dX2wrJbzfmgnLMEqqjLALysv8sqHunmyirob+p+K0RO4wYl3V2w==
X-Received: by 2002:a7b:c4c3:: with SMTP id g3mr4157625wmk.131.1581410057135; 
 Tue, 11 Feb 2020 00:34:17 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t81sm2857643wmg.6.2020.02.11.00.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 00:34:16 -0800 (PST)
Date: Tue, 11 Feb 2020 09:34:14 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2] drm/cirrus: add drm_driver.release callback.
Message-ID: <20200211083414.GT43062@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE"
 <virtualization@lists.linux-foundation.org>, 
 open list <linux-kernel@vger.kernel.org>
References: <20200210095310.22082-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200210095310.22082-1-kraxel@redhat.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE"
 <virtualization@lists.linux-foundation.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>
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

On Mon, Feb 10, 2020 at 10:53:10AM +0100, Gerd Hoffmann wrote:
> Move final cleanups from cirrus_pci_remove() to the new callback.
> Add drm_atomic_helper_shutdown() call to cirrus_pci_remove().
> 
> Set pointers to NULL after iounmap() and check them before using
> them to make sure we don't touch released hardware.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/cirrus/cirrus.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/cirrus/cirrus.c b/drivers/gpu/drm/cirrus/cirrus.c
> index a91fb0d7282c..128db11ed4d3 100644
> --- a/drivers/gpu/drm/cirrus/cirrus.c
> +++ b/drivers/gpu/drm/cirrus/cirrus.c
> @@ -154,6 +154,9 @@ static void cirrus_set_start_address(struct cirrus_device *cirrus, u32 offset)
>  	u32 addr;
>  	u8 tmp;
>  
> +	if (!cirrus->mmio)
> +		return;

Same as with the previous one, I think you're looking for
drm_dev_enter/exit. And missing patch changelog. remove/release split
looks good otherwise.
-Daniel

> +
>  	addr = offset >> 2;
>  	wreg_crt(cirrus, 0x0c, (u8)((addr >> 8) & 0xff));
>  	wreg_crt(cirrus, 0x0d, (u8)(addr & 0xff));
> @@ -179,6 +182,9 @@ static int cirrus_mode_set(struct cirrus_device *cirrus,
>  	int tmp;
>  	int sr07 = 0, hdr = 0;
>  
> +	if (!cirrus->mmio)
> +		return -1;
> +
>  	htotal = mode->htotal / 8;
>  	hsyncend = mode->hsync_end / 8;
>  	hsyncstart = mode->hsync_start / 8;
> @@ -301,6 +307,9 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
>  	struct cirrus_device *cirrus = fb->dev->dev_private;
>  	void *vmap;
>  
> +	if (!cirrus->vram)
> +		return -ENODEV;
> +
>  	vmap = drm_gem_shmem_vmap(fb->obj[0]);
>  	if (!vmap)
>  		return -ENOMEM;
> @@ -502,6 +511,14 @@ static void cirrus_mode_config_init(struct cirrus_device *cirrus)
>  
>  /* ------------------------------------------------------------------ */
>  
> +static void cirrus_release(struct drm_device *dev)
> +{
> +	struct cirrus_device *cirrus = dev->dev_private;
> +
> +	drm_mode_config_cleanup(dev);
> +	kfree(cirrus);
> +}
> +
>  DEFINE_DRM_GEM_FOPS(cirrus_fops);
>  
>  static struct drm_driver cirrus_driver = {
> @@ -515,6 +532,7 @@ static struct drm_driver cirrus_driver = {
>  
>  	.fops		 = &cirrus_fops,
>  	DRM_GEM_SHMEM_DRIVER_OPS,
> +	.release         = cirrus_release,
>  };
>  
>  static int cirrus_pci_probe(struct pci_dev *pdev,
> @@ -599,11 +617,12 @@ static void cirrus_pci_remove(struct pci_dev *pdev)
>  	struct cirrus_device *cirrus = dev->dev_private;
>  
>  	drm_dev_unregister(dev);
> -	drm_mode_config_cleanup(dev);
> +	drm_atomic_helper_shutdown(dev);
>  	iounmap(cirrus->mmio);
> +	cirrus->mmio = NULL;
>  	iounmap(cirrus->vram);
> +	cirrus->vram = NULL;
>  	drm_dev_put(dev);
> -	kfree(cirrus);
>  	pci_release_regions(pdev);
>  }
>  
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
