Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B149558E79A
	for <lists.virtualization@lfdr.de>; Wed, 10 Aug 2022 09:08:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED0DA4109E;
	Wed, 10 Aug 2022 07:08:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED0DA4109E
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=uQD0YVSm;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=S6DJkou1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mRtwhWU_TIKc; Wed, 10 Aug 2022 07:08:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id DD5A041061;
	Wed, 10 Aug 2022 07:08:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD5A041061
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02088C007B;
	Wed, 10 Aug 2022 07:08:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42E51C002D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Aug 2022 07:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FEE560FA8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Aug 2022 07:07:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FEE560FA8
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=uQD0YVSm; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=S6DJkou1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f2uCrrsPMNmV
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Aug 2022 07:07:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1600E60F9F
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1600E60F9F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Aug 2022 07:07:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F12B737F3E;
 Wed, 10 Aug 2022 07:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1660115275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nr2j4kW7MlEn77sn/YeyIX2H/Vy158GDI0gtRQrT614=;
 b=uQD0YVSm7/5KigkugXvJLBsGeLebPNCwRd/6AQXg4BOFyx1VJygf1YMKtna9IWqMjfjt4H
 V+8yQde7UuC6errCSeJC9w9qOo9DMh2dsoyDJF8wo1ZneOY2HH+3hG8Wi4kVOB3Drbx2S2
 1eOS7kT6Yf0fhZZbZ4LnLe3w2x8b6A4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1660115275;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nr2j4kW7MlEn77sn/YeyIX2H/Vy158GDI0gtRQrT614=;
 b=S6DJkou1dYKTnzi/GfEbAdUupc34S4zmRAmY2eNVfgCQ8bT8Yk2kBTNXStnZv7RJJvKdKI
 aX77JcZH8AiUg4AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A808413AB3;
 Wed, 10 Aug 2022 07:07:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NxUIKEpZ82ItWQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 10 Aug 2022 07:07:54 +0000
Message-ID: <4cf932bc-97a4-942b-c308-be02107c0806@suse.de>
Date: Wed, 10 Aug 2022 09:07:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Subject: Re: [PATCH v2 00/14] drm/format-helper: Move to struct iosys_map
Content-Language: en-US
To: sam@ravnborg.org, jose.exposito89@gmail.com, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, noralf@tronnes.org, drawat.floss@gmail.com,
 lucas.demarchi@intel.com, david@lechnology.com, kraxel@redhat.com
References: <20220808125406.20752-1-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220808125406.20752-1-tzimmermann@suse.de>
Cc: linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
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
Content-Type: multipart/mixed; boundary="===============0976482559855808486=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0976482559855808486==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------GPVXmD7iNMJWP3LqkiQ11my6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------GPVXmD7iNMJWP3LqkiQ11my6
Content-Type: multipart/mixed; boundary="------------KxFKFAPZXOS0zvnyzbK0eN9w";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sam@ravnborg.org, jose.exposito89@gmail.com, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, noralf@tronnes.org, drawat.floss@gmail.com,
 lucas.demarchi@intel.com, david@lechnology.com, kraxel@redhat.com
Cc: linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Message-ID: <4cf932bc-97a4-942b-c308-be02107c0806@suse.de>
Subject: Re: [PATCH v2 00/14] drm/format-helper: Move to struct iosys_map
References: <20220808125406.20752-1-tzimmermann@suse.de>
In-Reply-To: <20220808125406.20752-1-tzimmermann@suse.de>

--------------KxFKFAPZXOS0zvnyzbK0eN9w
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

