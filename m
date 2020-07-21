Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 093A3228B36
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 23:26:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AD320882AB;
	Tue, 21 Jul 2020 21:26:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CwEx4JEJo3Ji; Tue, 21 Jul 2020 21:26:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A2DCF8832D;
	Tue, 21 Jul 2020 21:26:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 88895C08A2;
	Tue, 21 Jul 2020 21:26:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4FF4DC08A2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1A71986B82
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lS_eETpSe9XB
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D21C786B96
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:56 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 720FE305D50C; Wed, 22 Jul 2020 00:09:32 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 54372303EFFA;
 Wed, 22 Jul 2020 00:09:32 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v9 84/84] KVM: x86: call the page tracking code on emulation
 failure
Date: Wed, 22 Jul 2020 00:09:22 +0300
Message-Id: <20200721210922.7646-85-alazar@bitdefender.com>
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhlIGluZm9ybWF0
aW9uIHdlIGNhbiBwcm92aWRlIHRoaXMgd2F5IGlzIGluY29tcGxldGUsIGJ1dCBjdXJyZW50IHVz
ZXJzCm9mIHRoZSBwYWdlIHRyYWNraW5nIGNvZGUgY2FuIHdvcmsgd2l0aCBpdC4KClNpZ25lZC1v
ZmYtYnk6IE1paGFpIERvbsibdSA8bWRvbnR1QGJpdGRlZmVuZGVyLmNvbT4KU2lnbmVkLW9mZi1i
eTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIGFyY2gveDg2
L2t2bS94ODYuYyB8IDQ5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJj
aC94ODYva3ZtL3g4Ni5jIGIvYXJjaC94ODYva3ZtL3g4Ni5jCmluZGV4IDAyYjc0YTU3Y2EwMS4u
ZmViMjBiMjliYjkyIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0veDg2LmMKKysrIGIvYXJjaC94
ODYva3ZtL3g4Ni5jCkBAIC02OTExLDYgKzY5MTEsNTEgQEAgc3RhdGljIGJvb2wgaXNfdm13YXJl
X2JhY2tkb29yX29wY29kZShzdHJ1Y3QgeDg2X2VtdWxhdGVfY3R4dCAqY3R4dCkKIAlyZXR1cm4g
ZmFsc2U7CiB9CiAKKy8qCisgKiBXaXRoIGludHJvc3BlY3Rpb24gZW5hYmxlZCwgZW11bGF0aW9u
IGZhaWx1cmVzIHRyYW5zbGF0ZSBpbiBldmVudHMgYmVpbmcKKyAqIG1pc3NlZCBiZWNhdXNlIHRo
ZSByZWFkL3dyaXRlIGNhbGxiYWNrcyBhcmUgbm90IGludm9rZWQuIEFsbCB3ZSBoYXZlIGlzCisg
KiB0aGUgZmV0Y2ggZXZlbnQgKGt2bV9wYWdlX3RyYWNrX3ByZWV4ZWMpLiBCZWxvdyB3ZSB1c2Ug
dGhlIEVQVC9OUFQgVk1FWElUCisgKiBpbmZvcm1hdGlvbiB0byBnZW5lcmF0ZSB0aGUgZXZlbnRz
LCBidXQgd2l0aG91dCBwcm92aWRpbmcgYWNjdXJhdGUKKyAqIGRhdGEgYW5kIHNpemUgKHRoZSBl
bXVsYXRvciB3b3VsZCBoYXZlIGNvbXB1dGVkIHRob3NlKS4gSWYgYW4gaW5zdHJ1Y3Rpb24KKyAq
IHdvdWxkIGhhcHBlbiB0byByZWFkIGFuZCB3cml0ZSBpbiB0aGUgc2FtZSBwYWdlLCB0aGUgc2Vj
b25kIGV2ZW50IHdpbGwKKyAqIGluaXRpYWxseSBiZSBtaXNzZWQgYW5kIHdlIHJlbHkgb24gdGhl
IHBhZ2UgdHJhY2tpbmcgbWVjaGFuaXNtIHRvIGJyaW5nCisgKiB1cyBiYWNrIGhlcmUgdG8gc2Vu
ZCBpdC4KKyAqLworc3RhdGljIGJvb2wga3ZtX3BhZ2VfdHJhY2tfZW11bGF0aW9uX2ZhaWx1cmUo
c3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBncGFfdCBncGEpCit7CisJdTY0IGVycm9yX2NvZGUgPSB2
Y3B1LT5hcmNoLmVycm9yX2NvZGU7CisJdTggZGF0YSA9IDA7CisJZ3ZhX3QgZ3ZhOworCWJvb2wg
cmV0OworCisJLyogTU1JTyBlbXVsYXRpb24gZmFpbHVyZXMgc2hvdWxkIGJlIHRyZWF0ZWQgdGhl
IG5vcm1hbCB3YXkgKi8KKwlpZiAodW5saWtlbHkoZXJyb3JfY29kZSAmIFBGRVJSX1JTVkRfTUFT
SykpCisJCXJldHVybiB0cnVlOworCisJLyogRVBUL05UUCBtdXN0IGJlIGVuYWJsZWQgKi8KKwlp
ZiAodW5saWtlbHkoIXZjcHUtPmFyY2gubW11LT5kaXJlY3RfbWFwKSkKKwkJcmV0dXJuIHRydWU7
CisKKwkvKgorCSAqIFRoZSBBL0QgYml0IGVtdWxhdGlvbiBzaG91bGQgbWFrZSB0aGlzIHRlc3Qg
dW5uZWVkZWQsIGJ1dCBqdXN0CisJICogaW4gY2FzZQorCSAqLworCWlmICh1bmxpa2VseSgoZXJy
b3JfY29kZSAmIFBGRVJSX05FU1RFRF9HVUVTVF9QQUdFKSA9PQorCQkgICAgIFBGRVJSX05FU1RF
RF9HVUVTVF9QQUdFKSkKKwkJcmV0dXJuIHRydWU7CisKKwlndmEgPSBrdm1feDg2X29wcy5mYXVs
dF9nbGEodmNwdSk7CisKKwlpZiAoZXJyb3JfY29kZSAmIFBGRVJSX1dSSVRFX01BU0spCisJCXJl
dCA9IGt2bV9wYWdlX3RyYWNrX3ByZXdyaXRlKHZjcHUsIGdwYSwgZ3ZhLCAmZGF0YSwgMCk7CisJ
ZWxzZSBpZiAoZXJyb3JfY29kZSAmIFBGRVJSX1VTRVJfTUFTSykKKwkJcmV0ID0ga3ZtX3BhZ2Vf
dHJhY2tfcHJlcmVhZCh2Y3B1LCBncGEsIGd2YSwgMCk7CisJZWxzZQorCQlyZXQgPSB0cnVlOwor
CisJcmV0dXJuIHJldDsKK30KKwogaW50IHg4Nl9lbXVsYXRlX2luc3RydWN0aW9uKHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSwgZ3BhX3QgY3IyX29yX2dwYSwKIAkJCSAgICBpbnQgZW11bGF0aW9uX3R5
cGUsIHZvaWQgKmluc24sIGludCBpbnNuX2xlbikKIHsKQEAgLTY5NjAsNiArNzAwNSw4IEBAIGlu
dCB4ODZfZW11bGF0ZV9pbnN0cnVjdGlvbihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGdwYV90IGNy
Ml9vcl9ncGEsCiAJCQkJa3ZtX3F1ZXVlX2V4Y2VwdGlvbih2Y3B1LCBVRF9WRUNUT1IpOwogCQkJ
CXJldHVybiAxOwogCQkJfQorCQkJaWYgKCFrdm1fcGFnZV90cmFja19lbXVsYXRpb25fZmFpbHVy
ZSh2Y3B1LCBjcjJfb3JfZ3BhKSkKKwkJCQlyZXR1cm4gMTsKIAkJCWlmIChyZWV4ZWN1dGVfaW5z
dHJ1Y3Rpb24odmNwdSwgY3IyX29yX2dwYSwKIAkJCQkJCSAgd3JpdGVfZmF1bHRfdG9fc3B0LAog
CQkJCQkJICBlbXVsYXRpb25fdHlwZSkpCkBAIC03MDI5LDYgKzcwNzYsOCBAQCBpbnQgeDg2X2Vt
dWxhdGVfaW5zdHJ1Y3Rpb24oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBncGFfdCBjcjJfb3JfZ3Bh
LAogCQlyZXR1cm4gMTsKIAogCWlmIChyID09IEVNVUxBVElPTl9GQUlMRUQpIHsKKwkJaWYgKCFr
dm1fcGFnZV90cmFja19lbXVsYXRpb25fZmFpbHVyZSh2Y3B1LCBjcjJfb3JfZ3BhKSkKKwkJCXJl
dHVybiAxOwogCQlpZiAocmVleGVjdXRlX2luc3RydWN0aW9uKHZjcHUsIGNyMl9vcl9ncGEsIHdy
aXRlX2ZhdWx0X3RvX3NwdCwKIAkJCQkJZW11bGF0aW9uX3R5cGUpKQogCQkJcmV0dXJuIDE7Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0
aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0
dWFsaXphdGlvbg==
