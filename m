Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D35D1228A7F
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 23:16:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8595186B31;
	Tue, 21 Jul 2020 21:16:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WTLmFaot65yq; Tue, 21 Jul 2020 21:16:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2F89086B57;
	Tue, 21 Jul 2020 21:16:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 11BEFC016F;
	Tue, 21 Jul 2020 21:16:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 70F41C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6D93E886C0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zDsq5001+dwQ
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D10F0886A7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:54 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 0C3FC305D761; Wed, 22 Jul 2020 00:09:21 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id E1E50304FA14;
 Wed, 22 Jul 2020 00:09:20 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v9 15/84] KVM: x86: add .desc_intercepted()
Date: Wed, 22 Jul 2020 00:08:13 +0300
Message-Id: <20200721210922.7646-16-alazar@bitdefender.com>
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
aW9uIHdpbGwgYmUgdXNlZCB0byB0ZXN0IGlmIHRoZSBkZXNjcmlwdG9yLXRhYmxlIHJlZ2lzdGVy
cwphY2Nlc3MgaXMgYWxyZWFkeSB0cmFja2VkIGJ5IGFub3RoZXIgdXNlci4KClNpZ25lZC1vZmYt
Ynk6IE5pY3XImW9yIEPDrsibdSA8bmNpdHVAYml0ZGVmZW5kZXIuY29tPgpTaWduZWQtb2ZmLWJ5
OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+Ci0tLQogYXJjaC94ODYv
aW5jbHVkZS9hc20va3ZtX2hvc3QuaCB8ICAxICsKIGFyY2gveDg2L2t2bS9zdm0vc3ZtLmMgICAg
ICAgICAgfCAxNSArKysrKysrKysrKysrKysKIGFyY2gveDg2L2t2bS9zdm0vc3ZtLmggICAgICAg
ICAgfCAgNyArKysrKysrCiBhcmNoL3g4Ni9rdm0vdm14L3ZteC5jICAgICAgICAgIHwgIDggKysr
KysrKysKIDQgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1f
aG9zdC5oCmluZGV4IDgzZGZhMDI0NzEzMC4uMmVkMWU1NjIxY2NmIDEwMDY0NAotLS0gYS9hcmNo
L3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2
bV9ob3N0LmgKQEAgLTExMjUsNiArMTEyNSw3IEBAIHN0cnVjdCBrdm1feDg2X29wcyB7CiAJdm9p
ZCAoKnNldF9nZHQpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGRlc2NfcHRyICpkdCk7
CiAJYm9vbCAoKmRlc2NfY3RybF9zdXBwb3J0ZWQpKHZvaWQpOwogCXZvaWQgKCpjb250cm9sX2Rl
c2NfaW50ZXJjZXB0KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGJvb2wgZW5hYmxlKTsKKwlib29s
ICgqZGVzY19pbnRlcmNlcHRlZCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIAl2b2lkICgqc3lu
Y19kaXJ0eV9kZWJ1Z19yZWdzKShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogCXZvaWQgKCpzZXRf
ZHI3KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGxvbmcgdmFsdWUpOwogCXZvaWQg
KCpjYWNoZV9yZWcpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgZW51bSBrdm1fcmVnIHJlZyk7CmRp
ZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vc3ZtL3N2bS5jIGIvYXJjaC94ODYva3ZtL3N2bS9zdm0u
YwppbmRleCBjNzBjMTQ0NjE0ODMuLmNjNTVjNTcxZmU4NiAxMDA2NDQKLS0tIGEvYXJjaC94ODYv
a3ZtL3N2bS9zdm0uYworKysgYi9hcmNoL3g4Ni9rdm0vc3ZtL3N2bS5jCkBAIC0xNTUzLDYgKzE1
NTMsMjAgQEAgc3RhdGljIHZvaWQgc3ZtX2NvbnRyb2xfZGVzY19pbnRlcmNlcHQoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LCBib29sIGVuYWJsZSkKIAl9CiB9CiAKK3N0YXRpYyBpbmxpbmUgYm9vbCBz
dm1fZGVzY19pbnRlcmNlcHRlZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCit7CisJc3RydWN0IHZj
cHVfc3ZtICpzdm0gPSB0b19zdm0odmNwdSk7CisKKwlyZXR1cm4gKGdldF9pbnRlcmNlcHQoc3Zt
LCBJTlRFUkNFUFRfU1RPUkVfSURUUikgfHwKKwkJZ2V0X2ludGVyY2VwdChzdm0sIElOVEVSQ0VQ
VF9TVE9SRV9HRFRSKSB8fAorCQlnZXRfaW50ZXJjZXB0KHN2bSwgSU5URVJDRVBUX1NUT1JFX0xE
VFIpIHx8CisJCWdldF9pbnRlcmNlcHQoc3ZtLCBJTlRFUkNFUFRfU1RPUkVfVFIpIHx8CisJCWdl
dF9pbnRlcmNlcHQoc3ZtLCBJTlRFUkNFUFRfTE9BRF9JRFRSKSB8fAorCQlnZXRfaW50ZXJjZXB0
KHN2bSwgSU5URVJDRVBUX0xPQURfR0RUUikgfHwKKwkJZ2V0X2ludGVyY2VwdChzdm0sIElOVEVS
Q0VQVF9MT0FEX0xEVFIpIHx8CisJCWdldF9pbnRlcmNlcHQoc3ZtLCBJTlRFUkNFUFRfTE9BRF9U
UikpOworfQorCiBzdGF0aWMgdm9pZCB1cGRhdGVfY3IwX2ludGVyY2VwdChzdHJ1Y3QgdmNwdV9z
dm0gKnN2bSkKIHsKIAl1bG9uZyBnY3IwID0gc3ZtLT52Y3B1LmFyY2guY3IwOwpAQCAtNDA4Miw2
ICs0MDk2LDcgQEAgc3RhdGljIHN0cnVjdCBrdm1feDg2X29wcyBzdm1feDg2X29wcyBfX2luaXRk
YXRhID0gewogCS5zZXRfZ2R0ID0gc3ZtX3NldF9nZHQsCiAJLmRlc2NfY3RybF9zdXBwb3J0ZWQg
PSBzdm1fZGVzY19jdHJsX3N1cHBvcnRlZCwKIAkuY29udHJvbF9kZXNjX2ludGVyY2VwdCA9IHN2
bV9jb250cm9sX2Rlc2NfaW50ZXJjZXB0LAorCS5kZXNjX2ludGVyY2VwdGVkID0gc3ZtX2Rlc2Nf
aW50ZXJjZXB0ZWQsCiAJLnNldF9kcjcgPSBzdm1fc2V0X2RyNywKIAkuc3luY19kaXJ0eV9kZWJ1
Z19yZWdzID0gc3ZtX3N5bmNfZGlydHlfZGVidWdfcmVncywKIAkuY2FjaGVfcmVnID0gc3ZtX2Nh
Y2hlX3JlZywKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9zdm0vc3ZtLmggYi9hcmNoL3g4Ni9r
dm0vc3ZtL3N2bS5oCmluZGV4IGQ1Yzk1NmUwN2MxMi4uZjg2ZmFiYWJlNDEzIDEwMDY0NAotLS0g
YS9hcmNoL3g4Ni9rdm0vc3ZtL3N2bS5oCisrKyBiL2FyY2gveDg2L2t2bS9zdm0vc3ZtLmgKQEAg
LTMxOCw2ICszMTgsMTMgQEAgc3RhdGljIGlubGluZSB2b2lkIGNscl9pbnRlcmNlcHQoc3RydWN0
IHZjcHVfc3ZtICpzdm0sIGludCBiaXQpCiAJcmVjYWxjX2ludGVyY2VwdHMoc3ZtKTsKIH0KIAor
c3RhdGljIGlubGluZSBib29sIGdldF9pbnRlcmNlcHQoc3RydWN0IHZjcHVfc3ZtICpzdm0sIGlu
dCBiaXQpCit7CisJc3RydWN0IHZtY2IgKnZtY2IgPSBnZXRfaG9zdF92bWNiKHN2bSk7CisKKwly
ZXR1cm4gKHZtY2ItPmNvbnRyb2wuaW50ZXJjZXB0ICYgKDFVTEwgPDwgYml0KSk7Cit9CisKIHN0
YXRpYyBpbmxpbmUgYm9vbCBpc19pbnRlcmNlcHQoc3RydWN0IHZjcHVfc3ZtICpzdm0sIGludCBi
aXQpCiB7CiAJcmV0dXJuIChzdm0tPnZtY2ItPmNvbnRyb2wuaW50ZXJjZXB0ICYgKDFVTEwgPDwg
Yml0KSkgIT0gMDsKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS92bXgvdm14LmMgYi9hcmNoL3g4
Ni9rdm0vdm14L3ZteC5jCmluZGV4IDE5OWZmZDMxODE0NS4uM2I1Nzc4MDAzYjU4IDEwMDY0NAot
LS0gYS9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jCisrKyBiL2FyY2gveDg2L2t2bS92bXgvdm14LmMK
QEAgLTMzODgsNiArMzM4OCwxMyBAQCBzdGF0aWMgdm9pZCB2bXhfc2V0X2dkdChzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUsIHN0cnVjdCBkZXNjX3B0ciAqZHQpCiAJdm1jc193cml0ZWwoR1VFU1RfR0RU
Ul9CQVNFLCBkdC0+YWRkcmVzcyk7CiB9CiAKK3N0YXRpYyBib29sIHZteF9kZXNjX2ludGVyY2Vw
dGVkKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKK3sKKwlzdHJ1Y3QgdmNwdV92bXggKnZteCA9IHRv
X3ZteCh2Y3B1KTsKKworCXJldHVybiAhIShzZWNvbmRhcnlfZXhlY19jb250cm9sc19nZXQodm14
KSAmIFNFQ09OREFSWV9FWEVDX0RFU0MpOworfQorCiBzdGF0aWMgYm9vbCBybW9kZV9zZWdtZW50
X3ZhbGlkKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgaW50IHNlZykKIHsKIAlzdHJ1Y3Qga3ZtX3Nl
Z21lbnQgdmFyOwpAQCAtNzkxNSw2ICs3OTIyLDcgQEAgc3RhdGljIHN0cnVjdCBrdm1feDg2X29w
cyB2bXhfeDg2X29wcyBfX2luaXRkYXRhID0gewogCS5zZXRfZ2R0ID0gdm14X3NldF9nZHQsCiAJ
LmRlc2NfY3RybF9zdXBwb3J0ZWQgPSB2bXhfZGVzY19jdHJsX3N1cHBvcnRlZCwKIAkuY29udHJv
bF9kZXNjX2ludGVyY2VwdCA9IHZteF9jb250cm9sX2Rlc2NfaW50ZXJjZXB0LAorCS5kZXNjX2lu
dGVyY2VwdGVkID0gdm14X2Rlc2NfaW50ZXJjZXB0ZWQsCiAJLnNldF9kcjcgPSB2bXhfc2V0X2Ry
NywKIAkuc3luY19kaXJ0eV9kZWJ1Z19yZWdzID0gdm14X3N5bmNfZGlydHlfZGVidWdfcmVncywK
IAkuY2FjaGVfcmVnID0gdm14X2NhY2hlX3JlZywKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxp
emF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
