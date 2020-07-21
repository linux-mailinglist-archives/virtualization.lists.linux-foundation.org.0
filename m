Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9EF228B30
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 23:26:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C985C86C1D;
	Tue, 21 Jul 2020 21:26:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jjUhk9YQLkZK; Tue, 21 Jul 2020 21:26:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 59D5486C06;
	Tue, 21 Jul 2020 21:26:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2DED7C08A2;
	Tue, 21 Jul 2020 21:26:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DD72FC016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D348C88299
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:26:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Ji1L2FUnxyt
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:26:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 13CCE8829A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:57 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 D384A3041297; Wed, 22 Jul 2020 00:09:23 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id B38C6304FA14;
 Wed, 22 Jul 2020 00:09:23 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v9 33/84] KVM: x86: page track: add track_create_slot()
 callback
Date: Wed, 22 Jul 2020 00:08:31 +0300
Message-Id: <20200721210922.7646-34-alazar@bitdefender.com>
In-Reply-To: <20200721210922.7646-1-alazar@bitdefender.com>
References: <20200721210922.7646-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>,
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyBpcyB1c2Vk
IHRvIGFkZCBwYWdlIGFjY2VzcyBub3RpZmljYXRpb25zIGFzIHNvb24gYXMgYSBzbG90IGFwcGVh
cnMuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaSBEb27Im3UgPG1kb250dUBiaXRkZWZlbmRlci5jb20+
ClNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJpdGRlZmVuZGVyLmNvbT4K
LS0tCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1fcGFnZV90cmFjay5oIHwgMTMgKysrKysrKysr
KysrLQogYXJjaC94ODYva3ZtL21tdS9wYWdlX3RyYWNrLmMgICAgICAgICB8IDE2ICsrKysrKysr
KysrKysrKy0KIGFyY2gveDg2L2t2bS94ODYuYyAgICAgICAgICAgICAgICAgICAgfCAgNyArKysr
LS0tCiAzIGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX3BhZ2VfdHJhY2suaCBiL2FyY2gv
eDg2L2luY2x1ZGUvYXNtL2t2bV9wYWdlX3RyYWNrLmgKaW5kZXggOWEyNjFlNDYzZWIzLi4wMGE2
NmM0ZDRkM2MgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9wYWdlX3RyYWNr
LmgKKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX3BhZ2VfdHJhY2suaApAQCAtMzYsNiAr
MzYsMTcgQEAgc3RydWN0IGt2bV9wYWdlX3RyYWNrX25vdGlmaWVyX25vZGUgewogCXZvaWQgKCp0
cmFja193cml0ZSkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBncGFfdCBncGEsIGd2YV90IGd2YSwK
IAkJCSAgICBjb25zdCB1OCAqbmV3LCBpbnQgYnl0ZXMsCiAJCQkgICAgc3RydWN0IGt2bV9wYWdl
X3RyYWNrX25vdGlmaWVyX25vZGUgKm5vZGUpOworCS8qCisJICogSXQgaXMgY2FsbGVkIHdoZW4g
bWVtb3J5IHNsb3QgaXMgYmVpbmcgY3JlYXRlZAorCSAqCisJICogQGt2bTogdGhlIGt2bSB3aGVy
ZSBtZW1vcnkgc2xvdCBiZWluZyBtb3ZlZCBvciByZW1vdmVkCisJICogQHNsb3Q6IHRoZSBtZW1v
cnkgc2xvdCBiZWluZyBtb3ZlZCBvciByZW1vdmVkCisJICogQG5wYWdlczogdGhlIG51bWJlciBv
ZiBwYWdlcworCSAqIEBub2RlOiB0aGlzIG5vZGUKKwkgKi8KKwl2b2lkICgqdHJhY2tfY3JlYXRl
X3Nsb3QpKHN0cnVjdCBrdm0gKmt2bSwgc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqc2xvdCwKKwkJ
CQkgIHVuc2lnbmVkIGxvbmcgbnBhZ2VzLAorCQkJCSAgc3RydWN0IGt2bV9wYWdlX3RyYWNrX25v
dGlmaWVyX25vZGUgKm5vZGUpOwogCS8qCiAJICogSXQgaXMgY2FsbGVkIHdoZW4gbWVtb3J5IHNs
b3QgaXMgYmVpbmcgbW92ZWQgb3IgcmVtb3ZlZAogCSAqIHVzZXJzIGNhbiBkcm9wIHdyaXRlLXBy
b3RlY3Rpb24gZm9yIHRoZSBwYWdlcyBpbiB0aGF0IG1lbW9yeSBzbG90CkBAIC01Miw3ICs2Myw3
IEBAIHZvaWQga3ZtX3BhZ2VfdHJhY2tfaW5pdChzdHJ1Y3Qga3ZtICprdm0pOwogdm9pZCBrdm1f
cGFnZV90cmFja19jbGVhbnVwKHN0cnVjdCBrdm0gKmt2bSk7CiAKIHZvaWQga3ZtX3BhZ2VfdHJh
Y2tfZnJlZV9tZW1zbG90KHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNsb3QpOwotaW50IGt2bV9w
YWdlX3RyYWNrX2NyZWF0ZV9tZW1zbG90KHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNsb3QsCitp
bnQga3ZtX3BhZ2VfdHJhY2tfY3JlYXRlX21lbXNsb3Qoc3RydWN0IGt2bSAqa3ZtLCBzdHJ1Y3Qg
a3ZtX21lbW9yeV9zbG90ICpzbG90LAogCQkJCSAgdW5zaWduZWQgbG9uZyBucGFnZXMpOwogCiB2
b2lkIGt2bV9zbG90X3BhZ2VfdHJhY2tfYWRkX3BhZ2Uoc3RydWN0IGt2bSAqa3ZtLApkaWZmIC0t
Z2l0IGEvYXJjaC94ODYva3ZtL21tdS9wYWdlX3RyYWNrLmMgYi9hcmNoL3g4Ni9rdm0vbW11L3Bh
Z2VfdHJhY2suYwppbmRleCA5NjQyYWYxYjJjMjEuLjAyNzU5YjgxYTA0YyAxMDA2NDQKLS0tIGEv
YXJjaC94ODYva3ZtL21tdS9wYWdlX3RyYWNrLmMKKysrIGIvYXJjaC94ODYva3ZtL21tdS9wYWdl
X3RyYWNrLmMKQEAgLTI4LDkgKzI4LDEyIEBAIHZvaWQga3ZtX3BhZ2VfdHJhY2tfZnJlZV9tZW1z
bG90KHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNsb3QpCiAJfQogfQogCi1pbnQga3ZtX3BhZ2Vf
dHJhY2tfY3JlYXRlX21lbXNsb3Qoc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqc2xvdCwKK2ludCBr
dm1fcGFnZV90cmFja19jcmVhdGVfbWVtc2xvdChzdHJ1Y3Qga3ZtICprdm0sIHN0cnVjdCBrdm1f
bWVtb3J5X3Nsb3QgKnNsb3QsCiAJCQkJICB1bnNpZ25lZCBsb25nIG5wYWdlcykKIHsKKwlzdHJ1
Y3Qga3ZtX3BhZ2VfdHJhY2tfbm90aWZpZXJfaGVhZCAqaGVhZDsKKwlzdHJ1Y3Qga3ZtX3BhZ2Vf
dHJhY2tfbm90aWZpZXJfbm9kZSAqbjsKKwlpbnQgaWR4OwogCWludCAgaTsKIAogCWZvciAoaSA9
IDA7IGkgPCBLVk1fUEFHRV9UUkFDS19NQVg7IGkrKykgewpAQCAtNDEsNiArNDQsMTcgQEAgaW50
IGt2bV9wYWdlX3RyYWNrX2NyZWF0ZV9tZW1zbG90KHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNs
b3QsCiAJCQlnb3RvIHRyYWNrX2ZyZWU7CiAJfQogCisJaGVhZCA9ICZrdm0tPmFyY2gudHJhY2tf
bm90aWZpZXJfaGVhZDsKKworCWlmIChobGlzdF9lbXB0eSgmaGVhZC0+dHJhY2tfbm90aWZpZXJf
bGlzdCkpCisJCXJldHVybiAwOworCisJaWR4ID0gc3JjdV9yZWFkX2xvY2soJmhlYWQtPnRyYWNr
X3NyY3UpOworCWhsaXN0X2Zvcl9lYWNoX2VudHJ5X3JjdShuLCAmaGVhZC0+dHJhY2tfbm90aWZp
ZXJfbGlzdCwgbm9kZSkKKwkJaWYgKG4tPnRyYWNrX2NyZWF0ZV9zbG90KQorCQkJbi0+dHJhY2tf
Y3JlYXRlX3Nsb3Qoa3ZtLCBzbG90LCBucGFnZXMsIG4pOworCXNyY3VfcmVhZF91bmxvY2soJmhl
YWQtPnRyYWNrX3NyY3UsIGlkeCk7CisKIAlyZXR1cm4gMDsKIAogdHJhY2tfZnJlZToKZGlmZiAt
LWdpdCBhL2FyY2gveDg2L2t2bS94ODYuYyBiL2FyY2gveDg2L2t2bS94ODYuYwppbmRleCBhNTlj
OTM1ZjRiYmUuLjgzNDI0MzM5ZWE5ZCAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL3g4Ni5jCisr
KyBiL2FyY2gveDg2L2t2bS94ODYuYwpAQCAtMTAwNzAsNyArMTAwNzAsOCBAQCB2b2lkIGt2bV9h
cmNoX2ZyZWVfbWVtc2xvdChzdHJ1Y3Qga3ZtICprdm0sIHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3Qg
KnNsb3QpCiAJa3ZtX3BhZ2VfdHJhY2tfZnJlZV9tZW1zbG90KHNsb3QpOwogfQogCi1zdGF0aWMg
aW50IGt2bV9hbGxvY19tZW1zbG90X21ldGFkYXRhKHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNs
b3QsCitzdGF0aWMgaW50IGt2bV9hbGxvY19tZW1zbG90X21ldGFkYXRhKHN0cnVjdCBrdm0gKmt2
bSwKKwkJCQkgICAgICBzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICpzbG90LAogCQkJCSAgICAgIHVu
c2lnbmVkIGxvbmcgbnBhZ2VzKQogewogCWludCBpOwpAQCAtMTAxMjIsNyArMTAxMjMsNyBAQCBz
dGF0aWMgaW50IGt2bV9hbGxvY19tZW1zbG90X21ldGFkYXRhKHN0cnVjdCBrdm1fbWVtb3J5X3Ns
b3QgKnNsb3QsCiAJCX0KIAl9CiAKLQlpZiAoa3ZtX3BhZ2VfdHJhY2tfY3JlYXRlX21lbXNsb3Qo
c2xvdCwgbnBhZ2VzKSkKKwlpZiAoa3ZtX3BhZ2VfdHJhY2tfY3JlYXRlX21lbXNsb3Qoa3ZtLCBz
bG90LCBucGFnZXMpKQogCQlnb3RvIG91dF9mcmVlOwogCiAJcmV0dXJuIDA7CkBAIC0xMDE2Miw3
ICsxMDE2Myw3IEBAIGludCBrdm1fYXJjaF9wcmVwYXJlX21lbW9yeV9yZWdpb24oc3RydWN0IGt2
bSAqa3ZtLAogCQkJCWVudW0ga3ZtX21yX2NoYW5nZSBjaGFuZ2UpCiB7CiAJaWYgKGNoYW5nZSA9
PSBLVk1fTVJfQ1JFQVRFIHx8IGNoYW5nZSA9PSBLVk1fTVJfTU9WRSkKLQkJcmV0dXJuIGt2bV9h
bGxvY19tZW1zbG90X21ldGFkYXRhKG1lbXNsb3QsCisJCXJldHVybiBrdm1fYWxsb2NfbWVtc2xv
dF9tZXRhZGF0YShrdm0sIG1lbXNsb3QsCiAJCQkJCQkgIG1lbS0+bWVtb3J5X3NpemUgPj4gUEFH
RV9TSElGVCk7CiAJcmV0dXJuIDA7CiB9Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlv
bkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
