Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3110F155E0A
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 19:26:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C5FB3869F5;
	Fri,  7 Feb 2020 18:26:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6YMJGZy7gSvb; Fri,  7 Feb 2020 18:26:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 01FD286A78;
	Fri,  7 Feb 2020 18:26:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E0155C1D81;
	Fri,  7 Feb 2020 18:26:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 72F8AC013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6FDFA86E55
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RoY7J5HFocGH
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id F21FC86E32
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:55 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 346C1305D3CE; Fri,  7 Feb 2020 20:16:39 +0200 (EET)
Received: from host.bbu.bitdefender.biz (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 29EB6305206E;
 Fri,  7 Feb 2020 20:16:39 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v7 11/78] KVM: x86: add .control_cr3_intercept() to struct
 kvm_x86_ops
Date: Fri,  7 Feb 2020 20:15:29 +0200
Message-Id: <20200207181636.1065-12-alazar@bitdefender.com>
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

VGhpcyBmdW5jdGlvbiBpcyBuZWVkZWQgZm9yIHRoZSBLVk1JX1ZDUFVfQ09OVFJPTF9DUiBjb21t
YW5kLgoKQ28tZGV2ZWxvcGVkLWJ5OiBOaWN1yJlvciBDw67Im3UgPG5jaXR1QGJpdGRlZmVuZGVy
LmNvbT4KU2lnbmVkLW9mZi1ieTogTmljdciZb3IgQ8OuyJt1IDxuY2l0dUBiaXRkZWZlbmRlci5j
b20+ClNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJpdGRlZmVuZGVyLmNv
bT4KLS0tCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIHwgIDYgKysrKysrCiBhcmNo
L3g4Ni9rdm0vc3ZtLmMgICAgICAgICAgICAgIHwgMTQgKysrKysrKysrKysrKysKIGFyY2gveDg2
L2t2bS92bXgvdm14LmMgICAgICAgICAgfCAyNiArKysrKysrKysrKysrKysrKysrKy0tLS0tLQog
MyBmaWxlcyBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggYi9hcmNoL3g4Ni9pbmNsdWRl
L2FzbS9rdm1faG9zdC5oCmluZGV4IGQyNzkxOTVkYWM5Ny4uOTAzMmM5OTZlYmRiIDEwMDY0NAot
LS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCisrKyBiL2FyY2gveDg2L2luY2x1
ZGUvYXNtL2t2bV9ob3N0LmgKQEAgLTEzNCw2ICsxMzQsMTAgQEAgc3RhdGljIGlubGluZSBnZm5f
dCBnZm5fdG9faW5kZXgoZ2ZuX3QgZ2ZuLCBnZm5fdCBiYXNlX2dmbiwgaW50IGxldmVsKQogI2Rl
ZmluZSBLVk1fTlJfRklYRURfTVRSUl9SRUdJT04gODgKICNkZWZpbmUgS1ZNX05SX1ZBUl9NVFJS
IDgKIAorI2RlZmluZSBDUl9UWVBFX1IJMQorI2RlZmluZSBDUl9UWVBFX1cJMgorI2RlZmluZSBD
Ul9UWVBFX1JXCTMKKwogI2RlZmluZSBBU1lOQ19QRl9QRVJfVkNQVSA2NAogCiBlbnVtIGt2bV9y
ZWcgewpAQCAtMTA2NCw2ICsxMDY4LDggQEAgc3RydWN0IGt2bV94ODZfb3BzIHsKIAl2b2lkICgq
c2V0X2NyMCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIGNyMCk7CiAJdm9p
ZCAoKnNldF9jcjMpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbG9uZyBjcjMpOwog
CWludCAoKnNldF9jcjQpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbG9uZyBjcjQp
OworCXZvaWQgKCpjb250cm9sX2NyM19pbnRlcmNlcHQpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwg
aW50IHR5cGUsCisJCQkJICAgICAgYm9vbCBlbmFibGUpOwogCXZvaWQgKCpzZXRfZWZlcikoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1LCB1NjQgZWZlcik7CiAJdm9pZCAoKmdldF9pZHQpKHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSwgc3RydWN0IGRlc2NfcHRyICpkdCk7CiAJdm9pZCAoKnNldF9pZHQpKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGRlc2NfcHRyICpkdCk7CmRpZmYgLS1naXQgYS9h
cmNoL3g4Ni9rdm0vc3ZtLmMgYi9hcmNoL3g4Ni9rdm0vc3ZtLmMKaW5kZXggZGYzNGFiMGRhNGZm
Li5iNjA4MWFmZWM5MjYgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS9zdm0uYworKysgYi9hcmNo
L3g4Ni9rdm0vc3ZtLmMKQEAgLTcyNTYsNiArNzI1NiwxOSBAQCBzdGF0aWMgaW5saW5lIGJvb2wg
c3ZtX2JwX2ludGVyY2VwdGVkKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIAlyZXR1cm4gZ2V0X2V4
Y2VwdGlvbl9pbnRlcmNlcHQoc3ZtLCBCUF9WRUNUT1IpOwogfQogCitzdGF0aWMgdm9pZCBzdm1f
Y29udHJvbF9jcjNfaW50ZXJjZXB0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgaW50IHR5cGUsCisJ
CQkJICAgICAgYm9vbCBlbmFibGUpCit7CisJc3RydWN0IHZjcHVfc3ZtICpzdm0gPSB0b19zdm0o
dmNwdSk7CisKKwlpZiAodHlwZSAmIENSX1RZUEVfUikKKwkJZW5hYmxlID8gc2V0X2NyX2ludGVy
Y2VwdChzdm0sIElOVEVSQ0VQVF9DUjNfUkVBRCkgOgorCQkJIGNscl9jcl9pbnRlcmNlcHQoc3Zt
LCBJTlRFUkNFUFRfQ1IzX1JFQUQpOworCWlmICh0eXBlICYgQ1JfVFlQRV9XKQorCQllbmFibGUg
PyBzZXRfY3JfaW50ZXJjZXB0KHN2bSwgSU5URVJDRVBUX0NSM19XUklURSkgOgorCQkJIGNscl9j
cl9pbnRlcmNlcHQoc3ZtLCBJTlRFUkNFUFRfQ1IzX1dSSVRFKTsKK30KKwogc3RhdGljIHN0cnVj
dCBrdm1feDg2X29wcyBzdm1feDg2X29wcyBfX3JvX2FmdGVyX2luaXQgPSB7CiAJLmNwdV9oYXNf
a3ZtX3N1cHBvcnQgPSBoYXNfc3ZtLAogCS5kaXNhYmxlZF9ieV9iaW9zID0gaXNfZGlzYWJsZWQs
CkBAIC03Mjk3LDYgKzczMTAsNyBAQCBzdGF0aWMgc3RydWN0IGt2bV94ODZfb3BzIHN2bV94ODZf
b3BzIF9fcm9fYWZ0ZXJfaW5pdCA9IHsKIAkuc2V0X2NyMCA9IHN2bV9zZXRfY3IwLAogCS5zZXRf
Y3IzID0gc3ZtX3NldF9jcjMsCiAJLnNldF9jcjQgPSBzdm1fc2V0X2NyNCwKKwkuY29udHJvbF9j
cjNfaW50ZXJjZXB0ID0gc3ZtX2NvbnRyb2xfY3IzX2ludGVyY2VwdCwKIAkuc2V0X2VmZXIgPSBz
dm1fc2V0X2VmZXIsCiAJLmdldF9pZHQgPSBzdm1fZ2V0X2lkdCwKIAkuc2V0X2lkdCA9IHN2bV9z
ZXRfaWR0LApkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3ZteC92bXguYyBiL2FyY2gveDg2L2t2
bS92bXgvdm14LmMKaW5kZXggMGQ3Y2E3MGIzMTBlLi40YjZlZGI2OGU5ZTAgMTAwNjQ0Ci0tLSBh
L2FyY2gveDg2L2t2bS92bXgvdm14LmMKKysrIGIvYXJjaC94ODYva3ZtL3ZteC92bXguYwpAQCAt
MjkwMCwyNCArMjkwMCwzNyBAQCB2b2lkIGVwdF9zYXZlX3BkcHRycyhzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUpCiAJa3ZtX3JlZ2lzdGVyX21hcmtfZGlydHkodmNwdSwgVkNQVV9FWFJFR19QRFBUUik7
CiB9CiAKK3N0YXRpYyB2b2lkIHZteF9jb250cm9sX2NyM19pbnRlcmNlcHQoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LCBpbnQgdHlwZSwKKwkJCQkgICAgICBib29sIGVuYWJsZSkKK3sKKwlzdHJ1Y3Qg
dmNwdV92bXggKnZteCA9IHRvX3ZteCh2Y3B1KTsKKwl1MzIgY3IzX2V4ZWNfY29udHJvbCA9IDA7
CisKKwlpZiAodHlwZSAmIENSX1RZUEVfUikKKwkJY3IzX2V4ZWNfY29udHJvbCB8PSBDUFVfQkFT
RURfQ1IzX1NUT1JFX0VYSVRJTkc7CisJaWYgKHR5cGUgJiBDUl9UWVBFX1cpCisJCWNyM19leGVj
X2NvbnRyb2wgfD0gQ1BVX0JBU0VEX0NSM19MT0FEX0VYSVRJTkc7CisKKwlpZiAoZW5hYmxlKQor
CQlleGVjX2NvbnRyb2xzX3NldGJpdCh2bXgsIGNyM19leGVjX2NvbnRyb2wpOworCWVsc2UKKwkJ
ZXhlY19jb250cm9sc19jbGVhcmJpdCh2bXgsIGNyM19leGVjX2NvbnRyb2wpOworfQorCiBzdGF0
aWMgdm9pZCBlcHRfdXBkYXRlX3BhZ2luZ19tb2RlX2NyMCh1bnNpZ25lZCBsb25nICpod19jcjAs
CiAJCQkJCXVuc2lnbmVkIGxvbmcgY3IwLAogCQkJCQlzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiB7
Ci0Jc3RydWN0IHZjcHVfdm14ICp2bXggPSB0b192bXgodmNwdSk7Ci0KIAlpZiAoIWt2bV9yZWdp
c3Rlcl9pc19hdmFpbGFibGUodmNwdSwgVkNQVV9FWFJFR19DUjMpKQogCQl2bXhfY2FjaGVfcmVn
KHZjcHUsIFZDUFVfRVhSRUdfQ1IzKTsKIAlpZiAoIShjcjAgJiBYODZfQ1IwX1BHKSkgewogCQkv
KiBGcm9tIHBhZ2luZy9zdGFydGluZyB0byBub25wYWdpbmcgKi8KLQkJZXhlY19jb250cm9sc19z
ZXRiaXQodm14LCBDUFVfQkFTRURfQ1IzX0xPQURfRVhJVElORyB8Ci0JCQkJCSAgQ1BVX0JBU0VE
X0NSM19TVE9SRV9FWElUSU5HKTsKKwkJdm14X2NvbnRyb2xfY3IzX2ludGVyY2VwdCh2Y3B1LCBD
Ul9UWVBFX1JXLCB0cnVlKTsKIAkJdmNwdS0+YXJjaC5jcjAgPSBjcjA7CiAJCXZteF9zZXRfY3I0
KHZjcHUsIGt2bV9yZWFkX2NyNCh2Y3B1KSk7CiAJfSBlbHNlIGlmICghaXNfcGFnaW5nKHZjcHUp
KSB7CiAJCS8qIEZyb20gbm9ucGFnaW5nIHRvIHBhZ2luZyAqLwotCQlleGVjX2NvbnRyb2xzX2Ns
ZWFyYml0KHZteCwgQ1BVX0JBU0VEX0NSM19MT0FEX0VYSVRJTkcgfAotCQkJCQkgICAgQ1BVX0JB
U0VEX0NSM19TVE9SRV9FWElUSU5HKTsKKwkJdm14X2NvbnRyb2xfY3IzX2ludGVyY2VwdCh2Y3B1
LCBDUl9UWVBFX1JXLCBmYWxzZSk7CiAJCXZjcHUtPmFyY2guY3IwID0gY3IwOwogCQl2bXhfc2V0
X2NyNCh2Y3B1LCBrdm1fcmVhZF9jcjQodmNwdSkpOwogCX0KQEAgLTc4MDEsNiArNzgxNCw3IEBA
IHN0YXRpYyBzdHJ1Y3Qga3ZtX3g4Nl9vcHMgdm14X3g4Nl9vcHMgX19yb19hZnRlcl9pbml0ID0g
ewogCS5zZXRfY3IwID0gdm14X3NldF9jcjAsCiAJLnNldF9jcjMgPSB2bXhfc2V0X2NyMywKIAku
c2V0X2NyNCA9IHZteF9zZXRfY3I0LAorCS5jb250cm9sX2NyM19pbnRlcmNlcHQgPSB2bXhfY29u
dHJvbF9jcjNfaW50ZXJjZXB0LAogCS5zZXRfZWZlciA9IHZteF9zZXRfZWZlciwKIAkuZ2V0X2lk
dCA9IHZteF9nZXRfaWR0LAogCS5zZXRfaWR0ID0gdm14X3NldF9pZHQsCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcg
bGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
