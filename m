Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CAC46D0EB
	for <lists.virtualization@lfdr.de>; Wed,  8 Dec 2021 11:22:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA91D84B7C;
	Wed,  8 Dec 2021 10:22:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rFWEOKLTM_G7; Wed,  8 Dec 2021 10:22:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 95C8C84B9B;
	Wed,  8 Dec 2021 10:22:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9953C006E;
	Wed,  8 Dec 2021 10:22:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C6785C0012
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Dec 2021 10:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7AE6840A17
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Dec 2021 10:22:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=suse.de header.b="xGQPoTcA";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=suse.de header.b="pAwMzITZ"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lFj2I9VQrESU
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Dec 2021 10:22:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4BBD640A15
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Dec 2021 10:22:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 32C6D1FDFC;
 Wed,  8 Dec 2021 10:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638958921; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BnGRbEFLKacsuqSPjlZyTWntl7E2bOak+wxzMPcGJuI=;
 b=xGQPoTcAtrwipOUaSPzwwdcdnWm5mvgX6nDWoofTKQI6GzVpCLM6NOmAv6VEeoqbBHjmkm
 l4YiJbD3shhXCzw3IjWBih6e0LCcd+r3P4cMQhn+bOB9HEgdJZAy8DYD2cTfY2C8xWH676
 EzusRAcLJcFSUntUf5CVgvhMnJtQ6PY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638958921;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BnGRbEFLKacsuqSPjlZyTWntl7E2bOak+wxzMPcGJuI=;
 b=pAwMzITZnpUREXDZTFcPjkuQwgLi/NRq0eHeeu+vfOZXxL+oZWLqSeDimZvybrvHrF9DGK
 2yd06UHw0Jp941BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DE20713BE9;
 Wed,  8 Dec 2021 10:22:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2oA7NUiHsGGqKQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 08 Dec 2021 10:22:00 +0000
Message-ID: <fbe2d58e-2770-a5de-973f-5a37fd7d90df@suse.de>
Date: Wed, 8 Dec 2021 11:22:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] drm: Return error codes from struct
 drm_driver.gem_create_object
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20211130095255.26710-1-tzimmermann@suse.de>
 <20211206104233.GD1978@kadam> <4fa29fcb-f936-b590-7691-90f0579a54ae@suse.de>
 <20211206144007.GE1978@kadam> <53405618-2e3d-c15b-d971-be2543c116f7@suse.de>
 <20211207085521.GF1978@kadam> <f9fb86e4-cda0-2381-6b62-b292eb1cec88@suse.de>
In-Reply-To: <f9fb86e4-cda0-2381-6b62-b292eb1cec88@suse.de>
Cc: yuq825@gmail.com, emma@anholt.net, tomeu.vizoso@collabora.com,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, steven.price@arm.com,
 lima@lists.freedesktop.org, alyssa.rosenzweig@collabora.com,
 gurchetansingh@chromium.org, virtualization@lists.linux-foundation.org
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
Content-Type: multipart/mixed; boundary="===============5596494560760022891=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============5596494560760022891==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------LHx0v00AL06UZHmTa3DwK72P"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------LHx0v00AL06UZHmTa3DwK72P
Content-Type: multipart/mixed; boundary="------------qlrVa1lGHMwGWCWugCTsd8s6";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: emma@anholt.net, tomeu.vizoso@collabora.com, airlied@linux.ie,
 alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, gurchetansingh@chromium.org, kraxel@redhat.com,
 yuq825@gmail.com, virtualization@lists.linux-foundation.org,
 lima@lists.freedesktop.org
Message-ID: <fbe2d58e-2770-a5de-973f-5a37fd7d90df@suse.de>
Subject: Re: [PATCH] drm: Return error codes from struct
 drm_driver.gem_create_object
References: <20211130095255.26710-1-tzimmermann@suse.de>
 <20211206104233.GD1978@kadam> <4fa29fcb-f936-b590-7691-90f0579a54ae@suse.de>
 <20211206144007.GE1978@kadam> <53405618-2e3d-c15b-d971-be2543c116f7@suse.de>
 <20211207085521.GF1978@kadam> <f9fb86e4-cda0-2381-6b62-b292eb1cec88@suse.de>
In-Reply-To: <f9fb86e4-cda0-2381-6b62-b292eb1cec88@suse.de>

