Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B83AC58C823
	for <lists.virtualization@lfdr.de>; Mon,  8 Aug 2022 14:07:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2631401A0;
	Mon,  8 Aug 2022 12:07:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2631401A0
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=I9gQhihl;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=DlxfPkYP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WHs2n7ncynbn; Mon,  8 Aug 2022 12:07:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0D25340121;
	Mon,  8 Aug 2022 12:07:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D25340121
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2FE55C007B;
	Mon,  8 Aug 2022 12:07:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 06D1BC002D
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Aug 2022 12:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E19DB414CC
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Aug 2022 12:07:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E19DB414CC
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=I9gQhihl; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=DlxfPkYP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c8teZ_ee0TPZ
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Aug 2022 12:07:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09829414C2
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09829414C2
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Aug 2022 12:07:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7B7883512B;
 Mon,  8 Aug 2022 12:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659960458; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ntEvR2xGBivypACrealeYtEKz8btQeRBrnTrrj37N1I=;
 b=I9gQhihly1n58t2dks9N0vPeEQ9Ce/fFaKsdZculUGGZWQPBKxwdyp7rY80GQNfrKJcD3m
 advmgV64ZIoYQz9QBMFmviUAuwUerxWqpe+QeeDJi5Y4zYDxy6r9YkvZuJY0g9aTsbHFmh
 VbKQgjOslUdpu1DSSbykT2iplr7JFeo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659960458;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ntEvR2xGBivypACrealeYtEKz8btQeRBrnTrrj37N1I=;
 b=DlxfPkYPQvmK+8hiZgiVJgti8T7YFYW65crRtu599Ej4v8c8eAFBsonwnYRxhMOpyv8GBI
 B8JSCyJTUpTupNBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D1F7A13A7C;
 Mon,  8 Aug 2022 12:07:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tplaMon88GIwPAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 08 Aug 2022 12:07:37 +0000
Message-ID: <b9397fd7-4b13-5b41-79e9-d002a5db3eec@suse.de>
Date: Mon, 8 Aug 2022 14:07:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Subject: Re: [PATCH 02/12] drm/format-helper: Merge drm_fb_memcpy() and
 drm_fb_memcpy_toio()
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
References: <20220727113312.22407-1-tzimmermann@suse.de>
 <20220727113312.22407-3-tzimmermann@suse.de> <YuwjdhGaW1tTFLyU@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YuwjdhGaW1tTFLyU@ravnborg.org>
Cc: linux-hyperv@vger.kernel.org, david@lechnology.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 javierm@redhat.com, mripard@kernel.org,
 virtualization@lists.linux-foundation.org, drawat.floss@gmail.com,
 noralf@tronnes.org, daniel@ffwll.ch, jose.exposito89@gmail.com,
 airlied@redhat.com
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
Content-Type: multipart/mixed; boundary="===============2057185157429277919=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2057185157429277919==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------u4oG66an7JNCoJZOm9A063sy"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------u4oG66an7JNCoJZOm9A063sy
Content-Type: multipart/mixed; boundary="------------ppyaxKPHatnQ6vZEcVCwgZ0l";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: noralf@tronnes.org, daniel@ffwll.ch, airlied@linux.ie,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, airlied@redhat.com,
 javierm@redhat.com, drawat.floss@gmail.com, kraxel@redhat.com,
 david@lechnology.com, jose.exposito89@gmail.com,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux-foundation.org
Message-ID: <b9397fd7-4b13-5b41-79e9-d002a5db3eec@suse.de>
Subject: Re: [PATCH 02/12] drm/format-helper: Merge drm_fb_memcpy() and
 drm_fb_memcpy_toio()
References: <20220727113312.22407-1-tzimmermann@suse.de>
 <20220727113312.22407-3-tzimmermann@suse.de> <YuwjdhGaW1tTFLyU@ravnborg.org>
In-Reply-To: <YuwjdhGaW1tTFLyU@ravnborg.org>

