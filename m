Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 55173155DFB
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 19:26:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0227286932;
	Fri,  7 Feb 2020 18:26:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vOUy-XEOhpGK; Fri,  7 Feb 2020 18:26:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 26DC0869B9;
	Fri,  7 Feb 2020 18:26:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 06727C1D81;
	Fri,  7 Feb 2020 18:26:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 03CEEC1D87
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DFD4A86940
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7wkywbclbYkw
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B04DD86916
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:53 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 5D82A305D344; Fri,  7 Feb 2020 20:16:40 +0200 (EET)
Received: from host.bbu.bitdefender.biz (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 485443052075;
 Fri,  7 Feb 2020 20:16:40 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v7 38/78] KVM: introspection: add permission access ioctls
Date: Fri,  7 Feb 2020 20:15:56 +0200
Message-Id: <20200207181636.1065-39-alazar@bitdefender.com>
In-Reply-To: <20200207181636.1065-1-alazar@bitdefender.com>
References: <20200207181636.1065-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
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

S1ZNX0lOVFJPU1BFQ1RJT05fQ09NTUFORCBhbmQgS1ZNX0lOVFJPU1BFQ1RJT05fRVZFTlRTIGlv
Y3RscyBzaG91bGQgYmUKdXNlZCBieSB1c2Vyc3BhY2UgdG8gYWxsb3cgYWNjZXNzIGZvciBzcGVj
aWZpYyAob3IgYWxsKSBpbnRyb3NwZWN0aW9uCmNvbW1hbmRzIGFuZCBldmVudHMuCgpCeSBkZWZh
dWx0LCBhbGwgdGhlIGludHJvc3BlY3Rpb24gZXZlbnRzIGFuZCBhbG1vc3QgYWxsIHRoZSBpbnRy
b3NwZWN0aW9uCmNvbW1hbmRzIGFyZSBkaXNhbGxvd2VkLiBTb21lIGNvbW1hbmRzIGFyZSBhbHdh
eXMgYWxsb3dlZCwgdGhvc2UgcXVlcnlpbmcKdGhlIGludHJvc3BlY3Rpb24gY2FwYWJpbGl0aWVz
LgoKU2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29t
PgotLS0KIERvY3VtZW50YXRpb24vdmlydC9rdm0vYXBpLnR4dCAgICAgICAgICAgICAgICB8IDUw
ICsrKysrKysrKysKIGluY2x1ZGUvbGludXgva3ZtaV9ob3N0LmggICAgICAgICAgICAgICAgICAg
ICB8ICA3ICsrCiBpbmNsdWRlL3VhcGkvbGludXgva3ZtLmggICAgICAgICAgICAgICAgICAgICAg
fCAgOCArKwogaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaCAgICAgICAgICAgICAgICAgICAgIHwg
IDggKysKIC4uLi90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0veDg2XzY0L2t2bWlfdGVzdC5jICB8IDI4
ICsrKysrKwogdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pLmMgICAgICAgICAgICAgICAgIHwg
OTIgKysrKysrKysrKysrKysrKysrKwogdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX2ludC5o
ICAgICAgICAgICAgIHwgIDQgKwogdmlydC9rdm0va3ZtX21haW4uYyAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDYgKysKIDggZmlsZXMgY2hhbmdlZCwgMjAzIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2FwaS50eHQgYi9Eb2N1bWVudGF0aW9u
L3ZpcnQva3ZtL2FwaS50eHQKaW5kZXggNTQwZDkwMTVkNzI2Li5jMWRhMGE2N2Q3YWYgMTAwNjQ0
Ci0tLSBhL0RvY3VtZW50YXRpb24vdmlydC9rdm0vYXBpLnR4dAorKysgYi9Eb2N1bWVudGF0aW9u
L3ZpcnQva3ZtL2FwaS50eHQKQEAgLTQyMTAsNiArNDIxMCw1NiBAQCBSZXR1cm5zOiAwIG9uIHN1
Y2Nlc3MsIGEgbmVnYXRpdmUgdmFsdWUgb24gZXJyb3IKIFRoaXMgaW9jdGwgaXMgdXNlZCB0byBm
cmVlIGFsbCBpbnRyb3NwZWN0aW9uIHN0cnVjdHVyZXMKIHJlbGF0ZWQgdG8gdGhpcyBWTS4KIAor
NC4xMjQgS1ZNX0lOVFJPU1BFQ1RJT05fQ09NTUFORAorCitDYXBhYmlsaXR5OiBLVk1fQ0FQX0lO
VFJPU1BFQ1RJT04KK0FyY2hpdGVjdHVyZXM6IHg4NgorVHlwZTogdm0gaW9jdGwKK1BhcmFtZXRl
cnM6IHN0cnVjdCBrdm1faW50cm9zcGVjdGlvbl9mZWF0dXJlIChpbikKK1JldHVybnM6IDAgb24g
c3VjY2VzcywgYSBuZWdhdGl2ZSB2YWx1ZSBvbiBlcnJvcgorRXJyb3JzOgorICBFSU5WQUw6IHRo
ZSBjb21tYW5kIGlzIHVua25vd24KKyAgRVBFUk06ICB0aGUgY29tbWFuZCBjYW4ndCBiZSBkaXNh
bGxvd2VkIChlLmcuIEtWTUlfR0VUX1ZFUlNJT04pCisKK1RoaXMgaW9jdGwgaXMgdXNlZCB0byBh
bGxvdyBvciBkaXNhbGxvdyBpbnRyb3NwZWN0aW9uIGNvbW1hbmRzCitmb3IgdGhlIGN1cnJlbnQg
Vk0uIEJ5IGRlZmF1bHQsIGFsbW9zdCBhbGwgY29tbWFuZHMgYXJlIGRpc2FsbG93ZWQKK2V4Y2Vw
dCBmb3IgdGhvc2UgdXNlZCB0byBxdWVyeSB0aGUgQVBJLgorCitzdHJ1Y3Qga3ZtX2ludHJvc3Bl
Y3Rpb25fZmVhdHVyZSB7CisJX191MzIgYWxsb3c7CisJX19zMzIgaWQ7Cit9OworCitJZiBhbGxv
dyBpcyAxLCB0aGUgY29tbWFuZCBzcGVjaWZpZWQgYnkgaWQgaXMgYWxsb3dlZC4gSWYgYWxsb3cg
aXMgMCwKK3RoZSBjb21tYW5kIGlzIGRpc2FsbG93ZWQuCisKK1VubGVzcyBzZXQgdG8gLTEgKG1l
YW5pbmcgYWxsIGNvbW1hbmRzKSwgaWQgbXVzdCBiZSBhIGNvbW1hbmQgSUQKKyhlLmcuIEtWTUlf
R0VUX1ZFUlNJT04pCisKKzQuMTI1IEtWTV9JTlRST1NQRUNUSU9OX0VWRU5UCisKK0NhcGFiaWxp
dHk6IEtWTV9DQVBfSU5UUk9TUEVDVElPTgorQXJjaGl0ZWN0dXJlczogeDg2CitUeXBlOiB2bSBp
b2N0bAorUGFyYW1ldGVyczogc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uX2ZlYXR1cmUgKGluKQor
UmV0dXJuczogMCBvbiBzdWNjZXNzLCBhIG5lZ2F0aXZlIHZhbHVlIG9uIGVycm9yCitFcnJvcnM6
CisgIEVJTlZBTDogdGhlIGV2ZW50IGlzIHVua25vd24KKworVGhpcyBpb2N0bCBpcyB1c2VkIHRv
IGFsbG93IG9yIGRpc2FsbG93IGludHJvc3BlY3Rpb24gZXZlbnRzCitmb3IgdGhlIGN1cnJlbnQg
Vk0uIEJ5IGRlZmF1bHQsIGFsbCBldmVudHMgYXJlIGRpc2FsbG93ZWQuCisKK3N0cnVjdCBrdm1f
aW50cm9zcGVjdGlvbl9mZWF0dXJlIHsKKwlfX3UzMiBhbGxvdzsKKwlfX3MzMiBpZDsKK307CisK
K0lmIGFsbG93IGlzIDEsIHRoZSBldmVudCBzcGVjaWZpZWQgYnkgaWQgaXMgYWxsb3dlZC4gSWYg
YWxsb3cgaXMgMCwKK3RoZSBldmVudCBpcyBkaXNhbGxvd2VkLgorCitVbmxlc3Mgc2V0IHRvIC0x
IChtZWFuaW5nIGFsbCBldmVudCksIGlkIG11c3QgYmUgYSBldmVudCBJRAorKGUuZy4gS1ZNSV9F
VkVOVF9VTkhPT0ssIEtWTUlfRVZFTlRfQ1IsIGV0Yy4pCisKIDUuIFRoZSBrdm1fcnVuIHN0cnVj
dHVyZQogLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGlu
dXgva3ZtaV9ob3N0LmggYi9pbmNsdWRlL2xpbnV4L2t2bWlfaG9zdC5oCmluZGV4IGM4YjljODdl
Y2ZmMi4uNGU3N2EwMjI3YzA4IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2t2bWlfaG9zdC5o
CisrKyBiL2luY2x1ZGUvbGludXgva3ZtaV9ob3N0LmgKQEAgLTgsNiArOCw4IEBAIHN0cnVjdCBr
dm07CiAKICNpbmNsdWRlIDxhc20va3ZtaV9ob3N0Lmg+CiAKKyNkZWZpbmUgS1ZNSV9OVU1fQ09N
TUFORFMgS1ZNSV9OVU1fTUVTU0FHRVMKKwogc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uIHsKIAlz
dHJ1Y3Qga3ZtX2FyY2hfaW50cm9zcGVjdGlvbiBhcmNoOwogCXN0cnVjdCBrdm0gKmt2bTsKQEAg
LTE2LDYgKzE4LDkgQEAgc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uIHsKIAogCXN0cnVjdCBzb2Nr
ZXQgKnNvY2s7CiAJc3RydWN0IHRhc2tfc3RydWN0ICpyZWN2OworCisJREVDTEFSRV9CSVRNQVAo
Y21kX2FsbG93X21hc2ssIEtWTUlfTlVNX0NPTU1BTkRTKTsKKwlERUNMQVJFX0JJVE1BUChldmVu
dF9hbGxvd19tYXNrLCBLVk1JX05VTV9FVkVOVFMpOwogfTsKIAogI2lmZGVmIENPTkZJR19LVk1f
SU5UUk9TUEVDVElPTgpAQCAtMjcsNiArMzIsOCBAQCB2b2lkIGt2bWlfZGVzdHJveV92bShzdHJ1
Y3Qga3ZtICprdm0pOwogCiBpbnQga3ZtaV9pb2N0bF9ob29rKHN0cnVjdCBrdm0gKmt2bSwgdm9p
ZCBfX3VzZXIgKmFyZ3ApOwogaW50IGt2bWlfaW9jdGxfdW5ob29rKHN0cnVjdCBrdm0gKmt2bSk7
CitpbnQga3ZtaV9pb2N0bF9jb21tYW5kKHN0cnVjdCBrdm0gKmt2bSwgdm9pZCBfX3VzZXIgKmFy
Z3ApOworaW50IGt2bWlfaW9jdGxfZXZlbnQoc3RydWN0IGt2bSAqa3ZtLCB2b2lkIF9fdXNlciAq
YXJncCk7CiAKICNlbHNlCiAKZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC9rdm0uaCBi
L2luY2x1ZGUvdWFwaS9saW51eC9rdm0uaAppbmRleCAwOTEzMmQ4ZGQzZTUuLmUyZGU5ODdiNWQ4
ZiAxMDA2NDQKLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L2t2bS5oCisrKyBiL2luY2x1ZGUvdWFw
aS9saW51eC9rdm0uaApAQCAtMTU2Myw2ICsxNTYzLDE0IEBAIHN0cnVjdCBrdm1faW50cm9zcGVj
dGlvbl9ob29rIHsKICNkZWZpbmUgS1ZNX0lOVFJPU1BFQ1RJT05fSE9PSyAgICBfSU9XKEtWTUlP
LCAweGMzLCBzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb25faG9vaykKICNkZWZpbmUgS1ZNX0lOVFJP
U1BFQ1RJT05fVU5IT09LICBfSU8oS1ZNSU8sIDB4YzQpCiAKK3N0cnVjdCBrdm1faW50cm9zcGVj
dGlvbl9mZWF0dXJlIHsKKwlfX3UzMiBhbGxvdzsKKwlfX3MzMiBpZDsKK307CisKKyNkZWZpbmUg
S1ZNX0lOVFJPU1BFQ1RJT05fQ09NTUFORCBfSU9XKEtWTUlPLCAweGM1LCBzdHJ1Y3Qga3ZtX2lu
dHJvc3BlY3Rpb25fZmVhdHVyZSkKKyNkZWZpbmUgS1ZNX0lOVFJPU1BFQ1RJT05fRVZFTlQgICBf
SU9XKEtWTUlPLCAweGM2LCBzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb25fZmVhdHVyZSkKKwogI2Rl
ZmluZSBLVk1fREVWX0FTU0lHTl9FTkFCTEVfSU9NTVUJKDEgPDwgMCkKICNkZWZpbmUgS1ZNX0RF
Vl9BU1NJR05fUENJXzJfMwkJKDEgPDwgMSkKICNkZWZpbmUgS1ZNX0RFVl9BU1NJR05fTUFTS19J
TlRYCSgxIDw8IDIpCmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgva3ZtaS5oIGIvaW5j
bHVkZS91YXBpL2xpbnV4L2t2bWkuaAppbmRleCAzNGRkYTkxMDE2ZGIuLmQ3YjE4ZmZlZjRmYSAx
MDA2NDQKLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaAorKysgYi9pbmNsdWRlL3VhcGkv
bGludXgva3ZtaS5oCkBAIC0xMCw0ICsxMCwxMiBAQCBlbnVtIHsKIAlLVk1JX1ZFUlNJT04gPSAw
eDAwMDAwMDAxCiB9OwogCitlbnVtIHsKKwlLVk1JX05VTV9NRVNTQUdFUworfTsKKworZW51bSB7
CisJS1ZNSV9OVU1fRVZFTlRTCit9OworCiAjZW5kaWYgLyogX1VBUElfX0xJTlVYX0tWTUlfSCAq
LwpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3g4Nl82NC9rdm1pX3Rl
c3QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS94ODZfNjQva3ZtaV90ZXN0LmMKaW5k
ZXggY2Q4NzQ0ZWM2OTM5Li5lYTQxMTYxMWUyOTYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL2t2bS94ODZfNjQva3ZtaV90ZXN0LmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMva3ZtL3g4Nl82NC9rdm1pX3Rlc3QuYwpAQCAtMzEsMTUgKzMxLDQzIEBAIHZvaWQgc2V0
dXBfc29ja2V0KHZvaWQpCiAJCWVycm5vLCBzdHJlcnJvcihlcnJubykpOwogfQogCitzdGF0aWMg
dm9pZCB0b2dnbGVfZXZlbnRfcGVybWlzc2lvbihzdHJ1Y3Qga3ZtX3ZtICp2bSwgX19zMzIgaWQs
IGJvb2wgYWxsb3cpCit7CisJc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uX2ZlYXR1cmUgZmVhdCA9
IHsKKwkJLmFsbG93ID0gYWxsb3cgPyAxIDogMCwKKwkJLmlkID0gaWQKKwl9OworCWludCByOwor
CisJciA9IGlvY3RsKHZtLT5mZCwgS1ZNX0lOVFJPU1BFQ1RJT05fRVZFTlQsICZmZWF0KTsKKwlU
RVNUX0FTU0VSVChyID09IDAsCisJCSJLVk1fSU5UUk9TUEVDVElPTl9FVkVOVCBmYWlsZWQsIGlk
ICVkLCBlcnJubyAlZCAoJXMpXG4iLAorCQlpZCwgZXJybm8sIHN0cmVycm9yKGVycm5vKSk7Cit9
CisKK3N0YXRpYyB2b2lkIGFsbG93X2V2ZW50KHN0cnVjdCBrdm1fdm0gKnZtLCBfX3MzMiBldmVu
dF9pZCkKK3sKKwl0b2dnbGVfZXZlbnRfcGVybWlzc2lvbih2bSwgZXZlbnRfaWQsIHRydWUpOwor
fQorCiBzdGF0aWMgdm9pZCBob29rX2ludHJvc3BlY3Rpb24oc3RydWN0IGt2bV92bSAqdm0pCiB7
CisJX19zMzIgYWxsX0lEcyA9IC0xOwogCXN0cnVjdCBrdm1faW50cm9zcGVjdGlvbl9ob29rIGhv
b2sgPSB7LmZkID0gS3ZtX3NvY2tldH07CisJc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uX2ZlYXR1
cmUgZmVhdCA9IHsuYWxsb3cgPSAxLCAuaWQgPSBhbGxfSURzfTsKIAlpbnQgcjsKIAogCXIgPSBp
b2N0bCh2bS0+ZmQsIEtWTV9JTlRST1NQRUNUSU9OX0hPT0ssICZob29rKTsKIAlURVNUX0FTU0VS
VChyID09IDAsCiAJCSJLVk1fSU5UUk9TUEVDVElPTl9IT09LIGZhaWxlZCwgZXJybm8gJWQgKCVz
KVxuIiwKIAkJZXJybm8sIHN0cmVycm9yKGVycm5vKSk7CisKKwlyID0gaW9jdGwodm0tPmZkLCBL
Vk1fSU5UUk9TUEVDVElPTl9DT01NQU5ELCAmZmVhdCk7CisJVEVTVF9BU1NFUlQociA9PSAwLAor
CQkiS1ZNX0lOVFJPU1BFQ1RJT05fQ09NTUFORCBmYWlsZWQsIGVycm5vICVkICglcylcbiIsCisJ
CWVycm5vLCBzdHJlcnJvcihlcnJubykpOworCisJYWxsb3dfZXZlbnQodm0sIGFsbF9JRHMpOwog
fQogCiBzdGF0aWMgdm9pZCB1bmhvb2tfaW50cm9zcGVjdGlvbihzdHJ1Y3Qga3ZtX3ZtICp2bSkK
ZGlmZiAtLWdpdCBhL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaS5jIGIvdmlydC9rdm0vaW50
cm9zcGVjdGlvbi9rdm1pLmMKaW5kZXggN2EwMDk0ODA1MTdhLi43OTFkMjUzNjQxNWUgMTAwNjQ0
Ci0tLSBhL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaS5jCisrKyBiL3ZpcnQva3ZtL2ludHJv
c3BlY3Rpb24va3ZtaS5jCkBAIC0xNzEsMyArMTcxLDk1IEBAIHZvaWQga3ZtaV9kZXN0cm95X3Zt
KHN0cnVjdCBrdm0gKmt2bSkKIHsKIAlrdm1pX3VuaG9vayhrdm0pOwogfQorCitzdGF0aWMgaW50
IGt2bWlfaW9jdGxfZ2V0X2ZlYXR1cmUodm9pZCBfX3VzZXIgKmFyZ3AsIGJvb2wgKmFsbG93LCBp
bnQgKmlkLAorCQkJCSAgdW5zaWduZWQgbG9uZyAqYml0bWFzaykKK3sKKwlzdHJ1Y3Qga3ZtX2lu
dHJvc3BlY3Rpb25fZmVhdHVyZSBmZWF0OworCWludCBhbGxfYml0cyA9IC0xOworCisJaWYgKGNv
cHlfZnJvbV91c2VyKCZmZWF0LCBhcmdwLCBzaXplb2YoZmVhdCkpKQorCQlyZXR1cm4gLUVGQVVM
VDsKKworCWlmIChmZWF0LmlkIDwgMCAmJiBmZWF0LmlkICE9IGFsbF9iaXRzKQorCQlyZXR1cm4g
LUVJTlZBTDsKKworCSphbGxvdyA9ICEhKGZlYXQuYWxsb3cgJiAxKTsKKwkqaWQgPSBmZWF0Lmlk
OworCSpiaXRtYXNrID0gKmlkID09IGFsbF9iaXRzID8gLTEgOiBCSVQoZmVhdC5pZCk7CisKKwly
ZXR1cm4gMDsKK30KKworc3RhdGljIGludCBrdm1pX2lvY3RsX2ZlYXR1cmUoc3RydWN0IGt2bSAq
a3ZtLAorCQkJICAgICAgYm9vbCBhbGxvdywgdW5zaWduZWQgbG9uZyAqcmVxdWVzdGVkLAorCQkJ
ICAgICAgc2l6ZV90IG9mZl9kZXN0LCB1bnNpZ25lZCBpbnQgbmJpdHMpCit7CisJc3RydWN0IGt2
bV9pbnRyb3NwZWN0aW9uICprdm1pOworCXVuc2lnbmVkIGxvbmcgKmRlc3Q7CisJaW50IGVyciA9
IDA7CisKKwltdXRleF9sb2NrKCZrdm0tPmt2bWlfbG9jayk7CisKKwlrdm1pID0gS1ZNSShrdm0p
OworCWlmICgha3ZtaSkgeworCQllcnIgPSAtRUZBVUxUOworCQlnb3RvIG91dDsKKwl9CisKKwlk
ZXN0ID0gKHVuc2lnbmVkIGxvbmcgKikoKGNoYXIgKilrdm1pICsgb2ZmX2Rlc3QpOworCisJaWYg
KGFsbG93KQorCQliaXRtYXBfb3IoZGVzdCwgZGVzdCwgcmVxdWVzdGVkLCBuYml0cyk7CisJZWxz
ZQorCQliaXRtYXBfYW5kbm90KGRlc3QsIGRlc3QsIHJlcXVlc3RlZCwgbmJpdHMpOworCitvdXQ6
CisJbXV0ZXhfdW5sb2NrKCZrdm0tPmt2bWlfbG9jayk7CisKKwlyZXR1cm4gZXJyOworfQorCitp
bnQga3ZtaV9pb2N0bF9ldmVudChzdHJ1Y3Qga3ZtICprdm0sIHZvaWQgX191c2VyICphcmdwKQor
eworCURFQ0xBUkVfQklUTUFQKHJlcXVlc3RlZCwgS1ZNSV9OVU1fRVZFTlRTKTsKKwlERUNMQVJF
X0JJVE1BUChrbm93biwgS1ZNSV9OVU1fRVZFTlRTKTsKKwlzaXplX3Qgb2ZmX2JpdG1hcDsKKwli
b29sIGFsbG93OworCWludCBlcnI7CisJaW50IGlkOworCisJZXJyID0ga3ZtaV9pb2N0bF9nZXRf
ZmVhdHVyZShhcmdwLCAmYWxsb3csICZpZCwgcmVxdWVzdGVkKTsKKwlpZiAoZXJyKQorCQlyZXR1
cm4gZXJyOworCisJYml0bWFwX2Zyb21fdTY0KGtub3duLCBLVk1JX0tOT1dOX0VWRU5UUyk7CisJ
Yml0bWFwX2FuZChyZXF1ZXN0ZWQsIHJlcXVlc3RlZCwga25vd24sIEtWTUlfTlVNX0VWRU5UUyk7
CisKKwlvZmZfYml0bWFwID0gb2Zmc2V0b2Yoc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uLCBldmVu
dF9hbGxvd19tYXNrKTsKKworCXJldHVybiBrdm1pX2lvY3RsX2ZlYXR1cmUoa3ZtLCBhbGxvdywg
cmVxdWVzdGVkLCBvZmZfYml0bWFwLAorCQkJCSAgS1ZNSV9OVU1fRVZFTlRTKTsKK30KKworaW50
IGt2bWlfaW9jdGxfY29tbWFuZChzdHJ1Y3Qga3ZtICprdm0sIHZvaWQgX191c2VyICphcmdwKQor
eworCURFQ0xBUkVfQklUTUFQKHJlcXVlc3RlZCwgS1ZNSV9OVU1fQ09NTUFORFMpOworCURFQ0xB
UkVfQklUTUFQKGtub3duLCBLVk1JX05VTV9DT01NQU5EUyk7CisJc2l6ZV90IG9mZl9iaXRtYXA7
CisJYm9vbCBhbGxvdzsKKwlpbnQgZXJyOworCWludCBpZDsKKworCWVyciA9IGt2bWlfaW9jdGxf
Z2V0X2ZlYXR1cmUoYXJncCwgJmFsbG93LCAmaWQsIHJlcXVlc3RlZCk7CisJaWYgKGVycikKKwkJ
cmV0dXJuIGVycjsKKworCWJpdG1hcF9mcm9tX3U2NChrbm93biwgS1ZNSV9LTk9XTl9DT01NQU5E
Uyk7CisJYml0bWFwX2FuZChyZXF1ZXN0ZWQsIHJlcXVlc3RlZCwga25vd24sIEtWTUlfTlVNX0NP
TU1BTkRTKTsKKworCW9mZl9iaXRtYXAgPSBvZmZzZXRvZihzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rp
b24sIGNtZF9hbGxvd19tYXNrKTsKKworCXJldHVybiBrdm1pX2lvY3RsX2ZlYXR1cmUoa3ZtLCBh
bGxvdywgcmVxdWVzdGVkLCBvZmZfYml0bWFwLAorCQkJCSAgS1ZNSV9OVU1fQ09NTUFORFMpOwor
fQpkaWZmIC0tZ2l0IGEvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX2ludC5oIGIvdmlydC9r
dm0vaW50cm9zcGVjdGlvbi9rdm1pX2ludC5oCmluZGV4IDAxNDUxZDU3Mzc4OC4uYzVjZjQwZDAz
ZDY4IDEwMDY0NAotLS0gYS92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfaW50LmgKKysrIGIv
dmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX2ludC5oCkBAIC0xNiw2ICsxNiwxMCBAQAogI2Rl
ZmluZSBrdm1pX2Vycihrdm1pLCBmbXQsIC4uLikgXAogCWt2bV9pbmZvKCIlcFUgRVJST1I6ICIg
Zm10LCAma3ZtaS0+dXVpZCwgIyMgX19WQV9BUkdTX18pCiAKKyNkZWZpbmUgS1ZNSV9LTk9XTl9F
VkVOVFMgMAorCisjZGVmaW5lIEtWTUlfS05PV05fQ09NTUFORFMgMAorCiAjZGVmaW5lIEtWTUko
a3ZtKSAoKHN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqKSgoa3ZtKS0+a3ZtaSkpCiAKIC8qIGt2
bWlfbXNnLmMgKi8KZGlmZiAtLWdpdCBhL3ZpcnQva3ZtL2t2bV9tYWluLmMgYi92aXJ0L2t2bS9r
dm1fbWFpbi5jCmluZGV4IDc3YmFiOWJhOTE4Yi4uZjU2MzJhM2E3ZmIzIDEwMDY0NAotLS0gYS92
aXJ0L2t2bS9rdm1fbWFpbi5jCisrKyBiL3ZpcnQva3ZtL2t2bV9tYWluLmMKQEAgLTM1MDUsNiAr
MzUwNSwxMiBAQCBzdGF0aWMgbG9uZyBrdm1fdm1faW9jdGwoc3RydWN0IGZpbGUgKmZpbHAsCiAJ
Y2FzZSBLVk1fSU5UUk9TUEVDVElPTl9VTkhPT0s6CiAJCXIgPSBrdm1pX2lvY3RsX3VuaG9vayhr
dm0pOwogCQlicmVhazsKKwljYXNlIEtWTV9JTlRST1NQRUNUSU9OX0NPTU1BTkQ6CisJCXIgPSBr
dm1pX2lvY3RsX2NvbW1hbmQoa3ZtLCBhcmdwKTsKKwkJYnJlYWs7CisJY2FzZSBLVk1fSU5UUk9T
UEVDVElPTl9FVkVOVDoKKwkJciA9IGt2bWlfaW9jdGxfZXZlbnQoa3ZtLCBhcmdwKTsKKwkJYnJl
YWs7CiAjZW5kaWYgLyogQ09ORklHX0tWTV9JTlRST1NQRUNUSU9OICovCiAJZGVmYXVsdDoKIAkJ
ciA9IGt2bV9hcmNoX3ZtX2lvY3RsKGZpbHAsIGlvY3RsLCBhcmcpOwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxp
c3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0
cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