--------------qlrVa1lGHMwGWCWugCTsd8s6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDcuMTIuMjEgdW0gMTA6MjQgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoN
Cj4gSGkNCj4gDQo+IEFtIDA3LjEyLjIxIHVtIDA5OjU1IHNjaHJpZWIgRGFuIENhcnBlbnRl
cjoNCj4+IEkgYXBwb2xvZ2l6ZS7CoCBUaGlzIHRocmVhZCBoYXMgYmVlbiByZWFsbHkgZnJ1
c3RyYXRpbmcuwqAgSSBnb3QgbWl4ZWQgdXANCj4+IGJlY2F1c2UgSSByZWNlbnRseSBzZW50
IHBhdGNoZXMgZm9yIGluZ2VuaWMgYW5kIHZjNC7CoCBBbHNvIHdlIGFyZQ0KPj4gd29ya2lu
ZyBhZ2FpbnN0IGRpZmZlcmVudCB0cmVlcyBzbyBtYXliZSB0aGF0IGlzIHBhcnQgb2YgdGhl
IHByb2JsZW0/DQo+Pg0KPj4gSSdtIGxvb2tpbmcgYXQgdG9kYXkncyBsaW51eC1uZXh0LsKg
IFlvdXIgcGF0Y2ggaGFzIGJlZW4gYXBwbGllZC4NCj4+DQo+PiBZZXMuwqAgWW91IHVwZGF0
ZWQgYWxsIHRoZSBkcml2ZXJzLsKgIEJ1dCBzb21laG93IHRoZSB2YzQgY2h1bmsgZnJvbSB5
b3VyDQo+PiBwYXRjaCB3YXMgZHJvcHBlZC7CoCBJdCB3YXMgKk5PVCogZHJvcHBlZCBieSBT
dGVwaGVuIFJvdGh3ZWxsLsKgIEl0IGdvdA0KPj4gZHJvcHBlZCBlYXJsaWVyLsKgIEkgYW0g
aW5jbHVkaW5nIHRoZSBgZ2l0IGZvcm1hdC1wYXRjaCAtMSA8aGFzaD5gIG91dHB1dA0KPj4g
ZnJvbSB0aGUgY29tbWl0Lg0KPiANCj4gTXkgdmM0IGNoYW5nZSBpcyBpbiBkcm0tbWlzYy1u
ZXh0LCBbMV0gYnV0IG5vdCBpbiBkcm0tdGlwLiBbMl0gWW91ciB2YzQgDQo+IHBhdGNoIHdl
bnQgdGhyb3VnaCBkcm0tbWlzYy1maXhlcy4NCj4gDQo+IGRybS10aXAgaXMgYnVpbGQgYXV0
b21hdGljYWxseSBieSBvdXIgRFJNIHRvb2xzIGZyb20gdGhlIHZhcmlvdXMgdHJlZXMuIA0K
PiBUaGUgdG9vbHMgdG9vayBteSBwYXRjaCBmcm9tIGRybS1taXNjLW5leHQgYW5kIHlvdXIg
cGF0Y2ggZnJvbSANCj4gZHJtLW1pc2MtZml4ZXMgYW5kIHRoZSByZXN1bHQgd2FzIGJyb2tl
bi4NCj4gDQo+IFRoYW5rcyBmb3IgYnJpbmdpbmcgdGhpcyB1cC4gSSdsbCBzZWUgd2hhdCBJ
IGNhbiBkbyBhYm91dCBpdC4NCg0KRllJIEkgZml4ZWQgZHJtLXRpcCB0byByZXR1cm4gYSBw
b2ludGVyLWVuY29kZWQgZXJyb3IgaW4gdmM0LiBbMV0NCg0KQmVzdCByZWdhcmRzDQpUaG9t
YXMNCg0KWzFdIA0KaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLXRpcC90
cmVlL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2JvLmM/aWQ9Y2MzYjllYjE4NmUzYzhkZmIw
YmNjN2Q1NGZhNGJmYmU1MmMwYjU4YiNuMzk0DQoNCg0KPiANCj4gQmVzdCByZWdhcmRzDQo+
IFRob21hcw0KPiANCj4gWzFdIA0KPiBodHRwczovL2NnaXQuZnJlZWRlc2t0b3Aub3JnL2Ry
bS9kcm0tbWlzYy90cmVlL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2JvLmMjbjM5NCANCj4g
DQo+IFsyXSANCj4gaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLXRpcC90
cmVlL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2JvLmMNCj4gDQo+IA0KDQotLSANClRob21h
cyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJl
IFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVy
ZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhy
ZXI6IEl2byBUb3Rldg0K

--------------qlrVa1lGHMwGWCWugCTsd8s6--

--------------LHx0v00AL06UZHmTa3DwK72P
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGwh0gFAwAAAAAACgkQlh/E3EQov+Bt
PhAAimeFhBK6xbu3ItZsTz+Qw0mFiglJq2hK7XaDQVfpZc3XROcNOVXkHFgqKUzzfgBQiXrYdmEj
GFulsNvftoeAEgzqaCCpYRgIPSfK5jvVXRiI+LbD0IzMdXk5YIVzpfAckierrD9cfQN4/aAorXT1
s01Ehg5ID14zBDglusiVs36WALSOy9Sv+8JJAFoHqDTU8TMKkXP0+/VSWyPMITom3sTrQA8Gu8Lr
OPn1/IVXeJBwBADJVt4sYu/Fa1FU1OwVMP3IpZEj5DR8Nvcx3KSvaCl2bM3pWg/rd1+eRYrxFBQ+
JGyPn32o6noXp9sVUBE/5S9yjho8Xf4bzsDfq6Uq5OuzYu0szVBD6kGk+tHnuJDfjEspsRPa2N0C
VHV4If1GbKBaHgqQj1OVHWUwOVuK7+VEI5KKnS9BGWzab8A4Ats1sW1lsSKY1SmdMvJrhJ10Y++0
pcBtxmzZs8o47P7mcNYZ0qMWSTzaJWQNncIp+IDvF/bFs2l2EhydbEL9TpeZJvjvK5JVnPKTC990
XNV0z6HSUy5W2kTubVigF649RxMHnDKy1ZyiSrAntW1gRNADVp390km//D5VwmCXvBkNzTUJSPlN
AZ29VGfderoY5UPrsYuE4cvUudIvo1gfvco+1CGrvIwfTcuxOlskKiGjZ0hvEuYwricuLlqaKb14
vbI=
=NPIQ
-----END PGP SIGNATURE-----

--------------LHx0v00AL06UZHmTa3DwK72P--

--===============5596494560760022891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============5596494560760022891==--
