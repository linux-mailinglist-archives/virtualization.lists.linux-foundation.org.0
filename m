Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A9704197880
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 12:13:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5BB8586A3D;
	Mon, 30 Mar 2020 10:13:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kHV-olSEsYJ8; Mon, 30 Mar 2020 10:13:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 80841869E2;
	Mon, 30 Mar 2020 10:13:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6AFCCC07FF;
	Mon, 30 Mar 2020 10:13:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F36C3C07FF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DE25C86980
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8MHXb_s-BP39
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5B8A2869A9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:54 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 EFFF93074838; Mon, 30 Mar 2020 13:12:51 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id CE098305B7A1;
 Mon, 30 Mar 2020 13:12:51 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v8 21/81] KVM: x86: add .control_msr_intercept()
Date: Mon, 30 Mar 2020 13:12:08 +0300
Message-Id: <20200330101308.21702-22-alazar@bitdefender.com>
In-Reply-To: <20200330101308.21702-1-alazar@bitdefender.com>
References: <20200330101308.21702-1-alazar@bitdefender.com>
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
ZWQgZm9yIHRoZSBLVk1JX0VWRU5UX01TUiBldmVudC4KClNpZ25lZC1vZmYtYnk6IE1paGFpIERv
bsibdSA8bWRvbnR1QGJpdGRlZmVuZGVyLmNvbT4KQ28tZGV2ZWxvcGVkLWJ5OiBOaWN1yJlvciBD
w67Im3UgPG5jaXR1QGJpdGRlZmVuZGVyLmNvbT4KU2lnbmVkLW9mZi1ieTogTmljdciZb3IgQ8Ou
yJt1IDxuY2l0dUBiaXRkZWZlbmRlci5jb20+ClNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSD
ciA8YWxhemFyQGJpdGRlZmVuZGVyLmNvbT4KLS0tCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1f
aG9zdC5oIHwgIDIgKysKIGFyY2gveDg2L2t2bS9zdm0uYyAgICAgICAgICAgICAgfCAxMSArKysr
KysrKysrKwogYXJjaC94ODYva3ZtL3ZteC92bXguYyAgICAgICAgICB8IDEwICsrKysrKysrKysK
IDMgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2
L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5o
CmluZGV4IDlhZTBlMDM2NGNhZi4uNzNjOWZjZDgwMGY4IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9p
bmNsdWRlL2FzbS9rdm1faG9zdC5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0
LmgKQEAgLTEwODksNiArMTA4OSw4IEBAIHN0cnVjdCBrdm1feDg2X29wcyB7CiAJdm9pZCAoKnVw
ZGF0ZV9icF9pbnRlcmNlcHQpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7CiAJaW50ICgqZ2V0X21z
cikoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3QgbXNyX2RhdGEgKm1zcik7CiAJaW50ICgq
c2V0X21zcikoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3QgbXNyX2RhdGEgKm1zcik7CisJ
dm9pZCAoKmNvbnRyb2xfbXNyX2ludGVyY2VwdCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNp
Z25lZCBpbnQgbXNyLAorCQkJCSAgICAgIGludCB0eXBlLCBib29sIGVuYWJsZSk7CiAJYm9vbCAo
Km1zcl93cml0ZV9pbnRlcmNlcHRlZCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1MzIgbXNyKTsK
IAl1NjQgKCpnZXRfc2VnbWVudF9iYXNlKShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGludCBzZWcp
OwogCXZvaWQgKCpnZXRfc2VnbWVudCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LApkaWZmIC0tZ2l0
IGEvYXJjaC94ODYva3ZtL3N2bS5jIGIvYXJjaC94ODYva3ZtL3N2bS5jCmluZGV4IDM3Yzc4YmI0
YmEwYi4uMTMzNjA0Mjk5ODZlIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vc3ZtLmMKKysrIGIv
YXJjaC94ODYva3ZtL3N2bS5jCkBAIC03NTEwLDYgKzc1MTAsMTYgQEAgc3RhdGljIGlubGluZSBi
b29sIHN2bV9kZXNjX2ludGVyY2VwdGVkKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIAkJZ2V0X2lu
dGVyY2VwdChzdm0sIElOVEVSQ0VQVF9MT0FEX1RSKSk7CiB9CiAKK3N0YXRpYyB2b2lkIHN2bV9j
b250cm9sX21zcl9pbnRlcmNlcHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBpbnQg
bXNyLAorCQkJCSAgICAgIGludCB0eXBlLCBib29sIGVuYWJsZSkKK3sKKwljb25zdCBzdHJ1Y3Qg
dmNwdV9zdm0gKnN2bSA9IHRvX3N2bSh2Y3B1KTsKKwl1MzIgKm1zcnBtID0gaXNfZ3Vlc3RfbW9k
ZSh2Y3B1KSA/IHN2bS0+bmVzdGVkLm1zcnBtIDoKKwkJCQkJICAgc3ZtLT5tc3JwbTsKKworCXNl
dF9tc3JfaW50ZXJjZXB0aW9uKHZjcHUsIG1zcnBtLCBtc3IsIHR5cGUsICFlbmFibGUpOworfQor
CiBzdGF0aWMgc3RydWN0IGt2bV94ODZfb3BzIHN2bV94ODZfb3BzIF9fcm9fYWZ0ZXJfaW5pdCA9
IHsKIAkuY3B1X2hhc19rdm1fc3VwcG9ydCA9IGhhc19zdm0sCiAJLmRpc2FibGVkX2J5X2Jpb3Mg
PSBpc19kaXNhYmxlZCwKQEAgLTc1NDEsNiArNzU1MSw3IEBAIHN0YXRpYyBzdHJ1Y3Qga3ZtX3g4
Nl9vcHMgc3ZtX3g4Nl9vcHMgX19yb19hZnRlcl9pbml0ID0gewogCS5nZXRfbXNyX2ZlYXR1cmUg
PSBzdm1fZ2V0X21zcl9mZWF0dXJlLAogCS5nZXRfbXNyID0gc3ZtX2dldF9tc3IsCiAJLnNldF9t
c3IgPSBzdm1fc2V0X21zciwKKwkuY29udHJvbF9tc3JfaW50ZXJjZXB0ID0gc3ZtX2NvbnRyb2xf
bXNyX2ludGVyY2VwdCwKIAkubXNyX3dyaXRlX2ludGVyY2VwdGVkID0gbXNyX3dyaXRlX2ludGVy
Y2VwdGVkLAogCS5nZXRfc2VnbWVudF9iYXNlID0gc3ZtX2dldF9zZWdtZW50X2Jhc2UsCiAJLmdl
dF9zZWdtZW50ID0gc3ZtX2dldF9zZWdtZW50LApkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3Zt
eC92bXguYyBiL2FyY2gveDg2L2t2bS92bXgvdm14LmMKaW5kZXggNGRjNmZiZjkxY2E1Li44NDVi
ZjY4ODVhZTAgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS92bXgvdm14LmMKKysrIGIvYXJjaC94
ODYva3ZtL3ZteC92bXguYwpAQCAtNzg5Nyw2ICs3ODk3LDE1IEBAIHN0YXRpYyBib29sIHZteF9k
ZXNjX2ludGVyY2VwdGVkKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIAlyZXR1cm4gISEoc2Vjb25k
YXJ5X2V4ZWNfY29udHJvbHNfZ2V0KHZteCkgJiBTRUNPTkRBUllfRVhFQ19ERVNDKTsKIH0KIAor
c3RhdGljIHZvaWQgdm14X2NvbnRyb2xfbXNyX2ludGVyY2VwdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsIHVuc2lnbmVkIGludCBtc3IsCisJCQkJICAgICAgaW50IHR5cGUsIGJvb2wgZW5hYmxlKQor
eworCXN0cnVjdCB2Y3B1X3ZteCAqdm14ID0gdG9fdm14KHZjcHUpOworCXVuc2lnbmVkIGxvbmcg
Km1zcl9iaXRtYXAgPSB2bXgtPnZtY3MwMS5tc3JfYml0bWFwOworCisJdm14X3NldF9pbnRlcmNl
cHRfZm9yX21zcih2Y3B1LCBtc3JfYml0bWFwLCBtc3IsIHR5cGUsIGVuYWJsZSk7Cit9CisKIHN0
YXRpYyBzdHJ1Y3Qga3ZtX3g4Nl9vcHMgdm14X3g4Nl9vcHMgX19yb19hZnRlcl9pbml0ID0gewog
CS5jcHVfaGFzX2t2bV9zdXBwb3J0ID0gY3B1X2hhc19rdm1fc3VwcG9ydCwKIAkuZGlzYWJsZWRf
YnlfYmlvcyA9IHZteF9kaXNhYmxlZF9ieV9iaW9zLApAQCAtNzkyNSw2ICs3OTM0LDcgQEAgc3Rh
dGljIHN0cnVjdCBrdm1feDg2X29wcyB2bXhfeDg2X29wcyBfX3JvX2FmdGVyX2luaXQgPSB7CiAJ
LmdldF9tc3JfZmVhdHVyZSA9IHZteF9nZXRfbXNyX2ZlYXR1cmUsCiAJLmdldF9tc3IgPSB2bXhf
Z2V0X21zciwKIAkuc2V0X21zciA9IHZteF9zZXRfbXNyLAorCS5jb250cm9sX21zcl9pbnRlcmNl
cHQgPSB2bXhfY29udHJvbF9tc3JfaW50ZXJjZXB0LAogCS5tc3Jfd3JpdGVfaW50ZXJjZXB0ZWQg
PSBtc3Jfd3JpdGVfaW50ZXJjZXB0ZWQsCiAJLmdldF9zZWdtZW50X2Jhc2UgPSB2bXhfZ2V0X3Nl
Z21lbnRfYmFzZSwKIAkuZ2V0X3NlZ21lbnQgPSB2bXhfZ2V0X3NlZ21lbnQsCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxp
bmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlv
bg==
