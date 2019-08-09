Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D122688199
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 19:50:30 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D2941CAC;
	Fri,  9 Aug 2019 17:49:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 131A8CB0
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 17:49:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BA0F08A6
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 17:49:54 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	DABFE305D361; Fri,  9 Aug 2019 19:01:39 +0300 (EEST)
Received: from localhost.localdomain (unknown [89.136.169.210])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id 8EF59305B7A3;
	Fri,  9 Aug 2019 19:01:39 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v6 79/92] kvm: x86: emulate movsd xmm, m64
Date: Fri,  9 Aug 2019 19:00:34 +0300
Message-Id: <20190809160047.8319-80-alazar@bitdefender.com>
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyBpcyBuZWVk
ZWQgaW4gb3JkZXIgdG8gYmUgYWJsZSB0byBzdXBwb3J0IGd1ZXN0IGNvZGUgdGhhdCB1c2VzIG1v
dnNkIHRvCndyaXRlIGludG8gcGFnZXMgdGhhdCBhcmUgbWFya2VkIGZvciB3cml0ZSB0cmFja2lu
Zy4KClNpZ25lZC1vZmYtYnk6IE1paGFpIERvbsibdSA8bWRvbnR1QGJpdGRlZmVuZGVyLmNvbT4K
U2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgot
LS0KIGFyY2gveDg2L2t2bS9lbXVsYXRlLmMgfCAzMiArKysrKysrKysrKysrKysrKysrKysrKysr
KystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL2VtdWxhdGUuYyBiL2FyY2gveDg2L2t2bS9lbXVs
YXRlLmMKaW5kZXggMzQ0MzFjZjMxZjc0Li45ZDM4Zjg5MmJlZWEgMTAwNjQ0Ci0tLSBhL2FyY2gv
eDg2L2t2bS9lbXVsYXRlLmMKKysrIGIvYXJjaC94ODYva3ZtL2VtdWxhdGUuYwpAQCAtMTE3Nyw2
ICsxMTc3LDI3IEBAIHN0YXRpYyBpbnQgZW1fZm5zdHN3KHN0cnVjdCB4ODZfZW11bGF0ZV9jdHh0
ICpjdHh0KQogCXJldHVybiBYODZFTVVMX0NPTlRJTlVFOwogfQogCitzdGF0aWMgdTggc2ltZF9w
cmVmaXhfdG9fYnl0ZXMoY29uc3Qgc3RydWN0IHg4Nl9lbXVsYXRlX2N0eHQgKmN0eHQsCisJCQkg
ICAgICAgaW50IHNpbWRfcHJlZml4KQoreworCXU4IGJ5dGVzOworCisJc3dpdGNoIChjdHh0LT5i
KSB7CisJY2FzZSAweDExOgorCQkvKiBtb3ZzZCB4bW0sIG02NCAqLworCQkvKiBtb3Z1cHMgeG1t
LCBtMTI4ICovCisJCWlmIChzaW1kX3ByZWZpeCA9PSAweGYyKSB7CisJCQlieXRlcyA9IDg7CisJ
CQlicmVhazsKKwkJfQorCQkvKiBmYWxsdGhyb3VnaCAqLworCWRlZmF1bHQ6CisJCWJ5dGVzID0g
MTY7CisJCWJyZWFrOworCX0KKwlyZXR1cm4gYnl0ZXM7Cit9CisKIHN0YXRpYyB2b2lkIGRlY29k
ZV9yZWdpc3Rlcl9vcGVyYW5kKHN0cnVjdCB4ODZfZW11bGF0ZV9jdHh0ICpjdHh0LAogCQkJCSAg
ICBzdHJ1Y3Qgb3BlcmFuZCAqb3ApCiB7CkBAIC0xMTg3LDcgKzEyMDgsNyBAQCBzdGF0aWMgdm9p
ZCBkZWNvZGVfcmVnaXN0ZXJfb3BlcmFuZChzdHJ1Y3QgeDg2X2VtdWxhdGVfY3R4dCAqY3R4dCwK
IAogCWlmIChjdHh0LT5kICYgU3NlKSB7CiAJCW9wLT50eXBlID0gT1BfWE1NOwotCQlvcC0+Ynl0
ZXMgPSAxNjsKKwkJb3AtPmJ5dGVzID0gY3R4dC0+b3BfYnl0ZXM7CiAJCW9wLT5hZGRyLnhtbSA9
IHJlZzsKIAkJcmVhZF9zc2VfcmVnKGN0eHQsICZvcC0+dmVjX3ZhbCwgcmVnKTsKIAkJcmV0dXJu
OwpAQCAtMTIzOCw3ICsxMjU5LDcgQEAgc3RhdGljIGludCBkZWNvZGVfbW9kcm0oc3RydWN0IHg4
Nl9lbXVsYXRlX2N0eHQgKmN0eHQsCiAJCQkJY3R4dC0+ZCAmIEJ5dGVPcCk7CiAJCWlmIChjdHh0
LT5kICYgU3NlKSB7CiAJCQlvcC0+dHlwZSA9IE9QX1hNTTsKLQkJCW9wLT5ieXRlcyA9IDE2Owor
CQkJb3AtPmJ5dGVzID0gY3R4dC0+b3BfYnl0ZXM7CiAJCQlvcC0+YWRkci54bW0gPSBjdHh0LT5t
b2RybV9ybTsKIAkJCXJlYWRfc3NlX3JlZyhjdHh0LCAmb3AtPnZlY192YWwsIGN0eHQtPm1vZHJt
X3JtKTsKIAkJCXJldHVybiByYzsKQEAgLTQ1MjksNyArNDU1MCw3IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgZ3ByZWZpeCBwZnhfMGZfMmIgPSB7CiB9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGdw
cmVmaXggcGZ4XzBmXzEwXzBmXzExID0gewotCUkoVW5hbGlnbmVkLCBlbV9tb3YpLCBJKFVuYWxp
Z25lZCwgZW1fbW92KSwgTiwgTiwKKwlJKFVuYWxpZ25lZCwgZW1fbW92KSwgSShVbmFsaWduZWQs
IGVtX21vdiksIEkoVW5hbGlnbmVkLCBlbV9tb3YpLCBOLAogfTsKIAogc3RhdGljIGNvbnN0IHN0
cnVjdCBncHJlZml4IHBmeF8wZl8yOF8wZl8yOSA9IHsKQEAgLTUwOTcsNyArNTExOCw3IEBAIGlu
dCB4ODZfZGVjb2RlX2luc24oc3RydWN0IHg4Nl9lbXVsYXRlX2N0eHQgKmN0eHQsIHZvaWQgKmlu
c24sIGludCBpbnNuX2xlbikKIHsKIAlpbnQgcmMgPSBYODZFTVVMX0NPTlRJTlVFOwogCWludCBt
b2RlID0gY3R4dC0+bW9kZTsKLQlpbnQgZGVmX29wX2J5dGVzLCBkZWZfYWRfYnl0ZXMsIGdvZmZz
ZXQsIHNpbWRfcHJlZml4OworCWludCBkZWZfb3BfYnl0ZXMsIGRlZl9hZF9ieXRlcywgZ29mZnNl
dCwgc2ltZF9wcmVmaXggPSAwOwogCWJvb2wgb3BfcHJlZml4ID0gZmFsc2U7CiAJYm9vbCBoYXNf
c2VnX292ZXJyaWRlID0gZmFsc2U7CiAJc3RydWN0IG9wY29kZSBvcGNvZGU7CkBAIC01MzIwLDcg
KzUzNDEsOCBAQCBpbnQgeDg2X2RlY29kZV9pbnNuKHN0cnVjdCB4ODZfZW11bGF0ZV9jdHh0ICpj
dHh0LCB2b2lkICppbnNuLCBpbnQgaW5zbl9sZW4pCiAJCQljdHh0LT5vcF9ieXRlcyA9IDQ7CiAK
IAkJaWYgKGN0eHQtPmQgJiBTc2UpCi0JCQljdHh0LT5vcF9ieXRlcyA9IDE2OworCQkJY3R4dC0+
b3BfYnl0ZXMgPSBzaW1kX3ByZWZpeF90b19ieXRlcyhjdHh0LAorCQkJCQkJCSAgICAgIHNpbWRf
cHJlZml4KTsKIAkJZWxzZSBpZiAoY3R4dC0+ZCAmIE1teCkKIAkJCWN0eHQtPm9wX2J5dGVzID0g
ODsKIAl9Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZp
cnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3Vu
ZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0
aW5mby92aXJ0dWFsaXphdGlvbg==
