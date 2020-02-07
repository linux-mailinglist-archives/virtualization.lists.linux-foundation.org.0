Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CE797155DFA
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 19:26:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7818422622;
	Fri,  7 Feb 2020 18:26:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VEhyQIO0Ywmn; Fri,  7 Feb 2020 18:26:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5427C226A9;
	Fri,  7 Feb 2020 18:26:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 407C7C1D85;
	Fri,  7 Feb 2020 18:26:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6FDE7C1D81
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2BDAA87FB2
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K086DdCBL9gD
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AB42887F79
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:55 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 C4A15305D495; Fri,  7 Feb 2020 20:16:38 +0200 (EET)
Received: from host.bbu.bitdefender.biz (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id B936A305206B;
 Fri,  7 Feb 2020 20:16:38 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v7 08/78] KVM: x86: add kvm_arch_vcpu_set_regs()
Date: Fri,  7 Feb 2020 20:15:26 +0200
Message-Id: <20200207181636.1065-9-alazar@bitdefender.com>
In-Reply-To: <20200207181636.1065-1-alazar@bitdefender.com>
References: <20200207181636.1065-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Nicu=C8=99or=20C=C3=AE=C8=9Bu?= <ncitu@bitdefender.com>,
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

RnJvbTogTmljdciZb3IgQ8OuyJt1IDxuY2l0dUBiaXRkZWZlbmRlci5jb20+CgpUaGlzIGlzIG5l
ZWRlZCBmb3IgdGhlIEtWTUlfVkNQVV9TRVRfUkVHSVNURVJTLCBidXQgd2l0aG91dCBjbGVhcmlu
Zwp0aGUgcGVuZGluZyBleGNlcHRpb24uCgpTaWduZWQtb2ZmLWJ5OiBOaWN1yJlvciBDw67Im3Ug
PG5jaXR1QGJpdGRlZmVuZGVyLmNvbT4KU2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxh
bGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIGFyY2gveDg2L2t2bS94ODYuYyAgICAgICB8IDEz
ICsrKysrKysrKystLS0KIGluY2x1ZGUvbGludXgva3ZtX2hvc3QuaCB8ICAyICsrCiAyIGZpbGVz
IGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
YXJjaC94ODYva3ZtL3g4Ni5jIGIvYXJjaC94ODYva3ZtL3g4Ni5jCmluZGV4IGZmMGMxMmE5MzIy
ZC4uZDAxMDRhZGY3OTA2IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0veDg2LmMKKysrIGIvYXJj
aC94ODYva3ZtL3g4Ni5jCkBAIC04NjQ2LDggKzg2NDYsMTUgQEAgc3RhdGljIHZvaWQgX19zZXRf
cmVncyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcmVncyAqcmVncykKIAogCWt2
bV9yaXBfd3JpdGUodmNwdSwgcmVncy0+cmlwKTsKIAlrdm1fc2V0X3JmbGFncyh2Y3B1LCByZWdz
LT5yZmxhZ3MgfCBYODZfRUZMQUdTX0ZJWEVEKTsKK30KIAotCXZjcHUtPmFyY2guZXhjZXB0aW9u
LnBlbmRpbmcgPSBmYWxzZTsKK3ZvaWQga3ZtX2FyY2hfdmNwdV9zZXRfcmVncyhzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcmVncyAqcmVncywKKwkJCSAgICBib29sIGNsZWFyX2V4
Y2VwdGlvbikKK3sKKwlfX3NldF9yZWdzKHZjcHUsIHJlZ3MpOworCisJaWYgKGNsZWFyX2V4Y2Vw
dGlvbikKKwkJdmNwdS0+YXJjaC5leGNlcHRpb24ucGVuZGluZyA9IGZhbHNlOwogCiAJa3ZtX21h
a2VfcmVxdWVzdChLVk1fUkVRX0VWRU5ULCB2Y3B1KTsKIH0KQEAgLTg2NTUsNyArODY2Miw3IEBA
IHN0YXRpYyB2b2lkIF9fc2V0X3JlZ3Moc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3Zt
X3JlZ3MgKnJlZ3MpCiBpbnQga3ZtX2FyY2hfdmNwdV9pb2N0bF9zZXRfcmVncyhzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcmVncyAqcmVncykKIHsKIAl2Y3B1X2xvYWQodmNwdSk7
Ci0JX19zZXRfcmVncyh2Y3B1LCByZWdzKTsKKwlrdm1fYXJjaF92Y3B1X3NldF9yZWdzKHZjcHUs
IHJlZ3MsIHRydWUpOwogCXZjcHVfcHV0KHZjcHUpOwogCXJldHVybiAwOwogfQpAQCAtOTA1OSw3
ICs5MDY2LDcgQEAgc3RhdGljIGludCBzeW5jX3JlZ3Moc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQog
CQlyZXR1cm4gLUVJTlZBTDsKIAogCWlmICh2Y3B1LT5ydW4tPmt2bV9kaXJ0eV9yZWdzICYgS1ZN
X1NZTkNfWDg2X1JFR1MpIHsKLQkJX19zZXRfcmVncyh2Y3B1LCAmdmNwdS0+cnVuLT5zLnJlZ3Mu
cmVncyk7CisJCWt2bV9hcmNoX3ZjcHVfc2V0X3JlZ3ModmNwdSwgJnZjcHUtPnJ1bi0+cy5yZWdz
LnJlZ3MsIHRydWUpOwogCQl2Y3B1LT5ydW4tPmt2bV9kaXJ0eV9yZWdzICY9IH5LVk1fU1lOQ19Y
ODZfUkVHUzsKIAl9CiAJaWYgKHZjcHUtPnJ1bi0+a3ZtX2RpcnR5X3JlZ3MgJiBLVk1fU1lOQ19Y
ODZfU1JFR1MpIHsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaCBiL2luY2x1
ZGUvbGludXgva3ZtX2hvc3QuaAppbmRleCA2MmY1YmY4MmFkYzAuLmM3ZWY2OTAxNTA1MCAxMDA2
NDQKLS0tIGEvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oCisrKyBiL2luY2x1ZGUvbGludXgva3Zt
X2hvc3QuaApAQCAtODU1LDYgKzg1NSw4IEBAIGludCBrdm1fYXJjaF92Y3B1X2lvY3RsX3RyYW5z
bGF0ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiBpbnQga3ZtX2FyY2hfdmNwdV9pb2N0bF9nZXRf
cmVncyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcmVncyAqcmVncyk7CiB2b2lk
IGt2bV9hcmNoX3ZjcHVfZ2V0X3JlZ3Moc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3Zt
X3JlZ3MgKnJlZ3MpOwogaW50IGt2bV9hcmNoX3ZjcHVfaW9jdGxfc2V0X3JlZ3Moc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3JlZ3MgKnJlZ3MpOwordm9pZCBrdm1fYXJjaF92Y3B1
X3NldF9yZWdzKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9yZWdzICpyZWdzLAor
CQkJICAgIGJvb2wgY2xlYXJfZXhjZXB0aW9uKTsKIGludCBrdm1fYXJjaF92Y3B1X2lvY3RsX2dl
dF9zcmVncyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJCQkJICBzdHJ1Y3Qga3ZtX3NyZWdzICpz
cmVncyk7CiB2b2lkIGt2bV9hcmNoX3ZjcHVfZ2V0X3NyZWdzKHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVh
bGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRp
b24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3ZpcnR1YWxpemF0aW9u
