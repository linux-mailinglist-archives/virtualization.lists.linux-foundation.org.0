Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3D769ACB6
	for <lists.virtualization@lfdr.de>; Fri, 17 Feb 2023 14:42:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 365CF6179F;
	Fri, 17 Feb 2023 13:42:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 365CF6179F
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=UMO/PZzz;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ADGviP6I
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HyUoCBfS_Uj1; Fri, 17 Feb 2023 13:42:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E4D0A61793;
	Fri, 17 Feb 2023 13:42:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4D0A61793
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 25B72C0078;
	Fri, 17 Feb 2023 13:42:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D02A4C002B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Feb 2023 13:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E77281E15
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Feb 2023 13:42:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E77281E15
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=UMO/PZzz; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ADGviP6I
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XIhHSHeh63PY
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Feb 2023 13:42:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB67481DF3
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB67481DF3
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Feb 2023 13:42:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 154A71FF98;
 Fri, 17 Feb 2023 13:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676641334; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AjFMkHXsM8fM4NPbEA9UfxXvhT3vw/AHE68H6u3D2IY=;
 b=UMO/PZzzG/ReRdG4iVcqfBir/QXaXVet/1Jjin4oCLOmgcSxZJR7kljnjh09gejTn5GfGp
 CtiJWAyFxwX46SgQwWSf6OnkLwa8IAw4f5hC3T9TNlxpm4dlWwn1cf8tuI8UlB2hNgrcog
 4HRXYkBJJixA2bGoY6koYFxAdK6MCuc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676641334;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AjFMkHXsM8fM4NPbEA9UfxXvhT3vw/AHE68H6u3D2IY=;
 b=ADGviP6IY/XJuAO5haXnc0OBWjpXmH/rHSQTbVEdS2wpwjN6/LFidBy6bD9BzlGGblI4rV
 n6jwLYcJIqyL9RCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 96CF813274;
 Fri, 17 Feb 2023 13:42:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ryn/IjWE72OzCQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Feb 2023 13:42:13 +0000
Message-ID: <d0be098d-c58f-9866-da6f-a721fa57806b@suse.de>
Date: Fri, 17 Feb 2023 14:42:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 09/11] drm/gem: Add drm_gem_pin_unlocked()
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>
 <20230108210445.3948344-10-dmitry.osipenko@collabora.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230108210445.3948344-10-dmitry.osipenko@collabora.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
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
Content-Type: multipart/mixed; boundary="===============2910685858093314705=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2910685858093314705==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YEkqz0yA0vjAn7Bykv0GXpsJ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YEkqz0yA0vjAn7Bykv0GXpsJ
Content-Type: multipart/mixed; boundary="------------Z3KnnIy3SuREDC6znB2yaF0I";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Message-ID: <d0be098d-c58f-9866-da6f-a721fa57806b@suse.de>
Subject: Re: [PATCH v10 09/11] drm/gem: Add drm_gem_pin_unlocked()
References: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>
 <20230108210445.3948344-10-dmitry.osipenko@collabora.com>
In-Reply-To: <20230108210445.3948344-10-dmitry.osipenko@collabora.com>

