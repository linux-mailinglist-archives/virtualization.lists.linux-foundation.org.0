Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EA787F2B
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 18:15:05 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 80301E17;
	Fri,  9 Aug 2019 16:14:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B236AD8B
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 16:14:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2A078875
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 16:14:55 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	E7B5A3031EC8; Fri,  9 Aug 2019 19:01:40 +0300 (EEST)
Received: from localhost.localdomain (unknown [89.136.169.210])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id 80AB8305B7A0;
	Fri,  9 Aug 2019 19:01:40 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v6 82/92] kvm: x86: emulate movq r, xmm
Date: Fri,  9 Aug 2019 19:00:37 +0300
Message-Id: <20190809160047.8319-83-alazar@bitdefender.com>
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyBhZGRzIHN1
cHBvcnQgZm9yIG1vdnEgciwgeG1tLiBJdCBpbnRyb2R1Y2VzIGEgbmV3IGZsYWcgKEdQUk1vZFJN
KQp0byBpbmRpY2F0ZSBkZWNvZGVfbW9kcm0oKSB0aGF0IHRoZSBlbmNvZGVkIHJlZ2lzdGVyIGlz
IGEgZ2VuZXJhbCBwdXJwb3NlCm9uZS4KClNpZ25lZC1vZmYtYnk6IE1paGFpIERvbsibdSA8bWRv
bnR1QGJpdGRlZmVuZGVyLmNvbT4KU2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6
YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIGFyY2gveDg2L2t2bS9lbXVsYXRlLmMgfCAxNSArKysr
KysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9lbXVsYXRlLmMgYi9hcmNoL3g4Ni9rdm0v
ZW11bGF0ZS5jCmluZGV4IDIyOTc5NTVkMDkzNC4uN2M3OTUwNGU1OGNkIDEwMDY0NAotLS0gYS9h
cmNoL3g4Ni9rdm0vZW11bGF0ZS5jCisrKyBiL2FyY2gveDg2L2t2bS9lbXVsYXRlLmMKQEAgLTE3
Miw2ICsxNzIsNyBAQAogI2RlZmluZSBOb01vZAkgICAgKCh1NjQpMSA8PCA0NykgIC8qIE1vZCBm
aWVsZCBpcyBpZ25vcmVkICovCiAjZGVmaW5lIEludGVyY2VwdCAgICgodTY0KTEgPDwgNDgpICAv
KiBIYXMgdmFsaWQgaW50ZXJjZXB0IGZpZWxkICovCiAjZGVmaW5lIENoZWNrUGVybSAgICgodTY0
KTEgPDwgNDkpICAvKiBIYXMgdmFsaWQgY2hlY2tfcGVybSBmaWVsZCAqLworI2RlZmluZSBHUFJN
b2RSTSAgICAoKHU2NCkxIDw8IDUwKSAgLyogVGhlIE1vZFJNIGVuY29kZWQgcmVnaXN0ZXIgaXMg
YSBHUCBvbmUgKi8KICNkZWZpbmUgUHJpdlVEICAgICAgKCh1NjQpMSA8PCA1MSkgIC8qICNVRCBp
bnN0ZWFkIG9mICNHUCBvbiBDUEwgPiAwICovCiAjZGVmaW5lIE5lYXJCcmFuY2ggICgodTY0KTEg
PDwgNTIpICAvKiBOZWFyIGJyYW5jaGVzICovCiAjZGVmaW5lIE5vMTYJICAgICgodTY0KTEgPDwg
NTMpICAvKiBObyAxNiBiaXQgb3BlcmFuZCAqLwpAQCAtMTE5Nyw2ICsxMTk4LDExIEBAIHN0YXRp
YyB1OCBzaW1kX3ByZWZpeF90b19ieXRlcyhjb25zdCBzdHJ1Y3QgeDg2X2VtdWxhdGVfY3R4dCAq
Y3R4dCwKIAkJaWYgKHNpbWRfcHJlZml4ID09IDB4NjYpCiAJCQlieXRlcyA9IDg7CiAJCWJyZWFr
OworCWNhc2UgMHg2ZToKKwkJLyogbW92cSByL202NCwgeG1tICovCisJCWlmIChzaW1kX3ByZWZp
eCA9PSAweDY2KQorCQkJYnl0ZXMgPSA4OworCQlicmVhazsKIAlkZWZhdWx0OgogCQlicmVhazsK
IAl9CkBAIC0xMjYyLDcgKzEyNjgsNyBAQCBzdGF0aWMgaW50IGRlY29kZV9tb2RybShzdHJ1Y3Qg
eDg2X2VtdWxhdGVfY3R4dCAqY3R4dCwKIAkJb3AtPmJ5dGVzID0gKGN0eHQtPmQgJiBCeXRlT3Ap
ID8gMSA6IGN0eHQtPm9wX2J5dGVzOwogCQlvcC0+YWRkci5yZWcgPSBkZWNvZGVfcmVnaXN0ZXIo
Y3R4dCwgY3R4dC0+bW9kcm1fcm0sCiAJCQkJY3R4dC0+ZCAmIEJ5dGVPcCk7Ci0JCWlmIChjdHh0
LT5kICYgU3NlKSB7CisJCWlmICgoY3R4dC0+ZCAmIFNzZSkgJiYgIShjdHh0LT5kICYgR1BSTW9k
Uk0pKSB7CiAJCQlvcC0+dHlwZSA9IE9QX1hNTTsKIAkJCW9wLT5ieXRlcyA9IGN0eHQtPm9wX2J5
dGVzOwogCQkJb3AtPmFkZHIueG1tID0gY3R4dC0+bW9kcm1fcm07CkBAIC00NTQ2LDYgKzQ1NTIs
MTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBncHJlZml4IHBmeF8wZl82Zl8wZl83ZiA9IHsKIAlJ
KE1teCwgZW1fbW92KSwgSShTc2UgfCBBbGlnbmVkLCBlbV9tb3YpLCBOLCBJKFNzZSB8IFVuYWxp
Z25lZCwgZW1fbW92KSwKIH07CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZ3ByZWZpeCBwZnhfMGZf
NmVfMGZfN2UgPSB7CisJTiwgSShTc2UsIGVtX21vdiksIE4sIE4KK307CisKIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgaW5zdHJfZHVhbCBpbnN0cl9kdWFsXzBmXzJiID0gewogCUkoMCwgZW1fbW92KSwg
TgogfTsKQEAgLTQ4MDcsNyArNDgxNyw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb3Bjb2RlIHR3
b2J5dGVfdGFibGVbMjU2XSA9IHsKIAlOLCBOLCBOLCBOLAogCU4sIE4sIE4sIE4sCiAJTiwgTiwg
TiwgTiwKLQlOLCBOLCBOLCBHUChTcmNNZW0gfCBEc3RSZWcgfCBNb2RSTSB8IE1vdiwgJnBmeF8w
Zl82Zl8wZl83ZiksCisJTiwgTiwgR1AoU3JjTWVtIHwgRHN0UmVnIHwgTW9kUk0gfCBHUFJNb2RS
TSB8IE1vdiwgJnBmeF8wZl82ZV8wZl83ZSksCisJR1AoU3JjTWVtIHwgRHN0UmVnIHwgTW9kUk0g
fCBNb3YsICZwZnhfMGZfNmZfMGZfN2YpLAogCS8qIDB4NzAgLSAweDdGICovCiAJTiwgTiwgTiwg
TiwKIAlOLCBOLCBOLCBOLApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMu
bGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21h
aWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
