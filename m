Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0C6157E33
	for <lists.virtualization@lfdr.de>; Mon, 10 Feb 2020 16:06:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CAA0185010;
	Mon, 10 Feb 2020 15:06:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ex--QHYBgkSb; Mon, 10 Feb 2020 15:06:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4908B85036;
	Mon, 10 Feb 2020 15:06:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2AF6DC0171;
	Mon, 10 Feb 2020 15:06:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 79FE3C0171
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 15:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6778A847D1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 15:06:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bV1o16CXAvmk
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 15:06:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6DDF784707
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 15:06:37 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id b17so754829wmb.0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 07:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=SZWw5BNnqsxO+B1PSnFYos2X0WTIUEc5MmcB9KkYh80=;
 b=W0V0l0jrXQHgBSOItUTUJwRpOtkv/Q/smtmpPUJS47OOLZBD9qbyJ8CY7KClmjxKxE
 OFc5xuUJTNI4H//VPHEy4UoWZp7QD8sRKpumXKABiIZpcpZIkyHN4QhqxByZ2lH+sKZu
 XV3LNb2Q4Jr9z+7WNawVmGuKpSgkkjfr0VcRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=SZWw5BNnqsxO+B1PSnFYos2X0WTIUEc5MmcB9KkYh80=;
 b=iluaOlv7KazOwlnv3RjjbzgqS0Af9dTtSgNAZJgX/mCarhbHvNpSfiTVpvze/ek2al
 2vtrd35YU29caj/DKqv3KjnI5NSg6yNFJLx85/xD0UsEhOyQ3cT/USEd1JKdxWp+l43c
 0sLEpvH9QWKpytkUzYUWMMUixCk6msEanBpibuPZB4XK6dj4pM8t7ro/o9aNGgBojIYk
 cxXJ2KnAKr0hWme3tbXjgpvi63GFGtLLim/6rs7n/sd2uUInORWHG59zut82Wqx6FK80
 rEomEc1lfvKpfUfQzRSjAUVDu3It+XiR9nVvBqy6I3pn2TUkhR5Sr2DHg/vHRUyqQ0L7
 Z5FA==
X-Gm-Message-State: APjAAAXigj32bajzcwaXOi2n5r1ZSejwf/G+ZUglosCFz6eyScFFKqKx
 MlMc3I7rSzLiUk1vsezPZeCaPQ==
X-Google-Smtp-Source: APXvYqzYMP69IToA5/mmhtOboZyOY6hCkleSPGfnRYobetT8q7zeS4pAYMffcDEcpwKzvUZc8Wsx2Q==
X-Received: by 2002:a1c:44d:: with SMTP id 74mr16475365wme.53.1581347195749;
 Mon, 10 Feb 2020 07:06:35 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t13sm935403wrw.19.2020.02.10.07.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 07:06:35 -0800 (PST)
Date: Mon, 10 Feb 2020 16:06:33 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 2/2] drm/qxl: add drm_driver.release callback.
Message-ID: <20200210150633.GS43062@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, 
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20200210113753.5614-1-kraxel@redhat.com>
 <20200210113753.5614-3-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200210113753.5614-3-kraxel@redhat.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
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

On Mon, Feb 10, 2020 at 12:37:52PM +0100, Gerd Hoffmann wrote:
> Move final cleanups to qxl_drm_release() callback.
> Add drm_atomic_helper_shutdown() call to qxl_pci_remove().
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/qxl/qxl_drv.c | 26 +++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
> index 1d601f57a6ba..4fda3f9b29f4 100644
> --- a/drivers/gpu/drm/qxl/qxl_drv.c
> +++ b/drivers/gpu/drm/qxl/qxl_drv.c
> @@ -34,6 +34,7 @@
>  #include <linux/pci.h>
>  
>  #include <drm/drm.h>
> +#include <drm/drm_atomic_helper.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_modeset_helper.h>
> @@ -132,21 +133,30 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	return ret;
>  }
>  
> +static void qxl_drm_release(struct drm_device *dev)
> +{
> +	struct qxl_device *qdev = dev->dev_private;
> +
> +	/*
> +	 * TODO: qxl_device_fini() call should be in qxl_pci_remove(),
> +	 * reodering qxl_modeset_fini() + qxl_device_fini() calls is
> +	 * non-trivial though.
> +	 */
> +	qxl_modeset_fini(qdev);

So the drm_mode_config_cleanup call in here belongs in ->release, but the
qxl_destroy_monitors_object feels like should be perfectly fine in the
remove hook. You might need to sprinkle a few drm_dev_enter/exit around to
protect code paths thought.

Aside from this lgtm, for the series

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

And up to you whether you want to fix this or not really.

Btw for testing all these patches that add a ->release hook I think it'd
be good if the drm core checks that drm_device->dev is set to NULL, and
that we do this in the remove hook. Since that's guaranteed to be gone at
that point, so anything in ->release that still needs the device is
broken. Ofc maybe do that check only for drivers which have a ->release
hook, and we might need a few fixups.

Cheers, Daniel

> +	qxl_device_fini(qdev);
> +	dev->dev_private = NULL;
> +	kfree(qdev);
> +}
> +
>  static void
>  qxl_pci_remove(struct pci_dev *pdev)
>  {
>  	struct drm_device *dev = pci_get_drvdata(pdev);
> -	struct qxl_device *qdev = dev->dev_private;
>  
>  	drm_dev_unregister(dev);
> -
> -	qxl_modeset_fini(qdev);
> -	qxl_device_fini(qdev);
> +	drm_atomic_helper_shutdown(dev);
>  	if (is_vga(pdev))
>  		vga_put(pdev, VGA_RSRC_LEGACY_IO);
> -
> -	dev->dev_private = NULL;
> -	kfree(qdev);
>  	drm_dev_put(dev);
>  }
>  
> @@ -279,6 +289,8 @@ static struct drm_driver qxl_driver = {
>  	.major = 0,
>  	.minor = 1,
>  	.patchlevel = 0,
> +
> +	.release = qxl_drm_release,
>  };
>  
>  static int __init qxl_init(void)
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
