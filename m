Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id B704B444205
	for <lists.virtualization@lfdr.de>; Wed,  3 Nov 2021 13:57:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E72540143;
	Wed,  3 Nov 2021 12:57:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d9PamC-cLxeN; Wed,  3 Nov 2021 12:57:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5281A40364;
	Wed,  3 Nov 2021 12:57:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CEE60C000E;
	Wed,  3 Nov 2021 12:57:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7BC7BC000E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Nov 2021 12:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A0E680D99
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Nov 2021 12:57:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=suse.de header.b="ecT2Ypqr";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=suse.de header.b="/Gqqm9sL"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id neADCHbUVpAJ
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Nov 2021 12:57:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 36C0180D69
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Nov 2021 12:57:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 45BD2218C8;
 Wed,  3 Nov 2021 12:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635944268; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kPTH949y9Yt4tRF/1nRWbQqUfM+hbJIsz0dwTS5Zn3w=;
 b=ecT2YpqrKnrWPtAoeLi/FqYmveCgLmUB34gXAaicsSVs3/WYkAJWDd7HnxBr2M5CF4hoBi
 I0DJtuL8PQOyGnYMjCDQ4uL6kHODzY41s1D2Kz+kJ4GQcCjWG48t2Pvn9wLpf2vOFwwvXN
 CySchyhzdc+0i4GoTO44GIb71uLnvog=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635944268;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kPTH949y9Yt4tRF/1nRWbQqUfM+hbJIsz0dwTS5Zn3w=;
 b=/Gqqm9sL5SFH09eCTWNDRpsgREKN6VLdSQsqzSpSfGK29yRHldBOL/0i8dS7wiMHLkSW8Z
 5M7z0w2bRxinvWBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C586813E03;
 Wed,  3 Nov 2021 12:57:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id q+gzL0uHgmGUYwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 03 Nov 2021 12:57:47 +0000
Message-ID: <eddc2967-8355-b64a-79d8-6c1cda1bc732@suse.de>
Date: Wed, 3 Nov 2021 13:57:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [RESEND PATCH 3/5] drm: Rename vgacon_text_force() function to
 drm_modeset_disabled()
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20211103122809.1040754-1-javierm@redhat.com>
 <20211103122809.1040754-4-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211103122809.1040754-4-javierm@redhat.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Dave Airlie <airlied@redhat.com>, amd-gfx@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Neal Gompa <ngompa13@gmail.com>,
 spice-devel@lists.freedesktop.org,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Peter Robinson <pbrobinson@gmail.com>, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 nouveau@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
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
Content-Type: multipart/mixed; boundary="===============9177258969721311507=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============9177258969721311507==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PeCDtqKiXHjrTqPD0OaM2nfT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PeCDtqKiXHjrTqPD0OaM2nfT
Content-Type: multipart/mixed; boundary="------------IOaBssdUYJPG60Bi5bzNBrGE";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, amd-gfx@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Peter Robinson <pbrobinson@gmail.com>, Neal Gompa <ngompa13@gmail.com>,
 Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 nouveau@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, spice-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <eddc2967-8355-b64a-79d8-6c1cda1bc732@suse.de>
Subject: Re: [RESEND PATCH 3/5] drm: Rename vgacon_text_force() function to
 drm_modeset_disabled()
References: <20211103122809.1040754-1-javierm@redhat.com>
 <20211103122809.1040754-4-javierm@redhat.com>
In-Reply-To: <20211103122809.1040754-4-javierm@redhat.com>

