Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7A6881B4
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 19:55:05 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 521A8D4B;
	Fri,  9 Aug 2019 17:54:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D3652C84
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 17:54:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5FA308A3
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 17:54:55 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	2FF813031ED5; Fri,  9 Aug 2019 19:01:41 +0300 (EEST)
Received: from localhost.localdomain (unknown [89.136.169.210])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id DE1A9305B7A4;
	Fri,  9 Aug 2019 19:01:40 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v6 83/92] kvm: x86: emulate movd xmm, m32
Date: Fri,  9 Aug 2019 19:00:38 +0300
Message-Id: <20190809160047.8319-84-alazar@bitdefender.com>
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
dmQgdG8Kd3JpdGUgaW50byBwYWdlcyB0aGF0IGFyZSBtYXJrZWQgZm9yIHdyaXRlIHRyYWNraW5n
LgoKU2lnbmVkLW9mZi1ieTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgpT
aWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+Ci0t
LQogYXJjaC94ODYva3ZtL2VtdWxhdGUuYyB8IDEyICsrKysrKysrKysrLQogMSBmaWxlIGNoYW5n
ZWQsIDExIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4
Ni9rdm0vZW11bGF0ZS5jIGIvYXJjaC94ODYva3ZtL2VtdWxhdGUuYwppbmRleCA3Yzc5NTA0ZTU4
Y2QuLmI0MmE3MTY1MzYyMiAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL2VtdWxhdGUuYworKysg
Yi9hcmNoL3g4Ni9rdm0vZW11bGF0ZS5jCkBAIC0xMjAzLDYgKzEyMDMsMTEgQEAgc3RhdGljIHU4
IHNpbWRfcHJlZml4X3RvX2J5dGVzKGNvbnN0IHN0cnVjdCB4ODZfZW11bGF0ZV9jdHh0ICpjdHh0
LAogCQlpZiAoc2ltZF9wcmVmaXggPT0gMHg2NikKIAkJCWJ5dGVzID0gODsKIAkJYnJlYWs7CisJ
Y2FzZSAweDdlOgorCQkvKiBtb3ZkIHhtbSwgbTMyICovCisJCWlmIChzaW1kX3ByZWZpeCA9PSAw
eDY2KQorCQkJYnl0ZXMgPSA0OworCQlicmVhazsKIAlkZWZhdWx0OgogCQlicmVhazsKIAl9CkBA
IC00NTY0LDYgKzQ1NjksMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBncHJlZml4IHBmeF8wZl9k
NiA9IHsKIAlOLCBJKDAsIGVtX21vdiksIE4sIE4sCiB9OwogCitzdGF0aWMgY29uc3Qgc3RydWN0
IGdwcmVmaXggcGZ4XzBmXzdlID0geworCU4sIEkoMCwgZW1fbW92KSwgTiwgTiwKK307CisKIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgZ3ByZWZpeCBwZnhfMGZfMmIgPSB7CiAJSUQoMCwgJmluc3RyX2R1
YWxfMGZfMmIpLCBJRCgwLCAmaW5zdHJfZHVhbF8wZl8yYiksIE4sIE4sCiB9OwpAQCAtNDgyMyw3
ICs0ODMyLDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvcGNvZGUgdHdvYnl0ZV90YWJsZVsyNTZd
ID0gewogCU4sIE4sIE4sIE4sCiAJTiwgTiwgTiwgTiwKIAlOLCBOLCBOLCBOLAotCU4sIE4sIE4s
IEdQKFNyY1JlZyB8IERzdE1lbSB8IE1vZFJNIHwgTW92LCAmcGZ4XzBmXzZmXzBmXzdmKSwKKwlO
LCBOLCBHUChNb2RSTSB8IFNyY1JlZyB8IERzdE1lbSB8IEdQUk1vZFJNIHwgTW92IHwgU3NlLCAm
cGZ4XzBmXzdlKSwKKwlHUChTcmNSZWcgfCBEc3RNZW0gfCBNb2RSTSB8IE1vdiwgJnBmeF8wZl82
Zl8wZl83ZiksCiAJLyogMHg4MCAtIDB4OEYgKi8KIAlYMTYoRChTcmNJbW0gfCBOZWFyQnJhbmNo
KSksCiAJLyogMHg5MCAtIDB4OUYgKi8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9u
QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9u
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
