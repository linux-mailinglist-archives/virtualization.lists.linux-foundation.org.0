Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F0A229C77
	for <lists.virtualization@lfdr.de>; Wed, 22 Jul 2020 18:01:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3F3998885A;
	Wed, 22 Jul 2020 16:01:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L7dKITmjlcIl; Wed, 22 Jul 2020 16:01:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8FB9F8876A;
	Wed, 22 Jul 2020 16:01:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 81735C004E;
	Wed, 22 Jul 2020 16:01:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE98FC004E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D059488604
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oXcmK59ZVlTa
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8EA9587B0F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:35 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 2C6B2305D7EC; Wed, 22 Jul 2020 19:01:32 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.6])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 22FDD307279A;
 Wed, 22 Jul 2020 19:01:32 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v1 09/34] KVM: x86: add .control_ept_view()
Date: Wed, 22 Jul 2020 19:00:56 +0300
Message-Id: <20200722160121.9601-10-alazar@bitdefender.com>
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

RnJvbTogyJh0ZWZhbiDImGljbGVydSA8c3NpY2xlcnVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyB3
aWxsIGJlIHVzZWQgYnkgdGhlIGludHJvc3BlY3Rpb24gdG9vbCB0byBjb250cm9sIHRoZSBFUFQg
dmlld3MgdG8Kd2hpY2ggdGhlIGd1ZXN0IGlzIGFsbG93ZWQgdG8gc3dpdGNoLgoKU2lnbmVkLW9m
Zi1ieTogyJh0ZWZhbiDImGljbGVydSA8c3NpY2xlcnVAYml0ZGVmZW5kZXIuY29tPgpTaWduZWQt
b2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+Ci0tLQogYXJj
aC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCB8ICAxICsKIGFyY2gveDg2L2t2bS92bXgvdm14
LmMgICAgICAgICAgfCAxOCArKysrKysrKysrKysrKysrKy0KIGFyY2gveDg2L2t2bS92bXgvdm14
LmggICAgICAgICAgfCAgMiArKwogMyBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3Qu
aCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKaW5kZXggMzAwZjdmYzQzOTg3Li41
ZTI0MTg2MzE1M2YgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgK
KysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaApAQCAtMTMxMCw2ICsxMzEwLDcg
QEAgc3RydWN0IGt2bV94ODZfb3BzIHsKIAlib29sICgqZ2V0X2VwdHBfc3dpdGNoaW5nX3N0YXR1
cykodm9pZCk7CiAJdTE2ICgqZ2V0X2VwdF92aWV3KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwog
CWludCAoKnNldF9lcHRfdmlldykoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1MTYgdmlldyk7CisJ
aW50ICgqY29udHJvbF9lcHRfdmlldykoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1MTYgdmlldywg
dTggdmlzaWJsZSk7CiB9OwogCiBzdHJ1Y3Qga3ZtX3g4Nl9uZXN0ZWRfb3BzIHsKZGlmZiAtLWdp
dCBhL2FyY2gveDg2L2t2bS92bXgvdm14LmMgYi9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jCmluZGV4
IDBkMzk0ODdjZTVjNi4uY2JjOTQzZDIxN2UzIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vdm14
L3ZteC5jCisrKyBiL2FyY2gveDg2L2t2bS92bXgvdm14LmMKQEAgLTMxMzgsOCArMzEzOCwxMSBA
QCBzdGF0aWMgdm9pZCB2bXhfY29uc3RydWN0X2VwdHBfd2l0aF9pbmRleChzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHUsCiAJaWYgKCFlcHRwX2xpc3QpCiAJCXJldHVybjsKIAotCWVwdHBfbGlzdFt2aWV3
XSA9IGNvbnN0cnVjdF9lcHRwKHZjcHUsCisJaWYgKHRlc3RfYml0KHZpZXcsICZ2bXgtPmFsbG93
ZWRfdmlld3MpKQorCQllcHRwX2xpc3Rbdmlld10gPSBjb25zdHJ1Y3RfZXB0cCh2Y3B1LAogCQkJ
CXZjcHUtPmFyY2gubW11LT5yb290X2hwYV9hbHR2aWV3c1t2aWV3XSk7CisJZWxzZQorCQllcHRw
X2xpc3Rbdmlld10gPSAofjBVTEwpOwogfQogCiBzdGF0aWMgdm9pZCB2bXhfY29uc3RydWN0X2Vw
dHBfbGlzdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCkBAIC00Mzk1LDYgKzQzOTgsMTggQEAgc3Rh
dGljIGludCB2bXhfc2V0X2VwdF92aWV3KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdTE2IHZpZXcp
CiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBpbnQgdm14X2NvbnRyb2xfZXB0X3ZpZXcoc3RydWN0
IGt2bV92Y3B1ICp2Y3B1LCB1MTYgdmlldywgdTggdmlzaWJsZSkKK3sKKwlpZiAodmlzaWJsZSkK
KwkJc2V0X2JpdCh2aWV3LCAmdG9fdm14KHZjcHUpLT5hbGxvd2VkX3ZpZXdzKTsKKwllbHNlCisJ
CWNsZWFyX2JpdCh2aWV3LCAmdG9fdm14KHZjcHUpLT5hbGxvd2VkX3ZpZXdzKTsKKworCXZteF9j
b25zdHJ1Y3RfZXB0cF93aXRoX2luZGV4KHZjcHUsIHZpZXcpOworCisJcmV0dXJuIDA7Cit9CisK
ICNkZWZpbmUgVk1YX1hTU19FWElUX0JJVE1BUCAwCiAKIC8qCkBAIC04Mjg0LDYgKzgyOTksNyBA
QCBzdGF0aWMgc3RydWN0IGt2bV94ODZfb3BzIHZteF94ODZfb3BzIF9faW5pdGRhdGEgPSB7CiAJ
LmdldF9lcHRwX3N3aXRjaGluZ19zdGF0dXMgPSB2bXhfZ2V0X2VwdHBfc3dpdGNoaW5nX3N0YXR1
cywKIAkuZ2V0X2VwdF92aWV3ID0gdm14X2dldF9lcHRfdmlldywKIAkuc2V0X2VwdF92aWV3ID0g
dm14X3NldF9lcHRfdmlldywKKwkuY29udHJvbF9lcHRfdmlldyA9IHZteF9jb250cm9sX2VwdF92
aWV3LAogfTsKIAogc3RhdGljIF9faW5pdCBpbnQgaGFyZHdhcmVfc2V0dXAodm9pZCkKZGlmZiAt
LWdpdCBhL2FyY2gveDg2L2t2bS92bXgvdm14LmggYi9hcmNoL3g4Ni9rdm0vdm14L3ZteC5oCmlu
ZGV4IDRlMmY4NjQ1OGNhMi4uMzhkNTBmYzczNTdiIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0v
dm14L3ZteC5oCisrKyBiL2FyY2gveDg2L2t2bS92bXgvdm14LmgKQEAgLTMwMCw2ICszMDAsOCBA
QCBzdHJ1Y3QgdmNwdV92bXggewogCXN0cnVjdCBwYWdlICplcHRwX2xpc3RfcGc7CiAJLyogVGhl
IHZpZXcgdGhpcyB2Y3B1IG9wZXJhdGVzIG9uLiAqLwogCXUxNiB2aWV3OworCS8qIFZpc2libGUg
RVBUIHZpZXdzIGJpdG1hcCBmb3IgaW4tZ3Vlc3QgVk1GVU5DLiAqLworCXVuc2lnbmVkIGxvbmcg
YWxsb3dlZF92aWV3czsKIH07CiAKIGVudW0gZXB0X3BvaW50ZXJzX3N0YXR1cyB7Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1h
aWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXph
dGlvbg==
