Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E516C228AB5
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 23:16:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 88A1E86C34;
	Tue, 21 Jul 2020 21:16:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sO1E1a89pq69; Tue, 21 Jul 2020 21:16:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E893F86C94;
	Tue, 21 Jul 2020 21:16:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DE91FC016F;
	Tue, 21 Jul 2020 21:16:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A9884C088E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 96AF088280
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:16:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FH0vr6Xf3L-V
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:16:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8A53887F65
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:59 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 2339F305D769; Wed, 22 Jul 2020 00:09:22 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 062E5304FA13;
 Wed, 22 Jul 2020 00:09:22 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v9 20/84] KVM: x86: add .control_msr_intercept()
Date: Wed, 22 Jul 2020 00:08:18 +0300
Message-Id: <20200721210922.7646-21-alazar@bitdefender.com>
In-Reply-To: <20200721210922.7646-1-alazar@bitdefender.com>
References: <20200721210922.7646-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>,
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyBpcyBuZWVk
ZWQgZm9yIHRoZSBLVk1JX0VWRU5UX01TUiBldmVudCwgd2hpY2ggaXMgdXNlZCBub3RpZnkgdGhl
CmludHJvc3BlY3Rpb24gdG9vbCBhYm91dCBhbnkgY2hhbmdlIG1hZGUgdG8gYSBNU1Igb2YgaW50
ZXJlc3QuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaSBEb27Im3UgPG1kb250dUBiaXRkZWZlbmRlci5j
b20+CkNvLWRldmVsb3BlZC1ieTogTmljdciZb3IgQ8OuyJt1IDxuY2l0dUBiaXRkZWZlbmRlci5j
b20+ClNpZ25lZC1vZmYtYnk6IE5pY3XImW9yIEPDrsibdSA8bmNpdHVAYml0ZGVmZW5kZXIuY29t
PgpTaWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+
Ci0tLQogYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCB8ICAyICsrCiBhcmNoL3g4Ni9r
dm0vc3ZtL3N2bS5jICAgICAgICAgIHwgMTEgKysrKysrKysrKysKIGFyY2gveDg2L2t2bS92bXgv
dm14LmMgICAgICAgICAgfCAxMCArKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDIzIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIGIv
YXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAppbmRleCBhMzIzMGFiMzc3ZGIuLmYwNGEw
MWRhYzQyMyAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAorKysg
Yi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCkBAIC0xMTEwLDYgKzExMTAsOCBAQCBz
dHJ1Y3Qga3ZtX3g4Nl9vcHMgewogCXZvaWQgKCp1cGRhdGVfYnBfaW50ZXJjZXB0KShzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUpOwogCWludCAoKmdldF9tc3IpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwg
c3RydWN0IG1zcl9kYXRhICptc3IpOwogCWludCAoKnNldF9tc3IpKHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSwgc3RydWN0IG1zcl9kYXRhICptc3IpOworCXZvaWQgKCpjb250cm9sX21zcl9pbnRlcmNl
cHQpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgaW50IG1zciwKKwkJCQkgICAgICBp
bnQgdHlwZSwgYm9vbCBlbmFibGUpOwogCWJvb2wgKCptc3Jfd3JpdGVfaW50ZXJjZXB0ZWQpKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwgdTMyIG1zcik7CiAJdTY0ICgqZ2V0X3NlZ21lbnRfYmFzZSko
c3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBpbnQgc2VnKTsKIAl2b2lkICgqZ2V0X3NlZ21lbnQpKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9zdm0vc3ZtLmMg
Yi9hcmNoL3g4Ni9rdm0vc3ZtL3N2bS5jCmluZGV4IGRmYTFhNmU3NGJmNy4uOWM4ZTc3MTkzZjk4
IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vc3ZtL3N2bS5jCisrKyBiL2FyY2gveDg2L2t2bS9z
dm0vc3ZtLmMKQEAgLTYxMiw2ICs2MTIsMTYgQEAgc3RhdGljIHZvaWQgc2V0X21zcl9pbnRlcmNl
cHRpb24oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCW1zcnBtW29mZnNldF0gPSB0bXA7CiB9CiAK
K3N0YXRpYyB2b2lkIHN2bV9jb250cm9sX21zcl9pbnRlcmNlcHQoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1LCB1bnNpZ25lZCBpbnQgbXNyLAorCQkJCSAgICAgIGludCB0eXBlLCBib29sIGVuYWJsZSkK
K3sKKwljb25zdCBzdHJ1Y3QgdmNwdV9zdm0gKnN2bSA9IHRvX3N2bSh2Y3B1KTsKKwl1MzIgKm1z
cnBtID0gaXNfZ3Vlc3RfbW9kZSh2Y3B1KSA/IHN2bS0+bmVzdGVkLm1zcnBtIDoKKwkJCQkJICAg
c3ZtLT5tc3JwbTsKKworCXNldF9tc3JfaW50ZXJjZXB0aW9uKHZjcHUsIG1zcnBtLCBtc3IsIHR5
cGUsICFlbmFibGUpOworfQorCiBzdGF0aWMgdm9pZCBzdm1fdmNwdV9pbml0X21zcnBtKHUzMiAq
bXNycG0pCiB7CiAJaW50IGk7CkBAIC00MDk2LDYgKzQxMDYsNyBAQCBzdGF0aWMgc3RydWN0IGt2
bV94ODZfb3BzIHN2bV94ODZfb3BzIF9faW5pdGRhdGEgPSB7CiAJLmdldF9tc3JfZmVhdHVyZSA9
IHN2bV9nZXRfbXNyX2ZlYXR1cmUsCiAJLmdldF9tc3IgPSBzdm1fZ2V0X21zciwKIAkuc2V0X21z
ciA9IHN2bV9zZXRfbXNyLAorCS5jb250cm9sX21zcl9pbnRlcmNlcHQgPSBzdm1fY29udHJvbF9t
c3JfaW50ZXJjZXB0LAogCS5tc3Jfd3JpdGVfaW50ZXJjZXB0ZWQgPSBtc3Jfd3JpdGVfaW50ZXJj
ZXB0ZWQsCiAJLmdldF9zZWdtZW50X2Jhc2UgPSBzdm1fZ2V0X3NlZ21lbnRfYmFzZSwKIAkuZ2V0
X3NlZ21lbnQgPSBzdm1fZ2V0X3NlZ21lbnQsCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vdm14
L3ZteC5jIGIvYXJjaC94ODYva3ZtL3ZteC92bXguYwppbmRleCBlY2Y3ZmIyMWI4MTIuLmZlZDY2
MWViNjVhNyAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL3ZteC92bXguYworKysgYi9hcmNoL3g4
Ni9rdm0vdm14L3ZteC5jCkBAIC0zODIyLDYgKzM4MjIsMTUgQEAgc3RhdGljIF9fYWx3YXlzX2lu
bGluZSB2b2lkIHZteF9zZXRfaW50ZXJjZXB0X2Zvcl9tc3Ioc3RydWN0IGt2bV92Y3B1ICp2Y3B1
LAogCQl2bXhfZGlzYWJsZV9pbnRlcmNlcHRfZm9yX21zcih2Y3B1LCBtc3JfYml0bWFwLCBtc3Is
IHR5cGUpOwogfQogCitzdGF0aWMgdm9pZCB2bXhfY29udHJvbF9tc3JfaW50ZXJjZXB0KHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgaW50IG1zciwKKwkJCQkgICAgICBpbnQgdHlwZSwg
Ym9vbCBlbmFibGUpCit7CisJc3RydWN0IHZjcHVfdm14ICp2bXggPSB0b192bXgodmNwdSk7CisJ
dW5zaWduZWQgbG9uZyAqbXNyX2JpdG1hcCA9IHZteC0+dm1jczAxLm1zcl9iaXRtYXA7CisKKwl2
bXhfc2V0X2ludGVyY2VwdF9mb3JfbXNyKHZjcHUsIG1zcl9iaXRtYXAsIG1zciwgdHlwZSwgZW5h
YmxlKTsKK30KKwogc3RhdGljIHU4IHZteF9tc3JfYml0bWFwX21vZGUoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1KQogewogCXU4IG1vZGUgPSAwOwpAQCAtNzkxNiw2ICs3OTI1LDcgQEAgc3RhdGljIHN0
cnVjdCBrdm1feDg2X29wcyB2bXhfeDg2X29wcyBfX2luaXRkYXRhID0gewogCS5nZXRfbXNyX2Zl
YXR1cmUgPSB2bXhfZ2V0X21zcl9mZWF0dXJlLAogCS5nZXRfbXNyID0gdm14X2dldF9tc3IsCiAJ
LnNldF9tc3IgPSB2bXhfc2V0X21zciwKKwkuY29udHJvbF9tc3JfaW50ZXJjZXB0ID0gdm14X2Nv
bnRyb2xfbXNyX2ludGVyY2VwdCwKIAkubXNyX3dyaXRlX2ludGVyY2VwdGVkID0gbXNyX3dyaXRl
X2ludGVyY2VwdGVkLAogCS5nZXRfc2VnbWVudF9iYXNlID0gdm14X2dldF9zZWdtZW50X2Jhc2Us
CiAJLmdldF9zZWdtZW50ID0gdm14X2dldF9zZWdtZW50LApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmly
dHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51
eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
