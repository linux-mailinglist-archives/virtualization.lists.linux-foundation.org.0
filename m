Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B21197895
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 12:13:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id EC3AC23251;
	Mon, 30 Mar 2020 10:13:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UiP6slJasQML; Mon, 30 Mar 2020 10:13:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5B8D523265;
	Mon, 30 Mar 2020 10:13:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 47490C1D89;
	Mon, 30 Mar 2020 10:13:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94DD5C1AE8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 80092869B8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LqO74u8MyXWB
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3733486990
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:54 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 F3C6330747CE; Mon, 30 Mar 2020 13:12:50 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id D330C305B7A0;
 Mon, 30 Mar 2020 13:12:50 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v8 15/81] KVM: x86: add .control_desc_intercept()
Date: Mon, 30 Mar 2020 13:12:02 +0300
Message-Id: <20200330101308.21702-16-alazar@bitdefender.com>
In-Reply-To: <20200330101308.21702-1-alazar@bitdefender.com>
References: <20200330101308.21702-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>, virtualization@lists.linux-foundation.org
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
YXJjaC94ODYva3ZtL3ZteC92bXguYyAgICAgICAgICB8IDE1ICsrKysrKysrKysrKystLQogMyBm
aWxlcyBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggYi9hcmNoL3g4Ni9pbmNsdWRlL2Fz
bS9rdm1faG9zdC5oCmluZGV4IDgxYTU5YjAzYjBjNS4uMTFlNDlkYmVjNzhjIDEwMDY0NAotLS0g
YS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUv
YXNtL2t2bV9ob3N0LmgKQEAgLTExMDYsNiArMTEwNiw3IEBAIHN0cnVjdCBrdm1feDg2X29wcyB7
CiAJdm9pZCAoKmdldF9nZHQpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGRlc2NfcHRy
ICpkdCk7CiAJdm9pZCAoKnNldF9nZHQpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGRl
c2NfcHRyICpkdCk7CiAJYm9vbCAoKmRlc2NfY3RybF9zdXBwb3J0ZWQpKHZvaWQpOworCXZvaWQg
KCpjb250cm9sX2Rlc2NfaW50ZXJjZXB0KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGJvb2wgZW5h
YmxlKTsKIAl1NjQgKCpnZXRfZHI2KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogCXZvaWQgKCpz
ZXRfZHI2KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGxvbmcgdmFsdWUpOwogCXZv
aWQgKCpzeW5jX2RpcnR5X2RlYnVnX3JlZ3MpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7CmRpZmYg
LS1naXQgYS9hcmNoL3g4Ni9rdm0vc3ZtLmMgYi9hcmNoL3g4Ni9rdm0vc3ZtLmMKaW5kZXggZmQy
MTQzOTQ3NWI1Li5lYTRmMDJjYWI2N2QgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS9zdm0uYwor
KysgYi9hcmNoL3g4Ni9rdm0vc3ZtLmMKQEAgLTc0NDcsNiArNzQ0NywzMSBAQCBzdGF0aWMgdm9p
ZCBzdm1fY29udHJvbF9jcjNfaW50ZXJjZXB0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgaW50IHR5
cGUsCiAJCQkgY2xyX2NyX2ludGVyY2VwdChzdm0sIElOVEVSQ0VQVF9DUjNfV1JJVEUpOwogfQog
CitzdGF0aWMgdm9pZCBzdm1fY29udHJvbF9kZXNjX2ludGVyY2VwdChzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUsIGJvb2wgZW5hYmxlKQoreworCXN0cnVjdCB2Y3B1X3N2bSAqc3ZtID0gdG9fc3ZtKHZj
cHUpOworCisJaWYgKGVuYWJsZSkgeworCQlzZXRfaW50ZXJjZXB0KHN2bSwgSU5URVJDRVBUX1NU
T1JFX0lEVFIpOworCQlzZXRfaW50ZXJjZXB0KHN2bSwgSU5URVJDRVBUX1NUT1JFX0dEVFIpOwor
CQlzZXRfaW50ZXJjZXB0KHN2bSwgSU5URVJDRVBUX1NUT1JFX0xEVFIpOworCQlzZXRfaW50ZXJj
ZXB0KHN2bSwgSU5URVJDRVBUX1NUT1JFX1RSKTsKKwkJc2V0X2ludGVyY2VwdChzdm0sIElOVEVS
Q0VQVF9MT0FEX0lEVFIpOworCQlzZXRfaW50ZXJjZXB0KHN2bSwgSU5URVJDRVBUX0xPQURfR0RU
Uik7CisJCXNldF9pbnRlcmNlcHQoc3ZtLCBJTlRFUkNFUFRfTE9BRF9MRFRSKTsKKwkJc2V0X2lu
dGVyY2VwdChzdm0sIElOVEVSQ0VQVF9MT0FEX1RSKTsKKwl9IGVsc2UgeworCQljbHJfaW50ZXJj
ZXB0KHN2bSwgSU5URVJDRVBUX1NUT1JFX0lEVFIpOworCQljbHJfaW50ZXJjZXB0KHN2bSwgSU5U
RVJDRVBUX1NUT1JFX0dEVFIpOworCQljbHJfaW50ZXJjZXB0KHN2bSwgSU5URVJDRVBUX1NUT1JF
X0xEVFIpOworCQljbHJfaW50ZXJjZXB0KHN2bSwgSU5URVJDRVBUX1NUT1JFX1RSKTsKKwkJY2xy
X2ludGVyY2VwdChzdm0sIElOVEVSQ0VQVF9MT0FEX0lEVFIpOworCQljbHJfaW50ZXJjZXB0KHN2
bSwgSU5URVJDRVBUX0xPQURfR0RUUik7CisJCWNscl9pbnRlcmNlcHQoc3ZtLCBJTlRFUkNFUFRf
TE9BRF9MRFRSKTsKKwkJY2xyX2ludGVyY2VwdChzdm0sIElOVEVSQ0VQVF9MT0FEX1RSKTsKKwl9
Cit9CisKIHN0YXRpYyBzdHJ1Y3Qga3ZtX3g4Nl9vcHMgc3ZtX3g4Nl9vcHMgX19yb19hZnRlcl9p
bml0ID0gewogCS5jcHVfaGFzX2t2bV9zdXBwb3J0ID0gaGFzX3N2bSwKIAkuZGlzYWJsZWRfYnlf
YmlvcyA9IGlzX2Rpc2FibGVkLApAQCAtNzQ5Niw2ICs3NTIxLDcgQEAgc3RhdGljIHN0cnVjdCBr
dm1feDg2X29wcyBzdm1feDg2X29wcyBfX3JvX2FmdGVyX2luaXQgPSB7CiAJLmdldF9nZHQgPSBz
dm1fZ2V0X2dkdCwKIAkuc2V0X2dkdCA9IHN2bV9zZXRfZ2R0LAogCS5kZXNjX2N0cmxfc3VwcG9y
dGVkID0gc3ZtX2Rlc2NfY3RybF9zdXBwb3J0ZWQsCisJLmNvbnRyb2xfZGVzY19pbnRlcmNlcHQg
PSBzdm1fY29udHJvbF9kZXNjX2ludGVyY2VwdCwKIAkuZ2V0X2RyNiA9IHN2bV9nZXRfZHI2LAog
CS5zZXRfZHI2ID0gc3ZtX3NldF9kcjYsCiAJLnNldF9kcjcgPSBzdm1fc2V0X2RyNywKZGlmZiAt
LWdpdCBhL2FyY2gveDg2L2t2bS92bXgvdm14LmMgYi9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jCmlu
ZGV4IDY1N2M5YWMwMDcwYi4uYzcxMGJkMjAwYzU2IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0v
dm14L3ZteC5jCisrKyBiL2FyY2gveDg2L2t2bS92bXgvdm14LmMKQEAgLTMwMzQsNiArMzAzNCwx
NiBAQCB1NjQgY29uc3RydWN0X2VwdHAoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBs
b25nIHJvb3RfaHBhKQogCXJldHVybiBlcHRwOwogfQogCitzdGF0aWMgdm9pZCB2bXhfY29udHJv
bF9kZXNjX2ludGVyY2VwdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGJvb2wgZW5hYmxlKQorewor
CXN0cnVjdCB2Y3B1X3ZteCAqdm14ID0gdG9fdm14KHZjcHUpOworCisJaWYgKGVuYWJsZSkKKwkJ
c2Vjb25kYXJ5X2V4ZWNfY29udHJvbHNfc2V0Yml0KHZteCwgU0VDT05EQVJZX0VYRUNfREVTQyk7
CisJZWxzZQorCQlzZWNvbmRhcnlfZXhlY19jb250cm9sc19jbGVhcmJpdCh2bXgsIFNFQ09OREFS
WV9FWEVDX0RFU0MpOworfQorCiB2b2lkIHZteF9zZXRfY3IzKHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSwgdW5zaWduZWQgbG9uZyBjcjMpCiB7CiAJc3RydWN0IGt2bSAqa3ZtID0gdmNwdS0+a3ZtOwpA
QCAtMzA5MCwxMSArMzEwMCwxMSBAQCBpbnQgdm14X3NldF9jcjQoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1LCB1bnNpZ25lZCBsb25nIGNyNCkKIAogCWlmICghYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJF
X1VNSVApICYmIHZteF91bWlwX2VtdWxhdGVkKCkpIHsKIAkJaWYgKGNyNCAmIFg4Nl9DUjRfVU1J
UCkgewotCQkJc2Vjb25kYXJ5X2V4ZWNfY29udHJvbHNfc2V0Yml0KHZteCwgU0VDT05EQVJZX0VY
RUNfREVTQyk7CisJCQl2bXhfY29udHJvbF9kZXNjX2ludGVyY2VwdCh2Y3B1LCB0cnVlKTsKIAkJ
CWh3X2NyNCAmPSB+WDg2X0NSNF9VTUlQOwogCQl9IGVsc2UgaWYgKCFpc19ndWVzdF9tb2RlKHZj
cHUpIHx8CiAJCQkhbmVzdGVkX2NwdV9oYXMyKGdldF92bWNzMTIodmNwdSksIFNFQ09OREFSWV9F
WEVDX0RFU0MpKSB7Ci0JCQlzZWNvbmRhcnlfZXhlY19jb250cm9sc19jbGVhcmJpdCh2bXgsIFNF
Q09OREFSWV9FWEVDX0RFU0MpOworCQkJdm14X2NvbnRyb2xfZGVzY19pbnRlcmNlcHQodmNwdSwg
ZmFsc2UpOwogCQl9CiAJfQogCkBAIC03OTIwLDYgKzc5MzAsNyBAQCBzdGF0aWMgc3RydWN0IGt2
bV94ODZfb3BzIHZteF94ODZfb3BzIF9fcm9fYWZ0ZXJfaW5pdCA9IHsKIAkuZ2V0X2dkdCA9IHZt
eF9nZXRfZ2R0LAogCS5zZXRfZ2R0ID0gdm14X3NldF9nZHQsCiAJLmRlc2NfY3RybF9zdXBwb3J0
ZWQgPSB2bXhfZGVzY19jdHJsX3N1cHBvcnRlZCwKKwkuY29udHJvbF9kZXNjX2ludGVyY2VwdCA9
IHZteF9jb250cm9sX2Rlc2NfaW50ZXJjZXB0LAogCS5nZXRfZHI2ID0gdm14X2dldF9kcjYsCiAJ
LnNldF9kcjYgPSB2bXhfc2V0X2RyNiwKIAkuc2V0X2RyNyA9IHZteF9zZXRfZHI3LApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBt
YWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0
cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6
YXRpb24=
