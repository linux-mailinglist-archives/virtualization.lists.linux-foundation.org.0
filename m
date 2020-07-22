Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF55229CA5
	for <lists.virtualization@lfdr.de>; Wed, 22 Jul 2020 18:02:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 87594887BF;
	Wed, 22 Jul 2020 16:02:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HxCtMgYbRdhw; Wed, 22 Jul 2020 16:02:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 88643888A3;
	Wed, 22 Jul 2020 16:01:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 69CC2C0052;
	Wed, 22 Jul 2020 16:01:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 348ECC0050
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 00563227CE
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zOf-tYK-nHSW
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by silver.osuosl.org (Postfix) with ESMTPS id BAFBF2076F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:37 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 DDB0F305D6B2; Wed, 22 Jul 2020 19:01:32 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.6])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id C8AE4305FFB3;
 Wed, 22 Jul 2020 19:01:32 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v1 26/34] KVM: x86: add .set_ve_info()
Date: Wed, 22 Jul 2020 19:01:13 +0300
Message-Id: <20200722160121.9601-27-alazar@bitdefender.com>
In-Reply-To: <20200722160121.9601-1-alazar@bitdefender.com>
References: <20200722160121.9601-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?=C8=98tefan=20=C8=98icleru?= <ssicleru@bitdefender.com>,
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

