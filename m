Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B831978DB
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 12:20:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4299688448;
	Mon, 30 Mar 2020 10:20:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dx-MQNmL6JFe; Mon, 30 Mar 2020 10:20:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BA3D6884E4;
	Mon, 30 Mar 2020 10:20:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 976FDC07FF;
	Mon, 30 Mar 2020 10:20:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 15863C1D7E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 03FD386A4A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:19:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oed7I82fu3mp
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:19:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 806BE86A1D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:19:52 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 26751305D3CF; Mon, 30 Mar 2020 13:13:01 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id DE1DA305B7A4;
 Mon, 30 Mar 2020 13:13:00 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v8 73/81] KVM: introspection: restore the state of MSR
 interception on unhook
Date: Mon, 30 Mar 2020 13:13:00 +0300
Message-Id: <20200330101308.21702-74-alazar@bitdefender.com>
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
YWNlCmRvIG5vdCBkaXNhYmxlIGVhY2ggb3RoZXIgdGhlIE1TUiBhY2Nlc3MgVk0tZXhpdC4KClNp
Z25lZC1vZmYtYnk6IE5pY3XImW9yIEPDrsibdSA8bmNpdHVAYml0ZGVmZW5kZXIuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+Ci0tLQog
YXJjaC94ODYvaW5jbHVkZS9hc20va3ZtaV9ob3N0LmggfCAgMTIgKysrCiBhcmNoL3g4Ni9rdm0v
a3ZtaS5jICAgICAgICAgICAgICB8IDEzMyArKysrKysrKysrKysrKysrKysrKysrKysrKystLS0t
CiBhcmNoL3g4Ni9rdm0vc3ZtLmMgICAgICAgICAgICAgICB8ICAxMSArKysKIGFyY2gveDg2L2t2
bS92bXgvdm14LmMgICAgICAgICAgIHwgIDExICsrKwogNCBmaWxlcyBjaGFuZ2VkLCAxNTAgaW5z
ZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVk
ZS9hc20va3ZtaV9ob3N0LmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1pX2hvc3QuaAppbmRl
eCBhOTMyNmM4ZTgyNTIuLmU2YmIyZDZmMTlkMCAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVk
ZS9hc20va3ZtaV9ob3N0LmgKKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtaV9ob3N0LmgK
QEAgLTIzLDYgKzIzLDEyIEBAIHN0cnVjdCBrdm1pX2ludGVyY2VwdGlvbiB7CiAJCQlERUNMQVJF
X0JJVE1BUChsb3csIEtWTUlfTlVNX01TUik7CiAJCQlERUNMQVJFX0JJVE1BUChoaWdoLCBLVk1J
X05VTV9NU1IpOwogCQl9IGt2bWlfbWFzazsKKwkJc3RydWN0IHsKKwkJCURFQ0xBUkVfQklUTUFQ
KGxvdywgS1ZNSV9OVU1fTVNSKTsKKwkJCURFQ0xBUkVfQklUTUFQKGhpZ2gsIEtWTUlfTlVNX01T
Uik7CisJCX0ga3ZtX21hc2s7CisJCWJvb2wgKCptb25pdG9yX2ZjdCkoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LCB1MzIgbXNyLAorCQkJCSAgICBib29sIGVuYWJsZSk7CiAJfSBtc3J3OwogfTsKIApA
QCAtNDQsNiArNTAsOCBAQCB2b2lkIGt2bWlfeHNldGJ2X2V2ZW50KHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSk7CiBib29sIGt2bWlfbW9uaXRvcl9kZXNjX2ludGVyY2VwdChzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUsIGJvb2wgZW5hYmxlKTsKIGJvb2wga3ZtaV9kZXNjcmlwdG9yX2V2ZW50KHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSwgdTggZGVzY3JpcHRvciwgYm9vbCB3cml0ZSk7CiBib29sIGt2bWlfbXNy
X2V2ZW50KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IG1zcl9kYXRhICptc3IpOworYm9v
bCBrdm1pX21vbml0b3JfbXNyd19pbnRlcmNlcHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1MzIg
bXNyLCBib29sIGVuYWJsZSk7Citib29sIGt2bWlfbXNyd19pbnRlcmNlcHRfb3JpZ2luYXRvcihz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogCiAjZWxzZSAvKiBDT05GSUdfS1ZNX0lOVFJPU1BFQ1RJ
T04gKi8KIApAQCAtNjIsNiArNzAsMTAgQEAgc3RhdGljIGlubGluZSBib29sIGt2bWlfZGVzY3Jp
cHRvcl9ldmVudChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHU4IGRlc2NyaXB0b3IsCiAJCQkJCSBi
b29sIHdyaXRlKSB7IHJldHVybiB0cnVlOyB9CiBzdGF0aWMgaW5saW5lIGJvb2wga3ZtaV9tc3Jf
ZXZlbnQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3QgbXNyX2RhdGEgKm1zcikKIAkJCQl7
IHJldHVybiB0cnVlOyB9CitzdGF0aWMgaW5saW5lIGJvb2wga3ZtaV9tb25pdG9yX21zcndfaW50
ZXJjZXB0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdTMyIG1zciwKKwkJCQkJICAgICAgIGJvb2wg
ZW5hYmxlKSB7IHJldHVybiBmYWxzZTsgfQorc3RhdGljIGlubGluZSBib29sIGt2bWlfbXNyd19p
bnRlcmNlcHRfb3JpZ2luYXRvcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCisJCQkJeyByZXR1cm4g
ZmFsc2U7IH0KIAogI2VuZGlmIC8qIENPTkZJR19LVk1fSU5UUk9TUEVDVElPTiAqLwogCmRpZmYg
LS1naXQgYS9hcmNoL3g4Ni9rdm0va3ZtaS5jIGIvYXJjaC94ODYva3ZtL2t2bWkuYwppbmRleCBi
NTdiNDMyMGExOWYuLmNjYjExZTU1M2JkZSAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL2t2bWku
YworKysgYi9hcmNoL3g4Ni9rdm0va3ZtaS5jCkBAIC00MjMsMjIgKzQyMywyNSBAQCBzdGF0aWMg
Ym9vbCBrdm1pX21zcl92YWxpZCh1bnNpZ25lZCBpbnQgbXNyKQogCXJldHVybiBtc3IgPD0gMHgx
ZmZmIHx8IChtc3IgPj0gMHhjMDAwMDAwMCAmJiBtc3IgPD0gMHhjMDAwMWZmZik7CiB9CiAKLXN0
YXRpYyB1bnNpZ25lZCBsb25nICptc3JfbWFzayhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2ln
bmVkIGludCAqbXNyKQorc3RhdGljIHVuc2lnbmVkIGxvbmcgKm1zcl9tYXNrKHN0cnVjdCBrdm1f
dmNwdSAqdmNwdSwgdW5zaWduZWQgaW50ICptc3IsCisJCQkgICAgICAgYm9vbCBrdm1pKQogewog
CXN3aXRjaCAoKm1zcikgewogCWNhc2UgMCAuLi4gMHgxZmZmOgotCQlyZXR1cm4gdmNwdS0+YXJj
aC5rdm1pLT5tc3J3Lmt2bWlfbWFzay5sb3c7CisJCXJldHVybiBrdm1pID8gdmNwdS0+YXJjaC5r
dm1pLT5tc3J3Lmt2bWlfbWFzay5sb3cgOgorCQkJICAgICAgdmNwdS0+YXJjaC5rdm1pLT5tc3J3
Lmt2bV9tYXNrLmxvdzsKIAljYXNlIDB4YzAwMDAwMDAgLi4uIDB4YzAwMDFmZmY6CiAJCSptc3Ig
Jj0gMHgxZmZmOwotCQlyZXR1cm4gdmNwdS0+YXJjaC5rdm1pLT5tc3J3Lmt2bWlfbWFzay5oaWdo
OworCQlyZXR1cm4ga3ZtaSA/IHZjcHUtPmFyY2gua3ZtaS0+bXNydy5rdm1pX21hc2suaGlnaCA6
CisJCQkgICAgICB2Y3B1LT5hcmNoLmt2bWktPm1zcncua3ZtX21hc2suaGlnaDsKIAl9CiAKIAly
ZXR1cm4gTlVMTDsKIH0KIAotc3RhdGljIGJvb2wgdGVzdF9tc3JfbWFzayhzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHUsIHVuc2lnbmVkIGludCBtc3IpCitzdGF0aWMgYm9vbCB0ZXN0X21zcl9tYXNrKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgaW50IG1zciwgYm9vbCBrdm1pKQogewotCXVu
c2lnbmVkIGxvbmcgKm1hc2sgPSBtc3JfbWFzayh2Y3B1LCAmbXNyKTsKKwl1bnNpZ25lZCBsb25n
ICptYXNrID0gbXNyX21hc2sodmNwdSwgJm1zciwga3ZtaSk7CiAKIAlpZiAoIW1hc2spCiAJCXJl
dHVybiBmYWxzZTsKQEAgLTQ0Niw5ICs0NDksMjcgQEAgc3RhdGljIGJvb2wgdGVzdF9tc3JfbWFz
ayhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGludCBtc3IpCiAJcmV0dXJuICEhdGVz
dF9iaXQobXNyLCBtYXNrKTsKIH0KIAotc3RhdGljIGJvb2wgbXNyX2NvbnRyb2woc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBpbnQgbXNyLCBib29sIGVuYWJsZSkKKy8qCisgKiBSZXR1
cm5zIHRydWUgaWYgb25lIHNpZGUgKGt2bSBvciBrdm1pKSB0cmllcyB0byBkaXNhYmxlIHRoZSBN
U1Igd3JpdGUKKyAqIGludGVyY2VwdGlvbiB3aGlsZSB0aGUgb3RoZXIgc2lkZSBpcyBzdGlsbCB0
cmFja2luZyBpdC4KKyAqLworYm9vbCBrdm1pX21vbml0b3JfbXNyd19pbnRlcmNlcHQoc3RydWN0
IGt2bV92Y3B1ICp2Y3B1LCB1MzIgbXNyLCBib29sIGVuYWJsZSkKIHsKLQl1bnNpZ25lZCBsb25n
ICptYXNrID0gbXNyX21hc2sodmNwdSwgJm1zcik7CisJc3RydWN0IGt2bWlfaW50ZXJjZXB0aW9u
ICphcmNoX3ZjcHVpOworCisJaWYgKCF2Y3B1KQorCQlyZXR1cm4gZmFsc2U7CisKKwlhcmNoX3Zj
cHVpID0gUkVBRF9PTkNFKHZjcHUtPmFyY2gua3ZtaSk7CisKKwlyZXR1cm4gKGFyY2hfdmNwdWkg
JiYgYXJjaF92Y3B1aS0+bXNydy5tb25pdG9yX2ZjdCh2Y3B1LCBtc3IsIGVuYWJsZSkpOworfQor
RVhQT1JUX1NZTUJPTChrdm1pX21vbml0b3JfbXNyd19pbnRlcmNlcHQpOworCitzdGF0aWMgYm9v
bCBtc3JfY29udHJvbChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGludCBtc3IsIGJv
b2wgZW5hYmxlLAorCQkgICAgICAgYm9vbCBrdm1pKQoreworCXVuc2lnbmVkIGxvbmcgKm1hc2sg
PSBtc3JfbWFzayh2Y3B1LCAmbXNyLCBrdm1pKTsKIAogCWlmICghbWFzaykKIAkJcmV0dXJuIGZh
bHNlOwpAQCAtNDYxLDYgKzQ4Miw2MyBAQCBzdGF0aWMgYm9vbCBtc3JfY29udHJvbChzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGludCBtc3IsIGJvb2wgZW5hYmxlKQogCXJldHVybiB0
cnVlOwogfQogCitzdGF0aWMgYm9vbCBtc3JfaW50ZXJjZXB0ZWRfYnlfa3ZtaShzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUsIHUzMiBtc3IpCit7CisJcmV0dXJuIHRlc3RfbXNyX21hc2sodmNwdSwgbXNy
LCB0cnVlKTsKK30KKworc3RhdGljIGJvb2wgbXNyX2ludGVyY2VwdGVkX2J5X2t2bShzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUsIHUzMiBtc3IpCit7CisJcmV0dXJuIHRlc3RfbXNyX21hc2sodmNwdSwg
bXNyLCBmYWxzZSk7Cit9CisKK3N0YXRpYyB2b2lkIHJlY29yZF9tc3JfaW50ZXJjZXB0X3N0YXR1
c19mb3Jfa3ZtaShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHUzMiBtc3IsCisJCQkJCQkgYm9vbCBl
bmFibGUpCit7CisJbXNyX2NvbnRyb2wodmNwdSwgbXNyLCBlbmFibGUsIHRydWUpOworfQorCitz
dGF0aWMgdm9pZCByZWNvcmRfbXNyX2ludGVyY2VwdF9zdGF0dXNfZm9yX2t2bShzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUsIHUzMiBtc3IsCisJCQkJCQlib29sIGVuYWJsZSkKK3sKKwltc3JfY29udHJv
bCh2Y3B1LCBtc3IsIGVuYWJsZSwgZmFsc2UpOworfQorCitzdGF0aWMgYm9vbCBtb25pdG9yX21z
cndfZmN0X2t2bWkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1MzIgbXNyLCBib29sIGVuYWJsZSkK
K3sKKwlib29sIHJldCA9IGZhbHNlOworCisJaWYgKGVuYWJsZSkgeworCQlpZiAoa3ZtX3g4Nl9v
cHMtPm1zcl93cml0ZV9pbnRlcmNlcHRlZCh2Y3B1LCBtc3IpKQorCQkJcmVjb3JkX21zcl9pbnRl
cmNlcHRfc3RhdHVzX2Zvcl9rdm0odmNwdSwgbXNyLCB0cnVlKTsKKwl9IGVsc2UgeworCQlpZiAo
dW5saWtlbHkoIW1zcl9pbnRlcmNlcHRlZF9ieV9rdm1pKHZjcHUsIG1zcikpKQorCQkJcmV0ID0g
dHJ1ZTsKKworCQlpZiAobXNyX2ludGVyY2VwdGVkX2J5X2t2bSh2Y3B1LCBtc3IpKQorCQkJcmV0
ID0gdHJ1ZTsKKwl9CisKKwlyZWNvcmRfbXNyX2ludGVyY2VwdF9zdGF0dXNfZm9yX2t2bWkodmNw
dSwgbXNyLCBlbmFibGUpOworCisJcmV0dXJuIHJldDsKK30KKworc3RhdGljIGJvb2wgbW9uaXRv
cl9tc3J3X2ZjdF9rdm0oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1MzIgbXNyLCBib29sIGVuYWJs
ZSkKK3sKKwlib29sIHJldCA9IGZhbHNlOworCisJaWYgKCEobXNyX2ludGVyY2VwdGVkX2J5X2t2
bWkodmNwdSwgbXNyKSkpCisJCXJldHVybiBmYWxzZTsKKworCWlmICghZW5hYmxlKQorCQlyZXQg
PSB0cnVlOworCisJcmVjb3JkX21zcl9pbnRlcmNlcHRfc3RhdHVzX2Zvcl9rdm0odmNwdSwgbXNy
LCBlbmFibGUpOworCisJcmV0dXJuIHJldDsKK30KKwogc3RhdGljIHVuc2lnbmVkIGludCBtc3Jf
bWFza190b19iYXNlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbG9uZyAqbWFzaykK
IHsKIAlpZiAobWFzayA9PSB2Y3B1LT5hcmNoLmt2bWktPm1zcncua3ZtaV9tYXNrLmhpZ2gpCkBA
IC00NjksOCArNTQ3LDE2IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgbXNyX21hc2tfdG9fYmFzZShz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGxvbmcgKm1hc2spCiAJcmV0dXJuIDA7CiB9
CiAKLXN0YXRpYyB2b2lkIGt2bWlfYXJjaF9kaXNhYmxlX21zcl9pbnRlcmNlcHQoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LAotCQkJCQkgICAgdW5zaWduZWQgbG9uZyAqbWFzaykKK3N0YXRpYyB2b2lk
IGt2bWlfY29udHJvbF9tc3J3X2ludGVyY2VwdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHUzMiBt
c3IsCisJCQkJCWJvb2wgZW5hYmxlKQoreworCXZjcHUtPmFyY2gua3ZtaS0+bXNydy5tb25pdG9y
X2ZjdCA9IG1vbml0b3JfbXNyd19mY3Rfa3ZtaTsKKwlrdm1feDg2X29wcy0+Y29udHJvbF9tc3Jf
aW50ZXJjZXB0KHZjcHUsIG1zciwgTVNSX1RZUEVfVywgZW5hYmxlKTsKKwl2Y3B1LT5hcmNoLmt2
bWktPm1zcncubW9uaXRvcl9mY3QgPSBtb25pdG9yX21zcndfZmN0X2t2bTsKK30KKworc3RhdGlj
IHZvaWQga3ZtaV9hcmNoX2Rpc2FibGVfbXNyd19pbnRlcmNlcHQoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1LAorCQkJCQkgICAgIHVuc2lnbmVkIGxvbmcgKm1hc2spCiB7CiAJdW5zaWduZWQgaW50IG1z
cl9iYXNlID0gbXNyX21hc2tfdG9fYmFzZSh2Y3B1LCBtYXNrKTsKIAlpbnQgb2Zmc2V0ID0gLTE7
CkBAIC00ODEsOCArNTY3LDcgQEAgc3RhdGljIHZvaWQga3ZtaV9hcmNoX2Rpc2FibGVfbXNyX2lu
dGVyY2VwdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJCWlmIChvZmZzZXQgPj0gS1ZNSV9OVU1f
TVNSKQogCQkJYnJlYWs7CiAKLQkJa3ZtX3g4Nl9vcHMtPmNvbnRyb2xfbXNyX2ludGVyY2VwdCh2
Y3B1LCBtc3JfYmFzZSArIG9mZnNldCwKLQkJCQkJCSAgIE1TUl9UWVBFX1csIGZhbHNlKTsKKwkJ
a3ZtaV9jb250cm9sX21zcndfaW50ZXJjZXB0KHZjcHUsIG1zcl9iYXNlICsgb2Zmc2V0LCBmYWxz
ZSk7CiAJfQogCiAJYml0bWFwX3plcm8obWFzaywgS1ZNSV9OVU1fTVNSKTsKQEAgLTUzNyw4ICs2
MjIsOCBAQCBib29sIGt2bWlfYXJjaF9yZXN0b3JlX2ludGVyY2VwdGlvbihzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHUpCiAJa3ZtaV9hcmNoX2Rpc2FibGVfYnBfaW50ZXJjZXB0KHZjcHUpOwogCWt2bWlf
YXJjaF9kaXNhYmxlX2NyM3dfaW50ZXJjZXB0KHZjcHUpOwogCWt2bWlfYXJjaF9kaXNhYmxlX2Rl
c2NfaW50ZXJjZXB0KHZjcHUpOwotCWt2bWlfYXJjaF9kaXNhYmxlX21zcl9pbnRlcmNlcHQodmNw
dSwgYXJjaF92Y3B1aS0+bXNydy5rdm1pX21hc2subG93KTsKLQlrdm1pX2FyY2hfZGlzYWJsZV9t
c3JfaW50ZXJjZXB0KHZjcHUsIGFyY2hfdmNwdWktPm1zcncua3ZtaV9tYXNrLmhpZ2gpOworCWt2
bWlfYXJjaF9kaXNhYmxlX21zcndfaW50ZXJjZXB0KHZjcHUsIGFyY2hfdmNwdWktPm1zcncua3Zt
aV9tYXNrLmxvdyk7CisJa3ZtaV9hcmNoX2Rpc2FibGVfbXNyd19pbnRlcmNlcHQodmNwdSwgYXJj
aF92Y3B1aS0+bXNydy5rdm1pX21hc2suaGlnaCk7CiAKIAlyZXR1cm4gdHJ1ZTsKIH0KQEAgLTU1
NCwxMiArNjM5LDE0IEBAIGJvb2wga3ZtaV9hcmNoX3ZjcHVfYWxsb2Moc3RydWN0IGt2bV92Y3B1
ICp2Y3B1KQogCWFyY2hfdmNwdWktPmJyZWFrcG9pbnQubW9uaXRvcl9mY3QgPSBtb25pdG9yX2Jw
X2ZjdF9rdm07CiAJYXJjaF92Y3B1aS0+Y3Izdy5tb25pdG9yX2ZjdCA9IG1vbml0b3JfY3Izd19m
Y3Rfa3ZtOwogCWFyY2hfdmNwdWktPmRlc2NyaXB0b3IubW9uaXRvcl9mY3QgPSBtb25pdG9yX2Rl
c2NfZmN0X2t2bTsKKwlhcmNoX3ZjcHVpLT5tc3J3Lm1vbml0b3JfZmN0ID0gbW9uaXRvcl9tc3J3
X2ZjdF9rdm07CiAKIAkvKgogCSAqIHBhaXJlZCB3aXRoOgogCSAqICAtIGt2bWlfbW9uaXRvcl9i
cF9pbnRlcmNlcHQoKQogCSAqICAtIGt2bWlfbW9uaXRvcl9jcjN3X2ludGVyY2VwdCgpCiAJICog
IC0ga3ZtaV9tb25pdG9yX2Rlc2NfaW50ZXJjZXB0KCkKKwkgKiAgLSBrdm1pX21vbml0b3JfbXNy
d19pbnRlcmNlcHQoKQogCSAqLwogCXNtcF93bWIoKTsKIAlXUklURV9PTkNFKHZjcHUtPmFyY2gu
a3ZtaSwgYXJjaF92Y3B1aSk7CkBAIC05MjIsNiArMTAwOSwyMCBAQCBib29sIGt2bWlfZGVzY3Jp
cHRvcl9ldmVudChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHU4IGRlc2NyaXB0b3IsIGJvb2wgd3Jp
dGUpCiB9CiBFWFBPUlRfU1lNQk9MKGt2bWlfZGVzY3JpcHRvcl9ldmVudCk7CiAKK2Jvb2wga3Zt
aV9tc3J3X2ludGVyY2VwdF9vcmlnaW5hdG9yKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKK3sKKwlz
dHJ1Y3Qga3ZtaV9pbnRlcmNlcHRpb24gKmFyY2hfdmNwdWk7CisKKwlpZiAoIXZjcHUpCisJCXJl
dHVybiBmYWxzZTsKKworCWFyY2hfdmNwdWkgPSBSRUFEX09OQ0UodmNwdS0+YXJjaC5rdm1pKTsK
KworCXJldHVybiAoYXJjaF92Y3B1aSAmJgorCQlhcmNoX3ZjcHVpLT5tc3J3Lm1vbml0b3JfZmN0
ID09IG1vbml0b3JfbXNyd19mY3Rfa3ZtaSk7Cit9CitFWFBPUlRfU1lNQk9MKGt2bWlfbXNyd19p
bnRlcmNlcHRfb3JpZ2luYXRvcik7CisKIGludCBrdm1pX2FyY2hfY21kX3ZjcHVfY29udHJvbF9t
c3Ioc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCQkJCSAgIGNvbnN0IHN0cnVjdCBrdm1pX3ZjcHVf
Y29udHJvbF9tc3IgKnJlcSkKIHsKQEAgLTkzMSw5ICsxMDMyLDcgQEAgaW50IGt2bWlfYXJjaF9j
bWRfdmNwdV9jb250cm9sX21zcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJaWYgKCFrdm1pX21z
cl92YWxpZChyZXEtPm1zcikpCiAJCXJldHVybiAtS1ZNX0VJTlZBTDsKIAotCWt2bV94ODZfb3Bz
LT5jb250cm9sX21zcl9pbnRlcmNlcHQodmNwdSwgcmVxLT5tc3IsIE1TUl9UWVBFX1csCi0JCQkJ
CSAgIHJlcS0+ZW5hYmxlKTsKLQltc3JfY29udHJvbCh2Y3B1LCByZXEtPm1zciwgcmVxLT5lbmFi
bGUpOworCWt2bWlfY29udHJvbF9tc3J3X2ludGVyY2VwdCh2Y3B1LCByZXEtPm1zciwgcmVxLT5l
bmFibGUpOwogCiAJcmV0dXJuIDA7CiB9CkBAIC05NjksNyArMTA2OCw3IEBAIHN0YXRpYyBib29s
IF9fa3ZtaV9tc3JfZXZlbnQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3QgbXNyX2RhdGEg
Km1zcikKIAl1NjQgcmV0X3ZhbHVlID0gbXNyLT5kYXRhOwogCXUzMiBhY3Rpb247CiAKLQlpZiAo
IXRlc3RfbXNyX21hc2sodmNwdSwgbXNyLT5pbmRleCkpCisJaWYgKCF0ZXN0X21zcl9tYXNrKHZj
cHUsIG1zci0+aW5kZXgsIHRydWUpKQogCQlyZXR1cm4gdHJ1ZTsKIAlpZiAoa3ZtX3g4Nl9vcHMt
PmdldF9tc3IodmNwdSwgJm9sZF9tc3IpKQogCQlyZXR1cm4gdHJ1ZTsKZGlmZiAtLWdpdCBhL2Fy
Y2gveDg2L2t2bS9zdm0uYyBiL2FyY2gveDg2L2t2bS9zdm0uYwppbmRleCAwZmRjNDU1NjA1N2Uu
LjBkZjI2NTU2ZjMxNyAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL3N2bS5jCisrKyBiL2FyY2gv
eDg2L2t2bS9zdm0uYwpAQCAtMTA4OCw2ICsxMDg4LDE3IEBAIHN0YXRpYyB2b2lkIHNldF9tc3Jf
aW50ZXJjZXB0aW9uKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKIAl1bnNpZ25lZCBsb25nIHRtcDsK
IAl1MzIgb2Zmc2V0OwogCisjaWZkZWYgQ09ORklHX0tWTV9JTlRST1NQRUNUSU9OCisJaWYgKCh0
eXBlICYgTVNSX1RZUEVfVykgJiYKKwkgICAga3ZtaV9tb25pdG9yX21zcndfaW50ZXJjZXB0KHZj
cHUsIG1zciwgIXZhbHVlKSkKKwkJdHlwZSAmPSB+TVNSX1RZUEVfVzsKKworCS8qCisJICogQXZv
aWQgdGhlIGJlbG93IHdhcm5pbmcgZm9yIGt2bWkgaW50ZXJjZXB0ZWQgbXNycy4KKwkgKi8KKwlp
ZiAoIWt2bWlfbXNyd19pbnRlcmNlcHRfb3JpZ2luYXRvcih2Y3B1KSkKKyNlbmRpZiAvKiBDT05G
SUdfS1ZNX0lOVFJPU1BFQ1RJT04gKi8KKwogCS8qCiAJICogSWYgdGhpcyB3YXJuaW5nIHRyaWdn
ZXJzIGV4dGVuZCB0aGUgZGlyZWN0X2FjY2Vzc19tc3JzIGxpc3QgYXQgdGhlCiAJICogYmVnaW5u
aW5nIG9mIHRoZSBmaWxlCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jIGIvYXJj
aC94ODYva3ZtL3ZteC92bXguYwppbmRleCA4NzQ1ZDY5NmY1OTIuLmZkNzQ4YzE2NWU3OCAxMDA2
NDQKLS0tIGEvYXJjaC94ODYva3ZtL3ZteC92bXguYworKysgYi9hcmNoL3g4Ni9rdm0vdm14L3Zt
eC5jCkBAIC0zNjYyLDYgKzM2NjIsMTIgQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkIHZt
eF9kaXNhYmxlX2ludGVyY2VwdF9mb3JfbXNyKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKIAlpZiAo
IWNwdV9oYXNfdm14X21zcl9iaXRtYXAoKSkKIAkJcmV0dXJuOwogCisjaWZkZWYgQ09ORklHX0tW
TV9JTlRST1NQRUNUSU9OCisJaWYgKCh0eXBlICYgTVNSX1RZUEVfVykgJiYKKwkgICAga3ZtaV9t
b25pdG9yX21zcndfaW50ZXJjZXB0KHZjcHUsIG1zciwgZmFsc2UpKQorCQl0eXBlICY9IH5NU1Jf
VFlQRV9XOworI2VuZGlmIC8qIENPTkZJR19LVk1fSU5UUk9TUEVDVElPTiAqLworCiAJaWYgKHN0
YXRpY19icmFuY2hfdW5saWtlbHkoJmVuYWJsZV9ldm1jcykpCiAJCWV2bWNzX3RvdWNoX21zcl9i
aXRtYXAoKTsKIApAQCAtMzcwMSw2ICszNzA3LDExIEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUg
dm9pZCB2bXhfZW5hYmxlX2ludGVyY2VwdF9mb3JfbXNyKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwK
IAlpZiAoIWNwdV9oYXNfdm14X21zcl9iaXRtYXAoKSkKIAkJcmV0dXJuOwogCisjaWZkZWYgQ09O
RklHX0tWTV9JTlRST1NQRUNUSU9OCisJaWYgKHR5cGUgJiBNU1JfVFlQRV9XKQorCQlrdm1pX21v
bml0b3JfbXNyd19pbnRlcmNlcHQodmNwdSwgbXNyLCB0cnVlKTsKKyNlbmRpZiAvKiBDT05GSUdf
S1ZNX0lOVFJPU1BFQ1RJT04gKi8KKwogCWlmIChzdGF0aWNfYnJhbmNoX3VubGlrZWx5KCZlbmFi
bGVfZXZtY3MpKQogCQlldm1jc190b3VjaF9tc3JfYml0bWFwKCk7CiAKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBs
aXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
