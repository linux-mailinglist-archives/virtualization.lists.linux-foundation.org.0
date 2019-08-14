Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 305BF8CFFE
	for <lists.virtualization@lfdr.de>; Wed, 14 Aug 2019 11:48:06 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 484B8FE5;
	Wed, 14 Aug 2019 09:48:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3E9F7D2E
	for <virtualization@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 09:47:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id ADFB267F
	for <virtualization@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 09:47:57 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	E3D683016E60; Wed, 14 Aug 2019 12:47:55 +0300 (EEST)
Received: from localhost (unknown [195.210.5.22])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id CF30D305B7A0;
	Wed, 14 Aug 2019 12:47:55 +0300 (EEST)
From: Adalbert =?iso-8859-2?b?TGF643I=?= <alazar@bitdefender.com>
Subject: Re: [RFC PATCH v6 01/92] kvm: introduce KVMI (VM introspection
	subsystem)
To: Sean Christopherson <sean.j.christopherson@intel.com>, Paolo Bonzini
	<pbonzini@redhat.com>
In-Reply-To: <20190813150128.GB13991@linux.intel.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-2-alazar@bitdefender.com>
	<20190812202030.GB1437@linux.intel.com>
	<5d52a5ae.1c69fb81.5c260.1573SMTPIN_ADDED_BROKEN@mx.google.com>
	<5fa6bd89-9d02-22cd-24a8-479abaa4f788@redhat.com>
	<20190813150128.GB13991@linux.intel.com>
Date: Wed, 14 Aug 2019 12:48:22 +0300
Message-ID: <1565776102.75165.5381.@15f23d3a749365d981e968181cce585d2dcb3ffa>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00, FROM_EXCESS_BASE64, 
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>,
	Yu C <yu.c.zhang@intel.com>, kvm@vger.kernel.org,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Samuel =?iso-8859-1?q?Laur=E9n?= <samuel.lauren@iki.fi>,
	Radim =?iso-8859-2?b?S3LobeH4?= <rkrcmar@redhat.com>,
	Zhang@vger.kernel.org, virtualization@lists.linux-foundation.org,
	linux-mm@kvack.org, Patrick Colp <patrick.colp@oracle.com>,
	Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Mircea =?iso-8859-1?q?C=EErjaliu?= <mcirjaliu@bitdefender.com>,
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

