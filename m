Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AA1424540
	for <lists.virtualization@lfdr.de>; Wed,  6 Oct 2021 19:51:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 566A740D99;
	Wed,  6 Oct 2021 17:50:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yulykBGfHL2t; Wed,  6 Oct 2021 17:50:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 291A14094A;
	Wed,  6 Oct 2021 17:50:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 517F8C000D;
	Wed,  6 Oct 2021 17:50:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 15B0DC002F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 17:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52433407D4
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 17:50:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KYLccT9imwzY
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 17:50:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C5BB40120
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 17:50:42 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 A14503082886; Wed,  6 Oct 2021 20:31:21 +0300 (EEST)
Received: from localhost (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 8655B3064495;
 Wed,  6 Oct 2021 20:31:21 +0300 (EEST)
X-Is-Junk-Enabled: fGZTSsP0qEJE2AIKtlSuFiRRwg9xyHmJ
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v12 66/77] KVM: introspection: add KVMI_VCPU_EVENT_DESCRIPTOR
Date: Wed,  6 Oct 2021 20:31:02 +0300
Message-Id: <20211006173113.26445-67-alazar@bitdefender.com>
In-Reply-To: <20211006173113.26445-1-alazar@bitdefender.com>
References: <20211006173113.26445-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wanpeng Li <wanpengli@tencent.com>,
 =?UTF-8?q?Nicu=C8=99or=20C=C3=AE=C8=9Bu?= <nicu.citu@icloud.com>,
 Sean Christopherson <seanjc@google.com>, Joerg Roedel <joro@8bytes.org>,
 virtualization@lists.linux-foundation.org,
 =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Mathieu Tarral <mathieu.tarral@protonmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jim Mattson <jmattson@google.com>
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