--------------IOaBssdUYJPG60Bi5bzNBrGE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDMuMTEuMjEgdW0gMTM6Mjggc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRoaXMgZnVuY3Rpb24gaXMgdXNlZCBieSBzb21lIERSTSBkcml2ZXJzIHRv
IGRldGVybWluZSBpZiB0aGUgIm5vbW9kZXNldCINCj4ga2VybmVsIGNvbW1hbmQgbGluZSBw
YXJhbWV0ZXIgd2FzIHNldCBhbmQgcHJldmVudCB0aGVzZSBkcml2ZXJzIHRvIHByb2JlLg0K
PiANCj4gQnV0IHRoZSBmdW5jdGlvbiBuYW1lIGlzIHF1aXRlIGNvbmZ1c2luZyBhbmQgZG9l
cyBub3QgcmVmbGVjdCB3aGF0IHJlYWxseQ0KPiB0aGUgZHJpdmVycyBhcmUgdGVzdGluZyB3
aGVuIGNhbGxpbmcgaXQuIFVzZSBhIGJldHRlciBuYW1pbmcgbm93IHRoYXQgaXQNCj4gaXMg
cGFydCBvZiB0aGUgRFJNIHN1YnN5c3RlbS4NCj4gDQo+IEFsc28sIHZnYWNvbl90ZXh0X2Zv
cmNlKCkgaXMgZ3VhcmRlZCBieSAjaWZkZWYgQ09ORklHX1ZHQV9DT05TT0xFIGFscmVhZHkN
Cj4gc28gdGhlcmUgaXMgbm8gbmVlZCB0byBkbyB0aGUgc2FtZSB3aGVuIGNhbGxpbmcgdGhl
IGZ1bmN0aW9uLg0KPiANCj4gU3VnZ2VzdGVkLWJ5OiBTdWdnZXN0ZWQtYnk6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+DQo+IFNpZ25lZC1vZmYtYnk6IEphdmll
ciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0KPiAtLS0NCj4gDQo+
ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIHwgIDIgKy0NCj4g
ICBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuYyAgICAgICAgICAgfCAgMiArLQ0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9kcm1fbm9tb2Rlc2V0LmMgICAgICAgICB8IDE2ICsrKysrKysr
LS0tLS0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X21vZHVsZS5jICAgICAg
fCAgMiArLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmMgICB8
ICAyICstDQo+ICAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYyAgIHwg
IDIgKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuYyAgICAgICAgICAgfCAg
MiArLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jICAgICB8ICAy
ICstDQo+ICAgZHJpdmVycy9ncHUvZHJtL3RpbnkvYm9jaHMuYyAgICAgICAgICAgIHwgIDIg
Ky0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdGlueS9jaXJydXMuYyAgICAgICAgICAgfCAgMiAr
LQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS92Ym94dmlkZW8vdmJveF9kcnYuYyAgICB8ICA0ICst
LS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmMgICAgfCAgMiAr
LQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jICAgICB8ICAyICst
DQo+ICAgaW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmggICAgICAgICAgIHwgIDQgKyst
LQ0KPiAgIDE0IGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYw0K
PiBpbmRleCAyNjgwYTJhYWE4NzcuLmY3YmQyNjE2Y2YyMyAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYw0KPiBAQCAtMjUxMyw3ICsyNTEzLDcg
QEAgc3RhdGljIGludCBfX2luaXQgYW1kZ3B1X2luaXQodm9pZCkNCj4gICB7DQo+ICAgCWlu
dCByOw0KPiAgIA0KPiAtCWlmICh2Z2Fjb25fdGV4dF9mb3JjZSgpKSB7DQo+ICsJaWYgKGRy
bV9tb2Rlc2V0X2Rpc2FibGVkKCkpIHsNCj4gICAJCURSTV9FUlJPUigiYW1kZ3B1IGtlcm5l
bCBtb2Rlc2V0dGluZyBkaXNhYmxlZC5cbiIpOw0KDQpQbGVhc2UgcmVtb3ZlIGFsbCBzdWNo
IGVycm9yIG1lc3NhZ2VzIGZyb20gZHJpdmVycy4gDQpkcm1fbW9kZXNldF9kaXNhYmxlZCgp
IHNob3VsZCBwcmludCBhIHVuaWZpZWQgbWVzc2FnZSBpbnN0ZWFkLg0KDQoNCj4gICAJCXJl
dHVybiAtRUlOVkFMOw0KPiAgIAl9DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YXN0L2FzdF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5jDQo+IGluZGV4
IDA0OGJlNjA3YjE4Mi4uNjcwNjA1MDQxNGMzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYXN0L2FzdF9kcnYuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9k
cnYuYw0KPiBAQCAtMjMyLDcgKzIzMiw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGNpX2RyaXZlciBh
c3RfcGNpX2RyaXZlciA9IHsNCj4gICANCj4gICBzdGF0aWMgaW50IF9faW5pdCBhc3RfaW5p
dCh2b2lkKQ0KPiAgIHsNCj4gLQlpZiAodmdhY29uX3RleHRfZm9yY2UoKSAmJiBhc3RfbW9k
ZXNldCA9PSAtMSkNCj4gKwlpZiAoZHJtX21vZGVzZXRfZGlzYWJsZWQoKSAmJiBhc3RfbW9k
ZXNldCA9PSAtMSkNCj4gICAJCXJldHVybiAtRUlOVkFMOw0KPiAgIA0KPiAgIAlpZiAoYXN0
X21vZGVzZXQgPT0gMCkNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbm9t
b2Rlc2V0LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX25vbW9kZXNldC5jDQo+IGluZGV4IDFh
YzlhOGQ1YThmZS4uZGZjOGIzMGYwNjI1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX25vbW9kZXNldC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbm9tb2Rl
c2V0LmMNCj4gQEAgLTMsMTcgKzMsMTcgQEANCj4gICAjaW5jbHVkZSA8bGludXgvbW9kdWxl
Lmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+DQo+ICAgDQo+IC1zdGF0aWMgYm9v
bCB2Z2Fjb25fdGV4dF9tb2RlX2ZvcmNlOw0KPiArc3RhdGljIGJvb2wgZHJtX25vbW9kZXNl
dDsNCj4gICANCj4gLWJvb2wgdmdhY29uX3RleHRfZm9yY2Uodm9pZCkNCj4gK2Jvb2wgZHJt
X21vZGVzZXRfZGlzYWJsZWQodm9pZCkNCg0KSSBzdWdnZXN0IHRvIHJlbmFtZSB0aGlzIGZ1
bmN0aW9uIHRvIGRybV9jaGVja19tb2Rlc2V0KCkgYW5kIGhhdmUgaXQgDQpyZXR1cm4gYSBu
ZWdhdGl2ZSBlcnJubyBjb2RlIG9uIGZhaWx1cmUuIFRoaXMgZ2l2ZXMgbWF4aW11bSBmbGV4
aWJpbGl0eSANCmFuZCByZWR1Y2VzIGVycm9ycyBpbiBkcml2ZXJzLiBSaWdodCBub3cgdGhl
IGRyaXZlcnMgcmV0dXJuIHNvbWV0aGluZyANCmxpa2UgLUVJTlZBTCwgd2hpY2ggc2VlbXMg
d3JvbmcuIFJldHVybmluZyAtRU5PREVWIHNlZW1zIG1vcmUgYXBwcm9wcmlhdGUuDQoNCj4g
ICB7DQo+IC0JcmV0dXJuIHZnYWNvbl90ZXh0X21vZGVfZm9yY2U7DQo+ICsJcmV0dXJuIGRy
bV9ub21vZGVzZXQ7DQo+ICAgfQ0KPiAtRVhQT1JUX1NZTUJPTCh2Z2Fjb25fdGV4dF9mb3Jj
ZSk7DQo+ICtFWFBPUlRfU1lNQk9MKGRybV9tb2Rlc2V0X2Rpc2FibGVkKTsNCj4gICANCj4g
LXN0YXRpYyBpbnQgX19pbml0IHRleHRfbW9kZShjaGFyICpzdHIpDQo+ICtzdGF0aWMgaW50
IF9faW5pdCBkaXNhYmxlX21vZGVzZXQoY2hhciAqc3RyKQ0KPiAgIHsNCj4gLQl2Z2Fjb25f
dGV4dF9tb2RlX2ZvcmNlID0gdHJ1ZTsNCj4gKwlkcm1fbm9tb2Rlc2V0ID0gdHJ1ZTsNCj4g
ICANCj4gICAJcHJfd2FybigiWW91IGhhdmUgYm9vdGVkIHdpdGggbm9tb2Rlc2V0LiBUaGlz
IG1lYW5zIHlvdXIgR1BVIGRyaXZlcnMgYXJlIERJU0FCTEVEXG4iKTsNCj4gICAJcHJfd2Fy
bigiQW55IHZpZGVvIHJlbGF0ZWQgZnVuY3Rpb25hbGl0eSB3aWxsIGJlIHNldmVyZWx5IGRl
Z3JhZGVkLCBhbmQgeW91IG1heSBub3QgZXZlbiBiZSBhYmxlIHRvIHN1c3BlbmQgdGhlIHN5
c3RlbSBwcm9wZXJseVxuIik7DQo+IEBAIC0yMiw1ICsyMiw1IEBAIHN0YXRpYyBpbnQgX19p
bml0IHRleHRfbW9kZShjaGFyICpzdHIpDQo+ICAgCXJldHVybiAxOw0KPiAgIH0NCj4gICAN
Cj4gLS8qIGZvcmNlIHRleHQgbW9kZSAtIHVzZWQgYnkga2VybmVsIG1vZGVzZXR0aW5nICov
DQo+IC1fX3NldHVwKCJub21vZGVzZXQiLCB0ZXh0X21vZGUpOw0KPiArLyogRGlzYWJsZSBr
ZXJuZWwgbW9kZXNldHRpbmcgKi8NCj4gK19fc2V0dXAoIm5vbW9kZXNldCIsIGRpc2FibGVf
bW9kZXNldCk7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X21v
ZHVsZS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9tb2R1bGUuYw0KPiBpbmRleCAx
NGE1OTIyNjUxOWQuLjNlNTUzMTA0MGU0ZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaTkxNV9tb2R1bGUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9p
OTE1X21vZHVsZS5jDQo+IEBAIC0yOSw3ICsyOSw3IEBAIHN0YXRpYyBpbnQgaTkxNV9jaGVj
a19ub21vZGVzZXQodm9pZCkNCj4gICAJaWYgKGk5MTVfbW9kcGFyYW1zLm1vZGVzZXQgPT0g
MCkNCj4gICAJCXVzZV9rbXMgPSBmYWxzZTsNCj4gICANCj4gLQlpZiAodmdhY29uX3RleHRf
Zm9yY2UoKSAmJiBpOTE1X21vZHBhcmFtcy5tb2Rlc2V0ID09IC0xKQ0KPiArCWlmIChkcm1f
bW9kZXNldF9kaXNhYmxlZCgpICYmIGk5MTVfbW9kcGFyYW1zLm1vZGVzZXQgPT0gLTEpDQo+
ICAgCQl1c2Vfa21zID0gZmFsc2U7DQo+ICAgDQo+ICAgCWlmICghdXNlX2ttcykgew0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmMNCj4gaW5kZXggNjg1ZTc2NmRi
NmE0Li43ZWU4NzU2NGJhZGUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZ2Fn
MjAwL21nYWcyMDBfZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdh
ZzIwMF9kcnYuYw0KPiBAQCAtMzc3LDcgKzM3Nyw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGNpX2Ry
aXZlciBtZ2FnMjAwX3BjaV9kcml2ZXIgPSB7DQo+ICAgDQo+ICAgc3RhdGljIGludCBfX2lu
aXQgbWdhZzIwMF9pbml0KHZvaWQpDQo+ICAgew0KPiAtCWlmICh2Z2Fjb25fdGV4dF9mb3Jj
ZSgpICYmIG1nYWcyMDBfbW9kZXNldCA9PSAtMSkNCj4gKwlpZiAoZHJtX21vZGVzZXRfZGlz
YWJsZWQoKSAmJiBtZ2FnMjAwX21vZGVzZXQgPT0gLTEpDQo+ICAgCQlyZXR1cm4gLUVJTlZB
TDsNCj4gICANCj4gICAJaWYgKG1nYWcyMDBfbW9kZXNldCA9PSAwKQ0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYyBiL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfZHJtLmMNCj4gaW5kZXggMDI5OTk3ZjUwZDFhLi45MDNk
MGU2MjY5NTQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZl
YXVfZHJtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0u
Yw0KPiBAQCAtMTMyMSw3ICsxMzIxLDcgQEAgbm91dmVhdV9kcm1faW5pdCh2b2lkKQ0KPiAg
IAlub3V2ZWF1X2Rpc3BsYXlfb3B0aW9ucygpOw0KPiAgIA0KPiAgIAlpZiAobm91dmVhdV9t
b2Rlc2V0ID09IC0xKSB7DQo+IC0JCWlmICh2Z2Fjb25fdGV4dF9mb3JjZSgpKQ0KPiArCQlp
ZiAoZHJtX21vZGVzZXRfZGlzYWJsZWQoKSkNCj4gICAJCQlub3V2ZWF1X21vZGVzZXQgPSAw
Ow0KPiAgIAl9DQo+ICAgDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4
bF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5jDQo+IGluZGV4IDNjZDZi
ZDlmMDU5ZC4uZTRhYjE2ODM3ZmFkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
cXhsL3F4bF9kcnYuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuYw0K
PiBAQCAtMjk0LDcgKzI5NCw3IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBxeGxfZHJp
dmVyID0gew0KPiAgIA0KPiAgIHN0YXRpYyBpbnQgX19pbml0IHF4bF9pbml0KHZvaWQpDQo+
ICAgew0KPiAtCWlmICh2Z2Fjb25fdGV4dF9mb3JjZSgpICYmIHF4bF9tb2Rlc2V0ID09IC0x
KQ0KPiArCWlmIChkcm1fbW9kZXNldF9kaXNhYmxlZCgpICYmIHF4bF9tb2Rlc2V0ID09IC0x
KQ0KPiAgIAkJcmV0dXJuIC1FSU5WQUw7DQo+ICAgDQo+ICAgCWlmIChxeGxfbW9kZXNldCA9
PSAwKQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2
LmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYw0KPiBpbmRleCA5YjYw
NmMxYjExZWMuLjM2YzhkYWM2OGNjYSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yYWRlb25fZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
YWRlb25fZHJ2LmMNCj4gQEAgLTYzNiw3ICs2MzYsNyBAQCBzdGF0aWMgc3RydWN0IHBjaV9k
cml2ZXIgcmFkZW9uX2ttc19wY2lfZHJpdmVyID0gew0KPiAgIA0KPiAgIHN0YXRpYyBpbnQg
X19pbml0IHJhZGVvbl9tb2R1bGVfaW5pdCh2b2lkKQ0KPiAgIHsNCj4gLQlpZiAodmdhY29u
X3RleHRfZm9yY2UoKSAmJiByYWRlb25fbW9kZXNldCA9PSAtMSkgew0KPiArCWlmIChkcm1f
bW9kZXNldF9kaXNhYmxlZCgpICYmIHJhZGVvbl9tb2Rlc2V0ID09IC0xKSB7DQo+ICAgCQlE
Uk1fSU5GTygiVkdBQ09OIGRpc2FibGUgcmFkZW9uIGtlcm5lbCBtb2Rlc2V0dGluZy5cbiIp
Ow0KPiAgIAkJcmFkZW9uX21vZGVzZXQgPSAwOw0KPiAgIAl9DQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vdGlueS9ib2Nocy5jIGIvZHJpdmVycy9ncHUvZHJtL3RpbnkvYm9j
aHMuYw0KPiBpbmRleCAwNDMzM2Y3OGJlNTUuLjU5MTg5ZjdjMTg0MCAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3RpbnkvYm9jaHMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vdGlueS9ib2Nocy5jDQo+IEBAIC03MTgsNyArNzE4LDcgQEAgc3RhdGljIHN0cnVjdCBw
Y2lfZHJpdmVyIGJvY2hzX3BjaV9kcml2ZXIgPSB7DQo+ICAgDQo+ICAgc3RhdGljIGludCBf
X2luaXQgYm9jaHNfaW5pdCh2b2lkKQ0KPiAgIHsNCj4gLQlpZiAodmdhY29uX3RleHRfZm9y
Y2UoKSAmJiBib2Noc19tb2Rlc2V0ID09IC0xKQ0KPiArCWlmIChkcm1fbW9kZXNldF9kaXNh
YmxlZCgpICYmIGJvY2hzX21vZGVzZXQgPT0gLTEpDQo+ICAgCQlyZXR1cm4gLUVJTlZBTDsN
Cj4gICANCj4gICAJaWYgKGJvY2hzX21vZGVzZXQgPT0gMCkNCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS90aW55L2NpcnJ1cy5jIGIvZHJpdmVycy9ncHUvZHJtL3RpbnkvY2ly
cnVzLmMNCj4gaW5kZXggOGJkNjc0ZjBkNjgyLi5mY2Y5ODM3OWM2NDEgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS90aW55L2NpcnJ1cy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS90aW55L2NpcnJ1cy5jDQo+IEBAIC02MzUsNyArNjM1LDcgQEAgc3RhdGljIHN0cnVj
dCBwY2lfZHJpdmVyIGNpcnJ1c19wY2lfZHJpdmVyID0gew0KPiAgIA0KPiAgIHN0YXRpYyBp
bnQgX19pbml0IGNpcnJ1c19pbml0KHZvaWQpDQo+ICAgew0KPiAtCWlmICh2Z2Fjb25fdGV4
dF9mb3JjZSgpKQ0KPiArCWlmIChkcm1fbW9kZXNldF9kaXNhYmxlZCgpKQ0KPiAgIAkJcmV0
dXJuIC1FSU5WQUw7DQo+ICAgCXJldHVybiBwY2lfcmVnaXN0ZXJfZHJpdmVyKCZjaXJydXNf
cGNpX2RyaXZlcik7DQo+ICAgfQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Zi
b3h2aWRlby92Ym94X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3Zib3h2aWRlby92Ym94X2Ry
di5jDQo+IGluZGV4IGU2ZDk4MzEyMWQwYi4uMDkzNTZkYmQ2OWIyIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdmJveHZpZGVvL3Zib3hfZHJ2LmMNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3Zib3h2aWRlby92Ym94X2Rydi5jDQo+IEBAIC0xOTIsMTAgKzE5Miw4IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2RyaXZlciBkcml2ZXIgPSB7DQo+ICAgDQo+ICAg
c3RhdGljIGludCBfX2luaXQgdmJveF9pbml0KHZvaWQpDQo+ICAgew0KPiAtI2lmZGVmIENP
TkZJR19WR0FfQ09OU09MRQ0KPiAtCWlmICh2Z2Fjb25fdGV4dF9mb3JjZSgpICYmIHZib3hf
bW9kZXNldCA9PSAtMSkNCj4gKwlpZiAoZHJtX21vZGVzZXRfZGlzYWJsZWQoKSAmJiB2Ym94
X21vZGVzZXQgPT0gLTEpDQo+ICAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gLSNlbmRpZg0KPiAg
IA0KPiAgIAlpZiAodmJveF9tb2Rlc2V0ID09IDApDQo+ICAgCQlyZXR1cm4gLUVJTlZBTDsN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuYyBi
L2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuYw0KPiBpbmRleCBjZDRjMTcw
MjM2ZjEuLmQ5Njc5N2Q3MGZhZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Zp
cnRpby92aXJ0Z3B1X2Rydi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmly
dGdwdV9kcnYuYw0KPiBAQCAtMTAzLDcgKzEwMyw3IEBAIHN0YXRpYyBpbnQgdmlydGlvX2dw
dV9wcm9iZShzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldikNCj4gICAJc3RydWN0IGRybV9k
ZXZpY2UgKmRldjsNCj4gICAJaW50IHJldDsNCj4gICANCj4gLQlpZiAodmdhY29uX3RleHRf
Zm9yY2UoKSAmJiB2aXJ0aW9fZ3B1X21vZGVzZXQgPT0gLTEpDQo+ICsJaWYgKGRybV9tb2Rl
c2V0X2Rpc2FibGVkKCkgJiYgdmlydGlvX2dwdV9tb2Rlc2V0ID09IC0xKQ0KPiAgIAkJcmV0
dXJuIC1FSU5WQUw7DQo+ICAgDQo+ICAgCWlmICh2aXJ0aW9fZ3B1X21vZGVzZXQgPT0gMCkN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jIGIv
ZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMNCj4gaW5kZXggZmNjNGI1YTdm
NjM5Li4yMmRhYjliZWVhMDMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdn
Zngvdm13Z2Z4X2Rydi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4
X2Rydi5jDQo+IEBAIC0xNjUwLDcgKzE2NTAsNyBAQCBzdGF0aWMgaW50IF9faW5pdCB2bXdn
ZnhfaW5pdCh2b2lkKQ0KPiAgIHsNCj4gICAJaW50IHJldDsNCj4gICANCj4gLQlpZiAodmdh
Y29uX3RleHRfZm9yY2UoKSkNCj4gKwlpZiAoZHJtX21vZGVzZXRfZGlzYWJsZWQoKSkNCj4g
ICAJCXJldHVybiAtRUlOVkFMOw0KPiAgIA0KPiAgIAlyZXQgPSBwY2lfcmVnaXN0ZXJfZHJp
dmVyKCZ2bXdfcGNpX2RyaXZlcik7DQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1f
bW9kZV9jb25maWcuaCBiL2luY2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZpZy5oDQo+IGluZGV4
IGUxZDIwNDJhN2I3Ny4uYTVhMmRjMDJlODkyIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2Ry
bS9kcm1fbW9kZV9jb25maWcuaA0KPiArKysgYi9pbmNsdWRlL2RybS9kcm1fbW9kZV9jb25m
aWcuaA0KPiBAQCAtOTcwLDkgKzk3MCw5IEBAIHZvaWQgZHJtX21vZGVfY29uZmlnX3Jlc2V0
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpOw0KPiAgIHZvaWQgZHJtX21vZGVfY29uZmlnX2Ns
ZWFudXAoc3RydWN0IGRybV9kZXZpY2UgKmRldik7DQo+ICAgDQo+ICAgI2lmZGVmIENPTkZJ
R19WR0FfQ09OU09MRQ0KPiAtZXh0ZXJuIGJvb2wgdmdhY29uX3RleHRfZm9yY2Uodm9pZCk7
DQo+ICtleHRlcm4gYm9vbCBkcm1fbW9kZXNldF9kaXNhYmxlZCh2b2lkKTsNCj4gICAjZWxz
ZQ0KPiAtc3RhdGljIGlubGluZSBib29sIHZnYWNvbl90ZXh0X2ZvcmNlKHZvaWQpIHsgcmV0
dXJuIGZhbHNlOyB9DQo+ICtzdGF0aWMgaW5saW5lIGJvb2wgZHJtX21vZGVzZXRfZGlzYWJs
ZWQodm9pZCkgeyByZXR1cm4gZmFsc2U7IH0NCj4gICAjZW5kaWYNCj4gICANCj4gICAjZW5k
aWYNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZl
bG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0
ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJl
cmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------IOaBssdUYJPG60Bi5bzNBrGE--

