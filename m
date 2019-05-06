Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E834D14AAF
	for <lists.virtualization@lfdr.de>; Mon,  6 May 2019 15:16:30 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1F0CF4536;
	Mon,  6 May 2019 13:16:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 837F04525
	for <virtualization@lists.linux-foundation.org>;
	Mon,  6 May 2019 13:15:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D5CC9FD
	for <virtualization@lists.linux-foundation.org>;
	Mon,  6 May 2019 13:15:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 0318FAF01;
	Mon,  6 May 2019 13:15:37 +0000 (UTC)
Subject: Re: [PATCH v4 12/19] drm/bochs: Convert bochs driver to VRAM MM
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20190506082649.942-1-tzimmermann@suse.de>
	<20190506082649.942-13-tzimmermann@suse.de>
	<20190506124031.jwo5exbz6xk5fjan@sirius.home.kraxel.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Openpgp: preference=signencrypt
Autocrypt: addr=tzimmermann@suse.de; keydata=
	xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
	XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
	BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
	hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
	9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
	AAHNKFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwJQEEwEIAD4W
	IQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznTtgIbAwUJA8JnAAULCQgHAgYVCgkICwIEFgID
	AQIeAQIXgAAKCRBoDcEdUwt6I7D7CACBK42XW+7mCiK8ioXMEy1NzGbXC51RzGea8N83oEJS
	1KVUtQxrkDxgrW/WLSl/TfqHFsJpdEFOv1XubWbleun3uKPy0e5vZCd5UjZPkeNjnqfCYTDy
	hVVsdOuFbtWDppJyJrThLqr9AgSFmoCNNUt1SVpYEEOLNE6C32BhlnSq21VLC+YXTgO/ZHTa
	YXkq54hHj63jwrcjkBSCkXLh37kHeqnl++GHpN+3R+o3w2OpwHAlvVjdKPT27v1tVkiydsFG
	65Vd0n3m/ft+IOrGgxQM1C20uqKvsZGB4r3OGR50ekAybO7sjEJJ1Obl4ge/6RRqcvKz4LMb
	tGs85D6tPIeFzsBNBFs50uABCADGJj+DP1fk+UWOWrf4O61HTbC4Vr9QD2K4fUUHnzg2B6zU
	R1BPXqLGG0+lzK8kfYU/F5RjmEcClsIkAaFkg4kzKP14tvY1J5+AV3yNqcdg018HNtiyrSwI
	E0Yz/qm1Ot2NMZ0DdvVBg22IMsiudQ1tx9CH9mtyTbIXgACvl3PW2o9CxiHPE/bohFhwZwh/
	kXYYAE51lhinQ3oFEeQZA3w4OTvxSEspiQR8dg8qJJb+YOAc5IKk6sJmmM7JfFMWSr22satM
	23oQ3WvJb4RV6HTRTAIEyyZS7g2DhiytgMG60t0qdABG5KXSQW+OKlZRpuWwKWaLh3if/p/u
	69dvpanbABEBAAHCwHwEGAEIACYWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznS4AIbDAUJ
	A8JnAAAKCRBoDcEdUwt6I6X3CACJ8D+TpXBCqJE5xwog08+Dp8uBpx0T9n1wE0GQisZruACW
	NofYn8PTX9k4wmegDLwt7YQDdKxQ4+eTfZeLNQqWg6OCftH5Kx7sjWnJ09tOgniVdROzWJ7c
	VJ/i0okazncsJ+nq48UYvRGE1Swh3A4QRIyphWX4OADOBmTFl9ZYNPnh23eaC9WrNvFr7yP7
	iGjMlfEW8l6Lda//EC5VpXVNza0xeae0zFNst2R9pn+bLkihwDLWxOIyifGRxTqNxoS4I1aw
	VhxPSVztPMSpIA/sOr/N/p6JrBLn+gui2K6mP7bGb8hF+szfArYqz3T1rv1VzUWAJf5Wre5U
	iNx9uqqx
