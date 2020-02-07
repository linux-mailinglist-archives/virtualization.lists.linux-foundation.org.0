Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E0946155E2A
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 19:35:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 96FDB2264A;
	Fri,  7 Feb 2020 18:35:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nSX7kA6RAQ0n; Fri,  7 Feb 2020 18:35:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DCCA420115;
	Fri,  7 Feb 2020 18:35:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5D91C013E;
	Fri,  7 Feb 2020 18:35:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DB05CC013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C93B9862DE
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G9ewaUX1AgrQ
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CD0FC85C45
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:51 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 2E42B305D3CD; Fri,  7 Feb 2020 20:16:39 +0200 (EET)
Received: from host.bbu.bitdefender.biz (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id C7A5D305206D;
 Fri,  7 Feb 2020 20:16:38 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v7 10/78] KVM: x86: add .bp_intercepted() to struct
 kvm_x86_ops
Date: Fri,  7 Feb 2020 20:15:28 +0200
Message-Id: <20200207181636.1065-11-alazar@bitdefender.com>
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

RnJvbTogTmljdciZb3IgQ8OuyJt1IDxuY2l0dUBiaXRkZWZlbmRlci5jb20+CgpUaGUgaW50cm9z
cGVjdGlvbiB0b29sIGFuZCB0aGUgdXNlcnNwYWNlIGNvdWxkIHJlcXVlc3QgI0JQCmludGVyY2Vw
dGlvbi4gVGhpcyBmdW5jdGlvbiB3aWxsIGJlIHVzZWQgdG8gY2hlY2sgaWYgdGhlIGludGVyY2Vw
dGlvbgppcyBhbHJlYWR5IGVuYWJsZWQuCgpTaWduZWQtb2ZmLWJ5OiBOaWN1yJlvciBDw67Im3Ug
PG5jaXR1QGJpdGRlZmVuZGVyLmNvbT4KU2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxh
bGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIGFyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0
LmggfCAgMSArCiBhcmNoL3g4Ni9rdm0vc3ZtLmMgICAgICAgICAgICAgIHwgMTUgKysrKysrKysr
KysrKysrCiBhcmNoL3g4Ni9rdm0vdm14L3ZteC5jICAgICAgICAgIHwgIDYgKysrKysrCiAzIGZp
bGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNs
dWRlL2FzbS9rdm1faG9zdC5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAppbmRl
eCBiNzljZDZhYTQwNzUuLmQyNzkxOTVkYWM5NyAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVk
ZS9hc20va3ZtX2hvc3QuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCkBA
IC0xMDQ4LDYgKzEwNDgsNyBAQCBzdHJ1Y3Qga3ZtX3g4Nl9vcHMgewogCXZvaWQgKCp2Y3B1X2xv
YWQpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgaW50IGNwdSk7CiAJdm9pZCAoKnZjcHVfcHV0KShz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogCisJYm9vbCAoKmJwX2ludGVyY2VwdGVkKShzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUpOwogCXZvaWQgKCp1cGRhdGVfYnBfaW50ZXJjZXB0KShzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUpOwogCWludCAoKmdldF9tc3IpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3Ry
dWN0IG1zcl9kYXRhICptc3IpOwogCWludCAoKnNldF9tc3IpKHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSwgc3RydWN0IG1zcl9kYXRhICptc3IpOwpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3N2bS5j
IGIvYXJjaC94ODYva3ZtL3N2bS5jCmluZGV4IDEyMmQ0Y2UzYjFhYi4uZGYzNGFiMGRhNGZmIDEw
MDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vc3ZtLmMKKysrIGIvYXJjaC94ODYva3ZtL3N2bS5jCkBA
IC02MDcsNiArNjA3LDEzIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBjbHJfZXhjZXB0aW9uX2ludGVy
Y2VwdChzdHJ1Y3QgdmNwdV9zdm0gKnN2bSwgaW50IGJpdCkKIAlyZWNhbGNfaW50ZXJjZXB0cyhz
dm0pOwogfQogCitzdGF0aWMgaW5saW5lIGJvb2wgZ2V0X2V4Y2VwdGlvbl9pbnRlcmNlcHQoc3Ry
dWN0IHZjcHVfc3ZtICpzdm0sIGludCBiaXQpCit7CisJc3RydWN0IHZtY2IgKnZtY2IgPSBnZXRf
aG9zdF92bWNiKHN2bSk7CisKKwlyZXR1cm4gKHZtY2ItPmNvbnRyb2wuaW50ZXJjZXB0X2V4Y2Vw
dGlvbnMgJiAoMVUgPDwgYml0KSk7Cit9CisKIHN0YXRpYyBpbmxpbmUgdm9pZCBzZXRfaW50ZXJj
ZXB0KHN0cnVjdCB2Y3B1X3N2bSAqc3ZtLCBpbnQgYml0KQogewogCXN0cnVjdCB2bWNiICp2bWNi
ID0gZ2V0X2hvc3Rfdm1jYihzdm0pOwpAQCAtNzI0Miw2ICs3MjQ5LDEzIEBAIHN0YXRpYyBib29s
IHN2bV9hcGljX2luaXRfc2lnbmFsX2Jsb2NrZWQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogCQkg
ICAoc3ZtLT52bWNiLT5jb250cm9sLmludGVyY2VwdCAmICgxVUxMIDw8IElOVEVSQ0VQVF9JTklU
KSk7CiB9CiAKK3N0YXRpYyBpbmxpbmUgYm9vbCBzdm1fYnBfaW50ZXJjZXB0ZWQoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1KQoreworCXN0cnVjdCB2Y3B1X3N2bSAqc3ZtID0gdG9fc3ZtKHZjcHUpOwor
CisJcmV0dXJuIGdldF9leGNlcHRpb25faW50ZXJjZXB0KHN2bSwgQlBfVkVDVE9SKTsKK30KKwog
c3RhdGljIHN0cnVjdCBrdm1feDg2X29wcyBzdm1feDg2X29wcyBfX3JvX2FmdGVyX2luaXQgPSB7
CiAJLmNwdV9oYXNfa3ZtX3N1cHBvcnQgPSBoYXNfc3ZtLAogCS5kaXNhYmxlZF9ieV9iaW9zID0g
aXNfZGlzYWJsZWQsCkBAIC03MjY4LDYgKzcyODIsNyBAQCBzdGF0aWMgc3RydWN0IGt2bV94ODZf
b3BzIHN2bV94ODZfb3BzIF9fcm9fYWZ0ZXJfaW5pdCA9IHsKIAkudmNwdV9ibG9ja2luZyA9IHN2
bV92Y3B1X2Jsb2NraW5nLAogCS52Y3B1X3VuYmxvY2tpbmcgPSBzdm1fdmNwdV91bmJsb2NraW5n
LAogCisJLmJwX2ludGVyY2VwdGVkID0gc3ZtX2JwX2ludGVyY2VwdGVkLAogCS51cGRhdGVfYnBf
aW50ZXJjZXB0ID0gdXBkYXRlX2JwX2ludGVyY2VwdCwKIAkuZ2V0X21zcl9mZWF0dXJlID0gc3Zt
X2dldF9tc3JfZmVhdHVyZSwKIAkuZ2V0X21zciA9IHN2bV9nZXRfbXNyLApkaWZmIC0tZ2l0IGEv
YXJjaC94ODYva3ZtL3ZteC92bXguYyBiL2FyY2gveDg2L2t2bS92bXgvdm14LmMKaW5kZXggZTMz
OTRjODM5ZGVhLi4wZDdjYTcwYjMxMGUgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS92bXgvdm14
LmMKKysrIGIvYXJjaC94ODYva3ZtL3ZteC92bXguYwpAQCAtNzc1OCw2ICs3NzU4LDExIEBAIHN0
YXRpYyBfX2V4aXQgdm9pZCBoYXJkd2FyZV91bnNldHVwKHZvaWQpCiAJZnJlZV9rdm1fYXJlYSgp
OwogfQogCitzdGF0aWMgYm9vbCB2bXhfYnBfaW50ZXJjZXB0ZWQoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1KQoreworCXJldHVybiAodm1jc19yZWFkMzIoRVhDRVBUSU9OX0JJVE1BUCkgJiAoMXUgPDwg
QlBfVkVDVE9SKSk7Cit9CisKIHN0YXRpYyBzdHJ1Y3Qga3ZtX3g4Nl9vcHMgdm14X3g4Nl9vcHMg
X19yb19hZnRlcl9pbml0ID0gewogCS5jcHVfaGFzX2t2bV9zdXBwb3J0ID0gY3B1X2hhc19rdm1f
c3VwcG9ydCwKIAkuZGlzYWJsZWRfYnlfYmlvcyA9IHZteF9kaXNhYmxlZF9ieV9iaW9zLApAQCAt
Nzc4MSw2ICs3Nzg2LDcgQEAgc3RhdGljIHN0cnVjdCBrdm1feDg2X29wcyB2bXhfeDg2X29wcyBf
X3JvX2FmdGVyX2luaXQgPSB7CiAJLnZjcHVfbG9hZCA9IHZteF92Y3B1X2xvYWQsCiAJLnZjcHVf
cHV0ID0gdm14X3ZjcHVfcHV0LAogCisJLmJwX2ludGVyY2VwdGVkID0gdm14X2JwX2ludGVyY2Vw
dGVkLAogCS51cGRhdGVfYnBfaW50ZXJjZXB0ID0gdXBkYXRlX2V4Y2VwdGlvbl9iaXRtYXAsCiAJ
LmdldF9tc3JfZmVhdHVyZSA9IHZteF9nZXRfbXNyX2ZlYXR1cmUsCiAJLmdldF9tc3IgPSB2bXhf
Z2V0X21zciwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3ZpcnR1YWxpemF0aW9u
