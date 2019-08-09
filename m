Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5E08815B
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 19:35:46 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BA763DF2;
	Fri,  9 Aug 2019 17:34:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7D433DB7
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 17:34:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B0D5067F
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 17:34:54 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	86D35305D363; Fri,  9 Aug 2019 19:01:40 +0300 (EEST)
Received: from localhost.localdomain (unknown [89.136.169.210])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id 2FE9E305B7A1;
	Fri,  9 Aug 2019 19:01:40 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v6 81/92] kvm: x86: emulate movq xmm, m64
Date: Fri,  9 Aug 2019 19:00:36 +0300
Message-Id: <20190809160047.8319-82-alazar@bitdefender.com>
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
dnEgdG8Kd3JpdGUgaW50byBwYWdlcyB0aGF0IGFyZSBtYXJrZWQgZm9yIHdyaXRlIHRyYWNraW5n
LgoKU2lnbmVkLW9mZi1ieTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgpT
aWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+Ci0t
LQogYXJjaC94ODYva3ZtL2VtdWxhdGUuYyB8IDI0ICsrKysrKysrKysrKysrKy0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvYXJjaC94ODYva3ZtL2VtdWxhdGUuYyBiL2FyY2gveDg2L2t2bS9lbXVsYXRlLmMKaW5k
ZXggYjhhNDEyYjhiMDg3Li4yMjk3OTU1ZDA5MzQgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS9l
bXVsYXRlLmMKKysrIGIvYXJjaC94ODYva3ZtL2VtdWxhdGUuYwpAQCAtMTE4MCwyMyArMTE4MCwy
NCBAQCBzdGF0aWMgaW50IGVtX2Zuc3RzdyhzdHJ1Y3QgeDg2X2VtdWxhdGVfY3R4dCAqY3R4dCkK
IHN0YXRpYyB1OCBzaW1kX3ByZWZpeF90b19ieXRlcyhjb25zdCBzdHJ1Y3QgeDg2X2VtdWxhdGVf
Y3R4dCAqY3R4dCwKIAkJCSAgICAgICBpbnQgc2ltZF9wcmVmaXgpCiB7Ci0JdTggYnl0ZXM7CisJ
dTggYnl0ZXMgPSAxNjsKIAogCXN3aXRjaCAoY3R4dC0+YikgewogCWNhc2UgMHgxMToKIAkJLyog
bW92c3MgeG1tLCBtMzIgKi8KIAkJLyogbW92c2QgeG1tLCBtNjQgKi8KIAkJLyogbW92dXBzIHht
bSwgbTEyOCAqLwotCQlpZiAoc2ltZF9wcmVmaXggPT0gMHhmMykgeworCQlpZiAoc2ltZF9wcmVm
aXggPT0gMHhmMykKIAkJCWJ5dGVzID0gNDsKLQkJCWJyZWFrOwotCQl9IGVsc2UgaWYgKHNpbWRf
cHJlZml4ID09IDB4ZjIpIHsKKwkJZWxzZSBpZiAoc2ltZF9wcmVmaXggPT0gMHhmMikKIAkJCWJ5
dGVzID0gODsKLQkJCWJyZWFrOwotCQl9Ci0JCS8qIGZhbGx0aHJvdWdoICovCisJCWJyZWFrOwor
CWNhc2UgMHhkNjoKKwkJLyogbW92cSB4bW0sIG02NCAqLworCQlpZiAoc2ltZF9wcmVmaXggPT0g
MHg2NikKKwkJCWJ5dGVzID0gODsKKwkJYnJlYWs7CiAJZGVmYXVsdDoKLQkJYnl0ZXMgPSAxNjsK
IAkJYnJlYWs7CiAJfQogCXJldHVybiBieXRlczsKQEAgLTQ1NDksNiArNDU1MCwxMCBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IGluc3RyX2R1YWwgaW5zdHJfZHVhbF8wZl8yYiA9IHsKIAlJKDAsIGVt
X21vdiksIE4KIH07CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZ3ByZWZpeCBwZnhfMGZfZDYgPSB7
CisJTiwgSSgwLCBlbV9tb3YpLCBOLCBOLAorfTsKKwogc3RhdGljIGNvbnN0IHN0cnVjdCBncHJl
Zml4IHBmeF8wZl8yYiA9IHsKIAlJRCgwLCAmaW5zdHJfZHVhbF8wZl8yYiksIElEKDAsICZpbnN0
cl9kdWFsXzBmXzJiKSwgTiwgTiwKIH07CkBAIC00ODQ2LDcgKzQ4NTEsOCBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IG9wY29kZSB0d29ieXRlX3RhYmxlWzI1Nl0gPSB7CiAJLyogMHhDOCAtIDB4Q0Yg
Ki8KIAlYOChJKERzdFJlZywgZW1fYnN3YXApKSwKIAkvKiAweEQwIC0gMHhERiAqLwotCU4sIE4s
IE4sIE4sIE4sIE4sIE4sIE4sIE4sIE4sIE4sIE4sIE4sIE4sIE4sIE4sCisJTiwgTiwgTiwgTiwg
TiwgTiwgR1AoTW9kUk0gfCBTcmNSZWcgfCBEc3RNZW0gfCBNb3YgfCBTc2UsICZwZnhfMGZfZDYp
LAorCU4sIE4sIE4sIE4sIE4sIE4sIE4sIE4sIE4sCiAJLyogMHhFMCAtIDB4RUYgKi8KIAlOLCBO
LCBOLCBOLCBOLCBOLCBOLCBHUChTcmNSZWcgfCBEc3RNZW0gfCBNb2RSTSB8IE1vdiwgJnBmeF8w
Zl9lNyksCiAJTiwgTiwgTiwgTiwgTiwgTiwgTiwgTiwKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1
YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhm
b3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
