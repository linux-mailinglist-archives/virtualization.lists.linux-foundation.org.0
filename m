Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A07A4229C80
	for <lists.virtualization@lfdr.de>; Wed, 22 Jul 2020 18:01:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3AA08887B9;
	Wed, 22 Jul 2020 16:01:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qGtb8riz0Cis; Wed, 22 Jul 2020 16:01:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8080E887B1;
	Wed, 22 Jul 2020 16:01:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 691A7C004C;
	Wed, 22 Jul 2020 16:01:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7D9D3C004C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5D80822661
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QM-6TFqx5XqJ
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by silver.osuosl.org (Postfix) with ESMTPS id B220E204D6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:35 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 62B3C305D763; Wed, 22 Jul 2020 19:01:32 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.6])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 4C8A3305FFA1;
 Wed, 22 Jul 2020 19:01:32 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v1 14/34] KVM: introspection: add 'view' field to struct
 kvmi_event_arch
Date: Wed, 22 Jul 2020 19:01:01 +0300
Message-Id: <20200722160121.9601-15-alazar@bitdefender.com>
In-Reply-To: <20200722160121.9601-1-alazar@bitdefender.com>
References: <20200722160121.9601-1-alazar@bitdefender.com>
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

RnJvbTogyJh0ZWZhbiDImGljbGVydSA8c3NpY2xlcnVAYml0ZGVmZW5kZXIuY29tPgoKUmVwb3J0
IHRoZSB2aWV3IGEgdkNQVSBvcGVyYXRlcyBvbiB3aGVuIHNlbmRpbmcgZXZlbnRzIHRvIHRoZQpp
bnRyb3NwZWN0aW9uIHRvb2wuCgpTaWduZWQtb2ZmLWJ5OiDImHRlZmFuIMiYaWNsZXJ1IDxzc2lj
bGVydUBiaXRkZWZlbmRlci5jb20+ClNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxh
emFyQGJpdGRlZmVuZGVyLmNvbT4KLS0tCiBhcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL2t2bWku
aCB8IDQgKysrLQogYXJjaC94ODYva3ZtL2t2bWkuYyAgICAgICAgICAgICAgfCAxICsKIDIgZmls
ZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
YXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9rdm1pLmggYi9hcmNoL3g4Ni9pbmNsdWRlL3VhcGkv
YXNtL2t2bWkuaAppbmRleCAzMDg3YzY4NWMyMzIuLmExM2E5OGZhODYzZiAxMDA2NDQKLS0tIGEv
YXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9rdm1pLmgKKysrIGIvYXJjaC94ODYvaW5jbHVkZS91
YXBpL2FzbS9rdm1pLmgKQEAgLTEyLDcgKzEyLDkgQEAKIAogc3RydWN0IGt2bWlfZXZlbnRfYXJj
aCB7CiAJX191OCBtb2RlOwkJLyogMiwgNCBvciA4ICovCi0JX191OCBwYWRkaW5nWzddOworCV9f
dTggcGFkZGluZzE7CisJX191MTYgdmlldzsKKwlfX3UzMiBwYWRkaW5nMjsKIAlzdHJ1Y3Qga3Zt
X3JlZ3MgcmVnczsKIAlzdHJ1Y3Qga3ZtX3NyZWdzIHNyZWdzOwogCXN0cnVjdCB7CmRpZmYgLS1n
aXQgYS9hcmNoL3g4Ni9rdm0va3ZtaS5jIGIvYXJjaC94ODYva3ZtL2t2bWkuYwppbmRleCBiZDMx
ODA5ZmY4MTIuLjI5MjYwNjkwMjMzOCAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL2t2bWkuYwor
KysgYi9hcmNoL3g4Ni9rdm0va3ZtaS5jCkBAIC0xMDIsNiArMTAyLDcgQEAgdm9pZCBrdm1pX2Fy
Y2hfc2V0dXBfZXZlbnQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtaV9ldmVudCAq
ZXYpCiAJa3ZtX2FyY2hfdmNwdV9nZXRfc3JlZ3ModmNwdSwgJmV2ZW50LT5zcmVncyk7CiAJZXYt
PmFyY2gubW9kZSA9IGt2bWlfdmNwdV9tb2RlKHZjcHUsICZldmVudC0+c3JlZ3MpOwogCWt2bWlf
Z2V0X21zcnModmNwdSwgZXZlbnQpOworCWV2ZW50LT52aWV3ID0ga3ZtX2dldF9lcHRfdmlldyh2
Y3B1KTsKIH0KIAogaW50IGt2bWlfYXJjaF9jbWRfdmNwdV9nZXRfaW5mbyhzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHUsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
ClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1m
b3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9s
aXN0aW5mby92aXJ0dWFsaXphdGlvbg==
