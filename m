Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D5A88171
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 19:40:46 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2432CB8F;
	Fri,  9 Aug 2019 17:39:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8A09EB8E
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 17:39:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3D1C08A7
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 17:39:55 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	932DB3031EB7; Fri,  9 Aug 2019 19:01:13 +0300 (EEST)
Received: from localhost.localdomain (unknown [89.136.169.210])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id 9C12A305B7A9;
	Fri,  9 Aug 2019 19:01:12 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v6 42/92] KVM: MMU: Handle host memory remapping and
	reclaim
Date: Fri,  9 Aug 2019 18:59:57 +0300
Message-Id: <20190809160047.8319-43-alazar@bitdefender.com>
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

RnJvbTogWWFuZyBXZWlqaWFuZyA8d2VpamlhbmcueWFuZ0BpbnRlbC5jb20+CgpIb3N0IHBhZ2Ug
c3dhcHBpbmcvbWlncmF0aW9uIG1heSBjaGFuZ2UgdGhlIHRyYW5zbGF0aW9uIGluCkVQVCBsZWFm
IGVudHJ5LCBpZiB0aGUgdGFyZ2V0IHBhZ2UgaXMgU1BQIHByb3RlY3RlZCwKcmUtZW5hYmxlIFNQ
UCBwcm90ZWN0aW9uIGluIE1NVSBub3RpZmllci4gSWYgU1BQVCBzaGFkb3cKcGFnZSBpcyByZWNs
YWltZWQsIHRoZSBsZXZlbDEgcGFnZXMgZG9uJ3QgaGF2ZSBybWFwIHRvIGNsZWFyLgoKU2lnbmVk
LW9mZi1ieTogWWFuZyBXZWlqaWFuZyA8d2VpamlhbmcueWFuZ0BpbnRlbC5jb20+Ck1lc3NhZ2Ut
SWQ6IDwyMDE5MDcxNzEzMzc1MS4xMjkxMC0xMC13ZWlqaWFuZy55YW5nQGludGVsLmNvbT4KU2ln
bmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0K
IGFyY2gveDg2L2t2bS9tbXUuYyB8IDIyICsrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL21tdS5j
IGIvYXJjaC94ODYva3ZtL21tdS5jCmluZGV4IDI0MjIyZTNhZGQ5MS4uMGI4NTliMTc5N2Y2IDEw
MDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vbW11LmMKKysrIGIvYXJjaC94ODYva3ZtL21tdS5jCkBA
IC0yMDA0LDYgKzIwMDQsMjQgQEAgc3RhdGljIGludCBrdm1fc2V0X3B0ZV9ybWFwcChzdHJ1Y3Qg
a3ZtICprdm0sIHN0cnVjdCBrdm1fcm1hcF9oZWFkICpybWFwX2hlYWQsCiAJCQluZXdfc3B0ZSAm
PSB+UFRfV1JJVEFCTEVfTUFTSzsKIAkJCW5ld19zcHRlICY9IH5TUFRFX0hPU1RfV1JJVEVBQkxF
OwogCisJCQkvKgorCQkJICogaWYgaXQncyBFUFQgbGVhZiBlbnRyeSBhbmQgdGhlIHBoeXNpY2Fs
IHBhZ2UgaXMKKwkJCSAqIFNQUCBwcm90ZWN0ZWQsIHRoZW4gcmUtZW5hYmxlIFNQUCBwcm90ZWN0
aW9uIGZvcgorCQkJICogdGhlIHBhZ2UuCisJCQkgKi8KKwkJCWlmIChrdm0tPmFyY2guc3BwX2Fj
dGl2ZSAmJgorCQkJICAgIGxldmVsID09IFBUX1BBR0VfVEFCTEVfTEVWRUwpIHsKKwkJCQlzdHJ1
Y3Qga3ZtX3N1YnBhZ2Ugc3BwX2luZm8gPSB7MH07CisJCQkJaW50IGk7CisKKwkJCQlzcHBfaW5m
by5iYXNlX2dmbiA9IGdmbjsKKwkJCQlzcHBfaW5mby5ucGFnZXMgPSAxOworCQkJCWkgPSBrdm1f
bW11X2dldF9zdWJwYWdlcyhrdm0sICZzcHBfaW5mbywgdHJ1ZSk7CisJCQkJaWYgKGkgPT0gMSAm
JgorCQkJCSAgICBzcHBfaW5mby5hY2Nlc3NfbWFwWzBdICE9IEZVTExfU1BQX0FDQ0VTUykKKwkJ
CQkJbmV3X3NwdGUgfD0gUFRfU1BQX01BU0s7CisJCQl9CisKIAkJCW5ld19zcHRlID0gbWFya19z
cHRlX2Zvcl9hY2Nlc3NfdHJhY2sobmV3X3NwdGUpOwogCiAJCQltbXVfc3B0ZV9jbGVhcl90cmFj
a19iaXRzKHNwdGVwKTsKQEAgLTI5MDUsNiArMjkyMywxMCBAQCBzdGF0aWMgYm9vbCBtbXVfcGFn
ZV96YXBfcHRlKHN0cnVjdCBrdm0gKmt2bSwgc3RydWN0IGt2bV9tbXVfcGFnZSAqc3AsCiAJcHRl
ID0gKnNwdGU7CiAJaWYgKGlzX3NoYWRvd19wcmVzZW50X3B0ZShwdGUpKSB7CiAJCWlmIChpc19s
YXN0X3NwdGUocHRlLCBzcC0+cm9sZS5sZXZlbCkpIHsKKwkJCS8qIFNQUFQgbGVhZiBlbnRyaWVz
IGRvbid0IGhhdmUgcm1hcHMqLworCQkJaWYgKHNwLT5yb2xlLmxldmVsID09IFBUX1BBR0VfVEFC
TEVfTEVWRUwgJiYKKwkJCSAgICBpc19zcHBfc3B0ZShzcCkpCisJCQkJcmV0dXJuIHRydWU7CiAJ
CQlkcm9wX3NwdGUoa3ZtLCBzcHRlKTsKIAkJCWlmIChpc19sYXJnZV9wdGUocHRlKSkKIAkJCQkt
LWt2bS0+c3RhdC5scGFnZXM7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0
cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcv
bWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
