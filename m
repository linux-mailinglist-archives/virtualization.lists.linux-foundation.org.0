Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4382A8806D
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 18:45:06 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id EB992DA6;
	Fri,  9 Aug 2019 16:44:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 88EE7D09
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 16:44:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3458167F
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 16:44:55 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	E5A0C301AB4A; Fri,  9 Aug 2019 19:00:54 +0300 (EEST)
Received: from localhost.localdomain (unknown [89.136.169.210])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id A705D305B7A0;
	Fri,  9 Aug 2019 19:00:54 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v6 09/92] kvm: introspection: add KVMI_GET_GUEST_INFO
Date: Fri,  9 Aug 2019 18:59:24 +0300
Message-Id: <20190809160047.8319-10-alazar@bitdefender.com>
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKRm9yIG5vdywgdGhp
cyBjb21tYW5kIHJldHVybnMgb25seSB0aGUgbnVtYmVyIG9mIG9ubGluZSB2Q1BVcy4KClNpZ25l
ZC1vZmYtYnk6IE1paGFpIERvbsibdSA8bWRvbnR1QGJpdGRlZmVuZGVyLmNvbT4KU2lnbmVkLW9m
Zi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIERvY3Vt
ZW50YXRpb24vdmlydHVhbC9rdm0va3ZtaS5yc3QgfCAxOCArKysrKysrKysrKysrKysrKysKIGlu
Y2x1ZGUvdWFwaS9saW51eC9rdm1pLmggICAgICAgICAgfCAgNSArKysrKwogdmlydC9rdm0va3Zt
aV9tc2cuYyAgICAgICAgICAgICAgICB8IDE0ICsrKysrKysrKysrKysrCiAzIGZpbGVzIGNoYW5n
ZWQsIDM3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3ZpcnR1YWwv
a3ZtL2t2bWkucnN0IGIvRG9jdW1lbnRhdGlvbi92aXJ0dWFsL2t2bS9rdm1pLnJzdAppbmRleCA2
MWNmNjlhYTVkMDcuLjJmYmU3YzI4ZTRmMSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi92aXJ0
dWFsL2t2bS9rdm1pLnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL3ZpcnR1YWwva3ZtL2t2bWkucnN0
CkBAIC0zNjIsMyArMzYyLDIxIEBAIFRoaXMgY29tbWFuZCBpcyBhbHdheXMgYWxsb3dlZC4KIAog
KiAtS1ZNX1BFUk0gLSB0aGUgZXZlbnQgc3BlY2lmaWVkIGJ5IGBgaWRgYCBpcyBkaXNhbGxvd2Vk
CiAqIC1LVk1fRUlOVkFMIC0gcGFkZGluZyBpcyBub3QgemVybworCis1LiBLVk1JX0dFVF9HVUVT
VF9JTkZPCistLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisKKzpBcmNoaXRlY3R1cmVzOiBhbGwKKzpW
ZXJzaW9uczogPj0gMQorOlBhcmFtZXRlcnM6OiBub25lCis6UmV0dXJuczoKKworOjoKKworCXN0
cnVjdCBrdm1pX2Vycm9yX2NvZGU7CisJc3RydWN0IGt2bWlfZ2V0X2d1ZXN0X2luZm9fcmVwbHkg
eworCQlfX3UzMiB2Y3B1X2NvdW50OworCQlfX3UzMiBwYWRkaW5nWzNdOworCX07CisKK1JldHVy
bnMgdGhlIG51bWJlciBvZiBvbmxpbmUgdkNQVXMuCmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkv
bGludXgva3ZtaS5oIGIvaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaAppbmRleCA3MzkwMzAzMzcx
YzkuLjM2N2M4ZWMyOGY3NSAxMDA2NDQKLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaAor
KysgYi9pbmNsdWRlL3VhcGkvbGludXgva3ZtaS5oCkBAIC0xMDIsNCArMTAyLDkgQEAgc3RydWN0
IGt2bWlfY2hlY2tfZXZlbnQgewogCV9fdTMyIHBhZGRpbmcyOwogfTsKIAorc3RydWN0IGt2bWlf
Z2V0X2d1ZXN0X2luZm9fcmVwbHkgeworCV9fdTMyIHZjcHVfY291bnQ7CisJX191MzIgcGFkZGlu
Z1szXTsKK307CisKICNlbmRpZiAvKiBfVUFQSV9fTElOVVhfS1ZNSV9IICovCmRpZmYgLS1naXQg
YS92aXJ0L2t2bS9rdm1pX21zZy5jIGIvdmlydC9rdm0va3ZtaV9tc2cuYwppbmRleCBlMjQ5OTY2
MTFlM2EuLmNmOGExMjBiMGVhZSAxMDA2NDQKLS0tIGEvdmlydC9rdm0va3ZtaV9tc2cuYworKysg
Yi92aXJ0L2t2bS9rdm1pX21zZy5jCkBAIC0xMiw2ICsxMiw3IEBAIHN0YXRpYyBjb25zdCBjaGFy
ICpjb25zdCBtc2dfSURzW10gPSB7CiAJW0tWTUlfQ0hFQ0tfQ09NTUFORF0gICAgICAgICA9ICJL
Vk1JX0NIRUNLX0NPTU1BTkQiLAogCVtLVk1JX0NIRUNLX0VWRU5UXSAgICAgICAgICAgPSAiS1ZN
SV9DSEVDS19FVkVOVCIsCiAJW0tWTUlfQ09OVFJPTF9DTURfUkVTUE9OU0VdICA9ICJLVk1JX0NP
TlRST0xfQ01EX1JFU1BPTlNFIiwKKwlbS1ZNSV9HRVRfR1VFU1RfSU5GT10gICAgICAgID0gIktW
TUlfR0VUX0dVRVNUX0lORk8iLAogCVtLVk1JX0dFVF9WRVJTSU9OXSAgICAgICAgICAgPSAiS1ZN
SV9HRVRfVkVSU0lPTiIsCiB9OwogCkBAIC0yMTMsNiArMjE0LDE4IEBAIHN0YXRpYyBpbnQgaGFu
ZGxlX2NoZWNrX2V2ZW50KHN0cnVjdCBrdm1pICppa3ZtLAogCXJldHVybiBrdm1pX21zZ192bV9t
YXliZV9yZXBseShpa3ZtLCBtc2csIGVjLCBOVUxMLCAwKTsKIH0KIAorc3RhdGljIGludCBoYW5k
bGVfZ2V0X2d1ZXN0X2luZm8oc3RydWN0IGt2bWkgKmlrdm0sCisJCQkJIGNvbnN0IHN0cnVjdCBr
dm1pX21zZ19oZHIgKm1zZywKKwkJCQkgY29uc3Qgdm9pZCAqcmVxKQoreworCXN0cnVjdCBrdm1p
X2dldF9ndWVzdF9pbmZvX3JlcGx5IHJwbDsKKworCW1lbXNldCgmcnBsLCAwLCBzaXplb2YocnBs
KSk7CisJcnBsLnZjcHVfY291bnQgPSBhdG9taWNfcmVhZCgmaWt2bS0+a3ZtLT5vbmxpbmVfdmNw
dXMpOworCisJcmV0dXJuIGt2bWlfbXNnX3ZtX21heWJlX3JlcGx5KGlrdm0sIG1zZywgMCwgJnJw
bCwgc2l6ZW9mKHJwbCkpOworfQorCiBzdGF0aWMgaW50IGhhbmRsZV9jb250cm9sX2NtZF9yZXNw
b25zZShzdHJ1Y3Qga3ZtaSAqaWt2bSwKIAkJCQkJY29uc3Qgc3RydWN0IGt2bWlfbXNnX2hkciAq
bXNnLAogCQkJCQljb25zdCB2b2lkICpfcmVxKQpAQCAtMjQ2LDYgKzI1OSw3IEBAIHN0YXRpYyBp
bnQoKmNvbnN0IG1zZ192bVtdKShzdHJ1Y3Qga3ZtaSAqLCBjb25zdCBzdHJ1Y3Qga3ZtaV9tc2df
aGRyICosCiAJW0tWTUlfQ0hFQ0tfQ09NTUFORF0gICAgICAgICA9IGhhbmRsZV9jaGVja19jb21t
YW5kLAogCVtLVk1JX0NIRUNLX0VWRU5UXSAgICAgICAgICAgPSBoYW5kbGVfY2hlY2tfZXZlbnQs
CiAJW0tWTUlfQ09OVFJPTF9DTURfUkVTUE9OU0VdICA9IGhhbmRsZV9jb250cm9sX2NtZF9yZXNw
b25zZSwKKwlbS1ZNSV9HRVRfR1VFU1RfSU5GT10gICAgICAgID0gaGFuZGxlX2dldF9ndWVzdF9p
bmZvLAogCVtLVk1JX0dFVF9WRVJTSU9OXSAgICAgICAgICAgPSBoYW5kbGVfZ2V0X3ZlcnNpb24s
CiB9OwogCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZp
cnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3Vu
ZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0
aW5mby92aXJ0dWFsaXphdGlvbg==
