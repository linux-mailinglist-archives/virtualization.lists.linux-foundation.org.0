Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 714755F400
	for <lists.virtualization@lfdr.de>; Thu,  4 Jul 2019 09:43:18 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 37790DB2;
	Thu,  4 Jul 2019 07:43:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8CBA1AD0
	for <virtualization@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 07:43:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B005C87D
	for <virtualization@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 07:43:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id EE39BADDC;
	Thu,  4 Jul 2019 07:43:08 +0000 (UTC)
Subject: Re: [PATCH 0/5] Unmappable DRM client buffers for fbdev emulation
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, airlied@redhat.com, 
	daniel@ffwll.ch, kraxel@redhat.com, maarten.lankhorst@linux.intel.com,
	maxime.ripard@bootlin.com, sean@poorly.run, sam@ravnborg.org,
	yc_chen@aspeedtech.com
References: <20190703083302.2609-1-tzimmermann@suse.de>
	<a2e3baa8-f8e8-4628-e18f-cb3119194afb@tronnes.org>
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
Message-ID: <aa1b7431-21c5-4c99-bfb6-6c5e4946bec3@suse.de>
Date: Thu, 4 Jul 2019 09:43:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <a2e3baa8-f8e8-4628-e18f-cb3119194afb@tronnes.org>
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
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
Content-Type: multipart/mixed; boundary="===============6960975757685124165=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============6960975757685124165==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="hxi2okYtZStdIFvdjCHLQgyWclcyNW79y"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--hxi2okYtZStdIFvdjCHLQgyWclcyNW79y
Content-Type: multipart/mixed; boundary="hfdGTlsffKKizT7nPpSMYbx5Ik0yiU9kz";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, airlied@redhat.com,
 daniel@ffwll.ch, kraxel@redhat.com, maarten.lankhorst@linux.intel.com,
 maxime.ripard@bootlin.com, sean@poorly.run, sam@ravnborg.org,
 yc_chen@aspeedtech.com
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Message-ID: <aa1b7431-21c5-4c99-bfb6-6c5e4946bec3@suse.de>
Subject: Re: [PATCH 0/5] Unmappable DRM client buffers for fbdev emulation
References: <20190703083302.2609-1-tzimmermann@suse.de>
 <a2e3baa8-f8e8-4628-e18f-cb3119194afb@tronnes.org>
In-Reply-To: <a2e3baa8-f8e8-4628-e18f-cb3119194afb@tronnes.org>

--hfdGTlsffKKizT7nPpSMYbx5Ik0yiU9kz
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 03.07.19 um 21:27 schrieb Noralf Tr=C3=B8nnes:
>=20
>=20
> Den 03.07.2019 10.32, skrev Thomas Zimmermann:
>> DRM client buffers are permanently mapped throughout their lifetime. T=
his
>> prevents us from using generic framebuffer emulation for devices with
>> small dedicated video memory, such as ast or mgag200. With fb buffers
>> permanently mapped, such devices often won't have enougth space left t=
o
>> display other content (e.g., X11).
>>
>> This patch set introduces unmappable DRM client buffers for framebuffe=
r
>> emulation with shadow buffers. While the shadow buffer remains in syst=
em
>> memory permanently, the respective buffer object will only be mapped b=
riefly
>> during updates from the shadow buffer. Hence, the driver can relocate =
he
>> buffer object among memory regions as needed.
>>
>> The default behoviour for DRM client buffers is still to be permanentl=
y
>> mapped.
>>
>> The patch set converts ast and mgag200 to generic framebuffer emulatio=
n
>> and removes a large amount of framebuffer code from these drivers. For=

>> bochs, a problem was reported where the driver could not display the c=
onsole
>> because it was pinned in system memory. [1] The patch set fixes this b=
ug
>> by converting bochs to use the shadow fb.
>>
>> The patch set has been tested on ast and mga200 HW.
>>
>=20
> I've been thinking, this enables dirty tracking in DRM userspace for
> these drivers since the dirty callback is now set on all framebuffers.
> Is this OK? Should we add a drm_fbdev_generic_shadow_setup() that sets =
a
> flag enabling the shadow buffer instead?

