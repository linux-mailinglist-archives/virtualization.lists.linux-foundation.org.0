Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFFC229C86
	for <lists.virtualization@lfdr.de>; Wed, 22 Jul 2020 18:01:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id ECDE188731;
	Wed, 22 Jul 2020 16:01:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l+TSljqQcXqg; Wed, 22 Jul 2020 16:01:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A8A6C887C0;
	Wed, 22 Jul 2020 16:01:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 83FC1C004C;
	Wed, 22 Jul 2020 16:01:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D1A3AC004C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BFFB988424
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hjzcgh9tFSrv
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2EA4B884DA
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:38 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 2225A305D654; Wed, 22 Jul 2020 19:01:33 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.6])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 0D129305FFB6;
 Wed, 22 Jul 2020 19:01:33 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v1 29/34] KVM: vmx: make use of EPTP_INDEX in
 vmx_handle_exit()
Date: Wed, 22 Jul 2020 19:01:16 +0300
Message-Id: <20200722160121.9601-30-alazar@bitdefender.com>
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

RnJvbTogyJh0ZWZhbiDImGljbGVydSA8c3NpY2xlcnVAYml0ZGVmZW5kZXIuY29tPgoKSWYgdGhl
IGd1ZXN0IGhhcyBFUFRQIHN3aXRjaGluZyBjYXBhYmlsaXRpZXMgd2l0aCBWTUZVTkMsIHJlYWQg
dGhlCmN1cnJlbnQgdmlldyBmcm9tIFZNQ1MgaW5zdGVhZCBvZiB3YWxraW5nIHRocm91Z2ggdGhl
IEVQVFAgbGlzdCB3aGVuICNWRQpzdXBwb3J0IGlzIGFjdGl2ZS4KClNpZ25lZC1vZmYtYnk6IMiY
dGVmYW4gyJhpY2xlcnUgPHNzaWNsZXJ1QGJpdGRlZmVuZGVyLmNvbT4KU2lnbmVkLW9mZi1ieTog
QWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIGFyY2gveDg2L2t2
bS92bXgvdm14LmMgfCAyMiArKysrKysrKysrKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MTQgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9r
dm0vdm14L3ZteC5jIGIvYXJjaC94ODYva3ZtL3ZteC92bXguYwppbmRleCA5NmFhNGI3ZTI4NTcu
LjAzNWY2YzQzYTJhNCAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL3ZteC92bXguYworKysgYi9h
cmNoL3g4Ni9rdm0vdm14L3ZteC5jCkBAIC02MjY5LDE1ICs2MjY5LDIxIEBAIHZvaWQgZHVtcF92
bWNzKHZvaWQpCiAKIHN0YXRpYyB1bnNpZ25lZCBpbnQgdXBkYXRlX2VwdF92aWV3KHN0cnVjdCB2
Y3B1X3ZteCAqdm14KQogewotCXU2NCAqZXB0cF9saXN0ID0gcGh5c190b192aXJ0KHBhZ2VfdG9f
cGh5cyh2bXgtPmVwdHBfbGlzdF9wZykpOwotCXU2NCBlcHRwID0gdm1jc19yZWFkNjQoRVBUX1BP
SU5URVIpOwotCXVuc2lnbmVkIGludCB2aWV3OworCS8qIGlmICNWRSBzdXBwb3J0IGlzIGFjdGl2
ZSwgcmVhZCB0aGUgRVBUIGluZGV4IGZyb20gVk1DUyAqLworCWlmIChrdm1fdmVfc3VwcG9ydGVk
ICYmCisJICAgIHNlY29uZGFyeV9leGVjX2NvbnRyb2xzX2dldCh2bXgpICYgU0VDT05EQVJZX0VY
RUNfRVBUX1ZFKSB7CisJCXZteC0+dmlldyA9IHZtY3NfcmVhZDE2KEVQVFBfSU5ERVgpOworCX0g
ZWxzZSB7CisJCXU2NCAqZXB0cF9saXN0ID0gcGh5c190b192aXJ0KHBhZ2VfdG9fcGh5cyh2bXgt
PmVwdHBfbGlzdF9wZykpOworCQl1NjQgZXB0cCA9IHZtY3NfcmVhZDY0KEVQVF9QT0lOVEVSKTsK
KwkJdW5zaWduZWQgaW50IHZpZXc7CiAKLQlmb3IgKHZpZXcgPSAwOyB2aWV3IDwgS1ZNX01BWF9F
UFRfVklFV1M7IHZpZXcrKykKLQkJaWYgKGVwdHBfbGlzdFt2aWV3XSA9PSBlcHRwKSB7Ci0JCQl2
bXgtPnZpZXcgPSB2aWV3OwotCQkJYnJlYWs7Ci0JCX0KKwkJZm9yICh2aWV3ID0gMDsgdmlldyA8
IEtWTV9NQVhfRVBUX1ZJRVdTOyB2aWV3KyspCisJCQlpZiAoZXB0cF9saXN0W3ZpZXddID09IGVw
dHApIHsKKwkJCQl2bXgtPnZpZXcgPSB2aWV3OworCQkJCWJyZWFrOworCQkJfQorCX0KIAogCXJl
dHVybiB2bXgtPnZpZXc7CiB9Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0
cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcv
bWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
