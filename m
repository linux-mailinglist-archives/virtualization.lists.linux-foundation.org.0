Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 364851978F3
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 12:20:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4FE8B230BD;
	Mon, 30 Mar 2020 10:20:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SuAr3VNW0s9d; Mon, 30 Mar 2020 10:20:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 97F65233B8;
	Mon, 30 Mar 2020 10:20:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78E5BC07FF;
	Mon, 30 Mar 2020 10:20:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DC0D2C1D8F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id CC7D287BFF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:19:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YPfUOdw3-0kW
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:19:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 778B187997
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:19:52 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 95E2F305D3D2; Mon, 30 Mar 2020 13:13:01 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 728AD305B7A1;
 Mon, 30 Mar 2020 13:13:01 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v8 76/81] KVM: introspection: extend KVMI_GET_VERSION with
 struct kvmi_features
Date: Mon, 30 Mar 2020 13:13:03 +0300
Message-Id: <20200330101308.21702-77-alazar@bitdefender.com>
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
c3QKaW5kZXggMzk1MmFlZjlhZjljLi5iMjExYWUwZWQ4NmEgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50
YXRpb24vdmlydC9rdm0va3ZtaS5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9rdm1p
LnJzdApAQCAtMjU0LDkgKzI1NCwyMCBAQCBUaGUgdkNQVSBjb21tYW5kcyBzdGFydCB3aXRoOjoK
IAlzdHJ1Y3Qga3ZtaV9nZXRfdmVyc2lvbl9yZXBseSB7CiAJCV9fdTMyIHZlcnNpb247CiAJCV9f
dTMyIHBhZGRpbmc7CisJCXN0cnVjdCBrdm1pX2ZlYXR1cmVzIGZlYXR1cmVzOwogCX07CiAKLVJl
dHVybnMgdGhlIGludHJvc3BlY3Rpb24gQVBJIHZlcnNpb24uCitGb3IgeDg2CisKKzo6CisKKwlz
dHJ1Y3Qga3ZtaV9mZWF0dXJlcyB7CisJCV9fdTggc2luZ2xlc3RlcDsKKwkJX191OCBwYWRkaW5n
WzddOworCX07CisKK1JldHVybnMgdGhlIGludHJvc3BlY3Rpb24gQVBJIHZlcnNpb24gYW5kIHNv
bWUgb2YgdGhlIGZlYXR1cmVzIHN1cHBvcnRlZAorYnkgdGhlIGhhcmR3YXJlLgogCiBUaGlzIGNv
bW1hbmQgaXMgYWx3YXlzIGFsbG93ZWQgYW5kIHN1Y2Nlc3NmdWwgKGlmIHRoZSBpbnRyb3NwZWN0
aW9uIGlzCiBidWlsdCBpbiBrZXJuZWwpLgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS91
YXBpL2FzbS9rdm1pLmggYi9hcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL2t2bWkuaAppbmRleCBl
NGQ1OTE5MTJmMzcuLjBiZGY3MGNjOGZjNyAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS91
YXBpL2FzbS9rdm1pLmgKKysrIGIvYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9rdm1pLmgKQEAg
LTEzOSw0ICsxMzksOSBAQCBzdHJ1Y3Qga3ZtaV9ldmVudF9tc3JfcmVwbHkgewogCV9fdTY0IG5l
d192YWw7CiB9OwogCitzdHJ1Y3Qga3ZtaV9mZWF0dXJlcyB7CisJX191OCBzaW5nbGVzdGVwOwor
CV9fdTggcGFkZGluZ1s3XTsKK307CisKICNlbmRpZiAvKiBfVUFQSV9BU01fWDg2X0tWTUlfSCAq
LwpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL2t2bWkuYyBiL2FyY2gveDg2L2t2bS9rdm1pLmMK
aW5kZXggMDY4MjllMWM1NzM3Li5kN2UxYzA2OTBjNDMgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2
bS9rdm1pLmMKKysrIGIvYXJjaC94ODYva3ZtL2t2bWkuYwpAQCAtMTE5OSw2ICsxMTk5LDExIEBA
IGJvb2wga3ZtaV9hcmNoX3BmX2V2ZW50KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgZ3BhX3QgZ3Bh
LCBndmFfdCBndmEsCiAJcmV0dXJuIHJldDsKIH0KIAordm9pZCBrdm1pX2FyY2hfZmVhdHVyZXMo
c3RydWN0IGt2bWlfZmVhdHVyZXMgKmZlYXQpCit7CisJZmVhdC0+c2luZ2xlc3RlcCA9ICEha3Zt
X3g4Nl9vcHMtPmNvbnRyb2xfc2luZ2xlc3RlcDsKK30KKwogYm9vbCBrdm1pX2FyY2hfcGZfb2Zf
aW50ZXJlc3Qoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogewogCXJldHVybiBrdm1feDg2X29wcy0+
c3B0X2ZhdWx0KHZjcHUpICYmCmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgva3ZtaS5o
IGIvaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaAppbmRleCBkZjE5MjkzNmIwMTcuLmNhZjE2NmU3
ZGRmZiAxMDA2NDQKLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaAorKysgYi9pbmNsdWRl
L3VhcGkvbGludXgva3ZtaS5oCkBAIC05Nyw2ICs5Nyw3IEBAIHN0cnVjdCBrdm1pX2Vycm9yX2Nv
ZGUgewogc3RydWN0IGt2bWlfZ2V0X3ZlcnNpb25fcmVwbHkgewogCV9fdTMyIHZlcnNpb247CiAJ
X191MzIgcGFkZGluZzsKKwlzdHJ1Y3Qga3ZtaV9mZWF0dXJlcyBmZWF0dXJlczsKIH07CiAKIHN0
cnVjdCBrdm1pX3ZtX2NoZWNrX2NvbW1hbmQgewpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMva3ZtL3g4Nl82NC9rdm1pX3Rlc3QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2t2bS94ODZfNjQva3ZtaV90ZXN0LmMKaW5kZXggNDhjYjU0NjIzNGMwLi5kNGNmZTU5NTgyMWQg
MTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS94ODZfNjQva3ZtaV90ZXN0
LmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3g4Nl82NC9rdm1pX3Rlc3QuYwpA
QCAtNTYsNiArNTYsOCBAQCBzdHJ1Y3QgdmNwdV93b3JrZXJfZGF0YSB7CiAJYm9vbCByZXN0YXJ0
X29uX3NodXRkb3duOwogfTsKIAorc3RhdGljIHN0cnVjdCBrdm1pX2ZlYXR1cmVzIGZlYXR1cmVz
OworCiB0eXBlZGVmIHZvaWQgKCpmY3RfcGZfZXZlbnQpKHN0cnVjdCBrdm1fdm0gKnZtLCBzdHJ1
Y3Qga3ZtaV9tc2dfaGRyICpoZHIsCiAJCQkJc3RydWN0IHBmX2V2ICpldiwKIAkJCQlzdHJ1Y3Qg
dmNwdV9yZXBseSAqcnBsKTsKQEAgLTM3Miw3ICszNzQsMTAgQEAgc3RhdGljIHZvaWQgdGVzdF9j
bWRfZ2V0X3ZlcnNpb24odm9pZCkKIAkJICAgICJVbmV4cGVjdGVkIEtWTUkgdmVyc2lvbiAlZCwg
ZXhwZWN0aW5nICVkXG4iLAogCQkgICAgcnBsLnZlcnNpb24sIEtWTUlfVkVSU0lPTik7CiAKKwlm
ZWF0dXJlcyA9IHJwbC5mZWF0dXJlczsKKwogCURFQlVHKCJLVk1JIHZlcnNpb246ICV1XG4iLCBy
cGwudmVyc2lvbik7CisJREVCVUcoIlx0c2luZ2xlc3RlcDogJXVcbiIsIGZlYXR1cmVzLnNpbmds
ZXN0ZXApOwogfQogCiBzdGF0aWMgaW50IGNtZF9jaGVja19jb21tYW5kKF9fdTE2IGlkKQpkaWZm
IC0tZ2l0IGEvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX2ludC5oIGIvdmlydC9rdm0vaW50
cm9zcGVjdGlvbi9rdm1pX2ludC5oCmluZGV4IDYzOWQxNDgxMTkzMy4uZTBjYjU4YzYwNjk3IDEw
MDY0NAotLS0gYS92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfaW50LmgKKysrIGIvdmlydC9r
dm0vaW50cm9zcGVjdGlvbi9rdm1pX2ludC5oCkBAIC0xMjcsNSArMTI3LDYgQEAgaW50IGt2bWlf
YXJjaF9jbWRfc2V0X3BhZ2VfYWNjZXNzKHN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqa3ZtaSwK
IGJvb2wga3ZtaV9hcmNoX3BmX2V2ZW50KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgZ3BhX3QgZ3Bh
LCBndmFfdCBndmEsCiAJCQl1OCBhY2Nlc3MpOwogYm9vbCBrdm1pX2FyY2hfcGZfb2ZfaW50ZXJl
c3Qoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKK3ZvaWQga3ZtaV9hcmNoX2ZlYXR1cmVzKHN0cnVj
dCBrdm1pX2ZlYXR1cmVzICpmZWF0KTsKIAogI2VuZGlmCmRpZmYgLS1naXQgYS92aXJ0L2t2bS9p
bnRyb3NwZWN0aW9uL2t2bWlfbXNnLmMgYi92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfbXNn
LmMKaW5kZXggMTBkNGU0MDM4N2VmLi43MWE2NzE1NDU0MmYgMTAwNjQ0Ci0tLSBhL3ZpcnQva3Zt
L2ludHJvc3BlY3Rpb24va3ZtaV9tc2cuYworKysgYi92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2
bWlfbXNnLmMKQEAgLTE4Miw2ICsxODIsOCBAQCBzdGF0aWMgaW50IGhhbmRsZV9nZXRfdmVyc2lv
bihzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2bWksCiAJbWVtc2V0KCZycGwsIDAsIHNpemVv
ZihycGwpKTsKIAlycGwudmVyc2lvbiA9IEtWTUlfVkVSU0lPTjsKIAorCWt2bWlfYXJjaF9mZWF0
dXJlcygmcnBsLmZlYXR1cmVzKTsKKwogCXJldHVybiBrdm1pX21zZ192bV9yZXBseShrdm1pLCBt
c2csIDAsICZycGwsIHNpemVvZihycGwpKTsKIH0KIApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVh
bGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
