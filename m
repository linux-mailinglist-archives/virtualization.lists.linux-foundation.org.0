Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1D6881E3
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 20:00:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 92827DB6;
	Fri,  9 Aug 2019 17:59:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7F10FCAC
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 17:59:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C947D67F
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 17:59:54 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	8A7F3305D3DD; Fri,  9 Aug 2019 19:00:59 +0300 (EEST)
Received: from localhost.localdomain (unknown [89.136.169.210])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id 4461E305B7A3;
	Fri,  9 Aug 2019 19:00:59 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v6 21/92] kvm: page track: add track_create_slot() callback
Date: Fri,  9 Aug 2019 18:59:36 +0300
Message-Id: <20190809160047.8319-22-alazar@bitdefender.com>
In-Reply-To: <20190809160047.8319-1-alazar@bitdefender.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>, Yu C <yu.c.zhang@intel.com>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	=?UTF-8?q?Samuel=20Laur=C3=A9n?= <samuel.lauren@iki.fi>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	virtualization@lists.linux-foundation.org,
	=?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
	linux-mm@kvack.org, Patrick Colp <patrick.colp@oracle.com>,
	Xiao Guangrong <guangrong.xiao@gmail.com>,
	Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Zhang@mail.linuxfoundation.org,
	=?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyBpcyB1c2Vk
