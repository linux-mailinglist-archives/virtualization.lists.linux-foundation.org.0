Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBBF188B14
	for <lists.virtualization@lfdr.de>; Tue, 17 Mar 2020 17:49:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 749D088E95;
	Tue, 17 Mar 2020 16:49:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7UdH+22lnKwc; Tue, 17 Mar 2020 16:49:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DCA8388E5F;
	Tue, 17 Mar 2020 16:49:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AD17BC013E;
	Tue, 17 Mar 2020 16:49:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 32D85C013E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Mar 2020 16:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 290B988E95
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Mar 2020 16:49:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ty2XHt+DLs41
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Mar 2020 16:49:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2E24A88E5F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Mar 2020 16:49:46 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 6so6672wmi.5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Mar 2020 09:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=mMiEl9L2S4tlLAiIN1V5kcZjzOStOhhL2zNGzs+Vouc=;
 b=R6oowquvlxrvUCOrWAkR8nSqdDRskytPZj1t+oqMPZIXIdEaqaxrZausO30q5v2cij
 Ta9XPGU0jQaKg5rNB49TK7FEHpqSy2S5b/6hMjglyIwqWn6CM31M2MK33qUQn6/uT7et
 S8yBm+Y4yH5ujfReYwesuo5IRj0cN9DkeDzDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=mMiEl9L2S4tlLAiIN1V5kcZjzOStOhhL2zNGzs+Vouc=;
 b=tohsvMWvr+LMQivhpTFdPi+hQeIiy03Tlzq8xrA2QHRO4us/psFtEeSBOmRdD/CHr8
 tiWxGxQ8Y+k8GRUN3BzqmLWBY6q7PNcS9uoUyPdoGx44zARzFTi/mu3nJz2Y5cz/mIsE
 V+f6bgyyiwXjZI5kxYh2elYG6tk31CJoDduK9c7rix2Zejkx8Z7ifmPkP/xsx0hXTRwU
 cRdRvGaOLwLbXAhNJrd2Nro5SDtk3JMhkFvzN5s6jufQ7VLcaw/Zj6aG/D4wKk+mLYP2
 dDc5LfteiCccsCDRkPvlkvxCvPiBWXH+Gp63px7t30iB/Zo0PT6I8AXKXnQRmcF1vnJ/
 XHnA==
X-Gm-Message-State: ANhLgQ3PvQ7OrXZ8ogS46TYYdCV4hcK3Rp0gpZdLl/KXbJDm8fsAGTlw
 aUEdhoIHOKqTS3Lhv2oe5nh7bQ==
X-Google-Smtp-Source: ADFU+vt8dNlSMJCThKrf5v17M3aD/fp8xVTQ3Zc/gPBrkJ6TA++okOS+dztloBcqbCNdk++CpJkLog==
X-Received: by 2002:a1c:5684:: with SMTP id k126mr163852wmb.181.1584463784547; 
 Tue, 17 Mar 2020 09:49:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n10sm5554069wro.14.2020.03.17.09.49.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 09:49:43 -0700 (PDT)
Date: Tue, 17 Mar 2020 17:49:41 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3] drm/bochs: downgrade pci_request_region failure from
 error to warning
Message-ID: <20200317164941.GP2363188@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, marmarek@invisiblethingslab.com,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, 
 open list <linux-kernel@vger.kernel.org>
References: <20200313084152.2734-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200313084152.2734-1-kraxel@redhat.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, marmarek@invisiblethingslab.com,
 Daniel Vetter <daniel@ffwll.ch>,
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Fri, Mar 13, 2020 at 09:41:52AM +0100, Gerd Hoffmann wrote:
> Shutdown of firmware framebuffer has a bunch of problems.  Because
> of this the framebuffer region might still be reserved even after
> drm_fb_helper_remove_conflicting_pci_framebuffers() returned.

Is that still the fbdev lifetime fun where the cleanup might be delayed if
the char device node is still open?
-Daniel

> =

> Don't consider pci_request_region() failure for the framebuffer
> region as fatal error to workaround this issue.
> =

> Reported-by: Marek Marczykowski-G=F3recki <marmarek@invisiblethingslab.co=
m>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/bochs/bochs_hw.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> =

> diff --git a/drivers/gpu/drm/bochs/bochs_hw.c b/drivers/gpu/drm/bochs/boc=
hs_hw.c
> index 952199cc0462..dce4672e3fc8 100644
> --- a/drivers/gpu/drm/bochs/bochs_hw.c
> +++ b/drivers/gpu/drm/bochs/bochs_hw.c
> @@ -157,10 +157,8 @@ int bochs_hw_init(struct drm_device *dev)
>  		size =3D min(size, mem);
>  	}
>  =

> -	if (pci_request_region(pdev, 0, "bochs-drm") !=3D 0) {
> -		DRM_ERROR("Cannot request framebuffer\n");
> -		return -EBUSY;
> -	}
> +	if (pci_request_region(pdev, 0, "bochs-drm") !=3D 0)
> +		DRM_WARN("Cannot request framebuffer, boot fb still active?\n");
>  =

>  	bochs->fb_map =3D ioremap(addr, size);
>  	if (bochs->fb_map =3D=3D NULL) {
> -- =

> 2.18.2
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
