Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B162C3C4F
	for <lists.virtualization@lfdr.de>; Wed, 25 Nov 2020 10:42:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E628D86DAA;
	Wed, 25 Nov 2020 09:42:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Dxq3PA-xApH; Wed, 25 Nov 2020 09:42:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EFEA186D8B;
	Wed, 25 Nov 2020 09:41:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C3A55C163C;
	Wed, 25 Nov 2020 09:41:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3C968C0052
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3831186920
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:41:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f6mthziipv85
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:41:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A7CCA8698B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:41:51 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 E41D6305D518; Wed, 25 Nov 2020 11:35:48 +0200 (EET)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id C21333072784;
 Wed, 25 Nov 2020 11:35:48 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v10 38/81] KVM: introspection: add KVMI_VM_GET_INFO
Date: Wed, 25 Nov 2020 11:35:17 +0200
Message-Id: <20201125093600.2766-39-alazar@bitdefender.com>
In-Reply-To: <20201125093600.2766-1-alazar@bitdefender.com>
References: <20201125093600.2766-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>,
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyBjb21tYW5k
IHJldHVybnMgdGhlIG51bWJlciBvZiBvbmxpbmUgdkNQVXMuCgpUaGUgaW50cm9zcGVjdGlvbiB0
b29sIHVzZXMgdGhlIHZDUFUgaW5kZXggdG8gc3BlY2lmeSB0byB3aGljaCB2Q1BVCnRoZSBpbnRy
b3NwZWN0aW9uIGNvbW1hbmQgYXBwbGllcyB0by4KClNpZ25lZC1vZmYtYnk6IE1paGFpIERvbsib
dSA8bWRvbnR1QGJpdGRlZmVuZGVyLmNvbT4KU2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINy
IDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIERvY3VtZW50YXRpb24vdmlydC9rdm0va3Zt
aS5yc3QgICAgICAgICAgICAgICB8IDE4ICsrKysrKysrKysKIGluY2x1ZGUvdWFwaS9saW51eC9r
dm1pLmggICAgICAgICAgICAgICAgICAgICB8ICA2ICsrKysKIC4uLi90ZXN0aW5nL3NlbGZ0ZXN0
cy9rdm0veDg2XzY0L2t2bWlfdGVzdC5jICB8IDM1ICsrKysrKysrKysrKysrKysrLS0KIHZpcnQv
a3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9tc2cuYyAgICAgICAgICAgICB8IDEzICsrKysrKysKIDQg
ZmlsZXMgY2hhbmdlZCwgNjkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2t2bWkucnN0IGIvRG9jdW1lbnRhdGlvbi92aXJ0
L2t2bS9rdm1pLnJzdAppbmRleCAxMzE2OTU3NWY3NWYuLjZmODU4M2Q0YWViMiAxMDA2NDQKLS0t
IGEvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL3Zp
cnQva3ZtL2t2bWkucnN0CkBAIC0zMTIsMyArMzEyLDIxIEBAIFRoaXMgY29tbWFuZCBpcyBhbHdh
eXMgYWxsb3dlZC4KICogLUtWTV9FTk9FTlQgLSB0aGUgZXZlbnQgc3BlY2lmaWVkIGJ5IGBgaWRg
YCBpcyB1bnN1cHBvcnRlZAogKiAtS1ZNX0VQRVJNIC0gdGhlIGV2ZW50IHNwZWNpZmllZCBieSBg
YGlkYGAgaXMgZGlzYWxsb3dlZAogKiAtS1ZNX0VJTlZBTCAtIHRoZSBwYWRkaW5nIGlzIG5vdCB6
ZXJvCisKKzQuIEtWTUlfVk1fR0VUX0lORk8KKy0tLS0tLS0tLS0tLS0tLS0tLS0KKworOkFyY2hp
dGVjdHVyZXM6IGFsbAorOlZlcnNpb25zOiA+PSAxCis6UGFyYW1ldGVyczogbm9uZQorOlJldHVy
bnM6CisKKzo6CisKKwlzdHJ1Y3Qga3ZtaV9lcnJvcl9jb2RlOworCXN0cnVjdCBrdm1pX3ZtX2dl
dF9pbmZvX3JlcGx5IHsKKwkJX191MzIgdmNwdV9jb3VudDsKKwkJX191MzIgcGFkZGluZ1szXTsK
Kwl9OworCitSZXR1cm5zIHRoZSBudW1iZXIgb2Ygb25saW5lIHZDUFVzLgpkaWZmIC0tZ2l0IGEv
aW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaCBiL2luY2x1ZGUvdWFwaS9saW51eC9rdm1pLmgKaW5k
ZXggMGMyZDBjZWRkZTZmLi5lMDZhN2I4MGQ0ZDkgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdWFwaS9s
aW51eC9rdm1pLmgKKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaApAQCAtMjAsNiArMjAs
NyBAQCBlbnVtIHsKIAlLVk1JX0dFVF9WRVJTSU9OICAgICAgPSBLVk1JX1ZNX01FU1NBR0VfSUQo
MSksCiAJS1ZNSV9WTV9DSEVDS19DT01NQU5EID0gS1ZNSV9WTV9NRVNTQUdFX0lEKDIpLAogCUtW
TUlfVk1fQ0hFQ0tfRVZFTlQgICA9IEtWTUlfVk1fTUVTU0FHRV9JRCgzKSwKKwlLVk1JX1ZNX0dF
VF9JTkZPICAgICAgPSBLVk1JX1ZNX01FU1NBR0VfSUQoNCksCiAKIAlLVk1JX05FWFRfVk1fTUVT
U0FHRQogfTsKQEAgLTY3LDQgKzY4LDkgQEAgc3RydWN0IGt2bWlfdm1fY2hlY2tfZXZlbnQgewog
CV9fdTMyIHBhZGRpbmcyOwogfTsKIAorc3RydWN0IGt2bWlfdm1fZ2V0X2luZm9fcmVwbHkgewor
CV9fdTMyIHZjcHVfY291bnQ7CisJX191MzIgcGFkZGluZ1szXTsKK307CisKICNlbmRpZiAvKiBf
VUFQSV9fTElOVVhfS1ZNSV9IICovCmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9rdm0veDg2XzY0L2t2bWlfdGVzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3g4
Nl82NC9rdm1pX3Rlc3QuYwppbmRleCBjZDhmMTZhM2NlM2EuLmQ2MGVlMjNmYTgzMyAxMDA2NDQK
LS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3g4Nl82NC9rdm1pX3Rlc3QuYworKysg
Yi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0veDg2XzY0L2t2bWlfdGVzdC5jCkBAIC04MCw2
ICs4MCwxNiBAQCBzdGF0aWMgdm9pZCBzZXRfY29tbWFuZF9wZXJtKHN0cnVjdCBrdm1fdm0gKnZt
LCBfX3MzMiBpZCwgX191MzIgYWxsb3csCiAJCSAiS1ZNX0lOVFJPU1BFQ1RJT05fQ09NTUFORCIp
OwogfQogCitzdGF0aWMgdm9pZCBkaXNhbGxvd19jb21tYW5kKHN0cnVjdCBrdm1fdm0gKnZtLCBf
X3MzMiBpZCkKK3sKKwlzZXRfY29tbWFuZF9wZXJtKHZtLCBpZCwgMCwgMCk7Cit9CisKK3N0YXRp
YyB2b2lkIGFsbG93X2NvbW1hbmQoc3RydWN0IGt2bV92bSAqdm0sIF9fczMyIGlkKQoreworCXNl
dF9jb21tYW5kX3Blcm0odm0sIGlkLCAxLCAwKTsKK30KKwogc3RhdGljIHZvaWQgaG9va19pbnRy
b3NwZWN0aW9uKHN0cnVjdCBrdm1fdm0gKnZtKQogewogCV9fdTMyIGFsbG93ID0gMSwgZGlzYWxs
b3cgPSAwLCBhbGxvd19pbnZhbCA9IDI7CkBAIC0yNTYsMTIgKzI2NiwxNiBAQCBzdGF0aWMgdm9p
ZCBjbWRfdm1fY2hlY2tfY29tbWFuZChfX3UxNiBpZCwgaW50IGV4cGVjdGVkX2VycikKIAkJCWV4
cGVjdGVkX2Vycik7CiB9CiAKLXN0YXRpYyB2b2lkIHRlc3RfY21kX3ZtX2NoZWNrX2NvbW1hbmQo
dm9pZCkKK3N0YXRpYyB2b2lkIHRlc3RfY21kX3ZtX2NoZWNrX2NvbW1hbmQoc3RydWN0IGt2bV92
bSAqdm0pCiB7Ci0JX191MTYgdmFsaWRfaWQgPSBLVk1JX0dFVF9WRVJTSU9OLCBpbnZhbGlkX2lk
ID0gMHhmZmZmOworCV9fdTE2IHZhbGlkX2lkID0gS1ZNSV9WTV9HRVRfSU5GTywgaW52YWxpZF9p
ZCA9IDB4ZmZmZjsKIAogCWNtZF92bV9jaGVja19jb21tYW5kKHZhbGlkX2lkLCAwKTsKIAljbWRf
dm1fY2hlY2tfY29tbWFuZChpbnZhbGlkX2lkLCAtS1ZNX0VOT0VOVCk7CisKKwlkaXNhbGxvd19j
b21tYW5kKHZtLCB2YWxpZF9pZCk7CisJY21kX3ZtX2NoZWNrX2NvbW1hbmQodmFsaWRfaWQsIC1L
Vk1fRVBFUk0pOworCWFsbG93X2NvbW1hbmQodm0sIHZhbGlkX2lkKTsKIH0KIAogc3RhdGljIHZv
aWQgY21kX3ZtX2NoZWNrX2V2ZW50KF9fdTE2IGlkLCBpbnQgZXhwZWN0ZWRfZXJyKQpAQCAtMjg0
LDYgKzI5OCwyMCBAQCBzdGF0aWMgdm9pZCB0ZXN0X2NtZF92bV9jaGVja19ldmVudCh2b2lkKQog
CWNtZF92bV9jaGVja19ldmVudChpbnZhbGlkX2lkLCAtS1ZNX0VOT0VOVCk7CiB9CiAKK3N0YXRp
YyB2b2lkIHRlc3RfY21kX3ZtX2dldF9pbmZvKHZvaWQpCit7CisJc3RydWN0IGt2bWlfdm1fZ2V0
X2luZm9fcmVwbHkgcnBsOworCXN0cnVjdCBrdm1pX21zZ19oZHIgcmVxOworCisJdGVzdF92bV9j
b21tYW5kKEtWTUlfVk1fR0VUX0lORk8sICZyZXEsIHNpemVvZihyZXEpLCAmcnBsLAorCQkJc2l6
ZW9mKHJwbCksIDApOworCVRFU1RfQVNTRVJUKHJwbC52Y3B1X2NvdW50ID09IDEsCisJCSAgICAi
VW5leHBlY3RlZCBudW1iZXIgb2YgdkNQVSBjb3VudCAldVxuIiwKKwkJICAgIHJwbC52Y3B1X2Nv
dW50KTsKKworCXByX2RlYnVnKCJ2Y3B1IGNvdW50OiAldVxuIiwgcnBsLnZjcHVfY291bnQpOwor
fQorCiBzdGF0aWMgdm9pZCB0ZXN0X2ludHJvc3BlY3Rpb24oc3RydWN0IGt2bV92bSAqdm0pCiB7
CiAJc2V0dXBfc29ja2V0KCk7CkBAIC0yOTEsOCArMzE5LDkgQEAgc3RhdGljIHZvaWQgdGVzdF9p
bnRyb3NwZWN0aW9uKHN0cnVjdCBrdm1fdm0gKnZtKQogCiAJdGVzdF9jbWRfaW52YWxpZCgpOwog
CXRlc3RfY21kX2dldF92ZXJzaW9uKCk7Ci0JdGVzdF9jbWRfdm1fY2hlY2tfY29tbWFuZCgpOwor
CXRlc3RfY21kX3ZtX2NoZWNrX2NvbW1hbmQodm0pOwogCXRlc3RfY21kX3ZtX2NoZWNrX2V2ZW50
KCk7CisJdGVzdF9jbWRfdm1fZ2V0X2luZm8oKTsKIAogCXVuaG9va19pbnRyb3NwZWN0aW9uKHZt
KTsKIH0KZGlmZiAtLWdpdCBhL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9tc2cuYyBiL3Zp
cnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9tc2cuYwppbmRleCA2NTM4YzdhZjcxMGEuLmYwZjUw
NTg0MDNkZCAxMDA2NDQKLS0tIGEvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX21zZy5jCisr
KyBiL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9tc2cuYwpAQCAtMTUwLDYgKzE1MCwxOCBA
QCBzdGF0aWMgaW50IGhhbmRsZV92bV9jaGVja19ldmVudChzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rp
b24gKmt2bWksCiAJcmV0dXJuIGt2bWlfbXNnX3ZtX3JlcGx5KGt2bWksIG1zZywgZWMsIE5VTEws
IDApOwogfQogCitzdGF0aWMgaW50IGhhbmRsZV92bV9nZXRfaW5mbyhzdHJ1Y3Qga3ZtX2ludHJv
c3BlY3Rpb24gKmt2bWksCisJCQkgICAgICBjb25zdCBzdHJ1Y3Qga3ZtaV9tc2dfaGRyICptc2cs
CisJCQkgICAgICBjb25zdCB2b2lkICpyZXEpCit7CisJc3RydWN0IGt2bWlfdm1fZ2V0X2luZm9f
cmVwbHkgcnBsOworCisJbWVtc2V0KCZycGwsIDAsIHNpemVvZihycGwpKTsKKwlycGwudmNwdV9j
b3VudCA9IGF0b21pY19yZWFkKCZrdm1pLT5rdm0tPm9ubGluZV92Y3B1cyk7CisKKwlyZXR1cm4g
a3ZtaV9tc2dfdm1fcmVwbHkoa3ZtaSwgbXNnLCAwLCAmcnBsLCBzaXplb2YocnBsKSk7Cit9CisK
IC8qCiAgKiBUaGVzZSBjb21tYW5kcyBhcmUgZXhlY3V0ZWQgYnkgdGhlIHJlY2VpdmluZyB0aHJl
YWQuCiAgKi8KQEAgLTE1Nyw2ICsxNjksNyBAQCBzdGF0aWMga3ZtaV92bV9tc2dfZmN0IGNvbnN0
IG1zZ192bVtdID0gewogCVtLVk1JX0dFVF9WRVJTSU9OXSAgICAgID0gaGFuZGxlX2dldF92ZXJz
aW9uLAogCVtLVk1JX1ZNX0NIRUNLX0NPTU1BTkRdID0gaGFuZGxlX3ZtX2NoZWNrX2NvbW1hbmQs
CiAJW0tWTUlfVk1fQ0hFQ0tfRVZFTlRdICAgPSBoYW5kbGVfdm1fY2hlY2tfZXZlbnQsCisJW0tW
TUlfVk1fR0VUX0lORk9dICAgICAgPSBoYW5kbGVfdm1fZ2V0X2luZm8sCiB9OwogCiBzdGF0aWMg
a3ZtaV92bV9tc2dfZmN0IGdldF92bV9tc2dfaGFuZGxlcih1MTYgaWQpCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcg
bGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
