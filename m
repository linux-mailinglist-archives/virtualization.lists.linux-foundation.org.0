Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id AABEC229C90
	for <lists.virtualization@lfdr.de>; Wed, 22 Jul 2020 18:01:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 58A9E86C67;
	Wed, 22 Jul 2020 16:01:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iFLwBcoNB0ZM; Wed, 22 Jul 2020 16:01:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0EACE86B54;
	Wed, 22 Jul 2020 16:01:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E8D06C004C;
	Wed, 22 Jul 2020 16:01:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65174C0053
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4A8FA88141
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hEN9gjdfP3AF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C725A8816A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:37 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 0EF0A305D64F; Wed, 22 Jul 2020 19:01:33 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.6])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id ED4A3305FFB5;
 Wed, 22 Jul 2020 19:01:32 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v1 28/34] KVM: x86: page_track: add support for suppress
 #VE bit
Date: Wed, 22 Jul 2020 19:01:15 +0300
Message-Id: <20200722160121.9601-29-alazar@bitdefender.com>
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

RnJvbTogyJh0ZWZhbiDImGljbGVydSA8c3NpY2xlcnVAYml0ZGVmZW5kZXIuY29tPgoKU2V0dGlu
ZyBTUFRFcyBmcm9tIHJtYXBzIGlzIG5vdCBlbm91Z2ggYmVjYXVzZSBybWFwcyBjb250YWluIG9u
bHkKcHJlc2VudCBTUFRFcy4gSWYgdGhlcmUgaXMgbm8gbWFwcGluZyBjcmVhdGVkIGZvciB0aGUg
R0ZOLCBTUFRFcyBtdXN0CmJlIGNvbmZpZ3VyZWQgd2hlbiB0aGV5IGFyZSBjcmVhdGVkLiBVc2Ug
dGhlIHBhZ2UgdHJhY2tpbmcgbWVjaGFuaXNtIGluCm9yZGVyIHRvIGNvbmZpZ3VyZSB0aGUgU1ZF
IGJpdCB3aGVuIGEgUEYgb2NjdXJzLiBUaGlzIGlzIHNpbWlsYXIgdG8gaG93CmFjY2VzcyByaWdo
dHMgYXJlIGNvbmZpZ3VyZWQgdXNpbmcgdGhlIHBhZ2UgdHJhY2tpbmcgbWVjaGFuaXNtLgoKU2ln
bmVkLW9mZi1ieTogyJh0ZWZhbiDImGljbGVydSA8c3NpY2xlcnVAYml0ZGVmZW5kZXIuY29tPgpT
aWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+Ci0t
LQogYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX3BhZ2VfdHJhY2suaCB8ICAxICsKIGFyY2gveDg2
L2t2bS9tbXUuaCAgICAgICAgICAgICAgICAgICAgfCAgMiArKwogYXJjaC94ODYva3ZtL21tdS9t
bXUuYyAgICAgICAgICAgICAgICB8IDM4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwogYXJj
aC94ODYva3ZtL21tdS9wYWdlX3RyYWNrLmMgICAgICAgICB8ICA3ICsrKysrCiA0IGZpbGVzIGNo
YW5nZWQsIDQ4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2Fz
bS9rdm1fcGFnZV90cmFjay5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX3BhZ2VfdHJhY2su
aAppbmRleCA5NmQyYWI3ZGE0YTcuLjEwODE2MWY2M2E0NCAxMDA2NDQKLS0tIGEvYXJjaC94ODYv
aW5jbHVkZS9hc20va3ZtX3BhZ2VfdHJhY2suaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9r
dm1fcGFnZV90cmFjay5oCkBAIC03LDYgKzcsNyBAQCBlbnVtIGt2bV9wYWdlX3RyYWNrX21vZGUg
ewogCUtWTV9QQUdFX1RSQUNLX1BSRVdSSVRFLAogCUtWTV9QQUdFX1RSQUNLX1dSSVRFLAogCUtW
TV9QQUdFX1RSQUNLX1BSRUVYRUMsCisJS1ZNX1BBR0VfVFJBQ0tfU1ZFLAogCUtWTV9QQUdFX1RS
QUNLX01BWCwKIH07CiAKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9tbXUuaCBiL2FyY2gveDg2
L2t2bS9tbXUuaAppbmRleCAwMmZhMGQzMDQwN2YuLjE2MGU2NmFlOTg1MiAxMDA2NDQKLS0tIGEv
YXJjaC94ODYva3ZtL21tdS5oCisrKyBiL2FyY2gveDg2L2t2bS9tbXUuaApAQCAtMjM0LDUgKzIz
NCw3IEBAIGludCBrdm1fYXJjaF93cml0ZV9sb2dfZGlydHkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
LCBncGFfdCBsMl9ncGEpOwogCiBpbnQga3ZtX21tdV9wb3N0X2luaXRfdm0oc3RydWN0IGt2bSAq
a3ZtKTsKIHZvaWQga3ZtX21tdV9wcmVfZGVzdHJveV92bShzdHJ1Y3Qga3ZtICprdm0pOworYm9v
bCBrdm1fbW11X3NldF9lcHRfcGFnZV9zdmUoc3RydWN0IGt2bSAqa3ZtLCBzdHJ1Y3Qga3ZtX21l
bW9yeV9zbG90ICpzbG90LAorCQkJICAgICAgZ2ZuX3QgZ2ZuLCB1MTYgaW5kZXgsIGJvb2wgc3Vw
cHJlc3MpOwogCiAjZW5kaWYKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9tbXUvbW11LmMgYi9h
cmNoL3g4Ni9rdm0vbW11L21tdS5jCmluZGV4IDI4YWI0YTFiYTI1YS4uNzI1NGY1Njc5ODI4IDEw
MDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vbW11L21tdS5jCisrKyBiL2FyY2gveDg2L2t2bS9tbXUv
bW11LmMKQEAgLTE4OTAsNiArMTg5MCw0MSBAQCBib29sIGt2bV9tbXVfc2xvdF9nZm5fZXhlY19w
cm90ZWN0KHN0cnVjdCBrdm0gKmt2bSwKIAlyZXR1cm4gZXhlY19wcm90ZWN0ZWQ7CiB9CiAKK3N0
YXRpYyBib29sIHNwdGVfc3VwcHJlc3NfdmUodTY0ICpzcHRlcCwgYm9vbCBzdXBwcmVzcykKK3sK
Kwl1NjQgc3B0ZSA9ICpzcHRlcDsKKworCWlmIChzdXBwcmVzcykKKwkJc3B0ZSB8PSBWTVhfRVBU
X1NVUFBSRVNTX1ZFX0JJVDsKKwllbHNlCisJCXNwdGUgJj0gflZNWF9FUFRfU1VQUFJFU1NfVkVf
QklUOworCisJcmV0dXJuIG1tdV9zcHRlX3VwZGF0ZShzcHRlcCwgc3B0ZSk7Cit9CisKK2Jvb2wg
a3ZtX21tdV9zZXRfZXB0X3BhZ2Vfc3ZlKHN0cnVjdCBrdm0gKmt2bSwgc3RydWN0IGt2bV9tZW1v
cnlfc2xvdCAqc2xvdCwKKwkJCSAgICAgIGdmbl90IGdmbiwgdTE2IGluZGV4LCBib29sIHN1cHBy
ZXNzKQoreworCXN0cnVjdCBrdm1fcm1hcF9oZWFkICpybWFwX2hlYWQ7CisJc3RydWN0IHJtYXBf
aXRlcmF0b3IgaXRlcjsKKwlzdHJ1Y3Qga3ZtX21tdV9wYWdlICpzcDsKKwlib29sIGZsdXNoID0g
ZmFsc2U7CisJdTY0ICpzcHRlcDsKKwlpbnQgaTsKKworCWZvciAoaSA9IFBHX0xFVkVMXzRLOyBp
IDw9IEtWTV9NQVhfSFVHRVBBR0VfTEVWRUw7IGkrKykgeworCQlybWFwX2hlYWQgPSBfX2dmbl90
b19ybWFwKGdmbiwgaSwgc2xvdCk7CisJCWZvcl9lYWNoX3JtYXBfc3B0ZShybWFwX2hlYWQsICZp
dGVyLCBzcHRlcCkgeworCQkJc3AgPSBwYWdlX2hlYWRlcihfX3BhKHNwdGVwKSk7CisJCQlpZiAo
aW5kZXggPT0gMCB8fCAoaW5kZXggPiAwICYmIGluZGV4ID09IHNwLT52aWV3KSkKKwkJCQlmbHVz
aCB8PSBzcHRlX3N1cHByZXNzX3ZlKHNwdGVwLCBzdXBwcmVzcyk7CisJCX0KKwl9CisKKwlyZXR1
cm4gZmx1c2g7Cit9CitFWFBPUlRfU1lNQk9MX0dQTChrdm1fbW11X3NldF9lcHRfcGFnZV9zdmUp
OworCiBzdGF0aWMgYm9vbCBybWFwX3dyaXRlX3Byb3RlY3Qoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
LCB1NjQgZ2ZuKQogewogCXN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNsb3Q7CkBAIC0zMTcxLDYg
KzMyMDYsOSBAQCBzdGF0aWMgaW50IHNldF9zcHRlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdTY0
ICpzcHRlcCwKIAogCXNwdGUgfD0gKHU2NClwZm4gPDwgUEFHRV9TSElGVDsKIAorCWlmIChrdm1f
cGFnZV90cmFja19pc19hY3RpdmUodmNwdSwgZ2ZuLCBLVk1fUEFHRV9UUkFDS19TVkUpKQorCQlz
cHRlICY9IH5WTVhfRVBUX1NVUFBSRVNTX1ZFX0JJVDsKKwogCWlmIChwdGVfYWNjZXNzICYgQUND
X1dSSVRFX01BU0spIHsKIAkJc3B0ZSB8PSBQVF9XUklUQUJMRV9NQVNLIHwgU1BURV9NTVVfV1JJ
VEVBQkxFOwogCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vbW11L3BhZ2VfdHJhY2suYyBiL2Fy
Y2gveDg2L2t2bS9tbXUvcGFnZV90cmFjay5jCmluZGV4IGJmMjZiMjFjZmViOC4uMTUzYzUyODUz
NjFmIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vbW11L3BhZ2VfdHJhY2suYworKysgYi9hcmNo
L3g4Ni9rdm0vbW11L3BhZ2VfdHJhY2suYwpAQCAtMTI1LDYgKzEyNSw5IEBAIHZvaWQga3ZtX3Ns
b3RfcGFnZV90cmFja19hZGRfcGFnZShzdHJ1Y3Qga3ZtICprdm0sCiAJfSBlbHNlIGlmIChtb2Rl
ID09IEtWTV9QQUdFX1RSQUNLX1BSRUVYRUMpIHsKIAkJaWYgKGt2bV9tbXVfc2xvdF9nZm5fZXhl
Y19wcm90ZWN0KGt2bSwgc2xvdCwgZ2ZuLCB2aWV3KSkKIAkJCWt2bV9mbHVzaF9yZW1vdGVfdGxi
cyhrdm0pOworCX0gZWxzZSBpZiAobW9kZSA9PSBLVk1fUEFHRV9UUkFDS19TVkUpIHsKKwkJaWYg
KGt2bV9tbXVfc2V0X2VwdF9wYWdlX3N2ZShrdm0sIHNsb3QsIGdmbiwgdmlldywgZmFsc2UpKQor
CQkJa3ZtX2ZsdXNoX3JlbW90ZV90bGJzKGt2bSk7CiAJfQogfQogRVhQT1JUX1NZTUJPTF9HUEwo
a3ZtX3Nsb3RfcGFnZV90cmFja19hZGRfcGFnZSk7CkBAIC0xNTEsNiArMTU0LDEwIEBAIHZvaWQg
a3ZtX3Nsb3RfcGFnZV90cmFja19yZW1vdmVfcGFnZShzdHJ1Y3Qga3ZtICprdm0sCiAKIAl1cGRh
dGVfZ2ZuX3RyYWNrKHNsb3QsIGdmbiwgbW9kZSwgLTEsIHZpZXcpOwogCisJaWYgKG1vZGUgPT0g
S1ZNX1BBR0VfVFJBQ0tfU1ZFKQorCQlpZiAoa3ZtX21tdV9zZXRfZXB0X3BhZ2Vfc3ZlKGt2bSwg
c2xvdCwgZ2ZuLCB2aWV3LCB0cnVlKSkKKwkJCWt2bV9mbHVzaF9yZW1vdGVfdGxicyhrdm0pOwor
CiAJLyoKIAkgKiBhbGxvdyBsYXJnZSBwYWdlIG1hcHBpbmcgZm9yIHRoZSB0cmFja2VkIHBhZ2UK
IAkgKiBhZnRlciB0aGUgdHJhY2tlciBpcyBnb25lLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVh
bGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
