Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6B18D2B8
	for <lists.virtualization@lfdr.de>; Wed, 14 Aug 2019 14:07:05 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0472BFF8;
	Wed, 14 Aug 2019 12:06:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2E0C1FE7
	for <virtualization@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 12:06:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 50DFB87E
	for <virtualization@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 12:06:56 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	5685F3016E65; Wed, 14 Aug 2019 15:06:54 +0300 (EEST)
Received: from localhost (unknown [195.210.5.22])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id 43A20305B7A0;
	Wed, 14 Aug 2019 15:06:54 +0300 (EEST)
From: Adalbert =?iso-8859-2?b?TGF643I=?= <alazar@bitdefender.com>
Subject: Re: [RFC PATCH v6 74/92] kvm: x86: do not unconditionally patch the
	hypercall instruction during emulation
To: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org
In-Reply-To: <1362cc5c-d0cd-6b7c-1151-9df3996fefa9@redhat.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-75-alazar@bitdefender.com>
	<1362cc5c-d0cd-6b7c-1151-9df3996fefa9@redhat.com>
Date: Wed, 14 Aug 2019 15:07:21 +0300
Message-ID: <1565784441.a239ff581.26157.@15f23d3a749365d981e968181cce585d2dcb3ffa>
Mailer: void
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
	Mihai =?UTF-8?b?RG9uyJt1?= <mdontu@bitdefender.com>,
	Joerg Roedel <joro@8bytes.org>
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

