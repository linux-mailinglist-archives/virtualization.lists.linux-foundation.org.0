Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B41228B22
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 23:26:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AA13886B9A;
	Tue, 21 Jul 2020 21:26:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n-J5UVl5fXls; Tue, 21 Jul 2020 21:26:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9C98586BBD;
	Tue, 21 Jul 2020 21:26:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 85086C016F;
	Tue, 21 Jul 2020 21:26:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 85A0FC016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 73FC386B7D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ds7hqL2SDerF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 15B9B86B85
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:57 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 DDD01305D7FE; Wed, 22 Jul 2020 00:09:20 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id C4096304FA13;
 Wed, 22 Jul 2020 00:09:20 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v9 14/84] KVM: x86: add .control_desc_intercept()
Date: Wed, 22 Jul 2020 00:08:12 +0300
Message-Id: <20200721210922.7646-15-alazar@bitdefender.com>
In-Reply-To: <20200721210922.7646-1-alazar@bitdefender.com>
References: <20200721210922.7646-1-alazar@bitdefender.com>
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

VGhpcyBmdW5jdGlvbiBpcyBuZWVkZWQgdG8gaW50ZXJjZXB0IGRlc2NyaXB0b3ItdGFibGUgcmVn
aXN0ZXJzIGFjY2Vzcy4KClNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJp
dGRlZmVuZGVyLmNvbT4KLS0tCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIHwgIDEg
KwogYXJjaC94ODYva3ZtL3N2bS9zdm0uYyAgICAgICAgICB8IDI2ICsrKysrKysrKysrKysrKysr
KysrKysrKysrCiBhcmNoL3g4Ni9rdm0vdm14L3ZteC5jICAgICAgICAgIHwgMTUgKysrKysrKysr
KysrKy0tCiAzIGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCBiL2FyY2gveDg2
L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKaW5kZXggYjNjYTY0YTcwYmI1Li44M2RmYTAyNDcxMzAg
MTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKKysrIGIvYXJjaC94
ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaApAQCAtMTEyNCw2ICsxMTI0LDcgQEAgc3RydWN0IGt2
bV94ODZfb3BzIHsKIAl2b2lkICgqZ2V0X2dkdCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1
Y3QgZGVzY19wdHIgKmR0KTsKIAl2b2lkICgqc2V0X2dkdCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
LCBzdHJ1Y3QgZGVzY19wdHIgKmR0KTsKIAlib29sICgqZGVzY19jdHJsX3N1cHBvcnRlZCkodm9p
ZCk7CisJdm9pZCAoKmNvbnRyb2xfZGVzY19pbnRlcmNlcHQpKHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSwgYm9vbCBlbmFibGUpOwogCXZvaWQgKCpzeW5jX2RpcnR5X2RlYnVnX3JlZ3MpKHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSk7CiAJdm9pZCAoKnNldF9kcjcpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwg
dW5zaWduZWQgbG9uZyB2YWx1ZSk7CiAJdm9pZCAoKmNhY2hlX3JlZykoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LCBlbnVtIGt2bV9yZWcgcmVnKTsKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9zdm0v
c3ZtLmMgYi9hcmNoL3g4Ni9rdm0vc3ZtL3N2bS5jCmluZGV4IGI1NDBhZjA0YjM4NC4uYzcwYzE0
NDYxNDgzIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vc3ZtL3N2bS5jCisrKyBiL2FyY2gveDg2
L2t2bS9zdm0vc3ZtLmMKQEAgLTE1MjgsNiArMTUyOCwzMSBAQCBzdGF0aWMgYm9vbCBzdm1fZGVz
Y19jdHJsX3N1cHBvcnRlZCh2b2lkKQogCXJldHVybiB0cnVlOwogfQogCitzdGF0aWMgdm9pZCBz
dm1fY29udHJvbF9kZXNjX2ludGVyY2VwdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGJvb2wgZW5h
YmxlKQoreworCXN0cnVjdCB2Y3B1X3N2bSAqc3ZtID0gdG9fc3ZtKHZjcHUpOworCisJaWYgKGVu
YWJsZSkgeworCQlzZXRfaW50ZXJjZXB0KHN2bSwgSU5URVJDRVBUX1NUT1JFX0lEVFIpOworCQlz
ZXRfaW50ZXJjZXB0KHN2bSwgSU5URVJDRVBUX1NUT1JFX0dEVFIpOworCQlzZXRfaW50ZXJjZXB0
KHN2bSwgSU5URVJDRVBUX1NUT1JFX0xEVFIpOworCQlzZXRfaW50ZXJjZXB0KHN2bSwgSU5URVJD
RVBUX1NUT1JFX1RSKTsKKwkJc2V0X2ludGVyY2VwdChzdm0sIElOVEVSQ0VQVF9MT0FEX0lEVFIp
OworCQlzZXRfaW50ZXJjZXB0KHN2bSwgSU5URVJDRVBUX0xPQURfR0RUUik7CisJCXNldF9pbnRl
cmNlcHQoc3ZtLCBJTlRFUkNFUFRfTE9BRF9MRFRSKTsKKwkJc2V0X2ludGVyY2VwdChzdm0sIElO
VEVSQ0VQVF9MT0FEX1RSKTsKKwl9IGVsc2UgeworCQljbHJfaW50ZXJjZXB0KHN2bSwgSU5URVJD
RVBUX1NUT1JFX0lEVFIpOworCQljbHJfaW50ZXJjZXB0KHN2bSwgSU5URVJDRVBUX1NUT1JFX0dE
VFIpOworCQljbHJfaW50ZXJjZXB0KHN2bSwgSU5URVJDRVBUX1NUT1JFX0xEVFIpOworCQljbHJf
aW50ZXJjZXB0KHN2bSwgSU5URVJDRVBUX1NUT1JFX1RSKTsKKwkJY2xyX2ludGVyY2VwdChzdm0s
IElOVEVSQ0VQVF9MT0FEX0lEVFIpOworCQljbHJfaW50ZXJjZXB0KHN2bSwgSU5URVJDRVBUX0xP
QURfR0RUUik7CisJCWNscl9pbnRlcmNlcHQoc3ZtLCBJTlRFUkNFUFRfTE9BRF9MRFRSKTsKKwkJ
Y2xyX2ludGVyY2VwdChzdm0sIElOVEVSQ0VQVF9MT0FEX1RSKTsKKwl9Cit9CisKIHN0YXRpYyB2
b2lkIHVwZGF0ZV9jcjBfaW50ZXJjZXB0KHN0cnVjdCB2Y3B1X3N2bSAqc3ZtKQogewogCXVsb25n
IGdjcjAgPSBzdm0tPnZjcHUuYXJjaC5jcjA7CkBAIC00MDU2LDYgKzQwODEsNyBAQCBzdGF0aWMg
c3RydWN0IGt2bV94ODZfb3BzIHN2bV94ODZfb3BzIF9faW5pdGRhdGEgPSB7CiAJLmdldF9nZHQg
PSBzdm1fZ2V0X2dkdCwKIAkuc2V0X2dkdCA9IHN2bV9zZXRfZ2R0LAogCS5kZXNjX2N0cmxfc3Vw
cG9ydGVkID0gc3ZtX2Rlc2NfY3RybF9zdXBwb3J0ZWQsCisJLmNvbnRyb2xfZGVzY19pbnRlcmNl
cHQgPSBzdm1fY29udHJvbF9kZXNjX2ludGVyY2VwdCwKIAkuc2V0X2RyNyA9IHN2bV9zZXRfZHI3
LAogCS5zeW5jX2RpcnR5X2RlYnVnX3JlZ3MgPSBzdm1fc3luY19kaXJ0eV9kZWJ1Z19yZWdzLAog
CS5jYWNoZV9yZWcgPSBzdm1fY2FjaGVfcmVnLApkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3Zt
eC92bXguYyBiL2FyY2gveDg2L2t2bS92bXgvdm14LmMKaW5kZXggZWNkNGM1MGJmMWEyLi4xOTlm
ZmQzMTgxNDUgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS92bXgvdm14LmMKKysrIGIvYXJjaC94
ODYva3ZtL3ZteC92bXguYwpAQCAtMzE1MSw2ICszMTUxLDE2IEBAIHZvaWQgdm14X2xvYWRfbW11
X3BnZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGxvbmcgcGdkKQogCQl2bWNzX3dy
aXRlbChHVUVTVF9DUjMsIGd1ZXN0X2NyMyk7CiB9CiAKK3N0YXRpYyB2b2lkIHZteF9jb250cm9s
X2Rlc2NfaW50ZXJjZXB0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgYm9vbCBlbmFibGUpCit7CisJ
c3RydWN0IHZjcHVfdm14ICp2bXggPSB0b192bXgodmNwdSk7CisKKwlpZiAoZW5hYmxlKQorCQlz
ZWNvbmRhcnlfZXhlY19jb250cm9sc19zZXRiaXQodm14LCBTRUNPTkRBUllfRVhFQ19ERVNDKTsK
KwllbHNlCisJCXNlY29uZGFyeV9leGVjX2NvbnRyb2xzX2NsZWFyYml0KHZteCwgU0VDT05EQVJZ
X0VYRUNfREVTQyk7Cit9CisKIGludCB2bXhfc2V0X2NyNChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUs
IHVuc2lnbmVkIGxvbmcgY3I0KQogewogCXN0cnVjdCB2Y3B1X3ZteCAqdm14ID0gdG9fdm14KHZj
cHUpOwpAQCAtMzE3MSwxMSArMzE4MSwxMSBAQCBpbnQgdm14X3NldF9jcjQoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIGNyNCkKIAogCWlmICghYm9vdF9jcHVfaGFzKFg4Nl9G
RUFUVVJFX1VNSVApICYmIHZteF91bWlwX2VtdWxhdGVkKCkpIHsKIAkJaWYgKGNyNCAmIFg4Nl9D
UjRfVU1JUCkgewotCQkJc2Vjb25kYXJ5X2V4ZWNfY29udHJvbHNfc2V0Yml0KHZteCwgU0VDT05E
QVJZX0VYRUNfREVTQyk7CisJCQl2bXhfY29udHJvbF9kZXNjX2ludGVyY2VwdCh2Y3B1LCB0cnVl
KTsKIAkJCWh3X2NyNCAmPSB+WDg2X0NSNF9VTUlQOwogCQl9IGVsc2UgaWYgKCFpc19ndWVzdF9t
b2RlKHZjcHUpIHx8CiAJCQkhbmVzdGVkX2NwdV9oYXMyKGdldF92bWNzMTIodmNwdSksIFNFQ09O
REFSWV9FWEVDX0RFU0MpKSB7Ci0JCQlzZWNvbmRhcnlfZXhlY19jb250cm9sc19jbGVhcmJpdCh2
bXgsIFNFQ09OREFSWV9FWEVDX0RFU0MpOworCQkJdm14X2NvbnRyb2xfZGVzY19pbnRlcmNlcHQo
dmNwdSwgZmFsc2UpOwogCQl9CiAJfQogCkBAIC03OTA0LDYgKzc5MTQsNyBAQCBzdGF0aWMgc3Ry
dWN0IGt2bV94ODZfb3BzIHZteF94ODZfb3BzIF9faW5pdGRhdGEgPSB7CiAJLmdldF9nZHQgPSB2
bXhfZ2V0X2dkdCwKIAkuc2V0X2dkdCA9IHZteF9zZXRfZ2R0LAogCS5kZXNjX2N0cmxfc3VwcG9y
dGVkID0gdm14X2Rlc2NfY3RybF9zdXBwb3J0ZWQsCisJLmNvbnRyb2xfZGVzY19pbnRlcmNlcHQg
PSB2bXhfY29udHJvbF9kZXNjX2ludGVyY2VwdCwKIAkuc2V0X2RyNyA9IHZteF9zZXRfZHI3LAog
CS5zeW5jX2RpcnR5X2RlYnVnX3JlZ3MgPSB2bXhfc3luY19kaXJ0eV9kZWJ1Z19yZWdzLAogCS5j
YWNoZV9yZWcgPSB2bXhfY2FjaGVfcmVnLApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRp
b25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRp
b24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
