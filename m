Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E518229C9F
	for <lists.virtualization@lfdr.de>; Wed, 22 Jul 2020 18:02:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B35B1885F0;
	Wed, 22 Jul 2020 16:02:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id phEqI5hYFa0B; Wed, 22 Jul 2020 16:02:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 783958876A;
	Wed, 22 Jul 2020 16:01:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 661DEC004C;
	Wed, 22 Jul 2020 16:01:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9235AC004E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8B97088169
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eBk3tnejsukc
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 94EB988161
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:37 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 9928D305D76A; Wed, 22 Jul 2020 19:01:32 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.6])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 8E9A4305FFA6;
 Wed, 22 Jul 2020 19:01:32 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v1 19/34] KVM: introspection: clean non-default EPTs on
 unhook
Date: Wed, 22 Jul 2020 19:01:06 +0300
Message-Id: <20200722160121.9601-20-alazar@bitdefender.com>
In-Reply-To: <20200722160121.9601-1-alazar@bitdefender.com>
References: <20200722160121.9601-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?=C8=98tefan=20=C8=98icleru?= <ssicleru@bitdefender.com>,
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

RnJvbTogyJh0ZWZhbiDImGljbGVydSA8c3NpY2xlcnVAYml0ZGVmZW5kZXIuY29tPgoKV2hlbiBh
IGd1ZXN0IGlzIHVuaG9va2VkLCB0aGUgVk0gaXMgYnJvdWdodCB0byBkZWZhdWx0IHN0YXRlIGFu
ZCB1c2VzCmRlZmF1bHQgRVBUIHZpZXcuIERlbGV0ZSBhbGwgc2hhZG93IHBhZ2VzIHRoYXQgYmVs
b25nIHRvIG5vbi1kZWZhdWx0IEVQVAp2aWV3cyBpbiBvcmRlciB0byBmcmVlIHVudXNlZCBzaGFk
b3cgcGFnZXMuIFRoZXkgYXJlIG5vdCB1c2VkIGJlY2F1c2UKdGhlIGd1ZXN0IGNhbm5vdCBWTUZV
TkMgdG8gYW55IEVQVCB2aWV3LgoKU2lnbmVkLW9mZi1ieTogyJh0ZWZhbiDImGljbGVydSA8c3Np
Y2xlcnVAYml0ZGVmZW5kZXIuY29tPgpTaWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFs
YXphckBiaXRkZWZlbmRlci5jb20+Ci0tLQogYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3Qu
aCB8ICAyICsrCiBhcmNoL3g4Ni9rdm0va3ZtaS5jICAgICAgICAgICAgIHwgMjMgKysrKysrKysr
KysrKysrKysrKysrKy0KIHZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaS5jICAgfCAgMyArKysK
IDMgZmlsZXMgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggYi9hcmNoL3g4Ni9pbmNsdWRl
L2FzbS9rdm1faG9zdC5oCmluZGV4IDUxOWI4MjEwYjhlZi4uMDg2YjZlMmEyMzE0IDEwMDY0NAot
LS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCisrKyBiL2FyY2gveDg2L2luY2x1
ZGUvYXNtL2t2bV9ob3N0LmgKQEAgLTEwMjYsNiArMTAyNiw4IEBAIHN0cnVjdCBrdm1fYXJjaCB7
CiAKIAlzdHJ1Y3Qga3ZtX3BtdV9ldmVudF9maWx0ZXIgKnBtdV9ldmVudF9maWx0ZXI7CiAJc3Ry
dWN0IHRhc2tfc3RydWN0ICpueF9scGFnZV9yZWNvdmVyeV90aHJlYWQ7CisKKwlyZWZjb3VudF90
IGt2bWlfcmVmY291bnQ7CiB9OwogCiBzdHJ1Y3Qga3ZtX3ZtX3N0YXQgewpkaWZmIC0tZ2l0IGEv
YXJjaC94ODYva3ZtL2t2bWkuYyBiL2FyY2gveDg2L2t2bS9rdm1pLmMKaW5kZXggNTI4ODViOWU1
YjZlLi4yN2ZkNzMyY2ZmMjkgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS9rdm1pLmMKKysrIGIv
YXJjaC94ODYva3ZtL2t2bWkuYwpAQCAtNjQwLDYgKzY0MCwyNSBAQCBzdGF0aWMgdm9pZCBrdm1p
X2FyY2hfcmVzdG9yZV9pbnRlcmNlcHRpb24oc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogCWt2bWlf
YXJjaF9kaXNhYmxlX21zcndfaW50ZXJjZXB0KHZjcHUsIGFyY2hfdmNwdWktPm1zcncua3ZtaV9t
YXNrLmhpZ2gpOwogfQogCit2b2lkIGt2bWlfYXJjaF9yZXN0b3JlX2VwdF92aWV3KHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSkKK3sKKwlzdHJ1Y3Qga3ZtICprdm0gPSB2Y3B1LT5rdm07CisJdTE2IHZp
ZXcsIGRlZmF1bHRfdmlldyA9IDA7CisJYm9vbCB2aXNpYmxlID0gZmFsc2U7CisKKwlpZiAoa3Zt
X2dldF9lcHRfdmlldyh2Y3B1KSAhPSBkZWZhdWx0X3ZpZXcpCisJCWt2bWlfYXJjaF9jbWRfc2V0
X2VwdF92aWV3KHZjcHUsIGRlZmF1bHRfdmlldyk7CisKKwlmb3IgKHZpZXcgPSAwOyB2aWV3IDwg
S1ZNX01BWF9FUFRfVklFV1M7IHZpZXcrKykKKwkJa3ZtaV9hcmNoX2NtZF9jb250cm9sX2VwdF92
aWV3KHZjcHUsIHZpZXcsIHZpc2libGUpOworCisJaWYgKHJlZmNvdW50X2RlY19hbmRfdGVzdCgm
a3ZtLT5hcmNoLmt2bWlfcmVmY291bnQpKSB7CisJCXUxNiB6YXBfbWFzayA9IH4oMSA8PCBkZWZh
dWx0X3ZpZXcpOworCisJCWt2bV9tbXVfemFwX2FsbCh2Y3B1LT5rdm0sIHphcF9tYXNrKTsKKwl9
Cit9CisKIGJvb2wga3ZtaV9hcmNoX2NsZWFuX3VwX2ludGVyY2VwdGlvbihzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHUpCiB7CiAJc3RydWN0IGt2bWlfaW50ZXJjZXB0aW9uICphcmNoX3ZjcHVpID0gdmNw
dS0+YXJjaC5rdm1pOwpAQCAtNjQ3LDggKzY2NiwxMCBAQCBib29sIGt2bWlfYXJjaF9jbGVhbl91
cF9pbnRlcmNlcHRpb24oc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogCWlmICghYXJjaF92Y3B1aSB8
fCAhYXJjaF92Y3B1aS0+Y2xlYW51cCkKIAkJcmV0dXJuIGZhbHNlOwogCi0JaWYgKGFyY2hfdmNw
dWktPnJlc3RvcmVfaW50ZXJjZXB0aW9uKQorCWlmIChhcmNoX3ZjcHVpLT5yZXN0b3JlX2ludGVy
Y2VwdGlvbikgewogCQlrdm1pX2FyY2hfcmVzdG9yZV9pbnRlcmNlcHRpb24odmNwdSk7CisJCWt2
bWlfYXJjaF9yZXN0b3JlX2VwdF92aWV3KHZjcHUpOworCX0KIAogCXJldHVybiB0cnVlOwogfQpk
aWZmIC0tZ2l0IGEvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pLmMgYi92aXJ0L2t2bS9pbnRy
b3NwZWN0aW9uL2t2bWkuYwppbmRleCA0NGIwMDkyZTMwNGYuLmYzYmRlZjNjNTRlNiAxMDA2NDQK
LS0tIGEvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pLmMKKysrIGIvdmlydC9rdm0vaW50cm9z
cGVjdGlvbi9rdm1pLmMKQEAgLTI4OCw2ICsyODgsOSBAQCBzdGF0aWMgdm9pZCBmcmVlX2t2bWko
c3RydWN0IGt2bSAqa3ZtKQogCiAJa3ZtaV9jbGVhcl9tZW1fYWNjZXNzKGt2bSk7CiAKKwlyZWZj
b3VudF9zZXQoJmt2bS0+YXJjaC5rdm1pX3JlZmNvdW50LAorCQkJYXRvbWljX3JlYWQoJmt2bS0+
b25saW5lX3ZjcHVzKSk7CisKIAlrdm1fZm9yX2VhY2hfdmNwdShpLCB2Y3B1LCBrdm0pCiAJCWZy
ZWVfdmNwdWkodmNwdSwgcmVzdG9yZV9pbnRlcmNlcHRpb24pOwogCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlz
dApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3Rz
LmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
