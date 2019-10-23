Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C04E14C6
	for <lists.virtualization@lfdr.de>; Wed, 23 Oct 2019 10:53:40 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B6E48C87;
	Wed, 23 Oct 2019 08:53:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 23A55C77
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 08:53:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1C59E87E
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 08:53:24 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c2so15882641wrr.10
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 01:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=c15b8lNHKKPEisLr5Qnb32a9fHBq7eoEYGPC9AHM6uM=;
	b=aADuctuVh+iBZgH6KmBw1uYsoBaMygfjSaq4gUfEbVAoFI5tX8ASjl0+GFW9mmhX4R
	ZjW5nE9aypoRimDAoES9vBU8SzEm6vG3VYtmWiPKado050bhrE1iY+Kz/EnISTSOwgVk
	sgc8fLv1AzXyewUbTZbE4izySIpyD0ZpLNHsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=c15b8lNHKKPEisLr5Qnb32a9fHBq7eoEYGPC9AHM6uM=;
	b=lBMwMkmE1aMzkV2UBPhA7Np5IhXpk/2/aXR+WJJrWYO+srwrp6aYqidhOdYkIep1Id
	RiURUTMG6yydI/sq7ojCH4vvh+ajUQNz3XpHM7XM77pck+01MIQ/9Thr480MfLqLJo2p
	k6Er8g2tdZKtNyA+4eXkmUOUvnZIDGaFfewgJS1CSy/YRZEuGnJCOm2xZvkOz/kY1FjK
	pnKvC9iyotDQNTjGzqcgRz89ku/Jo+RhgnOuO/pYqiD28QO1Ko5GBgElfqelSHuSpuGh
	IOETzA0NktwSqqexUWEzhZi/SKQCKQGX3dMwSZuuuXisiiohj2aEiC/aSUlDr+i5oqIv
	w7iA==
X-Gm-Message-State: APjAAAXfsNw5itYS93OzOMhDnMQ3yHy1w3XFX52L9/EmVNOJrtjkfn/M
	M8PqtzNntUoUJUwLT6Dsia10PQ==
X-Google-Smtp-Source: APXvYqzhSCBtM2XktGWC56wZzj/ptZmdDpZVVDT2xUI+aDXlHXbZfa/6Bw7c+Q+uGuv3Zca7oaVxhQ==
X-Received: by 2002:adf:e2cc:: with SMTP id d12mr7456738wrj.345.1571820802541; 
	Wed, 23 Oct 2019 01:53:22 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
	[212.51.149.96]) by smtp.gmail.com with ESMTPSA id
	p7sm19162808wma.34.2019.10.23.01.53.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 23 Oct 2019 01:53:21 -0700 (PDT)
Date: Wed, 23 Oct 2019 10:53:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/simple-kms: Standardize arguments for callbacks
Message-ID: <20191023085319.GS11828@phenom.ffwll.local>
References: <20191022155536.27939-1-daniel.vetter@ffwll.ch>
	<56867554-5169-e249-8e55-043d07be3e99@suse.de>
	<CAKMK7uHo2L8m+VT1vSMjOdScJmuSQP032HyAFj_aYiCJu+gaRQ@mail.gmail.com>
	<64a4e824-f730-2ac4-0b02-4ead2bce4b69@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <64a4e824-f730-2ac4-0b02-4ead2bce4b69@suse.de>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
	DRI Development <dri-devel@lists.freedesktop.org>, "open list:VIRTIO CORE,
	NET..." <virtualization@lists.linux-foundation.org>,
	Daniel Vetter <daniel.vetter@intel.com>,
	Emil Velikov <emil.velikov@collabora.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Wed, Oct 23, 2019 at 08:47:57AM +0200, Thomas Zimmermann wrote:
> Hi
> =

> Am 22.10.19 um 21:03 schrieb Daniel Vetter:
> > On Tue, Oct 22, 2019 at 7:16 PM Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
> >>
> >> Hi,
> >>
> >> there are two types of callbacks in struct
> >> drm_simple_display_pipe_funcs: functions that are genuine to simple KM=
S,
> >> and functions that are merely forwarded from another structure (crtc,
> >> plane, etc).
> >>
> >> In the former category are enable(), disable(), check(), and update().
> >> Those should probably receive a simple display pipe as their first arg=
ument.
> > =

