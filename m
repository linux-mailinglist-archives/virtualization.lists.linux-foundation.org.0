Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8282610BD
	for <lists.virtualization@lfdr.de>; Tue,  8 Sep 2020 13:35:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D816F8729A;
	Tue,  8 Sep 2020 11:35:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KPWnEams8v16; Tue,  8 Sep 2020 11:35:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 56B0187293;
	Tue,  8 Sep 2020 11:35:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3BB85C0859;
	Tue,  8 Sep 2020 11:35:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B127C0051
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 11:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7499C86964
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 11:35:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VNAwMSP6hrWp
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 11:35:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8F8CE8698E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 11:35:26 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id z9so16821453wmk.1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 08 Sep 2020 04:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=WSL45Uni0wlxXIfxBtB/5y1z+V6rIa7ooXBAdktfl/A=;
 b=ZLxft09DWWUQ61e1fg70TdQn/PgGhrvi+SfoTYjEbKMGf2binVugy8MuM9Xj99eAEe
 VJLWkbCEhx0Q+0u1QI5c9QlkB5pVHml2SnWMDDRBQ9uR8HBRc6kNmOcsXnb8pl0Il5H7
 XC9oedgjy1s3YBZnSyLsf4JQOOOfT7ZCvDezk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=WSL45Uni0wlxXIfxBtB/5y1z+V6rIa7ooXBAdktfl/A=;
 b=E7pS30nFXJXi7GRP9soT3124MetZAJXnbRnDE6VlwIH6vL0RDKwGMx78wVYCPQ8Xxb
 WmVtan9bPpdMjHvdjepwPDQ9Xcq+PIES+WnY79MfbX39nE8e3FEzbU5dCZgMBjGfgDmD
 im0Fm0WQZjl4obOhT/+b65l8cPycPn7PcIfAn+0oj4V2gA1ZlGc8jPPlMavYMhExQpXA
 c0aAQQbByECCYN4/d95XHwSx2p6tsflVqXF7fVqHNUyjAJ/Hve2jojAn4gGvRKbyU+zz
 WBwf0IOmONc0DM8NzIGYYrEmJuEat2xUtYLwJ2ebdjlLdldBX1E4oY3s/ddMr/Vw2CSD
 5kFg==
X-Gm-Message-State: AOAM532ujWj6PmmkW/17D5P/Bq8oJSkKxOPYiMmllFJoUyl83/qAR2WD
 Zbbb9eYT5AmrOfzZAqv8X/8FmA==
X-Google-Smtp-Source: ABdhPJwO92ecdG4LyeNex6dqtxEb2Oh6YdMfEcJIZ3ccJ7o2d+SykbHHt95D77rql1tnIOcP64ekjA==
X-Received: by 2002:a1c:7215:: with SMTP id n21mr4226341wmc.154.1599564924815; 
 Tue, 08 Sep 2020 04:35:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c6sm33689920wrr.15.2020.09.08.04.35.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 04:35:24 -0700 (PDT)
Date: Tue, 8 Sep 2020 13:35:22 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 1/3] drm/qxl: use drmm_mode_config_init
Message-ID: <20200908113522.GK2352366@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, 
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20200908093912.26792-1-kraxel@redhat.com>
 <20200908093912.26792-2-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200908093912.26792-2-kraxel@redhat.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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

On Tue, Sep 08, 2020 at 11:39:10AM +0200, Gerd Hoffmann wrote:
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Btw going all in on devm_drm_dev_alloc and managed functions might be good
cleanup for virtio.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/qxl/qxl_display.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
> index fa79688013b7..4be04eaf7f37 100644
> --- a/drivers/gpu/drm/qxl/qxl_display.c
> +++ b/drivers/gpu/drm/qxl/qxl_display.c
> @@ -1190,7 +1190,9 @@ int qxl_modeset_init(struct qxl_device *qdev)
>  	int i;
>  	int ret;
>  
> -	drm_mode_config_init(&qdev->ddev);
> +	ret = drmm_mode_config_init(&qdev->ddev);
> +	if (ret)
> +		return ret;
>  
>  	ret = qxl_create_monitors_object(qdev);
>  	if (ret)
> @@ -1223,5 +1225,4 @@ int qxl_modeset_init(struct qxl_device *qdev)
>  void qxl_modeset_fini(struct qxl_device *qdev)
>  {
>  	qxl_destroy_monitors_object(qdev);
> -	drm_mode_config_cleanup(&qdev->ddev);
>  }
> -- 
> 2.27.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
