Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id AA966155E0B
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 19:26:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 614B0869F6;
	Fri,  7 Feb 2020 18:26:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OTowuBRUMd3S; Fri,  7 Feb 2020 18:26:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4879786A8D;
	Fri,  7 Feb 2020 18:26:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2F095C013E;
	Fri,  7 Feb 2020 18:26:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7BF22C1D87
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 60EE987FB5
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7GK2FswbG41T
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9CCF687F84
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:55 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 CE12C305D3DD; Fri,  7 Feb 2020 20:16:39 +0200 (EET)
Received: from host.bbu.bitdefender.biz (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id BEAF43052069;
 Fri,  7 Feb 2020 20:16:39 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v7 26/78] KVM: x86: export kvm_arch_vcpu_set_guest_debug()
Date: Fri,  7 Feb 2020 20:15:44 +0200
Message-Id: <20200207181636.1065-27-alazar@bitdefender.com>
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

RnJvbTogTmljdciZb3IgQ8OuyJt1IDxuY2l0dUBiaXRkZWZlbmRlci5jb20+CgpUaGlzIGZ1bmN0
aW9uIGlzIG5lZWRlZCBmb3IgdGhlIEtWTUlfRVZFTlRfQlAgZXZlbnQuCgpTaWduZWQtb2ZmLWJ5
OiBOaWN1yJlvciBDw67Im3UgPG5jaXR1QGJpdGRlZmVuZGVyLmNvbT4KU2lnbmVkLW9mZi1ieTog
QWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIGFyY2gveDg2L2t2
bS94ODYuYyAgICAgICB8IDE4ICsrKysrKysrKysrKystLS0tLQogaW5jbHVkZS9saW51eC9rdm1f
aG9zdC5oIHwgIDIgKysKIDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0veDg2LmMgYi9hcmNoL3g4Ni9rdm0v
eDg2LmMKaW5kZXggZmVlMjRiYjVmYTUyLi5jNjA3MTQ4ZGNmNjMgMTAwNjQ0Ci0tLSBhL2FyY2gv
eDg2L2t2bS94ODYuYworKysgYi9hcmNoL3g4Ni9rdm0veDg2LmMKQEAgLTg5MjcsMTQgKzg5Mjcs
MTIgQEAgaW50IGt2bV9hcmNoX3ZjcHVfaW9jdGxfc2V0X3NyZWdzKHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSwKIAlyZXR1cm4gcmV0OwogfQogCi1pbnQga3ZtX2FyY2hfdmNwdV9pb2N0bF9zZXRfZ3Vl
c3RfZGVidWcoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAotCQkJCQlzdHJ1Y3Qga3ZtX2d1ZXN0X2Rl
YnVnICpkYmcpCitpbnQga3ZtX2FyY2hfdmNwdV9zZXRfZ3Vlc3RfZGVidWcoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LAorCQkJCSBzdHJ1Y3Qga3ZtX2d1ZXN0X2RlYnVnICpkYmcpCiB7CiAJdW5zaWdu
ZWQgbG9uZyByZmxhZ3M7CiAJaW50IGksIHI7CiAKLQl2Y3B1X2xvYWQodmNwdSk7Ci0KIAlpZiAo
ZGJnLT5jb250cm9sICYgKEtWTV9HVUVTVERCR19JTkpFQ1RfREIgfCBLVk1fR1VFU1REQkdfSU5K
RUNUX0JQKSkgewogCQlyID0gLUVCVVNZOwogCQlpZiAodmNwdS0+YXJjaC5leGNlcHRpb24ucGVu
ZGluZykKQEAgLTg5ODAsMTAgKzg5NzgsMjAgQEAgaW50IGt2bV9hcmNoX3ZjcHVfaW9jdGxfc2V0
X2d1ZXN0X2RlYnVnKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKIAlyID0gMDsKIAogb3V0OgotCXZj
cHVfcHV0KHZjcHUpOwogCXJldHVybiByOwogfQogCitpbnQga3ZtX2FyY2hfdmNwdV9pb2N0bF9z
ZXRfZ3Vlc3RfZGVidWcoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAorCQkJCQlzdHJ1Y3Qga3ZtX2d1
ZXN0X2RlYnVnICpkYmcpCit7CisJaW50IHJldDsKKworCXZjcHVfbG9hZCh2Y3B1KTsKKwlyZXQg
PSBrdm1fYXJjaF92Y3B1X3NldF9ndWVzdF9kZWJ1Zyh2Y3B1LCBkYmcpOworCXZjcHVfcHV0KHZj
cHUpOworCXJldHVybiByZXQ7Cit9CisKIC8qCiAgKiBUcmFuc2xhdGUgYSBndWVzdCB2aXJ0dWFs
IGFkZHJlc3MgdG8gYSBndWVzdCBwaHlzaWNhbCBhZGRyZXNzLgogICovCmRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L2t2bV9ob3N0LmggYi9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmgKaW5kZXgg
YzdlZjY5MDE1MDUwLi42MjVmNTY3ZjYxMjAgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgva3Zt
X2hvc3QuaAorKysgYi9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmgKQEAgLTg2OSw2ICs4NjksOCBA
QCBpbnQga3ZtX2FyY2hfdmNwdV9pb2N0bF9zZXRfbXBzdGF0ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsCiAJCQkJICAgIHN0cnVjdCBrdm1fbXBfc3RhdGUgKm1wX3N0YXRlKTsKIGludCBrdm1fYXJj
aF92Y3B1X2lvY3RsX3NldF9ndWVzdF9kZWJ1ZyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJCQkJ
CXN0cnVjdCBrdm1fZ3Vlc3RfZGVidWcgKmRiZyk7CitpbnQga3ZtX2FyY2hfdmNwdV9zZXRfZ3Vl
c3RfZGVidWcoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAorCQkJCSBzdHJ1Y3Qga3ZtX2d1ZXN0X2Rl
YnVnICpkYmcpOwogaW50IGt2bV9hcmNoX3ZjcHVfaW9jdGxfcnVuKHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSwgc3RydWN0IGt2bV9ydW4gKmt2bV9ydW4pOwogCiBpbnQga3ZtX2FyY2hfaW5pdCh2b2lk
ICpvcGFxdWUpOwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgt
Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4v
bGlzdGluZm8vdmlydHVhbGl6YXRpb24=