T24gVHVlLCAxMyBBdWcgMjAxOSAwODowMToyOCAtMDcwMCwgU2VhbiBDaHJpc3RvcGhlcnNvbiA8
c2Vhbi5qLmNocmlzdG9waGVyc29uQGludGVsLmNvbT4gd3JvdGU6Cj4gT24gVHVlLCBBdWcgMTMs
IDIwMTkgYXQgMDI6MDk6NTFQTSArMDIwMCwgUGFvbG8gQm9uemluaSB3cm90ZToKPiA+IE9uIDEz
LzA4LzE5IDEzOjU3LCBBZGFsYmVydCBMYXrEg3Igd3JvdGU6Cj4gPiA+PiBUaGUgcmVmY291bnRp
bmcgYXBwcm9hY2ggc2VlbXMgYSBiaXQgYmFja3dhcmRzLCBhbmQgQUZBSUNUIGlzIGRyaXZlbiBi
eQo+ID4gPj4gaW1wbGVtZW50aW5nIHVuaG9vayB2aWEgYSBtZXNzYWdlLCB3aGljaCBhbHNvIHNl
ZW1zIGJhY2t3YXJkcy4gIEkgYXNzdW1lCj4gPiA+PiBob29rIGFuZCB1bmhvb2sgYXJlIHJlbGF0
aXZlbHkgcmFyZSBldmVudHMgYW5kIG5vdCBwZXJmb3JtYW5jZSBjcml0aWNhbCwKPiA+ID4+IHNv
IG1ha2UgdGhvc2UgdGhlIHJlc3RyaWN0ZWQvc2xvdyBmbG93cywgZS5nLiBmb3JjZSB1c2Vyc3Bh
Y2UgdG8gcXVpZXNjZQo+ID4gPj4gdGhlIFZNIGJ5IG1ha2luZyB1bmhvb2soKSBtdXR1YWxseSBl
eGNsdXNpdmUgd2l0aCBldmVyeSB2Y3B1IGlvY3RsKCkgYW5kCj4gPiA+PiBtYXliZSBhbnl0aGlu
ZyB0aGF0IHRha2VzIGt2bS0+bG9jay4gCj4gPiA+Pgo+ID4gPj4gVGhlbiBrdm1pX2lvY3RsX3Vu
aG9vaygpIGNhbiB1c2UgdGhyZWFkX3N0b3AoKSBhbmQga3ZtaV9yZWN2KCkganVzdCBuZWVkcwo+
ID4gPj4gdG8gY2hlY2sga3RocmVhZF9zaG91bGRfc3RvcCgpLgo+ID4gPj4KPiA+ID4+IFRoYXQg
d2F5IGt2bWkgZG9lc24ndCBuZWVkIHRvIGJlIHJlZmNvdW50ZWQgc2luY2UgaXQncyBndWFyYW50
ZWVkIHRvIGJlCj4gPiA+PiBhbGl2ZSBpZiB0aGUgcG9pbnRlciBpcyBub24tbnVsbC4gIEVsaW1p
bmF0aW5nIHRoZSByZWZjb3VudGluZyB3aWxsIGNsZWFuCj4gPiA+PiB1cCBhIGxvdCBvZiB0aGUg
Y29kZSBieSBlbGltaW5hdGluZyBjYWxscyB0byBrdm1pX3tnZXQscHV0fSgpLCBlLmcuCj4gPiA+
PiB3cmFwcGVycyBsaWtlIGt2bWlfYnJlYWtwb2ludF9ldmVudCgpIGp1c3QgY2hlY2sgdmNwdS0+
a3ZtaSwgb3IgbWF5YmUKPiA+ID4+IGV2ZW4gZ2V0IGRyb3BwZWQgYWx0b2dldGhlci4KPiA+ID4g
Cj4gPiA+IFRoZSB1bmhvb2sgZXZlbnQgaGFzIGJlZW4gYWRkZWQgdG8gY292ZXIgdGhlIGZvbGxv
d2luZyBjYXNlOiB3aGlsZSB0aGUKPiA+ID4gaW50cm9zcGVjdGlvbiB0b29sIHJ1bnMgaW4gYW5v
dGhlciBWTSwgYm90aCBWTXMsIHRoZSB2aXJ0dWFsIGFwcGxpYW5jZQo+ID4gPiBhbmQgdGhlIGlu
dHJvc3BlY3RlZCBWTSwgY291bGQgYmUgcGF1c2VkIGJ5IHRoZSB1c2VyLiBXZSBuZWVkZWQgYSB3
YXkKPiA+ID4gdG8gc2lnbmFsIHRoaXMgdG8gdGhlIGludHJvc3BlY3Rpb24gdG9vbCBhbmQgZ2l2
ZSBpdCB0aW1lIHRvIHVuaG9vawo+ID4gPiAodGhlIGludHJvc3BlY3RlZCBWTSBoYXMgdG8gcnVu
IGFuZCBleGVjdXRlIHRoZSBpbnRyb3NwZWN0aW9uIGNvbW1hbmRzCj4gPiA+IGR1cmluZyB0aGlz
IHBoYXNlKS4gVGhlIHJlY2VpdmluZyB0aHJlYWRzIHF1aXRzIHdoZW4gdGhlIHNvY2tldCBpcyBj
bG9zZWQKPiA+ID4gKGJ5IFFFTVUgb3IgYnkgdGhlIGludHJvc3BlY3Rpb24gdG9vbCkuCj4gCj4g
V2h5IGRvZXMgY2xvc2luZyB0aGUgc29ja2V0IHJlcXVpcmUgZGVzdHJveWluZyB0aGUga3ZtaSBv
YmplY3Q/ICBFLmcuIGNhbgo+IGl0IGJlIG1hcmtlZCBhcyBkZWZ1bmN0IG9yIHdoYXRldmVyIGFu
ZCBvbmx5IGZ1bGx5IHJlbW92ZWQgb24gYSBzeW5jaHJvbm91cwo+IHVuaG9vayBmcm9tIHVzZXJz
cGFjZT8gIFJlLWhvb2tpbmcgY291bGQgZWl0aGVyIHJlcXVpcmUgc2FpZCB1bmhvb2ssIG9yCj4g
bWF5YmUgcmV1c2UgdGhlIGV4aXN0aW5nIGt2bWkgb2JqZWN0IHdpdGggYSBuZXcgc29ja2V0LgoK
V2lsbCBpdCBiZSBiZXR0ZXIgdG8gaGF2ZSB0aGUgZm9sbG93aW5nIGlvY3Rscz8KCiAgLSBob29r
IChhbGxvYyBrdm1pIGFuZCBrdm1pX3ZjcHUgc3RydWN0cykKICAtIG5vdGlmeV9pbW1pbmVudF91
bmhvb2sgKHNlbmQgdGhlIEtWTUlfRVZFTlRfVU5IT09LIGV2ZW50KQogIC0gdW5ob29rIChmcmVl
IGt2bWkgYW5kIGt2bWlfdmNwdSBzdHJ1Y3RzKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6
YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5k
YXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
