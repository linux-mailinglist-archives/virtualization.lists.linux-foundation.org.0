Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9426619787C
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 12:13:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 49ECD86992;
	Mon, 30 Mar 2020 10:13:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xdnHdOCuMjVY; Mon, 30 Mar 2020 10:13:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AB212869F7;
	Mon, 30 Mar 2020 10:13:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97873C07FF;
	Mon, 30 Mar 2020 10:13:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0CDF4C1AE8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EF13388442
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R2dvywN2it3Z
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 903FD87C9F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:54 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 14903307489B; Mon, 30 Mar 2020 13:12:53 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id EA3C8305B7A2;
 Mon, 30 Mar 2020 13:12:52 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v8 28/81] KVM: x86: export kvm_arch_vcpu_set_guest_debug()
Date: Mon, 30 Mar 2020 13:12:15 +0300
Message-Id: <20200330101308.21702-29-alazar@bitdefender.com>
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

RnJvbTogTmljdciZb3IgQ8OuyJt1IDxuY2l0dUBiaXRkZWZlbmRlci5jb20+CgpUaGlzIGZ1bmN0
aW9uIGlzIG5lZWRlZCBmb3IgdGhlIEtWTUlfRVZFTlRfQlAgZXZlbnQuCgpTaWduZWQtb2ZmLWJ5
OiBOaWN1yJlvciBDw67Im3UgPG5jaXR1QGJpdGRlZmVuZGVyLmNvbT4KU2lnbmVkLW9mZi1ieTog
QWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIGFyY2gveDg2L2t2
bS94ODYuYyAgICAgICB8IDE4ICsrKysrKysrKysrKystLS0tLQogaW5jbHVkZS9saW51eC9rdm1f
aG9zdC5oIHwgIDIgKysKIDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0veDg2LmMgYi9hcmNoL3g4Ni9rdm0v
eDg2LmMKaW5kZXggYmZkOGUzNTE1YzBkLi40YTRkNjY2MzYwOGEgMTAwNjQ0Ci0tLSBhL2FyY2gv
eDg2L2t2bS94ODYuYworKysgYi9hcmNoL3g4Ni9rdm0veDg2LmMKQEAgLTkxMDMsMTQgKzkxMDMs
MTIgQEAgaW50IGt2bV9hcmNoX3ZjcHVfaW9jdGxfc2V0X3NyZWdzKHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSwKIAlyZXR1cm4gcmV0OwogfQogCi1pbnQga3ZtX2FyY2hfdmNwdV9pb2N0bF9zZXRfZ3Vl
c3RfZGVidWcoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAotCQkJCQlzdHJ1Y3Qga3ZtX2d1ZXN0X2Rl
YnVnICpkYmcpCitpbnQga3ZtX2FyY2hfdmNwdV9zZXRfZ3Vlc3RfZGVidWcoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LAorCQkJCSAgc3RydWN0IGt2bV9ndWVzdF9kZWJ1ZyAqZGJnKQogewogCXVuc2ln
bmVkIGxvbmcgcmZsYWdzOwogCWludCBpLCByOwogCi0JdmNwdV9sb2FkKHZjcHUpOwotCiAJaWYg
KGRiZy0+Y29udHJvbCAmIChLVk1fR1VFU1REQkdfSU5KRUNUX0RCIHwgS1ZNX0dVRVNUREJHX0lO
SkVDVF9CUCkpIHsKIAkJciA9IC1FQlVTWTsKIAkJaWYgKHZjcHUtPmFyY2guZXhjZXB0aW9uLnBl
bmRpbmcpCkBAIC05MTU2LDEwICs5MTU0LDIwIEBAIGludCBrdm1fYXJjaF92Y3B1X2lvY3RsX3Nl
dF9ndWVzdF9kZWJ1ZyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJciA9IDA7CiAKIG91dDoKLQl2
Y3B1X3B1dCh2Y3B1KTsKIAlyZXR1cm4gcjsKIH0KIAoraW50IGt2bV9hcmNoX3ZjcHVfaW9jdGxf
c2V0X2d1ZXN0X2RlYnVnKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKKwkJCQkJc3RydWN0IGt2bV9n
dWVzdF9kZWJ1ZyAqZGJnKQoreworCWludCByZXQ7CisKKwl2Y3B1X2xvYWQodmNwdSk7CisJcmV0
ID0ga3ZtX2FyY2hfdmNwdV9zZXRfZ3Vlc3RfZGVidWcodmNwdSwgZGJnKTsKKwl2Y3B1X3B1dCh2
Y3B1KTsKKwlyZXR1cm4gcmV0OworfQorCiAvKgogICogVHJhbnNsYXRlIGEgZ3Vlc3QgdmlydHVh
bCBhZGRyZXNzIHRvIGEgZ3Vlc3QgcGh5c2ljYWwgYWRkcmVzcy4KICAqLwpkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC9rdm1faG9zdC5oIGIvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oCmluZGV4
IDNjZmMzOGVmNDA0OC4uMTU4ZmM3ODJiZjRhIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2t2
bV9ob3N0LmgKKysrIGIvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oCkBAIC04NjksNiArODY5LDgg
QEAgaW50IGt2bV9hcmNoX3ZjcHVfaW9jdGxfc2V0X21wc3RhdGUoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1LAogCQkJCSAgICBzdHJ1Y3Qga3ZtX21wX3N0YXRlICptcF9zdGF0ZSk7CiBpbnQga3ZtX2Fy
Y2hfdmNwdV9pb2N0bF9zZXRfZ3Vlc3RfZGVidWcoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCQkJ
CQlzdHJ1Y3Qga3ZtX2d1ZXN0X2RlYnVnICpkYmcpOworaW50IGt2bV9hcmNoX3ZjcHVfc2V0X2d1
ZXN0X2RlYnVnKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKKwkJCQkgIHN0cnVjdCBrdm1fZ3Vlc3Rf
ZGVidWcgKmRiZyk7CiBpbnQga3ZtX2FyY2hfdmNwdV9pb2N0bF9ydW4oc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqa3ZtX3J1bik7CiAKIGludCBrdm1fYXJjaF9pbml0KHZv
aWQgKm9wYXF1ZSk7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51
eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
