Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D5733229CA0
	for <lists.virtualization@lfdr.de>; Wed, 22 Jul 2020 18:02:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 73E8A887D4;
	Wed, 22 Jul 2020 16:02:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6MN37nZB2Nen; Wed, 22 Jul 2020 16:02:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1CB5E88874;
	Wed, 22 Jul 2020 16:01:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ECFE7C004C;
	Wed, 22 Jul 2020 16:01:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F40CCC004C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E2B8588169
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0DHrcaGxxnAz
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 833B388145
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:37 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 935A3305D769; Wed, 22 Jul 2020 19:01:32 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.6])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 894D8305FFA5;
 Wed, 22 Jul 2020 19:01:32 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v1 18/34] KVM: introspection: extend
 KVMI_VM_SET_PAGE_ACCESS with EPT view info
Date: Wed, 22 Jul 2020 19:01:05 +0300
Message-Id: <20200722160121.9601-19-alazar@bitdefender.com>
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

RnJvbTogyJh0ZWZhbiDImGljbGVydSA8c3NpY2xlcnVAYml0ZGVmZW5kZXIuY29tPgoKVGhlIGlu
dHJvc3BlY3Rpb24gdG9vbCB1c2VzIHRoaXMgY29tbWFuZCB0byBzZXQgZGlzdGluY3QgYWNjZXNz
IHJpZ2h0cwpvbiBkaWZmZXJlbnQgRVBUIHZpZXdzLgoKU2lnbmVkLW9mZi1ieTogyJh0ZWZhbiDI
mGljbGVydSA8c3NpY2xlcnVAYml0ZGVmZW5kZXIuY29tPgpTaWduZWQtb2ZmLWJ5OiBBZGFsYmVy
dCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi92aXJ0
L2t2bS9rdm1pLnJzdCB8ICA4ICsrKysrLS0tCiBpbmNsdWRlL3VhcGkvbGludXgva3ZtaS5oICAg
ICAgIHwgIDQgKystLQogdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pLmMgICB8IDEwICsrKysr
KysrLS0KIDMgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2t2bWkucnN0IGIvRG9jdW1lbnRh
dGlvbi92aXJ0L2t2bS9rdm1pLnJzdAppbmRleCBmNGM2MGFiYTliNTMuLjY1OGM5ZGYwMTQ2OSAx
MDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJzdAorKysgYi9Eb2N1bWVu
dGF0aW9uL3ZpcnQva3ZtL2t2bWkucnN0CkBAIC0xMDAzLDggKzEwMDMsOCBAQCB0byBjb250cm9s
IGV2ZW50cyBmb3IgYW55IG90aGVyIHJlZ2lzdGVyIHdpbGwgZmFpbCB3aXRoIC1LVk1fRUlOVkFM
OjoKIAogCXN0cnVjdCBrdm1pX3ZtX3NldF9wYWdlX2FjY2VzcyB7CiAJCV9fdTE2IGNvdW50Owot
CQlfX3UxNiBwYWRkaW5nMTsKLQkJX191MzIgcGFkZGluZzI7CisJCV9fdTE2IHZpZXc7CisJCV9f
dTMyIHBhZGRpbmc7CiAJCXN0cnVjdCBrdm1pX3BhZ2VfYWNjZXNzX2VudHJ5IGVudHJpZXNbMF07
CiAJfTsKIApAQCAtMTAyNiw3ICsxMDI2LDcgQEAgd2hlcmU6OgogCXN0cnVjdCBrdm1pX2Vycm9y
X2NvZGUKIAogU2V0cyB0aGUgYWNjZXNzIGJpdHMgKHJ3eCkgZm9yIGFuIGFycmF5IG9mIGBgY291
bnRgYCBndWVzdCBwaHlzaWNhbAotYWRkcmVzc2VzLgorYWRkcmVzc2VzLCBmb3IgdGhlIHNlbGVj
dGVkIHZpZXcuCiAKIFRoZSB2YWxpZCBhY2Nlc3MgYml0cyBhcmU6OgogCkBAIC0xMDQ4LDcgKzEw
NDgsOSBAQCBJbiBvcmRlciB0byAnZm9yZ2V0JyBhbiBhZGRyZXNzLCBhbGwgdGhyZWUgYml0cyAo
J3J3eCcpIG11c3QgYmUgc2V0LgogCiAqIC1LVk1fRUlOVkFMIC0gdGhlIHNwZWNpZmllZCBhY2Nl
c3MgYml0cyBjb21iaW5hdGlvbiBpcyBpbnZhbGlkCiAqIC1LVk1fRUlOVkFMIC0gdGhlIHBhZGRp
bmcgaXMgbm90IHplcm8KKyogLUtWTV9FSU5WQUwgLSB0aGUgc2VsZWN0ZWQgRVBUIHZpZXcgaXMg
aW52YWxpZAogKiAtS1ZNX0VJTlZBTCAtIHRoZSBtZXNzYWdlIHNpemUgaXMgaW52YWxpZAorKiAt
S1ZNX0VPUE5PVFNVUFAgLSBhbiBFUFQgdmlldyB3YXMgc2VsZWN0ZWQgYnV0IHRoZSBoYXJkd2Fy
ZSBkb2Vzbid0IHN1cHBvcnQgaXQKICogLUtWTV9FQUdBSU4gLSB0aGUgc2VsZWN0ZWQgdkNQVSBj
YW4ndCBiZSBpbnRyb3NwZWN0ZWQgeWV0CiAqIC1LVk1fRU5PTUVNIC0gdGhlcmUgaXMgbm90IGVu
b3VnaCBtZW1vcnkgdG8gYWRkIHRoZSBwYWdlIHRyYWNraW5nIHN0cnVjdHVyZXMKIApkaWZmIC0t
Z2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaCBiL2luY2x1ZGUvdWFwaS9saW51eC9rdm1p
LmgKaW5kZXggYTcyYzUzNmEyYzgwLi41MDVhODY1Y2QxMTUgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUv
dWFwaS9saW51eC9rdm1pLmgKKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaApAQCAtMTkx
LDggKzE5MSw4IEBAIHN0cnVjdCBrdm1pX3BhZ2VfYWNjZXNzX2VudHJ5IHsKIAogc3RydWN0IGt2
bWlfdm1fc2V0X3BhZ2VfYWNjZXNzIHsKIAlfX3UxNiBjb3VudDsKLQlfX3UxNiBwYWRkaW5nMTsK
LQlfX3UzMiBwYWRkaW5nMjsKKwlfX3UxNiB2aWV3OworCV9fdTMyIHBhZGRpbmc7CiAJc3RydWN0
IGt2bWlfcGFnZV9hY2Nlc3NfZW50cnkgZW50cmllc1swXTsKIH07CiAKZGlmZiAtLWdpdCBhL3Zp
cnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaS5jIGIvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1p
LmMKaW5kZXggNzM3ZmUzYzdhOTU2Li40NGIwMDkyZTMwNGYgMTAwNjQ0Ci0tLSBhL3ZpcnQva3Zt
L2ludHJvc3BlY3Rpb24va3ZtaS5jCisrKyBiL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaS5j
CkBAIC0xMTg3LDE0ICsxMTg3LDIwIEBAIGludCBrdm1pX2NtZF9zZXRfcGFnZV9hY2Nlc3Moc3Ry
dWN0IGt2bV9pbnRyb3NwZWN0aW9uICprdm1pLAogCWNvbnN0IHN0cnVjdCBrdm1pX3BhZ2VfYWNj
ZXNzX2VudHJ5ICplbmQgPSByZXEtPmVudHJpZXMgKyByZXEtPmNvdW50OwogCWludCBlYyA9IDA7
CiAKLQlpZiAocmVxLT5wYWRkaW5nMSB8fCByZXEtPnBhZGRpbmcyKQorCWlmIChyZXEtPnBhZGRp
bmcpCiAJCXJldHVybiAtS1ZNX0VJTlZBTDsKIAogCWlmIChtc2ctPnNpemUgPCBzdHJ1Y3Rfc2l6
ZShyZXEsIGVudHJpZXMsIHJlcS0+Y291bnQpKQogCQlyZXR1cm4gLUtWTV9FSU5WQUw7CiAKKwlp
ZiAoIWlzX3ZhbGlkX3ZpZXcocmVxLT52aWV3KSkKKwkJcmV0dXJuIC1LVk1fRUlOVkFMOworCisJ
aWYgKHJlcS0+dmlldyAhPSAwICYmICFrdm1fZXB0cF9zd2l0Y2hpbmdfc3VwcG9ydGVkKQorCQly
ZXR1cm4gLUtWTV9FT1BOT1RTVVBQOworCiAJZm9yICg7IGVudHJ5IDwgZW5kOyBlbnRyeSsrKSB7
Ci0JCWludCByID0gc2V0X3BhZ2VfYWNjZXNzX2VudHJ5KGt2bWksIDAsIGVudHJ5KTsKKwkJaW50
IHIgPSBzZXRfcGFnZV9hY2Nlc3NfZW50cnkoa3ZtaSwgcmVxLT52aWV3LCBlbnRyeSk7CiAKIAkJ
aWYgKHIgJiYgIWVjKQogCQkJZWMgPSByOwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRp
b25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRp
b24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
