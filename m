Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF9E62BAE9
	for <lists.virtualization@lfdr.de>; Wed, 16 Nov 2022 12:07:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52DAC4185F;
	Wed, 16 Nov 2022 11:07:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52DAC4185F
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=B4y9oC5N
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3TNKsQUxRN0k; Wed, 16 Nov 2022 11:07:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B19D941879;
	Wed, 16 Nov 2022 11:07:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B19D941879
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E8A3DC0077;
	Wed, 16 Nov 2022 11:07:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 83345C002D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Nov 2022 11:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E85841832
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Nov 2022 11:07:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E85841832
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C8DVjYwA5X3O
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Nov 2022 11:06:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 219EE4185F
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 219EE4185F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Nov 2022 11:06:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 39C91336F2;
 Wed, 16 Nov 2022 11:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1668596815; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8H5MpNyWys5XrM9KkN1YR1fgG+Yt1/uk71T19AKqQZE=;
 b=B4y9oC5N+jpQY2vxfZCaQSz1PJWNlUfTGrUlm3WaVGiAjj50rLHx9+fqwaWVcKrz1DZyD7
 SOcy/DVhVQBUrL0gRXVDmFbWnn1G5jNhygwA9ND5f5kiKQbCTDWLiaPsX4CwpFhVlOcSwo
 F7I9Z1vvAKBbhkPDgkRJWXI5bVYcwbE=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B0A7D13AC7;
 Wed, 16 Nov 2022 11:06:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Ge5EKU7EdGMeZAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 16 Nov 2022 11:06:54 +0000
Message-ID: <b3535159-b2af-635a-f9b9-4991fed990e4@suse.com>
Date: Wed, 16 Nov 2022 12:06:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2] x86/paravirt: use common macro for creating simple asm
 paravirt functions
Content-Language: en-US
To: Peter Zijlstra <peterz@infradead.org>
References: <20221109134418.6516-1-jgross@suse.com>
 <Y3TD1R9BOb4avCWp@hirez.programming.kicks-ass.net>
In-Reply-To: <Y3TD1R9BOb4avCWp@hirez.programming.kicks-ass.net>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 kvm@vger.kernel.org, VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Wanpeng Li <wanpengli@tencent.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Alexey Makhalov <amakhalov@vmware.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>
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
From: Juergen Gross via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Juergen Gross <jgross@suse.com>
Content-Type: multipart/mixed; boundary="===============7068218440989976581=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============7068218440989976581==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------eAX8XKA6qoU5dfFXA1z1PPZk"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------eAX8XKA6qoU5dfFXA1z1PPZk
Content-Type: multipart/mixed; boundary="------------oAJveYCI8kqJJSBvUaPX0lyi";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux-foundation.org, kvm@vger.kernel.org,
 "Srivatsa S. Bhat (VMware)" <srivatsa@csail.mit.edu>,
 Alexey Makhalov <amakhalov@vmware.com>,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Message-ID: <b3535159-b2af-635a-f9b9-4991fed990e4@suse.com>
Subject: Re: [PATCH v2] x86/paravirt: use common macro for creating simple asm
 paravirt functions
References: <20221109134418.6516-1-jgross@suse.com>
 <Y3TD1R9BOb4avCWp@hirez.programming.kicks-ass.net>
In-Reply-To: <Y3TD1R9BOb4avCWp@hirez.programming.kicks-ass.net>

--------------oAJveYCI8kqJJSBvUaPX0lyi
Content-Type: multipart/mixed; boundary="------------BWlwZfguY4ype2ObzOzWkzNT"

