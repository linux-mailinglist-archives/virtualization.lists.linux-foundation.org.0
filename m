Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 350E8155E47
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 19:36:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D85D0869FE;
	Fri,  7 Feb 2020 18:36:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5FwRbnPUIbYA; Fri,  7 Feb 2020 18:36:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C8912869BB;
	Fri,  7 Feb 2020 18:36:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AEE7DC013E;
	Fri,  7 Feb 2020 18:36:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA041C013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B7C4E22718
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:36:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qq0F6nOuG7ln
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by silver.osuosl.org (Postfix) with ESMTPS id 1A08322658
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:56 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 1CDEB305D36C; Fri,  7 Feb 2020 20:16:42 +0200 (EET)
Received: from host.bbu.bitdefender.biz (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 0E4333052080;
 Fri,  7 Feb 2020 20:16:42 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v7 78/78] KVM: x86: call the page tracking code on
 emulation failure
Date: Fri,  7 Feb 2020 20:16:36 +0200
Message-Id: <20200207181636.1065-79-alazar@bitdefender.com>
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhlIGluZm9ybWF0
aW9uIHdlIGNhbiBwcm92aWRlIHRoaXMgd2F5IGlzIGluY29tcGxldGUsIGJ1dCBjdXJyZW50IHVz
ZXJzCm9mIHRoZSBwYWdlIHRyYWNraW5nIGNvZGUgY2FuIHdvcmsgd2l0aCBpdC4KClNpZ25lZC1v
ZmYtYnk6IE1paGFpIERvbsibdSA8bWRvbnR1QGJpdGRlZmVuZGVyLmNvbT4KU2lnbmVkLW9mZi1i
eTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIGFyY2gveDg2
L2t2bS94ODYuYyB8IDQ5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJj
aC94ODYva3ZtL3g4Ni5jIGIvYXJjaC94ODYva3ZtL3g4Ni5jCmluZGV4IGI4N2ZmMzFjZTQ4Ni4u
NDViYTM0OTc0ODRlIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0veDg2LmMKKysrIGIvYXJjaC94
ODYva3ZtL3g4Ni5jCkBAIC02Njg2LDYgKzY2ODYsNTEgQEAgc3RhdGljIGJvb2wgaXNfdm13YXJl
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
RF9HVUVTVF9QQUdFKSkKKwkJcmV0dXJuIHRydWU7CisKKwlndmEgPSBrdm1feDg2X29wcy0+ZmF1
bHRfZ2xhKHZjcHUpOworCisJaWYgKGVycm9yX2NvZGUgJiBQRkVSUl9XUklURV9NQVNLKQorCQly
ZXQgPSBrdm1fcGFnZV90cmFja19wcmV3cml0ZSh2Y3B1LCBncGEsIGd2YSwgJmRhdGEsIDApOwor
CWVsc2UgaWYgKGVycm9yX2NvZGUgJiBQRkVSUl9VU0VSX01BU0spCisJCXJldCA9IGt2bV9wYWdl
X3RyYWNrX3ByZXJlYWQodmNwdSwgZ3BhLCBndmEsIDApOworCWVsc2UKKwkJcmV0ID0gdHJ1ZTsK
KworCXJldHVybiByZXQ7Cit9CisKIGludCB4ODZfZW11bGF0ZV9pbnN0cnVjdGlvbihzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUsCiAJCQkgICAgdW5zaWduZWQgbG9uZyBjcjIsCiAJCQkgICAgaW50IGVt
dWxhdGlvbl90eXBlLApAQCAtNjczOCw2ICs2NzgzLDggQEAgaW50IHg4Nl9lbXVsYXRlX2luc3Ry
dWN0aW9uKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKIAkJCQlrdm1fcXVldWVfZXhjZXB0aW9uKHZj
cHUsIFVEX1ZFQ1RPUik7CiAJCQkJcmV0dXJuIDE7CiAJCQl9CisJCQlpZiAoIWt2bV9wYWdlX3Ry
YWNrX2VtdWxhdGlvbl9mYWlsdXJlKHZjcHUsIGNyMikpCisJCQkJcmV0dXJuIDE7CiAJCQlpZiAo
cmVleGVjdXRlX2luc3RydWN0aW9uKHZjcHUsIGNyMiwgd3JpdGVfZmF1bHRfdG9fc3B0LAogCQkJ
CQkJZW11bGF0aW9uX3R5cGUpKQogCQkJCXJldHVybiAxOwpAQCAtNjc5NSw2ICs2ODQyLDggQEAg
aW50IHg4Nl9lbXVsYXRlX2luc3RydWN0aW9uKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKIAkJcmV0
dXJuIDE7CiAKIAlpZiAociA9PSBFTVVMQVRJT05fRkFJTEVEKSB7CisJCWlmICgha3ZtX3BhZ2Vf
dHJhY2tfZW11bGF0aW9uX2ZhaWx1cmUodmNwdSwgY3IyKSkKKwkJCXJldHVybiAxOwogCQlpZiAo
cmVleGVjdXRlX2luc3RydWN0aW9uKHZjcHUsIGNyMiwgd3JpdGVfZmF1bHRfdG9fc3B0LAogCQkJ
CQllbXVsYXRpb25fdHlwZSkpCiAJCQlyZXR1cm4gMTsKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1
YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhm
b3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
