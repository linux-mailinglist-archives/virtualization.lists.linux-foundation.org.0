Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F13155E4C
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 19:36:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id EE55122660;
	Fri,  7 Feb 2020 18:36:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0RBLEsic3p4i; Fri,  7 Feb 2020 18:36:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E415D2274E;
	Fri,  7 Feb 2020 18:36:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CFBEAC1D81;
	Fri,  7 Feb 2020 18:36:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6EF84C1D81
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 66E2E86E42
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k-0nGp2+cCZl
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 912CC85C45
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:56 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 B853B305D489; Fri,  7 Feb 2020 20:16:38 +0200 (EET)
Received: from host.bbu.bitdefender.biz (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 7B5B63052067;
 Fri,  7 Feb 2020 20:16:38 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v7 04/78] KVM: add kvm_vcpu_kick_and_wait()
Date: Fri,  7 Feb 2020 20:15:22 +0200
Message-Id: <20200207181636.1065-5-alazar@bitdefender.com>
In-Reply-To: <20200207181636.1065-1-alazar@bitdefender.com>
References: <20200207181636.1065-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
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

VGhpcyBmdW5jdGlvbiBpcyBuZWVkZWQgZm9yIHRoZSBLVk1JX1ZDUFVfUEFVU0UgY29tbWFuZC4g
VGhlcmUgYXJlCmNhc2VzIHdoZW4gaXQgaXMgZWFzaWVyIGZvciB0aGUgaW50cm9zcGVjdGlvbiB0
b29sIGlmIGl0IGtub3dzIHRoYXQKdGhlIHZDUFUgZG9lc24ndCBydW4gZ3Vlc3QgY29kZSB3aGVu
IHRoZSBjb21tYW5kIGNvbXBsZXRlZCwgd2l0aG91dAp0aGUgbmVlZCB0byB3YWl0IGZvciB0aGUg
S1ZNSV9FVkVOVF9QQVVTRV9WQ1BVIGV2ZW50LgoKU2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6
xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIGluY2x1ZGUvbGludXgva3ZtX2hvc3Qu
aCB8ICAxICsKIHZpcnQva3ZtL2t2bV9tYWluLmMgICAgICB8IDEwICsrKysrKysrKysKIDIgZmls
ZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgv
a3ZtX2hvc3QuaCBiL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaAppbmRleCA3ZWQxZTJmODY0MWUu
LjJmYjI3NjY1NWNjMiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oCisrKyBi
L2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaApAQCAtNzk5LDYgKzc5OSw3IEBAIHZvaWQga3ZtX2Fy
Y2hfdmNwdV9ibG9ja2luZyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogdm9pZCBrdm1fYXJjaF92
Y3B1X3VuYmxvY2tpbmcoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIGJvb2wga3ZtX3ZjcHVfd2Fr
ZV91cChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogdm9pZCBrdm1fdmNwdV9raWNrKHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSk7Cit2b2lkIGt2bV92Y3B1X2tpY2tfYW5kX3dhaXQoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1KTsKIGludCBrdm1fdmNwdV95aWVsZF90byhzdHJ1Y3Qga3ZtX3ZjcHUgKnRhcmdl
dCk7CiB2b2lkIGt2bV92Y3B1X29uX3NwaW4oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBib29sIHVz
ZXJtb2RlX3ZjcHVfbm90X2VsaWdpYmxlKTsKIApkaWZmIC0tZ2l0IGEvdmlydC9rdm0va3ZtX21h
aW4uYyBiL3ZpcnQva3ZtL2t2bV9tYWluLmMKaW5kZXggMDAyNjgyOTBkY2JkLi5hYjY2ZDVhMDg1
ODEgMTAwNjQ0Ci0tLSBhL3ZpcnQva3ZtL2t2bV9tYWluLmMKKysrIGIvdmlydC9rdm0va3ZtX21h
aW4uYwpAQCAtMjQ5OCw2ICsyNDk4LDE2IEBAIHZvaWQga3ZtX3ZjcHVfa2ljayhzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUpCiBFWFBPUlRfU1lNQk9MX0dQTChrdm1fdmNwdV9raWNrKTsKICNlbmRpZiAv
KiAhQ09ORklHX1MzOTAgKi8KIAordm9pZCBrdm1fdmNwdV9raWNrX2FuZF93YWl0KHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSkKK3sKKwlpZiAoa3ZtX3ZjcHVfd2FrZV91cCh2Y3B1KSkKKwkJcmV0dXJu
OworCisJaWYgKGt2bV9yZXF1ZXN0X25lZWRzX2lwaSh2Y3B1LCBLVk1fUkVRVUVTVF9XQUlUKSkK
KwkJc21wX2NhbGxfZnVuY3Rpb25fc2luZ2xlKHZjcHUtPmNwdSwgYWNrX2ZsdXNoLCBOVUxMLCAx
KTsKK30KK0VYUE9SVF9TWU1CT0xfR1BMKGt2bV92Y3B1X2tpY2tfYW5kX3dhaXQpOworCiBpbnQg
a3ZtX3ZjcHVfeWllbGRfdG8oc3RydWN0IGt2bV92Y3B1ICp0YXJnZXQpCiB7CiAJc3RydWN0IHBp
ZCAqcGlkOwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpW
aXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91
bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlz
dGluZm8vdmlydHVhbGl6YXRpb24=
