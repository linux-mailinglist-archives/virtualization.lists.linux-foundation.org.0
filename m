Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 173A1228A9A
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 23:16:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C127588299;
	Tue, 21 Jul 2020 21:16:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kfzanQCjJieV; Tue, 21 Jul 2020 21:16:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9E278882C0;
	Tue, 21 Jul 2020 21:16:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D8AFC016F;
	Tue, 21 Jul 2020 21:16:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A3E1C08A6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0329186B65
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:16:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YkyFr0qQ5gE6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 38F8386B21
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:59 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 8E10D305D4EE; Wed, 22 Jul 2020 00:09:27 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 6FF30304FA15;
 Wed, 22 Jul 2020 00:09:27 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v9 54/84] KVM: introspection: add the crash action handling on
 the event reply
Date: Wed, 22 Jul 2020 00:08:52 +0300
Message-Id: <20200721210922.7646-55-alazar@bitdefender.com>
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyBhY3Rpb24g
aXMgdXNlZCBpbiBleHRyZW1lIGNhc2VzIHN1Y2ggYXMgYmxvY2tpbmcgdGhlIHNwcmVhZCBvZgpt
YWx3YXJlIGFzIGZhc3QgYXMgcG9zc2libGUuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaSBEb27Im3Ug
PG1kb250dUBiaXRkZWZlbmRlci5jb20+ClNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8
YWxhemFyQGJpdGRlZmVuZGVyLmNvbT4KLS0tCiB2aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWku
YyB8IDI4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyOCBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pLmMg
Yi92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWkuYwppbmRleCAwMmE4NjZjYThkOGMuLjllMDAx
NGJiZjlhNiAxMDA2NDQKLS0tIGEvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pLmMKKysrIGIv
dmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pLmMKQEAgLTc0OSw5ICs3NDksMzcgQEAgc3RhdGlj
IHZvaWQga3ZtaV9oYW5kbGVfdW5zdXBwb3J0ZWRfZXZlbnRfYWN0aW9uKHN0cnVjdCBrdm0gKmt2
bSkKIAlrdm1pX3NvY2tfc2h1dGRvd24oS1ZNSShrdm0pKTsKIH0KIAorc3RhdGljIGludCBrdm1p
X3ZjcHVfa2lsbChpbnQgc2lnLCBzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCit7CisJc3RydWN0IGtl
cm5lbF9zaWdpbmZvIHNpZ2luZm9bMV0gPSB7fTsKKwlpbnQgZXJyID0gLUVTUkNIOworCXN0cnVj
dCBwaWQgKnBpZDsKKworCXJjdV9yZWFkX2xvY2soKTsKKwlwaWQgPSByY3VfZGVyZWZlcmVuY2Uo
dmNwdS0+cGlkKTsKKwlpZiAocGlkKQorCQllcnIgPSBraWxsX3BpZF9pbmZvKHNpZywgc2lnaW5m
bywgcGlkKTsKKwlyY3VfcmVhZF91bmxvY2soKTsKKworCXJldHVybiBlcnI7Cit9CisKK3N0YXRp
YyB2b2lkIGt2bWlfdm1fc2h1dGRvd24oc3RydWN0IGt2bSAqa3ZtKQoreworCXN0cnVjdCBrdm1f
dmNwdSAqdmNwdTsKKwlpbnQgaTsKKworCWt2bV9mb3JfZWFjaF92Y3B1KGksIHZjcHUsIGt2bSkK
KwkJa3ZtaV92Y3B1X2tpbGwoU0lHVEVSTSwgdmNwdSk7Cit9CisKIHZvaWQga3ZtaV9oYW5kbGVf
Y29tbW9uX2V2ZW50X2FjdGlvbnMoc3RydWN0IGt2bSAqa3ZtLCB1MzIgYWN0aW9uKQogewogCXN3
aXRjaCAoYWN0aW9uKSB7CisJY2FzZSBLVk1JX0VWRU5UX0FDVElPTl9DUkFTSDoKKwkJa3ZtaV92
bV9zaHV0ZG93bihrdm0pOworCQlicmVhazsKKwogCWRlZmF1bHQ6CiAJCWt2bWlfaGFuZGxlX3Vu
c3VwcG9ydGVkX2V2ZW50X2FjdGlvbihrdm0pOwogCX0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1
YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhm
b3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
