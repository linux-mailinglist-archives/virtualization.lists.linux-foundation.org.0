Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C18A5228B35
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 23:26:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 78BFE86BAE;
	Tue, 21 Jul 2020 21:26:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3FqXrENAolQr; Tue, 21 Jul 2020 21:26:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 691AF86C5D;
	Tue, 21 Jul 2020 21:26:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3A1C6C088E;
	Tue, 21 Jul 2020 21:26:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC2A0C088E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CC37D22786
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:26:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fdi6DcHoFz5p
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:26:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by silver.osuosl.org (Postfix) with ESMTPS id E382E22798
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:56 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 73828305D767; Wed, 22 Jul 2020 00:09:21 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 53ADF304FA14;
 Wed, 22 Jul 2020 00:09:21 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v9 18/84] KVM: svm: pass struct kvm_vcpu to
 set_msr_interception()
Date: Wed, 22 Jul 2020 00:08:16 +0300
Message-Id: <20200721210922.7646-19-alazar@bitdefender.com>
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

RnJvbTogTmljdciZb3IgQ8OuyJt1IDxuY2l0dUBiaXRkZWZlbmRlci5jb20+CgpUaGlzIGlzIHBy
ZXBhcmF0b3J5IHBhdGNoIHRvIG1lZGlhdGUgdGhlIE1TUiBpbnRlcmNlcHRpb24gYmV0d2Vlbgp0
aGUgaW50cm9zcGVjdGlvbiB0b29sIGFuZCB0aGUgZGV2aWNlIG1hbmFnZXIgKG9uZSBtdXN0IG5v
dCBkaXNhYmxlCnRoZSBpbnRlcmNlcHRpb24gaWYgdGhlIG90aGVyIG9uZSBoYXMgZW5hYmxlZCB0
aGUgaW50ZXJjZXB0aW9uKS4KClBhc3NpbmcgTlVMTCBkdXJpbmcgaW5pdGlhbGl6YXRpb24gaXMg
T0sgYmVjYXVzZSBhIHZDUFUgY2FuIGJlCmludHJvc3BlY3RlZCBvbmx5IGFmdGVyIGluaXRpYWxp
emF0aW9uLgoKU2lnbmVkLW9mZi1ieTogTmljdciZb3IgQ8OuyJt1IDxuY2l0dUBiaXRkZWZlbmRl
ci5jb20+ClNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJpdGRlZmVuZGVy
LmNvbT4KLS0tCiBhcmNoL3g4Ni9rdm0vc3ZtL3N2bS5jIHwgMjcgKysrKysrKysrKysrKystLS0t
LS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3N2bS9zdm0uYyBiL2FyY2gveDg2L2t2bS9z
dm0vc3ZtLmMKaW5kZXggZTE2YmU4MGVkZDdlLi5kZmExYTZlNzRiZjcgMTAwNjQ0Ci0tLSBhL2Fy
Y2gveDg2L2t2bS9zdm0vc3ZtLmMKKysrIGIvYXJjaC94ODYva3ZtL3N2bS9zdm0uYwpAQCAtNTgz
LDcgKzU4Myw4IEBAIHN0YXRpYyBib29sIG1zcl93cml0ZV9pbnRlcmNlcHRlZChzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUsIHVuc2lnbmVkIG1zcikKIAlyZXR1cm4gISF0ZXN0X2JpdChiaXRfd3JpdGUs
ICAmdG1wKTsKIH0KIAotc3RhdGljIHZvaWQgc2V0X21zcl9pbnRlcmNlcHRpb24odTMyICptc3Jw
bSwgdW5zaWduZWQgbXNyLAorc3RhdGljIHZvaWQgc2V0X21zcl9pbnRlcmNlcHRpb24oc3RydWN0
IGt2bV92Y3B1ICp2Y3B1LAorCQkJCSB1MzIgKm1zcnBtLCB1bnNpZ25lZCBtc3IsCiAJCQkJIGlu
dCB0eXBlLCBib29sIHZhbHVlKQogewogCXU4IGJpdF9yZWFkLCBiaXRfd3JpdGU7CkBAIC02MjEs
NyArNjIyLDcgQEAgc3RhdGljIHZvaWQgc3ZtX3ZjcHVfaW5pdF9tc3JwbSh1MzIgKm1zcnBtKQog
CQlpZiAoIWRpcmVjdF9hY2Nlc3NfbXNyc1tpXS5hbHdheXMpCiAJCQljb250aW51ZTsKIAotCQlz
ZXRfbXNyX2ludGVyY2VwdGlvbihtc3JwbSwgZGlyZWN0X2FjY2Vzc19tc3JzW2ldLmluZGV4LAor
CQlzZXRfbXNyX2ludGVyY2VwdGlvbihOVUxMLCBtc3JwbSwgZGlyZWN0X2FjY2Vzc19tc3JzW2ld
LmluZGV4LAogCQkJCSAgICAgTVNSX1RZUEVfUlcsIDEpOwogCX0KIH0KQEAgLTY3NCwxMyArNjc1
LDEzIEBAIHN0YXRpYyB2b2lkIHN2bV9lbmFibGVfbGJydihzdHJ1Y3QgdmNwdV9zdm0gKnN2bSkK
IAl1MzIgKm1zcnBtID0gc3ZtLT5tc3JwbTsKIAogCXN2bS0+dm1jYi0+Y29udHJvbC52aXJ0X2V4
dCB8PSBMQlJfQ1RMX0VOQUJMRV9NQVNLOwotCXNldF9tc3JfaW50ZXJjZXB0aW9uKG1zcnBtLCBN
U1JfSUEzMl9MQVNUQlJBTkNIRlJPTUlQLAorCXNldF9tc3JfaW50ZXJjZXB0aW9uKCZzdm0tPnZj
cHUsIG1zcnBtLCBNU1JfSUEzMl9MQVNUQlJBTkNIRlJPTUlQLAogCQkJICAgICBNU1JfVFlQRV9S
VywgMSk7Ci0Jc2V0X21zcl9pbnRlcmNlcHRpb24obXNycG0sIE1TUl9JQTMyX0xBU1RCUkFOQ0hU
T0lQLAorCXNldF9tc3JfaW50ZXJjZXB0aW9uKCZzdm0tPnZjcHUsIG1zcnBtLCBNU1JfSUEzMl9M
QVNUQlJBTkNIVE9JUCwKIAkJCSAgICAgTVNSX1RZUEVfUlcsIDEpOwotCXNldF9tc3JfaW50ZXJj
ZXB0aW9uKG1zcnBtLCBNU1JfSUEzMl9MQVNUSU5URlJPTUlQLAorCXNldF9tc3JfaW50ZXJjZXB0
aW9uKCZzdm0tPnZjcHUsIG1zcnBtLCBNU1JfSUEzMl9MQVNUSU5URlJPTUlQLAogCQkJICAgICBN
U1JfVFlQRV9SVywgMSk7Ci0Jc2V0X21zcl9pbnRlcmNlcHRpb24obXNycG0sIE1TUl9JQTMyX0xB
U1RJTlRUT0lQLAorCXNldF9tc3JfaW50ZXJjZXB0aW9uKCZzdm0tPnZjcHUsIG1zcnBtLCBNU1Jf
SUEzMl9MQVNUSU5UVE9JUCwKIAkJCSAgICAgTVNSX1RZUEVfUlcsIDEpOwogfQogCkBAIC02ODks
MTMgKzY5MCwxMyBAQCBzdGF0aWMgdm9pZCBzdm1fZGlzYWJsZV9sYnJ2KHN0cnVjdCB2Y3B1X3N2
bSAqc3ZtKQogCXUzMiAqbXNycG0gPSBzdm0tPm1zcnBtOwogCiAJc3ZtLT52bWNiLT5jb250cm9s
LnZpcnRfZXh0ICY9IH5MQlJfQ1RMX0VOQUJMRV9NQVNLOwotCXNldF9tc3JfaW50ZXJjZXB0aW9u
KG1zcnBtLCBNU1JfSUEzMl9MQVNUQlJBTkNIRlJPTUlQLAorCXNldF9tc3JfaW50ZXJjZXB0aW9u
KCZzdm0tPnZjcHUsIG1zcnBtLCBNU1JfSUEzMl9MQVNUQlJBTkNIRlJPTUlQLAogCQkJICAgICBN
U1JfVFlQRV9SVywgMCk7Ci0Jc2V0X21zcl9pbnRlcmNlcHRpb24obXNycG0sIE1TUl9JQTMyX0xB
U1RCUkFOQ0hUT0lQLAorCXNldF9tc3JfaW50ZXJjZXB0aW9uKCZzdm0tPnZjcHUsIG1zcnBtLCBN
U1JfSUEzMl9MQVNUQlJBTkNIVE9JUCwKIAkJCSAgICAgTVNSX1RZUEVfUlcsIDApOwotCXNldF9t
c3JfaW50ZXJjZXB0aW9uKG1zcnBtLCBNU1JfSUEzMl9MQVNUSU5URlJPTUlQLAorCXNldF9tc3Jf
aW50ZXJjZXB0aW9uKCZzdm0tPnZjcHUsIG1zcnBtLCBNU1JfSUEzMl9MQVNUSU5URlJPTUlQLAog
CQkJICAgICBNU1JfVFlQRV9SVywgMCk7Ci0Jc2V0X21zcl9pbnRlcmNlcHRpb24obXNycG0sIE1T
Ul9JQTMyX0xBU1RJTlRUT0lQLAorCXNldF9tc3JfaW50ZXJjZXB0aW9uKCZzdm0tPnZjcHUsIG1z
cnBtLCBNU1JfSUEzMl9MQVNUSU5UVE9JUCwKIAkJCSAgICAgTVNSX1RZUEVfUlcsIDApOwogfQog
CkBAIC0yNjI5LDcgKzI2MzAsNyBAQCBzdGF0aWMgaW50IHN2bV9zZXRfbXNyKHN0cnVjdCBrdm1f
dmNwdSAqdmNwdSwgc3RydWN0IG1zcl9kYXRhICptc3IpCiAJCSAqIFdlIHVwZGF0ZSB0aGUgTDEg
TVNSIGJpdCBhcyB3ZWxsIHNpbmNlIGl0IHdpbGwgZW5kIHVwCiAJCSAqIHRvdWNoaW5nIHRoZSBN
U1IgYW55d2F5IG5vdy4KIAkJICovCi0JCXNldF9tc3JfaW50ZXJjZXB0aW9uKHN2bS0+bXNycG0s
IE1TUl9JQTMyX1NQRUNfQ1RSTCwKKwkJc2V0X21zcl9pbnRlcmNlcHRpb24oJnN2bS0+dmNwdSwg
c3ZtLT5tc3JwbSwgTVNSX0lBMzJfU1BFQ19DVFJMLAogCQkJCSAgICAgTVNSX1RZUEVfUlcsIDEp
OwogCQlicmVhazsKIAljYXNlIE1TUl9JQTMyX1BSRURfQ01EOgpAQCAtMjY0NSw5ICsyNjQ2LDkg
QEAgc3RhdGljIGludCBzdm1fc2V0X21zcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBt
c3JfZGF0YSAqbXNyKQogCQkJYnJlYWs7CiAKIAkJd3Jtc3JsKE1TUl9JQTMyX1BSRURfQ01ELCBQ
UkVEX0NNRF9JQlBCKTsKLQkJc2V0X21zcl9pbnRlcmNlcHRpb24oc3ZtLT5tc3JwbSwgTVNSX0lB
MzJfUFJFRF9DTUQsCisJCXNldF9tc3JfaW50ZXJjZXB0aW9uKCZzdm0tPnZjcHUsIHN2bS0+bXNy
cG0sIE1TUl9JQTMyX1BSRURfQ01ELAogCQkJCSAgICAgTVNSX1RZUEVfUiwgMCk7Ci0JCXNldF9t
c3JfaW50ZXJjZXB0aW9uKHN2bS0+bXNycG0sIE1TUl9JQTMyX1BSRURfQ01ELAorCQlzZXRfbXNy
X2ludGVyY2VwdGlvbigmc3ZtLT52Y3B1LCBzdm0tPm1zcnBtLCBNU1JfSUEzMl9QUkVEX0NNRCwK
IAkJCQkgICAgIE1TUl9UWVBFX1csIDEpOwogCQlicmVhazsKIAljYXNlIE1TUl9BTUQ2NF9WSVJU
X1NQRUNfQ1RSTDoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4
LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
