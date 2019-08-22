Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E4199488
	for <lists.virtualization@lfdr.de>; Thu, 22 Aug 2019 15:09:13 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BB1E0F4C;
	Thu, 22 Aug 2019 13:09:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8386FD13
	for <virtualization@lists.linux-foundation.org>;
	Thu, 22 Aug 2019 13:09:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AC22689E
	for <virtualization@lists.linux-foundation.org>;
	Thu, 22 Aug 2019 13:09:03 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id g8so7849161edm.6
	for <virtualization@lists.linux-foundation.org>;
	Thu, 22 Aug 2019 06:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
	h=sender:date:from:to:cc:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Ct+pvFgmTwPh52glIEGsAjP8pa5OgYXxgpqmL6lQd34=;
	b=eyBBu9iYdg2nO8/CePlnSjFCGm9CqFYCCiSKOQiy3w9BoyyceU/lhyzwvmT/uouFer
	kNFW7tUZ5RlYTHRVgDP5CXQUFfScLAGdFbXce6yfDkpQuZiNWVTFyZAS1ule0dENhkcj
	ICdD0aCcalUIoBqIlSfEmrju1vD/z1VjhO7KA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:user-agent;
	bh=Ct+pvFgmTwPh52glIEGsAjP8pa5OgYXxgpqmL6lQd34=;
	b=jLIyZs+3Y60X6ZDJLNlCWGzIFIgniPaWzcavJMqJETR0wcGUyO9c11aEbGk9vAzWt8
	9jcGwR0b/OoyswuV7tEVUZCTmt3/KbFWpa53GRiVXyfu++7thQGnVgl0e2jUkp0XjGtH
	SYjKiDeKLUZQZnzwrQngEqOXI2znFFuzsiYjGB+XX1xdIh4WRkZigRfScv9Kuvjyhm4/
	+DOrxMLhVJJyIHQGBXSLrTFM9JmI/1F6e0B90XC4aZjK/OfmDmufl7/AeGWP9ez+4BFF
	efwPGWNj5M8AqTHE31IKXUOoPMnHzO6QhvxgLodN3LZtBQex3DFLb+39+iO4yA3F3npS
	kWjA==
X-Gm-Message-State: APjAAAUoc84nbh1DOjjc5ZmyelM27rpd9Xk5x9wS3PruyS15uJ6fSKU+
	pr8hN9cPeJTqdbmpF+3FmGkbMQ==
X-Google-Smtp-Source: APXvYqx6dMxiOov/ACP8syk5Qv8zhXwRN6GP6jKrz23a3jQE3ts1XPKx5XbS73SbRFGQffIklCa9/g==
X-Received: by 2002:a50:fa43:: with SMTP id c3mr41823097edq.94.1566479342268; 
	Thu, 22 Aug 2019 06:09:02 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
	[212.51.149.96])
	by smtp.gmail.com with ESMTPSA id c14sm4849940edb.5.2019.08.22.06.09.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 22 Aug 2019 06:09:01 -0700 (PDT)
Date: Thu, 22 Aug 2019 15:08:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 2/3] drm: drop resource_id parameter from
	drm_fb_helper_remove_conflicting_pci_framebuffers
Message-ID: <20190822130859.GW11147@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
	dri-devel@lists.freedesktop.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	"David (ChunMing) Zhou" <David1.Zhou@amd.com>,
	David Airlie <airlied@linux.ie>, Dave Airlie <airlied@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <maxime.ripard@bootlin.com>,
	Sean Paul <sean@poorly.run>,
	"open list:RADEON and AMDGPU DRM DRIVERS"
	<amd-gfx@lists.freedesktop.org>, 
	open list <linux-kernel@vger.kernel.org>,
	"open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
	<virtualization@lists.linux-foundation.org>, 
	"open list:DRM DRIVER FOR QXL VIRTUAL GPU"
	<spice-devel@lists.freedesktop.org>
References: <20190822090645.25410-1-kraxel@redhat.com>
	<20190822090645.25410-3-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190822090645.25410-3-kraxel@redhat.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
	David Airlie <airlied@linux.ie>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
	"open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
	<virtualization@lists.linux-foundation.org>,
	Maxime Ripard <maxime.ripard@bootlin.com>,
	"open list:RADEON and AMDGPU DRM DRIVERS"
	<amd-gfx@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
	"open list:DRM DRIVER FOR QXL VIRTUAL GPU"
	<spice-devel@lists.freedesktop.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Thu, Aug 22, 2019 at 11:06:44AM +0200, Gerd Hoffmann wrote:
