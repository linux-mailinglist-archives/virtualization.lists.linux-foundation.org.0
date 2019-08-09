Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F13881B5
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 19:55:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 80A56DA7;
	Fri,  9 Aug 2019 17:54:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0F96FC84
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 17:54:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4C73B8A0
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 17:54:55 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	9EECC3031EB6; Fri,  9 Aug 2019 19:01:12 +0300 (EEST)
Received: from localhost.localdomain (unknown [89.136.169.210])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id 46431305B7A0;
	Fri,  9 Aug 2019 19:01:11 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v6 41/92] KVM: MMU: Enable Lazy mode SPPT setup
Date: Fri,  9 Aug 2019 18:59:56 +0300
Message-Id: <20190809160047.8319-42-alazar@bitdefender.com>
In-Reply-To: <20190809160047.8319-1-alazar@bitdefender.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>, Yu C <yu.c.zhang@intel.com>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	=?UTF-8?q?Samuel=20Laur=C3=A9n?= <samuel.lauren@iki.fi>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	virtualization@lists.linux-foundation.org,
	=?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
	linux-mm@kvack.org, Patrick Colp <patrick.colp@oracle.com>,
	Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Zhang@mail.linuxfoundation.org,
	=?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

RnJvbTogWWFuZyBXZWlqaWFuZyA8d2VpamlhbmcueWFuZ0BpbnRlbC5jb20+CgpJZiBTUFAgc3Vi
cGFnZXMgYXJlIHNldCB3aGlsZSB0aGUgcGh5c2ljYWwgcGFnZSBhcmUgbm90CmF2YWlsYWJsZSBp
biBFUFQgbGVhZiBlbnRyeSwgdGhlIG1hcHBpbmcgaXMgZmlyc3Qgc3RvcmVkCmluIFNQUCBhY2Nl
c3MgYml0bWFwIGJ1ZmZlci4gU1BQVCBzZXR1cCBpcyBkZWZlcnJlZCB0bwphY2Nlc3MgdG8gdGhl
IHByb3RlY3RlZCBwYWdlLCBpbiBFUFQgcGFnZSBmYXVsdCBoYW5kbGVyLAp0aGUgU1BQVCBlbnJp
ZXMgYXJlIHNldCB1cC4KClNpZ25lZC1vZmYtYnk6IFlhbmcgV2VpamlhbmcgPHdlaWppYW5nLnlh
bmdAaW50ZWwuY29tPgpNZXNzYWdlLUlkOiA8MjAxOTA3MTcxMzM3NTEuMTI5MTAtOS13ZWlqaWFu
Zy55YW5nQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJA
Yml0ZGVmZW5kZXIuY29tPgotLS0KIGFyY2gveDg2L2t2bS9tbXUuYyB8IDI0ICsrKysrKysrKysr
KysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9hcmNoL3g4Ni9rdm0vbW11LmMgYi9hcmNoL3g4Ni9rdm0vbW11LmMKaW5kZXggZDU5MTA4
YTNlYmJmLi4yNDIyMmUzYWRkOTEgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS9tbXUuYworKysg
Yi9hcmNoL3g4Ni9rdm0vbW11LmMKQEAgLTQ0MDAsNiArNDQwMCwyNiBAQCBjaGVja19odWdlcGFn
ZV9jYWNoZV9jb25zaXN0ZW5jeShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGdmbl90IGdmbiwgaW50
IGxldmVsKQogCXJldHVybiBrdm1fbXRycl9jaGVja19nZm5fcmFuZ2VfY29uc2lzdGVuY3kodmNw
dSwgZ2ZuLCBwYWdlX251bSk7CiB9CiAKK3N0YXRpYyBpbnQga3ZtX2VuYWJsZV9zcHBfcHJvdGVj
dGlvbihzdHJ1Y3Qga3ZtICprdm0sIHU2NCBnZm4pCit7CisJc3RydWN0IGt2bV9zdWJwYWdlIHNw
cF9pbmZvID0gezB9OworCXN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNsb3Q7CisKKwlzbG90ID0g
Z2ZuX3RvX21lbXNsb3Qoa3ZtLCBnZm4pOworCWlmICghc2xvdCkKKwkJcmV0dXJuIC1FRkFVTFQ7
CisKKwlzcHBfaW5mby5iYXNlX2dmbiA9IGdmbjsKKwlzcHBfaW5mby5ucGFnZXMgPSAxOworCisJ
aWYgKGt2bV9tbXVfZ2V0X3N1YnBhZ2VzKGt2bSwgJnNwcF9pbmZvLCB0cnVlKSA8IDApCisJCXJl
dHVybiAtRUZBVUxUOworCisJaWYgKHNwcF9pbmZvLmFjY2Vzc19tYXBbMF0gIT0gRlVMTF9TUFBf
QUNDRVNTKQorCQlrdm1fbW11X3NldF9zdWJwYWdlcyhrdm0sICZzcHBfaW5mbywgdHJ1ZSk7CisK
KwlyZXR1cm4gMDsKK30KIHN0YXRpYyBpbnQgdGRwX3BhZ2VfZmF1bHQoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LCBndmFfdCBncGEsIHUzMiBlcnJvcl9jb2RlLAogCQkJICBib29sIHByZWZhdWx0KQog
ewpAQCAtNDQ1MSw2ICs0NDcxLDEwIEBAIHN0YXRpYyBpbnQgdGRwX3BhZ2VfZmF1bHQoc3RydWN0
IGt2bV92Y3B1ICp2Y3B1LCBndmFfdCBncGEsIHUzMiBlcnJvcl9jb2RlLAogCWlmIChsaWtlbHko
IWZvcmNlX3B0X2xldmVsKSkKIAkJdHJhbnNwYXJlbnRfaHVnZXBhZ2VfYWRqdXN0KHZjcHUsICZn
Zm4sICZwZm4sICZsZXZlbCk7CiAJciA9IF9fZGlyZWN0X21hcCh2Y3B1LCB3cml0ZSwgbWFwX3dy
aXRhYmxlLCBsZXZlbCwgZ2ZuLCBwZm4sIHByZWZhdWx0KTsKKworCWlmICh2Y3B1LT5rdm0tPmFy
Y2guc3BwX2FjdGl2ZSAmJiBsZXZlbCA9PSBQVF9QQUdFX1RBQkxFX0xFVkVMKQorCQlrdm1fZW5h
YmxlX3NwcF9wcm90ZWN0aW9uKHZjcHUtPmt2bSwgZ2ZuKTsKKwogCXNwaW5fdW5sb2NrKCZ2Y3B1
LT5rdm0tPm1tdV9sb2NrKTsKIAogCXJldHVybiByOwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVh
bGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
