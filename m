Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CA1583980
	for <lists.virtualization@lfdr.de>; Thu, 28 Jul 2022 09:28:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7760060F26;
	Thu, 28 Jul 2022 07:28:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7760060F26
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=i1jGwnIx;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=rGYpwh4r
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JYeqfcp4Cxs2; Thu, 28 Jul 2022 07:28:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 130E160F1F;
	Thu, 28 Jul 2022 07:28:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 130E160F1F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 35A3DC0078;
	Thu, 28 Jul 2022 07:28:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 29A04C002D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Jul 2022 07:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0471460F1B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Jul 2022 07:27:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0471460F1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XcvXkqbmYyO3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Jul 2022 07:27:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BC89605A4
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0BC89605A4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Jul 2022 07:27:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8666434B0F;
 Thu, 28 Jul 2022 07:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658993273; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MjLZWdiD5mNypfZ8WQHGTKPQ5o9MhVT+Q6UcblJEPvU=;
 b=i1jGwnIxyH3QhHAg9qTkXFjx85+wynKMSD8pj5qWcAxamD+8qLNLy7a2oIo80I+P2DPuo+
 SFobdo/EENf6m3k7PZ6UbMnMZgJefcqe9WkiVA8Eq+Gxt57wSmhN+ZZM3oki5m+IkKrY8C
 ONvR6oubabawpG3GlPj21UrnJ6hwAdU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658993273;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MjLZWdiD5mNypfZ8WQHGTKPQ5o9MhVT+Q6UcblJEPvU=;
 b=rGYpwh4rVYqF465KZkHwG4ObbaRCwhO22FSJLHixdZr2LPQXCkbAnsxMe8ZvzjEhJzlS73
 HcYRAxS5J1sB+zBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3D30813A7E;
 Thu, 28 Jul 2022 07:27:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id K8YHDXk64mJAEwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 28 Jul 2022 07:27:53 +0000
Message-ID: <4ba57f80-5025-c3a0-5f65-ec52643f0122@suse.de>
Date: Thu, 28 Jul 2022 09:27:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 04/12] drm/format-helper: Rework XRGB8888-to-RGBG332
 conversion
Content-Language: en-US
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
References: <20220727113312.22407-1-tzimmermann@suse.de>
 <20220727113312.22407-5-tzimmermann@suse.de>
 <20220728071353.GA56421@elementary>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220728071353.GA56421@elementary>
Cc: linux-hyperv@vger.kernel.org, david@lechnology.com, airlied@linux.ie,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, drawat.floss@gmail.com,
 noralf@tronnes.org, airlied@redhat.com, sam@ravnborg.org
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
Content-Type: multipart/mixed; boundary="===============1289755195621547163=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1289755195621547163==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------TnFD3M0YVl0sdOjGfA0JYtYh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------TnFD3M0YVl0sdOjGfA0JYtYh
Content-Type: multipart/mixed; boundary="------------G4EHYJqHOXnYBINd6xgRgzva";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: linux-hyperv@vger.kernel.org, david@lechnology.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, javierm@redhat.com,
 virtualization@lists.linux-foundation.org, drawat.floss@gmail.com,
 noralf@tronnes.org, kraxel@redhat.com, airlied@redhat.com, sam@ravnborg.org
Message-ID: <4ba57f80-5025-c3a0-5f65-ec52643f0122@suse.de>
Subject: Re: [PATCH 04/12] drm/format-helper: Rework XRGB8888-to-RGBG332
 conversion
References: <20220727113312.22407-1-tzimmermann@suse.de>
 <20220727113312.22407-5-tzimmermann@suse.de>
 <20220728071353.GA56421@elementary>
In-Reply-To: <20220728071353.GA56421@elementary>

