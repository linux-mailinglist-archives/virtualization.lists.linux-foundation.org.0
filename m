Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id EED9C19788E
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 12:13:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8368587D9F;
	Mon, 30 Mar 2020 10:13:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4O-U6QwO67MS; Mon, 30 Mar 2020 10:13:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B11F2884EF;
	Mon, 30 Mar 2020 10:13:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8DEB1C07FF;
	Mon, 30 Mar 2020 10:13:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 294F6C1D8E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 143D5230FD
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kiYK-w1ECDzs
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by silver.osuosl.org (Postfix) with ESMTPS id 3502F2309D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:54 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 2DE9B30747D2; Mon, 30 Mar 2020 13:12:51 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 0486A305B7A1;
 Mon, 30 Mar 2020 13:12:50 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v8 16/81] KVM: x86: add .desc_intercepted()
Date: Mon, 30 Mar 2020 13:12:03 +0300
Message-Id: <20200330101308.21702-17-alazar@bitdefender.com>
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

RnJvbTogTmljdciZb3IgQ8OuyJt1IDxuY2l0dUBiaXRkZWZlbmRlci5jb20+CgpUaGlzIGZ1bmN0
aW9uIHdpbGwgYmUgdXNlZCB0byB0ZXN0IGlmIHRoZSBkZXNjcmlwdG9yIGFjY2VzcyBldmVudHMK
YXJlIGFscmVhZHkgdHJhY2tlZCBieSBhbm90aGVyIHVzZXIuCgpTaWduZWQtb2ZmLWJ5OiBOaWN1
yJlvciBDw67Im3UgPG5jaXR1QGJpdGRlZmVuZGVyLmNvbT4KU2lnbmVkLW9mZi1ieTogQWRhbGJl
cnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIGFyY2gveDg2L2luY2x1ZGUv
YXNtL2t2bV9ob3N0LmggfCAgMSArCiBhcmNoL3g4Ni9rdm0vc3ZtLmMgICAgICAgICAgICAgIHwg
MjIgKysrKysrKysrKysrKysrKysrKysrKwogYXJjaC94ODYva3ZtL3ZteC92bXguYyAgICAgICAg
ICB8ICA4ICsrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIGIvYXJjaC94ODYvaW5jbHVk
ZS9hc20va3ZtX2hvc3QuaAppbmRleCAxMWU0OWRiZWM3OGMuLjg5OTY4ZWM2M2I2NCAxMDA2NDQK
LS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAorKysgYi9hcmNoL3g4Ni9pbmNs
dWRlL2FzbS9rdm1faG9zdC5oCkBAIC0xMTA3LDYgKzExMDcsNyBAQCBzdHJ1Y3Qga3ZtX3g4Nl9v
cHMgewogCXZvaWQgKCpzZXRfZ2R0KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBkZXNj
X3B0ciAqZHQpOwogCWJvb2wgKCpkZXNjX2N0cmxfc3VwcG9ydGVkKSh2b2lkKTsKIAl2b2lkICgq
Y29udHJvbF9kZXNjX2ludGVyY2VwdCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBib29sIGVuYWJs
ZSk7CisJYm9vbCAoKmRlc2NfaW50ZXJjZXB0ZWQpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7CiAJ
dTY0ICgqZ2V0X2RyNikoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIAl2b2lkICgqc2V0X2RyNiko
c3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIHZhbHVlKTsKIAl2b2lkICgqc3lu
Y19kaXJ0eV9kZWJ1Z19yZWdzKShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwpkaWZmIC0tZ2l0IGEv
YXJjaC94ODYva3ZtL3N2bS5jIGIvYXJjaC94ODYva3ZtL3N2bS5jCmluZGV4IGVhNGYwMmNhYjY3
ZC4uMzRlN2Y0ZjE4Y2Q4IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vc3ZtLmMKKysrIGIvYXJj
aC94ODYva3ZtL3N2bS5jCkBAIC02MzYsNiArNjM2LDEzIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBj
bHJfaW50ZXJjZXB0KHN0cnVjdCB2Y3B1X3N2bSAqc3ZtLCBpbnQgYml0KQogCXJlY2FsY19pbnRl
cmNlcHRzKHN2bSk7CiB9CiAKK3N0YXRpYyBpbmxpbmUgYm9vbCBnZXRfaW50ZXJjZXB0KHN0cnVj
dCB2Y3B1X3N2bSAqc3ZtLCBpbnQgYml0KQoreworCXN0cnVjdCB2bWNiICp2bWNiID0gZ2V0X2hv
c3Rfdm1jYihzdm0pOworCisJcmV0dXJuICh2bWNiLT5jb250cm9sLmludGVyY2VwdCAmICgxVUxM
IDw8IGJpdCkpOworfQorCiBzdGF0aWMgaW5saW5lIGJvb2wgdmdpZl9lbmFibGVkKHN0cnVjdCB2
Y3B1X3N2bSAqc3ZtKQogewogCXJldHVybiAhIShzdm0tPnZtY2ItPmNvbnRyb2wuaW50X2N0bCAm
IFZfR0lGX0VOQUJMRV9NQVNLKTsKQEAgLTc0NzIsNiArNzQ3OSwyMCBAQCBzdGF0aWMgdm9pZCBz
dm1fY29udHJvbF9kZXNjX2ludGVyY2VwdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGJvb2wgZW5h
YmxlKQogCX0KIH0KIAorc3RhdGljIGlubGluZSBib29sIHN2bV9kZXNjX2ludGVyY2VwdGVkKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSkKK3sKKwlzdHJ1Y3QgdmNwdV9zdm0gKnN2bSA9IHRvX3N2bSh2
Y3B1KTsKKworCXJldHVybiAoZ2V0X2ludGVyY2VwdChzdm0sIElOVEVSQ0VQVF9TVE9SRV9JRFRS
KSB8fAorCQlnZXRfaW50ZXJjZXB0KHN2bSwgSU5URVJDRVBUX1NUT1JFX0dEVFIpIHx8CisJCWdl
dF9pbnRlcmNlcHQoc3ZtLCBJTlRFUkNFUFRfU1RPUkVfTERUUikgfHwKKwkJZ2V0X2ludGVyY2Vw
dChzdm0sIElOVEVSQ0VQVF9TVE9SRV9UUikgfHwKKwkJZ2V0X2ludGVyY2VwdChzdm0sIElOVEVS
Q0VQVF9MT0FEX0lEVFIpIHx8CisJCWdldF9pbnRlcmNlcHQoc3ZtLCBJTlRFUkNFUFRfTE9BRF9H
RFRSKSB8fAorCQlnZXRfaW50ZXJjZXB0KHN2bSwgSU5URVJDRVBUX0xPQURfTERUUikgfHwKKwkJ
Z2V0X2ludGVyY2VwdChzdm0sIElOVEVSQ0VQVF9MT0FEX1RSKSk7Cit9CisKIHN0YXRpYyBzdHJ1
Y3Qga3ZtX3g4Nl9vcHMgc3ZtX3g4Nl9vcHMgX19yb19hZnRlcl9pbml0ID0gewogCS5jcHVfaGFz
X2t2bV9zdXBwb3J0ID0gaGFzX3N2bSwKIAkuZGlzYWJsZWRfYnlfYmlvcyA9IGlzX2Rpc2FibGVk
LApAQCAtNzUyMiw2ICs3NTQzLDcgQEAgc3RhdGljIHN0cnVjdCBrdm1feDg2X29wcyBzdm1feDg2
X29wcyBfX3JvX2FmdGVyX2luaXQgPSB7CiAJLnNldF9nZHQgPSBzdm1fc2V0X2dkdCwKIAkuZGVz
Y19jdHJsX3N1cHBvcnRlZCA9IHN2bV9kZXNjX2N0cmxfc3VwcG9ydGVkLAogCS5jb250cm9sX2Rl
c2NfaW50ZXJjZXB0ID0gc3ZtX2NvbnRyb2xfZGVzY19pbnRlcmNlcHQsCisJLmRlc2NfaW50ZXJj
ZXB0ZWQgPSBzdm1fZGVzY19pbnRlcmNlcHRlZCwKIAkuZ2V0X2RyNiA9IHN2bV9nZXRfZHI2LAog
CS5zZXRfZHI2ID0gc3ZtX3NldF9kcjYsCiAJLnNldF9kcjcgPSBzdm1fc2V0X2RyNywKZGlmZiAt
LWdpdCBhL2FyY2gveDg2L2t2bS92bXgvdm14LmMgYi9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jCmlu
ZGV4IGM3MTBiZDIwMGM1Ni4uNDY1MWQxMjgzNjk4IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0v
dm14L3ZteC5jCisrKyBiL2FyY2gveDg2L2t2bS92bXgvdm14LmMKQEAgLTc4ODQsNiArNzg4NCwx
MyBAQCBzdGF0aWMgYm9vbCB2bXhfY3IzX3dyaXRlX2ludGVyY2VwdGVkKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSkKIAlyZXR1cm4gISEoZXhlY19jb250cm9sc19nZXQodm14KSAmIENQVV9CQVNFRF9D
UjNfTE9BRF9FWElUSU5HKTsKIH0KIAorc3RhdGljIGJvb2wgdm14X2Rlc2NfaW50ZXJjZXB0ZWQo
c3RydWN0IGt2bV92Y3B1ICp2Y3B1KQoreworCXN0cnVjdCB2Y3B1X3ZteCAqdm14ID0gdG9fdm14
KHZjcHUpOworCisJcmV0dXJuICEhKHNlY29uZGFyeV9leGVjX2NvbnRyb2xzX2dldCh2bXgpICYg
U0VDT05EQVJZX0VYRUNfREVTQyk7Cit9CisKIHN0YXRpYyBzdHJ1Y3Qga3ZtX3g4Nl9vcHMgdm14
X3g4Nl9vcHMgX19yb19hZnRlcl9pbml0ID0gewogCS5jcHVfaGFzX2t2bV9zdXBwb3J0ID0gY3B1
X2hhc19rdm1fc3VwcG9ydCwKIAkuZGlzYWJsZWRfYnlfYmlvcyA9IHZteF9kaXNhYmxlZF9ieV9i
aW9zLApAQCAtNzkzMSw2ICs3OTM4LDcgQEAgc3RhdGljIHN0cnVjdCBrdm1feDg2X29wcyB2bXhf
eDg2X29wcyBfX3JvX2FmdGVyX2luaXQgPSB7CiAJLnNldF9nZHQgPSB2bXhfc2V0X2dkdCwKIAku
ZGVzY19jdHJsX3N1cHBvcnRlZCA9IHZteF9kZXNjX2N0cmxfc3VwcG9ydGVkLAogCS5jb250cm9s
X2Rlc2NfaW50ZXJjZXB0ID0gdm14X2NvbnRyb2xfZGVzY19pbnRlcmNlcHQsCisJLmRlc2NfaW50
ZXJjZXB0ZWQgPSB2bXhfZGVzY19pbnRlcmNlcHRlZCwKIAkuZ2V0X2RyNiA9IHZteF9nZXRfZHI2
LAogCS5zZXRfZHI2ID0gdm14X3NldF9kcjYsCiAJLnNldF9kcjcgPSB2bXhfc2V0X2RyNywKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRp
b24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3Jn
Cmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1
YWxpemF0aW9u
