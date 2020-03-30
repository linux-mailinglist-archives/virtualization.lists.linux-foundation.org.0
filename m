Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A7C19787D
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 12:13:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 88D39884BB;
	Mon, 30 Mar 2020 10:13:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Ik-i52qFv54; Mon, 30 Mar 2020 10:12:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 99A088843E;
	Mon, 30 Mar 2020 10:12:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C8F7C07FF;
	Mon, 30 Mar 2020 10:12:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B314CC07FF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A2D9E878D6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E5XXncAjrGZD
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7383787881
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:52 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 BB4DD30747C5; Mon, 30 Mar 2020 13:12:49 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 9C39A305B7A0;
 Mon, 30 Mar 2020 13:12:49 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v8 08/81] KVM: x86: add kvm_arch_vcpu_set_regs()
Date: Mon, 30 Mar 2020 13:11:55 +0300
Message-Id: <20200330101308.21702-9-alazar@bitdefender.com>
In-Reply-To: <20200330101308.21702-1-alazar@bitdefender.com>
References: <20200330101308.21702-1-alazar@bitdefender.com>
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

RnJvbTogTmljdciZb3IgQ8OuyJt1IDxuY2l0dUBiaXRkZWZlbmRlci5jb20+CgpUaGlzIGlzIG5l
ZWRlZCBmb3IgdGhlIEtWTUlfVkNQVV9TRVRfUkVHSVNURVJTIGNvbW1hbmQsCmJ1dCB3aXRob3V0
IGNsZWFyaW5nIHRoZSBwZW5kaW5nIGV4Y2VwdGlvbi4KClNpZ25lZC1vZmYtYnk6IE5pY3XImW9y
IEPDrsibdSA8bmNpdHVAYml0ZGVmZW5kZXIuY29tPgpTaWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBM
YXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+Ci0tLQogYXJjaC94ODYva3ZtL3g4Ni5jICAg
ICAgIHwgMjEgKysrKysrKysrKysrKystLS0tLS0tCiBpbmNsdWRlL2xpbnV4L2t2bV9ob3N0Lmgg
fCAgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS94ODYuYyBiL2FyY2gveDg2L2t2bS94ODYuYwpp
bmRleCBkNDViNTA5M2ZkZDMuLjdmMjNlMDE1ZmM4NiAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3Zt
L3g4Ni5jCisrKyBiL2FyY2gveDg2L2t2bS94ODYuYwpAQCAtODgxOSwxNiArODgxOSwyMyBAQCBz
dGF0aWMgdm9pZCBfX3NldF9yZWdzKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9y
ZWdzICpyZWdzKQogCiAJa3ZtX3JpcF93cml0ZSh2Y3B1LCByZWdzLT5yaXApOwogCWt2bV9zZXRf
cmZsYWdzKHZjcHUsIHJlZ3MtPnJmbGFncyB8IFg4Nl9FRkxBR1NfRklYRUQpOwotCi0JdmNwdS0+
YXJjaC5leGNlcHRpb24ucGVuZGluZyA9IGZhbHNlOwotCi0Ja3ZtX21ha2VfcmVxdWVzdChLVk1f
UkVRX0VWRU5ULCB2Y3B1KTsKIH0KIAotaW50IGt2bV9hcmNoX3ZjcHVfaW9jdGxfc2V0X3JlZ3Mo
c3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3JlZ3MgKnJlZ3MpCit2b2lkIGt2bV9h
cmNoX3ZjcHVfc2V0X3JlZ3Moc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3JlZ3Mg
KnJlZ3MsCisJCQkgICAgYm9vbCBjbGVhcl9leGNlcHRpb24pCiB7Ci0JdmNwdV9sb2FkKHZjcHUp
OwogCV9fc2V0X3JlZ3ModmNwdSwgcmVncyk7CisKKwlpZiAoY2xlYXJfZXhjZXB0aW9uKQorCQl2
Y3B1LT5hcmNoLmV4Y2VwdGlvbi5wZW5kaW5nID0gZmFsc2U7CisKKwlrdm1fbWFrZV9yZXF1ZXN0
KEtWTV9SRVFfRVZFTlQsIHZjcHUpOworfQorCitpbnQga3ZtX2FyY2hfdmNwdV9pb2N0bF9zZXRf
cmVncyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcmVncyAqcmVncykKK3sKKwl2
Y3B1X2xvYWQodmNwdSk7CisJa3ZtX2FyY2hfdmNwdV9zZXRfcmVncyh2Y3B1LCByZWdzLCB0cnVl
KTsKIAl2Y3B1X3B1dCh2Y3B1KTsKIAlyZXR1cm4gMDsKIH0KQEAgLTkyMzUsNyArOTI0Miw3IEBA
IHN0YXRpYyBpbnQgc3luY19yZWdzKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIAkJcmV0dXJuIC1F
SU5WQUw7CiAKIAlpZiAodmNwdS0+cnVuLT5rdm1fZGlydHlfcmVncyAmIEtWTV9TWU5DX1g4Nl9S
RUdTKSB7Ci0JCV9fc2V0X3JlZ3ModmNwdSwgJnZjcHUtPnJ1bi0+cy5yZWdzLnJlZ3MpOworCQlr
dm1fYXJjaF92Y3B1X3NldF9yZWdzKHZjcHUsICZ2Y3B1LT5ydW4tPnMucmVncy5yZWdzLCB0cnVl
KTsKIAkJdmNwdS0+cnVuLT5rdm1fZGlydHlfcmVncyAmPSB+S1ZNX1NZTkNfWDg2X1JFR1M7CiAJ
fQogCWlmICh2Y3B1LT5ydW4tPmt2bV9kaXJ0eV9yZWdzICYgS1ZNX1NZTkNfWDg2X1NSRUdTKSB7
CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmggYi9pbmNsdWRlL2xpbnV4L2t2
bV9ob3N0LmgKaW5kZXggMThiN2QyYTI1OWI3Li4zY2ZjMzhlZjQwNDggMTAwNjQ0Ci0tLSBhL2lu
Y2x1ZGUvbGludXgva3ZtX2hvc3QuaAorKysgYi9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmgKQEAg
LTg1NSw2ICs4NTUsOCBAQCBpbnQga3ZtX2FyY2hfdmNwdV9pb2N0bF90cmFuc2xhdGUoc3RydWN0
IGt2bV92Y3B1ICp2Y3B1LAogaW50IGt2bV9hcmNoX3ZjcHVfaW9jdGxfZ2V0X3JlZ3Moc3RydWN0
IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3JlZ3MgKnJlZ3MpOwogdm9pZCBrdm1fYXJjaF92
Y3B1X2dldF9yZWdzKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9yZWdzICpyZWdz
KTsKIGludCBrdm1fYXJjaF92Y3B1X2lvY3RsX3NldF9yZWdzKHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSwgc3RydWN0IGt2bV9yZWdzICpyZWdzKTsKK3ZvaWQga3ZtX2FyY2hfdmNwdV9zZXRfcmVncyhz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcmVncyAqcmVncywKKwkJCSAgICBib29s
IGNsZWFyX2V4Y2VwdGlvbik7CiBpbnQga3ZtX2FyY2hfdmNwdV9pb2N0bF9nZXRfc3JlZ3Moc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1LAogCQkJCSAgc3RydWN0IGt2bV9zcmVncyAqc3JlZ3MpOwogdm9p
ZCBrdm1fYXJjaF92Y3B1X2dldF9zcmVncyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1h
aWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXph
dGlvbg==
