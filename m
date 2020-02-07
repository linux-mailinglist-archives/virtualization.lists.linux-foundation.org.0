Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA2E155E2D
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 19:36:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 967A086975;
	Fri,  7 Feb 2020 18:36:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S0TEtMdZXqgR; Fri,  7 Feb 2020 18:36:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1FF4886966;
	Fri,  7 Feb 2020 18:36:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 15BE2C013E;
	Fri,  7 Feb 2020 18:36:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6DDA9C1D85
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 64EF185C45
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ur2ZIrtETDb3
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id F1B7A86399
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:53 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 291FF305D3CC; Fri,  7 Feb 2020 20:16:39 +0200 (EET)
Received: from host.bbu.bitdefender.biz (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id C070D305206C;
 Fri,  7 Feb 2020 20:16:38 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v7 09/78] KVM: x86: avoid injecting #PF when emulate the
 VMCALL instruction
Date: Fri,  7 Feb 2020 20:15:27 +0200
Message-Id: <20200207181636.1065-10-alazar@bitdefender.com>
In-Reply-To: <20200207181636.1065-1-alazar@bitdefender.com>
References: <20200207181636.1065-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
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
ZSB0cm91YmxlIGJlZ2lucyB3aGVuIHVzaW5nIEtWTUksIHdoZW4gd2UgZm9yYmlkIHRoZSB1c2UK
b2YgdGhlIGZhdWx0IEdQQSBhbmQgZmFsbGJhY2sgdG8gdGhlIGd1ZXN0IHB0IHdhbGs6IGluIFdp
bmRvd3MgKDguMQphbmQgbmV3ZXIpIHRoZSBwYWdlIHRoYXQgd2UgdHJ5IHRvIHdyaXRlIGludG8g
aXMgbWFya2VkIHJlYWQtZXhlY3V0ZQphbmQgYXMgc3VjaCBlbXVsYXRvcl93cml0ZV9lbXVsYXRl
ZCgpIGZhaWxzIGFuZCB3ZSBpbmplY3QgYSB3cml0ZSAjUEYsCmxlYWRpbmcgdG8gYSBndWVzdCBj
cmFzaC4KClNpZ25lZC1vZmYtYnk6IE1paGFpIERvbsibdSA8bWRvbnR1QGJpdGRlZmVuZGVyLmNv
bT4KU2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29t
PgotLS0KIGFyY2gveDg2L2t2bS94ODYuYyB8IDYgKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3g4
Ni5jIGIvYXJjaC94ODYva3ZtL3g4Ni5jCmluZGV4IGQwMTA0YWRmNzkwNi4uZmVlMjRiYjVmYTUy
IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0veDg2LmMKKysrIGIvYXJjaC94ODYva3ZtL3g4Ni5j
CkBAIC03NDY3LDExICs3NDY3LDE1IEBAIHN0YXRpYyBpbnQgZW11bGF0b3JfZml4X2h5cGVyY2Fs
bChzdHJ1Y3QgeDg2X2VtdWxhdGVfY3R4dCAqY3R4dCkKIAlzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUg
PSBlbXVsX3RvX3ZjcHUoY3R4dCk7CiAJY2hhciBpbnN0cnVjdGlvblszXTsKIAl1bnNpZ25lZCBs
b25nIHJpcCA9IGt2bV9yaXBfcmVhZCh2Y3B1KTsKKwlpbnQgZXJyOwogCiAJa3ZtX3g4Nl9vcHMt
PnBhdGNoX2h5cGVyY2FsbCh2Y3B1LCBpbnN0cnVjdGlvbik7CiAKLQlyZXR1cm4gZW11bGF0b3Jf
d3JpdGVfZW11bGF0ZWQoY3R4dCwgcmlwLCBpbnN0cnVjdGlvbiwgMywKKwllcnIgPSBlbXVsYXRv
cl93cml0ZV9lbXVsYXRlZChjdHh0LCByaXAsIGluc3RydWN0aW9uLCAzLAogCQkmY3R4dC0+ZXhj
ZXB0aW9uKTsKKwlpZiAoZXJyID09IFg4NkVNVUxfUFJPUEFHQVRFX0ZBVUxUKQorCQllcnIgPSBY
ODZFTVVMX0NPTlRJTlVFOworCXJldHVybiBlcnI7CiB9CiAKIHN0YXRpYyBpbnQgZG1fcmVxdWVz
dF9mb3JfaXJxX2luamVjdGlvbihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcg
bGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
