Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA2DE0A5D
	for <lists.virtualization@lfdr.de>; Tue, 22 Oct 2019 19:17:05 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 00F45C75;
	Tue, 22 Oct 2019 17:16:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0F7F8BBC
	for <virtualization@lists.linux-foundation.org>;
	Tue, 22 Oct 2019 17:16:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EA7818AE
	for <virtualization@lists.linux-foundation.org>;
	Tue, 22 Oct 2019 17:16:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 09042B269;
	Tue, 22 Oct 2019 17:16:54 +0000 (UTC)
Subject: Re: [PATCH] drm/simple-kms: Standardize arguments for callbacks
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
	DRI Development <dri-devel@lists.freedesktop.org>
References: <20191022155536.27939-1-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
	mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
	XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
	BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
	hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
	9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
	AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
	BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
	Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
	irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
	clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
	mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
	KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
	Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
	UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
	RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
	dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
	ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
	12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
	wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
	h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
	n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
	aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
	HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
	3H26qrE=
Message-ID: <56867554-5169-e249-8e55-043d07be3e99@suse.de>
Date: Tue, 22 Oct 2019 19:16:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191022155536.27939-1-daniel.vetter@ffwll.ch>
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	virtualization@lists.linux-foundation.org, Eric Anholt <eric@anholt.net>,
	=?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
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
Content-Type: multipart/mixed; boundary="===============4320747800337641035=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============4320747800337641035==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="AVNEa8n9JSCbEwFXDYwtEItZhZYM7l5Aa"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--AVNEa8n9JSCbEwFXDYwtEItZhZYM7l5Aa
Content-Type: multipart/mixed; boundary="8R2A49zPqFPARTuyrAPp7r5SSwQR0Nbpb";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Anholt <eric@anholt.net>,
 Emil Velikov <emil.velikov@collabora.com>,
 virtualization@lists.linux-foundation.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <56867554-5169-e249-8e55-043d07be3e99@suse.de>
Subject: Re: [PATCH] drm/simple-kms: Standardize arguments for callbacks
References: <20191022155536.27939-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20191022155536.27939-1-daniel.vetter@ffwll.ch>

--8R2A49zPqFPARTuyrAPp7r5SSwQR0Nbpb
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

there are two types of callbacks in struct
drm_simple_display_pipe_funcs: functions that are genuine to simple KMS,
and functions that are merely forwarded from another structure (crtc,
plane, etc).

In the former category are enable(), disable(), check(), and update().
Those should probably receive a simple display pipe as their first argume=
nt.

In the latter category are mode_valid(), prepare_fb(), cleanup_fb(),
enable_vblank(), and disable_vblank(). IMHO those functions should
receive a pointer to the original structure as their first argument.
This type provides the context in which the operations make sense. (Even
their documentation already refers to the original structure.)

I admit that not all are as shareable as prepare_fb() and enable_fb().
But what else than boiler-plate wrappers do we get from simple display
pipe here?

Best regards
Thomas

