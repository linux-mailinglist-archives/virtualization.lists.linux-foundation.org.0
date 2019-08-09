Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E6188297
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 20:35:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C0B76E28;
	Fri,  9 Aug 2019 18:34:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6D1ADE25
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 18:34:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AA07C829
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 18:34:54 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	1DE1F305D3F4; Fri,  9 Aug 2019 19:01:04 +0300 (EEST)
Received: from localhost.localdomain (unknown [89.136.169.210])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id 3B6D5303EF08;
	Fri,  9 Aug 2019 19:01:03 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v6 30/92] kvm: x86: add kvm_spt_fault()
Date: Fri,  9 Aug 2019 18:59:45 +0300
Message-Id: <20190809160047.8319-31-alazar@bitdefender.com>
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
ZWQgdG8gZmlsdGVyICNQRiBpbnRyb3NwZWN0aW9uIGV2ZW50cywgd2hlbiBub3QgY2F1c2VkIGJ5
CkVQVC9OUFQgZmF1bHQuIE9uZSBzdWNoIGNhc2UgaXMgd2hlbiBoYW5kbGVfdWQoKSBjYWxscyB0
aGUgZW11bGF0b3IKd2hpY2ggZmFpbGVzIHRvIGZldGNoIHRoZSBvcGNvZGVzIGZyb20gc3RhY2sg
KHdoaWNoIGlzIGhvb2tlZCBydy0pCndoaWNoIGxlYWRzIHRvIGEgcGFnZSBmYXVsdCBldmVudC4K
ClNpZ25lZC1vZmYtYnk6IE1paGFpIERvbsibdSA8bWRvbnR1QGJpdGRlZmVuZGVyLmNvbT4KU2ln
bmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0K
IGFyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggfCAyICsrCiBhcmNoL3g4Ni9rdm0vc3Zt
LmMgICAgICAgICAgICAgIHwgOCArKysrKysrKwogYXJjaC94ODYva3ZtL3ZteC92bXguYyAgICAg
ICAgICB8IDggKysrKysrKysKIGFyY2gveDg2L2t2bS94ODYuYyAgICAgICAgICAgICAgfCA2ICsr
KysrKwogNCBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJj
aC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9o
b3N0LmgKaW5kZXggN2RhMTEzN2EyYjgyLi5mMWIzZDg5YTA0MzAgMTAwNjQ0Ci0tLSBhL2FyY2gv
eDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20va3Zt
X2hvc3QuaApAQCAtMTAwNSw2ICsxMDA1LDcgQEAgc3RydWN0IGt2bV94ODZfb3BzIHsKIAl2b2lk
ICgqY3B1aWRfdXBkYXRlKShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogCiAJYm9vbCAoKm5lc3Rl
ZF9wYWdlZmF1bHQpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7CisJYm9vbCAoKnNwdF9mYXVsdCko
c3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIAogCXN0cnVjdCBrdm0gKigqdm1fYWxsb2MpKHZvaWQp
OwogCXZvaWQgKCp2bV9mcmVlKShzdHJ1Y3Qga3ZtICopOwpAQCAtMTU5Niw1ICsxNTk3LDYgQEAg
c3RhdGljIGlubGluZSBpbnQga3ZtX2NwdV9nZXRfYXBpY2lkKGludCBtcHNfY3B1KQogCSoodHlw
ZSAqKSgoYnVmKSArIChvZmZzZXQpIC0gMHg3ZTAwKSA9IHZhbAogCiBib29sIGt2bV9tbXVfbmVz
dGVkX3BhZ2VmYXVsdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOworYm9vbCBrdm1fc3B0X2ZhdWx0
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7CiAKICNlbmRpZiAvKiBfQVNNX1g4Nl9LVk1fSE9TVF9I
ICovCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vc3ZtLmMgYi9hcmNoL3g4Ni9rdm0vc3ZtLmMK
aW5kZXggM2MwOTljNTYwOTljLi42YjUzMzY5OGM3M2QgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2
bS9zdm0uYworKysgYi9hcmNoL3g4Ni9rdm0vc3ZtLmMKQEAgLTcxMDMsNiArNzEwMywxMyBAQCBz
dGF0aWMgYm9vbCBzdm1fbmVzdGVkX3BhZ2VmYXVsdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAJ
cmV0dXJuIGZhbHNlOwogfQogCitzdGF0aWMgYm9vbCBzdm1fc3B0X2ZhdWx0KHN0cnVjdCBrdm1f
dmNwdSAqdmNwdSkKK3sKKwljb25zdCBzdHJ1Y3QgdmNwdV9zdm0gKnN2bSA9IHRvX3N2bSh2Y3B1
KTsKKworCXJldHVybiAoc3ZtLT52bWNiLT5jb250cm9sLmV4aXRfY29kZSA9PSBTVk1fRVhJVF9O
UEYpOworfQorCiBzdGF0aWMgc3RydWN0IGt2bV94ODZfb3BzIHN2bV94ODZfb3BzIF9fcm9fYWZ0
ZXJfaW5pdCA9IHsKIAkuY3B1X2hhc19rdm1fc3VwcG9ydCA9IGhhc19zdm0sCiAJLmRpc2FibGVk
X2J5X2Jpb3MgPSBpc19kaXNhYmxlZCwKQEAgLTcxMTUsNiArNzEyMiw3IEBAIHN0YXRpYyBzdHJ1
Y3Qga3ZtX3g4Nl9vcHMgc3ZtX3g4Nl9vcHMgX19yb19hZnRlcl9pbml0ID0gewogCS5oYXNfZW11
bGF0ZWRfbXNyID0gc3ZtX2hhc19lbXVsYXRlZF9tc3IsCiAKIAkubmVzdGVkX3BhZ2VmYXVsdCA9
IHN2bV9uZXN0ZWRfcGFnZWZhdWx0LAorCS5zcHRfZmF1bHQgPSBzdm1fc3B0X2ZhdWx0LAogCiAJ
LnZjcHVfY3JlYXRlID0gc3ZtX2NyZWF0ZV92Y3B1LAogCS52Y3B1X2ZyZWUgPSBzdm1fZnJlZV92
Y3B1LApkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3ZteC92bXguYyBiL2FyY2gveDg2L2t2bS92
bXgvdm14LmMKaW5kZXggZTEwZWU4ZmQxYzY3Li45N2NmZDVhMzE2ZjMgMTAwNjQ0Ci0tLSBhL2Fy
Y2gveDg2L2t2bS92bXgvdm14LmMKKysrIGIvYXJjaC94ODYva3ZtL3ZteC92bXguYwpAQCAtNzY4
OSw2ICs3Njg5LDEzIEBAIHN0YXRpYyBib29sIHZteF9uZXN0ZWRfcGFnZWZhdWx0KHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSkKIAlyZXR1cm4gdHJ1ZTsKIH0KIAorc3RhdGljIGJvb2wgdm14X3NwdF9m
YXVsdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCit7CisJY29uc3Qgc3RydWN0IHZjcHVfdm14ICp2
bXggPSB0b192bXgodmNwdSk7CisKKwlyZXR1cm4gKHZteC0+ZXhpdF9yZWFzb24gPT0gRVhJVF9S
RUFTT05fRVBUX1ZJT0xBVElPTik7Cit9CisKIHN0YXRpYyBzdHJ1Y3Qga3ZtX3g4Nl9vcHMgdm14
X3g4Nl9vcHMgX19yb19hZnRlcl9pbml0ID0gewogCS5jcHVfaGFzX2t2bV9zdXBwb3J0ID0gY3B1
X2hhc19rdm1fc3VwcG9ydCwKIAkuZGlzYWJsZWRfYnlfYmlvcyA9IHZteF9kaXNhYmxlZF9ieV9i
aW9zLApAQCAtNzcwMSw2ICs3NzA4LDcgQEAgc3RhdGljIHN0cnVjdCBrdm1feDg2X29wcyB2bXhf
eDg2X29wcyBfX3JvX2FmdGVyX2luaXQgPSB7CiAJLmhhc19lbXVsYXRlZF9tc3IgPSB2bXhfaGFz
X2VtdWxhdGVkX21zciwKIAogCS5uZXN0ZWRfcGFnZWZhdWx0ID0gdm14X25lc3RlZF9wYWdlZmF1
bHQsCisJLnNwdF9mYXVsdCA9IHZteF9zcHRfZmF1bHQsCiAKIAkudm1faW5pdCA9IHZteF92bV9p
bml0LAogCS52bV9hbGxvYyA9IHZteF92bV9hbGxvYywKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2
bS94ODYuYyBiL2FyY2gveDg2L2t2bS94ODYuYwppbmRleCBjMjhlMmEyMGRlYzIuLjI1N2M0YTI2
MmFjZCAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL3g4Ni5jCisrKyBiL2FyY2gveDg2L2t2bS94
ODYuYwpAQCAtOTg4NCw2ICs5ODg0LDEyIEBAIGJvb2wga3ZtX3ZlY3Rvcl9oYXNoaW5nX2VuYWJs
ZWQodm9pZCkKIH0KIEVYUE9SVF9TWU1CT0xfR1BMKGt2bV92ZWN0b3JfaGFzaGluZ19lbmFibGVk
KTsKIAorYm9vbCBrdm1fc3B0X2ZhdWx0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKK3sKKwlyZXR1
cm4ga3ZtX3g4Nl9vcHMtPnNwdF9mYXVsdCh2Y3B1KTsKK30KK0VYUE9SVF9TWU1CT0woa3ZtX3Nw
dF9mYXVsdCk7CisKIEVYUE9SVF9UUkFDRVBPSU5UX1NZTUJPTF9HUEwoa3ZtX2V4aXQpOwogRVhQ
T1JUX1RSQUNFUE9JTlRfU1lNQk9MX0dQTChrdm1fZmFzdF9tbWlvKTsKIEVYUE9SVF9UUkFDRVBP
SU5UX1NZTUJPTF9HUEwoa3ZtX2lual92aXJxKTsKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxp
emF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
