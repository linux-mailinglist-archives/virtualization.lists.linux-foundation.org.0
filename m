Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C0F8821D
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 20:15:54 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BB6A2E21;
	Fri,  9 Aug 2019 18:15:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EDFF5E18
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 18:14:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 32923829
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 18:14:58 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	49B84305D3DC; Fri,  9 Aug 2019 19:00:59 +0300 (EEST)
Received: from localhost.localdomain (unknown [89.136.169.210])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id F37DF305B7A0;
	Fri,  9 Aug 2019 19:00:58 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v6 20/92] kvm: introspection: add KVMI_GET_VCPU_INFO
Date: Fri,  9 Aug 2019 18:59:35 +0300
Message-Id: <20190809160047.8319-21-alazar@bitdefender.com>
In-Reply-To: <20190809160047.8319-1-alazar@bitdefender.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>, Yu C <yu.c.zhang@intel.com>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	=?UTF-8?q?Samuel=20Laur=C3=A9n?= <samuel.lauren@iki.fi>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKRm9yIG5vdywgdGhp
cyBjb21tYW5kIHJldHVybnMgdGhlIFRTQyBmcmVxdWVuY3kgKGluIEhaKSBmb3IgdGhlIHNwZWNp
ZmllZAp2Q1BVIGlmIGF2YWlsYWJsZSAob3RoZXJ3aXNlIGl0IHJldHVybnMgemVybykuCgpTaWdu
ZWQtb2ZmLWJ5OiBNaWhhaSBEb27Im3UgPG1kb250dUBiaXRkZWZlbmRlci5jb20+ClNpZ25lZC1v
ZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJpdGRlZmVuZGVyLmNvbT4KLS0tCiBEb2N1
bWVudGF0aW9uL3ZpcnR1YWwva3ZtL2t2bWkucnN0IHwgMjkgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKIGFyY2gveDg2L2t2bS9rdm1pLmMgICAgICAgICAgICAgICAgfCAxMiArKysrKysr
KysrKysKIGluY2x1ZGUvdWFwaS9saW51eC9rdm1pLmggICAgICAgICAgfCAgNCArKysrCiB2aXJ0
L2t2bS9rdm1pX2ludC5oICAgICAgICAgICAgICAgIHwgIDIgKysKIHZpcnQva3ZtL2t2bWlfbXNn
LmMgICAgICAgICAgICAgICAgfCAxNCArKysrKysrKysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCA2
MSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi92aXJ0dWFsL2t2bS9r
dm1pLnJzdCBiL0RvY3VtZW50YXRpb24vdmlydHVhbC9rdm0va3ZtaS5yc3QKaW5kZXggYjI5Y2Qx
YjgwYjRmLi43MTg5NzMzOGU4NWEgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vdmlydHVhbC9r
dm0va3ZtaS5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi92aXJ0dWFsL2t2bS9rdm1pLnJzdApAQCAt
NDI3LDYgKzQyNywzNSBAQCBpbiBhbG1vc3QgYWxsIGNhc2VzLCBpdCBtdXN0IHJlcGx5IHdpdGg6
IGNvbnRpbnVlLCByZXRyeSwgY3Jhc2gsIGV0Yy4KICogLUtWTV9FSU5WQUwgLSBwYWRkaW5nIGlz
IG5vdCB6ZXJvCiAqIC1LVk1fRVBFUk0gLSB0aGUgYWNjZXNzIGlzIHJlc3RyaWN0ZWQgYnkgdGhl
IGhvc3QKIAorNy4gS1ZNSV9HRVRfVkNQVV9JTkZPCistLS0tLS0tLS0tLS0tLS0tLS0tLS0KKwor
OkFyY2hpdGVjdHVyZXM6IGFsbAorOlZlcnNpb25zOiA+PSAxCis6UGFyYW1ldGVyczoKKworOjoK
KworCXN0cnVjdCBrdm1pX3ZjcHVfaGRyOworCis6UmV0dXJuczoKKworOjoKKworCXN0cnVjdCBr
dm1pX2Vycm9yX2NvZGU7CisJc3RydWN0IGt2bWlfZ2V0X3ZjcHVfaW5mb19yZXBseSB7CisJCV9f
dTY0IHRzY19zcGVlZDsKKwl9OworCitSZXR1cm5zIHRoZSBUU0MgZnJlcXVlbmN5IChpbiBIWikg
Zm9yIHRoZSBzcGVjaWZpZWQgdkNQVSBpZiBhdmFpbGFibGUKKyhvdGhlcndpc2UgaXQgcmV0dXJu
cyB6ZXJvKS4KKworOkVycm9yczoKKworKiAtS1ZNX0VJTlZBTCAtIHRoZSBzZWxlY3RlZCB2Q1BV
IGlzIGludmFsaWQKKyogLUtWTV9FSU5WQUwgLSBwYWRkaW5nIGlzIG5vdCB6ZXJvCisqIC1LVk1f
RUFHQUlOIC0gdGhlIHNlbGVjdGVkIHZDUFUgY2FuJ3QgYmUgaW50cm9zcGVjdGVkIHlldAorCiBF
dmVudHMKID09PT09PQogCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0va3ZtaS5jIGIvYXJjaC94
ODYva3ZtL2t2bWkuYwppbmRleCA5YWVjY2E1NTE2NzMuLjk3YzcyY2RjNmZiMCAxMDA2NDQKLS0t
IGEvYXJjaC94ODYva3ZtL2t2bWkuYworKysgYi9hcmNoL3g4Ni9rdm0va3ZtaS5jCkBAIC05MCwz
ICs5MCwxNSBAQCB2b2lkIGt2bWlfYXJjaF9zZXR1cF9ldmVudChzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsIHN0cnVjdCBrdm1pX2V2ZW50ICpldikKIAlldi0+YXJjaC5tb2RlID0ga3ZtaV92Y3B1X21v
ZGUodmNwdSwgJmV2ZW50LT5zcmVncyk7CiAJa3ZtaV9nZXRfbXNycyh2Y3B1LCBldmVudCk7CiB9
CisKK2ludCBrdm1pX2FyY2hfY21kX2dldF92Y3B1X2luZm8oc3RydWN0IGt2bV92Y3B1ICp2Y3B1
LAorCQkJCXN0cnVjdCBrdm1pX2dldF92Y3B1X2luZm9fcmVwbHkgKnJwbCkKK3sKKwlpZiAoa3Zt
X2hhc190c2NfY29udHJvbCkKKwkJcnBsLT50c2Nfc3BlZWQgPSAxMDAwdWwgKiB2Y3B1LT5hcmNo
LnZpcnR1YWxfdHNjX2toejsKKwllbHNlCisJCXJwbC0+dHNjX3NwZWVkID0gMDsKKworCXJldHVy
biAwOworfQorCmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgva3ZtaS5oIGIvaW5jbHVk
ZS91YXBpL2xpbnV4L2t2bWkuaAppbmRleCBjY2YyMjM5YjVkYjQuLmFhNWJjOTA5ZTI3OCAxMDA2
NDQKLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaAorKysgYi9pbmNsdWRlL3VhcGkvbGlu
dXgva3ZtaS5oCkBAIC0xMTIsNiArMTEyLDEwIEBAIHN0cnVjdCBrdm1pX2dldF9ndWVzdF9pbmZv
X3JlcGx5IHsKIAlfX3UzMiBwYWRkaW5nWzNdOwogfTsKIAorc3RydWN0IGt2bWlfZ2V0X3ZjcHVf
aW5mb19yZXBseSB7CisJX191NjQgdHNjX3NwZWVkOworfTsKKwogc3RydWN0IGt2bWlfY29udHJv
bF92bV9ldmVudHMgewogCV9fdTE2IGV2ZW50X2lkOwogCV9fdTggZW5hYmxlOwpkaWZmIC0tZ2l0
IGEvdmlydC9rdm0va3ZtaV9pbnQuaCBiL3ZpcnQva3ZtL2t2bWlfaW50LmgKaW5kZXggYzIxZjBm
ZDVlMTZjLi43Y2ZmOTFiYzFhY2MgMTAwNjQ0Ci0tLSBhL3ZpcnQva3ZtL2t2bWlfaW50LmgKKysr
IGIvdmlydC9rdm0va3ZtaV9pbnQuaApAQCAtMTM5LDUgKzEzOSw3IEBAIGludCBrdm1pX2FkZF9q
b2Ioc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCiAvKiBhcmNoICovCiB2b2lkIGt2bWlfYXJjaF9z
ZXR1cF9ldmVudChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1pX2V2ZW50ICpldik7
CitpbnQga3ZtaV9hcmNoX2NtZF9nZXRfdmNwdV9pbmZvKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwK
KwkJCQlzdHJ1Y3Qga3ZtaV9nZXRfdmNwdV9pbmZvX3JlcGx5ICpycGwpOwogCiAjZW5kaWYKZGlm
ZiAtLWdpdCBhL3ZpcnQva3ZtL2t2bWlfbXNnLmMgYi92aXJ0L2t2bS9rdm1pX21zZy5jCmluZGV4
IDhlOGFmNTcyYTRmNC4uMzM3MmQ4YzdlNzRmIDEwMDY0NAotLS0gYS92aXJ0L2t2bS9rdm1pX21z
Zy5jCisrKyBiL3ZpcnQva3ZtL2t2bWlfbXNnLmMKQEAgLTI4LDYgKzI4LDcgQEAgc3RhdGljIGNv
bnN0IGNoYXIgKmNvbnN0IG1zZ19JRHNbXSA9IHsKIAlbS1ZNSV9FVkVOVF0gICAgICAgICAgICAg
ICAgID0gIktWTUlfRVZFTlQiLAogCVtLVk1JX0VWRU5UX1JFUExZXSAgICAgICAgICAgPSAiS1ZN
SV9FVkVOVF9SRVBMWSIsCiAJW0tWTUlfR0VUX0dVRVNUX0lORk9dICAgICAgICA9ICJLVk1JX0dF
VF9HVUVTVF9JTkZPIiwKKwlbS1ZNSV9HRVRfVkNQVV9JTkZPXSAgICAgICAgID0gIktWTUlfR0VU
X1ZDUFVfSU5GTyIsCiAJW0tWTUlfR0VUX1ZFUlNJT05dICAgICAgICAgICA9ICJLVk1JX0dFVF9W
RVJTSU9OIiwKIH07CiAKQEAgLTM5MCw2ICszOTEsMTggQEAgc3RhdGljIGludCBoYW5kbGVfZXZl
bnRfcmVwbHkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCXJldHVybiBleHBlY3RlZC0+ZXJyb3I7
CiB9CiAKK3N0YXRpYyBpbnQgaGFuZGxlX2dldF92Y3B1X2luZm8oc3RydWN0IGt2bV92Y3B1ICp2
Y3B1LAorCQkJCWNvbnN0IHN0cnVjdCBrdm1pX21zZ19oZHIgKm1zZywKKwkJCQljb25zdCB2b2lk
ICpyZXEsIHZjcHVfcmVwbHlfZmN0IHJlcGx5X2NiKQoreworCXN0cnVjdCBrdm1pX2dldF92Y3B1
X2luZm9fcmVwbHkgcnBsOworCisJbWVtc2V0KCZycGwsIDAsIHNpemVvZihycGwpKTsKKwlrdm1p
X2FyY2hfY21kX2dldF92Y3B1X2luZm8odmNwdSwgJnJwbCk7CisKKwlyZXR1cm4gcmVwbHlfY2Io
dmNwdSwgbXNnLCAwLCAmcnBsLCBzaXplb2YocnBsKSk7Cit9CisKIC8qCiAgKiBUaGVzZSBjb21t
YW5kcyBhcmUgZXhlY3V0ZWQgb24gdGhlIHZDUFUgdGhyZWFkLiBUaGUgcmVjZWl2aW5nIHRocmVh
ZAogICogcGFzc2VzIHRoZSBtZXNzYWdlcyB1c2luZyBhIG5ld2x5IGFsbG9jYXRlZCAnc3RydWN0
IGt2bWlfdmNwdV9jbWQnCkBAIC00MDAsNiArNDEzLDcgQEAgc3RhdGljIGludCgqY29uc3QgbXNn
X3ZjcHVbXSkoc3RydWN0IGt2bV92Y3B1ICosCiAJCQkgICAgICBjb25zdCBzdHJ1Y3Qga3ZtaV9t
c2dfaGRyICosIGNvbnN0IHZvaWQgKiwKIAkJCSAgICAgIHZjcHVfcmVwbHlfZmN0KSA9IHsKIAlb
S1ZNSV9FVkVOVF9SRVBMWV0gICAgICA9IGhhbmRsZV9ldmVudF9yZXBseSwKKwlbS1ZNSV9HRVRf
VkNQVV9JTkZPXSAgICA9IGhhbmRsZV9nZXRfdmNwdV9pbmZvLAogfTsKIAogc3RhdGljIHZvaWQg
a3ZtaV9qb2JfdmNwdV9jbWQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB2b2lkICpfY3R4KQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlv
biBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcK
aHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVh
bGl6YXRpb24=
