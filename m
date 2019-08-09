Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E110C88158
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 19:35:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5F8BCE04;
	Fri,  9 Aug 2019 17:34:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A2E3FD09
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 17:34:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B0DCB875
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 17:34:54 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	3B25D305D351; Fri,  9 Aug 2019 19:01:26 +0300 (EEST)
Received: from localhost.localdomain (unknown [89.136.169.210])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id D37A5305B7A0;
	Fri,  9 Aug 2019 19:01:25 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v6 60/92] kvm: x86: add kvm_arch_vcpu_set_guest_debug()
Date: Fri,  9 Aug 2019 19:00:15 +0300
Message-Id: <20190809160047.8319-61-alazar@bitdefender.com>
In-Reply-To: <20190809160047.8319-1-alazar@bitdefender.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>, Yu C <yu.c.zhang@intel.com>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	=?UTF-8?q?Samuel=20Laur=C3=A9n?= <samuel.lauren@iki.fi>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	virtualization@lists.linux-foundation.org,
	=?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
	linux-mm@kvack.org, Patrick Colp <patrick.colp@oracle.com>,
	Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Zhang@mail.linuxfoundation.org,
	=?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

VGhpcyBmdW5jdGlvbiBpcyBuZWVkIGluIG9yZGVyIHRvIGludGVyY2VwdCBicmVha3BvaW50cyBh
bmQgc2VuZApLVk1JX0VWRU5UX0JSRUFLUE9JTlQgZXZlbnRzIHRvIHRoZSBpbnRyb3NwZWN0aW9u
IHRvb2wuCgpTaWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRl
ci5jb20+Ci0tLQogYXJjaC94ODYva3ZtL3g4Ni5jICAgICAgIHwgMTggKysrKysrKysrKysrKy0t
LS0tCiBpbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmggfCAgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCAx
NSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2
bS94ODYuYyBiL2FyY2gveDg2L2t2bS94ODYuYwppbmRleCAyNzhhMjg2YmEyNjIuLmU2MzNmMjk3
ZTg2ZCAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL3g4Ni5jCisrKyBiL2FyY2gveDg2L2t2bS94
ODYuYwpAQCAtODc0NywxNCArODc0NywxMiBAQCBpbnQga3ZtX2FyY2hfdmNwdV9pb2N0bF9zZXRf
c3JlZ3Moc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCXJldHVybiByZXQ7CiB9CiAKLWludCBrdm1f
YXJjaF92Y3B1X2lvY3RsX3NldF9ndWVzdF9kZWJ1ZyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCi0J
CQkJCXN0cnVjdCBrdm1fZ3Vlc3RfZGVidWcgKmRiZykKK2ludCBrdm1fYXJjaF92Y3B1X3NldF9n
dWVzdF9kZWJ1ZyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCisJCQkJICBzdHJ1Y3Qga3ZtX2d1ZXN0
X2RlYnVnICpkYmcpCiB7CiAJdW5zaWduZWQgbG9uZyByZmxhZ3M7CiAJaW50IGksIHI7CiAKLQl2
Y3B1X2xvYWQodmNwdSk7Ci0KIAlpZiAoZGJnLT5jb250cm9sICYgKEtWTV9HVUVTVERCR19JTkpF
Q1RfREIgfCBLVk1fR1VFU1REQkdfSU5KRUNUX0JQKSkgewogCQlyID0gLUVCVVNZOwogCQlpZiAo
dmNwdS0+YXJjaC5leGNlcHRpb24ucGVuZGluZykKQEAgLTg4MDAsMTAgKzg3OTgsMjAgQEAgaW50
IGt2bV9hcmNoX3ZjcHVfaW9jdGxfc2V0X2d1ZXN0X2RlYnVnKHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSwKIAlyID0gMDsKIAogb3V0OgotCXZjcHVfcHV0KHZjcHUpOwogCXJldHVybiByOwogfQogCitp
bnQga3ZtX2FyY2hfdmNwdV9pb2N0bF9zZXRfZ3Vlc3RfZGVidWcoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1LAorCQkJCQlzdHJ1Y3Qga3ZtX2d1ZXN0X2RlYnVnICpkYmcpCit7CisJaW50IHJldDsKKwor
CXZjcHVfbG9hZCh2Y3B1KTsKKwlyZXQgPSBrdm1fYXJjaF92Y3B1X3NldF9ndWVzdF9kZWJ1Zyh2
Y3B1LCBkYmcpOworCXZjcHVfcHV0KHZjcHUpOworCXJldHVybiByZXQ7Cit9CisKIC8qCiAgKiBU
cmFuc2xhdGUgYSBndWVzdCB2aXJ0dWFsIGFkZHJlc3MgdG8gYSBndWVzdCBwaHlzaWNhbCBhZGRy
ZXNzLgogICovCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmggYi9pbmNsdWRl
L2xpbnV4L2t2bV9ob3N0LmgKaW5kZXggM2FhZDNiOTYxMDdiLi42OTFjMjQ1OThiNGQgMTAwNjQ0
Ci0tLSBhL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaAorKysgYi9pbmNsdWRlL2xpbnV4L2t2bV9o
b3N0LmgKQEAgLTgwNCw2ICs4MDQsOCBAQCBpbnQga3ZtX2FyY2hfdmNwdV9pb2N0bF9zZXRfbXBz
dGF0ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJCQkJICAgIHN0cnVjdCBrdm1fbXBfc3RhdGUg
Km1wX3N0YXRlKTsKIGludCBrdm1fYXJjaF92Y3B1X2lvY3RsX3NldF9ndWVzdF9kZWJ1ZyhzdHJ1
Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJCQkJCXN0cnVjdCBrdm1fZ3Vlc3RfZGVidWcgKmRiZyk7Citp
bnQga3ZtX2FyY2hfdmNwdV9zZXRfZ3Vlc3RfZGVidWcoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAor
CQkJCSAgc3RydWN0IGt2bV9ndWVzdF9kZWJ1ZyAqZGJnKTsKIGludCBrdm1fYXJjaF92Y3B1X2lv
Y3RsX3J1bihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcnVuICprdm1fcnVuKTsK
IHZvaWQga3ZtX3ZjcHVfaW9jdGxfeDg2X2dldF94c2F2ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUs
CiAJCQkJICBzdHJ1Y3Qga3ZtX3hzYXZlICpndWVzdF94c2F2ZSk7Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlz
dApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3Rz
LmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