VGhhbmtzIGV2ZXJ5b25lIGZvciByZXZpZXdpbmcgYW5kIHRlc3RpbmcuDQoNCkFtIDA4LjA4
LjIyIHVtIDE0OjUzIHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46DQo+IENoYW5nZSBmb3Jt
YXQtY29udmVyc2lvbiBoZWxwZXJzIHRvIHVzZSBzdHJ1Y3QgaW9zeXNfbWFwIGZvciBzb3Vy
Y2UNCj4gYW5kIGRlc3RpbmF0aW9uIGJ1ZmZlcnMuIFVwZGF0ZSBhbGwgdXNlcnMuIEFsc28g
cHJlcGFyZSBpbnRlcmZhY2UgZm9yDQo+IG11bHRpLXBsYW5lIGNvbG9yIGZvcm1hdHMuDQo+
IA0KPiBUaGUgZm9ybWF0LWNvbnZlcnNpb24gaGVscGVycyBtb3N0bHkgdXNlZCB0byBjb252
ZXJ0IHRvIEkvTyBtZW1vcnkNCj4gb3Igc3lzdGVtIG1lbW9yeS4gVG8gYWN0dWFsIG1lbW9y
eSB0eXBlIGRlcGVuZGVkIG9uIHRoZSB1c2VjYXNlLiBXZQ0KPiBub3cgaGF2ZSBkcml2ZXJz
IHVwY29tbWluZyB0aGF0IGRvIHRoZSBjb252ZXJzaW9uIGVudGlyZWx5IGluIHN5c3RlbQ0K
PiBtZW1vcnkuIEl0J3MgYSBnb29kIG9wcG9ydHVuaXR5IHRvIHN0cmVhbS1saW5lIHRoZSBp
bnRlcmZhY2Ugb2YgdGhlDQo+IGNvbnZlcnNpb24gaGVscGVycyB0byB1c2Ugc3RydWN0IGlv
c3lzX21hcC4gU291cmNlIGFuZCBkZXN0aW5hdGlvbg0KPiBidWZmZXJzIGNhbiBub3cgYmUg
ZWl0aGVyIGluIHN5c3RlbSBvciBpbiBJL08gbWVtb3J5LiBOb3RlIHRoYXQgdGhlDQo+IGlt
cGxlbWVudGF0aW9uIHN0aWxsIG9ubHkgc3VwcG9ydHMgc291cmNlIGJ1ZmZlcnMgaW4gc3lz
dGVtIG1lbW9yeS4NCj4gDQo+IFRoaXMgcGF0Y2hzZXQgYWxzbyBjaGFuZ2VzIHRoZSBpbnRl
cmZhY2UgdG8gc3VwcG9ydCBtdWx0aS1wbGFuZQ0KPiBjb2xvciBmb3JtYXRzLCB3aGVyZSB0
aGUgdmFsdWVzIGZvciBlYWNoIGNvbXBvbmVudCBhcmUgc3RvcmVkIGluDQo+IGRpc3RpbmN0
IG1lbW9yeSBsb2NhdGlvbnMuIENvbnZlcnRpbmcgZnJvbSBSR0JSR0JSR0IgdG8gUlJSR0dH
QkJCDQo+IHdvdWxkIHJlcXVpcmUgYSBzaW5nbGUgc291cmNlIGJ1ZmZlciB3aXRoIFJHQiB2
YWx1ZXMgYW5kIDMgZGVzdGluYXRpb24NCj4gYnVmZmVycyBmb3IgdGhlIFIsIEcgYW5kIEIg
dmFsdWVzLiBDb252ZXJzaW9uLWhlbHBlciBpbnRlcmZhY2VzIG5vdw0KPiBzdXBwb3J0IHRo
aXMuDQo+IA0KPiB2MjoNCj4gCSogYWRkIElPU1lTX01BUF9JTklUX1ZBRERSX0lPTUVNIChT
YW0pDQo+IAkqIHVzZSBkcm1fZm9ybWF0X2luZm9fYnBwKCkgKFNhbSkNCj4gCSogdXBkYXRl
IGRvY3VtZW50YXRpb24gKFNhbSkNCj4gCSogcmVuYW1lICd2bWFwJyB0byAnc3JjJyAoU2Ft
KQ0KPiAJKiBtYW55IHNtYWxsZXIgY2xlYW51cHMgYW5kIGZpeGVzIChTYW0sIEpvc2UpDQo+
IA0KPiBUaG9tYXMgWmltbWVybWFubiAoMTQpOg0KPiAgICBpb3N5cy1tYXA6IEFkZCBJT1NZ
U19NQVBfSU5JVF9WQUREUl9JT01FTSgpDQo+ICAgIGRybS9mb3JtYXQtaGVscGVyOiBQcm92
aWRlIGRybV9mYl9ibGl0KCkNCj4gICAgZHJtL2Zvcm1hdC1oZWxwZXI6IE1lcmdlIGRybV9m
Yl9tZW1jcHkoKSBhbmQgZHJtX2ZiX21lbWNweV90b2lvKCkNCj4gICAgZHJtL2Zvcm1hdC1o
ZWxwZXI6IENvbnZlcnQgZHJtX2ZiX3N3YWIoKSB0byBzdHJ1Y3QgaW9zeXNfbWFwDQo+ICAg
IGRybS9mb3JtYXQtaGVscGVyOiBSZXdvcmsgWFJHQjg4ODgtdG8tUkdCRzMzMiBjb252ZXJz
aW9uDQo+ICAgIGRybS9mb3JtYXQtaGVscGVyOiBSZXdvcmsgWFJHQjg4ODgtdG8tUkdCRzU2
NSBjb252ZXJzaW9uDQo+ICAgIGRybS9mb3JtYXQtaGVscGVyOiBSZXdvcmsgWFJHQjg4ODgt
dG8tUkdCODg4IGNvbnZlcnNpb24NCj4gICAgZHJtL2Zvcm1hdC1oZWxwZXI6IFJld29yayBS
R0I1NjUtdG8tWFJHQjg4ODggY29udmVyc2lvbg0KPiAgICBkcm0vZm9ybWF0LWhlbHBlcjog
UmV3b3JrIFJHQjg4OC10by1YUkdCODg4OCBjb252ZXJzaW9uDQo+ICAgIGRybS9mb3JtYXQt
aGVscGVyOiBSZXdvcmsgWFJHQjg4ODgtdG8tWFJHQjIxMDEwMTAgY29udmVyc2lvbg0KPiAg
ICBkcm0vZm9ybWF0LWhlbHBlcjogUmV3b3JrIFhSR0I4ODg4LXRvLUdSQVk4IGNvbnZlcnNp
b24NCj4gICAgZHJtL2Zvcm1hdC1oZWxwZXI6IFJld29yayBYUkdCODg4OC10by1NT05PIGNv
bnZlcnNpb24NCj4gICAgZHJtL2Zvcm1hdC1oZWxwZXI6IE1vdmUgZGVzdGluYXRpb24tYnVm
ZmVyIGhhbmRsaW5nIGludG8gaW50ZXJuYWwNCj4gICAgICBoZWxwZXINCj4gICAgZHJtL2Zv
cm1hdC1oZWxwZXI6IFJlbmFtZSBwYXJhbWV0ZXIgdm1hcCB0byBzcmMNCj4gDQo+ICAgZHJp
dmVycy9ncHUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmMgICAgICAgICAgIHwgNTA5ICsrKysr
KysrKystLS0tLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fbWlwaV9kYmkuYyAgICAg
ICAgICAgICAgICB8ICAgOSArLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9ndWQvZ3VkX3BpcGUu
YyAgICAgICAgICAgICAgICB8ICAyMCArLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9oeXBlcnYv
aHlwZXJ2X2RybV9tb2Rlc2V0LmMgICB8ICAgOSArLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9t
Z2FnMjAwL21nYWcyMDBfbW9kZS5jICAgICAgICB8ICAgOSArLQ0KPiAgIGRyaXZlcnMvZ3B1
L2RybS9zb2xvbW9uL3NzZDEzMHguYyAgICAgICAgICAgICB8ICAgNyArLQ0KPiAgIC4uLi9n
cHUvZHJtL3Rlc3RzL2RybV9mb3JtYXRfaGVscGVyX3Rlc3QuYyAgICB8ICA0NSArLQ0KPiAg
IGRyaXZlcnMvZ3B1L2RybS90aW55L2NpcnJ1cy5jICAgICAgICAgICAgICAgICB8ICAxOSAr
LQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS90aW55L3JlcGFwZXIuYyAgICAgICAgICAgICAgICB8
ICAgNiArLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS90aW55L3NpbXBsZWRybS5jICAgICAgICAg
ICAgICB8ICAgOCArLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS90aW55L3N0NzU4Ni5jICAgICAg
ICAgICAgICAgICB8ICAgNSArLQ0KPiAgIGluY2x1ZGUvZHJtL2RybV9mb3JtYXRfaGVscGVy
LmggICAgICAgICAgICAgICB8ICA1NiArLQ0KPiAgIGluY2x1ZGUvbGludXgvaW9zeXMtbWFw
LmggICAgICAgICAgICAgICAgICAgICB8ICAxNSArLQ0KPiAgIDEzIGZpbGVzIGNoYW5nZWQs
IDQxNiBpbnNlcnRpb25zKCspLCAzMDEgZGVsZXRpb25zKC0pDQo+IA0KPiANCj4gYmFzZS1j
b21taXQ6IDJiZGFlNjZjOTk4OGRkMGYwNzYzMzYyOWMwYTg1MzgzY2ZjMDU5NDANCj4gcHJl
cmVxdWlzaXRlLXBhdGNoLWlkOiBjMmIyZjA4ZjBlY2NjOWY1ZGYwYzBkYTQ5ZmExZDM2MjY3
ZGViMTFkDQo+IHByZXJlcXVpc2l0ZS1wYXRjaC1pZDogYzY3ZTVkODg2YTQ3YjdkMDI2NmQ4
MTEwMDgzNzU1N2ZkYTM0Y2IyNA0KPiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IDNmMjA0NTEw
ZmNiZjk1MzBkNjU0MGJkOGU2MTI4Y2NlNTk4OTg4YjYNCg0KLS0gDQpUaG9tYXMgWmltbWVy
bWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlv
bnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1h
bnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8g
VG90ZXYNCg==

