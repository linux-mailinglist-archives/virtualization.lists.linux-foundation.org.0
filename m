Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4953114A97D
	for <lists.virtualization@lfdr.de>; Mon, 27 Jan 2020 19:12:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BF17020485;
	Mon, 27 Jan 2020 18:12:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G2knc3E4xQUf; Mon, 27 Jan 2020 18:12:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A7E5D20390;
	Mon, 27 Jan 2020 18:12:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 85AB5C0171;
	Mon, 27 Jan 2020 18:12:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A8C1C0171
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Jan 2020 18:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8397C850E6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Jan 2020 18:12:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UxRHFX0I2m3g
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Jan 2020 18:12:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
 [209.85.222.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CD70D850AD
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Jan 2020 18:12:20 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id h32so3802741uah.4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Jan 2020 10:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/uvHN7A7OT+bEIM3tP943o1xbsY41GvLCup21iM4/gc=;
 b=tuE4ZEtAUqVx1srhsqnBxX27/n+WfSn6yY0qv6+hFjaKzBiF11NctF8Ez5JX/QETBj
 YVG7g2BPSkjCgd7vjENxbjT6CmhjJ81Lj+0ob5J+dmCSW/wRQ0973iuV7+2Vz2k7MarM
 1LfWu6KQM1WCdoEPTG8Fw5NIlpFTl1eGA71roQvJnyUg9VDPzH5jKYreYybYwb5Gamgp
 DpH4+S3LJDHUrQhN1Uu0+6SnV0kw6Py/blMYwlWCk322fANsSBpURdIfR6QeKa3CK2a8
 jDTRFEjd9Ub7Q2l2DdVPqZEA52BOzCbSrr85zHR81/vuCE8Pq6PiBEkWp1iat+Ocg03L
 D4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/uvHN7A7OT+bEIM3tP943o1xbsY41GvLCup21iM4/gc=;
 b=SXao/r0LaCf1TAv9slVh550tXonJt0NQtG9WcTl8N7A+37Y9gCVkWEsZQvbblOMput
 w1QiwMrYX7NRSMcV7fec5tluAXdbx2bgVRTGjAkXf6KIHCJ0aymiccxQCIAz4i0nN2EF
 ak8Dlt+F0RV6P3tPFwap3JE238pKslDJ9tqq/nX6EGiNV4WKUDuCd8vtZM+NMlA+1u0S
 U50dSOcTEVKsqdlyS3OW4IF6ldBdjBpUXGBnWkTvuDPFBesqdMeQ0FUpW5BDxrDmrW4n
 Gnz5NNehuU1bwqtHwmy1rRU0nezh9MGGZjd+uwsmfSdAAc8cRfegjVSSqasxvEyPc9xz
 IYHw==
X-Gm-Message-State: APjAAAXB1G8o3Ek6LdJq6iKEBoKRh70BIMQ4kGRANGAgkVH1RS+BKnfe
 YsOXtrX/Oa/NPuzn2CQ1fPPPeh6wuHkHVAJr/HM=
X-Google-Smtp-Source: APXvYqwK5KmxifcPjLSjf5c8jkZHQcHzkH16GHhUeR4MCzx5Gy8Rt6ekqTRLSWMH36hOxYwaCgiqGLWChyi8dbuYFdA=
X-Received: by 2002:ab0:5bc6:: with SMTP id z6mr10702811uae.46.1580148739730; 
 Mon, 27 Jan 2020 10:12:19 -0800 (PST)
MIME-Version: 1.0
References: <20200123092123.28368-1-tzimmermann@suse.de>
 <20200123092123.28368-2-tzimmermann@suse.de>
In-Reply-To: <20200123092123.28368-2-tzimmermann@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 27 Jan 2020 18:12:54 +0000
Message-ID: <CACvgo53YvKjPNNshZoTjJehHyOX6e05kJ5gAXtjwxs+oLLv7vw@mail.gmail.com>
Subject: Re: [PATCH v4 01/15] drm: Initialize struct drm_crtc_state.no_vblank
 from device settings
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: david@lechnology.com, oleksandr_andrushchenko@epam.com,
 Dave Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Daniel Vetter <daniel@ffwll.ch>, xen-devel@lists.xenproject.org,
 Emil Velikov <emil.velikov@collabora.com>, Sean Paul <sean@poorly.run>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

Hi Thomas,

On Thu, 23 Jan 2020 at 09:21, Thomas Zimmermann <tzimmermann@suse.de> wrote:

> @@ -174,12 +174,22 @@ struct drm_crtc_state {
>          * @no_vblank:
>          *
>          * Reflects the ability of a CRTC to send VBLANK events. This state
> -        * usually depends on the pipeline configuration, and the main usuage
> -        * is CRTCs feeding a writeback connector operating in oneshot mode.
> -        * In this case the VBLANK event is only generated when a job is queued
> -        * to the writeback connector, and we want the core to fake VBLANK
> -        * events when this part of the pipeline hasn't changed but others had
> -        * or when the CRTC and connectors are being disabled.
> +        * usually depends on the pipeline configuration. If set to true, DRM
> +        * atomic helpers will sendout a fake VBLANK event during display
> +        * updates.
> +        *
> +        * One usage is for drivers and/or hardware without support for VBLANK
> +        * interrupts. Such drivers typically do not initialize vblanking
> +        * (i.e., call drm_vblank_init() wit the number of CRTCs). For CRTCs
> +        * without initialized vblanking, the field is initialized to true and
> +        * a VBLANK event will be send out on each update of the display
> +        * pipeline.
> +        *
> +        * Another usage is CRTCs feeding a writeback connector operating in
> +        * oneshot mode. In this case the VBLANK event is only generated when
> +        * a job is queued to the writeback connector, and we want the core
> +        * to fake VBLANK events when this part of the pipeline hasn't changed
> +        * but others had or when the CRTC and connectors are being disabled.
>          *

Perhaps it's just me, yet the following ideas would make the topic
significantly easier and clearer.

 - adding explicit "fake" when talking about drm/atomic _helpers_
generating/sending a VBLANK event.
For example, in 15/15 the commit message says "fake", while inline
comment omits it... Leading to the confusion pointed out.

- s/no_vblank/fake_vblank/g or s/no_vblank/no_hw_vblank/g
Simple and concise. With slight inclination towards the former wording :-)

If you and Daniel agree with the rename, then the first sentence of
the description should probably be tweaked.

HTH
Emil
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
