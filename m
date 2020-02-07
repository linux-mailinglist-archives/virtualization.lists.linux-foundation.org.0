Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CC6155DF5
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 19:26:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 219E687FB9;
	Fri,  7 Feb 2020 18:26:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0xaY8eH5BTQk; Fri,  7 Feb 2020 18:26:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0373B87F78;
	Fri,  7 Feb 2020 18:26:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E6486C013E;
	Fri,  7 Feb 2020 18:26:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1C68DC013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EB24D86E4E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xd1fzK8mUtny
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A009E86E26
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:55 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 C004F305D3DA; Fri,  7 Feb 2020 20:16:39 +0200 (EET)
Received: from host.bbu.bitdefender.biz (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id A81393052078;
 Fri,  7 Feb 2020 20:16:39 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v7 23/78] KVM: x86: add .spt_fault()
Date: Fri,  7 Feb 2020 20:15:41 +0200
Message-Id: <20200207181636.1065-24-alazar@bitdefender.com>
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyBmdW5jdGlv
biBpcyBuZWVkZWQgZm9yIHRoZSBLVk1JX0VWRU5UX1BGIGV2ZW50LgoKU2lnbmVkLW9mZi1ieTog
TWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgpTaWduZWQtb2ZmLWJ5OiBBZGFs
YmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+Ci0tLQogYXJjaC94ODYvaW5jbHVk
ZS9hc20va3ZtX2hvc3QuaCB8IDEgKwogYXJjaC94ODYva3ZtL3N2bS5jICAgICAgICAgICAgICB8
IDkgKysrKysrKysrCiBhcmNoL3g4Ni9rdm0vdm14L3ZteC5jICAgICAgICAgIHwgOCArKysrKysr
KwogMyBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC94
ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0
LmgKaW5kZXggNjA5NDg4NGQzMDE1Li4wZjI1ZjY5ZmM4YmUgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2
L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hv
c3QuaApAQCAtMTI1NSw2ICsxMjU1LDcgQEAgc3RydWN0IGt2bV94ODZfb3BzIHsKIAlpbnQgKCpl
bmFibGVfZGlyZWN0X3RsYmZsdXNoKShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogCiAJdTY0ICgq
ZmF1bHRfZ2xhKShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOworCWJvb2wgKCpzcHRfZmF1bHQpKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSk7CiB9OwogCiBzdHJ1Y3Qga3ZtX2FyY2hfYXN5bmNfcGYgewpk
aWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3N2bS5jIGIvYXJjaC94ODYva3ZtL3N2bS5jCmluZGV4
IGFiOTU3NjQ0NGU2Yi4uZjkwOGVmMzc0NjE3IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vc3Zt
LmMKKysrIGIvYXJjaC94ODYva3ZtL3N2bS5jCkBAIC03MzU4LDYgKzczNTgsMTQgQEAgc3RhdGlj
IHU2NCBzdm1fZmF1bHRfZ2xhKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIAlyZXR1cm4gc3ZtLT52
Y3B1LmFyY2guY3IyID8gc3ZtLT52Y3B1LmFyY2guY3IyIDogfjB1bGw7CiB9CiAKK3N0YXRpYyBi
b29sIHN2bV9zcHRfZmF1bHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQoreworCXN0cnVjdCB2Y3B1
X3N2bSAqc3ZtID0gdG9fc3ZtKHZjcHUpOworCXN0cnVjdCB2bWNiICp2bWNiID0gZ2V0X2hvc3Rf
dm1jYihzdm0pOworCisJcmV0dXJuICh2bWNiLT5jb250cm9sLmV4aXRfY29kZSA9PSBTVk1fRVhJ
VF9OUEYpOworfQorCiBzdGF0aWMgc3RydWN0IGt2bV94ODZfb3BzIHN2bV94ODZfb3BzIF9fcm9f
YWZ0ZXJfaW5pdCA9IHsKIAkuY3B1X2hhc19rdm1fc3VwcG9ydCA9IGhhc19zdm0sCiAJLmRpc2Fi
bGVkX2J5X2Jpb3MgPSBpc19kaXNhYmxlZCwKQEAgLTc1MDQsNiArNzUxMiw3IEBAIHN0YXRpYyBz
dHJ1Y3Qga3ZtX3g4Nl9vcHMgc3ZtX3g4Nl9vcHMgX19yb19hZnRlcl9pbml0ID0gewogCS5hcGlj
X2luaXRfc2lnbmFsX2Jsb2NrZWQgPSBzdm1fYXBpY19pbml0X3NpZ25hbF9ibG9ja2VkLAogCiAJ
LmZhdWx0X2dsYSA9IHN2bV9mYXVsdF9nbGEsCisJLnNwdF9mYXVsdCA9IHN2bV9zcHRfZmF1bHQs
CiB9OwogCiBzdGF0aWMgaW50IF9faW5pdCBzdm1faW5pdCh2b2lkKQpkaWZmIC0tZ2l0IGEvYXJj
aC94ODYva3ZtL3ZteC92bXguYyBiL2FyY2gveDg2L2t2bS92bXgvdm14LmMKaW5kZXggZjFkZjU3
MjVkMDZmLi42ZjQxYTdiMjdhMTEgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS92bXgvdm14LmMK
KysrIGIvYXJjaC94ODYva3ZtL3ZteC92bXguYwpAQCAtNzgyMyw2ICs3ODIzLDEzIEBAIHN0YXRp
YyB1NjQgdm14X2ZhdWx0X2dsYShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAJcmV0dXJuIH4wdWxs
OwogfQogCitzdGF0aWMgYm9vbCB2bXhfc3B0X2ZhdWx0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkK
K3sKKwljb25zdCBzdHJ1Y3QgdmNwdV92bXggKnZteCA9IHRvX3ZteCh2Y3B1KTsKKworCXJldHVy
biAodm14LT5leGl0X3JlYXNvbiA9PSBFWElUX1JFQVNPTl9FUFRfVklPTEFUSU9OKTsKK30KKwog
c3RhdGljIHN0cnVjdCBrdm1feDg2X29wcyB2bXhfeDg2X29wcyBfX3JvX2FmdGVyX2luaXQgPSB7
CiAJLmNwdV9oYXNfa3ZtX3N1cHBvcnQgPSBjcHVfaGFzX2t2bV9zdXBwb3J0LAogCS5kaXNhYmxl
ZF9ieV9iaW9zID0gdm14X2Rpc2FibGVkX2J5X2Jpb3MsCkBAIC03OTgyLDYgKzc5ODksNyBAQCBz
dGF0aWMgc3RydWN0IGt2bV94ODZfb3BzIHZteF94ODZfb3BzIF9fcm9fYWZ0ZXJfaW5pdCA9IHsK
IAkuYXBpY19pbml0X3NpZ25hbF9ibG9ja2VkID0gdm14X2FwaWNfaW5pdF9zaWduYWxfYmxvY2tl
ZCwKIAogCS5mYXVsdF9nbGEgPSB2bXhfZmF1bHRfZ2xhLAorCS5zcHRfZmF1bHQgPSB2bXhfc3B0
X2ZhdWx0LAogfTsKIAogc3RhdGljIHZvaWQgdm14X2NsZWFudXBfbDFkX2ZsdXNoKHZvaWQpCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0
aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0
dWFsaXphdGlvbg==