> Not needed any more for remove_conflicting_pci_framebuffers calls.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  include/drm/drm_fb_helper.h             | 4 +---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 2 +-
>  drivers/gpu/drm/bochs/bochs_drv.c       | 2 +-
>  drivers/gpu/drm/cirrus/cirrus.c         | 2 +-
>  drivers/gpu/drm/mgag200/mgag200_drv.c   | 2 +-
>  drivers/gpu/drm/qxl/qxl_drv.c           | 2 +-
>  drivers/gpu/drm/radeon/radeon_drv.c     | 2 +-
>  drivers/gpu/drm/virtio/virtgpu_drv.c    | 1 -
>  8 files changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
> index 5a5f4b1d8241..8dcc012ccbc8 100644
> --- a/include/drm/drm_fb_helper.h
> +++ b/include/drm/drm_fb_helper.h
> @@ -539,18 +539,16 @@ drm_fb_helper_remove_conflicting_framebuffers(struct apertures_struct *a,
>  /**
>   * drm_fb_helper_remove_conflicting_pci_framebuffers - remove firmware-configured framebuffers for PCI devices
>   * @pdev: PCI device
> - * @resource_id: index of PCI BAR configuring framebuffer memory
>   * @name: requesting driver name
>   *
>   * This function removes framebuffer devices (eg. initialized by firmware)
> - * using memory range configured for @pdev's BAR @resource_id.
> + * using memory range configured for any of @pdev's memory bars.
>   *
>   * The function assumes that PCI device with shadowed ROM drives a primary
>   * display and so kicks out vga16fb.
>   */
>  static inline int
>  drm_fb_helper_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
> -						  int resource_id,
>  						  const char *name)
>  {
>  	int ret = 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 98df55534a6d..6b96a5738e57 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -1031,7 +1031,7 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>  	}
>  
>  	/* Get rid of things like offb */
> -	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, 0, "amdgpudrmfb");
> +	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "amdgpudrmfb");
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/bochs/bochs_drv.c b/drivers/gpu/drm/bochs/bochs_drv.c
> index 770e1625d05e..3b9b0d9bbc14 100644
> --- a/drivers/gpu/drm/bochs/bochs_drv.c
> +++ b/drivers/gpu/drm/bochs/bochs_drv.c
> @@ -114,7 +114,7 @@ static int bochs_pci_probe(struct pci_dev *pdev,
>  		return -ENOMEM;
>  	}
>  
> -	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, 0, "bochsdrmfb");
> +	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "bochsdrmfb");
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/cirrus/cirrus.c b/drivers/gpu/drm/cirrus/cirrus.c
> index 36a69aec8a4b..89d9e6fdeb8c 100644
> --- a/drivers/gpu/drm/cirrus/cirrus.c
> +++ b/drivers/gpu/drm/cirrus/cirrus.c
> @@ -532,7 +532,7 @@ static int cirrus_pci_probe(struct pci_dev *pdev,
>  	struct cirrus_device *cirrus;
>  	int ret;
>  
> -	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, 0, "cirrusdrmfb");
> +	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "cirrusdrmfb");
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
> index afd9119b6cf1..4f9df3b93598 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
> @@ -46,7 +46,7 @@ MODULE_DEVICE_TABLE(pci, pciidlist);
>  
>  static int mga_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  {
> -	drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, 0, "mgag200drmfb");
> +	drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "mgag200drmfb");
>  
>  	return drm_get_pci_dev(pdev, ent, &driver);
>  }
> diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
> index c1802e01d9f6..2b726a51a302 100644
> --- a/drivers/gpu/drm/qxl/qxl_drv.c
> +++ b/drivers/gpu/drm/qxl/qxl_drv.c
> @@ -83,7 +83,7 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	if (ret)
>  		goto free_dev;
>  
> -	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, 0, "qxl");
> +	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "qxl");
>  	if (ret)
>  		goto disable_pci;
>  
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
> index a4a78dfdef37..624aa580d418 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.c
> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> @@ -329,7 +329,7 @@ static int radeon_pci_probe(struct pci_dev *pdev,
>  		return -EPROBE_DEFER;
>  
>  	/* Get rid of things like offb */
> -	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, 0, "radeondrmfb");
> +	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "radeondrmfb");
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
> index 0fc32fa0b3c0..3d24181636e1 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -56,7 +56,6 @@ static int virtio_gpu_pci_quirk(struct drm_device *dev, struct virtio_device *vd
>  	dev->pdev = pdev;
>  	if (vga)
>  		drm_fb_helper_remove_conflicting_pci_framebuffers(pdev,
> -								  0,
>  								  "virtiodrmfb");
>  
>  	/*
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