Message-ID: <78ce7242-81c0-e617-c181-5686aba3847b@suse.de>
Date: Mon, 6 May 2019 15:15:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.2
MIME-Version: 1.0
In-Reply-To: <20190506124031.jwo5exbz6xk5fjan@sirius.home.kraxel.org>
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: noralf@tronnes.org, airlied@linux.ie, puck.chen@hisilicon.com,
	dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
	z.liuxinliang@hisilicon.com, hdegoede@redhat.com,
	kong.kongxinwei@hisilicon.com, ray.huang@amd.com,
	daniel@ffwll.ch, zourongrong@gmail.com, sam@ravnborg.org,
	christian.koenig@amd.com
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
Content-Type: multipart/mixed; boundary="===============8252753547487546877=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8252753547487546877==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="vXKLReJpdRKvT2Z7i8m4x6LWYEM8s1Ai6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vXKLReJpdRKvT2Z7i8m4x6LWYEM8s1Ai6
Content-Type: multipart/mixed; boundary="AB6gkshIrH37BwtImZ1wI4IS4ODICVRhY";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: daniel@ffwll.ch, airlied@linux.ie, christian.koenig@amd.com,
 ray.huang@amd.com, hdegoede@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Message-ID: <78ce7242-81c0-e617-c181-5686aba3847b@suse.de>
Subject: Re: [PATCH v4 12/19] drm/bochs: Convert bochs driver to VRAM MM
References: <20190506082649.942-1-tzimmermann@suse.de>
 <20190506082649.942-13-tzimmermann@suse.de>
 <20190506124031.jwo5exbz6xk5fjan@sirius.home.kraxel.org>
In-Reply-To: <20190506124031.jwo5exbz6xk5fjan@sirius.home.kraxel.org>

--AB6gkshIrH37BwtImZ1wI4IS4ODICVRhY
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 06.05.19 um 14:40 schrieb Gerd Hoffmann:
>   Hi,
>=20
>>  static const struct file_operations bochs_fops =3D {
>>  	.owner		=3D THIS_MODULE,
>> -	.open		=3D drm_open,
>> -	.release	=3D drm_release,
>> -	.unlocked_ioctl	=3D drm_ioctl,
>> -	.compat_ioctl	=3D drm_compat_ioctl,
>> -	.poll		=3D drm_poll,
>> -	.read		=3D drm_read,
>>  	.llseek		=3D no_llseek,
>> -	.mmap           =3D bochs_mmap,
>> +	DRM_VRAM_MM_FILE_OPERATIONS
>>  };
>=20
> What about llseek?  I think it should either be deleted (if not needed)=

> or added to DRM_VRAM_MM_FILE_OPERATIONS (if needed).

Some drivers set no_llseek, some leave the .llseek field to NULL. So I
don't set the field from DRM_VRAM_MM_FILE_OPERATIONS.

But now that you asked, I found that DRM actually requires no_llseek.
I'll add it to the default operations in the next iteration of the patch
set.

Best regards
Thomas

> cheers,
>   Gerd
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--AB6gkshIrH37BwtImZ1wI4IS4ODICVRhY--

--vXKLReJpdRKvT2Z7i8m4x6LWYEM8s1Ai6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAlzQM3YACgkQaA3BHVML
eiNZsQgAh0PLjirbrnGoNT5rW/dvvnSfuenANfNjY/z/rUKQCDyLqudpFShQN7PC
rWBMVSG+nfwAu0XZpoI2JDmt3gRleeZ9krUs0Q6Ea5/cdBNohyv6QM9HP+8LQ7/h
NxJVcoAHTvSLpVvLBAw6QHzBLJm/px7zgyNNsnss6eagTZlk5tzh4hvpYaTAiO3W
f73Z3jPnXYJAH8ySjhef1IhAcKlh+lHTaontag+tq2RWTt5RaahLqoJgmHy2chGV
n7F7IWyMQHF+3U4Lu8eOD0yhSSFD+IXNUMME9xOfi3Q9WAlxkXXbJGqBkFpLqegC
RJjXv1PAzDQs0e8FoqAartEnq7Swlw==
=17sq
-----END PGP SIGNATURE-----

--vXKLReJpdRKvT2Z7i8m4x6LWYEM8s1Ai6--

--===============8252753547487546877==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============8252753547487546877==--
