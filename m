Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 157578BB69
	for <lists.virtualization@lfdr.de>; Tue, 13 Aug 2019 16:24:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C7326CC3;
	Tue, 13 Aug 2019 14:24:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 34F5AC2A
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 14:24:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id ACCEB8D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 14:24:18 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	2E11830644BA; Tue, 13 Aug 2019 17:24:17 +0300 (EEST)
Received: from localhost (unknown [195.210.5.22])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id 11E7F303EF04;
	Tue, 13 Aug 2019 17:24:17 +0300 (EEST)
From: Adalbert =?iso-8859-2?b?TGF643I=?= <alazar@bitdefender.com>
Subject: Re: [RFC PATCH v6 02/92] kvm: introspection: add basic ioctls
	(hook/unhook)
To: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org
In-Reply-To: <58808ef0-57b1-47ac-a115-e1dd64a15b0a@redhat.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-3-alazar@bitdefender.com>
	<58808ef0-57b1-47ac-a115-e1dd64a15b0a@redhat.com>
Date: Tue, 13 Aug 2019 17:24:43 +0300
Message-ID: <1565706283.3Aa8b.27165.@15f23d3a749365d981e968181cce585d2dcb3ffa>
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

V2UnbGwgZG8uCgpPbiBUdWUsIDEzIEF1ZyAyMDE5IDEwOjQ0OjI4ICswMjAwLCBQYW9sbyBCb256
aW5pIDxwYm9uemluaUByZWRoYXQuY29tPiB3cm90ZToKPiBPbiAwOS8wOC8xOSAxNzo1OSwgQWRh
bGJlcnQgTGF6xINyIHdyb3RlOgo+ID4gK3N0YXRpYyBpbnQga3ZtaV9yZWN2KHZvaWQgKmFyZykK
PiA+ICt7Cj4gPiArCXN0cnVjdCBrdm1pICppa3ZtID0gYXJnOwo+ID4gKwo+ID4gKwlrdm1pX2lu
Zm8oaWt2bSwgIkhvb2tpbmcgVk1cbiIpOwo+ID4gKwo+ID4gKwl3aGlsZSAoa3ZtaV9tc2dfcHJv
Y2Vzcyhpa3ZtKSkKPiA+ICsJCTsKPiA+ICsKPiA+ICsJa3ZtaV9pbmZvKGlrdm0sICJVbmhvb2tp
bmcgVk1cbiIpOwo+ID4gKwo+ID4gKwlrdm1pX2VuZF9pbnRyb3NwZWN0aW9uKGlrdm0pOwo+ID4g
Kwo+ID4gKwlyZXR1cm4gMDsKPiA+ICt9Cj4gPiArCj4gCj4gUmVuYW1lIHRoaXMgdG8ga3ZtaV9y
ZWN2X3RocmVhZCBpbnN0ZWFkLCBwbGVhc2UuCj4gCj4gPiArCj4gPiArCS8qCj4gPiArCSAqIE1h
a2Ugc3VyZSBhbGwgdGhlIEtWTS9LVk1JIHN0cnVjdHVyZXMgYXJlIGxpbmtlZCBhbmQgbm8gcG9p
bnRlcgo+ID4gKwkgKiBpcyByZWFkIGFzIE5VTEwgYWZ0ZXIgdGhlIHJlZmVyZW5jZSBjb3VudCBo
YXMgYmVlbiBzZXQuCj4gPiArCSAqLwo+ID4gKwlzbXBfbWJfX2JlZm9yZV9hdG9taWMoKTsKPiAK
PiBUaGlzIGlzIGFuIHNtcF93bWIoKSwgbm90IGFuIHNtcF9tYl9fYmVmb3JlX2F0b21pYygpLiAg
QWRkIGEgY29tbWVudAo+IHRoYXQgaXQgcGFpcnMgd2l0aCB0aGUgcmVmY291bnRfaW5jX25vdF96
ZXJvIGluIGt2bWlfZ2V0Lgo+IAo+ID4gKwlyZWZjb3VudF9zZXQoJmt2bS0+a3ZtaV9yZWYsIDEp
Owo+ID4gKwo+IAo+IAo+ID4gQEAgLTU3LDggKzE4MywyNyBAQCB2b2lkIGt2bWlfZGVzdHJveV92
bShzdHJ1Y3Qga3ZtICprdm0pCj4gPiAgCWlmICghaWt2bSkKPiA+ICAJCXJldHVybjsKPiA+ICAK
PiA+ICsJLyogdHJpZ2dlciBzb2NrZXQgc2h1dGRvd24gLSBrdm1pX3JlY3YoKSB3aWxsIHN0YXJ0
IHNodXRkb3duIHByb2Nlc3MgKi8KPiA+ICsJa3ZtaV9zb2NrX3NodXRkb3duKGlrdm0pOwo+ID4g
Kwo+ID4gIAlrdm1pX3B1dChrdm0pOwo+ID4gIAo+ID4gIAkvKiB3YWl0IGZvciBpbnRyb3NwZWN0
aW9uIHJlc291cmNlcyB0byBiZSByZWxlYXNlZCAqLwo+ID4gIAl3YWl0X2Zvcl9jb21wbGV0aW9u
X2tpbGxhYmxlKCZrdm0tPmt2bWlfY29tcGxldGVkKTsKPiA+ICB9Cj4gPiArCj4gCj4gVGhpcyBh
ZGRpdGlvbiBtZWFucyB0aGF0IGt2bWlfZGVzdHJveV92bSBzaG91bGQgaGF2ZSBjYWxsZWQKPiBr
dm1pX2VuZF9pbnRyb3NwZWN0aW9uIGluc3RlYWQuICBJbiBwYXRjaCAxLCBrdm1pX2VuZF9pbnRy
b3NwZWN0aW9uCj4gc2hvdWxkIGhhdmUgYmVlbiBqdXN0IGt2bWlfcHV0LCBub3cgdGhpcyBwYXRj
aCBjYW4gYWRkIGt2bWlfc29ja19zaHV0ZG93bi4KPiAKPiBQYW9sbwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxp
c3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0
cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
