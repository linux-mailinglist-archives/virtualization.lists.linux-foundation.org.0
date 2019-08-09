Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 804B08823A
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 20:20:52 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A373FE31;
	Fri,  9 Aug 2019 18:20:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2ECEFE37
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 18:19:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A214A89D
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 18:19:57 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	DE002305D3E1; Fri,  9 Aug 2019 19:01:03 +0300 (EEST)
Received: from localhost.localdomain (unknown [89.136.169.210])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id C1A4A305B7A0;
	Fri,  9 Aug 2019 19:01:01 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v6 28/92] kvm: x86: consult the page tracking from
	kvm_mmu_get_page() and __direct_map()
Date: Fri,  9 Aug 2019 18:59:43 +0300
Message-Id: <20190809160047.8319-29-alazar@bitdefender.com>
In-Reply-To: <20190809160047.8319-1-alazar@bitdefender.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>, Yu C <yu.c.zhang@intel.com>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	=?UTF-8?q?Samuel=20Laur=C3=A9n?= <samuel.lauren@iki.fi>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Sean Christopherson <sean.j.christopherson@intel.com>,
	virtualization@lists.linux-foundation.org,
	=?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
	linux-mm@kvack.org, Patrick Colp <patrick.colp@oracle.com>,
	Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Zhang@mail.linuxfoundation.org,
	=?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKS1ZNIGRvZXNuJ3Qg
