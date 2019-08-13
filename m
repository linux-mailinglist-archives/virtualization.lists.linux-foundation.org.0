Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 410538BF55
	for <lists.virtualization@lfdr.de>; Tue, 13 Aug 2019 19:08:10 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8CBC8DDD;
	Tue, 13 Aug 2019 17:08:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A17E5DAC
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 17:08:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1E4C38A7
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 17:08:02 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	5DE5F3011FC2; Tue, 13 Aug 2019 20:08:00 +0300 (EEST)
Received: from localhost (unknown [195.210.4.22])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id 47A5F304BD70;
	Tue, 13 Aug 2019 20:08:00 +0300 (EEST)
From: Adalbert =?iso-8859-2?b?TGF643I=?= <alazar@bitdefender.com>
Subject: Re: [RFC PATCH v6 06/92] kvm: introspection: add
	KVMI_CONTROL_CMD_RESPONSE
To: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org
In-Reply-To: <e8f59b08-734a-2ce1-ae28-3cc9d90c0bcb@redhat.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-7-alazar@bitdefender.com>
	<e8f59b08-734a-2ce1-ae28-3cc9d90c0bcb@redhat.com>
Date: Tue, 13 Aug 2019 20:08:27 +0300
Message-ID: <1565716107.4DfaBE.19731.@15f23d3a749365d981e968181cce585d2dcb3ffa>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00, FROM_EXCESS_BASE64, 
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>, Yu C Zhang <yu.c.zhang@intel.com>,
	Radim =?iso-8859-2?b?S3LobeH4?= <rkrcmar@redhat.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Samuel =?iso-8859-1?q?Laur=E9n?= <samuel.lauren@iki.fi>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	Patrick Colp <patrick.colp@oracle.com>,
	Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Mihai =?UTF-8?b?RG9uyJt1?= <mdontu@bitdefender.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