--------------ppyaxKPHatnQ6vZEcVCwgZ0l
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU2FtLA0KDQp0aGFua3MgZm9yIHJldmlld2luZyB0aGUgcGF0Y2hzZXQuDQoNCkFtIDA0
LjA4LjIyIHVtIDIxOjUyIHNjaHJpZWIgU2FtIFJhdm5ib3JnOg0KPiBIaSBUaG9tYXMsDQo+
IA0KPiBPbiBXZWQsIEp1bCAyNywgMjAyMiBhdCAwMTozMzowMlBNICswMjAwLCBUaG9tYXMg
WmltbWVybWFubiB3cm90ZToNCj4+IE1lcmdlIGRybV9mYl9tZW1jcHkoKSBhbmQgZHJtX2Zi
X21lbWNweSgpIGludG8gZHJtX2ZiX21lbWNweSgpIHRoYXQNCj4gT25lIG9mIHRoZXNlIGlz
IGRybV9mYl9tZW1jcHlfdG9pbygpDQoNCkkgaGFkIHRvIGxhdWdoIHdoZW4gSSByZS1yZWFk
IG15IG1pc3Rha2UuDQoNCj4+IHVzZXMgc3RydWN0IGlvc3lzX21hcCBmb3IgYnVmZmVycy4g
VGhlIG5ldyBmdW5jdGlvbiBhbHNvIHN1cHBvcnRzDQo+PiBtdWx0aS1wbGFuZSBjb2xvciBm
b3JtYXRzLiBDb252ZXJ0IGFsbCB1c2VycyBvZiB0aGUgb3JpZ2luYWwgaGVscGVycy4NCj4g
DQo+IEEgZmV3IGNvbW1lbnRzIGluIHRoZSBwYXRjaCBiZWxvdy4NCj4gDQo+IAlTYW0NCj4g
DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5u
QHN1c2UuZGU+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9mb3JtYXRfaGVs
cGVyLmMgICAgICAgICB8IDc3ICsrKysrKysrKy0tLS0tLS0tLS0tLQ0KPj4gICBkcml2ZXJz
L2dwdS9kcm0vZHJtX21pcGlfZGJpLmMgICAgICAgICAgICAgIHwgIDMgKy0NCj4+ICAgZHJp
dmVycy9ncHUvZHJtL2d1ZC9ndWRfcGlwZS5jICAgICAgICAgICAgICB8ICA0ICstDQo+PiAg
IGRyaXZlcnMvZ3B1L2RybS9oeXBlcnYvaHlwZXJ2X2RybV9tb2Rlc2V0LmMgfCAxMSArLS0N
Cj4+ICAgZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmMgICAgICB8IDEx
ICstLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vdGlueS9jaXJydXMuYyAgICAgICAgICAgICAg
IHwgMjEgKysrLS0tDQo+PiAgIGluY2x1ZGUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmggICAg
ICAgICAgICAgfCAgNyArLQ0KPj4gICA3IGZpbGVzIGNoYW5nZWQsIDYzIGluc2VydGlvbnMo
KyksIDcxIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2Zvcm1hdF9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZm9ybWF0X2hl
bHBlci5jDQo+PiBpbmRleCA0ZDc0ZDQ2YWIxNTUuLjQ5NTg5YjQ0MmYxOCAxMDA2NDQNCj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZm9ybWF0X2hlbHBlci5jDQo+PiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuYw0KPj4gQEAgLTEzMSw2MyArMTMx
LDQ4IEBAIHN0YXRpYyBpbnQgZHJtX2ZiX3hmcm1fdG9pbyh2b2lkIF9faW9tZW0gKmRzdCwg
dW5zaWduZWQgbG9uZyBkc3RfcGl0Y2gsIHVuc2lnbmVkDQo+PiAgIA0KPj4gICAvKioNCj4+
ICAgICogZHJtX2ZiX21lbWNweSAtIENvcHkgY2xpcCBidWZmZXINCj4+IC0gKiBAZHN0OiBE
ZXN0aW5hdGlvbiBidWZmZXINCj4+IC0gKiBAZHN0X3BpdGNoOiBOdW1iZXIgb2YgYnl0ZXMg
YmV0d2VlbiB0d28gY29uc2VjdXRpdmUgc2NhbmxpbmVzIHdpdGhpbiBkc3QNCj4+IC0gKiBA
dmFkZHI6IFNvdXJjZSBidWZmZXINCj4+ICsgKiBAZHN0OiBBcnJheSBvZiBkZXN0aW5hdGlv
biBidWZmZXJzDQo+PiArICogQGRzdF9waXRjaDogQXJyYXkgb2YgbnVtYmVycyBvZiBieXRl
cyBiZXR3ZWVuIHR3byBjb25zZWN1dGl2ZSBzY2FubGluZXMgd2l0aGluIGRzdA0KPiBEb2N1
bWVudCB0aGF0IHRoaXMgbWF5IGJlIE5VTEwsIGluIHdoaWNoIGNhc2UgdGhlIGRpc3RhbmNl
IGlzIGNvbnNpZGVyZWQNCj4gMC4NCg0KV2lsbCBiZSBpbiB0aGUgbmV4dCBpdGVyYXRpb24u
DQoNCj4gDQo+PiArICogQHZtYXA6IEFycmF5IG9mIHNvdXJjZSBidWZmZXJzDQo+IEl0IHdv
dWxkIGhhdmUgaGVscGVkIG15IHVuZGVyc3RhbmRpbmcgaWYgdGhpcyBhcmd1bWVudCB3YXMg
bmFtZWQgc3JjLA0KPiBzbyBpdCBpcyBhIGxpdHRsZSBtb3JlIG9idmlvdXMgdGhhdCB3ZSBj
b3B5IGZyb20gc3JjIHRvIGRzdC4NCj4gTWF5YmUgZG9jdW1lbnQgdGhhdCBkYXRhIGlzIGNv
cGllZCBmcm9tIHNyYyBiYXNlZCBvbiB0aGUgcGl0Y2ggaW5mbyBpbg0KPiB0aGUgZnJhbWVi
dWZmZXIsIGFuZCBsaWtld2lzZSB0aGUgZm9ybWF0X2luZm8gaW4gdGhlIGZyYW1lYnVmZmVy
Lg0KPiANCj4+ICAgICogQGZiOiBEUk0gZnJhbWVidWZmZXINCj4+ICAgICogQGNsaXA6IENs
aXAgcmVjdGFuZ2xlIGFyZWEgdG8gY29weQ0KPj4gICAgKg0KPj4gICAgKiBUaGlzIGZ1bmN0
aW9uIGRvZXMgbm90IGFwcGx5IGNsaXBwaW5nIG9uIGRzdCwgaS5lLiB0aGUgZGVzdGluYXRp
b24NCj4+ICAgICogaXMgYXQgdGhlIHRvcC1sZWZ0IGNvcm5lci4NCj4+ICAgICovDQo+PiAt
dm9pZCBkcm1fZmJfbWVtY3B5KHZvaWQgKmRzdCwgdW5zaWduZWQgaW50IGRzdF9waXRjaCwg
Y29uc3Qgdm9pZCAqdmFkZHIsDQo+PiAtCQkgICBjb25zdCBzdHJ1Y3QgZHJtX2ZyYW1lYnVm
ZmVyICpmYiwgY29uc3Qgc3RydWN0IGRybV9yZWN0ICpjbGlwKQ0KPj4gK3ZvaWQgZHJtX2Zi
X21lbWNweShzdHJ1Y3QgaW9zeXNfbWFwICpkc3QsIGNvbnN0IHVuc2lnbmVkIGludCAqZHN0
X3BpdGNoLA0KPj4gKwkJICAgY29uc3Qgc3RydWN0IGlvc3lzX21hcCAqdm1hcCwgY29uc3Qg
c3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIsDQo+PiArCQkgICBjb25zdCBzdHJ1Y3QgZHJt
X3JlY3QgKmNsaXApDQo+PiAgIHsNCj4+IC0JdW5zaWduZWQgaW50IGNwcCA9IGZiLT5mb3Jt
YXQtPmNwcFswXTsNCj4+IC0Jc2l6ZV90IGxlbiA9IChjbGlwLT54MiAtIGNsaXAtPngxKSAq
IGNwcDsNCj4+IC0JdW5zaWduZWQgaW50IHksIGxpbmVzID0gY2xpcC0+eTIgLSBjbGlwLT55
MTsNCj4+IC0NCj4+IC0JaWYgKCFkc3RfcGl0Y2gpDQo+PiAtCQlkc3RfcGl0Y2ggPSBsZW47
DQo+PiArCXN0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgZGVmYXVsdF9kc3RfcGl0Y2hbRFJN
X0ZPUk1BVF9NQVhfUExBTkVTXSA9IHsNCj4+ICsJCTAsIDAsIDAsIDANCj4+ICsJfTsNCj4g
VGhpcyBpcyB1c2VkIGluIHNldmVyYWwgcGxhY2VzIGluIHRoaXMgc2VyaWVzLiBXaGF0IEkg
cmVhZCBpcyB0aGF0IGEgc3RhdGljDQo+IHZhcmlhYmxlIGlzIGRlY2xhcmVkIHdoZXJlIHRo
ZSBmaXJzdCBlbGVtZW50IGluIHRoZSBhcnJheSBpcyBzZXQgdG8gYWxsIHplcm9lcy4NCj4g
QnV0IHRoZSBvdGhlciBlbGVtZW50cyBpbiB0aGUgYXJyYXkgYXJlIGlnbm9yZWQgLSBidXQg
c2luY2UgaXQgaXMgc3RhdGljDQo+IHRoZXkgYXJlIGFsc28gc2V0IHRvIDAgc28gd2UgYXJl
IGdvb2QgaGVyZS4NCj4gSW4gc29tZSBjYXNlcyBJIHNlZSBpdCByZW1vdmVkIGFnYWluLCBJ
IGRpZCBub3QgY2hlY2sgdGhlIGVuZCByZXN1bHQgaWYNCj4gd2UgZW5kIHVwIGRyb3BwaW5n
IHRoZW0gYWxsIGFnYWluLg0KPiANCj4+ICAgDQo+PiAtCXZhZGRyICs9IGNsaXBfb2Zmc2V0
KGNsaXAsIGZiLT5waXRjaGVzWzBdLCBjcHApOw0KPj4gLQlmb3IgKHkgPSAwOyB5IDwgbGlu
ZXM7IHkrKykgew0KPj4gLQkJbWVtY3B5KGRzdCwgdmFkZHIsIGxlbik7DQo+PiAtCQl2YWRk
ciArPSBmYi0+cGl0Y2hlc1swXTsNCj4+IC0JCWRzdCArPSBkc3RfcGl0Y2g7DQo+PiAtCX0N
Cj4+IC19DQo+PiAtRVhQT1JUX1NZTUJPTChkcm1fZmJfbWVtY3B5KTsNCj4+IC0NCj4+IC0v
KioNCj4+IC0gKiBkcm1fZmJfbWVtY3B5X3RvaW8gLSBDb3B5IGNsaXAgYnVmZmVyDQo+PiAt
ICogQGRzdDogRGVzdGluYXRpb24gYnVmZmVyIChpb21lbSkNCj4+IC0gKiBAZHN0X3BpdGNo
OiBOdW1iZXIgb2YgYnl0ZXMgYmV0d2VlbiB0d28gY29uc2VjdXRpdmUgc2NhbmxpbmVzIHdp
dGhpbiBkc3QNCj4+IC0gKiBAdmFkZHI6IFNvdXJjZSBidWZmZXINCj4+IC0gKiBAZmI6IERS
TSBmcmFtZWJ1ZmZlcg0KPj4gLSAqIEBjbGlwOiBDbGlwIHJlY3RhbmdsZSBhcmVhIHRvIGNv
cHkNCj4+IC0gKg0KPj4gLSAqIFRoaXMgZnVuY3Rpb24gZG9lcyBub3QgYXBwbHkgY2xpcHBp
bmcgb24gZHN0LCBpLmUuIHRoZSBkZXN0aW5hdGlvbg0KPj4gLSAqIGlzIGF0IHRoZSB0b3At
bGVmdCBjb3JuZXIuDQo+PiAtICovDQo+PiAtdm9pZCBkcm1fZmJfbWVtY3B5X3RvaW8odm9p
ZCBfX2lvbWVtICpkc3QsIHVuc2lnbmVkIGludCBkc3RfcGl0Y2gsIGNvbnN0IHZvaWQgKnZh
ZGRyLA0KPj4gLQkJCWNvbnN0IHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLCBjb25zdCBz
dHJ1Y3QgZHJtX3JlY3QgKmNsaXApDQo+PiAtew0KPj4gLQl1bnNpZ25lZCBpbnQgY3BwID0g
ZmItPmZvcm1hdC0+Y3BwWzBdOw0KPj4gLQlzaXplX3QgbGVuID0gKGNsaXAtPngyIC0gY2xp
cC0+eDEpICogY3BwOw0KPj4gLQl1bnNpZ25lZCBpbnQgeSwgbGluZXMgPSBjbGlwLT55MiAt
IGNsaXAtPnkxOw0KPj4gKwljb25zdCBzdHJ1Y3QgZHJtX2Zvcm1hdF9pbmZvICpmb3JtYXQg
PSBmYi0+Zm9ybWF0Ow0KPj4gKwl1bnNpZ25lZCBpbnQgaSwgeSwgbGluZXMgPSBkcm1fcmVj
dF9oZWlnaHQoY2xpcCk7DQo+PiAgIA0KPj4gICAJaWYgKCFkc3RfcGl0Y2gpDQo+PiAtCQlk
c3RfcGl0Y2ggPSBsZW47DQo+PiAtDQo+PiAtCXZhZGRyICs9IGNsaXBfb2Zmc2V0KGNsaXAs
IGZiLT5waXRjaGVzWzBdLCBjcHApOw0KPj4gLQlmb3IgKHkgPSAwOyB5IDwgbGluZXM7IHkr
Kykgew0KPj4gLQkJbWVtY3B5X3RvaW8oZHN0LCB2YWRkciwgbGVuKTsNCj4+IC0JCXZhZGRy
ICs9IGZiLT5waXRjaGVzWzBdOw0KPj4gLQkJZHN0ICs9IGRzdF9waXRjaDsNCj4+ICsJCWRz
dF9waXRjaCA9IGRlZmF1bHRfZHN0X3BpdGNoOw0KPj4gKw0KPj4gKwlmb3IgKGkgPSAwOyBp
IDwgZm9ybWF0LT5udW1fcGxhbmVzOyArK2kpIHsNCj4+ICsJCXVuc2lnbmVkIGludCBjcHBf
aSA9IGZvcm1hdC0+Y3BwW2ldOw0KPiAJCXVuc2lnbmVkIGludCBjcHBfaSA9IGRybV9mb3Jt
YXRfaW5mb19icHAoZm9ybWF0LCBpKSAvIDg7DQo+IA0KPiBUaGlzIGF2b2lkIGFkZGluZyBt
b3JlIHVzZXMgb2YgdGhlIGRlcHJlY2F0ZWQgY3BwW10gYXJyYXkuDQoNCkFuIGFkZGl0aW9u
YWwgbm90ZTogSSBjaGFuZ2VkIHRoaXMgaW4gYWxsIHRoZSBwYXRjaGVzLiBUaGUgY29ycmVj
dCBmb3JtIGlzDQoNCiAgIERJVl9ST1VORF9VUChkcm1fZm9ybWF0X2luZm9fYnBwKCksIDgp
IC8vIGZvciBwaXhlbHMNCg0Kb3INCg0KICAgRElWX1JPVU5EX1VQKGRybV9mb3JtYXRfaW5m
b19icHAoKSAqIHdpZHRoLCA4KSAgIC8vIGZvciBzY2FubGluZXMNCg0KanVzdCBpbiBjYXNl
IHRoYXQgd2UgZXZlciBnZXQgbm9uLWFsaWduZWQgcGl4ZWxzLg0KDQo+IA0KPj4gKwkJc2l6
ZV90IGxlbl9pID0gZHJtX3JlY3Rfd2lkdGgoY2xpcCkgKiBjcHBfaTsNCj4+ICsJCXVuc2ln
bmVkIGludCBkc3RfcGl0Y2hfaSA9IGRzdF9waXRjaFtpXTsNCj4+ICsJCXN0cnVjdCBpb3N5
c19tYXAgZHN0X2kgPSBkc3RbaV07DQo+PiArCQlzdHJ1Y3QgaW9zeXNfbWFwIHZtYXBfaSA9
IHZtYXBbaV07DQo+IFdBUk5fT05fT05DRShkc3RfaSA9PSBOVUxMKT8NCj4gV0FSTl9PTl9P
TkNFKHZtYXBfaSA9PSBOVUxMKT8NCj4gT3Igc29tZXRoaW5nIGVsc2Ugc28gd2UgZXJyb3Ig
b3V0IHNvbWVob3cgaWYgd2UgZG8gbm90IGhhdmUgZW5vdWdoDQoNCj4gcGxhbmVzIGluIGRz
dCBvciBzcmMgKHZtYXApLg0KDQpJJ2xsIGFkZCBhIHBhdGNoIHRvIHJlbmFtZSB2bWFwIHRv
IHNyYy4gVGhlIGN1cnJlbnQgbmFtZSBjb21lcyBmcm9tIA0KJ21hcHBpbmcgaW4gdmlydHVh
bCBtZW1vcnknLiBJdCdzIG5vdCByZWxhdGVkIHRvIHN5c3RlbSBtZW1vcnkuIEl0IHdhcyAN
CnVzZWQgYmVjYXVzZSB0aGF0J3MgaXRzIG5hbWUgaW4gbWFueSBvdGhlciBwbGFjZXMuIEJ1
dCBzcmMgaXMgbXVjaCANCmJldHRlciBmb3IgdGhlIGZvcm1hdCBoZWxwZXJzLg0KDQo+IA0K
Pj4gKw0KPj4gKwkJaWYgKCFkc3RfcGl0Y2hfaSkNCj4+ICsJCQlkc3RfcGl0Y2hfaSA9IGxl
bl9pOw0KPiAJCUlmIHRoZXJlIGNhbiBiZSBOVUxMIGluIHRoZSBkc3RfcGl0Y2ggYXJyYXks
IHRoaXMgc2hvdWxkIGJlDQo+IAkJZG9jdW1lbnRlZCBhYm92ZSBJIHRoaW5rLg0KPiAJCUkg
ZG8gbm90IGxpa2UgdGhlIGN1cnJlbnQgZHN0IHBpdGNoIHdvcmthcm91bmQsIGJ1dCBJDQo+
IAkJZmFpbGVkIHRvIGNvbWUgdXAgd2l0aCBzb21ldGhpbmcgYmV0dGVyLg0KPj4gKw0KPj4g
KwkJaW9zeXNfbWFwX2luY3IoJnZtYXBfaSwgY2xpcF9vZmZzZXQoY2xpcCwgZmItPnBpdGNo
ZXNbaV0sIGNwcF9pKSk7DQo+PiArCQlmb3IgKHkgPSAwOyB5IDwgbGluZXM7IHkrKykgew0K
Pj4gKwkJCWlvc3lzX21hcF9tZW1jcHlfdG8oJmRzdF9pLCAwLCB2bWFwX2kudmFkZHIsIGxl
bl9pKTsNCj4gVGhpcyBoYXJkY29kZXMgKHZtYXBfaS52YWRkcikgdGhhdCB2bWFwIChzcmMp
IGlzIHN5c3RlbSBtZW1vcnkuIEZyb20gYSBxdWljayBsb29rIHRoaXMNCj4gaXMgbm90IGZp
eGVkIGluIGEgbGF0ZXIgcGF0Y2guIEF0IG1pbmltdW0gYWRkIGEgVE9ETyBlbnRyeSBoZXJl
Lg0KPiANCj4+ICsJCQlpb3N5c19tYXBfaW5jcigmdm1hcF9pLCBmYi0+cGl0Y2hlc1tpXSk7
DQo+PiArCQkJaW9zeXNfbWFwX2luY3IoJmRzdF9pLCBkc3RfcGl0Y2hfaSk7DQo+PiArCQl9
DQo+PiAgIAl9DQo+PiAgIH0NCj4+IC1FWFBPUlRfU1lNQk9MKGRybV9mYl9tZW1jcHlfdG9p
byk7DQo+PiArRVhQT1JUX1NZTUJPTChkcm1fZmJfbWVtY3B5KTsNCj4+ICAgDQo+PiAgIHN0
YXRpYyB2b2lkIGRybV9mYl9zd2FiMTZfbGluZSh2b2lkICpkYnVmLCBjb25zdCB2b2lkICpz
YnVmLCB1bnNpZ25lZCBpbnQgcGl4ZWxzKQ0KPj4gICB7DQo+PiBAQCAtNTg0LDcgKzU2OSw3
IEBAIGludCBkcm1fZmJfYmxpdChzdHJ1Y3QgaW9zeXNfbWFwICpkc3QsIGNvbnN0IHVuc2ln
bmVkIGludCAqZHN0X3BpdGNoLCB1aW50MzJfdCBkDQo+PiAgIAkJZHN0X2Zvcm1hdCA9IERS
TV9GT1JNQVRfWFJHQjIxMDEwMTA7DQo+PiAgIA0KPj4gICAJaWYgKGRzdF9mb3JtYXQgPT0g
ZmJfZm9ybWF0KSB7DQo+PiAtCQlkcm1fZmJfbWVtY3B5X3RvaW8oZHN0WzBdLnZhZGRyX2lv
bWVtLCBkc3RfcGl0Y2hbMF0sIHZtYXBbMF0udmFkZHIsIGZiLCBjbGlwKTsNCj4+ICsJCWRy
bV9mYl9tZW1jcHkoZHN0LCBkc3RfcGl0Y2gsIHZtYXAsIGZiLCBjbGlwKTsNCj4+ICAgCQly
ZXR1cm4gMDsNCj4+ICAgDQo+PiAgIAl9IGVsc2UgaWYgKGRzdF9mb3JtYXQgPT0gRFJNX0ZP
Uk1BVF9SR0I1NjUpIHsNCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21p
cGlfZGJpLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21pcGlfZGJpLmMNCj4+IGluZGV4IDJm
NjFmNTNkNDcyZi4uMjI0NTE4MDZmYjVjIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9taXBpX2RiaS5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21pcGlf
ZGJpLmMNCj4+IEBAIC0yMDUsNiArMjA1LDcgQEAgaW50IG1pcGlfZGJpX2J1Zl9jb3B5KHZv
aWQgKmRzdCwgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIsDQo+PiAgIAlzdHJ1Y3QgZHJt
X2dlbV9vYmplY3QgKmdlbSA9IGRybV9nZW1fZmJfZ2V0X29iaihmYiwgMCk7DQo+PiAgIAlz
dHJ1Y3QgaW9zeXNfbWFwIG1hcFtEUk1fRk9STUFUX01BWF9QTEFORVNdOw0KPj4gICAJc3Ry
dWN0IGlvc3lzX21hcCBkYXRhW0RSTV9GT1JNQVRfTUFYX1BMQU5FU107DQo+PiArCXN0cnVj
dCBpb3N5c19tYXAgZHN0X21hcCA9IElPU1lTX01BUF9JTklUX1ZBRERSKGRzdCk7DQo+PiAg
IAl2b2lkICpzcmM7DQo+PiAgIAlpbnQgcmV0Ow0KPj4gICANCj4+IEBAIC0yMjIsNyArMjIz
LDcgQEAgaW50IG1pcGlfZGJpX2J1Zl9jb3B5KHZvaWQgKmRzdCwgc3RydWN0IGRybV9mcmFt
ZWJ1ZmZlciAqZmIsDQo+PiAgIAkJaWYgKHN3YXApDQo+PiAgIAkJCWRybV9mYl9zd2FiKGRz
dCwgMCwgc3JjLCBmYiwgY2xpcCwgIWdlbS0+aW1wb3J0X2F0dGFjaCk7DQo+PiAgIAkJZWxz
ZQ0KPj4gLQkJCWRybV9mYl9tZW1jcHkoZHN0LCAwLCBzcmMsIGZiLCBjbGlwKTsNCj4+ICsJ
CQlkcm1fZmJfbWVtY3B5KCZkc3RfbWFwLCBOVUxMLCBkYXRhLCBmYiwgY2xpcCk7DQo+PiAg
IAkJYnJlYWs7DQo+PiAgIAljYXNlIERSTV9GT1JNQVRfWFJHQjg4ODg6DQo+PiAgIAkJZHJt
X2ZiX3hyZ2I4ODg4X3RvX3JnYjU2NShkc3QsIDAsIHNyYywgZmIsIGNsaXAsIHN3YXApOw0K
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ndWQvZ3VkX3BpcGUuYyBiL2RyaXZl
cnMvZ3B1L2RybS9ndWQvZ3VkX3BpcGUuYw0KPj4gaW5kZXggZDQyNTkyZjZkYWFiLi40NDlj
OTVhNGFlZTAgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9waXBl
LmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ndWQvZ3VkX3BpcGUuYw0KPj4gQEAgLTE1
Niw2ICsxNTYsNyBAQCBzdGF0aWMgaW50IGd1ZF9wcmVwX2ZsdXNoKHN0cnVjdCBndWRfZGV2
aWNlICpnZHJtLCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiwNCj4+ICAgCXU4IGNvbXBy
ZXNzaW9uID0gZ2RybS0+Y29tcHJlc3Npb247DQo+PiAgIAlzdHJ1Y3QgaW9zeXNfbWFwIG1h
cFtEUk1fRk9STUFUX01BWF9QTEFORVNdOw0KPj4gICAJc3RydWN0IGlvc3lzX21hcCBtYXBf
ZGF0YVtEUk1fRk9STUFUX01BWF9QTEFORVNdOw0KPj4gKwlzdHJ1Y3QgaW9zeXNfbWFwIGRz
dDsNCj4+ICAgCXZvaWQgKnZhZGRyLCAqYnVmOw0KPj4gICAJc2l6ZV90IHBpdGNoLCBsZW47
DQo+PiAgIAlpbnQgcmV0ID0gMDsNCj4+IEBAIC0xNzksNiArMTgwLDcgQEAgc3RhdGljIGlu
dCBndWRfcHJlcF9mbHVzaChzdHJ1Y3QgZ3VkX2RldmljZSAqZ2RybSwgc3RydWN0IGRybV9m
cmFtZWJ1ZmZlciAqZmIsDQo+PiAgIAkJYnVmID0gZ2RybS0+Y29tcHJlc3NfYnVmOw0KPj4g
ICAJZWxzZQ0KPj4gICAJCWJ1ZiA9IGdkcm0tPmJ1bGtfYnVmOw0KPj4gKwlpb3N5c19tYXBf
c2V0X3ZhZGRyKCZkc3QsIGJ1Zik7DQo+PiAgIA0KPj4gICAJLyoNCj4+ICAgCSAqIEltcG9y
dGVkIGJ1ZmZlcnMgYXJlIGFzc3VtZWQgdG8gYmUgd3JpdGUtY29tYmluZWQgYW5kIHRodXMg
dW5jYWNoZWQNCj4+IEBAIC0yMDgsNyArMjEwLDcgQEAgc3RhdGljIGludCBndWRfcHJlcF9m
bHVzaChzdHJ1Y3QgZ3VkX2RldmljZSAqZ2RybSwgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAq
ZmIsDQo+PiAgIAkJLyogY2FuIGNvbXByZXNzIGRpcmVjdGx5IGZyb20gdGhlIGZyYW1lYnVm
ZmVyICovDQo+PiAgIAkJYnVmID0gdmFkZHIgKyByZWN0LT55MSAqIHBpdGNoOw0KPj4gICAJ
fSBlbHNlIHsNCj4+IC0JCWRybV9mYl9tZW1jcHkoYnVmLCAwLCB2YWRkciwgZmIsIHJlY3Qp
Ow0KPj4gKwkJZHJtX2ZiX21lbWNweSgmZHN0LCBOVUxMLCBtYXBfZGF0YSwgZmIsIHJlY3Qp
Ow0KPj4NCj4+ICAgCW1lbXNldChyZXEsIDAsIHNpemVvZigqcmVxKSk7DQo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2h5cGVydi9oeXBlcnZfZHJtX21vZGVzZXQuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9oeXBlcnYvaHlwZXJ2X2RybV9tb2Rlc2V0LmMNCj4+IGluZGV4IGI4
ZTY0ZGQ4ZDNhNi4uMjZlNjMxNDhlMjI2IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2h5cGVydi9oeXBlcnZfZHJtX21vZGVzZXQuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2h5cGVydi9oeXBlcnZfZHJtX21vZGVzZXQuYw0KPj4gQEAgLTIxLDE5ICsyMSwyMCBA
QA0KPj4gICAjaW5jbHVkZSAiaHlwZXJ2X2RybS5oIg0KPj4gICANCj4+ICAgc3RhdGljIGlu
dCBoeXBlcnZfYmxpdF90b192cmFtX3JlY3Qoc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIs
DQo+PiAtCQkJCSAgICBjb25zdCBzdHJ1Y3QgaW9zeXNfbWFwICptYXAsDQo+PiArCQkJCSAg
ICBjb25zdCBzdHJ1Y3QgaW9zeXNfbWFwICp2bWFwLA0KPj4gICAJCQkJICAgIHN0cnVjdCBk
cm1fcmVjdCAqcmVjdCkNCj4+ICAgew0KPj4gICAJc3RydWN0IGh5cGVydl9kcm1fZGV2aWNl
ICpodiA9IHRvX2h2KGZiLT5kZXYpOw0KPj4gLQl2b2lkIF9faW9tZW0gKmRzdCA9IGh2LT52
cmFtOw0KPj4gLQl2b2lkICp2bWFwID0gbWFwLT52YWRkcjsgLyogVE9ETzogVXNlIG1hcHBp
bmcgYWJzdHJhY3Rpb24gcHJvcGVybHkgKi8NCj4+ICsJc3RydWN0IGlvc3lzX21hcCBkc3Q7
DQo+PiAgIAlpbnQgaWR4Ow0KPj4gICANCj4+ICAgCWlmICghZHJtX2Rldl9lbnRlcigmaHYt
PmRldiwgJmlkeCkpDQo+PiAgIAkJcmV0dXJuIC1FTk9ERVY7DQo+PiAgIA0KPj4gLQlkc3Qg
Kz0gZHJtX2ZiX2NsaXBfb2Zmc2V0KGZiLT5waXRjaGVzWzBdLCBmYi0+Zm9ybWF0LCByZWN0
KTsNCj4+IC0JZHJtX2ZiX21lbWNweV90b2lvKGRzdCwgZmItPnBpdGNoZXNbMF0sIHZtYXAs
IGZiLCByZWN0KTsNCj4+ICsJaW9zeXNfbWFwX3NldF92YWRkcl9pb21lbSgmZHN0LCBodi0+
dnJhbSk7DQo+PiArCWlvc3lzX21hcF9pbmNyKCZkc3QsIGRybV9mYl9jbGlwX29mZnNldChm
Yi0+cGl0Y2hlc1swXSwgZmItPmZvcm1hdCwgcmVjdCkpOw0KPj4gKw0KPj4gKwlkcm1fZmJf
bWVtY3B5KCZkc3QsIGZiLT5waXRjaGVzLCB2bWFwLCBmYiwgcmVjdCk7DQo+PiAgIA0KPj4g
ICAJZHJtX2Rldl9leGl0KGlkeCk7DQo+PiAgIA0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jIGIvZHJpdmVycy9ncHUvZHJtL21nYWcy
MDAvbWdhZzIwMF9tb2RlLmMNCj4+IGluZGV4IGEwMmY1OTljYjljZi4uYTc5YTBlZTNhNTBk
IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2Rl
LmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jDQo+
PiBAQCAtNzU1LDEzICs3NTUsMTQgQEAgbWdhZzIwMF9zaW1wbGVfZGlzcGxheV9waXBlX21v
ZGVfdmFsaWQoc3RydWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBlICpwaXBlLA0KPj4gICAN
Cj4+ICAgc3RhdGljIHZvaWQNCj4+ICAgbWdhZzIwMF9oYW5kbGVfZGFtYWdlKHN0cnVjdCBt
Z2FfZGV2aWNlICptZGV2LCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiwNCj4+IC0JCSAg
ICAgIHN0cnVjdCBkcm1fcmVjdCAqY2xpcCwgY29uc3Qgc3RydWN0IGlvc3lzX21hcCAqbWFw
KQ0KPj4gKwkJICAgICAgc3RydWN0IGRybV9yZWN0ICpjbGlwLCBjb25zdCBzdHJ1Y3QgaW9z
eXNfbWFwICp2bWFwKQ0KPj4gICB7DQo+PiAtCXZvaWQgX19pb21lbSAqZHN0ID0gbWRldi0+
dnJhbTsNCj4+IC0Jdm9pZCAqdm1hcCA9IG1hcC0+dmFkZHI7IC8qIFRPRE86IFVzZSBtYXBw
aW5nIGFic3RyYWN0aW9uIHByb3Blcmx5ICovDQo+PiArCXN0cnVjdCBpb3N5c19tYXAgZHN0
Ow0KPiBPciB1c2UNCj4gc3RydWN0IGlvc3lzX21hcCBkc3QgPSBJT1NZU19NQVBfSU5JVF9W
QUREUihtZGV2LT52cmFtKTsNCj4gDQo+IFRoZXJlIGlzIG5vIGRybV9kZXZfZW50ZXIoKSBo
ZXJlIHdlIG5lZWQgdG8gcGFzcyBmaXJzdCwgbGlrZSBpbg0KPiBoeXBlcnZfZHJtX21vZGVz
ZXQuYyBhYm92ZS4NCg0KSSdsbCBhZGQgSU9TWVNfTUFQX0lOSVRfVkFERFJfSU9NRU0oKSB0
byB0aGUgbmV4dCBpdGVyYXRpb24uIEknbGwgYWxzbyANCmNvbnZlcnQgaHlwZXJ2IHRvIHRo
ZSBtYWNyby4gV2UgY2FuIGluaXQgdGhlIGFkZHJlc3MgYXMgbG9uZyBhcyB3ZSBkb24ndCAN
CmRlcmVmIGl0Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPj4gICANCj4+IC0J
ZHN0ICs9IGRybV9mYl9jbGlwX29mZnNldChmYi0+cGl0Y2hlc1swXSwgZmItPmZvcm1hdCwg
Y2xpcCk7DQo+PiAtCWRybV9mYl9tZW1jcHlfdG9pbyhkc3QsIGZiLT5waXRjaGVzWzBdLCB2
bWFwLCBmYiwgY2xpcCk7DQo+PiArCWlvc3lzX21hcF9zZXRfdmFkZHJfaW9tZW0oJmRzdCwg
bWRldi0+dnJhbSk7DQo+PiArCWlvc3lzX21hcF9pbmNyKCZkc3QsIGRybV9mYl9jbGlwX29m
ZnNldChmYi0+cGl0Y2hlc1swXSwgZmItPmZvcm1hdCwgY2xpcCkpOw0KPj4gKw0KPj4gKwlk
cm1fZmJfbWVtY3B5KCZkc3QsIGZiLT5waXRjaGVzLCB2bWFwLCBmYiwgY2xpcCk7DQo+PiAg
IH0NCj4+ICAgDQo+PiAgIHN0YXRpYyB2b2lkDQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3RpbnkvY2lycnVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9jaXJydXMuYw0K
Pj4gaW5kZXggYzRmNWJlZWExZjkwLi43M2ZiOWY2M2QyMjcgMTAwNjQ0DQo+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vdGlueS9jaXJydXMuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3RpbnkvY2lycnVzLmMNCj4+IEBAIC0zMTYsMjggKzMxNiwzMSBAQCBzdGF0aWMgaW50IGNp
cnJ1c19tb2RlX3NldChzdHJ1Y3QgY2lycnVzX2RldmljZSAqY2lycnVzLA0KPj4gICB9DQo+
PiAgIA0KPj4gICBzdGF0aWMgaW50IGNpcnJ1c19mYl9ibGl0X3JlY3Qoc3RydWN0IGRybV9m
cmFtZWJ1ZmZlciAqZmIsDQo+PiAtCQkJICAgICAgIGNvbnN0IHN0cnVjdCBpb3N5c19tYXAg
Km1hcCwNCj4+ICsJCQkgICAgICAgY29uc3Qgc3RydWN0IGlvc3lzX21hcCAqdm1hcCwNCj4+
ICAgCQkJICAgICAgIHN0cnVjdCBkcm1fcmVjdCAqcmVjdCkNCj4+ICAgew0KPj4gICAJc3Ry
dWN0IGNpcnJ1c19kZXZpY2UgKmNpcnJ1cyA9IHRvX2NpcnJ1cyhmYi0+ZGV2KTsNCj4+IC0J
dm9pZCBfX2lvbWVtICpkc3QgPSBjaXJydXMtPnZyYW07DQo+PiAtCXZvaWQgKnZtYXAgPSBt
YXAtPnZhZGRyOyAvKiBUT0RPOiBVc2UgbWFwcGluZyBhYnN0cmFjdGlvbiBwcm9wZXJseSAq
Lw0KPj4gKwlzdHJ1Y3QgaW9zeXNfbWFwIGRzdDsNCj4+ICsJdm9pZCAqdmFkZHIgPSB2bWFw
LT52YWRkcjsgLyogVE9ETzogVXNlIG1hcHBpbmcgYWJzdHJhY3Rpb24gcHJvcGVybHkgKi8N
Cj4+ICAgCWludCBpZHg7DQo+PiAgIA0KPj4gICAJaWYgKCFkcm1fZGV2X2VudGVyKCZjaXJy
dXMtPmRldiwgJmlkeCkpDQo+PiAgIAkJcmV0dXJuIC1FTk9ERVY7DQo+PiAgIA0KPj4gKwlp
b3N5c19tYXBfc2V0X3ZhZGRyX2lvbWVtKCZkc3QsIGNpcnJ1cy0+dnJhbSk7DQo+PiArDQo+
PiAgIAlpZiAoY2lycnVzLT5jcHAgPT0gZmItPmZvcm1hdC0+Y3BwWzBdKSB7DQo+PiAtCQlk
c3QgKz0gZHJtX2ZiX2NsaXBfb2Zmc2V0KGZiLT5waXRjaGVzWzBdLCBmYi0+Zm9ybWF0LCBy
ZWN0KTsNCj4+IC0JCWRybV9mYl9tZW1jcHlfdG9pbyhkc3QsIGZiLT5waXRjaGVzWzBdLCB2
bWFwLCBmYiwgcmVjdCk7DQo+PiArCQlpb3N5c19tYXBfaW5jcigmZHN0LCBkcm1fZmJfY2xp
cF9vZmZzZXQoZmItPnBpdGNoZXNbMF0sIGZiLT5mb3JtYXQsIHJlY3QpKTsNCj4+ICsJCWRy
bV9mYl9tZW1jcHkoJmRzdCwgZmItPnBpdGNoZXMsIHZtYXAsIGZiLCByZWN0KTsNCj4+ICAg
DQo+PiAgIAl9IGVsc2UgaWYgKGZiLT5mb3JtYXQtPmNwcFswXSA9PSA0ICYmIGNpcnJ1cy0+
Y3BwID09IDIpIHsNCj4+IC0JCWRzdCArPSBkcm1fZmJfY2xpcF9vZmZzZXQoY2lycnVzLT5w
aXRjaCwgZmItPmZvcm1hdCwgcmVjdCk7DQo+PiAtCQlkcm1fZmJfeHJnYjg4ODhfdG9fcmdi
NTY1X3RvaW8oZHN0LCBjaXJydXMtPnBpdGNoLCB2bWFwLCBmYiwgcmVjdCwgZmFsc2UpOw0K
Pj4gKwkJaW9zeXNfbWFwX2luY3IoJmRzdCwgZHJtX2ZiX2NsaXBfb2Zmc2V0KGNpcnJ1cy0+
cGl0Y2gsIGZiLT5mb3JtYXQsIHJlY3QpKTsNCj4+ICsJCWRybV9mYl94cmdiODg4OF90b19y
Z2I1NjVfdG9pbyhkc3QudmFkZHJfaW9tZW0sIGNpcnJ1cy0+cGl0Y2gsIHZhZGRyLCBmYiwg
cmVjdCwNCj4+ICsJCQkJCSAgICAgICBmYWxzZSk7DQo+PiAgIA0KPj4gICAJfSBlbHNlIGlm
IChmYi0+Zm9ybWF0LT5jcHBbMF0gPT0gNCAmJiBjaXJydXMtPmNwcCA9PSAzKSB7DQo+PiAt
CQlkc3QgKz0gZHJtX2ZiX2NsaXBfb2Zmc2V0KGNpcnJ1cy0+cGl0Y2gsIGZiLT5mb3JtYXQs
IHJlY3QpOw0KPj4gLQkJZHJtX2ZiX3hyZ2I4ODg4X3RvX3JnYjg4OF90b2lvKGRzdCwgY2ly
cnVzLT5waXRjaCwgdm1hcCwgZmIsIHJlY3QpOw0KPj4gKwkJaW9zeXNfbWFwX2luY3IoJmRz
dCwgZHJtX2ZiX2NsaXBfb2Zmc2V0KGNpcnJ1cy0+cGl0Y2gsIGZiLT5mb3JtYXQsIHJlY3Qp
KTsNCj4+ICsJCWRybV9mYl94cmdiODg4OF90b19yZ2I4ODhfdG9pbyhkc3QudmFkZHJfaW9t
ZW0sIGNpcnJ1cy0+cGl0Y2gsIHZhZGRyLCBmYiwgcmVjdCk7DQo+PiAgIA0KPj4gICAJfSBl
bHNlIHsNCj4+ICAgCQlXQVJOX09OX09OQ0UoImNwcCBtaXNtYXRjaCIpOw0KPj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmggYi9pbmNsdWRlL2RybS9k
cm1fZm9ybWF0X2hlbHBlci5oDQo+PiBpbmRleCAyMWRhZWE3ZmRhOTkuLjhhZjZhMjcxN2Jj
OSAxMDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmgNCj4+
ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmgNCj4+IEBAIC0xNCwxMCAr
MTQsOSBAQCBzdHJ1Y3QgZHJtX3JlY3Q7DQo+PiAgIHVuc2lnbmVkIGludCBkcm1fZmJfY2xp
cF9vZmZzZXQodW5zaWduZWQgaW50IHBpdGNoLCBjb25zdCBzdHJ1Y3QgZHJtX2Zvcm1hdF9p
bmZvICpmb3JtYXQsDQo+PiAgIAkJCQljb25zdCBzdHJ1Y3QgZHJtX3JlY3QgKmNsaXApOw0K
Pj4gICANCj4+IC12b2lkIGRybV9mYl9tZW1jcHkodm9pZCAqZHN0LCB1bnNpZ25lZCBpbnQg
ZHN0X3BpdGNoLCBjb25zdCB2b2lkICp2YWRkciwNCj4+IC0JCSAgIGNvbnN0IHN0cnVjdCBk
cm1fZnJhbWVidWZmZXIgKmZiLCBjb25zdCBzdHJ1Y3QgZHJtX3JlY3QgKmNsaXApOw0KPj4g
LXZvaWQgZHJtX2ZiX21lbWNweV90b2lvKHZvaWQgX19pb21lbSAqZHN0LCB1bnNpZ25lZCBp
bnQgZHN0X3BpdGNoLCBjb25zdCB2b2lkICp2YWRkciwNCj4+IC0JCQljb25zdCBzdHJ1Y3Qg
ZHJtX2ZyYW1lYnVmZmVyICpmYiwgY29uc3Qgc3RydWN0IGRybV9yZWN0ICpjbGlwKTsNCj4+
ICt2b2lkIGRybV9mYl9tZW1jcHkoc3RydWN0IGlvc3lzX21hcCAqZHN0LCBjb25zdCB1bnNp
Z25lZCBpbnQgKmRzdF9waXRjaCwNCj4+ICsJCSAgIGNvbnN0IHN0cnVjdCBpb3N5c19tYXAg
KnZtYXAsIGNvbnN0IHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLA0KPj4gKwkJICAgY29u
c3Qgc3RydWN0IGRybV9yZWN0ICpjbGlwKTsNCj4+ICAgdm9pZCBkcm1fZmJfc3dhYih2b2lk
ICpkc3QsIHVuc2lnbmVkIGludCBkc3RfcGl0Y2gsIGNvbnN0IHZvaWQgKnNyYywNCj4+ICAg
CQkgY29uc3Qgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIsIGNvbnN0IHN0cnVjdCBkcm1f
cmVjdCAqY2xpcCwNCj4+ICAgCQkgYm9vbCBjYWNoZWQpOw0KPj4gLS0gDQo+PiAyLjM3LjEN
Cg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0K
U1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5
MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdl
c2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------ppyaxKPHatnQ6vZEcVCwgZ0l--

