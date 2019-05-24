Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD3729C06
	for <lists.virtualization@lfdr.de>; Fri, 24 May 2019 18:20:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 19486DD8;
	Fri, 24 May 2019 16:20:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9869EDC5
	for <virtualization@lists.linux-foundation.org>;
	Fri, 24 May 2019 16:20:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1F710F4
	for <virtualization@lists.linux-foundation.org>;
	Fri, 24 May 2019 16:20:07 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id l25so15109524eda.9
	for <virtualization@lists.linux-foundation.org>;
	Fri, 24 May 2019 09:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
	h=sender:date:from:to:cc:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=qa/iTdMK2I5u7OLH5mUmubpi3Ui2X4Y/60DebnqcWKA=;
	b=YUKjt5T1Uxbnehko3JGL2u2xg4tM7137f8tigXS15tKoOaor5fhH2rdF2bZu2pmZ29
	CXlen5OW7V7h5ZAJUlNaFmfhRqbz3V6eiRg1mrMLmxwMXEq8FAC96F/w2Y1k4xI8mTF8
	hN4YPvaOwSEvViy+ZqNaKCMe9VigQy4rKnUWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:user-agent;
	bh=qa/iTdMK2I5u7OLH5mUmubpi3Ui2X4Y/60DebnqcWKA=;
	b=TFIXGldRtwihqa3gPvzBJArpHpo4N1zw+n5Y/PYX2TiLLh+5tDppffL1EoGCwLF1HX
	hu/JYxeHZKnhvXUqa772/BeNTQiGD9CwYyLft3YhLtXGnKBbRTQJz0Rf2CrTeFeuy8rw
	9IPMTZ0/ViAxFH+2VkOzuoVDAlcDwStVpl72xku3L7tFDW7mS7wGYTWE0otYUbYfBpnu
	WwLuACdmYUyM7Pag7bElkAkFiD6XphrskEhdam1/tZ/pTiUHkuAej79IkBgONTUkikys
	Ri72CaDxosWH+mx78lxshOgJ0y2vpKqKBR0vBlLnfPo4SH6axMqlUtaTQQ/L4J9GJV7E
	CM+Q==
X-Gm-Message-State: APjAAAVWFY4fA7chKsCN4TWE/2u9NmUi5nwR+dyiF3sudvP2r/SuRuXN
	89cH6HjkdI6hG2E7MZm/FEII6g==
X-Google-Smtp-Source: APXvYqyyUQQMpWFfqqnY1+kkknYiFDuvhN02hQKZ5YtOLDuOntF6aWyDvGMULBXc37JgAEFjADK+/Q==
X-Received: by 2002:a17:906:4581:: with SMTP id
	t1mr64624488ejq.187.1558714806496; 
	Fri, 24 May 2019 09:20:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
	by smtp.gmail.com with ESMTPSA id f32sm850181edf.36.2019.05.24.09.20.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 24 May 2019 09:20:05 -0700 (PDT)
Date: Fri, 24 May 2019 18:20:03 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] drm/qxl: drop WARN_ONCE()
Message-ID: <20190524162003.GC21222@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
	dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
	David Airlie <airlied@linux.ie>,
	"open list:DRM DRIVER FOR QXL VIRTUAL GPU"
	<virtualization@lists.linux-foundation.org>, 
	"open list:DRM DRIVER FOR QXL VIRTUAL GPU"
	<spice-devel@lists.freedesktop.org>, 
	open list <linux-kernel@vger.kernel.org>
References: <20190524104251.22761-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190524104251.22761-1-kraxel@redhat.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	dri-devel@lists.freedesktop.org, "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
	<virtualization@lists.linux-foundation.org>,
	Daniel Vetter <daniel@ffwll.ch>, "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
	<spice-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
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

On Fri, May 24, 2019 at 12:42:50PM +0200, Gerd Hoffmann wrote:
> There is no good reason to flood the kernel log with a WARN
> stacktrace just because someone tried to mmap a prime buffer.

Yeah no userspace triggerable dmesg noise above debug level.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/qxl/qxl_prime.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/qxl/qxl_prime.c b/drivers/gpu/drm/qxl/qxl_prime.c
> index 114653b471c6..7d3816fca5a8 100644
> --- a/drivers/gpu/drm/qxl/qxl_prime.c
> +++ b/drivers/gpu/drm/qxl/qxl_prime.c
> @@ -77,6 +77,5 @@ void qxl_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
>  int qxl_gem_prime_mmap(struct drm_gem_object *obj,
>  		       struct vm_area_struct *area)
>  {
> -	WARN_ONCE(1, "not implemented");
>  	return -ENOSYS;
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
