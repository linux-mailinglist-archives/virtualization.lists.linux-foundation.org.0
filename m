Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 57238AEF8B
	for <lists.virtualization@lfdr.de>; Tue, 10 Sep 2019 18:28:04 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9B635DDD;
	Tue, 10 Sep 2019 16:27:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 76577C7D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 16:27:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7A15B8AA
	for <virtualization@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 16:27:54 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	5CA3A307483A; Tue, 10 Sep 2019 19:27:52 +0300 (EEST)
Received: from localhost (unknown [195.210.5.22])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id 3C3B8303A562;
	Tue, 10 Sep 2019 19:27:52 +0300 (EEST)
From: Adalbert =?iso-8859-2?b?TGF643I=?= <alazar@bitdefender.com>
Subject: Re: [RFC PATCH v6 69/92] kvm: x86: keep the page protected if tracked
	by the introspection tool
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
In-Reply-To: <20190910142642.GC5879@char.us.oracle.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-70-alazar@bitdefender.com>
	<20190910142642.GC5879@char.us.oracle.com>
Date: Tue, 10 Sep 2019 19:28:19 +0300
Message-ID: <15681328990.F582D7fCB.15355@host>
User-agent: void
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00, FROM_EXCESS_BASE64, 
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>,
	Yu C <yu.c.zhang@intel.com>, kvm@vger.kernel.org,
	Radim =?iso-8859-2?b?S3LobeH4?= <rkrcmar@redhat.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Samuel =?iso-8859-1?q?Laur=E9n?= <samuel.lauren@iki.fi>,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	Patrick Colp <patrick.colp@oracle.com>,
	Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
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

