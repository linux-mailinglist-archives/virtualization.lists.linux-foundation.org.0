Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 331FC6A586E
	for <lists.virtualization@lfdr.de>; Tue, 28 Feb 2023 12:37:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96F814088F;
	Tue, 28 Feb 2023 11:37:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96F814088F
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=vLfU2S5R;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=piUamXoN
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KhKjizkzCxdQ; Tue, 28 Feb 2023 11:37:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id AA1CB40185;
	Tue, 28 Feb 2023 11:37:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA1CB40185
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4B30C0078;
	Tue, 28 Feb 2023 11:37:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F03C9C002B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Feb 2023 11:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA203606EC
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Feb 2023 11:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA203606EC
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=vLfU2S5R; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=piUamXoN
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Ib3Ps-bgHSu
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Feb 2023 11:37:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E7A2605E0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E7A2605E0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Feb 2023 11:37:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0DF401FDBE;
 Tue, 28 Feb 2023 11:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677584259; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BoAIJsSywSfPc6w7N5RAenPfR1cWyMF2pers5F40/os=;
 b=vLfU2S5Rp4+EprBxUA9B0UcJRMh7T/4dPwsAdXQohdBK12zirtHT08Gj7+DWWZfRZTEeDH
 G3QdAaJJsqIUc6ujXlORjYQmjgy4x2397tSeMPSIbBnetGAjqnMFeLjrM0TbBw1iLTxpS5
 zfFw9QCl0TDAgQBqK3W6Yln7PDrVlEw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677584259;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BoAIJsSywSfPc6w7N5RAenPfR1cWyMF2pers5F40/os=;
 b=piUamXoNSZ2pkrAb/jAwAi069ty0wJq2Y1zyjD6YkLp+olCL0v9yTl2Nk879PuHEiWXoeV
 rUV9E7BYK4hvlhDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C1A4A13440;
 Tue, 28 Feb 2023 11:37:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pPI/LoLn/WNlcQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 28 Feb 2023 11:37:38 +0000
Message-ID: <9631930e-3826-ded7-1a45-1d0a285c5195@suse.de>
Date: Tue, 28 Feb 2023 12:37:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/virtio: Add option to disable KMS support
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Rob Clark <robdclark@gmail.com>
References: <20230224180225.2477641-1-robdclark@gmail.com>
 <20230227063821.dg2gbjjwcekbxyzw@sirius.home.kraxel.org>
 <CAF6AEGsv1G7CPSkCPe3iHGB9JEO4iy+bTbkFLoitmx64U78RJw@mail.gmail.com>
 <20230228062809.ccyzgnvizh6jidn4@sirius.home.kraxel.org>
 <87a60yywo0.fsf@minerva.mail-host-address-is-not-set>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87a60yywo0.fsf@minerva.mail-host-address-is-not-set>
Cc: Rob Clark <robdclark@chromium.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Ryan Neph <ryanneph@chromium.org>, David Airlie <airlied@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
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
Content-Type: multipart/mixed; boundary="===============0889274580183008989=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0889274580183008989==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RsIoObxnKMJhcfqRdCJOEN7X"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------RsIoObxnKMJhcfqRdCJOEN7X
Content-Type: multipart/mixed; boundary="------------Bi0tBiUbd3w9YSrozybGDvtq";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Rob Clark <robdclark@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Ryan Neph <ryanneph@chromium.org>, David Airlie <airlied@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Message-ID: <9631930e-3826-ded7-1a45-1d0a285c5195@suse.de>
Subject: Re: [PATCH] drm/virtio: Add option to disable KMS support
References: <20230224180225.2477641-1-robdclark@gmail.com>
 <20230227063821.dg2gbjjwcekbxyzw@sirius.home.kraxel.org>
 <CAF6AEGsv1G7CPSkCPe3iHGB9JEO4iy+bTbkFLoitmx64U78RJw@mail.gmail.com>
 <20230228062809.ccyzgnvizh6jidn4@sirius.home.kraxel.org>
 <87a60yywo0.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87a60yywo0.fsf@minerva.mail-host-address-is-not-set>

