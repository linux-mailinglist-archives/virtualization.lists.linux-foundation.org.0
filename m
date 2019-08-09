Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1456F87F34
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 18:15:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B7DD2E1A;
	Fri,  9 Aug 2019 16:14:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D30B4DA6
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 16:14:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0B76682D
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 16:14:55 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	E97213031EB8; Fri,  9 Aug 2019 19:01:13 +0300 (EEST)
Received: from localhost.localdomain (unknown [89.136.169.210])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id 8EE2C305B7A3;
	Fri,  9 Aug 2019 19:01:13 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v6 43/92] kvm: introspection: add KVMI_CONTROL_SPP
Date: Fri,  9 Aug 2019 18:59:58 +0300
Message-Id: <20190809160047.8319-44-alazar@bitdefender.com>
In-Reply-To: <20190809160047.8319-1-alazar@bitdefender.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
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

VGhpcyBjb21tYW5kIGVuYWJsZXMvZGlzYWJsZXMgc3VicGFnZSBwcm90ZWN0aW9uIChTUFApIGZv
ciB0aGUgY3VycmVudCBWTS4KClNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFy
QGJpdGRlZmVuZGVyLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL3ZpcnR1YWwva3ZtL2t2bWkucnN0
IHwgMzMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBhcmNoL3g4Ni9rdm0va3ZtaS5j
ICAgICAgICAgICAgICAgIHwgIDQgKysrKwogaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaCAgICAg
ICAgICB8ICA3ICsrKysrKysKIHZpcnQva3ZtL2t2bWlfaW50LmggICAgICAgICAgICAgICAgfCAg
NiArKysrKysKIHZpcnQva3ZtL2t2bWlfbXNnLmMgICAgICAgICAgICAgICAgfCAzMyArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysKIDUgZmlsZXMgY2hhbmdlZCwgODMgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdmlydHVhbC9rdm0va3ZtaS5yc3QgYi9Eb2N1
bWVudGF0aW9uL3ZpcnR1YWwva3ZtL2t2bWkucnN0CmluZGV4IGI2NGEwMzA1MDdjZi4uYzFkMTJh
YWE4NjMzIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL3ZpcnR1YWwva3ZtL2t2bWkucnN0Cisr
KyBiL0RvY3VtZW50YXRpb24vdmlydHVhbC9rdm0va3ZtaS5yc3QKQEAgLTYxNyw2ICs2MTcsMzkg
QEAgSW4gb3JkZXIgdG8gJ2ZvcmdldCcgYW4gYWRkcmVzcywgYWxsIHRoZSBhY2Nlc3MgYml0cyAo
J3J3eCcpIG11c3QgYmUgc2V0LgogKiAtS1ZNX0VBR0FJTiAtIHRoZSBzZWxlY3RlZCB2Q1BVIGNh
bid0IGJlIGludHJvc3BlY3RlZCB5ZXQKICogLUtWTV9FTk9NRU0gLSBub3QgZW5vdWdoIG1lbW9y
eSB0byBhZGQgdGhlIHBhZ2UgdHJhY2tpbmcgc3RydWN0dXJlcwogCisxMS4gS1ZNSV9DT05UUk9M
X1NQUAorLS0tLS0tLS0tLS0tLS0tLS0tLS0KKworOkFyY2hpdGVjdHVyZXM6IHg4Ni9pbnRlbAor
OlZlcnNpb25zOiA+PSAxCis6UGFyYW1ldGVyczoKKworOjoKKworCXN0cnVjdCBrdm1pX2NvbnRy
b2xfc3BwIHsKKwkJX191OCBlbmFibGU7CisJCV9fdTggcGFkZGluZzE7CisJCV9fdTE2IHBhZGRp
bmcyOworCQlfX3UzMiBwYWRkaW5nMzsKKwl9CisKKzpSZXR1cm5zOgorCis6OgorCisJc3RydWN0
IGt2bWlfZXJyb3JfY29kZTsKKworRW5hYmxlcy9kaXNhYmxlcyBzdWJwYWdlIHByb3RlY3Rpb24g
KFNQUCkgZm9yIHRoZSBjdXJyZW50IFZNLgorCitJZiBTUFAgaXMgbm90IGVuYWJsZWQsICpLVk1J
X0dFVF9QQUdFX1dSSVRFX0JJVE1BUCogYW5kCisqS1ZNSV9TRVRfUEFHRV9XUklURV9CSVRNQVAq
IGNvbW1hbmRzIHdpbGwgZmFpbC4KKworOkVycm9yczoKKworKiAtS1ZNX0VJTlZBTCAtIHBhZGRp
bmcgaXMgbm90IHplcm8KKyogLUtWTV9FT1BOT1RTVVBQIC0gdGhlIGhhcmR3YXJlIGRvZXNuJ3Qg
c3VwcG9ydCBTUFAKKyogLUtWTV9FT1BOT1RTVVBQIC0gdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRp
b24gY2FuJ3QgZGlzYWJsZSBTUFAKKwogRXZlbnRzCiA9PT09PT0KIApkaWZmIC0tZ2l0IGEvYXJj
aC94ODYva3ZtL2t2bWkuYyBiL2FyY2gveDg2L2t2bS9rdm1pLmMKaW5kZXggMzIzOGVmMTc2YWQ2
Li4wMWZkMjE4ZTIxM2MgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS9rdm1pLmMKKysrIGIvYXJj
aC94ODYva3ZtL2t2bWkuYwpAQCAtMjYwLDMgKzI2MCw3IEBAIGludCBrdm1pX2FyY2hfY21kX3Nl
dF9wYWdlX2FjY2VzcyhzdHJ1Y3Qga3ZtaSAqaWt2bSwKIAlyZXR1cm4gZWM7CiB9CiAKK2ludCBr
dm1pX2FyY2hfY21kX2NvbnRyb2xfc3BwKHN0cnVjdCBrdm1pICppa3ZtKQoreworCXJldHVybiBr
dm1fYXJjaF9pbml0X3NwcChpa3ZtLT5rdm0pOworfQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBp
L2xpbnV4L2t2bWkuaCBiL2luY2x1ZGUvdWFwaS9saW51eC9rdm1pLmgKaW5kZXggMmRkYmIxZmVh
ODA3Li45ZjJiMTM3MThlNDcgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC9rdm1pLmgK
KysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaApAQCAtMTQyLDYgKzE0MiwxMyBAQCBzdHJ1
Y3Qga3ZtaV9zZXRfcGFnZV9hY2Nlc3MgewogCXN0cnVjdCBrdm1pX3BhZ2VfYWNjZXNzX2VudHJ5
IGVudHJpZXNbMF07CiB9OwogCitzdHJ1Y3Qga3ZtaV9jb250cm9sX3NwcCB7CisJX191OCBlbmFi
bGU7CisJX191OCBwYWRkaW5nMTsKKwlfX3UxNiBwYWRkaW5nMjsKKwlfX3UzMiBwYWRkaW5nMzsK
K307CisKIHN0cnVjdCBrdm1pX2dldF92Y3B1X2luZm9fcmVwbHkgewogCV9fdTY0IHRzY19zcGVl
ZDsKIH07CmRpZmYgLS1naXQgYS92aXJ0L2t2bS9rdm1pX2ludC5oIGIvdmlydC9rdm0va3ZtaV9p
bnQuaAppbmRleCBjNTRiZTkzMzQ5YjcuLjNmMGM3YTAzYjRhMSAxMDA2NDQKLS0tIGEvdmlydC9r
dm0va3ZtaV9pbnQuaAorKysgYi92aXJ0L2t2bS9rdm1pX2ludC5oCkBAIC0xMzAsNiArMTMwLDEx
IEBAIHN0cnVjdCBrdm1pIHsKIAlERUNMQVJFX0JJVE1BUChldmVudF9hbGxvd19tYXNrLCBLVk1J
X05VTV9FVkVOVFMpOwogCURFQ0xBUkVfQklUTUFQKHZtX2V2X21hc2ssIEtWTUlfTlVNX0VWRU5U
Uyk7CiAKKwlzdHJ1Y3QgeworCQlib29sIGluaXRpYWxpemVkOworCQlhdG9taWNfdCBlbmFibGVk
OworCX0gc3BwOworCiAJYm9vbCBjbWRfcmVwbHlfZGlzYWJsZWQ7CiB9OwogCkBAIC0xODQsNiAr
MTg5LDcgQEAgaW50IGt2bWlfYXJjaF9jbWRfZ2V0X3BhZ2VfYWNjZXNzKHN0cnVjdCBrdm1pICpp
a3ZtLAogaW50IGt2bWlfYXJjaF9jbWRfc2V0X3BhZ2VfYWNjZXNzKHN0cnVjdCBrdm1pICppa3Zt
LAogCQkJCSAgY29uc3Qgc3RydWN0IGt2bWlfbXNnX2hkciAqbXNnLAogCQkJCSAgY29uc3Qgc3Ry
dWN0IGt2bWlfc2V0X3BhZ2VfYWNjZXNzICpyZXEpOworaW50IGt2bWlfYXJjaF9jbWRfY29udHJv
bF9zcHAoc3RydWN0IGt2bWkgKmlrdm0pOwogdm9pZCBrdm1pX2FyY2hfc2V0dXBfZXZlbnQoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtaV9ldmVudCAqZXYpOwogYm9vbCBrdm1pX2Fy
Y2hfcGZfZXZlbnQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBncGFfdCBncGEsIGd2YV90IGd2YSwK
IAkJCXU4IGFjY2Vzcyk7CmRpZmYgLS1naXQgYS92aXJ0L2t2bS9rdm1pX21zZy5jIGIvdmlydC9r
dm0va3ZtaV9tc2cuYwppbmRleCBjMTUwZTdiZGQ0NDAuLmU1MDFhODA3YzhhMiAxMDA2NDQKLS0t
IGEvdmlydC9rdm0va3ZtaV9tc2cuYworKysgYi92aXJ0L2t2bS9rdm1pX21zZy5jCkBAIC0yNSw2
ICsyNSw3IEBAIHN0YXRpYyBjb25zdCBjaGFyICpjb25zdCBtc2dfSURzW10gPSB7CiAJW0tWTUlf
Q0hFQ0tfRVZFTlRdICAgICAgICAgICA9ICJLVk1JX0NIRUNLX0VWRU5UIiwKIAlbS1ZNSV9DT05U
Uk9MX0NNRF9SRVNQT05TRV0gID0gIktWTUlfQ09OVFJPTF9DTURfUkVTUE9OU0UiLAogCVtLVk1J
X0NPTlRST0xfRVZFTlRTXSAgICAgICAgPSAiS1ZNSV9DT05UUk9MX0VWRU5UUyIsCisJW0tWTUlf
Q09OVFJPTF9TUFBdICAgICAgICAgICA9ICJLVk1JX0NPTlRST0xfU1BQIiwKIAlbS1ZNSV9DT05U
Uk9MX1ZNX0VWRU5UU10gICAgID0gIktWTUlfQ09OVFJPTF9WTV9FVkVOVFMiLAogCVtLVk1JX0VW
RU5UXSAgICAgICAgICAgICAgICAgPSAiS1ZNSV9FVkVOVCIsCiAJW0tWTUlfRVZFTlRfUkVQTFld
ICAgICAgICAgICA9ICJLVk1JX0VWRU5UX1JFUExZIiwKQEAgLTMwMCw2ICszMDEsMzcgQEAgc3Rh
dGljIGludCBrdm1pX2dldF92Y3B1KHN0cnVjdCBrdm1pICppa3ZtLCB1bnNpZ25lZCBpbnQgdmNw
dV9pZHgsCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBib29sIGVuYWJsZV9zcHAoc3RydWN0IGt2
bWkgKmlrdm0pCit7CisJaWYgKCFpa3ZtLT5zcHAuaW5pdGlhbGl6ZWQpIHsKKwkJaW50IGVyciA9
IGt2bWlfYXJjaF9jbWRfY29udHJvbF9zcHAoaWt2bSk7CisKKwkJaWt2bS0+c3BwLmluaXRpYWxp
emVkID0gdHJ1ZTsKKworCQlpZiAoIWVycikKKwkJCWF0b21pY19zZXQoJmlrdm0tPnNwcC5lbmFi
bGVkLCB0cnVlKTsKKwl9CisKKwlyZXR1cm4gYXRvbWljX3JlYWQoJmlrdm0tPnNwcC5lbmFibGVk
KTsKK30KKworc3RhdGljIGludCBoYW5kbGVfY29udHJvbF9zcHAoc3RydWN0IGt2bWkgKmlrdm0s
CisJCQkgICAgICBjb25zdCBzdHJ1Y3Qga3ZtaV9tc2dfaGRyICptc2csCisJCQkgICAgICBjb25z
dCB2b2lkICpfcmVxKQoreworCWNvbnN0IHN0cnVjdCBrdm1pX2NvbnRyb2xfc3BwICpyZXEgPSBf
cmVxOworCWludCBlYzsKKworCWlmIChyZXEtPnBhZGRpbmcxIHx8IHJlcS0+cGFkZGluZzIgfHwg
cmVxLT5wYWRkaW5nMykKKwkJZWMgPSAtS1ZNX0VJTlZBTDsKKwllbHNlIGlmIChyZXEtPmVuYWJs
ZSAmJiBlbmFibGVfc3BwKGlrdm0pKQorCQllYyA9IDA7CisJZWxzZQorCQllYyA9IC1LVk1fRU9Q
Tk9UU1VQUDsKKworCXJldHVybiBrdm1pX21zZ192bV9tYXliZV9yZXBseShpa3ZtLCBtc2csIGVj
LCBOVUxMLCAwKTsKK30KKwogc3RhdGljIGludCBoYW5kbGVfY29udHJvbF9jbWRfcmVzcG9uc2Uo
c3RydWN0IGt2bWkgKmlrdm0sCiAJCQkJCWNvbnN0IHN0cnVjdCBrdm1pX21zZ19oZHIgKm1zZywK
IAkJCQkJY29uc3Qgdm9pZCAqX3JlcSkKQEAgLTM2NCw2ICszOTYsNyBAQCBzdGF0aWMgaW50KCpj
b25zdCBtc2dfdm1bXSkoc3RydWN0IGt2bWkgKiwgY29uc3Qgc3RydWN0IGt2bWlfbXNnX2hkciAq
LAogCVtLVk1JX0NIRUNLX0NPTU1BTkRdICAgICAgICAgPSBoYW5kbGVfY2hlY2tfY29tbWFuZCwK
IAlbS1ZNSV9DSEVDS19FVkVOVF0gICAgICAgICAgID0gaGFuZGxlX2NoZWNrX2V2ZW50LAogCVtL
Vk1JX0NPTlRST0xfQ01EX1JFU1BPTlNFXSAgPSBoYW5kbGVfY29udHJvbF9jbWRfcmVzcG9uc2Us
CisJW0tWTUlfQ09OVFJPTF9TUFBdICAgICAgICAgICA9IGhhbmRsZV9jb250cm9sX3NwcCwKIAlb
S1ZNSV9DT05UUk9MX1ZNX0VWRU5UU10gICAgID0gaGFuZGxlX2NvbnRyb2xfdm1fZXZlbnRzLAog
CVtLVk1JX0dFVF9HVUVTVF9JTkZPXSAgICAgICAgPSBoYW5kbGVfZ2V0X2d1ZXN0X2luZm8sCiAJ
W0tWTUlfR0VUX1BBR0VfQUNDRVNTXSAgICAgICA9IGhhbmRsZV9nZXRfcGFnZV9hY2Nlc3MsCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0
aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0
dWFsaXphdGlvbg==