T24gVHVlLCAxMCBTZXAgMjAxOSAxMDoyNjo0MiAtMDQwMCwgS29ucmFkIFJ6ZXN6dXRlayBXaWxr
IDxrb25yYWQud2lsa0BvcmFjbGUuY29tPiB3cm90ZToKPiBPbiBGcmksIEF1ZyAwOSwgMjAxOSBh
dCAwNzowMDoyNFBNICswMzAwLCBBZGFsYmVydCBMYXrEg3Igd3JvdGU6Cj4gPiBUaGlzIHBhdGNo
IG1pZ2h0IGJlIG9ic29sZXRlIHRoYW5rcyB0byBzaW5nbGUtc3RlcHBpbmcuCj4gCj4gc29vbyBz
aG91bGQgaXQgYmUgc2tpcHBlZCBmcm9tIHRoaXMgbGFyZ2UgcGF0Y2hzZXQgdG8gZWFzeQo+IHJl
dmlldz8KCkknbGwgYWRkIGEgY291cGxlIG9mIHdhcm5pbmcgbWVzc2FnZXMgdG8gY2hlY2sgaWYg
dGhpcyBwYXRjaCBpcyBzdGlsbApuZWVkZWQsIGluIG9yZGVyIHRvIHNraXAgaXQgZnJvbSB0aGUg
bmV4dCBzdWJtaXNzaW9uICh3aGljaCB3aWxsIGJlIHNtYWxsZXI6KQoKSG93ZXZlciwgb24gQU1E
LCBzaW5nbGUtc3RlcHBpbmcgaXMgbm90IGFuIG9wdGlvbi4KClRoYW5rcywKQWRhbGJlcnQKCj4g
Cj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJpdGRlZmVu
ZGVyLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gveDg2L2t2bS94ODYuYyB8IDkgKysrKysrKy0tCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+IAo+
ID4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS94ODYuYyBiL2FyY2gveDg2L2t2bS94ODYuYwo+
ID4gaW5kZXggMmMwNmRlNzNhNzg0Li4wNmY0NGNlOGVkMDcgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNo
L3g4Ni9rdm0veDg2LmMKPiA+ICsrKyBiL2FyY2gveDg2L2t2bS94ODYuYwo+ID4gQEAgLTYzMTEs
NyArNjMxMSw4IEBAIHN0YXRpYyBib29sIHJlZXhlY3V0ZV9pbnN0cnVjdGlvbihzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUsIGd2YV90IGNyMiwKPiA+ICAJCWluZGlyZWN0X3NoYWRvd19wYWdlcyA9IHZj
cHUtPmt2bS0+YXJjaC5pbmRpcmVjdF9zaGFkb3dfcGFnZXM7Cj4gPiAgCQlzcGluX3VubG9jaygm
dmNwdS0+a3ZtLT5tbXVfbG9jayk7Cj4gPiAgCj4gPiAtCQlpZiAoaW5kaXJlY3Rfc2hhZG93X3Bh
Z2VzKQo+ID4gKwkJaWYgKGluZGlyZWN0X3NoYWRvd19wYWdlcwo+ID4gKwkJICAgICYmICFrdm1p
X3RyYWNrZWRfZ2ZuKHZjcHUsIGdwYV90b19nZm4oZ3BhKSkpCj4gPiAgCQkJa3ZtX21tdV91bnBy
b3RlY3RfcGFnZSh2Y3B1LT5rdm0sIGdwYV90b19nZm4oZ3BhKSk7Cj4gPiAgCj4gPiAgCQlyZXR1
cm4gdHJ1ZTsKPiA+IEBAIC02MzIyLDcgKzYzMjMsOCBAQCBzdGF0aWMgYm9vbCByZWV4ZWN1dGVf
aW5zdHJ1Y3Rpb24oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBndmFfdCBjcjIsCj4gPiAgCSAqIGFu
ZCBpdCBmYWlsZWQgdHJ5IHRvIHVuc2hhZG93IHBhZ2UgYW5kIHJlLWVudGVyIHRoZQo+ID4gIAkg
KiBndWVzdCB0byBsZXQgQ1BVIGV4ZWN1dGUgdGhlIGluc3RydWN0aW9uLgo+ID4gIAkgKi8KPiA+
IC0Ja3ZtX21tdV91bnByb3RlY3RfcGFnZSh2Y3B1LT5rdm0sIGdwYV90b19nZm4oZ3BhKSk7Cj4g
PiArCWlmICgha3ZtaV90cmFja2VkX2dmbih2Y3B1LCBncGFfdG9fZ2ZuKGdwYSkpKQo+ID4gKwkJ
a3ZtX21tdV91bnByb3RlY3RfcGFnZSh2Y3B1LT5rdm0sIGdwYV90b19nZm4oZ3BhKSk7Cj4gPiAg
Cj4gPiAgCS8qCj4gPiAgCSAqIElmIHRoZSBhY2Nlc3MgZmF1bHRzIG9uIGl0cyBwYWdlIHRhYmxl
LCBpdCBjYW4gbm90Cj4gPiBAQCAtNjM3NCw2ICs2Mzc2LDkgQEAgc3RhdGljIGJvb2wgcmV0cnlf
aW5zdHJ1Y3Rpb24oc3RydWN0IHg4Nl9lbXVsYXRlX2N0eHQgKmN0eHQsCj4gPiAgCWlmICghdmNw
dS0+YXJjaC5tbXUtPmRpcmVjdF9tYXApCj4gPiAgCQlncGEgPSBrdm1fbW11X2d2YV90b19ncGFf
d3JpdGUodmNwdSwgY3IyLCBOVUxMKTsKPiA+ICAKPiA+ICsJaWYgKGt2bWlfdHJhY2tlZF9nZm4o
dmNwdSwgZ3BhX3RvX2dmbihncGEpKSkKPiA+ICsJCXJldHVybiBmYWxzZTsKPiA+ICsKPiA+ICAJ
a3ZtX21tdV91bnByb3RlY3RfcGFnZSh2Y3B1LT5rdm0sIGdwYV90b19nZm4oZ3BhKSk7Cj4gPiAg
Cj4gPiAgCXJldHVybiB0cnVlOwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlz
dHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3Jn
L21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
