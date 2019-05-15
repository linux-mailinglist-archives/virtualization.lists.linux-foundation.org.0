Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E99E81F69E
	for <lists.virtualization@lfdr.de>; Wed, 15 May 2019 16:33:46 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2CA6CBA4;
	Wed, 15 May 2019 14:33:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id F26855A8
	for <virtualization@lists.linux-foundation.org>;
	Wed, 15 May 2019 14:33:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4DAC88D
	for <virtualization@lists.linux-foundation.org>;
	Wed, 15 May 2019 14:33:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 71789AFCD;
	Wed, 15 May 2019 14:33:38 +0000 (UTC)
Subject: Re: [PATCH v5 00/20] Share TTM code among DRM framebuffer drivers
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20190508082630.15116-1-tzimmermann@suse.de>
	<05884df3-207a-6c2f-226e-d01266f17b77@suse.de>
	<20190515142235.qfwnvsrhnogj67hz@sirius.home.kraxel.org>
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
Message-ID: <ff2c6cf6-d8c3-74fc-bfb8-9194e1b447fd@suse.de>
Date: Wed, 15 May 2019 16:33:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190515142235.qfwnvsrhnogj67hz@sirius.home.kraxel.org>
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: airlied@linux.ie, puck.chen@hisilicon.com, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org,
	z.liuxinliang@hisilicon.com, hdegoede@redhat.com,
	kong.kongxinwei@hisilicon.com, ray.huang@amd.com,
	zourongrong@gmail.com, sam@ravnborg.org, christian.koenig@amd.com
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
Content-Type: multipart/mixed; boundary="===============2010611782141212123=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2010611782141212123==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="5MooHqqMgfDJdS5xCvjd1qmQABAaLslo5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5MooHqqMgfDJdS5xCvjd1qmQABAaLslo5
Content-Type: multipart/mixed; boundary="3sen9ayRg5RP5Cj5P7nHsNzZ0X7qx18y4";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: airlied@linux.ie, puck.chen@hisilicon.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 z.liuxinliang@hisilicon.com, hdegoede@redhat.com,
 kong.kongxinwei@hisilicon.com, ray.huang@amd.com, zourongrong@gmail.com,
 sam@ravnborg.org, christian.koenig@amd.com
Message-ID: <ff2c6cf6-d8c3-74fc-bfb8-9194e1b447fd@suse.de>
Subject: Re: [PATCH v5 00/20] Share TTM code among DRM framebuffer drivers
References: <20190508082630.15116-1-tzimmermann@suse.de>
 <05884df3-207a-6c2f-226e-d01266f17b77@suse.de>
 <20190515142235.qfwnvsrhnogj67hz@sirius.home.kraxel.org>
In-Reply-To: <20190515142235.qfwnvsrhnogj67hz@sirius.home.kraxel.org>

--3sen9ayRg5RP5Cj5P7nHsNzZ0X7qx18y4
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 15.05.19 um 16:22 schrieb Gerd Hoffmann:
> On Wed, May 15, 2019 at 09:05:54AM +0200, Thomas Zimmermann wrote:
>> Hi,
>>
>> most of this patch set still needs reviews.
>>
>> If it's too large for merging or reviewing at once, I could move the
>> driver changes into separate patch sets. The vbox driver's changes hav=
e
>> been accepted by Hans already. So only keeping the core changes plus
>> vbox would be an option.
>=20
> Looks all good to me.  bochs survived my testing, vbox is reviewed and
> IIRC you've tested two of the other three drivers.  So all but one
> driver is covered.
>=20
> I'll go push this to drm-misc-next in a moment.

Thank you so much!

Best regards
Thomas

>=20
>>> Future directions: with these changes, the respective drivers can als=
o
>>> share some of their mode-setting or fbdev code. GEM VRAM's PRIME help=
ers
>>> allow for using the generic fbcon emulation.
>=20
> Using generic fbcon should be easy now.
>=20
> cheers,
>   Gerd
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--3sen9ayRg5RP5Cj5P7nHsNzZ0X7qx18y4--

--5MooHqqMgfDJdS5xCvjd1qmQABAaLslo5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAlzcIz0ACgkQaA3BHVML
eiMaewgAukXMNv/FOsACWjHl4S7Y0MTebic21ZC6m8kY4/DL1XaszAV1oGNu3+sH
GmpbXCqd2LhBlNg4rTy/01JR9WFS2xhCuwc1GbAVsWlCwIXaLzlpwizaGbgw95dO
3Z3Rwg+g5tIwjbFl04bMAoEI0DHArucVYhwjc9mig4ZOhFuI5nHTbRDjaTdrKUcC
NtP4VY41fXkiUwXvP7bDRPOjA0iBstgKW1+LGnuyydXOYKdxo3AR3W7vFOTy1sjN
4bJQMz8hH7a3bxaZ/rlToqwWOmw/SeugXCzbI7o1HKRI0bFNqx3ljq4MJfRhIaVE
hKts0Zp6VTzsPqH2udXvaU1t8twtoQ==
=863U
-----END PGP SIGNATURE-----

--5MooHqqMgfDJdS5xCvjd1qmQABAaLslo5--

--===============2010611782141212123==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============2010611782141212123==--
