Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C12361463A4
	for <lists.virtualization@lfdr.de>; Thu, 23 Jan 2020 09:40:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7CF6286E3F;
	Thu, 23 Jan 2020 08:40:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id miVvnFjbbcUF; Thu, 23 Jan 2020 08:40:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EA2F48704C;
	Thu, 23 Jan 2020 08:40:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C8A57C0174;
	Thu, 23 Jan 2020 08:40:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7EEA9C0174
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jan 2020 08:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6C9422154A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jan 2020 08:40:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id emqD7aLjwrS8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jan 2020 08:40:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id CF9FB2036D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jan 2020 08:40:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E264FAE06;
 Thu, 23 Jan 2020 08:40:11 +0000 (UTC)
Subject: Re: [PATCH v3 0/4] Use no_vblank property for drivers without VBLANK
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20200120122051.25178-1-tzimmermann@suse.de>
 <20200121093604.ruclkfho5gmflasq@sirius.home.kraxel.org>
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
Message-ID: <1659c9ee-37ee-988a-6aaa-e115d1529fd6@suse.de>
Date: Thu, 23 Jan 2020 09:40:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200121093604.ruclkfho5gmflasq@sirius.home.kraxel.org>
Cc: david@lechnology.com, oleksandr_andrushchenko@epam.com, airlied@linux.ie,
 sean@poorly.run, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, hdegoede@redhat.com,
 laurent.pinchart@ideasonboard.com, xen-devel@lists.xenproject.org,
 sam@ravnborg.org, emil.velikov@collabora.com
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
Content-Type: multipart/mixed; boundary="===============1998976094736861100=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1998976094736861100==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="pCIvLSsYBYOw52ijDqWub0Xa7Pbcuk34Z"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--pCIvLSsYBYOw52ijDqWub0Xa7Pbcuk34Z
Content-Type: multipart/mixed; boundary="6GUilDKLRS1Nl4WmXujzoC8tlZiZqY5my";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: david@lechnology.com, oleksandr_andrushchenko@epam.com, airlied@linux.ie,
 sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, hdegoede@redhat.com,
 laurent.pinchart@ideasonboard.com, xen-devel@lists.xenproject.org,
 sean@poorly.run, emil.velikov@collabora.com
Message-ID: <1659c9ee-37ee-988a-6aaa-e115d1529fd6@suse.de>
Subject: Re: [PATCH v3 0/4] Use no_vblank property for drivers without VBLANK
References: <20200120122051.25178-1-tzimmermann@suse.de>
 <20200121093604.ruclkfho5gmflasq@sirius.home.kraxel.org>
In-Reply-To: <20200121093604.ruclkfho5gmflasq@sirius.home.kraxel.org>

--6GUilDKLRS1Nl4WmXujzoC8tlZiZqY5my
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 21.01.20 um 10:36 schrieb Gerd Hoffmann:
> On Mon, Jan 20, 2020 at 01:20:47PM +0100, Thomas Zimmermann wrote:
>> Instead of faking VBLANK events by themselves, drivers without VBLANK
>> support can enable drm_crtc_vblank.no_vblank and let DRM do the rest.
>> The patchset makes this official and converts over drivers.
>>
>> The current implementation looks at the number of initialized CRTCs
>> wrt vblanking. If vblanking has been initialized for a CRTC, the drive=
r
>> is responsible for sending out VBLANK events. Otherwise, DRM will send=

>> out the event. The behaviour selected by initializing no_vblank as par=
t
>> of drm_atomic_helper_check_modeset().
>>
>> I went through all drivers, looking for those that call send out VBLAN=
K
>> events but do not call drm_vblank_init(). These are converted to the n=
ew
>> semantics. This affects tiny drivers; drivers for virtual hardware; an=
d
>> a few others, which do not support interrupts. Xen comes with its
>> own VBLANK logic and disables no_vblank explictly.
>=20
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>

Thanks a lot. v4 will mostly reorganize the patches so I'll keep your A-b=
=2E

Best regards
Thomas

>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--6GUilDKLRS1Nl4WmXujzoC8tlZiZqY5my--

--pCIvLSsYBYOw52ijDqWub0Xa7Pbcuk34Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl4pW+oACgkQaA3BHVML
eiNV0gf+IPPOumQscdtQTf7HiwBEYXRigNipidae4Be+fOxcgoEbdgq/mZcSPvx1
Qiutl89HQ0S/9aeZLmXTvJQETVw49f4d14OwPKVk9r6bPipVDuKb1u8893tO+Cfv
uDhBhXeIOVsQj6UQMsKHRXEP89f86srW8QdhPVhpKD0e/wTNDmQNJSr36UGrVHfu
37Qnl1ti99WI25Hv1s3OdZNodLgWmWoEShvzLmXeQimVffHPt3KpNnazmVXJjJXK
ODtGNmgXgg/XP9dV6UURzQSP5fhnHWbiE0KRoE6gSWwfMvQN88LNGRWoNX5sNrVq
388slhf1P3s3iCCsYvnxqKplejINQQ==
=QYNB
-----END PGP SIGNATURE-----

--pCIvLSsYBYOw52ijDqWub0Xa7Pbcuk34Z--

--===============1998976094736861100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============1998976094736861100==--
