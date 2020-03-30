Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 55806197891
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 12:13:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EBA5088466;
	Mon, 30 Mar 2020 10:13:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EcKpnX8rRlKB; Mon, 30 Mar 2020 10:13:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 74EF58844C;
	Mon, 30 Mar 2020 10:13:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4C898C1AE8;
	Mon, 30 Mar 2020 10:13:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9258EC1D85
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 86C57878D0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B7GMWpxABI5c
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 42C83878E5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:54 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 A9FE930747D4; Mon, 30 Mar 2020 13:12:51 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 8B087305B7A2;
 Mon, 30 Mar 2020 13:12:51 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v8 19/81] KVM: svm: pass struct kvm_vcpu to
 set_msr_interception()
Date: Mon, 30 Mar 2020 13:12:06 +0300
Message-Id: <20200330101308.21702-20-alazar@bitdefender.com>
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

RnJvbTogTmljdciZb3IgQ8OuyJt1IDxuY2l0dUBiaXRkZWZlbmRlci5jb20+CgpUaGlzIGlzIG5l
ZWRlZCBpbiBvcmRlciB0byBoYW5kbGUgY2xpZW50cyBjb250cm9sbGluZyB0aGUgTVNSIHJlbGF0
ZWQKVk0tZXhpdHMuCgpQYXNzaW5nIE5VTEwgZHVyaW5nIGluaXRpYWxpemF0aW9uIGlzIE9LCmJl
Y2F1c2UgYSB2Q1BVIGNhbiBiZSBpbnRyb3NwZWN0ZWQgb25seSBhZnRlciBpbml0aWFsaXphdGlv
bi4KClNpZ25lZC1vZmYtYnk6IE5pY3XImW9yIEPDrsibdSA8bmNpdHVAYml0ZGVmZW5kZXIuY29t
PgpTaWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+
Ci0tLQogYXJjaC94ODYva3ZtL3N2bS5jIHwgMjcgKysrKysrKysrKysrKystLS0tLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvYXJjaC94ODYva3ZtL3N2bS5jIGIvYXJjaC94ODYva3ZtL3N2bS5jCmluZGV4IDcw
YzhjOTEzZjE0ZS4uMzdjNzhiYjRiYTBiIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vc3ZtLmMK
KysrIGIvYXJjaC94ODYva3ZtL3N2bS5jCkBAIC0xMDgwLDcgKzEwODAsOCBAQCBzdGF0aWMgYm9v
bCBtc3Jfd3JpdGVfaW50ZXJjZXB0ZWQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBt
c3IpCiAJcmV0dXJuICEhdGVzdF9iaXQoYml0X3dyaXRlLCAgJnRtcCk7CiB9CiAKLXN0YXRpYyB2
b2lkIHNldF9tc3JfaW50ZXJjZXB0aW9uKHUzMiAqbXNycG0sIHVuc2lnbmVkIG1zciwKK3N0YXRp
YyB2b2lkIHNldF9tc3JfaW50ZXJjZXB0aW9uKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKKwkJCQkg
dTMyICptc3JwbSwgdW5zaWduZWQgbXNyLAogCQkJCSBpbnQgdHlwZSwgYm9vbCB2YWx1ZSkKIHsK
IAl1OCBiaXRfcmVhZCwgYml0X3dyaXRlOwpAQCAtMTExOSw3ICsxMTIwLDcgQEAgc3RhdGljIHZv
aWQgc3ZtX3ZjcHVfaW5pdF9tc3JwbSh1MzIgKm1zcnBtKQogCQlpZiAoIWRpcmVjdF9hY2Nlc3Nf
bXNyc1tpXS5hbHdheXMpCiAJCQljb250aW51ZTsKIAotCQlzZXRfbXNyX2ludGVyY2VwdGlvbiht
c3JwbSwgZGlyZWN0X2FjY2Vzc19tc3JzW2ldLmluZGV4LAorCQlzZXRfbXNyX2ludGVyY2VwdGlv
bihOVUxMLCBtc3JwbSwgZGlyZWN0X2FjY2Vzc19tc3JzW2ldLmluZGV4LAogCQkJCSAgICAgTVNS
X1RZUEVfUlcsIDEpOwogCX0KIH0KQEAgLTExNzIsMTMgKzExNzMsMTMgQEAgc3RhdGljIHZvaWQg
c3ZtX2VuYWJsZV9sYnJ2KHN0cnVjdCB2Y3B1X3N2bSAqc3ZtKQogCXUzMiAqbXNycG0gPSBzdm0t
Pm1zcnBtOwogCiAJc3ZtLT52bWNiLT5jb250cm9sLnZpcnRfZXh0IHw9IExCUl9DVExfRU5BQkxF
X01BU0s7Ci0Jc2V0X21zcl9pbnRlcmNlcHRpb24obXNycG0sIE1TUl9JQTMyX0xBU1RCUkFOQ0hG
Uk9NSVAsCisJc2V0X21zcl9pbnRlcmNlcHRpb24oJnN2bS0+dmNwdSwgbXNycG0sIE1TUl9JQTMy
X0xBU1RCUkFOQ0hGUk9NSVAsCiAJCQkgICAgIE1TUl9UWVBFX1JXLCAxKTsKLQlzZXRfbXNyX2lu
dGVyY2VwdGlvbihtc3JwbSwgTVNSX0lBMzJfTEFTVEJSQU5DSFRPSVAsCisJc2V0X21zcl9pbnRl
cmNlcHRpb24oJnN2bS0+dmNwdSwgbXNycG0sIE1TUl9JQTMyX0xBU1RCUkFOQ0hUT0lQLAogCQkJ
ICAgICBNU1JfVFlQRV9SVywgMSk7Ci0Jc2V0X21zcl9pbnRlcmNlcHRpb24obXNycG0sIE1TUl9J
QTMyX0xBU1RJTlRGUk9NSVAsCisJc2V0X21zcl9pbnRlcmNlcHRpb24oJnN2bS0+dmNwdSwgbXNy
cG0sIE1TUl9JQTMyX0xBU1RJTlRGUk9NSVAsCiAJCQkgICAgIE1TUl9UWVBFX1JXLCAxKTsKLQlz
ZXRfbXNyX2ludGVyY2VwdGlvbihtc3JwbSwgTVNSX0lBMzJfTEFTVElOVFRPSVAsCisJc2V0X21z
cl9pbnRlcmNlcHRpb24oJnN2bS0+dmNwdSwgbXNycG0sIE1TUl9JQTMyX0xBU1RJTlRUT0lQLAog
CQkJICAgICBNU1JfVFlQRV9SVywgMSk7CiB9CiAKQEAgLTExODcsMTMgKzExODgsMTMgQEAgc3Rh
dGljIHZvaWQgc3ZtX2Rpc2FibGVfbGJydihzdHJ1Y3QgdmNwdV9zdm0gKnN2bSkKIAl1MzIgKm1z
cnBtID0gc3ZtLT5tc3JwbTsKIAogCXN2bS0+dm1jYi0+Y29udHJvbC52aXJ0X2V4dCAmPSB+TEJS
X0NUTF9FTkFCTEVfTUFTSzsKLQlzZXRfbXNyX2ludGVyY2VwdGlvbihtc3JwbSwgTVNSX0lBMzJf
TEFTVEJSQU5DSEZST01JUCwKKwlzZXRfbXNyX2ludGVyY2VwdGlvbigmc3ZtLT52Y3B1LCBtc3Jw
bSwgTVNSX0lBMzJfTEFTVEJSQU5DSEZST01JUCwKIAkJCSAgICAgTVNSX1RZUEVfUlcsIDApOwot
CXNldF9tc3JfaW50ZXJjZXB0aW9uKG1zcnBtLCBNU1JfSUEzMl9MQVNUQlJBTkNIVE9JUCwKKwlz
ZXRfbXNyX2ludGVyY2VwdGlvbigmc3ZtLT52Y3B1LCBtc3JwbSwgTVNSX0lBMzJfTEFTVEJSQU5D
SFRPSVAsCiAJCQkgICAgIE1TUl9UWVBFX1JXLCAwKTsKLQlzZXRfbXNyX2ludGVyY2VwdGlvbiht
c3JwbSwgTVNSX0lBMzJfTEFTVElOVEZST01JUCwKKwlzZXRfbXNyX2ludGVyY2VwdGlvbigmc3Zt
LT52Y3B1LCBtc3JwbSwgTVNSX0lBMzJfTEFTVElOVEZST01JUCwKIAkJCSAgICAgTVNSX1RZUEVf
UlcsIDApOwotCXNldF9tc3JfaW50ZXJjZXB0aW9uKG1zcnBtLCBNU1JfSUEzMl9MQVNUSU5UVE9J
UCwKKwlzZXRfbXNyX2ludGVyY2VwdGlvbigmc3ZtLT52Y3B1LCBtc3JwbSwgTVNSX0lBMzJfTEFT
VElOVFRPSVAsCiAJCQkgICAgIE1TUl9UWVBFX1JXLCAwKTsKIH0KIApAQCAtNDM2Miw3ICs0MzYz
LDcgQEAgc3RhdGljIGludCBzdm1fc2V0X21zcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVj
dCBtc3JfZGF0YSAqbXNyKQogCQkgKiBXZSB1cGRhdGUgdGhlIEwxIE1TUiBiaXQgYXMgd2VsbCBz
aW5jZSBpdCB3aWxsIGVuZCB1cAogCQkgKiB0b3VjaGluZyB0aGUgTVNSIGFueXdheSBub3cuCiAJ
CSAqLwotCQlzZXRfbXNyX2ludGVyY2VwdGlvbihzdm0tPm1zcnBtLCBNU1JfSUEzMl9TUEVDX0NU
UkwsCisJCXNldF9tc3JfaW50ZXJjZXB0aW9uKHZjcHUsIHN2bS0+bXNycG0sIE1TUl9JQTMyX1NQ
RUNfQ1RSTCwKIAkJCQkgICAgIE1TUl9UWVBFX1JXLCAxKTsKIAkJYnJlYWs7CiAJY2FzZSBNU1Jf
SUEzMl9QUkVEX0NNRDoKQEAgLTQzNzgsOSArNDM3OSw5IEBAIHN0YXRpYyBpbnQgc3ZtX3NldF9t
c3Ioc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3QgbXNyX2RhdGEgKm1zcikKIAkJCWJyZWFr
OwogCiAJCXdybXNybChNU1JfSUEzMl9QUkVEX0NNRCwgUFJFRF9DTURfSUJQQik7Ci0JCXNldF9t
c3JfaW50ZXJjZXB0aW9uKHN2bS0+bXNycG0sIE1TUl9JQTMyX1BSRURfQ01ELAorCQlzZXRfbXNy
X2ludGVyY2VwdGlvbih2Y3B1LCBzdm0tPm1zcnBtLCBNU1JfSUEzMl9QUkVEX0NNRCwKIAkJCQkg
ICAgIE1TUl9UWVBFX1IsIDApOwotCQlzZXRfbXNyX2ludGVyY2VwdGlvbihzdm0tPm1zcnBtLCBN
U1JfSUEzMl9QUkVEX0NNRCwKKwkJc2V0X21zcl9pbnRlcmNlcHRpb24odmNwdSwgc3ZtLT5tc3Jw
bSwgTVNSX0lBMzJfUFJFRF9DTUQsCiAJCQkJICAgICBNU1JfVFlQRV9XLCAxKTsKIAkJYnJlYWs7
CiAJY2FzZSBNU1JfQU1ENjRfVklSVF9TUEVDX0NUUkw6Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0
dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4
Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
