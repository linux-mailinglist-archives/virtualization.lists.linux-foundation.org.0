Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id AABAD42453F
	for <lists.virtualization@lfdr.de>; Wed,  6 Oct 2021 19:50:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 069E560F08;
	Wed,  6 Oct 2021 17:50:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O1PeeoVn5UPB; Wed,  6 Oct 2021 17:50:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B31D360EEF;
	Wed,  6 Oct 2021 17:50:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 32FE3C0026;
	Wed,  6 Oct 2021 17:50:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F937C0011
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 17:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36EAA405CD
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 17:50:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HUxHP-2-wXm2
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 17:50:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 45C9A405D5
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 17:50:42 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 AB9B1307CAFC; Wed,  6 Oct 2021 20:31:10 +0300 (EEST)
Received: from localhost (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 938CF305FFA0;
 Wed,  6 Oct 2021 20:31:10 +0300 (EEST)
X-Is-Junk-Enabled: fGZTSsP0qEJE2AIKtlSuFiRRwg9xyHmJ
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v12 41/77] KVM: introspection: add a jobs list to every
 introspected vCPU
Date: Wed,  6 Oct 2021 20:30:37 +0300
Message-Id: <20211006173113.26445-42-alazar@bitdefender.com>
In-Reply-To: <20211006173113.26445-1-alazar@bitdefender.com>
References: <20211006173113.26445-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wanpeng Li <wanpengli@tencent.com>,
 =?UTF-8?q?Nicu=C8=99or=20C=C3=AE=C8=9Bu?= <nicu.citu@icloud.com>,
 Sean Christopherson <seanjc@google.com>, Joerg Roedel <joro@8bytes.org>,
 virtualization@lists.linux-foundation.org,
 =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Mathieu Tarral <mathieu.tarral@protonmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jim Mattson <jmattson@google.com>
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

