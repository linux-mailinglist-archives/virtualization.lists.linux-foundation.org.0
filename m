Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0B4229C78
	for <lists.virtualization@lfdr.de>; Wed, 22 Jul 2020 18:01:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 27309227FA;
	Wed, 22 Jul 2020 16:01:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0+scnZYvuyja; Wed, 22 Jul 2020 16:01:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 71EE8204E7;
	Wed, 22 Jul 2020 16:01:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5BA7EC004C;
	Wed, 22 Jul 2020 16:01:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E8266C004C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D7A74879FF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7KKhtuR8psDq
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A4D3887B2B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:35 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 4FF5D305D7FE; Wed, 22 Jul 2020 19:01:32 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.6])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 3F05D30003E9;
 Wed, 22 Jul 2020 19:01:32 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v1 12/34] KVM: introspection: extend struct kvmi_features
 with the EPT views status support
Date: Wed, 22 Jul 2020 19:00:59 +0300
Message-Id: <20200722160121.9601-13-alazar@bitdefender.com>
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
dHJvc3BlY3Rpb24gdG9vbCB3aWxsIHVzZSB0aGVzZSBuZXcgZmllbGRzIHRvIGNoZWNrCnRoZSBo
YXJkd2FyZSBzdXBwb3J0IGJlZm9yZSB1c2luZyB0aGUgcmVsYXRlZCBpbnRyb3NwZWN0aW9uIGNv
bW1hbmRzLgoKU2lnbmVkLW9mZi1ieTogyJh0ZWZhbiDImGljbGVydSA8c3NpY2xlcnVAYml0ZGVm
ZW5kZXIuY29tPgpTaWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZl
bmRlci5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJzdCAgICAgICAgICAg
ICAgICB8IDYgKysrKy0tCiBhcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL2t2bWkuaCAgICAgICAg
ICAgICAgIHwgNCArKystCiBhcmNoL3g4Ni9rdm0va3ZtaS5jICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgNCArKysrCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0veDg2XzY0L2t2bWlf
dGVzdC5jIHwgMiArKwogNCBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdmlydC9rdm0va3ZtaS5yc3QgYi9E
b2N1bWVudGF0aW9uL3ZpcnQva3ZtL2t2bWkucnN0CmluZGV4IDYyMTM4ZmE0YjY1Yy4uMjM0ZWFj
ZWM0ZGIxIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2t2bWkucnN0CisrKyBi
L0RvY3VtZW50YXRpb24vdmlydC9rdm0va3ZtaS5yc3QKQEAgLTI2MywxMSArMjYzLDEzIEBAIEZv
ciB4ODYKIAogCXN0cnVjdCBrdm1pX2ZlYXR1cmVzIHsKIAkJX191OCBzaW5nbGVzdGVwOwotCQlf
X3U4IHBhZGRpbmdbN107CisJCV9fdTggdm1mdW5jOworCQlfX3U4IGVwdHA7CisJCV9fdTggcGFk
ZGluZ1s1XTsKIAl9OwogCiBSZXR1cm5zIHRoZSBpbnRyb3NwZWN0aW9uIEFQSSB2ZXJzaW9uIGFu
ZCBzb21lIG9mIHRoZSBmZWF0dXJlcyBzdXBwb3J0ZWQKLWJ5IHRoZSBoYXJkd2FyZS4KK2J5IHRo
ZSBoYXJkd2FyZSAoZWcuIGFsdGVybmF0ZSBFUFQgdmlld3MpLgogCiBUaGlzIGNvbW1hbmQgaXMg
YWx3YXlzIGFsbG93ZWQgYW5kIHN1Y2Nlc3NmdWwuCiAKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2lu
Y2x1ZGUvdWFwaS9hc20va3ZtaS5oIGIvYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9rdm1pLmgK
aW5kZXggMzJhZjgwM2YxZDcwLi41MWIzOTlkNTBhMmEgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2lu
Y2x1ZGUvdWFwaS9hc20va3ZtaS5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvdWFwaS9hc20va3Zt
aS5oCkBAIC0xNDcsNyArMTQ3LDkgQEAgc3RydWN0IGt2bWlfZXZlbnRfbXNyX3JlcGx5IHsKIAog
c3RydWN0IGt2bWlfZmVhdHVyZXMgewogCV9fdTggc2luZ2xlc3RlcDsKLQlfX3U4IHBhZGRpbmdb
N107CisJX191OCB2bWZ1bmM7CisJX191OCBlcHRwOworCV9fdTggcGFkZGluZ1s1XTsKIH07CiAK
ICNlbmRpZiAvKiBfVUFQSV9BU01fWDg2X0tWTUlfSCAqLwpkaWZmIC0tZ2l0IGEvYXJjaC94ODYv
a3ZtL2t2bWkuYyBiL2FyY2gveDg2L2t2bS9rdm1pLmMKaW5kZXggN2IzYjY0ZDI3ZDE4Li4yNWMx
ZjhmMmUyMjEgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS9rdm1pLmMKKysrIGIvYXJjaC94ODYv
a3ZtL2t2bWkuYwpAQCAtMTM1Niw2ICsxMzU2LDEwIEBAIHN0YXRpYyB2b2lkIGt2bWlfdHJhY2tf
Zmx1c2hfc2xvdChzdHJ1Y3Qga3ZtICprdm0sIHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNsb3Qs
CiB2b2lkIGt2bWlfYXJjaF9mZWF0dXJlcyhzdHJ1Y3Qga3ZtaV9mZWF0dXJlcyAqZmVhdCkKIHsK
IAlmZWF0LT5zaW5nbGVzdGVwID0gISFrdm1feDg2X29wcy5jb250cm9sX3NpbmdsZXN0ZXA7CisJ
ZmVhdC0+dm1mdW5jID0ga3ZtX3g4Nl9vcHMuZ2V0X3ZtZnVuY19zdGF0dXMgJiYKKwkJCWt2bV94
ODZfb3BzLmdldF92bWZ1bmNfc3RhdHVzKCk7CisJZmVhdC0+ZXB0cCA9IGt2bV94ODZfb3BzLmdl
dF9lcHRwX3N3aXRjaGluZ19zdGF0dXMgJiYKKwkJCWt2bV94ODZfb3BzLmdldF9lcHRwX3N3aXRj
aGluZ19zdGF0dXMoKTsKIH0KIAogYm9vbCBrdm1pX2FyY2hfc3RhcnRfc2luZ2xlc3RlcChzdHJ1
Y3Qga3ZtX3ZjcHUgKnZjcHUpCmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9r
dm0veDg2XzY0L2t2bWlfdGVzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3g4Nl82
NC9rdm1pX3Rlc3QuYwppbmRleCBlOTY4YjFhNmY5NjkuLjMzZmZmY2IzYTE3MSAxMDA2NDQKLS0t
IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3g4Nl82NC9rdm1pX3Rlc3QuYworKysgYi90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0veDg2XzY0L2t2bWlfdGVzdC5jCkBAIC00NDMsNiAr
NDQzLDggQEAgc3RhdGljIHZvaWQgdGVzdF9jbWRfZ2V0X3ZlcnNpb24odm9pZCkKIAogCXByX2lu
Zm8oIktWTUkgdmVyc2lvbjogJXVcbiIsIHJwbC52ZXJzaW9uKTsKIAlwcl9pbmZvKCJcdHNpbmds
ZXN0ZXA6ICV1XG4iLCBmZWF0dXJlcy5zaW5nbGVzdGVwKTsKKwlwcl9pbmZvKCJcdHZtZnVuYzog
JXVcbiIsIGZlYXR1cmVzLnZtZnVuYyk7CisJcHJfaW5mbygiXHRlcHRwOiAldVxuIiwgZmVhdHVy
ZXMuZXB0cCk7CiB9CiAKIHN0YXRpYyB2b2lkIGNtZF92bV9jaGVja19jb21tYW5kKF9fdTE2IGlk
LCBfX3UxNiBwYWRkaW5nLCBpbnQgZXhwZWN0ZWRfZXJyKQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmly
dHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51
eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
