Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E541D2906
	for <lists.virtualization@lfdr.de>; Thu, 14 May 2020 09:46:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9B7ED2262E;
	Thu, 14 May 2020 07:46:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lhhwWLz4PBkV; Thu, 14 May 2020 07:46:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 986B526E49;
	Thu, 14 May 2020 07:46:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 79B0CC016F;
	Thu, 14 May 2020 07:46:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0C347C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 07:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EA2162262E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 07:46:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ggDmnRqPnh+M
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 07:46:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id 885122045A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 07:46:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A489CAB91;
 Thu, 14 May 2020 07:46:26 +0000 (UTC)
Subject: Re: [PATCH 4/9] drm/virtio: Call the right shmem helpers
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
 <20200511093554.211493-5-daniel.vetter@ffwll.ch>
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
Message-ID: <68e36b4b-139c-22c4-3028-26c2b50628f7@suse.de>
Date: Thu, 14 May 2020 09:46:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200511093554.211493-5-daniel.vetter@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org
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
Content-Type: multipart/mixed; boundary="===============3000725763240421218=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============3000725763240421218==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="6x5A6hSUnuyBxeEIUE8YoQm0XtN6t7kCJ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6x5A6hSUnuyBxeEIUE8YoQm0XtN6t7kCJ
Content-Type: multipart/mixed; boundary="qhdb2900SAJMcBGUSt4068I5n8riGKQ7j";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann
 <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <68e36b4b-139c-22c4-3028-26c2b50628f7@suse.de>
Subject: Re: [PATCH 4/9] drm/virtio: Call the right shmem helpers
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
 <20200511093554.211493-5-daniel.vetter@ffwll.ch>
In-Reply-To: <20200511093554.211493-5-daniel.vetter@ffwll.ch>

--qhdb2900SAJMcBGUSt4068I5n8riGKQ7j
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 11.05.20 um 11:35 schrieb Daniel Vetter:
> drm_gem_shmem_get_sg_table is meant to implement
> obj->funcs->get_sg_table, for prime exporting. The one we want is
> drm_gem_shmem_get_pages_sgt, which also handles imported dma-buf, not
> just native objects.
>=20
> v2: Rebase, this stuff moved around in
>=20
> commit 2f2aa13724d56829d910b2fa8e80c502d388f106
> Author: Gerd Hoffmann <kraxel@redhat.com>
> Date:   Fri Feb 7 08:46:38 2020 +0100
>=20
>     drm/virtio: move virtio_gpu_mem_entry initialization to new functio=
n
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> Cc: David Airlie <airlied@linux.ie>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: virtualization@lists.linux-foundation.org
> ---
>  drivers/gpu/drm/virtio/virtgpu_object.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/=
virtio/virtgpu_object.c
> index 6ccbd01cd888..346cef5ce251 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -150,7 +150,7 @@ static int virtio_gpu_object_shmem_init(struct virt=
io_gpu_device *vgdev,
>  	if (ret < 0)
>  		return -EINVAL;
> =20
> -	shmem->pages =3D drm_gem_shmem_get_sg_table(&bo->base.base);
> +	shmem->pages =3D drm_gem_shmem_get_pages_sgt(&bo->base.base);
>  	if (!shmem->pages) {
>  		drm_gem_shmem_unpin(&bo->base.base);
>  		return -EINVAL;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--qhdb2900SAJMcBGUSt4068I5n8riGKQ7j--

--6x5A6hSUnuyBxeEIUE8YoQm0XtN6t7kCJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl68904ACgkQaA3BHVML
eiPtXAf+KYC6fzY0k/WOjwie9brnUcYcOQ6oc2++J3WIgkgVwB1d05ZQAWXdGwg/
ysGvcW9AnKTmdrOKwWujlHuLbFnpev7ET52b5yR1fU9rSUaf9VnZz3CD5NZGTxYU
iNmIkXEZEWymeqrIXtyaNMz8Tv6yYinUVsiRfSlwHnLNHnNJXRNUGa21Sf6qEuPD
wrYkwh4Cw2bjN+ceb/pR5MwjfHhJ5krTunin9xE9SH3QKFhlUZsrbPJHZ+wIBCmh
f4RqFtTm8PY+4qV1HE424xZTel2b9KpJZFHn+h1yw96dGSDBtKXOFAO0JHkL26Uk
mSt7aov2kFJci703eiDYNHU/jiZ+LQ==
=74XA
-----END PGP SIGNATURE-----

--6x5A6hSUnuyBxeEIUE8YoQm0XtN6t7kCJ--

--===============3000725763240421218==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============3000725763240421218==--
