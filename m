Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9997A228B2F
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 23:26:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 46E9981D3F;
	Tue, 21 Jul 2020 21:26:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UF3g6qe84yQM; Tue, 21 Jul 2020 21:26:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7F7DB884EE;
	Tue, 21 Jul 2020 21:26:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 64AB6C088E;
	Tue, 21 Jul 2020 21:26:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 13E9BC016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EE95B882CB
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:26:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UqFQMBwhHRz9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:26:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E2897882B7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:58 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 4ACAF305D980; Wed, 22 Jul 2020 00:09:19 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 31143303EFFA;
 Wed, 22 Jul 2020 00:09:19 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v9 03/84] KVM: add kvm_vcpu_kick_and_wait()
Date: Wed, 22 Jul 2020 00:08:01 +0300
Message-Id: <20200721210922.7646-4-alazar@bitdefender.com>
In-Reply-To: <20200721210922.7646-1-alazar@bitdefender.com>
References: <20200721210922.7646-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>, virtualization@lists.linux-foundation.org
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

VGhpcyBmdW5jdGlvbiBpcyBuZWVkZWQgZm9yIHRoZSBLVk1JX1ZDUFVfUEFVU0UgY29tbWFuZCwg
d2hpY2ggc2V0cyB0aGUKaW50cm9zcGVjdGlvbiByZXF1ZXN0IGZsYWcsIGtpY2tzIHRoZSB2Q1BV
IG91dCBvZiBndWVzdCBhbmQgcmV0dXJucyBhCnN1Y2Nlc3MgZXJyb3IgY29kZSAoMCkuIFRoZSB2
Q1BVIHdpbGwgc2VuZCB0aGUgS1ZNSV9FVkVOVF9QQVVTRSBldmVudAphcyBzb29uIGFzIHBvc3Np
YmxlLiBPbmNlIHRoZSBpbnRyb3NwZWN0aW9uIHRvb2wgcmVjZWl2ZXMgdGhlIGV2ZW50LCBpdApr
bm93cyB0aGF0IHRoZSB2Q1BVIGRvZXNuJ3QgcnVuIGd1ZXN0IGNvZGUgYW5kIGNhbiBoYW5kbGUg
aW50cm9zcGVjdGlvbgpjb21tYW5kcyAodW50aWwgdGhlIHJlcGx5IGZvciB0aGUgcGF1c2UgZXZl
bnQgaXMgc2VudCkuCgpUbyBpbXBsZW1lbnQgdGhlICJwYXVzZSBWTSIgY29tbWFuZCwgdGhlIHVz
ZXJzcGFjZSBjb2RlIHdpbGwgc2VuZCBhCktWTUlfVkNQVV9QQVVTRSBjb21tYW5kIGZvciBldmVy
eSB2Q1BVLiBUbyBrbm93IHdoZW4gdGhlIFZNIGlzIHBhdXNlZCwKdXNlcnNwYWNlIGhhcyB0byBy
ZWNlaXZlIGFuZCAicGFyc2UiIGFsbCBldmVudHMuIEZvciBleGFtcGxlLCB3aXRoIGEKNCB2Q1BV
IFZNLCBpZiB0aGUgInBhdXNlIFZNIiB3YXMgc2VudCBieSB1c2Vyc3BhY2Ugd2hpbGUgaGFuZGxp
bmcgYW4gZXZlbnQKZnJvbSB2Q1BVMCBhbmQgYXQgdGhlIHNhbWUgdGltZSBhIG5ldyB2Q1BVIHdh
cyBob3QtcGx1Z2dlZCAod2hpY2ggY291bGQKc2VuZCBhbm90aGVyIGV2ZW50IGZvciB2Q1BVNCks
IHRoZSAicGF1c2UgVk0iIGNvbW1hbmQgaGFzIHRvIHJlY2VpdmUKYW5kIGNoZWNrIGFsbCBldmVu
dHMgdW50aWwgaXQgZ2V0cyB0aGUgcGF1c2UgZXZlbnRzIGZvciB2Q1BVMSwgdkNQVTIKYW5kIHZD
UFUzIGJlZm9yZSByZXR1cm5pbmcgdG8gdGhlIHVwcGVyIGxheWVyLgoKSW4gb3JkZXIgdG8gbWFr
ZSBpdCBlYXNpZXIgZm9yIHVzZXJzcGFjZSB0byBpbXBsZW1lbnQgdGhlICJwYXVzZSBWTSIKY29t
bWFuZCwgdGhlIEtWTUlfVkNQVV9QQVVTRSBoYXMgYW4gb3B0aW9uYWwgJ3dhaXQnIHBhcmFtZXRl
ci4gSWYgdGhpcyBpcwpzZXQsIGt2bV92Y3B1X2tpY2tfYW5kX3dhaXQoKSB3aWxsIGJlIHVzZWQg
aW5zdGVhZCBvZiBrdm1fdmNwdV9raWNrKCkuCkFuZCBiZWNhdXNlIHRoaXMgdkNQVSBjb21tYW5k
IChLVk1JX1ZDUFVfUEFVU0UpIGlzIGhhbmRsZWQgYnkgdGhlCnJlY2VpdmluZyB0aHJlYWQgKGlu
c3RlYWQgb2YgdGhlIHZDUFUgdGhyZWFkKSwgb25jZSBhIHN0cmluZyBvZgpLVk1JX1ZDUFVfUEFV
U0UgY29tbWFuZHMgd2l0aCB0aGUgJ3dhaXQnIGZsYWcgc2V0IGlzIGhhbmRsZWQsIHRoZQppbnRy
b3NwZWN0aW9uIHRvb2wgY2FuIGNvbnNpZGVyIHRoZSBWTSBwYXVzZWQsIHdpdGhvdXQgdGhlIG5l
ZWQgdG8gd2FpdAphbmQgY2hlY2sgZXZlbnRzLgoKU2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6
xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIGluY2x1ZGUvbGludXgva3ZtX2hvc3Qu
aCB8ICAxICsKIHZpcnQva3ZtL2t2bV9tYWluLmMgICAgICB8IDEwICsrKysrKysrKysKIDIgZmls
ZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgv
a3ZtX2hvc3QuaCBiL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaAppbmRleCA2MmVjOTI2Yzc4YTAu
LjkyNDkwMjc5ZDY1YSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oCisrKyBi
L2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaApAQCAtODEwLDYgKzgxMCw3IEBAIHZvaWQga3ZtX2Fy
Y2hfdmNwdV9ibG9ja2luZyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogdm9pZCBrdm1fYXJjaF92
Y3B1X3VuYmxvY2tpbmcoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIGJvb2wga3ZtX3ZjcHVfd2Fr
ZV91cChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogdm9pZCBrdm1fdmNwdV9raWNrKHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSk7Cit2b2lkIGt2bV92Y3B1X2tpY2tfYW5kX3dhaXQoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1KTsKIGludCBrdm1fdmNwdV95aWVsZF90byhzdHJ1Y3Qga3ZtX3ZjcHUgKnRhcmdl
dCk7CiB2b2lkIGt2bV92Y3B1X29uX3NwaW4oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBib29sIHVz
ZXJtb2RlX3ZjcHVfbm90X2VsaWdpYmxlKTsKIApkaWZmIC0tZ2l0IGEvdmlydC9rdm0va3ZtX21h
aW4uYyBiL3ZpcnQva3ZtL2t2bV9tYWluLmMKaW5kZXggMGE2OGM5ZDNkM2FiLi40ZDk2NTkxM2Qz
NDcgMTAwNjQ0Ci0tLSBhL3ZpcnQva3ZtL2t2bV9tYWluLmMKKysrIGIvdmlydC9rdm0va3ZtX21h
aW4uYwpAQCAtMjgwMiw2ICsyODAyLDE2IEBAIHZvaWQga3ZtX3ZjcHVfa2ljayhzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUpCiBFWFBPUlRfU1lNQk9MX0dQTChrdm1fdmNwdV9raWNrKTsKICNlbmRpZiAv
KiAhQ09ORklHX1MzOTAgKi8KIAordm9pZCBrdm1fdmNwdV9raWNrX2FuZF93YWl0KHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSkKK3sKKwlpZiAoa3ZtX3ZjcHVfd2FrZV91cCh2Y3B1KSkKKwkJcmV0dXJu
OworCisJaWYgKGt2bV9yZXF1ZXN0X25lZWRzX2lwaSh2Y3B1LCBLVk1fUkVRVUVTVF9XQUlUKSkK
KwkJc21wX2NhbGxfZnVuY3Rpb25fc2luZ2xlKHZjcHUtPmNwdSwgYWNrX2ZsdXNoLCBOVUxMLCAx
KTsKK30KK0VYUE9SVF9TWU1CT0xfR1BMKGt2bV92Y3B1X2tpY2tfYW5kX3dhaXQpOworCiBpbnQg
a3ZtX3ZjcHVfeWllbGRfdG8oc3RydWN0IGt2bV92Y3B1ICp0YXJnZXQpCiB7CiAJc3RydWN0IHBp
ZCAqcGlkOwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpW
aXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91
bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlz
dGluZm8vdmlydHVhbGl6YXRpb24=
