Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A80719787B
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 12:13:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 76C6F884C9;
	Mon, 30 Mar 2020 10:13:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aOxoWb+Z4PTH; Mon, 30 Mar 2020 10:13:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0A56B8845E;
	Mon, 30 Mar 2020 10:13:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DFE52C1AE8;
	Mon, 30 Mar 2020 10:12:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 41CA1C1D85
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 38912881BB
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u73svALjSuFf
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8794787B9B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:54 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 AB4773074895; Mon, 30 Mar 2020 13:12:52 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 8BA61305B7A3;
 Mon, 30 Mar 2020 13:12:52 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v8 25/81] KVM: x86: add .spt_fault()
Date: Mon, 30 Mar 2020 13:12:12 +0300
Message-Id: <20200330101308.21702-26-alazar@bitdefender.com>
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyBmdW5jdGlv
biBpcyBuZWVkZWQgZm9yIHRoZSBLVk1JX0VWRU5UX1BGIGV2ZW50LgoKU2lnbmVkLW9mZi1ieTog
TWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgpTaWduZWQtb2ZmLWJ5OiBBZGFs
YmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+Ci0tLQogYXJjaC94ODYvaW5jbHVk
ZS9hc20va3ZtX2hvc3QuaCB8IDEgKwogYXJjaC94ODYva3ZtL3N2bS5jICAgICAgICAgICAgICB8
IDkgKysrKysrKysrCiBhcmNoL3g4Ni9rdm0vdm14L3ZteC5jICAgICAgICAgIHwgOCArKysrKysr
KwogMyBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC94
ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0
LmgKaW5kZXggYzQyNWJmMWQyNTdhLi4xOGU4NzlkNTA4YzIgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2
L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hv
c3QuaApAQCAtMTI5MCw2ICsxMjkwLDcgQEAgc3RydWN0IGt2bV94ODZfb3BzIHsKIAlpbnQgKCpl
bmFibGVfZGlyZWN0X3RsYmZsdXNoKShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogCiAJdTY0ICgq
ZmF1bHRfZ2xhKShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOworCWJvb2wgKCpzcHRfZmF1bHQpKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSk7CiB9OwogCiBzdHJ1Y3Qga3ZtX2FyY2hfYXN5bmNfcGYgewpk
aWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3N2bS5jIGIvYXJjaC94ODYva3ZtL3N2bS5jCmluZGV4
IDc2N2ZmZDNjZTRiMS4uNDJmYWI0NmU2NTUzIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vc3Zt
LmMKKysrIGIvYXJjaC94ODYva3ZtL3N2bS5jCkBAIC03NTI5LDYgKzc1MjksMTQgQEAgc3RhdGlj
IHU2NCBzdm1fZmF1bHRfZ2xhKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIAlyZXR1cm4gc3ZtLT52
Y3B1LmFyY2guY3IyID8gc3ZtLT52Y3B1LmFyY2guY3IyIDogfjB1bGw7CiB9CiAKK3N0YXRpYyBi
b29sIHN2bV9zcHRfZmF1bHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQoreworCXN0cnVjdCB2Y3B1
X3N2bSAqc3ZtID0gdG9fc3ZtKHZjcHUpOworCXN0cnVjdCB2bWNiICp2bWNiID0gZ2V0X2hvc3Rf
dm1jYihzdm0pOworCisJcmV0dXJuICh2bWNiLT5jb250cm9sLmV4aXRfY29kZSA9PSBTVk1fRVhJ
VF9OUEYpOworfQorCiBzdGF0aWMgc3RydWN0IGt2bV94ODZfb3BzIHN2bV94ODZfb3BzIF9fcm9f
YWZ0ZXJfaW5pdCA9IHsKIAkuY3B1X2hhc19rdm1fc3VwcG9ydCA9IGhhc19zdm0sCiAJLmRpc2Fi
bGVkX2J5X2Jpb3MgPSBpc19kaXNhYmxlZCwKQEAgLTc2NzksNiArNzY4Nyw3IEBAIHN0YXRpYyBz
dHJ1Y3Qga3ZtX3g4Nl9vcHMgc3ZtX3g4Nl9vcHMgX19yb19hZnRlcl9pbml0ID0gewogCS5hcGlj
X2luaXRfc2lnbmFsX2Jsb2NrZWQgPSBzdm1fYXBpY19pbml0X3NpZ25hbF9ibG9ja2VkLAogCiAJ
LmZhdWx0X2dsYSA9IHN2bV9mYXVsdF9nbGEsCisJLnNwdF9mYXVsdCA9IHN2bV9zcHRfZmF1bHQs
CiB9OwogCiBzdGF0aWMgaW50IF9faW5pdCBzdm1faW5pdCh2b2lkKQpkaWZmIC0tZ2l0IGEvYXJj
aC94ODYva3ZtL3ZteC92bXguYyBiL2FyY2gveDg2L2t2bS92bXgvdm14LmMKaW5kZXggYzFjNjQ4
NWFlYmYxLi5jYzMwNTEzZWNhOTUgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS92bXgvdm14LmMK
KysrIGIvYXJjaC94ODYva3ZtL3ZteC92bXguYwpAQCAtNzkxNCw2ICs3OTE0LDEzIEBAIHN0YXRp
YyB1NjQgdm14X2ZhdWx0X2dsYShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAJcmV0dXJuIH4wdWxs
OwogfQogCitzdGF0aWMgYm9vbCB2bXhfc3B0X2ZhdWx0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkK
K3sKKwljb25zdCBzdHJ1Y3QgdmNwdV92bXggKnZteCA9IHRvX3ZteCh2Y3B1KTsKKworCXJldHVy
biAodm14LT5leGl0X3JlYXNvbiA9PSBFWElUX1JFQVNPTl9FUFRfVklPTEFUSU9OKTsKK30KKwog
c3RhdGljIHN0cnVjdCBrdm1feDg2X29wcyB2bXhfeDg2X29wcyBfX3JvX2FmdGVyX2luaXQgPSB7
CiAJLmNwdV9oYXNfa3ZtX3N1cHBvcnQgPSBjcHVfaGFzX2t2bV9zdXBwb3J0LAogCS5kaXNhYmxl
ZF9ieV9iaW9zID0gdm14X2Rpc2FibGVkX2J5X2Jpb3MsCkBAIC04MDc2LDYgKzgwODMsNyBAQCBz
dGF0aWMgc3RydWN0IGt2bV94ODZfb3BzIHZteF94ODZfb3BzIF9fcm9fYWZ0ZXJfaW5pdCA9IHsK
IAkuYXBpY19pbml0X3NpZ25hbF9ibG9ja2VkID0gdm14X2FwaWNfaW5pdF9zaWduYWxfYmxvY2tl
ZCwKIAogCS5mYXVsdF9nbGEgPSB2bXhfZmF1bHRfZ2xhLAorCS5zcHRfZmF1bHQgPSB2bXhfc3B0
X2ZhdWx0LAogfTsKIAogc3RhdGljIHZvaWQgdm14X2NsZWFudXBfbDFkX2ZsdXNoKHZvaWQpCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0
aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0
dWFsaXphdGlvbg==
