Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B12B46ADC30
	for <lists.virtualization@lfdr.de>; Tue,  7 Mar 2023 11:44:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75DB040327;
	Tue,  7 Mar 2023 10:44:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75DB040327
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=W9278ypH;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=TvmmfFNE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cSQYwT3io9N8; Tue,  7 Mar 2023 10:44:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1D39D4058B;
	Tue,  7 Mar 2023 10:44:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D39D4058B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6A717C0089;
	Tue,  7 Mar 2023 10:44:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F363DC0032
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Mar 2023 10:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE39281A50
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Mar 2023 10:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE39281A50
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=W9278ypH; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=TvmmfFNE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FnnQ7Gji04oo
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Mar 2023 10:44:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0019B818E8
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0019B818E8
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Mar 2023 10:43:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3DD021FE19;
 Tue,  7 Mar 2023 10:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678185838; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sL2OTW/4pBA6vHoAMsyIRzOykCTu21OCRDfPq9j5Wfs=;
 b=W9278ypHRzlYGwx2rgR1G1iyFrqkspurKvRo2wdgMo3USLWQ1HASdkDvGvJoG4XhwaRu1Q
 obt2WCJthTwIn/xiSjHnDd4fZe5jkBLNx9AVZvOZWGWFjTx3IAwagH4uZigC2gvi8pTW4u
 Fc18O/eWymJnf5IevGDgkhRfQQLFx2w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678185838;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sL2OTW/4pBA6vHoAMsyIRzOykCTu21OCRDfPq9j5Wfs=;
 b=TvmmfFNEIawgDKtYP7bMCffy82S2nm1g7gXr9n/ec9Y8lEFVsafiGr7tHL933SxSdAzV3P
 GEaCCa6f3W0X0KDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CA4251341F;
 Tue,  7 Mar 2023 10:43:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Jk+EMG0VB2TOawAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 07 Mar 2023 10:43:57 +0000
Message-ID: <52f7ee56-dba7-9c32-baed-c0ade6b4f34e@suse.de>
Date: Tue, 7 Mar 2023 11:43:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v12 09/11] drm/gem: Export drm_gem_pin/unpin()
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>
References: <20230305221011.1404672-1-dmitry.osipenko@collabora.com>
 <20230305221011.1404672-10-dmitry.osipenko@collabora.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230305221011.1404672-10-dmitry.osipenko@collabora.com>
Cc: intel-gfx@lists.freedesktop.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
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
Content-Type: multipart/mixed; boundary="===============8680035079139267704=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8680035079139267704==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VTixDPF96HJafdtRuIEc236q"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VTixDPF96HJafdtRuIEc236q
Content-Type: multipart/mixed; boundary="------------eMgUUFxcl9kDHBHbbdPAo1EK";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>
Cc: intel-gfx@lists.freedesktop.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Message-ID: <52f7ee56-dba7-9c32-baed-c0ade6b4f34e@suse.de>
Subject: Re: [PATCH v12 09/11] drm/gem: Export drm_gem_pin/unpin()
References: <20230305221011.1404672-1-dmitry.osipenko@collabora.com>
 <20230305221011.1404672-10-dmitry.osipenko@collabora.com>
In-Reply-To: <20230305221011.1404672-10-dmitry.osipenko@collabora.com>

