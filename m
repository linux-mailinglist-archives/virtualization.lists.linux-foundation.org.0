Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F931978C2
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 12:20:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 76D2C86A51;
	Mon, 30 Mar 2020 10:19:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lhKJZQTUYJnm; Mon, 30 Mar 2020 10:19:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A65D986A56;
	Mon, 30 Mar 2020 10:19:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7711FC1D87;
	Mon, 30 Mar 2020 10:19:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 87186C07FF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 743A386A27
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:19:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wd2U4iVCH6JS
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:19:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 55D6786A11
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:19:50 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 5182A30644AC; Mon, 30 Mar 2020 13:12:55 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 1E59D305B7A0;
 Mon, 30 Mar 2020 13:12:55 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v8 42/81] KVM: introspection: add KVMI_GET_VERSION
Date: Mon, 30 Mar 2020 13:12:29 +0300
Message-Id: <20200330101308.21702-43-alazar@bitdefender.com>
In-Reply-To: <20200330101308.21702-1-alazar@bitdefender.com>
References: <20200330101308.21702-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>, virtualization@lists.linux-foundation.org
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

VGhpcyBjb21tYW5kIGlzIHVzZWQgdG8gaWRlbnRpZnkgdGhlIGNvbW1hbmRzL2V2ZW50cyBzdXBw
b3J0ZWQKYnkgdGhlIGludHJvc3BlY3Rpb24gc3Vic3lzdGVtIGFuZCBpdCBpcyBhbHdheXMgYWxs
b3dlZC4KQW55IGF0dGVtcHQgZnJvbSB1c2Vyc3BhY2UgdG8gZXhwbGljaXRseSBkaXNhbGxvdyB0
aGlzIGNvbW1hbmQgdGhyb3VnaAp0aGUgS1ZNX0lOVFJPU1BFQ1RJT05fQ09NTUFORCBpb2N0bCB3
aWxsIGdldCAtRVBFUk0sIHVubGVzcyB1c2Vyc3BhY2UKZGlzYWJsZXMgYWxsIGNvbW1hbmRzLCB1
c2luZyBpZD0tMSwgaW4gd2hpY2ggY2FzZSBLVk1JX0dFVF9WRVJTSU9OIGlzCnNpbGVudGx5IGFs
bG93ZWQsIHdpdGhvdXQgZXJyb3IuCgpTaWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFs
YXphckBiaXRkZWZlbmRlci5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJz
dCAgICAgICAgICAgICAgIHwgMzUgKysrKysrKysrKysrKysrKysrKwogaW5jbHVkZS91YXBpL2xp
bnV4L2t2bWkuaCAgICAgICAgICAgICAgICAgICAgIHwgMTAgKysrKysrCiAuLi4vdGVzdGluZy9z
ZWxmdGVzdHMva3ZtL3g4Nl82NC9rdm1pX3Rlc3QuYyAgfCAyNSArKysrKysrKysrKysrCiB2aXJ0
L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWkuYyAgICAgICAgICAgICAgICAgfCAyNyArKysrKysrKysr
Ky0tLQogdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX21zZy5jICAgICAgICAgICAgIHwgMTIg
KysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCAxMDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2t2bWkucnN0IGIvRG9jdW1l
bnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJzdAppbmRleCBlZmRlNGI3NzE1ODYuLmQ4NDhlNTZmNDJl
OSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJzdAorKysgYi9Eb2N1
bWVudGF0aW9uL3ZpcnQva3ZtL2t2bWkucnN0CkBAIC0yMjMsMyArMjIzLDM4IEBAIGRldmljZS1z
cGVjaWZpYyBtZW1vcnkgKERNQSwgZW11bGF0ZWQgTU1JTywgcmVzZXJ2ZWQgYnkgYSBwYXNzdGhy
b3VnaAogZGV2aWNlIGV0Yy4pLiBJdCBpcyB1cCB0byB0aGUgdXNlciB0byBkZXRlcm1pbmUsIHVz
aW5nIHRoZSBndWVzdCBvcGVyYXRpbmcKIHN5c3RlbSBkYXRhIHN0cnVjdHVyZXMsIHRoZSBhcmVh
cyB0aGF0IGFyZSBzYWZlIHRvIGFjY2VzcyAoY29kZSwgc3RhY2ssIGhlYXAKIGV0Yy4pLgorCitD
b21tYW5kcworLS0tLS0tLS0KKworVGhlIGZvbGxvd2luZyBDIHN0cnVjdHVyZXMgYXJlIG1lYW50
IHRvIGJlIHVzZWQgZGlyZWN0bHkgd2hlbiBjb21tdW5pY2F0aW5nCitvdmVyIHRoZSB3aXJlLiBU
aGUgcGVlciB0aGF0IGRldGVjdHMgYW55IHNpemUgbWlzbWF0Y2ggc2hvdWxkIHNpbXBseSBjbG9z
ZQordGhlIGNvbm5lY3Rpb24gYW5kIHJlcG9ydCB0aGUgZXJyb3IuCisKKzEuIEtWTUlfR0VUX1ZF
UlNJT04KKy0tLS0tLS0tLS0tLS0tLS0tLS0KKworOkFyY2hpdGVjdHVyZXM6IGFsbAorOlZlcnNp
b25zOiA+PSAxCis6UGFyYW1ldGVyczogbm9uZQorOlJldHVybnM6CisKKzo6CisKKwlzdHJ1Y3Qg
a3ZtaV9lcnJvcl9jb2RlOworCXN0cnVjdCBrdm1pX2dldF92ZXJzaW9uX3JlcGx5IHsKKwkJX191
MzIgdmVyc2lvbjsKKwkJX191MzIgcGFkZGluZzsKKwl9OworCitSZXR1cm5zIHRoZSBpbnRyb3Nw
ZWN0aW9uIEFQSSB2ZXJzaW9uLgorCitUaGlzIGNvbW1hbmQgaXMgYWx3YXlzIGFsbG93ZWQgYW5k
IHN1Y2Nlc3NmdWwgKGlmIHRoZSBpbnRyb3NwZWN0aW9uIGlzCitidWlsdCBpbiBrZXJuZWwpLgor
CitUaGUgdXNlcnNwYWNlIHNob3VsZCB1c2UgdGhpcyBjb21tYW5kIHRvIGlkZW50aWZ5IHRoZSBj
b21tYW5kcy9ldmVudHMKK3N1cHBvcnRlZCBieSB0aGUga2VybmVsIHNpZGUgYW5kIHdoYXQgbWVz
c2FnZXMgbXVzdCBiZSB1c2VkIGZvciBldmVudAorcmVwbGllcy4gVGhlc2UgbWVzc2FnZXMgbWln
aHQgYmUgZXh0ZW5kZWQgaW4gZnV0dXJlcyB2ZXJzaW9ucyBhbmQgd2hpbGUKK3RoZSBrZXJuZWwg
d2lsbCBhY2NlcHQgc2hvcnRlciBtZXNzYWdlcyAob2xkZXIgdmVyc2lvbnMpIG9yIGJpZ2dlcgor
bWVzc2FnZXMgKG5ld2VyIHZlcnNpb25zLCBpZ25vcmluZyB0aGUgZXh0cmEgaW5mb3JtYXRpb24p
IGl0IHdpbGwgbm90CithY2NlcHQgYmlnZ2VyL25ld2VyIGV2ZW50IHJlcGxpZXMuCmRpZmYgLS1n
aXQgYS9pbmNsdWRlL3VhcGkvbGludXgva3ZtaS5oIGIvaW5jbHVkZS91YXBpL2xpbnV4L2t2bWku
aAppbmRleCA2ZmRhYTkyMzkzYTQuLmIwYTViNzJkMzkzNiAxMDA2NDQKLS0tIGEvaW5jbHVkZS91
YXBpL2xpbnV4L2t2bWkuaAorKysgYi9pbmNsdWRlL3VhcGkvbGludXgva3ZtaS5oCkBAIC02LDEx
ICs2LDE2IEBACiAgKiBLVk1JIHN0cnVjdHVyZXMgYW5kIGRlZmluaXRpb25zCiAgKi8KIAorI2lu
Y2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgorI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+CisKIGVudW0g
ewogCUtWTUlfVkVSU0lPTiA9IDB4MDAwMDAwMDEKIH07CiAKIGVudW0geworCUtWTUlfR0VUX1ZF
UlNJT04gPSAyLAorCiAJS1ZNSV9OVU1fTUVTU0FHRVMKIH07CiAKQEAgLTQwLDQgKzQ1LDkgQEAg
c3RydWN0IGt2bWlfZXJyb3JfY29kZSB7CiAJX191MzIgcGFkZGluZzsKIH07CiAKK3N0cnVjdCBr
dm1pX2dldF92ZXJzaW9uX3JlcGx5IHsKKwlfX3UzMiB2ZXJzaW9uOworCV9fdTMyIHBhZGRpbmc7
Cit9OworCiAjZW5kaWYgLyogX1VBUElfX0xJTlVYX0tWTUlfSCAqLwpkaWZmIC0tZ2l0IGEvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3g4Nl82NC9rdm1pX3Rlc3QuYyBiL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2t2bS94ODZfNjQva3ZtaV90ZXN0LmMKaW5kZXggNGMxZmU2N2M4ZTM1Li4z
MjcyNzJlMjY2ZmYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS94ODZf
NjQva3ZtaV90ZXN0LmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3g4Nl82NC9r
dm1pX3Rlc3QuYwpAQCAtMTc3LDEyICsxNzcsMzcgQEAgc3RhdGljIHZvaWQgdGVzdF9jbWRfaW52
YWxpZCh2b2lkKQogCQktciwga3ZtX3N0cmVycm9yKC1yKSk7CiB9CiAKK3N0YXRpYyB2b2lkIHRl
c3Rfdm1fY29tbWFuZChpbnQgY21kX2lkLCBzdHJ1Y3Qga3ZtaV9tc2dfaGRyICpyZXEsCisJCQkg
ICAgc2l6ZV90IHJlcV9zaXplLCB2b2lkICpycGwsIHNpemVfdCBycGxfc2l6ZSkKK3sKKwlpbnQg
cjsKKworCXIgPSBkb19jb21tYW5kKGNtZF9pZCwgcmVxLCByZXFfc2l6ZSwgcnBsLCBycGxfc2l6
ZSk7CisJVEVTVF9BU1NFUlQociA9PSAwLAorCQkgICAgIkNvbW1hbmQgJWQgZmFpbGVkLCBlcnJv
ciAlZCAoJXMpXG4iLAorCQkgICAgY21kX2lkLCAtciwga3ZtX3N0cmVycm9yKC1yKSk7Cit9CisK
K3N0YXRpYyB2b2lkIHRlc3RfY21kX2dldF92ZXJzaW9uKHZvaWQpCit7CisJc3RydWN0IGt2bWlf
Z2V0X3ZlcnNpb25fcmVwbHkgcnBsOworCXN0cnVjdCBrdm1pX21zZ19oZHIgcmVxOworCisJdGVz
dF92bV9jb21tYW5kKEtWTUlfR0VUX1ZFUlNJT04sICZyZXEsIHNpemVvZihyZXEpLCAmcnBsLCBz
aXplb2YocnBsKSk7CisJVEVTVF9BU1NFUlQocnBsLnZlcnNpb24gPT0gS1ZNSV9WRVJTSU9OLAor
CQkgICAgIlVuZXhwZWN0ZWQgS1ZNSSB2ZXJzaW9uICVkLCBleHBlY3RpbmcgJWRcbiIsCisJCSAg
ICBycGwudmVyc2lvbiwgS1ZNSV9WRVJTSU9OKTsKKworCURFQlVHKCJLVk1JIHZlcnNpb246ICV1
XG4iLCBycGwudmVyc2lvbik7Cit9CisKIHN0YXRpYyB2b2lkIHRlc3RfaW50cm9zcGVjdGlvbihz
dHJ1Y3Qga3ZtX3ZtICp2bSkKIHsKIAlzZXR1cF9zb2NrZXQoKTsKIAlob29rX2ludHJvc3BlY3Rp
b24odm0pOwogCiAJdGVzdF9jbWRfaW52YWxpZCgpOworCXRlc3RfY21kX2dldF92ZXJzaW9uKCk7
CiAKIAl1bmhvb2tfaW50cm9zcGVjdGlvbih2bSk7CiB9CmRpZmYgLS1naXQgYS92aXJ0L2t2bS9p
bnRyb3NwZWN0aW9uL2t2bWkuYyBiL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaS5jCmluZGV4
IDg4ZDI5NDA4ZmJmMS4uOGNkNjZiMWRhYzAyIDEwMDY0NAotLS0gYS92aXJ0L2t2bS9pbnRyb3Nw
ZWN0aW9uL2t2bWkuYworKysgYi92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWkuYwpAQCAtMTAs
NiArMTAsOCBAQAogCiAjZGVmaW5lIEtWTUlfTVNHX1NJWkVfQUxMT0MgKHNpemVvZihzdHJ1Y3Qg
a3ZtaV9tc2dfaGRyKSArIEtWTUlfTVNHX1NJWkUpCiAKK3N0YXRpYyBERUNMQVJFX0JJVE1BUChL
dm1pX2Fsd2F5c19hbGxvd2VkX2NvbW1hbmRzLCBLVk1JX05VTV9DT01NQU5EUyk7CisKIHN0YXRp
YyBzdHJ1Y3Qga21lbV9jYWNoZSAqbXNnX2NhY2hlOwogCiB2b2lkICprdm1pX21zZ19hbGxvYyh2
b2lkKQpAQCAtNDMsOCArNDUsMTYgQEAgc3RhdGljIGludCBrdm1pX2NhY2hlX2NyZWF0ZSh2b2lk
KQogCXJldHVybiAwOwogfQogCitzdGF0aWMgdm9pZCBzZXR1cF9hbHdheXNfYWxsb3dlZF9jb21t
YW5kcyh2b2lkKQoreworCWJpdG1hcF96ZXJvKEt2bWlfYWx3YXlzX2FsbG93ZWRfY29tbWFuZHMs
IEtWTUlfTlVNX0NPTU1BTkRTKTsKKwlzZXRfYml0KEtWTUlfR0VUX1ZFUlNJT04sIEt2bWlfYWx3
YXlzX2FsbG93ZWRfY29tbWFuZHMpOworfQorCiBpbnQga3ZtaV9pbml0KHZvaWQpCiB7CisJc2V0
dXBfYWx3YXlzX2FsbG93ZWRfY29tbWFuZHMoKTsKKwogCXJldHVybiBrdm1pX2NhY2hlX2NyZWF0
ZSgpOwogfQogCkBAIC03MSw2ICs4MSw5IEBAIGFsbG9jX2t2bWkoc3RydWN0IGt2bSAqa3ZtLCBj
b25zdCBzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb25faG9vayAqaG9vaykKIAlCVUlMRF9CVUdfT04o
c2l6ZW9mKGhvb2stPnV1aWQpICE9IHNpemVvZihrdm1pLT51dWlkKSk7CiAJbWVtY3B5KCZrdm1p
LT51dWlkLCAmaG9vay0+dXVpZCwgc2l6ZW9mKGt2bWktPnV1aWQpKTsKIAorCWJpdG1hcF9jb3B5
KGt2bWktPmNtZF9hbGxvd19tYXNrLCBLdm1pX2Fsd2F5c19hbGxvd2VkX2NvbW1hbmRzLAorCQkg
ICAgS1ZNSV9OVU1fQ09NTUFORFMpOworCiAJa3ZtaS0+a3ZtID0ga3ZtOwogCiAJcmV0dXJuIGt2
bWk7CkBAIC0yODIsOCArMjk1LDggQEAgaW50IGt2bWlfaW9jdGxfZXZlbnQoc3RydWN0IGt2bSAq
a3ZtLCB2b2lkIF9fdXNlciAqYXJncCkKIAlyZXR1cm4gZXJyOwogfQogCi1zdGF0aWMgdm9pZCBr
dm1pX2NvbnRyb2xfYWxsb3dlZF9jb21tYW5kcyhzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2
bWksCi0JCQkJCSAgaW50IGlkLCBib29sIGFsbG93KQorc3RhdGljIGludCBrdm1pX2NvbnRyb2xf
YWxsb3dlZF9jb21tYW5kcyhzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2bWksCisJCQkJCSBp
bnQgaWQsIGJvb2wgYWxsb3cpCiB7CiAJaW50IGFsbF9jb21tYW5kcyA9IC0xOwogCkBAIC0yOTQs
MTAgKzMwNywxNiBAQCBzdGF0aWMgdm9pZCBrdm1pX2NvbnRyb2xfYWxsb3dlZF9jb21tYW5kcyhz
dHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2bWksCiAJCQlzZXRfYml0KGlkLCBrdm1pLT5jbWRf
YWxsb3dfbWFzayk7CiAJfSBlbHNlIHsKIAkJaWYgKGlkID09IGFsbF9jb21tYW5kcykKLQkJCWJp
dG1hcF96ZXJvKGt2bWktPmNtZF9hbGxvd19tYXNrLCBLVk1JX05VTV9DT01NQU5EUyk7CisJCQli
aXRtYXBfY29weShrdm1pLT5jbWRfYWxsb3dfbWFzaywKKwkJCQkgICAgS3ZtaV9hbHdheXNfYWxs
b3dlZF9jb21tYW5kcywKKwkJCQkgICAgS1ZNSV9OVU1fQ09NTUFORFMpOworCQllbHNlIGlmICh0
ZXN0X2JpdChpZCwgS3ZtaV9hbHdheXNfYWxsb3dlZF9jb21tYW5kcykpCisJCQlyZXR1cm4gLUVQ
RVJNOwogCQllbHNlCiAJCQljbGVhcl9iaXQoaWQsIGt2bWktPmNtZF9hbGxvd19tYXNrKTsKIAl9
CisKKwlyZXR1cm4gMDsKIH0KIAogaW50IGt2bWlfaW9jdGxfY29tbWFuZChzdHJ1Y3Qga3ZtICpr
dm0sIHZvaWQgX191c2VyICphcmdwKQpAQCAtMzE0LDcgKzMzMyw3IEBAIGludCBrdm1pX2lvY3Rs
X2NvbW1hbmQoc3RydWN0IGt2bSAqa3ZtLCB2b2lkIF9fdXNlciAqYXJncCkKIAogCWt2bWkgPSBL
Vk1JKGt2bSk7CiAJaWYgKGt2bWkpCi0JCWt2bWlfY29udHJvbF9hbGxvd2VkX2NvbW1hbmRzKGt2
bWksIGlkLCBhbGxvdyk7CisJCWVyciA9IGt2bWlfY29udHJvbF9hbGxvd2VkX2NvbW1hbmRzKGt2
bWksIGlkLCBhbGxvdyk7CiAJZWxzZQogCQllcnIgPSAtRUZBVUxUOwogCmRpZmYgLS1naXQgYS92
aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfbXNnLmMgYi92aXJ0L2t2bS9pbnRyb3NwZWN0aW9u
L2t2bWlfbXNnLmMKaW5kZXggMDJmYzVkOTVmZWY2Li45ZWZjZDg5NmYwYzYgMTAwNjQ0Ci0tLSBh
L3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9tc2cuYworKysgYi92aXJ0L2t2bS9pbnRyb3Nw
ZWN0aW9uL2t2bWlfbXNnLmMKQEAgLTEwMywxMSArMTAzLDIzIEBAIHN0YXRpYyBib29sIGlzX2Nv
bW1hbmRfYWxsb3dlZChzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2bWksIHUxNiBpZCkKIAly
ZXR1cm4gaWQgPCBLVk1JX05VTV9DT01NQU5EUyAmJiB0ZXN0X2JpdChpZCwga3ZtaS0+Y21kX2Fs
bG93X21hc2spOwogfQogCitzdGF0aWMgaW50IGhhbmRsZV9nZXRfdmVyc2lvbihzdHJ1Y3Qga3Zt
X2ludHJvc3BlY3Rpb24gKmt2bWksCisJCQkgICAgICBjb25zdCBzdHJ1Y3Qga3ZtaV9tc2dfaGRy
ICptc2csIGNvbnN0IHZvaWQgKnJlcSkKK3sKKwlzdHJ1Y3Qga3ZtaV9nZXRfdmVyc2lvbl9yZXBs
eSBycGw7CisKKwltZW1zZXQoJnJwbCwgMCwgc2l6ZW9mKHJwbCkpOworCXJwbC52ZXJzaW9uID0g
S1ZNSV9WRVJTSU9OOworCisJcmV0dXJuIGt2bWlfbXNnX3ZtX3JlcGx5KGt2bWksIG1zZywgMCwg
JnJwbCwgc2l6ZW9mKHJwbCkpOworfQorCiAvKgogICogVGhlc2UgY29tbWFuZHMgYXJlIGV4ZWN1
dGVkIGJ5IHRoZSByZWNlaXZpbmcgdGhyZWFkL3dvcmtlci4KICAqLwogc3RhdGljIGludCgqY29u
c3QgbXNnX3ZtW10pKHN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqLAogCQkJICAgIGNvbnN0IHN0
cnVjdCBrdm1pX21zZ19oZHIgKiwgY29uc3Qgdm9pZCAqKSA9IHsKKwlbS1ZNSV9HRVRfVkVSU0lP
Tl0gPSBoYW5kbGVfZ2V0X3ZlcnNpb24sCiB9OwogCiBzdGF0aWMgYm9vbCBpc192bV9jb21tYW5k
KHUxNiBpZCkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3ZpcnR1YWxpemF0aW9u
