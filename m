Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B512C3C5E
	for <lists.virtualization@lfdr.de>; Wed, 25 Nov 2020 10:42:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 365B687492;
	Wed, 25 Nov 2020 09:42:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x5ChiPrx6ndg; Wed, 25 Nov 2020 09:42:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D670287499;
	Wed, 25 Nov 2020 09:42:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BD502C0052;
	Wed, 25 Nov 2020 09:42:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A153C0052
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0432A86DA0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:42:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dULi9vKT4GRc
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:41:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9DF8C86D74
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:41:55 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 C1C69305D3C9; Wed, 25 Nov 2020 11:35:52 +0200 (EET)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 982663072785;
 Wed, 25 Nov 2020 11:35:52 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v10 61/81] KVM: introspection: add KVMI_VCPU_CONTROL_CR and
 KVMI_VCPU_EVENT_CR
Date: Wed, 25 Nov 2020 11:35:40 +0200
Message-Id: <20201125093600.2766-62-alazar@bitdefender.com>
In-Reply-To: <20201125093600.2766-1-alazar@bitdefender.com>
References: <20201125093600.2766-1-alazar@bitdefender.com>
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVXNpbmcgdGhlIEtW
TUlfVkNQVV9DT05UUk9MX0NSIGNvbW1hbmQsIHRoZSBpbnRyb3NwZWN0aW9uIHRvb2wgc3Vic2Ny
aWJlcwp0byBLVk1JX1ZDUFVfRVZFTlRfQ1IgZXZlbnRzIHRoYXQgd2lsbCBiZSBzZW50IHdoZW4g
YSBjb250cm9sIHJlZ2lzdGVyCihDUjAsIENSMyBvciBDUjQpIGlzIGdvaW5nIHRvIGJlIGNoYW5n
ZWQuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaSBEb27Im3UgPG1kb250dUBiaXRkZWZlbmRlci5jb20+
CkNvLWRldmVsb3BlZC1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29t
PgpTaWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+
Ci0tLQogRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJzdCAgICAgICAgICAgICAgIHwgIDcz
ICsrKysrKysrKysrKysKIGFyY2gveDg2L2luY2x1ZGUvYXNtL2t2bWlfaG9zdC5oICAgICAgICAg
ICAgICB8ICAxMiArKysKIGFyY2gveDg2L2luY2x1ZGUvdWFwaS9hc20va3ZtaS5oICAgICAgICAg
ICAgICB8ICAxOCArKysrCiBhcmNoL3g4Ni9rdm0va3ZtaS5jICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgNzggKysrKysrKysrKysrKysKIGFyY2gveDg2L2t2bS9rdm1pLmggICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgNCArCiBhcmNoL3g4Ni9rdm0va3ZtaV9tc2cuYyAgICAgICAg
ICAgICAgICAgICAgICAgfCAgNDQgKysrKysrKysKIGFyY2gveDg2L2t2bS92bXgvdm14LmMgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgNiArLQogYXJjaC94ODYva3ZtL3g4Ni5jICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDEyICsrLQogaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaCAg
ICAgICAgICAgICAgICAgICAgIHwgICAyICsKIC4uLi90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0veDg2
XzY0L2t2bWlfdGVzdC5jICB8IDEwMCArKysrKysrKysrKysrKysrKysKIHZpcnQva3ZtL2ludHJv
c3BlY3Rpb24va3ZtaV9pbnQuaCAgICAgICAgICAgICB8ICAgMiArCiAxMSBmaWxlcyBjaGFuZ2Vk
LCAzNDggaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL3ZpcnQva3ZtL2t2bWkucnN0IGIvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJz
dAppbmRleCBmOWMxMGQyN2NlMTQuLjg1ZTE0YjgyYWEyZiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRh
dGlvbi92aXJ0L2t2bS9rdm1pLnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2t2bWku
cnN0CkBAIC01MzksNiArNTM5LDcgQEAgRW5hYmxlcy9kaXNhYmxlcyB2Q1BVIGludHJvc3BlY3Rp
b24gZXZlbnRzLiBUaGlzIGNvbW1hbmQgY2FuIGJlIHVzZWQgd2l0aAogdGhlIGZvbGxvd2luZyBl
dmVudHM6OgogCiAJS1ZNSV9WQ1BVX0VWRU5UX0JSRUFLUE9JTlQKKwlLVk1JX1ZDUFVfRVZFTlRf
Q1IKIAlLVk1JX1ZDUFVfRVZFTlRfSFlQRVJDQUxMCiAKIFdoZW4gYW4gZXZlbnQgaXMgZW5hYmxl
ZCwgdGhlIGludHJvc3BlY3Rpb24gdG9vbCBpcyBub3RpZmllZCBhbmQKQEAgLTcwMSw2ICs3MDIs
NDAgQEAgaW50ZXJjZXB0aW9ucykuIEJ5IGRlZmF1bHQgaXQgaXMgZW5hYmxlZC4KICogLUtWTV9F
SU5WQUwgLSB0aGUgcGFkZGluZyBpcyBub3QgemVybwogKiAtS1ZNX0VJTlZBTCAtIGBgZW5hYmxl
YGAgaXMgbm90IDEgb3IgMAogCisxNS4gS1ZNSV9WQ1BVX0NPTlRST0xfQ1IKKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQorCis6QXJjaGl0ZWN0dXJlczogeDg2Cis6VmVyc2lvbnM6ID49IDEKKzpQ
YXJhbWV0ZXJzOgorCis6OgorCisJc3RydWN0IGt2bWlfdmNwdV9oZHI7CisJc3RydWN0IGt2bWlf
dmNwdV9jb250cm9sX2NyIHsKKwkJX191OCBjcjsKKwkJX191OCBlbmFibGU7CisJCV9fdTE2IHBh
ZGRpbmcxOworCQlfX3UzMiBwYWRkaW5nMjsKKwl9OworCis6UmV0dXJuczoKKworOjoKKworCXN0
cnVjdCBrdm1pX2Vycm9yX2NvZGUKKworRW5hYmxlcy9kaXNhYmxlcyBpbnRyb3NwZWN0aW9uIGZv
ciBhIHNwZWNpZmljIGNvbnRyb2wgcmVnaXN0ZXIgYW5kIG11c3QKK2JlIHVzZWQgaW4gYWRkaXRp
b24gdG8gKktWTUlfVkNQVV9DT05UUk9MX0VWRU5UUyogd2l0aCB0aGUgKktWTUlfVkNQVV9FVkVO
VF9DUioKK0lEIHNldC4KKworOkVycm9yczoKKworKiAtS1ZNX0VJTlZBTCAtIHRoZSBzZWxlY3Rl
ZCB2Q1BVIGlzIGludmFsaWQKKyogLUtWTV9FSU5WQUwgLSB0aGUgc3BlY2lmaWVkIGNvbnRyb2wg
cmVnaXN0ZXIgaXMgbm90IENSMCwgQ1IzIG9yIENSNAorKiAtS1ZNX0VJTlZBTCAtIHRoZSBwYWRk
aW5nIGlzIG5vdCB6ZXJvCisqIC1LVk1fRUFHQUlOIC0gdGhlIHNlbGVjdGVkIHZDUFUgY2FuJ3Qg
YmUgaW50cm9zcGVjdGVkIHlldAorCiBFdmVudHMKID09PT09PQogCkBAIC04OTMsMyArOTI4LDQx
IEBAIGJlZm9yZSByZXR1cm5pbmcgdGhpcyBhY3Rpb24uCiAKIFRoZSAqQ09OVElOVUUqIGFjdGlv
biB3aWxsIGNhdXNlIHRoZSBicmVha3BvaW50IGV4Y2VwdGlvbiB0byBiZSByZWluamVjdGVkCiAo
dGhlIE9TIHdpbGwgaGFuZGxlIGl0KS4KKworNS4gS1ZNSV9WQ1BVX0VWRU5UX0NSCistLS0tLS0t
LS0tLS0tLS0tLS0tLS0KKworOkFyY2hpdGVjdHVyZXM6IHg4NgorOlZlcnNpb25zOiA+PSAxCis6
QWN0aW9uczogQ09OVElOVUUsIENSQVNICis6UGFyYW1ldGVyczoKKworOjoKKworCXN0cnVjdCBr
dm1pX2V2ZW50X2hkcjsKKwlzdHJ1Y3Qga3ZtaV92Y3B1X2V2ZW50OworCXN0cnVjdCBrdm1pX3Zj
cHVfZXZlbnRfY3IgeworCQlfX3U4IGNyOworCQlfX3U4IHBhZGRpbmdbN107CisJCV9fdTY0IG9s
ZF92YWx1ZTsKKwkJX191NjQgbmV3X3ZhbHVlOworCX07CisKKzpSZXR1cm5zOgorCis6OgorCisJ
c3RydWN0IGt2bWlfdmNwdV9oZHI7CisJc3RydWN0IGt2bWlfdmNwdV9ldmVudF9yZXBseTsKKwlz
dHJ1Y3Qga3ZtaV92Y3B1X2V2ZW50X2NyX3JlcGx5IHsKKwkJX191NjQgbmV3X3ZhbDsKKwl9Owor
CitUaGlzIGV2ZW50IGlzIHNlbnQgd2hlbiBhIGNvbnRyb2wgcmVnaXN0ZXIgaXMgZ29pbmcgdG8g
YmUgY2hhbmdlZCBhbmQgdGhlCitpbnRyb3NwZWN0aW9uIGhhcyBiZWVuIGVuYWJsZWQgZm9yIHRo
aXMgZXZlbnQgYW5kIGZvciB0aGlzIHNwZWNpZmljCityZWdpc3RlciAoc2VlICoqS1ZNSV9WQ1BV
X0NPTlRST0xfRVZFTlRTKiopLgorCitgYGt2bWlfdmNwdV9ldmVudGBgICh3aXRoIHRoZSB2Q1BV
IHN0YXRlKSwgdGhlIGNvbnRyb2wgcmVnaXN0ZXIgbnVtYmVyCisoYGBjcmBgKSwgdGhlIG9sZCB2
YWx1ZSAoYGBvbGRfdmFsdWVgYCkgYW5kIHRoZSBuZXcgdmFsdWUgKGBgbmV3X3ZhbHVlYGApCith
cmUgc2VudCB0byB0aGUgaW50cm9zcGVjdGlvbiB0b29sLiBUaGUgKkNPTlRJTlVFKiBhY3Rpb24g
d2lsbCBzZXQgdGhlCitgYG5ld192YWxgYC4KZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUv
YXNtL2t2bWlfaG9zdC5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtaV9ob3N0LmgKaW5kZXgg
MTYxZDFhZTVhN2NmLi43NjEzMDg4ZDBhZTIgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2luY2x1ZGUv
YXNtL2t2bWlfaG9zdC5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bWlfaG9zdC5oCkBA
IC00LDYgKzQsOCBAQAogCiAjaW5jbHVkZSA8YXNtL2t2bWkuaD4KIAorI2RlZmluZSBLVk1JX05V
TV9DUiA1CisKIHN0cnVjdCBrdm1pX21vbml0b3JfaW50ZXJjZXB0aW9uIHsKIAlib29sIGt2bWlf
aW50ZXJjZXB0ZWQ7CiAJYm9vbCBrdm1faW50ZXJjZXB0ZWQ7CkBAIC0xOSw2ICsyMSw4IEBAIHN0
cnVjdCBrdm1pX2ludGVyY2VwdGlvbiB7CiBzdHJ1Y3Qga3ZtX3ZjcHVfYXJjaF9pbnRyb3NwZWN0
aW9uIHsKIAlzdHJ1Y3Qga3ZtX3JlZ3MgZGVsYXllZF9yZWdzOwogCWJvb2wgaGF2ZV9kZWxheWVk
X3JlZ3M7CisKKwlERUNMQVJFX0JJVE1BUChjcl9tYXNrLCBLVk1JX05VTV9DUik7CiB9OwogCiBz
dHJ1Y3Qga3ZtX2FyY2hfaW50cm9zcGVjdGlvbiB7CkBAIC0yNywxMSArMzEsMTkgQEAgc3RydWN0
IGt2bV9hcmNoX2ludHJvc3BlY3Rpb24gewogI2lmZGVmIENPTkZJR19LVk1fSU5UUk9TUEVDVElP
TgogCiBib29sIGt2bWlfbW9uaXRvcl9icF9pbnRlcmNlcHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
LCB1MzIgZGJnKTsKK2Jvb2wga3ZtaV9jcl9ldmVudChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVu
c2lnbmVkIGludCBjciwKKwkJICAgdW5zaWduZWQgbG9uZyBvbGRfdmFsdWUsIHVuc2lnbmVkIGxv
bmcgKm5ld192YWx1ZSk7Citib29sIGt2bWlfY3IzX2ludGVyY2VwdGVkKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSk7CiAKICNlbHNlIC8qIENPTkZJR19LVk1fSU5UUk9TUEVDVElPTiAqLwogCiBzdGF0
aWMgaW5saW5lIGJvb2wga3ZtaV9tb25pdG9yX2JwX2ludGVyY2VwdChzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUsIHUzMiBkYmcpCiAJeyByZXR1cm4gZmFsc2U7IH0KK3N0YXRpYyBpbmxpbmUgYm9vbCBr
dm1pX2NyX2V2ZW50KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgaW50IGNyLAorCQkJ
CSB1bnNpZ25lZCBsb25nIG9sZF92YWx1ZSwKKwkJCQkgdW5zaWduZWQgbG9uZyAqbmV3X3ZhbHVl
KQorCQkJeyByZXR1cm4gdHJ1ZTsgfQorc3RhdGljIGlubGluZSBib29sIGt2bWlfY3IzX2ludGVy
Y2VwdGVkKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkgeyByZXR1cm4gZmFsc2U7IH0KIAogI2VuZGlm
IC8qIENPTkZJR19LVk1fSU5UUk9TUEVDVElPTiAqLwogCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9p
bmNsdWRlL3VhcGkvYXNtL2t2bWkuaCBiL2FyY2gveDg2L2luY2x1ZGUvdWFwaS9hc20va3ZtaS5o
CmluZGV4IGE0NDJiYTRkMjE5MC4uMzJjZDE3NDg4MDU4IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9p
bmNsdWRlL3VhcGkvYXNtL2t2bWkuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL2t2
bWkuaApAQCAtNjEsNCArNjEsMjIgQEAgc3RydWN0IGt2bWlfdmNwdV9nZXRfY3B1aWRfcmVwbHkg
ewogCV9fdTMyIGVkeDsKIH07CiAKK3N0cnVjdCBrdm1pX3ZjcHVfY29udHJvbF9jciB7CisJX191
OCBjcjsKKwlfX3U4IGVuYWJsZTsKKwlfX3UxNiBwYWRkaW5nMTsKKwlfX3UzMiBwYWRkaW5nMjsK
K307CisKK3N0cnVjdCBrdm1pX3ZjcHVfZXZlbnRfY3IgeworCV9fdTggY3I7CisJX191OCBwYWRk
aW5nWzddOworCV9fdTY0IG9sZF92YWx1ZTsKKwlfX3U2NCBuZXdfdmFsdWU7Cit9OworCitzdHJ1
Y3Qga3ZtaV92Y3B1X2V2ZW50X2NyX3JlcGx5IHsKKwlfX3U2NCBuZXdfdmFsOworfTsKKwogI2Vu
ZGlmIC8qIF9VQVBJX0FTTV9YODZfS1ZNSV9IICovCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0v
a3ZtaS5jIGIvYXJjaC94ODYva3ZtL2t2bWkuYwppbmRleCBlN2E0ZWY0OGVkNjEuLjJiYjZiNGJi
OTMyYiAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL2t2bWkuYworKysgYi9hcmNoL3g4Ni9rdm0v
a3ZtaS5jCkBAIC04LDEwICs4LDEyIEBACiAjaW5jbHVkZSAibGludXgva3ZtX2hvc3QuaCIKICNp
bmNsdWRlICJ4ODYuaCIKICNpbmNsdWRlICIuLi8uLi8uLi92aXJ0L2t2bS9pbnRyb3NwZWN0aW9u
L2t2bWlfaW50LmgiCisjaW5jbHVkZSAia3ZtaS5oIgogCiB2b2lkIGt2bWlfYXJjaF9pbml0X3Zj
cHVfZXZlbnRzX21hc2sodW5zaWduZWQgbG9uZyAqc3VwcG9ydGVkKQogewogCXNldF9iaXQoS1ZN
SV9WQ1BVX0VWRU5UX0JSRUFLUE9JTlQsIHN1cHBvcnRlZCk7CisJc2V0X2JpdChLVk1JX1ZDUFVf
RVZFTlRfQ1IsIHN1cHBvcnRlZCk7CiAJc2V0X2JpdChLVk1JX1ZDUFVfRVZFTlRfSFlQRVJDQUxM
LCBzdXBwb3J0ZWQpOwogfQogCkBAIC0zMjAsMyArMzIyLDc5IEBAIHZvaWQga3ZtaV9hcmNoX3Jl
cXVlc3RfaW50ZXJjZXB0aW9uX2NsZWFudXAoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCQlhcmNo
X3ZjcHVpLT5jbGVhbnVwID0gdHJ1ZTsKIAl9CiB9CisKK2ludCBrdm1pX2FyY2hfY21kX3ZjcHVf
Y29udHJvbF9jcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGludCBjciwgYm9vbCBlbmFibGUpCit7
CisJaWYgKGNyID09IDMpCisJCWt2bV94ODZfb3BzLmNvbnRyb2xfY3IzX2ludGVyY2VwdCh2Y3B1
LCBDUl9UWVBFX1csIGVuYWJsZSk7CisKKwlpZiAoZW5hYmxlKQorCQlzZXRfYml0KGNyLCBWQ1BV
SSh2Y3B1KS0+YXJjaC5jcl9tYXNrKTsKKwllbHNlCisJCWNsZWFyX2JpdChjciwgVkNQVUkodmNw
dSktPmFyY2guY3JfbWFzayk7CisKKwlyZXR1cm4gMDsKK30KKworc3RhdGljIGJvb2wgX19rdm1p
X2NyX2V2ZW50KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgaW50IGNyLAorCQkJICAg
IHU2NCBvbGRfdmFsdWUsIHVuc2lnbmVkIGxvbmcgKm5ld192YWx1ZSkKK3sKKwl1NjQgcmVwbHlf
dmFsdWU7CisJdTMyIGFjdGlvbjsKKwlib29sIHJldDsKKworCWlmICghdGVzdF9iaXQoY3IsIFZD
UFVJKHZjcHUpLT5hcmNoLmNyX21hc2spKQorCQlyZXR1cm4gdHJ1ZTsKKworCWFjdGlvbiA9IGt2
bWlfbXNnX3NlbmRfY3IodmNwdSwgY3IsIG9sZF92YWx1ZSwgKm5ld192YWx1ZSwKKwkJCQkgICZy
ZXBseV92YWx1ZSk7CisJc3dpdGNoIChhY3Rpb24pIHsKKwljYXNlIEtWTUlfRVZFTlRfQUNUSU9O
X0NPTlRJTlVFOgorCQkqbmV3X3ZhbHVlID0gcmVwbHlfdmFsdWU7CisJCXJldCA9IHRydWU7CisJ
CWJyZWFrOworCWRlZmF1bHQ6CisJCWt2bWlfaGFuZGxlX2NvbW1vbl9ldmVudF9hY3Rpb25zKHZj
cHUsIGFjdGlvbik7CisJCXJldCA9IGZhbHNlOworCX0KKworCXJldHVybiByZXQ7Cit9CisKK2Jv
b2wga3ZtaV9jcl9ldmVudChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGludCBjciwK
KwkJICAgdW5zaWduZWQgbG9uZyBvbGRfdmFsdWUsIHVuc2lnbmVkIGxvbmcgKm5ld192YWx1ZSkK
K3sKKwlzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2bWk7CisJYm9vbCByZXQgPSB0cnVlOwor
CisJaWYgKG9sZF92YWx1ZSA9PSAqbmV3X3ZhbHVlKQorCQlyZXR1cm4gdHJ1ZTsKKworCWt2bWkg
PSBrdm1pX2dldCh2Y3B1LT5rdm0pOworCWlmICgha3ZtaSkKKwkJcmV0dXJuIHRydWU7CisKKwlp
ZiAoaXNfdmNwdV9ldmVudF9lbmFibGVkKHZjcHUsIEtWTUlfVkNQVV9FVkVOVF9DUikpCisJCXJl
dCA9IF9fa3ZtaV9jcl9ldmVudCh2Y3B1LCBjciwgb2xkX3ZhbHVlLCBuZXdfdmFsdWUpOworCisJ
a3ZtaV9wdXQodmNwdS0+a3ZtKTsKKworCXJldHVybiByZXQ7Cit9CisKK2Jvb2wga3ZtaV9jcjNf
aW50ZXJjZXB0ZWQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQoreworCXN0cnVjdCBrdm1faW50cm9z
cGVjdGlvbiAqa3ZtaTsKKwlib29sIHJldDsKKworCWt2bWkgPSBrdm1pX2dldCh2Y3B1LT5rdm0p
OworCWlmICgha3ZtaSkKKwkJcmV0dXJuIGZhbHNlOworCisJcmV0ID0gdGVzdF9iaXQoMywgVkNQ
VUkodmNwdSktPmFyY2guY3JfbWFzayk7CisKKwlrdm1pX3B1dCh2Y3B1LT5rdm0pOworCisJcmV0
dXJuIHJldDsKK30KK0VYUE9SVF9TWU1CT0woa3ZtaV9jcjNfaW50ZXJjZXB0ZWQpOwpkaWZmIC0t
Z2l0IGEvYXJjaC94ODYva3ZtL2t2bWkuaCBiL2FyY2gveDg2L2t2bS9rdm1pLmgKaW5kZXggNGVl
YjBjOTAwMDgzLi42ZjRhYWViYjY3ZjkgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS9rdm1pLmgK
KysrIGIvYXJjaC94ODYva3ZtL2t2bWkuaApAQCAtNyw1ICs3LDkgQEAgaW50IGt2bWlfYXJjaF9j
bWRfdmNwdV9nZXRfcmVnaXN0ZXJzKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKIAkJCQlzdHJ1Y3Qg
a3ZtaV92Y3B1X2dldF9yZWdpc3RlcnNfcmVwbHkgKnJwbCk7CiB2b2lkIGt2bWlfYXJjaF9jbWRf
dmNwdV9zZXRfcmVnaXN0ZXJzKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKIAkJCQkgICAgICBjb25z
dCBzdHJ1Y3Qga3ZtX3JlZ3MgKnJlZ3MpOworaW50IGt2bWlfYXJjaF9jbWRfdmNwdV9jb250cm9s
X2NyKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgaW50IGNyLCBib29sIGVuYWJsZSk7CisKK3UzMiBr
dm1pX21zZ19zZW5kX2NyKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdTMyIGNyLCB1NjQgb2xkX3Zh
bHVlLAorCQkgICAgIHU2NCBuZXdfdmFsdWUsIHU2NCAqcmV0X3ZhbHVlKTsKIAogI2VuZGlmCmRp
ZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0va3ZtaV9tc2cuYyBiL2FyY2gveDg2L2t2bS9rdm1pX21z
Zy5jCmluZGV4IDE2NTFlZjg3N2UzZS4uMTY4MmJiMjcxMDVmIDEwMDY0NAotLS0gYS9hcmNoL3g4
Ni9rdm0va3ZtaV9tc2cuYworKysgYi9hcmNoL3g4Ni9rdm0va3ZtaV9tc2cuYwpAQCAtMTMyLDcg
KzEzMiwyNiBAQCBzdGF0aWMgaW50IGhhbmRsZV92Y3B1X2dldF9jcHVpZChjb25zdCBzdHJ1Y3Qg
a3ZtaV92Y3B1X21zZ19qb2IgKmpvYiwKIAlyZXR1cm4ga3ZtaV9tc2dfdmNwdV9yZXBseShqb2Is
IG1zZywgZWMsICZycGwsIHNpemVvZihycGwpKTsKIH0KIAorc3RhdGljIGludCBoYW5kbGVfdmNw
dV9jb250cm9sX2NyKGNvbnN0IHN0cnVjdCBrdm1pX3ZjcHVfbXNnX2pvYiAqam9iLAorCQkJCSAg
Y29uc3Qgc3RydWN0IGt2bWlfbXNnX2hkciAqbXNnLAorCQkJCSAgY29uc3Qgdm9pZCAqX3JlcSkK
K3sKKwljb25zdCBzdHJ1Y3Qga3ZtaV92Y3B1X2NvbnRyb2xfY3IgKnJlcSA9IF9yZXE7CisJaW50
IGVjOworCisJaWYgKHJlcS0+cGFkZGluZzEgfHwgcmVxLT5wYWRkaW5nMiB8fCByZXEtPmVuYWJs
ZSA+IDEpCisJCWVjID0gLUtWTV9FSU5WQUw7CisJZWxzZSBpZiAocmVxLT5jciAhPSAwICYmIHJl
cS0+Y3IgIT0gMyAmJiByZXEtPmNyICE9IDQpCisJCWVjID0gLUtWTV9FSU5WQUw7CisJZWxzZQor
CQllYyA9IGt2bWlfYXJjaF9jbWRfdmNwdV9jb250cm9sX2NyKGpvYi0+dmNwdSwgcmVxLT5jciwK
KwkJCQkJCSAgIHJlcS0+ZW5hYmxlID09IDEpOworCisJcmV0dXJuIGt2bWlfbXNnX3ZjcHVfcmVw
bHkoam9iLCBtc2csIGVjLCBOVUxMLCAwKTsKK30KKwogc3RhdGljIGt2bWlfdmNwdV9tc2dfam9i
X2ZjdCBjb25zdCBtc2dfdmNwdVtdID0geworCVtLVk1JX1ZDUFVfQ09OVFJPTF9DUl0gICAgPSBo
YW5kbGVfdmNwdV9jb250cm9sX2NyLAogCVtLVk1JX1ZDUFVfR0VUX0NQVUlEXSAgICAgPSBoYW5k
bGVfdmNwdV9nZXRfY3B1aWQsCiAJW0tWTUlfVkNQVV9HRVRfSU5GT10gICAgICA9IGhhbmRsZV92
Y3B1X2dldF9pbmZvLAogCVtLVk1JX1ZDUFVfR0VUX1JFR0lTVEVSU10gPSBoYW5kbGVfdmNwdV9n
ZXRfcmVnaXN0ZXJzLApAQCAtMTQzLDMgKzE2MiwyOCBAQCBrdm1pX3ZjcHVfbXNnX2pvYl9mY3Qg
a3ZtaV9hcmNoX3ZjcHVfbXNnX2hhbmRsZXIodTE2IGlkKQogewogCXJldHVybiBpZCA8IEFSUkFZ
X1NJWkUobXNnX3ZjcHUpID8gbXNnX3ZjcHVbaWRdIDogTlVMTDsKIH0KKwordTMyIGt2bWlfbXNn
X3NlbmRfY3Ioc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1MzIgY3IsIHU2NCBvbGRfdmFsdWUsCisJ
CSAgICAgdTY0IG5ld192YWx1ZSwgdTY0ICpyZXRfdmFsdWUpCit7CisJc3RydWN0IGt2bWlfdmNw
dV9ldmVudF9jciBlOworCXN0cnVjdCBrdm1pX3ZjcHVfZXZlbnRfY3JfcmVwbHkgcjsKKwl1MzIg
YWN0aW9uOworCWludCBlcnI7CisKKwltZW1zZXQoJmUsIDAsIHNpemVvZihlKSk7CisJZS5jciA9
IGNyOworCWUub2xkX3ZhbHVlID0gb2xkX3ZhbHVlOworCWUubmV3X3ZhbHVlID0gbmV3X3ZhbHVl
OworCisJZXJyID0ga3ZtaV9zZW5kX3ZjcHVfZXZlbnQodmNwdSwgS1ZNSV9WQ1BVX0VWRU5UX0NS
LCAmZSwgc2l6ZW9mKGUpLAorCQkJCSAgICZyLCBzaXplb2YociksICZhY3Rpb24pOworCWlmIChl
cnIpIHsKKwkJYWN0aW9uID0gS1ZNSV9FVkVOVF9BQ1RJT05fQ09OVElOVUU7CisJCSpyZXRfdmFs
dWUgPSBuZXdfdmFsdWU7CisJfSBlbHNlIHsKKwkJKnJldF92YWx1ZSA9IHIubmV3X3ZhbDsKKwl9
CisKKwlyZXR1cm4gYWN0aW9uOworfQpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3ZteC92bXgu
YyBiL2FyY2gveDg2L2t2bS92bXgvdm14LmMKaW5kZXggOWJmYTJlOWY4MTYxLi43MjNlNzg1Mjkx
NDYgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS92bXgvdm14LmMKKysrIGIvYXJjaC94ODYva3Zt
L3ZteC92bXguYwpAQCAtNTA2Miw3ICs1MDYyLDggQEAgc3RhdGljIGludCBoYW5kbGVfY3Ioc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1KQogCQkJZXJyID0gaGFuZGxlX3NldF9jcjAodmNwdSwgdmFsKTsK
IAkJCXJldHVybiBrdm1fY29tcGxldGVfaW5zbl9ncCh2Y3B1LCBlcnIpOwogCQljYXNlIDM6Ci0J
CQlXQVJOX09OX09OQ0UoZW5hYmxlX3VucmVzdHJpY3RlZF9ndWVzdCk7CisJCQlXQVJOX09OX09O
Q0UoZW5hYmxlX3VucmVzdHJpY3RlZF9ndWVzdCAmJgorCQkJCSAgICAgIWt2bWlfY3IzX2ludGVy
Y2VwdGVkKHZjcHUpKTsKIAkJCWVyciA9IGt2bV9zZXRfY3IzKHZjcHUsIHZhbCk7CiAJCQlyZXR1
cm4ga3ZtX2NvbXBsZXRlX2luc25fZ3AodmNwdSwgZXJyKTsKIAkJY2FzZSA0OgpAQCAtNTA5NSw3
ICs1MDk2LDggQEAgc3RhdGljIGludCBoYW5kbGVfY3Ioc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQog
CWNhc2UgMTogLyptb3YgZnJvbSBjciovCiAJCXN3aXRjaCAoY3IpIHsKIAkJY2FzZSAzOgotCQkJ
V0FSTl9PTl9PTkNFKGVuYWJsZV91bnJlc3RyaWN0ZWRfZ3Vlc3QpOworCQkJV0FSTl9PTl9PTkNF
KGVuYWJsZV91bnJlc3RyaWN0ZWRfZ3Vlc3QgJiYKKwkJCQkgICAgICFrdm1pX2NyM19pbnRlcmNl
cHRlZCh2Y3B1KSk7CiAJCQl2YWwgPSBrdm1fcmVhZF9jcjModmNwdSk7CiAJCQlrdm1fcmVnaXN0
ZXJfd3JpdGUodmNwdSwgcmVnLCB2YWwpOwogCQkJdHJhY2Vfa3ZtX2NyX3JlYWQoY3IsIHZhbCk7
CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0veDg2LmMgYi9hcmNoL3g4Ni9rdm0veDg2LmMKaW5k
ZXggODI0ZDlkMjBhNmVhLi45YTRlYzBiNDcxNGMgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS94
ODYuYworKysgYi9hcmNoL3g4Ni9rdm0veDg2LmMKQEAgLTg0OSw2ICs4NDksOSBAQCBpbnQga3Zt
X3NldF9jcjAoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIGNyMCkKIAlpZiAo
IShjcjAgJiBYODZfQ1IwX1BHKSAmJiBrdm1fcmVhZF9jcjRfYml0cyh2Y3B1LCBYODZfQ1I0X1BD
SURFKSkKIAkJcmV0dXJuIDE7CiAKKwlpZiAoIWt2bWlfY3JfZXZlbnQodmNwdSwgMCwgb2xkX2Ny
MCwgJmNyMCkpCisJCXJldHVybiAxOworCiAJa3ZtX3g4Nl9vcHMuc2V0X2NyMCh2Y3B1LCBjcjAp
OwogCiAJaWYgKChjcjAgXiBvbGRfY3IwKSAmIFg4Nl9DUjBfUEcpIHsKQEAgLTEwMTAsNiArMTAx
Myw5IEBAIGludCBrdm1fc2V0X2NyNChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGxv
bmcgY3I0KQogCQkJcmV0dXJuIDE7CiAJfQogCisJaWYgKCFrdm1pX2NyX2V2ZW50KHZjcHUsIDQs
IG9sZF9jcjQsICZjcjQpKQorCQlyZXR1cm4gMTsKKwogCWt2bV94ODZfb3BzLnNldF9jcjQodmNw
dSwgY3I0KTsKIAogCWlmICgoKGNyNCBeIG9sZF9jcjQpICYgbW11X3JvbGVfYml0cykgfHwKQEAg
LTEwMjIsNiArMTAyOCw3IEBAIEVYUE9SVF9TWU1CT0xfR1BMKGt2bV9zZXRfY3I0KTsKIAogaW50
IGt2bV9zZXRfY3IzKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbG9uZyBjcjMpCiB7
CisJdW5zaWduZWQgbG9uZyBvbGRfY3IzID0ga3ZtX3JlYWRfY3IzKHZjcHUpOwogCWJvb2wgc2tp
cF90bGJfZmx1c2ggPSBmYWxzZTsKICNpZmRlZiBDT05GSUdfWDg2XzY0CiAJYm9vbCBwY2lkX2Vu
YWJsZWQgPSBrdm1fcmVhZF9jcjRfYml0cyh2Y3B1LCBYODZfQ1I0X1BDSURFKTsKQEAgLTEwMzIs
NyArMTAzOSw3IEBAIGludCBrdm1fc2V0X2NyMyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2ln
bmVkIGxvbmcgY3IzKQogCX0KICNlbmRpZgogCi0JaWYgKGNyMyA9PSBrdm1fcmVhZF9jcjModmNw
dSkgJiYgIXBkcHRyc19jaGFuZ2VkKHZjcHUpKSB7CisJaWYgKGNyMyA9PSBvbGRfY3IzICYmICFw
ZHB0cnNfY2hhbmdlZCh2Y3B1KSkgewogCQlpZiAoIXNraXBfdGxiX2ZsdXNoKSB7CiAJCQlrdm1f
bW11X3N5bmNfcm9vdHModmNwdSk7CiAJCQlrdm1fbWFrZV9yZXF1ZXN0KEtWTV9SRVFfVExCX0ZM
VVNIX0NVUlJFTlQsIHZjcHUpOwpAQCAtMTA0Nyw2ICsxMDU0LDkgQEAgaW50IGt2bV9zZXRfY3Iz
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbG9uZyBjcjMpCiAJCSAhbG9hZF9wZHB0
cnModmNwdSwgdmNwdS0+YXJjaC53YWxrX21tdSwgY3IzKSkKIAkJcmV0dXJuIDE7CiAKKwlpZiAo
IWt2bWlfY3JfZXZlbnQodmNwdSwgMywgb2xkX2NyMywgJmNyMykpCisJCXJldHVybiAxOworCiAJ
a3ZtX21tdV9uZXdfcGdkKHZjcHUsIGNyMywgc2tpcF90bGJfZmx1c2gsIHNraXBfdGxiX2ZsdXNo
KTsKIAl2Y3B1LT5hcmNoLmNyMyA9IGNyMzsKIAlrdm1fcmVnaXN0ZXJfbWFya19hdmFpbGFibGUo
dmNwdSwgVkNQVV9FWFJFR19DUjMpOwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4L2t2
bWkuaCBiL2luY2x1ZGUvdWFwaS9saW51eC9rdm1pLmgKaW5kZXggOWUyODk2MWE4Mzg3Li5jMWQ4
Y2YwMjAxOGIgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC9rdm1pLmgKKysrIGIvaW5j
bHVkZS91YXBpL2xpbnV4L2t2bWkuaApAQCAtNDEsNiArNDEsNyBAQCBlbnVtIHsKIAlLVk1JX1ZD
UFVfR0VUX1JFR0lTVEVSUyAgPSBLVk1JX1ZDUFVfTUVTU0FHRV9JRCgzKSwKIAlLVk1JX1ZDUFVf
U0VUX1JFR0lTVEVSUyAgPSBLVk1JX1ZDUFVfTUVTU0FHRV9JRCg0KSwKIAlLVk1JX1ZDUFVfR0VU
X0NQVUlEICAgICAgPSBLVk1JX1ZDUFVfTUVTU0FHRV9JRCg1KSwKKwlLVk1JX1ZDUFVfQ09OVFJP
TF9DUiAgICAgPSBLVk1JX1ZDUFVfTUVTU0FHRV9JRCg2KSwKIAogCUtWTUlfTkVYVF9WQ1BVX01F
U1NBR0UKIH07CkBAIC01OCw2ICs1OSw3IEBAIGVudW0gewogCUtWTUlfVkNQVV9FVkVOVF9QQVVT
RSAgICAgID0gS1ZNSV9WQ1BVX0VWRU5UX0lEKDApLAogCUtWTUlfVkNQVV9FVkVOVF9IWVBFUkNB
TEwgID0gS1ZNSV9WQ1BVX0VWRU5UX0lEKDEpLAogCUtWTUlfVkNQVV9FVkVOVF9CUkVBS1BPSU5U
ID0gS1ZNSV9WQ1BVX0VWRU5UX0lEKDIpLAorCUtWTUlfVkNQVV9FVkVOVF9DUiAgICAgICAgID0g
S1ZNSV9WQ1BVX0VWRU5UX0lEKDMpLAogCiAJS1ZNSV9ORVhUX1ZDUFVfRVZFTlQKIH07CmRpZmYg
LS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0veDg2XzY0L2t2bWlfdGVzdC5jIGIv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3g4Nl82NC9rdm1pX3Rlc3QuYwppbmRleCBmOTVm
Mjc3MWExMjMuLjZhMTEwM2VhYjc3YSAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMva3ZtL3g4Nl82NC9rdm1pX3Rlc3QuYworKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9r
dm0veDg2XzY0L2t2bWlfdGVzdC5jCkBAIC01NCw2ICs1NCw3IEBAIHN0cnVjdCB2Y3B1X3dvcmtl
cl9kYXRhIHsKIGVudW0gewogCUdVRVNUX1RFU1RfTk9PUCA9IDAsCiAJR1VFU1RfVEVTVF9CUCwK
KwlHVUVTVF9URVNUX0NSLAogCUdVRVNUX1RFU1RfSFlQRVJDQUxMLAogfTsKIApAQCAtNzcsNiAr
NzgsMTEgQEAgc3RhdGljIHZvaWQgZ3Vlc3RfYnBfdGVzdCh2b2lkKQogCWFzbSB2b2xhdGlsZSgi
aW50MyIpOwogfQogCitzdGF0aWMgdm9pZCBndWVzdF9jcl90ZXN0KHZvaWQpCit7CisJc2V0X2Ny
NChnZXRfY3I0KCkgfCBYODZfQ1I0X09TWFNBVkUpOworfQorCiBzdGF0aWMgdm9pZCBndWVzdF9o
eXBlcmNhbGxfdGVzdCh2b2lkKQogewogCWFzbSB2b2xhdGlsZSgibW92ICQzNCwgJXJheCIpOwpA
QCAtOTQsNiArMTAwLDkgQEAgc3RhdGljIHZvaWQgZ3Vlc3RfY29kZSh2b2lkKQogCQljYXNlIEdV
RVNUX1RFU1RfQlA6CiAJCQlndWVzdF9icF90ZXN0KCk7CiAJCQlicmVhazsKKwkJY2FzZSBHVUVT
VF9URVNUX0NSOgorCQkJZ3Vlc3RfY3JfdGVzdCgpOworCQkJYnJlYWs7CiAJCWNhc2UgR1VFU1Rf
VEVTVF9IWVBFUkNBTEw6CiAJCQlndWVzdF9oeXBlcmNhbGxfdGVzdCgpOwogCQkJYnJlYWs7CkBA
IC0xMTAwLDYgKzExMDksOTYgQEAgc3RhdGljIHZvaWQgdGVzdF9jbWRfdm1fY29udHJvbF9jbGVh
bnVwKHN0cnVjdCBrdm1fdm0gKnZtKQogCWNtZF92bV9jb250cm9sX2NsZWFudXAoZGlzYWJsZSwg
MCk7CiB9CiAKK3N0YXRpYyB2b2lkIGNtZF92Y3B1X2NvbnRyb2xfY3Ioc3RydWN0IGt2bV92bSAq
dm0sIF9fdTggY3IsIF9fdTggZW5hYmxlLAorCQkJCWludCBleHBlY3RlZF9lcnIpCit7CisJc3Ry
dWN0IHsKKwkJc3RydWN0IGt2bWlfbXNnX2hkciBoZHI7CisJCXN0cnVjdCBrdm1pX3ZjcHVfaGRy
IHZjcHVfaGRyOworCQlzdHJ1Y3Qga3ZtaV92Y3B1X2NvbnRyb2xfY3IgY21kOworCX0gcmVxID0g
e307CisKKwlyZXEuY21kLmNyID0gY3I7CisJcmVxLmNtZC5lbmFibGUgPSBlbmFibGU7CisKKwl0
ZXN0X3ZjcHUwX2NvbW1hbmQodm0sIEtWTUlfVkNQVV9DT05UUk9MX0NSLCAmcmVxLmhkciwgc2l6
ZW9mKHJlcSksCisJCQkgICBOVUxMLCAwLCBleHBlY3RlZF9lcnIpOworfQorCitzdGF0aWMgdm9p
ZCBlbmFibGVfY3JfZXZlbnRzKHN0cnVjdCBrdm1fdm0gKnZtLCBfX3U4IGNyKQoreworCWVuYWJs
ZV92Y3B1X2V2ZW50KHZtLCBLVk1JX1ZDUFVfRVZFTlRfQ1IpOworCisJY21kX3ZjcHVfY29udHJv
bF9jcih2bSwgY3IsIDEsIDApOworfQorCitzdGF0aWMgdm9pZCBkaXNhYmxlX2NyX2V2ZW50cyhz
dHJ1Y3Qga3ZtX3ZtICp2bSwgX191OCBjcikKK3sKKwljbWRfdmNwdV9jb250cm9sX2NyKHZtLCBj
ciwgMCwgMCk7CisKKwlkaXNhYmxlX3ZjcHVfZXZlbnQodm0sIEtWTUlfVkNQVV9FVkVOVF9DUik7
Cit9CisKK3N0YXRpYyB2b2lkIHRlc3RfaW52YWxpZF92Y3B1X2NvbnRyb2xfY3Ioc3RydWN0IGt2
bV92bSAqdm0pCit7CisJX191OCBlbmFibGUgPSAxLCBlbmFibGVfaW52YWwgPSAyOworCV9fdTgg
Y3JfaW52YWwgPSA5OSwgY3IgPSAwOworCisJY21kX3ZjcHVfY29udHJvbF9jcih2bSwgY3IsICAg
ICAgIGVuYWJsZV9pbnZhbCwgLUtWTV9FSU5WQUwpOworCWNtZF92Y3B1X2NvbnRyb2xfY3Iodm0s
IGNyX2ludmFsLCBlbmFibGUsICAgICAgIC1LVk1fRUlOVkFMKTsKK30KKworc3RhdGljIHZvaWQg
dGVzdF9jbWRfdmNwdV9jb250cm9sX2NyKHN0cnVjdCBrdm1fdm0gKnZtKQoreworCXN0cnVjdCB2
Y3B1X3dvcmtlcl9kYXRhIGRhdGEgPSB7CisJCS52bSA9IHZtLAorCQkudmNwdV9pZCA9IFZDUFVf
SUQsCisJCS50ZXN0X2lkID0gR1VFU1RfVEVTVF9DUiwKKwl9OworCXN0cnVjdCBrdm1pX21zZ19o
ZHIgaGRyOworCXN0cnVjdCB7CisJCXN0cnVjdCB2Y3B1X2V2ZW50IHZjcHVfZXY7CisJCXN0cnVj
dCBrdm1pX3ZjcHVfZXZlbnRfY3IgY3I7CisJfSBldjsKKwlzdHJ1Y3QgeworCQlzdHJ1Y3QgdmNw
dV9yZXBseSBjb21tb247CisJCXN0cnVjdCBrdm1pX3ZjcHVfZXZlbnRfY3JfcmVwbHkgY3I7CisJ
fSBycGwgPSB7fTsKKwlfX3UxNiBldmVudF9pZCA9IEtWTUlfVkNQVV9FVkVOVF9DUjsKKwlfX3U4
IGNyX25vID0gNDsKKwlzdHJ1Y3Qga3ZtX3NyZWdzIHNyZWdzOworCXB0aHJlYWRfdCB2Y3B1X3Ro
cmVhZDsKKworCWVuYWJsZV9jcl9ldmVudHModm0sIGNyX25vKTsKKworCXZjcHVfdGhyZWFkID0g
c3RhcnRfdmNwdV93b3JrZXIoJmRhdGEpOworCisJcmVjZWl2ZV92Y3B1X2V2ZW50KCZoZHIsICZl
di52Y3B1X2V2LCBzaXplb2YoZXYpLCBldmVudF9pZCk7CisKKwlwcl9kZWJ1ZygiQ1IldSwgb2xk
IDB4JWxseCwgbmV3IDB4JWxseFxuIiwKKwkJIGV2LmNyLmNyLCBldi5jci5vbGRfdmFsdWUsIGV2
LmNyLm5ld192YWx1ZSk7CisKKwlURVNUX0FTU0VSVChldi5jci5jciA9PSBjcl9ubywKKwkJIlVu
ZXhwZWN0ZWQgQ1IgZXZlbnQsIHJlY2VpdmVkIENSJXUsIGV4cGVjdGVkIENSJXUiLAorCQlldi5j
ci5jciwgY3Jfbm8pOworCisJcnBsLmNyLm5ld192YWwgPSBldi5jci5vbGRfdmFsdWU7CisKKwly
ZXBseV90b19ldmVudCgmaGRyLCAmZXYudmNwdV9ldiwgS1ZNSV9FVkVOVF9BQ1RJT05fQ09OVElO
VUUsCisJCSAgICAgICAmcnBsLmNvbW1vbiwgc2l6ZW9mKHJwbCkpOworCisJd2FpdF92Y3B1X3dv
cmtlcih2Y3B1X3RocmVhZCk7CisKKwlkaXNhYmxlX2NyX2V2ZW50cyh2bSwgY3Jfbm8pOworCisJ
dmNwdV9zcmVnc19nZXQodm0sIFZDUFVfSUQsICZzcmVncyk7CisJVEVTVF9BU1NFUlQoc3JlZ3Mu
Y3I0ID09IGV2LmNyLm9sZF92YWx1ZSwKKwkJIkZhaWxlZCB0byBibG9jayBDUjQgdXBkYXRlLCBD
UjQgMHglbGx4LCBleHBlY3RlZCAweCVsbHgiLAorCQlzcmVncy5jcjQsIGV2LmNyLm9sZF92YWx1
ZSk7CisKKwl0ZXN0X2ludmFsaWRfdmNwdV9jb250cm9sX2NyKHZtKTsKK30KKwogc3RhdGljIHZv
aWQgdGVzdF9pbnRyb3NwZWN0aW9uKHN0cnVjdCBrdm1fdm0gKnZtKQogewogCXNyYW5kb20odGlt
ZSgwKSk7CkBAIC0xMTIzLDYgKzEyMjIsNyBAQCBzdGF0aWMgdm9pZCB0ZXN0X2ludHJvc3BlY3Rp
b24oc3RydWN0IGt2bV92bSAqdm0pCiAJdGVzdF9ldmVudF9oeXBlcmNhbGwodm0pOwogCXRlc3Rf
ZXZlbnRfYnJlYWtwb2ludCh2bSk7CiAJdGVzdF9jbWRfdm1fY29udHJvbF9jbGVhbnVwKHZtKTsK
Kwl0ZXN0X2NtZF92Y3B1X2NvbnRyb2xfY3Iodm0pOwogCiAJdW5ob29rX2ludHJvc3BlY3Rpb24o
dm0pOwogfQpkaWZmIC0tZ2l0IGEvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX2ludC5oIGIv
dmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX2ludC5oCmluZGV4IDhhMjY2YjA1ODE1NS4uYjE4
NzdhNzcwZmNiIDEwMDY0NAotLS0gYS92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfaW50LmgK
KysrIGIvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX2ludC5oCkBAIC02OSw2ICs2OSw4IEBA
IGludCBrdm1pX2FkZF9qb2Ioc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogdm9pZCBrdm1pX3J1bl9q
b2JzKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7CiB2b2lkIGt2bWlfaGFuZGxlX2NvbW1vbl9ldmVu
dF9hY3Rpb25zKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdTMyIGFjdGlvbik7CiB2b2lkIGt2bWlf
Y21kX3ZtX2NvbnRyb2xfY2xlYW51cChzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2bWksIGJv
b2wgZW5hYmxlKTsKK3N0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqIF9fbXVzdF9jaGVjayBrdm1p
X2dldChzdHJ1Y3Qga3ZtICprdm0pOwordm9pZCBrdm1pX3B1dChzdHJ1Y3Qga3ZtICprdm0pOwog
aW50IGt2bWlfY21kX3ZtX2NvbnRyb2xfZXZlbnRzKHN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAq
a3ZtaSwKIAkJCSAgICAgICB1MTYgZXZlbnRfaWQsIGJvb2wgZW5hYmxlKTsKIGludCBrdm1pX2Nt
ZF92Y3B1X2NvbnRyb2xfZXZlbnRzKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGlu
ZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8v
bGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
