Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4E287F78
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 18:17:34 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B73C7E26;
	Fri,  9 Aug 2019 16:15:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp2.linuxfoundation.org (smtp2.linux-foundation.org
	[172.17.192.36])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7D1D2E41
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 16:15:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp2.linuxfoundation.org (Postfix) with ESMTPS id 7908D1DDC8
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 16:15:00 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	C6D4A3031EBB; Fri,  9 Aug 2019 19:01:24 +0300 (EEST)
Received: from localhost.localdomain (unknown [89.136.169.210])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id 3E940305B7A1;
	Fri,  9 Aug 2019 19:01:24 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v6 57/92] kvm: introspection: add KVMI_GET_XSAVE
Date: Fri,  9 Aug 2019 19:00:12 +0300
Message-Id: <20190809160047.8319-58-alazar@bitdefender.com>
In-Reply-To: <20190809160047.8319-1-alazar@bitdefender.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp2.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>, Yu C <yu.c.zhang@intel.com>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	=?UTF-8?q?Samuel=20Laur=C3=A9n?= <samuel.lauren@iki.fi>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	virtualization@lists.linux-foundation.org,
	=?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
	linux-mm@kvack.org, Patrick Colp <patrick.colp@oracle.com>,
	Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Zhang@mail.linuxfoundation.org,
	=?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyB2Q1BVIGNv
