Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 333B88B926
	for <lists.virtualization@lfdr.de>; Tue, 13 Aug 2019 14:51:19 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 21C85CB6;
	Tue, 13 Aug 2019 12:51:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 83EDBAD8
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 12:51:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 054C7CF
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 12:51:09 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	E24D330644BA; Tue, 13 Aug 2019 15:51:07 +0300 (EEST)
Received: from localhost (unknown [195.210.5.22])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id C81D4305B7A0;
	Tue, 13 Aug 2019 15:51:07 +0300 (EEST)
From: Adalbert =?iso-8859-2?b?TGF643I=?= <alazar@bitdefender.com>
Subject: Re: [RFC PATCH v6 64/92] kvm: introspection: add single-stepping
To: Sean Christopherson <sean.j.christopherson@intel.com>
In-Reply-To: <20190812205038.GC1437@linux.intel.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-65-alazar@bitdefender.com>
	<20190812205038.GC1437@linux.intel.com>
Date: Tue, 13 Aug 2019 15:51:33 +0300
Message-ID: <1565700693.6410DC6Aa.12556.@15f23d3a749365d981e968181cce585d2dcb3ffa>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00, FROM_EXCESS_BASE64, 
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>, Zhang@linux.intel.com,
	kvm@vger.kernel.org, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Samuel =?iso-8859-1?q?Laur=E9n?= <samuel.lauren@iki.fi>,
	Radim =?iso-8859-2?b?S3LobeH4?= <rkrcmar@redhat.com>,
	Joerg Roedel <joro@8bytes.org>,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	Patrick Colp <patrick.colp@oracle.com>,
	=?UTF-8?b?TmljdciZb3IgQ8OuyJt1?= <ncitu@bitdefender.com>,
	Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Yu C <yu.c.zhang@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Mihai =?UTF-8?b?RG9uyJt1?= <mdontu@bitdefender.com>,
	Jim Mattson <jmattson@google.com>
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

