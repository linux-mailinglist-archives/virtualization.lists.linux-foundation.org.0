Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BD355B7E0
	for <lists.virtualization@lfdr.de>; Mon, 27 Jun 2022 07:57:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73B2B60671;
	Mon, 27 Jun 2022 05:57:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73B2B60671
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=Zv+Q8OfV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UcDf-TGQCLQP; Mon, 27 Jun 2022 05:57:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CF35D60B96;
	Mon, 27 Jun 2022 05:57:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF35D60B96
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B2EAC0081;
	Mon, 27 Jun 2022 05:57:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2479AC002D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Jun 2022 05:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED6E982F14
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Jun 2022 05:57:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED6E982F14
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com
 header.a=rsa-sha256 header.s=susede1 header.b=Zv+Q8OfV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9oHYlhsWdIVA
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Jun 2022 05:57:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF4BA82F06
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF4BA82F06
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Jun 2022 05:57:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 780151F92B;
 Mon, 27 Jun 2022 05:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1656309450; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qGJPCCmBA1Y7Cy8WFihr48vYjToeNjedOQ5JVevQYus=;
 b=Zv+Q8OfVnsNHGxQ5MGD671GfOuqnyIDfIE7ON175O/xh2fU7DZdpJBLvSVJdkfl0INCOUy
 Xd0vtBowlJN6xoZECbzJoTnizQNfzwOt842c8c/ANc3ZS5j5D2wWSS6+hNhyxFfseAhOiX
 599NsNFem1t5Qxb8tG7DnpXQ9qT0zyU=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F0C2C13AF4;
 Mon, 27 Jun 2022 05:57:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id USR3OclGuWLLTwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 27 Jun 2022 05:57:29 +0000
Message-ID: <182260a1-0673-b65c-fc33-54548723e0c1@suse.com>
Date: Mon, 27 Jun 2022 07:57:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] x86/paravirt: useless assignment instructions cause
 Unixbench full core performance degradation
Content-Language: en-US
To: Guo Hui <guohui@uniontech.com>, peterz@infradead.org
References: <f6b68466-968c-4a91-655a-23970280a072@redhat.com>
 <20220627021350.25714-1-guohui@uniontech.com>
In-Reply-To: <20220627021350.25714-1-guohui@uniontech.com>
Cc: x86@kernel.org, hpa@zytor.com, pv-drivers@vmware.com, boqun.feng@gmail.com,
 dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, mingo@redhat.com, bp@alien8.de,
 amakhalov@vmware.com, longman@redhat.com, tglx@linutronix.de, will@kernel.org,
 wangxiaohua@uniontech.com
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
Content-Type: multipart/mixed; boundary="===============8323886057096357810=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8323886057096357810==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------trrwYQIKpMVZWVu5lN2eJm65"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------trrwYQIKpMVZWVu5lN2eJm65
Content-Type: multipart/mixed; boundary="------------bYF6Z0gk5pWIAs176JcQE00K";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Guo Hui <guohui@uniontech.com>, peterz@infradead.org
Cc: longman@redhat.com, srivatsa@csail.mit.edu, amakhalov@vmware.com,
 pv-drivers@vmware.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, will@kernel.org,
 boqun.feng@gmail.com, virtualization@lists.linux-foundation.org,
 wangxiaohua@uniontech.com, linux-kernel@vger.kernel.org
Message-ID: <182260a1-0673-b65c-fc33-54548723e0c1@suse.com>
Subject: Re: [PATCH v2] x86/paravirt: useless assignment instructions cause
 Unixbench full core performance degradation
References: <f6b68466-968c-4a91-655a-23970280a072@redhat.com>
 <20220627021350.25714-1-guohui@uniontech.com>
In-Reply-To: <20220627021350.25714-1-guohui@uniontech.com>

--------------bYF6Z0gk5pWIAs176JcQE00K
Content-Type: multipart/mixed; boundary="------------o9B88b00thZImOUQl0pgu0C0"