bm9ybWFsbHkgbmVlZCB0byBrZWVwIHRyYWNrIHRoYXQgY2xvc2VseSB0byBwYWdlIGFjY2VzcyBi
aXRzLApob3dldmVyIGZvciB0aGUgaW50cm9zcGVjdGlvbiBzdWJzeXN0ZW0gdGhpcyBpcyBlc3Nl
bnRpYWwuCgpTdWdnZXN0ZWQtYnk6IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+
Ckxpbms6IGh0dHBzOi8vbWFyYy5pbmZvLz9sPWt2bSZtPTE0OTgwNDk4NzQxNzEzMSZ3PTIKQ0M6
IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW4uai5jaHJpc3RvcGhlcnNvbkBpbnRlbC5jb20+ClNp
Z25lZC1vZmYtYnk6IE1paGFpIERvbsibdSA8bWRvbnR1QGJpdGRlZmVuZGVyLmNvbT4KU2lnbmVk
LW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIGFy
Y2gveDg2L2t2bS9tbXUuYyB8IDIxICsrKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5n
ZWQsIDE5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94
ODYva3ZtL21tdS5jIGIvYXJjaC94ODYva3ZtL21tdS5jCmluZGV4IDllYWY2Y2M3NzZhOS4uODEw
ZTNlNWJkNTc1IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vbW11LmMKKysrIGIvYXJjaC94ODYv
a3ZtL21tdS5jCkBAIC0yNDkxLDYgKzI0OTEsMjAgQEAgc3RhdGljIHZvaWQgY2xlYXJfc3Bfd3Jp
dGVfZmxvb2RpbmdfY291bnQodTY0ICpzcHRlKQogCV9fY2xlYXJfc3Bfd3JpdGVfZmxvb2Rpbmdf
Y291bnQoc3ApOwogfQogCitzdGF0aWMgdW5zaWduZWQgaW50IGt2bV9tbXVfcGFnZV90cmFja19h
Y2Moc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBnZm5fdCBnZm4sCisJCQkJCSAgIHVuc2lnbmVkIGlu
dCBhY2MpCit7CisJaWYgKGt2bV9wYWdlX3RyYWNrX2lzX2FjdGl2ZSh2Y3B1LCBnZm4sIEtWTV9Q
QUdFX1RSQUNLX1BSRVJFQUQpKQorCQlhY2MgJj0gfkFDQ19VU0VSX01BU0s7CisJaWYgKGt2bV9w
YWdlX3RyYWNrX2lzX2FjdGl2ZSh2Y3B1LCBnZm4sIEtWTV9QQUdFX1RSQUNLX1BSRVdSSVRFKSB8
fAorCSAgICBrdm1fcGFnZV90cmFja19pc19hY3RpdmUodmNwdSwgZ2ZuLCBLVk1fUEFHRV9UUkFD
S19XUklURSkpCisJCWFjYyAmPSB+QUNDX1dSSVRFX01BU0s7CisJaWYgKGt2bV9wYWdlX3RyYWNr
X2lzX2FjdGl2ZSh2Y3B1LCBnZm4sIEtWTV9QQUdFX1RSQUNLX1BSRUVYRUMpKQorCQlhY2MgJj0g
fkFDQ19FWEVDX01BU0s7CisKKwlyZXR1cm4gYWNjOworfQorCiBzdGF0aWMgc3RydWN0IGt2bV9t
bXVfcGFnZSAqa3ZtX21tdV9nZXRfcGFnZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJCQkJCSAg
ICAgZ2ZuX3QgZ2ZuLAogCQkJCQkgICAgIGd2YV90IGdhZGRyLApAQCAtMjUxMSw3ICsyNTI1LDcg
QEAgc3RhdGljIHN0cnVjdCBrdm1fbW11X3BhZ2UgKmt2bV9tbXVfZ2V0X3BhZ2Uoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LAogCXJvbGUuZGlyZWN0ID0gZGlyZWN0OwogCWlmIChyb2xlLmRpcmVjdCkK
IAkJcm9sZS5jcjRfcGFlID0gMDsKLQlyb2xlLmFjY2VzcyA9IGFjY2VzczsKKwlyb2xlLmFjY2Vz
cyA9IGt2bV9tbXVfcGFnZV90cmFja19hY2ModmNwdSwgZ2ZuLCBhY2Nlc3MpOwogCWlmICghdmNw
dS0+YXJjaC5tbXUtPmRpcmVjdF9tYXAKIAkgICAgJiYgdmNwdS0+YXJjaC5tbXUtPnJvb3RfbGV2
ZWwgPD0gUFQzMl9ST09UX0xFVkVMKSB7CiAJCXF1YWRyYW50ID0gZ2FkZHIgPj4gKFBBR0VfU0hJ
RlQgKyAoUFQ2NF9QVF9CSVRTICogbGV2ZWwpKTsKQEAgLTMyMzQsNyArMzI0OCwxMCBAQCBzdGF0
aWMgaW50IF9fZGlyZWN0X21hcChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGludCB3cml0ZSwgaW50
IG1hcF93cml0YWJsZSwKIAogCWZvcl9lYWNoX3NoYWRvd19lbnRyeSh2Y3B1LCAodTY0KWdmbiA8
PCBQQUdFX1NISUZULCBpdGVyYXRvcikgewogCQlpZiAoaXRlcmF0b3IubGV2ZWwgPT0gbGV2ZWwp
IHsKLQkJCWVtdWxhdGUgPSBtbXVfc2V0X3NwdGUodmNwdSwgaXRlcmF0b3Iuc3B0ZXAsIEFDQ19B
TEwsCisJCQl1bnNpZ25lZCBpbnQgYWNjID0ga3ZtX21tdV9wYWdlX3RyYWNrX2FjYyh2Y3B1LCBn
Zm4sCisJCQkJCQkJCSAgQUNDX0FMTCk7CisKKwkJCWVtdWxhdGUgPSBtbXVfc2V0X3NwdGUodmNw
dSwgaXRlcmF0b3Iuc3B0ZXAsIGFjYywKIAkJCQkJICAgICAgIHdyaXRlLCBsZXZlbCwgZ2ZuLCBw
Zm4sIHByZWZhdWx0LAogCQkJCQkgICAgICAgbWFwX3dyaXRhYmxlKTsKIAkJCWRpcmVjdF9wdGVf
cHJlZmV0Y2godmNwdSwgaXRlcmF0b3Iuc3B0ZXApOwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVh
bGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