RXZlcnkgdkNQVSBoYXMgYSBsb2NrLXByb3RlY3RlZCBsaXN0IGluIHdoaWNoIHRoZSByZWNlaXZp
bmcgdGhyZWFkCnBsYWNlcyB0aGUgam9icyB0aGF0IGhhcyB0byBiZSBkb25lIGJ5IHRoZSB2Q1BV
IHRocmVhZApvbmNlIGl0IGlzIGtpY2tlZCBvdXQgb2YgZ3Vlc3QgKEtWTV9SRVFfSU5UUk9TUEVD
VElPTikuCgpDby1kZXZlbG9wZWQtYnk6IE5pY3XImW9yIEPDrsibdSA8bmljdS5jaXR1QGljbG91
ZC5jb20+ClNpZ25lZC1vZmYtYnk6IE5pY3XImW9yIEPDrsibdSA8bmljdS5jaXR1QGljbG91ZC5j
b20+ClNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJpdGRlZmVuZGVyLmNv
bT4KLS0tCiBpbmNsdWRlL2xpbnV4L2t2bWlfaG9zdC5oICAgICAgICAgfCAxMCArKysrKwogdmly
dC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pLmMgICAgIHwgNzIgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLQogdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX2ludC5oIHwgIDEgKwogMyBm
aWxlcyBjaGFuZ2VkLCA4MSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgva3ZtaV9ob3N0LmggYi9pbmNsdWRlL2xpbnV4L2t2bWlfaG9zdC5o
CmluZGV4IDliMDAwOGM2NjMyMS4uYjM4NzQ0MTk1MTFkIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xp
bnV4L2t2bWlfaG9zdC5oCisrKyBiL2luY2x1ZGUvbGludXgva3ZtaV9ob3N0LmgKQEAgLTYsOCAr
NiwxOCBAQAogCiAjaW5jbHVkZSA8YXNtL2t2bWlfaG9zdC5oPgogCitzdHJ1Y3Qga3ZtaV9qb2Ig
eworCXN0cnVjdCBsaXN0X2hlYWQgbGluazsKKwl2b2lkICpjdHg7CisJdm9pZCAoKmZjdCkoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1LCB2b2lkICpjdHgpOworCXZvaWQgKCpmcmVlX2ZjdCkodm9pZCAq
Y3R4KTsKK307CisKIHN0cnVjdCBrdm1fdmNwdV9pbnRyb3NwZWN0aW9uIHsKIAlzdHJ1Y3Qga3Zt
X3ZjcHVfYXJjaF9pbnRyb3NwZWN0aW9uIGFyY2g7CisKKwlzdHJ1Y3QgbGlzdF9oZWFkIGpvYl9s
aXN0OworCXNwaW5sb2NrX3Qgam9iX2xvY2s7CiB9OwogCiBzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rp
b24gewpkaWZmIC0tZ2l0IGEvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pLmMgYi92aXJ0L2t2
bS9pbnRyb3NwZWN0aW9uL2t2bWkuYwppbmRleCA0OTJhMjk5ODc5NjUuLmU4ZDJkMjgwZmI0MyAx
MDA2NDQKLS0tIGEvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pLmMKKysrIGIvdmlydC9rdm0v
aW50cm9zcGVjdGlvbi9rdm1pLmMKQEAgLTIzLDYgKzIzLDcgQEAgc3RhdGljIERFQ0xBUkVfQklU
TUFQKEt2bWlfa25vd25fdm1fZXZlbnRzLCBLVk1JX05VTV9FVkVOVFMpOwogc3RhdGljIERFQ0xB
UkVfQklUTUFQKEt2bWlfa25vd25fdmNwdV9ldmVudHMsIEtWTUlfTlVNX0VWRU5UUyk7CiAKIHN0
YXRpYyBzdHJ1Y3Qga21lbV9jYWNoZSAqbXNnX2NhY2hlOworc3RhdGljIHN0cnVjdCBrbWVtX2Nh
Y2hlICpqb2JfY2FjaGU7CiAKIHZvaWQgKmt2bWlfbXNnX2FsbG9jKHZvaWQpCiB7CkBAIC0zOSwx
NCArNDAsMTkgQEAgc3RhdGljIHZvaWQga3ZtaV9jYWNoZV9kZXN0cm95KHZvaWQpCiB7CiAJa21l
bV9jYWNoZV9kZXN0cm95KG1zZ19jYWNoZSk7CiAJbXNnX2NhY2hlID0gTlVMTDsKKwlrbWVtX2Nh
Y2hlX2Rlc3Ryb3koam9iX2NhY2hlKTsKKwlqb2JfY2FjaGUgPSBOVUxMOwogfQogCiBzdGF0aWMg
aW50IGt2bWlfY2FjaGVfY3JlYXRlKHZvaWQpCiB7CiAJbXNnX2NhY2hlID0ga21lbV9jYWNoZV9j
cmVhdGUoImt2bWlfbXNnIiwgS1ZNSV9NU0dfU0laRV9BTExPQywKIAkJCQkgICAgICA0MDk2LCBT
TEFCX0FDQ09VTlQsIE5VTEwpOworCWpvYl9jYWNoZSA9IGttZW1fY2FjaGVfY3JlYXRlKCJrdm1p
X2pvYiIsCisJCQkJICAgICAgc2l6ZW9mKHN0cnVjdCBrdm1pX2pvYiksCisJCQkJICAgICAgMCwg
U0xBQl9BQ0NPVU5ULCBOVUxMKTsKIAotCWlmICghbXNnX2NhY2hlKSB7CisJaWYgKCFtc2dfY2Fj
aGUgfHwgIWpvYl9jYWNoZSkgewogCQlrdm1pX2NhY2hlX2Rlc3Ryb3koKTsKIAogCQlyZXR1cm4g
LTE7CkBAIC0xMTgsNiArMTI0LDQ4IEBAIHZvaWQga3ZtaV91bmluaXQodm9pZCkKIAlrdm1pX2Nh
Y2hlX2Rlc3Ryb3koKTsKIH0KIAorc3RhdGljIGludCBfX2t2bWlfYWRkX2pvYihzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUsCisJCQkgIHZvaWQgKCpmY3QpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdm9p
ZCAqY3R4KSwKKwkJCSAgdm9pZCAqY3R4LCB2b2lkICgqZnJlZV9mY3QpKHZvaWQgKmN0eCkpCit7
CisJc3RydWN0IGt2bV92Y3B1X2ludHJvc3BlY3Rpb24gKnZjcHVpID0gVkNQVUkodmNwdSk7CisJ
c3RydWN0IGt2bWlfam9iICpqb2I7CisKKwlqb2IgPSBrbWVtX2NhY2hlX3phbGxvYyhqb2JfY2Fj
aGUsIEdGUF9LRVJORUwpOworCWlmICh1bmxpa2VseSgham9iKSkKKwkJcmV0dXJuIC1FTk9NRU07
CisKKwlJTklUX0xJU1RfSEVBRCgmam9iLT5saW5rKTsKKwlqb2ItPmZjdCA9IGZjdDsKKwlqb2It
PmN0eCA9IGN0eDsKKwlqb2ItPmZyZWVfZmN0ID0gZnJlZV9mY3Q7CisKKwlzcGluX2xvY2soJnZj
cHVpLT5qb2JfbG9jayk7CisJbGlzdF9hZGRfdGFpbCgmam9iLT5saW5rLCAmdmNwdWktPmpvYl9s
aXN0KTsKKwlzcGluX3VubG9jaygmdmNwdWktPmpvYl9sb2NrKTsKKworCXJldHVybiAwOworfQor
CitpbnQga3ZtaV9hZGRfam9iKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKKwkJIHZvaWQgKCpmY3Qp
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdm9pZCAqY3R4KSwKKwkJIHZvaWQgKmN0eCwgdm9pZCAo
KmZyZWVfZmN0KSh2b2lkICpjdHgpKQoreworCWludCBlcnI7CisKKwllcnIgPSBfX2t2bWlfYWRk
X2pvYih2Y3B1LCBmY3QsIGN0eCwgZnJlZV9mY3QpOworCisJcmV0dXJuIGVycjsKK30KKworc3Rh
dGljIHZvaWQga3ZtaV9mcmVlX2pvYihzdHJ1Y3Qga3ZtaV9qb2IgKmpvYikKK3sKKwlpZiAoam9i
LT5mcmVlX2ZjdCkKKwkJam9iLT5mcmVlX2ZjdChqb2ItPmN0eCk7CisKKwlrbWVtX2NhY2hlX2Zy
ZWUoam9iX2NhY2hlLCBqb2IpOworfQorCiBzdGF0aWMgYm9vbCBrdm1pX2FsbG9jX3ZjcHVpKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSkKIHsKIAlzdHJ1Y3Qga3ZtX3ZjcHVfaW50cm9zcGVjdGlvbiAq
dmNwdWk7CkBAIC0xMjYsNiArMTc0LDkgQEAgc3RhdGljIGJvb2wga3ZtaV9hbGxvY192Y3B1aShz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAJaWYgKCF2Y3B1aSkKIAkJcmV0dXJuIGZhbHNlOwogCisJ
SU5JVF9MSVNUX0hFQUQoJnZjcHVpLT5qb2JfbGlzdCk7CisJc3Bpbl9sb2NrX2luaXQoJnZjcHVp
LT5qb2JfbG9jayk7CisKIAl2Y3B1LT5rdm1pID0gdmNwdWk7CiAKIAlyZXR1cm4gdHJ1ZTsKQEAg
LTEzOSw5ICsxOTAsMjYgQEAgc3RhdGljIGludCBrdm1pX2NyZWF0ZV92Y3B1aShzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUpCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyB2b2lkIGt2bWlfZnJlZV92Y3B1
X2pvYnMoc3RydWN0IGt2bV92Y3B1X2ludHJvc3BlY3Rpb24gKnZjcHVpKQoreworCXN0cnVjdCBr
dm1pX2pvYiAqY3VyLCAqbmV4dDsKKworCWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShjdXIsIG5l
eHQsICZ2Y3B1aS0+am9iX2xpc3QsIGxpbmspIHsKKwkJbGlzdF9kZWwoJmN1ci0+bGluayk7CisJ
CWt2bWlfZnJlZV9qb2IoY3VyKTsKKwl9Cit9CisKIHN0YXRpYyB2b2lkIGt2bWlfZnJlZV92Y3B1
aShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiB7Ci0Ja2ZyZWUodmNwdS0+a3ZtaSk7CisJc3RydWN0
IGt2bV92Y3B1X2ludHJvc3BlY3Rpb24gKnZjcHVpID0gVkNQVUkodmNwdSk7CisKKwlpZiAoIXZj
cHVpKQorCQlyZXR1cm47CisKKwlrdm1pX2ZyZWVfdmNwdV9qb2JzKHZjcHVpKTsKKworCWtmcmVl
KHZjcHVpKTsKIAl2Y3B1LT5rdm1pID0gTlVMTDsKIH0KIApkaWZmIC0tZ2l0IGEvdmlydC9rdm0v
aW50cm9zcGVjdGlvbi9rdm1pX2ludC5oIGIvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX2lu
dC5oCmluZGV4IGI3Yzg3MzBlN2U2ZC4uYzNhYTEyNTU0YzJiIDEwMDY0NAotLS0gYS92aXJ0L2t2
bS9pbnRyb3NwZWN0aW9uL2t2bWlfaW50LmgKKysrIGIvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9r
dm1pX2ludC5oCkBAIC03LDYgKzcsNyBAQAogI2luY2x1ZGUgPHVhcGkvbGludXgva3ZtaS5oPgog
CiAjZGVmaW5lIEtWTUkoa3ZtKSAoKGt2bSktPmt2bWkpCisjZGVmaW5lIFZDUFVJKHZjcHUpICgo
dmNwdSktPmt2bWkpCiAvKgogICogVGhpcyBsaW1pdCBpcyB1c2VkIHRvIGFjY29tbW9kYXRlIHRo
ZSBsYXJnZXN0IGtub3duIGZpeGVkLWxlbmd0aAogICogbWVzc2FnZS4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBs
aXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
