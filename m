Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A12FA155E3E
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 19:36:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0EB1A869E2;
	Fri,  7 Feb 2020 18:36:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dio2EJ2REhFU; Fri,  7 Feb 2020 18:36:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 348F6869EC;
	Fri,  7 Feb 2020 18:36:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 15F75C013E;
	Fri,  7 Feb 2020 18:36:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C420DC1D87
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BA4E186DDE
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KCL2xnzdF+EY
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2F52986D2F
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:56 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 DB261305D366; Fri,  7 Feb 2020 20:16:41 +0200 (EET)
Received: from host.bbu.bitdefender.biz (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id CF440305207E;
 Fri,  7 Feb 2020 20:16:41 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v7 72/78] KVM: introspection: add KVMI_EVENT_PF
Date: Fri,  7 Feb 2020 20:16:30 +0200
Message-Id: <20200207181636.1065-73-alazar@bitdefender.com>
In-Reply-To: <20200207181636.1065-1-alazar@bitdefender.com>
References: <20200207181636.1065-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyBldmVudCBp
cyBzZW50IHdoZW4gYSAjUEYgb2NjdXJzIGR1ZSB0byBhIGZhaWxlZCBwZXJtaXNzaW9uIGNoZWNr
CmluIHRoZSBzaGFkb3cgcGFnZSB0YWJsZXMsIGZvciBhIHBhZ2UgaW4gd2hpY2ggdGhlIGludHJv
c3BlY3Rpb24gdG9vbApoYXMgc2hvd24gaW50ZXJlc3QuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaSBE
b27Im3UgPG1kb250dUBiaXRkZWZlbmRlci5jb20+CkNvLWRldmVsb3BlZC1ieTogQWRhbGJlcnQg
TGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgpTaWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBM
YXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi92aXJ0L2t2
bS9rdm1pLnJzdCAgICAgICAgICAgICAgIHwgIDUwICsrKysKIGFyY2gveDg2L2luY2x1ZGUvYXNt
L2t2bWlfaG9zdC5oICAgICAgICAgICAgICB8ICAgMSArCiBhcmNoL3g4Ni9rdm0va3ZtaS5jICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgMjggKysrCiBpbmNsdWRlL3VhcGkvbGludXgva3Zt
aS5oICAgICAgICAgICAgICAgICAgICAgfCAgMTAgKwogLi4uL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2
bS94ODZfNjQva3ZtaV90ZXN0LmMgIHwgIDg1ICsrKysrKysKIHZpcnQva3ZtL2ludHJvc3BlY3Rp
b24va3ZtaS5jICAgICAgICAgICAgICAgICB8IDIyMSArKysrKysrKysrKysrKysrKysKIHZpcnQv
a3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9pbnQuaCAgICAgICAgICAgICB8ICAgNSArCiB2aXJ0L2t2
bS9pbnRyb3NwZWN0aW9uL2t2bWlfbXNnLmMgICAgICAgICAgICAgfCAgMjcgKysrCiA4IGZpbGVz
IGNoYW5nZWQsIDQyNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi92
aXJ0L2t2bS9rdm1pLnJzdCBiL0RvY3VtZW50YXRpb24vdmlydC9rdm0va3ZtaS5yc3QKaW5kZXgg
MTQ3OTAxNzFhMTcwLi43OTk0ZDZlOGNhY2YgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vdmly
dC9rdm0va3ZtaS5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJzdApAQCAt
NTM1LDYgKzUzNSw3IEBAIHRoZSBmb2xsb3dpbmcgZXZlbnRzOjoKIAlLVk1JX0VWRU5UX0RFU0NS
SVBUT1IKIAlLVk1JX0VWRU5UX0hZUEVSQ0FMTAogCUtWTUlfRVZFTlRfTVNSCisJS1ZNSV9FVkVO
VF9QRgogCUtWTUlfRVZFTlRfVFJBUAogCUtWTUlfRVZFTlRfWFNFVEJWCiAKQEAgLTEyNjAsMyAr
MTI2MSw1MiBAQCByZWdpc3RlciAoc2VlICoqS1ZNSV9WQ1BVX0NPTlRST0xfRVZFTlRTKiopLgog
CiBgYGt2bWlfZXZlbnRgYCwgdGhlIE1TUiBudW1iZXIsIHRoZSBvbGQgdmFsdWUgYW5kIHRoZSBu
ZXcgdmFsdWUgYXJlCiBzZW50IHRvIHRoZSBpbnRyb3NwZWN0aW9uIHRvb2wuIFRoZSAqQ09OVElO
VUUqIGFjdGlvbiB3aWxsIHNldCB0aGUgYGBuZXdfdmFsYGAuCisKKzEwLiBLVk1JX0VWRU5UX1BG
CistLS0tLS0tLS0tLS0tLS0tLQorCis6QXJjaGl0ZWN0dXJlczogeDg2Cis6VmVyc2lvbnM6ID49
IDEKKzpBY3Rpb25zOiBDT05USU5VRSwgQ1JBU0gsIFJFVFJZCis6UGFyYW1ldGVyczoKKworOjoK
KworCXN0cnVjdCBrdm1pX2V2ZW50OworCXN0cnVjdCBrdm1pX2V2ZW50X3BmIHsKKwkJX191NjQg
Z3ZhOworCQlfX3U2NCBncGE7CisJCV9fdTggYWNjZXNzOworCQlfX3U4IHBhZGRpbmcxOworCQlf
X3UxNiBwYWRkaW5nMjsKKwkJX191MzIgcGFkZGluZzM7CisJfTsKKworOlJldHVybnM6CisKKzo6
CisKKwlzdHJ1Y3Qga3ZtaV92Y3B1X2hkcjsKKwlzdHJ1Y3Qga3ZtaV9ldmVudF9yZXBseTsKKwor
VGhpcyBldmVudCBpcyBzZW50IHdoZW4gYSBoeXBlcnZpc29yIHBhZ2UgZmF1bHQgb2NjdXJzIGR1
ZSB0byBhIGZhaWxlZAorcGVybWlzc2lvbiBjaGVjayBpbiB0aGUgc2hhZG93IHBhZ2UgdGFibGVz
LCB0aGUgaW50cm9zcGVjdGlvbiBoYXMgYmVlbgorZW5hYmxlZCBmb3IgdGhpcyBldmVudCAoc2Vl
ICpLVk1JX1ZQVUNfQ09OVFJPTF9FVkVOVFMqKSBhbmQgdGhlIGV2ZW50IHdhcworZ2VuZXJhdGVk
IGZvciBhIHBhZ2UgaW4gd2hpY2ggdGhlIGludHJvc3BlY3Rpb24gdG9vbCBoYXMgc2hvd24gaW50
ZXJlc3QKKyhpZS4gaGFzIHByZXZpb3VzbHkgdG91Y2hlZCBpdCBieSBhZGp1c3RpbmcgdGhlIHNw
dGUgcGVybWlzc2lvbnMpLgorCitUaGUgc2hhZG93IHBhZ2UgdGFibGVzIGNhbiBiZSB1c2VkIGJ5
IHRoZSBpbnRyb3NwZWN0aW9uIHRvb2wgdG8gZ3VhcmFudGVlCit0aGUgcHVycG9zZSBvZiBjb2Rl
IGFyZWFzIGluc2lkZSB0aGUgZ3Vlc3QgKGNvZGUsIHJvZGF0YSwgc3RhY2ssIGhlYXAKK2V0Yy4p
IEVhY2ggYXR0ZW1wdCBhdCBhbiBvcGVyYXRpb24gdW5maXR0aW5nIGZvciBhIGNlcnRhaW4gbWVt
b3J5CityYW5nZSAoZWcuIGV4ZWN1dGUgY29kZSBpbiBoZWFwKSB0cmlnZ2VycyBhIHBhZ2UgZmF1
bHQgYW5kIGdpdmVzIHRoZQoraW50cm9zcGVjdGlvbiB0b29sIHRoZSBjaGFuY2UgdG8gYXVkaXQg
dGhlIGNvZGUgYXR0ZW1wdGluZyB0aGUgb3BlcmF0aW9uLgorCitgYGt2bWlfZXZlbnRgYCwgZ3Vl
c3QgdmlydHVhbCBhZGRyZXNzIChvciAweGZmZmZmZmZmL1VOTUFQUEVEX0dWQSksCitndWVzdCBw
aHlzaWNhbCBhZGRyZXNzIGFuZCB0aGUgYWNjZXNzIGZsYWdzIChlZy4gS1ZNSV9QQUdFX0FDQ0VT
U19SKQorYXJlIHNlbnQgdG8gdGhlIGludHJvc3BlY3Rpb24gdG9vbC4KKworVGhlICpDT05USU5V
RSogYWN0aW9uIHdpbGwgY29udGludWUgdGhlIHBhZ2UgZmF1bHQgaGFuZGxpbmcgdmlhIGVtdWxh
dGlvbi4KKworVGhlICpSRVRSWSogYWN0aW9uIGlzIHVzZWQgYnkgdGhlIGludHJvc3BlY3Rpb24g
dG9vbCB0byByZXRyeSB0aGUKK2V4ZWN1dGlvbiBvZiB0aGUgY3VycmVudCBpbnN0cnVjdGlvbiwg
dXN1YWxseSBiZWNhdXNlIGl0IGNoYW5nZWQgdGhlCitpbnN0cnVjdGlvbiBwb2ludGVyIG9yIHRo
ZSBwYWdlIHJlc3RyaWN0aW9ucy4KZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2
bWlfaG9zdC5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtaV9ob3N0LmgKaW5kZXggNWYyNjE0
YWMzYjRjLi4yZTRlZmY1MDFjMGEgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2
bWlfaG9zdC5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bWlfaG9zdC5oCkBAIC0zOSw2
ICszOSw3IEBAIHN0cnVjdCBrdm1fdmNwdV9hcmNoX2ludHJvc3BlY3Rpb24gewogfTsKIAogc3Ry
dWN0IGt2bV9hcmNoX2ludHJvc3BlY3Rpb24geworCXN0cnVjdCBrdm1fcGFnZV90cmFja19ub3Rp
Zmllcl9ub2RlIGtwdG5fbm9kZTsKIH07CiAKICNkZWZpbmUgU0xPVFNfU0laRSBCSVRTX1RPX0xP
TkdTKEtWTV9NRU1fU0xPVFNfTlVNKQpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL2t2bWkuYyBi
L2FyY2gveDg2L2t2bS9rdm1pLmMKaW5kZXggYWU2ZmVmNWE5Yjk1Li40ZThiOGUwYTI5NjEgMTAw
NjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS9rdm1pLmMKKysrIGIvYXJjaC94ODYva3ZtL2t2bWkuYwpA
QCAtMTA3OCwzICsxMDc4LDMxIEBAIGludCBrdm1pX2FyY2hfY21kX3NldF9wYWdlX2FjY2Vzcyhz
dHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2bWksCiAKIAlyZXR1cm4gZWM7CiB9CisKK2Jvb2wg
a3ZtaV9hcmNoX3BmX2V2ZW50KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgZ3BhX3QgZ3BhLCBndmFf
dCBndmEsCisJCQl1OCBhY2Nlc3MpCit7CisJYm9vbCByZXQgPSBmYWxzZTsKKwl1MzIgYWN0aW9u
OworCisJYWN0aW9uID0ga3ZtaV9tc2dfc2VuZF9wZih2Y3B1LCBncGEsIGd2YSwgYWNjZXNzKTsK
KworCXN3aXRjaCAoYWN0aW9uKSB7CisJY2FzZSBLVk1JX0VWRU5UX0FDVElPTl9DT05USU5VRToK
KwkJcmV0ID0gdHJ1ZTsKKwkJYnJlYWs7CisJY2FzZSBLVk1JX0VWRU5UX0FDVElPTl9SRVRSWToK
KwkJYnJlYWs7CisJZGVmYXVsdDoKKwkJa3ZtaV9oYW5kbGVfY29tbW9uX2V2ZW50X2FjdGlvbnMo
dmNwdS0+a3ZtLCBhY3Rpb24sICJQRiIpOworCX0KKworCXJldHVybiByZXQ7Cit9CisKK2Jvb2wg
a3ZtaV9hcmNoX3BmX29mX2ludGVyZXN0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKK3sKKwlyZXR1
cm4ga3ZtX3g4Nl9vcHMtPnNwdF9mYXVsdCh2Y3B1KSAmJgorCSAgICAgICFrdm1feDg2X29wcy0+
Z3B0X3RyYW5zbGF0aW9uX2ZhdWx0KHZjcHUpOworfQorCmRpZmYgLS1naXQgYS9pbmNsdWRlL3Vh
cGkvbGludXgva3ZtaS5oIGIvaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaAppbmRleCA0Yjg0NjJi
ODA1NTMuLmM3NGRlZDA5N2VmYSAxMDA2NDQKLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L2t2bWku
aAorKysgYi9pbmNsdWRlL3VhcGkvbGludXgva3ZtaS5oCkBAIC01Niw2ICs1Niw3IEBAIGVudW0g
ewogCUtWTUlfRVZFTlRfWFNFVEJWICAgICA9IDYsCiAJS1ZNSV9FVkVOVF9ERVNDUklQVE9SID0g
NywKIAlLVk1JX0VWRU5UX01TUiAgICAgICAgPSA4LAorCUtWTUlfRVZFTlRfUEYgICAgICAgICA9
IDksCiAKIAlLVk1JX05VTV9FVkVOVFMKIH07CkBAIC0xODEsNCArMTgyLDEzIEBAIHN0cnVjdCBr
dm1pX2V2ZW50X3JlcGx5IHsKIAlfX3UzMiBwYWRkaW5nMjsKIH07CiAKK3N0cnVjdCBrdm1pX2V2
ZW50X3BmIHsKKwlfX3U2NCBndmE7CisJX191NjQgZ3BhOworCV9fdTggYWNjZXNzOworCV9fdTgg
cGFkZGluZzE7CisJX191MTYgcGFkZGluZzI7CisJX191MzIgcGFkZGluZzM7Cit9OworCiAjZW5k
aWYgLyogX1VBUElfX0xJTlVYX0tWTUlfSCAqLwpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMva3ZtL3g4Nl82NC9rdm1pX3Rlc3QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2t2bS94ODZfNjQva3ZtaV90ZXN0LmMKaW5kZXggYTBiZDU3M2FiMjY0Li5lOGQzY2NhYzFjYWEg
MTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS94ODZfNjQva3ZtaV90ZXN0
LmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3g4Nl82NC9rdm1pX3Rlc3QuYwpA
QCAtNDEsNiArNDEsMTEgQEAgc3RydWN0IHZjcHVfcmVwbHkgewogCXN0cnVjdCBrdm1pX2V2ZW50
X3JlcGx5IHJlcGx5OwogfTsKIAorc3RydWN0IHBmX2V2IHsKKwlzdHJ1Y3Qga3ZtaV9ldmVudCBj
b21tb247CisJc3RydWN0IGt2bWlfZXZlbnRfcGYgcGY7Cit9OworCiBzdHJ1Y3QgdmNwdV93b3Jr
ZXJfZGF0YSB7CiAJc3RydWN0IGt2bV92bSAqdm07CiAJaW50IHZjcHVfaWQ7CkBAIC01MCw2ICs1
NSwxMCBAQCBzdHJ1Y3QgdmNwdV93b3JrZXJfZGF0YSB7CiAJYm9vbCByZXN0YXJ0X29uX3NodXRk
b3duOwogfTsKIAordHlwZWRlZiB2b2lkICgqZmN0X3BmX2V2ZW50KShzdHJ1Y3Qga3ZtX3ZtICp2
bSwgc3RydWN0IGt2bWlfbXNnX2hkciAqaGRyLAorCQkJCXN0cnVjdCBwZl9ldiAqZXYsCisJCQkJ
c3RydWN0IHZjcHVfcmVwbHkgKnJwbCk7CisKIGVudW0gewogCUdVRVNUX1RFU1RfTk9PUCA9IDAs
CiAJR1VFU1RfVEVTVF9CUCwKQEAgLTU3LDYgKzY2LDcgQEAgZW51bSB7CiAJR1VFU1RfVEVTVF9E
RVNDUklQVE9SLAogCUdVRVNUX1RFU1RfSFlQRVJDQUxMLAogCUdVRVNUX1RFU1RfTVNSLAorCUdV
RVNUX1RFU1RfUEYsCiAJR1VFU1RfVEVTVF9YU0VUQlYsCiB9OwogCkBAIC0xMDYsNiArMTE2LDEx
IEBAIHN0YXRpYyB2b2lkIGd1ZXN0X21zcl90ZXN0KHZvaWQpCiAJd3Jtc3IoTVNSX01JU0NfRkVB
VFVSRVNfRU5BQkxFUywgbXNyKTsKIH0KIAorc3RhdGljIHZvaWQgZ3Vlc3RfcGZfdGVzdCh2b2lk
KQoreworCSooKHVpbnQ4X3QgKil0ZXN0X2d2YSkgPSBSRUFEX09OQ0UodGVzdF93cml0ZV9wYXR0
ZXJuKTsKK30KKwogLyogZnJvbSBmcHUvaW50ZXJuYWwuaCAqLwogc3RhdGljIHU2NCB4Z2V0YnYo
dTMyIGluZGV4KQogewpAQCAtMTY2LDYgKzE4MSw5IEBAIHN0YXRpYyB2b2lkIGd1ZXN0X2NvZGUo
dm9pZCkKIAkJY2FzZSBHVUVTVF9URVNUX01TUjoKIAkJCWd1ZXN0X21zcl90ZXN0KCk7CiAJCQli
cmVhazsKKwkJY2FzZSBHVUVTVF9URVNUX1BGOgorCQkJZ3Vlc3RfcGZfdGVzdCgpOworCQkJYnJl
YWs7CiAJCWNhc2UgR1VFU1RfVEVTVF9YU0VUQlY6CiAJCQlndWVzdF94c2V0YnZfdGVzdCgpOwog
CQkJYnJlYWs7CkBAIC0xNTgwLDYgKzE1OTgsMTYgQEAgc3RhdGljIHZvaWQgc2V0X3BhZ2VfYWNj
ZXNzKHN0cnVjdCBrdm1fdm0gKnZtLCBfX3U2NCBncGEsIF9fdTggYWNjZXNzKQogCQlncGEsIGFj
Y2VzcywgLXIsIGt2bV9zdHJlcnJvcigtcikpOwogfQogCitzdGF0aWMgdm9pZCBfX3NldF9wYWdl
X2FjY2VzcyhzdHJ1Y3Qga3ZtX3ZtICp2bSwgX191NjQgZ3BhLCBfX3U4IGFjY2VzcykKK3sKKwlp
bnQgcjsKKworCXIgPSBfX2NtZF9zZXRfcGFnZV9hY2Nlc3Modm0sIDEsICZncGEsICZhY2Nlc3Mp
OworCVRFU1RfQVNTRVJUKHIgPT0gMCwKKwkJIktWTUlfVk1fU0VUX1BBR0VfQUNDRVNTIGZhaWxl
ZCwgZ3BhIDB4JWxseCwgYWNjZXNzIDB4JXgsIGVycm9yICVkICglcylcbiIsCisJCWdwYSwgYWNj
ZXNzLCAtciwga3ZtX3N0cmVycm9yKC1yKSk7Cit9CisKIHN0YXRpYyB2b2lkIHRlc3RfY21kX3Zt
X3NldF9wYWdlX2FjY2VzcyhzdHJ1Y3Qga3ZtX3ZtICp2bSkKIHsKIAlfX3U4IGZ1bGxfYWNjZXNz
ID0gS1ZNSV9QQUdFX0FDQ0VTU19SIHwgS1ZNSV9QQUdFX0FDQ0VTU19XCkBAIC0xNTkyLDYgKzE2
MjAsNjIgQEAgc3RhdGljIHZvaWQgdGVzdF9jbWRfdm1fc2V0X3BhZ2VfYWNjZXNzKHN0cnVjdCBr
dm1fdm0gKnZtKQogCXNldF9wYWdlX2FjY2Vzcyh2bSwgZ3BhLCBmdWxsX2FjY2Vzcyk7CiB9CiAK
K3N0YXRpYyB2b2lkIHRlc3RfcGYoc3RydWN0IGt2bV92bSAqdm0sIGZjdF9wZl9ldmVudCBjYmsp
Cit7CisJX191MTYgZXZlbnRfaWQgPSBLVk1JX0VWRU5UX1BGOworCXN0cnVjdCB2Y3B1X3dvcmtl
cl9kYXRhIGRhdGEgPSB7CisJCS52bSA9IHZtLAorCQkudmNwdV9pZCA9IFZDUFVfSUQsCisJCS50
ZXN0X2lkID0gR1VFU1RfVEVTVF9QRiwKKwl9OworCXN0cnVjdCBrdm1pX21zZ19oZHIgaGRyOwor
CXN0cnVjdCB2Y3B1X3JlcGx5IHJwbCA9IHt9OworCXB0aHJlYWRfdCB2Y3B1X3RocmVhZDsKKwlz
dHJ1Y3QgcGZfZXYgZXY7CisKKwlzZXRfcGFnZV9hY2Nlc3Modm0sIHRlc3RfZ3BhLCBLVk1JX1BB
R0VfQUNDRVNTX1IpOworCisJZW5hYmxlX3ZjcHVfZXZlbnQodm0sIGV2ZW50X2lkKTsKKworCW5l
d190ZXN0X3dyaXRlX3BhdHRlcm4odm0pOworCisJdmNwdV90aHJlYWQgPSBzdGFydF92Y3B1X3dv
cmtlcigmZGF0YSk7CisKKwlyZWNlaXZlX2V2ZW50KCZoZHIsICZldi5jb21tb24sIHNpemVvZihl
diksIGV2ZW50X2lkKTsKKworCURFQlVHKCJQRiBldmVudCwgZ3BhIDB4JWxseCwgZ3ZhIDB4JWxs
eCwgYWNjZXNzIDB4JXhcbiIsCisJCWV2LnBmLmdwYSwgZXYucGYuZ3ZhLCBldi5wZi5hY2Nlc3Mp
OworCisJVEVTVF9BU1NFUlQoZXYucGYuZ3BhID09IHRlc3RfZ3BhICYmIGV2LnBmLmd2YSA9PSB0
ZXN0X2d2YSwKKwkJIlVuZXhwZWN0ZWQgI1BGIGV2ZW50LCBncGEgMHglbGx4IChleHBlbmRlZCAw
eCVsbHgpLCBndmEgMHglbGx4IChleHBlY3RlZCAweCVsbHgpXG4iLAorCQlldi5wZi5ncGEsIHRl
c3RfZ3BhLCBldi5wZi5ndmEsIHRlc3RfZ3ZhKTsKKworCWNiayh2bSwgJmhkciwgJmV2LCAmcnBs
KTsKKworCXN0b3BfdmNwdV93b3JrZXIodmNwdV90aHJlYWQsICZkYXRhKTsKKworCVRFU1RfQVNT
RVJUKCooKHVpbnQ4X3QgKil0ZXN0X2h2YSkgPT0gdGVzdF93cml0ZV9wYXR0ZXJuLAorCQkiV3Jp
dGUgZmFpbGVkLCBleHBlY3RlZCAweCV4LCByZXN1bHQgMHgleFxuIiwKKwkJdGVzdF93cml0ZV9w
YXR0ZXJuLCAqKCh1aW50OF90ICopdGVzdF9odmEpKTsKKworCWRpc2FibGVfdmNwdV9ldmVudCh2
bSwgZXZlbnRfaWQpOworfQorCitzdGF0aWMgdm9pZCBjYmtfdGVzdF9ldmVudF9wZihzdHJ1Y3Qg
a3ZtX3ZtICp2bSwgc3RydWN0IGt2bWlfbXNnX2hkciAqaGRyLAorCQkJCXN0cnVjdCBwZl9ldiAq
ZXYsIHN0cnVjdCB2Y3B1X3JlcGx5ICpycGwpCit7CisJX19zZXRfcGFnZV9hY2Nlc3Modm0sIHRl
c3RfZ3BhLCBLVk1JX1BBR0VfQUNDRVNTX1IKKwkJCQkJfCBLVk1JX1BBR0VfQUNDRVNTX1cpOwor
CisJcmVwbHlfdG9fZXZlbnQoaGRyLCAmZXYtPmNvbW1vbiwgS1ZNSV9FVkVOVF9BQ1RJT05fUkVU
UlksCisJCQlycGwsIHNpemVvZigqcnBsKSk7Cit9CisKK3N0YXRpYyB2b2lkIHRlc3RfZXZlbnRf
cGYoc3RydWN0IGt2bV92bSAqdm0pCit7CisJdGVzdF9wZih2bSwgY2JrX3Rlc3RfZXZlbnRfcGYp
OworfQorCiBzdGF0aWMgdm9pZCB0ZXN0X2ludHJvc3BlY3Rpb24oc3RydWN0IGt2bV92bSAqdm0p
CiB7CiAJc2V0dXBfc29ja2V0KCk7CkBAIC0xNjIyLDYgKzE3MDYsNyBAQCBzdGF0aWMgdm9pZCB0
ZXN0X2ludHJvc3BlY3Rpb24oc3RydWN0IGt2bV92bSAqdm0pCiAJdGVzdF9ldmVudF9kZXNjcmlw
dG9yKHZtKTsKIAl0ZXN0X2NtZF92Y3B1X2NvbnRyb2xfbXNyKHZtKTsKIAl0ZXN0X2NtZF92bV9z
ZXRfcGFnZV9hY2Nlc3Modm0pOworCXRlc3RfZXZlbnRfcGYodm0pOwogCiAJdW5ob29rX2ludHJv
c3BlY3Rpb24odm0pOwogfQpkaWZmIC0tZ2l0IGEvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1p
LmMgYi92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWkuYwppbmRleCA2ZTg4NzM1OTc4YWUuLjEw
ZDU5MDYxZmE4MiAxMDA2NDQKLS0tIGEvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pLmMKKysr
IGIvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pLmMKQEAgLTEzLDYgKzEzLDIxIEBAIGVudW0g
ewogCU1BWF9QQVVTRV9SRVFVRVNUUyA9IDEwMDEKIH07CiAKK3N0YXRpYyBib29sIGt2bWlfdHJh
Y2tfcHJlcmVhZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGdwYV90IGdwYSwgZ3ZhX3QgZ3ZhLAor
CQkJICAgICAgIGludCBieXRlcywKKwkJCSAgICAgICBzdHJ1Y3Qga3ZtX3BhZ2VfdHJhY2tfbm90
aWZpZXJfbm9kZSAqbm9kZSk7CitzdGF0aWMgYm9vbCBrdm1pX3RyYWNrX3ByZXdyaXRlKHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSwgZ3BhX3QgZ3BhLCBndmFfdCBndmEsCisJCQkJY29uc3QgdTggKm5l
dywgaW50IGJ5dGVzLAorCQkJCXN0cnVjdCBrdm1fcGFnZV90cmFja19ub3RpZmllcl9ub2RlICpu
b2RlKTsKK3N0YXRpYyBib29sIGt2bWlfdHJhY2tfcHJlZXhlYyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsIGdwYV90IGdwYSwgZ3ZhX3QgZ3ZhLAorCQkJICAgICAgIHN0cnVjdCBrdm1fcGFnZV90cmFj
a19ub3RpZmllcl9ub2RlICpub2RlKTsKK3N0YXRpYyB2b2lkIGt2bWlfdHJhY2tfY3JlYXRlX3Ns
b3Qoc3RydWN0IGt2bSAqa3ZtLAorCQkJCSAgIHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNsb3Qs
CisJCQkJICAgdW5zaWduZWQgbG9uZyBucGFnZXMsCisJCQkJICAgc3RydWN0IGt2bV9wYWdlX3Ry
YWNrX25vdGlmaWVyX25vZGUgKm5vZGUpOworc3RhdGljIHZvaWQga3ZtaV90cmFja19mbHVzaF9z
bG90KHN0cnVjdCBrdm0gKmt2bSwgc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqc2xvdCwKKwkJCQkg
IHN0cnVjdCBrdm1fcGFnZV90cmFja19ub3RpZmllcl9ub2RlICpub2RlKTsKKwogc3RhdGljIHN0
cnVjdCBrbWVtX2NhY2hlICptc2dfY2FjaGU7CiBzdGF0aWMgc3RydWN0IGttZW1fY2FjaGUgKmpv
Yl9jYWNoZTsKIHN0YXRpYyBzdHJ1Y3Qga21lbV9jYWNoZSAqcmFkaXhfY2FjaGU7CkBAIC0yNDgs
NiArMjYzLDEyIEBAIGFsbG9jX2t2bWkoc3RydWN0IGt2bSAqa3ZtLCBjb25zdCBzdHJ1Y3Qga3Zt
X2ludHJvc3BlY3Rpb25faG9vayAqaG9vaykKIAkJCUdGUF9LRVJORUwgJiB+X19HRlBfRElSRUNU
X1JFQ0xBSU0pOwogCXJ3bG9ja19pbml0KCZrdm1pLT5hY2Nlc3NfdHJlZV9sb2NrKTsKIAorCWt2
bWktPmFyY2gua3B0bl9ub2RlLnRyYWNrX3ByZXJlYWQgPSBrdm1pX3RyYWNrX3ByZXJlYWQ7CisJ
a3ZtaS0+YXJjaC5rcHRuX25vZGUudHJhY2tfcHJld3JpdGUgPSBrdm1pX3RyYWNrX3ByZXdyaXRl
OworCWt2bWktPmFyY2gua3B0bl9ub2RlLnRyYWNrX3ByZWV4ZWMgPSBrdm1pX3RyYWNrX3ByZWV4
ZWM7CisJa3ZtaS0+YXJjaC5rcHRuX25vZGUudHJhY2tfY3JlYXRlX3Nsb3QgPSBrdm1pX3RyYWNr
X2NyZWF0ZV9zbG90OworCWt2bWktPmFyY2gua3B0bl9ub2RlLnRyYWNrX2ZsdXNoX3Nsb3QgPSBr
dm1pX3RyYWNrX2ZsdXNoX3Nsb3Q7CisKIAlrdm1fZm9yX2VhY2hfdmNwdShpLCB2Y3B1LCBrdm0p
IHsKIAkJaW50IGVyciA9IGNyZWF0ZV92Y3B1aSh2Y3B1KTsKIApAQCAtMjc5LDYgKzMwMCw4IEBA
IHN0YXRpYyB2b2lkIF9fa3ZtaV91bmhvb2soc3RydWN0IGt2bSAqa3ZtKQogCXN0cnVjdCBrdm1f
aW50cm9zcGVjdGlvbiAqa3ZtaSA9IEtWTUkoa3ZtKTsKIAogCXdhaXRfZm9yX2NvbXBsZXRpb25f
a2lsbGFibGUoJmt2bS0+a3ZtaV9jb21wbGV0ZSk7CisKKwlrdm1fcGFnZV90cmFja191bnJlZ2lz
dGVyX25vdGlmaWVyKGt2bSwgJmt2bWktPmFyY2gua3B0bl9ub2RlKTsKIAlrdm1pX3NvY2tfcHV0
KGt2bWkpOwogfQogCkBAIC0zMjcsNiArMzUwLDggQEAgc3RhdGljIGludCBfX2t2bWlfaG9vayhz
dHJ1Y3Qga3ZtICprdm0sCiAJaWYgKCFrdm1pX3NvY2tfZ2V0KGt2bWksIGhvb2stPmZkKSkKIAkJ
cmV0dXJuIC1FSU5WQUw7CiAKKwlrdm1fcGFnZV90cmFja19yZWdpc3Rlcl9ub3RpZmllcihrdm0s
ICZrdm1pLT5hcmNoLmtwdG5fbm9kZSk7CisKIAlyZXR1cm4gMDsKIH0KIApAQCAtMTA3NSwzICsx
MTAwLDE5OSBAQCBpbnQga3ZtaV9jbWRfc2V0X3BhZ2VfYWNjZXNzKHN0cnVjdCBrdm1faW50cm9z
cGVjdGlvbiAqa3ZtaSwgdTY0IGdwYSwgdTggYWNjZXNzKQogCiAJcmV0dXJuIGt2bWlfc2V0X2dm
bl9hY2Nlc3Moa3ZtaS0+a3ZtLCBnZm4sIGFjY2Vzcyk7CiB9CisKK3N0YXRpYyBpbnQga3ZtaV9n
ZXRfZ2ZuX2FjY2VzcyhzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2bWksIGNvbnN0IGdmbl90
IGdmbiwKKwkJCSAgICAgICB1OCAqYWNjZXNzKQoreworCXN0cnVjdCBrdm1pX21lbV9hY2Nlc3Mg
Km07CisKKwlyZWFkX2xvY2soJmt2bWktPmFjY2Vzc190cmVlX2xvY2spOworCW0gPSBfX2t2bWlf
Z2V0X2dmbl9hY2Nlc3Moa3ZtaSwgZ2ZuKTsKKwlpZiAobSkKKwkJKmFjY2VzcyA9IG0tPmFjY2Vz
czsKKwlyZWFkX3VubG9jaygma3ZtaS0+YWNjZXNzX3RyZWVfbG9jayk7CisKKwlyZXR1cm4gbSA/
IDAgOiAtMTsKK30KKworc3RhdGljIGJvb2wga3ZtaV9yZXN0cmljdGVkX2FjY2VzcyhzdHJ1Y3Qg
a3ZtX2ludHJvc3BlY3Rpb24gKmt2bWksIGdwYV90IGdwYSwKKwkJCQkgICB1OCBhY2Nlc3MpCit7
CisJdTggYWxsb3dlZF9hY2Nlc3M7CisJaW50IGVycjsKKworCWVyciA9IGt2bWlfZ2V0X2dmbl9h
Y2Nlc3Moa3ZtaSwgZ3BhX3RvX2dmbihncGEpLCAmYWxsb3dlZF9hY2Nlc3MpOworCisJaWYgKGVy
cikKKwkJcmV0dXJuIGZhbHNlOworCisJLyoKKwkgKiBXZSB3YW50IHRvIGJlIG5vdGlmaWVkIG9u
bHkgZm9yIHZpb2xhdGlvbnMgaW52b2x2aW5nIGFjY2VzcworCSAqIGJpdHMgdGhhdCB3ZSd2ZSBz
cGVjaWZpY2FsbHkgY2xlYXJlZAorCSAqLworCWlmIChhY2Nlc3MgJiAofmFsbG93ZWRfYWNjZXNz
KSkKKwkJcmV0dXJuIHRydWU7CisKKwlyZXR1cm4gZmFsc2U7Cit9CisKK3N0YXRpYyBib29sIGlz
X3BmX29mX2ludGVyZXN0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgZ3BhX3QgZ3BhLCB1OCBhY2Nl
c3MpCit7CisJc3RydWN0IGt2bSAqa3ZtID0gdmNwdS0+a3ZtOworCisJaWYgKCFrdm1pX2FyY2hf
cGZfb2ZfaW50ZXJlc3QodmNwdSkpCisJCXJldHVybiBmYWxzZTsKKworCXJldHVybiBrdm1pX3Jl
c3RyaWN0ZWRfYWNjZXNzKEtWTUkoa3ZtKSwgZ3BhLCBhY2Nlc3MpOworfQorCitzdGF0aWMgYm9v
bCBfX2t2bWlfdHJhY2tfcHJlcmVhZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGdwYV90IGdwYSwg
Z3ZhX3QgZ3ZhKQoreworCWlmICghaXNfcGZfb2ZfaW50ZXJlc3QodmNwdSwgZ3BhLCBLVk1JX1BB
R0VfQUNDRVNTX1IpKQorCQlyZXR1cm4gdHJ1ZTsKKworCXJldHVybiBrdm1pX2FyY2hfcGZfZXZl
bnQodmNwdSwgZ3BhLCBndmEsIEtWTUlfUEFHRV9BQ0NFU1NfUik7Cit9CisKK3N0YXRpYyBib29s
IGt2bWlfdHJhY2tfcHJlcmVhZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGdwYV90IGdwYSwgZ3Zh
X3QgZ3ZhLAorCQkJICAgICAgIGludCBieXRlcywKKwkJCSAgICAgICBzdHJ1Y3Qga3ZtX3BhZ2Vf
dHJhY2tfbm90aWZpZXJfbm9kZSAqbm9kZSkKK3sKKwlzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24g
Kmt2bWk7CisJYm9vbCByZXQgPSB0cnVlOworCisJa3ZtaSA9IGt2bWlfZ2V0KHZjcHUtPmt2bSk7
CisJaWYgKCFrdm1pKQorCQlyZXR1cm4gdHJ1ZTsKKworCWlmIChpc19ldmVudF9lbmFibGVkKHZj
cHUsIEtWTUlfRVZFTlRfUEYpKQorCQlyZXQgPSBfX2t2bWlfdHJhY2tfcHJlcmVhZCh2Y3B1LCBn
cGEsIGd2YSk7CisKKwlrdm1pX3B1dCh2Y3B1LT5rdm0pOworCisJcmV0dXJuIHJldDsKK30KKwor
c3RhdGljIGJvb2wgX19rdm1pX3RyYWNrX3ByZXdyaXRlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwg
Z3BhX3QgZ3BhLCBndmFfdCBndmEpCit7CisJaWYgKCFpc19wZl9vZl9pbnRlcmVzdCh2Y3B1LCBn
cGEsIEtWTUlfUEFHRV9BQ0NFU1NfVykpCisJCXJldHVybiB0cnVlOworCisJcmV0dXJuIGt2bWlf
YXJjaF9wZl9ldmVudCh2Y3B1LCBncGEsIGd2YSwgS1ZNSV9QQUdFX0FDQ0VTU19XKTsKK30KKwor
c3RhdGljIGJvb2wga3ZtaV90cmFja19wcmV3cml0ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGdw
YV90IGdwYSwgZ3ZhX3QgZ3ZhLAorCQkJCWNvbnN0IHU4ICpuZXcsIGludCBieXRlcywKKwkJCQlz
dHJ1Y3Qga3ZtX3BhZ2VfdHJhY2tfbm90aWZpZXJfbm9kZSAqbm9kZSkKK3sKKwlzdHJ1Y3Qga3Zt
X2ludHJvc3BlY3Rpb24gKmt2bWk7CisJYm9vbCByZXQgPSB0cnVlOworCisJa3ZtaSA9IGt2bWlf
Z2V0KHZjcHUtPmt2bSk7CisJaWYgKCFrdm1pKQorCQlyZXR1cm4gdHJ1ZTsKKworCWlmIChpc19l
dmVudF9lbmFibGVkKHZjcHUsIEtWTUlfRVZFTlRfUEYpKQorCQlyZXQgPSBfX2t2bWlfdHJhY2tf
cHJld3JpdGUodmNwdSwgZ3BhLCBndmEpOworCisJa3ZtaV9wdXQodmNwdS0+a3ZtKTsKKworCXJl
dHVybiByZXQ7Cit9CisKK3N0YXRpYyBib29sIF9fa3ZtaV90cmFja19wcmVleGVjKHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSwgZ3BhX3QgZ3BhLCBndmFfdCBndmEpCit7CisJaWYgKCFpc19wZl9vZl9p
bnRlcmVzdCh2Y3B1LCBncGEsIEtWTUlfUEFHRV9BQ0NFU1NfWCkpCisJCXJldHVybiB0cnVlOwor
CisJcmV0dXJuIGt2bWlfYXJjaF9wZl9ldmVudCh2Y3B1LCBncGEsIGd2YSwgS1ZNSV9QQUdFX0FD
Q0VTU19YKTsKK30KKworc3RhdGljIGJvb2wga3ZtaV90cmFja19wcmVleGVjKHN0cnVjdCBrdm1f
dmNwdSAqdmNwdSwgZ3BhX3QgZ3BhLCBndmFfdCBndmEsCisJCQkgICAgICAgc3RydWN0IGt2bV9w
YWdlX3RyYWNrX25vdGlmaWVyX25vZGUgKm5vZGUpCit7CisJc3RydWN0IGt2bV9pbnRyb3NwZWN0
aW9uICprdm1pOworCWJvb2wgcmV0ID0gdHJ1ZTsKKworCWt2bWkgPSBrdm1pX2dldCh2Y3B1LT5r
dm0pOworCWlmICgha3ZtaSkKKwkJcmV0dXJuIHRydWU7CisKKwlpZiAoaXNfZXZlbnRfZW5hYmxl
ZCh2Y3B1LCBLVk1JX0VWRU5UX1BGKSkKKwkJcmV0ID0gX19rdm1pX3RyYWNrX3ByZWV4ZWModmNw
dSwgZ3BhLCBndmEpOworCisJa3ZtaV9wdXQodmNwdS0+a3ZtKTsKKworCXJldHVybiByZXQ7Cit9
CisKK3N0YXRpYyB2b2lkIGt2bWlfdHJhY2tfY3JlYXRlX3Nsb3Qoc3RydWN0IGt2bSAqa3ZtLAor
CQkJCSAgIHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNsb3QsCisJCQkJICAgdW5zaWduZWQgbG9u
ZyBucGFnZXMsCisJCQkJICAgc3RydWN0IGt2bV9wYWdlX3RyYWNrX25vdGlmaWVyX25vZGUgKm5v
ZGUpCit7CisJc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uICprdm1pOworCWdmbl90IHN0YXJ0ID0g
c2xvdC0+YmFzZV9nZm47CisJY29uc3QgZ2ZuX3QgZW5kID0gc3RhcnQgKyBucGFnZXM7CisJaW50
IGlkeDsKKworCWt2bWkgPSBrdm1pX2dldChrdm0pOworCWlmICgha3ZtaSkKKwkJcmV0dXJuOwor
CisJaWR4ID0gc3JjdV9yZWFkX2xvY2soJmt2bS0+c3JjdSk7CisJc3Bpbl9sb2NrKCZrdm0tPm1t
dV9sb2NrKTsKKwlyZWFkX2xvY2soJmt2bWktPmFjY2Vzc190cmVlX2xvY2spOworCisJd2hpbGUg
KHN0YXJ0IDwgZW5kKSB7CisJCXN0cnVjdCBrdm1pX21lbV9hY2Nlc3MgKm07CisKKwkJbSA9IF9f
a3ZtaV9nZXRfZ2ZuX2FjY2Vzcyhrdm1pLCBzdGFydCk7CisJCWlmIChtKQorCQkJa3ZtaV9hcmNo
X3VwZGF0ZV9wYWdlX3RyYWNraW5nKGt2bSwgc2xvdCwgbSk7CisJCXN0YXJ0Kys7CisJfQorCisJ
cmVhZF91bmxvY2soJmt2bWktPmFjY2Vzc190cmVlX2xvY2spOworCXNwaW5fdW5sb2NrKCZrdm0t
Pm1tdV9sb2NrKTsKKwlzcmN1X3JlYWRfdW5sb2NrKCZrdm0tPnNyY3UsIGlkeCk7CisKKwlrdm1p
X3B1dChrdm0pOworfQorCitzdGF0aWMgdm9pZCBrdm1pX3RyYWNrX2ZsdXNoX3Nsb3Qoc3RydWN0
IGt2bSAqa3ZtLCBzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICpzbG90LAorCQkJCSAgc3RydWN0IGt2
bV9wYWdlX3RyYWNrX25vdGlmaWVyX25vZGUgKm5vZGUpCit7CisJc3RydWN0IGt2bV9pbnRyb3Nw
ZWN0aW9uICprdm1pOworCWdmbl90IHN0YXJ0ID0gc2xvdC0+YmFzZV9nZm47CisJY29uc3QgZ2Zu
X3QgZW5kID0gc3RhcnQgKyBzbG90LT5ucGFnZXM7CisJaW50IGlkeDsKKworCWt2bWkgPSBrdm1p
X2dldChrdm0pOworCWlmICgha3ZtaSkKKwkJcmV0dXJuOworCisJaWR4ID0gc3JjdV9yZWFkX2xv
Y2soJmt2bS0+c3JjdSk7CisJc3Bpbl9sb2NrKCZrdm0tPm1tdV9sb2NrKTsKKwl3cml0ZV9sb2Nr
KCZrdm1pLT5hY2Nlc3NfdHJlZV9sb2NrKTsKKworCXdoaWxlIChzdGFydCA8IGVuZCkgeworCQlz
dHJ1Y3Qga3ZtaV9tZW1fYWNjZXNzICptOworCisJCW0gPSBfX2t2bWlfZ2V0X2dmbl9hY2Nlc3Mo
a3ZtaSwgc3RhcnQpOworCQlpZiAobSkgeworCQkJdTggcHJldl9hY2Nlc3MgPSBtLT5hY2Nlc3M7
CisKKwkJCW0tPmFjY2VzcyA9IGZ1bGxfYWNjZXNzOworCQkJa3ZtaV9hcmNoX3VwZGF0ZV9wYWdl
X3RyYWNraW5nKGt2bSwgc2xvdCwgbSk7CisJCQltLT5hY2Nlc3MgPSBwcmV2X2FjY2VzczsKKwkJ
fQorCQlzdGFydCsrOworCX0KKworCXdyaXRlX3VubG9jaygma3ZtaS0+YWNjZXNzX3RyZWVfbG9j
ayk7CisJc3Bpbl91bmxvY2soJmt2bS0+bW11X2xvY2spOworCXNyY3VfcmVhZF91bmxvY2soJmt2
bS0+c3JjdSwgaWR4KTsKKworCWt2bWlfcHV0KGt2bSk7Cit9CmRpZmYgLS1naXQgYS92aXJ0L2t2
bS9pbnRyb3NwZWN0aW9uL2t2bWlfaW50LmggYi92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlf
aW50LmgKaW5kZXggYTgxZTQwMGVhYjE3Li4yM2EwODhhZmUwNzIgMTAwNjQ0Ci0tLSBhL3ZpcnQv
a3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9pbnQuaAorKysgYi92aXJ0L2t2bS9pbnRyb3NwZWN0aW9u
L2t2bWlfaW50LmgKQEAgLTI5LDYgKzI5LDcgQEAKIAkJCSAgfCBCSVQoS1ZNSV9FVkVOVF9NU1Ip
IFwKIAkJCSAgfCBCSVQoS1ZNSV9FVkVOVF9UUkFQKSBcCiAJCQkgIHwgQklUKEtWTUlfRVZFTlRf
UEFVU0VfVkNQVSkgXAorCQkJICB8IEJJVChLVk1JX0VWRU5UX1BGKSBcCiAJCQkgIHwgQklUKEtW
TUlfRVZFTlRfWFNFVEJWKSBcCiAJCSkKIApAQCAtOTAsNiArOTEsNyBAQCB1MzIga3ZtaV9tc2df
c2VuZF92Y3B1X3BhdXNlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7CiB1MzIga3ZtaV9tc2dfc2Vu
ZF9oeXBlcmNhbGwoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIHUzMiBrdm1pX21zZ19zZW5kX2Jw
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdTY0IGdwYSwgdTggaW5zbl9sZW4pOwogdTMyIGt2bWlf
bXNnX3NlbmRfZGVzY3JpcHRvcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHU4IGRlc2NyaXB0b3Is
IHU4IHdyaXRlKTsKK3UzMiBrdm1pX21zZ19zZW5kX3BmKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwg
dTY0IGdwYSwgdTY0IGd2YSwgdTggYWNjZXNzKTsKIAogLyoga3ZtaS5jICovCiB2b2lkICprdm1p
X21zZ19hbGxvYyh2b2lkKTsKQEAgLTE2Miw1ICsxNjQsOCBAQCB2b2lkIGt2bWlfYXJjaF91cGRh
dGVfcGFnZV90cmFja2luZyhzdHJ1Y3Qga3ZtICprdm0sCiBpbnQga3ZtaV9hcmNoX2NtZF9zZXRf
cGFnZV9hY2Nlc3Moc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uICprdm1pLAogCQkJCSAgY29uc3Qg
c3RydWN0IGt2bWlfbXNnX2hkciAqbXNnLAogCQkJCSAgY29uc3Qgc3RydWN0IGt2bWlfdm1fc2V0
X3BhZ2VfYWNjZXNzICpyZXEpOworYm9vbCBrdm1pX2FyY2hfcGZfZXZlbnQoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LCBncGFfdCBncGEsIGd2YV90IGd2YSwKKwkJCXU4IGFjY2Vzcyk7Citib29sIGt2
bWlfYXJjaF9wZl9vZl9pbnRlcmVzdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogCiAjZW5kaWYK
ZGlmZiAtLWdpdCBhL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9tc2cuYyBiL3ZpcnQva3Zt
L2ludHJvc3BlY3Rpb24va3ZtaV9tc2cuYwppbmRleCBmZDdjOTk5MzI5NmYuLjQ5ZjQ5ZjI0MDFi
YyAxMDA2NDQKLS0tIGEvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX21zZy5jCisrKyBiL3Zp
cnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9tc2cuYwpAQCAtMTA3MiwzICsxMDcyLDMwIEBAIHUz
MiBrdm1pX21zZ19zZW5kX2Rlc2NyaXB0b3Ioc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1OCBkZXNj
cmlwdG9yLCB1OCB3cml0ZSkKIAogCXJldHVybiBhY3Rpb247CiB9CisKK3UzMiBrdm1pX21zZ19z
ZW5kX3BmKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdTY0IGdwYSwgdTY0IGd2YSwgdTggYWNjZXNz
KQoreworCXN0cnVjdCBrdm1pX2V2ZW50X3BmIGU7CisJaW50IGVyciwgYWN0aW9uOworCisJbWVt
c2V0KCZlLCAwLCBzaXplb2YoZSkpOworCWUuZ3BhID0gZ3BhOworCWUuZ3ZhID0gZ3ZhOworCWUu
YWNjZXNzID0gYWNjZXNzOworCisJZXJyID0ga3ZtaV9zZW5kX2V2ZW50KHZjcHUsIEtWTUlfRVZF
TlRfUEYsICZlLCBzaXplb2YoZSksCisJCQkgICAgICBOVUxMLCAwLCAmYWN0aW9uKTsKKwlpZiAo
ZXJyKQorCQlyZXR1cm4gS1ZNSV9FVkVOVF9BQ1RJT05fQ09OVElOVUU7CisKKwlpZiAoZS5wYWRk
aW5nMSB8fCBlLnBhZGRpbmcyIHx8IGUucGFkZGluZzMpIHsKKwkJc3RydWN0IGt2bV9pbnRyb3Nw
ZWN0aW9uICprdm1pID0gS1ZNSSh2Y3B1LT5rdm0pOworCisJCWt2bWlfZXJyKGt2bWksICIlczog
bm9uIHplcm8gcGFkZGluZyAldSwldVxuIiwKKwkJCV9fZnVuY19fLCBlLnBhZGRpbmcxLCBlLnBh
ZGRpbmcyKTsKKwkJa3ZtaV9zb2NrX3NodXRkb3duKGt2bWkpOworCQlyZXR1cm4gS1ZNSV9FVkVO
VF9BQ1RJT05fQ09OVElOVUU7CisJfQorCisJcmV0dXJuIGFjdGlvbjsKK30KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGlu
ZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8v
bGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
