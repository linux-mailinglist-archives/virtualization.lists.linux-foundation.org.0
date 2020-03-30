Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2B619788F
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 12:13:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 82A6C869B9;
	Mon, 30 Mar 2020 10:13:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sGnL5De5O3E7; Mon, 30 Mar 2020 10:13:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E9EC586A24;
	Mon, 30 Mar 2020 10:13:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D3647C07FF;
	Mon, 30 Mar 2020 10:13:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0B75FC1D8E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 02B9F2313B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:13:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XKr5pw4ImlJA
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by silver.osuosl.org (Postfix) with ESMTPS id 10F52230A1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:55 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 39454307489C; Mon, 30 Mar 2020 13:12:53 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 17409305B7A0;
 Mon, 30 Mar 2020 13:12:53 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v8 29/81] KVM: x86: extend kvm_mmu_gva_to_gpa_system() with
 the 'access' parameter
Date: Mon, 30 Mar 2020 13:12:16 +0300
Message-Id: <20200330101308.21702-30-alazar@bitdefender.com>
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyBpcyBuZWVk
ZWQgZm9yIHRoZSBpbnRyb3NwZWN0aW9uIHN1YnN5dGVtIHRvIGVtdWxhdGUgYSBndWVzdCBwYWdl
CnRhYmxlIHdhbGsgb24gU1BUIHZpb2xhdGlvbnMgZHVlIHRvIEEvRCBiaXQgdXBkYXRlcy4KClNp
Z25lZC1vZmYtYnk6IE1paGFpIERvbsibdSA8bWRvbnR1QGJpdGRlZmVuZGVyLmNvbT4KU2lnbmVk
LW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIGFy
Y2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggfCAyICstCiBhcmNoL3g4Ni9rdm0veDg2LmMg
ICAgICAgICAgICAgIHwgNiArKystLS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9o
b3N0LmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCmluZGV4IDViOGU0NGU0OTRi
MS4uODVkM2M5YzI5ODNmIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9z
dC5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKQEAgLTE1MjIsNyArMTUy
Miw3IEBAIGdwYV90IGt2bV9tbXVfZ3ZhX3RvX2dwYV9mZXRjaChzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsIGd2YV90IGd2YSwKIGdwYV90IGt2bV9tbXVfZ3ZhX3RvX2dwYV93cml0ZShzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUsIGd2YV90IGd2YSwKIAkJCSAgICAgICBzdHJ1Y3QgeDg2X2V4Y2VwdGlvbiAq
ZXhjZXB0aW9uKTsKIGdwYV90IGt2bV9tbXVfZ3ZhX3RvX2dwYV9zeXN0ZW0oc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LCBndmFfdCBndmEsCi0JCQkJc3RydWN0IHg4Nl9leGNlcHRpb24gKmV4Y2VwdGlv
bik7CisJCQkJdTMyIGFjY2Vzcywgc3RydWN0IHg4Nl9leGNlcHRpb24gKmV4Y2VwdGlvbik7CiAK
IGJvb2wga3ZtX2FwaWN2X2FjdGl2YXRlZChzdHJ1Y3Qga3ZtICprdm0pOwogdm9pZCBrdm1fYXBp
Y3ZfaW5pdChzdHJ1Y3Qga3ZtICprdm0sIGJvb2wgZW5hYmxlKTsKZGlmZiAtLWdpdCBhL2FyY2gv
eDg2L2t2bS94ODYuYyBiL2FyY2gveDg2L2t2bS94ODYuYwppbmRleCA0YTRkNjY2MzYwOGEuLmVk
NmViMTI0MWNmMSAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL3g4Ni5jCisrKyBiL2FyY2gveDg2
L2t2bS94ODYuYwpAQCAtNTQxNCw5ICs1NDE0LDkgQEAgZ3BhX3Qga3ZtX21tdV9ndmFfdG9fZ3Bh
X3dyaXRlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgZ3ZhX3QgZ3ZhLAogCiAvKiB1c2VzIHRoaXMg
dG8gYWNjZXNzIGFueSBndWVzdCdzIG1hcHBlZCBtZW1vcnkgd2l0aG91dCBjaGVja2luZyBDUEwg
Ki8KIGdwYV90IGt2bV9tbXVfZ3ZhX3RvX2dwYV9zeXN0ZW0oc3RydWN0IGt2bV92Y3B1ICp2Y3B1
LCBndmFfdCBndmEsCi0JCQkJc3RydWN0IHg4Nl9leGNlcHRpb24gKmV4Y2VwdGlvbikKKwkJCQl1
MzIgYWNjZXNzLCBzdHJ1Y3QgeDg2X2V4Y2VwdGlvbiAqZXhjZXB0aW9uKQogewotCXJldHVybiB2
Y3B1LT5hcmNoLndhbGtfbW11LT5ndmFfdG9fZ3BhKHZjcHUsIGd2YSwgMCwgZXhjZXB0aW9uKTsK
KwlyZXR1cm4gdmNwdS0+YXJjaC53YWxrX21tdS0+Z3ZhX3RvX2dwYSh2Y3B1LCBndmEsIGFjY2Vz
cywgZXhjZXB0aW9uKTsKIH0KIAogc3RhdGljIGludCBrdm1fcmVhZF9ndWVzdF92aXJ0X2hlbHBl
cihndmFfdCBhZGRyLCB2b2lkICp2YWwsIHVuc2lnbmVkIGludCBieXRlcywKQEAgLTkxODEsNyAr
OTE4MSw3IEBAIGludCBrdm1fYXJjaF92Y3B1X2lvY3RsX3RyYW5zbGF0ZShzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHUsCiAJdmNwdV9sb2FkKHZjcHUpOwogCiAJaWR4ID0gc3JjdV9yZWFkX2xvY2soJnZj
cHUtPmt2bS0+c3JjdSk7Ci0JZ3BhID0ga3ZtX21tdV9ndmFfdG9fZ3BhX3N5c3RlbSh2Y3B1LCB2
YWRkciwgTlVMTCk7CisJZ3BhID0ga3ZtX21tdV9ndmFfdG9fZ3BhX3N5c3RlbSh2Y3B1LCB2YWRk
ciwgMCwgTlVMTCk7CiAJc3JjdV9yZWFkX3VubG9jaygmdmNwdS0+a3ZtLT5zcmN1LCBpZHgpOwog
CXRyLT5waHlzaWNhbF9hZGRyZXNzID0gZ3BhOwogCXRyLT52YWxpZCA9IGdwYSAhPSBVTk1BUFBF
RF9HVkE7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZp
cnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3Vu
ZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0
aW5mby92aXJ0dWFsaXphdGlvbg==