--------------u4oG66an7JNCoJZOm9A063sy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLw/IkFAwAAAAAACgkQlh/E3EQov+Dy
qRAAhnEilckhTdKoWPcbZAZHP4l1+uayEQgH2C6TIJsMHntn15QFCJ0NUU3JoP0h94ndr/7+sEmt
mMRdkRbFq9bR4qZbd3dULa8q4vVTrxZWb2Gpy7KMcS+9m0Kvn1yccpUdCmqzS3YZMODsNCOiiHfT
7sHYYyPo9twr/N5TBcdmyyoRm4pefJw7vqUG/UMfhHLabwbENFPE8p5RNdRkAfE2wo0Z2LZyGEBU
ViGy8nVVEX1aXychCwI5q8VuntfA7t5lFZ1OqLOvnjgsD7j9uhuC0BZPZ6Bx//pdyzBDoi1/w+58
CPz+tT9Csaqci8xeyjXzANojkY7C7NkOAIVqA42FlOMFhFEJChG5ZmQB804DflNFOsFjkRa8z+fs
PHlzUm7mTBXkwoqScGHrH3SDCEx628ckU7ozAQww3whQDKoxqVFZxJoMDXv9aXtGtc+ZLb2uI4pb
P59omk39QgL3nK+oS5SjiqEHWfccINBGqH08xpsXsSVrz4GN0No9e26gBANQzPWl1IdoYQNjuU8O
HesWfj/5BgKPOm+z0xYfZyl3z3OLeWV9LhmZr0g2vv6fP4CNaFquoUKTqYtYdy5XaKSznXJn5fkz
v4Kv8MVvkf89HKcVALlI6gNmTWjOsH7dK0ozKz8MpJNQ2XCU0JcnpRRNXzq7WhZpevx9WWcEg0GU
G90=
=+4lv
-----END PGP SIGNATURE-----

--------------u4oG66an7JNCoJZOm9A063sy--

--===============2057185157429277919==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============2057185157429277919==--
