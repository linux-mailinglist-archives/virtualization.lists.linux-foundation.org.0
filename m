Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCA4155E45
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 19:36:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0D743869FD;
	Fri,  7 Feb 2020 18:36:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n2raA7mXH1nR; Fri,  7 Feb 2020 18:36:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1F76086972;
	Fri,  7 Feb 2020 18:36:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 026F9C1D81;
	Fri,  7 Feb 2020 18:36:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 067D8C1D88
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E40CE87FE9
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:36:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aNevrVWdoNms
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B260587F9C
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:56 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 43D26305D3D0; Fri,  7 Feb 2020 20:16:39 +0200 (EET)
Received: from host.bbu.bitdefender.biz (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 363773052070;
 Fri,  7 Feb 2020 20:16:39 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v7 13/78] KVM: x86: add .control_desc_intercept()
Date: Fri,  7 Feb 2020 20:15:31 +0200
Message-Id: <20200207181636.1065-14-alazar@bitdefender.com>
In-Reply-To: <20200207181636.1065-1-alazar@bitdefender.com>
References: <20200207181636.1065-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
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

VGhpcyBmdW5jdGlvbiBpcyBuZWVkZWQgZm9yIHRoZSBLVk1JX0VWRU5UX0RFU0NSSVBUT1IgZXZl
bnQuCgpTaWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5j
b20+Ci0tLQogYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCB8ICAxICsKIGFyY2gveDg2
L2t2bS9zdm0uYyAgICAgICAgICAgICAgfCAyNiArKysrKysrKysrKysrKysrKysrKysrKysrKwog
YXJjaC94ODYva3ZtL3ZteC92bXguYyAgICAgICAgICB8IDExICsrKysrKysrKysrCiAzIGZpbGVz
IGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRl
L2FzbS9rdm1faG9zdC5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAppbmRleCBk
MmZlMDhmNDQwODQuLjNiODZlNzQ1ZGEwNSAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9h
c20va3ZtX2hvc3QuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCkBAIC0x
MDc2LDYgKzEwNzYsNyBAQCBzdHJ1Y3Qga3ZtX3g4Nl9vcHMgewogCXZvaWQgKCpzZXRfaWR0KShz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBkZXNjX3B0ciAqZHQpOwogCXZvaWQgKCpnZXRf
Z2R0KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBkZXNjX3B0ciAqZHQpOwogCXZvaWQg
KCpzZXRfZ2R0KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBkZXNjX3B0ciAqZHQpOwor
CXZvaWQgKCpjb250cm9sX2Rlc2NfaW50ZXJjZXB0KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGJv
b2wgZW5hYmxlKTsKIAl1NjQgKCpnZXRfZHI2KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogCXZv
aWQgKCpzZXRfZHI2KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGxvbmcgdmFsdWUp
OwogCXZvaWQgKCpzeW5jX2RpcnR5X2RlYnVnX3JlZ3MpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7
CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vc3ZtLmMgYi9hcmNoL3g4Ni9rdm0vc3ZtLmMKaW5k
ZXggNTU0YWQ3YzU3YTBmLi4wNjBkNDliNjliMmUgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS9z
dm0uYworKysgYi9hcmNoL3g4Ni9rdm0vc3ZtLmMKQEAgLTcyNzYsNiArNzI3NiwzMSBAQCBzdGF0
aWMgdm9pZCBzdm1fY29udHJvbF9jcjNfaW50ZXJjZXB0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwg
aW50IHR5cGUsCiAJCQkgY2xyX2NyX2ludGVyY2VwdChzdm0sIElOVEVSQ0VQVF9DUjNfV1JJVEUp
OwogfQogCitzdGF0aWMgdm9pZCBzdm1fY29udHJvbF9kZXNjX2ludGVyY2VwdChzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUsIGJvb2wgZW5hYmxlKQoreworCXN0cnVjdCB2Y3B1X3N2bSAqc3ZtID0gdG9f
c3ZtKHZjcHUpOworCisJaWYgKGVuYWJsZSkgeworCQlzZXRfaW50ZXJjZXB0KHN2bSwgSU5URVJD
RVBUX1NUT1JFX0lEVFIpOworCQlzZXRfaW50ZXJjZXB0KHN2bSwgSU5URVJDRVBUX1NUT1JFX0dE
VFIpOworCQlzZXRfaW50ZXJjZXB0KHN2bSwgSU5URVJDRVBUX1NUT1JFX0xEVFIpOworCQlzZXRf
aW50ZXJjZXB0KHN2bSwgSU5URVJDRVBUX1NUT1JFX1RSKTsKKwkJc2V0X2ludGVyY2VwdChzdm0s
IElOVEVSQ0VQVF9MT0FEX0lEVFIpOworCQlzZXRfaW50ZXJjZXB0KHN2bSwgSU5URVJDRVBUX0xP
QURfR0RUUik7CisJCXNldF9pbnRlcmNlcHQoc3ZtLCBJTlRFUkNFUFRfTE9BRF9MRFRSKTsKKwkJ
c2V0X2ludGVyY2VwdChzdm0sIElOVEVSQ0VQVF9MT0FEX1RSKTsKKwl9IGVsc2UgeworCQljbHJf
aW50ZXJjZXB0KHN2bSwgSU5URVJDRVBUX1NUT1JFX0lEVFIpOworCQljbHJfaW50ZXJjZXB0KHN2
bSwgSU5URVJDRVBUX1NUT1JFX0dEVFIpOworCQljbHJfaW50ZXJjZXB0KHN2bSwgSU5URVJDRVBU
X1NUT1JFX0xEVFIpOworCQljbHJfaW50ZXJjZXB0KHN2bSwgSU5URVJDRVBUX1NUT1JFX1RSKTsK
KwkJY2xyX2ludGVyY2VwdChzdm0sIElOVEVSQ0VQVF9MT0FEX0lEVFIpOworCQljbHJfaW50ZXJj
ZXB0KHN2bSwgSU5URVJDRVBUX0xPQURfR0RUUik7CisJCWNscl9pbnRlcmNlcHQoc3ZtLCBJTlRF
UkNFUFRfTE9BRF9MRFRSKTsKKwkJY2xyX2ludGVyY2VwdChzdm0sIElOVEVSQ0VQVF9MT0FEX1RS
KTsKKwl9Cit9CisKIHN0YXRpYyBzdHJ1Y3Qga3ZtX3g4Nl9vcHMgc3ZtX3g4Nl9vcHMgX19yb19h
ZnRlcl9pbml0ID0gewogCS5jcHVfaGFzX2t2bV9zdXBwb3J0ID0gaGFzX3N2bSwKIAkuZGlzYWJs
ZWRfYnlfYmlvcyA9IGlzX2Rpc2FibGVkLApAQCAtNzMyNCw2ICs3MzQ5LDcgQEAgc3RhdGljIHN0
cnVjdCBrdm1feDg2X29wcyBzdm1feDg2X29wcyBfX3JvX2FmdGVyX2luaXQgPSB7CiAJLnNldF9p
ZHQgPSBzdm1fc2V0X2lkdCwKIAkuZ2V0X2dkdCA9IHN2bV9nZXRfZ2R0LAogCS5zZXRfZ2R0ID0g
c3ZtX3NldF9nZHQsCisJLmNvbnRyb2xfZGVzY19pbnRlcmNlcHQgPSBzdm1fY29udHJvbF9kZXNj
X2ludGVyY2VwdCwKIAkuZ2V0X2RyNiA9IHN2bV9nZXRfZHI2LAogCS5zZXRfZHI2ID0gc3ZtX3Nl
dF9kcjYsCiAJLnNldF9kcjcgPSBzdm1fc2V0X2RyNywKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2
bS92bXgvdm14LmMgYi9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jCmluZGV4IDdjZmQyNTgwMGQ4OS4u
NjQ2Y2UyNjUwNzI4IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jCisrKyBiL2Fy
Y2gveDg2L2t2bS92bXgvdm14LmMKQEAgLTI5OTgsNiArMjk5OCwxNiBAQCB1NjQgY29uc3RydWN0
X2VwdHAoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIHJvb3RfaHBhKQogCXJl
dHVybiBlcHRwOwogfQogCitzdGF0aWMgdm9pZCB2bXhfY29udHJvbF9kZXNjX2ludGVyY2VwdChz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGJvb2wgZW5hYmxlKQoreworCXN0cnVjdCB2Y3B1X3ZteCAq
dm14ID0gdG9fdm14KHZjcHUpOworCisJaWYgKGVuYWJsZSkKKwkJc2Vjb25kYXJ5X2V4ZWNfY29u
dHJvbHNfc2V0Yml0KHZteCwgU0VDT05EQVJZX0VYRUNfREVTQyk7CisJZWxzZQorCQlzZWNvbmRh
cnlfZXhlY19jb250cm9sc19jbGVhcmJpdCh2bXgsIFNFQ09OREFSWV9FWEVDX0RFU0MpOworfQor
CiB2b2lkIHZteF9zZXRfY3IzKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbG9uZyBj
cjMpCiB7CiAJc3RydWN0IGt2bSAqa3ZtID0gdmNwdS0+a3ZtOwpAQCAtNzgyOCw2ICs3ODM4LDcg
QEAgc3RhdGljIHN0cnVjdCBrdm1feDg2X29wcyB2bXhfeDg2X29wcyBfX3JvX2FmdGVyX2luaXQg
PSB7CiAJLnNldF9pZHQgPSB2bXhfc2V0X2lkdCwKIAkuZ2V0X2dkdCA9IHZteF9nZXRfZ2R0LAog
CS5zZXRfZ2R0ID0gdm14X3NldF9nZHQsCisJLmNvbnRyb2xfZGVzY19pbnRlcmNlcHQgPSB2bXhf
Y29udHJvbF9kZXNjX2ludGVyY2VwdCwKIAkuZ2V0X2RyNiA9IHZteF9nZXRfZHI2LAogCS5zZXRf
ZHI2ID0gdm14X3NldF9kcjYsCiAJLnNldF9kcjcgPSB2bXhfc2V0X2RyNywKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGlu
ZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8v
bGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
