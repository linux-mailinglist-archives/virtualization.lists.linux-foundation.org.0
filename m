Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F88155E3A
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 19:36:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4D0B186962;
	Fri,  7 Feb 2020 18:36:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GO-41IxoXSod; Fri,  7 Feb 2020 18:36:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6FDC2869F5;
	Fri,  7 Feb 2020 18:36:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 591C0C013E;
	Fri,  7 Feb 2020 18:36:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88B20C1D81
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 71FDD88031
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:36:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sqky4OpZWoNA
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 19A8187F92
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:58 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 4A1A3305D3D1; Fri,  7 Feb 2020 20:16:39 +0200 (EET)
Received: from host.bbu.bitdefender.biz (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 3B4C63052071;
 Fri,  7 Feb 2020 20:16:39 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v7 14/78] KVM: x86: add .desc_intercepted()
Date: Fri,  7 Feb 2020 20:15:32 +0200
Message-Id: <20200207181636.1065-15-alazar@bitdefender.com>
In-Reply-To: <20200207181636.1065-1-alazar@bitdefender.com>
References: <20200207181636.1065-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Nicu=C8=99or=20C=C3=AE=C8=9Bu?= <ncitu@bitdefender.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
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
ZS9hc20va3ZtX2hvc3QuaAppbmRleCAzYjg2ZTc0NWRhMDUuLjRkNDNmNTQ3OWMwYyAxMDA2NDQK
LS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAorKysgYi9hcmNoL3g4Ni9pbmNs
dWRlL2FzbS9rdm1faG9zdC5oCkBAIC0xMDc3LDYgKzEwNzcsNyBAQCBzdHJ1Y3Qga3ZtX3g4Nl9v
cHMgewogCXZvaWQgKCpnZXRfZ2R0KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBkZXNj
X3B0ciAqZHQpOwogCXZvaWQgKCpzZXRfZ2R0KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVj
dCBkZXNjX3B0ciAqZHQpOwogCXZvaWQgKCpjb250cm9sX2Rlc2NfaW50ZXJjZXB0KShzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUsIGJvb2wgZW5hYmxlKTsKKwlib29sICgqZGVzY19pbnRlcmNlcHRlZCko
c3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIAl1NjQgKCpnZXRfZHI2KShzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUpOwogCXZvaWQgKCpzZXRfZHI2KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVk
IGxvbmcgdmFsdWUpOwogCXZvaWQgKCpzeW5jX2RpcnR5X2RlYnVnX3JlZ3MpKHN0cnVjdCBrdm1f
dmNwdSAqdmNwdSk7CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vc3ZtLmMgYi9hcmNoL3g4Ni9r
dm0vc3ZtLmMKaW5kZXggMDYwZDQ5YjY5YjJlLi5iZjFmMmJjYTUzNTcgMTAwNjQ0Ci0tLSBhL2Fy
Y2gveDg2L2t2bS9zdm0uYworKysgYi9hcmNoL3g4Ni9rdm0vc3ZtLmMKQEAgLTYzMiw2ICs2MzIs
MTMgQEAgc3RhdGljIGlubGluZSB2b2lkIGNscl9pbnRlcmNlcHQoc3RydWN0IHZjcHVfc3ZtICpz
dm0sIGludCBiaXQpCiAJcmVjYWxjX2ludGVyY2VwdHMoc3ZtKTsKIH0KIAorc3RhdGljIGlubGlu
ZSBib29sIGdldF9pbnRlcmNlcHQoc3RydWN0IHZjcHVfc3ZtICpzdm0sIGludCBiaXQpCit7CisJ
c3RydWN0IHZtY2IgKnZtY2IgPSBnZXRfaG9zdF92bWNiKHN2bSk7CisKKwlyZXR1cm4gKHZtY2It
PmNvbnRyb2wuaW50ZXJjZXB0ICYgKDFVTEwgPDwgYml0KSk7Cit9CisKIHN0YXRpYyBpbmxpbmUg
Ym9vbCB2Z2lmX2VuYWJsZWQoc3RydWN0IHZjcHVfc3ZtICpzdm0pCiB7CiAJcmV0dXJuICEhKHN2
bS0+dm1jYi0+Y29udHJvbC5pbnRfY3RsICYgVl9HSUZfRU5BQkxFX01BU0spOwpAQCAtNzMwMSw2
ICs3MzA4LDIwIEBAIHN0YXRpYyB2b2lkIHN2bV9jb250cm9sX2Rlc2NfaW50ZXJjZXB0KHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSwgYm9vbCBlbmFibGUpCiAJfQogfQogCitzdGF0aWMgaW5saW5lIGJv
b2wgc3ZtX2Rlc2NfaW50ZXJjZXB0ZWQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQoreworCXN0cnVj
dCB2Y3B1X3N2bSAqc3ZtID0gdG9fc3ZtKHZjcHUpOworCisJcmV0dXJuIChnZXRfaW50ZXJjZXB0
KHN2bSwgSU5URVJDRVBUX1NUT1JFX0lEVFIpIHx8CisJCWdldF9pbnRlcmNlcHQoc3ZtLCBJTlRF
UkNFUFRfU1RPUkVfR0RUUikgfHwKKwkJZ2V0X2ludGVyY2VwdChzdm0sIElOVEVSQ0VQVF9TVE9S
RV9MRFRSKSB8fAorCQlnZXRfaW50ZXJjZXB0KHN2bSwgSU5URVJDRVBUX1NUT1JFX1RSKSB8fAor
CQlnZXRfaW50ZXJjZXB0KHN2bSwgSU5URVJDRVBUX0xPQURfSURUUikgfHwKKwkJZ2V0X2ludGVy
Y2VwdChzdm0sIElOVEVSQ0VQVF9MT0FEX0dEVFIpIHx8CisJCWdldF9pbnRlcmNlcHQoc3ZtLCBJ
TlRFUkNFUFRfTE9BRF9MRFRSKSB8fAorCQlnZXRfaW50ZXJjZXB0KHN2bSwgSU5URVJDRVBUX0xP
QURfVFIpKTsKK30KKwogc3RhdGljIHN0cnVjdCBrdm1feDg2X29wcyBzdm1feDg2X29wcyBfX3Jv
X2FmdGVyX2luaXQgPSB7CiAJLmNwdV9oYXNfa3ZtX3N1cHBvcnQgPSBoYXNfc3ZtLAogCS5kaXNh
YmxlZF9ieV9iaW9zID0gaXNfZGlzYWJsZWQsCkBAIC03MzUwLDYgKzczNzEsNyBAQCBzdGF0aWMg
c3RydWN0IGt2bV94ODZfb3BzIHN2bV94ODZfb3BzIF9fcm9fYWZ0ZXJfaW5pdCA9IHsKIAkuZ2V0
X2dkdCA9IHN2bV9nZXRfZ2R0LAogCS5zZXRfZ2R0ID0gc3ZtX3NldF9nZHQsCiAJLmNvbnRyb2xf
ZGVzY19pbnRlcmNlcHQgPSBzdm1fY29udHJvbF9kZXNjX2ludGVyY2VwdCwKKwkuZGVzY19pbnRl
cmNlcHRlZCA9IHN2bV9kZXNjX2ludGVyY2VwdGVkLAogCS5nZXRfZHI2ID0gc3ZtX2dldF9kcjYs
CiAJLnNldF9kcjYgPSBzdm1fc2V0X2RyNiwKIAkuc2V0X2RyNyA9IHN2bV9zZXRfZHI3LApkaWZm
IC0tZ2l0IGEvYXJjaC94ODYva3ZtL3ZteC92bXguYyBiL2FyY2gveDg2L2t2bS92bXgvdm14LmMK
aW5kZXggNjQ2Y2UyNjUwNzI4Li44NzA5YTI2NzM2ZDkgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2
bS92bXgvdm14LmMKKysrIGIvYXJjaC94ODYva3ZtL3ZteC92bXguYwpAQCAtNzc5Myw2ICs3Nzkz
LDEzIEBAIHN0YXRpYyBib29sIHZteF9jcjNfd3JpdGVfaW50ZXJjZXB0ZWQoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1KQogCXJldHVybiAhIShleGVjX2NvbnRyb2xzX2dldCh2bXgpICYgQ1BVX0JBU0VE
X0NSM19MT0FEX0VYSVRJTkcpOwogfQogCitzdGF0aWMgYm9vbCB2bXhfZGVzY19pbnRlcmNlcHRl
ZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCit7CisJc3RydWN0IHZjcHVfdm14ICp2bXggPSB0b192
bXgodmNwdSk7CisKKwlyZXR1cm4gISEoc2Vjb25kYXJ5X2V4ZWNfY29udHJvbHNfZ2V0KHZteCkg
JiBTRUNPTkRBUllfRVhFQ19ERVNDKTsKK30KKwogc3RhdGljIHN0cnVjdCBrdm1feDg2X29wcyB2
bXhfeDg2X29wcyBfX3JvX2FmdGVyX2luaXQgPSB7CiAJLmNwdV9oYXNfa3ZtX3N1cHBvcnQgPSBj
cHVfaGFzX2t2bV9zdXBwb3J0LAogCS5kaXNhYmxlZF9ieV9iaW9zID0gdm14X2Rpc2FibGVkX2J5
X2Jpb3MsCkBAIC03ODM5LDYgKzc4NDYsNyBAQCBzdGF0aWMgc3RydWN0IGt2bV94ODZfb3BzIHZt
eF94ODZfb3BzIF9fcm9fYWZ0ZXJfaW5pdCA9IHsKIAkuZ2V0X2dkdCA9IHZteF9nZXRfZ2R0LAog
CS5zZXRfZ2R0ID0gdm14X3NldF9nZHQsCiAJLmNvbnRyb2xfZGVzY19pbnRlcmNlcHQgPSB2bXhf
Y29udHJvbF9kZXNjX2ludGVyY2VwdCwKKwkuZGVzY19pbnRlcmNlcHRlZCA9IHZteF9kZXNjX2lu
dGVyY2VwdGVkLAogCS5nZXRfZHI2ID0gdm14X2dldF9kcjYsCiAJLnNldF9kcjYgPSB2bXhfc2V0
X2RyNiwKIAkuc2V0X2RyNyA9IHZteF9zZXRfZHI3LApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVh
bGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