bW1hbmQgaXMgdXNlZCB0byBnZXQgdGhlIFhTQVZFIGFyZWEuCgpTaWduZWQtb2ZmLWJ5OiBNaWhh
aSBEb27Im3UgPG1kb250dUBiaXRkZWZlbmRlci5jb20+ClNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0
IExhesSDciA8YWxhemFyQGJpdGRlZmVuZGVyLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL3ZpcnR1
YWwva3ZtL2t2bWkucnN0IHwgMzEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBhcmNo
L3g4Ni9pbmNsdWRlL3VhcGkvYXNtL2t2bWkuaCAgIHwgIDQgKysrKwogYXJjaC94ODYva3ZtL2t2
bWkuYyAgICAgICAgICAgICAgICB8IDIxICsrKysrKysrKysrKysrKysrKysrCiBhcmNoL3g4Ni9r
dm0veDg2LmMgICAgICAgICAgICAgICAgIHwgIDQgKystLQogaW5jbHVkZS9saW51eC9rdm1faG9z
dC5oICAgICAgICAgICB8ICAyICsrCiB2aXJ0L2t2bS9rdm1pX2ludC5oICAgICAgICAgICAgICAg
IHwgIDMgKysrCiB2aXJ0L2t2bS9rdm1pX21zZy5jICAgICAgICAgICAgICAgIHwgMTcgKysrKysr
KysrKysrKysrKwogNyBmaWxlcyBjaGFuZ2VkLCA4MCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdmlydHVhbC9rdm0va3ZtaS5yc3QgYi9E
b2N1bWVudGF0aW9uL3ZpcnR1YWwva3ZtL2t2bWkucnN0CmluZGV4IGM0MWMzZWRiMDEzNC4uYzQz
ZWExYjMzYTUxIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL3ZpcnR1YWwva3ZtL2t2bWkucnN0
CisrKyBiL0RvY3VtZW50YXRpb24vdmlydHVhbC9rdm0va3ZtaS5yc3QKQEAgLTEwODEsNiArMTA4
MSwzNyBAQCB0byBjb250cm9sIGV2ZW50cyBmb3IgYW55IG90aGVyIHJlZ2lzdGVyIHdpbGwgZmFp
bCB3aXRoIC1LVk1fRUlOVkFMOjoKICogLUtWTV9FSU5WQUwgLSBwYWRkaW5nIGlzIG5vdCB6ZXJv
CiAqIC1LVk1fRUFHQUlOIC0gdGhlIHNlbGVjdGVkIHZDUFUgY2FuJ3QgYmUgaW50cm9zcGVjdGVk
IHlldAogCisyMy4gS1ZNSV9HRVRfWFNBVkUKKy0tLS0tLS0tLS0tLS0tLS0tLQorCis6QXJjaGl0
ZWN0dXJlOiB4ODYKKzpWZXJzaW9uczogPj0gMQorOlBhcmFtZXRlcnM6CisKKzo6CisKKwlzdHJ1
Y3Qga3ZtaV92Y3B1X2hkcjsKKworOlJldHVybnM6CisKKzo6CisKKwlzdHJ1Y3Qga3ZtaV9lcnJv
cl9jb2RlOworCXN0cnVjdCBrdm1pX2dldF94c2F2ZV9yZXBseSB7CisJCV9fdTMyIHJlZ2lvblsw
XTsKKwl9OworCitSZXR1cm5zIGEgYnVmZmVyIGNvbnRhaW5pbmcgdGhlIFhTQVZFIGFyZWEuIEN1
cnJlbnRseSwgdGhlIHNpemUgb2YKK2Bga3ZtX3hzYXZlYGAgaXMgdXNlZCwgYnV0IGl0IGNvdWxk
IGNoYW5nZS4gVGhlIHVzZXJzcGFjZSBzaG91bGQgZ2V0Cit0aGUgYnVmZmVyIHNpemUgZnJvbSB0
aGUgbWVzc2FnZSBzaXplLgorCis6RXJyb3JzOgorCisqIC1LVk1fRUlOVkFMIC0gdGhlIHNlbGVj
dGVkIHZDUFUgaXMgaW52YWxpZAorKiAtS1ZNX0VJTlZBTCAtIHBhZGRpbmcgaXMgbm90IHplcm8K
KyogLUtWTV9FQUdBSU4gLSB0aGUgc2VsZWN0ZWQgdkNQVSBjYW4ndCBiZSBpbnRyb3NwZWN0ZWQg
eWV0CisqIC1LVk1fRU5PTUVNIC0gbm90IGVub3VnaCBtZW1vcnkgdG8gYWxsb2NhdGUgdGhlIHJl
cGx5CisKIEV2ZW50cwogPT09PT09CiAKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvdWFw
aS9hc20va3ZtaS5oIGIvYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9rdm1pLmgKaW5kZXggMDhh
ZjJlY2NiZGZiLi5hM2ZjYjFlZjg0MDQgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2luY2x1ZGUvdWFw
aS9hc20va3ZtaS5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvdWFwaS9hc20va3ZtaS5oCkBAIC05
Nyw0ICs5Nyw4IEBAIHN0cnVjdCBrdm1pX2V2ZW50X21zcl9yZXBseSB7CiAJX191NjQgbmV3X3Zh
bDsKIH07CiAKK3N0cnVjdCBrdm1pX2dldF94c2F2ZV9yZXBseSB7CisJX191MzIgcmVnaW9uWzBd
OworfTsKKwogI2VuZGlmIC8qIF9VQVBJX0FTTV9YODZfS1ZNSV9IICovCmRpZmYgLS1naXQgYS9h
cmNoL3g4Ni9rdm0va3ZtaS5jIGIvYXJjaC94ODYva3ZtL2t2bWkuYwppbmRleCBmYzY5NTZiNTBk
YTIuLjA3OGQ3MTRiNTlkNSAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL2t2bWkuYworKysgYi9h
cmNoL3g4Ni9rdm0va3ZtaS5jCkBAIC03OTAsMyArNzkwLDI0IEBAIGludCBrdm1pX2FyY2hfY21k
X2NvbnRyb2xfc3BwKHN0cnVjdCBrdm1pICppa3ZtKQogewogCXJldHVybiBrdm1fYXJjaF9pbml0
X3NwcChpa3ZtLT5rdm0pOwogfQorCitpbnQga3ZtaV9hcmNoX2NtZF9nZXRfeHNhdmUoc3RydWN0
IGt2bV92Y3B1ICp2Y3B1LAorCQkJICAgIHN0cnVjdCBrdm1pX2dldF94c2F2ZV9yZXBseSAqKmRl
c3QsCisJCQkgICAgc2l6ZV90ICpkZXN0X3NpemUpCit7CisJc3RydWN0IGt2bWlfZ2V0X3hzYXZl
X3JlcGx5ICpycGwgPSBOVUxMOworCXNpemVfdCBycGxfc2l6ZSA9IHNpemVvZigqcnBsKSArIHNp
emVvZihzdHJ1Y3Qga3ZtX3hzYXZlKTsKKwlzdHJ1Y3Qga3ZtX3hzYXZlICphcmVhOworCisJcnBs
ID0ga3ZtaV9tc2dfYWxsb2NfY2hlY2socnBsX3NpemUpOworCWlmICghcnBsKQorCQlyZXR1cm4g
LUtWTV9FTk9NRU07CisKKwlhcmVhID0gKHN0cnVjdCBrdm1feHNhdmUgKikgJnJwbC0+cmVnaW9u
WzBdOworCWt2bV92Y3B1X2lvY3RsX3g4Nl9nZXRfeHNhdmUodmNwdSwgYXJlYSk7CisKKwkqZGVz
dCA9IHJwbDsKKwkqZGVzdF9zaXplID0gcnBsX3NpemU7CisKKwlyZXR1cm4gMDsKK30KZGlmZiAt
LWdpdCBhL2FyY2gveDg2L2t2bS94ODYuYyBiL2FyY2gveDg2L2t2bS94ODYuYwppbmRleCBhYzAy
NzQ3MWM0ZjMuLjA1ZmYyMzE4MDM1NSAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL3g4Ni5jCisr
KyBiL2FyY2gveDg2L2t2bS94ODYuYwpAQCAtMzc0NSw4ICszNzQ1LDggQEAgc3RhdGljIHZvaWQg
bG9hZF94c2F2ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHU4ICpzcmMpCiAJfQogfQogCi1zdGF0
aWMgdm9pZCBrdm1fdmNwdV9pb2N0bF94ODZfZ2V0X3hzYXZlKHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSwKLQkJCQkJIHN0cnVjdCBrdm1feHNhdmUgKmd1ZXN0X3hzYXZlKQordm9pZCBrdm1fdmNwdV9p
b2N0bF94ODZfZ2V0X3hzYXZlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKKwkJCQkgIHN0cnVjdCBr
dm1feHNhdmUgKmd1ZXN0X3hzYXZlKQogewogCWlmIChib290X2NwdV9oYXMoWDg2X0ZFQVRVUkVf
WFNBVkUpKSB7CiAJCW1lbXNldChndWVzdF94c2F2ZSwgMCwgc2l6ZW9mKHN0cnVjdCBrdm1feHNh
dmUpKTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaCBiL2luY2x1ZGUvbGlu
dXgva3ZtX2hvc3QuaAppbmRleCBjOGViMWE0ZDk5N2YuLjNhYWQzYjk2MTA3YiAxMDA2NDQKLS0t
IGEvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oCisrKyBiL2luY2x1ZGUvbGludXgva3ZtX2hvc3Qu
aApAQCAtODA1LDYgKzgwNSw4IEBAIGludCBrdm1fYXJjaF92Y3B1X2lvY3RsX3NldF9tcHN0YXRl
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKIGludCBrdm1fYXJjaF92Y3B1X2lvY3RsX3NldF9ndWVz
dF9kZWJ1ZyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJCQkJCXN0cnVjdCBrdm1fZ3Vlc3RfZGVi
dWcgKmRiZyk7CiBpbnQga3ZtX2FyY2hfdmNwdV9pb2N0bF9ydW4oc3RydWN0IGt2bV92Y3B1ICp2
Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqa3ZtX3J1bik7Cit2b2lkIGt2bV92Y3B1X2lvY3RsX3g4Nl9n
ZXRfeHNhdmUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAorCQkJCSAgc3RydWN0IGt2bV94c2F2ZSAq
Z3Vlc3RfeHNhdmUpOwogCiBpbnQga3ZtX2FyY2hfaW5pdCh2b2lkICpvcGFxdWUpOwogdm9pZCBr
dm1fYXJjaF9leGl0KHZvaWQpOwpkaWZmIC0tZ2l0IGEvdmlydC9rdm0va3ZtaV9pbnQuaCBiL3Zp
cnQva3ZtL2t2bWlfaW50LmgKaW5kZXggNjQwYTc4YjU0OTQ3Li4xYTcwNWNiYTQ3NzYgMTAwNjQ0
Ci0tLSBhL3ZpcnQva3ZtL2t2bWlfaW50LmgKKysrIGIvdmlydC9rdm0va3ZtaV9pbnQuaApAQCAt
MjU1LDYgKzI1NSw5IEBAIHZvaWQga3ZtaV9hcmNoX3RyYXBfZXZlbnQoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1KTsKIGludCBrdm1pX2FyY2hfY21kX2dldF9jcHVpZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsCiAJCQkgICAgY29uc3Qgc3RydWN0IGt2bWlfZ2V0X2NwdWlkICpyZXEsCiAJCQkgICAgc3Ry
dWN0IGt2bWlfZ2V0X2NwdWlkX3JlcGx5ICpycGwpOworaW50IGt2bWlfYXJjaF9jbWRfZ2V0X3hz
YXZlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKKwkJCSAgICBzdHJ1Y3Qga3ZtaV9nZXRfeHNhdmVf
cmVwbHkgKipkZXN0LAorCQkJICAgIHNpemVfdCAqZGVzdF9zaXplKTsKIGludCBrdm1pX2FyY2hf
Y21kX2dldF92Y3B1X2luZm8oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCQkJCXN0cnVjdCBrdm1p
X2dldF92Y3B1X2luZm9fcmVwbHkgKnJwbCk7CiBpbnQga3ZtaV9hcmNoX2NtZF9pbmplY3RfZXhj
ZXB0aW9uKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdTggdmVjdG9yLApkaWZmIC0tZ2l0IGEvdmly
dC9rdm0va3ZtaV9tc2cuYyBiL3ZpcnQva3ZtL2t2bWlfbXNnLmMKaW5kZXggOGE4OTUxZjEzZjhl
Li42YmMxOGI3OTczY2YgMTAwNjQ0Ci0tLSBhL3ZpcnQva3ZtL2t2bWlfbXNnLmMKKysrIGIvdmly
dC9rdm0va3ZtaV9tc2cuYwpAQCAtMzgsNiArMzgsNyBAQCBzdGF0aWMgY29uc3QgY2hhciAqY29u
c3QgbXNnX0lEc1tdID0gewogCVtLVk1JX0dFVF9SRUdJU1RFUlNdICAgICAgICAgPSAiS1ZNSV9H
RVRfUkVHSVNURVJTIiwKIAlbS1ZNSV9HRVRfVkNQVV9JTkZPXSAgICAgICAgID0gIktWTUlfR0VU
X1ZDUFVfSU5GTyIsCiAJW0tWTUlfR0VUX1ZFUlNJT05dICAgICAgICAgICA9ICJLVk1JX0dFVF9W
RVJTSU9OIiwKKwlbS1ZNSV9HRVRfWFNBVkVdICAgICAgICAgICAgID0gIktWTUlfR0VUX1hTQVZF
IiwKIAlbS1ZNSV9JTkpFQ1RfRVhDRVBUSU9OXSAgICAgID0gIktWTUlfSU5KRUNUX0VYQ0VQVElP
TiIsCiAJW0tWTUlfUEFVU0VfVkNQVV0gICAgICAgICAgICA9ICJLVk1JX1BBVVNFX1ZDUFUiLAog
CVtLVk1JX1JFQURfUEhZU0lDQUxdICAgICAgICAgPSAiS1ZNSV9SRUFEX1BIWVNJQ0FMIiwKQEAg
LTcwMCw2ICs3MDEsMjEgQEAgc3RhdGljIGludCBoYW5kbGVfZ2V0X2NwdWlkKHN0cnVjdCBrdm1f
dmNwdSAqdmNwdSwKIAlyZXR1cm4gcmVwbHlfY2IodmNwdSwgbXNnLCBlYywgJnJwbCwgc2l6ZW9m
KHJwbCkpOwogfQogCitzdGF0aWMgaW50IGhhbmRsZV9nZXRfeHNhdmUoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LAorCQkJICAgIGNvbnN0IHN0cnVjdCBrdm1pX21zZ19oZHIgKm1zZywgY29uc3Qgdm9p
ZCAqcmVxLAorCQkJICAgIHZjcHVfcmVwbHlfZmN0IHJlcGx5X2NiKQoreworCXN0cnVjdCBrdm1p
X2dldF94c2F2ZV9yZXBseSAqcnBsID0gTlVMTDsKKwlzaXplX3QgcnBsX3NpemUgPSAwOworCWlu
dCBlcnIsIGVjOworCisJZWMgPSBrdm1pX2FyY2hfY21kX2dldF94c2F2ZSh2Y3B1LCAmcnBsLCAm
cnBsX3NpemUpOworCisJZXJyID0gcmVwbHlfY2IodmNwdSwgbXNnLCBlYywgcnBsLCBycGxfc2l6
ZSk7CisJa3ZtaV9tc2dfZnJlZShycGwpOworCXJldHVybiBlcnI7Cit9CisKIC8qCiAgKiBUaGVz
ZSBjb21tYW5kcyBhcmUgZXhlY3V0ZWQgb24gdGhlIHZDUFUgdGhyZWFkLiBUaGUgcmVjZWl2aW5n
IHRocmVhZAogICogcGFzc2VzIHRoZSBtZXNzYWdlcyB1c2luZyBhIG5ld2x5IGFsbG9jYXRlZCAn
c3RydWN0IGt2bWlfdmNwdV9jbWQnCkBAIC03MTYsNiArNzMyLDcgQEAgc3RhdGljIGludCgqY29u
c3QgbXNnX3ZjcHVbXSkoc3RydWN0IGt2bV92Y3B1ICosCiAJW0tWTUlfR0VUX0NQVUlEXSAgICAg
ICAgPSBoYW5kbGVfZ2V0X2NwdWlkLAogCVtLVk1JX0dFVF9SRUdJU1RFUlNdICAgID0gaGFuZGxl
X2dldF9yZWdpc3RlcnMsCiAJW0tWTUlfR0VUX1ZDUFVfSU5GT10gICAgPSBoYW5kbGVfZ2V0X3Zj
cHVfaW5mbywKKwlbS1ZNSV9HRVRfWFNBVkVdICAgICAgICA9IGhhbmRsZV9nZXRfeHNhdmUsCiAJ
W0tWTUlfSU5KRUNUX0VYQ0VQVElPTl0gPSBoYW5kbGVfaW5qZWN0X2V4Y2VwdGlvbiwKIAlbS1ZN
SV9TRVRfUkVHSVNURVJTXSAgICA9IGhhbmRsZV9zZXRfcmVnaXN0ZXJzLAogfTsKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFp
bGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBz
Oi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0
aW9u
