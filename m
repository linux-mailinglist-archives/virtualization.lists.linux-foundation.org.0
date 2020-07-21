Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C89D228B31
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 23:26:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id ABBA586C1E;
	Tue, 21 Jul 2020 21:26:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RQdxIftaqnr7; Tue, 21 Jul 2020 21:26:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8E8F786C1B;
	Tue, 21 Jul 2020 21:26:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76E5AC016F;
	Tue, 21 Jul 2020 21:26:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF4AFC016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AA49088299
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:26:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZDqjKSe2NVr7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E00B58828F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:56 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 AB394305D7E6; Wed, 22 Jul 2020 00:09:19 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 8BE15303EF1F;
 Wed, 22 Jul 2020 00:09:19 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v9 06/84] KVM: x86: add kvm_arch_vcpu_get_regs() and
 kvm_arch_vcpu_get_sregs()
Date: Wed, 22 Jul 2020 00:08:04 +0300
Message-Id: <20200721210922.7646-7-alazar@bitdefender.com>
In-Reply-To: <20200721210922.7646-1-alazar@bitdefender.com>
References: <20200721210922.7646-1-alazar@bitdefender.com>
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
b25zIGFyZSB1c2VkIGJ5IHRoZSBWTSBpbnRyb3NwZWN0aW9uIGNvZGUKKGZvciB0aGUgS1ZNSV9W
Q1BVX0dFVF9SRUdJU1RFUlMgY29tbWFuZCBhbmQgYWxsIGV2ZW50cyBzZW5kaW5nIHRoZSB2Q1BV
CnJlZ2lzdGVycyB0byB0aGUgaW50cm9zcGVjdGlvbiB0b29sKS4KClNpZ25lZC1vZmYtYnk6IE1p
aGFpIERvbsibdSA8bWRvbnR1QGJpdGRlZmVuZGVyLmNvbT4KU2lnbmVkLW9mZi1ieTogQWRhbGJl
cnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIGFyY2gveDg2L2t2bS94ODYu
YyAgICAgICB8IDEwICsrKysrKysrKysKIGluY2x1ZGUvbGludXgva3ZtX2hvc3QuaCB8ICAzICsr
KwogMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC94
ODYva3ZtL3g4Ni5jIGIvYXJjaC94ODYva3ZtL3g4Ni5jCmluZGV4IDg4YzU5M2Y4M2IyOC4uMTA0
MTBlYmRhMDM0IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0veDg2LmMKKysrIGIvYXJjaC94ODYv
a3ZtL3g4Ni5jCkBAIC04OTM5LDYgKzg5MzksMTEgQEAgaW50IGt2bV9hcmNoX3ZjcHVfaW9jdGxf
Z2V0X3JlZ3Moc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3JlZ3MgKnJlZ3MpCiAJ
cmV0dXJuIDA7CiB9CiAKK3ZvaWQga3ZtX2FyY2hfdmNwdV9nZXRfcmVncyhzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHUsIHN0cnVjdCBrdm1fcmVncyAqcmVncykKK3sKKwlfX2dldF9yZWdzKHZjcHUsIHJl
Z3MpOworfQorCiBzdGF0aWMgdm9pZCBfX3NldF9yZWdzKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwg
c3RydWN0IGt2bV9yZWdzICpyZWdzKQogewogCXZjcHUtPmFyY2guZW11bGF0ZV9yZWdzX25lZWRf
c3luY19mcm9tX3ZjcHUgPSB0cnVlOwpAQCAtOTAzNCw2ICs5MDM5LDExIEBAIGludCBrdm1fYXJj
aF92Y3B1X2lvY3RsX2dldF9zcmVncyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJcmV0dXJuIDA7
CiB9CiAKK3ZvaWQga3ZtX2FyY2hfdmNwdV9nZXRfc3JlZ3Moc3RydWN0IGt2bV92Y3B1ICp2Y3B1
LCBzdHJ1Y3Qga3ZtX3NyZWdzICpzcmVncykKK3sKKwlfX2dldF9zcmVncyh2Y3B1LCBzcmVncyk7
Cit9CisKIGludCBrdm1fYXJjaF92Y3B1X2lvY3RsX2dldF9tcHN0YXRlKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSwKIAkJCQkgICAgc3RydWN0IGt2bV9tcF9zdGF0ZSAqbXBfc3RhdGUpCiB7CmRpZmYg
LS1naXQgYS9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmggYi9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0
LmgKaW5kZXggYTQyNDlmYzg4ZmMyLi4yM2FiNDkzMmY3ZTcgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUv
bGludXgva3ZtX2hvc3QuaAorKysgYi9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmgKQEAgLTg2NCw5
ICs4NjQsMTIgQEAgaW50IGt2bV9hcmNoX3ZjcHVfaW9jdGxfdHJhbnNsYXRlKHN0cnVjdCBrdm1f
dmNwdSAqdmNwdSwKIAkJCQkgICAgc3RydWN0IGt2bV90cmFuc2xhdGlvbiAqdHIpOwogCiBpbnQg
a3ZtX2FyY2hfdmNwdV9pb2N0bF9nZXRfcmVncyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVj
dCBrdm1fcmVncyAqcmVncyk7Cit2b2lkIGt2bV9hcmNoX3ZjcHVfZ2V0X3JlZ3Moc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3JlZ3MgKnJlZ3MpOwogaW50IGt2bV9hcmNoX3ZjcHVf
aW9jdGxfc2V0X3JlZ3Moc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3JlZ3MgKnJl
Z3MpOwogaW50IGt2bV9hcmNoX3ZjcHVfaW9jdGxfZ2V0X3NyZWdzKHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSwKIAkJCQkgIHN0cnVjdCBrdm1fc3JlZ3MgKnNyZWdzKTsKK3ZvaWQga3ZtX2FyY2hfdmNw
dV9nZXRfc3JlZ3Moc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAorCQkJCSAgc3RydWN0IGt2bV9zcmVn
cyAqc3JlZ3MpOwogaW50IGt2bV9hcmNoX3ZjcHVfaW9jdGxfc2V0X3NyZWdzKHN0cnVjdCBrdm1f
dmNwdSAqdmNwdSwKIAkJCQkgIHN0cnVjdCBrdm1fc3JlZ3MgKnNyZWdzKTsKIGludCBrdm1fYXJj
aF92Y3B1X2lvY3RsX2dldF9tcHN0YXRlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFp
bGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBz
Oi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0
aW9u
