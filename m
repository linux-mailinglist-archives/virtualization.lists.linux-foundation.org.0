Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 440841978FA
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 12:20:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EDA3C87C4E;
	Mon, 30 Mar 2020 10:20:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rGquV09QLP55; Mon, 30 Mar 2020 10:20:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1317587C0A;
	Mon, 30 Mar 2020 10:20:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EDE93C07FF;
	Mon, 30 Mar 2020 10:20:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A398AC07FF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8955322FC6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:20:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jejaOhlS2nFz
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:20:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by silver.osuosl.org (Postfix) with ESMTPS id 34B74231B1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:19:55 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 D9A5430644BA; Mon, 30 Mar 2020 13:12:55 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 8905E305B7A0;
 Mon, 30 Mar 2020 13:12:55 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v8 44/81] KVM: introspection: add KVMI_VM_GET_INFO
Date: Mon, 30 Mar 2020 13:12:31 +0300
Message-Id: <20200330101308.21702-45-alazar@bitdefender.com>
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKRm9yIG5vdywgdGhp
cyBjb21tYW5kIHJldHVybnMgb25seSB0aGUgbnVtYmVyIG9mIG9ubGluZSB2Q1BVcy4KClRoZSBp
bnRyb3NwZWN0aW9uIHRvb2wgdXNlcyB0aGUgdkNQVSBpbmRleCBvbiBjb21tYW5kcyByZWxhdGVk
IHRvCnZDUFVzLgoKU2lnbmVkLW9mZi1ieTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5k
ZXIuY29tPgpTaWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRl
ci5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJzdCAgICAgICAgICAgICAg
ICB8IDE4ICsrKysrKysrKysrKysrKysrKwogaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaCAgICAg
ICAgICAgICAgICAgICAgICB8ICA2ICsrKysrKwogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3Zt
L3g4Nl82NC9rdm1pX3Rlc3QuYyB8IDE1ICsrKysrKysrKysrKysrKwogdmlydC9rdm0vaW50cm9z
cGVjdGlvbi9rdm1pX21zZy5jICAgICAgICAgICAgICB8IDEzICsrKysrKysrKysrKysKIDQgZmls
ZXMgY2hhbmdlZCwgNTIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
dmlydC9rdm0va3ZtaS5yc3QgYi9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2t2bWkucnN0CmluZGV4
IDVkYjM4ODQ4YzZkNC4uMzZiMzRlMDlkMmMyIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL3Zp
cnQva3ZtL2t2bWkucnN0CisrKyBiL0RvY3VtZW50YXRpb24vdmlydC9rdm0va3ZtaS5yc3QKQEAg
LTMyMCwzICszMjAsMjEgQEAgVGhpcyBjb21tYW5kIGlzIGFsd2F5cyBhbGxvd2VkLgogKiAtS1ZN
X0VOT0VOVCAtIHRoZSBldmVudCBzcGVjaWZpZWQgYnkgYGBpZGBgIGlzIHVuc3VwcG9ydGVkCiAq
IC1LVk1fRVBFUk0gLSB0aGUgZXZlbnQgc3BlY2lmaWVkIGJ5IGBgaWRgYCBpcyBkaXNhbGxvd2Vk
CiAqIC1LVk1fRUlOVkFMIC0gdGhlIHBhZGRpbmcgaXMgbm90IHplcm8KKworNC4gS1ZNSV9WTV9H
RVRfSU5GTworLS0tLS0tLS0tLS0tLS0tLS0tLQorCis6QXJjaGl0ZWN0dXJlczogYWxsCis6VmVy
c2lvbnM6ID49IDEKKzpQYXJhbWV0ZXJzOiBub25lCis6UmV0dXJuczoKKworOjoKKworCXN0cnVj
dCBrdm1pX2Vycm9yX2NvZGU7CisJc3RydWN0IGt2bWlfdm1fZ2V0X2luZm9fcmVwbHkgeworCQlf
X3UzMiB2Y3B1X2NvdW50OworCQlfX3UzMiBwYWRkaW5nWzNdOworCX07CisKK1JldHVybnMgdGhl
IG51bWJlciBvZiBvbmxpbmUgdkNQVXMuCmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgv
a3ZtaS5oIGIvaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaAppbmRleCBiNDdkZTE3MzNlNDkuLmJm
YTE1MjY3OThlNiAxMDA2NDQKLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaAorKysgYi9p
bmNsdWRlL3VhcGkvbGludXgva3ZtaS5oCkBAIC0xNyw2ICsxNyw3IEBAIGVudW0gewogCUtWTUlf
R0VUX1ZFUlNJT04gICAgICA9IDIsCiAJS1ZNSV9WTV9DSEVDS19DT01NQU5EID0gMywKIAlLVk1J
X1ZNX0NIRUNLX0VWRU5UICAgPSA0LAorCUtWTUlfVk1fR0VUX0lORk8gICAgICA9IDUsCiAKIAlL
Vk1JX05VTV9NRVNTQUdFUwogfTsKQEAgLTY0LDQgKzY1LDkgQEAgc3RydWN0IGt2bWlfdm1fY2hl
Y2tfZXZlbnQgewogCV9fdTMyIHBhZGRpbmcyOwogfTsKIAorc3RydWN0IGt2bWlfdm1fZ2V0X2lu
Zm9fcmVwbHkgeworCV9fdTMyIHZjcHVfY291bnQ7CisJX191MzIgcGFkZGluZ1szXTsKK307CisK
ICNlbmRpZiAvKiBfVUFQSV9fTElOVVhfS1ZNSV9IICovCmRpZmYgLS1naXQgYS90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9rdm0veDg2XzY0L2t2bWlfdGVzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMva3ZtL3g4Nl82NC9rdm1pX3Rlc3QuYwppbmRleCBmNDM0YTk2MTE4NTcuLmJhNTgwODFi
ZmVjNCAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3g4Nl82NC9rdm1p
X3Rlc3QuYworKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0veDg2XzY0L2t2bWlfdGVz
dC5jCkBAIC0yNTQsNiArMjU0LDIwIEBAIHN0YXRpYyB2b2lkIHRlc3RfY21kX2NoZWNrX2V2ZW50
KHZvaWQpCiAJCS1yLCBrdm1fc3RyZXJyb3IoLXIpKTsKIH0KIAorc3RhdGljIHZvaWQgdGVzdF9j
bWRfZ2V0X3ZtX2luZm8odm9pZCkKK3sKKwlzdHJ1Y3Qga3ZtaV92bV9nZXRfaW5mb19yZXBseSBy
cGw7CisJc3RydWN0IGt2bWlfbXNnX2hkciByZXE7CisKKwl0ZXN0X3ZtX2NvbW1hbmQoS1ZNSV9W
TV9HRVRfSU5GTywgJnJlcSwgc2l6ZW9mKHJlcSksICZycGwsCisJCQlzaXplb2YocnBsKSk7CisJ
VEVTVF9BU1NFUlQocnBsLnZjcHVfY291bnQgPT0gMSwKKwkJICAgICJVbmV4cGVjdGVkIG51bWJl
ciBvZiB2Q1BVIGNvdW50ICV1XG4iLAorCQkgICAgcnBsLnZjcHVfY291bnQpOworCisJREVCVUco
InZjcHUgY291bnQ6ICV1XG4iLCBycGwudmNwdV9jb3VudCk7Cit9CisKIHN0YXRpYyB2b2lkIHRl
c3RfaW50cm9zcGVjdGlvbihzdHJ1Y3Qga3ZtX3ZtICp2bSkKIHsKIAlzZXR1cF9zb2NrZXQoKTsK
QEAgLTI2Myw2ICsyNzcsNyBAQCBzdGF0aWMgdm9pZCB0ZXN0X2ludHJvc3BlY3Rpb24oc3RydWN0
IGt2bV92bSAqdm0pCiAJdGVzdF9jbWRfZ2V0X3ZlcnNpb24oKTsKIAl0ZXN0X2NtZF9jaGVja19j
b21tYW5kKCk7CiAJdGVzdF9jbWRfY2hlY2tfZXZlbnQoKTsKKwl0ZXN0X2NtZF9nZXRfdm1faW5m
bygpOwogCiAJdW5ob29rX2ludHJvc3BlY3Rpb24odm0pOwogfQpkaWZmIC0tZ2l0IGEvdmlydC9r
dm0vaW50cm9zcGVjdGlvbi9rdm1pX21zZy5jIGIvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1p
X21zZy5jCmluZGV4IDRmYzhiN2EwYjZkOS4uY2VlYzMxYWU0NTgxIDEwMDY0NAotLS0gYS92aXJ0
L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfbXNnLmMKKysrIGIvdmlydC9rdm0vaW50cm9zcGVjdGlv
bi9rdm1pX21zZy5jCkBAIC0xNTksNiArMTU5LDE4IEBAIHN0YXRpYyBpbnQgaGFuZGxlX2NoZWNr
X2V2ZW50KHN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqa3ZtaSwKIAlyZXR1cm4ga3ZtaV9tc2df
dm1fcmVwbHkoa3ZtaSwgbXNnLCBlYywgTlVMTCwgMCk7CiB9CiAKK3N0YXRpYyBpbnQgaGFuZGxl
X2dldF9pbmZvKHN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqa3ZtaSwKKwkJCSAgIGNvbnN0IHN0
cnVjdCBrdm1pX21zZ19oZHIgKm1zZywKKwkJCSAgIGNvbnN0IHZvaWQgKnJlcSkKK3sKKwlzdHJ1
Y3Qga3ZtaV92bV9nZXRfaW5mb19yZXBseSBycGw7CisKKwltZW1zZXQoJnJwbCwgMCwgc2l6ZW9m
KHJwbCkpOworCXJwbC52Y3B1X2NvdW50ID0gYXRvbWljX3JlYWQoJmt2bWktPmt2bS0+b25saW5l
X3ZjcHVzKTsKKworCXJldHVybiBrdm1pX21zZ192bV9yZXBseShrdm1pLCBtc2csIDAsICZycGws
IHNpemVvZihycGwpKTsKK30KKwogLyoKICAqIFRoZXNlIGNvbW1hbmRzIGFyZSBleGVjdXRlZCBi
eSB0aGUgcmVjZWl2aW5nIHRocmVhZC93b3JrZXIuCiAgKi8KQEAgLTE2Nyw2ICsxNzksNyBAQCBz
dGF0aWMgaW50KCpjb25zdCBtc2dfdm1bXSkoc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uICosCiAJ
W0tWTUlfR0VUX1ZFUlNJT05dICAgICAgPSBoYW5kbGVfZ2V0X3ZlcnNpb24sCiAJW0tWTUlfVk1f
Q0hFQ0tfQ09NTUFORF0gPSBoYW5kbGVfY2hlY2tfY29tbWFuZCwKIAlbS1ZNSV9WTV9DSEVDS19F
VkVOVF0gICA9IGhhbmRsZV9jaGVja19ldmVudCwKKwlbS1ZNSV9WTV9HRVRfSU5GT10gICAgICA9
IGhhbmRsZV9nZXRfaW5mbywKIH07CiAKIHN0YXRpYyBib29sIGlzX3ZtX2NvbW1hbmQodTE2IGlk
KQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFs
aXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlv
bi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8v
dmlydHVhbGl6YXRpb24=
