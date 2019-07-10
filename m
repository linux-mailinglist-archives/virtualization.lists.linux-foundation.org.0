Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EABA649E5
	for <lists.virtualization@lfdr.de>; Wed, 10 Jul 2019 17:43:11 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0BED545D9;
	Wed, 10 Jul 2019 15:43:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 40D3F4591
	for <virtualization@lists.linux-foundation.org>;
	Wed, 10 Jul 2019 15:34:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6EFC5886
	for <virtualization@lists.linux-foundation.org>;
	Wed, 10 Jul 2019 15:34:15 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id e3so2591601edr.10
	for <virtualization@lists.linux-foundation.org>;
	Wed, 10 Jul 2019 08:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=2KRyzWKVJ1r9jz+Xx4aA9J28JsbLlUf61PW6SdNKD7M=;
	b=e4qMm/katlxJjK5E4RUDiVYRgMUBOETs4yLIrtm4EVvEP4AiUfADV33Cead1y2/hlT
	ZPvk6J570VwquFY62hIhX4BKYIWjAfYE1wk3iz++PSk2iwxo1xMdMdaf4M9eBkENxz9R
	fvSEUQ3QjBRpVkwKPaK9uashIseTpFOqWKsLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=2KRyzWKVJ1r9jz+Xx4aA9J28JsbLlUf61PW6SdNKD7M=;
	b=OodSu+M2QBM9+bys2ovEHs8KWTNI0K3Q0St1WAVweDNDzzhJfz1TN7q87e6UwZHKKO
	4riJzJCTNhbzvPoUXy4Qu1Qu886ng0n7YbqcHcVnIaItvbuOtcmKefXE4Qz5Lvs99U1D
	Mdwv5E9aKspyulzjuKzG0sUlCBr3vX/I2l/lDYa6qwE2DYAjGtlNSa/WyMKb5sIxyIQW
	5nlhDv3/eLBOU02IUzoNfGMj4u9wukJmY3XhM4xDgApUZ6lX35IxH97awGK0Imzi7H4G
	iCfoDiqm4wSyLmWewdf+ckIePX6oZoWkK0utIU1FtB0HcyiDSV+rKmbssCHGU3ni+buD
	EAJw==
X-Gm-Message-State: APjAAAVki8KAx1m9E4r/h3QGVV4fTau3XHiA2Zp1NVjlCHW3qRdkXr0w
	Z130jiG+ZcupXDv3FGLsquJfJw==
X-Google-Smtp-Source: APXvYqwEr1dFRN1VdNMAqLJCbd84/UpT3r++MXtJbkiHXcVoESh710iqM2S/yDGf65QoyB1qNR+LOQ==
X-Received: by 2002:a50:addc:: with SMTP id b28mr32636964edd.174.1562772854009;
	Wed, 10 Jul 2019 08:34:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
	by smtp.gmail.com with ESMTPSA id m25sm592912ejs.85.2019.07.10.08.34.12
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 10 Jul 2019 08:34:13 -0700 (PDT)
Date: Wed, 10 Jul 2019 17:34:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 3/6] drm/fb-helper: Instanciate shadow FB if
	configured in device's mode_config
Message-ID: <20190710153410.GU15868@phenom.ffwll.local>
References: <20190705092613.7621-1-tzimmermann@suse.de>
	<20190705092613.7621-4-tzimmermann@suse.de>
	<68f5783f-8022-3238-a6d9-c6a774b39633@tronnes.org>
	<59111691-5283-fb50-94a9-6960c425e81c@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <59111691-5283-fb50-94a9-6960c425e81c@suse.de>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: yc_chen@aspeedtech.com, maxime.ripard@bootlin.com, sam@ravnborg.org,
	maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org,
	Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
	daniel@ffwll.ch, airlied@redhat.com, sean@poorly.run
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

On Sun, Jul 07, 2019 at 06:14:50PM +0200, Thomas Zimmermann wrote:
> Hi
> =

> Am 07.07.19 um 16:37 schrieb Noralf Tr=F8nnes:
> > =

> > =

> > Den 05.07.2019 11.26, skrev Thomas Zimmermann:
> >> Generic framebuffer emulation uses a shadow buffer for framebuffers wi=
th
> >> dirty() function. If drivers want to use the shadow FB without such a
> >> function, they can now set prefer_shadow or prefer_shadow_fbdev in the=
ir
> >> mode_config structures. The former flag is exported to userspace, the =
latter
> >> flag is fbdev-only.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> ---
> >>  drivers/gpu/drm/drm_fb_helper.c | 19 ++++++++++++++-----
> >>  include/drm/drm_mode_config.h   |  5 +++++
> >>  2 files changed, 19 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_=
helper.c
> >> index 7ba6a0255821..56ef169e1814 100644
> >> --- a/drivers/gpu/drm/drm_fb_helper.c
> >> +++ b/drivers/gpu/drm/drm_fb_helper.c
> >> @@ -421,7 +421,9 @@ static void drm_fb_helper_dirty_work(struct work_s=
truct *work)
> >>  				return;
> >>  			drm_fb_helper_dirty_blit_real(helper, &clip_copy);
> >>  		}
> >> -		helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, &clip_copy, 1);
> >> +		if (helper->fb->funcs->dirty)
> >> +			helper->fb->funcs->dirty(helper->fb, NULL, 0, 0,
> >> +						 &clip_copy, 1);
> >>  =

