Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id F14CD228A8F
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 23:16:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AD5B586B89;
	Tue, 21 Jul 2020 21:16:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UMnMm_3zhB8V; Tue, 21 Jul 2020 21:16:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1FC4186B96;
	Tue, 21 Jul 2020 21:16:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C59C3C08A2;
	Tue, 21 Jul 2020 21:16:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17697C088E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 13D42886E8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zCuqru7CpXvs
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F332C886A7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:56 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 51533305D766; Wed, 22 Jul 2020 00:09:21 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 2FB35304FA13;
 Wed, 22 Jul 2020 00:09:21 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v9 17/84] KVM: x86: use MSR_TYPE_R,
 MSR_TYPE_W and MSR_TYPE_RW with AMD
Date: Wed, 22 Jul 2020 00:08:15 +0300
Message-Id: <20200721210922.7646-18-alazar@bitdefender.com>
In-Reply-To: <20200721210922.7646-1-alazar@bitdefender.com>
References: <20200721210922.7646-1-alazar@bitdefender.com>
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

RnJvbTogTmljdciZb3IgQ8OuyJt1IDxuY2l0dUBiaXRkZWZlbmRlci5jb20+CgpUaGlzIGlzIGEg
cHJlcGFyYXRvcnkgcGF0Y2ggaW4gb3JkZXIgdG8gdXNlIGEgY29tbW9uIGludGVyZmFjZSB0bwpl
bmFibGUvZGlzYWJsZSB0aGUgTVNSIGludGVyY2VwdGlvbi4KClNpZ25lZC1vZmYtYnk6IE5pY3XI
mW9yIEPDrsibdSA8bmNpdHVAYml0ZGVmZW5kZXIuY29tPgpTaWduZWQtb2ZmLWJ5OiBBZGFsYmVy
dCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+Ci0tLQogYXJjaC94ODYvaW5jbHVkZS9h
c20va3ZtX2hvc3QuaCB8ICA0ICsrKwogYXJjaC94ODYva3ZtL3N2bS9zdm0uYyAgICAgICAgICB8
IDQzICsrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLQogYXJjaC94ODYva3ZtL3ZteC92
bXguaCAgICAgICAgICB8ICA0IC0tLQogMyBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCsp
LCAxOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1f
aG9zdC5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAppbmRleCA2YmU4MzJiYTlj
OTcuLmEzMjMwYWIzNzdkYiAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hv
c3QuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCkBAIC0xNDAsNiArMTQw
LDEwIEBAIHN0YXRpYyBpbmxpbmUgZ2ZuX3QgZ2ZuX3RvX2luZGV4KGdmbl90IGdmbiwgZ2ZuX3Qg
YmFzZV9nZm4sIGludCBsZXZlbCkKICNkZWZpbmUgQ1JfVFlQRV9XCTIKICNkZWZpbmUgQ1JfVFlQ
RV9SVwkzCiAKKyNkZWZpbmUgTVNSX1RZUEVfUgkxCisjZGVmaW5lIE1TUl9UWVBFX1cJMgorI2Rl
ZmluZSBNU1JfVFlQRV9SVwkzCisKICNkZWZpbmUgQVNZTkNfUEZfUEVSX1ZDUFUgNjQKIAogZW51
bSBrdm1fcmVnIHsKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9zdm0vc3ZtLmMgYi9hcmNoL3g4
Ni9rdm0vc3ZtL3N2bS5jCmluZGV4IDRlNWIwNzYwNjg5MS4uZTE2YmU4MGVkZDdlIDEwMDY0NAot
LS0gYS9hcmNoL3g4Ni9rdm0vc3ZtL3N2bS5jCisrKyBiL2FyY2gveDg2L2t2bS9zdm0vc3ZtLmMK
QEAgLTU4NCw3ICs1ODQsNyBAQCBzdGF0aWMgYm9vbCBtc3Jfd3JpdGVfaW50ZXJjZXB0ZWQoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBtc3IpCiB9CiAKIHN0YXRpYyB2b2lkIHNldF9t
c3JfaW50ZXJjZXB0aW9uKHUzMiAqbXNycG0sIHVuc2lnbmVkIG1zciwKLQkJCQkgaW50IHJlYWQs
IGludCB3cml0ZSkKKwkJCQkgaW50IHR5cGUsIGJvb2wgdmFsdWUpCiB7CiAJdTggYml0X3JlYWQs
IGJpdF93cml0ZTsKIAl1bnNpZ25lZCBsb25nIHRtcDsKQEAgLTYwMyw4ICs2MDMsMTAgQEAgc3Rh
dGljIHZvaWQgc2V0X21zcl9pbnRlcmNlcHRpb24odTMyICptc3JwbSwgdW5zaWduZWQgbXNyLAog
CiAJQlVHX09OKG9mZnNldCA9PSBNU1JfSU5WQUxJRCk7CiAKLQlyZWFkICA/IGNsZWFyX2JpdChi
aXRfcmVhZCwgICZ0bXApIDogc2V0X2JpdChiaXRfcmVhZCwgICZ0bXApOwotCXdyaXRlID8gY2xl
YXJfYml0KGJpdF93cml0ZSwgJnRtcCkgOiBzZXRfYml0KGJpdF93cml0ZSwgJnRtcCk7CisJaWYg
KHR5cGUgJiBNU1JfVFlQRV9SKQorCQl2YWx1ZSA/IGNsZWFyX2JpdChiaXRfcmVhZCwgICZ0bXAp
IDogc2V0X2JpdChiaXRfcmVhZCwgICZ0bXApOworCWlmICh0eXBlICYgTVNSX1RZUEVfVykKKwkJ
dmFsdWUgPyBjbGVhcl9iaXQoYml0X3dyaXRlLCAmdG1wKSA6IHNldF9iaXQoYml0X3dyaXRlLCAm
dG1wKTsKIAogCW1zcnBtW29mZnNldF0gPSB0bXA7CiB9CkBAIC02MTksNyArNjIxLDggQEAgc3Rh
dGljIHZvaWQgc3ZtX3ZjcHVfaW5pdF9tc3JwbSh1MzIgKm1zcnBtKQogCQlpZiAoIWRpcmVjdF9h
Y2Nlc3NfbXNyc1tpXS5hbHdheXMpCiAJCQljb250aW51ZTsKIAotCQlzZXRfbXNyX2ludGVyY2Vw
dGlvbihtc3JwbSwgZGlyZWN0X2FjY2Vzc19tc3JzW2ldLmluZGV4LCAxLCAxKTsKKwkJc2V0X21z
cl9pbnRlcmNlcHRpb24obXNycG0sIGRpcmVjdF9hY2Nlc3NfbXNyc1tpXS5pbmRleCwKKwkJCQkg
ICAgIE1TUl9UWVBFX1JXLCAxKTsKIAl9CiB9CiAKQEAgLTY3MSwxMCArNjc0LDE0IEBAIHN0YXRp
YyB2b2lkIHN2bV9lbmFibGVfbGJydihzdHJ1Y3QgdmNwdV9zdm0gKnN2bSkKIAl1MzIgKm1zcnBt
ID0gc3ZtLT5tc3JwbTsKIAogCXN2bS0+dm1jYi0+Y29udHJvbC52aXJ0X2V4dCB8PSBMQlJfQ1RM
X0VOQUJMRV9NQVNLOwotCXNldF9tc3JfaW50ZXJjZXB0aW9uKG1zcnBtLCBNU1JfSUEzMl9MQVNU
QlJBTkNIRlJPTUlQLCAxLCAxKTsKLQlzZXRfbXNyX2ludGVyY2VwdGlvbihtc3JwbSwgTVNSX0lB
MzJfTEFTVEJSQU5DSFRPSVAsIDEsIDEpOwotCXNldF9tc3JfaW50ZXJjZXB0aW9uKG1zcnBtLCBN
U1JfSUEzMl9MQVNUSU5URlJPTUlQLCAxLCAxKTsKLQlzZXRfbXNyX2ludGVyY2VwdGlvbihtc3Jw
bSwgTVNSX0lBMzJfTEFTVElOVFRPSVAsIDEsIDEpOworCXNldF9tc3JfaW50ZXJjZXB0aW9uKG1z
cnBtLCBNU1JfSUEzMl9MQVNUQlJBTkNIRlJPTUlQLAorCQkJICAgICBNU1JfVFlQRV9SVywgMSk7
CisJc2V0X21zcl9pbnRlcmNlcHRpb24obXNycG0sIE1TUl9JQTMyX0xBU1RCUkFOQ0hUT0lQLAor
CQkJICAgICBNU1JfVFlQRV9SVywgMSk7CisJc2V0X21zcl9pbnRlcmNlcHRpb24obXNycG0sIE1T
Ul9JQTMyX0xBU1RJTlRGUk9NSVAsCisJCQkgICAgIE1TUl9UWVBFX1JXLCAxKTsKKwlzZXRfbXNy
X2ludGVyY2VwdGlvbihtc3JwbSwgTVNSX0lBMzJfTEFTVElOVFRPSVAsCisJCQkgICAgIE1TUl9U
WVBFX1JXLCAxKTsKIH0KIAogc3RhdGljIHZvaWQgc3ZtX2Rpc2FibGVfbGJydihzdHJ1Y3QgdmNw
dV9zdm0gKnN2bSkKQEAgLTY4MiwxMCArNjg5LDE0IEBAIHN0YXRpYyB2b2lkIHN2bV9kaXNhYmxl
X2xicnYoc3RydWN0IHZjcHVfc3ZtICpzdm0pCiAJdTMyICptc3JwbSA9IHN2bS0+bXNycG07CiAK
IAlzdm0tPnZtY2ItPmNvbnRyb2wudmlydF9leHQgJj0gfkxCUl9DVExfRU5BQkxFX01BU0s7Ci0J
c2V0X21zcl9pbnRlcmNlcHRpb24obXNycG0sIE1TUl9JQTMyX0xBU1RCUkFOQ0hGUk9NSVAsIDAs
IDApOwotCXNldF9tc3JfaW50ZXJjZXB0aW9uKG1zcnBtLCBNU1JfSUEzMl9MQVNUQlJBTkNIVE9J
UCwgMCwgMCk7Ci0Jc2V0X21zcl9pbnRlcmNlcHRpb24obXNycG0sIE1TUl9JQTMyX0xBU1RJTlRG
Uk9NSVAsIDAsIDApOwotCXNldF9tc3JfaW50ZXJjZXB0aW9uKG1zcnBtLCBNU1JfSUEzMl9MQVNU
SU5UVE9JUCwgMCwgMCk7CisJc2V0X21zcl9pbnRlcmNlcHRpb24obXNycG0sIE1TUl9JQTMyX0xB
U1RCUkFOQ0hGUk9NSVAsCisJCQkgICAgIE1TUl9UWVBFX1JXLCAwKTsKKwlzZXRfbXNyX2ludGVy
Y2VwdGlvbihtc3JwbSwgTVNSX0lBMzJfTEFTVEJSQU5DSFRPSVAsCisJCQkgICAgIE1TUl9UWVBF
X1JXLCAwKTsKKwlzZXRfbXNyX2ludGVyY2VwdGlvbihtc3JwbSwgTVNSX0lBMzJfTEFTVElOVEZS
T01JUCwKKwkJCSAgICAgTVNSX1RZUEVfUlcsIDApOworCXNldF9tc3JfaW50ZXJjZXB0aW9uKG1z
cnBtLCBNU1JfSUEzMl9MQVNUSU5UVE9JUCwKKwkJCSAgICAgTVNSX1RZUEVfUlcsIDApOwogfQog
CiB2b2lkIGRpc2FibGVfbm1pX3NpbmdsZXN0ZXAoc3RydWN0IHZjcHVfc3ZtICpzdm0pCkBAIC0y
NjE4LDcgKzI2MjksOCBAQCBzdGF0aWMgaW50IHN2bV9zZXRfbXNyKHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSwgc3RydWN0IG1zcl9kYXRhICptc3IpCiAJCSAqIFdlIHVwZGF0ZSB0aGUgTDEgTVNSIGJp
dCBhcyB3ZWxsIHNpbmNlIGl0IHdpbGwgZW5kIHVwCiAJCSAqIHRvdWNoaW5nIHRoZSBNU1IgYW55
d2F5IG5vdy4KIAkJICovCi0JCXNldF9tc3JfaW50ZXJjZXB0aW9uKHN2bS0+bXNycG0sIE1TUl9J
QTMyX1NQRUNfQ1RSTCwgMSwgMSk7CisJCXNldF9tc3JfaW50ZXJjZXB0aW9uKHN2bS0+bXNycG0s
IE1TUl9JQTMyX1NQRUNfQ1RSTCwKKwkJCQkgICAgIE1TUl9UWVBFX1JXLCAxKTsKIAkJYnJlYWs7
CiAJY2FzZSBNU1JfSUEzMl9QUkVEX0NNRDoKIAkJaWYgKCFtc3ItPmhvc3RfaW5pdGlhdGVkICYm
CkBAIC0yNjMzLDcgKzI2NDUsMTAgQEAgc3RhdGljIGludCBzdm1fc2V0X21zcihzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUsIHN0cnVjdCBtc3JfZGF0YSAqbXNyKQogCQkJYnJlYWs7CiAKIAkJd3Jtc3Js
KE1TUl9JQTMyX1BSRURfQ01ELCBQUkVEX0NNRF9JQlBCKTsKLQkJc2V0X21zcl9pbnRlcmNlcHRp
b24oc3ZtLT5tc3JwbSwgTVNSX0lBMzJfUFJFRF9DTUQsIDAsIDEpOworCQlzZXRfbXNyX2ludGVy
Y2VwdGlvbihzdm0tPm1zcnBtLCBNU1JfSUEzMl9QUkVEX0NNRCwKKwkJCQkgICAgIE1TUl9UWVBF
X1IsIDApOworCQlzZXRfbXNyX2ludGVyY2VwdGlvbihzdm0tPm1zcnBtLCBNU1JfSUEzMl9QUkVE
X0NNRCwKKwkJCQkgICAgIE1TUl9UWVBFX1csIDEpOwogCQlicmVhazsKIAljYXNlIE1TUl9BTUQ2
NF9WSVJUX1NQRUNfQ1RSTDoKIAkJaWYgKCFtc3ItPmhvc3RfaW5pdGlhdGVkICYmCmRpZmYgLS1n
aXQgYS9hcmNoL3g4Ni9rdm0vdm14L3ZteC5oIGIvYXJjaC94ODYva3ZtL3ZteC92bXguaAppbmRl
eCA2Mzk3OThlNGE2Y2EuLmFhMGM3ZmZkNTg4YiAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL3Zt
eC92bXguaAorKysgYi9hcmNoL3g4Ni9rdm0vdm14L3ZteC5oCkBAIC0xNCwxMCArMTQsNiBAQAog
CiBleHRlcm4gY29uc3QgdTMyIHZteF9tc3JfaW5kZXhbXTsKIAotI2RlZmluZSBNU1JfVFlQRV9S
CTEKLSNkZWZpbmUgTVNSX1RZUEVfVwkyCi0jZGVmaW5lIE1TUl9UWVBFX1JXCTMKLQogI2RlZmlu
ZSBYMkFQSUNfTVNSKHIpIChBUElDX0JBU0VfTVNSICsgKChyKSA+PiA0KSkKIAogI2lmZGVmIENP
TkZJR19YODZfNjQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4
LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
