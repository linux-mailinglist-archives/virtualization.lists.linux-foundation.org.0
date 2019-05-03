Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0B912F2C
	for <lists.virtualization@lfdr.de>; Fri,  3 May 2019 15:30:21 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 08E3E38C9;
	Fri,  3 May 2019 13:30:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A7D0138C3
	for <virtualization@lists.linux-foundation.org>;
	Fri,  3 May 2019 13:29:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2BA9C87
	for <virtualization@lists.linux-foundation.org>;
	Fri,  3 May 2019 13:29:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 1CFF8AE84;
	Fri,  3 May 2019 13:29:33 +0000 (UTC)
Subject: Re: [PATCH v3 01/19] drm: Add |struct drm_gem_vram_object| and helpers
From: Thomas Zimmermann <tzimmermann@suse.de>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
	Daniel Vetter <daniel@ffwll.ch>
References: <20190429144341.12615-1-tzimmermann@suse.de>
	<20190429144341.12615-2-tzimmermann@suse.de>
	<20190429195855.GA6610@ravnborg.org>
	<1d14ef87-e1cd-4f4a-3632-bc045a1981c6@suse.de>
	<20190430092327.GA13757@ravnborg.org>
	<6e07e6c9-2ce7-c39f-8d55-46e811c61510@amd.com>
	<a2398439-3bb5-d1ef-db94-82f252f461c2@suse.de>
	<CAKMK7uGnUeeK-UPHZC+P5TsQTaOWPQd=LLV_Rr+VvPgNEEHhyg@mail.gmail.com>
	<c74362eb-c43a-a7be-5b52-106d207e8a8d@amd.com>
	<a96ad14d-698b-ca7b-cbdb-347801c70ce0@suse.de>
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
Message-ID: <1d76d06a-7684-6e64-711e-93995ee71257@suse.de>
Date: Fri, 3 May 2019 15:29:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.2
MIME-Version: 1.0
In-Reply-To: <a96ad14d-698b-ca7b-cbdb-347801c70ce0@suse.de>
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
	"airlied@linux.ie" <airlied@linux.ie>,
	"puck.chen@hisilicon.com" <puck.chen@hisilicon.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	"z.liuxinliang@hisilicon.com" <z.liuxinliang@hisilicon.com>,
	"hdegoede@redhat.com" <hdegoede@redhat.com>,
	"kong.kongxinwei@hisilicon.com" <kong.kongxinwei@hisilicon.com>,
	"Huang, Ray" <Ray.Huang@amd.com>,
	"zourongrong@gmail.com" <zourongrong@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
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
Content-Type: multipart/mixed; boundary="===============0483129181197761603=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0483129181197761603==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="5zEfUNNxMdTKyeDEcXN9rCyPuVeEcm6Pu"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5zEfUNNxMdTKyeDEcXN9rCyPuVeEcm6Pu
Content-Type: multipart/mixed; boundary="FDnYabggc0RiNpgvlJISQl5Gd4FxcN3Fa";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "puck.chen@hisilicon.com" <puck.chen@hisilicon.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "z.liuxinliang@hisilicon.com" <z.liuxinliang@hisilicon.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "kong.kongxinwei@hisilicon.com" <kong.kongxinwei@hisilicon.com>,
 "Huang, Ray" <Ray.Huang@amd.com>, "kraxel@redhat.com" <kraxel@redhat.com>,
 "zourongrong@gmail.com" <zourongrong@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>
Message-ID: <1d76d06a-7684-6e64-711e-93995ee71257@suse.de>
Subject: Re: [PATCH v3 01/19] drm: Add |struct drm_gem_vram_object| and
 helpers
References: <20190429144341.12615-1-tzimmermann@suse.de>
 <20190429144341.12615-2-tzimmermann@suse.de>
 <20190429195855.GA6610@ravnborg.org>
 <1d14ef87-e1cd-4f4a-3632-bc045a1981c6@suse.de>
 <20190430092327.GA13757@ravnborg.org>
 <6e07e6c9-2ce7-c39f-8d55-46e811c61510@amd.com>
 <a2398439-3bb5-d1ef-db94-82f252f461c2@suse.de>
 <CAKMK7uGnUeeK-UPHZC+P5TsQTaOWPQd=LLV_Rr+VvPgNEEHhyg@mail.gmail.com>
 <c74362eb-c43a-a7be-5b52-106d207e8a8d@amd.com>
 <a96ad14d-698b-ca7b-cbdb-347801c70ce0@suse.de>
In-Reply-To: <a96ad14d-698b-ca7b-cbdb-347801c70ce0@suse.de>

--FDnYabggc0RiNpgvlJISQl5Gd4FxcN3Fa
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 03.05.19 um 14:27 schrieb Thomas Zimmermann:
> cc: noralf@tronnes.org

Actually cc him

