Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E2D88234
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 20:20:05 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 858D3DB7;
	Fri,  9 Aug 2019 18:19:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E897ADAF
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 18:19:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7AB478A8
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 18:19:55 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	AFF0D305D364; Fri,  9 Aug 2019 19:01:41 +0300 (EEST)
Received: from localhost.localdomain (unknown [89.136.169.210])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id 67CE6305B7A1;
	Fri,  9 Aug 2019 19:01:41 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v6 85/92] kvm: x86: emulate lfence
Date: Fri,  9 Aug 2019 19:00:40 +0300
Message-Id: <20190809160047.8319-86-alazar@bitdefender.com>
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyBhZGRzIHN1
cHBvcnQgZm9yIGFsbCBlbmNvZGluZyB2YXJpYW50cyBvZiBsZmVuY2UgKDB4MGYgMHhhZSAweGVb
OC1mXSkuCgpJIGRpZCBub3QgdXNlIHJtYigpIGluIGNhc2UgaXQgd2lsbCBiZSBtYWRlIHRvIHVz
ZSBhIGRpZmZlcmVudCBpbnN0cnVjdGlvbgpvbiBmdXR1cmUgYXJjaGl0ZWN0dXJlcy4KClNpZ25l
ZC1vZmYtYnk6IE1paGFpIERvbsibdSA8bWRvbnR1QGJpdGRlZmVuZGVyLmNvbT4KU2lnbmVkLW9m
Zi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIGFyY2gv
eDg2L2t2bS9lbXVsYXRlLmMgfCA4ICsrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL2VtdWxhdGUu
YyBiL2FyY2gveDg2L2t2bS9lbXVsYXRlLmMKaW5kZXggYTJlNWU2M2JkOTRhLi4yODdkMzc1MTY3
NWQgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS9lbXVsYXRlLmMKKysrIGIvYXJjaC94ODYva3Zt
L2VtdWxhdGUuYwpAQCAtNDE2OCw2ICs0MTY4LDEyIEBAIHN0YXRpYyBpbnQgZW1fZnhyc3Rvcihz
dHJ1Y3QgeDg2X2VtdWxhdGVfY3R4dCAqY3R4dCkKIAlyZXR1cm4gcmM7CiB9CiAKK3N0YXRpYyBp
bnQgZW1fbGZlbmNlKHN0cnVjdCB4ODZfZW11bGF0ZV9jdHh0ICpjdHh0KQoreworCWFzbSB2b2xh
dGlsZSAoImxmZW5jZSIgOjo6ICJtZW1vcnkiKTsKKwlyZXR1cm4gWDg2RU1VTF9DT05USU5VRTsK
K30KKwogc3RhdGljIGJvb2wgdmFsaWRfY3IoaW50IG5yKQogewogCXN3aXRjaCAobnIpIHsKQEAg
LTQ1NTQsNyArNDU2MCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZ3JvdXBfZHVhbCBncm91cDE1
ID0geyB7CiAJSShNb2RSTSB8IEFsaWduZWQxNiwgZW1fZnhyc3RvciksCiAJTiwgTiwgTiwgTiwg
TiwgR1AoMCwgJnBmeF8wZl9hZV83KSwKIH0sIHsKLQlOLCBOLCBOLCBOLCBOLCBOLCBOLCBOLAor
CU4sIE4sIE4sIE4sIE4sIEkoTW9kUk0gfCBTc2UsIGVtX2xmZW5jZSksIE4sIE4sCiB9IH07CiAK
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgZ3ByZWZpeCBwZnhfMGZfNmZfMGZfN2YgPSB7Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1h
aWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXph
dGlvbg==