--------------o9B88b00thZImOUQl0pgu0C0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDYuMjIgMDQ6MTMsIEd1byBIdWkgd3JvdGU6DQo+IFRoZSBpbnN0cnVjdGlvbnMg
YXNzaWduZWQgdG8gdGhlIHZjcHVfaXNfcHJlZW1wdGVkIGZ1bmN0aW9uIHBhcmFtZXRlcg0K
PiBpbiB0aGUgWDg2IGFyY2hpdGVjdHVyZSBwaHlzaWNhbCBtYWNoaW5lIGFyZSByZWR1bmRh
bnQgaW5zdHJ1Y3Rpb25zLA0KPiBjYXVzaW5nIHRoZSBtdWx0aS1jb3JlIHBlcmZvcm1hbmNl
IG9mIFVuaXhiZW5jaCB0byBkcm9wIGJ5IGFib3V0IDQlIHRvIDUlLg0KPiBUaGUgQyBmdW5j
dGlvbiBpcyBhcyBmb2xsb3dzOg0KPiBzdGF0aWMgYm9vbCB2Y3B1X2lzX3ByZWVtcHRlZChs
b25nIHZjcHUpOw0KPiANCj4gVGhlIHBhcmFtZXRlciAndmNwdScgaW4gdGhlIGZ1bmN0aW9u
IG9zcV9sb2NrDQo+IHRoYXQgY2FsbHMgdGhlIGZ1bmN0aW9uIHZjcHVfaXNfcHJlZW1wdGVk
IGlzIGFzc2lnbmVkIGFzIGZvbGxvd3M6DQo+IA0KPiBUaGUgQyBjb2RlIGlzIGluIHRoZSBm
dW5jdGlvbiBub2RlX2NwdToNCj4gY3B1ID0gbm9kZS0+Y3B1IC0gMTsNCj4gDQo+IFRoZSBp
bnN0cnVjdGlvbnMgY29ycmVzcG9uZGluZyB0byB0aGUgQyBjb2RlIGFyZToNCj4gbW92IDB4
MTQoJXJheCksJWVkaQ0KPiBzdWIgJDB4MSwlZWRpDQo+IA0KPiBUaGUgYWJvdmUgaW5zdHJ1
Y3Rpb25zIGFyZSB1bm5lY2Vzc2FyeQ0KPiBpbiB0aGUgWDg2IE5hdGl2ZSBvcGVyYXRpbmcg
ZW52aXJvbm1lbnQsDQo+IGNhdXNpbmcgaGlnaCBjYWNoZS1taXNzZXMgYW5kIGRlZ3JhZGlu
ZyBwZXJmb3JtYW5jZS4NCj4gDQo+IFRoaXMgcGF0Y2ggdXNlcyBzdGF0aWNfa2V5IHRvIG5v
dCBleGVjdXRlIHRoaXMgaW5zdHJ1Y3Rpb24NCj4gaW4gdGhlIE5hdGl2ZSBydW50aW1lIGVu
dmlyb25tZW50Lg0KPiANCj4gVGhlIGNvZGUgaXMgYXMgZm9sbG93czoNCj4gDQo+IERFRklO
RV9TVEFUSUNfS0VZX0ZBTFNFKHByZWVtdGVkX2tleSk7DQo+IA0KPiBzdGF0aWMgaW5saW5l
IGludCBub2RlX2NwdShzdHJ1Y3Qgb3B0aW1pc3RpY19zcGluX25vZGUgKm5vZGUpDQo+IHsN
Cj4gICAgICAgaW50IGNwdSA9IDA7DQo+IA0KPiAgICAgICBpZiAoIXN0YXRpY19icmFuY2hf
dW5saWtlbHkoJnByZWVtdGVkX2tleSkpDQo+ICAgICAgICAgICAgICAgY3B1ID0gbm9kZS0+
Y3B1IC0gMTsNCj4gDQo+ICAgICAgIHJldHVybiBjcHU7DQo+IH0NCj4gDQo+IFRoZSBwYXRj
aCBlZmZlY3QgaXMgYXMgZm9sbG93cyB0d28gbWFjaGluZXMsDQo+IFVuaXhiZW5jaCBydW5z
IHdpdGggZnVsbCBjb3JlIHNjb3JlOg0KPiANCj4gMS4gTWFjaGluZSBjb25maWd1cmF0aW9u
Og0KPiBJbnRlbChSKSBYZW9uKFIpIFNpbHZlciA0MjEwIENQVSBAIDIuMjBHSHoNCj4gQ1BV
IGNvcmU6IDQwDQo+IE1lbW9yeTogMjU2Rw0KPiBPUyBLZXJuZWw6IDUuMTktcmMzDQo+IA0K
PiBCZWZvcmUgdXNpbmcgdGhlIHBhdGNoOg0KPiBTeXN0ZW0gQmVuY2htYXJrcyBJbmRleCBW
YWx1ZXMgICAgICAgICAgICAgICBCQVNFTElORSAgICAgICBSRVNVTFQgICAgSU5ERVgNCj4g
RGhyeXN0b25lIDIgdXNpbmcgcmVnaXN0ZXIgdmFyaWFibGVzICAgICAgICAgMTE2NzAwLjAg
IDk0ODMyNjU5MS4yICA4MTI2MS45DQo+IERvdWJsZS1QcmVjaXNpb24gV2hldHN0b25lICAg
ICAgICAgICAgICAgICAgICAgICA1NS4wICAgICAyMTE5ODYuMyAgMzg1NDMuMA0KPiBFeGVj
bCBUaHJvdWdocHV0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgNDMuMCAgICAg
IDQzNDUzLjIgIDEwMTA1LjQNCj4gRmlsZSBDb3B5IDEwMjQgYnVmc2l6ZSAyMDAwIG1heGJs
b2NrcyAgICAgICAgICAzOTYwLjAgICAgIDQzODkzNi4yICAgMTEwOC40DQo+IEZpbGUgQ29w
eSAyNTYgYnVmc2l6ZSA1MDAgbWF4YmxvY2tzICAgICAgICAgICAgMTY1NS4wICAgICAxMTgx
OTcuNCAgICA3MTQuMg0KPiBGaWxlIENvcHkgNDA5NiBidWZzaXplIDgwMDAgbWF4YmxvY2tz
ICAgICAgICAgIDU4MDAuMCAgICAxNTM0Njc0LjcgICAyNjQ2LjANCj4gUGlwZSBUaHJvdWdo
cHV0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDEyNDQwLjAgICA0NjQ4MjEwNy42
ICAzNzM2NS4wDQo+IFBpcGUtYmFzZWQgQ29udGV4dCBTd2l0Y2hpbmcgICAgICAgICAgICAg
ICAgICAgNDAwMC4wICAgIDE5MTUwOTQuMiAgIDQ3ODcuNw0KPiBQcm9jZXNzIENyZWF0aW9u
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAxMjYuMCAgICAgIDg1NDQyLjIgICA2
NzgxLjENCj4gU2hlbGwgU2NyaXB0cyAoMSBjb25jdXJyZW50KSAgICAgICAgICAgICAgICAg
ICAgIDQyLjQgICAgICA2OTQwMC43ICAxNjM2OC4xDQo+IFNoZWxsIFNjcmlwdHMgKDggY29u
Y3VycmVudCkgICAgICAgICAgICAgICAgICAgICAgNi4wICAgICAgIDg4NzcuMiAgMTQ3OTUu
Mw0KPiBTeXN0ZW0gQ2FsbCBPdmVyaGVhZCAgICAgICAgICAgICAgICAgICAgICAgICAgMTUw
MDAuMCAgICA0NzE0OTA2LjEgICAzMTQzLjMNCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA9PT09PT09PQ0K
PiBTeXN0ZW0gQmVuY2htYXJrcyBJbmRleCBTY29yZSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICA3OTIzLjMNCj4gDQo+IEFmdGVyIHVzaW5nIHRoZSBwYXRjaDoN
Cj4gU3lzdGVtIEJlbmNobWFya3MgSW5kZXggVmFsdWVzICAgICAgICAgICAgICAgQkFTRUxJ
TkUgICAgICAgUkVTVUxUICAgIElOREVYDQo+IERocnlzdG9uZSAyIHVzaW5nIHJlZ2lzdGVy
IHZhcmlhYmxlcyAgICAgICAgIDExNjcwMC4wICA5NDcwMzI5MTUuNSAgODExNTEuMQ0KPiBE
b3VibGUtUHJlY2lzaW9uIFdoZXRzdG9uZSAgICAgICAgICAgICAgICAgICAgICAgNTUuMCAg
ICAgMjExOTcxLjIgIDM4NTQwLjINCj4gRXhlY2wgVGhyb3VnaHB1dCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDQzLjAgICAgICA0NTA1NC44ICAxMDQ3Ny45DQo+IEZpbGUg
Q29weSAxMDI0IGJ1ZnNpemUgMjAwMCBtYXhibG9ja3MgICAgICAgICAgMzk2MC4wICAgICA1
MTUwMjQuOSAgIDEzMDAuNg0KPiBGaWxlIENvcHkgMjU2IGJ1ZnNpemUgNTAwIG1heGJsb2Nr
cyAgICAgICAgICAgIDE2NTUuMCAgICAgMTQ2MzU0LjYgICAgODg0LjMNCj4gRmlsZSBDb3B5
IDQwOTYgYnVmc2l6ZSA4MDAwIG1heGJsb2NrcyAgICAgICAgICA1ODAwLjAgICAgMTY3OTk5
NS45ICAgMjg5Ni41DQo+IFBpcGUgVGhyb3VnaHB1dCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAxMjQ0MC4wICAgNDY0NjYzOTQuMiAgMzczNTIuNA0KPiBQaXBlLWJhc2VkIENv
bnRleHQgU3dpdGNoaW5nICAgICAgICAgICAgICAgICAgIDQwMDAuMCAgICAxODk4MjIxLjQg
ICA0NzQ1LjYNCj4gUHJvY2VzcyBDcmVhdGlvbiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgMTI2LjAgICAgICA4NTY1My4xICAgNjc5Ny45DQo+IFNoZWxsIFNjcmlwdHMgKDEg
Y29uY3VycmVudCkgICAgICAgICAgICAgICAgICAgICA0Mi40ICAgICAgNjk0MzcuMyAgMTYz
NzYuNw0KPiBTaGVsbCBTY3JpcHRzICg4IGNvbmN1cnJlbnQpICAgICAgICAgICAgICAgICAg
ICAgIDYuMCAgICAgICA4ODk4LjkgIDE0ODMxLjQNCj4gU3lzdGVtIENhbGwgT3ZlcmhlYWQg
ICAgICAgICAgICAgICAgICAgICAgICAgIDE1MDAwLjAgICAgNDY1ODc0Ni43ICAgMzEwNS44
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgPT09PT09PT0NCj4gU3lzdGVtIEJlbmNobWFya3MgSW5kZXgg
U2NvcmUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgODI0OC44DQo+
IA0KPiAyLiBNYWNoaW5lIGNvbmZpZ3VyYXRpb246DQo+IEh5Z29uIEM4NiA3MTg1IDMyLWNv
cmUgUHJvY2Vzc29yDQo+IENQVSBjb3JlOiAxMjgNCj4gTWVtb3J5OiAyNTZHDQo+IE9TIEtl
cm5lbDogNS4xOS1yYzMNCj4gDQo+IEJlZm9yZSB1c2luZyB0aGUgcGF0Y2g6DQo+IFN5c3Rl
bSBCZW5jaG1hcmtzIEluZGV4IFZhbHVlcyAgICAgICAgICAgICAgIEJBU0VMSU5FICAgICAg
IFJFU1VMVCAgICBJTkRFWA0KPiBEaHJ5c3RvbmUgMiB1c2luZyByZWdpc3RlciB2YXJpYWJs
ZXMgICAgICAgICAxMTY3MDAuMCAyMjU2NjQ0MDY4LjMgMTkzMzcxLjQNCj4gRG91YmxlLVBy
ZWNpc2lvbiBXaGV0c3RvbmUgICAgICAgICAgICAgICAgICAgICAgIDU1LjAgICAgIDQzODk2
OS45ICA3OTgxMi43DQo+IEV4ZWNsIFRocm91Z2hwdXQgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICA0My4wICAgICAgMTAxMDguNiAgIDIzNTAuOA0KPiBGaWxlIENvcHkgMTAy
NCBidWZzaXplIDIwMDAgbWF4YmxvY2tzICAgICAgICAgIDM5NjAuMCAgICAgMjc1ODkyLjgg
ICAgNjk2LjcNCj4gRmlsZSBDb3B5IDI1NiBidWZzaXplIDUwMCBtYXhibG9ja3MgICAgICAg
ICAgICAxNjU1LjAgICAgICA3MjA4Mi43ICAgIDQzNS41DQo+IEZpbGUgQ29weSA0MDk2IGJ1
ZnNpemUgODAwMCBtYXhibG9ja3MgICAgICAgICAgNTgwMC4wICAgICA5MjUwNDMuNCAgIDE1
OTQuOQ0KPiBQaXBlIFRocm91Z2hwdXQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
MTI0NDAuMCAgMTE4OTA1NTEyLjUgIDk1NTgzLjINCj4gUGlwZS1iYXNlZCBDb250ZXh0IFN3
aXRjaGluZyAgICAgICAgICAgICAgICAgICA0MDAwLjAgICAgNzgyMDk0NS43ICAxOTU1Mi40
DQo+IFByb2Nlc3MgQ3JlYXRpb24gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDEy
Ni4wICAgICAgMzEyMzMuMyAgIDI0NzguOA0KPiBTaGVsbCBTY3JpcHRzICgxIGNvbmN1cnJl
bnQpICAgICAgICAgICAgICAgICAgICAgNDIuNCAgICAgIDQ5MDQyLjggIDExNTY2LjcNCj4g
U2hlbGwgU2NyaXB0cyAoOCBjb25jdXJyZW50KSAgICAgICAgICAgICAgICAgICAgICA2LjAg
ICAgICAgNjY1Ni4wICAxMTA5My4zDQo+IFN5c3RlbSBDYWxsIE92ZXJoZWFkICAgICAgICAg
ICAgICAgICAgICAgICAgICAxNTAwMC4wICAgIDY4MTYwNDcuNSAgIDQ1NDQuMA0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgID09PT09PT09DQo+IFN5c3RlbSBCZW5jaG1hcmtzIEluZGV4IFNjb3JlICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDc3NTYuNg0KPiANCj4gQWZ0
ZXIgdXNpbmcgdGhlIHBhdGNoOg0KPiBTeXN0ZW0gQmVuY2htYXJrcyBJbmRleCBWYWx1ZXMg
ICAgICAgICAgICAgICBCQVNFTElORSAgICAgICBSRVNVTFQgICAgSU5ERVgNCj4gRGhyeXN0
b25lIDIgdXNpbmcgcmVnaXN0ZXIgdmFyaWFibGVzICAgICAgICAgMTE2NzAwLjAgMjI1MjI3
MjkyOS40IDE5Mjk5Ni44DQo+IERvdWJsZS1QcmVjaXNpb24gV2hldHN0b25lICAgICAgICAg
ICAgICAgICAgICAgICA1NS4wICAgICA0NTE4NDcuMiAgODIxNTQuMA0KPiBFeGVjbCBUaHJv
dWdocHV0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgNDMuMCAgICAgIDEwNTk1
LjEgICAyNDY0LjANCj4gRmlsZSBDb3B5IDEwMjQgYnVmc2l6ZSAyMDAwIG1heGJsb2NrcyAg
ICAgICAgICAzOTYwLjAgICAgIDMwMTI3OS4zICAgIDc2MC44DQo+IEZpbGUgQ29weSAyNTYg
YnVmc2l6ZSA1MDAgbWF4YmxvY2tzICAgICAgICAgICAgMTY1NS4wICAgICAgNzkyOTEuMyAg
ICA0NzkuMQ0KPiBGaWxlIENvcHkgNDA5NiBidWZzaXplIDgwMDAgbWF4YmxvY2tzICAgICAg
ICAgIDU4MDAuMCAgICAxMDM5NzU1LjIgICAxNzkyLjcNCj4gUGlwZSBUaHJvdWdocHV0ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIDEyNDQwLjAgIDExODcwMTQ2OC4xICA5NTQx
OS4yDQo+IFBpcGUtYmFzZWQgQ29udGV4dCBTd2l0Y2hpbmcgICAgICAgICAgICAgICAgICAg
NDAwMC4wICAgIDgwNzM0NTMuMyAgMjAxODMuNg0KPiBQcm9jZXNzIENyZWF0aW9uICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAxMjYuMCAgICAgIDMzNDQwLjkgICAyNjU0LjAN
Cj4gU2hlbGwgU2NyaXB0cyAoMSBjb25jdXJyZW50KSAgICAgICAgICAgICAgICAgICAgIDQy
LjQgICAgICA1MjcyMi42ICAxMjQzNC42DQo+IFNoZWxsIFNjcmlwdHMgKDggY29uY3VycmVu
dCkgICAgICAgICAgICAgICAgICAgICAgNi4wICAgICAgIDcwNTAuNCAgMTE3NTAuNg0KPiBT
eXN0ZW0gQ2FsbCBPdmVyaGVhZCAgICAgICAgICAgICAgICAgICAgICAgICAgMTUwMDAuMCAg
ICA2ODM0MzcxLjUgICA0NTU2LjINCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA9PT09PT09PQ0KPiBTeXN0
ZW0gQmVuY2htYXJrcyBJbmRleCBTY29yZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICA4MTU3LjgNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEd1byBIdWkgPGd1b2h1
aUB1bmlvbnRlY2guY29tPg0KPiAtLS0NCj4gICBhcmNoL3g4Ni9rZXJuZWwvcGFyYXZpcnQt
c3BpbmxvY2tzLmMgfCA0ICsrKysNCj4gICBrZXJuZWwvbG9ja2luZy9vc3FfbG9jay5jICAg
ICAgICAgICAgfCA5ICsrKysrKysrLQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tl
cm5lbC9wYXJhdmlydC1zcGlubG9ja3MuYyBiL2FyY2gveDg2L2tlcm5lbC9wYXJhdmlydC1z
cGlubG9ja3MuYw0KPiBpbmRleCA5ZTFlYTk5YWQuLjdhNTVmODQwNyAxMDA2NDQNCj4gLS0t
IGEvYXJjaC94ODYva2VybmVsL3BhcmF2aXJ0LXNwaW5sb2Nrcy5jDQo+ICsrKyBiL2FyY2gv
eDg2L2tlcm5lbC9wYXJhdmlydC1zcGlubG9ja3MuYw0KPiBAQCAtMzMsNiArMzMsOCBAQCBi
b29sIHB2X2lzX25hdGl2ZV92Y3B1X2lzX3ByZWVtcHRlZCh2b2lkKQ0KPiAgIAkJX19yYXdf
Y2FsbGVlX3NhdmVfX19uYXRpdmVfdmNwdV9pc19wcmVlbXB0ZWQ7DQo+ICAgfQ0KPiAgIA0K
PiArREVDTEFSRV9TVEFUSUNfS0VZX0ZBTFNFKHByZWVtdGVkX2tleSk7DQoNClBsZWFzZSBu
YW1lIGl0ICJwcmVlbXB0ZWRfa2V5Ii4NCg0KDQpKdWVyZ2VuDQo=
--------------o9B88b00thZImOUQl0pgu0C0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------o9B88b00thZImOUQl0pgu0C0--

--------------bYF6Z0gk5pWIAs176JcQE00K--

--------------trrwYQIKpMVZWVu5lN2eJm65
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmK5RskFAwAAAAAACgkQsN6d1ii/Ey+o
2Af9EEb+UBvBElQqkZGBqAVda06L5+2mgjBDygdAtHcj95hODsw0RobC6Z+H3sqZEavOjOC3KG6B
t3mCfdPE6Kwq7AgMeW9YAD/Vd1s14OIWRjH8NFD6dN7HYbzwavkbF9D8qQ9bajrHQWDgLJajrYvY
uvs2v2KoqAx2LrDSKgnOIrhPYQN9Lzdheq06VbgpQ0mGjjuXmfD5E0WSFY8BgltXfOywYUqfqZPu
vwaaqV38lLVA5aerqJ4oQ8iEHEcikkyJj69YoPylFHbzfb2RWWsFtFjyn1OgKSWvr+7T1Wv755rC
ZCa/VmzrNOH2lpbSMfWbhBzNWFTX5HsVd+asza+Uaw==
=jwjb
-----END PGP SIGNATURE-----

--------------trrwYQIKpMVZWVu5lN2eJm65--

--===============8323886057096357810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============8323886057096357810==--
