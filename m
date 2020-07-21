Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AC2228B96
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 23:45:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0008E86BA6;
	Tue, 21 Jul 2020 21:45:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pt-AOoOTmImH; Tue, 21 Jul 2020 21:45:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A373186A3C;
	Tue, 21 Jul 2020 21:45:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 850DCC088E;
	Tue, 21 Jul 2020 21:45:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1A5A5C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 126D086A3C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:45:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pA2kszfsH2vv
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:45:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E7B5B86A35
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:45:52 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 BDC88305D4FB; Wed, 22 Jul 2020 00:09:29 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 9C5F2304FA12;
 Wed, 22 Jul 2020 00:09:29 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v9 67/84] KVM: introspection: add KVMI_VM_GET_MAX_GFN
Date: Wed, 22 Jul 2020 00:09:05 +0300
Message-Id: <20200721210922.7646-68-alazar@bitdefender.com>
In-Reply-To: <20200721210922.7646-1-alazar@bitdefender.com>
References: <20200721210922.7646-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Nicu=C8=99or=20C=C3=AE=C8=9Bu?= <ncitu@bitdefender.com>,
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
dHJvc3BlY3Rpb24gdG9vbCB3aWxsIHVzZSB0aGlzIGNvbW1hbmQgdG8gZ2V0IHRoZSBtZW1vcnkg
YWRkcmVzcwpyYW5nZSBmb3Igd2hpY2ggaXQgY2FuIHNldCBhY2Nlc3MgcmVzdHJpY3Rpb25zLgoK
U2lnbmVkLW9mZi1ieTogyJh0ZWZhbiDImGljbGVydSA8c3NpY2xlcnVAYml0ZGVmZW5kZXIuY29t
PgpDby1kZXZlbG9wZWQtYnk6IE5pY3XImW9yIEPDrsibdSA8bmNpdHVAYml0ZGVmZW5kZXIuY29t
PgpTaWduZWQtb2ZmLWJ5OiBOaWN1yJlvciBDw67Im3UgPG5jaXR1QGJpdGRlZmVuZGVyLmNvbT4K
U2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgot
LS0KIERvY3VtZW50YXRpb24vdmlydC9rdm0va3ZtaS5yc3QgICAgICAgICAgICAgICB8IDE5ICsr
KysrKysrKysrKysrKysrKysKIGluY2x1ZGUvdWFwaS9saW51eC9rdm1pLmggICAgICAgICAgICAg
ICAgICAgICB8ICA2ICsrKysrKwogLi4uL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS94ODZfNjQva3Zt
aV90ZXN0LmMgIHwgMTIgKysrKysrKysrKysrCiB2aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlf
bXNnLmMgICAgICAgICAgICAgfCAxMyArKysrKysrKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDUw
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2t2bWku
cnN0IGIvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJzdAppbmRleCA0MjYzYTlhYzkwZTQu
LjdkYThlZmQxOGI4OSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJz
dAorKysgYi9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2t2bWkucnN0CkBAIC03ODksNiArNzg5LDI1
IEBAIGV4Y2VwdGlvbi4KICogLUtWTV9FQlVTWSAtIGFub3RoZXIgKktWTUlfVkNQVV9JTkpFQ1Rf
RVhDRVBUSU9OKi0qS1ZNSV9FVkVOVF9UUkFQKiBwYWlyCiAgICAgICAgICAgICAgICBpcyBpbiBw
cm9ncmVzcwogCisxNy4gS1ZNSV9WTV9HRVRfTUFYX0dGTgorLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KKworOkFyY2hpdGVjdHVyZTogYWxsCis6VmVyc2lvbnM6ID49IDEKKzpQYXJhbWV0ZXJzOiBu
b25lCis6UmV0dXJuczoKKworOjoKKworICAgICAgICBzdHJ1Y3Qga3ZtaV9lcnJvcl9jb2RlOwor
ICAgICAgICBzdHJ1Y3Qga3ZtaV92bV9nZXRfbWF4X2dmbl9yZXBseSB7CisgICAgICAgICAgICAg
ICAgX191NjQgZ2ZuOworICAgICAgICB9OworCitQcm92aWRlcyB0aGUgbWF4aW11bSBHRk4gYWxs
b2NhdGVkIHRvIHRoZSBWTSBieSB3YWxraW5nIHRocm91Z2ggYWxsCittZW1vcnkgc2xvdHMgYWxs
b2NhdGVkIGJ5IEtWTS4gU3RyaWNseSBzcGVha2luZywgdGhlIHJldHVybmVkIHZhbHVlIHJlZmVy
cwordG8gdGhlIGZpcnN0IGluYWNjZXNzaWJsZSBHRk4sIG5leHQgdG8gdGhlIG1heGltdW0gYWNj
ZXNzaWJsZSBHRk4uCisKIEV2ZW50cwogPT09PT09CiAKZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFw
aS9saW51eC9rdm1pLmggYi9pbmNsdWRlL3VhcGkvbGludXgva3ZtaS5oCmluZGV4IGZhZjQ2MjRk
N2E5Ny4uMmE0Y2M4YzQxNDY1IDEwMDY0NAotLS0gYS9pbmNsdWRlL3VhcGkvbGludXgva3ZtaS5o
CisrKyBiL2luY2x1ZGUvdWFwaS9saW51eC9rdm1pLmgKQEAgLTM3LDYgKzM3LDggQEAgZW51bSB7
CiAJS1ZNSV9WQ1BVX0NPTlRST0xfQ1IgICAgICAgPSAxNSwKIAlLVk1JX1ZDUFVfSU5KRUNUX0VY
Q0VQVElPTiA9IDE2LAogCisJS1ZNSV9WTV9HRVRfTUFYX0dGTiA9IDE3LAorCiAJS1ZNSV9OVU1f
TUVTU0FHRVMKIH07CiAKQEAgLTE0OSw2ICsxNTEsMTAgQEAgc3RydWN0IGt2bWlfdm1fY29udHJv
bF9jbGVhbnVwIHsKIAlfX3UzMiBwYWRkaW5nMzsKIH07CiAKK3N0cnVjdCBrdm1pX3ZtX2dldF9t
YXhfZ2ZuX3JlcGx5IHsKKwlfX3U2NCBnZm47Cit9OworCiBzdHJ1Y3Qga3ZtaV9ldmVudCB7CiAJ
X191MTYgc2l6ZTsKIAlfX3UxNiB2Y3B1OwpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMva3ZtL3g4Nl82NC9rdm1pX3Rlc3QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2
bS94ODZfNjQva3ZtaV90ZXN0LmMKaW5kZXggOWFiZjRlYzBkMDlhLi4xMDVhZGY3NWE2OGQgMTAw
NjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS94ODZfNjQva3ZtaV90ZXN0LmMK
KysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3g4Nl82NC9rdm1pX3Rlc3QuYwpAQCAt
MTQyMCw2ICsxNDIwLDE3IEBAIHN0YXRpYyB2b2lkIHRlc3RfY21kX3ZjcHVfaW5qZWN0X2V4Y2Vw
dGlvbihzdHJ1Y3Qga3ZtX3ZtICp2bSkKIAlkaXNhYmxlX3ZjcHVfZXZlbnQodm0sIEtWTUlfRVZF
TlRfQlJFQUtQT0lOVCk7CiB9CiAKK3N0YXRpYyB2b2lkIHRlc3RfY21kX3ZtX2dldF9tYXhfZ2Zu
KHZvaWQpCit7CisJc3RydWN0IGt2bWlfdm1fZ2V0X21heF9nZm5fcmVwbHkgcnBsOworCXN0cnVj
dCBrdm1pX21zZ19oZHIgcmVxOworCisJdGVzdF92bV9jb21tYW5kKEtWTUlfVk1fR0VUX01BWF9H
Rk4sICZyZXEsIHNpemVvZihyZXEpLAorCQkJJnJwbCwgc2l6ZW9mKHJwbCkpOworCisJcHJfaW5m
bygibWF4X2dmbjogMHglbGx4XG4iLCBycGwuZ2ZuKTsKK30KKwogc3RhdGljIHZvaWQgdGVzdF9p
bnRyb3NwZWN0aW9uKHN0cnVjdCBrdm1fdm0gKnZtKQogewogCXNyYW5kb20odGltZSgwKSk7CkBA
IC0xNDQ1LDYgKzE0NTYsNyBAQCBzdGF0aWMgdm9pZCB0ZXN0X2ludHJvc3BlY3Rpb24oc3RydWN0
IGt2bV92bSAqdm0pCiAJdGVzdF9jbWRfdm1fY29udHJvbF9jbGVhbnVwKHZtKTsKIAl0ZXN0X2Nt
ZF92Y3B1X2NvbnRyb2xfY3Iodm0pOwogCXRlc3RfY21kX3ZjcHVfaW5qZWN0X2V4Y2VwdGlvbih2
bSk7CisJdGVzdF9jbWRfdm1fZ2V0X21heF9nZm4oKTsKIAogCXVuaG9va19pbnRyb3NwZWN0aW9u
KHZtKTsKIH0KZGlmZiAtLWdpdCBhL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9tc2cuYyBi
L3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9tc2cuYwppbmRleCA2M2VmYjg1ZmYxYWUuLjE4
YmMxYTcxMTg0NSAxMDA2NDQKLS0tIGEvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX21zZy5j
CisrKyBiL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9tc2cuYwpAQCAtMzIyLDYgKzMyMiwx
OCBAQCBzdGF0aWMgaW50IGhhbmRsZV92bV9jb250cm9sX2NsZWFudXAoc3RydWN0IGt2bV9pbnRy
b3NwZWN0aW9uICprdm1pLAogCXJldHVybiBrdm1pX21zZ192bV9yZXBseShrdm1pLCBtc2csIGVj
LCBOVUxMLCAwKTsKIH0KIAorc3RhdGljIGludCBoYW5kbGVfdm1fZ2V0X21heF9nZm4oc3RydWN0
IGt2bV9pbnRyb3NwZWN0aW9uICprdm1pLAorCQkJCSBjb25zdCBzdHJ1Y3Qga3ZtaV9tc2dfaGRy
ICptc2csCisJCQkJIGNvbnN0IHZvaWQgKnJlcSkKK3sKKwlzdHJ1Y3Qga3ZtaV92bV9nZXRfbWF4
X2dmbl9yZXBseSBycGw7CisKKwltZW1zZXQoJnJwbCwgMCwgc2l6ZW9mKHJwbCkpOworCXJwbC5n
Zm4gPSBrdm1fZ2V0X21heF9nZm4oa3ZtaS0+a3ZtKTsKKworCXJldHVybiBrdm1pX21zZ192bV9y
ZXBseShrdm1pLCBtc2csIDAsICZycGwsIHNpemVvZihycGwpKTsKK30KKwogLyoKICAqIFRoZXNl
IGNvbW1hbmRzIGFyZSBleGVjdXRlZCBieSB0aGUgcmVjZWl2aW5nIHRocmVhZC4KICAqLwpAQCAt
MzM0LDYgKzM0Niw3IEBAIHN0YXRpYyBpbnQoKmNvbnN0IG1zZ192bVtdKShzdHJ1Y3Qga3ZtX2lu
dHJvc3BlY3Rpb24gKiwKIAlbS1ZNSV9WTV9DT05UUk9MX0NMRUFOVVBdID0gaGFuZGxlX3ZtX2Nv
bnRyb2xfY2xlYW51cCwKIAlbS1ZNSV9WTV9DT05UUk9MX0VWRU5UU10gID0gaGFuZGxlX3ZtX2Nv
bnRyb2xfZXZlbnRzLAogCVtLVk1JX1ZNX0dFVF9JTkZPXSAgICAgICAgPSBoYW5kbGVfdm1fZ2V0
X2luZm8sCisJW0tWTUlfVk1fR0VUX01BWF9HRk5dICAgICA9IGhhbmRsZV92bV9nZXRfbWF4X2dm
biwKIAlbS1ZNSV9WTV9SRUFEX1BIWVNJQ0FMXSAgID0gaGFuZGxlX3ZtX3JlYWRfcGh5c2ljYWws
CiAJW0tWTUlfVk1fV1JJVEVfUEhZU0lDQUxdICA9IGhhbmRsZV92bV93cml0ZV9waHlzaWNhbCwK
IH07Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1
YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0
aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5m
by92aXJ0dWFsaXphdGlvbg==
