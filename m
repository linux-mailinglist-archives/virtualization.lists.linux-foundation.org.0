Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FE01A1D05
	for <lists.virtualization@lfdr.de>; Wed,  8 Apr 2020 10:01:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B399A86E68;
	Wed,  8 Apr 2020 08:01:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WfOAu8hcJY4T; Wed,  8 Apr 2020 08:01:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2E9F486E71;
	Wed,  8 Apr 2020 08:01:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 260ADC0177;
	Wed,  8 Apr 2020 08:01:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 022C0C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 08:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id F18AE86E77
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 08:01:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w0oNWOFVFHk2
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 08:01:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3324986ECA
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 08:01:09 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 3772E20027;
 Wed,  8 Apr 2020 10:01:05 +0200 (CEST)
Date: Wed, 8 Apr 2020 10:01:03 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 39/44] drm/cirrus: Use devm_drm_dev_alloc
Message-ID: <20200408080103.GR14965@ravnborg.org>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-40-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403135828.2542770-40-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=QyXUC8HyAAAA:8
 a=20KFwNOVAAAA:8 a=7gkXJVJtAAAA:8 a=SJz97ENfAAAA:8 a=VwQbUJbxAAAA:8
 a=Z4Rwk6OoAAAA:8 a=QX4gbG5DAAAA:8 a=e5mUnYsNAAAA:8 a=_wLIFZ-h7iRMRWRYyTcA:9
 a=wPNLvfGTeEIA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=vFet0B0WnEQeilDPIY6i:22
 a=AjGcO6oz07-iQ99wixmX:22 a=HkZW87K1Qel5hWWM3VKY:22
 a=AbAUZ8qAyYyZVLSsDulk:22 a=Vxmtnl_E_bksehYqCbjh:22
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Emil Velikov <emil.velikov@collabora.com>
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

On Fri, Apr 03, 2020 at 03:58:23PM +0200, Daniel Vetter wrote:
> Already using devm_drm_dev_init, so very simple replacment.
> =

> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: "Noralf Tr=F8nnes" <noralf@tronnes.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: virtualization@lists.linux-foundation.org
> Cc: Emil Velikov <emil.velikov@collabora.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/cirrus/cirrus.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> =

> diff --git a/drivers/gpu/drm/cirrus/cirrus.c b/drivers/gpu/drm/cirrus/cir=
rus.c
> index a36269717c3b..4b65637147ba 100644
> --- a/drivers/gpu/drm/cirrus/cirrus.c
> +++ b/drivers/gpu/drm/cirrus/cirrus.c
> @@ -567,18 +567,13 @@ static int cirrus_pci_probe(struct pci_dev *pdev,
>  		return ret;
>  =

>  	ret =3D -ENOMEM;
> -	cirrus =3D kzalloc(sizeof(*cirrus), GFP_KERNEL);
> -	if (cirrus =3D=3D NULL)
> -		return ret;
> +	cirrus =3D devm_drm_dev_alloc(&pdev->dev, &cirrus_driver,
> +				    struct cirrus_device, dev);
> +	if (IS_ERR(cirrus))
> +		return PTR_ERR(cirrus);
>  =

>  	dev =3D &cirrus->dev;
> -	ret =3D devm_drm_dev_init(&pdev->dev, dev, &cirrus_driver);
> -	if (ret) {
> -		kfree(cirrus);
> -		return ret;
> -	}
>  	dev->dev_private =3D cirrus;
> -	drmm_add_final_kfree(dev, cirrus);
>  =

>  	cirrus->vram =3D devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0),
>  				    pci_resource_len(pdev, 0));
> -- =

> 2.25.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