T24gVHVlLCAxMyBBdWcgMjAxOSAxMToxNTozNCArMDIwMCwgUGFvbG8gQm9uemluaSA8cGJvbnpp
bmlAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gT24gMDkvMDgvMTkgMTc6NTksIEFkYWxiZXJ0IExhesSD
ciB3cm90ZToKPiA+ICtJZiBgbm93YCBpcyAxLCB0aGUgY29tbWFuZCByZXBseSBpcyBlbmFibGVk
L2Rpc2FibGVkIChhY2NvcmRpbmcgdG8KPiA+ICtgZW5hYmxlYCkgc3RhcnRpbmcgd2l0aCB0aGUg
Y3VycmVudCBjb21tYW5kLiBGb3IgZXhhbXBsZSwgYGVuYWJsZT0wYAo+ID4gK2FuZCBgbm93PTFg
IG1lYW5zIHRoYXQgdGhlIHJlcGx5IGlzIGRpc2FibGVkIGZvciB0aGlzIGNvbW1hbmQgdG9vLAo+
ID4gK3doaWxlIGBlbmFibGU9MGAgYW5kIGBub3c9MGAgbWVhbnMgdGhhdCBhIHJlcGx5IHdpbGwg
YmUgc2VuZCBmb3IgdGhpcwo+ID4gK2NvbW1hbmQsIGJ1dCBub3QgZm9yIHRoZSBuZXh0IG9uZXMg
KHVudGlsIGVuYWJsZWQgYmFjayB3aXRoIGFub3RoZXIKPiA+ICsqS1ZNSV9DT05UUk9MX0NNRF9S
RVNQT05TRSopLgo+ID4gKwo+ID4gK1RoaXMgY29tbWFuZCBpcyB1c2VkIGJ5IHRoZSBpbnRyb3Nw
ZWN0aW9uIHRvb2wgdG8gZGlzYWJsZSB0aGUgcmVwbGllcwo+ID4gK2ZvciBjb21tYW5kcyByZXR1
cm5pbmcgYW4gZXJyb3IgY29kZSBvbmx5IChlZy4gKktWTUlfU0VUX1JFR0lTVEVSUyopCj4gPiAr
d2hlbiBhbiBlcnJvciBpcyBsZXNzIGxpa2VseSB0byBoYXBwZW4uIEZvciBleGFtcGxlLCB0aGUg
Zm9sbG93aW5nCj4gPiArY29tbWFuZHMgY2FuIGJlIHVzZWQgdG8gcmVwbHkgdG8gYW4gZXZlbnQg
d2l0aCBhIHNpbmdsZSBgd3JpdGUoKWAgY2FsbDoKPiA+ICsKPiA+ICsJS1ZNSV9DT05UUk9MX0NN
RF9SRVNQT05TRSBlbmFibGU9MCBub3c9MQo+ID4gKwlLVk1JX1NFVF9SRUdJU1RFUlMgdmNwdT1O
Cj4gPiArCUtWTUlfRVZFTlRfUkVQTFkgICB2Y3B1PU4KPiA+ICsJS1ZNSV9DT05UUk9MX0NNRF9S
RVNQT05TRSBlbmFibGU9MSBub3c9MAo+IAo+IEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGUgdXNhZ2Uu
ICBJcyB0aGVyZSBhbnkgY2FzZSB3aGVyZSB5b3Ugd2FudCBub3cgPT0gMQo+IGFjdHVhbGx5PyAg
Q2FuIHlvdSBqdXN0IHNheSB0aGF0IEtWTUlfQ09OVFJPTF9DTURfUkVTUE9OU0UgbmV2ZXIgaGFz
IGEKPiByZXBseSwgb3IgdG8gbWFrZSBub3c9PWVuYWJsZT8KClRoZSBlbmFibGU9MSBub3c9MSBp
cyBmb3IgcGF1c2UgVk06CgoJS1ZNSV9DT05UUk9MX0NNRF9SRVNQT05TRSBlbmFibGU9MCBub3c9
MQoJS1ZNSV9QQVVTRV9WQ1BVIDAKCUtWTUlfUEFVU0VfVkNQVSAxCgkuLi4KCUtWTUlfQ09OVFJP
TF9DTURfUkVTUE9OU0UgZW5hYmxlPTEgbm93PTEKCldlIHdhaXQgZm9yIGEgcmVwbHkgdG8gbWFr
ZSBzdXJlIHRoZSB2Q1BVcyB3ZXJlIHN0b3BwZWQgd2l0aG91dCB3YWl0aW5nCmZvciB0aGVpciBw
YXVzZSBldmVudHMuCgpXZSBjYW4gZ2V0IGFyb3VuZCBmcm9tIHVzZXJzcGFjZSwgaWYgeW91IGxp
a2U6CgoJS1ZNSV9DT05UUk9MX0NNRF9SRVNQT05TRSBlbmFibGU9MCBub3c9MQoJS1ZNSV9QQVVT
RV9WQ1BVIDAKCUtWTUlfUEFVU0VfVkNQVSAxCgkuLi4KCUtWTUlfUEFVU0VfVkNQVSBOLTIKCUtW
TUlfQ09OVFJPTF9DTURfUkVTUE9OU0UgZW5hYmxlPTEgbm93PTAKCUtWTUlfUEFVU0VfVkNQVSBO
LTEKCj4gCj4gPiArCWlmIChlcnIpCj4gPiArCQlrdm1pX3dhcm4oaWt2bSwgIkVycm9yIGNvZGUg
JWQgZGlzY2FyZGVkIGZvciBtZXNzYWdlIGlkICVkXG4iLAo+ID4gKwkJCSAgZXJyLCBtc2ctPmlk
KTsKPiA+ICsKPiAKPiBXb3VsZCBpdCBtYWtlIHNlbnNlIHRvIGV2ZW4gY2xvc2UgdGhlIHNvY2tl
dCBpZiB0aGVyZSBpcyBhbiBlcnJvcj8KPiAKPiBQYW9sbwoKU3VyZS4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBs
aXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
