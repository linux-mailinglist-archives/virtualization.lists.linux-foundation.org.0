Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7E1155DFF
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 19:26:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 09B1E86E42;
	Fri,  7 Feb 2020 18:26:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UrZAo5WgRzkr; Fri,  7 Feb 2020 18:26:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C900086E89;
	Fri,  7 Feb 2020 18:26:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AEC3DC1D81;
	Fri,  7 Feb 2020 18:26:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A236FC1D8A
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8BF3386E4F
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:26:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ychftqesvFln
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:26:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id EFF3986E5A
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:57 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 63A26305D3D4; Fri,  7 Feb 2020 20:16:39 +0200 (EET)
Received: from host.bbu.bitdefender.biz (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 537C93052074;
 Fri,  7 Feb 2020 20:16:39 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v7 17/78] KVM: svm: pass struct kvm_vcpu to
 set_msr_interception()
Date: Fri,  7 Feb 2020 20:15:35 +0200
Message-Id: <20200207181636.1065-18-alazar@bitdefender.com>
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

RnJvbTogTmljdciZb3IgQ8OuyJt1IDxuY2l0dUBiaXRkZWZlbmRlci5jb20+CgpUaGlzIGlzIG5l
ZWRlZCBpbiBvcmRlciB0byBoYW5kbGUgY2xpZW50cyBjb250cm9sbGluZyB0aGUgTVNSIHJlbGF0
ZWQKVk0tZXhpdHMuCgpTaWduZWQtb2ZmLWJ5OiBOaWN1yJlvciBDw67Im3UgPG5jaXR1QGJpdGRl
ZmVuZGVyLmNvbT4KU2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVm
ZW5kZXIuY29tPgotLS0KIGFyY2gveDg2L2t2bS9zdm0uYyB8IDI3ICsrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9zdm0uYyBiL2FyY2gveDg2L2t2bS9zdm0u
YwppbmRleCAwMDIxZDhjMmZlY2EuLjE3NGNlZDYzM2I2MCAxMDA2NDQKLS0tIGEvYXJjaC94ODYv
a3ZtL3N2bS5jCisrKyBiL2FyY2gveDg2L2t2bS9zdm0uYwpAQCAtMTA3Nyw3ICsxMDc3LDggQEAg
c3RhdGljIGJvb2wgbXNyX3dyaXRlX2ludGVyY2VwdGVkKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwg
dW5zaWduZWQgbXNyKQogCXJldHVybiAhIXRlc3RfYml0KGJpdF93cml0ZSwgICZ0bXApOwogfQog
Ci1zdGF0aWMgdm9pZCBzZXRfbXNyX2ludGVyY2VwdGlvbih1MzIgKm1zcnBtLCB1bnNpZ25lZCBt
c3IsCitzdGF0aWMgdm9pZCBzZXRfbXNyX2ludGVyY2VwdGlvbihzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsCisJCQkJIHUzMiAqbXNycG0sIHVuc2lnbmVkIG1zciwKIAkJCQkgaW50IHR5cGUsIGJvb2wg
dmFsdWUpCiB7CiAJdTggYml0X3JlYWQsIGJpdF93cml0ZTsKQEAgLTExMTYsNyArMTExNyw3IEBA
IHN0YXRpYyB2b2lkIHN2bV92Y3B1X2luaXRfbXNycG0odTMyICptc3JwbSkKIAkJaWYgKCFkaXJl
Y3RfYWNjZXNzX21zcnNbaV0uYWx3YXlzKQogCQkJY29udGludWU7CiAKLQkJc2V0X21zcl9pbnRl
cmNlcHRpb24obXNycG0sIGRpcmVjdF9hY2Nlc3NfbXNyc1tpXS5pbmRleCwKKwkJc2V0X21zcl9p
bnRlcmNlcHRpb24oTlVMTCwgbXNycG0sIGRpcmVjdF9hY2Nlc3NfbXNyc1tpXS5pbmRleCwKIAkJ
CQkgICAgIE1TUl9UWVBFX1JXLCAxKTsKIAl9CiB9CkBAIC0xMTY5LDEzICsxMTcwLDEzIEBAIHN0
YXRpYyB2b2lkIHN2bV9lbmFibGVfbGJydihzdHJ1Y3QgdmNwdV9zdm0gKnN2bSkKIAl1MzIgKm1z
cnBtID0gc3ZtLT5tc3JwbTsKIAogCXN2bS0+dm1jYi0+Y29udHJvbC52aXJ0X2V4dCB8PSBMQlJf
Q1RMX0VOQUJMRV9NQVNLOwotCXNldF9tc3JfaW50ZXJjZXB0aW9uKG1zcnBtLCBNU1JfSUEzMl9M
QVNUQlJBTkNIRlJPTUlQLAorCXNldF9tc3JfaW50ZXJjZXB0aW9uKCZzdm0tPnZjcHUsIG1zcnBt
LCBNU1JfSUEzMl9MQVNUQlJBTkNIRlJPTUlQLAogCQkJICAgICBNU1JfVFlQRV9SVywgMSk7Ci0J
c2V0X21zcl9pbnRlcmNlcHRpb24obXNycG0sIE1TUl9JQTMyX0xBU1RCUkFOQ0hUT0lQLAorCXNl
dF9tc3JfaW50ZXJjZXB0aW9uKCZzdm0tPnZjcHUsIG1zcnBtLCBNU1JfSUEzMl9MQVNUQlJBTkNI
VE9JUCwKIAkJCSAgICAgTVNSX1RZUEVfUlcsIDEpOwotCXNldF9tc3JfaW50ZXJjZXB0aW9uKG1z
cnBtLCBNU1JfSUEzMl9MQVNUSU5URlJPTUlQLAorCXNldF9tc3JfaW50ZXJjZXB0aW9uKCZzdm0t
PnZjcHUsIG1zcnBtLCBNU1JfSUEzMl9MQVNUSU5URlJPTUlQLAogCQkJICAgICBNU1JfVFlQRV9S
VywgMSk7Ci0Jc2V0X21zcl9pbnRlcmNlcHRpb24obXNycG0sIE1TUl9JQTMyX0xBU1RJTlRUT0lQ
LAorCXNldF9tc3JfaW50ZXJjZXB0aW9uKCZzdm0tPnZjcHUsIG1zcnBtLCBNU1JfSUEzMl9MQVNU
SU5UVE9JUCwKIAkJCSAgICAgTVNSX1RZUEVfUlcsIDEpOwogfQogCkBAIC0xMTg0LDEzICsxMTg1
LDEzIEBAIHN0YXRpYyB2b2lkIHN2bV9kaXNhYmxlX2xicnYoc3RydWN0IHZjcHVfc3ZtICpzdm0p
CiAJdTMyICptc3JwbSA9IHN2bS0+bXNycG07CiAKIAlzdm0tPnZtY2ItPmNvbnRyb2wudmlydF9l
eHQgJj0gfkxCUl9DVExfRU5BQkxFX01BU0s7Ci0Jc2V0X21zcl9pbnRlcmNlcHRpb24obXNycG0s
IE1TUl9JQTMyX0xBU1RCUkFOQ0hGUk9NSVAsCisJc2V0X21zcl9pbnRlcmNlcHRpb24oJnN2bS0+
dmNwdSwgbXNycG0sIE1TUl9JQTMyX0xBU1RCUkFOQ0hGUk9NSVAsCiAJCQkgICAgIE1TUl9UWVBF
X1JXLCAwKTsKLQlzZXRfbXNyX2ludGVyY2VwdGlvbihtc3JwbSwgTVNSX0lBMzJfTEFTVEJSQU5D
SFRPSVAsCisJc2V0X21zcl9pbnRlcmNlcHRpb24oJnN2bS0+dmNwdSwgbXNycG0sIE1TUl9JQTMy
X0xBU1RCUkFOQ0hUT0lQLAogCQkJICAgICBNU1JfVFlQRV9SVywgMCk7Ci0Jc2V0X21zcl9pbnRl
cmNlcHRpb24obXNycG0sIE1TUl9JQTMyX0xBU1RJTlRGUk9NSVAsCisJc2V0X21zcl9pbnRlcmNl
cHRpb24oJnN2bS0+dmNwdSwgbXNycG0sIE1TUl9JQTMyX0xBU1RJTlRGUk9NSVAsCiAJCQkgICAg
IE1TUl9UWVBFX1JXLCAwKTsKLQlzZXRfbXNyX2ludGVyY2VwdGlvbihtc3JwbSwgTVNSX0lBMzJf
TEFTVElOVFRPSVAsCisJc2V0X21zcl9pbnRlcmNlcHRpb24oJnN2bS0+dmNwdSwgbXNycG0sIE1T
Ul9JQTMyX0xBU1RJTlRUT0lQLAogCQkJICAgICBNU1JfVFlQRV9SVywgMCk7CiB9CiAKQEAgLTQz
MjcsNyArNDMyOCw3IEBAIHN0YXRpYyBpbnQgc3ZtX3NldF9tc3Ioc3RydWN0IGt2bV92Y3B1ICp2
Y3B1LCBzdHJ1Y3QgbXNyX2RhdGEgKm1zcikKIAkJICogV2UgdXBkYXRlIHRoZSBMMSBNU1IgYml0
IGFzIHdlbGwgc2luY2UgaXQgd2lsbCBlbmQgdXAKIAkJICogdG91Y2hpbmcgdGhlIE1TUiBhbnl3
YXkgbm93LgogCQkgKi8KLQkJc2V0X21zcl9pbnRlcmNlcHRpb24oc3ZtLT5tc3JwbSwgTVNSX0lB
MzJfU1BFQ19DVFJMLAorCQlzZXRfbXNyX2ludGVyY2VwdGlvbih2Y3B1LCBzdm0tPm1zcnBtLCBN
U1JfSUEzMl9TUEVDX0NUUkwsCiAJCQkJICAgICBNU1JfVFlQRV9SVywgMSk7CiAJCWJyZWFrOwog
CWNhc2UgTVNSX0lBMzJfUFJFRF9DTUQ6CkBAIC00MzQ0LDcgKzQzNDUsOSBAQCBzdGF0aWMgaW50
IHN2bV9zZXRfbXNyKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IG1zcl9kYXRhICptc3Ip
CiAJCXdybXNybChNU1JfSUEzMl9QUkVEX0NNRCwgUFJFRF9DTURfSUJQQik7CiAJCWlmIChpc19n
dWVzdF9tb2RlKHZjcHUpKQogCQkJYnJlYWs7Ci0JCXNldF9tc3JfaW50ZXJjZXB0aW9uKHN2bS0+
bXNycG0sIE1TUl9JQTMyX1BSRURfQ01ELAorCQlzZXRfbXNyX2ludGVyY2VwdGlvbih2Y3B1LCBz
dm0tPm1zcnBtLCBNU1JfSUEzMl9QUkVEX0NNRCwKKwkJCQkgICAgIE1TUl9UWVBFX1IsIDApOwor
CQlzZXRfbXNyX2ludGVyY2VwdGlvbih2Y3B1LCBzdm0tPm1zcnBtLCBNU1JfSUEzMl9QUkVEX0NN
RCwKIAkJCQkgICAgIE1TUl9UWVBFX1csIDEpOwogCQlicmVhazsKIAljYXNlIE1TUl9BTUQ2NF9W
SVJUX1NQRUNfQ1RSTDoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxp
bnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWls
bWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
