Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 136A414A95
	for <lists.virtualization@lfdr.de>; Mon,  6 May 2019 15:10:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3D8EC4524;
	Mon,  6 May 2019 13:10:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 14E42450F
	for <virtualization@lists.linux-foundation.org>;
	Mon,  6 May 2019 13:09:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 743C07DB
	for <virtualization@lists.linux-foundation.org>;
	Mon,  6 May 2019 13:09:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id B34A4AEF9;
	Mon,  6 May 2019 13:09:21 +0000 (UTC)
Subject: Re: [PATCH v4 00/19] Share TTM code among DRM framebuffer drivers
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20190506082649.942-1-tzimmermann@suse.de>
	<20190506122233.76pya5kpdfgp4f25@sirius.home.kraxel.org>
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
Message-ID: <fcb3efd9-64f2-ca35-e36e-83b7055f8055@suse.de>
Date: Mon, 6 May 2019 15:09:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.2
MIME-Version: 1.0
In-Reply-To: <20190506122233.76pya5kpdfgp4f25@sirius.home.kraxel.org>
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
Content-Type: multipart/mixed; boundary="===============1646271414280843359=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1646271414280843359==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="R0V7UPedplzMBC5x807KDQl1LFbTsyJ0R"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--R0V7UPedplzMBC5x807KDQl1LFbTsyJ0R
Content-Type: multipart/mixed; boundary="bzAKT4Op81rZaT9HYHvgihWOqNQhhDyog";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: daniel@ffwll.ch, airlied@linux.ie, christian.koenig@amd.com,
 ray.huang@amd.com, hdegoede@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Message-ID: <fcb3efd9-64f2-ca35-e36e-83b7055f8055@suse.de>
Subject: Re: [PATCH v4 00/19] Share TTM code among DRM framebuffer drivers
References: <20190506082649.942-1-tzimmermann@suse.de>
 <20190506122233.76pya5kpdfgp4f25@sirius.home.kraxel.org>
In-Reply-To: <20190506122233.76pya5kpdfgp4f25@sirius.home.kraxel.org>

--bzAKT4Op81rZaT9HYHvgihWOqNQhhDyog
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 06.05.19 um 14:22 schrieb Gerd Hoffmann:
>> GEM VRAM could implement PRIME helpers, which would allow for using
>> the generic fbcon.
>=20
> bochs_gem_prime_*() functions with this series applied look like you ca=
n
> just rename them & move over to vram helpers.
>=20
> It's not a full prime implementation, specifically actual export/import=

> isn't there.  But pin+vmap (needed by generic fbcon) is implemented.

I did have a patch to do this, but then I read that prime requires DMA
for buffer sharing and bochs works only because it's emulated. If bochs'
implementation is complete enough to be useful for other drivers, I'll
add it to the patch set.

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


--bzAKT4Op81rZaT9HYHvgihWOqNQhhDyog--

--R0V7UPedplzMBC5x807KDQl1LFbTsyJ0R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAlzQMgAACgkQaA3BHVML
eiP/ZQf9GtIUWbuoOBBjRwFV0Pxtj2papD2kR7EJgmRANl/jUOXPD2OUIdnV6K7C
P8YH+cVr6lw1+EM7QUMhiGFxBKxihZJ88dSt2cgOzXwAFJ0TGucip7/rCird+gZ9
RvhsuagnnSGBw5kfHNDNttri1dnOK4QebTQpsde11Bo1rgOeyNJToRRzamEhhWAy
pwMmSU2u98ZISYdsYRCd+RbwoN2e/jR0n2TqKLD0fCuZTO1JwaZosqKtJceiYo6r
9RppDELgeeMv1YbJrdkfEm7iQ2zqhZNRaQQLsiVgujiouHJpOzs0Z85KgmTcPHtV
C9xA8k11J5gpwQIQ9oSd/brvkqKZ1g==
=49yC
-----END PGP SIGNATURE-----

--R0V7UPedplzMBC5x807KDQl1LFbTsyJ0R--

--===============1646271414280843359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============1646271414280843359==--
