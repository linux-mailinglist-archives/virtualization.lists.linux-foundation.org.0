Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 176401978B9
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 12:19:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C008087985;
	Mon, 30 Mar 2020 10:19:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TgrlWmauD9Ay; Mon, 30 Mar 2020 10:19:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0A1B68793D;
	Mon, 30 Mar 2020 10:19:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DA022C1D7E;
	Mon, 30 Mar 2020 10:19:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2E065C07FF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1D54D86A1D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:19:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d4RTblkD1nvU
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:19:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4BBDF86A14
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:19:48 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 E555C305D3D7; Mon, 30 Mar 2020 13:13:02 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id B1394303EF21;
 Mon, 30 Mar 2020 13:13:02 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v8 81/81] KVM: x86: call the page tracking code on emulation
 failure
Date: Mon, 30 Mar 2020 13:13:08 +0300
Message-Id: <20200330101308.21702-82-alazar@bitdefender.com>
In-Reply-To: <20200330101308.21702-1-alazar@bitdefender.com>
References: <20200330101308.21702-1-alazar@bitdefender.com>
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
aC94ODYva3ZtL3g4Ni5jIGIvYXJjaC94ODYva3ZtL3g4Ni5jCmluZGV4IDEyZTliNDY4OTAyNS4u
ZGU5MDMzNWQyZTAxIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0veDg2LmMKKysrIGIvYXJjaC94
ODYva3ZtL3g4Ni5jCkBAIC02NzkzLDYgKzY3OTMsNTEgQEAgc3RhdGljIGJvb2wgaXNfdm13YXJl
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
a3ZtX3ZjcHUgKnZjcHUsIGdwYV90IGNyMl9vcl9ncGEsCiAJCQkgICAgaW50IGVtdWxhdGlvbl90
eXBlLCB2b2lkICppbnNuLCBpbnQgaW5zbl9sZW4pCiB7CkBAIC02ODQyLDYgKzY4ODcsOCBAQCBp
bnQgeDg2X2VtdWxhdGVfaW5zdHJ1Y3Rpb24oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBncGFfdCBj
cjJfb3JfZ3BhLAogCQkJCWt2bV9xdWV1ZV9leGNlcHRpb24odmNwdSwgVURfVkVDVE9SKTsKIAkJ
CQlyZXR1cm4gMTsKIAkJCX0KKwkJCWlmICgha3ZtX3BhZ2VfdHJhY2tfZW11bGF0aW9uX2ZhaWx1
cmUodmNwdSwgY3IyX29yX2dwYSkpCisJCQkJcmV0dXJuIDE7CiAJCQlpZiAocmVleGVjdXRlX2lu
c3RydWN0aW9uKHZjcHUsIGNyMl9vcl9ncGEsCiAJCQkJCQkgIHdyaXRlX2ZhdWx0X3RvX3NwdCwK
IAkJCQkJCSAgZW11bGF0aW9uX3R5cGUpKQpAQCAtNjkwMCw2ICs2OTQ3LDggQEAgaW50IHg4Nl9l
bXVsYXRlX2luc3RydWN0aW9uKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgZ3BhX3QgY3IyX29yX2dw
YSwKIAkJcmV0dXJuIDE7CiAKIAlpZiAociA9PSBFTVVMQVRJT05fRkFJTEVEKSB7CisJCWlmICgh
a3ZtX3BhZ2VfdHJhY2tfZW11bGF0aW9uX2ZhaWx1cmUodmNwdSwgY3IyX29yX2dwYSkpCisJCQly
ZXR1cm4gMTsKIAkJaWYgKHJlZXhlY3V0ZV9pbnN0cnVjdGlvbih2Y3B1LCBjcjJfb3JfZ3BhLCB3
cml0ZV9mYXVsdF90b19zcHQsCiAJCQkJCWVtdWxhdGlvbl90eXBlKSkKIAkJCXJldHVybiAxOwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXph
dGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5v
cmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmly
dHVhbGl6YXRpb24=
