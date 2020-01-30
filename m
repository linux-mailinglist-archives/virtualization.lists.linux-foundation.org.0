Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4BA14DDDF
	for <lists.virtualization@lfdr.de>; Thu, 30 Jan 2020 16:31:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5409622763;
	Thu, 30 Jan 2020 15:31:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R4au4mOBwZCG; Thu, 30 Jan 2020 15:31:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0BEC022731;
	Thu, 30 Jan 2020 15:31:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1541C0171;
	Thu, 30 Jan 2020 15:31:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CECF8C0171
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jan 2020 15:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BCF7B22763
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jan 2020 15:31:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0FzdtWIEZE7H
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jan 2020 15:31:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by silver.osuosl.org (Postfix) with ESMTPS id C7FE52275F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jan 2020 15:31:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jan 2020 07:31:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,382,1574150400"; d="scan'208";a="319241463"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga001.fm.intel.com with ESMTP; 30 Jan 2020 07:31:12 -0800
Received: from fmsmsx155.amr.corp.intel.com (10.18.116.71) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 30 Jan 2020 07:31:12 -0800
Received: from shsmsx154.ccr.corp.intel.com (10.239.6.54) by
 FMSMSX155.amr.corp.intel.com (10.18.116.71) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 30 Jan 2020 07:31:12 -0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.202]) by
 SHSMSX154.ccr.corp.intel.com ([169.254.7.132]) with mapi id 14.03.0439.000;
 Thu, 30 Jan 2020 23:31:10 +0800
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: David Hildenbrand <david@redhat.com>, Tyler Sanderson <tysand@google.com>
Subject: RE: Balloon pressuring page cache
Thread-Topic: Balloon pressuring page cache
Thread-Index: AQHV1jovoZrFI2PKjUOgo5GIAcuyoKgA6/YAgACRPICAAUzXAIAAibNg
Date: Thu, 30 Jan 2020 15:31:09 +0000
Message-ID: <286AC319A985734F985F78AFA26841F73E3F8A02@shsmsx102.ccr.corp.intel.com>
References: <CAJuQAmpDUyve2S+oxp9tLUhuRcnddXnNztC5PmYOOCpY6c68xg@mail.gmail.com>
 <91270a68-ff48-88b0-219c-69801f0c252f@redhat.com>
 <CAJuQAmoaK0Swytu2Os_SQRfG5_LqiCPaDa9yatatm9MtfncNTQ@mail.gmail.com>
 <75d4594f-0864-5172-a0f8-f97affedb366@redhat.com>
In-Reply-To: <75d4594f-0864-5172-a0f8-f97affedb366@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: Michal
 Hocko <mhocko@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 David Rientjes <rientjes@google.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gVGh1cnNkYXksIEphbnVhcnkgMzAsIDIwMjAgMTE6MDMgUE0sIERhdmlkIEhpbGRlbmJyYW5k
