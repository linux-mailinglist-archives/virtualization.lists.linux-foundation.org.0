Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B58F8881BA
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 19:55:40 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3CD9CDD8;
	Fri,  9 Aug 2019 17:55:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 30E95D09
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 17:54:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 178FA82D
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 17:54:55 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	E3977305D3DB; Fri,  9 Aug 2019 19:01:00 +0300 (EEST)
Received: from localhost.localdomain (unknown [89.136.169.210])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id 7B291305B7A3;
	Fri,  9 Aug 2019 19:01:00 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v6 25/92] kvm: x86: intercept the write access on sidt and
	other emulated instructions
Date: Fri,  9 Aug 2019 18:59:40 +0300
Message-Id: <20190809160047.8319-26-alazar@bitdefender.com>
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
	=?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>,
	Joerg Roedel <joro@8bytes.org>
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

VGhpcyBpcyBuZWVkZWQgZm9yIHRoZSBpbnRyb3NwZWN0aW9uIHN1YnN5c3RlbSB0byB0cmFjayB0
aGUgY2hhbmdlcyB0bwpkZXNjcmlwdG9yIHRhYmxlIHJlZ2lzdGVycy4KCkNDOiBKb2VyZyBSb2Vk
ZWwgPGpvcm9AOGJ5dGVzLm9yZz4KU2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6
YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIGFyY2gveDg2L2t2bS94ODYuYyB8IDMgKysrCiAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3g4
Ni5jIGIvYXJjaC94ODYva3ZtL3g4Ni5jCmluZGV4IDdhZWYwMDJiZTU1MS4uYzI4ZTJhMjBkZWMy
IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0veDg2LmMKKysrIGIvYXJjaC94ODYva3ZtL3g4Ni5j
CkBAIC01MTg1LDExICs1MTg1LDE0IEBAIHN0YXRpYyBpbnQga3ZtX3dyaXRlX2d1ZXN0X3ZpcnRf
aGVscGVyKGd2YV90IGFkZHIsIHZvaWQgKnZhbCwgdW5zaWduZWQgaW50IGJ5dGVzCiAKIAkJaWYg
KGdwYSA9PSBVTk1BUFBFRF9HVkEpCiAJCQlyZXR1cm4gWDg2RU1VTF9QUk9QQUdBVEVfRkFVTFQ7
CisJCWlmICgha3ZtX3BhZ2VfdHJhY2tfcHJld3JpdGUodmNwdSwgZ3BhLCBhZGRyLCBkYXRhLCB0
b3dyaXRlKSkKKwkJCXJldHVybiBYODZFTVVMX1JFVFJZX0lOU1RSOwogCQlyZXQgPSBrdm1fdmNw
dV93cml0ZV9ndWVzdCh2Y3B1LCBncGEsIGRhdGEsIHRvd3JpdGUpOwogCQlpZiAocmV0IDwgMCkg
ewogCQkJciA9IFg4NkVNVUxfSU9fTkVFREVEOwogCQkJZ290byBvdXQ7CiAJCX0KKwkJa3ZtX3Bh
Z2VfdHJhY2tfd3JpdGUodmNwdSwgZ3BhLCBhZGRyLCBkYXRhLCB0b3dyaXRlKTsKIAogCQlieXRl
cyAtPSB0b3dyaXRlOwogCQlkYXRhICs9IHRvd3JpdGU7Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0
dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4
Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
