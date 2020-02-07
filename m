Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E6A1558BB
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 14:45:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0CD8F20439;
	Fri,  7 Feb 2020 13:45:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TT7OMS-gLWqA; Fri,  7 Feb 2020 13:45:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 104ED2047A;
	Fri,  7 Feb 2020 13:45:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 031BBC013E;
	Fri,  7 Feb 2020 13:45:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54A68C013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 13:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3D6C686407
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 13:45:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tafJoHlHy5jZ
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 13:45:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D0887863F2
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 13:45:39 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t2so2778451wrr.1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 07 Feb 2020 05:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=W87WpaWUIMWEzf16nCu+kjtH/ULuExTweZWvlCZh9vo=;
 b=KweCKsSYFAeEB8nkF2obgfg6/ji+M1HIeZdvJCMGXICAfr2WhJFKLKFY1ccTotWH5i
 QnIpv+zv4NCsTq9wipeq9t/HGWV8bi2Bv4RjZTg34Xpm3yZNX9e7u7f72C+UYWhe/dm2
 RPbST5HLM1/etiFYjk3X24aJW/pKXWdcu5lmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=W87WpaWUIMWEzf16nCu+kjtH/ULuExTweZWvlCZh9vo=;
 b=HLQllWK76OT9g3ys89Y8neNxzmJrS8JI+bs4/AlJhxxu/bGTnidCrphTIHt1CQ5pt3
 JeJ6aLuFqfo/vJ0FBJKo9QzTbyIjzwfBvDYouDWdT0IVRwCASHoxZ4OsXQrQT+JRfHT0
 oMOaArmIjHGPydLe/Bv3ipkCOy44wffGWtasvlTNjN1cIH9qo8gwbsCkaAvvjLXR5F/G
 ZXMcBNJAM8Y+gIaCICFYJ4M83vnMvtqFN80j3ijU5pXFTi3JhthufCQ9tux97kKkFZHz
 bFe6VJmDmtrArD18u1Z8zqIyvl1QQKGQPkRvZVXtxryfizQz9n71MxWHXmScT0Xy+Sh9
 8Rfw==
X-Gm-Message-State: APjAAAVbX5yz41bFq5aePXVhmaanNkvzaeJ3A1Uu8L7M8hsAPhnkiJdr
 PhMjX7CPCyBdmSQc8MxhMW1glg==
X-Google-Smtp-Source: APXvYqxxNjn3TBVZ2sWHL8lxLoKYhY0lLxey0dpUSCuua134oriUvSkdZsxS7RB5Ee1iiSAGU8jz/g==
X-Received: by 2002:adf:db48:: with SMTP id f8mr4594950wrj.146.1581083138401; 
 Fri, 07 Feb 2020 05:45:38 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a5sm3399500wmb.37.2020.02.07.05.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 05:45:37 -0800 (PST)
Date: Fri, 7 Feb 2020 14:45:36 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] drm/bochs: deinit bugfix
Message-ID: <20200207134536.GC43062@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, 
 open list <linux-kernel@vger.kernel.org>
References: <20200207124348.21641-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200207124348.21641-1-kraxel@redhat.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
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

On Fri, Feb 07, 2020 at 01:43:48PM +0100, Gerd Hoffmann wrote:
> Check whenever mode_config was actually properly
> initialized before trying to clean it up.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Really need to get managed drm cleanup going ...
-Daniel
> ---
>  drivers/gpu/drm/bochs/bochs_kms.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
> index cc93ff74fbd8..3a755c911342 100644
> --- a/drivers/gpu/drm/bochs/bochs_kms.c
> +++ b/drivers/gpu/drm/bochs/bochs_kms.c
> @@ -164,6 +164,9 @@ int bochs_kms_init(struct bochs_device *bochs)
>  
>  void bochs_kms_fini(struct bochs_device *bochs)
>  {
> +	if (!bochs->dev->mode_config.num_connector)
> +		return;
> +
>  	drm_atomic_helper_shutdown(bochs->dev);
>  	drm_mode_config_cleanup(bochs->dev);
>  }
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
