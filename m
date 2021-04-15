Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF47360359
	for <lists.virtualization@lfdr.de>; Thu, 15 Apr 2021 09:31:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8615B60D81;
	Thu, 15 Apr 2021 07:31:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AX3lozyq-R4z; Thu, 15 Apr 2021 07:31:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4724160D78;
	Thu, 15 Apr 2021 07:31:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DF128C0012;
	Thu, 15 Apr 2021 07:31:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EDB1AC000A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 07:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1B27846D9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 07:31:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7eQcOg1cY0jY
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 07:31:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83921846D0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 07:31:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F2240B035;
 Thu, 15 Apr 2021 07:31:02 +0000 (UTC)
Subject: Re: [PATCH v2 08/10] drm/simpledrm: Acquire clocks from DT device node
To: Maxime Ripard <maxime@cerno.tech>
References: <20210318102921.21536-1-tzimmermann@suse.de>
 <20210318102921.21536-9-tzimmermann@suse.de>
 <20210408081353.ojt2kgnnbh6kp6gp@gilmour>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <3c7bacd1-e40e-0953-9ad9-9f79274106d5@suse.de>
Date: Thu, 15 Apr 2021 09:31:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210408081353.ojt2kgnnbh6kp6gp@gilmour>
Cc: robh@kernel.org, bluescreen_avenger@verizon.net, geert+renesas@glider.be,
 corbet@lwn.net, airlied@linux.ie, emil.l.velikov@gmail.com,
 linux-doc@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 lgirdwood@gmail.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, hdegoede@redhat.com,
 broonie@kernel.org, daniel@ffwll.ch, sam@ravnborg.org
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
Content-Type: multipart/mixed; boundary="===============1943732129881737154=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1943732129881737154==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="SQg9uzgboJkx2SEFJBIFGBDmAUNGAV6ek"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--SQg9uzgboJkx2SEFJBIFGBDmAUNGAV6ek
Content-Type: multipart/mixed; boundary="0wv6kulGO214cTfq6f1JKjyueQv6191wM";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>
Cc: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 kraxel@redhat.com, corbet@lwn.net, lgirdwood@gmail.com, broonie@kernel.org,
 sam@ravnborg.org, robh@kernel.org, emil.l.velikov@gmail.com,
 geert+renesas@glider.be, hdegoede@redhat.com,
 bluescreen_avenger@verizon.net, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, virtualization@lists.linux-foundation.org
Message-ID: <3c7bacd1-e40e-0953-9ad9-9f79274106d5@suse.de>
Subject: Re: [PATCH v2 08/10] drm/simpledrm: Acquire clocks from DT device
 node
References: <20210318102921.21536-1-tzimmermann@suse.de>
 <20210318102921.21536-9-tzimmermann@suse.de>
 <20210408081353.ojt2kgnnbh6kp6gp@gilmour>
In-Reply-To: <20210408081353.ojt2kgnnbh6kp6gp@gilmour>

--0wv6kulGO214cTfq6f1JKjyueQv6191wM
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 08.04.21 um 10:13 schrieb Maxime Ripard:
> Hi,
>=20
> On Thu, Mar 18, 2021 at 11:29:19AM +0100, Thomas Zimmermann wrote:
>> Make sure required hardware clocks are enabled while the firmware
>> framebuffer is in use.
>>
>> The basic code has been taken from the simplefb driver and adapted
>> to DRM. Clocks are released automatically via devres helpers.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Tested-by: nerdopolis <bluescreen_avenger@verizon.net>
>=20
> Even though it's definitely simpler to review, merging the driver first=

> and then the clocks and regulators will break bisection on the platform=
s
> that rely on them

I'd like to keep the patches separate for now, but can squash patches 6=20
to 8 them into one before pushing them. OK?

>=20
> Another thing worth considering is also that both drivers will probe if=

> they are enabled (which is pretty likely), which is not great :)
>=20
> I guess we should make them mutually exclusive through Kconfig

We already have several drivers in fbdev and DRM that handle the same=20
hardware. We don't do this for any other pair, why bother now?

Best regards
Thomas

>=20
> Maxime
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
(HRB 36809, AG N=FCrnberg)
Gesch=E4ftsf=FChrer: Felix Imend=F6rffer


--0wv6kulGO214cTfq6f1JKjyueQv6191wM--

--SQg9uzgboJkx2SEFJBIFGBDmAUNGAV6ek
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmB367UFAwAAAAAACgkQlh/E3EQov+CH
pg//bMJ+KF31xJS80Yp3UYwR5ZDzqcFK8VJsXQlS0l9gPkL4h5UjqC4epAFMowC5SN9yT9/021BU
USacme1cMq/wavzNFVmRy9gJhdtNY2nkw7tonnb3zywIHogxzjkFteneL7HCDY4GRcTXuC2wQKd7
MwpgR0B7+kaipzMgeIQIGZDsX/105RK8miDgFNvwM+uDU6plq7P3UOIMVWbGp+iVO8k2ZpAS5xqf
Yvfde1DzjJlGuK25czPI0LDgR1bVARr3YuCns6d8Jb2xKJDT9GSd/Fcyssfb4J488L7lwaT9ykBd
GSjkFvmOI4xuWVYTnvIERj/9uQp4PVm6dtqay+Cy8kQNNiES8zkFW0XHokQS5oLEFxm+uI/Tnx4/
bWluy5pWuOga0IetyO4l4kjs/hqwljOd9vk/PmorSCxtVPwCjDfa7hBzQWkU/wVU/PwfTnWb0EsD
Cb1MoHb5+f78gCOIVrYmJzGHhf5w6AawNhandKeKeQQF13veqqTupOLCzNd9jYHQ9mbdr2CL6Leh
xbJG/jtjffKvW+Foq4ZMpWc5l1BfYFak12F17TKBlsYqMob3sFgw7MrMKXCPDI9uFUgLQL5K5XYH
onP/iT09KkNFVjNcDX/PrFipPOJ0EZTLukom3Swq0dyrQ16lLuRoFRBOuhKiRTrg3h+ekjsREbum
3v4=
=651j
-----END PGP SIGNATURE-----

--SQg9uzgboJkx2SEFJBIFGBDmAUNGAV6ek--

--===============1943732129881737154==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============1943732129881737154==--
