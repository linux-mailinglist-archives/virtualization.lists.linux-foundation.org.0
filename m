Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BD11978F4
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 12:20:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 99D31232BD;
	Mon, 30 Mar 2020 10:20:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jGcoWs7JGwC9; Mon, 30 Mar 2020 10:20:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7C48B23115;
	Mon, 30 Mar 2020 10:20:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DF15EC1D7E;
	Mon, 30 Mar 2020 10:20:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9830C1D8E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C291D86A3C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:19:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h3ourabrKZrS
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:19:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1063586A22
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:19:53 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 AC2A5305FFAD; Mon, 30 Mar 2020 13:12:57 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 6F084305B7A0;
 Mon, 30 Mar 2020 13:12:57 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v8 55/81] KVM: introspection: add crash action handling on
 event reply
Date: Mon, 30 Mar 2020 13:12:42 +0300
Message-Id: <20200330101308.21702-56-alazar@bitdefender.com>
In-Reply-To: <20200330101308.21702-1-alazar@bitdefender.com>
References: <20200330101308.21702-1-alazar@bitdefender.com>
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
YWx3YXJlIGFzIHF1aWNrbHkgYXMgcG9zc2libGUuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaSBEb27I
m3UgPG1kb250dUBiaXRkZWZlbmRlci5jb20+ClNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSD
ciA8YWxhemFyQGJpdGRlZmVuZGVyLmNvbT4KLS0tCiB2aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2
bWkuYyB8IDI4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAy
OCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1p
LmMgYi92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWkuYwppbmRleCAyYjhlNjkxMGU1N2IuLjUx
N2U3N2FiMzljMiAxMDA2NDQKLS0tIGEvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pLmMKKysr
IGIvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pLmMKQEAgLTcwNywxMCArNzA3LDM4IEBAIHZv
aWQga3ZtaV9ydW5fam9icyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAJfQogfQogCitzdGF0aWMg
aW50IGt2bWlfdmNwdV9raWxsKGludCBzaWcsIHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKK3sKKwlz
dHJ1Y3Qga2VybmVsX3NpZ2luZm8gc2lnaW5mb1sxXSA9IHt9OworCWludCBlcnIgPSAtRVNSQ0g7
CisJc3RydWN0IHBpZCAqcGlkOworCisJcmN1X3JlYWRfbG9jaygpOworCXBpZCA9IHJjdV9kZXJl
ZmVyZW5jZSh2Y3B1LT5waWQpOworCWlmIChwaWQpCisJCWVyciA9IGtpbGxfcGlkX2luZm8oc2ln
LCBzaWdpbmZvLCBwaWQpOworCXJjdV9yZWFkX3VubG9jaygpOworCisJcmV0dXJuIGVycjsKK30K
Kworc3RhdGljIHZvaWQga3ZtaV92bV9zaHV0ZG93bihzdHJ1Y3Qga3ZtICprdm0pCit7CisJc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1OworCWludCBpOworCisJa3ZtX2Zvcl9lYWNoX3ZjcHUoaSwgdmNw
dSwga3ZtKQorCQlrdm1pX3ZjcHVfa2lsbChTSUdURVJNLCB2Y3B1KTsKK30KKwogdm9pZCBrdm1p
X2hhbmRsZV9jb21tb25fZXZlbnRfYWN0aW9ucyhzdHJ1Y3Qga3ZtICprdm0sCiAJCQkJICAgICAg
dTMyIGFjdGlvbiwgY29uc3QgY2hhciAqc3RyKQogewogCXN3aXRjaCAoYWN0aW9uKSB7CisJY2Fz
ZSBLVk1JX0VWRU5UX0FDVElPTl9DUkFTSDoKKwkJa3ZtaV92bV9zaHV0ZG93bihrdm0pOworCQli
cmVhazsKKwogCWRlZmF1bHQ6CiAJCWt2bWlfZXJyKEtWTUkoa3ZtKSwgIlVuc3VwcG9ydGVkIGFj
dGlvbiAlZCBmb3IgZXZlbnQgJXNcbiIsCiAJCQkgYWN0aW9uLCBzdHIpOwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5n
IGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9s
aXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
