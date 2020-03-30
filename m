Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A603A197890
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 12:13:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4B6F987C22;
	Mon, 30 Mar 2020 10:13:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nDozDsZpKCNl; Mon, 30 Mar 2020 10:13:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2315887C1C;
	Mon, 30 Mar 2020 10:13:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0D57DC1AE8;
	Mon, 30 Mar 2020 10:13:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C7347C07FF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B4FFB88448
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lm1YOheAQsVa
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5ECC387B9B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:55 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 CC29E3074B6A; Mon, 30 Mar 2020 13:12:53 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id AAB85305B7A1;
 Mon, 30 Mar 2020 13:12:53 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v8 33/81] KVM: x86: page track: add track_create_slot()
 callback
Date: Mon, 30 Mar 2020 13:12:20 +0300
Message-Id: <20200330101308.21702-34-alazar@bitdefender.com>
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
eDg2L2t2bS94ODYuYyBiL2FyY2gveDg2L2t2bS94ODYuYwppbmRleCBkMzVlYTE5NDE3Y2EuLjE3
ZThhOWQ0ZTEzOCAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL3g4Ni5jCisrKyBiL2FyY2gveDg2
L2t2bS94ODYuYwpAQCAtOTk0Niw3ICs5OTQ2LDcgQEAgaW50IGt2bV9hcmNoX2NyZWF0ZV9tZW1z
bG90KHN0cnVjdCBrdm0gKmt2bSwgc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqc2xvdCwKIAkJfQog
CX0KIAotCWlmIChrdm1fcGFnZV90cmFja19jcmVhdGVfbWVtc2xvdChzbG90LCBucGFnZXMpKQor
CWlmIChrdm1fcGFnZV90cmFja19jcmVhdGVfbWVtc2xvdChrdm0sIHNsb3QsIG5wYWdlcykpCiAJ
CWdvdG8gb3V0X2ZyZWU7CiAKIAlyZXR1cm4gMDsKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxp
emF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
