Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DE188154
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 19:35:04 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E6186DB4;
	Fri,  9 Aug 2019 17:34:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 41662CD4
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 17:34:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B12FA89D
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 17:34:54 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	3CAC9305D366; Fri,  9 Aug 2019 19:01:43 +0300 (EEST)
Received: from localhost.localdomain (unknown [89.136.169.210])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id A9FD4305B7A4;
	Fri,  9 Aug 2019 19:01:42 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v6 87/92] kvm: x86: emulate xorps xmm/m128, xmm
Date: Fri,  9 Aug 2019 19:00:42 +0300
Message-Id: <20190809160047.8319-88-alazar@bitdefender.com>
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyBleHRlbmRz
IHRoZSBwcmV2aW91cyB4b3JwZCBieSBjcmVhdGluZyBhIGRlZGljYXRlZCBncm91cCwgc29tZXRo
aW5nCkkgc2hvdWxkIGhhdmUgZG9uZSBzaW5jZSB0aGUgdmVyeSBiZWdpbm5pbmcuCgpTaWduZWQt
b2ZmLWJ5OiBNaWhhaSBEb27Im3UgPG1kb250dUBiaXRkZWZlbmRlci5jb20+ClNpZ25lZC1vZmYt
Ynk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJpdGRlZmVuZGVyLmNvbT4KLS0tCiBhcmNoL3g4
Ni9rdm0vZW11bGF0ZS5jIHwgMjIgKysrKysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5n
ZWQsIDIxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4
Ni9rdm0vZW11bGF0ZS5jIGIvYXJjaC94ODYva3ZtL2VtdWxhdGUuYwppbmRleCAyOGFhYzU1MmIz
NGIuLjE0ODk1YzA0M2VkYyAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL2VtdWxhdGUuYworKysg
Yi9hcmNoL3g4Ni9rdm0vZW11bGF0ZS5jCkBAIC0xMTc4LDYgKzExNzgsMjIgQEAgc3RhdGljIGlu
dCBlbV9mbnN0c3coc3RydWN0IHg4Nl9lbXVsYXRlX2N0eHQgKmN0eHQpCiAJcmV0dXJuIFg4NkVN
VUxfQ09OVElOVUU7CiB9CiAKK3N0YXRpYyBpbnQgZW1feG9ycHMoc3RydWN0IHg4Nl9lbXVsYXRl
X2N0eHQgKmN0eHQpCit7CisJY29uc3Qgc3NlMTI4X3QgKnNyYyA9ICZjdHh0LT5zcmMudmVjX3Zh
bDsKKwlzc2UxMjhfdCAqZHN0ID0gJmN0eHQtPmRzdC52ZWNfdmFsOworCXNzZTEyOF90IHhtbTA7
CisKKwlhc20gdm9sYXRpbGUoIm1vdmRxdSAlJXhtbTAsICUwXG4iCisJCSAgICAgIm1vdmRxdSAl
MSwgJSV4bW0wXG4iCisJCSAgICAgInhvcnBzICUyLCAlJXhtbTBcbiIKKwkJICAgICAibW92ZHF1
ICUleG1tMCwgJTFcbiIKKwkJICAgICAibW92ZHF1ICUwLCAlJXhtbTAiCisJCSAgICAgOiAiK20i
KHhtbTApLCAiK20iKCpkc3QpIDogIm0iKCpzcmMpKTsKKworCXJldHVybiBYODZFTVVMX0NPTlRJ
TlVFOworfQorCiBzdGF0aWMgaW50IGVtX3hvcnBkKHN0cnVjdCB4ODZfZW11bGF0ZV9jdHh0ICpj
dHh0KQogewogCWNvbnN0IHNzZTEyOF90ICpzcmMgPSAmY3R4dC0+c3JjLnZlY192YWw7CkBAIC00
NjE1LDYgKzQ2MzEsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBncHJlZml4IHBmeF8wZl9lNyA9
IHsKIAlOLCBJKFNzZSwgZW1fbW92KSwgTiwgTiwKIH07CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
Z3ByZWZpeCBwZnhfMGZfNTcgPSB7CisJSShVbmFsaWduZWQsIGVtX3hvcnBzKSwgSShVbmFsaWdu
ZWQsIGVtX3hvcnBkKSwgTiwgTgorfTsKKwogc3RhdGljIGNvbnN0IHN0cnVjdCBlc2NhcGUgZXNj
YXBlX2Q5ID0geyB7CiAJTiwgTiwgTiwgTiwgTiwgTiwgTiwgSShEc3RNZW0xNiB8IE1vdiwgZW1f
Zm5zdGN3KSwKIH0sIHsKQEAgLTQ4NDcsNyArNDg2Nyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
b3Bjb2RlIHR3b2J5dGVfdGFibGVbMjU2XSA9IHsKIAkvKiAweDQwIC0gMHg0RiAqLwogCVgxNihE
KERzdFJlZyB8IFNyY01lbSB8IE1vZFJNKSksCiAJLyogMHg1MCAtIDB4NUYgKi8KLQlOLCBOLCBO
LCBOLCBOLCBOLCBOLCBJKFNyY01lbSB8IERzdFJlZyB8IE1vZFJNIHwgVW5hbGlnbmVkIHwgU3Nl
LCBlbV94b3JwZCksCisJTiwgTiwgTiwgTiwgTiwgTiwgTiwgR1AoU3JjTWVtIHwgRHN0UmVnIHwg
TW9kUk0gfCBTc2UsICZwZnhfMGZfNTcpLAogCU4sIE4sIE4sIE4sIE4sIE4sIE4sIE4sCiAJLyog
MHg2MCAtIDB4NkYgKi8KIAlOLCBOLCBOLCBOLApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6
YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5k
YXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
