Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 141BD229C9E
	for <lists.virtualization@lfdr.de>; Wed, 22 Jul 2020 18:02:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B551B88169;
	Wed, 22 Jul 2020 16:02:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5GSG7cW3lcIA; Wed, 22 Jul 2020 16:02:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8AE1D88206;
	Wed, 22 Jul 2020 16:02:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F230C013C;
	Wed, 22 Jul 2020 16:02:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9ACF0C004C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8C9BF21514
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i1e4Lm8N-yxS
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by silver.osuosl.org (Postfix) with ESMTPS id A26F4204D6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:38 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 4366C305D679; Wed, 22 Jul 2020 19:01:33 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.6])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 3371C305FFA2;
 Wed, 22 Jul 2020 19:01:33 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v1 32/34] KVM: introspection: add
 KVMI_VCPU_SET_VE_INFO/KVMI_VCPU_DISABLE_VE
Date: Wed, 22 Jul 2020 19:01:19 +0300
Message-Id: <20200722160121.9601-33-alazar@bitdefender.com>
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
dHJvc3BlY3Rpb24gdG9vbCBjYW4gdXNlICNWRSB0byByZWR1Y2UgdGhlIG51bWJlciBvZiBWTS1l
eGl0cwpjYXVzZWQgYnkgU1BUIHZpb2xhdGlvbnMgZm9yIHNvbWUgZ3Vlc3RzLgoKU2lnbmVkLW9m
Zi1ieTogyJh0ZWZhbiDImGljbGVydSA8c3NpY2xlcnVAYml0ZGVmZW5kZXIuY29tPgpTaWduZWQt
b2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+Ci0tLQogRG9j
dW1lbnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJzdCAgICAgICAgICAgICAgIHwgNjMgKysrKysrKysr
KysrKysrKysrKwogYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9rdm1pLmggICAgICAgICAgICAg
IHwgIDggKysrCiBhcmNoL3g4Ni9rdm0va3ZtaS5jICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAxOSArKysrKysKIGluY2x1ZGUvdWFwaS9saW51eC9rdm1pLmggICAgICAgICAgICAgICAgICAg
ICB8ICAyICsKIC4uLi90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0veDg2XzY0L2t2bWlfdGVzdC5jICB8
IDUyICsrKysrKysrKysrKysrKwogdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX2ludC5oICAg
ICAgICAgICAgIHwgIDMgKwogdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX21zZy5jICAgICAg
ICAgICAgIHwgMzAgKysrKysrKysrCiA3IGZpbGVzIGNoYW5nZWQsIDE3NyBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJzdCBiL0RvY3VtZW50
YXRpb24vdmlydC9rdm0va3ZtaS5yc3QKaW5kZXggY2FhNTFmY2NjNDYzLi5jNTBjNDA2MzhkNDYg
MTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vdmlydC9rdm0va3ZtaS5yc3QKKysrIGIvRG9jdW1l
bnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJzdApAQCAtMTIzMCw2ICsxMjMwLDY5IEBAIGlzIHRlcm1p
bmF0ZWQuCiAqIC1LVk1fRUlOVkFMIC0gcGFkZGluZyBpcyBub3QgemVybwogKiAtS1ZNX0VJTlZB
TCAtIHRoZSBzZWxlY3RlZCBFUFQgdmlldyBpcyBub3QgdmFsaWQKIAorMjkuIEtWTUlfVkNQVV9T
RVRfVkVfSU5GTworLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorCis6QXJjaGl0ZWN0dXJlOiB4
ODYKKzpWZXJzaW9uczogPj0gMQorOlBhcmFtZXRlcnM6CisKKzo6CisKKwlzdHJ1Y3Qga3ZtaV92
Y3B1X2hkcjsKKwlzdHJ1Y3Qga3ZtaV92Y3B1X3NldF92ZV9pbmZvIHsKKwkJX191NjQgZ3BhOwor
CQlfX3U4IHRyaWdnZXJfdm1leGl0OworCQlfX3U4IHBhZGRpbmcxOworCQlfX3UxNiBwYWRkaW5n
MjsKKwkJX191MzIgcGFkZGluZzM7CisJfTsKKworOlJldHVybnM6CisKKzo6CisKKwlzdHJ1Y3Qg
a3ZtaV9lcnJvcl9jb2RlOworCitDb25maWd1cmVzIHRoZSBndWVzdCBwaHlzaWNhbCBhZGRyZXNz
IGZvciB0aGUgI1ZFIGluZm8gcGFnZSBhbmQgZW5hYmxlcwordGhlICNWRSBtZWNoYW5pc20uIElm
IGBgdHJpZ2dlcl92bWV4aXRgYCBpcyB0cnVlLCBhbnkgdmlydHVhbGl6YXRpb24KK2V4Y2VwdGlv
biB3aWxsIHRyaWdnZXIgYSB2bS1leGl0LiBPdGhlcndpc2UsIHRoZSBleGNlcHRpb24gaXMgZGVs
aXZlcmVkCit1c2luZyBnYXRlIGRlc2NyaXB0b3IgMjAgZnJvbSB0aGUgSW50ZXJydXB0IERlc2Ny
aXB0b3IgVGFibGUgKElEVCkuCisKKzpFcnJvcnM6CisKKyogLUtWTV9FSU5WQUwgLSB0aGUgc2Vs
ZWN0ZWQgdkNQVSBpcyBpbnZhbGlkCisqIC1LVk1fRUlOVkFMIC0gb25lIG9mIHRoZSBzcGVjaWZp
ZWQgR1BBcyBpcyBpbnZhbGlkCisqIC1LVk1fRU9QTk9UU1VQUCAtIHRoZSBoYXJkd2FyZSBkb2Vz
IG5vdCBzdXBwb3J0ICNWRQorKiAtS1ZNX0VJTlZBTCAtIHBhZGRpbmcgaXMgbm90IHplcm8KKyog
LUtWTV9FQUdBSU4gLSB0aGUgc2VsZWN0ZWQgdkNQVSBjYW4ndCBiZSBpbnRyb3NwZWN0ZWQgeWV0
CisKKzMwLiBLVk1JX1ZDUFVfRElTQUJMRV9WRQorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisK
KzpBcmNoaXRlY3R1cmU6IHg4NgorOlZlcnNpb25zOiA+PSAxCis6UGFyYW1ldGVyczoKKworOjoK
KworCXN0cnVjdCBrdm1pX3ZjcHVfaGRyOworCis6UmV0dXJuczoKKworOjoKKworCXN0cnVjdCBr
dm1pX2Vycm9yX2NvZGU7CisKK0Rpc2FibGVzIHRoZSAjVkUgbWVjaGFuaXNtLiBBbGwgRVBUIHZp
b2xhdGlvbnMgd2lsbCB0cmlnZ2VyIGEgdm0tZXhpdCwKK3JlZ2FyZGxlc3Mgb2YgdGhlIGNvcnJl
c3BvbmRpbmcgc3B0ZSA2M3JkIGJpdCAoU1ZFKSBmb3IgdGhlIEdQQSB0aGF0Cit0cmlnZ2VyZWQg
dGhlIEVQVCB2aW9sYXRpb24gd2l0aGluIGEgc3BlY2lmaWMgRVBUIHZpZXcuCisKKzpFcnJvcnM6
CisKKyogLUtWTV9FSU5WQUwgLSB0aGUgc2VsZWN0ZWQgdkNQVSBpcyBpbnZhbGlkCisqIC1LVk1f
RUFHQUlOIC0gdGhlIHNlbGVjdGVkIHZDUFUgY2FuJ3QgYmUgaW50cm9zcGVjdGVkIHlldAorCiBF
dmVudHMKID09PT09PQogCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL2t2
bWkuaCBiL2FyY2gveDg2L2luY2x1ZGUvdWFwaS9hc20va3ZtaS5oCmluZGV4IDU2OTkyZGFjZmI2
OS4uZDkyNWU2ZDQ5ZjUwIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL2t2
bWkuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL2t2bWkuaApAQCAtMTc0LDQgKzE3
NCwxMiBAQCBzdHJ1Y3Qga3ZtaV92Y3B1X2NvbnRyb2xfZXB0X3ZpZXcgewogCV9fdTMyIHBhZGRp
bmcyOwogfTsKIAorc3RydWN0IGt2bWlfdmNwdV9zZXRfdmVfaW5mbyB7CisJX191NjQgZ3BhOwor
CV9fdTggdHJpZ2dlcl92bWV4aXQ7CisJX191OCBwYWRkaW5nMTsKKwlfX3UxNiBwYWRkaW5nMjsK
KwlfX3UzMiBwYWRkaW5nMzsKK307CisKICNlbmRpZiAvKiBfVUFQSV9BU01fWDg2X0tWTUlfSCAq
LwpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL2t2bWkuYyBiL2FyY2gveDg2L2t2bS9rdm1pLmMK
aW5kZXggM2U4YzgzNjIzNzAzLi5lMTAxYWMzOTA4MDkgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2
bS9rdm1pLmMKKysrIGIvYXJjaC94ODYva3ZtL2t2bWkuYwpAQCAtMTQ2NCwzICsxNDY0LDIyIEBA
IGludCBrdm1pX2FyY2hfY21kX2NvbnRyb2xfZXB0X3ZpZXcoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
LCB1MTYgdmlldywKIAogCXJldHVybiBrdm1feDg2X29wcy5jb250cm9sX2VwdF92aWV3KHZjcHUs
IHZpZXcsIHZpc2libGUpOwogfQorCitpbnQga3ZtaV9hcmNoX2NtZF9zZXRfdmVfaW5mbyhzdHJ1
Y3Qga3ZtX3ZjcHUgKnZjcHUsIHU2NCBncGEsCisJCQkgICAgICBib29sIHRyaWdnZXJfdm1leGl0
KQoreworCXVuc2lnbmVkIGxvbmcgdmVfaW5mbyA9ICh1bnNpZ25lZCBsb25nKSBncGE7CisKKwlp
ZiAoIWt2bV94ODZfb3BzLnNldF92ZV9pbmZvKQorCQlyZXR1cm4gLUtWTV9FSU5WQUw7CisKKwly
ZXR1cm4ga3ZtX3g4Nl9vcHMuc2V0X3ZlX2luZm8odmNwdSwgdmVfaW5mbywgdHJpZ2dlcl92bWV4
aXQpOworfQorCitpbnQga3ZtaV9hcmNoX2NtZF9kaXNhYmxlX3ZlKHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSkKK3sKKwlpZiAoIWt2bV94ODZfb3BzLmRpc2FibGVfdmUpCisJCXJldHVybiAwOworCisJ
cmV0dXJuIGt2bV94ODZfb3BzLmRpc2FibGVfdmUodmNwdSk7Cit9CmRpZmYgLS1naXQgYS9pbmNs
dWRlL3VhcGkvbGludXgva3ZtaS5oIGIvaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaAppbmRleCA1
MDVhODY1Y2QxMTUuLmExN2NkMWZhMTZkMCAxMDA2NDQKLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4
L2t2bWkuaAorKysgYi9pbmNsdWRlL3VhcGkvbGludXgva3ZtaS5oCkBAIC01Miw2ICs1Miw4IEBA
IGVudW0gewogCUtWTUlfVkNQVV9HRVRfRVBUX1ZJRVcgICAgICAgPSAyNiwKIAlLVk1JX1ZDUFVf
U0VUX0VQVF9WSUVXICAgICAgID0gMjcsCiAJS1ZNSV9WQ1BVX0NPTlRST0xfRVBUX1ZJRVcgICA9
IDI4LAorCUtWTUlfVkNQVV9TRVRfVkVfSU5GTyAgICAgICAgPSAyOSwKKwlLVk1JX1ZDUFVfRElT
QUJMRV9WRSAgICAgICAgID0gMzAsCiAKIAlLVk1JX05VTV9NRVNTQUdFUwogfTsKZGlmZiAtLWdp
dCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS94ODZfNjQva3ZtaV90ZXN0LmMgYi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0veDg2XzY0L2t2bWlfdGVzdC5jCmluZGV4IDRlMDk5Y2Jm
Y2Y0ZS4uYTNlYTIyZjU0NmVjIDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9r
dm0veDg2XzY0L2t2bWlfdGVzdC5jCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS94
ODZfNjQva3ZtaV90ZXN0LmMKQEAgLTM1LDYgKzM1LDEwIEBAIHN0YXRpYyB2bV92YWRkcl90IHRl
c3RfZ3ZhOwogc3RhdGljIHZvaWQgKnRlc3RfaHZhOwogc3RhdGljIHZtX3BhZGRyX3QgdGVzdF9n
cGE7CiAKK3N0YXRpYyB2bV92YWRkcl90IHRlc3RfdmVfaW5mb19ndmE7CitzdGF0aWMgdm9pZCAq
dGVzdF92ZV9pbmZvX2h2YTsKK3N0YXRpYyB2bV9wYWRkcl90IHRlc3RfdmVfaW5mb19ncGE7CisK
IHN0YXRpYyB1aW50OF90IHRlc3Rfd3JpdGVfcGF0dGVybjsKIHN0YXRpYyBpbnQgcGFnZV9zaXpl
OwogCkBAIC0yMjU4LDYgKzIyNjIsNDMgQEAgc3RhdGljIHZvaWQgdGVzdF9jbWRfdmNwdV92bWZ1
bmMoc3RydWN0IGt2bV92bSAqdm0pCiAJdGVzdF9ndWVzdF9zd2l0Y2hfdG9fdmlzaWJsZV92aWV3
KHZtKTsKIH0KIAorc3RhdGljIHZvaWQgZW5hYmxlX3ZlKHN0cnVjdCBrdm1fdm0gKnZtKQorewor
CXN0cnVjdCB7CisJCXN0cnVjdCBrdm1pX21zZ19oZHIgaGRyOworCQlzdHJ1Y3Qga3ZtaV92Y3B1
X2hkciB2Y3B1X2hkcjsKKwkJc3RydWN0IGt2bWlfdmNwdV9zZXRfdmVfaW5mbyBjbWQ7CisJfSBy
ZXEgPSB7fTsKKworCXJlcS5jbWQuZ3BhID0gdGVzdF92ZV9pbmZvX2dwYTsKKwlyZXEuY21kLnRy
aWdnZXJfdm1leGl0ID0gMTsKKworCXRlc3RfdmNwdTBfY29tbWFuZCh2bSwgS1ZNSV9WQ1BVX1NF
VF9WRV9JTkZPLCAmcmVxLmhkciwKKwkJCQlzaXplb2YocmVxKSwgTlVMTCwgMCk7Cit9CisKK3N0
YXRpYyB2b2lkIGRpc2FibGVfdmUoc3RydWN0IGt2bV92bSAqdm0pCit7CisJc3RydWN0IHsKKwkJ
c3RydWN0IGt2bWlfbXNnX2hkciBoZHI7CisJCXN0cnVjdCBrdm1pX3ZjcHVfaGRyIHZjcHVfaGRy
OworCX0gcmVxID0ge307CisKKwl0ZXN0X3ZjcHUwX2NvbW1hbmQodm0sIEtWTUlfVkNQVV9ESVNB
QkxFX1ZFLCAmcmVxLmhkciwKKwkJCQlzaXplb2YocmVxKSwgTlVMTCwgMCk7Cit9CisKK3N0YXRp
YyB2b2lkIHRlc3RfdmlydHVhbGl6YXRpb25fZXhjZXB0aW9ucyhzdHJ1Y3Qga3ZtX3ZtICp2bSkK
K3sKKwlpZiAoIWZlYXR1cmVzLnZlKSB7CisJCXByaW50X3NraXAoIiNWRSBub3Qgc3VwcG9ydGVk
Iik7CisJCXJldHVybjsKKwl9CisKKwllbmFibGVfdmUodm0pOworCWRpc2FibGVfdmUodm0pOwor
fQorCiBzdGF0aWMgdm9pZCB0ZXN0X2ludHJvc3BlY3Rpb24oc3RydWN0IGt2bV92bSAqdm0pCiB7
CiAJc3JhbmRvbSh0aW1lKDApKTsKQEAgLTIyOTcsNiArMjMzOCw3IEBAIHN0YXRpYyB2b2lkIHRl
c3RfaW50cm9zcGVjdGlvbihzdHJ1Y3Qga3ZtX3ZtICp2bSkKIAl0ZXN0X2NtZF92Y3B1X2dldF9l
cHRfdmlldyh2bSk7CiAJdGVzdF9jbWRfdmNwdV9zZXRfZXB0X3ZpZXcodm0pOwogCXRlc3RfY21k
X3ZjcHVfdm1mdW5jKHZtKTsKKwl0ZXN0X3ZpcnR1YWxpemF0aW9uX2V4Y2VwdGlvbnModm0pOwog
CiAJdW5ob29rX2ludHJvc3BlY3Rpb24odm0pOwogfQpAQCAtMjMxMSw2ICsyMzUzLDE2IEBAIHN0
YXRpYyB2b2lkIHNldHVwX3Rlc3RfcGFnZXMoc3RydWN0IGt2bV92bSAqdm0pCiAJbWVtc2V0KHRl
c3RfaHZhLCAwLCBwYWdlX3NpemUpOwogCiAJdGVzdF9ncGEgPSBhZGRyX2d2YTJncGEodm0sIHRl
c3RfZ3ZhKTsKKworCS8qIEFsbG9jYXRlICNWRSBpbmZvIHBhZ2UgKi8KKwl0ZXN0X3ZlX2luZm9f
Z3ZhID0gdm1fdmFkZHJfYWxsb2Modm0sIHBhZ2Vfc2l6ZSwgS1ZNX1VUSUxfTUlOX1ZBRERSLAor
CQkJCQkgIDAsIDApOworCXN5bmNfZ2xvYmFsX3RvX2d1ZXN0KHZtLCB0ZXN0X3ZlX2luZm9fZ3Zh
KTsKKworCXRlc3RfdmVfaW5mb19odmEgPSBhZGRyX2d2YTJodmEodm0sIHRlc3RfdmVfaW5mb19n
dmEpOworCW1lbXNldCh0ZXN0X3ZlX2luZm9faHZhLCAwLCBwYWdlX3NpemUpOworCisJdGVzdF92
ZV9pbmZvX2dwYSA9IGFkZHJfZ3ZhMmdwYSh2bSwgdGVzdF92ZV9pbmZvX2d2YSk7CiB9CiAKIGlu
dCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCmRpZmYgLS1naXQgYS92aXJ0L2t2bS9pbnRy
b3NwZWN0aW9uL2t2bWlfaW50LmggYi92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfaW50LmgK
aW5kZXggZmM2ZGJkM2E2NDcyLi5hMDA2MmZiZGU0OWUgMTAwNjQ0Ci0tLSBhL3ZpcnQva3ZtL2lu
dHJvc3BlY3Rpb24va3ZtaV9pbnQuaAorKysgYi92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlf
aW50LmgKQEAgLTE1MSw1ICsxNTEsOCBAQCB1MTYga3ZtaV9hcmNoX2NtZF9nZXRfZXB0X3ZpZXco
c3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIGludCBrdm1pX2FyY2hfY21kX3NldF9lcHRfdmlldyhz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHUxNiB2aWV3KTsKIGludCBrdm1pX2FyY2hfY21kX2NvbnRy
b2xfZXB0X3ZpZXcoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1MTYgdmlldywKIAkJCQkgICBib29s
IHZpc2libGUpOworaW50IGt2bWlfYXJjaF9jbWRfc2V0X3ZlX2luZm8oc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LCB1NjQgZ3BhLAorCQkJICAgICAgYm9vbCB0cmlnZ2VyX3ZtZXhpdCk7CitpbnQga3Zt
aV9hcmNoX2NtZF9kaXNhYmxlX3ZlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7CiAKICNlbmRpZgpk
aWZmIC0tZ2l0IGEvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX21zZy5jIGIvdmlydC9rdm0v
aW50cm9zcGVjdGlvbi9rdm1pX21zZy5jCmluZGV4IDY5Njg1N2Y2ZDAwOC4uNjY0Yjc4ZDU0NWMz
IDEwMDY0NAotLS0gYS92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfbXNnLmMKKysrIGIvdmly
dC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX21zZy5jCkBAIC03MTEsNiArNzExLDM0IEBAIHN0YXRp
YyBpbnQgaGFuZGxlX3ZjcHVfY29udHJvbF9lcHRfdmlldyhjb25zdCBzdHJ1Y3Qga3ZtaV92Y3B1
X21zZ19qb2IgKmpvYiwKIAlyZXR1cm4ga3ZtaV9tc2dfdmNwdV9yZXBseShqb2IsIG1zZywgZWMs
IE5VTEwsIDApOwogfQogCitzdGF0aWMgaW50IGhhbmRsZV92Y3B1X3NldF92ZV9pbmZvKGNvbnN0
IHN0cnVjdCBrdm1pX3ZjcHVfbXNnX2pvYiAqam9iLAorCQkJCSAgIGNvbnN0IHN0cnVjdCBrdm1p
X21zZ19oZHIgKm1zZywKKwkJCQkgICBjb25zdCB2b2lkICpfcmVxKQoreworCWNvbnN0IHN0cnVj
dCBrdm1pX3ZjcHVfc2V0X3ZlX2luZm8gKnJlcSA9IF9yZXE7CisJYm9vbCB0cmlnZ2VyX3ZtZXhp
dCA9ICEhcmVxLT50cmlnZ2VyX3ZtZXhpdDsKKwlpbnQgZWM7CisKKwlpZiAocmVxLT5wYWRkaW5n
MSB8fCByZXEtPnBhZGRpbmcyIHx8IHJlcS0+cGFkZGluZzMpCisJCWVjID0gLUtWTV9FSU5WQUw7
CisJZWxzZQorCQllYyA9IGt2bWlfYXJjaF9jbWRfc2V0X3ZlX2luZm8oam9iLT52Y3B1LCByZXEt
PmdwYSwKKwkJCQkJCXRyaWdnZXJfdm1leGl0KTsKKworCXJldHVybiBrdm1pX21zZ192Y3B1X3Jl
cGx5KGpvYiwgbXNnLCBlYywgTlVMTCwgMCk7Cit9CisKK3N0YXRpYyBpbnQgaGFuZGxlX3ZjcHVf
ZGlzYWJsZV92ZShjb25zdCBzdHJ1Y3Qga3ZtaV92Y3B1X21zZ19qb2IgKmpvYiwKKwkJCQkgIGNv
bnN0IHN0cnVjdCBrdm1pX21zZ19oZHIgKm1zZywKKwkJCQkgIGNvbnN0IHZvaWQgKnJlcSkKK3sK
KwlpbnQgZWM7CisKKwllYyA9IGt2bWlfYXJjaF9jbWRfZGlzYWJsZV92ZShqb2ItPnZjcHUpOwor
CisJcmV0dXJuIGt2bWlfbXNnX3ZjcHVfcmVwbHkoam9iLCBtc2csIGVjLCBOVUxMLCAwKTsKK30K
KwogLyoKICAqIFRoZXNlIGZ1bmN0aW9ucyBhcmUgZXhlY3V0ZWQgZnJvbSB0aGUgdkNQVSB0aHJl
YWQuIFRoZSByZWNlaXZpbmcgdGhyZWFkCiAgKiBwYXNzZXMgdGhlIG1lc3NhZ2VzIHVzaW5nIGEg
bmV3bHkgYWxsb2NhdGVkICdzdHJ1Y3Qga3ZtaV92Y3B1X21zZ19qb2InCkBAIC03MjUsNiArNzUz
LDcgQEAgc3RhdGljIGludCgqY29uc3QgbXNnX3ZjcHVbXSkoY29uc3Qgc3RydWN0IGt2bWlfdmNw
dV9tc2dfam9iICosCiAJW0tWTUlfVkNQVV9DT05UUk9MX0VWRU5UU10gICAgID0gaGFuZGxlX3Zj
cHVfY29udHJvbF9ldmVudHMsCiAJW0tWTUlfVkNQVV9DT05UUk9MX01TUl0gICAgICAgID0gaGFu
ZGxlX3ZjcHVfY29udHJvbF9tc3IsCiAJW0tWTUlfVkNQVV9DT05UUk9MX1NJTkdMRVNURVBdID0g
aGFuZGxlX3ZjcHVfY29udHJvbF9zaW5nbGVzdGVwLAorCVtLVk1JX1ZDUFVfRElTQUJMRV9WRV0g
ICAgICAgICA9IGhhbmRsZV92Y3B1X2Rpc2FibGVfdmUsCiAJW0tWTUlfVkNQVV9HRVRfQ1BVSURd
ICAgICAgICAgID0gaGFuZGxlX3ZjcHVfZ2V0X2NwdWlkLAogCVtLVk1JX1ZDUFVfR0VUX0VQVF9W
SUVXXSAgICAgICA9IGhhbmRsZV92Y3B1X2dldF9lcHRfdmlldywKIAlbS1ZNSV9WQ1BVX0dFVF9J
TkZPXSAgICAgICAgICAgPSBoYW5kbGVfdmNwdV9nZXRfaW5mbywKQEAgLTczNiw2ICs3NjUsNyBA
QCBzdGF0aWMgaW50KCpjb25zdCBtc2dfdmNwdVtdKShjb25zdCBzdHJ1Y3Qga3ZtaV92Y3B1X21z
Z19qb2IgKiwKIAlbS1ZNSV9WQ1BVX1NFVF9FUFRfVklFV10gICAgICAgPSBoYW5kbGVfdmNwdV9z
ZXRfZXB0X3ZpZXcsCiAJW0tWTUlfVkNQVV9TRVRfUkVHSVNURVJTXSAgICAgID0gaGFuZGxlX3Zj
cHVfc2V0X3JlZ2lzdGVycywKIAlbS1ZNSV9WQ1BVX1NFVF9YU0FWRV0gICAgICAgICAgPSBoYW5k
bGVfdmNwdV9zZXRfeHNhdmUsCisJW0tWTUlfVkNQVV9TRVRfVkVfSU5GT10gICAgICAgID0gaGFu
ZGxlX3ZjcHVfc2V0X3ZlX2luZm8sCiAJW0tWTUlfVkNQVV9UUkFOU0xBVEVfR1ZBXSAgICAgID0g
aGFuZGxlX3ZjcHVfdHJhbnNsYXRlX2d2YSwKIH07CiAKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1
YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhm
b3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