Am 22.10.19 um 17:55 schrieb Daniel Vetter:
> Passing the wrong type feels icky, everywhere else we use the pipe as
> the first parameter. Spotted while discussing patches with Thomas
> Zimmermann.
>=20
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Emil Velikov <emil.velikov@collabora.com>
> Cc: virtualization@lists.linux-foundation.org
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/cirrus/cirrus.c         | 2 +-
>  drivers/gpu/drm/drm_simple_kms_helper.c | 2 +-
>  drivers/gpu/drm/pl111/pl111_display.c   | 4 ++--
>  include/drm/drm_simple_kms_helper.h     | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/cirrus/cirrus.c b/drivers/gpu/drm/cirrus/c=
irrus.c
> index 7d08d067e1a4..248c9f765c45 100644
> --- a/drivers/gpu/drm/cirrus/cirrus.c
> +++ b/drivers/gpu/drm/cirrus/cirrus.c
> @@ -390,7 +390,7 @@ static int cirrus_conn_init(struct cirrus_device *c=
irrus)
>  /* ------------------------------------------------------------------ =
*/
>  /* cirrus (simple) display pipe					      */
> =20
> -static enum drm_mode_status cirrus_pipe_mode_valid(struct drm_crtc *cr=
tc,
> +static enum drm_mode_status cirrus_pipe_mode_valid(struct drm_simple_d=
isplay_pipe *pipe,
>  						   const struct drm_display_mode *mode)
>  {
>  	if (cirrus_check_size(mode->hdisplay, mode->vdisplay, NULL) < 0)
> diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/=
drm_simple_kms_helper.c
> index 046055719245..15fb516ae2d8 100644
> --- a/drivers/gpu/drm/drm_simple_kms_helper.c
> +++ b/drivers/gpu/drm/drm_simple_kms_helper.c
> @@ -43,7 +43,7 @@ drm_simple_kms_crtc_mode_valid(struct drm_crtc *crtc,=

>  		/* Anything goes */
>  		return MODE_OK;
> =20
> -	return pipe->funcs->mode_valid(crtc, mode);
> +	return pipe->funcs->mode_valid(pipe, mode);
>  }
> =20
>  static int drm_simple_kms_crtc_check(struct drm_crtc *crtc,
> diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl=
111/pl111_display.c
> index 024771a4083e..703ddc803c55 100644
> --- a/drivers/gpu/drm/pl111/pl111_display.c
> +++ b/drivers/gpu/drm/pl111/pl111_display.c
> @@ -48,10 +48,10 @@ irqreturn_t pl111_irq(int irq, void *data)
>  }
> =20
>  static enum drm_mode_status
> -pl111_mode_valid(struct drm_crtc *crtc,
> +pl111_mode_valid(struct drm_simple_display_pipe *pipe,
>  		 const struct drm_display_mode *mode)
>  {
> -	struct drm_device *drm =3D crtc->dev;
> +	struct drm_device *drm =3D pipe->crtc.dev;
>  	struct pl111_drm_dev_private *priv =3D drm->dev_private;
>  	u32 cpp =3D priv->variant->fb_bpp / 8;
>  	u64 bw;
> diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simp=
le_kms_helper.h
> index 4d89cd0a60db..15afee9cf049 100644
> --- a/include/drm/drm_simple_kms_helper.h
> +++ b/include/drm/drm_simple_kms_helper.h
> @@ -49,7 +49,7 @@ struct drm_simple_display_pipe_funcs {
>  	 *
>  	 * drm_mode_status Enum
>  	 */
> -	enum drm_mode_status (*mode_valid)(struct drm_crtc *crtc,
> +	enum drm_mode_status (*mode_valid)(struct drm_simple_display_pipe *pi=
pe,
>  					   const struct drm_display_mode *mode);
> =20
>  	/**
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--8R2A49zPqFPARTuyrAPp7r5SSwQR0Nbpb--

--AVNEa8n9JSCbEwFXDYwtEItZhZYM7l5Aa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl2vOYUACgkQaA3BHVML
eiO/lwf/VnwIoBBo2wsfxqJFf6XQhQaCzBUtG3DgADT4EmNY/Y17df6nE9rqXawJ
FmuuWP4NdkMRX69XIVpf9TQ4Z4bOOP0YxqeiyFZyFy3LR2n47tbjg49g20oZtIff
I+BEBevR5vI8/jnVV22CUPy+rm643dkbw8osieW4lVdBzhozK8LZBGSyQPYP7QXM
4ep1Ds9tbYOm+HmVe3rCb/hkN0zKSB/HkSUZy4sL+2N8qVAcyz6ykW7OBQAl6fvv
4Yw9Kq9XWYutT1aVoa6mf/77fWwxqvA5UKGWmirCWmkVQzD82mcJu/it8Q/Bxq4P
WNylY/nnJCclE0wFqx/9AeeGwd93Mw==
=Ewa4
-----END PGP SIGNATURE-----

--AVNEa8n9JSCbEwFXDYwtEItZhZYM7l5Aa--

--===============4320747800337641035==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============4320747800337641035==--