--------------G4EHYJqHOXnYBINd6xgRgzva
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjguMDcuMjIgdW0gMDk6MTMgc2NocmllYiBKb3PDqSBFeHDDs3NpdG86DQo+
IEhpIFRob21hcywNCj4gDQo+IE9uIFdlZCwgSnVsIDI3LCAyMDIyIGF0IDAxOjMzOjA0UE0g
KzAyMDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gVXBkYXRlIFhSR0I4ODg4LXRv
LVJHQjMzMiBjb252ZXJzaW9uIHRvIHN1cHBvcnQgc3RydWN0IGlvc3lzX21hcA0KPj4gYW5k
IGNvbnZlcnQgYWxsIHVzZXJzLiBBbHRob3VnaCB0aGVzZSBhcmUgc2luZ2xlLXBsYW5lIGNv
bG9yIGZvcm1hdHMsDQo+PiB0aGUgbmV3IGludGVyZmFjZSBzdXBwb3J0cyBtdWx0aS1wbGFu
ZSBmb3JtYXRzIGZvciBjb25zaXN0ZW5jeSB3aXRoDQo+PiBkcm1fZmJfYmxpdCgpLg0KPj4N
Cj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNl
LmRlPg0KPiANCj4gVGVzdGVkLWJ5OiBKb3PDqSBFeHDDs3NpdG8gPGpvc2UuZXhwb3NpdG84
OUBnbWFpbC5jb20+DQo+IFJldmlld2VkLWJ5OiBKb3PDqSBFeHDDs3NpdG8gPGpvc2UuZXhw
b3NpdG84OUBnbWFpbC5jb20+DQo+IA0KPiBJIGp1c3QgcmFuIHRoZSB0ZXN0cyBpbiB4ODZf
NjQgYW5kIFVNTCBhbmQgdGhleSB3b3JrIGFzIGV4cGVjdGVkLg0KPiBJIG5lZWQgdG8gZmlu
ZCBzb21lIHRpbWUgdG8gcmV2aWV3IGFsbCBwYXRjaGVzLCBidXQgdGhpcyBvbmUgTEdUTS4N
Cg0KVGhhbmtzIGEgbG90Lg0KDQo+IA0KPiBUaGlzIHNlcmllcyB3aWxsIGNhdXNlIGNvbmZs
aWN0cyB3aXRoIFsxXS4gRGVwZW5kaW5nIG9uIHdoaWNoIHBhdGNoc2V0DQo+IGdldHMgbWVy
Z2VkIGVhcmxpZXIsIHdlIHdpbGwgaGF2ZSB0byByZXNvbHZlIHRoZSBjb25mbGljdHMgaW4g
b25lDQo+IHNlcmllcyBvciB0aGUgb3RoZXIuDQoNCkkndmUgc2VlbiB0aGlzLiBHbyBhaGVh
ZCBhbmQgY29tbWl0IHlvdXIgcGF0Y2hlcyBpZiB0aGV5IGFyZSByZWFkeS4gSSANCmNhbiBl
YXNpbHkgcmViYXNlIG9uIHRvcC4NCg0KQmVzdCByZWFyZHMNClRob21hcw0KDQo+IA0KPiBC
ZXN0IHdpc2hlcywNCj4gSm9zZQ0KPiANCj4gWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5l
bC5vcmcvcHJvamVjdC9kcmktZGV2ZWwvbGlzdC8/c2VyaWVzPTY2MzI2Ng0KPiANCj4+IC0t
LQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuYyAgICAgICAgICAg
fCAyNSArKysrKysrKysrKysrKy0tLS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9ndWQvZ3Vk
X3BpcGUuYyAgICAgICAgICAgICAgICB8ICAyICstDQo+PiAgIC4uLi9ncHUvZHJtL3Rlc3Rz
L2RybV9mb3JtYXRfaGVscGVyX3Rlc3QuYyAgICB8IDE0ICsrKysrKy0tLS0tDQo+PiAgIGlu
Y2x1ZGUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmggICAgICAgICAgICAgICB8ICA1ICsrLS0N
Cj4+ICAgNCBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMo
LSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9mb3JtYXRfaGVs
cGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuYw0KPj4gaW5kZXgg
ZmEyMmQzY2IxMWU4Li4yYjVjMzc0NmZmNGEgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9mb3JtYXRfaGVscGVyLmMNCj4+IEBAIC0yNjUsMTggKzI2NSwzMSBAQCBzdGF0aWMgdm9p
ZCBkcm1fZmJfeHJnYjg4ODhfdG9fcmdiMzMyX2xpbmUodm9pZCAqZGJ1ZiwgY29uc3Qgdm9p
ZCAqc2J1ZiwgdW5zaWduZQ0KPj4gICANCj4+ICAgLyoqDQo+PiAgICAqIGRybV9mYl94cmdi
ODg4OF90b19yZ2IzMzIgLSBDb252ZXJ0IFhSR0I4ODg4IHRvIFJHQjMzMiBjbGlwIGJ1ZmZl
cg0KPj4gLSAqIEBkc3Q6IFJHQjMzMiBkZXN0aW5hdGlvbiBidWZmZXINCj4+IC0gKiBAZHN0
X3BpdGNoOiBOdW1iZXIgb2YgYnl0ZXMgYmV0d2VlbiB0d28gY29uc2VjdXRpdmUgc2Nhbmxp
bmVzIHdpdGhpbiBkc3QNCj4+IC0gKiBAc3JjOiBYUkdCODg4OCBzb3VyY2UgYnVmZmVyDQo+
PiArICogQGRzdDogQXJyYXkgb2YgUkdCMzMyIGRlc3RpbmF0aW9uIGJ1ZmZlcnMNCj4+ICsg
KiBAZHN0X3BpdGNoOiBBcnJheSBvZiBudW1iZXJzIG9mIGJ5dGVzIGJldHdlZW4gdHdvIGNv
bnNlY3V0aXZlIHNjYW5saW5lcyB3aXRoaW4gZHN0DQo+PiArICogQHZtYXA6IEFycmF5IG9m
IFhSR0I4ODg4IHNvdXJjZSBidWZmZXJzDQo+PiAgICAqIEBmYjogRFJNIGZyYW1lYnVmZmVy
DQo+PiAgICAqIEBjbGlwOiBDbGlwIHJlY3RhbmdsZSBhcmVhIHRvIGNvcHkNCj4+ICAgICoN
Cj4+ICAgICogRHJpdmVycyBjYW4gdXNlIHRoaXMgZnVuY3Rpb24gZm9yIFJHQjMzMiBkZXZp
Y2VzIHRoYXQgZG9uJ3QgbmF0aXZlbHkgc3VwcG9ydCBYUkdCODg4OC4NCj4+ICAgICovDQo+
PiAtdm9pZCBkcm1fZmJfeHJnYjg4ODhfdG9fcmdiMzMyKHZvaWQgKmRzdCwgdW5zaWduZWQg
aW50IGRzdF9waXRjaCwgY29uc3Qgdm9pZCAqc3JjLA0KPj4gLQkJCSAgICAgICBjb25zdCBz
dHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiwgY29uc3Qgc3RydWN0IGRybV9yZWN0ICpjbGlw
KQ0KPj4gK3ZvaWQgZHJtX2ZiX3hyZ2I4ODg4X3RvX3JnYjMzMihzdHJ1Y3QgaW9zeXNfbWFw
ICpkc3QsIGNvbnN0IHVuc2lnbmVkIGludCAqZHN0X3BpdGNoLA0KPj4gKwkJCSAgICAgICBj
b25zdCBzdHJ1Y3QgaW9zeXNfbWFwICp2bWFwLCBjb25zdCBzdHJ1Y3QgZHJtX2ZyYW1lYnVm
ZmVyICpmYiwNCj4+ICsJCQkgICAgICAgY29uc3Qgc3RydWN0IGRybV9yZWN0ICpjbGlwKQ0K
Pj4gICB7DQo+PiAtCWRybV9mYl94ZnJtKGRzdCwgZHN0X3BpdGNoLCAxLCBzcmMsIGZiLCBj
bGlwLCBmYWxzZSwgZHJtX2ZiX3hyZ2I4ODg4X3RvX3JnYjMzMl9saW5lKTsNCj4+ICsJc3Rh
dGljIGNvbnN0IHVuc2lnbmVkIGludCBkZWZhdWx0X2RzdF9waXRjaFtEUk1fRk9STUFUX01B
WF9QTEFORVNdID0gew0KPj4gKwkJMCwgMCwgMCwgMA0KPj4gKwl9Ow0KPj4gKw0KPj4gKwlp
ZiAoIWRzdF9waXRjaCkNCj4+ICsJCWRzdF9waXRjaCA9IGRlZmF1bHRfZHN0X3BpdGNoOw0K
Pj4gKw0KPj4gKwlpZiAoZHN0WzBdLmlzX2lvbWVtKQ0KPj4gKwkJZHJtX2ZiX3hmcm1fdG9p
byhkc3RbMF0udmFkZHJfaW9tZW0sIGRzdF9waXRjaFswXSwgMSwgdm1hcFswXS52YWRkciwg
ZmIsIGNsaXAsDQo+PiArCQkJCSBmYWxzZSwgZHJtX2ZiX3hyZ2I4ODg4X3RvX3JnYjMzMl9s
aW5lKTsNCj4+ICsJZWxzZQ0KPj4gKwkJZHJtX2ZiX3hmcm0oZHN0WzBdLnZhZGRyLCBkc3Rf
cGl0Y2hbMF0sIDEsIHZtYXBbMF0udmFkZHIsIGZiLCBjbGlwLA0KPj4gKwkJCSAgICBmYWxz
ZSwgZHJtX2ZiX3hyZ2I4ODg4X3RvX3JnYjMzMl9saW5lKTsNCj4+ICAgfQ0KPj4gICBFWFBP
UlRfU1lNQk9MKGRybV9mYl94cmdiODg4OF90b19yZ2IzMzIpOw0KPj4gICANCj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9waXBlLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZ3VkL2d1ZF9waXBlLmMNCj4+IGluZGV4IGExNWNkYTliYTA1OC4uNDI2YTNhZTZjYzUw
IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2d1ZC9ndWRfcGlwZS5jDQo+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9waXBlLmMNCj4+IEBAIC0xOTYsNyArMTk2
LDcgQEAgc3RhdGljIGludCBndWRfcHJlcF9mbHVzaChzdHJ1Y3QgZ3VkX2RldmljZSAqZ2Ry
bSwgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIsDQo+PiAgIAkJfSBlbHNlIGlmIChmb3Jt
YXQtPmZvcm1hdCA9PSBEUk1fRk9STUFUX1I4KSB7DQo+PiAgIAkJCWRybV9mYl94cmdiODg4
OF90b19ncmF5OChidWYsIDAsIHZhZGRyLCBmYiwgcmVjdCk7DQo+PiAgIAkJfSBlbHNlIGlm
IChmb3JtYXQtPmZvcm1hdCA9PSBEUk1fRk9STUFUX1JHQjMzMikgew0KPj4gLQkJCWRybV9m
Yl94cmdiODg4OF90b19yZ2IzMzIoYnVmLCAwLCB2YWRkciwgZmIsIHJlY3QpOw0KPj4gKwkJ
CWRybV9mYl94cmdiODg4OF90b19yZ2IzMzIoJmRzdCwgTlVMTCwgbWFwX2RhdGEsIGZiLCBy
ZWN0KTsNCj4+ICAgCQl9IGVsc2UgaWYgKGZvcm1hdC0+Zm9ybWF0ID09IERSTV9GT1JNQVRf
UkdCNTY1KSB7DQo+PiAgIAkJCWRybV9mYl94cmdiODg4OF90b19yZ2I1NjUoYnVmLCAwLCB2
YWRkciwgZmIsIHJlY3QsIGd1ZF9pc19iaWdfZW5kaWFuKCkpOw0KPj4gICAJCX0gZWxzZSBp
ZiAoZm9ybWF0LT5mb3JtYXQgPT0gRFJNX0ZPUk1BVF9SR0I4ODgpIHsNCj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVzdHMvZHJtX2Zvcm1hdF9oZWxwZXJfdGVzdC5jIGIv
ZHJpdmVycy9ncHUvZHJtL3Rlc3RzL2RybV9mb3JtYXRfaGVscGVyX3Rlc3QuYw0KPj4gaW5k
ZXggOTg1ODNiZjU2MDQ0Li5iNzRkYmEwNmY3MDQgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vdGVzdHMvZHJtX2Zvcm1hdF9oZWxwZXJfdGVzdC5jDQo+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vdGVzdHMvZHJtX2Zvcm1hdF9oZWxwZXJfdGVzdC5jDQo+PiBAQCAtMTI0
LDcgKzEyNCw4IEBAIHN0YXRpYyB2b2lkIHhyZ2I4ODg4X3RvX3JnYjMzMl90ZXN0KHN0cnVj
dCBrdW5pdCAqdGVzdCkNCj4+ICAgew0KPj4gICAJY29uc3Qgc3RydWN0IHhyZ2I4ODg4X3Rv
X3JnYjMzMl9jYXNlICpwYXJhbXMgPSB0ZXN0LT5wYXJhbV92YWx1ZTsNCj4+ICAgCXNpemVf
dCBkc3Rfc2l6ZTsNCj4+IC0JX191OCAqZHN0ID0gTlVMTDsNCj4+ICsJc3RydWN0IGlvc3lz
X21hcCBkc3QsIHhyZ2I4ODg4Ow0KPj4gKwlfX3U4ICpidWYgPSBOVUxMOw0KPj4gICANCj4+
ICAgCXN0cnVjdCBkcm1fZnJhbWVidWZmZXIgZmIgPSB7DQo+PiAgIAkJLmZvcm1hdCA9IGRy
bV9mb3JtYXRfaW5mbyhEUk1fRk9STUFUX1hSR0I4ODg4KSwNCj4+IEBAIC0xMzUsMTIgKzEz
NiwxMyBAQCBzdGF0aWMgdm9pZCB4cmdiODg4OF90b19yZ2IzMzJfdGVzdChzdHJ1Y3Qga3Vu
aXQgKnRlc3QpDQo+PiAgIAkJCQkgICAgICAgJnBhcmFtcy0+Y2xpcCk7DQo+PiAgIAlLVU5J
VF9BU1NFUlRfR1QodGVzdCwgZHN0X3NpemUsIDApOw0KPj4gICANCj4+IC0JZHN0ID0ga3Vu
aXRfa3phbGxvYyh0ZXN0LCBkc3Rfc2l6ZSwgR0ZQX0tFUk5FTCk7DQo+PiAtCUtVTklUX0FT
U0VSVF9OT1RfRVJSX09SX05VTEwodGVzdCwgZHN0KTsNCj4+ICsJYnVmID0ga3VuaXRfa3ph
bGxvYyh0ZXN0LCBkc3Rfc2l6ZSwgR0ZQX0tFUk5FTCk7DQo+PiArCUtVTklUX0FTU0VSVF9O
T1RfRVJSX09SX05VTEwodGVzdCwgYnVmKTsNCj4+ICAgDQo+PiAtCWRybV9mYl94cmdiODg4
OF90b19yZ2IzMzIoZHN0LCBwYXJhbXMtPmRzdF9waXRjaCwgcGFyYW1zLT54cmdiODg4OCwN
Cj4+IC0JCQkJICAmZmIsICZwYXJhbXMtPmNsaXApOw0KPj4gLQlLVU5JVF9FWFBFQ1RfRVEo
dGVzdCwgbWVtY21wKGRzdCwgcGFyYW1zLT5leHBlY3RlZCwgZHN0X3NpemUpLCAwKTsNCj4+
ICsJaW9zeXNfbWFwX3NldF92YWRkcigmZHN0LCBidWYpOw0KPj4gKwlpb3N5c19tYXBfc2V0
X3ZhZGRyKCZ4cmdiODg4OCwgKHZvaWQgX19mb3JjZSAqKXBhcmFtcy0+eHJnYjg4ODgpOw0K
Pj4gKwlkcm1fZmJfeHJnYjg4ODhfdG9fcmdiMzMyKCZkc3QsICZwYXJhbXMtPmRzdF9waXRj
aCwgJnhyZ2I4ODg4LCAmZmIsICZwYXJhbXMtPmNsaXApOw0KPj4gKwlLVU5JVF9FWFBFQ1Rf
RVEodGVzdCwgbWVtY21wKGJ1ZiwgcGFyYW1zLT5leHBlY3RlZCwgZHN0X3NpemUpLCAwKTsN
Cj4+ICAgfQ0KPj4gICANCj4+ICAgc3RhdGljIHN0cnVjdCBrdW5pdF9jYXNlIGRybV9mb3Jt
YXRfaGVscGVyX3Rlc3RfY2FzZXNbXSA9IHsNCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2Ry
bS9kcm1fZm9ybWF0X2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIu
aA0KPj4gaW5kZXggNjA5NDRmZWFhOTM2Li4zYzI4ZjA5OWUzZWQgMTAwNjQ0DQo+PiAtLS0g
YS9pbmNsdWRlL2RybS9kcm1fZm9ybWF0X2hlbHBlci5oDQo+PiArKysgYi9pbmNsdWRlL2Ry
bS9kcm1fZm9ybWF0X2hlbHBlci5oDQo+PiBAQCAtMjAsOCArMjAsOSBAQCB2b2lkIGRybV9m
Yl9tZW1jcHkoc3RydWN0IGlvc3lzX21hcCAqZHN0LCBjb25zdCB1bnNpZ25lZCBpbnQgKmRz
dF9waXRjaCwNCj4+ICAgdm9pZCBkcm1fZmJfc3dhYihzdHJ1Y3QgaW9zeXNfbWFwICpkc3Qs
IGNvbnN0IHVuc2lnbmVkIGludCAqZHN0X3BpdGNoLA0KPj4gICAJCSBjb25zdCBzdHJ1Y3Qg
aW9zeXNfbWFwICp2bWFwLCBjb25zdCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiwNCj4+
ICAgCQkgY29uc3Qgc3RydWN0IGRybV9yZWN0ICpjbGlwLCBib29sIGNhY2hlZCk7DQo+PiAt
dm9pZCBkcm1fZmJfeHJnYjg4ODhfdG9fcmdiMzMyKHZvaWQgKmRzdCwgdW5zaWduZWQgaW50
IGRzdF9waXRjaCwgY29uc3Qgdm9pZCAqdmFkZHIsDQo+PiAtCQkJICAgICAgIGNvbnN0IHN0
cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLCBjb25zdCBzdHJ1Y3QgZHJtX3JlY3QgKmNsaXAp
Ow0KPj4gK3ZvaWQgZHJtX2ZiX3hyZ2I4ODg4X3RvX3JnYjMzMihzdHJ1Y3QgaW9zeXNfbWFw
ICpkc3QsIGNvbnN0IHVuc2lnbmVkIGludCAqZHN0X3BpdGNoLA0KPj4gKwkJCSAgICAgICBj
b25zdCBzdHJ1Y3QgaW9zeXNfbWFwICp2bWFwLCBjb25zdCBzdHJ1Y3QgZHJtX2ZyYW1lYnVm
ZmVyICpmYiwNCj4+ICsJCQkgICAgICAgY29uc3Qgc3RydWN0IGRybV9yZWN0ICpjbGlwKTsN
Cj4+ICAgdm9pZCBkcm1fZmJfeHJnYjg4ODhfdG9fcmdiNTY1KHZvaWQgKmRzdCwgdW5zaWdu
ZWQgaW50IGRzdF9waXRjaCwgY29uc3Qgdm9pZCAqdmFkZHIsDQo+PiAgIAkJCSAgICAgICBj
b25zdCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiwgY29uc3Qgc3RydWN0IGRybV9yZWN0
ICpjbGlwLA0KPj4gICAJCQkgICAgICAgYm9vbCBzd2FiKTsNCj4+IC0tIA0KPj4gMi4zNy4x
DQo+Pg0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxv
cGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIu
IDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJn
KQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------G4EHYJqHOXnYBINd6xgRgzva--

