Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AB42D1B7F
	for <lists.virtualization@lfdr.de>; Mon,  7 Dec 2020 21:57:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 149EF8714D;
	Mon,  7 Dec 2020 20:57:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Hi1gkORpKCF; Mon,  7 Dec 2020 20:57:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1DDFB87B03;
	Mon,  7 Dec 2020 20:57:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7F4AC013B;
	Mon,  7 Dec 2020 20:57:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4656AC013B
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 04F842E4EE
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:57:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kLDDB+GFFd1G
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:56:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by silver.osuosl.org (Postfix) with ESMTPS id 164E32E28A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:56:51 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 E25A3305D46D; Mon,  7 Dec 2020 22:46:19 +0200 (EET)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id B07E43072784;
 Mon,  7 Dec 2020 22:46:19 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v11 46/81] KVM: introspection: handle vCPU commands
Date: Mon,  7 Dec 2020 22:45:47 +0200
Message-Id: <20201207204622.15258-47-alazar@bitdefender.com>
In-Reply-To: <20201207204622.15258-1-alazar@bitdefender.com>
References: <20201207204622.15258-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>,
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKQmFzZWQgb24gdGhl
IGNvbW1vbiBzdHJ1Y3R1cmUgKGt2bWlfdmNwdV9oZHIpIHVzZWQgZm9yIGFsbCB2Q1BVIGNvbW1h
bmRzLAp0aGUgcmVjZWl2aW5nIHRocmVhZCB2YWxpZGF0ZXMgYW5kIGRpc3BhdGNoZXMgdGhlIG1l
c3NhZ2UgdG8gdGhlIHByb3Blcgp2Q1BVIChhZGRpbmcgdGhlIGhhbmRsaW5nIGZ1bmN0aW9uIHRv
IGl0cyBqb2JzIGxpc3QpLgoKU2lnbmVkLW9mZi1ieTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0
ZGVmZW5kZXIuY29tPgpDby1kZXZlbG9wZWQtYnk6IE5pY3XImW9yIEPDrsibdSA8bmljdS5jaXR1
QGljbG91ZC5jb20+ClNpZ25lZC1vZmYtYnk6IE5pY3XImW9yIEPDrsibdSA8bmljdS5jaXR1QGlj
bG91ZC5jb20+CkNvLWRldmVsb3BlZC1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVm
ZW5kZXIuY29tPgpTaWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZl
bmRlci5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJzdCAgIHwgICA4ICsr
CiBhcmNoL3g4Ni9rdm0vTWFrZWZpbGUgICAgICAgICAgICAgfCAgIDIgKy0KIGFyY2gveDg2L2t2
bS9rdm1pX21zZy5jICAgICAgICAgICB8ICAxNyArKysrCiBpbmNsdWRlL3VhcGkvbGludXgva3Zt
aS5oICAgICAgICAgfCAgIDYgKysKIHZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9pbnQuaCB8
ICAxNiArKysrCiB2aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfbXNnLmMgfCAxNTAgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKystCiA2IGZpbGVzIGNoYW5nZWQsIDE5NiBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gveDg2L2t2bS9rdm1p
X21zZy5jCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJzdCBiL0Rv
Y3VtZW50YXRpb24vdmlydC9rdm0va3ZtaS5yc3QKaW5kZXggNzgxMmQ2MjI0MGMwLi40ZDM0MDUy
OGQyZjQgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vdmlydC9rdm0va3ZtaS5yc3QKKysrIGIv
RG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJzdApAQCAtMjIxLDYgKzIyMSwxNCBAQCBUaGUg
Zm9sbG93aW5nIEMgc3RydWN0dXJlcyBhcmUgbWVhbnQgdG8gYmUgdXNlZCBkaXJlY3RseSB3aGVu
IGNvbW11bmljYXRpbmcKIG92ZXIgdGhlIHdpcmUuIFRoZSBwZWVyIHRoYXQgZGV0ZWN0cyBhbnkg
c2l6ZSBtaXNtYXRjaCBzaG91bGQgc2ltcGx5IGNsb3NlCiB0aGUgY29ubmVjdGlvbiBhbmQgcmVw
b3J0IHRoZSBlcnJvci4KIAorVGhlIHZDUFUgY29tbWFuZHMgc3RhcnQgd2l0aDo6CisKKwlzdHJ1
Y3Qga3ZtaV92Y3B1X2hkciB7CisJCV9fdTE2IHZjcHU7CisJCV9fdTE2IHBhZGRpbmcxOworCQlf
X3UzMiBwYWRkaW5nMjsKKwl9CisKIDEuIEtWTUlfR0VUX1ZFUlNJT04KIC0tLS0tLS0tLS0tLS0t
LS0tLS0KIApkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL01ha2VmaWxlIGIvYXJjaC94ODYva3Zt
L01ha2VmaWxlCmluZGV4IDhmYWQ0MDY0OWJjZi4uNmQwNDczMWUyMzVlIDEwMDY0NAotLS0gYS9h
cmNoL3g4Ni9rdm0vTWFrZWZpbGUKKysrIGIvYXJjaC94ODYva3ZtL01ha2VmaWxlCkBAIC0xNCw3
ICsxNCw3IEBAIGt2bS15CQkJKz0gJChLVk0pL2t2bV9tYWluLm8gJChLVk0pL2NvYWxlc2NlZF9t
bWlvLm8gXAogCQkJCSQoS1ZNKS9ldmVudGZkLm8gJChLVk0pL2lycWNoaXAubyAkKEtWTSkvdmZp
by5vIFwKIAkJCQkkKEtWTSkvZGlydHlfcmluZy5vCiBrdm0tJChDT05GSUdfS1ZNX0FTWU5DX1BG
KQkrPSAkKEtWTSkvYXN5bmNfcGYubwota3ZtLSQoQ09ORklHX0tWTV9JTlRST1NQRUNUSU9OKSAr
PSAkKEtWTUkpL2t2bWkubyAkKEtWTUkpL2t2bWlfbXNnLm8ga3ZtaS5vCitrdm0tJChDT05GSUdf
S1ZNX0lOVFJPU1BFQ1RJT04pICs9ICQoS1ZNSSkva3ZtaS5vICQoS1ZNSSkva3ZtaV9tc2cubyBr
dm1pLm8ga3ZtaV9tc2cubwogCiBrdm0teQkJCSs9IHg4Ni5vIGVtdWxhdGUubyBpODI1OS5vIGly
cS5vIGxhcGljLm8gXAogCQkJICAgaTgyNTQubyBpb2FwaWMubyBpcnFfY29tbS5vIGNwdWlkLm8g
cG11Lm8gbXRyci5vIFwKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9rdm1pX21zZy5jIGIvYXJj
aC94ODYva3ZtL2t2bWlfbXNnLmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAw
MDAwLi4wZjQ3MTdjYTVmYTgKLS0tIC9kZXYvbnVsbAorKysgYi9hcmNoL3g4Ni9rdm0va3ZtaV9t
c2cuYwpAQCAtMCwwICsxLDE3IEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MAorLyoKKyAqIEtWTSBpbnRyb3NwZWN0aW9uIChtZXNzYWdlIGhhbmRsaW5nKSAtIHg4NgorICoK
KyAqIENvcHlyaWdodCAoQykgMjAyMCBCaXRkZWZlbmRlciBTLlIuTC4KKyAqCisgKi8KKworI2lu
Y2x1ZGUgIi4uLy4uLy4uL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9pbnQuaCIKKworc3Rh
dGljIGt2bWlfdmNwdV9tc2dfam9iX2ZjdCBjb25zdCBtc2dfdmNwdVtdID0geworfTsKKwora3Zt
aV92Y3B1X21zZ19qb2JfZmN0IGt2bWlfYXJjaF92Y3B1X21zZ19oYW5kbGVyKHUxNiBpZCkKK3sK
KwlyZXR1cm4gaWQgPCBBUlJBWV9TSVpFKG1zZ192Y3B1KSA/IG1zZ192Y3B1W2lkXSA6IE5VTEw7
Cit9CmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgva3ZtaS5oIGIvaW5jbHVkZS91YXBp
L2xpbnV4L2t2bWkuaAppbmRleCAwNDhhZmFkMDFiZTYuLjdiYTFjODc1OGFiYSAxMDA2NDQKLS0t
IGEvaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaAorKysgYi9pbmNsdWRlL3VhcGkvbGludXgva3Zt
aS5oCkBAIC0xMDcsNCArMTA3LDEwIEBAIHN0cnVjdCBrdm1pX3ZtX3dyaXRlX3BoeXNpY2FsIHsK
IAlfX3U4ICBkYXRhWzBdOwogfTsKIAorc3RydWN0IGt2bWlfdmNwdV9oZHIgeworCV9fdTE2IHZj
cHU7CisJX191MTYgcGFkZGluZzE7CisJX191MzIgcGFkZGluZzI7Cit9OworCiAjZW5kaWYgLyog
X1VBUElfX0xJTlVYX0tWTUlfSCAqLwpkaWZmIC0tZ2l0IGEvdmlydC9rdm0vaW50cm9zcGVjdGlv
bi9rdm1pX2ludC5oIGIvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX2ludC5oCmluZGV4IGMz
YWExMjU1NGMyYi4uYzNlNGRhN2U3ZjIwIDEwMDY0NAotLS0gYS92aXJ0L2t2bS9pbnRyb3NwZWN0
aW9uL2t2bWlfaW50LmgKKysrIGIvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX2ludC5oCkBA
IC0xNCw2ICsxNCwxOCBAQAogICovCiAjZGVmaW5lIEtWTUlfTUFYX01TR19TSVpFICg0MDk2ICog
MiAtIHNpemVvZihzdHJ1Y3Qga3ZtaV9tc2dfaGRyKSkKIAorc3RydWN0IGt2bWlfdmNwdV9tc2df
am9iIHsKKwlzdHJ1Y3QgeworCQlzdHJ1Y3Qga3ZtaV9tc2dfaGRyIGhkcjsKKwkJc3RydWN0IGt2
bWlfdmNwdV9oZHIgdmNwdV9oZHI7CisJfSAqbXNnOworCXN0cnVjdCBrdm1fdmNwdSAqdmNwdTsK
K307CisKK3R5cGVkZWYgaW50ICgqa3ZtaV92Y3B1X21zZ19qb2JfZmN0KShjb25zdCBzdHJ1Y3Qg
a3ZtaV92Y3B1X21zZ19qb2IgKmpvYiwKKwkJCQkgICAgIGNvbnN0IHN0cnVjdCBrdm1pX21zZ19o
ZHIgKm1zZywKKwkJCQkgICAgIGNvbnN0IHZvaWQgKnJlcSk7CisKIC8qIGt2bWlfbXNnLmMgKi8K
IGJvb2wga3ZtaV9zb2NrX2dldChzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2bWksIGludCBm
ZCk7CiB2b2lkIGt2bWlfc29ja19zaHV0ZG93bihzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2
bWkpOwpAQCAtMjgsNiArNDAsOSBAQCBib29sIGt2bWlfaXNfY29tbWFuZF9hbGxvd2VkKHN0cnVj
dCBrdm1faW50cm9zcGVjdGlvbiAqa3ZtaSwgdTE2IGlkKTsKIGJvb2wga3ZtaV9pc19ldmVudF9h
bGxvd2VkKHN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqa3ZtaSwgdTE2IGlkKTsKIGJvb2wga3Zt
aV9pc19rbm93bl9ldmVudCh1MTYgaWQpOwogYm9vbCBrdm1pX2lzX2tub3duX3ZtX2V2ZW50KHUx
NiBpZCk7CitpbnQga3ZtaV9hZGRfam9iKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKKwkJIHZvaWQg
KCpmY3QpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdm9pZCAqY3R4KSwKKwkJIHZvaWQgKmN0eCwg
dm9pZCAoKmZyZWVfZmN0KSh2b2lkICpjdHgpKTsKIGludCBrdm1pX2NtZF92bV9jb250cm9sX2V2
ZW50cyhzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2bWksCiAJCQkgICAgICAgdTE2IGV2ZW50
X2lkLCBib29sIGVuYWJsZSk7CiBpbnQga3ZtaV9jbWRfcmVhZF9waHlzaWNhbChzdHJ1Y3Qga3Zt
ICprdm0sIHU2NCBncGEsIHNpemVfdCBzaXplLApAQCAtNDAsNSArNTUsNiBAQCBpbnQga3ZtaV9j
bWRfd3JpdGVfcGh5c2ljYWwoc3RydWN0IGt2bSAqa3ZtLCB1NjQgZ3BhLCBzaXplX3Qgc2l6ZSwK
IAogLyogYXJjaCAqLwogdm9pZCBrdm1pX2FyY2hfaW5pdF92Y3B1X2V2ZW50c19tYXNrKHVuc2ln
bmVkIGxvbmcgKnN1cHBvcnRlZCk7Citrdm1pX3ZjcHVfbXNnX2pvYl9mY3Qga3ZtaV9hcmNoX3Zj
cHVfbXNnX2hhbmRsZXIodTE2IGlkKTsKIAogI2VuZGlmCmRpZmYgLS1naXQgYS92aXJ0L2t2bS9p
bnRyb3NwZWN0aW9uL2t2bWlfbXNnLmMgYi92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfbXNn
LmMKaW5kZXggZjAwNTA5NDU3MTEyLi5mODM2NTljOTczNzUgMTAwNjQ0Ci0tLSBhL3ZpcnQva3Zt
L2ludHJvc3BlY3Rpb24va3ZtaV9tc2cuYworKysgYi92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2
bWlfbXNnLmMKQEAgLTEzLDYgKzEzLDcgQEAgdHlwZWRlZiBpbnQgKCprdm1pX3ZtX21zZ19mY3Qp
KHN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqa3ZtaSwKIAkJCSAgICAgICBjb25zdCB2b2lkICpy
ZXEpOwogCiBzdGF0aWMgYm9vbCBpc192bV9jb21tYW5kKHUxNiBpZCk7CitzdGF0aWMgYm9vbCBp
c192Y3B1X2NvbW1hbmQodTE2IGlkKTsKIAogYm9vbCBrdm1pX3NvY2tfZ2V0KHN0cnVjdCBrdm1f
aW50cm9zcGVjdGlvbiAqa3ZtaSwgaW50IGZkKQogewpAQCAtMTA0LDYgKzEwNSwxNyBAQCBzdGF0
aWMgaW50IGt2bWlfbXNnX3ZtX3JlcGx5KHN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqa3ZtaSwK
IAlyZXR1cm4ga3ZtaV9tc2dfcmVwbHkoa3ZtaSwgbXNnLCBlcnIsIHJwbCwgcnBsX3NpemUpOwog
fQogCitzdGF0aWMgc3RydWN0IGt2bV92Y3B1ICprdm1pX2dldF92Y3B1KHN0cnVjdCBrdm1faW50
cm9zcGVjdGlvbiAqa3ZtaSwKKwkJCQkgICAgICB1bnNpZ25lZCBpbnQgdmNwdV9pZHgpCit7CisJ
c3RydWN0IGt2bSAqa3ZtID0ga3ZtaS0+a3ZtOworCisJaWYgKHZjcHVfaWR4ID49IGF0b21pY19y
ZWFkKCZrdm0tPm9ubGluZV92Y3B1cykpCisJCXJldHVybiBOVUxMOworCisJcmV0dXJuIGt2bV9n
ZXRfdmNwdShrdm0sIHZjcHVfaWR4KTsKK30KKwogc3RhdGljIGludCBoYW5kbGVfZ2V0X3ZlcnNp
b24oc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uICprdm1pLAogCQkJICAgICAgY29uc3Qgc3RydWN0
IGt2bWlfbXNnX2hkciAqbXNnLCBjb25zdCB2b2lkICpyZXEpCiB7CkBAIC0xMjUsNyArMTM3LDcg
QEAgc3RhdGljIGludCBoYW5kbGVfdm1fY2hlY2tfY29tbWFuZChzdHJ1Y3Qga3ZtX2ludHJvc3Bl
Y3Rpb24gKmt2bWksCiAKIAlpZiAocmVxLT5wYWRkaW5nMSB8fCByZXEtPnBhZGRpbmcyKQogCQll
YyA9IC1LVk1fRUlOVkFMOwotCWVsc2UgaWYgKCFpc192bV9jb21tYW5kKHJlcS0+aWQpKQorCWVs
c2UgaWYgKCFpc192bV9jb21tYW5kKHJlcS0+aWQpICYmICFpc192Y3B1X2NvbW1hbmQocmVxLT5p
ZCkpCiAJCWVjID0gLUtWTV9FTk9FTlQ7CiAJZWxzZSBpZiAoIWt2bWlfaXNfY29tbWFuZF9hbGxv
d2VkKGt2bWksIHJlcS0+aWQpKQogCQllYyA9IC1LVk1fRVBFUk07CkBAIC0yNTQsNiArMjY2LDc0
IEBAIHN0YXRpYyBib29sIGlzX3ZtX2NvbW1hbmQodTE2IGlkKQogCXJldHVybiBpc192bV9tZXNz
YWdlKGlkKSAmJiBpZCAhPSBLVk1JX1ZNX0VWRU5UOwogfQogCisvKgorICogVGhlc2UgZnVuY3Rp
b25zIGFyZSBleGVjdXRlZCBmcm9tIHRoZSB2Q1BVIHRocmVhZC4gVGhlIHJlY2VpdmluZyB0aHJl
YWQKKyAqIHBhc3NlcyB0aGUgbWVzc2FnZXMgdXNpbmcgYSBuZXdseSBhbGxvY2F0ZWQgJ3N0cnVj
dCBrdm1pX3ZjcHVfbXNnX2pvYicKKyAqIGFuZCBzaWduYWxzIHRoZSB2Q1BVIHRvIGhhbmRsZSB0
aGUgbWVzc2FnZSAod2hpY2ggaW5jbHVkZXMKKyAqIHNlbmRpbmcgYmFjayB0aGUgcmVwbHkpLgor
ICovCitzdGF0aWMga3ZtaV92Y3B1X21zZ19qb2JfZmN0IGNvbnN0IG1zZ192Y3B1W10gPSB7Cit9
OworCitzdGF0aWMga3ZtaV92Y3B1X21zZ19qb2JfZmN0IGdldF92Y3B1X21zZ19oYW5kbGVyKHUx
NiBpZCkKK3sKKwlrdm1pX3ZjcHVfbXNnX2pvYl9mY3QgZmN0OworCisJZmN0ID0gaWQgPCBBUlJB
WV9TSVpFKG1zZ192Y3B1KSA/IG1zZ192Y3B1W2lkXSA6IE5VTEw7CisKKwlpZiAoIWZjdCkKKwkJ
ZmN0ID0ga3ZtaV9hcmNoX3ZjcHVfbXNnX2hhbmRsZXIoaWQpOworCisJcmV0dXJuIGZjdDsKK30K
Kworc3RhdGljIGJvb2wgaXNfdmNwdV9tZXNzYWdlKHUxNiBpZCkKK3sKKwlib29sIGlzX3ZjcHVf
bXNnX2lkID0gaWQgJiAxOworCisJcmV0dXJuIGlzX3ZjcHVfbXNnX2lkICYmICEhZ2V0X3ZjcHVf
bXNnX2hhbmRsZXIoaWQpOworfQorCitzdGF0aWMgYm9vbCBpc192Y3B1X2NvbW1hbmQodTE2IGlk
KQoreworCXJldHVybiBpc192Y3B1X21lc3NhZ2UoaWQpOworfQorCitzdGF0aWMgdm9pZCBrdm1p
X2pvYl92Y3B1X21zZyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHZvaWQgKmN0eCkKK3sKKwlzdHJ1
Y3Qga3ZtaV92Y3B1X21zZ19qb2IgKmpvYiA9IGN0eDsKKwlrdm1pX3ZjcHVfbXNnX2pvYl9mY3Qg
ZmN0OworCWludCBlcnI7CisKKwlqb2ItPnZjcHUgPSB2Y3B1OworCisJZmN0ID0gZ2V0X3ZjcHVf
bXNnX2hhbmRsZXIoam9iLT5tc2ctPmhkci5pZCk7CisJZXJyID0gZmN0KGpvYiwgJmpvYi0+bXNn
LT5oZHIsIGpvYi0+bXNnICsgMSk7CisKKwkvKgorCSAqIFRoZSBzb2Z0IGVycm9ycyBhcmUgc2Vu
dCB3aXRoIHRoZSByZXBseS4KKwkgKiBPbiBoYXJkIGVycm9ycywgbGlrZSB0aGlzIG9uZSwKKwkg
KiB3ZSBzaHV0IGRvd24gdGhlIHNvY2tldC4KKwkgKi8KKwlpZiAoZXJyKQorCQlrdm1pX3NvY2tf
c2h1dGRvd24oS1ZNSSh2Y3B1LT5rdm0pKTsKK30KKworc3RhdGljIHZvaWQga3ZtaV9mcmVlX2N0
eCh2b2lkICpfY3R4KQoreworCWNvbnN0IHN0cnVjdCBrdm1pX3ZjcHVfbXNnX2pvYiAqY3R4ID0g
X2N0eDsKKworCWt2bWlfbXNnX2ZyZWUoY3R4LT5tc2cpOworCWtmcmVlKGN0eCk7Cit9CisKK3N0
YXRpYyBpbnQga3ZtaV9tc2dfcXVldWVfdG9fdmNwdShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCisJ
CQkJICBjb25zdCBzdHJ1Y3Qga3ZtaV92Y3B1X21zZ19qb2IgKmNtZCkKK3sKKwlyZXR1cm4ga3Zt
aV9hZGRfam9iKHZjcHUsIGt2bWlfam9iX3ZjcHVfbXNnLCAodm9pZCAqKWNtZCwKKwkJCSAgICBr
dm1pX2ZyZWVfY3R4KTsKK30KKwogc3RhdGljIHN0cnVjdCBrdm1pX21zZ19oZHIgKmt2bWlfbXNn
X3JlY3Yoc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uICprdm1pKQogewogCXN0cnVjdCBrdm1pX21z
Z19oZHIgKm1zZzsKQEAgLTMwNyw5ICszODcsNzIgQEAgc3RhdGljIGludCBrdm1pX21zZ19oYW5k
bGVfdm1fY21kKHN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqa3ZtaSwKIAlyZXR1cm4ga3ZtaV9t
c2dfZG9fdm1fY21kKGt2bWksIG1zZyk7CiB9CiAKK3N0YXRpYyBib29sIHZjcHVfY2FuX2hhbmRs
ZV9tZXNzYWdlcyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCit7CisJcmV0dXJuIHZjcHUtPmFyY2gu
bXBfc3RhdGUgIT0gS1ZNX01QX1NUQVRFX1VOSU5JVElBTElaRUQ7Cit9CisKK3N0YXRpYyBpbnQg
a3ZtaV9nZXRfdmNwdV9pZl9yZWFkeShzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2bWksCisJ
CQkJICB1bnNpZ25lZCBpbnQgdmNwdV9pZHgsCisJCQkJICBzdHJ1Y3Qga3ZtX3ZjcHUgKip2Y3B1
KQoreworCSp2Y3B1ID0ga3ZtaV9nZXRfdmNwdShrdm1pLCB2Y3B1X2lkeCk7CisJaWYgKCp2Y3B1
ID09IE5VTEwpCisJCXJldHVybiAtS1ZNX0VJTlZBTDsKKworCWlmICghdmNwdV9jYW5faGFuZGxl
X21lc3NhZ2VzKCp2Y3B1KSkKKwkJcmV0dXJuIC1LVk1fRUFHQUlOOworCisJcmV0dXJuIDA7Cit9
CisKK3N0YXRpYyBpbnQga3ZtaV9tc2dfZGlzcGF0Y2hfdmNwdV9tc2coc3RydWN0IGt2bV9pbnRy
b3NwZWN0aW9uICprdm1pLAorCQkJCSAgICAgIHN0cnVjdCBrdm1pX21zZ19oZHIgKm1zZywKKwkJ
CQkgICAgICBzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCit7CisJc3RydWN0IGt2bWlfdmNwdV9tc2df
am9iICpqb2JfY21kOworCWludCBlcnI7CisKKwlqb2JfY21kID0ga3phbGxvYyhzaXplb2YoKmpv
Yl9jbWQpLCBHRlBfS0VSTkVMKTsKKwlpZiAoIWpvYl9jbWQpCisJCXJldHVybiAtRU5PTUVNOwor
CisJam9iX2NtZC0+bXNnID0gKHZvaWQgKiltc2c7CisKKwllcnIgPSBrdm1pX21zZ19xdWV1ZV90
b192Y3B1KHZjcHUsIGpvYl9jbWQpOworCWlmIChlcnIpCisJCWtmcmVlKGpvYl9jbWQpOworCisJ
cmV0dXJuIGVycjsKK30KKworc3RhdGljIGludCBrdm1pX21zZ19oYW5kbGVfdmNwdV9tc2coc3Ry
dWN0IGt2bV9pbnRyb3NwZWN0aW9uICprdm1pLAorCQkJCSAgICBzdHJ1Y3Qga3ZtaV9tc2dfaGRy
ICptc2csCisJCQkJICAgIGJvb2wgKnF1ZXVlZCkKK3sKKwlzdHJ1Y3Qga3ZtaV92Y3B1X2hkciAq
dmNwdV9oZHIgPSAoc3RydWN0IGt2bWlfdmNwdV9oZHIgKikobXNnICsgMSk7CisJc3RydWN0IGt2
bV92Y3B1ICp2Y3B1ID0gTlVMTDsKKwlpbnQgZXJyLCBlYzsKKworCWlmICgha3ZtaV9pc19jb21t
YW5kX2FsbG93ZWQoa3ZtaSwgbXNnLT5pZCkpCisJCXJldHVybiBrdm1pX21zZ192bV9yZXBseV9l
Yyhrdm1pLCBtc2csIC1LVk1fRVBFUk0pOworCisJaWYgKHZjcHVfaGRyLT5wYWRkaW5nMSB8fCB2
Y3B1X2hkci0+cGFkZGluZzIpCisJCXJldHVybiBrdm1pX21zZ192bV9yZXBseV9lYyhrdm1pLCBt
c2csIC1LVk1fRUlOVkFMKTsKKworCWVjID0ga3ZtaV9nZXRfdmNwdV9pZl9yZWFkeShrdm1pLCB2
Y3B1X2hkci0+dmNwdSwgJnZjcHUpOworCWlmIChlYykKKwkJcmV0dXJuIGt2bWlfbXNnX3ZtX3Jl
cGx5X2VjKGt2bWksIG1zZywgZWMpOworCisJZXJyID0ga3ZtaV9tc2dfZGlzcGF0Y2hfdmNwdV9t
c2coa3ZtaSwgbXNnLCB2Y3B1KTsKKwkqcXVldWVkID0gZXJyID09IDA7CisJcmV0dXJuIGVycjsK
K30KKwogYm9vbCBrdm1pX21zZ19wcm9jZXNzKHN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqa3Zt
aSkKIHsKIAlzdHJ1Y3Qga3ZtaV9tc2dfaGRyICptc2c7CisJYm9vbCBxdWV1ZWQgPSBmYWxzZTsK
IAlpbnQgZXJyID0gLTE7CiAKIAltc2cgPSBrdm1pX21zZ19yZWN2KGt2bWkpOwpAQCAtMzE4LDEw
ICs0NjEsMTMgQEAgYm9vbCBrdm1pX21zZ19wcm9jZXNzKHN0cnVjdCBrdm1faW50cm9zcGVjdGlv
biAqa3ZtaSkKIAogCWlmIChpc192bV9jb21tYW5kKG1zZy0+aWQpKQogCQllcnIgPSBrdm1pX21z
Z19oYW5kbGVfdm1fY21kKGt2bWksIG1zZyk7CisJZWxzZSBpZiAoaXNfdmNwdV9tZXNzYWdlKG1z
Zy0+aWQpKQorCQllcnIgPSBrdm1pX21zZ19oYW5kbGVfdmNwdV9tc2coa3ZtaSwgbXNnLCAmcXVl
dWVkKTsKIAllbHNlCiAJCWVyciA9IGt2bWlfbXNnX3ZtX3JlcGx5X2VjKGt2bWksIG1zZywgLUtW
TV9FTk9TWVMpOwogCi0Ja3ZtaV9tc2dfZnJlZShtc2cpOworCWlmICghcXVldWVkKQorCQlrdm1p
X21zZ19mcmVlKG1zZyk7CiBvdXQ6CiAJcmV0dXJuIGVyciA9PSAwOwogfQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5n
IGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9s
aXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
