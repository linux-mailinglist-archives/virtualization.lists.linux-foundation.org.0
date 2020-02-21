Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id CB81916872D
	for <lists.virtualization@lfdr.de>; Fri, 21 Feb 2020 20:03:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3937D8655C;
	Fri, 21 Feb 2020 19:03:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cdP2wjKjT4Ps; Fri, 21 Feb 2020 19:03:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 73DA986546;
	Fri, 21 Feb 2020 19:03:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 59DC6C013E;
	Fri, 21 Feb 2020 19:03:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3EFC2C013E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 19:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 360FB87476
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 19:03:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eks7waJLvHBw
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 19:03:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id EC0088708C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 19:03:11 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c9so3204776wrw.8
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 11:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MJU4yIJ1OecX1mHUKDbEObOQjruIXSQ2ZxBhWrTtUGg=;
 b=Y5e6uRfE6sLzhHzmCheSW3DLIJ4hXkZ9XEIfb0xh9bXuteIGhYNEU0mHcCQLbsRBbq
 gx6pOJEzdbXGegCYo9FUpGTMA6UJUGZtiqKHWkukU4xEn119Y7DYpO9AIq2kYLsaU/MJ
 LiRE+LdAtDE7mSXCefIPi88xXWEvYwCveFd3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MJU4yIJ1OecX1mHUKDbEObOQjruIXSQ2ZxBhWrTtUGg=;
 b=qrDm/Ax5qoqSidV5tVeVWDk5yY2cA+sex0MAO9eI9BRU8zL0M//E6hS4OvuoysH8kB
 EuvS1sui5i0W4oqYMzPo5Qy3rvxQjnO8PpJ7AmGiG+AtgJ8kqvekv9mtiV54g5ubhejj
 N4FDS28EfNH9XhYMxmZQ4cAdVEDbTudHqwo4MHoVFsDH9wFhwsvzvY1JXC3fmH5iztjP
 RGLLrbXpuq7BG294Bob6lLTqlnRfq6yfMXRBDNQXH/gdTjbwSmvbXLofogLM9Kbkr/g7
 zVb09iXrwy1pW6OVVvrmQAea0pO3CU7Yc2tpc7HuzCVGyvEh9GJOb9oGagmcFeXcOydv
 RfaQ==
X-Gm-Message-State: APjAAAXtLwK40FwWxJkbfeoHCaqMdbOx/LGi3sgBUMEsYz6fqp37N+nc
 6Lvn6BTTCFqFSqcTqgKVFWZyaw==
X-Google-Smtp-Source: APXvYqyIsxVr3qhWNgflnJwy5Wr/iFuVcPl1oz3Oo8BPA8Ltenpsf+FYTeR4zPjyGhXyag79xnUhOQ==
X-Received: by 2002:adf:e9d2:: with SMTP id l18mr1330674wrn.344.1582311790198; 
 Fri, 21 Feb 2020 11:03:10 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t12sm4985772wrq.97.2020.02.21.11.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 11:03:09 -0800 (PST)
Date: Fri, 21 Feb 2020 20:03:07 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 3/4] drm/mgag200: Use simple encoder
Message-ID: <20200221190307.GG2363188@phenom.ffwll.local>
References: <20200218084815.2137-1-tzimmermann@suse.de>
 <20200218084815.2137-4-tzimmermann@suse.de>
 <20200220185642.GA20011@ravnborg.org>
 <3044661c-7552-e685-37b3-88865f97a991@suse.de>
 <20200221190057.GA27701@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221190057.GA27701@ravnborg.org>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 spice-devel@lists.freedesktop.org, emil.velikov@collabora.com
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

On Fri, Feb 21, 2020 at 08:00:57PM +0100, Sam Ravnborg wrote:
> Hi Thomas.
> 
> On Fri, Feb 21, 2020 at 08:48:48AM +0100, Thomas Zimmermann wrote:
> > Hi Sam
> > 
> > thanks for reviewing the patch set.
> > 
> > Am 20.02.20 um 19:56 schrieb Sam Ravnborg:
> > > Hi Thomas.
> > > 
> > > On Tue, Feb 18, 2020 at 09:48:14AM +0100, Thomas Zimmermann wrote:
> > >> The mgag200 driver uses an empty implementation for its encoder. Replace
> > >> the code with the generic simple encoder.
> > >>
> > >> v2:
> > >> 	* rebase onto new simple-encoder interface
> > >>
> > >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > >> ---
> > >>  drivers/gpu/drm/mgag200/mgag200_drv.h  |  7 ---
> > >>  drivers/gpu/drm/mgag200/mgag200_mode.c | 61 ++------------------------
> > >>  2 files changed, 3 insertions(+), 65 deletions(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
> > >> index aa32aad222c2..9bb9e8e14539 100644
> > >> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
> > >> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
> > >> @@ -95,7 +95,6 @@
> > >>  #define MATROX_DPMS_CLEARED (-1)
> > >>  
> > >>  #define to_mga_crtc(x) container_of(x, struct mga_crtc, base)
> > >> -#define to_mga_encoder(x) container_of(x, struct mga_encoder, base)
> > >>  #define to_mga_connector(x) container_of(x, struct mga_connector, base)
> > >>  
> > >>  struct mga_crtc {
> > >> @@ -110,12 +109,6 @@ struct mga_mode_info {
> > >>  	struct mga_crtc *crtc;
> > >>  };
> > >>  
> > >> -struct mga_encoder {
> > >> -	struct drm_encoder base;
> > >> -	int last_dpms;
> > >> -};
> > >> -
> > >> -
> > >>  struct mga_i2c_chan {
> > >>  	struct i2c_adapter adapter;
> > >>  	struct drm_device *dev;
> > > 
> > > Any particular reason why the drm_encoder is not embedded in struct
> > > mga_device?
> > > 
> > > I found it more elegant - like you did it for ast in the previous patch.
> > 
> > I think I wanted something that uses drm_simple_encoder_create(). But I
> > can change that. The embedded variant is indeed better.
> 
> You should consider to drop drm_simple_encoder_create() until there
> is a driver that really needs it.

Yeah +1 on only the _init version. The create version really should use
drmm_kzalloc I think, but we're not quite there yet :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
