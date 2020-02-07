Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9A61558A9
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 14:42:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C9A8B863F2;
	Fri,  7 Feb 2020 13:42:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NTwMNcu2N3fk; Fri,  7 Feb 2020 13:42:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 31D74863CD;
	Fri,  7 Feb 2020 13:42:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04A9DC013E;
	Fri,  7 Feb 2020 13:42:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DC9D9C013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 13:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id CB72586C11
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 13:42:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zgAbCxBO893C
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 13:42:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3460486C02
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 13:42:30 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a5so2664544wmb.0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 07 Feb 2020 05:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=TyPPRLKeipDPd+u8tqRuMDYkhQE0y3JFQkWBFGYN/N8=;
 b=Q6ayxrGsTc4a7zvF4JrnE8pm2eVELARdVSK6Pfhkt5GjlpNQouAG/N05fastzNDYtV
 0s/3GOaVVtss8j7chaZqG7vGZQRceoD5tg/UC5OVWooSkOcqvpqBBdeYlbu8DDxfb+oM
 BOI3HVjzmrTIXfiK6zcpxNhHPSzQPSjhdF8vA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=TyPPRLKeipDPd+u8tqRuMDYkhQE0y3JFQkWBFGYN/N8=;
 b=uiwfNa08exuzUKrYaTEQi58zB5TmCTdoOWSbPXaEDv5CQVJnjKPWmBWoEGVUP3Y+lN
 ixS/ZZtxCI2UQWs60+EyA6zJuz8QPxe7NZo5dOlm1XBhl+Tt8977bC7A2Z6TlrEZcEY0
 4vdfYCUJ8tc2Msn8zSHBrv5VgTryYIjl8UB5STLJgWJ4AQ81Qrzt3xp9F6+PskEL/z5W
 FUT7fIqoYeKaCLngokEX4Ed4Y6OmsXpy/QR3NemnBNwlMIKWscBH+VYjN9M5NN933Asw
 ZviwBsDTGLTqlVmhRtHuHuasxV8HtIRvyS4aWXP/9sM4dNjegzoBv5hc8EYUfFBXkCSd
 rJ2A==
X-Gm-Message-State: APjAAAXXDtJNM9Y3wfUkCQJ/w0V3YKJZqmXQkTQWdShaicFNrzhcYF6i
 u5dECGmKLxKnX6ceQDJDiWxD9Q==
X-Google-Smtp-Source: APXvYqxhatD4Js1NKtiy3XyO7Te5rVWuR1uUeZlh84mCoY9NL3oeMACk2iagMiLuPOki+LjjhnCnBA==
X-Received: by 2002:a1c:9a84:: with SMTP id c126mr4594084wme.111.1581082948462; 
 Fri, 07 Feb 2020 05:42:28 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i16sm3175338wrr.71.2020.02.07.05.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 05:42:27 -0800 (PST)
Date: Fri, 7 Feb 2020 14:42:25 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] drm/bochs: add drm_driver.release callback.
Message-ID: <20200207134225.GA43062@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, 
 open list <linux-kernel@vger.kernel.org>
References: <20200207121312.25296-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200207121312.25296-1-kraxel@redhat.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Daniel Vetter <daniel@ffwll.ch>,
 Gurchetan Singh <gurchetansingh@chromium.org>
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

On Fri, Feb 07, 2020 at 01:13:12PM +0100, Gerd Hoffmann wrote:
> From: Gurchetan Singh <gurchetansingh@chromium.org>
> 
> Move bochs_unload call from bochs_remove() to the new bochs_release()
> callback.  Also call drm_dev_unregister() first in bochs_remove().
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/bochs/bochs_drv.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bochs/bochs_drv.c b/drivers/gpu/drm/bochs/bochs_drv.c
> index 10460878414e..87ee1eb21a4d 100644
> --- a/drivers/gpu/drm/bochs/bochs_drv.c
> +++ b/drivers/gpu/drm/bochs/bochs_drv.c
> @@ -60,6 +60,11 @@ static int bochs_load(struct drm_device *dev)
>  
>  DEFINE_DRM_GEM_FOPS(bochs_fops);
>  
> +static void bochs_release(struct drm_device *dev)
> +{
> +	bochs_unload(dev);

Hm I think this needs to be split, and bochs_hw_fini needs to stay in
bochs_pci_remove. Otherwise we again release the iommu mappings too late
(there was just a discussion about that on the fbdev side of things
getting this wrong). Good to fix the lifetime fun here, but let's not move
too far :-)

Ideally we'd move the iomapping to devm_, that would remove it at the
right time I think.

Slight annoyance might be that we then need to shoot down the varios
mmaps, which I frankly don't know how to do. But keeping them pointing at
wrong stuff also isn't that great :-/

Cheers, Daniel

> +}
> +
>  static struct drm_driver bochs_driver = {
>  	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	.fops			= &bochs_fops,
> @@ -69,6 +74,7 @@ static struct drm_driver bochs_driver = {
>  	.major			= 1,
>  	.minor			= 0,
>  	DRM_GEM_VRAM_DRIVER,
> +	.release                = bochs_release,
>  };
>  
>  /* ---------------------------------------------------------------------- */
> @@ -148,9 +154,8 @@ static void bochs_pci_remove(struct pci_dev *pdev)
>  {
>  	struct drm_device *dev = pci_get_drvdata(pdev);
>  
> -	drm_atomic_helper_shutdown(dev);
>  	drm_dev_unregister(dev);
> -	bochs_unload(dev);
> +	drm_atomic_helper_shutdown(dev);
>  	drm_dev_put(dev);
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
