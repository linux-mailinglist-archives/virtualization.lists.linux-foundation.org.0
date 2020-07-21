Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1F6228B21
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 23:26:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3AFDE8214A;
	Tue, 21 Jul 2020 21:26:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h-grAUgkV+ak; Tue, 21 Jul 2020 21:26:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4AF8988402;
	Tue, 21 Jul 2020 21:26:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 40429C016F;
	Tue, 21 Jul 2020 21:26:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90E5FC08A6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8D53A87A56
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k6lHiW5ALOlF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1195D883E2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:57 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 13BF0305D7EB; Wed, 22 Jul 2020 00:09:20 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id EA33A303EF1F;
 Wed, 22 Jul 2020 00:09:19 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v9 09/84] KVM: x86: add .bp_intercepted() to struct kvm_x86_ops
Date: Wed, 22 Jul 2020 00:08:07 +0300
Message-Id: <20200721210922.7646-10-alazar@bitdefender.com>
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

RnJvbTogTmljdciZb3IgQ8OuyJt1IDxuY2l0dUBiaXRkZWZlbmRlci5jb20+CgpCb3RoLCB0aGUg
aW50cm9zcGVjdGlvbiB0b29sIGFuZCB0aGUgZGV2aWNlIG1hbmFnZXIgY2FuIHJlcXVlc3QgI0JQ
CmludGVyY2VwdGlvbi4gVGhpcyBmdW5jdGlvbiB3aWxsIGJlIHVzZWQgdG8gY2hlY2sgaWYgdGhp
cyBpbnRlcmNlcHRpb24KaXMgZW5hYmxlZCBieSBlaXRoZXIgc2lkZS4KClNpZ25lZC1vZmYtYnk6
IE5pY3XImW9yIEPDrsibdSA8bmNpdHVAYml0ZGVmZW5kZXIuY29tPgpTaWduZWQtb2ZmLWJ5OiBB
ZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+Ci0tLQogYXJjaC94ODYvaW5j
bHVkZS9hc20va3ZtX2hvc3QuaCB8IDEgKwogYXJjaC94ODYva3ZtL3N2bS9zdm0uYyAgICAgICAg
ICB8IDggKysrKysrKysKIGFyY2gveDg2L2t2bS9zdm0vc3ZtLmggICAgICAgICAgfCA3ICsrKysr
KysKIGFyY2gveDg2L2t2bS92bXgvdm14LmMgICAgICAgICAgfCA2ICsrKysrKwogNCBmaWxlcyBj
aGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9h
c20va3ZtX2hvc3QuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKaW5kZXggYmU1
MzYzYjIxNTQwLi43OGZlM2M3YzgxNGMgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNt
L2t2bV9ob3N0LmgKKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaApAQCAtMTA5
OCw2ICsxMDk4LDcgQEAgc3RydWN0IGt2bV94ODZfb3BzIHsKIAl2b2lkICgqdmNwdV9sb2FkKShz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGludCBjcHUpOwogCXZvaWQgKCp2Y3B1X3B1dCkoc3RydWN0
IGt2bV92Y3B1ICp2Y3B1KTsKIAorCWJvb2wgKCpicF9pbnRlcmNlcHRlZCkoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1KTsKIAl2b2lkICgqdXBkYXRlX2JwX2ludGVyY2VwdCkoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1KTsKIAlpbnQgKCpnZXRfbXNyKShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBt
c3JfZGF0YSAqbXNyKTsKIAlpbnQgKCpzZXRfbXNyKShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0
cnVjdCBtc3JfZGF0YSAqbXNyKTsKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9zdm0vc3ZtLmMg
Yi9hcmNoL3g4Ni9rdm0vc3ZtL3N2bS5jCmluZGV4IGMwZGE0ZGQ3OGFjNS4uMjNiM2NkMDU3NzUz
IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vc3ZtL3N2bS5jCisrKyBiL2FyY2gveDg2L2t2bS9z
dm0vc3ZtLmMKQEAgLTE2MjcsNiArMTYyNywxMyBAQCBzdGF0aWMgdm9pZCBzdm1fc2V0X3NlZ21l
bnQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCW1hcmtfZGlydHkoc3ZtLT52bWNiLCBWTUNCX1NF
Ryk7CiB9CiAKK3N0YXRpYyBib29sIHN2bV9icF9pbnRlcmNlcHRlZChzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUpCit7CisJc3RydWN0IHZjcHVfc3ZtICpzdm0gPSB0b19zdm0odmNwdSk7CisKKwlyZXR1
cm4gZ2V0X2V4Y2VwdGlvbl9pbnRlcmNlcHQoc3ZtLCBCUF9WRUNUT1IpOworfQorCiBzdGF0aWMg
dm9pZCB1cGRhdGVfYnBfaW50ZXJjZXB0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIHsKIAlzdHJ1
Y3QgdmNwdV9zdm0gKnN2bSA9IHRvX3N2bSh2Y3B1KTsKQEAgLTM5ODksNiArMzk5Niw3IEBAIHN0
YXRpYyBzdHJ1Y3Qga3ZtX3g4Nl9vcHMgc3ZtX3g4Nl9vcHMgX19pbml0ZGF0YSA9IHsKIAkudmNw
dV9ibG9ja2luZyA9IHN2bV92Y3B1X2Jsb2NraW5nLAogCS52Y3B1X3VuYmxvY2tpbmcgPSBzdm1f
dmNwdV91bmJsb2NraW5nLAogCisJLmJwX2ludGVyY2VwdGVkID0gc3ZtX2JwX2ludGVyY2VwdGVk
LAogCS51cGRhdGVfYnBfaW50ZXJjZXB0ID0gdXBkYXRlX2JwX2ludGVyY2VwdCwKIAkuZ2V0X21z
cl9mZWF0dXJlID0gc3ZtX2dldF9tc3JfZmVhdHVyZSwKIAkuZ2V0X21zciA9IHN2bV9nZXRfbXNy
LApkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3N2bS9zdm0uaCBiL2FyY2gveDg2L2t2bS9zdm0v
c3ZtLmgKaW5kZXggNmFjNGMwMGE1ZDgyLi5kNWM5NTZlMDdjMTIgMTAwNjQ0Ci0tLSBhL2FyY2gv
eDg2L2t2bS9zdm0vc3ZtLmgKKysrIGIvYXJjaC94ODYva3ZtL3N2bS9zdm0uaApAQCAtMjkzLDYg
KzI5MywxMyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgY2xyX2V4Y2VwdGlvbl9pbnRlcmNlcHQoc3Ry
dWN0IHZjcHVfc3ZtICpzdm0sIGludCBiaXQpCiAJcmVjYWxjX2ludGVyY2VwdHMoc3ZtKTsKIH0K
IAorc3RhdGljIGlubGluZSBib29sIGdldF9leGNlcHRpb25faW50ZXJjZXB0KHN0cnVjdCB2Y3B1
X3N2bSAqc3ZtLCBpbnQgYml0KQoreworCXN0cnVjdCB2bWNiICp2bWNiID0gZ2V0X2hvc3Rfdm1j
Yihzdm0pOworCisJcmV0dXJuICh2bWNiLT5jb250cm9sLmludGVyY2VwdF9leGNlcHRpb25zICYg
KDFVIDw8IGJpdCkpOworfQorCiBzdGF0aWMgaW5saW5lIHZvaWQgc2V0X2ludGVyY2VwdChzdHJ1
Y3QgdmNwdV9zdm0gKnN2bSwgaW50IGJpdCkKIHsKIAlzdHJ1Y3Qgdm1jYiAqdm1jYiA9IGdldF9o
b3N0X3ZtY2Ioc3ZtKTsKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS92bXgvdm14LmMgYi9hcmNo
L3g4Ni9rdm0vdm14L3ZteC5jCmluZGV4IDEzNzQ1ZjJhNWVjZC4uMDY5NTkzZjJmNTA0IDEwMDY0
NAotLS0gYS9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jCisrKyBiL2FyY2gveDg2L2t2bS92bXgvdm14
LmMKQEAgLTc2MCw2ICs3NjAsMTEgQEAgc3RhdGljIHUzMiB2bXhfcmVhZF9ndWVzdF9zZWdfYXIo
c3RydWN0IHZjcHVfdm14ICp2bXgsIHVuc2lnbmVkIHNlZykKIAlyZXR1cm4gKnA7CiB9CiAKK3N0
YXRpYyBib29sIHZteF9icF9pbnRlcmNlcHRlZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCit7CisJ
cmV0dXJuICh2bWNzX3JlYWQzMihFWENFUFRJT05fQklUTUFQKSAmICgxdSA8PCBCUF9WRUNUT1Ip
KTsKK30KKwogdm9pZCB1cGRhdGVfZXhjZXB0aW9uX2JpdG1hcChzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUpCiB7CiAJdTMyIGViOwpAQCAtNzg1OSw2ICs3ODY0LDcgQEAgc3RhdGljIHN0cnVjdCBrdm1f
eDg2X29wcyB2bXhfeDg2X29wcyBfX2luaXRkYXRhID0gewogCS52Y3B1X2xvYWQgPSB2bXhfdmNw
dV9sb2FkLAogCS52Y3B1X3B1dCA9IHZteF92Y3B1X3B1dCwKIAorCS5icF9pbnRlcmNlcHRlZCA9
IHZteF9icF9pbnRlcmNlcHRlZCwKIAkudXBkYXRlX2JwX2ludGVyY2VwdCA9IHVwZGF0ZV9leGNl
cHRpb25fYml0bWFwLAogCS5nZXRfbXNyX2ZlYXR1cmUgPSB2bXhfZ2V0X21zcl9mZWF0dXJlLAog
CS5nZXRfbXNyID0gdm14X2dldF9tc3IsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlv
bkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