RnJvbTogyJh0ZWZhbiDImGljbGVydSA8c3NpY2xlcnVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyBm
dW5jdGlvbiBpcyBuZWVkZWQgZm9yIHRoZSBLVk1JX1ZDUFVfU0VUX1ZFX0lORk8gY29tbWFuZC4K
ClNpZ25lZC1vZmYtYnk6IMiYdGVmYW4gyJhpY2xlcnUgPHNzaWNsZXJ1QGJpdGRlZmVuZGVyLmNv
bT4KU2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29t
PgotLS0KIGFyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggfCAgMiArKwogYXJjaC94ODYv
aW5jbHVkZS9hc20vdm14LmggICAgICB8ICAxICsKIGFyY2gveDg2L2t2bS92bXgvdm14LmMgICAg
ICAgICAgfCA0MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hh
bmdlZCwgNDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNt
L2t2bV9ob3N0LmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCmluZGV4IGU4OWNl
YTA0MWVjOS4uNGNlZTY0MWFmNDhlIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9r
dm1faG9zdC5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKQEAgLTEzMTQs
NiArMTMxNCw4IEBAIHN0cnVjdCBrdm1feDg2X29wcyB7CiAJdTE2ICgqZ2V0X2VwdF92aWV3KShz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogCWludCAoKnNldF9lcHRfdmlldykoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LCB1MTYgdmlldyk7CiAJaW50ICgqY29udHJvbF9lcHRfdmlldykoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LCB1MTYgdmlldywgdTggdmlzaWJsZSk7CisJaW50ICgqc2V0X3ZlX2luZm8p
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbG9uZyB2ZV9pbmZvLAorCQkJCWJvb2wg
dHJpZ2dlcl92bWV4aXQpOwogfTsKIAogc3RydWN0IGt2bV94ODZfbmVzdGVkX29wcyB7CmRpZmYg
LS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS92bXguaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNt
L3ZteC5oCmluZGV4IDgwODIxNThlM2U5Ni4uMjIyZmU5YzdmNDYzIDEwMDY0NAotLS0gYS9hcmNo
L3g4Ni9pbmNsdWRlL2FzbS92bXguaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS92bXguaApA
QCAtMTU3LDYgKzE1Nyw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IHZteF9taXNjX21zZWdfcmV2aWQo
dTY0IHZteF9taXNjKQogZW51bSB2bWNzX2ZpZWxkIHsKIAlWSVJUVUFMX1BST0NFU1NPUl9JRCAg
ICAgICAgICAgID0gMHgwMDAwMDAwMCwKIAlQT1NURURfSU5UUl9OViAgICAgICAgICAgICAgICAg
ID0gMHgwMDAwMDAwMiwKKwlFUFRQX0lOREVYCQkJPSAweDAwMDAwMDA0LAogCUdVRVNUX0VTX1NF
TEVDVE9SICAgICAgICAgICAgICAgPSAweDAwMDAwODAwLAogCUdVRVNUX0NTX1NFTEVDVE9SICAg
ICAgICAgICAgICAgPSAweDAwMDAwODAyLAogCUdVRVNUX1NTX1NFTEVDVE9SICAgICAgICAgICAg
ICAgPSAweDAwMDAwODA0LApkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3ZteC92bXguYyBiL2Fy
Y2gveDg2L2t2bS92bXgvdm14LmMKaW5kZXggYjY1YmQwZDE0NGU1Li44NzFjYzQ5MDYzZDggMTAw
NjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS92bXgvdm14LmMKKysrIGIvYXJjaC94ODYva3ZtL3ZteC92
bXguYwpAQCAtNDQyNSw2ICs0NDI1LDQ1IEBAIHN0YXRpYyBpbnQgdm14X2NvbnRyb2xfZXB0X3Zp
ZXcoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1MTYgdmlldywgdTggdmlzaWJsZSkKIAlyZXR1cm4g
MDsKIH0KIAorc3RhdGljIGludCB2bXhfc2V0X3ZlX2luZm8oc3RydWN0IGt2bV92Y3B1ICp2Y3B1
LCB1bnNpZ25lZCBsb25nIHZlX2luZm8sCisJCQkJYm9vbCB0cmlnZ2VyX3ZtZXhpdCkKK3sKKwlz
dHJ1Y3QgcGFnZSAqdmVfaW5mb19wZzsKKwlzdHJ1Y3QgdmNwdV92bXggKnZteCA9IHRvX3ZteCh2
Y3B1KTsKKwlpbnQgaWR4OworCXUzMiBlYjsKKworCWlmICgha3ZtX3ZlX3N1cHBvcnRlZCkKKwkJ
cmV0dXJuIC1LVk1fRU9QTk9UU1VQUDsKKworCWlkeCA9IHNyY3VfcmVhZF9sb2NrKCZ2Y3B1LT5r
dm0tPnNyY3UpOworCXZlX2luZm9fcGcgPSBrdm1fdmNwdV9ncGFfdG9fcGFnZSh2Y3B1LCB2ZV9p
bmZvKTsKKwlzcmN1X3JlYWRfdW5sb2NrKCZ2Y3B1LT5rdm0tPnNyY3UsIGlkeCk7CisKKwlpZiAo
aXNfZXJyb3JfcGFnZSh2ZV9pbmZvX3BnKSkKKwkJcmV0dXJuIC1LVk1fRUlOVkFMOworCisJdm1j
c193cml0ZTY0KFZFX0lORk9fQUREUkVTUywgcGFnZV90b19waHlzKHZlX2luZm9fcGcpKTsKKwor
CS8qIE1ha2Ugc3VyZSBFUFRQX0lOREVYIGlzIHVwLXRvLWRhdGUgYmVmb3JlIGVuYWJsaW5nICNW
RSAqLworCXZtY3Nfd3JpdGUxNihFUFRQX0lOREVYLCB2bXgtPnZpZXcpOworCisJLyogRW5hYmxl
ICNWRSBtZWNoYW5pc20gKi8KKwlzZWNvbmRhcnlfZXhlY19jb250cm9sc19zZXRiaXQodm14LCBT
RUNPTkRBUllfRVhFQ19FUFRfVkUpOworCisJLyogRGVjaWRlIGlmICNWRSBleGNlcHRpb24gc2hv
dWxkIHRyaWdnZXIgYSBWTSBleGl0ICovCisJZWIgPSB2bWNzX3JlYWQzMihFWENFUFRJT05fQklU
TUFQKTsKKworCWlmICh0cmlnZ2VyX3ZtZXhpdCkKKwkJZWIgfD0gKDF1IDw8IFZFX1ZFQ1RPUik7
CisJZWxzZQorCQllYiAmPSB+KDF1IDw8IFZFX1ZFQ1RPUik7CisKKwl2bWNzX3dyaXRlMzIoRVhD
RVBUSU9OX0JJVE1BUCwgZWIpOworCisJcmV0dXJuIDA7Cit9CisKICNkZWZpbmUgVk1YX1hTU19F
WElUX0JJVE1BUCAwCiAKIC8qCkBAIC04MzUwLDYgKzgzODksNyBAQCBzdGF0aWMgc3RydWN0IGt2
bV94ODZfb3BzIHZteF94ODZfb3BzIF9faW5pdGRhdGEgPSB7CiAJLmdldF9lcHRfdmlldyA9IHZt
eF9nZXRfZXB0X3ZpZXcsCiAJLnNldF9lcHRfdmlldyA9IHZteF9zZXRfZXB0X3ZpZXcsCiAJLmNv
bnRyb2xfZXB0X3ZpZXcgPSB2bXhfY29udHJvbF9lcHRfdmlldywKKwkuc2V0X3ZlX2luZm8gPSB2
bXhfc2V0X3ZlX2luZm8sCiB9OwogCiBzdGF0aWMgX19pbml0IGludCBoYXJkd2FyZV9zZXR1cCh2
b2lkKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0
dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRh
dGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGlu
Zm8vdmlydHVhbGl6YXRpb24=
