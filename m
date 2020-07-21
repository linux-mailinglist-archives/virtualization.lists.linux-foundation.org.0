Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 46936228A9F
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 23:16:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E6AAB86BBD;
	Tue, 21 Jul 2020 21:16:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lz1Xy2jqHP_m; Tue, 21 Jul 2020 21:16:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 145E28511C;
	Tue, 21 Jul 2020 21:16:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DFCF6C016F;
	Tue, 21 Jul 2020 21:16:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF312C08A6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9B43D886E5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bGCkZtRlAN-L
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A9870886ED
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:57 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 CCF60305D76E; Wed, 22 Jul 2020 00:09:22 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id ACAA0304FA14;
 Wed, 22 Jul 2020 00:09:22 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v9 25/84] KVM: x86: add .gpt_translation_fault()
Date: Wed, 22 Jul 2020 00:08:23 +0300
Message-Id: <20200721210922.7646-26-alazar@bitdefender.com>
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyBmdW5jdGlv
biBpcyBuZWVkZWQgZm9yIHRoZSBLVk1JX0VWRU5UX1BGIGV2ZW50LCB0byBhdm9pZCBzZW5kaW5n
CnN1Y2ggZXZlbnRzIHRvIHRoZSBpbnRyb3NwZWN0aW9uIHRvb2wgaWYgY2F1c2VkIGJ5IGEgZ3Vl
c3QgcGFnZSB0YWJsZSB3YWxrLgoKVGhlIGNvZGUgcGF0aCBpczogZW11bGF0b3IgLT4ge3JlYWQs
d3JpdGUsZmV0Y2h9IGNhbGxiYWNrcyAtPiBwYWdlIHRyYWNraW5nCi0+IHBhZ2UgdHJhY2tpbmcg
Y2FsbGJhY2tzIC0+IEtWTUlfRVZFTlRfUEYuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaSBEb27Im3Ug
PG1kb250dUBiaXRkZWZlbmRlci5jb20+ClNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8
YWxhemFyQGJpdGRlZmVuZGVyLmNvbT4KLS0tCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9z
dC5oIHwgIDEgKwogYXJjaC94ODYva3ZtL3N2bS9zdm0uYyAgICAgICAgICB8IDEyICsrKysrKysr
KysrKwogYXJjaC94ODYva3ZtL3ZteC92bXguYyAgICAgICAgICB8ICA4ICsrKysrKysrCiAzIGZp
bGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNs
dWRlL2FzbS9rdm1faG9zdC5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAppbmRl
eCBmYjQxMTk5YjMzZmMuLmE5MDVlMTRlNGM3NSAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVk
ZS9hc20va3ZtX2hvc3QuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCkBA
IC0xMjkzLDYgKzEyOTMsNyBAQCBzdHJ1Y3Qga3ZtX3g4Nl9vcHMgewogCiAJdTY0ICgqZmF1bHRf
Z2xhKShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogCWJvb2wgKCpzcHRfZmF1bHQpKHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSk7CisJYm9vbCAoKmdwdF90cmFuc2xhdGlvbl9mYXVsdCkoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1KTsKIH07CiAKIHN0cnVjdCBrdm1feDg2X25lc3RlZF9vcHMgewpkaWZmIC0t
Z2l0IGEvYXJjaC94ODYva3ZtL3N2bS9zdm0uYyBiL2FyY2gveDg2L2t2bS9zdm0vc3ZtLmMKaW5k
ZXggN2VjZmExMGRjZTVkLi41ODA5OTc3MDFiMWMgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS9z
dm0vc3ZtLmMKKysrIGIvYXJjaC94ODYva3ZtL3N2bS9zdm0uYwpAQCAtNDA5Nyw2ICs0MDk3LDE3
IEBAIHN0YXRpYyBib29sIHN2bV9zcHRfZmF1bHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogCXJl
dHVybiAodm1jYi0+Y29udHJvbC5leGl0X2NvZGUgPT0gU1ZNX0VYSVRfTlBGKTsKIH0KIAorc3Rh
dGljIGJvb2wgc3ZtX2dwdF90cmFuc2xhdGlvbl9mYXVsdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUp
Cit7CisJc3RydWN0IHZjcHVfc3ZtICpzdm0gPSB0b19zdm0odmNwdSk7CisJc3RydWN0IHZtY2Ig
KnZtY2IgPSBnZXRfaG9zdF92bWNiKHN2bSk7CisKKwlpZiAodm1jYi0+Y29udHJvbC5leGl0X2lu
Zm9fMSAmIFBGRVJSX0dVRVNUX1BBR0VfTUFTSykKKwkJcmV0dXJuIHRydWU7CisKKwlyZXR1cm4g
ZmFsc2U7Cit9CisKIHN0YXRpYyBzdHJ1Y3Qga3ZtX3g4Nl9vcHMgc3ZtX3g4Nl9vcHMgX19pbml0
ZGF0YSA9IHsKIAkuaGFyZHdhcmVfdW5zZXR1cCA9IHN2bV9oYXJkd2FyZV90ZWFyZG93biwKIAku
aGFyZHdhcmVfZW5hYmxlID0gc3ZtX2hhcmR3YXJlX2VuYWJsZSwKQEAgLTQyMjYsNiArNDIzNyw3
IEBAIHN0YXRpYyBzdHJ1Y3Qga3ZtX3g4Nl9vcHMgc3ZtX3g4Nl9vcHMgX19pbml0ZGF0YSA9IHsK
IAogCS5mYXVsdF9nbGEgPSBzdm1fZmF1bHRfZ2xhLAogCS5zcHRfZmF1bHQgPSBzdm1fc3B0X2Zh
dWx0LAorCS5ncHRfdHJhbnNsYXRpb25fZmF1bHQgPSBzdm1fZ3B0X3RyYW5zbGF0aW9uX2ZhdWx0
LAogfTsKIAogc3RhdGljIHN0cnVjdCBrdm1feDg2X2luaXRfb3BzIHN2bV9pbml0X29wcyBfX2lu
aXRkYXRhID0gewpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3ZteC92bXguYyBiL2FyY2gveDg2
L2t2bS92bXgvdm14LmMKaW5kZXggMTdiODgzNDVkZmI1Li5hMDQzZTNlN2QwOWEgMTAwNjQ0Ci0t
LSBhL2FyY2gveDg2L2t2bS92bXgvdm14LmMKKysrIGIvYXJjaC94ODYva3ZtL3ZteC92bXguYwpA
QCAtNzkxNiw2ICs3OTE2LDEzIEBAIHN0YXRpYyBib29sIHZteF9zcHRfZmF1bHQoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1KQogCXJldHVybiAodm14LT5leGl0X3JlYXNvbiA9PSBFWElUX1JFQVNPTl9F
UFRfVklPTEFUSU9OKTsKIH0KIAorc3RhdGljIGJvb2wgdm14X2dwdF90cmFuc2xhdGlvbl9mYXVs
dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCit7CisJaWYgKHZjcHUtPmFyY2guZXhpdF9xdWFsaWZp
Y2F0aW9uICYgRVBUX1ZJT0xBVElPTl9HVkFfVFJBTlNMQVRFRCkKKwkJcmV0dXJuIGZhbHNlOwor
CXJldHVybiB0cnVlOworfQorCiBzdGF0aWMgc3RydWN0IGt2bV94ODZfb3BzIHZteF94ODZfb3Bz
IF9faW5pdGRhdGEgPSB7CiAJLmhhcmR3YXJlX3Vuc2V0dXAgPSBoYXJkd2FyZV91bnNldHVwLAog
CkBAIC04MDU1LDYgKzgwNjIsNyBAQCBzdGF0aWMgc3RydWN0IGt2bV94ODZfb3BzIHZteF94ODZf
b3BzIF9faW5pdGRhdGEgPSB7CiAKIAkuZmF1bHRfZ2xhID0gdm14X2ZhdWx0X2dsYSwKIAkuc3B0
X2ZhdWx0ID0gdm14X3NwdF9mYXVsdCwKKwkuZ3B0X3RyYW5zbGF0aW9uX2ZhdWx0ID0gdm14X2dw
dF90cmFuc2xhdGlvbl9mYXVsdCwKIH07CiAKIHN0YXRpYyBfX2luaXQgaW50IGhhcmR3YXJlX3Nl
dHVwKHZvaWQpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
ClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1m
b3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9s
aXN0aW5mby92aXJ0dWFsaXphdGlvbg==