--------------Z3KnnIy3SuREDC6znB2yaF0I
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SSBmb3Jnb3QgdGhpcyBjaGFuZ2UuDQoNCkFtIDA4LjAxLjIzIHVtIDIyOjA0IHNjaHJpZWIg
RG1pdHJ5IE9zaXBlbmtvOg0KPiBBZGQgdW5sb2NrZWQgdmFyaWFudHMgb2YgZHJtX2dlbV91
bi9waW4oKSBmdW5jdGlvbnMuIFRoZXNlIG5ldyBoZWxwZXJzDQo+IHdpbGwgdGFrZSBjYXJl
IG9mIEdFTSBkbWEtcmVzZXJ2YXRpb24gbG9ja2luZyBmb3IgRFJNIGRyaXZlcnMuDQo+IA0K
PiBWaXJ0SU8tR1BVIGRyaXZlciB3aWxsIHVzZSB0aGVzZSBoZWxwZXJzIHRvIHBpbiBzaG1l
bSBmcmFtZWJ1ZmZlcnMsDQo+IHByZXZlbnRpbmcgdGhlbSBmcm9tIGV2aWN0aW9uIGR1cmlu
ZyBzY2Fub3V0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkbWl0
cnkub3NpcGVua29AY29sbGFib3JhLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0K
DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMgfCAyOSArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKw0KPiAgIGluY2x1ZGUvZHJtL2RybV9nZW0uaCAgICAgfCAg
MyArKysNCj4gICAyIGZpbGVzIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKykNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9nZW0uYw0KPiBpbmRleCBkYmI0OGZjOWRmZjMuLjBiOGQzZGE5ODVjNyAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2dlbS5jDQo+IEBAIC0xMTY3LDYgKzExNjcsMzUgQEAgdm9pZCBkcm1fZ2Vt
X3VucGluKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQ0KPiAgIAkJb2JqLT5mdW5jcy0+
dW5waW4ob2JqKTsNCj4gICB9DQo+ICAgDQo+ICtpbnQgZHJtX2dlbV9waW5fdW5sb2NrZWQo
c3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopDQo+ICt7DQo+ICsJaW50IHJldDsNCj4gKw0K
PiArCWlmICghb2JqLT5mdW5jcy0+cGluKQ0KPiArCQlyZXR1cm4gMDsNCj4gKw0KPiArCXJl
dCA9IGRtYV9yZXN2X2xvY2tfaW50ZXJydXB0aWJsZShvYmotPnJlc3YsIE5VTEwpOw0KPiAr
CWlmIChyZXQpDQo+ICsJCXJldHVybiByZXQ7DQo+ICsNCj4gKwlyZXQgPSBvYmotPmZ1bmNz
LT5waW4ob2JqKTsNCj4gKwlkbWFfcmVzdl91bmxvY2sob2JqLT5yZXN2KTsNCj4gKw0KPiAr
CXJldHVybiByZXQ7DQo+ICt9DQo+ICtFWFBPUlRfU1lNQk9MKGRybV9nZW1fcGluX3VubG9j
a2VkKTsNCj4gKw0KPiArdm9pZCBkcm1fZ2VtX3VucGluX3VubG9ja2VkKHN0cnVjdCBkcm1f
Z2VtX29iamVjdCAqb2JqKQ0KPiArew0KPiArCWlmICghb2JqLT5mdW5jcy0+dW5waW4pDQo+
ICsJCXJldHVybjsNCj4gKw0KPiArCWRtYV9yZXN2X2xvY2sob2JqLT5yZXN2LCBOVUxMKTsN
Cj4gKwlvYmotPmZ1bmNzLT51bnBpbihvYmopOw0KPiArCWRtYV9yZXN2X3VubG9jayhvYmot
PnJlc3YpOw0KPiArfQ0KPiArRVhQT1JUX1NZTUJPTChkcm1fZ2VtX3VucGluX3VubG9ja2Vk
KTsNCj4gKw0KPiAgIGludCBkcm1fZ2VtX3ZtYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpv
YmosIHN0cnVjdCBpb3N5c19tYXAgKm1hcCkNCj4gICB7DQo+ICAgCWludCByZXQ7DQo+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZ2VtLmggYi9pbmNsdWRlL2RybS9kcm1fZ2Vt
LmgNCj4gaW5kZXggOGU1YzIyZjI1NjkxLi42ZjZkOTZmNzlhNjcgMTAwNjQ0DQo+IC0tLSBh
L2luY2x1ZGUvZHJtL2RybV9nZW0uaA0KPiArKysgYi9pbmNsdWRlL2RybS9kcm1fZ2VtLmgN
Cj4gQEAgLTQ5Myw0ICs0OTMsNyBAQCB1bnNpZ25lZCBsb25nIGRybV9nZW1fbHJ1X3NjYW4o
c3RydWN0IGRybV9nZW1fbHJ1ICpscnUsDQo+ICAgDQo+ICAgYm9vbCBkcm1fZ2VtX29iamVj
dF9ldmljdChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaik7DQo+ICAgDQo+ICtpbnQgZHJt
X2dlbV9waW5fdW5sb2NrZWQoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopOw0KPiArdm9p
ZCBkcm1fZ2VtX3VucGluX3VubG9ja2VkKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKTsN
Cj4gKw0KPiAgICNlbmRpZiAvKiBfX0RSTV9HRU1fSF9fICovDQoNCi0tIA0KVGhvbWFzIFpp
bW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29s
dXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBH
ZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjog
SXZvIFRvdGV2DQo=

--------------Z3KnnIy3SuREDC6znB2yaF0I--

--------------YEkqz0yA0vjAn7Bykv0GXpsJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPvhDUFAwAAAAAACgkQlh/E3EQov+AJ
CRAAke/NN/NQ0vWzacgOoYmIPjFXGMa/wy1lJbgC8EltQRzSKvPs05T23clW71EDeqppBrqebbAt
gMcaVxY9J6SOAhPZkls3ZIL7wj+/+TRIYxHJj2PXy07/ymLZ9AHZd9+ScDwR+tsX2vbDJ7VPxLvk
eJ3sEqUyd8z+YkqKZ8gDJvJEcYZ9zQkjn2CO83KCc1Nbseic2M9yT2s2qQRcl5EnnPwpwyos+fvC
1CG/NbSH8SojY2jLLYR1J9msnD9eQ+nQNhqV7hkKzGcRG2TvKG5amXLQ/8RmR3rIgZj0TlZfyx8E
RrYgxArzCKLKkTfGpMfn4niOusJdoFgen/uwujxRyPALBNj43Wrm67crxmgNsJ35C6vWBN8Jluh0
7m5yNCp4illwphVjZqmHj+wgTquz3I0gtlAhRWMw/fvlsM4IfPnOKFmWjqR/+zCVQijU5/UKV/0w
0fQfWbgmh3kcgy8cs8oXxwVxOKwaC3ljeJumJuqz3Vda2PMQ8K9QXS1r4z3MbSGNweEsvSV1e4o1
tzQDD/fzDY3GWm3ezAXxJX5JvysjPJWUsbsOj9iyfRgoSz9TGS0Lu1erKVBOc0RPf5ZsyfpiNTjJ
n/IGzJ4kJ05lhgQ8VQDNmY/IGkOneIJ6tdbX8kUxwmsJBDLh7+C1C+7ynueXRsZX4bVJKZZHrYe1
1xE=
=gTBP
-----END PGP SIGNATURE-----

--------------YEkqz0yA0vjAn7Bykv0GXpsJ--

--===============2910685858093314705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============2910685858093314705==--
