Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D6022228B24
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 23:26:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EE92987E19;
	Tue, 21 Jul 2020 21:26:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZZ19fpiWQzqa; Tue, 21 Jul 2020 21:26:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8CE7088720;
	Tue, 21 Jul 2020 21:26:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 82B88C016F;
	Tue, 21 Jul 2020 21:26:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9BBEEC08A2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6C25F87F1F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N1Lgyv+2v7n4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0CFF0883AC
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:57 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 199DB305D6AC; Wed, 22 Jul 2020 00:09:23 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id EF0E5304FA12;
 Wed, 22 Jul 2020 00:09:22 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v9 27/84] KVM: x86: export kvm_arch_vcpu_set_guest_debug()
Date: Wed, 22 Jul 2020 00:08:25 +0300
Message-Id: <20200721210922.7646-28-alazar@bitdefender.com>
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

RnJvbTogTmljdciZb3IgQ8OuyJt1IDxuY2l0dUBiaXRkZWZlbmRlci5jb20+CgpUaGlzIGZ1bmN0
aW9uIGlzIG5lZWRlZCBpbiBvcmRlciB0byBub3RpZnkgdGhlIGludHJvc3BlY3Rpb24gdG9vbAp0
aHJvdWdoIEtWTUlfRVZFTlRfQlAgZXZlbnRzIG9uIGd1ZXN0IGJyZWFrcG9pbnRzLgoKU2lnbmVk
LW9mZi1ieTogTmljdciZb3IgQ8OuyJt1IDxuY2l0dUBiaXRkZWZlbmRlci5jb20+ClNpZ25lZC1v
ZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJpdGRlZmVuZGVyLmNvbT4KLS0tCiBhcmNo
L3g4Ni9rdm0veDg2LmMgICAgICAgfCAxOCArKysrKysrKysrKysrLS0tLS0KIGluY2x1ZGUvbGlu
dXgva3ZtX2hvc3QuaCB8ICAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyks
IDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3g4Ni5jIGIvYXJjaC94
ODYva3ZtL3g4Ni5jCmluZGV4IDIzYmNlM2VmMjZkOC4uNTYxMWI2Y2Q2ZDE5IDEwMDY0NAotLS0g
YS9hcmNoL3g4Ni9rdm0veDg2LmMKKysrIGIvYXJjaC94ODYva3ZtL3g4Ni5jCkBAIC05MjU0LDE0
ICs5MjU0LDEyIEBAIGludCBrdm1fYXJjaF92Y3B1X2lvY3RsX3NldF9zcmVncyhzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUsCiAJcmV0dXJuIHJldDsKIH0KIAotaW50IGt2bV9hcmNoX3ZjcHVfaW9jdGxf
c2V0X2d1ZXN0X2RlYnVnKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKLQkJCQkJc3RydWN0IGt2bV9n
dWVzdF9kZWJ1ZyAqZGJnKQoraW50IGt2bV9hcmNoX3ZjcHVfc2V0X2d1ZXN0X2RlYnVnKHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSwKKwkJCQkgIHN0cnVjdCBrdm1fZ3Vlc3RfZGVidWcgKmRiZykKIHsK
IAl1bnNpZ25lZCBsb25nIHJmbGFnczsKIAlpbnQgaSwgcjsKIAotCXZjcHVfbG9hZCh2Y3B1KTsK
LQogCWlmIChkYmctPmNvbnRyb2wgJiAoS1ZNX0dVRVNUREJHX0lOSkVDVF9EQiB8IEtWTV9HVUVT
VERCR19JTkpFQ1RfQlApKSB7CiAJCXIgPSAtRUJVU1k7CiAJCWlmICh2Y3B1LT5hcmNoLmV4Y2Vw
dGlvbi5wZW5kaW5nKQpAQCAtOTMwNywxMCArOTMwNSwyMCBAQCBpbnQga3ZtX2FyY2hfdmNwdV9p
b2N0bF9zZXRfZ3Vlc3RfZGVidWcoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCXIgPSAwOwogCiBv
dXQ6Ci0JdmNwdV9wdXQodmNwdSk7CiAJcmV0dXJuIHI7CiB9CiAKK2ludCBrdm1fYXJjaF92Y3B1
X2lvY3RsX3NldF9ndWVzdF9kZWJ1ZyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCisJCQkJCXN0cnVj
dCBrdm1fZ3Vlc3RfZGVidWcgKmRiZykKK3sKKwlpbnQgcmV0OworCisJdmNwdV9sb2FkKHZjcHUp
OworCXJldCA9IGt2bV9hcmNoX3ZjcHVfc2V0X2d1ZXN0X2RlYnVnKHZjcHUsIGRiZyk7CisJdmNw
dV9wdXQodmNwdSk7CisJcmV0dXJuIHJldDsKK30KKwogLyoKICAqIFRyYW5zbGF0ZSBhIGd1ZXN0
IHZpcnR1YWwgYWRkcmVzcyB0byBhIGd1ZXN0IHBoeXNpY2FsIGFkZHJlc3MuCiAgKi8KZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaCBiL2luY2x1ZGUvbGludXgva3ZtX2hvc3Qu
aAppbmRleCA0OWNiZDE3NWY0NWIuLjAxNjI4ZjdiY2JjZCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9s
aW51eC9rdm1faG9zdC5oCisrKyBiL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaApAQCAtODgxLDYg
Kzg4MSw4IEBAIGludCBrdm1fYXJjaF92Y3B1X2lvY3RsX3NldF9tcHN0YXRlKHN0cnVjdCBrdm1f
dmNwdSAqdmNwdSwKIGludCBrdm1fYXJjaF92Y3B1X2lvY3RsX3NldF9ndWVzdF9kZWJ1ZyhzdHJ1
Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJCQkJCXN0cnVjdCBrdm1fZ3Vlc3RfZGVidWcgKmRiZyk7CiBp
bnQga3ZtX2FyY2hfdmNwdV9pb2N0bF9ydW4oc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKK2ludCBr
dm1fYXJjaF92Y3B1X3NldF9ndWVzdF9kZWJ1ZyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCisJCQkJ
ICBzdHJ1Y3Qga3ZtX2d1ZXN0X2RlYnVnICpkYmcpOwogCiBpbnQga3ZtX2FyY2hfaW5pdCh2b2lk
ICpvcGFxdWUpOwogdm9pZCBrdm1fYXJjaF9leGl0KHZvaWQpOwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QK
VmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5s
aW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
