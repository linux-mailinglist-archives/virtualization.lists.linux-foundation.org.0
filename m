Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 51768228B95
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 23:45:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8C72386BB9;
	Tue, 21 Jul 2020 21:45:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OfLJWJdnQ1Bb; Tue, 21 Jul 2020 21:45:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D7A1E86ACA;
	Tue, 21 Jul 2020 21:45:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C69A0C016F;
	Tue, 21 Jul 2020 21:45:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 75F81C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 63EAB8861E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:45:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DSBmjI7mJd6l
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:45:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E8D0A88619
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:45:52 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 B4A8C305D507; Wed, 22 Jul 2020 00:09:31 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 8E51F304FA13;
 Wed, 22 Jul 2020 00:09:31 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v9 79/84] KVM: introspection: extend KVMI_GET_VERSION with
 struct kvmi_features
Date: Wed, 22 Jul 2020 00:09:17 +0300
Message-Id: <20200721210922.7646-80-alazar@bitdefender.com>
In-Reply-To: <20200721210922.7646-1-alazar@bitdefender.com>
References: <20200721210922.7646-1-alazar@bitdefender.com>
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

VGhpcyBpcyB1c2VkIGJ5IHRoZSBpbnRyb3NwZWN0aW9uIHRvb2wgdG8gY2hlY2sgdGhlIGhhcmR3
YXJlIHN1cHBvcnQKZm9yIHRoZSBzaW5nbGUgc3RlcCBmZWF0dXJlLgoKU2lnbmVkLW9mZi1ieTog
QWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIERvY3VtZW50YXRp
b24vdmlydC9rdm0va3ZtaS5yc3QgICAgICAgICAgICAgICAgfCAxMyArKysrKysrKysrKystCiBh
cmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL2t2bWkuaCAgICAgICAgICAgICAgIHwgIDUgKysrKysK
IGFyY2gveDg2L2t2bS9rdm1pLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNSArKysr
KwogaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaCAgICAgICAgICAgICAgICAgICAgICB8ICAxICsK
IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS94ODZfNjQva3ZtaV90ZXN0LmMgfCAgNSArKysr
KwogdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX2ludC5oICAgICAgICAgICAgICB8ICAxICsK
IHZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9tc2cuYyAgICAgICAgICAgICAgfCAgMiArKwog
NyBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJzdCBiL0RvY3VtZW50YXRpb24vdmly
dC9rdm0va3ZtaS5yc3QKaW5kZXggYjJlMmE5ZWRkYTc3Li40NzM4N2YyOTcwMjkgMTAwNjQ0Ci0t
LSBhL0RvY3VtZW50YXRpb24vdmlydC9rdm0va3ZtaS5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi92
aXJ0L2t2bS9rdm1pLnJzdApAQCAtMjU0LDkgKzI1NCwyMCBAQCBUaGUgdkNQVSBjb21tYW5kcyBz
dGFydCB3aXRoOjoKIAlzdHJ1Y3Qga3ZtaV9nZXRfdmVyc2lvbl9yZXBseSB7CiAJCV9fdTMyIHZl
cnNpb247CiAJCV9fdTMyIHBhZGRpbmc7CisJCXN0cnVjdCBrdm1pX2ZlYXR1cmVzIGZlYXR1cmVz
OwogCX07CiAKLVJldHVybnMgdGhlIGludHJvc3BlY3Rpb24gQVBJIHZlcnNpb24uCitGb3IgeDg2
CisKKzo6CisKKwlzdHJ1Y3Qga3ZtaV9mZWF0dXJlcyB7CisJCV9fdTggc2luZ2xlc3RlcDsKKwkJ
X191OCBwYWRkaW5nWzddOworCX07CisKK1JldHVybnMgdGhlIGludHJvc3BlY3Rpb24gQVBJIHZl
cnNpb24gYW5kIHNvbWUgb2YgdGhlIGZlYXR1cmVzIHN1cHBvcnRlZAorYnkgdGhlIGhhcmR3YXJl
LgogCiBUaGlzIGNvbW1hbmQgaXMgYWx3YXlzIGFsbG93ZWQgYW5kIHN1Y2Nlc3NmdWwuCiAKZGlm
ZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvdWFwaS9hc20va3ZtaS5oIGIvYXJjaC94ODYvaW5j
bHVkZS91YXBpL2FzbS9rdm1pLmgKaW5kZXggMWJiMTNkYTYxZGJmLi4zMmFmODAzZjFkNzAgMTAw
NjQ0Ci0tLSBhL2FyY2gveDg2L2luY2x1ZGUvdWFwaS9hc20va3ZtaS5oCisrKyBiL2FyY2gveDg2
L2luY2x1ZGUvdWFwaS9hc20va3ZtaS5oCkBAIC0xNDUsNCArMTQ1LDkgQEAgc3RydWN0IGt2bWlf
ZXZlbnRfbXNyX3JlcGx5IHsKIAlfX3U2NCBuZXdfdmFsOwogfTsKIAorc3RydWN0IGt2bWlfZmVh
dHVyZXMgeworCV9fdTggc2luZ2xlc3RlcDsKKwlfX3U4IHBhZGRpbmdbN107Cit9OworCiAjZW5k
aWYgLyogX1VBUElfQVNNX1g4Nl9LVk1JX0ggKi8KZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9r
dm1pLmMgYi9hcmNoL3g4Ni9rdm0va3ZtaS5jCmluZGV4IDhmYmYxNzIwNzQ5Yi4uNjcyYTExM2Iz
YmY0IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0va3ZtaS5jCisrKyBiL2FyY2gveDg2L2t2bS9r
dm1pLmMKQEAgLTEzNTAsMyArMTM1MCw4IEBAIHN0YXRpYyB2b2lkIGt2bWlfdHJhY2tfZmx1c2hf
c2xvdChzdHJ1Y3Qga3ZtICprdm0sIHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNsb3QsCiAKIAlr
dm1pX3B1dChrdm0pOwogfQorCit2b2lkIGt2bWlfYXJjaF9mZWF0dXJlcyhzdHJ1Y3Qga3ZtaV9m
ZWF0dXJlcyAqZmVhdCkKK3sKKwlmZWF0LT5zaW5nbGVzdGVwID0gISFrdm1feDg2X29wcy5jb250
cm9sX3NpbmdsZXN0ZXA7Cit9CmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgva3ZtaS5o
IGIvaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaAppbmRleCBkYzdiYTEyNDk4YjcuLmE4NGFmZmJh
ZmE2NyAxMDA2NDQKLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaAorKysgYi9pbmNsdWRl
L3VhcGkvbGludXgva3ZtaS5oCkBAIC0xMDEsNiArMTAxLDcgQEAgc3RydWN0IGt2bWlfZXJyb3Jf
Y29kZSB7CiBzdHJ1Y3Qga3ZtaV9nZXRfdmVyc2lvbl9yZXBseSB7CiAJX191MzIgdmVyc2lvbjsK
IAlfX3UzMiBwYWRkaW5nOworCXN0cnVjdCBrdm1pX2ZlYXR1cmVzIGZlYXR1cmVzOwogfTsKIAog
c3RydWN0IGt2bWlfdm1fY2hlY2tfY29tbWFuZCB7CmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9rdm0veDg2XzY0L2t2bWlfdGVzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMva3ZtL3g4Nl82NC9rdm1pX3Rlc3QuYwppbmRleCAyMWIzZjdhNDU5YzguLmVhYmU3ZGFlMTQ5
ZSAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3g4Nl82NC9rdm1pX3Rl
c3QuYworKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0veDg2XzY0L2t2bWlfdGVzdC5j
CkBAIC01Niw2ICs1Niw4IEBAIHN0cnVjdCB2Y3B1X3dvcmtlcl9kYXRhIHsKIAlib29sIHJlc3Rh
cnRfb25fc2h1dGRvd247CiB9OwogCitzdGF0aWMgc3RydWN0IGt2bWlfZmVhdHVyZXMgZmVhdHVy
ZXM7CisKIHR5cGVkZWYgdm9pZCAoKmZjdF9wZl9ldmVudCkoc3RydWN0IGt2bV92bSAqdm0sIHN0
cnVjdCBrdm1pX21zZ19oZHIgKmhkciwKIAkJCQlzdHJ1Y3QgcGZfZXYgKmV2LAogCQkJCXN0cnVj
dCB2Y3B1X3JlcGx5ICpycGwpOwpAQCAtNDM3LDcgKzQzOSwxMCBAQCBzdGF0aWMgdm9pZCB0ZXN0
X2NtZF9nZXRfdmVyc2lvbih2b2lkKQogCQkgICAgIlVuZXhwZWN0ZWQgS1ZNSSB2ZXJzaW9uICVk
LCBleHBlY3RpbmcgJWRcbiIsCiAJCSAgICBycGwudmVyc2lvbiwgS1ZNSV9WRVJTSU9OKTsKIAor
CWZlYXR1cmVzID0gcnBsLmZlYXR1cmVzOworCiAJcHJfaW5mbygiS1ZNSSB2ZXJzaW9uOiAldVxu
IiwgcnBsLnZlcnNpb24pOworCXByX2luZm8oIlx0c2luZ2xlc3RlcDogJXVcbiIsIGZlYXR1cmVz
LnNpbmdsZXN0ZXApOwogfQogCiBzdGF0aWMgdm9pZCBjbWRfdm1fY2hlY2tfY29tbWFuZChfX3Ux
NiBpZCwgX191MTYgcGFkZGluZywgaW50IGV4cGVjdGVkX2VycikKZGlmZiAtLWdpdCBhL3ZpcnQv
a3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9pbnQuaCBiL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3Zt
aV9pbnQuaAppbmRleCA5ZjIzNDFmZTIxZDUuLjY4YjhkNjBhN2ZhYyAxMDA2NDQKLS0tIGEvdmly
dC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX2ludC5oCisrKyBiL3ZpcnQva3ZtL2ludHJvc3BlY3Rp
b24va3ZtaV9pbnQuaApAQCAtMTM4LDUgKzEzOCw2IEBAIHZvaWQga3ZtaV9hcmNoX3VwZGF0ZV9w
YWdlX3RyYWNraW5nKHN0cnVjdCBrdm0gKmt2bSwKIAkJCQkgICAgc3RydWN0IGt2bWlfbWVtX2Fj
Y2VzcyAqbSk7CiB2b2lkIGt2bWlfYXJjaF9ob29rKHN0cnVjdCBrdm0gKmt2bSk7CiB2b2lkIGt2
bWlfYXJjaF91bmhvb2soc3RydWN0IGt2bSAqa3ZtKTsKK3ZvaWQga3ZtaV9hcmNoX2ZlYXR1cmVz
KHN0cnVjdCBrdm1pX2ZlYXR1cmVzICpmZWF0KTsKIAogI2VuZGlmCmRpZmYgLS1naXQgYS92aXJ0
L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfbXNnLmMgYi92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2
bWlfbXNnLmMKaW5kZXggMGEwZDEwYjQzZjJkLi5lNzU0Y2VlNDg5MTIgMTAwNjQ0Ci0tLSBhL3Zp
cnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9tc2cuYworKysgYi92aXJ0L2t2bS9pbnRyb3NwZWN0
aW9uL2t2bWlfbXNnLmMKQEAgLTE0OCw2ICsxNDgsOCBAQCBzdGF0aWMgaW50IGhhbmRsZV9nZXRf
dmVyc2lvbihzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2bWksCiAJbWVtc2V0KCZycGwsIDAs
IHNpemVvZihycGwpKTsKIAlycGwudmVyc2lvbiA9IGt2bWlfdmVyc2lvbigpOwogCisJa3ZtaV9h
cmNoX2ZlYXR1cmVzKCZycGwuZmVhdHVyZXMpOworCiAJcmV0dXJuIGt2bWlfbXNnX3ZtX3JlcGx5
KGt2bWksIG1zZywgMCwgJnJwbCwgc2l6ZW9mKHJwbCkpOwogfQogCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlz
dApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3Rz
LmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