--------------TnFD3M0YVl0sdOjGfA0JYtYh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLiOngFAwAAAAAACgkQlh/E3EQov+A0
XQ/+MyPF+cJhNB86rBsCfInbLE0lJ9TxCOI9Rka2sIxC/lEJWPxpTXQB4ER/B628DG31u3YVSYl1
XCNtd0IxiJESE1SC3g8qi4pFCY+Jb1Y9t3O4RXW2LG4BkIi+PfJlSD0OGpoIlDo2zAz2rcCuWape
3Xgf3wZJeB2iA1RA7Crdz4LLifAViIdSMtrWylEpVtDaar2WT1EhrEgob37QKXBQ7qd78ycdlW68
gRdYr6CnWOusuMP5X3FNkwUYuYQivfVkJAOF+l6ayz+4RSfbTK7yBezSIb8nGViy8jZaK7We9D4J
uMmYRd5mM4xbSIjspV8ziIvF1AxkH+yC/AdDVguFa59QVWmf2kYAAEjdEvNV3CwZYWjGTRHVSwhH
EOMZfx8EnwdJf9TXFgnenh/eAowVP+mLlX8wmNgebm70rddsSOskXohpp3ZiyNqDJ0shPqDrUMyr
3usFwyXfhaUSxO8UHxXCysPMKlG3IAdozmxODhaIeDPxGuJpEupfTVVkr07lI2Ha3sCsoXXIb6/h
41xNu1H2fTZW86i1gaXBgIT8qCJGH2suuj0bavkIWIOoaGIFFziFTSsiWtwYNYy0czzPIRnK6ZFq
saT7bIAFegSqBfq9Kw63BkXOkFcWYMxzYfnfUMGAdND5j9M3VFA4PCN19IdQf3Tu1yPaKlt3kRbv
ka4=
=vaBw
-----END PGP SIGNATURE-----

--------------TnFD3M0YVl0sdOjGfA0JYtYh--

--===============1289755195621547163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============1289755195621547163==--
