Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A27C719788C
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 12:13:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 68B042309D;
	Mon, 30 Mar 2020 10:13:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PA-wVtFecdtM; Mon, 30 Mar 2020 10:13:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2E2E4230A1;
	Mon, 30 Mar 2020 10:13:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 269CCC1AE8;
	Mon, 30 Mar 2020 10:13:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F602C1AE8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4F3D88790E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fvVfuld-IxO4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 95C2F878BA
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:52 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 9EA2930747CC; Mon, 30 Mar 2020 13:12:50 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 7A806305B7A0;
 Mon, 30 Mar 2020 13:12:50 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v8 13/81] KVM: x86: add .desc_ctrl_supported()
Date: Mon, 30 Mar 2020 13:12:00 +0300
Message-Id: <20200330101308.21702-14-alazar@bitdefender.com>
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
b20+Ci0tLQogYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCB8IDEgKwogYXJjaC94ODYv
a3ZtL3N2bS5jICAgICAgICAgICAgICB8IDYgKysrKysrCiBhcmNoL3g4Ni9rdm0vdm14L2NhcGFi
aWxpdGllcy5oIHwgNyArKysrKystCiBhcmNoL3g4Ni9rdm0vdm14L3ZteC5jICAgICAgICAgIHwg
MSArCiA0IGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIGIvYXJjaC94ODYvaW5j
bHVkZS9hc20va3ZtX2hvc3QuaAppbmRleCBiZjM2ZWQyYzVlOWIuLjgxYTU5YjAzYjBjNSAxMDA2
NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAorKysgYi9hcmNoL3g4Ni9p
bmNsdWRlL2FzbS9rdm1faG9zdC5oCkBAIC0xMTA1LDYgKzExMDUsNyBAQCBzdHJ1Y3Qga3ZtX3g4
Nl9vcHMgewogCXZvaWQgKCpzZXRfaWR0KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBk
ZXNjX3B0ciAqZHQpOwogCXZvaWQgKCpnZXRfZ2R0KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0
cnVjdCBkZXNjX3B0ciAqZHQpOwogCXZvaWQgKCpzZXRfZ2R0KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsIHN0cnVjdCBkZXNjX3B0ciAqZHQpOworCWJvb2wgKCpkZXNjX2N0cmxfc3VwcG9ydGVkKSh2
b2lkKTsKIAl1NjQgKCpnZXRfZHI2KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogCXZvaWQgKCpz
ZXRfZHI2KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGxvbmcgdmFsdWUpOwogCXZv
aWQgKCpzeW5jX2RpcnR5X2RlYnVnX3JlZ3MpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7CmRpZmYg
LS1naXQgYS9hcmNoL3g4Ni9rdm0vc3ZtLmMgYi9hcmNoL3g4Ni9rdm0vc3ZtLmMKaW5kZXggZGU0
MDlkNzNjZTBjLi5mOTE4NWYwYjBjMmIgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS9zdm0uYwor
KysgYi9hcmNoL3g4Ni9rdm0vc3ZtLmMKQEAgLTYxMDksNiArNjEwOSwxMSBAQCBzdGF0aWMgYm9v
bCBzdm1feHNhdmVzX3N1cHBvcnRlZCh2b2lkKQogCXJldHVybiBib290X2NwdV9oYXMoWDg2X0ZF
QVRVUkVfWFNBVkVTKTsKIH0KIAorc3RhdGljIGJvb2wgc3ZtX2Rlc2NfY3RybF9zdXBwb3J0ZWQo
dm9pZCkKK3sKKwlyZXR1cm4gdHJ1ZTsKK30KKwogc3RhdGljIGJvb2wgc3ZtX3VtaXBfZW11bGF0
ZWQodm9pZCkKIHsKIAlyZXR1cm4gZmFsc2U7CkBAIC03NDc1LDYgKzc0ODAsNyBAQCBzdGF0aWMg
c3RydWN0IGt2bV94ODZfb3BzIHN2bV94ODZfb3BzIF9fcm9fYWZ0ZXJfaW5pdCA9IHsKIAkuc2V0
X2lkdCA9IHN2bV9zZXRfaWR0LAogCS5nZXRfZ2R0ID0gc3ZtX2dldF9nZHQsCiAJLnNldF9nZHQg
PSBzdm1fc2V0X2dkdCwKKwkuZGVzY19jdHJsX3N1cHBvcnRlZCA9IHN2bV9kZXNjX2N0cmxfc3Vw
cG9ydGVkLAogCS5nZXRfZHI2ID0gc3ZtX2dldF9kcjYsCiAJLnNldF9kcjYgPSBzdm1fc2V0X2Ry
NiwKIAkuc2V0X2RyNyA9IHN2bV9zZXRfZHI3LApkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3Zt
eC9jYXBhYmlsaXRpZXMuaCBiL2FyY2gveDg2L2t2bS92bXgvY2FwYWJpbGl0aWVzLmgKaW5kZXgg
ZjQ4NmUyNjA2MjQ3Li4yMjMwMWNjOTc5Y2IgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS92bXgv
Y2FwYWJpbGl0aWVzLmgKKysrIGIvYXJjaC94ODYva3ZtL3ZteC9jYXBhYmlsaXRpZXMuaApAQCAt
MTQwLDEyICsxNDAsMTcgQEAgc3RhdGljIGlubGluZSBib29sIGNwdV9oYXNfdm14X2VwdCh2b2lk
KQogCQlTRUNPTkRBUllfRVhFQ19FTkFCTEVfRVBUOwogfQogCi1zdGF0aWMgaW5saW5lIGJvb2wg
dm14X3VtaXBfZW11bGF0ZWQodm9pZCkKK3N0YXRpYyBpbmxpbmUgYm9vbCB2bXhfZGVzY19jdHJs
X3N1cHBvcnRlZCh2b2lkKQogewogCXJldHVybiB2bWNzX2NvbmZpZy5jcHVfYmFzZWRfMm5kX2V4
ZWNfY3RybCAmCiAJCVNFQ09OREFSWV9FWEVDX0RFU0M7CiB9CiAKK3N0YXRpYyBpbmxpbmUgYm9v
bCB2bXhfdW1pcF9lbXVsYXRlZCh2b2lkKQoreworCXJldHVybiB2bXhfZGVzY19jdHJsX3N1cHBv
cnRlZCgpOworfQorCiBzdGF0aWMgaW5saW5lIGJvb2wgdm14X3BrdV9zdXBwb3J0ZWQodm9pZCkK
IHsKIAlyZXR1cm4gYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX1BLVSk7CmRpZmYgLS1naXQgYS9h
cmNoL3g4Ni9rdm0vdm14L3ZteC5jIGIvYXJjaC94ODYva3ZtL3ZteC92bXguYwppbmRleCBiYTQ3
ZjVmMmVhOTEuLjY1N2M5YWMwMDcwYiAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL3ZteC92bXgu
YworKysgYi9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jCkBAIC03OTE5LDYgKzc5MTksNyBAQCBzdGF0
aWMgc3RydWN0IGt2bV94ODZfb3BzIHZteF94ODZfb3BzIF9fcm9fYWZ0ZXJfaW5pdCA9IHsKIAku
c2V0X2lkdCA9IHZteF9zZXRfaWR0LAogCS5nZXRfZ2R0ID0gdm14X2dldF9nZHQsCiAJLnNldF9n
ZHQgPSB2bXhfc2V0X2dkdCwKKwkuZGVzY19jdHJsX3N1cHBvcnRlZCA9IHZteF9kZXNjX2N0cmxf
c3VwcG9ydGVkLAogCS5nZXRfZHI2ID0gdm14X2dldF9kcjYsCiAJLnNldF9kcjYgPSB2bXhfc2V0
X2RyNiwKIAkuc2V0X2RyNyA9IHZteF9zZXRfZHI3LApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVh
bGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