> Am 03.05.19 um 14:07 schrieb Koenig, Christian:
>> Am 03.05.19 um 14:01 schrieb Daniel Vetter:
>>> [CAUTION: External Email]
>>>
>>> On Fri, May 3, 2019 at 12:15 PM Thomas Zimmermann <tzimmermann@suse.d=
e> wrote:
>>>> Hi Christian,
>>>>
>>>> would you review the whole patch set? Daniel mentioned that he'd pre=
fer
>>>> to leave the review to memory-mgmt developers.
>>> I think Noralf Tronnes or Gerd Hoffmann would also make good reviewer=
s
>>> for this, fairly close to what they've been working on in the past.
>>
>> I will try to take another look next week. Busy as usual here.
>=20
> Thanks, I'll post v4 of the patches early next week.
>=20
>> Christian.
>>
>>> -Daniel
>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>> Am 30.04.19 um 11:35 schrieb Koenig, Christian:
>>>>> Am 30.04.19 um 11:23 schrieb Sam Ravnborg:
>>>>>> [CAUTION: External Email]
>>>>>>
>>>>>> Hi Thomas.
>>>>>>
>>>>>>>>> +
>>>>>>>>> +/**
>>>>>>>>> + * Returns the container of type &struct drm_gem_vram_object
>>>>>>>>> + * for field bo.
>>>>>>>>> + * @bo:           the VRAM buffer object
>>>>>>>>> + * Returns:       The containing GEM VRAM object
>>>>>>>>> + */
>>>>>>>>> +static inline struct drm_gem_vram_object* drm_gem_vram_of_bo(
>>>>>>>>> +  struct ttm_buffer_object *bo)
>>>>>>>>> +{
>>>>>>>>> +  return container_of(bo, struct drm_gem_vram_object, bo);
>>>>>>>>> +}
>>>>>>>> Indent funny. USe same indent as used in other parts of file for=

>>>>>>>> function arguments.
>>>>>>> If I put the argument next to the function's name, it will exceed=
 the
>>>>>>> 80-character limit. From the coding-style document, I could not s=
ee what
>>>>>>> to do in this case. One solution would move the return type to a
>>>>>>> separate line before the function name. I've not seen that anywhe=
re in
>>>>>>> the source code, so moving the argument onto a separate line and
>>>>>>> indenting by one tab appears to be the next best solution. Please=
 let me
>>>>>>> know if there's if there's a preferred style for cases like this =
one.
>>>>>> Readability has IMO higher priority than some limit of 80 chars.
>>>>>> And it hurts readability (at least my OCD) when style changes
>>>>>> as you do with indent here. So my personal preference is to fix
>>>>>> indent and accect longer lines.
>>>>> In this case the an often used convention (which is also kind of
>>>>> readable) is to add a newline after the return values, but before t=
he
>>>>> function name. E.g. something like this:
>>>>>
>>>>> static inline struct drm_gem_vram_object*
>>>>> drm_gem_vram_of_bo(struct ttm_buffer_object *bo)
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>> But you ask for a preferred style - which I do not think we have i=
n this
>>>>>> case. So it boils down to what you prefer.
>>>>>>
>>>>>> Enough bikeshedding, thanks for the quick response.
>>>>>>
>>>>>>           Sam
>>>> --
>>>> Thomas Zimmermann
>>>> Graphics Driver Developer
>>>> SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
>>>> GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
>>>> HRB 21284 (AG N=C3=BCrnberg)
>>>>
>>>> _______________________________________________
>>>> dri-devel mailing list
>>>> dri-devel@lists.freedesktop.org
>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>
>>>
>>> --
>>> Daniel Vetter
>>> Software Engineer, Intel Corporation
>>> +41 (0) 79 365 57 48 - http://blog.ffwll.ch
>>
>=20
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


--FDnYabggc0RiNpgvlJISQl5Gd4FxcN3Fa--

--5zEfUNNxMdTKyeDEcXN9rCyPuVeEcm6Pu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAlzMQjMACgkQaA3BHVML
eiMAQQgAnDBGdjQKsmaEjqASPw85qSaomr5BCs9THb7rsyAUyMmEJe28FXXS3y2d
uPqKI4ZZVezyvSdC3q2+9pHFF6vqYCsujOUl1SEoTXoTSKq6uD00DvbPvSWUzk/0
fNmomyyiFnm7wtOwoWQY40fO8c0uGFN1R71L2M1i3bQjk9Hu4QWFjwAt1/HRdLyE
Tifutac2H/H6kEqO1pQvBCQIZQfV2FsJHPNDk4JK12CRAkaEyGvXFt9D8Pi68+wK
n4iTumrWv8H9ZiKwoudMduMAa2cmRGhpO8IkgHhWMaOpHOCDO7g8jIf1NowKaDaI
ni1GT3XK4pNIVeKUTrUc69MNUoC6+A==
=7kNI
-----END PGP SIGNATURE-----

--5zEfUNNxMdTKyeDEcXN9rCyPuVeEcm6Pu--

--===============0483129181197761603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============0483129181197761603==--
