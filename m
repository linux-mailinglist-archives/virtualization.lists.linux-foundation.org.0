Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BC2197877
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 12:13:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 494B186987;
	Mon, 30 Mar 2020 10:12:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bq2I06So0A91; Mon, 30 Mar 2020 10:12:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 91AB6869E2;
	Mon, 30 Mar 2020 10:12:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 62A34C1D89;
	Mon, 30 Mar 2020 10:12:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 834ECC07FF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 70DE987B9B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ODE-A100bVGY
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7A77787CD2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:52 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 1D05F30747C7; Mon, 30 Mar 2020 13:12:50 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id E3C44305B7A2;
 Mon, 30 Mar 2020 13:12:49 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v8 10/81] KVM: x86: add .bp_intercepted() to struct kvm_x86_ops
Date: Mon, 30 Mar 2020 13:11:57 +0300
Message-Id: <20200330101308.21702-11-alazar@bitdefender.com>
In-Reply-To: <20200330101308.21702-1-alazar@bitdefender.com>
References: <20200330101308.21702-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Nicu=C8=99or=20C=C3=AE=C8=9Bu?= <ncitu@bitdefender.com>,
 virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

RnJvbTogTmljdciZb3IgQ8OuyJt1IDxuY2l0dUBiaXRkZWZlbmRlci5jb20+CgpUaGUgaW50cm9z
cGVjdGlvbiB0b29sIGFuZCB0aGUgdXNlcnNwYWNlIGNhbiByZXF1ZXN0ICNCUCBpbnRlcmNlcHRp
b24uClRoaXMgZnVuY3Rpb24gd2lsbCBiZSB1c2VkIHRvIGNoZWNrIGlmIHRoaXMgaW50ZXJjZXB0
aW9uIGlzIGVuYWJsZWQKYnkgZWl0aGVyIHNpZGUuCgpTaWduZWQtb2ZmLWJ5OiBOaWN1yJlvciBD
w67Im3UgPG5jaXR1QGJpdGRlZmVuZGVyLmNvbT4KU2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6
xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIGFyY2gveDg2L2luY2x1ZGUvYXNtL2t2
bV9ob3N0LmggfCAgMSArCiBhcmNoL3g4Ni9rdm0vc3ZtLmMgICAgICAgICAgICAgIHwgMTUgKysr
KysrKysrKysrKysrCiBhcmNoL3g4Ni9rdm0vdm14L3ZteC5jICAgICAgICAgIHwgIDYgKysrKysr
CiAzIGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3g4
Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3Qu
aAppbmRleCA5ODk1OWU4Y2Q0NDguLmFmYzViZjNmYTczMCAxMDA2NDQKLS0tIGEvYXJjaC94ODYv
aW5jbHVkZS9hc20va3ZtX2hvc3QuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9z
dC5oCkBAIC0xMDc3LDYgKzEwNzcsNyBAQCBzdHJ1Y3Qga3ZtX3g4Nl9vcHMgewogCXZvaWQgKCp2
Y3B1X2xvYWQpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgaW50IGNwdSk7CiAJdm9pZCAoKnZjcHVf
cHV0KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogCisJYm9vbCAoKmJwX2ludGVyY2VwdGVkKShz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogCXZvaWQgKCp1cGRhdGVfYnBfaW50ZXJjZXB0KShzdHJ1
Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogCWludCAoKmdldF9tc3IpKHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSwgc3RydWN0IG1zcl9kYXRhICptc3IpOwogCWludCAoKnNldF9tc3IpKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSwgc3RydWN0IG1zcl9kYXRhICptc3IpOwpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3Zt
L3N2bS5jIGIvYXJjaC94ODYva3ZtL3N2bS5jCmluZGV4IDUwZDFlYmFmZTBiMy4uNzM4NzFmMjhh
ZDdiIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vc3ZtLmMKKysrIGIvYXJjaC94ODYva3ZtL3N2
bS5jCkBAIC02MTEsNiArNjExLDEzIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBjbHJfZXhjZXB0aW9u
X2ludGVyY2VwdChzdHJ1Y3QgdmNwdV9zdm0gKnN2bSwgaW50IGJpdCkKIAlyZWNhbGNfaW50ZXJj
ZXB0cyhzdm0pOwogfQogCitzdGF0aWMgaW5saW5lIGJvb2wgZ2V0X2V4Y2VwdGlvbl9pbnRlcmNl
cHQoc3RydWN0IHZjcHVfc3ZtICpzdm0sIGludCBiaXQpCit7CisJc3RydWN0IHZtY2IgKnZtY2Ig
PSBnZXRfaG9zdF92bWNiKHN2bSk7CisKKwlyZXR1cm4gKHZtY2ItPmNvbnRyb2wuaW50ZXJjZXB0
X2V4Y2VwdGlvbnMgJiAoMVUgPDwgYml0KSk7Cit9CisKIHN0YXRpYyBpbmxpbmUgdm9pZCBzZXRf
aW50ZXJjZXB0KHN0cnVjdCB2Y3B1X3N2bSAqc3ZtLCBpbnQgYml0KQogewogCXN0cnVjdCB2bWNi
ICp2bWNiID0gZ2V0X2hvc3Rfdm1jYihzdm0pOwpAQCAtNzM5Myw2ICs3NDAwLDEzIEBAIHN0YXRp
YyB2b2lkIHN2bV9wcmVfdXBkYXRlX2FwaWN2X2V4ZWNfY3RybChzdHJ1Y3Qga3ZtICprdm0sIGJv
b2wgYWN0aXZhdGUpCiAJYXZpY191cGRhdGVfYWNjZXNzX3BhZ2Uoa3ZtLCBhY3RpdmF0ZSk7CiB9
CiAKK3N0YXRpYyBpbmxpbmUgYm9vbCBzdm1fYnBfaW50ZXJjZXB0ZWQoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1KQoreworCXN0cnVjdCB2Y3B1X3N2bSAqc3ZtID0gdG9fc3ZtKHZjcHUpOworCisJcmV0
dXJuIGdldF9leGNlcHRpb25faW50ZXJjZXB0KHN2bSwgQlBfVkVDVE9SKTsKK30KKwogc3RhdGlj
IHN0cnVjdCBrdm1feDg2X29wcyBzdm1feDg2X29wcyBfX3JvX2FmdGVyX2luaXQgPSB7CiAJLmNw
dV9oYXNfa3ZtX3N1cHBvcnQgPSBoYXNfc3ZtLAogCS5kaXNhYmxlZF9ieV9iaW9zID0gaXNfZGlz
YWJsZWQsCkBAIC03NDE5LDYgKzc0MzMsNyBAQCBzdGF0aWMgc3RydWN0IGt2bV94ODZfb3BzIHN2
bV94ODZfb3BzIF9fcm9fYWZ0ZXJfaW5pdCA9IHsKIAkudmNwdV9ibG9ja2luZyA9IHN2bV92Y3B1
X2Jsb2NraW5nLAogCS52Y3B1X3VuYmxvY2tpbmcgPSBzdm1fdmNwdV91bmJsb2NraW5nLAogCisJ
LmJwX2ludGVyY2VwdGVkID0gc3ZtX2JwX2ludGVyY2VwdGVkLAogCS51cGRhdGVfYnBfaW50ZXJj
ZXB0ID0gdXBkYXRlX2JwX2ludGVyY2VwdCwKIAkuZ2V0X21zcl9mZWF0dXJlID0gc3ZtX2dldF9t
c3JfZmVhdHVyZSwKIAkuZ2V0X21zciA9IHN2bV9nZXRfbXNyLApkaWZmIC0tZ2l0IGEvYXJjaC94
ODYva3ZtL3ZteC92bXguYyBiL2FyY2gveDg2L2t2bS92bXgvdm14LmMKaW5kZXggMDc5ZDlmYmYy
NzhlLi5lZWU4ZDgxZjcwODMgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS92bXgvdm14LmMKKysr
IGIvYXJjaC94ODYva3ZtL3ZteC92bXguYwpAQCAtNzg0OSw2ICs3ODQ5LDExIEBAIHN0YXRpYyBi
b29sIHZteF9jaGVja19hcGljdl9pbmhpYml0X3JlYXNvbnModWxvbmcgYml0KQogCXJldHVybiBz
dXBwb3J0ZWQgJiBCSVQoYml0KTsKIH0KIAorc3RhdGljIGJvb2wgdm14X2JwX2ludGVyY2VwdGVk
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKK3sKKwlyZXR1cm4gKHZtY3NfcmVhZDMyKEVYQ0VQVElP
Tl9CSVRNQVApICYgKDF1IDw8IEJQX1ZFQ1RPUikpOworfQorCiBzdGF0aWMgc3RydWN0IGt2bV94
ODZfb3BzIHZteF94ODZfb3BzIF9fcm9fYWZ0ZXJfaW5pdCA9IHsKIAkuY3B1X2hhc19rdm1fc3Vw
cG9ydCA9IGNwdV9oYXNfa3ZtX3N1cHBvcnQsCiAJLmRpc2FibGVkX2J5X2Jpb3MgPSB2bXhfZGlz
YWJsZWRfYnlfYmlvcywKQEAgLTc4NzIsNiArNzg3Nyw3IEBAIHN0YXRpYyBzdHJ1Y3Qga3ZtX3g4
Nl9vcHMgdm14X3g4Nl9vcHMgX19yb19hZnRlcl9pbml0ID0gewogCS52Y3B1X2xvYWQgPSB2bXhf
dmNwdV9sb2FkLAogCS52Y3B1X3B1dCA9IHZteF92Y3B1X3B1dCwKIAorCS5icF9pbnRlcmNlcHRl
ZCA9IHZteF9icF9pbnRlcmNlcHRlZCwKIAkudXBkYXRlX2JwX2ludGVyY2VwdCA9IHVwZGF0ZV9l
eGNlcHRpb25fYml0bWFwLAogCS5nZXRfbXNyX2ZlYXR1cmUgPSB2bXhfZ2V0X21zcl9mZWF0dXJl
LAogCS5nZXRfbXNyID0gdm14X2dldF9tc3IsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXph
dGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRh
dGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
