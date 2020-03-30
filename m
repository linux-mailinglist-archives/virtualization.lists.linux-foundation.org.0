Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B5720197893
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 12:13:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4CE172313D;
	Mon, 30 Mar 2020 10:13:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I08lpukBgy6J; Mon, 30 Mar 2020 10:13:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 652EE2314E;
	Mon, 30 Mar 2020 10:13:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4E5A6C07FF;
	Mon, 30 Mar 2020 10:13:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90989C1D8F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 73795878DD
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tvQPztVOTBQ8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4F706878E6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:54 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 61A7330747C9; Mon, 30 Mar 2020 13:12:51 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 350D3305B7A0;
 Mon, 30 Mar 2020 13:12:51 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v8 17/81] KVM: x86: export .msr_write_intercepted()
Date: Mon, 30 Mar 2020 13:12:04 +0300
Message-Id: <20200330101308.21702-18-alazar@bitdefender.com>
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
aW9uIHdpbGwgYmUgdXNlZCB0byB0ZXN0IGlmIGEgTVNSIGFjY2VzcyBpcyBhbHJlYWR5IHRyYWNr
ZWQuCgpTaWduZWQtb2ZmLWJ5OiBOaWN1yJlvciBDw67Im3UgPG5jaXR1QGJpdGRlZmVuZGVyLmNv
bT4KU2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29t
PgotLS0KIGFyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggfCAxICsKIGFyY2gveDg2L2t2
bS9zdm0uYyAgICAgICAgICAgICAgfCAxICsKIGFyY2gveDg2L2t2bS92bXgvdm14LmMgICAgICAg
ICAgfCAxICsKIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
YXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2
bV9ob3N0LmgKaW5kZXggODk5NjhlYzYzYjY0Li44ZDUwMTIzMzBlMmQgMTAwNjQ0Ci0tLSBhL2Fy
Y2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20v
a3ZtX2hvc3QuaApAQCAtMTA4NSw2ICsxMDg1LDcgQEAgc3RydWN0IGt2bV94ODZfb3BzIHsKIAl2
b2lkICgqdXBkYXRlX2JwX2ludGVyY2VwdCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIAlpbnQg
KCpnZXRfbXNyKShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBtc3JfZGF0YSAqbXNyKTsK
IAlpbnQgKCpzZXRfbXNyKShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBtc3JfZGF0YSAq
bXNyKTsKKwlib29sICgqbXNyX3dyaXRlX2ludGVyY2VwdGVkKShzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsIHUzMiBtc3IpOwogCXU2NCAoKmdldF9zZWdtZW50X2Jhc2UpKHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSwgaW50IHNlZyk7CiAJdm9pZCAoKmdldF9zZWdtZW50KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsCiAJCQkgICAgc3RydWN0IGt2bV9zZWdtZW50ICp2YXIsIGludCBzZWcpOwpkaWZmIC0tZ2l0
IGEvYXJjaC94ODYva3ZtL3N2bS5jIGIvYXJjaC94ODYva3ZtL3N2bS5jCmluZGV4IDM0ZTdmNGYx
OGNkOC4uNDYzZmU4MTEyZjIyIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vc3ZtLmMKKysrIGIv
YXJjaC94ODYva3ZtL3N2bS5jCkBAIC03NTI0LDYgKzc1MjQsNyBAQCBzdGF0aWMgc3RydWN0IGt2
bV94ODZfb3BzIHN2bV94ODZfb3BzIF9fcm9fYWZ0ZXJfaW5pdCA9IHsKIAkuZ2V0X21zcl9mZWF0
dXJlID0gc3ZtX2dldF9tc3JfZmVhdHVyZSwKIAkuZ2V0X21zciA9IHN2bV9nZXRfbXNyLAogCS5z
ZXRfbXNyID0gc3ZtX3NldF9tc3IsCisJLm1zcl93cml0ZV9pbnRlcmNlcHRlZCA9IG1zcl93cml0
ZV9pbnRlcmNlcHRlZCwKIAkuZ2V0X3NlZ21lbnRfYmFzZSA9IHN2bV9nZXRfc2VnbWVudF9iYXNl
LAogCS5nZXRfc2VnbWVudCA9IHN2bV9nZXRfc2VnbWVudCwKIAkuc2V0X3NlZ21lbnQgPSBzdm1f
c2V0X3NlZ21lbnQsCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jIGIvYXJjaC94
ODYva3ZtL3ZteC92bXguYwppbmRleCA0NjUxZDEyODM2OTguLjI4MDFiMWY3MDU0ZiAxMDA2NDQK
LS0tIGEvYXJjaC94ODYva3ZtL3ZteC92bXguYworKysgYi9hcmNoL3g4Ni9rdm0vdm14L3ZteC5j
CkBAIC03OTE5LDYgKzc5MTksNyBAQCBzdGF0aWMgc3RydWN0IGt2bV94ODZfb3BzIHZteF94ODZf
b3BzIF9fcm9fYWZ0ZXJfaW5pdCA9IHsKIAkuZ2V0X21zcl9mZWF0dXJlID0gdm14X2dldF9tc3Jf
ZmVhdHVyZSwKIAkuZ2V0X21zciA9IHZteF9nZXRfbXNyLAogCS5zZXRfbXNyID0gdm14X3NldF9t
c3IsCisJLm1zcl93cml0ZV9pbnRlcmNlcHRlZCA9IG1zcl93cml0ZV9pbnRlcmNlcHRlZCwKIAku
Z2V0X3NlZ21lbnRfYmFzZSA9IHZteF9nZXRfc2VnbWVudF9iYXNlLAogCS5nZXRfc2VnbWVudCA9
IHZteF9nZXRfc2VnbWVudCwKIAkuc2V0X3NlZ21lbnQgPSB2bXhfc2V0X3NlZ21lbnQsCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9u
IG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpo
dHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFs
aXphdGlvbg==