> >>  		if (helper->buffer)
> >>  			drm_client_buffer_vunmap(helper->buffer);
> >> @@ -620,9 +622,6 @@ static void drm_fb_helper_dirty(struct fb_info *in=
fo, u32 x, u32 y,
> >>  	struct drm_clip_rect *clip =3D &helper->dirty_clip;
> >>  	unsigned long flags;
> >>  =

> >> -	if (!helper->fb->funcs->dirty)
> >> -		return;
> > =

> > drm_fb_helper_dirty() is called unconditionally by
> > drm_fb_helper_sys_imageblit() et al, so we need check with
> > drm_fbdev_use_shadow_fb() here.
> > =

> >> -
> >>  	spin_lock_irqsave(&helper->dirty_lock, flags);
> >>  	clip->x1 =3D min_t(u32, clip->x1, x);
> >>  	clip->y1 =3D min_t(u32, clip->y1, y);
> >> @@ -2166,6 +2165,16 @@ static struct fb_deferred_io drm_fbdev_defio =
=3D {
> >>  	.deferred_io	=3D drm_fb_helper_deferred_io,
> >>  };
> >>  =

> >> +static bool drm_fbdev_use_shadow_fb(struct drm_fb_helper *fb_helper)
> >> +{
> >> +	struct drm_device *dev =3D fb_helper->dev;
> >> +	struct drm_framebuffer *fb =3D fb_helper->fb;
> >> +
> >> +	return dev->mode_config.prefer_shadow_fbdev |
> >> +	       dev->mode_config.prefer_shadow |
> > =

> > Use logical OR here
> > =

> >> +	       !!fb->funcs->dirty;
> > =

> > and you can drop the the double NOT here.
> > =

> >> +}
> >> +
> >>  /**
> >>   * drm_fb_helper_generic_probe - Generic fbdev emulation probe helper
> >>   * @fb_helper: fbdev helper structure
> >> @@ -2213,7 +2222,7 @@ int drm_fb_helper_generic_probe(struct drm_fb_he=
lper *fb_helper,
> >>  =

> >>  	drm_fb_helper_fill_info(fbi, fb_helper, sizes);
> >>  =

> >> -	if (fb->funcs->dirty) {
> >> +	if (drm_fbdev_use_shadow_fb(fb_helper)) {
> >>  		struct fb_ops *fbops;
> >>  		void *shadow;
> >>  =

> >> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_conf=
ig.h
> >> index 759d462d028b..e1c751aca353 100644
> >> --- a/include/drm/drm_mode_config.h
> >> +++ b/include/drm/drm_mode_config.h
> >> @@ -347,6 +347,8 @@ struct drm_mode_config_funcs {
> >>   * @output_poll_work: delayed work for polling in process context
> >>   * @preferred_depth: preferred RBG pixel depth, used by fb helpers
> >>   * @prefer_shadow: hint to userspace to prefer shadow-fb rendering
> >> + * @prefer_shadow_fbdev: hint to framebuffer emulation to prefer shad=
ow-fb \
> >> +	rendering
> > =

> > It's preferred to have the doc together with the struct member.
> =

> I just tried to follow the file's existing style, but OK, I don't mind.

If it annoys you too much, convert all the member docs in the header
comment into the inline style. That's what I usually do when the first
inline kerneldoc comment is warranted (like here), but not yet rolled out.

Or just mix&match if you feel like not doing that, we have lots of that
already :-)
-Daniel

> =

> > it's less likely to be forgotten when things change. And we don't use
> > line cont. when the doc line is too long. Just continue on the next line
> > after an asterix.
> > =

> >>   * @cursor_width: hint to userspace for max cursor width
> >>   * @cursor_height: hint to userspace for max cursor height
> >>   * @helper_private: mid-layer private data
> >> @@ -852,6 +854,9 @@ struct drm_mode_config {
> >>  	/* dumb ioctl parameters */
> >>  	uint32_t preferred_depth, prefer_shadow;
> >>  =

> >> +	/* fbdev parameters */
> > =

> > No need for this comment.
> > =

> > Doc can look like this, I've done s/framebuffer/fbdev/:
> > 	/**
> > 	 * @prefer_shadow_fbdev:
> > 	 *
> > 	 * Hint to fbdev emulation to prefer shadow-fb rendering.
> > 	 */
> > =

> >> +	uint32_t prefer_shadow_fbdev;
> > =

> > Use bool here.
> > =

> > With that:
> > =

> > Reviewed-by: Noralf Tr=F8nnes <noralf@tronnes.org>
> > =

> > I have tested this on 2 drivers that use generic fbdev: vc4 (no shadow
> > buf) and mi0283qt which has a dirty callback.
> > =

> > Tested-by: Noralf Tr=F8nnes <noralf@tronnes.org>
> =

> Thanks for reviewing and testing the patches.
> =

> Best regards
> Thomas
> =

> > =

> >> +
> >>  	/**
> >>  	 * @quirk_addfb_prefer_xbgr_30bpp:
> >>  	 *
> >>
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
> GF: Felix Imend=F6rffer, Mary Higgins, Sri Rasiah
> HRB 21284 (AG N=FCrnberg)
> =





-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