--------------eMgUUFxcl9kDHBHbbdPAo1EK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMDMuMjMgdW0gMjM6MTAgc2NocmllYiBEbWl0cnkgT3NpcGVua286DQo+
IEV4cG9ydCBkcm1fZ2VtX3VuL3BpbigpIGZ1bmN0aW9ucy4gVGhleSB3aWxsIGJlIHVzZWQg
YnkgVmlydElPLUdQVSBkcml2ZXINCj4gZm9yIHBpbm5pbmcgb2YgYW4gYWN0aXZlIGZyYW1l
YnVmZmVyLCBwcmV2ZW50aW5nIGl0IGZyb20gc3dhcHBpbmcgb3V0IGJ5DQo+IG1lbW9yeSBz
aHJpbmtlci4NCg0KUGxlYXNlIHNlZSBteSByZXBseSB0byBbMTAvMTFdIG9uIHdoeSB0aGlz
IHBhdGNoIHNob3VsZCBub3QgYmUgdXNlZC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkbWl0cnkub3NpcGVua29A
Y29sbGFib3JhLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYyAg
ICAgIHwgMiArKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1faW50ZXJuYWwuaCB8IDIgLS0N
Cj4gICBpbmNsdWRlL2RybS9kcm1fZ2VtLmggICAgICAgICAgfCAzICsrKw0KPiAgIDMgZmls
ZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2dlbS5jDQo+IGluZGV4IDNkYTM0YjEyMWM5My4uNjQ5MmM0N2I3MTQyIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZ2VtLmMNCj4gQEAgLTExNTMsMTIgKzExNTMsMTQgQEAgaW50IGRybV9nZW1f
cGluKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQ0KPiAgIAllbHNlDQo+ICAgCQlyZXR1
cm4gMDsNCj4gICB9DQo+ICtFWFBPUlRfU1lNQk9MKGRybV9nZW1fcGluKTsNCj4gICANCj4g
ICB2b2lkIGRybV9nZW1fdW5waW4oc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopDQo+ICAg
ew0KPiAgIAlpZiAob2JqLT5mdW5jcy0+dW5waW4pDQo+ICAgCQlvYmotPmZ1bmNzLT51bnBp
bihvYmopOw0KPiAgIH0NCj4gK0VYUE9SVF9TWU1CT0woZHJtX2dlbV91bnBpbik7DQo+ICAg
DQo+ICAgaW50IGRybV9nZW1fdm1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgc3Ry
dWN0IGlvc3lzX21hcCAqbWFwKQ0KPiAgIHsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1faW50ZXJuYWwuaCBiL2RyaXZlcnMvZ3B1L2RybS9kcm1faW50ZXJuYWwuaA0K
PiBpbmRleCBkN2UwMjNiYmIwZDUuLjU1ZDBlZTc0NzVmNyAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2RybV9pbnRlcm5hbC5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1faW50ZXJuYWwuaA0KPiBAQCAtMTczLDggKzE3Myw2IEBAIHZvaWQgZHJtX2dlbV9yZWxl
YXNlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2
YXRlKTsNCj4gICB2b2lkIGRybV9nZW1fcHJpbnRfaW5mbyhzdHJ1Y3QgZHJtX3ByaW50ZXIg
KnAsIHVuc2lnbmVkIGludCBpbmRlbnQsDQo+ICAgCQkJY29uc3Qgc3RydWN0IGRybV9nZW1f
b2JqZWN0ICpvYmopOw0KPiAgIA0KPiAtaW50IGRybV9nZW1fcGluKHN0cnVjdCBkcm1fZ2Vt
X29iamVjdCAqb2JqKTsNCj4gLXZvaWQgZHJtX2dlbV91bnBpbihzdHJ1Y3QgZHJtX2dlbV9v
YmplY3QgKm9iaik7DQo+ICAgaW50IGRybV9nZW1fdm1hcChzdHJ1Y3QgZHJtX2dlbV9vYmpl
Y3QgKm9iaiwgc3RydWN0IGlvc3lzX21hcCAqbWFwKTsNCj4gICB2b2lkIGRybV9nZW1fdnVu
bWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCBzdHJ1Y3QgaW9zeXNfbWFwICptYXAp
Ow0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2dlbS5oIGIvaW5jbHVk
ZS9kcm0vZHJtX2dlbS5oDQo+IGluZGV4IDdiZDhlMmJiYmIzNi4uZjc3MDNjYjY2NTY5IDEw
MDY0NA0KPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fZ2VtLmgNCj4gKysrIGIvaW5jbHVkZS9k
cm0vZHJtX2dlbS5oDQo+IEBAIC00OTMsNCArNDkzLDcgQEAgdW5zaWduZWQgbG9uZyBkcm1f
Z2VtX2xydV9zY2FuKHN0cnVjdCBkcm1fZ2VtX2xydSAqbHJ1LA0KPiAgIA0KPiAgIGludCBk
cm1fZ2VtX2V2aWN0KHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKTsNCj4gICANCj4gK2lu
dCBkcm1fZ2VtX3BpbihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaik7DQo+ICt2b2lkIGRy
bV9nZW1fdW5waW4oc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopOw0KPiArDQo+ICAgI2Vu
ZGlmIC8qIF9fRFJNX0dFTV9IX18gKi8NCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3Jh
cGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFu
eSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIg
MzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==


--------------eMgUUFxcl9kDHBHbbdPAo1EK--

--------------VTixDPF96HJafdtRuIEc236q
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQHFW0FAwAAAAAACgkQlh/E3EQov+AO
tA/9G7svu6vJqZ1ky70H7zMdXcMbnLSorTJx+DYUnlhjTsfIonxwOzfEdDcrgc7ELuteOaRJp/9u
cNrU/OKlUcJxw5s4XuE1Z7wcSYJZG6eIO0b3jjKo28KA4NJsIwIeVXt1YWMP/vffXEe7Tk4IK5wz
heD4NW7j5aV3pDqzN7lxz6sdiQlwgQ9ZTtF7BBbrF2gaC4WAzJKzwS/TriTgnJNvApiOdJExtwSI
m4JWDqNVqpDM5knJ9pFWQFicTBZkW9OKMkrGSSe0LbGGTyxIA4qRztgRZbzonv95rTiZsiVFr/Bv
uD/xcwmPeUHKgGSRCBVmpStPJXsQoUMd4W08LNMcGqyGH1zqtfrIs6uO2zU5kSw8MVCJXdxmI6Ii
62CbJY5YSS/0ookLH4MCe3ZlpTitSWygLu5WVosLsTBYUzCXL0LXwlVb2gGUYAISohxOYz4DIkwg
ZRlMXGJu+eoOpfLkrroxSAyuAufneqNu24ymVByS0eqNPDGYaRd+tTrpORyFqlzUVb91b6t2lAug
+Qfgh6MpVvNf/tTmFj7Emprg3pn72BHfQ/xEI4yEomj1GcdYMByG172l6bFahO+CkvItWADqvCjB
kPx1raY3ZBS+fwWwFS9ucgEMeU0UIiRrqdFHXn4ksNKeGAYLrAsGBYfAIo/odQHKGYtMMOoiTNf9
HFk=
=V/Yr
-----END PGP SIGNATURE-----

--------------VTixDPF96HJafdtRuIEc236q--

--===============8680035079139267704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============8680035079139267704==--
