Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AAC228AA7
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 23:16:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9E2A186B65;
	Tue, 21 Jul 2020 21:16:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dIydtZ2TMrBw; Tue, 21 Jul 2020 21:16:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7432986C2C;
	Tue, 21 Jul 2020 21:16:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 50CF5C016F;
	Tue, 21 Jul 2020 21:16:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 97741C08A6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7F58B886FC
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:16:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r8iZ824oD52w
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 432A2886C6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:57 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 C935C305D7E9; Wed, 22 Jul 2020 00:09:19 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id AA309303EF35;
 Wed, 22 Jul 2020 00:09:19 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v9 07/84] KVM: x86: add kvm_arch_vcpu_set_regs()
Date: Wed, 22 Jul 2020 00:08:05 +0300
Message-Id: <20200721210922.7646-8-alazar@bitdefender.com>
In-Reply-To: <20200721210922.7646-1-alazar@bitdefender.com>
References: <20200721210922.7646-1-alazar@bitdefender.com>
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
ZWRlZCBmb3IgdGhlIEtWTUlfVkNQVV9TRVRfUkVHSVNURVJTIGNvbW1hbmQsCndpdGhvdXQgY2xl
YXJpbmcgdGhlIHBlbmRpbmcgZXhjZXB0aW9uLgoKVGhlIEtWTUlfVkNQVV9TRVRfUkVHSVNURVJT
IGNvbW1tYW5kIGFsbG93cyB0aGUgaW50cm9zcGVjdGlvbnQgdG9vbCB0bwpvdmVycmlkZSB0aGUg
a3ZtX3JlZ3Mgc3RydWN0dXJlIG9mIGEgc3BlY2lmaWMgdkNQVS4gQnV0IGluIG1vc3QgY2FzZXMK
dGhpcyBpcyB1c2VkIHRvIGluY3JlbWVudCB0aGUgcHJvZ3JhbSBjb3VudGVyLgoKU2lnbmVkLW9m
Zi1ieTogTmljdciZb3IgQ8OuyJt1IDxuY2l0dUBiaXRkZWZlbmRlci5jb20+ClNpZ25lZC1vZmYt
Ynk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJpdGRlZmVuZGVyLmNvbT4KLS0tCiBhcmNoL3g4
Ni9rdm0veDg2LmMgICAgICAgfCAyMSArKysrKysrKysrKysrKy0tLS0tLS0KIGluY2x1ZGUvbGlu
dXgva3ZtX2hvc3QuaCB8ICAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyks
IDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3g4Ni5jIGIvYXJjaC94
ODYva3ZtL3g4Ni5jCmluZGV4IDEwNDEwZWJkYTAzNC4uZTk3M2ZmZTA0ZDU0IDEwMDY0NAotLS0g
YS9hcmNoL3g4Ni9rdm0veDg2LmMKKysrIGIvYXJjaC94ODYva3ZtL3g4Ni5jCkBAIC04OTcwLDE2
ICs4OTcwLDIzIEBAIHN0YXRpYyB2b2lkIF9fc2V0X3JlZ3Moc3RydWN0IGt2bV92Y3B1ICp2Y3B1
LCBzdHJ1Y3Qga3ZtX3JlZ3MgKnJlZ3MpCiAKIAlrdm1fcmlwX3dyaXRlKHZjcHUsIHJlZ3MtPnJp
cCk7CiAJa3ZtX3NldF9yZmxhZ3ModmNwdSwgcmVncy0+cmZsYWdzIHwgWDg2X0VGTEFHU19GSVhF
RCk7Ci0KLQl2Y3B1LT5hcmNoLmV4Y2VwdGlvbi5wZW5kaW5nID0gZmFsc2U7Ci0KLQlrdm1fbWFr
ZV9yZXF1ZXN0KEtWTV9SRVFfRVZFTlQsIHZjcHUpOwogfQogCi1pbnQga3ZtX2FyY2hfdmNwdV9p
b2N0bF9zZXRfcmVncyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcmVncyAqcmVn
cykKK3ZvaWQga3ZtX2FyY2hfdmNwdV9zZXRfcmVncyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0
cnVjdCBrdm1fcmVncyAqcmVncywKKwkJCSAgICBib29sIGNsZWFyX2V4Y2VwdGlvbikKIHsKLQl2
Y3B1X2xvYWQodmNwdSk7CiAJX19zZXRfcmVncyh2Y3B1LCByZWdzKTsKKworCWlmIChjbGVhcl9l
eGNlcHRpb24pCisJCXZjcHUtPmFyY2guZXhjZXB0aW9uLnBlbmRpbmcgPSBmYWxzZTsKKworCWt2
bV9tYWtlX3JlcXVlc3QoS1ZNX1JFUV9FVkVOVCwgdmNwdSk7Cit9CisKK2ludCBrdm1fYXJjaF92
Y3B1X2lvY3RsX3NldF9yZWdzKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9yZWdz
ICpyZWdzKQoreworCXZjcHVfbG9hZCh2Y3B1KTsKKwlrdm1fYXJjaF92Y3B1X3NldF9yZWdzKHZj
cHUsIHJlZ3MsIHRydWUpOwogCXZjcHVfcHV0KHZjcHUpOwogCXJldHVybiAwOwogfQpAQCAtOTM4
Niw3ICs5MzkzLDcgQEAgc3RhdGljIGludCBzeW5jX3JlZ3Moc3RydWN0IGt2bV92Y3B1ICp2Y3B1
KQogCQlyZXR1cm4gLUVJTlZBTDsKIAogCWlmICh2Y3B1LT5ydW4tPmt2bV9kaXJ0eV9yZWdzICYg
S1ZNX1NZTkNfWDg2X1JFR1MpIHsKLQkJX19zZXRfcmVncyh2Y3B1LCAmdmNwdS0+cnVuLT5zLnJl
Z3MucmVncyk7CisJCWt2bV9hcmNoX3ZjcHVfc2V0X3JlZ3ModmNwdSwgJnZjcHUtPnJ1bi0+cy5y
ZWdzLnJlZ3MsIHRydWUpOwogCQl2Y3B1LT5ydW4tPmt2bV9kaXJ0eV9yZWdzICY9IH5LVk1fU1lO
Q19YODZfUkVHUzsKIAl9CiAJaWYgKHZjcHUtPnJ1bi0+a3ZtX2RpcnR5X3JlZ3MgJiBLVk1fU1lO
Q19YODZfU1JFR1MpIHsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaCBiL2lu
Y2x1ZGUvbGludXgva3ZtX2hvc3QuaAppbmRleCAyM2FiNDkzMmY3ZTcuLjQ5Y2JkMTc1ZjQ1YiAx
MDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oCisrKyBiL2luY2x1ZGUvbGludXgv
a3ZtX2hvc3QuaApAQCAtODY2LDYgKzg2Niw4IEBAIGludCBrdm1fYXJjaF92Y3B1X2lvY3RsX3Ry
YW5zbGF0ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiBpbnQga3ZtX2FyY2hfdmNwdV9pb2N0bF9n
ZXRfcmVncyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcmVncyAqcmVncyk7CiB2
b2lkIGt2bV9hcmNoX3ZjcHVfZ2V0X3JlZ3Moc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qg
a3ZtX3JlZ3MgKnJlZ3MpOwogaW50IGt2bV9hcmNoX3ZjcHVfaW9jdGxfc2V0X3JlZ3Moc3RydWN0
IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3JlZ3MgKnJlZ3MpOwordm9pZCBrdm1fYXJjaF92
Y3B1X3NldF9yZWdzKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9yZWdzICpyZWdz
LAorCQkJICAgIGJvb2wgY2xlYXJfZXhjZXB0aW9uKTsKIGludCBrdm1fYXJjaF92Y3B1X2lvY3Rs
X2dldF9zcmVncyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJCQkJICBzdHJ1Y3Qga3ZtX3NyZWdz
ICpzcmVncyk7CiB2b2lkIGt2bV9hcmNoX3ZjcHVfZ2V0X3NyZWdzKHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmly
dHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5k
YXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3ZpcnR1YWxpemF0aW9u
