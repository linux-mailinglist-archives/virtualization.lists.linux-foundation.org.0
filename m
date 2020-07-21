Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A00BE228AB4
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 23:16:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 548BF86C2E;
	Tue, 21 Jul 2020 21:16:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UPnIV9Rj05gJ; Tue, 21 Jul 2020 21:16:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B5B3E86B71;
	Tue, 21 Jul 2020 21:16:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 976D5C016F;
	Tue, 21 Jul 2020 21:16:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6CFA9C08A9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 55BF888263
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:16:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Zy5T4TkYb6o
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AEE6588267
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:59 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 6CB08305D7D0; Wed, 22 Jul 2020 00:09:19 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 4DE02303F1B1;
 Wed, 22 Jul 2020 00:09:19 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v9 04/84] KVM: add kvm_get_max_gfn()
Date: Wed, 22 Jul 2020 00:08:02 +0300
Message-Id: <20200721210922.7646-5-alazar@bitdefender.com>
In-Reply-To: <20200721210922.7646-1-alazar@bitdefender.com>
References: <20200721210922.7646-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?=C8=98tefan=20=C8=98icleru?= <ssicleru@bitdefender.com>,
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

RnJvbTogyJh0ZWZhbiDImGljbGVydSA8c3NpY2xlcnVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyBm
dW5jdGlvbiBpcyBuZWVkZWQgZm9yIHRoZSBLVk1JX1ZNX0dFVF9NQVhfR0ZOIGNvbW1hbmQuCgpT
aWduZWQtb2ZmLWJ5OiDImHRlZmFuIMiYaWNsZXJ1IDxzc2ljbGVydUBiaXRkZWZlbmRlci5jb20+
ClNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJpdGRlZmVuZGVyLmNvbT4K
LS0tCiBpbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmggfCAgMSArCiB2aXJ0L2t2bS9rdm1fbWFpbi5j
ICAgICAgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMjUg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaCBiL2lu
Y2x1ZGUvbGludXgva3ZtX2hvc3QuaAppbmRleCA5MjQ5MDI3OWQ2NWEuLmE0MjQ5ZmM4OGZjMiAx
MDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oCisrKyBiL2luY2x1ZGUvbGludXgv
a3ZtX2hvc3QuaApAQCAtNzc2LDYgKzc3Niw3IEBAIHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKmdm
bl90b19tZW1zbG90KHN0cnVjdCBrdm0gKmt2bSwgZ2ZuX3QgZ2ZuKTsKIGJvb2wga3ZtX2lzX3Zp
c2libGVfZ2ZuKHN0cnVjdCBrdm0gKmt2bSwgZ2ZuX3QgZ2ZuKTsKIHVuc2lnbmVkIGxvbmcga3Zt
X2hvc3RfcGFnZV9zaXplKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgZ2ZuX3QgZ2ZuKTsKIHZvaWQg
bWFya19wYWdlX2RpcnR5KHN0cnVjdCBrdm0gKmt2bSwgZ2ZuX3QgZ2ZuKTsKK2dmbl90IGt2bV9n
ZXRfbWF4X2dmbihzdHJ1Y3Qga3ZtICprdm0pOwogCiBzdHJ1Y3Qga3ZtX21lbXNsb3RzICprdm1f
dmNwdV9tZW1zbG90cyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogc3RydWN0IGt2bV9tZW1vcnlf
c2xvdCAqa3ZtX3ZjcHVfZ2ZuX3RvX21lbXNsb3Qoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBnZm5f
dCBnZm4pOwpkaWZmIC0tZ2l0IGEvdmlydC9rdm0va3ZtX21haW4uYyBiL3ZpcnQva3ZtL2t2bV9t
YWluLmMKaW5kZXggNGQ5NjU5MTNkMzQ3Li44YzRiY2NmMzNjOGMgMTAwNjQ0Ci0tLSBhL3ZpcnQv
a3ZtL2t2bV9tYWluLmMKKysrIGIvdmlydC9rdm0va3ZtX21haW4uYwpAQCAtMTM0Nyw2ICsxMzQ3
LDMwIEBAIHN0YXRpYyBpbnQga3ZtX3ZtX2lvY3RsX3NldF9tZW1vcnlfcmVnaW9uKHN0cnVjdCBr
dm0gKmt2bSwKIAlyZXR1cm4ga3ZtX3NldF9tZW1vcnlfcmVnaW9uKGt2bSwgbWVtKTsKIH0KIAor
Z2ZuX3Qga3ZtX2dldF9tYXhfZ2ZuKHN0cnVjdCBrdm0gKmt2bSkKK3sKKwl1MzIgc2tpcF9tYXNr
ID0gS1ZNX01FTV9SRUFET05MWSB8IEtWTV9NRU1TTE9UX0lOVkFMSUQ7CisJc3RydWN0IGt2bV9t
ZW1vcnlfc2xvdCAqbWVtc2xvdDsKKwlzdHJ1Y3Qga3ZtX21lbXNsb3RzICpzbG90czsKKwlnZm5f
dCBtYXhfZ2ZuID0gMDsKKwlpbnQgaWR4OworCisJaWR4ID0gc3JjdV9yZWFkX2xvY2soJmt2bS0+
c3JjdSk7CisJc3Bpbl9sb2NrKCZrdm0tPm1tdV9sb2NrKTsKKworCXNsb3RzID0ga3ZtX21lbXNs
b3RzKGt2bSk7CisJa3ZtX2Zvcl9lYWNoX21lbXNsb3QobWVtc2xvdCwgc2xvdHMpCisJCWlmICht
ZW1zbG90LT5pZCA8IEtWTV9VU0VSX01FTV9TTE9UUyAmJgorCQkgICAobWVtc2xvdC0+ZmxhZ3Mg
JiBza2lwX21hc2spID09IDApCisJCQltYXhfZ2ZuID0gbWF4KG1heF9nZm4sIG1lbXNsb3QtPmJh
c2VfZ2ZuCisJCQkJCQkrIG1lbXNsb3QtPm5wYWdlcyk7CisKKwlzcGluX3VubG9jaygma3ZtLT5t
bXVfbG9jayk7CisJc3JjdV9yZWFkX3VubG9jaygma3ZtLT5zcmN1LCBpZHgpOworCisJcmV0dXJu
IG1heF9nZm47Cit9CisKICNpZm5kZWYgQ09ORklHX0tWTV9HRU5FUklDX0RJUlRZTE9HX1JFQURf
UFJPVEVDVAogLyoqCiAgKiBrdm1fZ2V0X2RpcnR5X2xvZyAtIGdldCBhIHNuYXBzaG90IG9mIGRp
cnR5IHBhZ2VzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
ClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1m
b3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9s
aXN0aW5mby92aXJ0dWFsaXphdGlvbg==
