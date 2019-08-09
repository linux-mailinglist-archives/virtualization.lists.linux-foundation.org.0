Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B07F87F55
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 18:16:03 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B0399E33;
	Fri,  9 Aug 2019 16:15:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 483B4DA6
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 16:14:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9E8D2875
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 16:14:57 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	5DF7B305D3D0; Fri,  9 Aug 2019 19:00:54 +0300 (EEST)
Received: from localhost.localdomain (unknown [89.136.169.210])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id 0C0B7305B7A0;
	Fri,  9 Aug 2019 19:00:54 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v6 07/92] kvm: introspection: honor the reply option when
	handling the KVMI_GET_VERSION command
Date: Fri,  9 Aug 2019 18:59:22 +0300
Message-Id: <20190809160047.8319-8-alazar@bitdefender.com>
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

T2J2aW91c2x5LCB0aGUgS1ZNSV9HRVRfVkVSU0lPTiBjb21tYW5kIG11c3Qgbm90IGJlIHVzZWQg
d2hlbiB0aGUgY29tbWFuZApyZXBseSBpcyBkaXNhYmxlZCBieSBhIHByZXZpb3VzIEtWTUlfQ09O
VFJPTF9DTURfUkVTUE9OU0UgY29tbWFuZC4KClRoaXMgY29tbWl0IGNoYW5nZXMgdGhlIGNvZGUg
cGF0aCBpbiBvcmRlciB0byBjaGVjayB0aGUgcmVwbHkgb3B0aW9uCihlbmFibGVkL2Rpc2FibGVk
KSBiZWZvcmUgdHJ5aW5nIHRvIHJlcGx5IHRvIHRoaXMgY29tbWFuZC4gSWYgdGhlIGNvbW1hbmQK
cmVwbHkgaXMgZGlzYWJsZWQgaXQgd2lsbCByZXR1cm4gYW4gZXJyb3IgdG8gdGhlIGNhbGxlci4g
SW4gdGhlIGVuZCwgdGhlCnJlY2VpdmluZyB3b3JrZXIgd2lsbCBmaW5pc2ggYW5kIHRoZSBpbnRy
b3NwZWN0aW9uIHNvY2tldCB3aWxsIGJlIGNsb3NlZC4KClNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0
IExhesSDciA8YWxhemFyQGJpdGRlZmVuZGVyLmNvbT4KLS0tCiB2aXJ0L2t2bS9rdm1pX21zZy5j
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvdmlydC9rdm0va3ZtaV9tc2cuYyBiL3ZpcnQva3ZtL2t2bWlfbXNnLmMKaW5k
ZXggZWE1YzdlMjM2NjlhLi4yMjM3YTZlZDI1ZjYgMTAwNjQ0Ci0tLSBhL3ZpcnQva3ZtL2t2bWlf
bXNnLmMKKysrIGIvdmlydC9rdm0va3ZtaV9tc2cuYwpAQCAtMTY5LDcgKzE2OSw3IEBAIHN0YXRp
YyBpbnQgaGFuZGxlX2dldF92ZXJzaW9uKHN0cnVjdCBrdm1pICppa3ZtLAogCW1lbXNldCgmcnBs
LCAwLCBzaXplb2YocnBsKSk7CiAJcnBsLnZlcnNpb24gPSBLVk1JX1ZFUlNJT047CiAKLQlyZXR1
cm4ga3ZtaV9tc2dfdm1fcmVwbHkoaWt2bSwgbXNnLCAwLCAmcnBsLCBzaXplb2YocnBsKSk7CisJ
cmV0dXJuIGt2bWlfbXNnX3ZtX21heWJlX3JlcGx5KGlrdm0sIG1zZywgMCwgJnJwbCwgc2l6ZW9m
KHJwbCkpOwogfQogCiBzdGF0aWMgYm9vbCBpc19jb21tYW5kX2FsbG93ZWQoc3RydWN0IGt2bWkg
Kmlrdm0sIGludCBpZCkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxp
bnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWls
bWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
