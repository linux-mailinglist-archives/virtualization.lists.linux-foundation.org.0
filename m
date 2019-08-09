Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CE3881F5
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 20:05:11 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 77E83DA7;
	Fri,  9 Aug 2019 18:04:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 78230CDD
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 18:04:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AFFFD829
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 18:04:54 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	57BB6305D3D8; Fri,  9 Aug 2019 19:00:58 +0300 (EEST)
Received: from localhost.localdomain (unknown [89.136.169.210])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id 1301E305B7A4;
	Fri,  9 Aug 2019 19:00:58 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v6 17/92] kvm: introspection: introduce event actions
Date: Fri,  9 Aug 2019 18:59:32 +0300
Message-Id: <20190809160047.8319-18-alazar@bitdefender.com>
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKQWxsIHZDUFUgZXZl
bnQgcmVwbGllcyBjb250YWlucyB0aGUgYWN0aW9uIHJlcXVlc3RlZCBieSB0aGUgaW50cm9zcGVj
dGlvbgp0b29sLCB3aGljaCBjYW4gYmUgb25lIG9mIHRoZSBmb2xsb3dpbmc6CgogICogS1ZNSV9F
VkVOVF9BQ1RJT05fQ09OVElOVUUKICAqIEtWTUlfRVZFTlRfQUNUSU9OX1JFVFJZCiAgKiBLVk1J
X0VWRU5UX0FDVElPTl9DUkFTSAoKVGhlIENPTlRJTlVFIGFjdGlvbiBjYW4gYmUgc2VlbiBhcyAi
Y29udGludWUgd2l0aCB0aGUgb2xkIEtWTSBjb2RlCnBhdGgiLCB3aGlsZSB0aGUgUkVUUlkgYWN0
aW9uIGFzICJyZS1lbnRlciBndWVzdCIuCgpOb3RlOiBLVk1JX0VWRU5UX1VOSE9PSywgYSBWTSBl
dmVudCwgZG9lc24ndCBoYXZlL25lZWQgYSByZXBseS4KClN1Z2dlc3RlZC1ieTogUGFvbG8gQm9u
emluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogTWloYWkgRG9uyJt1IDxt
ZG9udHVAYml0ZGVmZW5kZXIuY29tPgpDby1kZXZlbG9wZWQtYnk6IEFkYWxiZXJ0IExhesSDciA8
YWxhemFyQGJpdGRlZmVuZGVyLmNvbT4KU2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxh
bGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIERvY3VtZW50YXRpb24vdmlydHVhbC9rdm0va3Zt
aS5yc3QgfCAxMCArKysrKysrKwogaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaCAgICAgICAgICB8
ICA0ICsrKwoga2VybmVsL3NpZ25hbC5jICAgICAgICAgICAgICAgICAgICB8ICAxICsKIHZpcnQv
a3ZtL2t2bWkuYyAgICAgICAgICAgICAgICAgICAgfCA0MCArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgNTUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vdmlydHVhbC9rdm0va3ZtaS5yc3QgYi9Eb2N1bWVudGF0aW9uL3ZpcnR1
YWwva3ZtL2t2bWkucnN0CmluZGV4IGU3ZDlhMzgxNmUwMC4uMWVhNGJlMGQ1YTQ1IDEwMDY0NAot
LS0gYS9Eb2N1bWVudGF0aW9uL3ZpcnR1YWwva3ZtL2t2bWkucnN0CisrKyBiL0RvY3VtZW50YXRp
b24vdmlydHVhbC9rdm0va3ZtaS5yc3QKQEAgLTQ4Miw0ICs0ODIsMTQgQEAgd2l0aCB0d28gY29t
bW9uIHN0cnVjdHVyZXM6OgogCQlfX3UzMiBwYWRkaW5nMjsKIAl9OwogCitBbGwgZXZlbnRzIGFj
Y2VwdCB0aGUgS1ZNSV9FVkVOVF9BQ1RJT05fQ1JBU0ggYWN0aW9uLCB3aGljaCBzdG9wcyB0aGUK
K2d1ZXN0IHVuZ3JhY2VmdWxseSBidXQgYXMgc29vbiBhcyBwb3NzaWJsZS4KKworTW9zdCBvZiB0
aGUgZXZlbnRzIGFjY2VwdCB0aGUgS1ZNSV9FVkVOVF9BQ1RJT05fQ09OVElOVUUgYWN0aW9uLCB3
aGljaAorbGV0cyB0aGUgaW5zdHJ1Y3Rpb24gdGhhdCBjYXVzZWQgdGhlIGV2ZW50IHRvIGNvbnRp
bnVlICh1bmxlc3Mgc3BlY2lmaWVkCitvdGhlcndpc2UpLgorCitTb21lIG9mIHRoZSBldmVudHMg
YWNjZXB0IHRoZSBLVk1JX0VWRU5UX0FDVElPTl9SRVRSWSBhY3Rpb24sIHRvIGNvbnRpbnVlCiti
eSByZS1lbnRlcmluZyB0aGUgZ3Vlc3QuCisKIFNwZWNpZmljIGRhdGEgY2FuIGZvbGxvdyB0aGVz
ZSBjb21tb24gc3RydWN0dXJlcy4KZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC9rdm1p
LmggYi9pbmNsdWRlL3VhcGkvbGludXgva3ZtaS5oCmluZGV4IGRkYTJhZTM1MjYxMS4uY2NmMjIz
OWI1ZGI0IDEwMDY0NAotLS0gYS9pbmNsdWRlL3VhcGkvbGludXgva3ZtaS5oCisrKyBiL2luY2x1
ZGUvdWFwaS9saW51eC9rdm1pLmgKQEAgLTY2LDYgKzY2LDEwIEBAIGVudW0gewogCUtWTUlfTlVN
X0VWRU5UUwogfTsKIAorI2RlZmluZSBLVk1JX0VWRU5UX0FDVElPTl9DT05USU5VRSAgICAgIDAK
KyNkZWZpbmUgS1ZNSV9FVkVOVF9BQ1RJT05fUkVUUlkgICAgICAgICAxCisjZGVmaW5lIEtWTUlf
RVZFTlRfQUNUSU9OX0NSQVNIICAgICAgICAgMgorCiAjZGVmaW5lIEtWTUlfTVNHX1NJWkUgKDQw
OTYgLSBzaXplb2Yoc3RydWN0IGt2bWlfbXNnX2hkcikpCiAKIHN0cnVjdCBrdm1pX21zZ19oZHIg
ewpkaWZmIC0tZ2l0IGEva2VybmVsL3NpZ25hbC5jIGIva2VybmVsL3NpZ25hbC5jCmluZGV4IDU3
Yjc3NzFlMjBkNy4uOWJlZmJmYWFhNzEwIDEwMDY0NAotLS0gYS9rZXJuZWwvc2lnbmFsLmMKKysr
IGIva2VybmVsL3NpZ25hbC5jCkBAIC0xNDEzLDYgKzE0MTMsNyBAQCBpbnQga2lsbF9waWRfaW5m
byhpbnQgc2lnLCBzdHJ1Y3Qga2VybmVsX3NpZ2luZm8gKmluZm8sIHN0cnVjdCBwaWQgKnBpZCkK
IAkJICovCiAJfQogfQorRVhQT1JUX1NZTUJPTChraWxsX3BpZF9pbmZvKTsKIAogc3RhdGljIGlu
dCBraWxsX3Byb2NfaW5mbyhpbnQgc2lnLCBzdHJ1Y3Qga2VybmVsX3NpZ2luZm8gKmluZm8sIHBp
ZF90IHBpZCkKIHsKZGlmZiAtLWdpdCBhL3ZpcnQva3ZtL2t2bWkuYyBiL3ZpcnQva3ZtL2t2bWku
YwppbmRleCAzY2M3YmIwMzU3OTYuLjBkMzU2MGI3NGYyZCAxMDA2NDQKLS0tIGEvdmlydC9rdm0v
a3ZtaS5jCisrKyBiL3ZpcnQva3ZtL2t2bWkuYwpAQCAtNTExLDYgKzUxMSw0NiBAQCB2b2lkIGt2
bWlfZGVzdHJveV92bShzdHJ1Y3Qga3ZtICprdm0pCiAJd2FpdF9mb3JfY29tcGxldGlvbl9raWxs
YWJsZSgma3ZtLT5rdm1pX2NvbXBsZXRlZCk7CiB9CiAKK3N0YXRpYyBpbnQga3ZtaV92Y3B1X2tp
bGwoaW50IHNpZywgc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQoreworCWludCBlcnIgPSAtRVNSQ0g7
CisJc3RydWN0IHBpZCAqcGlkOworCXN0cnVjdCBrZXJuZWxfc2lnaW5mbyBzaWdpbmZvWzFdID0g
e307CisKKwlyY3VfcmVhZF9sb2NrKCk7CisJcGlkID0gcmN1X2RlcmVmZXJlbmNlKHZjcHUtPnBp
ZCk7CisJaWYgKHBpZCkKKwkJZXJyID0ga2lsbF9waWRfaW5mbyhzaWcsIHNpZ2luZm8sIHBpZCk7
CisJcmN1X3JlYWRfdW5sb2NrKCk7CisKKwlyZXR1cm4gZXJyOworfQorCitzdGF0aWMgdm9pZCBr
dm1pX3ZtX3NodXRkb3duKHN0cnVjdCBrdm0gKmt2bSkKK3sKKwlpbnQgaTsKKwlzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHU7CisKKwlrdm1fZm9yX2VhY2hfdmNwdShpLCB2Y3B1LCBrdm0pCisJCWt2bWlf
dmNwdV9raWxsKFNJR1RFUk0sIHZjcHUpOworfQorCit2b2lkIGt2bWlfaGFuZGxlX2NvbW1vbl9l
dmVudF9hY3Rpb25zKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdTMyIGFjdGlvbiwKKwkJCQkgICAg
ICBjb25zdCBjaGFyICpzdHIpCit7CisJc3RydWN0IGt2bSAqa3ZtID0gdmNwdS0+a3ZtOworCisJ
c3dpdGNoIChhY3Rpb24pIHsKKwljYXNlIEtWTUlfRVZFTlRfQUNUSU9OX0NSQVNIOgorCQlrdm1p
X3ZtX3NodXRkb3duKGt2bSk7CisJCWJyZWFrOworCisJZGVmYXVsdDoKKwkJa3ZtaV9lcnIoSUtW
TShrdm0pLCAiVW5zdXBwb3J0ZWQgYWN0aW9uICVkIGZvciBldmVudCAlc1xuIiwKKwkJCSBhY3Rp
b24sIHN0cik7CisJfQorfQorCiB2b2lkIGt2bWlfcnVuX2pvYnMoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1KQogewogCXN0cnVjdCBrdm1pX3ZjcHUgKml2Y3B1ID0gSVZDUFUodmNwdSk7Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1h
aWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXph
dGlvbg==