IHRvIGFkZCBwYWdlIGFjY2VzcyBub3RpZmljYXRpb25zIGFzIHNvb24gYXMgYSBzbG90IGFwcGVh
cnMuCgpDQzogWGlhbyBHdWFuZ3JvbmcgPGd1YW5ncm9uZy54aWFvQGdtYWlsLmNvbT4KU2lnbmVk
LW9mZi1ieTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgpTaWduZWQtb2Zm
LWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+Ci0tLQogYXJjaC94
ODYvaW5jbHVkZS9hc20va3ZtX3BhZ2VfdHJhY2suaCB8ICA1ICsrKystCiBhcmNoL3g4Ni9rdm0v
cGFnZV90cmFjay5jICAgICAgICAgICAgIHwgMTggKysrKysrKysrKysrKysrKy0tCiBhcmNoL3g4
Ni9rdm0veDg2LmMgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwg
MjEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9p
bmNsdWRlL2FzbS9rdm1fcGFnZV90cmFjay5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX3Bh
Z2VfdHJhY2suaAppbmRleCAxNzJmOTc0OWRiYjIuLjE4YTk0ZDE4MDQ4NSAxMDA2NDQKLS0tIGEv
YXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX3BhZ2VfdHJhY2suaAorKysgYi9hcmNoL3g4Ni9pbmNs
dWRlL2FzbS9rdm1fcGFnZV90cmFjay5oCkBAIC0zNCw2ICszNCw5IEBAIHN0cnVjdCBrdm1fcGFn
ZV90cmFja19ub3RpZmllcl9ub2RlIHsKIAkgKi8KIAl2b2lkICgqdHJhY2tfd3JpdGUpKHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSwgZ3BhX3QgZ3BhLCBjb25zdCB1OCAqbmV3LAogCQkJICAgIGludCBi
eXRlcywgc3RydWN0IGt2bV9wYWdlX3RyYWNrX25vdGlmaWVyX25vZGUgKm5vZGUpOworCXZvaWQg
KCp0cmFja19jcmVhdGVfc2xvdCkoc3RydWN0IGt2bSAqa3ZtLCBzdHJ1Y3Qga3ZtX21lbW9yeV9z
bG90ICpzbG90LAorCQkJCSAgdW5zaWduZWQgbG9uZyBucGFnZXMsCisJCQkJICBzdHJ1Y3Qga3Zt
X3BhZ2VfdHJhY2tfbm90aWZpZXJfbm9kZSAqbm9kZSk7CiAJLyoKIAkgKiBJdCBpcyBjYWxsZWQg
d2hlbiBtZW1vcnkgc2xvdCBpcyBiZWluZyBtb3ZlZCBvciByZW1vdmVkCiAJICogdXNlcnMgY2Fu
IGRyb3Agd3JpdGUtcHJvdGVjdGlvbiBmb3IgdGhlIHBhZ2VzIGluIHRoYXQgbWVtb3J5IHNsb3QK
QEAgLTUxLDcgKzU0LDcgQEAgdm9pZCBrdm1fcGFnZV90cmFja19jbGVhbnVwKHN0cnVjdCBrdm0g
Kmt2bSk7CiAKIHZvaWQga3ZtX3BhZ2VfdHJhY2tfZnJlZV9tZW1zbG90KHN0cnVjdCBrdm1fbWVt
b3J5X3Nsb3QgKmZyZWUsCiAJCQkJIHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKmRvbnQpOwotaW50
IGt2bV9wYWdlX3RyYWNrX2NyZWF0ZV9tZW1zbG90KHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNs
b3QsCitpbnQga3ZtX3BhZ2VfdHJhY2tfY3JlYXRlX21lbXNsb3Qoc3RydWN0IGt2bSAqa3ZtLCBz
dHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICpzbG90LAogCQkJCSAgdW5zaWduZWQgbG9uZyBucGFnZXMp
OwogCiB2b2lkIGt2bV9zbG90X3BhZ2VfdHJhY2tfYWRkX3BhZ2Uoc3RydWN0IGt2bSAqa3ZtLApk
aWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3BhZ2VfdHJhY2suYyBiL2FyY2gveDg2L2t2bS9wYWdl
X3RyYWNrLmMKaW5kZXggMzA1MmE1OWEzMDY1Li5kYjViOTA2ODc2YmIgMTAwNjQ0Ci0tLSBhL2Fy
Y2gveDg2L2t2bS9wYWdlX3RyYWNrLmMKKysrIGIvYXJjaC94ODYva3ZtL3BhZ2VfdHJhY2suYwpA
QCAtMzQsMTAgKzM0LDEzIEBAIHZvaWQga3ZtX3BhZ2VfdHJhY2tfZnJlZV9tZW1zbG90KHN0cnVj
dCBrdm1fbWVtb3J5X3Nsb3QgKmZyZWUsCiAJCX0KIH0KIAotaW50IGt2bV9wYWdlX3RyYWNrX2Ny
ZWF0ZV9tZW1zbG90KHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNsb3QsCitpbnQga3ZtX3BhZ2Vf
dHJhY2tfY3JlYXRlX21lbXNsb3Qoc3RydWN0IGt2bSAqa3ZtLCBzdHJ1Y3Qga3ZtX21lbW9yeV9z
bG90ICpzbG90LAogCQkJCSAgdW5zaWduZWQgbG9uZyBucGFnZXMpCiB7Ci0JaW50ICBpOworCXN0
cnVjdCBrdm1fcGFnZV90cmFja19ub3RpZmllcl9oZWFkICpoZWFkOworCXN0cnVjdCBrdm1fcGFn
ZV90cmFja19ub3RpZmllcl9ub2RlICpuOworCWludCBpZHg7CisJaW50IGk7CiAKIAlmb3IgKGkg
PSAwOyBpIDwgS1ZNX1BBR0VfVFJBQ0tfTUFYOyBpKyspIHsKIAkJc2xvdC0+YXJjaC5nZm5fdHJh
Y2tbaV0gPQpAQCAtNDcsNiArNTAsMTcgQEAgaW50IGt2bV9wYWdlX3RyYWNrX2NyZWF0ZV9tZW1z
bG90KHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNsb3QsCiAJCQlnb3RvIHRyYWNrX2ZyZWU7CiAJ
fQogCisJaGVhZCA9ICZrdm0tPmFyY2gudHJhY2tfbm90aWZpZXJfaGVhZDsKKworCWlmIChobGlz
dF9lbXB0eSgmaGVhZC0+dHJhY2tfbm90aWZpZXJfbGlzdCkpCisJCXJldHVybiAwOworCisJaWR4
ID0gc3JjdV9yZWFkX2xvY2soJmhlYWQtPnRyYWNrX3NyY3UpOworCWhsaXN0X2Zvcl9lYWNoX2Vu
dHJ5X3JjdShuLCAmaGVhZC0+dHJhY2tfbm90aWZpZXJfbGlzdCwgbm9kZSkKKwkJaWYgKG4tPnRy
YWNrX2NyZWF0ZV9zbG90KQorCQkJbi0+dHJhY2tfY3JlYXRlX3Nsb3Qoa3ZtLCBzbG90LCBucGFn
ZXMsIG4pOworCXNyY3VfcmVhZF91bmxvY2soJmhlYWQtPnRyYWNrX3NyY3UsIGlkeCk7CisKIAly
ZXR1cm4gMDsKIAogdHJhY2tfZnJlZToKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS94ODYuYyBi
L2FyY2gveDg2L2t2bS94ODYuYwppbmRleCAzMGNmMGQxNjJhYTguLmY2NmRiOTQ3M2VhMyAxMDA2
NDQKLS0tIGEvYXJjaC94ODYva3ZtL3g4Ni5jCisrKyBiL2FyY2gveDg2L2t2bS94ODYuYwpAQCAt
OTM1MCw3ICs5MzUwLDcgQEAgaW50IGt2bV9hcmNoX2NyZWF0ZV9tZW1zbG90KHN0cnVjdCBrdm0g
Kmt2bSwgc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqc2xvdCwKIAkJfQogCX0KIAotCWlmIChrdm1f
cGFnZV90cmFja19jcmVhdGVfbWVtc2xvdChzbG90LCBucGFnZXMpKQorCWlmIChrdm1fcGFnZV90
cmFja19jcmVhdGVfbWVtc2xvdChrdm0sIHNsb3QsIG5wYWdlcykpCiAJCWdvdG8gb3V0X2ZyZWU7
CiAKIAlyZXR1cm4gMDsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxp
bnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWls
bWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
