Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BD76F2D1BB6
	for <lists.virtualization@lfdr.de>; Mon,  7 Dec 2020 22:12:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 570FA275A6;
	Mon,  7 Dec 2020 21:12:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id InL+G6VusQwy; Mon,  7 Dec 2020 21:11:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 888C02E29D;
	Mon,  7 Dec 2020 21:11:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6ED77C163C;
	Mon,  7 Dec 2020 21:11:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D84E8C013B
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 21:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C65042E29A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 21:11:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XbjV8sbKhB84
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 21:11:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by silver.osuosl.org (Postfix) with ESMTPS id BD9522E299
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 21:11:51 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 4A6BD305D479; Mon,  7 Dec 2020 22:46:22 +0200 (EET)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 2122B3072784;
 Mon,  7 Dec 2020 22:46:22 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v11 58/81] KVM: introspection: add cleanup support for vCPUs
Date: Mon,  7 Dec 2020 22:45:59 +0200
Message-Id: <20201207204622.15258-59-alazar@bitdefender.com>
In-Reply-To: <20201207204622.15258-1-alazar@bitdefender.com>
References: <20201207204622.15258-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Nicu=C8=99or=20C=C3=AE=C8=9Bu?= <nicu.citu@icloud.com>,
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

RnJvbTogTmljdciZb3IgQ8OuyJt1IDxuaWN1LmNpdHVAaWNsb3VkLmNvbT4KCk9uIHVuaG9vayB0
aGUgaW50cm9zcGVjdGlvbiBjaGFubmVsIGlzIGNsb3NlZC4gVGhpcyB3aWxsIHNpZ25hbCB0aGUK
cmVjZWl2aW5nIHRocmVhZCB0byBjYWxsIGt2bWlfcHV0KCkgYW5kIGV4aXQuIFRoZXJlIG1pZ2h0
IGJlIHZDUFUgdGhyZWFkcwpoYW5kbGluZyBpbnRyb3NwZWN0aW9uIGNvbW1hbmRzIG9yIHdhaXRp
bmcgZm9yIGV2ZW50IHJlcGxpZXMuIFRoZXNlCndpbGwgYWxzbyBjYWxsIGt2bWlfcHV0KCkgYW5k
IHJlLWVudGVyIGluIGd1ZXN0LiBPbmNlIHRoZSByZWZlcmVuY2UKY291bnRlciByZWFjaGVzIHpl
cm8sIHRoZSBzdHJ1Y3R1cmVzIGtlZXBpbmcgdGhlIGludHJvc3BlY3Rpb24gZGF0YQooa3ZtX2lu
dHJvc3BlY3Rpb24gYW5kIGt2bV92Y3B1X2ludHJvc3BlY3Rpb24pIHdpbGwgYmUgZnJlZWQuCgpJ
biBvcmRlciB0byByZXN0b3JlIHRoZSBpbnRlcmNlcHRpb24gb2YgQ1JzLCBNU1JzLCBCUCwgZGVz
Y3JpcHRvci10YWJsZQpyZWdpc3RlcnMsIGZyb20gYWxsIHZDUFVzIChzb21lIG9mIHdoaWNoIG1p
Z2h0IHJ1biBmcm9tIHVzZXJzcGFjZSksCndlIGtlZXAgdGhlIG5lZWRlZCBpbmZvcm1hdGlvbiBp
biBhbm90aGVyIHN0cnVjdHVyZSAoa3ZtaV9pbnRlcmNlcHRpb24pCndoaWNoIHdpbGwgYmUgdXNl
ZCBhbmQgZnJlZWQgYnkgZWFjaCBvZiB0aGVtIGJlZm9yZSByZS1lbnRlcmluZyBpbiBndWVzdC4K
ClNpZ25lZC1vZmYtYnk6IE5pY3XImW9yIEPDrsibdSA8bmljdS5jaXR1QGljbG91ZC5jb20+ClNp
Z25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJpdGRlZmVuZGVyLmNvbT4KLS0t
CiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oICAgfCAgMyArKwogYXJjaC94ODYvaW5j
bHVkZS9hc20va3ZtaV9ob3N0LmggIHwgIDQgKysrCiBhcmNoL3g4Ni9rdm0va3ZtaS5jICAgICAg
ICAgICAgICAgfCA0OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiB2aXJ0L2t2bS9p
bnRyb3NwZWN0aW9uL2t2bWkuYyAgICAgfCAzMiArKysrKysrKysrKysrKysrKystLQogdmlydC9r
dm0vaW50cm9zcGVjdGlvbi9rdm1pX2ludC5oIHwgIDUgKysrKwogNSBmaWxlcyBjaGFuZ2VkLCA5
MCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2lu
Y2x1ZGUvYXNtL2t2bV9ob3N0LmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCmlu
ZGV4IDE5N2RjMTYwYTYxZS4uMzYzOWU1MGI2NDg4IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNs
dWRlL2FzbS9rdm1faG9zdC5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgK
QEAgLTgxNiw2ICs4MTYsOSBAQCBzdHJ1Y3Qga3ZtX3ZjcHVfYXJjaCB7CiAKIAkvKiAjUEYgdHJh
bnNsYXRlZCBlcnJvciBjb2RlIGZyb20gRVBUL05QVCBleGl0IHJlYXNvbiAqLwogCXU2NCBlcnJv
cl9jb2RlOworCisJLyogQ29udHJvbCB0aGUgaW50ZXJjZXB0aW9uIG9mIE1TUnMvQ1JzL0JQLi4u
ICovCisJc3RydWN0IGt2bWlfaW50ZXJjZXB0aW9uICprdm1pOwogfTsKIAogc3RydWN0IGt2bV9s
cGFnZV9pbmZvIHsKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bWlfaG9zdC5o
IGIvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtaV9ob3N0LmgKaW5kZXggY2M5NDUxNTFjYjM2Li5i
Nzc2YmU0YmI0OWYgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bWlfaG9zdC5o
CisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bWlfaG9zdC5oCkBAIC00LDYgKzQsMTAgQEAK
IAogI2luY2x1ZGUgPGFzbS9rdm1pLmg+CiAKK3N0cnVjdCBrdm1pX2ludGVyY2VwdGlvbiB7CisJ
Ym9vbCByZXN0b3JlX2ludGVyY2VwdGlvbjsKK307CisKIHN0cnVjdCBrdm1fdmNwdV9hcmNoX2lu
dHJvc3BlY3Rpb24gewogCXN0cnVjdCBrdm1fcmVncyBkZWxheWVkX3JlZ3M7CiAJYm9vbCBoYXZl
X2RlbGF5ZWRfcmVnczsKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9rdm1pLmMgYi9hcmNoL3g4
Ni9rdm0va3ZtaS5jCmluZGV4IDBiYjZmMzhmMTIxMy4uYjRhN2Q1ODFmNjhjIDEwMDY0NAotLS0g
YS9hcmNoL3g4Ni9rdm0va3ZtaS5jCisrKyBiL2FyY2gveDg2L2t2bS9rdm1pLmMKQEAgLTIxMCwz
ICsyMTAsNTIgQEAgdm9pZCBrdm1pX2FyY2hfYnJlYWtwb2ludF9ldmVudChzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHUsIHU2NCBndmEsIHU4IGluc25fbGVuKQogCQlrdm1pX2hhbmRsZV9jb21tb25fZXZl
bnRfYWN0aW9ucyh2Y3B1LCBhY3Rpb24pOwogCX0KIH0KKworc3RhdGljIHZvaWQga3ZtaV9hcmNo
X3Jlc3RvcmVfaW50ZXJjZXB0aW9uKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKK3sKK30KKworYm9v
bCBrdm1pX2FyY2hfY2xlYW5fdXBfaW50ZXJjZXB0aW9uKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkK
K3sKKwlzdHJ1Y3Qga3ZtaV9pbnRlcmNlcHRpb24gKmFyY2hfdmNwdWkgPSB2Y3B1LT5hcmNoLmt2
bWk7CisKKwlpZiAoIWFyY2hfdmNwdWkpCisJCXJldHVybiBmYWxzZTsKKworCWlmICghYXJjaF92
Y3B1aS0+cmVzdG9yZV9pbnRlcmNlcHRpb24pCisJCXJldHVybiBmYWxzZTsKKworCWt2bWlfYXJj
aF9yZXN0b3JlX2ludGVyY2VwdGlvbih2Y3B1KTsKKworCXJldHVybiB0cnVlOworfQorCitib29s
IGt2bWlfYXJjaF92Y3B1X2FsbG9jX2ludGVyY2VwdGlvbihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUp
Cit7CisJc3RydWN0IGt2bWlfaW50ZXJjZXB0aW9uICphcmNoX3ZjcHVpOworCisJYXJjaF92Y3B1
aSA9IGt6YWxsb2Moc2l6ZW9mKCphcmNoX3ZjcHVpKSwgR0ZQX0tFUk5FTCk7CisJaWYgKCFhcmNo
X3ZjcHVpKQorCQlyZXR1cm4gZmFsc2U7CisKKwlyZXR1cm4gdHJ1ZTsKK30KKwordm9pZCBrdm1p
X2FyY2hfdmNwdV9mcmVlX2ludGVyY2VwdGlvbihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCit7CisJ
a2ZyZWUodmNwdS0+YXJjaC5rdm1pKTsKKwlXUklURV9PTkNFKHZjcHUtPmFyY2gua3ZtaSwgTlVM
TCk7Cit9CisKK2Jvb2wga3ZtaV9hcmNoX3ZjcHVfaW50cm9zcGVjdGVkKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSkKK3sKKwlyZXR1cm4gISFSRUFEX09OQ0UodmNwdS0+YXJjaC5rdm1pKTsKK30KKwor
dm9pZCBrdm1pX2FyY2hfcmVxdWVzdF9pbnRlcmNlcHRpb25fY2xlYW51cChzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHUpCit7CisJc3RydWN0IGt2bWlfaW50ZXJjZXB0aW9uICphcmNoX3ZjcHVpID0gUkVB
RF9PTkNFKHZjcHUtPmFyY2gua3ZtaSk7CisKKwlpZiAoYXJjaF92Y3B1aSkKKwkJYXJjaF92Y3B1
aS0+cmVzdG9yZV9pbnRlcmNlcHRpb24gPSB0cnVlOworfQpkaWZmIC0tZ2l0IGEvdmlydC9rdm0v
aW50cm9zcGVjdGlvbi9rdm1pLmMgYi92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWkuYwppbmRl
eCBiZDFlNmFmYWVkOWYuLjI1YWYyN2FhZjllYyAxMDA2NDQKLS0tIGEvdmlydC9rdm0vaW50cm9z
cGVjdGlvbi9rdm1pLmMKKysrIGIvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pLmMKQEAgLTIw
Niw3ICsyMDYsNyBAQCBzdGF0aWMgYm9vbCBrdm1pX2FsbG9jX3ZjcHVpKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSkKIAogCXZjcHUtPmt2bWkgPSB2Y3B1aTsKIAotCXJldHVybiB0cnVlOworCXJldHVy
biBrdm1pX2FyY2hfdmNwdV9hbGxvY19pbnRlcmNlcHRpb24odmNwdSk7CiB9CiAKIHN0YXRpYyBp
bnQga3ZtaV9jcmVhdGVfdmNwdWkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQpAQCAtMjQwLDYgKzI0
MCw5IEBAIHN0YXRpYyB2b2lkIGt2bWlfZnJlZV92Y3B1aShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUp
CiAKIAlrZnJlZSh2Y3B1aSk7CiAJdmNwdS0+a3ZtaSA9IE5VTEw7CisKKwlrdm1pX2FyY2hfcmVx
dWVzdF9pbnRlcmNlcHRpb25fY2xlYW51cCh2Y3B1KTsKKwlrdm1pX21ha2VfcmVxdWVzdCh2Y3B1
LCBmYWxzZSk7CiB9CiAKIHN0YXRpYyB2b2lkIGt2bWlfZnJlZShzdHJ1Y3Qga3ZtICprdm0pCkBA
IC0yNjIsNiArMjY1LDcgQEAgdm9pZCBrdm1pX3ZjcHVfdW5pbml0KHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSkKIHsKIAltdXRleF9sb2NrKCZ2Y3B1LT5rdm0tPmt2bWlfbG9jayk7CiAJa3ZtaV9mcmVl
X3ZjcHVpKHZjcHUpOworCWt2bWlfYXJjaF92Y3B1X2ZyZWVfaW50ZXJjZXB0aW9uKHZjcHUpOwog
CW11dGV4X3VubG9jaygmdmNwdS0+a3ZtLT5rdm1pX2xvY2spOwogfQogCkBAIC00MTAsNiArNDE0
LDIxIEBAIHN0YXRpYyBpbnQga3ZtaV9yZWN2X3RocmVhZCh2b2lkICphcmcpCiAJcmV0dXJuIDA7
CiB9CiAKK3N0YXRpYyBib29sIHJlYWR5X3RvX2hvb2soc3RydWN0IGt2bSAqa3ZtKQoreworCXN0
cnVjdCBrdm1fdmNwdSAqdmNwdTsKKwlpbnQgaTsKKworCWlmIChrdm0tPmt2bWkpCisJCXJldHVy
biBmYWxzZTsKKworCWt2bV9mb3JfZWFjaF92Y3B1KGksIHZjcHUsIGt2bSkKKwkJaWYgKGt2bWlf
YXJjaF92Y3B1X2ludHJvc3BlY3RlZCh2Y3B1KSkKKwkJCXJldHVybiBmYWxzZTsKKworCXJldHVy
biB0cnVlOworfQorCiBzdGF0aWMgaW50IGt2bWlfaG9vayhzdHJ1Y3Qga3ZtICprdm0sCiAJCSAg
ICAgY29uc3Qgc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uX2hvb2sgKmhvb2spCiB7CkBAIC00MTgs
NyArNDM3LDcgQEAgc3RhdGljIGludCBrdm1pX2hvb2soc3RydWN0IGt2bSAqa3ZtLAogCiAJbXV0
ZXhfbG9jaygma3ZtLT5rdm1pX2xvY2spOwogCi0JaWYgKGt2bS0+a3ZtaSkgeworCWlmICghcmVh
ZHlfdG9faG9vayhrdm0pKSB7CiAJCWVyciA9IC1FRVhJU1Q7CiAJCWdvdG8gb3V0OwogCX0KQEAg
LTgxNSw3ICs4MzQsNyBAQCB2b2lkIGt2bWlfaGFuZGxlX3JlcXVlc3RzKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSkKIAogCWt2bWkgPSBrdm1pX2dldCh2Y3B1LT5rdm0pOwogCWlmICgha3ZtaSkKLQkJ
cmV0dXJuOworCQlnb3RvIG91dDsKIAogCWZvciAoOzspIHsKIAkJa3ZtaV9ydW5fam9icyh2Y3B1
KTsKQEAgLTgyNyw2ICs4NDYsMTMgQEAgdm9pZCBrdm1pX2hhbmRsZV9yZXF1ZXN0cyhzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUpCiAJfQogCiAJa3ZtaV9wdXQodmNwdS0+a3ZtKTsKKworb3V0OgorCWlm
IChrdm1pX2FyY2hfY2xlYW5fdXBfaW50ZXJjZXB0aW9uKHZjcHUpKSB7CisJCW11dGV4X2xvY2so
JnZjcHUtPmt2bS0+a3ZtaV9sb2NrKTsKKwkJa3ZtaV9hcmNoX3ZjcHVfZnJlZV9pbnRlcmNlcHRp
b24odmNwdSk7CisJCW11dGV4X3VubG9jaygmdmNwdS0+a3ZtLT5rdm1pX2xvY2spOworCX0KIH0K
IAogaW50IGt2bWlfY21kX3ZjcHVfcGF1c2Uoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBib29sIHdh
aXQpCmRpZmYgLS1naXQgYS92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfaW50LmggYi92aXJ0
L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfaW50LmgKaW5kZXggZmY3NDVlM2NlYmFmLi45NGRlNTRk
N2ViYjkgMTAwNjQ0Ci0tLSBhL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9pbnQuaAorKysg
Yi92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfaW50LmgKQEAgLTc4LDYgKzc4LDExIEBAIHZv
aWQga3ZtaV9hcmNoX2luaXRfdmNwdV9ldmVudHNfbWFzayh1bnNpZ25lZCBsb25nICpzdXBwb3J0
ZWQpOwoga3ZtaV92Y3B1X21zZ19qb2JfZmN0IGt2bWlfYXJjaF92Y3B1X21zZ19oYW5kbGVyKHUx
NiBpZCk7CiB2b2lkIGt2bWlfYXJjaF9zZXR1cF92Y3B1X2V2ZW50KHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSwKIAkJCQlzdHJ1Y3Qga3ZtaV92Y3B1X2V2ZW50ICpldik7Citib29sIGt2bWlfYXJjaF92
Y3B1X2FsbG9jX2ludGVyY2VwdGlvbihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwordm9pZCBrdm1p
X2FyY2hfdmNwdV9mcmVlX2ludGVyY2VwdGlvbihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOworYm9v
bCBrdm1pX2FyY2hfdmNwdV9pbnRyb3NwZWN0ZWQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKK3Zv
aWQga3ZtaV9hcmNoX3JlcXVlc3RfaW50ZXJjZXB0aW9uX2NsZWFudXAoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1KTsKK2Jvb2wga3ZtaV9hcmNoX2NsZWFuX3VwX2ludGVyY2VwdGlvbihzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUpOwogdm9pZCBrdm1pX2FyY2hfcG9zdF9yZXBseShzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUpOwogYm9vbCBrdm1pX2FyY2hfaXNfYWdlbnRfaHlwZXJjYWxsKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSk7CiB2b2lkIGt2bWlfYXJjaF9icmVha3BvaW50X2V2ZW50KHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSwgdTY0IGd2YSwgdTggaW5zbl9sZW4pOwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVh
bGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