T24gVHVlLCAxMyBBdWcgMjAxOSAxMToyMDo0NSArMDIwMCwgUGFvbG8gQm9uemluaSA8cGJvbnpp
bmlAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gT24gMDkvMDgvMTkgMTg6MDAsIEFkYWxiZXJ0IExhesSD
ciB3cm90ZToKPiA+IEZyb206IE1paGFpIERvbsibdSA8bWRvbnR1QGJpdGRlZmVuZGVyLmNvbT4K
PiA+IAo+ID4gSXQgY2FuIGhhcHBlbmVkIGZvciB1cyB0byBlbmQgdXAgZW11bGF0aW5nIHRoZSBW
TUNBTEwgaW5zdHJ1Y3Rpb24gYXMgYQo+ID4gcmVzdWx0IG9mIHRoZSBoYW5kbGluZyBvZiBhbiBF
UFQgd3JpdGUgZmF1bHQuIEluIHRoaXMgc2l0dWF0aW9uLCB0aGUKPiA+IGVtdWxhdG9yIHdpbGwg
dHJ5IHRvIHVuY29uZGl0aW9uYWxseSBwYXRjaCB0aGUgY29ycmVjdCBoeXBlcmNhbGwgb3Bjb2Rl
Cj4gPiBieXRlcyB1c2luZyBlbXVsYXRvcl93cml0ZV9lbXVsYXRlZCgpLiBIb3dldmVyLCB0aGlz
IGxhc3QgY2FsbCB1c2VzIHRoZQo+ID4gZmF1bHQgR1BBIChpZiBhdmFpbGFibGUpIG9yIHdhbGtz
IHRoZSBndWVzdCBwYWdlIHRhYmxlcyBhdCBSSVAsCj4gPiBvdGhlcndpc2UuIFRoZSB0cm91Ymxl
IGJlZ2lucyB3aGVuIHVzaW5nIEtWTUksIHdoZW4gd2UgZm9yYmlkIHRoZSB1c2Ugb2YKPiA+IHRo
ZSBmYXVsdCBHUEEgYW5kIGZhbGxiYWNrIHRvIHRoZSBndWVzdCBwdCB3YWxrOiBpbiBXaW5kb3dz
ICg4LjEgYW5kCj4gPiBuZXdlcikgdGhlIHBhZ2UgdGhhdCB3ZSB0cnkgdG8gd3JpdGUgaW50byBp
cyBtYXJrZWQgcmVhZC1leGVjdXRlIGFuZCBhcwo+ID4gc3VjaCBlbXVsYXRvcl93cml0ZV9lbXVs
YXRlZCgpIGZhaWxzIGFuZCB3ZSBpbmplY3QgYSB3cml0ZSAjUEYsIGxlYWRpbmcKPiA+IHRvIGEg
Z3Vlc3QgY3Jhc2guCj4gPiAKPiA+IFRoZSBmaXggaXMgcmF0aGVyIHNpbXBsZTogY2hlY2sgdGhl
IGV4aXN0aW5nIGluc3RydWN0aW9uIGJ5dGVzIGJlZm9yZQo+ID4gZG9pbmcgdGhlIHBhdGNoaW5n
LiBUaGlzIGRvZXMgbm90IGNoYW5nZSB0aGUgbm9ybWFsIEtWTSBiZWhhdmlvdXIsIGJ1dAo+ID4g
ZG9lcyBoZWxwIHdoZW4gdXNpbmcgS1ZNSSBhcyB3ZSBubyBsb25nZXIgaW5qZWN0IGEgd3JpdGUg
I1BGLgo+IAo+IEZpeGluZyB0aGUgaHlwZXJjYWxsIGlzIGp1c3QgYW4gb3B0aW1pemF0aW9uLiAg
Q2FuIHdlIGp1c3QgaHVzaCBhbmQKPiByZXR1cm4gdG8gdGhlIGd1ZXN0IGlmIGVtdWxhdG9yX3dy
aXRlX2VtdWxhdGVkIHJldHVybnMKPiBYODZFTVVMX1BST1BBR0FURV9GQVVMVD8KPiAKPiBQYW9s
bwoKU29tZXRoaW5nIGxpa2UgdGhpcz8KCgllcnIgPSBlbXVsYXRvcl93cml0ZV9lbXVsYXRlZCgu
Li4pOwoJaWYgKGVyciA9PSBYODZFTVVMX1BST1BBR0FURV9GQVVMVCkKCQllcnIgPSBYODZFTVVM
X0NPTlRJTlVFOwoJcmV0dXJuIGVycjsKCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3g4
Ni5jIGIvYXJjaC94ODYva3ZtL3g4Ni5jCj4gPiBpbmRleCAwNGIxZDI5MTZhMGEuLjk2NWM0ZjAx
MDhlYiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gveDg2L2t2bS94ODYuYwo+ID4gKysrIGIvYXJjaC94
ODYva3ZtL3g4Ni5jCj4gPiBAQCAtNzM2MywxNiArNzM2MywzMyBAQCBpbnQga3ZtX2VtdWxhdGVf
aHlwZXJjYWxsKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiA+ICB9Cj4gPiAgRVhQT1JUX1NZTUJP
TF9HUEwoa3ZtX2VtdWxhdGVfaHlwZXJjYWxsKTsKPiA+ICAKPiA+ICsjZGVmaW5lIEtWTV9IWVBF
UkNBTExfSU5TTl9MRU4gMwo+ID4gKwo+ID4gIHN0YXRpYyBpbnQgZW11bGF0b3JfZml4X2h5cGVy
Y2FsbChzdHJ1Y3QgeDg2X2VtdWxhdGVfY3R4dCAqY3R4dCkKPiA+ICB7Cj4gPiArCWludCBlcnI7
Cj4gPiAgCXN0cnVjdCBrdm1fdmNwdSAqdmNwdSA9IGVtdWxfdG9fdmNwdShjdHh0KTsKPiA+IC0J
Y2hhciBpbnN0cnVjdGlvblszXTsKPiA+ICsJY2hhciBidWZbS1ZNX0hZUEVSQ0FMTF9JTlNOX0xF
Tl07Cj4gPiArCWNoYXIgaW5zdHJ1Y3Rpb25bS1ZNX0hZUEVSQ0FMTF9JTlNOX0xFTl07Cj4gPiAg
CXVuc2lnbmVkIGxvbmcgcmlwID0ga3ZtX3JpcF9yZWFkKHZjcHUpOwo+ID4gIAo+ID4gKwllcnIg
PSBlbXVsYXRvcl9yZWFkX2VtdWxhdGVkKGN0eHQsIHJpcCwgYnVmLCBzaXplb2YoYnVmKSwKPiA+
ICsJCQkJICAgICAmY3R4dC0+ZXhjZXB0aW9uKTsKPiA+ICsJaWYgKGVyciAhPSBYODZFTVVMX0NP
TlRJTlVFKQo+ID4gKwkJcmV0dXJuIGVycjsKPiA+ICsKPiA+ICAJa3ZtX3g4Nl9vcHMtPnBhdGNo
X2h5cGVyY2FsbCh2Y3B1LCBpbnN0cnVjdGlvbik7Cj4gPiArCWlmICghbWVtY21wKGluc3RydWN0
aW9uLCBidWYsIHNpemVvZihpbnN0cnVjdGlvbikpKQo+ID4gKwkJLyoKPiA+ICsJCSAqIFRoZSBo
eXBlcmNhbGwgaW5zdHJ1Y3Rpb24gaXMgdGhlIGNvcnJlY3Qgb25lLiBSZXRyeQo+ID4gKwkJICog
aXRzIGV4ZWN1dGlvbiBtYXliZSB3ZSBnb3QgaGVyZSBhcyBhIHJlc3VsdCBvZiBhbgo+ID4gKwkJ
ICogZXZlbnQgb3RoZXIgdGhhbiAjVUQgd2hpY2ggaGFzIGJlZW4gcmVzb2x2ZWQgaW4gdGhlCj4g
PiArCQkgKiBtZWFuIHRpbWUuCj4gPiArCQkgKi8KPiA+ICsJCXJldHVybiBYODZFTVVMX0NPTlRJ
TlVFOwo+ID4gIAo+ID4gLQlyZXR1cm4gZW11bGF0b3Jfd3JpdGVfZW11bGF0ZWQoY3R4dCwgcmlw
LCBpbnN0cnVjdGlvbiwgMywKPiA+IC0JCSZjdHh0LT5leGNlcHRpb24pOwo+ID4gKwlyZXR1cm4g
ZW11bGF0b3Jfd3JpdGVfZW11bGF0ZWQoY3R4dCwgcmlwLCBpbnN0cnVjdGlvbiwKPiA+ICsJCQkJ
ICAgICAgIHNpemVvZihpbnN0cnVjdGlvbiksICZjdHh0LT5leGNlcHRpb24pOwo+ID4gIH0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRp
b24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3Jn
Cmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1
YWxpemF0aW9u
