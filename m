Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F161A1D13
	for <lists.virtualization@lfdr.de>; Wed,  8 Apr 2020 10:04:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 04E5186E77;
	Wed,  8 Apr 2020 08:04:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VxgtE-zB+fNK; Wed,  8 Apr 2020 08:04:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1397786E53;
	Wed,  8 Apr 2020 08:04:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F30F5C0177;
	Wed,  8 Apr 2020 08:04:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1C3EAC0177
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 08:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0F57F86C24
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 08:04:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GpnrGj0b+Ubd
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 08:04:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0561E86E53
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 08:04:53 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 98D3520027;
 Wed,  8 Apr 2020 10:04:50 +0200 (CEST)
Date: Wed, 8 Apr 2020 10:04:49 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 40/44] drm/cirrus: Don't use drm_device->dev_private
Message-ID: <20200408080449.GT14965@ravnborg.org>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-41-daniel.vetter@ffwll.ch>
 <a7bb7d54-2c71-b087-8347-888a5019aacc@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a7bb7d54-2c71-b087-8347-888a5019aacc@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=QyXUC8HyAAAA:8
 a=20KFwNOVAAAA:8 a=SJz97ENfAAAA:8 a=7gkXJVJtAAAA:8 a=-VAfIpHNAAAA:8
 a=Z4Rwk6OoAAAA:8 a=e5mUnYsNAAAA:8 a=QQgCvO5zcufMg-FMuWYA:9
 a=wPNLvfGTeEIA:10 a=vFet0B0WnEQeilDPIY6i:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=srlwD-8ojaedGGhPAyx8:22 a=HkZW87K1Qel5hWWM3VKY:22
 a=Vxmtnl_E_bksehYqCbjh:22
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>
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

Hi Thomas.

On Mon, Apr 06, 2020 at 01:58:54PM +0200, Thomas Zimmermann wrote:
> =

> =

> Am 03.04.20 um 15:58 schrieb Daniel Vetter:
> > Upcasting using a container_of macro is more typesafe, faster and
> > easier for the compiler to optimize.
> > =

> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Dave Airlie <airlied@redhat.com>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: "Noralf Tr=F8nnes" <noralf@tronnes.org>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Eric Anholt <eric@anholt.net>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: virtualization@lists.linux-foundation.org
> > ---
> >  drivers/gpu/drm/cirrus/cirrus.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/cirrus/cirrus.c b/drivers/gpu/drm/cirrus/c=
irrus.c
> > index 4b65637147ba..744a8e337e41 100644
> > --- a/drivers/gpu/drm/cirrus/cirrus.c
> > +++ b/drivers/gpu/drm/cirrus/cirrus.c
> > @@ -59,6 +59,8 @@ struct cirrus_device {
> >  	void __iomem		       *mmio;
> >  };
> >  =

> > +#define to_cirrus(_dev) container_of(_dev, struct cirrus_device, dev)
> > +
> =

> Maybe to_cirrus_device() ? I had the same comment for vbox and I think
> it applies to all patches.

The variable name is consistently using the name "cirrus" - so my
personal preference is to_cirrus().

Also IMO struct cirrus_device is misnamed. It is more than a device.

	Sam

> =

> Best regards
> Thomas
> =

> >  /* ------------------------------------------------------------------ =
*/
> >  /*
> >   * The meat of this driver. The core passes us a mode and we have to p=
rogram
> > @@ -311,7 +313,7 @@ static int cirrus_mode_set(struct cirrus_device *ci=
rrus,
> >  static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
> >  			       struct drm_rect *rect)
> >  {
> > -	struct cirrus_device *cirrus =3D fb->dev->dev_private;
> > +	struct cirrus_device *cirrus =3D to_cirrus(fb->dev);
> >  	void *vmap;
> >  	int idx, ret;
> >  =

> > @@ -436,7 +438,7 @@ static void cirrus_pipe_enable(struct drm_simple_di=
splay_pipe *pipe,
> >  			       struct drm_crtc_state *crtc_state,
> >  			       struct drm_plane_state *plane_state)
> >  {
> > -	struct cirrus_device *cirrus =3D pipe->crtc.dev->dev_private;
> > +	struct cirrus_device *cirrus =3D to_cirrus(pipe->crtc.dev);
> >  =

> >  	cirrus_mode_set(cirrus, &crtc_state->mode, plane_state->fb);
> >  	cirrus_fb_blit_fullscreen(plane_state->fb);
> > @@ -445,7 +447,7 @@ static void cirrus_pipe_enable(struct drm_simple_di=
splay_pipe *pipe,
> >  static void cirrus_pipe_update(struct drm_simple_display_pipe *pipe,
> >  			       struct drm_plane_state *old_state)
> >  {
> > -	struct cirrus_device *cirrus =3D pipe->crtc.dev->dev_private;
> > +	struct cirrus_device *cirrus =3D to_cirrus(pipe->crtc.dev);
> >  	struct drm_plane_state *state =3D pipe->plane.state;
> >  	struct drm_crtc *crtc =3D &pipe->crtc;
> >  	struct drm_rect rect;
> > @@ -573,7 +575,6 @@ static int cirrus_pci_probe(struct pci_dev *pdev,
> >  		return PTR_ERR(cirrus);
> >  =

> >  	dev =3D &cirrus->dev;
> > -	dev->dev_private =3D cirrus;
> >  =

> >  	cirrus->vram =3D devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0),
> >  				    pci_resource_len(pdev, 0));
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





> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
