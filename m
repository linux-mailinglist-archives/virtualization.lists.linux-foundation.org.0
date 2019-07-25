Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CDE74DAB
	for <lists.virtualization@lfdr.de>; Thu, 25 Jul 2019 14:04:10 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A63A0EE7;
	Thu, 25 Jul 2019 12:04:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 003F2EBE
	for <virtualization@lists.linux-foundation.org>;
	Thu, 25 Jul 2019 12:04:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 521F9891
	for <virtualization@lists.linux-foundation.org>;
	Thu, 25 Jul 2019 12:04:03 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id w13so50037256eds.4
	for <virtualization@lists.linux-foundation.org>;
	Thu, 25 Jul 2019 05:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
	h=sender:date:from:to:cc:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=cy0ew9uPB8kVgEkmAFM7ms4faY7aDGiLUN/eaDicKPg=;
	b=WPZhZWmRLRFJE8jPPQtDSMQzuxgwp3LQMY9ubs6jUiptnchPg7kFyCCu6lCq07dzQM
	Bv+b5kp750NTw97eMhhEIN/2+zSUClyeCkEsIT/KpeyftRjloI9FYcvGhe7H6n21aHB7
	QXdsWpYtCXLTZIJx5CLvoTfenLF2F848/TPPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:user-agent;
	bh=cy0ew9uPB8kVgEkmAFM7ms4faY7aDGiLUN/eaDicKPg=;
	b=VngT3+8uguXQOrlWG6vvP5RLuaMNg1HFTVgKJr2io4UP+8H1gV5+q01zuN0EopEcyv
	ah1Gm6UkvbCCaz0PHeHyUfCTUvuk5BqbauR+WNLnzfB1QblyZz7IsGxgNrWkNFohPgBF
	emyNpwJW1bAUHsBHLv+9C2yo7mAbj6l8M7WDobLZByawxmiQEdWjtBOwoHRP2BtN0hNI
	0yukTFKze/M1ZCU/gz5Sfd2xJNf0ArKp42TnBhbznK7189FSLVWPaV5x165aTcxn/J8+
	AysJAT0vNO/SW7kA8HsquNCB3TihSObVTIE0RxbgW1flx6aJJaw3h0Cj8CfBA20qpbo3
	7bDA==
X-Gm-Message-State: APjAAAVTQtXpmFNWBCFa0PiyKObK8/ePaaBahVmlRacCtLE3ymAzbF1n
	2+z/otT7ArB7wCPFxvUWPE8=
X-Google-Smtp-Source: APXvYqyaIPnd0FN+ekWkoKh4vPAtSWP2GBKrYKSJbcPhM7k3XbUpl7CE1EwxPieoU4WbQXNb3+RMyA==
X-Received: by 2002:a50:9871:: with SMTP id h46mr76005765edb.69.1564056241883; 
	Thu, 25 Jul 2019 05:04:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
	by smtp.gmail.com with ESMTPSA id
	k8sm13001747edr.31.2019.07.25.05.04.00
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 25 Jul 2019 05:04:01 -0700 (PDT)
Date: Thu, 25 Jul 2019 14:03:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: Re: [PATCH] gpu: drm: qxl: Fix possible null-pointer dereferences in
	qxl_crtc_atomic_flush()
Message-ID: <20190725120359.GB15868@phenom.ffwll.local>
Mail-Followup-To: Jia-Ju Bai <baijiaju1990@gmail.com>, airlied@redhat.com,
	kraxel@redhat.com, airlied@linux.ie,
	virtualization@lists.linux-foundation.org,
	spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
References: <20190725102127.16086-1-baijiaju1990@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725102127.16086-1-baijiaju1990@gmail.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, daniel@ffwll.ch,
	spice-devel@lists.freedesktop.org, airlied@redhat.com
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

On Thu, Jul 25, 2019 at 06:21:27PM +0800, Jia-Ju Bai wrote:
> In qxl_crtc_atomic_flush(), there is an if statement on line 376 to
> check whether crtc->state is NULL:
>     if (crtc->state && crtc->state->event)
> 
> When crtc->state is NULL and qxl_crtc_update_monitors_config() is call, 
> qxl_crtc_update_monitors_config() uses crtc->state on line 326:
>     if (crtc->state->active)
> and on line 358:
>     DRM_DEBUG_KMS(..., crtc->state->active, ...);
> 
> Thus, possible null-pointer dereferences may occur.
> 
> To fix these bugs, crtc->state is checked before calling
> qxl_crtc_update_monitors_config().
> 
> These bugs are found by a static analysis tool STCheck written by us.
> 
> Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>

crtc->state should never be NULL in this function, ever. Imo correct fix
is to remove that other NULL check (since obviously it would blow up,
hence it's dead code).

Atomic kms drivers use drm_mode_config_reset() to make sure the various
->state pointers are always set and valid.
-Daniel

> ---
>  drivers/gpu/drm/qxl/qxl_display.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
> index 8b319ebbb0fb..fae18ef1ba59 100644
> --- a/drivers/gpu/drm/qxl/qxl_display.c
> +++ b/drivers/gpu/drm/qxl/qxl_display.c
> @@ -382,7 +382,8 @@ static void qxl_crtc_atomic_flush(struct drm_crtc *crtc,
>  		spin_unlock_irqrestore(&dev->event_lock, flags);
>  	}
>  
> -	qxl_crtc_update_monitors_config(crtc, "flush");
> +	if (crtc->state)
> +		qxl_crtc_update_monitors_config(crtc, "flush");
>  }
>  
>  static void qxl_crtc_destroy(struct drm_crtc *crtc)
> -- 
> 2.17.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