Fbdev emulation is special wrt framebuffer setup and there's no way to
distinguish a regular FB from the fbdev's FB. I've been trying
drm_fbdev_generic_shadow_setup(), but ended up duplicating
functionality. The problem was that we cannot get state-flag arguments
into drm_fb_helper_generic_probe().

There already is struct mode_config.prefer_shadow. It signals shadow FB
rendering to userspace. The easiest solution is to add
prefer_shadow_fbdev as well. If either flag is true, fbdev emulation
would enable shadow buffering.

I'm not sure if we should check for the dirty() callback at all.

Best regards
Thomas

> Really nice diffstat by the way :-)
>=20
> Noralf.
>=20
>> [1] https://lists.freedesktop.org/archives/dri-devel/2019-June/224423.=
html
>>
>> Thomas Zimmermann (5):
>>   drm/client: Support unmapping of DRM client buffers
>>   drm/fb-helper: Unmap BO for shadow-buffered framebuffer console
>>   drm/ast: Replace struct ast_fbdev with generic framebuffer emulation=

>>   drm/bochs: Use shadow buffer for bochs framebuffer console
>>   drm/mgag200: Replace struct mga_fbdev with generic framebuffer
>>     emulation
>>
>>  drivers/gpu/drm/ast/Makefile           |   2 +-
>>  drivers/gpu/drm/ast/ast_drv.c          |  22 +-
>>  drivers/gpu/drm/ast/ast_drv.h          |  17 --
>>  drivers/gpu/drm/ast/ast_fb.c           | 341 ------------------------=
-
>>  drivers/gpu/drm/ast/ast_main.c         |  30 ++-
>>  drivers/gpu/drm/ast/ast_mode.c         |  21 --
>>  drivers/gpu/drm/bochs/bochs_kms.c      |   2 +-
>>  drivers/gpu/drm/drm_client.c           |  71 ++++-
>>  drivers/gpu/drm/drm_fb_helper.c        |  14 +-
>>  drivers/gpu/drm/mgag200/Makefile       |   2 +-
>>  drivers/gpu/drm/mgag200/mgag200_drv.h  |  19 --
>>  drivers/gpu/drm/mgag200/mgag200_fb.c   | 309 ----------------------
>>  drivers/gpu/drm/mgag200/mgag200_main.c |  61 +++--
>>  drivers/gpu/drm/mgag200/mgag200_mode.c |  27 --
>>  include/drm/drm_client.h               |   3 +
>>  15 files changed, 154 insertions(+), 787 deletions(-)
>>  delete mode 100644 drivers/gpu/drm/ast/ast_fb.c
>>  delete mode 100644 drivers/gpu/drm/mgag200/mgag200_fb.c
>>
>> --
>> 2.21.0
>>
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


--hfdGTlsffKKizT7nPpSMYbx5Ik0yiU9kz--

--hxi2okYtZStdIFvdjCHLQgyWclcyNW79y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl0drggACgkQaA3BHVML
eiP3wQf/awo09QJefBTfUFH8v1yPLXevN1p91ORAudax8lsLso/3Qpkva5M8GlYM
tQT2fKjH+2OeZEklujvg3sYVkZKxuGr6YFr/5+r5xjdjGxMMCOrSpCZXslr9hoxW
tAJ9dNblfcHicIyFY5kCPn2H4aTpw8ceRJjJGke9euW6r5mKRnxHwl/gb959bWzz
U7k2rcItYJBwYxdth9c5dSLKz/th9gPyp7pfeEG6EwY5Ljak6rdbY9yRC/Q16zEy
/FJcZ0QM4JDMxUpOgMG/k99hHmwzNOuVCC1WkzyViD/BtlvGTSr9qkuADfIjsFrA
XWOWZykV3F+A2frIgxqpTGquXQIwSw==
=51m9
-----END PGP SIGNATURE-----

--hxi2okYtZStdIFvdjCHLQgyWclcyNW79y--

--===============6960975757685124165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============6960975757685124165==--