> > mode_valid _very_ much belongs to this category too, since there's
> > mode_valid hooks also on other objects. But simple pipe helper
> > condenses that down to one mode_valid hook (we could also put the
> > mode_valid onto encoder, wouldn't change anything).
> > =

> >> In the latter category are mode_valid(), prepare_fb(), cleanup_fb(),
> >> enable_vblank(), and disable_vblank(). IMHO those functions should
> >> receive a pointer to the original structure as their first argument.
> >> This type provides the context in which the operations make sense. (Ev=
en
> >> their documentation already refers to the original structure.)
> > =

> > Now on those you can maybe make a case that they only exist in one
> > object. But the entire point of simple helpers was to condense the zoo
> > of drm types down to one. Only reason you don't also get a
> > drm_simple_display_pipe_state is that this one would be a bit more
> > work to make work correctly. If we full on leak all the underlying
> > objects, then you might as well set them up yourself and set up all
> > the hooks, it's just a few more lines of code.
> > =

> > Imo for simple pipe we should go more into that direction, not less.
> > =

> >> I admit that not all are as shareable as prepare_fb() and enable_fb().
> >> But what else than boiler-plate wrappers do we get from simple display
> >> pipe here?
> > =

> > Boiler plate wrappers is pretty much the entire point of simple pipe
> > helpers. Anytime you're interested in the things it abstracts away
> > (crtc, plane, encoder) you probably want your own atomic
> > implementation.
> =

> I was speaking of boiler-plate code in drivers and other helpers (e.g.,
> drm_gem_fb_simple_display_pipe_prepare_fb() )
> =

> TBH I don't think it is possible to build and use simple pipe without
> exposing the underlying primitives (crtc, plane, connector). This would
> require a completely separate set of atomic helpers. IMHO the current
> simple pipe is a mid-layer and comes with typical mid-layer problems.

Helpers can be midlayers, as long as their optional. And for simple I
agree it's not a perfect illusion, it's a tradeoff between having a huge
helper library that remaps everything and still enabling useful code and
complexity savings in the tiny drivers.

Maybe another rule of thumb: If your driver has more than one source file,
simple pipe is maybe not what you're looking for. Exceptions apply ofc.
simple pipe was designed for drm/tiny, and it utterly excels at that. But
that doesn't make it a general purpose tool.

> Anyway, given your rational for the current design, I'll update my
> recent patches for prepare_fb() to support simple pipe.
> =

> For this patch
> =

>   Acked-By: Thomas Zimmermann <tzimmermann@suse.de>

Thanks, will apply.
-Daniel

> =

> Best regards
> Thomas
> =

> > conversion is a good fit, it's not meant to be useful for all small
> > drivers. Only for the _really_ simple ones.
> > =

> > Otherwise if we readd all the bells and whistles to simple pipe
> > helpers, then we just end back where we started. That's also why I
> > personally think explicit simple wrappers would fit better, instead of
> > wrestling the prepare/cleanup_fb functions to match full atomic
> > helpers.
> > -Daniel
> > =

> >>
> >> Best regards
> >> Thomas
> >>
> >> Am 22.10.19 um 17:55 schrieb Daniel Vetter:
> >>> Passing the wrong type feels icky, everywhere else we use the pipe as
> >>> the first parameter. Spotted while discussing patches with Thomas
> >>> Zimmermann.
> >>>
> >>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >>> Cc: Noralf Tr=F8nnes <noralf@tronnes.org>
> >>> Cc: Gerd Hoffmann <kraxel@redhat.com>
> >>> Cc: Eric Anholt <eric@anholt.net>
> >>> Cc: Emil Velikov <emil.velikov@collabora.com>
> >>> Cc: virtualization@lists.linux-foundation.org
> >>> Cc: Linus Walleij <linus.walleij@linaro.org>
> >>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> >>> ---
> >>>  drivers/gpu/drm/cirrus/cirrus.c         | 2 +-
> >>>  drivers/gpu/drm/drm_simple_kms_helper.c | 2 +-
> >>>  drivers/gpu/drm/pl111/pl111_display.c   | 4 ++--
> >>>  include/drm/drm_simple_kms_helper.h     | 2 +-
> >>>  4 files changed, 5 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/cirrus/cirrus.c b/drivers/gpu/drm/cirrus=
/cirrus.c
> >>> index 7d08d067e1a4..248c9f765c45 100644
> >>> --- a/drivers/gpu/drm/cirrus/cirrus.c
> >>> +++ b/drivers/gpu/drm/cirrus/cirrus.c
> >>> @@ -390,7 +390,7 @@ static int cirrus_conn_init(struct cirrus_device =
*cirrus)
> >>>  /* -----------------------------------------------------------------=
- */
> >>>  /* cirrus (simple) display pipe                                     =
       */
> >>>
> >>> -static enum drm_mode_status cirrus_pipe_mode_valid(struct drm_crtc *=
crtc,
> >>> +static enum drm_mode_status cirrus_pipe_mode_valid(struct drm_simple=
_display_pipe *pipe,
> >>>                                                  const struct drm_dis=
play_mode *mode)
> >>>  {
> >>>       if (cirrus_check_size(mode->hdisplay, mode->vdisplay, NULL) < 0)
> >>> diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/dr=
m/drm_simple_kms_helper.c
> >>> index 046055719245..15fb516ae2d8 100644
> >>> --- a/drivers/gpu/drm/drm_simple_kms_helper.c
> >>> +++ b/drivers/gpu/drm/drm_simple_kms_helper.c
> >>> @@ -43,7 +43,7 @@ drm_simple_kms_crtc_mode_valid(struct drm_crtc *crt=
c,
> >>>               /* Anything goes */
> >>>               return MODE_OK;
> >>>
> >>> -     return pipe->funcs->mode_valid(crtc, mode);
> >>> +     return pipe->funcs->mode_valid(pipe, mode);
> >>>  }
> >>>
> >>>  static int drm_simple_kms_crtc_check(struct drm_crtc *crtc,
> >>> diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/=
pl111/pl111_display.c
> >>> index 024771a4083e..703ddc803c55 100644
> >>> --- a/drivers/gpu/drm/pl111/pl111_display.c
> >>> +++ b/drivers/gpu/drm/pl111/pl111_display.c
> >>> @@ -48,10 +48,10 @@ irqreturn_t pl111_irq(int irq, void *data)
> >>>  }
> >>>
> >>>  static enum drm_mode_status
> >>> -pl111_mode_valid(struct drm_crtc *crtc,
> >>> +pl111_mode_valid(struct drm_simple_display_pipe *pipe,
> >>>                const struct drm_display_mode *mode)
> >>>  {
> >>> -     struct drm_device *drm =3D crtc->dev;
> >>> +     struct drm_device *drm =3D pipe->crtc.dev;
> >>>       struct pl111_drm_dev_private *priv =3D drm->dev_private;
> >>>       u32 cpp =3D priv->variant->fb_bpp / 8;
> >>>       u64 bw;
> >>> diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_si=
mple_kms_helper.h
> >>> index 4d89cd0a60db..15afee9cf049 100644
> >>> --- a/include/drm/drm_simple_kms_helper.h
> >>> +++ b/include/drm/drm_simple_kms_helper.h
> >>> @@ -49,7 +49,7 @@ struct drm_simple_display_pipe_funcs {
> >>>        *
> >>>        * drm_mode_status Enum
> >>>        */
> >>> -     enum drm_mode_status (*mode_valid)(struct drm_crtc *crtc,
> >>> +     enum drm_mode_status (*mode_valid)(struct drm_simple_display_pi=
pe *pipe,
> >>>                                          const struct drm_display_mod=
e *mode);
> >>>
> >>>       /**
> >>>
> >>
> >> --
> >> Thomas Zimmermann
> >> Graphics Driver Developer
> >> SUSE Software Solutions Germany GmbH
> >> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> >> (HRB 36809, AG N=FCrnberg)
> >> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> >>
> > =

> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =





-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