RnJvbTogTmljdciZb3IgQ8OuyJt1IDxuaWN1LmNpdHVAaWNsb3VkLmNvbT4KClRoaXMgZXZlbnQg
aXMgc2VudCB3aGVuIElEVFIsIEdEVFIsIExEVFIgb3IgVFIgYXJlIGFjY2Vzc2VkLgoKVGhlc2Ug
Y291bGQgYmUgdXNlZCB0byBpbXBsZW1lbnQgYSB0aW55IGFnZW50IHdoaWNoIHJ1bnMgaW4gdGhl
IGNvbnRleHQKb2YgYW4gaW50cm9zcGVjdGVkIGd1ZXN0IGFuZCB1c2VzIHZpcnR1YWxpemVkIGV4
Y2VwdGlvbnMgKCNWRSkgYW5kCmFsdGVybmF0ZSBFUFQgdmlld3MgKFZNRlVOQyAjMCkgdG8gZmls
dGVyIGNvbnZlcnRlZCBWTUVYSVRTLiBUaGUgZXZlbnRzCm9mIGludGVyZXN0ZWQgd2lsbCBiZSBz
dXBwcmVzc2VkIChhZnRlciBzb21lIGFwcHJvcHJpYXRlIGd1ZXN0LXNpZGUKaGFuZGxpbmcpIHdo
aWxlIHRoZSByZXN0IHdpbGwgYmUgc2VudCB0byB0aGUgaW50cm9zcGVjdG9yIHZpYSBhIFZNQ0FM
TC4KClNpZ25lZC1vZmYtYnk6IE5pY3XImW9yIEPDrsibdSA8bmljdS5jaXR1QGljbG91ZC5jb20+
CkNvLWRldmVsb3BlZC1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29t
PgpTaWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+
Ci0tLQogRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJzdCAgICAgICAgICAgICAgIHwgNDMg
KysrKysrKysrKysKIGFyY2gveDg2L2luY2x1ZGUvYXNtL2t2bWlfaG9zdC5oICAgICAgICAgICAg
ICB8ICAzICsKIGFyY2gveDg2L2luY2x1ZGUvdWFwaS9hc20va3ZtaS5oICAgICAgICAgICAgICB8
IDEzICsrKysKIGFyY2gveDg2L2t2bS9rdm1pLmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8
IDU4ICsrKysrKysrKysrKysrCiBhcmNoL3g4Ni9rdm0va3ZtaS5oICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgMSArCiBhcmNoL3g4Ni9rdm0va3ZtaV9tc2cuYyAgICAgICAgICAgICAgICAg
ICAgICAgfCAxOSArKysrKwogYXJjaC94ODYva3ZtL3N2bS9zdm0uYyAgICAgICAgICAgICAgICAg
ICAgICAgIHwgMzUgKysrKysrKysrCiBhcmNoL3g4Ni9rdm0vdm14L3ZteC5jICAgICAgICAgICAg
ICAgICAgICAgICAgfCAyMSArKysrKysKIGluY2x1ZGUvdWFwaS9saW51eC9rdm1pLmggICAgICAg
ICAgICAgICAgICAgICB8ICAxICsKIC4uLi90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0veDg2XzY0L2t2
bWlfdGVzdC5jICB8IDc1ICsrKysrKysrKysrKysrKysrKysKIDEwIGZpbGVzIGNoYW5nZWQsIDI2
OSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9rdm1p
LnJzdCBiL0RvY3VtZW50YXRpb24vdmlydC9rdm0va3ZtaS5yc3QKaW5kZXggZDYwYTY5ZTAwZTBm
Li5lMjRhOTNlOTNmZTggMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vdmlydC9rdm0va3ZtaS5y
c3QKKysrIGIvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJzdApAQCAtNTQwLDYgKzU0MCw3
IEBAIHRoZSBmb2xsb3dpbmcgZXZlbnRzOjoKIAogCUtWTUlfVkNQVV9FVkVOVF9CUkVBS1BPSU5U
CiAJS1ZNSV9WQ1BVX0VWRU5UX0NSCisJS1ZNSV9WQ1BVX0VWRU5UX0RFU0NSSVBUT1IKIAlLVk1J
X1ZDUFVfRVZFTlRfSFlQRVJDQUxMCiAJS1ZNSV9WQ1BVX0VWRU5UX1hTRVRCVgogCkBAIC01NjMs
NiArNTY0LDggQEAgdGhlICpLVk1JX1ZNX0NPTlRST0xfRVZFTlRTKiBjb21tYW5kLgogKiAtS1ZN
X0VJTlZBTCAtIHRoZSBldmVudCBJRCBpcyB1bmtub3duICh1c2UgKktWTUlfVk1fQ0hFQ0tfRVZF
TlQqIGZpcnN0KQogKiAtS1ZNX0VQRVJNIC0gdGhlIGFjY2VzcyBpcyBkaXNhbGxvd2VkICh1c2Ug
KktWTUlfVk1fQ0hFQ0tfRVZFTlQqIGZpcnN0KQogKiAtS1ZNX0VBR0FJTiAtIHRoZSBzZWxlY3Rl
ZCB2Q1BVIGNhbid0IGJlIGludHJvc3BlY3RlZCB5ZXQKKyogLUtWTV9FT1BOT1RTVVBQIC0gdGhl
IGV2ZW50IGNhbid0IGJlIGludGVyY2VwdGVkIGluIHRoZSBjdXJyZW50IHNldHVwCisgICAgICAg
ICAgICAgICAgICAgIChlLmcuIEtWTUlfVkNQVV9FVkVOVF9ERVNDUklQVE9SIHdpdGggQU1EKQog
KiAtS1ZNX0VCVVNZIC0gdGhlIGV2ZW50IGNhbid0IGJlIGludGVyY2VwdGVkIHJpZ2h0IG5vdwog
ICAgICAgICAgICAgICAgKGUuZy4gS1ZNSV9WQ1BVX0VWRU5UX0JSRUFLUE9JTlQgaWYgdGhlICNC
UCBldmVudAogICAgICAgICAgICAgICAgIGlzIGFscmVhZHkgaW50ZXJjZXB0ZWQgYnkgdXNlcnNw
YWNlKQpAQCAtMTE5OCwzICsxMjAxLDQzIEBAIHRvIGJlIGNoYW5nZWQgYW5kIHRoZSBpbnRyb3Nw
ZWN0aW9uIGhhcyBiZWVuIGVuYWJsZWQgZm9yIHRoaXMgZXZlbnQKIGBga3ZtaV92Y3B1X2V2ZW50
YGAgKHdpdGggdGhlIHZDUFUgc3RhdGUpLCB0aGUgZXh0ZW5kZWQgY29udHJvbCByZWdpc3Rlcgog
bnVtYmVyIChgYHhjcmBgKSwgdGhlIG9sZCB2YWx1ZSAoYGBvbGRfdmFsdWVgYCkgYW5kIHRoZSBu
ZXcgdmFsdWUKIChgYG5ld192YWx1ZWBgKSBhcmUgc2VudCB0byB0aGUgaW50cm9zcGVjdGlvbiB0
b29sLgorCis4LiBLVk1JX1ZDUFVfRVZFTlRfREVTQ1JJUFRPUgorLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KKworOkFyY2hpdGVjdHVyZXM6IHg4NgorOlZlcnNpb25zOiA+PSAxCis6QWN0
aW9uczogQ09OVElOVUUsIFJFVFJZLCBDUkFTSAorOlBhcmFtZXRlcnM6CisKKzo6CisKKwlzdHJ1
Y3Qga3ZtaV92Y3B1X2V2ZW50OworCXN0cnVjdCBrdm1pX3ZjcHVfZXZlbnRfZGVzY3JpcHRvciB7
CisJCV9fdTggZGVzY3JpcHRvcjsKKwkJX191OCB3cml0ZTsKKwkJX191OCBwYWRkaW5nWzZdOwor
CX07CisKKzpSZXR1cm5zOgorCis6OgorCisJc3RydWN0IGt2bWlfdmNwdV9oZHI7CisJc3RydWN0
IGt2bWlfdmNwdV9ldmVudF9yZXBseTsKKworVGhpcyBldmVudCBpcyBzZW50IHdoZW4gYSBkZXNj
cmlwdG9yIHRhYmxlIHJlZ2lzdGVyIGlzIGFjY2Vzc2VkIGFuZCB0aGUKK2ludHJvc3BlY3Rpb24g
aGFzIGJlZW4gZW5hYmxlZCBmb3IgdGhpcyBldmVudCAoc2VlICoqS1ZNSV9WQ1BVX0NPTlRST0xf
RVZFTlRTKiopLgorCitgYGt2bWlfdmNwdV9ldmVudGBgICh3aXRoIHRoZSB2Q1BVIHN0YXRlKSwg
dGhlIGRlc2NyaXB0b3ItdGFibGUgcmVnaXN0ZXIKKyhgYGRlc2NyaXB0b3JgYCkgYW5kIHRoZSBh
Y2Nlc3MgdHlwZSAoYGB3cml0ZWBgKSBhcmUgc2VudCB0byB0aGUKK2ludHJvc3BlY3Rpb24gdG9v
bC4KKworYGBkZXNjcmlwdG9yYGAgY2FuIGJlIG9uZSBvZjo6CisKKwlLVk1JX0RFU0NfSURUUgor
CUtWTUlfREVTQ19HRFRSCisJS1ZNSV9ERVNDX0xEVFIKKwlLVk1JX0RFU0NfVFIKKworYGB3cml0
ZWBgIGlzIDEgaWYgdGhlIGRlc2NyaXB0b3Igd2FzIHdyaXR0ZW4sIDAgb3RoZXJ3aXNlLgpkaWZm
IC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtaV9ob3N0LmggYi9hcmNoL3g4Ni9pbmNs
dWRlL2FzbS9rdm1pX2hvc3QuaAppbmRleCBkNjYzNDkyMDhhNmIuLmEyNGJhODcwMzZmNyAxMDA2
NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtaV9ob3N0LmgKKysrIGIvYXJjaC94ODYv
aW5jbHVkZS9hc20va3ZtaV9ob3N0LmgKQEAgLTQ4LDYgKzQ4LDcgQEAgYm9vbCBrdm1pX21vbml0
b3JfY3Izd19pbnRlcmNlcHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBib29sIGVuYWJsZSk7CiB2
b2lkIGt2bWlfZW50ZXJfZ3Vlc3Qoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIHZvaWQga3ZtaV94
c2V0YnZfZXZlbnQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1OCB4Y3IsCiAJCSAgICAgICB1NjQg
b2xkX3ZhbHVlLCB1NjQgbmV3X3ZhbHVlKTsKK2Jvb2wga3ZtaV9kZXNjcmlwdG9yX2V2ZW50KHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwgdTggZGVzY3JpcHRvciwgYm9vbCB3cml0ZSk7CiAKICNlbHNl
IC8qIENPTkZJR19LVk1fSU5UUk9TUEVDVElPTiAqLwogCkBAIC02Myw2ICs2NCw4IEBAIHN0YXRp
YyBpbmxpbmUgYm9vbCBrdm1pX21vbml0b3JfY3Izd19pbnRlcmNlcHQoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LAogc3RhdGljIGlubGluZSB2b2lkIGt2bWlfZW50ZXJfZ3Vlc3Qoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1KSB7IH0KIHN0YXRpYyBpbmxpbmUgdm9pZCBrdm1pX3hzZXRidl9ldmVudChzdHJ1
Y3Qga3ZtX3ZjcHUgKnZjcHUsIHU4IHhjciwKIAkJCQkJdTY0IG9sZF92YWx1ZSwgdTY0IG5ld192
YWx1ZSkgeyB9CitzdGF0aWMgaW5saW5lIGJvb2wga3ZtaV9kZXNjcmlwdG9yX2V2ZW50KHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSwgdTggZGVzY3JpcHRvciwKKwkJCQkJIGJvb2wgd3JpdGUpIHsgcmV0
dXJuIHRydWU7IH0KIAogI2VuZGlmIC8qIENPTkZJR19LVk1fSU5UUk9TUEVDVElPTiAqLwogCmRp
ZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL2t2bWkuaCBiL2FyY2gveDg2L2lu
Y2x1ZGUvdWFwaS9hc20va3ZtaS5oCmluZGV4IDdiOTM0NTBkMGQ2Mi4uOWM2MDhlZjVkYWEzIDEw
MDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL2t2bWkuaAorKysgYi9hcmNoL3g4
Ni9pbmNsdWRlL3VhcGkvYXNtL2t2bWkuaApAQCAtMTI4LDQgKzEyOCwxNyBAQCBzdHJ1Y3Qga3Zt
aV92Y3B1X2dldF9tdHJyX3R5cGVfcmVwbHkgewogCV9fdTggcGFkZGluZ1s3XTsKIH07CiAKK2Vu
dW0geworCUtWTUlfREVTQ19JRFRSID0gMSwKKwlLVk1JX0RFU0NfR0RUUiA9IDIsCisJS1ZNSV9E
RVNDX0xEVFIgPSAzLAorCUtWTUlfREVTQ19UUiAgID0gNCwKK307CisKK3N0cnVjdCBrdm1pX3Zj
cHVfZXZlbnRfZGVzY3JpcHRvciB7CisJX191OCBkZXNjcmlwdG9yOworCV9fdTggd3JpdGU7CisJ
X191OCBwYWRkaW5nWzZdOworfTsKKwogI2VuZGlmIC8qIF9VQVBJX0FTTV9YODZfS1ZNSV9IICov
CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0va3ZtaS5jIGIvYXJjaC94ODYva3ZtL2t2bWkuYwpp
bmRleCBkMzRmNWYwM2E1NmYuLmNmNzE2NzM2NjIxNCAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3Zt
L2t2bWkuYworKysgYi9hcmNoL3g4Ni9rdm0va3ZtaS5jCkBAIC0xNSw2ICsxNSw3IEBAIHZvaWQg
a3ZtaV9hcmNoX2luaXRfdmNwdV9ldmVudHNfbWFzayh1bnNpZ25lZCBsb25nICpzdXBwb3J0ZWQp
CiAJc2V0X2JpdChLVk1JX1ZDUFVfRVZFTlRfQlJFQUtQT0lOVCwgc3VwcG9ydGVkKTsKIAlzZXRf
Yml0KEtWTUlfVkNQVV9FVkVOVF9DUiwgc3VwcG9ydGVkKTsKIAlzZXRfYml0KEtWTUlfVkNQVV9F
VkVOVF9IWVBFUkNBTEwsIHN1cHBvcnRlZCk7CisJc2V0X2JpdChLVk1JX1ZDUFVfRVZFTlRfREVT
Q1JJUFRPUiwgc3VwcG9ydGVkKTsKIAlzZXRfYml0KEtWTUlfVkNQVV9FVkVOVF9UUkFQLCBzdXBw
b3J0ZWQpOwogCXNldF9iaXQoS1ZNSV9WQ1BVX0VWRU5UX1hTRVRCViwgc3VwcG9ydGVkKTsKIH0K
QEAgLTI4NSw2ICsyODYsMjEgQEAgc3RhdGljIHZvaWQga3ZtaV9hcmNoX2Rpc2FibGVfY3Izd19p
bnRlcmNlcHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogCXZjcHUtPmFyY2gua3ZtaS0+Y3Izdy5r
dm1faW50ZXJjZXB0ZWQgPSBmYWxzZTsKIH0KIAorc3RhdGljIGludCBrdm1pX2NvbnRyb2xfZGVz
Y19pbnRlcmNlcHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBib29sIGVuYWJsZSkKK3sKKwlpZiAo
IXN0YXRpY19jYWxsKGt2bV94ODZfZGVzY19jdHJsX3N1cHBvcnRlZCkoKSkKKwkJcmV0dXJuIC1L
Vk1fRU9QTk9UU1VQUDsKKworCXN0YXRpY19jYWxsKGt2bV94ODZfY29udHJvbF9kZXNjX2ludGVy
Y2VwdCkodmNwdSwgZW5hYmxlKTsKKworCXJldHVybiAwOworfQorCitzdGF0aWMgdm9pZCBrdm1p
X2FyY2hfZGlzYWJsZV9kZXNjX2ludGVyY2VwdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCit7CisJ
a3ZtaV9jb250cm9sX2Rlc2NfaW50ZXJjZXB0KHZjcHUsIGZhbHNlKTsKK30KKwogaW50IGt2bWlf
YXJjaF9jbWRfY29udHJvbF9pbnRlcmNlcHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCQkJCSAg
ICB1bnNpZ25lZCBpbnQgZXZlbnRfaWQsIGJvb2wgZW5hYmxlKQogewpAQCAtMjk0LDYgKzMxMCw5
IEBAIGludCBrdm1pX2FyY2hfY21kX2NvbnRyb2xfaW50ZXJjZXB0KHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSwKIAljYXNlIEtWTUlfVkNQVV9FVkVOVF9CUkVBS1BPSU5UOgogCQllcnIgPSBrdm1pX2Nv
bnRyb2xfYnBfaW50ZXJjZXB0KHZjcHUsIGVuYWJsZSk7CiAJCWJyZWFrOworCWNhc2UgS1ZNSV9W
Q1BVX0VWRU5UX0RFU0NSSVBUT1I6CisJCWVyciA9IGt2bWlfY29udHJvbF9kZXNjX2ludGVyY2Vw
dCh2Y3B1LCBlbmFibGUpOworCQlicmVhazsKIAlkZWZhdWx0OgogCQlicmVhazsKIAl9CkBAIC0z
MjUsNiArMzQ0LDcgQEAgc3RhdGljIHZvaWQga3ZtaV9hcmNoX3Jlc3RvcmVfaW50ZXJjZXB0aW9u
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIHsKIAlrdm1pX2FyY2hfZGlzYWJsZV9icF9pbnRlcmNl
cHQodmNwdSk7CiAJa3ZtaV9hcmNoX2Rpc2FibGVfY3Izd19pbnRlcmNlcHQodmNwdSk7CisJa3Zt
aV9hcmNoX2Rpc2FibGVfZGVzY19pbnRlcmNlcHQodmNwdSk7CiB9CiAKIGJvb2wga3ZtaV9hcmNo
X2NsZWFuX3VwX2ludGVyY2VwdGlvbihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCkBAIC01OTcsMyAr
NjE3LDQxIEBAIHZvaWQga3ZtaV94c2V0YnZfZXZlbnQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1
OCB4Y3IsCiAKIAlrdm1pX3B1dCh2Y3B1LT5rdm0pOwogfQorCitzdGF0aWMgYm9vbCBfX2t2bWlf
ZGVzY3JpcHRvcl9ldmVudChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHU4IGRlc2NyaXB0b3IsCisJ
CQkJICAgIGJvb2wgd3JpdGUpCit7CisJYm9vbCByZXQgPSBmYWxzZTsKKwl1MzIgYWN0aW9uOwor
CisJYWN0aW9uID0ga3ZtaV9tc2dfc2VuZF92Y3B1X2Rlc2NyaXB0b3IodmNwdSwgZGVzY3JpcHRv
ciwgd3JpdGUpOworCXN3aXRjaCAoYWN0aW9uKSB7CisJY2FzZSBLVk1JX0VWRU5UX0FDVElPTl9D
T05USU5VRToKKwkJcmV0ID0gdHJ1ZTsKKwkJYnJlYWs7CisJY2FzZSBLVk1JX0VWRU5UX0FDVElP
Tl9SRVRSWToKKwkJYnJlYWs7CisJZGVmYXVsdDoKKwkJa3ZtaV9oYW5kbGVfY29tbW9uX2V2ZW50
X2FjdGlvbnModmNwdSwgYWN0aW9uKTsKKwl9CisKKwlyZXR1cm4gcmV0OworfQorCitib29sIGt2
bWlfZGVzY3JpcHRvcl9ldmVudChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHU4IGRlc2NyaXB0b3Is
IGJvb2wgd3JpdGUpCit7CisJc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uICprdm1pOworCWJvb2wg
cmV0ID0gdHJ1ZTsKKworCWt2bWkgPSBrdm1pX2dldCh2Y3B1LT5rdm0pOworCWlmICgha3ZtaSkK
KwkJcmV0dXJuIHRydWU7CisKKwlpZiAoaXNfdmNwdV9ldmVudF9lbmFibGVkKHZjcHUsIEtWTUlf
VkNQVV9FVkVOVF9ERVNDUklQVE9SKSkKKwkJcmV0ID0gX19rdm1pX2Rlc2NyaXB0b3JfZXZlbnQo
dmNwdSwgZGVzY3JpcHRvciwgd3JpdGUpOworCisJa3ZtaV9wdXQodmNwdS0+a3ZtKTsKKworCXJl
dHVybiByZXQ7Cit9CitFWFBPUlRfU1lNQk9MKGt2bWlfZGVzY3JpcHRvcl9ldmVudCk7CmRpZmYg
LS1naXQgYS9hcmNoL3g4Ni9rdm0va3ZtaS5oIGIvYXJjaC94ODYva3ZtL2t2bWkuaAppbmRleCA0
M2JjOTU2ZDc0MGMuLjkyNDIyZTJlNTdjZiAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL2t2bWku
aAorKysgYi9hcmNoL3g4Ni9rdm0va3ZtaS5oCkBAIC0xNiw1ICsxNiw2IEBAIHUzMiBrdm1pX21z
Z19zZW5kX3ZjcHVfY3Ioc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1MzIgY3IsIHU2NCBvbGRfdmFs
dWUsCiB1MzIga3ZtaV9tc2dfc2VuZF92Y3B1X3RyYXAoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsK
IHUzMiBrdm1pX21zZ19zZW5kX3ZjcHVfeHNldGJ2KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdTgg
eGNyLAogCQkJICAgICAgdTY0IG9sZF92YWx1ZSwgdTY0IG5ld192YWx1ZSk7Cit1MzIga3ZtaV9t
c2dfc2VuZF92Y3B1X2Rlc2NyaXB0b3Ioc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1OCBkZXNjLCBi
b29sIHdyaXRlKTsKIAogI2VuZGlmCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0va3ZtaV9tc2cu
YyBiL2FyY2gveDg2L2t2bS9rdm1pX21zZy5jCmluZGV4IGM4OTBjMjM5NmZiYy4uYjc0ZGYzZmM4
MzJkIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0va3ZtaV9tc2cuYworKysgYi9hcmNoL3g4Ni9r
dm0va3ZtaV9tc2cuYwpAQCAtMzMwLDMgKzMzMCwyMiBAQCB1MzIga3ZtaV9tc2dfc2VuZF92Y3B1
X3hzZXRidihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHU4IHhjciwKIAogCXJldHVybiBhY3Rpb247
CiB9CisKK3UzMiBrdm1pX21zZ19zZW5kX3ZjcHVfZGVzY3JpcHRvcihzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUsIHU4IGRlc2MsIGJvb2wgd3JpdGUpCit7CisJc3RydWN0IGt2bWlfdmNwdV9ldmVudF9k
ZXNjcmlwdG9yIGU7CisJdTMyIGFjdGlvbjsKKwlpbnQgZXJyOworCisJbWVtc2V0KCZlLCAwLCBz
aXplb2YoZSkpOworCWUuZGVzY3JpcHRvciA9IGRlc2M7CisJZS53cml0ZSA9IHdyaXRlID8gMSA6
IDA7CisKKwllcnIgPSBrdm1pX3NlbmRfdmNwdV9ldmVudCh2Y3B1LCBLVk1JX1ZDUFVfRVZFTlRf
REVTQ1JJUFRPUiwKKwkJCQkgICAmZSwgc2l6ZW9mKGUpLCBOVUxMLCAwLCAmYWN0aW9uKTsKKwlp
ZiAoZXJyKQorCQlhY3Rpb24gPSBLVk1JX0VWRU5UX0FDVElPTl9DT05USU5VRTsKKworCXJldHVy
biBhY3Rpb247CisKK30KZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9zdm0vc3ZtLmMgYi9hcmNo
L3g4Ni9rdm0vc3ZtL3N2bS5jCmluZGV4IDczNTM5OTY5MDdkMy4uOThiNDkwOTI1NGEwIDEwMDY0
NAotLS0gYS9hcmNoL3g4Ni9rdm0vc3ZtL3N2bS5jCisrKyBiL2FyY2gveDg2L2t2bS9zdm0vc3Zt
LmMKQEAgLTI2NDIsNiArMjY0Miw0MSBAQCBzdGF0aWMgaW50IGVtdWxhdGVfb25faW50ZXJjZXB0
aW9uKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIAogc3RhdGljIGludCBkZXNjcmlwdG9yX2FjY2Vz
c19pbnRlcmNlcHRpb24oc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogeworCXN0cnVjdCB2Y3B1X3N2
bSAqc3ZtID0gdG9fc3ZtKHZjcHUpOworCisjaWZkZWYgQ09ORklHX0tWTV9JTlRST1NQRUNUSU9O
CisJc3RydWN0IHZtY2JfY29udHJvbF9hcmVhICpjID0gJnN2bS0+dm1jYi0+Y29udHJvbDsKKwli
b29sIGNvbnQ7CisKKwlzd2l0Y2ggKGMtPmV4aXRfY29kZSkgeworCWNhc2UgU1ZNX0VYSVRfSURU
Ul9SRUFEOgorCWNhc2UgU1ZNX0VYSVRfSURUUl9XUklURToKKwkJY29udCA9IGt2bWlfZGVzY3Jp
cHRvcl9ldmVudCh2Y3B1LCBLVk1JX0RFU0NfSURUUiwKKwkJCQkgICAgICBjLT5leGl0X2NvZGUg
PT0gU1ZNX0VYSVRfSURUUl9XUklURSk7CisJCWJyZWFrOworCWNhc2UgU1ZNX0VYSVRfR0RUUl9S
RUFEOgorCWNhc2UgU1ZNX0VYSVRfR0RUUl9XUklURToKKwkJY29udCA9IGt2bWlfZGVzY3JpcHRv
cl9ldmVudCh2Y3B1LCBLVk1JX0RFU0NfR0RUUiwKKwkJCQkgICAgICBjLT5leGl0X2NvZGUgPT0g
U1ZNX0VYSVRfR0RUUl9XUklURSk7CisJCWJyZWFrOworCWNhc2UgU1ZNX0VYSVRfTERUUl9SRUFE
OgorCWNhc2UgU1ZNX0VYSVRfTERUUl9XUklURToKKwkJY29udCA9IGt2bWlfZGVzY3JpcHRvcl9l
dmVudCh2Y3B1LCBLVk1JX0RFU0NfTERUUiwKKwkJCQkgICAgICBjLT5leGl0X2NvZGUgPT0gU1ZN
X0VYSVRfTERUUl9XUklURSk7CisJCWJyZWFrOworCWNhc2UgU1ZNX0VYSVRfVFJfUkVBRDoKKwlj
YXNlIFNWTV9FWElUX1RSX1dSSVRFOgorCQljb250ID0ga3ZtaV9kZXNjcmlwdG9yX2V2ZW50KHZj
cHUsIEtWTUlfREVTQ19UUiwKKwkJCQkgICAgICBjLT5leGl0X2NvZGUgPT0gU1ZNX0VYSVRfVFJf
V1JJVEUpOworCQlicmVhazsKKwlkZWZhdWx0OgorCQljb250ID0gdHJ1ZTsKKwkJYnJlYWs7CisJ
fQorCWlmICghY29udCkKKwkJcmV0dXJuIDE7CisjZW5kaWYgLyogQ09ORklHX0tWTV9JTlRST1NQ
RUNUSU9OICovCisKIAlyZXR1cm4ga3ZtX2VtdWxhdGVfaW5zdHJ1Y3Rpb24odmNwdSwgMCk7CiB9
CiAKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS92bXgvdm14LmMgYi9hcmNoL3g4Ni9rdm0vdm14
L3ZteC5jCmluZGV4IGMyNjgxOTRjZWU4NC4uNThhNzUzYjFiYTQxIDEwMDY0NAotLS0gYS9hcmNo
L3g4Ni9rdm0vdm14L3ZteC5jCisrKyBiL2FyY2gveDg2L2t2bS92bXgvdm14LmMKQEAgLTUwNjgs
NyArNTA2OCwyOCBAQCBzdGF0aWMgaW50IGhhbmRsZV9zZXRfY3I0KHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSwgdW5zaWduZWQgbG9uZyB2YWwpCiAKIHN0YXRpYyBpbnQgaGFuZGxlX2Rlc2Moc3RydWN0
IGt2bV92Y3B1ICp2Y3B1KQogeworI2lmZGVmIENPTkZJR19LVk1fSU5UUk9TUEVDVElPTgorCXUz
MiB2bXhfaW5zdHJ1Y3Rpb25faW5mbyA9IHZtY3NfcmVhZDMyKFZNWF9JTlNUUlVDVElPTl9JTkZP
KTsKKwl1OCBzdG9yZSA9ICh2bXhfaW5zdHJ1Y3Rpb25faW5mbyA+PiAyOSkgJiAweDE7CisJdTgg
ZGVzY3JpcHRvciA9IDA7CisKKwlpZiAodG9fdm14KHZjcHUpLT5leGl0X3JlYXNvbi5iYXNpYyA9
PSBFWElUX1JFQVNPTl9HRFRSX0lEVFIpIHsKKwkJaWYgKCh2bXhfaW5zdHJ1Y3Rpb25faW5mbyA+
PiAyOCkgJiAweDEpCisJCQlkZXNjcmlwdG9yID0gS1ZNSV9ERVNDX0lEVFI7CisJCWVsc2UKKwkJ
CWRlc2NyaXB0b3IgPSBLVk1JX0RFU0NfR0RUUjsKKwl9IGVsc2UgeworCQlpZiAoKHZteF9pbnN0
cnVjdGlvbl9pbmZvID4+IDI4KSAmIDB4MSkKKwkJCWRlc2NyaXB0b3IgPSBLVk1JX0RFU0NfVFI7
CisJCWVsc2UKKwkJCWRlc2NyaXB0b3IgPSBLVk1JX0RFU0NfTERUUjsKKwl9CisKKwlpZiAoIWt2
bWlfZGVzY3JpcHRvcl9ldmVudCh2Y3B1LCBkZXNjcmlwdG9yLCBzdG9yZSkpCisJCXJldHVybiAx
OworI2Vsc2UKIAlXQVJOX09OKCEodmNwdS0+YXJjaC5jcjQgJiBYODZfQ1I0X1VNSVApKTsKKyNl
bmRpZiAvKiBDT05GSUdfS1ZNX0lOVFJPU1BFQ1RJT04gKi8KIAlyZXR1cm4ga3ZtX2VtdWxhdGVf
aW5zdHJ1Y3Rpb24odmNwdSwgMCk7CiB9CiAKZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51
eC9rdm1pLmggYi9pbmNsdWRlL3VhcGkvbGludXgva3ZtaS5oCmluZGV4IGE0OGNmMmMxZjlhNy4u
YWEyNTdiMDExZmYxIDEwMDY0NAotLS0gYS9pbmNsdWRlL3VhcGkvbGludXgva3ZtaS5oCisrKyBi
L2luY2x1ZGUvdWFwaS9saW51eC9rdm1pLmgKQEAgLTY3LDYgKzY3LDcgQEAgZW51bSB7CiAJS1ZN
SV9WQ1BVX0VWRU5UX0NSICAgICAgICAgPSBLVk1JX1ZDUFVfRVZFTlRfSUQoMyksCiAJS1ZNSV9W
Q1BVX0VWRU5UX1RSQVAgICAgICAgPSBLVk1JX1ZDUFVfRVZFTlRfSUQoNCksCiAJS1ZNSV9WQ1BV
X0VWRU5UX1hTRVRCViAgICAgPSBLVk1JX1ZDUFVfRVZFTlRfSUQoNSksCisJS1ZNSV9WQ1BVX0VW
RU5UX0RFU0NSSVBUT1IgPSBLVk1JX1ZDUFVfRVZFTlRfSUQoNiksCiAKIAlLVk1JX05FWFRfVkNQ
VV9FVkVOVAogfTsKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS94ODZf
NjQva3ZtaV90ZXN0LmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0veDg2XzY0L2t2bWlf
dGVzdC5jCmluZGV4IDIzMWQ1NzRlZDU5Mi4uYzFjZTE2M2JjM2M0IDEwMDY0NAotLS0gYS90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0veDg2XzY0L2t2bWlfdGVzdC5jCisrKyBiL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2t2bS94ODZfNjQva3ZtaV90ZXN0LmMKQEAgLTU4LDYgKzU4LDcgQEAg
ZW51bSB7CiAJR1VFU1RfVEVTVF9OT09QID0gMCwKIAlHVUVTVF9URVNUX0JQLAogCUdVRVNUX1RF
U1RfQ1IsCisJR1VFU1RfVEVTVF9ERVNDUklQVE9SLAogCUdVRVNUX1RFU1RfSFlQRVJDQUxMLAog
CUdVRVNUX1RFU1RfWFNFVEJWLAogfTsKQEAgLTg3LDYgKzg4LDE0IEBAIHN0YXRpYyB2b2lkIGd1
ZXN0X2NyX3Rlc3Qodm9pZCkKIAlzZXRfY3I0KGdldF9jcjQoKSB8IFg4Nl9DUjRfT1NYU0FWRSk7
CiB9CiAKK3N0YXRpYyB2b2lkIGd1ZXN0X2Rlc2NyaXB0b3JfdGVzdCh2b2lkKQoreworCXZvaWQg
KnB0cjsKKworCWFzbSB2b2xhdGlsZSgic2dkdCAlMCIgOjogIm0iKHB0cikpOworCWFzbSB2b2xh
dGlsZSgibGdkdCAlMCIgOjogIm0iKHB0cikpOworfQorCiBzdGF0aWMgdm9pZCBndWVzdF9oeXBl
cmNhbGxfdGVzdCh2b2lkKQogewogCWFzbSB2b2xhdGlsZSgibW92ICQzNCwgJXJheCIpOwpAQCAt
MTQ2LDYgKzE1NSw5IEBAIHN0YXRpYyB2b2lkIGd1ZXN0X2NvZGUodm9pZCkKIAkJY2FzZSBHVUVT
VF9URVNUX0NSOgogCQkJZ3Vlc3RfY3JfdGVzdCgpOwogCQkJYnJlYWs7CisJCWNhc2UgR1VFU1Rf
VEVTVF9ERVNDUklQVE9SOgorCQkJZ3Vlc3RfZGVzY3JpcHRvcl90ZXN0KCk7CisJCQlicmVhazsK
IAkJY2FzZSBHVUVTVF9URVNUX0hZUEVSQ0FMTDoKIAkJCWd1ZXN0X2h5cGVyY2FsbF90ZXN0KCk7
CiAJCQlicmVhazsKQEAgLTE0OTQsNiArMTUwNiw2OCBAQCBzdGF0aWMgdm9pZCB0ZXN0X2NtZF92
Y3B1X2dldF9tdHJyX3R5cGUoc3RydWN0IGt2bV92bSAqdm0pCiAJcHJfZGVidWcoIm10cnJfdHlw
ZTogZ3BhIDB4JWx4IHR5cGUgMHgleFxuIiwgdGVzdF9ncGEsIHJwbC50eXBlKTsKIH0KIAorc3Rh
dGljIHZvaWQgdGVzdF9kZXNjX3JlYWRfYWNjZXNzKF9fdTE2IGV2ZW50X2lkKQoreworCXN0cnVj
dCBrdm1pX21zZ19oZHIgaGRyOworCXN0cnVjdCB7CisJCXN0cnVjdCB2Y3B1X2V2ZW50IHZjcHVf
ZXY7CisJCXN0cnVjdCBrdm1pX3ZjcHVfZXZlbnRfZGVzY3JpcHRvciBkZXNjOworCX0gZXY7CisJ
c3RydWN0IHZjcHVfcmVwbHkgcnBsID0ge307CisKKwlyZWNlaXZlX3ZjcHVfZXZlbnQoJmhkciwg
JmV2LnZjcHVfZXYsIHNpemVvZihldiksIGV2ZW50X2lkKTsKKworCXByX2RlYnVnKCJEZXNjcmlw
dG9yIGV2ZW50IChyZWFkKSwgZGVzY3JpcHRvciAldSwgd3JpdGUgJXVcbiIsCisJCSBldi5kZXNj
LmRlc2NyaXB0b3IsIGV2LmRlc2Mud3JpdGUpOworCisJVEVTVF9BU1NFUlQoZXYuZGVzYy53cml0
ZSA9PSAwLAorCQkiUmVjZWl2ZWQgYSB3cml0ZSBkZXNjcmlwdG9yIGFjY2Vzc1xuIik7CisKKwly
ZXBseV90b19ldmVudCgmaGRyLCAmZXYudmNwdV9ldiwgS1ZNSV9FVkVOVF9BQ1RJT05fQ09OVElO
VUUsCisJCQkmcnBsLCBzaXplb2YocnBsKSk7Cit9CisKK3N0YXRpYyB2b2lkIHRlc3RfZGVzY193
cml0ZV9hY2Nlc3MoX191MTYgZXZlbnRfaWQpCit7CisJc3RydWN0IGt2bWlfbXNnX2hkciBoZHI7
CisJc3RydWN0IHsKKwkJc3RydWN0IHZjcHVfZXZlbnQgdmNwdV9ldjsKKwkJc3RydWN0IGt2bWlf
dmNwdV9ldmVudF9kZXNjcmlwdG9yIGRlc2M7CisJfSBldjsKKwlzdHJ1Y3QgdmNwdV9yZXBseSBy
cGwgPSB7fTsKKworCXJlY2VpdmVfdmNwdV9ldmVudCgmaGRyLCAmZXYudmNwdV9ldiwgc2l6ZW9m
KGV2KSwgZXZlbnRfaWQpOworCisJcHJfZGVidWcoIkRlc2NyaXB0b3IgZXZlbnQgKHdyaXRlKSwg
ZGVzY3JpcHRvciAldSwgd3JpdGUgJXVcbiIsCisJCWV2LmRlc2MuZGVzY3JpcHRvciwgZXYuZGVz
Yy53cml0ZSk7CisKKwlURVNUX0FTU0VSVChldi5kZXNjLndyaXRlID09IDEsCisJCSJSZWNlaXZl
ZCBhIHJlYWQgZGVzY3JpcHRvciBhY2Nlc3NcbiIpOworCisJcmVwbHlfdG9fZXZlbnQoJmhkciwg
JmV2LnZjcHVfZXYsIEtWTUlfRVZFTlRfQUNUSU9OX0NPTlRJTlVFLAorCQkJJnJwbCwgc2l6ZW9m
KHJwbCkpOworfQorCitzdGF0aWMgdm9pZCB0ZXN0X2V2ZW50X2Rlc2NyaXB0b3Ioc3RydWN0IGt2
bV92bSAqdm0pCit7CisJc3RydWN0IHZjcHVfd29ya2VyX2RhdGEgZGF0YSA9IHsKKwkJLnZtID0g
dm0sCisJCS52Y3B1X2lkID0gVkNQVV9JRCwKKwkJLnRlc3RfaWQgPSBHVUVTVF9URVNUX0RFU0NS
SVBUT1IsCisJfTsKKwlfX3UxNiBldmVudF9pZCA9IEtWTUlfVkNQVV9FVkVOVF9ERVNDUklQVE9S
OworCXB0aHJlYWRfdCB2Y3B1X3RocmVhZDsKKworCWVuYWJsZV92Y3B1X2V2ZW50KHZtLCBldmVu
dF9pZCk7CisJdmNwdV90aHJlYWQgPSBzdGFydF92Y3B1X3dvcmtlcigmZGF0YSk7CisKKwl0ZXN0
X2Rlc2NfcmVhZF9hY2Nlc3MoZXZlbnRfaWQpOworCXRlc3RfZGVzY193cml0ZV9hY2Nlc3MoZXZl
bnRfaWQpOworCisJd2FpdF92Y3B1X3dvcmtlcih2Y3B1X3RocmVhZCk7CisJZGlzYWJsZV92Y3B1
X2V2ZW50KHZtLCBldmVudF9pZCk7Cit9CisKIHN0YXRpYyB2b2lkIHRlc3RfaW50cm9zcGVjdGlv
bihzdHJ1Y3Qga3ZtX3ZtICp2bSkKIHsKIAlzcmFuZG9tKHRpbWUoMCkpOwpAQCAtMTUyMyw2ICsx
NTk3LDcgQEAgc3RhdGljIHZvaWQgdGVzdF9pbnRyb3NwZWN0aW9uKHN0cnVjdCBrdm1fdm0gKnZt
KQogCXRlc3RfY21kX3ZjcHVfZ2V0X3hjcih2bSk7CiAJdGVzdF9jbWRfdmNwdV94c2F2ZSh2bSk7
CiAJdGVzdF9jbWRfdmNwdV9nZXRfbXRycl90eXBlKHZtKTsKKwl0ZXN0X2V2ZW50X2Rlc2NyaXB0
b3Iodm0pOwogCiAJdW5ob29rX2ludHJvc3BlY3Rpb24odm0pOwogfQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxp
c3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0
cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
