Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBB6155E2C
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 19:35:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1C7BD87F9F;
	Fri,  7 Feb 2020 18:35:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G47COggDXTo9; Fri,  7 Feb 2020 18:35:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9FE7087F8E;
	Fri,  7 Feb 2020 18:35:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 85BBBC1D89;
	Fri,  7 Feb 2020 18:35:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E659C013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EFA2F20005
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xTDzjHli0Dy7
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by silver.osuosl.org (Postfix) with ESMTPS id CCE381FFFF
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:51 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 6D030305D346; Fri,  7 Feb 2020 20:16:40 +0200 (EET)
Received: from host.bbu.bitdefender.biz (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 619E23052074;
 Fri,  7 Feb 2020 20:16:40 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v7 40/78] KVM: introspection: add KVMI_GET_VERSION
Date: Fri,  7 Feb 2020 20:15:58 +0200
Message-Id: <20200207181636.1065-41-alazar@bitdefender.com>
In-Reply-To: <20200207181636.1065-1-alazar@bitdefender.com>
References: <20200207181636.1065-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
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

VGhpcyBjb21tYW5kIHNob3VsZCBiZSB1c2VkIGJ5IHRoZSBpbnRyb3NwZWN0aW9uIHRvb2wgdG8g
aWRlbnRpZnkgdGhlCmNvbW1hbmRzL2V2ZW50cyBzdXBwb3J0ZWQgYnkgdGhlIEtWTWkgc3Vic3lz
dGVtIGFuZCwgbW9zdCBpbXBvcnRhbnQsCndoYXQgbWVzc2FnZXMgbXVzdCBiZSB1c2VkIGZvciBl
dmVudCByZXBsaWVzLiBUaGVzZSBtZXNzYWdlcyBtaWdodCBiZQpleHRlbmRlZCBpbiBmdXR1cmUg
dmVyc2lvbnMuIFRoZSBrZXJuZWwgc2lkZSB3aWxsIGFjY2VwdCBzbWFsbGVyL29sZGVyCm9yIGJp
Z2dlci9uZXdlciBjb21tYW5kIG1lc3NhZ2VzLCBidXQgbm90IGJpZ2dlci9uZXdlciBldmVudCBy
ZXBsaWVzLgoKVGhlIEtWTUlfR0VUX1ZFUlNJT04gY29tbWFuZCBpcyBhbHdheXMgYWxsb3dlZCBh
bmQgYW55IGF0dGVtcHQKZnJvbSB1c2Vyc3BhY2UgdG8gZXhwbGljaXRseSBkaXNhbGxvdyB0aGlz
IGNvbW1hbmQgdGhyb3VnaApLVk1fSU5UUk9TUEVDVElPTl9DT01NQU5EIHdpbGwgZ2V0IC1FUEVS
TSAodW5sZXNzIHVzZXJzcGFjZSBjaG9vc2VzIHRvCmRpc2FibGUgYWxsIGNvbW1hbmRzLCB1c2lu
ZyBpZD0tMSwgaW4gd2hpY2ggY2FzZSBLVk1JX0dFVF9WRVJTSU9OIGlzCnNpbGVudGx5IGFsbG93
ZWQsIHdpdGhvdXQgYW4gZXJyb3IpLgoKU2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxh
bGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIERvY3VtZW50YXRpb24vdmlydC9rdm0va3ZtaS5y
c3QgICAgICAgICAgICAgICB8IDI3ICsrKysrKysrKysrKysrKysrKysKIGluY2x1ZGUvdWFwaS9s
aW51eC9rdm1pLmggICAgICAgICAgICAgICAgICAgICB8IDEwICsrKysrKysKIC4uLi90ZXN0aW5n
L3NlbGZ0ZXN0cy9rdm0veDg2XzY0L2t2bWlfdGVzdC5jICB8IDI1ICsrKysrKysrKysrKysrKysr
CiB2aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWkuYyAgICAgICAgICAgICAgICAgfCAxNCArKysr
KysrKysrCiB2aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfaW50LmggICAgICAgICAgICAgfCAg
NCArKy0KIHZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9tc2cuYyAgICAgICAgICAgICB8IDEz
ICsrKysrKysrKwogNiBmaWxlcyBjaGFuZ2VkLCA5MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJzdCBiL0RvY3Vt
ZW50YXRpb24vdmlydC9rdm0va3ZtaS5yc3QKaW5kZXggNGFhNzdhZTBjM2M1Li4zNmY4Y2Q0YTgz
NmQgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vdmlydC9rdm0va3ZtaS5yc3QKKysrIGIvRG9j
dW1lbnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJzdApAQCAtMjI0LDMgKzIyNCwzMCBAQCBkZXZpY2Ug
ZXRjLikuIEl0IGlzIHVwIHRvIHRoZSB1c2VyIHRvIGRldGVybWluZSwgdXNpbmcgdGhlIGd1ZXN0
IG9wZXJhdGluZwogc3lzdGVtIGRhdGEgc3RydWN0dXJlcywgdGhlIGFyZWFzIHRoYXQgYXJlIHNh
ZmUgdG8gYWNjZXNzIChjb2RlLCBzdGFjaywgaGVhcAogZXRjLikuCiAKK0NvbW1hbmRzCistLS0t
LS0tLQorCitUaGUgZm9sbG93aW5nIEMgc3RydWN0dXJlcyBhcmUgbWVhbnQgdG8gYmUgdXNlZCBk
aXJlY3RseSB3aGVuIGNvbW11bmljYXRpbmcKK292ZXIgdGhlIHdpcmUuIFRoZSBwZWVyIHRoYXQg
ZGV0ZWN0cyBhbnkgc2l6ZSBtaXNtYXRjaCBzaG91bGQgc2ltcGx5IGNsb3NlCit0aGUgY29ubmVj
dGlvbiBhbmQgcmVwb3J0IHRoZSBlcnJvci4KKworMS4gS1ZNSV9HRVRfVkVSU0lPTgorLS0tLS0t
LS0tLS0tLS0tLS0tLQorCis6QXJjaGl0ZWN0dXJlczogYWxsCis6VmVyc2lvbnM6ID49IDEKKzpQ
YXJhbWV0ZXJzOiBub25lCis6UmV0dXJuczoKKworOjoKKworCXN0cnVjdCBrdm1pX2Vycm9yX2Nv
ZGU7CisJc3RydWN0IGt2bWlfZ2V0X3ZlcnNpb25fcmVwbHkgeworCQlfX3UzMiB2ZXJzaW9uOwor
CQlfX3UzMiBwYWRkaW5nOworCX07CisKK1JldHVybnMgdGhlIGludHJvc3BlY3Rpb24gQVBJIHZl
cnNpb24uCisKK1RoaXMgY29tbWFuZCBpcyBhbHdheXMgYWxsb3dlZCBhbmQgc3VjY2Vzc2Z1bCAo
aWYgdGhlIGludHJvc3BlY3Rpb24gaXMKK2J1aWx0IGluIGtlcm5lbCkuCmRpZmYgLS1naXQgYS9p
bmNsdWRlL3VhcGkvbGludXgva3ZtaS5oIGIvaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaAppbmRl
eCA3NjIwZmRiZjQ3NDkuLmVlODE3Y2IwNWNjNiAxMDA2NDQKLS0tIGEvaW5jbHVkZS91YXBpL2xp
bnV4L2t2bWkuaAorKysgYi9pbmNsdWRlL3VhcGkvbGludXgva3ZtaS5oCkBAIC02LDExICs2LDE2
IEBACiAgKiBLVk1JIHN0cnVjdHVyZXMgYW5kIGRlZmluaXRpb25zCiAgKi8KIAorI2luY2x1ZGUg
PGxpbnV4L2tlcm5lbC5oPgorI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+CisKIGVudW0gewogCUtW
TUlfVkVSU0lPTiA9IDB4MDAwMDAwMDEKIH07CiAKIGVudW0geworCUtWTUlfR0VUX1ZFUlNJT04g
PSAyLAorCiAJS1ZNSV9OVU1fTUVTU0FHRVMKIH07CiAKQEAgLTMzLDQgKzM4LDkgQEAgc3RydWN0
IGt2bWlfZXJyb3JfY29kZSB7CiAJX191MzIgcGFkZGluZzsKIH07CiAKK3N0cnVjdCBrdm1pX2dl
dF92ZXJzaW9uX3JlcGx5IHsKKwlfX3UzMiB2ZXJzaW9uOworCV9fdTMyIHBhZGRpbmc7Cit9Owor
CiAjZW5kaWYgLyogX1VBUElfX0xJTlVYX0tWTUlfSCAqLwpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMva3ZtL3g4Nl82NC9rdm1pX3Rlc3QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2t2bS94ODZfNjQva3ZtaV90ZXN0LmMKaW5kZXggMTc5MzU4MmI3ZTEwLi43MzNlODI0
NzhmNmUgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS94ODZfNjQva3Zt
aV90ZXN0LmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3g4Nl82NC9rdm1pX3Rl
c3QuYwpAQCAtMTc3LDEyICsxNzcsMzcgQEAgc3RhdGljIHZvaWQgdGVzdF9jbWRfaW52YWxpZCh2
b2lkKQogCQktciwga3ZtX3N0cmVycm9yKC1yKSk7CiB9CiAKK3N0YXRpYyB2b2lkIHRlc3Rfdm1f
Y29tbWFuZChpbnQgY21kX2lkLCBzdHJ1Y3Qga3ZtaV9tc2dfaGRyICpyZXEsCisJCQkgICAgc2l6
ZV90IHJlcV9zaXplLCB2b2lkICpycGwsIHNpemVfdCBycGxfc2l6ZSkKK3sKKwlpbnQgcjsKKwor
CXIgPSBkb19jb21tYW5kKGNtZF9pZCwgcmVxLCByZXFfc2l6ZSwgcnBsLCBycGxfc2l6ZSk7CisJ
VEVTVF9BU1NFUlQociA9PSAwLAorCQkgICAgIkNvbW1hbmQgJWQgZmFpbGVkLCBlcnJvciAlZCAo
JXMpXG4iLAorCQkgICAgY21kX2lkLCAtciwga3ZtX3N0cmVycm9yKC1yKSk7Cit9CisKK3N0YXRp
YyB2b2lkIHRlc3RfY21kX2dldF92ZXJzaW9uKHZvaWQpCit7CisJc3RydWN0IGt2bWlfZ2V0X3Zl
cnNpb25fcmVwbHkgcnBsOworCXN0cnVjdCBrdm1pX21zZ19oZHIgcmVxOworCisJdGVzdF92bV9j
b21tYW5kKEtWTUlfR0VUX1ZFUlNJT04sICZyZXEsIHNpemVvZihyZXEpLCAmcnBsLCBzaXplb2Yo
cnBsKSk7CisJVEVTVF9BU1NFUlQocnBsLnZlcnNpb24gPT0gS1ZNSV9WRVJTSU9OLAorCQkgICAg
IlVuZXhwZWN0ZWQgS1ZNSSB2ZXJzaW9uICVkLCBleHBlY3RpbmcgJWRcbiIsCisJCSAgICBycGwu
dmVyc2lvbiwgS1ZNSV9WRVJTSU9OKTsKKworCURFQlVHKCJLVk1JIHZlcnNpb246ICV1XG4iLCBy
cGwudmVyc2lvbik7Cit9CisKIHN0YXRpYyB2b2lkIHRlc3RfaW50cm9zcGVjdGlvbihzdHJ1Y3Qg
a3ZtX3ZtICp2bSkKIHsKIAlzZXR1cF9zb2NrZXQoKTsKIAlob29rX2ludHJvc3BlY3Rpb24odm0p
OwogCiAJdGVzdF9jbWRfaW52YWxpZCgpOworCXRlc3RfY21kX2dldF92ZXJzaW9uKCk7CiAKIAl1
bmhvb2tfaW50cm9zcGVjdGlvbih2bSk7CiB9CmRpZmYgLS1naXQgYS92aXJ0L2t2bS9pbnRyb3Nw
ZWN0aW9uL2t2bWkuYyBiL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaS5jCmluZGV4IDcwNjM3
MmU5ZTU2YS4uODU5N2I2ZWYwY2ZiIDEwMDY0NAotLS0gYS92aXJ0L2t2bS9pbnRyb3NwZWN0aW9u
L2t2bWkuYworKysgYi92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWkuYwpAQCAtNzYsNiArNzYs
OCBAQCBhbGxvY19rdm1pKHN0cnVjdCBrdm0gKmt2bSwgY29uc3Qgc3RydWN0IGt2bV9pbnRyb3Nw
ZWN0aW9uX2hvb2sgKmhvb2spCiAJQlVJTERfQlVHX09OKHNpemVvZihob29rLT51dWlkKSAhPSBz
aXplb2Yoa3ZtaS0+dXVpZCkpOwogCW1lbWNweSgma3ZtaS0+dXVpZCwgJmhvb2stPnV1aWQsIHNp
emVvZihrdm1pLT51dWlkKSk7CiAKKwlzZXRfYml0KEtWTUlfR0VUX1ZFUlNJT04sIGt2bWktPmNt
ZF9hbGxvd19tYXNrKTsKKwogCWt2bWktPmt2bSA9IGt2bTsKIAogCXJldHVybiBrdm1pOwpAQCAt
Mjk5LDYgKzMwMSwxOCBAQCBpbnQga3ZtaV9pb2N0bF9jb21tYW5kKHN0cnVjdCBrdm0gKmt2bSwg
dm9pZCBfX3VzZXIgKmFyZ3ApCiAJYml0bWFwX2Zyb21fdTY0KGtub3duLCBLVk1JX0tOT1dOX0NP
TU1BTkRTKTsKIAliaXRtYXBfYW5kKHJlcXVlc3RlZCwgcmVxdWVzdGVkLCBrbm93biwgS1ZNSV9O
VU1fQ09NTUFORFMpOwogCisJaWYgKCFhbGxvdykgeworCQlERUNMQVJFX0JJVE1BUChhbHdheXNf
YWxsb3dlZCwgS1ZNSV9OVU1fQ09NTUFORFMpOworCisJCWlmIChpZCA9PSBLVk1JX0dFVF9WRVJT
SU9OKQorCQkJcmV0dXJuIC1FUEVSTTsKKworCQlzZXRfYml0KEtWTUlfR0VUX1ZFUlNJT04sIGFs
d2F5c19hbGxvd2VkKTsKKworCQliaXRtYXBfYW5kbm90KHJlcXVlc3RlZCwgcmVxdWVzdGVkLCBh
bHdheXNfYWxsb3dlZCwKKwkJCSAgICAgIEtWTUlfTlVNX0NPTU1BTkRTKTsKKwl9CisKIAlvZmZf
Yml0bWFwID0gb2Zmc2V0b2Yoc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uLCBjbWRfYWxsb3dfbWFz
ayk7CiAKIAlyZXR1cm4ga3ZtaV9pb2N0bF9mZWF0dXJlKGt2bSwgYWxsb3csIHJlcXVlc3RlZCwg
b2ZmX2JpdG1hcCwKZGlmZiAtLWdpdCBhL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9pbnQu
aCBiL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9pbnQuaAppbmRleCA0NmJhOTBjYjVlNjYu
Ljk0N2FmNDYxNWZhNSAxMDA2NDQKLS0tIGEvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX2lu
dC5oCisrKyBiL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9pbnQuaApAQCAtMjAsNyArMjAs
OSBAQAogCiAjZGVmaW5lIEtWTUlfS05PV05fRVZFTlRTIDAKIAotI2RlZmluZSBLVk1JX0tOT1dO
X0NPTU1BTkRTIDAKKyNkZWZpbmUgS1ZNSV9LTk9XTl9DT01NQU5EUyAoIFwKKwkJCSAgQklUKEtW
TUlfR0VUX1ZFUlNJT04pIFwKKwkJKQogCiAjZGVmaW5lIEtWTUkoa3ZtKSAoKHN0cnVjdCBrdm1f
aW50cm9zcGVjdGlvbiAqKSgoa3ZtKS0+a3ZtaSkpCiAKZGlmZiAtLWdpdCBhL3ZpcnQva3ZtL2lu
dHJvc3BlY3Rpb24va3ZtaV9tc2cuYyBiL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9tc2cu
YwppbmRleCBlZDA5NWZjZjUwYmMuLjgxZTQyYzY1ZGExNiAxMDA2NDQKLS0tIGEvdmlydC9rdm0v
aW50cm9zcGVjdGlvbi9rdm1pX21zZy5jCisrKyBiL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3Zt
aV9tc2cuYwpAQCAtOSw2ICs5LDcgQEAKICNpbmNsdWRlICJrdm1pX2ludC5oIgogCiBzdGF0aWMg
Y29uc3QgY2hhciAqY29uc3QgbXNnX0lEc1tdID0geworCVtLVk1JX0dFVF9WRVJTSU9OXSA9ICJL
Vk1JX0dFVF9WRVJTSU9OIiwKIH07CiAKIHN0YXRpYyBib29sIGlzX2tub3duX21lc3NhZ2UodTE2
IGlkKQpAQCAtMTE2LDExICsxMTcsMjMgQEAgc3RhdGljIGJvb2wgaXNfY29tbWFuZF9hbGxvd2Vk
KHN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqa3ZtaSwgaW50IGlkKQogCXJldHVybiB0ZXN0X2Jp
dChpZCwga3ZtaS0+Y21kX2FsbG93X21hc2spOwogfQogCitzdGF0aWMgaW50IGhhbmRsZV9nZXRf
dmVyc2lvbihzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2bWksCisJCQkgICAgICBjb25zdCBz
dHJ1Y3Qga3ZtaV9tc2dfaGRyICptc2csIGNvbnN0IHZvaWQgKnJlcSkKK3sKKwlzdHJ1Y3Qga3Zt
aV9nZXRfdmVyc2lvbl9yZXBseSBycGw7CisKKwltZW1zZXQoJnJwbCwgMCwgc2l6ZW9mKHJwbCkp
OworCXJwbC52ZXJzaW9uID0gS1ZNSV9WRVJTSU9OOworCisJcmV0dXJuIGt2bWlfbXNnX3ZtX3Jl
cGx5KGt2bWksIG1zZywgMCwgJnJwbCwgc2l6ZW9mKHJwbCkpOworfQorCiAvKgogICogVGhlc2Ug
Y29tbWFuZHMgYXJlIGV4ZWN1dGVkIGJ5IHRoZSByZWNlaXZpbmcgdGhyZWFkL3dvcmtlci4KICAq
Lwogc3RhdGljIGludCgqY29uc3QgbXNnX3ZtW10pKHN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAq
LAogCQkJICAgIGNvbnN0IHN0cnVjdCBrdm1pX21zZ19oZHIgKiwgY29uc3Qgdm9pZCAqKSA9IHsK
KwlbS1ZNSV9HRVRfVkVSU0lPTl0gPSBoYW5kbGVfZ2V0X3ZlcnNpb24sCiB9OwogCiBzdGF0aWMg
Ym9vbCBpc192bV9tZXNzYWdlKHUxNiBpZCkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0
aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0
aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
