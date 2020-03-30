Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4715C197879
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 12:13:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2F9A186A0F;
	Mon, 30 Mar 2020 10:13:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wLwog_DZsmTS; Mon, 30 Mar 2020 10:12:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DB7118697D;
	Mon, 30 Mar 2020 10:12:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BEF64C1D89;
	Mon, 30 Mar 2020 10:12:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0C422C07FF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EC60987B9B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AoVBI33BPC+3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5C3BE87C9F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:52 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 9BAC630747C4; Mon, 30 Mar 2020 13:12:49 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 62BC7305B7A2;
 Mon, 30 Mar 2020 13:12:49 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v8 07/81] KVM: x86: add kvm_arch_vcpu_get_regs() and
 kvm_arch_vcpu_get_sregs()
Date: Mon, 30 Mar 2020 13:11:54 +0300
Message-Id: <20200330101308.21702-8-alazar@bitdefender.com>
In-Reply-To: <20200330101308.21702-1-alazar@bitdefender.com>
References: <20200330101308.21702-1-alazar@bitdefender.com>
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhlc2UgZnVuY3Rp
b25zIGFyZSBuZWVkZWQgZm9yIFZNIGludHJvc3BlY3Rpb24gKEtWTUlfVkNQVV9HRVRfUkVHSVNU
RVJTCmNvbW1hbmQgYW5kIGFsbCBldmVudHMgc2VuZGluZyB0aGUgdkNQVSByZWdpc3RlcnMgdG8g
dGhlIGludHJvc3BlY3Rpb24KdG9vbCkuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaSBEb27Im3UgPG1k
b250dUBiaXRkZWZlbmRlci5jb20+ClNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxh
emFyQGJpdGRlZmVuZGVyLmNvbT4KLS0tCiBhcmNoL3g4Ni9rdm0veDg2LmMgICAgICAgfCAxMCAr
KysrKysrKysrCiBpbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmggfCAgMyArKysKIDIgZmlsZXMgY2hh
bmdlZCwgMTMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS94ODYuYyBi
L2FyY2gveDg2L2t2bS94ODYuYwppbmRleCBkNjVmZjIwMDhjZjEuLmQ0NWI1MDkzZmRkMyAxMDA2
NDQKLS0tIGEvYXJjaC94ODYva3ZtL3g4Ni5jCisrKyBiL2FyY2gveDg2L2t2bS94ODYuYwpAQCAt
ODc4OCw2ICs4Nzg4LDExIEBAIGludCBrdm1fYXJjaF92Y3B1X2lvY3RsX2dldF9yZWdzKHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9yZWdzICpyZWdzKQogCXJldHVybiAwOwogfQog
Cit2b2lkIGt2bV9hcmNoX3ZjcHVfZ2V0X3JlZ3Moc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1
Y3Qga3ZtX3JlZ3MgKnJlZ3MpCit7CisJX19nZXRfcmVncyh2Y3B1LCByZWdzKTsKK30KKwogc3Rh
dGljIHZvaWQgX19zZXRfcmVncyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcmVn
cyAqcmVncykKIHsKIAl2Y3B1LT5hcmNoLmVtdWxhdGVfcmVnc19uZWVkX3N5bmNfZnJvbV92Y3B1
ID0gdHJ1ZTsKQEAgLTg4ODMsNiArODg4OCwxMSBAQCBpbnQga3ZtX2FyY2hfdmNwdV9pb2N0bF9n
ZXRfc3JlZ3Moc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCXJldHVybiAwOwogfQogCit2b2lkIGt2
bV9hcmNoX3ZjcHVfZ2V0X3NyZWdzKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9z
cmVncyAqc3JlZ3MpCit7CisJX19nZXRfc3JlZ3ModmNwdSwgc3JlZ3MpOworfQorCiBpbnQga3Zt
X2FyY2hfdmNwdV9pb2N0bF9nZXRfbXBzdGF0ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJCQkJ
ICAgIHN0cnVjdCBrdm1fbXBfc3RhdGUgKm1wX3N0YXRlKQogewpkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9saW51eC9rdm1faG9zdC5oIGIvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oCmluZGV4IDY2ODA1
OTJmMmRlMS4uMThiN2QyYTI1OWI3IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0
LmgKKysrIGIvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oCkBAIC04NTMsOSArODUzLDEyIEBAIGlu
dCBrdm1fYXJjaF92Y3B1X2lvY3RsX3RyYW5zbGF0ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJ
CQkJICAgIHN0cnVjdCBrdm1fdHJhbnNsYXRpb24gKnRyKTsKIAogaW50IGt2bV9hcmNoX3ZjcHVf
aW9jdGxfZ2V0X3JlZ3Moc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3JlZ3MgKnJl
Z3MpOwordm9pZCBrdm1fYXJjaF92Y3B1X2dldF9yZWdzKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwg
c3RydWN0IGt2bV9yZWdzICpyZWdzKTsKIGludCBrdm1fYXJjaF92Y3B1X2lvY3RsX3NldF9yZWdz
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9yZWdzICpyZWdzKTsKIGludCBrdm1f
YXJjaF92Y3B1X2lvY3RsX2dldF9zcmVncyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJCQkJICBz
dHJ1Y3Qga3ZtX3NyZWdzICpzcmVncyk7Cit2b2lkIGt2bV9hcmNoX3ZjcHVfZ2V0X3NyZWdzKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwKKwkJCQkgIHN0cnVjdCBrdm1fc3JlZ3MgKnNyZWdzKTsKIGlu
dCBrdm1fYXJjaF92Y3B1X2lvY3RsX3NldF9zcmVncyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJ
CQkJICBzdHJ1Y3Qga3ZtX3NyZWdzICpzcmVncyk7CiBpbnQga3ZtX2FyY2hfdmNwdV9pb2N0bF9n
ZXRfbXBzdGF0ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0
dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4
Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
