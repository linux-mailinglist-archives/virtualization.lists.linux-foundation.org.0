Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D203197883
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 12:13:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 738A9884D7;
	Mon, 30 Mar 2020 10:13:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rFdnLjNxYJ51; Mon, 30 Mar 2020 10:13:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 31CDC88493;
	Mon, 30 Mar 2020 10:13:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1278FC07FF;
	Mon, 30 Mar 2020 10:13:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90DB7C07FF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8CB2C86980
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E7g6h0T8qgYT
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 89EA4869B7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:54 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 C9D603074898; Mon, 30 Mar 2020 13:12:52 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id AD229305B7A0;
 Mon, 30 Mar 2020 13:12:52 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v8 26/81] KVM: x86: add .gpt_translation_fault()
Date: Mon, 30 Mar 2020 13:12:13 +0300
Message-Id: <20200330101308.21702-27-alazar@bitdefender.com>
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyBmdW5jdGlv
biBpcyBuZWVkZWQgZm9yIHRoZSBLVk1JX0VWRU5UX1BGIGV2ZW50LgoKU2lnbmVkLW9mZi1ieTog
TWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgpTaWduZWQtb2ZmLWJ5OiBBZGFs
YmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+Ci0tLQogYXJjaC94ODYvaW5jbHVk
ZS9hc20va3ZtX2hvc3QuaCB8ICAxICsKIGFyY2gveDg2L2t2bS9zdm0uYyAgICAgICAgICAgICAg
fCAxMiArKysrKysrKysrKysKIGFyY2gveDg2L2t2bS92bXgvdm14LmMgICAgICAgICAgfCAgOCAr
KysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
YXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2
bV9ob3N0LmgKaW5kZXggMThlODc5ZDUwOGMyLi4yZTk5M2IyNDBiNjYgMTAwNjQ0Ci0tLSBhL2Fy
Y2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20v
a3ZtX2hvc3QuaApAQCAtMTI5MSw2ICsxMjkxLDcgQEAgc3RydWN0IGt2bV94ODZfb3BzIHsKIAog
CXU2NCAoKmZhdWx0X2dsYSkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIAlib29sICgqc3B0X2Zh
dWx0KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOworCWJvb2wgKCpncHRfdHJhbnNsYXRpb25fZmF1
bHQpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7CiB9OwogCiBzdHJ1Y3Qga3ZtX2FyY2hfYXN5bmNf
cGYgewpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3N2bS5jIGIvYXJjaC94ODYva3ZtL3N2bS5j
CmluZGV4IDQyZmFiNDZlNjU1My4uMmJlOGY5MzEzNjExIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9r
dm0vc3ZtLmMKKysrIGIvYXJjaC94ODYva3ZtL3N2bS5jCkBAIC03NTM3LDYgKzc1MzcsMTcgQEAg
c3RhdGljIGJvb2wgc3ZtX3NwdF9mYXVsdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAJcmV0dXJu
ICh2bWNiLT5jb250cm9sLmV4aXRfY29kZSA9PSBTVk1fRVhJVF9OUEYpOwogfQogCitzdGF0aWMg
Ym9vbCBzdm1fZ3B0X3RyYW5zbGF0aW9uX2ZhdWx0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKK3sK
KwlzdHJ1Y3QgdmNwdV9zdm0gKnN2bSA9IHRvX3N2bSh2Y3B1KTsKKwlzdHJ1Y3Qgdm1jYiAqdm1j
YiA9IGdldF9ob3N0X3ZtY2Ioc3ZtKTsKKworCWlmICh2bWNiLT5jb250cm9sLmV4aXRfaW5mb18x
ICYgUEZFUlJfR1VFU1RfUEFHRV9NQVNLKQorCQlyZXR1cm4gdHJ1ZTsKKworCXJldHVybiBmYWxz
ZTsKK30KKwogc3RhdGljIHN0cnVjdCBrdm1feDg2X29wcyBzdm1feDg2X29wcyBfX3JvX2FmdGVy
X2luaXQgPSB7CiAJLmNwdV9oYXNfa3ZtX3N1cHBvcnQgPSBoYXNfc3ZtLAogCS5kaXNhYmxlZF9i
eV9iaW9zID0gaXNfZGlzYWJsZWQsCkBAIC03Njg4LDYgKzc2OTksNyBAQCBzdGF0aWMgc3RydWN0
IGt2bV94ODZfb3BzIHN2bV94ODZfb3BzIF9fcm9fYWZ0ZXJfaW5pdCA9IHsKIAogCS5mYXVsdF9n
bGEgPSBzdm1fZmF1bHRfZ2xhLAogCS5zcHRfZmF1bHQgPSBzdm1fc3B0X2ZhdWx0LAorCS5ncHRf
dHJhbnNsYXRpb25fZmF1bHQgPSBzdm1fZ3B0X3RyYW5zbGF0aW9uX2ZhdWx0LAogfTsKIAogc3Rh
dGljIGludCBfX2luaXQgc3ZtX2luaXQodm9pZCkKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS92
bXgvdm14LmMgYi9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jCmluZGV4IGNjMzA1MTNlY2E5NS4uNTQy
MmMzNWEzMjE2IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jCisrKyBiL2FyY2gv
eDg2L2t2bS92bXgvdm14LmMKQEAgLTc5MjEsNiArNzkyMSwxMyBAQCBzdGF0aWMgYm9vbCB2bXhf
c3B0X2ZhdWx0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIAlyZXR1cm4gKHZteC0+ZXhpdF9yZWFz
b24gPT0gRVhJVF9SRUFTT05fRVBUX1ZJT0xBVElPTik7CiB9CiAKK3N0YXRpYyBib29sIHZteF9n
cHRfdHJhbnNsYXRpb25fZmF1bHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQoreworCWlmICh2Y3B1
LT5hcmNoLmV4aXRfcXVhbGlmaWNhdGlvbiAmIEVQVF9WSU9MQVRJT05fR1ZBX1RSQU5TTEFURUQp
CisJCXJldHVybiBmYWxzZTsKKwlyZXR1cm4gdHJ1ZTsKK30KKwogc3RhdGljIHN0cnVjdCBrdm1f
eDg2X29wcyB2bXhfeDg2X29wcyBfX3JvX2FmdGVyX2luaXQgPSB7CiAJLmNwdV9oYXNfa3ZtX3N1
cHBvcnQgPSBjcHVfaGFzX2t2bV9zdXBwb3J0LAogCS5kaXNhYmxlZF9ieV9iaW9zID0gdm14X2Rp
c2FibGVkX2J5X2Jpb3MsCkBAIC04MDg0LDYgKzgwOTEsNyBAQCBzdGF0aWMgc3RydWN0IGt2bV94
ODZfb3BzIHZteF94ODZfb3BzIF9fcm9fYWZ0ZXJfaW5pdCA9IHsKIAogCS5mYXVsdF9nbGEgPSB2
bXhfZmF1bHRfZ2xhLAogCS5zcHRfZmF1bHQgPSB2bXhfc3B0X2ZhdWx0LAorCS5ncHRfdHJhbnNs
YXRpb25fZmF1bHQgPSB2bXhfZ3B0X3RyYW5zbGF0aW9uX2ZhdWx0LAogfTsKIAogc3RhdGljIHZv
aWQgdm14X2NsZWFudXBfbDFkX2ZsdXNoKHZvaWQpCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFs
aXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
