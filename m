Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0AE174104
	for <lists.virtualization@lfdr.de>; Fri, 28 Feb 2020 21:32:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C2DF586225;
	Fri, 28 Feb 2020 20:32:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l6JTs-Xhv+ob; Fri, 28 Feb 2020 20:32:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 283AA86224;
	Fri, 28 Feb 2020 20:32:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04F6AC0177;
	Fri, 28 Feb 2020 20:32:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 488DCC0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 20:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2D23686224
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 20:32:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e2-FZTl4-j0u
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 20:32:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1AD8486223
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 20:32:40 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 31213803D5;
 Fri, 28 Feb 2020 21:32:37 +0100 (CET)
Date: Fri, 28 Feb 2020 21:32:35 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 29/51] drm/cirrus: Drop explicit drm_mode_config_cleanup
 call
Message-ID: <20200228203235.GC22966@ravnborg.org>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
 <20200227181522.2711142-30-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227181522.2711142-30-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=P1BnusSwAAAA:8
 a=QyXUC8HyAAAA:8 a=20KFwNOVAAAA:8 a=SJz97ENfAAAA:8 a=7gkXJVJtAAAA:8
 a=Z4Rwk6OoAAAA:8 a=-hpWaDvZO2SIxJIrMkMA:9 a=wPNLvfGTeEIA:10
 a=D0XLA9XvdZm18NrgonBM:22 a=vFet0B0WnEQeilDPIY6i:22
 a=E9Po1WZjFZOl8hwRPBS3:22 a=HkZW87K1Qel5hWWM3VKY:22
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 m.felsch@pengutronix.de, DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, l.stach@pengutronix.de
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

On Thu, Feb 27, 2020 at 07:15:00PM +0100, Daniel Vetter wrote:
> We can even delete the drm_driver.release hook now!
> =

> This is made possible by a preceeding patch which added a drmm_
> cleanup action to drm_mode_config_init(), hence all we need to do to
> ensure that drm_mode_config_cleanup() is run on final drm_device
> cleanup is check the new error code for _init().
> =

> v2: Explain why this cleanup is possible (Laurent).
> =

> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: "Noralf Tr=F8nnes" <noralf@tronnes.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: virtualization@lists.linux-foundation.org

Acked-by: Sam Ravnborg <sam@ravnborg.org>

But as stated in other post - using drmm_mode_config_init()
would make this more readable.

	Sam

> ---
>  drivers/gpu/drm/cirrus/cirrus.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> =

> diff --git a/drivers/gpu/drm/cirrus/cirrus.c b/drivers/gpu/drm/cirrus/cir=
rus.c
> index a9d789a56536..6ac0286810ec 100644
> --- a/drivers/gpu/drm/cirrus/cirrus.c
> +++ b/drivers/gpu/drm/cirrus/cirrus.c
> @@ -510,11 +510,15 @@ static const struct drm_mode_config_funcs cirrus_mo=
de_config_funcs =3D {
>  	.atomic_commit =3D drm_atomic_helper_commit,
>  };
>  =

> -static void cirrus_mode_config_init(struct cirrus_device *cirrus)
> +static int cirrus_mode_config_init(struct cirrus_device *cirrus)
>  {
>  	struct drm_device *dev =3D &cirrus->dev;
> +	int ret;
> +
> +	ret =3D drm_mode_config_init(dev);
> +	if (ret)
> +		return ret;
>  =

> -	drm_mode_config_init(dev);
>  	dev->mode_config.min_width =3D 0;
>  	dev->mode_config.min_height =3D 0;
>  	dev->mode_config.max_width =3D CIRRUS_MAX_PITCH / 2;
> @@ -522,15 +526,12 @@ static void cirrus_mode_config_init(struct cirrus_d=
evice *cirrus)
>  	dev->mode_config.preferred_depth =3D 16;
>  	dev->mode_config.prefer_shadow =3D 0;
>  	dev->mode_config.funcs =3D &cirrus_mode_config_funcs;
> +
> +	return 0;
>  }
>  =

>  /* ------------------------------------------------------------------ */
>  =

> -static void cirrus_release(struct drm_device *dev)
> -{
> -	drm_mode_config_cleanup(dev);
> -}
> -
>  DEFINE_DRM_GEM_FOPS(cirrus_fops);
>  =

>  static struct drm_driver cirrus_driver =3D {
> @@ -544,7 +545,6 @@ static struct drm_driver cirrus_driver =3D {
>  =

>  	.fops		 =3D &cirrus_fops,
>  	DRM_GEM_SHMEM_DRIVER_OPS,
> -	.release         =3D cirrus_release,
>  };
>  =

>  static int cirrus_pci_probe(struct pci_dev *pdev,
> @@ -591,7 +591,9 @@ static int cirrus_pci_probe(struct pci_dev *pdev,
>  	if (cirrus->mmio =3D=3D NULL)
>  		goto err_unmap_vram;
>  =

> -	cirrus_mode_config_init(cirrus);
> +	ret =3D cirrus_mode_config_init(cirrus);
> +	if (ret)
> +		goto err_cleanup;
>  =

>  	ret =3D cirrus_conn_init(cirrus);
>  	if (ret < 0)
> @@ -613,7 +615,6 @@ static int cirrus_pci_probe(struct pci_dev *pdev,
>  	return 0;
>  =

>  err_cleanup:
> -	drm_mode_config_cleanup(dev);
>  	iounmap(cirrus->mmio);
>  err_unmap_vram:
>  	iounmap(cirrus->vram);
> -- =

> 2.24.1
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