--------------Bi0tBiUbd3w9YSrozybGDvtq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjguMDIuMjMgdW0gMTA6MTkgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPiB3cml0ZXM6DQpb
Li4uXQ0KPj4NCj4+IEkgdGhpbmsgaXQgaXMgYSBiYWQgaWRlYSB0byBtYWtlIHRoYXQgYSBj
b21waWxlIHRpbWUgb3B0aW9uLCBJJ2Qgc3VnZ2VzdA0KPj4gYSBydW50aW1lIHN3aXRjaCBp
bnN0ZWFkLCBmb3IgZXhhbXBsZSBhIG1vZHVsZSBwYXJhbWV0ZXIgdG8gYXNrIHRoZQ0KPj4g
ZHJpdmVyIHRvIGlnbm9yZSBhbnkgc2Nhbm91dHMuDQo+Pg0KPiANCj4gSSBkb24ndCB0aGlu
ayB0aGVyZSdzIGEgbmVlZCBmb3IgYSBuZXcgbW9kdWxlIHBhcmFtZXRlciwgdGhlcmUncyBh
bHJlYWR5DQo+IHRoZSB2aXJ0aW8tZ3B1ICdtb2Rlc2V0JyBtb2R1bGUgcGFyYW1ldGVyIHRv
IGVuYWJsZS9kaXNhYmxlIG1vZHNldHRpbmcNCj4gYW5kIHRoZSBnbG9iYWwgJ25vbW9kZXNl
dCcga2VybmVsIGNtZGxpbmUgcGFyYW1ldGVyIHRvIGRvIGl0IGZvciBhbGwgRFJNDQo+IGRy
aXZlcnMuDQo+IA0KPiBDdXJyZW50bHksIG1hbnkgZHJpdmVycyBqdXN0IGZhaWwgdG8gcHJv
YmUgd2hlbiAnbm9tb2Rlc2V0JyBpcyBwcmVzZW50LA0KPiBidXQgb3RoZXJzIG9ubHkgZGlz
YWJsZSBtb2RzZXR0aW5nIGJ1dCBrZWVwIHRoZSByZW5kZXJpbmcgcGFydC4gSW4gZmFjdCwN
Cj4gbW9zdCBEUk0gb25seSBkcml2ZXJzIGp1c3QgaWdub3JlIHRoZSAnbm9tb2Rlc2V0JyBw
YXJhbWV0ZXIuDQoNCkRvIHlvdSBoYXZlIGEgbGlzdCBvZiB0aGVzZSBkcml2ZXJzPyBNYXli
ZSB3ZSBuZWVkIHRvIGFkanVzdCBzZW1hbnRpY3MgDQpzbGlnaHRseS4gUGxlYXNlIHNlZSBt
eSBjb21tZW50IGJlbG93Lg0KDQo+IFdlIGNvdWxkIG1ha2UgdmlydGlvLWdwdSBkcml2ZXIg
dG8gb25seSBkaXNhYmxlIEtNUyB3aXRoIHRoZXNlIHBhcmFtcywNCj4gc29tZXRoaW5nIGxp
a2UgdGhlIGZvbGxvd2luZyAodW50ZXN0ZWQpIHBhdGNoOg0KPiANCj4gIEZyb20gOWNkZGVl
N2Y2OTZmMzdjMzRkODBkNjE2MGU4NzgyN2YzZDdhMDIzNyBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDENCj4gRnJvbTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhh
dC5jb20+DQo+IERhdGU6IFR1ZSwgMjggRmViIDIwMjMgMTA6MDk6MTEgKzAxMDANCj4gU3Vi
amVjdDogW1BBVENIXSBkcm0vdmlydGlvOiBPbmx5IGRpc2FibGUgS01TIHdpdGggbm9tb2Rl
c2V0DQo+IA0KPiBUaGUgdmlydGlvLWdwdSBkcml2ZXIgY3VycmVudGx5IGZhaWxzIHRvIHBy
b2JlIGlmIGVpdGhlciB0aGUgIm5vbW9kZXNldCINCj4ga2VybmVsIGNtZGxpbmUgcGFyYW1l
dGVyIGlzIHVzZWQgb3IgdGhlIG1vZHVsZSAibW9kZXNldCIgcGFyYW1ldGVyIHVzZWQuDQo+
IA0KPiBCdXQgdGhlcmUgbWF5IGJlIGNhc2VzIHdoZXJlIHRoZSByZW5kZXJpbmcgcGFydCBv
ZiB0aGUgZHJpdmVyIGlzIG5lZWRlZA0KPiBhbmQgb25seSB0aGUgbW9kZSBzZXR0aW5nIHBh
cnQgbmVlZHMgdG8gYmUgZGlzYWJsZWQuIFNvIGxldCdzIGNoYW5nZSB0aGUNCj4gbG9naWMg
dG8gb25seSBkaXNhYmxlIHRoZSBLTVMgcGFydCBidXQgc3RpbGwga2VlcCB0aGUgRFJNIHNp
ZGUgb2YgaXQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxs
YXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3Zp
cnRpby92aXJ0Z3B1X2Rpc3BsYXkuYyB8IDE2ICsrKysrKysrKysrKysrKw0KPiAgIGRyaXZl
cnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuYyAgICAgfCAyMyArKysrKysrKysrKysr
Ky0tLS0tLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2ttcy5jICAg
ICB8IDI1ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIDMgZmlsZXMgY2hhbmdlZCwg
MzIgaW5zZXJ0aW9ucygrKSwgMzIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1
L2RybS92aXJ0aW8vdmlydGdwdV9kaXNwbGF5LmMNCj4gaW5kZXggOWVhNzYxMWE5ZTBmLi5l
MTc2ZTVlOGMxYTAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmly
dGdwdV9kaXNwbGF5LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1
X2Rpc3BsYXkuYw0KPiBAQCAtMzM1LDYgKzMzNSwyMiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGRybV9tb2RlX2NvbmZpZ19mdW5jcyB2aXJ0aW9fZ3B1X21vZGVfZnVuY3MgPSB7DQo+ICAg
aW50IHZpcnRpb19ncHVfbW9kZXNldF9pbml0KHN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAq
dmdkZXYpDQo+ICAgew0KPiAgIAlpbnQgaSwgcmV0Ow0KPiArCXUzMiBudW1fc2Nhbm91dHM7
DQo+ICsNCj4gKwlpZiAodmlydGlvX2hhc19mZWF0dXJlKHZnZGV2LT52ZGV2LCBWSVJUSU9f
R1BVX0ZfRURJRCkpIHsNCj4gKwkJdmdkZXYtPmhhc19lZGlkID0gdHJ1ZTsNCj4gKwl9DQo+
ICsNCj4gKwkvKiBnZXQgZGlzcGxheSBpbmZvICovDQo+ICsJdmlydGlvX2NyZWFkX2xlKHZn
ZGV2LT52ZGV2LCBzdHJ1Y3QgdmlydGlvX2dwdV9jb25maWcsDQo+ICsJCQludW1fc2Nhbm91
dHMsICZudW1fc2Nhbm91dHMpOw0KPiArCXZnZGV2LT5udW1fc2Nhbm91dHMgPSBtaW5fdCh1
aW50MzJfdCwgbnVtX3NjYW5vdXRzLA0KPiArCQkJCSAgICBWSVJUSU9fR1BVX01BWF9TQ0FO
T1VUUyk7DQo+ICsJaWYgKCF2Z2Rldi0+bnVtX3NjYW5vdXRzKSB7DQo+ICsJCURSTV9FUlJP
UigibnVtX3NjYW5vdXRzIGlzIHplcm9cbiIpOw0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4g
Kwl9DQo+ICsJRFJNX0lORk8oIm51bWJlciBvZiBzY2Fub3V0czogJWRcbiIsIG51bV9zY2Fu
b3V0cyk7DQo+ICAgDQo+ICAgCXJldCA9IGRybW1fbW9kZV9jb25maWdfaW5pdCh2Z2Rldi0+
ZGRldik7DQo+ICAgCWlmIChyZXQpDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
dmlydGlvL3ZpcnRncHVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVf
ZHJ2LmMNCj4gaW5kZXggYWU5N2I5ODc1MGI2Li45NzliNWIxNzdmNDkgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuYw0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmMNCj4gQEAgLTQwLDcgKzQwLDcgQEAN
Cj4gICANCj4gICAjaW5jbHVkZSAidmlydGdwdV9kcnYuaCINCj4gICANCj4gLXN0YXRpYyBj
b25zdCBzdHJ1Y3QgZHJtX2RyaXZlciBkcml2ZXI7DQo+ICtzdGF0aWMgc3RydWN0IGRybV9k
cml2ZXIgZHJpdmVyOw0KPiAgIA0KPiAgIHN0YXRpYyBpbnQgdmlydGlvX2dwdV9tb2Rlc2V0
ID0gLTE7DQo+ICAgDQo+IEBAIC02OSwxMyArNjksMTIgQEAgc3RhdGljIGludCB2aXJ0aW9f
Z3B1X3BjaV9xdWlyayhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQ0KPiAgIHN0YXRpYyBpbnQg
dmlydGlvX2dwdV9wcm9iZShzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldikNCj4gICB7DQo+
ICAgCXN0cnVjdCBkcm1fZGV2aWNlICpkZXY7DQo+ICsJc3RydWN0IHZpcnRpb19ncHVfZGV2
aWNlICp2Z2RldjsNCj4gICAJaW50IHJldDsNCj4gICANCj4gLQlpZiAoZHJtX2Zpcm13YXJl
X2RyaXZlcnNfb25seSgpICYmIHZpcnRpb19ncHVfbW9kZXNldCA9PSAtMSkNCj4gLQkJcmV0
dXJuIC1FSU5WQUw7DQo+IC0NCj4gLQlpZiAodmlydGlvX2dwdV9tb2Rlc2V0ID09IDApDQo+
IC0JCXJldHVybiAtRUlOVkFMOw0KPiArCWlmICgoZHJtX2Zpcm13YXJlX2RyaXZlcnNfb25s
eSgpICYmIHZpcnRpb19ncHVfbW9kZXNldCA9PSAtMSkgfHwNCj4gKwkgICAgKHZpcnRpb19n
cHVfbW9kZXNldCA9PSAwKSkNCj4gKwkJZHJpdmVyLmRyaXZlcl9mZWF0dXJlcyAmPSB+KERS
SVZFUl9NT0RFU0VUIHwgRFJJVkVSX0FUT01JQyk7DQoNClRoZSBrZXJuZWwtd2lkZSBvcHRp
b24gJ25vbW9kZXNldCcgYWZmZWN0cyBzeXN0ZW0gYmVoYXZpb3IuIEl0J3MgYSANCm1pc25v
bWVyLCBhcyBpdCBhY3R1YWxseSBtZWFucyAnZG9uJ3QgcmVwbGFjZSB0aGUgZmlybXdhcmUt
cHJvdmlkZWQgDQpmcmFtZWJ1ZmZlci4nIFNvIGlmIHlvdSBqdXN0IHNldCB0aGVzZSBmbGFn
cyBoZXJlLCB2aXJ0aW8tZ3B1IHdvdWxkIA0KbGF0ZXIgcmVtb3ZlIHRoZSBmaXJtd2FyZSBk
cml2ZXIgdmlhIGFwZXJ0dXJlIGhlbHBlcnMuIFRoZXJlZm9yZSwgaWYgDQpkcm1fZm9ybXdh
cmVfZHJpdmVyc19vbmx5KCkgcmV0dXJucyB0cnVlLCB3ZSBzaG91bGQgZmFpbCBwcm9iaW5n
IHdpdGggDQotRU5PREVWLg0KDQpCdXQgd2UgY291bGQgdHJ5IHRvIHJlcHVycG9zZSB0aGUg
bW9kdWxlJ3MgJ21vZGVzZXQnIG9wdGlvbi4gSXQncyANCmFscmVhZHkgb2Jzb2xldGVkIGJ5
IG5vbW9kZXNldCBhbnl3YXkuICBJJ2QgdHJ5IHRvIG1ha2UgbW9kZXNldCBpdCBhIA0KYm9v
bGVhbiB0aGF0IGNvbnRyb2xzIG1vZGVzZXR0aW5nIHZzIHJlbmRlci1vbmx5LiBJdCB3aWxs
IHRoZW4gYmUgYWJvdXQgDQp0aGUgZHJpdmVyJ3MgZmVhdHVyZSBzZXQsIHJhdGhlciB0aGFu
IHN5c3RlbSBiZWhhdmlvci4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiAgIA0KPiAg
IAkvKg0KPiAgIAkgKiBUaGUgdmlydGlvLWdwdSBkZXZpY2UgaXMgYSB2aXJ0dWFsIGRldmlj
ZSB0aGF0IGRvZXNuJ3QgaGF2ZSBETUENCj4gQEAgLTk4LDExICs5NywxOSBAQCBzdGF0aWMg
aW50IHZpcnRpb19ncHVfcHJvYmUoc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYpDQo+ICAg
CWlmIChyZXQpDQo+ICAgCQlnb3RvIGVycl9mcmVlOw0KPiAgIA0KPiArCWlmIChkcm1fY29y
ZV9jaGVja19mZWF0dXJlKGRldiwgRFJJVkVSX01PREVTRVQpKSB7DQo+ICsJCXZnZGV2ID0g
ZGV2LT5kZXZfcHJpdmF0ZTsNCj4gKwkJcmV0ID0gdmlydGlvX2dwdV9tb2Rlc2V0X2luaXQo
dmdkZXYpOw0KPiArCQlpZiAocmV0KQ0KPiArCQkJZ290byBlcnJfZGVpbml0Ow0KPiArCX0N
Cj4gKw0KPiAgIAlyZXQgPSBkcm1fZGV2X3JlZ2lzdGVyKGRldiwgMCk7DQo+ICAgCWlmIChy
ZXQpDQo+ICAgCQlnb3RvIGVycl9kZWluaXQ7DQo+ICAgDQo+IC0JZHJtX2ZiZGV2X2dlbmVy
aWNfc2V0dXAodmRldi0+cHJpdiwgMzIpOw0KPiArCWlmIChkcm1fY29yZV9jaGVja19mZWF0
dXJlKGRldiwgRFJJVkVSX01PREVTRVQpKQ0KPiArCQlkcm1fZmJkZXZfZ2VuZXJpY19zZXR1
cCh2ZGV2LT5wcml2LCAzMik7DQo+ICAgCXJldHVybiAwOw0KPiAgIA0KPiAgIGVycl9kZWlu
aXQ6DQo+IEBAIC0xNzEsNyArMTc4LDcgQEAgTU9EVUxFX0FVVEhPUigiQWxvbiBMZXZ5Iik7
DQo+ICAgDQo+ICAgREVGSU5FX0RSTV9HRU1fRk9QUyh2aXJ0aW9fZ3B1X2RyaXZlcl9mb3Bz
KTsNCj4gICANCj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2RyaXZlciBkcml2ZXIgPSB7
DQo+ICtzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIgZHJpdmVyID0gew0KPiAgIAkuZHJpdmVy
X2ZlYXR1cmVzID0gRFJJVkVSX01PREVTRVQgfCBEUklWRVJfR0VNIHwgRFJJVkVSX1JFTkRF
UiB8IERSSVZFUl9BVE9NSUMsDQo+ICAgCS5vcGVuID0gdmlydGlvX2dwdV9kcml2ZXJfb3Bl
biwNCj4gICAJLnBvc3RjbG9zZSA9IHZpcnRpb19ncHVfZHJpdmVyX3Bvc3RjbG9zZSwNCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9rbXMuYyBiL2Ry
aXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9rbXMuYw0KPiBpbmRleCAyN2I3ZjE0ZGFl
ODkuLjJmNWYyYWFjNmI3MSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRp
by92aXJ0Z3B1X2ttcy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdw
dV9rbXMuYw0KPiBAQCAtMTIyLDcgKzEyMiw3IEBAIGludCB2aXJ0aW9fZ3B1X2luaXQoc3Ry
dWN0IHZpcnRpb19kZXZpY2UgKnZkZXYsIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpDQo+ICAg
CXN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAqdmdkZXY7DQo+ICAgCS8qIHRoaXMgd2lsbCBl
eHBhbmQgbGF0ZXIgKi8NCj4gICAJc3RydWN0IHZpcnRxdWV1ZSAqdnFzWzJdOw0KPiAtCXUz
MiBudW1fc2Nhbm91dHMsIG51bV9jYXBzZXRzOw0KPiArCXUzMiBudW1fY2Fwc2V0czsNCj4g
ICAJaW50IHJldCA9IDA7DQo+ICAgDQo+ICAgCWlmICghdmlydGlvX2hhc19mZWF0dXJlKHZk
ZXYsIFZJUlRJT19GX1ZFUlNJT05fMSkpDQo+IEBAIC0xNjEsOSArMTYxLDYgQEAgaW50IHZp
cnRpb19ncHVfaW5pdChzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldiwgc3RydWN0IGRybV9k
ZXZpY2UgKmRldikNCj4gICAJaWYgKHZpcnRpb19oYXNfZmVhdHVyZSh2Z2Rldi0+dmRldiwg
VklSVElPX0dQVV9GX1ZJUkdMKSkNCj4gICAJCXZnZGV2LT5oYXNfdmlyZ2xfM2QgPSB0cnVl
Ow0KPiAgICNlbmRpZg0KPiAtCWlmICh2aXJ0aW9faGFzX2ZlYXR1cmUodmdkZXYtPnZkZXYs
IFZJUlRJT19HUFVfRl9FRElEKSkgew0KPiAtCQl2Z2Rldi0+aGFzX2VkaWQgPSB0cnVlOw0K
PiAtCX0NCj4gICAJaWYgKHZpcnRpb19oYXNfZmVhdHVyZSh2Z2Rldi0+dmRldiwgVklSVElP
X1JJTkdfRl9JTkRJUkVDVF9ERVNDKSkgew0KPiAgIAkJdmdkZXYtPmhhc19pbmRpcmVjdCA9
IHRydWU7DQo+ICAgCX0NCj4gQEAgLTIxOCwyOCArMjE1LDEwIEBAIGludCB2aXJ0aW9fZ3B1
X2luaXQoc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYsIHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYpDQo+ICAgCQlnb3RvIGVycl92YnVmczsNCj4gICAJfQ0KPiAgIA0KPiAtCS8qIGdldCBk
aXNwbGF5IGluZm8gKi8NCj4gLQl2aXJ0aW9fY3JlYWRfbGUodmdkZXYtPnZkZXYsIHN0cnVj
dCB2aXJ0aW9fZ3B1X2NvbmZpZywNCj4gLQkJCW51bV9zY2Fub3V0cywgJm51bV9zY2Fub3V0
cyk7DQo+IC0JdmdkZXYtPm51bV9zY2Fub3V0cyA9IG1pbl90KHVpbnQzMl90LCBudW1fc2Nh
bm91dHMsDQo+IC0JCQkJICAgIFZJUlRJT19HUFVfTUFYX1NDQU5PVVRTKTsNCj4gLQlpZiAo
IXZnZGV2LT5udW1fc2Nhbm91dHMpIHsNCj4gLQkJRFJNX0VSUk9SKCJudW1fc2Nhbm91dHMg
aXMgemVyb1xuIik7DQo+IC0JCXJldCA9IC1FSU5WQUw7DQo+IC0JCWdvdG8gZXJyX3NjYW5v
dXRzOw0KPiAtCX0NCj4gLQlEUk1fSU5GTygibnVtYmVyIG9mIHNjYW5vdXRzOiAlZFxuIiwg
bnVtX3NjYW5vdXRzKTsNCj4gLQ0KPiAgIAl2aXJ0aW9fY3JlYWRfbGUodmdkZXYtPnZkZXYs
IHN0cnVjdCB2aXJ0aW9fZ3B1X2NvbmZpZywNCj4gICAJCQludW1fY2Fwc2V0cywgJm51bV9j
YXBzZXRzKTsNCj4gICAJRFJNX0lORk8oIm51bWJlciBvZiBjYXAgc2V0czogJWRcbiIsIG51
bV9jYXBzZXRzKTsNCj4gICANCj4gLQlyZXQgPSB2aXJ0aW9fZ3B1X21vZGVzZXRfaW5pdCh2
Z2Rldik7DQo+IC0JaWYgKHJldCkgew0KPiAtCQlEUk1fRVJST1IoIm1vZGVzZXQgaW5pdCBm
YWlsZWRcbiIpOw0KPiAtCQlnb3RvIGVycl9zY2Fub3V0czsNCj4gLQl9DQo+IC0NCj4gICAJ
dmlydGlvX2RldmljZV9yZWFkeSh2Z2Rldi0+dmRldik7DQo+ICAgDQo+ICAgCWlmIChudW1f
Y2Fwc2V0cykNCj4gQEAgLTI1Miw4ICsyMzEsNiBAQCBpbnQgdmlydGlvX2dwdV9pbml0KHN0
cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2LCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQ0KPiAg
IAkJCSAgIDUgKiBIWik7DQo+ICAgCXJldHVybiAwOw0KPiAgIA0KPiAtZXJyX3NjYW5vdXRz
Og0KPiAtCXZpcnRpb19ncHVfZnJlZV92YnVmcyh2Z2Rldik7DQo+ICAgZXJyX3ZidWZzOg0K
PiAgIAl2Z2Rldi0+dmRldi0+Y29uZmlnLT5kZWxfdnFzKHZnZGV2LT52ZGV2KTsNCj4gICBl
cnJfdnFzOg0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2
ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRz
dHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5i
ZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------Bi0tBiUbd3w9YSrozybGDvtq--