IHdyb3RlOg0KPiBPbiAyOS4wMS4yMCAyMDoxMSwgVHlsZXIgU2FuZGVyc29uIHdyb3RlOg0KPiA+
DQo+ID4NCj4gPiBPbiBXZWQsIEphbiAyOSwgMjAyMCBhdCAyOjMxIEFNIERhdmlkIEhpbGRlbmJy
YW5kIDxkYXZpZEByZWRoYXQuY29tDQo+ID4gPG1haWx0bzpkYXZpZEByZWRoYXQuY29tPj4gd3Jv
dGU6DQo+ID4NCj4gPiAgICAgT24gMjkuMDEuMjAgMDE6MjIsIFR5bGVyIFNhbmRlcnNvbiB2aWEg
VmlydHVhbGl6YXRpb24gd3JvdGU6DQo+ID4gICAgID4gQSBwcmltYXJ5IGFkdmFudGFnZSBvZiB2
aXJ0aW8gYmFsbG9vbiBvdmVyIG90aGVywqBtZW1vcnkgcmVjbGFpbQ0KPiA+ICAgICA+IG1lY2hh
bmlzbXMgaXMgdGhhdCBpdCBjYW7CoHByZXNzdXJlIHRoZSBndWVzdCdzIHBhZ2UgY2FjaGUgaW50
bw0KPiA+ICAgICBzaHJpbmtpbmcuDQo+ID4gICAgID4NCj4gPiAgICAgPiBIb3dldmVyLCBzaW5j
ZSB0aGUgYmFsbG9vbiBkcml2ZXIgY2hhbmdlZCB0byB1c2luZyB0aGUgc2hyaW5rZXIgQVBJDQo+
ID4gICAgID4NCj4gPg0KPiA8aHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2NvbW1p
dC83MTk5NDYyMGJiMjVhOGIxMDkzODhmZWZhOQ0KPiBlOTlhMjhlMzU1MjU1YSNkaWZmLWZkMjAy
YWNmNjk0ZDllYmExOWM4YzY0ZGEzZTQ4MGM5PsKgdGhpcw0KPiA+ICAgICA+IHVzZSBjYXNlIGhh
cyBiZWNvbWUgYSBiaXQgbW9yZSB0cmlja3kuIEknbSB3b25kZXJpbmcgd2hhdCB0aGUNCj4gaW50
ZW5kZWQNCj4gPiAgICAgPiBkZXZpY2UgaW1wbGVtZW50YXRpb24gaXMuDQo+ID4gICAgID4NCj4g
PiAgICAgPiBXaGVuIGluZmxhdGluZyB0aGUgYmFsbG9vbiBhZ2FpbnN0IHBhZ2UgY2FjaGUgKGku
ZS4gbm8gZnJlZSBtZW1vcnkNCj4gPiAgICAgPiByZW1haW5zKSB2bXNjYW4uYyB3aWxsIGJvdGgg
c2hyaW5rIHBhZ2UgY2FjaGUsIGJ1dCBhbHNvIGludm9rZSB0aGUNCj4gPiAgICAgPiBzaHJpbmtl
cnMgLS0gaW5jbHVkaW5nIHRoZSBiYWxsb29uJ3Mgc2hyaW5rZXIuIFNvIHRoZSBiYWxsb29uIGRy
aXZlcg0KPiA+ICAgICA+IGFsbG9jYXRlcyBtZW1vcnkgd2hpY2ggcmVxdWlyZXMgcmVjbGFpbSwg
dm1zY2FuIGdldHMgdGhpcyBtZW1vcnkNCj4gYnkNCj4gPiAgICAgPiBzaHJpbmtpbmcgdGhlIGJh
bGxvb24sIGFuZCB0aGVuIHRoZSBkcml2ZXIgYWRkcyB0aGUgbWVtb3J5IGJhY2sgdG8NCj4gdGhl
DQo+ID4gICAgID4gYmFsbG9vbi4gQmFzaWNhbGx5IGEgYnVzeSBuby1vcC4NCg0KUGVyIG15IHVu
ZGVyc3RhbmRpbmcsIHRoZSBiYWxsb29uIGFsbG9jYXRpb24gd29u4oCZdCBpbnZva2Ugc2hyaW5r
ZXIgYXMgX19HRlBfRElSRUNUX1JFQ0xBSU0gaXNuJ3Qgc2V0LCBubz8NCg0KDQo+ID4gICAgID4N
Cj4gPiAgICAgPiBJZiBmaWxlIElPIGlzIG9uZ29pbmcgZHVyaW5nIHRoaXMgYmFsbG9vbiBpbmZs
YXRpb24gdGhlbiB0aGUgcGFnZQ0KPiA+ICAgICBjYWNoZQ0KPiA+ICAgICA+IGNvdWxkIGJlIGdy
b3dpbmcgd2hpY2ggZnVydGhlciBwdXRzICJiYWNrIHByZXNzdXJlIiBvbiB0aGUgYmFsbG9vbg0K
PiA+ICAgICA+IHRyeWluZyB0byBpbmZsYXRlLiBJbiB0ZXN0aW5nIEkndmUgc2VlbiBwZXJpb2Rz
IG9mID4gNDUgc2Vjb25kcyB3aGVyZQ0KPiA+ICAgICA+IGJhbGxvb24gaW5mbGF0aW9uIG1ha2Vz
IG5vIG5ldCBmb3J3YXJkIHByb2dyZXNzLg0KDQpJIHRoaW5rIHRoaXMgaXMgaW50ZW50aW9uYWwg
KGJ1dCBjb3VsZCBiZSBpbXByb3ZlZCkuIEFzIGluZmxhdGlvbiBkb2VzIG5vdCBzdG9wIHdoZW4g
dGhlIGFsbG9jYXRpb24gZmFpbHMgKGl0IHNpbXBseSBzbGVlcHMgZm9yIGEgd2hpbGUgYW5kIHJl
c3VtZXMuLiByZXBlYXQgdGlsbCB0aGVyZSBhcmUgbWVtb3J5IHRvIGluZmxhdGUpDQpUaGF0J3Mg
d2h5IHlvdSBzZWUgbm8gaW5mbGF0aW9uIHByb2dyZXNzIGZvciBsb25nIHRpbWUgdW5kZXIgbWVt
b3J5IHByZXNzdXJlLg0KDQoNCkJlc3QsDQpXZWkNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFs
aXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
