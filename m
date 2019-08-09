Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A90E87F7B
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 18:18:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 556A6E36;
	Fri,  9 Aug 2019 16:15:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp2.linuxfoundation.org (smtp2.linux-foundation.org
	[172.17.192.36])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 07BFADE1
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 16:15:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp2.linuxfoundation.org (Postfix) with ESMTPS id 6D9961DE27
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 16:15:01 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	8A7A030208C5; Fri,  9 Aug 2019 19:01:07 +0300 (EEST)
Received: from localhost.localdomain (unknown [89.136.169.210])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id 891CD305B7A0;
	Fri,  9 Aug 2019 19:01:06 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v6 37/92] KVM: VMX: Introduce SPP access bitmap and
	operation functions
Date: Fri,  9 Aug 2019 18:59:52 +0300
Message-Id: <20190809160047.8319-38-alazar@bitdefender.com>
In-Reply-To: <20190809160047.8319-1-alazar@bitdefender.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp2.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>,
	Zhang Yi <yi.z.zhang@linux.intel.com>, Yu C <yu.c.zhang@intel.com>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>,
	He Chen <he.chen@linux.intel.com>,
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

RnJvbTogWWFuZyBXZWlqaWFuZyA8d2VpamlhbmcueWFuZ0BpbnRlbC5jb20+CgpDcmVhdGUgYWNj
ZXNzIGJpdG1hcCBmb3IgU1BQIHN1YnBhZ2VzLCA0S0IvMTI4QiA9IDMyYml0cywKZm9yIGVhY2gg
NEtCIHBoeXNpY2FsIHBhZ2UsIDMyYml0cyBhcmUgcmVxdWlyZWQuIFRoZSBiaXRtYXAgY2FuCmJl
IGVhc2lseSBhY2Nlc3NlZCB3aXRoIGEgZ2ZuLiBUaGUgaW5pdGlhbCBhY2Nlc3MgYml0bWFwIGZv
ciBlYWNoCnBoeXNpY2FsIHBhZ2UgaXMgMHhGRkZGRkZGRiwgbWVhbmluZyBTUFAgaXMgbm90IGVu
YWJsZWQgZm9yIHRoZQpzdWJwYWdlcy4KCkNvLWRldmVsb3BlZC1ieTogSGUgQ2hlbiA8aGUuY2hl
bkBsaW51eC5pbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEhlIENoZW4gPGhlLmNoZW5AbGludXgu
aW50ZWwuY29tPgpDby1kZXZlbG9wZWQtYnk6IFpoYW5nIFlpIDx5aS56LnpoYW5nQGxpbnV4Lmlu
dGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogWmhhbmcgWWkgPHlpLnouemhhbmdAbGludXguaW50ZWwu
Y29tPgpDby1kZXZlbG9wZWQtYnk6IFlhbmcgV2VpamlhbmcgPHdlaWppYW5nLnlhbmdAaW50ZWwu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBZYW5nIFdlaWppYW5nIDx3ZWlqaWFuZy55YW5nQGludGVsLmNv
bT4KTWVzc2FnZS1JZDogPDIwMTkwNzE3MTMzNzUxLjEyOTEwLTUtd2VpamlhbmcueWFuZ0BpbnRl
bC5jb20+ClNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJpdGRlZmVuZGVy
LmNvbT4KLS0tCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIHwgIDEgKwogYXJjaC94
ODYva3ZtL21tdS5jICAgICAgICAgICAgICB8IDUwICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwogYXJjaC94ODYva3ZtL3g4Ni5jICAgICAgICAgICAgICB8IDExICsrKysrKysrCiAz
IGZpbGVzIGNoYW5nZWQsIDYyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9p
bmNsdWRlL2FzbS9rdm1faG9zdC5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaApp
bmRleCBjMDU5ODRmMzk5MjMuLmYwODc4NjMxYjEyYSAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5j
bHVkZS9hc20va3ZtX2hvc3QuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5o
CkBAIC03OTAsNiArNzkwLDcgQEAgc3RydWN0IGt2bV9scGFnZV9pbmZvIHsKIAogc3RydWN0IGt2
bV9hcmNoX21lbW9yeV9zbG90IHsKIAlzdHJ1Y3Qga3ZtX3JtYXBfaGVhZCAqcm1hcFtLVk1fTlJf
UEFHRV9TSVpFU107CisJdTMyICpzdWJwYWdlX3dwX2luZm87CiAJc3RydWN0IGt2bV9scGFnZV9p
bmZvICpscGFnZV9pbmZvW0tWTV9OUl9QQUdFX1NJWkVTIC0gMV07CiAJdW5zaWduZWQgc2hvcnQg
Kmdmbl90cmFja1tLVk1fUEFHRV9UUkFDS19NQVhdOwogfTsKZGlmZiAtLWdpdCBhL2FyY2gveDg2
L2t2bS9tbXUuYyBiL2FyY2gveDg2L2t2bS9tbXUuYwppbmRleCA4YTYyODdjZDJiZTQuLmYyNzc0
YmJjZmVlZCAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL21tdS5jCisrKyBiL2FyY2gveDg2L2t2
bS9tbXUuYwpAQCAtMTQ4Miw2ICsxNDgyLDU2IEBAIHN0YXRpYyB1NjQgKnJtYXBfZ2V0X25leHQo
c3RydWN0IHJtYXBfaXRlcmF0b3IgKml0ZXIpCiAJcmV0dXJuIHNwdGVwOwogfQogCisjZGVmaW5l
IEZVTExfU1BQX0FDQ0VTUwkJKCh1MzIpKCgxVUxMIDw8IDMyKSAtIDEpKQorCitzdGF0aWMgaW50
IGt2bV9zdWJwYWdlX2NyZWF0ZV9iaXRtYXBzKHN0cnVjdCBrdm0gKmt2bSkKK3sKKwlzdHJ1Y3Qg
a3ZtX21lbXNsb3RzICpzbG90czsKKwlzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICptZW1zbG90Owor
CWludCBpLCBqLCByZXQ7CisJdTMyICpidWZmOworCisJZm9yIChpID0gMDsgaSA8IEtWTV9BRERS
RVNTX1NQQUNFX05VTTsgaSsrKSB7CisJCXNsb3RzID0gX19rdm1fbWVtc2xvdHMoa3ZtLCBpKTsK
KwkJa3ZtX2Zvcl9lYWNoX21lbXNsb3QobWVtc2xvdCwgc2xvdHMpIHsKKwkJCWJ1ZmYgPSBrdnph
bGxvYyhtZW1zbG90LT5ucGFnZXMqCisJCQkJc2l6ZW9mKCptZW1zbG90LT5hcmNoLnN1YnBhZ2Vf
d3BfaW5mbyksCisJCQkJR0ZQX0tFUk5FTCk7CisKKwkJCWlmICghYnVmZikgeworCQkJICAgICAg
cmV0ID0gLUVOT01FTTsKKwkJCSAgICAgIGdvdG8gb3V0X2ZyZWU7CisJCQl9CisJCQltZW1zbG90
LT5hcmNoLnN1YnBhZ2Vfd3BfaW5mbyA9IGJ1ZmY7CisKKwkJCWZvcihqID0gMDsgajwgbWVtc2xv
dC0+bnBhZ2VzOyBqKyspCisJCQkgICAgICBidWZmW2pdID0gRlVMTF9TUFBfQUNDRVNTOworCQl9
CisJfQorCisJcmV0dXJuIDA7CitvdXRfZnJlZToKKwlmb3IgKGkgPSAwOyBpIDwgS1ZNX0FERFJF
U1NfU1BBQ0VfTlVNOyBpKyspIHsKKwkJc2xvdHMgPSBfX2t2bV9tZW1zbG90cyhrdm0sIGkpOwor
CQlrdm1fZm9yX2VhY2hfbWVtc2xvdChtZW1zbG90LCBzbG90cykgeworCQkJaWYgKG1lbXNsb3Qt
PmFyY2guc3VicGFnZV93cF9pbmZvKSB7CisJCQkJa3ZmcmVlKG1lbXNsb3QtPmFyY2guc3VicGFn
ZV93cF9pbmZvKTsKKwkJCQltZW1zbG90LT5hcmNoLnN1YnBhZ2Vfd3BfaW5mbyA9IE5VTEw7CisJ
CQl9CisJCX0KKwl9CisKKwlyZXR1cm4gcmV0OworfQorCitzdGF0aWMgdTMyICpnZm5fdG9fc3Vi
cGFnZV93cF9pbmZvKHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNsb3QsIGdmbl90IGdmbikKK3sK
Kwl1bnNpZ25lZCBsb25nIGlkeDsKKworCWlkeCA9IGdmbl90b19pbmRleChnZm4sIHNsb3QtPmJh
c2VfZ2ZuLCBQVF9QQUdFX1RBQkxFX0xFVkVMKTsKKwlyZXR1cm4gJnNsb3QtPmFyY2guc3VicGFn
ZV93cF9pbmZvW2lkeF07Cit9CisKICNkZWZpbmUgZm9yX2VhY2hfcm1hcF9zcHRlKF9ybWFwX2hl
YWRfLCBfaXRlcl8sIF9zcHRlXykJCQlcCiAJZm9yIChfc3B0ZV8gPSBybWFwX2dldF9maXJzdChf
cm1hcF9oZWFkXywgX2l0ZXJfKTsJCVwKIAkgICAgIF9zcHRlXzsgX3NwdGVfID0gcm1hcF9nZXRf
bmV4dChfaXRlcl8pKQpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3g4Ni5jIGIvYXJjaC94ODYv
a3ZtL3g4Ni5jCmluZGV4IGVmNmQ5ZGQ4MDA4Ni4uMmFjMWUwYWJhMWZjIDEwMDY0NAotLS0gYS9h
cmNoL3g4Ni9rdm0veDg2LmMKKysrIGIvYXJjaC94ODYva3ZtL3g4Ni5jCkBAIC05MzIwLDYgKzkz
MjAsMTcgQEAgdm9pZCBrdm1fYXJjaF9kZXN0cm95X3ZtKHN0cnVjdCBrdm0gKmt2bSkKIAlrdm1f
aHZfZGVzdHJveV92bShrdm0pOwogfQogCit2b2lkIGt2bV9zdWJwYWdlX2ZyZWVfbWVtc2xvdChz
dHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICpmcmVlLAorCQkJICAgICAgc3RydWN0IGt2bV9tZW1vcnlf
c2xvdCAqZG9udCkKK3sKKworCWlmICghZG9udCB8fCBmcmVlLT5hcmNoLnN1YnBhZ2Vfd3BfaW5m
byAhPQorCSAgICBkb250LT5hcmNoLnN1YnBhZ2Vfd3BfaW5mbykgeworCQlrdmZyZWUoZnJlZS0+
YXJjaC5zdWJwYWdlX3dwX2luZm8pOworCQlmcmVlLT5hcmNoLnN1YnBhZ2Vfd3BfaW5mbyA9IE5V
TEw7CisJfQorfQorCiB2b2lkIGt2bV9hcmNoX2ZyZWVfbWVtc2xvdChzdHJ1Y3Qga3ZtICprdm0s
IHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKmZyZWUsCiAJCQkgICBzdHJ1Y3Qga3ZtX21lbW9yeV9z
bG90ICpkb250KQogewpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGlu
dXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxt
YW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
