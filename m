Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CDC1978E4
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 12:20:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C779A884F1;
	Mon, 30 Mar 2020 10:20:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DRS88jDT83WA; Mon, 30 Mar 2020 10:20:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 804D688517;
	Mon, 30 Mar 2020 10:20:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 651E0C1D7E;
	Mon, 30 Mar 2020 10:20:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12D17C1D8F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 02C792326C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:20:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4fxOVp4IYqqQ
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:19:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by silver.osuosl.org (Postfix) with ESMTPS id 80187231C8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:19:54 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 B7A81305D3CD; Mon, 30 Mar 2020 13:13:00 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 99F83305B7A2;
 Mon, 30 Mar 2020 13:13:00 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v8 71/81] KVM: introspection: restore the state of
 descriptor-table register interception on unhook
Date: Mon, 30 Mar 2020 13:12:58 +0300
Message-Id: <20200330101308.21702-72-alazar@bitdefender.com>
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

RnJvbTogTmljdciZb3IgQ8OuyJt1IDxuY2l0dUBiaXRkZWZlbmRlci5jb20+CgpUaGlzIGNvbW1p
dCBhbHNvIGVuc3VyZXMgdGhhdCB0aGUgaW50cm9zcGVjdGlvbiB0b29sIGFuZCB0aGUgdXNlcnNw
YWNlCmRvIG5vdCBkaXNhYmxlIGVhY2ggb3RoZXIgdGhlIGRlc2NyaXB0b3IgYWNjZXNzIFZNLWV4
aXQuCgpTaWduZWQtb2ZmLWJ5OiBOaWN1yJlvciBDw67Im3UgPG5jaXR1QGJpdGRlZmVuZGVyLmNv
bT4KU2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29t
PgotLS0KIGFyY2gveDg2L2luY2x1ZGUvYXNtL2t2bWlfaG9zdC5oIHwgIDQgKysrCiBhcmNoL3g4
Ni9rdm0va3ZtaS5jICAgICAgICAgICAgICB8IDQ1ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCiBhcmNoL3g4Ni9rdm0vc3ZtLmMgICAgICAgICAgICAgICB8ICAzICsrKwogYXJjaC94
ODYva3ZtL3ZteC92bXguYyAgICAgICAgICAgfCAgMyArKysKIDQgZmlsZXMgY2hhbmdlZCwgNTUg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bWlfaG9z
dC5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtaV9ob3N0LmgKaW5kZXggNzYzMzUwMTAzMWQy
Li4zYzRiYmE4OGI1MGQgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bWlfaG9z
dC5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bWlfaG9zdC5oCkBAIC0xNCw2ICsxNCw3
IEBAIHN0cnVjdCBrdm1pX2ludGVyY2VwdGlvbiB7CiAJYm9vbCByZXN0b3JlX2ludGVyY2VwdGlv
bjsKIAlzdHJ1Y3Qga3ZtaV9tb25pdG9yX2ludGVyY2VwdGlvbiBicmVha3BvaW50OwogCXN0cnVj
dCBrdm1pX21vbml0b3JfaW50ZXJjZXB0aW9uIGNyM3c7CisJc3RydWN0IGt2bWlfbW9uaXRvcl9p
bnRlcmNlcHRpb24gZGVzY3JpcHRvcjsKIH07CiAKIHN0cnVjdCBrdm1fdmNwdV9hcmNoX2ludHJv
c3BlY3Rpb24gewpAQCAtMzEsNiArMzIsNyBAQCBib29sIGt2bWlfY3JfZXZlbnQoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBpbnQgY3IsCiBib29sIGt2bWlfY3IzX2ludGVyY2VwdGVk
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7CiBib29sIGt2bWlfbW9uaXRvcl9jcjN3X2ludGVyY2Vw
dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGJvb2wgZW5hYmxlKTsKIHZvaWQga3ZtaV94c2V0YnZf
ZXZlbnQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKK2Jvb2wga3ZtaV9tb25pdG9yX2Rlc2NfaW50
ZXJjZXB0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgYm9vbCBlbmFibGUpOwogYm9vbCBrdm1pX2Rl
c2NyaXB0b3JfZXZlbnQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1OCBkZXNjcmlwdG9yLCBib29s
IHdyaXRlKTsKIAogI2Vsc2UgLyogQ09ORklHX0tWTV9JTlRST1NQRUNUSU9OICovCkBAIC00NCw2
ICs0Niw4IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBrdm1pX2NyM19pbnRlcmNlcHRlZChzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUpIHsgcmV0dXJuIGZhbHNlOyB9CiBzdGF0aWMgaW5saW5lIGJvb2wga3Zt
aV9tb25pdG9yX2NyM3dfaW50ZXJjZXB0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKIAkJCQkJCWJv
b2wgZW5hYmxlKSB7IHJldHVybiBmYWxzZTsgfQogc3RhdGljIGlubGluZSB2b2lkIGt2bWlfeHNl
dGJ2X2V2ZW50KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkgeyB9CitzdGF0aWMgaW5saW5lIGJvb2wg
a3ZtaV9tb25pdG9yX2Rlc2NfaW50ZXJjZXB0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKKwkJCQkJ
ICAgICAgIGJvb2wgZW5hYmxlKSB7IHJldHVybiBmYWxzZTsgfQogc3RhdGljIGlubGluZSBib29s
IGt2bWlfZGVzY3JpcHRvcl9ldmVudChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHU4IGRlc2NyaXB0
b3IsCiAJCQkJCSBib29sIHdyaXRlKSB7IHJldHVybiB0cnVlOyB9CiAKZGlmZiAtLWdpdCBhL2Fy
Y2gveDg2L2t2bS9rdm1pLmMgYi9hcmNoL3g4Ni9rdm0va3ZtaS5jCmluZGV4IDA5M2ZmMGRhODhm
Zi4uMTExNzhiZDc1Y2I0IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0va3ZtaS5jCisrKyBiL2Fy
Y2gveDg2L2t2bS9rdm1pLmMKQEAgLTM2MCwxMiArMzYwLDUyIEBAIHN0YXRpYyB2b2lkIGt2bWlf
YXJjaF9kaXNhYmxlX2NyM3dfaW50ZXJjZXB0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIAl2Y3B1
LT5hcmNoLmt2bWktPmNyM3cua3ZtX2ludGVyY2VwdGVkID0gZmFsc2U7CiB9CiAKKy8qCisgKiBS
ZXR1cm5zIHRydWUgaWYgb25lIHNpZGUgKGt2bSBvciBrdm1pKSB0cmllcyB0byBkaXNhYmxlIHRo
ZSBkZXNjcmlwdG9yCisgKiBpbnRlcmNlcHRpb24gd2hpbGUgdGhlIG90aGVyIHNpZGUgaXMgc3Rp
bGwgdHJhY2tpbmcgaXQuCisgKi8KK2Jvb2wga3ZtaV9tb25pdG9yX2Rlc2NfaW50ZXJjZXB0KHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwgYm9vbCBlbmFibGUpCit7CisJc3RydWN0IGt2bWlfaW50ZXJj
ZXB0aW9uICphcmNoX3ZjcHVpID0gUkVBRF9PTkNFKHZjcHUtPmFyY2gua3ZtaSk7CisKKwlyZXR1
cm4gKGFyY2hfdmNwdWkgJiYgYXJjaF92Y3B1aS0+ZGVzY3JpcHRvci5tb25pdG9yX2ZjdCh2Y3B1
LCBlbmFibGUpKTsKK30KK0VYUE9SVF9TWU1CT0woa3ZtaV9tb25pdG9yX2Rlc2NfaW50ZXJjZXB0
KTsKKworc3RhdGljIGJvb2wgbW9uaXRvcl9kZXNjX2ZjdF9rdm1pKHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSwgYm9vbCBlbmFibGUpCit7CisJdmNwdS0+YXJjaC5rdm1pLT5kZXNjcmlwdG9yLmt2bWlf
aW50ZXJjZXB0ZWQgPSBlbmFibGU7CisKKwlpZiAoZW5hYmxlKQorCQl2Y3B1LT5hcmNoLmt2bWkt
PmRlc2NyaXB0b3Iua3ZtX2ludGVyY2VwdGVkID0KKwkJCWt2bV94ODZfb3BzLT5kZXNjX2ludGVy
Y2VwdGVkKHZjcHUpOworCWVsc2UgaWYgKHZjcHUtPmFyY2gua3ZtaS0+ZGVzY3JpcHRvci5rdm1f
aW50ZXJjZXB0ZWQpCisJCXJldHVybiB0cnVlOworCisJcmV0dXJuIGZhbHNlOworfQorCitzdGF0
aWMgYm9vbCBtb25pdG9yX2Rlc2NfZmN0X2t2bShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGJvb2wg
ZW5hYmxlKQoreworCWlmICghdmNwdS0+YXJjaC5rdm1pLT5kZXNjcmlwdG9yLmt2bWlfaW50ZXJj
ZXB0ZWQpCisJCXJldHVybiBmYWxzZTsKKworCXZjcHUtPmFyY2gua3ZtaS0+ZGVzY3JpcHRvci5r
dm1faW50ZXJjZXB0ZWQgPSBlbmFibGU7CisKKwlpZiAoIWVuYWJsZSkKKwkJcmV0dXJuIHRydWU7
CisKKwlyZXR1cm4gZmFsc2U7Cit9CisKIHN0YXRpYyBpbnQga3ZtaV9jb250cm9sX2Rlc2NfaW50
ZXJjZXB0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgYm9vbCBlbmFibGUpCiB7CiAJaWYgKCFrdm1f
eDg2X29wcy0+ZGVzY19jdHJsX3N1cHBvcnRlZCgpKQogCQlyZXR1cm4gLUtWTV9FT1BOT1RTVVBQ
OwogCisJdmNwdS0+YXJjaC5rdm1pLT5kZXNjcmlwdG9yLm1vbml0b3JfZmN0ID0gbW9uaXRvcl9k
ZXNjX2ZjdF9rdm1pOwogCWt2bV94ODZfb3BzLT5jb250cm9sX2Rlc2NfaW50ZXJjZXB0KHZjcHUs
IGVuYWJsZSk7CisJdmNwdS0+YXJjaC5rdm1pLT5kZXNjcmlwdG9yLm1vbml0b3JfZmN0ID0gbW9u
aXRvcl9kZXNjX2ZjdF9rdm07CiAKIAlyZXR1cm4gMDsKIH0KQEAgLTM3Myw2ICs0MTMsOSBAQCBz
dGF0aWMgaW50IGt2bWlfY29udHJvbF9kZXNjX2ludGVyY2VwdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsIGJvb2wgZW5hYmxlKQogc3RhdGljIHZvaWQga3ZtaV9hcmNoX2Rpc2FibGVfZGVzY19pbnRl
cmNlcHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogewogCWt2bWlfY29udHJvbF9kZXNjX2ludGVy
Y2VwdCh2Y3B1LCBmYWxzZSk7CisKKwl2Y3B1LT5hcmNoLmt2bWktPmRlc2NyaXB0b3Iua3ZtaV9p
bnRlcmNlcHRlZCA9IGZhbHNlOworCXZjcHUtPmFyY2gua3ZtaS0+ZGVzY3JpcHRvci5rdm1faW50
ZXJjZXB0ZWQgPSBmYWxzZTsKIH0KIAogaW50IGt2bWlfYXJjaF9jbWRfY29udHJvbF9pbnRlcmNl
cHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LApAQCAtNDM4LDExICs0ODEsMTMgQEAgYm9vbCBrdm1p
X2FyY2hfdmNwdV9hbGxvYyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAKIAlhcmNoX3ZjcHVpLT5i
cmVha3BvaW50Lm1vbml0b3JfZmN0ID0gbW9uaXRvcl9icF9mY3Rfa3ZtOwogCWFyY2hfdmNwdWkt
PmNyM3cubW9uaXRvcl9mY3QgPSBtb25pdG9yX2NyM3dfZmN0X2t2bTsKKwlhcmNoX3ZjcHVpLT5k
ZXNjcmlwdG9yLm1vbml0b3JfZmN0ID0gbW9uaXRvcl9kZXNjX2ZjdF9rdm07CiAKIAkvKgogCSAq
IHBhaXJlZCB3aXRoOgogCSAqICAtIGt2bWlfbW9uaXRvcl9icF9pbnRlcmNlcHQoKQogCSAqICAt
IGt2bWlfbW9uaXRvcl9jcjN3X2ludGVyY2VwdCgpCisJICogIC0ga3ZtaV9tb25pdG9yX2Rlc2Nf
aW50ZXJjZXB0KCkKIAkgKi8KIAlzbXBfd21iKCk7CiAJV1JJVEVfT05DRSh2Y3B1LT5hcmNoLmt2
bWksIGFyY2hfdmNwdWkpOwpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3N2bS5jIGIvYXJjaC94
ODYva3ZtL3N2bS5jCmluZGV4IGIzNzdhY2MzNDEwYy4uMGZkYzQ1NTYwNTdlIDEwMDY0NAotLS0g
YS9hcmNoL3g4Ni9rdm0vc3ZtLmMKKysrIGIvYXJjaC94ODYva3ZtL3N2bS5jCkBAIC03NTQ3LDYg
Kzc1NDcsOSBAQCBzdGF0aWMgdm9pZCBzdm1fY29udHJvbF9kZXNjX2ludGVyY2VwdChzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUsIGJvb2wgZW5hYmxlKQogewogCXN0cnVjdCB2Y3B1X3N2bSAqc3ZtID0g
dG9fc3ZtKHZjcHUpOwogCisJaWYgKGt2bWlfbW9uaXRvcl9kZXNjX2ludGVyY2VwdCh2Y3B1LCBl
bmFibGUpKQorCQlyZXR1cm47CisKIAlpZiAoZW5hYmxlKSB7CiAJCXNldF9pbnRlcmNlcHQoc3Zt
LCBJTlRFUkNFUFRfU1RPUkVfSURUUik7CiAJCXNldF9pbnRlcmNlcHQoc3ZtLCBJTlRFUkNFUFRf
U1RPUkVfR0RUUik7CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jIGIvYXJjaC94
ODYva3ZtL3ZteC92bXguYwppbmRleCBjNTRjMDFlMDg4YjYuLjg3NDVkNjk2ZjU5MiAxMDA2NDQK
LS0tIGEvYXJjaC94ODYva3ZtL3ZteC92bXguYworKysgYi9hcmNoL3g4Ni9rdm0vdm14L3ZteC5j
CkBAIC0zMDQ0LDYgKzMwNDQsOSBAQCBzdGF0aWMgdm9pZCB2bXhfY29udHJvbF9kZXNjX2ludGVy
Y2VwdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGJvb2wgZW5hYmxlKQogewogCXN0cnVjdCB2Y3B1
X3ZteCAqdm14ID0gdG9fdm14KHZjcHUpOwogCisJaWYgKGt2bWlfbW9uaXRvcl9kZXNjX2ludGVy
Y2VwdCh2Y3B1LCBlbmFibGUpKQorCQlyZXR1cm47CisKIAlpZiAoZW5hYmxlKQogCQlzZWNvbmRh
cnlfZXhlY19jb250cm9sc19zZXRiaXQodm14LCBTRUNPTkRBUllfRVhFQ19ERVNDKTsKIAllbHNl
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxp
emF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9u
Lm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92
aXJ0dWFsaXphdGlvbg==
