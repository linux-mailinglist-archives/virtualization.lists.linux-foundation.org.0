Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C435881B7
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 19:55:32 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 09B9CCC2;
	Fri,  9 Aug 2019 17:55:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EDFA8CA6
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 17:54:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2FD3789D
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 17:54:55 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	517C2305D3DF; Fri,  9 Aug 2019 19:01:01 +0300 (EEST)
Received: from localhost.localdomain (unknown [89.136.169.210])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id DF0E8305B7A4;
	Fri,  9 Aug 2019 19:01:00 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v6 26/92] kvm: x86: add kvm_mmu_nested_pagefault()
Date: Fri,  9 Aug 2019 18:59:41 +0300
Message-Id: <20190809160047.8319-27-alazar@bitdefender.com>
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
	=?UTF-8?q?Nicu=C8=99or=20C=C3=AE=C8=9Bu?= <ncitu@bitdefender.com>,
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
ZWQgdG8gZmlsdGVyICNQRiBpbnRyb3NwZWN0aW9uIGV2ZW50cy4KClNpZ25lZC1vZmYtYnk6IE1p
aGFpIERvbsibdSA8bWRvbnR1QGJpdGRlZmVuZGVyLmNvbT4KQ28tZGV2ZWxvcGVkLWJ5OiBOaWN1
yJlvciBDw67Im3UgPG5jaXR1QGJpdGRlZmVuZGVyLmNvbT4KU2lnbmVkLW9mZi1ieTogTmljdciZ
b3IgQ8OuyJt1IDxuY2l0dUBiaXRkZWZlbmRlci5jb20+ClNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0
IExhesSDciA8YWxhemFyQGJpdGRlZmVuZGVyLmNvbT4KLS0tCiBhcmNoL3g4Ni9pbmNsdWRlL2Fz
bS9rdm1faG9zdC5oIHwgNCArKysrCiBhcmNoL3g4Ni9rdm0vbW11LmMgICAgICAgICAgICAgIHwg
NSArKysrKwogYXJjaC94ODYva3ZtL3N2bS5jICAgICAgICAgICAgICB8IDcgKysrKysrKwogYXJj
aC94ODYva3ZtL3ZteC92bXguYyAgICAgICAgICB8IDkgKysrKysrKysrCiA0IGZpbGVzIGNoYW5n
ZWQsIDI1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9r
dm1faG9zdC5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAppbmRleCAyZDZiZGU2
ZmE1OWYuLjdkYTExMzdhMmI4MiAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20va3Zt
X2hvc3QuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCkBAIC0xMDA0LDYg
KzEwMDQsOCBAQCBzdHJ1Y3Qga3ZtX3g4Nl9vcHMgewogCWJvb2wgKCpoYXNfZW11bGF0ZWRfbXNy
KShpbnQgaW5kZXgpOwogCXZvaWQgKCpjcHVpZF91cGRhdGUpKHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSk7CiAKKwlib29sICgqbmVzdGVkX3BhZ2VmYXVsdCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsK
KwogCXN0cnVjdCBrdm0gKigqdm1fYWxsb2MpKHZvaWQpOwogCXZvaWQgKCp2bV9mcmVlKShzdHJ1
Y3Qga3ZtICopOwogCWludCAoKnZtX2luaXQpKHN0cnVjdCBrdm0gKmt2bSk7CkBAIC0xNTkzLDQg
KzE1OTUsNiBAQCBzdGF0aWMgaW5saW5lIGludCBrdm1fY3B1X2dldF9hcGljaWQoaW50IG1wc19j
cHUpCiAjZGVmaW5lIHB1dF9zbXN0YXRlKHR5cGUsIGJ1Ziwgb2Zmc2V0LCB2YWwpICAgICAgICAg
ICAgICAgICAgICAgIFwKIAkqKHR5cGUgKikoKGJ1ZikgKyAob2Zmc2V0KSAtIDB4N2UwMCkgPSB2
YWwKIAorYm9vbCBrdm1fbW11X25lc3RlZF9wYWdlZmF1bHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
KTsKKwogI2VuZGlmIC8qIF9BU01fWDg2X0tWTV9IT1NUX0ggKi8KZGlmZiAtLWdpdCBhL2FyY2gv
eDg2L2t2bS9tbXUuYyBiL2FyY2gveDg2L2t2bS9tbXUuYwppbmRleCBmZjA1M2YxN2I4YzIuLjll
YWY2Y2M3NzZhOSAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL21tdS5jCisrKyBiL2FyY2gveDg2
L2t2bS9tbXUuYwpAQCAtNjE2OSwzICs2MTY5LDggQEAgdm9pZCBrdm1fbW11X21vZHVsZV9leGl0
KHZvaWQpCiAJdW5yZWdpc3Rlcl9zaHJpbmtlcigmbW11X3Nocmlua2VyKTsKIAltbXVfYXVkaXRf
ZGlzYWJsZSgpOwogfQorCitib29sIGt2bV9tbXVfbmVzdGVkX3BhZ2VmYXVsdChzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUpCit7CisJcmV0dXJuIGt2bV94ODZfb3BzLT5uZXN0ZWRfcGFnZWZhdWx0KHZj
cHUpOworfQpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3N2bS5jIGIvYXJjaC94ODYva3ZtL3N2
bS5jCmluZGV4IGYxM2EzYTI0ZDM2MC4uM2MwOTljNTYwOTljIDEwMDY0NAotLS0gYS9hcmNoL3g4
Ni9rdm0vc3ZtLmMKKysrIGIvYXJjaC94ODYva3ZtL3N2bS5jCkBAIC03MDk4LDYgKzcwOTgsMTEg
QEAgc3RhdGljIGludCBuZXN0ZWRfZW5hYmxlX2V2bWNzKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwK
IAlyZXR1cm4gLUVOT0RFVjsKIH0KIAorc3RhdGljIGJvb2wgc3ZtX25lc3RlZF9wYWdlZmF1bHQo
c3RydWN0IGt2bV92Y3B1ICp2Y3B1KQoreworCXJldHVybiBmYWxzZTsKK30KKwogc3RhdGljIHN0
cnVjdCBrdm1feDg2X29wcyBzdm1feDg2X29wcyBfX3JvX2FmdGVyX2luaXQgPSB7CiAJLmNwdV9o
YXNfa3ZtX3N1cHBvcnQgPSBoYXNfc3ZtLAogCS5kaXNhYmxlZF9ieV9iaW9zID0gaXNfZGlzYWJs
ZWQsCkBAIC03MTA5LDYgKzcxMTQsOCBAQCBzdGF0aWMgc3RydWN0IGt2bV94ODZfb3BzIHN2bV94
ODZfb3BzIF9fcm9fYWZ0ZXJfaW5pdCA9IHsKIAkuY3B1X2hhc19hY2NlbGVyYXRlZF90cHIgPSBz
dm1fY3B1X2hhc19hY2NlbGVyYXRlZF90cHIsCiAJLmhhc19lbXVsYXRlZF9tc3IgPSBzdm1faGFz
X2VtdWxhdGVkX21zciwKIAorCS5uZXN0ZWRfcGFnZWZhdWx0ID0gc3ZtX25lc3RlZF9wYWdlZmF1
bHQsCisKIAkudmNwdV9jcmVhdGUgPSBzdm1fY3JlYXRlX3ZjcHUsCiAJLnZjcHVfZnJlZSA9IHN2
bV9mcmVlX3ZjcHUsCiAJLnZjcHVfcmVzZXQgPSBzdm1fdmNwdV9yZXNldCwKZGlmZiAtLWdpdCBh
L2FyY2gveDg2L2t2bS92bXgvdm14LmMgYi9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jCmluZGV4IDMw
YTZiY2Q3MzVlYy4uZTEwZWU4ZmQxYzY3IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vdm14L3Zt
eC5jCisrKyBiL2FyY2gveDg2L2t2bS92bXgvdm14LmMKQEAgLTc2ODIsNiArNzY4MiwxMyBAQCBz
dGF0aWMgX19leGl0IHZvaWQgaGFyZHdhcmVfdW5zZXR1cCh2b2lkKQogCWZyZWVfa3ZtX2FyZWEo
KTsKIH0KIAorc3RhdGljIGJvb2wgdm14X25lc3RlZF9wYWdlZmF1bHQoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1KQoreworCWlmICh2Y3B1LT5hcmNoLmV4aXRfcXVhbGlmaWNhdGlvbiAmIEVQVF9WSU9M
QVRJT05fR1ZBX1RSQU5TTEFURUQpCisJCXJldHVybiBmYWxzZTsKKwlyZXR1cm4gdHJ1ZTsKK30K
Kwogc3RhdGljIHN0cnVjdCBrdm1feDg2X29wcyB2bXhfeDg2X29wcyBfX3JvX2FmdGVyX2luaXQg
PSB7CiAJLmNwdV9oYXNfa3ZtX3N1cHBvcnQgPSBjcHVfaGFzX2t2bV9zdXBwb3J0LAogCS5kaXNh
YmxlZF9ieV9iaW9zID0gdm14X2Rpc2FibGVkX2J5X2Jpb3MsCkBAIC03NjkzLDYgKzc3MDAsOCBA
QCBzdGF0aWMgc3RydWN0IGt2bV94ODZfb3BzIHZteF94ODZfb3BzIF9fcm9fYWZ0ZXJfaW5pdCA9
IHsKIAkuY3B1X2hhc19hY2NlbGVyYXRlZF90cHIgPSByZXBvcnRfZmxleHByaW9yaXR5LAogCS5o
YXNfZW11bGF0ZWRfbXNyID0gdm14X2hhc19lbXVsYXRlZF9tc3IsCiAKKwkubmVzdGVkX3BhZ2Vm
YXVsdCA9IHZteF9uZXN0ZWRfcGFnZWZhdWx0LAorCiAJLnZtX2luaXQgPSB2bXhfdm1faW5pdCwK
IAkudm1fYWxsb2MgPSB2bXhfdm1fYWxsb2MsCiAJLnZtX2ZyZWUgPSB2bXhfdm1fZnJlZSwKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRp
b24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3Jn
Cmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1
YWxpemF0aW9u