--------------BWlwZfguY4ype2ObzOzWkzNT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMTEuMjIgMTI6MDQsIFBldGVyIFppamxzdHJhIHdyb3RlOg0KPiBPbiBXZWQsIE5v
diAwOSwgMjAyMiBhdCAwMjo0NDoxOFBNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gVGhlcmUgYXJlIHNvbWUgcGFyYXZpcnQgYXNzZW1ibGVyIGZ1bmN0aW9ucyB3aGljaCBh
cmUgc2hhcmluZyBhIGNvbW1vbg0KPj4gcGF0dGVybi4gSW50cm9kdWNlIGEgbWFjcm8gREVG
SU5FX1BBUkFWSVJUX0FTTSgpIGZvciBjcmVhdGluZyB0aGVtLg0KPj4NCj4+IE5vdGUgdGhh
dCB0aGlzIG1hY3JvIGlzIGluY2x1ZGluZyBleHBsaWNpdCBhbGlnbm1lbnQgb2YgdGhlIGdl
bmVyYXRlZA0KPj4gZnVuY3Rpb25zLCBsZWFkaW5nIHRvIF9fcmF3X2NhbGxlZV9zYXZlX19f
a3ZtX3ZjcHVfaXNfcHJlZW1wdGVkKCksDQo+PiBfcGFyYXZpcnRfbm9wKCkgYW5kIHBhcmF2
aXJ0X3JldDAoKSB0byBiZSBhbGlnbmVkIGF0IDQgYnl0ZSBib3VuZGFyaWVzDQo+PiBub3cu
DQo+Pg0KPj4gVGhlIGV4cGxpY2l0IF9wYXJhdmlydF9ub3AoKSBwcm90b3R5cGUgaW4gcGFy
YXZpcnQuYyBpc24ndCBuZWVkZWQsIGFzDQo+PiBpdCBpcyBpbmNsdWRlZCBpbiBwYXJhdmly
dF90eXBlcy5oIGFscmVhZHkuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPg0KPj4gUmV2aWV3ZWQtYnk6IFNyaXZhdHNhIFMuIEJoYXQg
KFZNd2FyZSkgPHNyaXZhdHNhQGNzYWlsLm1pdC5lZHU+DQo+PiAtLS0NCj4gDQo+IFNlZW1z
IG5pY2U7IEkndmUgbWFkZSB0aGUgYmVsb3cgbGl0dGxlIGVkaXRzLCBidXQgdGhpcyBpcyBj
ZXJ0YWlubHkgYQ0KPiBiaXQgbGFyZ2UgZm9yIC91cmdlbnQgYXQgdGhpcyBwb2ludCBpbiB0
aW1lLiBTbyBob3cgYWJvdXQgSSBtZXJnZQ0KPiBsb2NraW5nL3VyZ2VudCBpbnRvIHg4Ni9w
YXJhdmlydCBhbmQgbXVuZ2UgdGhpcyBvbiB0b3A/DQoNCkZpbmUgd2l0aCBtZS4NCg0KVGhh
bmtzIGZvciBsb29raW5nIGF0IHRoZSBwYXRjaCwNCg0KDQpKdWVyZ2VuDQoNCj4gDQo+IC0t
LQ0KPiAtLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wYXJhdmlydC5oDQo+ICsrKyBiL2Fy
Y2gveDg2L2luY2x1ZGUvYXNtL3BhcmF2aXJ0LmgNCj4gQEAgLTczNyw3ICs3MzcsNyBAQCBz
dGF0aWMgX19hbHdheXNfaW5saW5lIHVuc2lnbmVkIGxvbmcgYXJjDQo+ICAgCSAgICAgX19B
TElHTl9TVFIgIlxuIgkJCQlcDQo+ICAgCSAgICAgI2Z1bmMgIjpcblx0IgkJCQlcDQo+ICAg
CSAgICAgQVNNX0VOREJSCQkJCQlcDQo+IC0JICAgICBpbnN0cgkJCQkJXA0KPiArCSAgICAg
aW5zdHIgIlxuXHQiCQkJCVwNCj4gICAJICAgICBBU01fUkVUCQkJCQlcDQo+ICAgCSAgICAg
Ii5zaXplICIgI2Z1bmMgIiwgLiAtICIgI2Z1bmMgIlxuXHQiCVwNCj4gICAJICAgICAiLnBv
cHNlY3Rpb24iKQ0KPiAtLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9xc3BpbmxvY2tfcGFy
YXZpcnQuaA0KPiArKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9xc3BpbmxvY2tfcGFyYXZp
cnQuaA0KPiBAQCAtNTQsOCArNTQsOCBAQCBfX1BWX0NBTExFRV9TQVZFX1JFR1NfVEhVTkso
X19wdl9xdWV1ZWRfDQo+ICAgCSJwb3AgICAgJXJkeFxuXHQiCQkJCQkJXA0KPiAgIAlGUkFN
RV9FTkQNCj4gICANCj4gLURFRklORV9QQVJBVklSVF9BU00oX19yYXdfY2FsbGVlX3NhdmVf
X19wdl9xdWV1ZWRfc3Bpbl91bmxvY2ssIFBWX1VOTE9DS19BU00sDQo+IC0JCSAgICAuc3Bp
bmxvY2sudGV4dCk7DQo+ICtERUZJTkVfUEFSQVZJUlRfQVNNKF9fcmF3X2NhbGxlZV9zYXZl
X19fcHZfcXVldWVkX3NwaW5fdW5sb2NrLA0KPiArCQkgICAgUFZfVU5MT0NLX0FTTSwgLnNw
aW5sb2NrLnRleHQpOw0KPiAgIA0KPiAgICNlbHNlIC8qIENPTkZJR182NEJJVCAqLw0KPiAg
IA0KPiAtLS0gYS9hcmNoL3g4Ni9rZXJuZWwva3ZtLmMNCj4gKysrIGIvYXJjaC94ODYva2Vy
bmVsL2t2bS5jDQo+IEBAIC04MDIsNiArODAyLDcgQEAgZXh0ZXJuIGJvb2wgX19yYXdfY2Fs
bGVlX3NhdmVfX19rdm1fdmNwdQ0KPiAgICAibW92cSAgIF9fcGVyX2NwdV9vZmZzZXQoLCVy
ZGksOCksICVyYXhcblx0IgkJCQkgICAgIFwNCj4gICAgImNtcGIgICAkMCwgIiBfX3N0cmlu
Z2lmeShLVk1fU1RFQUxfVElNRV9wcmVlbXB0ZWQpICIrc3RlYWxfdGltZSglcmF4KVxuXHQi
IFwNCj4gICAgInNldG5lICAlYWxcblx0Ig0KPiArDQo+ICAgREVGSU5FX1BBUkFWSVJUX0FT
TShfX3Jhd19jYWxsZWVfc2F2ZV9fX2t2bV92Y3B1X2lzX3ByZWVtcHRlZCwNCj4gICAJCSAg
ICBQVl9WQ1BVX1BSRUVNUFRFRF9BU00sIC50ZXh0KTsNCj4gICAjZW5kaWYNCj4gLS0tIGEv
YXJjaC94ODYva2VybmVsL3BhcmF2aXJ0LmMNCj4gKysrIGIvYXJjaC94ODYva2VybmVsL3Bh
cmF2aXJ0LmMNCj4gQEAgLTQwLDggKzQwLDcgQEANCj4gICBERUZJTkVfUEFSQVZJUlRfQVNN
KF9wYXJhdmlydF9ub3AsICIiLCAuZW50cnkudGV4dCk7DQo+ICAgDQo+ICAgLyogc3R1YiBh
bHdheXMgcmV0dXJuaW5nIDAuICovDQo+IC0jZGVmaW5lIFBWX1JFVDBfQVNNCSJ4b3IgJSIg
X0FTTV9BWCAiLCAlIiBfQVNNX0FYICJcblx0Ig0KPiAtREVGSU5FX1BBUkFWSVJUX0FTTShw
YXJhdmlydF9yZXQwLCBQVl9SRVQwX0FTTSwgLmVudHJ5LnRleHQpOw0KPiArREVGSU5FX1BB
UkFWSVJUX0FTTShwYXJhdmlydF9yZXQwLCAieG9yICVlYXgsJWVheCIsIC5lbnRyeS50ZXh0
KTsNCj4gICANCj4gICB2b2lkIF9faW5pdCBkZWZhdWx0X2Jhbm5lcih2b2lkKQ0KPiAgIHsN
Cg0K
--------------BWlwZfguY4ype2ObzOzWkzNT
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------BWlwZfguY4ype2ObzOzWkzNT--

--------------oAJveYCI8kqJJSBvUaPX0lyi--

--------------eAX8XKA6qoU5dfFXA1z1PPZk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmN0xE4FAwAAAAAACgkQsN6d1ii/Ey9P
pAf+Ie1yhUMSS//kc3SNLu+XcPBW2v8rc2wF7mklvYqiLXai3JcWu41/IkaCw+he+4aNdoZyK+AC
V5gP+EK2Iq2RXYSVdmDXfRK9kFXHT79zbJuLnROezTnM14skQ/PQQgOJxJbunwBto2lsTihU4Slp
1uts5ZGNQLhUTn8IRaafn9ZZtcAeYlPnh9b57sXIWjSh9KK8ZYLUAq1VRqF2qGF6BPHAXUZWykWN
nqIFFErPixpuCHKQ86SiWDbXwQA6qcHaFtnRRwXnFXLsv1ggPNMVCf+TewJfVsAPhriRJFFJUn8N
T7PAMuGxY/WiuZkIp5dK1A1XLCKWQsKgAIZp0AnU5w==
=fnL5
-----END PGP SIGNATURE-----

--------------eAX8XKA6qoU5dfFXA1z1PPZk--

--===============7068218440989976581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============7068218440989976581==--
