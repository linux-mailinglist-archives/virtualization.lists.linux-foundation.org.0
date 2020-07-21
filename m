Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F3D228A8A
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 23:16:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 456D322763;
	Tue, 21 Jul 2020 21:16:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kfo0IvVbjHJP; Tue, 21 Jul 2020 21:16:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 764782278E;
	Tue, 21 Jul 2020 21:15:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 48ED3C088E;
	Tue, 21 Jul 2020 21:15:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DB5E7C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 91E2422735
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 12n9OF2VhciM
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by silver.osuosl.org (Postfix) with ESMTPS id ECAEC22731
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:52 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 E7B41305D7EA; Wed, 22 Jul 2020 00:09:19 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id CB646303EF1A;
 Wed, 22 Jul 2020 00:09:19 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v9 08/84] KVM: x86: avoid injecting #PF when emulate the
 VMCALL instruction
Date: Wed, 22 Jul 2020 00:08:06 +0300
Message-Id: <20200721210922.7646-9-alazar@bitdefender.com>
In-Reply-To: <20200721210922.7646-1-alazar@bitdefender.com>
References: <20200721210922.7646-1-alazar@bitdefender.com>
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKSXQgY2FuIGhhcHBl
bmVkIHRvIGVuZCB1cCBlbXVsYXRpbmcgdGhlIFZNQ0FMTCBpbnN0cnVjdGlvbiBhcyBhIHJlc3Vs
dApvZiB0aGUgaGFuZGxpbmcgb2YgYW4gRVBUIHdyaXRlIGZhdWx0LiBJbiB0aGlzIHNpdHVhdGlv
biwKdGhlIGVtdWxhdG9yIHdpbGwgdHJ5IHRvIHVuY29uZGl0aW9uYWxseSBwYXRjaCB0aGUgY29y
cmVjdCBoeXBlcmNhbGwKb3Bjb2RlIGJ5dGVzIHVzaW5nIGVtdWxhdG9yX3dyaXRlX2VtdWxhdGVk
KCkuIEhvd2V2ZXIsIHRoaXMgbGFzdCBjYWxsCnVzZXMgdGhlIGZhdWx0IEdQQSAoaWYgYXZhaWxh
YmxlKSBvciB3YWxrcyB0aGUgZ3Vlc3QgcGFnZSB0YWJsZXMgYXQgUklQLApvdGhlcndpc2UuIFRo
ZSB0cm91YmxlIGJlZ2lucyB3aGVuIHVzaW5nIFZNIGludHJvc3BlY3Rpb24sCndoZW4gd2UgZm9y
YmlkIHRoZSB1c2Ugb2YgdGhlIGZhdWx0IEdQQSBhbmQgZmFsbGJhY2sgdG8gdGhlIGd1ZXN0IHB0
IHdhbGs6CmluIFdpbmRvd3MgKDguMSBhbmQgbmV3ZXIpIHRoZSBwYWdlIHRoYXQgd2UgdHJ5IHRv
IHdyaXRlIGludG8KaXMgbWFya2VkIHJlYWQtZXhlY3V0ZSBhbmQgYXMgc3VjaCBlbXVsYXRvcl93
cml0ZV9lbXVsYXRlZCgpIGZhaWxzCmFuZCB3ZSBpbmplY3QgYSB3cml0ZSAjUEYsIGxlYWRpbmcg
dG8gYSBndWVzdCBjcmFzaC4KClNpZ25lZC1vZmYtYnk6IE1paGFpIERvbsibdSA8bWRvbnR1QGJp
dGRlZmVuZGVyLmNvbT4KU2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0
ZGVmZW5kZXIuY29tPgotLS0KIGFyY2gveDg2L2t2bS94ODYuYyB8IDYgKysrKystCiAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJj
aC94ODYva3ZtL3g4Ni5jIGIvYXJjaC94ODYva3ZtL3g4Ni5jCmluZGV4IGU5NzNmZmUwNGQ1NC4u
MjNiY2UzZWYyNmQ4IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0veDg2LmMKKysrIGIvYXJjaC94
ODYva3ZtL3g4Ni5jCkBAIC03NzE0LDExICs3NzE0LDE1IEBAIHN0YXRpYyBpbnQgZW11bGF0b3Jf
Zml4X2h5cGVyY2FsbChzdHJ1Y3QgeDg2X2VtdWxhdGVfY3R4dCAqY3R4dCkKIAlzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUgPSBlbXVsX3RvX3ZjcHUoY3R4dCk7CiAJY2hhciBpbnN0cnVjdGlvblszXTsK
IAl1bnNpZ25lZCBsb25nIHJpcCA9IGt2bV9yaXBfcmVhZCh2Y3B1KTsKKwlpbnQgZXJyOwogCiAJ
a3ZtX3g4Nl9vcHMucGF0Y2hfaHlwZXJjYWxsKHZjcHUsIGluc3RydWN0aW9uKTsKIAotCXJldHVy
biBlbXVsYXRvcl93cml0ZV9lbXVsYXRlZChjdHh0LCByaXAsIGluc3RydWN0aW9uLCAzLAorCWVy
ciA9IGVtdWxhdG9yX3dyaXRlX2VtdWxhdGVkKGN0eHQsIHJpcCwgaW5zdHJ1Y3Rpb24sIDMsCiAJ
CSZjdHh0LT5leGNlcHRpb24pOworCWlmIChlcnIgPT0gWDg2RU1VTF9QUk9QQUdBVEVfRkFVTFQp
CisJCWVyciA9IFg4NkVNVUxfQ09OVElOVUU7CisJcmV0dXJuIGVycjsKIH0KIAogc3RhdGljIGlu
dCBkbV9yZXF1ZXN0X2Zvcl9pcnFfaW5qZWN0aW9uKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRp
b24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3Jn
Cmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1
YWxpemF0aW9u