T24gTW9uLCAxMiBBdWcgMjAxOSAxMzo1MDozOSAtMDcwMCwgU2VhbiBDaHJpc3RvcGhlcnNvbiA8
c2Vhbi5qLmNocmlzdG9waGVyc29uQGludGVsLmNvbT4gd3JvdGU6Cj4gT24gRnJpLCBBdWcgMDks
IDIwMTkgYXQgMDc6MDA6MTlQTSArMDMwMCwgQWRhbGJlcnQgTGF6xINyIHdyb3RlOgo+ID4gRnJv
bTogTmljdciZb3IgQ8OuyJt1IDxuY2l0dUBiaXRkZWZlbmRlci5jb20+Cj4gPiAKPiA+IFRoaXMg
d291bGQgYmUgdXNlZCBlaXRoZXIgaWYgdGhlIGludHJvc3BlY3Rpb24gdG9vbCByZXF1ZXN0IGl0
IGFzIGEKPiA+IHJlcGx5IHRvIGEgS1ZNSV9FVkVOVF9QRiBldmVudCBvciB0byBjb3BlIHdpdGgg
aW5zdHJ1Y3Rpb25zIHRoYXQgY2Fubm90Cj4gPiBiZSBoYW5kbGVkIGJ5IHRoZSB4ODYgZW11bGF0
b3IgZHVyaW5nIHRoZSBoYW5kbGluZyBvZiBhIFZNRVhJVC4gSW4KPiA+IHRoZXNlIHNpdHVhdGlv
bnMsIGFsbCBvdGhlciB2Q1BVLXMgYXJlIGtpY2tlZCBhbmQgaGVsZCwgdGhlIEVQVC1iYXNlZAo+
ID4gcHJvdGVjdGlvbiBpcyByZW1vdmVkIGFuZCB0aGUgZ3Vlc3QgaXMgc2luZ2xlIHN0ZXBwZWQg
YnkgdGhlIHZDUFUgdGhhdAo+ID4gdHJpZ2dlcmVkIHRoZSBpbml0aWFsIFZNRVhJVC4gVXBvbiBj
b21wbGV0aW9uIHRoZSBFUFQtYmFzZSBwcm90ZWN0aW9uCj4gPiBpcyByZWluc3RhbGxlZCBhbmQg
YWxsIHZDUFUtcyBhbGwgYWxsb3dlZCB0byByZXR1cm4gdG8gdGhlIGd1ZXN0Lgo+ID4gCj4gPiBU
aGlzIGlzIGEgcmF0aGVyIHNsb3cgd29ya2Fyb3VuZCB0aGF0IGtpY2tzIGluIG9jY2FzaW9uYWxs
eS4gSW4gdGhlCj4gPiBmdXR1cmUsIHRoZSBtb3N0IGZyZXF1ZW50bHkgc2luZ2xlLXN0ZXBwZWQg
aW5zdHJ1Y3Rpb25zIHNob3VsZCBiZSBhZGRlZAo+ID4gdG8gdGhlIGVtdWxhdG9yICh1c3VhbGx5
LCBzdG9yZXMgdG8gYW5kIGZyb20gbWVtb3J5IC0gU1NFL0FWWCkuCj4gPiAKPiA+IEZvciB0aGUg
bW9tZW50IGl0IHdvcmtzIG9ubHkgb24gSW50ZWwuCj4gPiAKPiA+IENDOiBKaW0gTWF0dHNvbiA8
am1hdHRzb25AZ29vZ2xlLmNvbT4KPiA+IENDOiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuLmou
Y2hyaXN0b3BoZXJzb25AaW50ZWwuY29tPgo+ID4gQ0M6IEpvZXJnIFJvZWRlbCA8am9yb0A4Ynl0
ZXMub3JnPgo+ID4gU2lnbmVkLW9mZi1ieTogTmljdciZb3IgQ8OuyJt1IDxuY2l0dUBiaXRkZWZl
bmRlci5jb20+Cj4gPiBDby1kZXZlbG9wZWQtYnk6IE1paGFpIERvbsibdSA8bWRvbnR1QGJpdGRl
ZmVuZGVyLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IE1paGFpIERvbsibdSA8bWRvbnR1QGJpdGRl
ZmVuZGVyLmNvbT4KPiA+IENvLWRldmVsb3BlZC1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJA
Yml0ZGVmZW5kZXIuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6
YXJAYml0ZGVmZW5kZXIuY29tPgo+ID4gLS0tCj4gPiAgYXJjaC94ODYvaW5jbHVkZS9hc20va3Zt
X2hvc3QuaCB8ICAgMyArCj4gPiAgYXJjaC94ODYva3ZtL2t2bWkuYyAgICAgICAgICAgICB8ICA0
NyArKysrKysrKysrLQo+ID4gIGFyY2gveDg2L2t2bS9zdm0uYyAgICAgICAgICAgICAgfCAgIDUg
KysKPiA+ICBhcmNoL3g4Ni9rdm0vdm14L3ZteC5jICAgICAgICAgIHwgIDE3ICsrKysKPiA+ICBh
cmNoL3g4Ni9rdm0veDg2LmMgICAgICAgICAgICAgIHwgIDE5ICsrKysrCj4gPiAgaW5jbHVkZS9s
aW51eC9rdm1pLmggICAgICAgICAgICB8ICAgNCArCj4gPiAgdmlydC9rdm0va3ZtaS5jICAgICAg
ICAgICAgICAgICB8IDE0NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+ID4gIHZp
cnQva3ZtL2t2bWlfaW50LmggICAgICAgICAgICAgfCAgMTYgKysrKwo+ID4gIDggZmlsZXMgY2hh
bmdlZCwgMjUzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPiAKClsuLi5dIFdlJ2xs
IGRvLgoKPiA+IGRpZmYgLS1naXQgYS92aXJ0L2t2bS9rdm1pX2ludC5oIGIvdmlydC9rdm0va3Zt
aV9pbnQuaAo+ID4gaW5kZXggZDdmOTg1OGQzZTk3Li4xNTUwZmUzM2VkNDggMTAwNjQ0Cj4gPiAt
LS0gYS92aXJ0L2t2bS9rdm1pX2ludC5oCj4gPiArKysgYi92aXJ0L2t2bS9rdm1pX2ludC5oCj4g
PiBAQCAtMTI2LDYgKzEyNiw5IEBAIHN0cnVjdCBrdm1pX3ZjcHUgewo+ID4gIAkJREVDTEFSRV9C
SVRNQVAoaGlnaCwgS1ZNSV9OVU1fTVNSKTsKPiA+ICAJfSBtc3JfbWFzazsKPiA+ICAKPiA+ICsJ
Ym9vbCBzc19vd25lcjsKPiAKPiBXaHkgaXMgc2luZ2xlLXN0ZXBwaW5nIG11dHVhbGx5IGV4Y2x1
c2l2ZSBhY3Jvc3MgYWxsIHZDUFVzPyAgRG9lcyB0aGF0Cj4gYWx3YXlzIGhhdmUgdG8gYmUgdGhl
IGNhc2U/CgpJIG5ldmVyIHRob3VnaHQgdG8gc2luZ2xlLXN0ZXAgbXVsdGlwbGUgdkNQVXMgaW4g
dGhlIHNhbWUgdGltZS4KCklmIG9uZSB2Q1BVIHdpbGwgcmVsYXggdGhlIGFjY2VzcyB0byBhIGd1
ZXN0IHBhZ2Ugd2hpbGUgYSBzZWNvbmQgb25lLApmaW5pc2hpbmcgc2luZ2xlLXN0ZXBwaW5nLCBy
ZXN0b3JlcyB0aGUgJ3ItLScgZmxhZ3MsIHRoZSBmaXJzdCBvbmUKd2lsbCBnZXQgYW5vdGhlciBw
YWdlIGZhdWx0IGFuZCByZWxheCB0aGUgcGFnZSBhY2Nlc3MgYWdhaW4uIEl0IG1pZ2h0CmJlIGRv
YWJsZSwgYnV0IGJlZm9yZSBzdGFydGluZyBzaW5nbGUtc3RlcHBpbmcgYSB2Q1BVIHdlIG1pZ2h0
IHJlcGxhY2UKZ3Vlc3QgbWVtb3J5IChhcyByZXF1ZXN0ZWQgYnkgdGhlIGludHJvc3BlY3Rpb24g
dG9vbCkgYW5kIHdlIHdpbGwgaGF2ZQp0byB1c2UgYSBsb2NrIGZvciB0aGlzLgoKSG93ZXZlciwg
d2Ugd291bGQgbGlrZSB0byB1c2UgYWx0ZXJuYXRlIEVQVCB2aWV3cyB3aXRoIHNpbmdsZS1zdGVw
LgpTbywgd2UgbWlnaHQgcmVwbGFjZSB0aGlzIHBhdGNoLgoKPiA+ICsJYm9vbCBzc19yZXF1ZXN0
ZWQ7Cj4gPiArCj4gPiAgCXN0cnVjdCBsaXN0X2hlYWQgam9iX2xpc3Q7Cj4gPiAgCXNwaW5sb2Nr
X3Qgam9iX2xvY2s7Cj4gPiAgCj4gPiBAQCAtMTUxLDYgKzE1NCwxNSBAQCBzdHJ1Y3Qga3ZtaSB7
Cj4gPiAgCURFQ0xBUkVfQklUTUFQKGV2ZW50X2FsbG93X21hc2ssIEtWTUlfTlVNX0VWRU5UUyk7
Cj4gPiAgCURFQ0xBUkVfQklUTUFQKHZtX2V2X21hc2ssIEtWTUlfTlVNX0VWRU5UUyk7Cj4gPiAg
Cj4gPiArI2RlZmluZSBTSU5HTEVfU1RFUF9NQVhfREVQVEggOAo+ID4gKwlzdHJ1Y3Qgewo+ID4g
KwkJZ2ZuX3QgZ2ZuOwo+ID4gKwkJdTggb2xkX2FjY2VzczsKPiA+ICsJCXUzMiBvbGRfd3JpdGVf
Yml0bWFwOwo+ID4gKwl9IHNzX2NvbnRleHRbU0lOR0xFX1NURVBfTUFYX0RFUFRIXTsKPiA+ICsJ
dTggc3NfbGV2ZWw7Cj4gPiArCWF0b21pY190IHNzX2FjdGl2ZTsKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0
ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
