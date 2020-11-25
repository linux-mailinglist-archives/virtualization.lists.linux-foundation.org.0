Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9742D2C3C53
	for <lists.virtualization@lfdr.de>; Wed, 25 Nov 2020 10:42:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4757186D91;
	Wed, 25 Nov 2020 09:42:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xtPzoMcwLlcg; Wed, 25 Nov 2020 09:42:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1108686D99;
	Wed, 25 Nov 2020 09:42:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EDB1AC1836;
	Wed, 25 Nov 2020 09:42:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 67D6AC1836
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 63FB28743D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:41:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vh2X-zL2XZ4a
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:41:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B6EED8743B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:41:55 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 3720A305D4F8; Wed, 25 Nov 2020 11:35:44 +0200 (EET)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 197EA3072785;
 Wed, 25 Nov 2020 11:35:44 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v10 07/81] KVM: x86: avoid injecting #PF when emulate the
 VMCALL instruction
Date: Wed, 25 Nov 2020 11:34:46 +0200
Message-Id: <20201125093600.2766-8-alazar@bitdefender.com>
In-Reply-To: <20201125093600.2766-1-alazar@bitdefender.com>
References: <20201125093600.2766-1-alazar@bitdefender.com>
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
aC94ODYva3ZtL3g4Ni5jIGIvYXJjaC94ODYva3ZtL3g4Ni5jCmluZGV4IDU5NTE0NTg0MDhmYi4u
ODE2ODAxZDZjOTVkIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0veDg2LmMKKysrIGIvYXJjaC94
ODYva3ZtL3g4Ni5jCkBAIC04MTQ0LDExICs4MTQ0LDE1IEBAIHN0YXRpYyBpbnQgZW11bGF0b3Jf
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
