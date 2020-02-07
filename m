Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B5976155E12
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 19:26:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5C3F986978;
	Fri,  7 Feb 2020 18:26:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6g6VD0946wMO; Fri,  7 Feb 2020 18:26:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id ECF2786968;
	Fri,  7 Feb 2020 18:26:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D911BC013E;
	Fri,  7 Feb 2020 18:26:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B5BCC1D89
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 67F8786F8A
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:26:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xU3E9uqd6qBQ
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C445486E53
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:57 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 9AC60305D3D6; Fri,  7 Feb 2020 20:16:39 +0200 (EET)
Received: from host.bbu.bitdefender.biz (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 662813052066;
 Fri,  7 Feb 2020 20:16:39 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v7 19/78] KVM: x86: add .control_msr_intercept()
Date: Fri,  7 Feb 2020 20:15:37 +0200
Message-Id: <20200207181636.1065-20-alazar@bitdefender.com>
In-Reply-To: <20200207181636.1065-1-alazar@bitdefender.com>
References: <20200207181636.1065-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Nicu=C8=99or=20C=C3=AE=C8=9Bu?= <ncitu@bitdefender.com>,
 =?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 virtualization@lists.linux-foundation.org,
 =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyBpcyBuZWVk
ZWQgZm9yIHRoZSBLVk1JX0VWRU5UX01TUiBldmVudC4KU2lnbmVkLW9mZi1ieTogTWloYWkgRG9u
yJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgpDby1kZXZlbG9wZWQtYnk6IE5pY3XImW9yIEPD
rsibdSA8bmNpdHVAYml0ZGVmZW5kZXIuY29tPgpTaWduZWQtb2ZmLWJ5OiBOaWN1yJlvciBDw67I
m3UgPG5jaXR1QGJpdGRlZmVuZGVyLmNvbT4KU2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINy
IDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIGFyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9o
b3N0LmggfCAgMiArKwogYXJjaC94ODYva3ZtL3N2bS5jICAgICAgICAgICAgICB8IDExICsrKysr
KysrKysrCiBhcmNoL3g4Ni9rdm0vdm14L3ZteC5jICAgICAgICAgIHwgMTAgKysrKysrKysrKwog
MyBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYv
aW5jbHVkZS9hc20va3ZtX2hvc3QuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgK
aW5kZXggMjEzNmYyNzM2NDVhLi5kOGM2MWNjMzAxZmEgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2lu
Y2x1ZGUvYXNtL2t2bV9ob3N0LmgKKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3Qu
aApAQCAtMTA2MCw2ICsxMDYwLDggQEAgc3RydWN0IGt2bV94ODZfb3BzIHsKIAl2b2lkICgqdXBk
YXRlX2JwX2ludGVyY2VwdCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIAlpbnQgKCpnZXRfbXNy
KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBtc3JfZGF0YSAqbXNyKTsKIAlpbnQgKCpz
ZXRfbXNyKShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBtc3JfZGF0YSAqbXNyKTsKKwl2
b2lkICgqY29udHJvbF9tc3JfaW50ZXJjZXB0KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2ln
bmVkIGludCBtc3IsCisJCQkJICAgICAgaW50IHR5cGUsIGJvb2wgZW5hYmxlKTsKIAlib29sICgq
bXNyX3dyaXRlX2ludGVyY2VwdGVkKShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHUzMiBtc3IpOwog
CXU2NCAoKmdldF9zZWdtZW50X2Jhc2UpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgaW50IHNlZyk7
CiAJdm9pZCAoKmdldF9zZWdtZW50KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCmRpZmYgLS1naXQg
YS9hcmNoL3g4Ni9rdm0vc3ZtLmMgYi9hcmNoL3g4Ni9rdm0vc3ZtLmMKaW5kZXggMTc0Y2VkNjMz
YjYwLi4yMWYwMmQ5MmFmNzggMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS9zdm0uYworKysgYi9h
cmNoL3g4Ni9rdm0vc3ZtLmMKQEAgLTczMzksNiArNzMzOSwxNiBAQCBzdGF0aWMgaW5saW5lIGJv
b2wgc3ZtX2Rlc2NfaW50ZXJjZXB0ZWQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogCQlnZXRfaW50
ZXJjZXB0KHN2bSwgSU5URVJDRVBUX0xPQURfVFIpKTsKIH0KIAorc3RhdGljIHZvaWQgc3ZtX2Nv
bnRyb2xfbXNyX2ludGVyY2VwdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGludCBt
c3IsCisJCQkJICAgICAgaW50IHR5cGUsIGJvb2wgZW5hYmxlKQoreworCWNvbnN0IHN0cnVjdCB2
Y3B1X3N2bSAqc3ZtID0gdG9fc3ZtKHZjcHUpOworCXUzMiAqbXNycG0gPSBpc19ndWVzdF9tb2Rl
KHZjcHUpID8gc3ZtLT5uZXN0ZWQubXNycG0gOgorCQkJCQkgICBzdm0tPm1zcnBtOworCisJc2V0
X21zcl9pbnRlcmNlcHRpb24odmNwdSwgbXNycG0sIG1zciwgdHlwZSwgIWVuYWJsZSk7Cit9CisK
IHN0YXRpYyBzdHJ1Y3Qga3ZtX3g4Nl9vcHMgc3ZtX3g4Nl9vcHMgX19yb19hZnRlcl9pbml0ID0g
ewogCS5jcHVfaGFzX2t2bV9zdXBwb3J0ID0gaGFzX3N2bSwKIAkuZGlzYWJsZWRfYnlfYmlvcyA9
IGlzX2Rpc2FibGVkLApAQCAtNzM3MCw2ICs3MzgwLDcgQEAgc3RhdGljIHN0cnVjdCBrdm1feDg2
X29wcyBzdm1feDg2X29wcyBfX3JvX2FmdGVyX2luaXQgPSB7CiAJLmdldF9tc3JfZmVhdHVyZSA9
IHN2bV9nZXRfbXNyX2ZlYXR1cmUsCiAJLmdldF9tc3IgPSBzdm1fZ2V0X21zciwKIAkuc2V0X21z
ciA9IHN2bV9zZXRfbXNyLAorCS5jb250cm9sX21zcl9pbnRlcmNlcHQgPSBzdm1fY29udHJvbF9t
c3JfaW50ZXJjZXB0LAogCS5tc3Jfd3JpdGVfaW50ZXJjZXB0ZWQgPSBtc3Jfd3JpdGVfaW50ZXJj
ZXB0ZWQsCiAJLmdldF9zZWdtZW50X2Jhc2UgPSBzdm1fZ2V0X3NlZ21lbnRfYmFzZSwKIAkuZ2V0
X3NlZ21lbnQgPSBzdm1fZ2V0X3NlZ21lbnQsCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vdm14
L3ZteC5jIGIvYXJjaC94ODYva3ZtL3ZteC92bXguYwppbmRleCBlNjg3ODA5N2Q3MzYuLjdhNjE0
MjdhZjM3MCAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL3ZteC92bXguYworKysgYi9hcmNoL3g4
Ni9rdm0vdm14L3ZteC5jCkBAIC03ODA2LDYgKzc4MDYsMTUgQEAgc3RhdGljIGJvb2wgdm14X2Rl
c2NfaW50ZXJjZXB0ZWQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogCXJldHVybiAhIShzZWNvbmRh
cnlfZXhlY19jb250cm9sc19nZXQodm14KSAmIFNFQ09OREFSWV9FWEVDX0RFU0MpOwogfQogCitz
dGF0aWMgdm9pZCB2bXhfY29udHJvbF9tc3JfaW50ZXJjZXB0KHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSwgdW5zaWduZWQgaW50IG1zciwKKwkJCQkgICAgICBpbnQgdHlwZSwgYm9vbCBlbmFibGUpCit7
CisJc3RydWN0IHZjcHVfdm14ICp2bXggPSB0b192bXgodmNwdSk7CisJdW5zaWduZWQgbG9uZyAq
bXNyX2JpdG1hcCA9IHZteC0+dm1jczAxLm1zcl9iaXRtYXA7CisKKwl2bXhfc2V0X2ludGVyY2Vw
dF9mb3JfbXNyKHZjcHUsIG1zcl9iaXRtYXAsIG1zciwgdHlwZSwgZW5hYmxlKTsKK30KKwogc3Rh
dGljIHN0cnVjdCBrdm1feDg2X29wcyB2bXhfeDg2X29wcyBfX3JvX2FmdGVyX2luaXQgPSB7CiAJ
LmNwdV9oYXNfa3ZtX3N1cHBvcnQgPSBjcHVfaGFzX2t2bV9zdXBwb3J0LAogCS5kaXNhYmxlZF9i
eV9iaW9zID0gdm14X2Rpc2FibGVkX2J5X2Jpb3MsCkBAIC03ODM0LDYgKzc4NDMsNyBAQCBzdGF0
aWMgc3RydWN0IGt2bV94ODZfb3BzIHZteF94ODZfb3BzIF9fcm9fYWZ0ZXJfaW5pdCA9IHsKIAku
Z2V0X21zcl9mZWF0dXJlID0gdm14X2dldF9tc3JfZmVhdHVyZSwKIAkuZ2V0X21zciA9IHZteF9n
ZXRfbXNyLAogCS5zZXRfbXNyID0gdm14X3NldF9tc3IsCisJLmNvbnRyb2xfbXNyX2ludGVyY2Vw
dCA9IHZteF9jb250cm9sX21zcl9pbnRlcmNlcHQsCiAJLm1zcl93cml0ZV9pbnRlcmNlcHRlZCA9
IG1zcl93cml0ZV9pbnRlcmNlcHRlZCwKIAkuZ2V0X3NlZ21lbnRfYmFzZSA9IHZteF9nZXRfc2Vn
bWVudF9iYXNlLAogCS5nZXRfc2VnbWVudCA9IHZteF9nZXRfc2VnbWVudCwKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGlu
ZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8v
bGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