--------------RsIoObxnKMJhcfqRdCJOEN7X
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmP954IFAwAAAAAACgkQlh/E3EQov+Cu
XRAAh81RbYmcF+kNBL3/IL2r+r0QRGI/v6Lkas2TxhYX7WYlvQaKXzbThQvupQWrS1Opliqf26s3
myR1ROkoQ23KBoiYGmr3w4AvY7/RvEom/9GocLj/pPmEt/GzCqZdB8yEuYG17MlFBRC9bKgwJrHh
sRH2zKnbMnc742YJRcopr78+Hnaiuk0NtkWwaKz4yw3bepushl8dE+r/7VaXRTXXBD1g5rPUmenh
GLKHiP9wGLRSQbclocxrp+s0csBpW8KRynlRtkZYjh7u+h262I9JXouu82N5RSGK49dCXt+eh8EK
Z9krc0i+ZmvGDli7hk0coa5LhkIAXmD2C8SMTUPE7JENnd1i/1+FiuWe7auYghd92YuJc0931OeM
Arq4r63gRjAYKXVauMPN6sdhHCc8icY2sKKRB9M8CVoCaWXiwXsG4+EzrF7YqYK9wPCuhHussdlt
Ba1yIS76j2EAvvkcctHJrtloyOqnCvV0ntNSSKQD7GU3uRGUp81Ent09biqGfeZYgqxOvqmbaFZb
3/6zPr71K22gh+EtxRtuLIhqOm1AflDdQan5grWwjAOOUSE6fuHRb2FI7M2KSSjso+xeY5hU0Zbg
eFIgAVxtjZFEa9v4ZpF0PfKX4+rJEkU4c4vd7oSESR387S3PHOBwOUBezSrvYH9h3q+dwG4O7BIk
MAM=
=qZnP
-----END PGP SIGNATURE-----

--------------RsIoObxnKMJhcfqRdCJOEN7X--

--===============0889274580183008989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============0889274580183008989==--
