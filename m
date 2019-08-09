Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7539088182
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 19:45:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D1D8BE1D;
	Fri,  9 Aug 2019 17:44:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2B804DCB
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 17:44:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DAC1382D
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 17:44:54 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	3B133305D362; Fri,  9 Aug 2019 19:01:40 +0300 (EEST)
Received: from localhost.localdomain (unknown [89.136.169.210])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id D678C305B7A0;
	Fri,  9 Aug 2019 19:01:39 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v6 80/92] kvm: x86: emulate movss xmm, m32
Date: Fri,  9 Aug 2019 19:00:35 +0300
Message-Id: <20190809160047.8319-81-alazar@bitdefender.com>
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyBpcyBuZWVk
ZWQgaW4gb3JkZXIgdG8gYmUgYWJsZSB0byBzdXBwb3J0IGd1ZXN0IGNvZGUgdGhhdCB1c2VzIG1v
dnNzIHRvCndyaXRlIGludG8gcGFnZXMgdGhhdCBhcmUgbWFya2VkIGZvciB3cml0ZSB0cmFja2lu
Zy4KClNpZ25lZC1vZmYtYnk6IE1paGFpIERvbsibdSA8bWRvbnR1QGJpdGRlZmVuZGVyLmNvbT4K
U2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgot
LS0KIGFyY2gveDg2L2t2bS9lbXVsYXRlLmMgfCA4ICsrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2
bS9lbXVsYXRlLmMgYi9hcmNoL3g4Ni9rdm0vZW11bGF0ZS5jCmluZGV4IDlkMzhmODkyYmVlYS4u
YjhhNDEyYjhiMDg3IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vZW11bGF0ZS5jCisrKyBiL2Fy
Y2gveDg2L2t2bS9lbXVsYXRlLmMKQEAgLTExODQsOSArMTE4NCwxMyBAQCBzdGF0aWMgdTggc2lt
ZF9wcmVmaXhfdG9fYnl0ZXMoY29uc3Qgc3RydWN0IHg4Nl9lbXVsYXRlX2N0eHQgKmN0eHQsCiAK
IAlzd2l0Y2ggKGN0eHQtPmIpIHsKIAljYXNlIDB4MTE6CisJCS8qIG1vdnNzIHhtbSwgbTMyICov
CiAJCS8qIG1vdnNkIHhtbSwgbTY0ICovCiAJCS8qIG1vdnVwcyB4bW0sIG0xMjggKi8KLQkJaWYg
KHNpbWRfcHJlZml4ID09IDB4ZjIpIHsKKwkJaWYgKHNpbWRfcHJlZml4ID09IDB4ZjMpIHsKKwkJ
CWJ5dGVzID0gNDsKKwkJCWJyZWFrOworCQl9IGVsc2UgaWYgKHNpbWRfcHJlZml4ID09IDB4ZjIp
IHsKIAkJCWJ5dGVzID0gODsKIAkJCWJyZWFrOwogCQl9CkBAIC00NTUwLDcgKzQ1NTQsNyBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IGdwcmVmaXggcGZ4XzBmXzJiID0gewogfTsKIAogc3RhdGljIGNv
bnN0IHN0cnVjdCBncHJlZml4IHBmeF8wZl8xMF8wZl8xMSA9IHsKLQlJKFVuYWxpZ25lZCwgZW1f
bW92KSwgSShVbmFsaWduZWQsIGVtX21vdiksIEkoVW5hbGlnbmVkLCBlbV9tb3YpLCBOLAorCUko
VW5hbGlnbmVkLCBlbV9tb3YpLCBJKFVuYWxpZ25lZCwgZW1fbW92KSwgSShVbmFsaWduZWQsIGVt
X21vdiksIEkoVW5hbGlnbmVkLCBlbV9tb3YpLAogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBn
cHJlZml4IHBmeF8wZl8yOF8wZl8yOSA9IHsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0
aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0
aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