--------------PeCDtqKiXHjrTqPD0OaM2nfT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGCh0sFAwAAAAAACgkQlh/E3EQov+Ay
ZRAAmyjpiC3DJ0KA5oTJvrYymgFArLoztO0g+FypW1vl09HaqFMzWngKvjF8YZ2sEBbv9WvtQ6j8
C8Do5udgubjhfF2M4OcrrIjgAPoLoyHASNaMoyBo1BeORfV1m8RE1RM07H/XAjmwiFBQm1JvsptC
21u45u+rx46pOj2OQZ7KfYqAl9rHfQSLEwss3TjmGcPQ85KxNXTK3qBdN4lLrcP2P2fWUzF2wKRT
rVOAEm7HoS3M1KOAb2sUhbEVVP16kccz/a4xnaQyBpXgy2ooUXUqtVMBzGhVaha+QW6vjjvvCmHr
CHN/5dtZFJbcOtLYZCUzLTyiNp+mdNFGVqfrI+noszJkSGTYhs8vxL8QDMJMZC6U+WMnyJ/3Ysyc
jyahJ5/+2TJmOAdJuS1AGLkhytLqDkmVu6xGSuYeu0+XfGRoVUwJqcdBDEXgEjteYvn2E2ToMp9j
87g1Ps/wGnyoVw5Gj7PutMtEyUlO5JaTQyY174daph2nCluK8rFOX/ZeUDX/2fyiQ436ZazwjKb5
f6lIdp/58bdDgI6c9xFEgSPCSCc0xSUP5Kr3MDGl7OgYOuZ/8gGcan8Mj519aMkGhW19BgzUITFc
ASWwPS5OlXbQHQxUqAzgViWV/A22uta/wvq/NGhd4RU8Bd/mPNIAvwBPxTsqmFAXAufMqftsyNbg
7ds=
=vMZn
-----END PGP SIGNATURE-----

--------------PeCDtqKiXHjrTqPD0OaM2nfT--

--===============9177258969721311507==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============9177258969721311507==--
