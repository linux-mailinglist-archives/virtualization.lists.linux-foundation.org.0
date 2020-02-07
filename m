Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 92998155DEE
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 19:26:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A3CB4869A5;
	Fri,  7 Feb 2020 18:26:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fA11AI3334gr; Fri,  7 Feb 2020 18:25:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D85D386925;
	Fri,  7 Feb 2020 18:25:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CFB54C1D81;
	Fri,  7 Feb 2020 18:25:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A1B0C013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 329AC22621
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mwlwyHKS3EE2
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by silver.osuosl.org (Postfix) with ESMTPS id A5A5B2040D
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:53 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 08487305D3F3; Fri,  7 Feb 2020 20:16:40 +0200 (EET)
Received: from host.bbu.bitdefender.biz (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id EE685305206F;
 Fri,  7 Feb 2020 20:16:39 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v7 31/78] KVM: x86: page track: add track_create_slot()
 callback
Date: Fri,  7 Feb 2020 20:15:49 +0200
Message-Id: <20200207181636.1065-32-alazar@bitdefender.com>
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyBpcyB1c2Vk
IHRvIGFkZCBwYWdlIGFjY2VzcyBub3RpZmljYXRpb25zIGFzIHNvb24gYXMgYSBzbG90IGFwcGVh
cnMuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaSBEb27Im3UgPG1kb250dUBiaXRkZWZlbmRlci5jb20+
ClNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJpdGRlZmVuZGVyLmNvbT4K
LS0tCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1fcGFnZV90cmFjay5oIHwgMTMgKysrKysrKysr
KysrLQogYXJjaC94ODYva3ZtL21tdS9wYWdlX3RyYWNrLmMgICAgICAgICB8IDE2ICsrKysrKysr
KysrKysrKy0KIGFyY2gveDg2L2t2bS94ODYuYyAgICAgICAgICAgICAgICAgICAgfCAgMiArLQog
MyBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9wYWdlX3RyYWNrLmggYi9hcmNoL3g4Ni9p
bmNsdWRlL2FzbS9rdm1fcGFnZV90cmFjay5oCmluZGV4IGU5MWY1YTE2ZTc0MS4uZGM1MjhjNmYy
ZWIwIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1fcGFnZV90cmFjay5oCisr
KyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9wYWdlX3RyYWNrLmgKQEAgLTM2LDYgKzM2LDE3
IEBAIHN0cnVjdCBrdm1fcGFnZV90cmFja19ub3RpZmllcl9ub2RlIHsKIAl2b2lkICgqdHJhY2tf
d3JpdGUpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgZ3BhX3QgZ3BhLCBndmFfdCBndmEsCiAJCQkg
ICAgY29uc3QgdTggKm5ldywgaW50IGJ5dGVzLAogCQkJICAgIHN0cnVjdCBrdm1fcGFnZV90cmFj
a19ub3RpZmllcl9ub2RlICpub2RlKTsKKwkvKgorCSAqIEl0IGlzIGNhbGxlZCB3aGVuIG1lbW9y
eSBzbG90IGlzIGJlaW5nIGNyZWF0ZWQKKwkgKgorCSAqIEBrdm06IHRoZSBrdm0gd2hlcmUgbWVt
b3J5IHNsb3QgYmVpbmcgbW92ZWQgb3IgcmVtb3ZlZAorCSAqIEBzbG90OiB0aGUgbWVtb3J5IHNs
b3QgYmVpbmcgbW92ZWQgb3IgcmVtb3ZlZAorCSAqIEBucGFnZXM6IHRoZSBudW1iZXIgb2YgcGFn
ZXMKKwkgKiBAbm9kZTogdGhpcyBub2RlCisJICovCisJdm9pZCAoKnRyYWNrX2NyZWF0ZV9zbG90
KShzdHJ1Y3Qga3ZtICprdm0sIHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNsb3QsCisJCQkJICB1
bnNpZ25lZCBsb25nIG5wYWdlcywKKwkJCQkgIHN0cnVjdCBrdm1fcGFnZV90cmFja19ub3RpZmll
cl9ub2RlICpub2RlKTsKIAkvKgogCSAqIEl0IGlzIGNhbGxlZCB3aGVuIG1lbW9yeSBzbG90IGlz
IGJlaW5nIG1vdmVkIG9yIHJlbW92ZWQKIAkgKiB1c2VycyBjYW4gZHJvcCB3cml0ZS1wcm90ZWN0
aW9uIGZvciB0aGUgcGFnZXMgaW4gdGhhdCBtZW1vcnkgc2xvdApAQCAtNTMsNyArNjQsNyBAQCB2
b2lkIGt2bV9wYWdlX3RyYWNrX2NsZWFudXAoc3RydWN0IGt2bSAqa3ZtKTsKIAogdm9pZCBrdm1f
cGFnZV90cmFja19mcmVlX21lbXNsb3Qoc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqZnJlZSwKIAkJ
CQkgc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqZG9udCk7Ci1pbnQga3ZtX3BhZ2VfdHJhY2tfY3Jl
YXRlX21lbXNsb3Qoc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqc2xvdCwKK2ludCBrdm1fcGFnZV90
cmFja19jcmVhdGVfbWVtc2xvdChzdHJ1Y3Qga3ZtICprdm0sIHN0cnVjdCBrdm1fbWVtb3J5X3Ns
b3QgKnNsb3QsCiAJCQkJICB1bnNpZ25lZCBsb25nIG5wYWdlcyk7CiAKIHZvaWQga3ZtX3Nsb3Rf
cGFnZV90cmFja19hZGRfcGFnZShzdHJ1Y3Qga3ZtICprdm0sCmRpZmYgLS1naXQgYS9hcmNoL3g4
Ni9rdm0vbW11L3BhZ2VfdHJhY2suYyBiL2FyY2gveDg2L2t2bS9tbXUvcGFnZV90cmFjay5jCmlu
ZGV4IGRjODkxZDZhMjU1My4uZjM2ZTc0NDMwYWQyIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0v
bW11L3BhZ2VfdHJhY2suYworKysgYi9hcmNoL3g4Ni9rdm0vbW11L3BhZ2VfdHJhY2suYwpAQCAt
MzIsOSArMzIsMTIgQEAgdm9pZCBrdm1fcGFnZV90cmFja19mcmVlX21lbXNsb3Qoc3RydWN0IGt2
bV9tZW1vcnlfc2xvdCAqZnJlZSwKIAkJfQogfQogCi1pbnQga3ZtX3BhZ2VfdHJhY2tfY3JlYXRl
X21lbXNsb3Qoc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqc2xvdCwKK2ludCBrdm1fcGFnZV90cmFj
a19jcmVhdGVfbWVtc2xvdChzdHJ1Y3Qga3ZtICprdm0sIHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3Qg
KnNsb3QsCiAJCQkJICB1bnNpZ25lZCBsb25nIG5wYWdlcykKIHsKKwlzdHJ1Y3Qga3ZtX3BhZ2Vf
dHJhY2tfbm90aWZpZXJfaGVhZCAqaGVhZDsKKwlzdHJ1Y3Qga3ZtX3BhZ2VfdHJhY2tfbm90aWZp
ZXJfbm9kZSAqbjsKKwlpbnQgaWR4OwogCWludCAgaTsKIAogCWZvciAoaSA9IDA7IGkgPCBLVk1f
UEFHRV9UUkFDS19NQVg7IGkrKykgewpAQCAtNDUsNiArNDgsMTcgQEAgaW50IGt2bV9wYWdlX3Ry
YWNrX2NyZWF0ZV9tZW1zbG90KHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNsb3QsCiAJCQlnb3Rv
IHRyYWNrX2ZyZWU7CiAJfQogCisJaGVhZCA9ICZrdm0tPmFyY2gudHJhY2tfbm90aWZpZXJfaGVh
ZDsKKworCWlmIChobGlzdF9lbXB0eSgmaGVhZC0+dHJhY2tfbm90aWZpZXJfbGlzdCkpCisJCXJl
dHVybiAwOworCisJaWR4ID0gc3JjdV9yZWFkX2xvY2soJmhlYWQtPnRyYWNrX3NyY3UpOworCWhs
aXN0X2Zvcl9lYWNoX2VudHJ5X3JjdShuLCAmaGVhZC0+dHJhY2tfbm90aWZpZXJfbGlzdCwgbm9k
ZSkKKwkJaWYgKG4tPnRyYWNrX2NyZWF0ZV9zbG90KQorCQkJbi0+dHJhY2tfY3JlYXRlX3Nsb3Qo
a3ZtLCBzbG90LCBucGFnZXMsIG4pOworCXNyY3VfcmVhZF91bmxvY2soJmhlYWQtPnRyYWNrX3Ny
Y3UsIGlkeCk7CisKIAlyZXR1cm4gMDsKIAogdHJhY2tfZnJlZToKZGlmZiAtLWdpdCBhL2FyY2gv
eDg2L2t2bS94ODYuYyBiL2FyY2gveDg2L2t2bS94ODYuYwppbmRleCAwZGQ0M2NmNWQyYjEuLmM3
M2RhNDA3OTFhNyAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL3g4Ni5jCisrKyBiL2FyY2gveDg2
L2t2bS94ODYuYwpAQCAtOTc3Miw3ICs5NzcyLDcgQEAgaW50IGt2bV9hcmNoX2NyZWF0ZV9tZW1z
bG90KHN0cnVjdCBrdm0gKmt2bSwgc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqc2xvdCwKIAkJfQog
CX0KIAotCWlmIChrdm1fcGFnZV90cmFja19jcmVhdGVfbWVtc2xvdChzbG90LCBucGFnZXMpKQor
CWlmIChrdm1fcGFnZV90cmFja19jcmVhdGVfbWVtc2xvdChrdm0sIHNsb3QsIG5wYWdlcykpCiAJ
CWdvdG8gb3V0X2ZyZWU7CiAKIAlyZXR1cm4gMDsKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxp
emF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