--------------KxFKFAPZXOS0zvnyzbK0eN9w--

--------------GPVXmD7iNMJWP3LqkiQ11my6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLzWUoFAwAAAAAACgkQlh/E3EQov+DS
9A/9FD1Pw34IL/LbMSAIN8BGK/pDIjXEp2Bws9ZGZZ+evPcBDH6tJBdWO5Mqh5aY0EAe4g1tSrqG
Fr8eFrvosMxX3MpE2AOMaW9FpZ1M/c4vl2Wrpu7JYoYqBYZi5/OOC/Ga904U/llUiSczIU+nAuLz
jZ6ANEF7SBPlcFcFJMDdWffDKEjw30HNyCJ3EI1awp8vYd0hsZc1AjQoDkDNyLtMsokzyWnCHMS3
65twNIoxRFSvLy5RQSteI9SSTsajB5EdBw123OjU4B0zhIaSOIwYFjUZYYvlq57yWOXKVWong0iF
22BdL7SpM1LbSIeiEDLfCaQ3qAyEwHvXaxCLfY7pOqREVtIf8dCbtrfG6IHytxTCHOryU1bSW9K8
fIF6SgmJANeHJ1glRK3OQ9FgRSwCg3gbneZgykVGkYeKm7jksCa6Zb+zRxwoKzKz9wNSYwq2uMm2
A+Z0GRCvNkA5sfp0dzrLNxf2nNlLQkMZgCy7bg2B/kDjm+QzTSeXkybmvAifRmtmH/ZAxzR1D146
FF8uJKQY2ke8IYU0uKlmCT/PiMbM5Q+o+TdB7NnAzpHBhLkdna62sI9HpD76B027tv7sjo/upbyk
5sYRzKxj9WXScIccYtoUVPViJxKByBKhTl/MVs3gI1Dmca7r5Jpj4QP0KSIJIK7G8d1bllWmF2MF
ZH4=
=cRX2
-----END PGP SIGNATURE-----

--------------GPVXmD7iNMJWP3LqkiQ11my6--

--===============0976482559855808486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============0976482559855808486==--
