Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DEE155DED
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 19:26:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B774286978;
	Fri,  7 Feb 2020 18:25:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iXv0tYYWty88; Fri,  7 Feb 2020 18:25:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B1E908692F;
	Fri,  7 Feb 2020 18:25:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 89B30C013E;
	Fri,  7 Feb 2020 18:25:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 98B60C013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9265F86916
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n17WkHxnPzkG
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:51 +0000 (UTC)
X-Greylist: delayed 00:09:10 by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7E79E868EF
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:51 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 E0729305D367; Fri,  7 Feb 2020 20:16:41 +0200 (EET)
Received: from host.bbu.bitdefender.biz (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id D632F305207F;
 Fri,  7 Feb 2020 20:16:41 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v7 73/78] KVM: introspection: extend KVMI_GET_VERSION with
 struct kvmi_features
Date: Fri,  7 Feb 2020 20:16:31 +0200
Message-Id: <20200207181636.1065-74-alazar@bitdefender.com>
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

VGhpcyBpcyB1c2VkIGJ5IHRoZSBpbnRyb3NwZWN0aW9uIHRvb2wgdG8gY2hlY2sgdGhlIGhhcmR3
YXJlIHN1cHBvcnQKZm9yIHNpbmdsZSBzdGVwLgoKU2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6
xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIERvY3VtZW50YXRpb24vdmlydC9rdm0v
a3ZtaS5yc3QgICAgICAgICAgICAgICAgfCAxMyArKysrKysrKysrKystCiBhcmNoL3g4Ni9pbmNs
dWRlL3VhcGkvYXNtL2t2bWkuaCAgICAgICAgICAgICAgIHwgIDUgKysrKysKIGFyY2gveDg2L2t2
bS9rdm1pLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNSArKysrKwogaW5jbHVkZS91
YXBpL2xpbnV4L2t2bWkuaCAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIHRvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2t2bS94ODZfNjQva3ZtaV90ZXN0LmMgfCAgNSArKysrKwogdmlydC9rdm0v
aW50cm9zcGVjdGlvbi9rdm1pX2ludC5oICAgICAgICAgICAgICB8ICAxICsKIHZpcnQva3ZtL2lu
dHJvc3BlY3Rpb24va3ZtaV9tc2cuYyAgICAgICAgICAgICAgfCAgMiArKwogNyBmaWxlcyBjaGFu
Z2VkLCAzMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJzdCBiL0RvY3VtZW50YXRpb24vdmlydC9rdm0va3ZtaS5y
c3QKaW5kZXggNzk5NGQ2ZThjYWNmLi40NTRkN2FlNzVhZTYgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50
YXRpb24vdmlydC9rdm0va3ZtaS5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9rdm1p
LnJzdApAQCAtMjU0LDkgKzI1NCwyMCBAQCBUaGUgY29tbWFuZHMgcmVsYXRlZCB0byB2Q1BVcyBz
dGFydCB3aXRoOjoKIAlzdHJ1Y3Qga3ZtaV9nZXRfdmVyc2lvbl9yZXBseSB7CiAJCV9fdTMyIHZl
cnNpb247CiAJCV9fdTMyIHBhZGRpbmc7CisJCXN0cnVjdCBrdm1pX2ZlYXR1cmVzIGZlYXR1cmVz
OwogCX07CiAKLVJldHVybnMgdGhlIGludHJvc3BlY3Rpb24gQVBJIHZlcnNpb24uCitGb3IgeDg2
CisKKzo6CisKKwlzdHJ1Y3Qga3ZtaV9mZWF0dXJlcyB7CisJCV9fdTggc2luZ2xlc3RlcDsKKwkJ
X191OCBwYWRkaW5nWzddOworCX07CisKK1JldHVybnMgdGhlIGludHJvc3BlY3Rpb24gQVBJIHZl
cnNpb24gYW5kIHNvbWUgb2YgdGhlIGZlYXR1cmVzIHN1cHBvcnRlZAorYnkgdGhlIGhhcmR3YXJl
LgogCiBUaGlzIGNvbW1hbmQgaXMgYWx3YXlzIGFsbG93ZWQgYW5kIHN1Y2Nlc3NmdWwgKGlmIHRo
ZSBpbnRyb3NwZWN0aW9uIGlzCiBidWlsdCBpbiBrZXJuZWwpLgpkaWZmIC0tZ2l0IGEvYXJjaC94
ODYvaW5jbHVkZS91YXBpL2FzbS9rdm1pLmggYi9hcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL2t2
bWkuaAppbmRleCBmNGJlN2QxMmY2M2EuLjhlMjA1NmFkMTFhNyAxMDA2NDQKLS0tIGEvYXJjaC94
ODYvaW5jbHVkZS91YXBpL2FzbS9rdm1pLmgKKysrIGIvYXJjaC94ODYvaW5jbHVkZS91YXBpL2Fz
bS9rdm1pLmgKQEAgLTEzOSw0ICsxMzksOSBAQCBzdHJ1Y3Qga3ZtaV9ldmVudF9tc3JfcmVwbHkg
ewogCV9fdTY0IG5ld192YWw7CiB9OwogCitzdHJ1Y3Qga3ZtaV9mZWF0dXJlcyB7CisJX191OCBz
aW5nbGVzdGVwOworCV9fdTggcGFkZGluZ1s3XTsKK307CisKICNlbmRpZiAvKiBfVUFQSV9BU01f
WDg2X0tWTUlfSCAqLwpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL2t2bWkuYyBiL2FyY2gveDg2
L2t2bS9rdm1pLmMKaW5kZXggNGU4YjhlMGEyOTYxLi41Y2YyNjZkMTMzNzUgMTAwNjQ0Ci0tLSBh
L2FyY2gveDg2L2t2bS9rdm1pLmMKKysrIGIvYXJjaC94ODYva3ZtL2t2bWkuYwpAQCAtMTEwMCw2
ICsxMTAwLDExIEBAIGJvb2wga3ZtaV9hcmNoX3BmX2V2ZW50KHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSwgZ3BhX3QgZ3BhLCBndmFfdCBndmEsCiAJcmV0dXJuIHJldDsKIH0KIAordm9pZCBrdm1pX2Fy
Y2hfZmVhdHVyZXMoc3RydWN0IGt2bWlfZmVhdHVyZXMgKmZlYXQpCit7CisJZmVhdC0+c2luZ2xl
c3RlcCA9ICEha3ZtX3g4Nl9vcHMtPmNvbnRyb2xfc2luZ2xlc3RlcDsKK30KKwogYm9vbCBrdm1p
X2FyY2hfcGZfb2ZfaW50ZXJlc3Qoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogewogCXJldHVybiBr
dm1feDg2X29wcy0+c3B0X2ZhdWx0KHZjcHUpICYmCmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkv
bGludXgva3ZtaS5oIGIvaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaAppbmRleCBjNzRkZWQwOTdl
ZmEuLjdjZDQxYTgxNTk2NyAxMDA2NDQKLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaAor
KysgYi9pbmNsdWRlL3VhcGkvbGludXgva3ZtaS5oCkBAIC05MSw2ICs5MSw3IEBAIHN0cnVjdCBr
dm1pX2Vycm9yX2NvZGUgewogc3RydWN0IGt2bWlfZ2V0X3ZlcnNpb25fcmVwbHkgewogCV9fdTMy
IHZlcnNpb247CiAJX191MzIgcGFkZGluZzsKKwlzdHJ1Y3Qga3ZtaV9mZWF0dXJlcyBmZWF0dXJl
czsKIH07CiAKIHN0cnVjdCBrdm1pX3ZtX2NoZWNrX2NvbW1hbmQgewpkaWZmIC0tZ2l0IGEvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3g4Nl82NC9rdm1pX3Rlc3QuYyBiL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2t2bS94ODZfNjQva3ZtaV90ZXN0LmMKaW5kZXggZThkM2NjYWMxY2FhLi5h
Mjc1ODhjMjdlYjggMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS94ODZf
NjQva3ZtaV90ZXN0LmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3g4Nl82NC9r
dm1pX3Rlc3QuYwpAQCAtNTUsNiArNTUsOCBAQCBzdHJ1Y3QgdmNwdV93b3JrZXJfZGF0YSB7CiAJ
Ym9vbCByZXN0YXJ0X29uX3NodXRkb3duOwogfTsKIAorc3RhdGljIHN0cnVjdCBrdm1pX2ZlYXR1
cmVzIGZlYXR1cmVzOworCiB0eXBlZGVmIHZvaWQgKCpmY3RfcGZfZXZlbnQpKHN0cnVjdCBrdm1f
dm0gKnZtLCBzdHJ1Y3Qga3ZtaV9tc2dfaGRyICpoZHIsCiAJCQkJc3RydWN0IHBmX2V2ICpldiwK
IAkJCQlzdHJ1Y3QgdmNwdV9yZXBseSAqcnBsKTsKQEAgLTM3MSw3ICszNzMsMTAgQEAgc3RhdGlj
IHZvaWQgdGVzdF9jbWRfZ2V0X3ZlcnNpb24odm9pZCkKIAkJICAgICJVbmV4cGVjdGVkIEtWTUkg
dmVyc2lvbiAlZCwgZXhwZWN0aW5nICVkXG4iLAogCQkgICAgcnBsLnZlcnNpb24sIEtWTUlfVkVS
U0lPTik7CiAKKwlmZWF0dXJlcyA9IHJwbC5mZWF0dXJlczsKKwogCURFQlVHKCJLVk1JIHZlcnNp
b246ICV1XG4iLCBycGwudmVyc2lvbik7CisJREVCVUcoIlx0c2luZ2xlc3RlcDogJXVcbiIsIGZl
YXR1cmVzLnNpbmdsZXN0ZXApOwogfQogCiBzdGF0aWMgaW50IGNtZF9jaGVja19jb21tYW5kKF9f
dTE2IGlkKQpkaWZmIC0tZ2l0IGEvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX2ludC5oIGIv
dmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX2ludC5oCmluZGV4IDIzYTA4OGFmZTA3Mi4uMDZi
OTI0Mjc3ZjM3IDEwMDY0NAotLS0gYS92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfaW50LmgK
KysrIGIvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX2ludC5oCkBAIC0xNjcsNSArMTY3LDYg
QEAgaW50IGt2bWlfYXJjaF9jbWRfc2V0X3BhZ2VfYWNjZXNzKHN0cnVjdCBrdm1faW50cm9zcGVj
dGlvbiAqa3ZtaSwKIGJvb2wga3ZtaV9hcmNoX3BmX2V2ZW50KHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSwgZ3BhX3QgZ3BhLCBndmFfdCBndmEsCiAJCQl1OCBhY2Nlc3MpOwogYm9vbCBrdm1pX2FyY2hf
cGZfb2ZfaW50ZXJlc3Qoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKK3ZvaWQga3ZtaV9hcmNoX2Zl
YXR1cmVzKHN0cnVjdCBrdm1pX2ZlYXR1cmVzICpmZWF0KTsKIAogI2VuZGlmCmRpZmYgLS1naXQg
YS92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfbXNnLmMgYi92aXJ0L2t2bS9pbnRyb3NwZWN0
aW9uL2t2bWlfbXNnLmMKaW5kZXggNDlmNDlmMjQwMWJjLi44YzdjZGJkOTZmYWEgMTAwNjQ0Ci0t
LSBhL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9tc2cuYworKysgYi92aXJ0L2t2bS9pbnRy
b3NwZWN0aW9uL2t2bWlfbXNnLmMKQEAgLTE4NCw2ICsxODQsOCBAQCBzdGF0aWMgaW50IGhhbmRs
ZV9nZXRfdmVyc2lvbihzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2bWksCiAJbWVtc2V0KCZy
cGwsIDAsIHNpemVvZihycGwpKTsKIAlycGwudmVyc2lvbiA9IEtWTUlfVkVSU0lPTjsKIAorCWt2
bWlfYXJjaF9mZWF0dXJlcygmcnBsLmZlYXR1cmVzKTsKKwogCXJldHVybiBrdm1pX21zZ192bV9y
ZXBseShrdm1pLCBtc2csIDAsICZycGwsIHNpemVvZihycGwpKTsKIH0KIApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5n
IGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9s
aXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
