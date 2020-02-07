Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8B9155E0C
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 19:26:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 845FA869C0;
	Fri,  7 Feb 2020 18:26:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bJlAl2JwcdQv; Fri,  7 Feb 2020 18:26:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B9D1E8692F;
	Fri,  7 Feb 2020 18:26:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9241FC013E;
	Fri,  7 Feb 2020 18:26:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 68ECEC1D88
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5074E87FB9
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:26:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yF1qzPvAgl0n
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C9F1A87EC4
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:55 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 C229C305D490; Fri,  7 Feb 2020 20:16:38 +0200 (EET)
Received: from host.bbu.bitdefender.biz (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id AE880305206A;
 Fri,  7 Feb 2020 20:16:38 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v7 07/78] KVM: x86: add kvm_arch_vcpu_get_regs() and
 kvm_arch_vcpu_get_sregs()
Date: Fri,  7 Feb 2020 20:15:25 +0200
Message-Id: <20200207181636.1065-8-alazar@bitdefender.com>
In-Reply-To: <20200207181636.1065-1-alazar@bitdefender.com>
References: <20200207181636.1065-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>,
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhlc2UgZnVuY3Rp
b25zIGFyZSBuZWVkZWQgZm9yIFZNIGludHJvc3BlY3Rpb24gKGdldCByZWdpc3RlcnMgY29tbWFu
ZHMKYW5kIGFsbCBldmVudHMgc2VuZGluZyB0aGUgdkNQVSByZWdpc3RlcnMgdG8gdGhlIGludHJv
c3BlY3Rpb24gdG9vbCkuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaSBEb27Im3UgPG1kb250dUBiaXRk
ZWZlbmRlci5jb20+ClNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJpdGRl
ZmVuZGVyLmNvbT4KLS0tCiBhcmNoL3g4Ni9rdm0veDg2LmMgICAgICAgfCAxMCArKysrKysrKysr
CiBpbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmggfCAgMyArKysKIDIgZmlsZXMgY2hhbmdlZCwgMTMg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS94ODYuYyBiL2FyY2gveDg2
L2t2bS94ODYuYwppbmRleCBjZjkxNzEzOWRlNmIuLmZmMGMxMmE5MzIyZCAxMDA2NDQKLS0tIGEv
YXJjaC94ODYva3ZtL3g4Ni5jCisrKyBiL2FyY2gveDg2L2t2bS94ODYuYwpAQCAtODYxNSw2ICs4
NjE1LDExIEBAIGludCBrdm1fYXJjaF92Y3B1X2lvY3RsX2dldF9yZWdzKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSwgc3RydWN0IGt2bV9yZWdzICpyZWdzKQogCXJldHVybiAwOwogfQogCit2b2lkIGt2
bV9hcmNoX3ZjcHVfZ2V0X3JlZ3Moc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3Jl
Z3MgKnJlZ3MpCit7CisJX19nZXRfcmVncyh2Y3B1LCByZWdzKTsKK30KKwogc3RhdGljIHZvaWQg
X19zZXRfcmVncyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcmVncyAqcmVncykK
IHsKIAl2Y3B1LT5hcmNoLmVtdWxhdGVfcmVnc19uZWVkX3N5bmNfZnJvbV92Y3B1ID0gdHJ1ZTsK
QEAgLTg3MTAsNiArODcxNSwxMSBAQCBpbnQga3ZtX2FyY2hfdmNwdV9pb2N0bF9nZXRfc3JlZ3Mo
c3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCXJldHVybiAwOwogfQogCit2b2lkIGt2bV9hcmNoX3Zj
cHVfZ2V0X3NyZWdzKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9zcmVncyAqc3Jl
Z3MpCit7CisJX19nZXRfc3JlZ3ModmNwdSwgc3JlZ3MpOworfQorCiBpbnQga3ZtX2FyY2hfdmNw
dV9pb2N0bF9nZXRfbXBzdGF0ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJCQkJICAgIHN0cnVj
dCBrdm1fbXBfc3RhdGUgKm1wX3N0YXRlKQogewpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9r
dm1faG9zdC5oIGIvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oCmluZGV4IGU4MjZlODc0Yjk5OC4u
NjJmNWJmODJhZGMwIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmgKKysrIGIv
aW5jbHVkZS9saW51eC9rdm1faG9zdC5oCkBAIC04NTMsOSArODUzLDEyIEBAIGludCBrdm1fYXJj
aF92Y3B1X2lvY3RsX3RyYW5zbGF0ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJCQkJICAgIHN0
cnVjdCBrdm1fdHJhbnNsYXRpb24gKnRyKTsKIAogaW50IGt2bV9hcmNoX3ZjcHVfaW9jdGxfZ2V0
X3JlZ3Moc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3JlZ3MgKnJlZ3MpOwordm9p
ZCBrdm1fYXJjaF92Y3B1X2dldF9yZWdzKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2
bV9yZWdzICpyZWdzKTsKIGludCBrdm1fYXJjaF92Y3B1X2lvY3RsX3NldF9yZWdzKHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9yZWdzICpyZWdzKTsKIGludCBrdm1fYXJjaF92Y3B1
X2lvY3RsX2dldF9zcmVncyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJCQkJICBzdHJ1Y3Qga3Zt
X3NyZWdzICpzcmVncyk7Cit2b2lkIGt2bV9hcmNoX3ZjcHVfZ2V0X3NyZWdzKHN0cnVjdCBrdm1f
dmNwdSAqdmNwdSwKKwkJCQkgIHN0cnVjdCBrdm1fc3JlZ3MgKnNyZWdzKTsKIGludCBrdm1fYXJj
aF92Y3B1X2lvY3RsX3NldF9zcmVncyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJCQkJICBzdHJ1
Y3Qga3ZtX3NyZWdzICpzcmVncyk7CiBpbnQga3ZtX2FyY2hfdmNwdV9pb2N0bF9nZXRfbXBzdGF0
ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlv
bkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
