Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C75424538
	for <lists.virtualization@lfdr.de>; Wed,  6 Oct 2021 19:50:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A523240A3C;
	Wed,  6 Oct 2021 17:50:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RI1WtPgE-qNY; Wed,  6 Oct 2021 17:50:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 37045407D4;
	Wed,  6 Oct 2021 17:50:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54968C0023;
	Wed,  6 Oct 2021 17:50:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12777C0022
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 17:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A140405CD
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 17:50:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eQJlraksCLGR
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 17:50:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 28F33405D5
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 17:50:40 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 20AC0305D357; Wed,  6 Oct 2021 20:31:16 +0300 (EEST)
Received: from localhost (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 04E7F300F712;
 Wed,  6 Oct 2021 20:31:16 +0300 (EEST)
X-Is-Junk-Enabled: fGZTSsP0qEJE2AIKtlSuFiRRwg9xyHmJ
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v12 53/77] KVM: introspection: add KVMI_VCPU_EVENT_HYPERCALL
Date: Wed,  6 Oct 2021 20:30:49 +0300
Message-Id: <20211006173113.26445-54-alazar@bitdefender.com>
In-Reply-To: <20211006173113.26445-1-alazar@bitdefender.com>
References: <20211006173113.26445-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wanpeng Li <wanpengli@tencent.com>,
 Sean Christopherson <seanjc@google.com>, Joerg Roedel <joro@8bytes.org>,
 virtualization@lists.linux-foundation.org,
 =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Mathieu Tarral <mathieu.tarral@protonmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>,
 Jim Mattson <jmattson@google.com>
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyBldmVudCBp
cyBzZW50IG9uIGEgc3BlY2lmaWMgaHlwZXJjYWxsLgoKSXQgaXMgdXNlZCBieSB0aGUgY29kZSBy
ZXNpZGluZyBpbnNpZGUgdGhlIGludHJvc3BlY3RlZCBndWVzdCB0byBjYWxsIHRoZQppbnRyb3Nw
ZWN0aW9uIHRvb2wgYW5kIHRvIHJlcG9ydCBjZXJ0YWluIGRldGFpbHMgYWJvdXQgaXRzIG9wZXJh
dGlvbi4KRm9yIGV4YW1wbGUsIGEgY2xhc3NpYyBhbnRpbWFsd2FyZSByZW1lZGlhdGlvbiB0b29s
IGNhbiByZXBvcnQKd2hhdCBpdCBoYXMgZm91bmQgZHVyaW5nIGEgc2Nhbi4KClNpZ25lZC1vZmYt
Ynk6IE1paGFpIERvbsibdSA8bWRvbnR1QGJpdGRlZmVuZGVyLmNvbT4KQ28tZGV2ZWxvcGVkLWJ5
OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+ClNpZ25lZC1vZmYtYnk6
IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJpdGRlZmVuZGVyLmNvbT4KLS0tCiBEb2N1bWVudGF0
aW9uL3ZpcnQva3ZtL2h5cGVyY2FsbHMucnN0ICAgICAgICAgfCAzNSArKysrKysrKysrKysrKysr
CiBEb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2t2bWkucnN0ICAgICAgICAgICAgICAgfCA0MCArKysr
KysrKysrKysrKysrKy0KIGFyY2gveDg2L2luY2x1ZGUvdWFwaS9hc20va3ZtaS5oICAgICAgICAg
ICAgICB8ICA0ICsrCiBhcmNoL3g4Ni9rdm0va3ZtaS5jICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAyMCArKysrKysrKysKIGFyY2gveDg2L2t2bS94ODYuYyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8IDE4ICsrKysrKy0tCiBpbmNsdWRlL2xpbnV4L2t2bWlfaG9zdC5oICAgICAgICAg
ICAgICAgICAgICAgfCAgMiArCiBpbmNsdWRlL3VhcGkvbGludXgva3ZtX3BhcmEuaCAgICAgICAg
ICAgICAgICAgfCAgMSArCiBpbmNsdWRlL3VhcGkvbGludXgva3ZtaS5oICAgICAgICAgICAgICAg
ICAgICAgfCAgMyArLQogLi4uL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS94ODZfNjQva3ZtaV90ZXN0
LmMgIHwgNDIgKysrKysrKysrKysrKysrKysrKwogdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1p
LmMgICAgICAgICAgICAgICAgIHwgMzggKysrKysrKysrKysrKysrKysKIHZpcnQva3ZtL2ludHJv
c3BlY3Rpb24va3ZtaV9pbnQuaCAgICAgICAgICAgICB8ICA4ICsrKysKIHZpcnQva3ZtL2ludHJv
c3BlY3Rpb24va3ZtaV9tc2cuYyAgICAgICAgICAgICB8IDEzICsrKysrKwogMTIgZmlsZXMgY2hh
bmdlZCwgMjE4IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi92aXJ0L2t2bS9oeXBlcmNhbGxzLnJzdCBiL0RvY3VtZW50YXRpb24vdmlydC9r
dm0vaHlwZXJjYWxscy5yc3QKaW5kZXggZTU2ZmE4YjljZmNhLi5kZjZiOTA3ZmQxMDggMTAwNjQ0
Ci0tLSBhL0RvY3VtZW50YXRpb24vdmlydC9rdm0vaHlwZXJjYWxscy5yc3QKKysrIGIvRG9jdW1l
bnRhdGlvbi92aXJ0L2t2bS9oeXBlcmNhbGxzLnJzdApAQCAtMTkwLDMgKzE5MCwzOCBAQCB0aGUg
S1ZNX0NBUF9FWElUX0hZUEVSQ0FMTCBjYXBhYmlsaXR5LiBVc2Vyc3BhY2UgbXVzdCBlbmFibGUg
dGhhdCBjYXBhYmlsaXR5CiBiZWZvcmUgYWR2ZXJ0aXNpbmcgS1ZNX0ZFQVRVUkVfSENfTUFQX0dQ
QV9SQU5HRSBpbiB0aGUgZ3Vlc3QgQ1BVSUQuICBJbgogYWRkaXRpb24sIGlmIHRoZSBndWVzdCBz
dXBwb3J0cyBLVk1fRkVBVFVSRV9NSUdSQVRJT05fQ09OVFJPTCwgdXNlcnNwYWNlCiBtdXN0IGFs
c28gc2V0IHVwIGFuIE1TUiBmaWx0ZXIgdG8gcHJvY2VzcyB3cml0ZXMgdG8gTVNSX0tWTV9NSUdS
QVRJT05fQ09OVFJPTC4KKworOS4gS1ZNX0hDX1hFTl9IVk1fT1AKKy0tLS0tLS0tLS0tLS0tLS0t
LS0tCisKKzpBcmNoaXRlY3R1cmU6IHg4NgorOlN0YXR1czogYWN0aXZlCis6UHVycG9zZTogVG8g
ZW5hYmxlIGNvbW11bmljYXRpb24gYmV0d2VlbiBhIGd1ZXN0IGFnZW50IGFuZCBhIFZNSSBhcHBs
aWNhdGlvbgorCitVc2FnZToKKworQW4gZXZlbnQgd2lsbCBiZSBzZW50IHRvIHRoZSBWTUkgYXBw
bGljYXRpb24gKHNlZSBrdm1pLnJzdCkgaWYgdGhlIGZvbGxvd2luZworcmVnaXN0ZXJzLCB3aGlj
aCBkaWZmZXIgYmV0d2VlbiAzMmJpdCBhbmQgNjRiaXQsIGhhdmUgdGhlIGZvbGxvd2luZyB2YWx1
ZXM6CisKKyAgICAgICA9PT09PT09PSAgICA9PT09PSAgICAgPT09PT0KKyAgICAgICAzMmJpdCAg
ICAgICA2NGJpdCAgICAgdmFsdWUKKyAgICAgICA9PT09PT09PSAgICA9PT09PSAgICAgPT09PT0K
KyAgICAgICBlYnggKGEwKSAgICByZGkgICAgICAgS1ZNX0hDX1hFTl9IVk1fT1BfR1VFU1RfUkVR
VUVTVF9WTV9FVkVOVAorICAgICAgIGVjeCAoYTEpICAgIHJzaSAgICAgICAwCisgICAgICAgPT09
PT09PT0gICAgPT09PT0gICAgID09PT09CisKK1RoaXMgc3BlY2lmaWNhdGlvbiBjb3BpZXMgWGVu
J3MgeyBfX0hZUEVSVklTT1JfaHZtX29wLAorSFZNT1BfZ3Vlc3RfcmVxdWVzdF92bV9ldmVudCB9
IGh5cGVyY2FsbCBhbmQgY2FuIG9yaWdpbmF0ZSBmcm9tIGtlcm5lbCBvcgordXNlcnNwYWNlLgor
CitJdCByZXR1cm5zIDAgaWYgc3VjY2Vzc2Z1bCwgb3IgYSBuZWdhdGl2ZSBQT1NJWC4xIGVycm9y
IGNvZGUgaWYgaXQgZmFpbHMuIFRoZQorYWJzZW5jZSBvZiBhbiBhY3RpdmUgVk1JIGFwcGxpY2F0
aW9uIGlzIG5vdCBzaWduYWxlZCBpbiBhbnkgd2F5LgorCitUaGUgZm9sbG93aW5nIHJlZ2lzdGVy
cyBhcmUgY2xvYmJlcmVkOgorCisgICogMzJiaXQ6IGVkeCwgZXNpLCBlZGksIGVicAorICAqIDY0
Yml0OiByZHgsIHIxMCwgcjgsIHI5CisKK0luIHBhcnRpY3VsYXIsIGZvciBLVk1fSENfWEVOX0hW
TV9PUF9HVUVTVF9SRVFVRVNUX1ZNX0VWRU5ULCB0aGUgbGFzdCB0d28KK3JlZ2lzdGVycyBjYW4g
YmUgcG9pc29uZWQgZGVsaWJlcmF0ZWx5IGFuZCBjYW5ub3QgYmUgdXNlZCBmb3IgcGFzc2luZwor
aW5mb3JtYXRpb24uCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2t2bWkucnN0
IGIvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJzdAppbmRleCA4Yjk5MzgwMzI2NTAuLjBm
YWNkYzQ1OTVlZCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJzdAor
KysgYi9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2t2bWkucnN0CkBAIC01MzUsNyArNTM1LDEwIEBA
IGNvbW1hbmQpIGJlZm9yZSByZXR1cm5pbmcgdG8gZ3Vlc3QuCiAKIAlzdHJ1Y3Qga3ZtaV9lcnJv
cl9jb2RlCiAKLUVuYWJsZXMvZGlzYWJsZXMgdkNQVSBpbnRyb3NwZWN0aW9uIGV2ZW50cy4KK0Vu
YWJsZXMvZGlzYWJsZXMgdkNQVSBpbnRyb3NwZWN0aW9uIGV2ZW50cy4gVGhpcyBjb21tYW5kIGNh
biBiZSB1c2VkIHdpdGgKK3RoZSBmb2xsb3dpbmcgZXZlbnRzOjoKKworCUtWTUlfVkNQVV9FVkVO
VF9IWVBFUkNBTEwKIAogV2hlbiBhbiBldmVudCBpcyBlbmFibGVkLCB0aGUgaW50cm9zcGVjdGlv
biB0b29sIGlzIG5vdGlmaWVkIGFuZAogbXVzdCByZXBseSB3aXRoOiBjb250aW51ZSwgcmV0cnks
IGNyYXNoLCBldGMuIChzZWUgKipFdmVudHMqKiBiZWxvdykuCkBAIC03NzksMyArNzgyLDM4IEBA
IGNhbm5vdCBiZSBjb250cm9sbGVkIHdpdGggKktWTUlfVkNQVV9DT05UUk9MX0VWRU5UUyouCiBC
ZWNhdXNlIGl0IGhhcyBhIGxvdyBwcmlvcml0eSwgaXQgd2lsbCBiZSBzZW50IGFmdGVyIGFueSBv
dGhlciB2Q1BVCiBpbnRyb3NwZWN0aW9uIGV2ZW50IGFuZCB3aGVuIG5vIG90aGVyIHZDUFUgaW50
cm9zcGVjdGlvbiBjb21tYW5kIGlzCiBxdWV1ZWQuCisKKzMuIEtWTUlfVkNQVV9FVkVOVF9IWVBF
UkNBTEwKKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKworOkFyY2hpdGVjdHVyZXM6IHg4
NgorOlZlcnNpb25zOiA+PSAxCis6QWN0aW9uczogQ09OVElOVUUsIENSQVNICis6UGFyYW1ldGVy
czoKKworOjoKKworCXN0cnVjdCBrdm1pX2V2ZW50X2hkcjsKKwlzdHJ1Y3Qga3ZtaV92Y3B1X2V2
ZW50OworCis6UmV0dXJuczoKKworOjoKKworCXN0cnVjdCBrdm1pX3ZjcHVfaGRyOworCXN0cnVj
dCBrdm1pX3ZjcHVfZXZlbnRfcmVwbHk7CisKK1RoaXMgZXZlbnQgaXMgc2VudCBvbiBhIHNwZWNp
ZmljIHVzZXIgaHlwZXJjYWxsIHdoZW4gdGhlIGludHJvc3BlY3Rpb24gaGFzCitiZWVuIGVuYWJs
ZWQgZm9yIHRoaXMgZXZlbnQgKHNlZSAqS1ZNSV9WQ1BVX0NPTlRST0xfRVZFTlRTKikuCisKK1Ro
ZSBoeXBlcmNhbGwgbnVtYmVyIG11c3QgYmUgYGBLVk1fSENfWEVOX0hWTV9PUGBgIHdpdGggdGhl
CitgYEtWTV9IQ19YRU5fSFZNX09QX0dVRVNUX1JFUVVFU1RfVk1fRVZFTlRgYCBzdWItZnVuY3Rp
b24KKyhzZWUgaHlwZXJjYWxscy5yc3QpLgorCitJdCBpcyB1c2VkIGJ5IHRoZSBjb2RlIHJlc2lk
aW5nIGluc2lkZSB0aGUgaW50cm9zcGVjdGVkIGd1ZXN0IHRvIGNhbGwgdGhlCitpbnRyb3NwZWN0
aW9uIHRvb2wgYW5kIHRvIHJlcG9ydCBjZXJ0YWluIGRldGFpbHMgYWJvdXQgaXRzIG9wZXJhdGlv
bi4gRm9yCitleGFtcGxlLCBhIGNsYXNzaWMgYW50aW1hbHdhcmUgcmVtZWRpYXRpb24gdG9vbCBj
YW4gcmVwb3J0IHdoYXQgaXQgaGFzCitmb3VuZCBkdXJpbmcgYSBzY2FuLgorCitUaGUgbW9zdCB1
c2VmdWwgcmVnaXN0ZXJzIGRlc2NyaWJpbmcgdGhlIHZDUFUgc3RhdGUgY2FuIGJlIHJlYWQgZnJv
bQorYGBrdm1pX3ZjcHVfZXZlbnQuYXJjaC5yZWdzYGAuCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9p
bmNsdWRlL3VhcGkvYXNtL2t2bWkuaCBiL2FyY2gveDg2L2luY2x1ZGUvdWFwaS9hc20va3ZtaS5o
CmluZGV4IDM2MzFkYTllZWY4Yy4uYTQ0MmJhNGQyMTkwIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9p
bmNsdWRlL3VhcGkvYXNtL2t2bWkuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL2t2
bWkuaApAQCAtOCw2ICs4LDEwIEBACiAKICNpbmNsdWRlIDxhc20va3ZtLmg+CiAKK2VudW0gewor
CUtWTV9IQ19YRU5fSFZNX09QX0dVRVNUX1JFUVVFU1RfVk1fRVZFTlQgPSAyNCwKK307CisKIHN0
cnVjdCBrdm1pX3ZjcHVfZ2V0X2luZm9fcmVwbHkgewogCV9fdTY0IHRzY19zcGVlZDsKIH07CmRp
ZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0va3ZtaS5jIGIvYXJjaC94ODYva3ZtL2t2bWkuYwppbmRl
eCA4MDhiNzE3NmU3ZDguLjVkOTg5MTI5OWE1NiAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL2t2
bWkuYworKysgYi9hcmNoL3g4Ni9rdm0va3ZtaS5jCkBAIC0xMSw2ICsxMSw3IEBACiAKIHZvaWQg
a3ZtaV9hcmNoX2luaXRfdmNwdV9ldmVudHNfbWFzayh1bnNpZ25lZCBsb25nICpzdXBwb3J0ZWQp
CiB7CisJc2V0X2JpdChLVk1JX1ZDUFVfRVZFTlRfSFlQRVJDQUxMLCBzdXBwb3J0ZWQpOwogfQog
CiBzdGF0aWMgdW5zaWduZWQgaW50IGt2bWlfdmNwdV9tb2RlKGNvbnN0IHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSwKQEAgLTE0MCwzICsxNDEsMjIgQEAgdm9pZCBrdm1pX2FyY2hfcG9zdF9yZXBseShz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAJa3ZtX2FyY2hfdmNwdV9zZXRfcmVncyh2Y3B1LCAmdmNw
dWktPmFyY2guZGVsYXllZF9yZWdzLCBmYWxzZSk7CiAJdmNwdWktPmFyY2guaGF2ZV9kZWxheWVk
X3JlZ3MgPSBmYWxzZTsKIH0KKworYm9vbCBrdm1pX2FyY2hfaXNfYWdlbnRfaHlwZXJjYWxsKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSkKK3sKKwl1bnNpZ25lZCBsb25nIHN1YmZ1bmMxLCBzdWJmdW5j
MjsKKwlib29sIGxvbmdtb2RlID0gaXNfNjRfYml0X21vZGUodmNwdSk7CisKKwlpZiAobG9uZ21v
ZGUpIHsKKwkJc3ViZnVuYzEgPSBrdm1fcmRpX3JlYWQodmNwdSk7CisJCXN1YmZ1bmMyID0ga3Zt
X3JzaV9yZWFkKHZjcHUpOworCX0gZWxzZSB7CisJCXN1YmZ1bmMxID0ga3ZtX3JieF9yZWFkKHZj
cHUpOworCQlzdWJmdW5jMSAmPSAweEZGRkZGRkZGOworCQlzdWJmdW5jMiA9IGt2bV9yY3hfcmVh
ZCh2Y3B1KTsKKwkJc3ViZnVuYzIgJj0gMHhGRkZGRkZGRjsKKwl9CisKKwlyZXR1cm4gKHN1YmZ1
bmMxID09IEtWTV9IQ19YRU5fSFZNX09QX0dVRVNUX1JFUVVFU1RfVk1fRVZFTlQKKwkJJiYgc3Vi
ZnVuYzIgPT0gMCk7Cit9CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0veDg2LmMgYi9hcmNoL3g4
Ni9rdm0veDg2LmMKaW5kZXggMDMxNWM1YTk0YWYzLi40MTU5MzQ2MjRhZmIgMTAwNjQ0Ci0tLSBh
L2FyY2gveDg2L2t2bS94ODYuYworKysgYi9hcmNoL3g4Ni9rdm0veDg2LmMKQEAgLTg2NzgsMTQg
Kzg2NzgsMTcgQEAgaW50IGt2bV9lbXVsYXRlX2h5cGVyY2FsbChzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUpCiB7CiAJdW5zaWduZWQgbG9uZyBuciwgYTAsIGExLCBhMiwgYTMsIHJldDsKIAlpbnQgb3Bf
NjRfYml0OworCWJvb2wga3ZtaV9oYzsKIAotCWlmIChrdm1feGVuX2h5cGVyY2FsbF9lbmFibGVk
KHZjcHUtPmt2bSkpCisJbnIgPSBrdm1fcmF4X3JlYWQodmNwdSk7CisJa3ZtaV9oYyA9ICh1MzIp
bnIgPT0gS1ZNX0hDX1hFTl9IVk1fT1A7CisKKwlpZiAoa3ZtX3hlbl9oeXBlcmNhbGxfZW5hYmxl
ZCh2Y3B1LT5rdm0pICYmICFrdm1pX2hjKQogCQlyZXR1cm4ga3ZtX3hlbl9oeXBlcmNhbGwodmNw
dSk7CiAKLQlpZiAoa3ZtX2h2X2h5cGVyY2FsbF9lbmFibGVkKHZjcHUpKQorCWlmIChrdm1faHZf
aHlwZXJjYWxsX2VuYWJsZWQodmNwdSkgJiYgIWt2bWlfaGMpCiAJCXJldHVybiBrdm1faHZfaHlw
ZXJjYWxsKHZjcHUpOwogCi0JbnIgPSBrdm1fcmF4X3JlYWQodmNwdSk7CiAJYTAgPSBrdm1fcmJ4
X3JlYWQodmNwdSk7CiAJYTEgPSBrdm1fcmN4X3JlYWQodmNwdSk7CiAJYTIgPSBrdm1fcmR4X3Jl
YWQodmNwdSk7CkBAIC04NzAyLDcgKzg3MDUsNyBAQCBpbnQga3ZtX2VtdWxhdGVfaHlwZXJjYWxs
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIAkJYTMgJj0gMHhGRkZGRkZGRjsKIAl9CiAKLQlpZiAo
c3RhdGljX2NhbGwoa3ZtX3g4Nl9nZXRfY3BsKSh2Y3B1KSAhPSAwKSB7CisJaWYgKHN0YXRpY19j
YWxsKGt2bV94ODZfZ2V0X2NwbCkodmNwdSkgIT0gMCAmJiAha3ZtaV9oYykgewogCQlyZXQgPSAt
S1ZNX0VQRVJNOwogCQlnb3RvIG91dDsKIAl9CkBAIC04NzYxLDYgKzg3NjQsMTMgQEAgaW50IGt2
bV9lbXVsYXRlX2h5cGVyY2FsbChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAJCXZjcHUtPmFyY2gu
Y29tcGxldGVfdXNlcnNwYWNlX2lvID0gY29tcGxldGVfaHlwZXJjYWxsX2V4aXQ7CiAJCXJldHVy
biAwOwogCX0KKyNpZmRlZiBDT05GSUdfS1ZNX0lOVFJPU1BFQ1RJT04KKwljYXNlIEtWTV9IQ19Y
RU5fSFZNX09QOgorCQlyZXQgPSAwOworCQlpZiAoIWt2bWlfaHlwZXJjYWxsX2V2ZW50KHZjcHUp
KQorCQkJcmV0ID0gLUtWTV9FTk9TWVM7CisJCWJyZWFrOworI2VuZGlmIC8qIENPTkZJR19LVk1f
SU5UUk9TUEVDVElPTiAqLwogCWRlZmF1bHQ6CiAJCXJldCA9IC1LVk1fRU5PU1lTOwogCQlicmVh
azsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgva3ZtaV9ob3N0LmggYi9pbmNsdWRlL2xpbnV4
L2t2bWlfaG9zdC5oCmluZGV4IDVlNWQyNTVlNWEyYy4uMWZiNzc1YjBkZTMzIDEwMDY0NAotLS0g
YS9pbmNsdWRlL2xpbnV4L2t2bWlfaG9zdC5oCisrKyBiL2luY2x1ZGUvbGludXgva3ZtaV9ob3N0
LmgKQEAgLTY5LDYgKzY5LDcgQEAgaW50IGt2bWlfaW9jdGxfZXZlbnQoc3RydWN0IGt2bSAqa3Zt
LAogaW50IGt2bWlfaW9jdGxfcHJldW5ob29rKHN0cnVjdCBrdm0gKmt2bSk7CiAKIHZvaWQga3Zt
aV9oYW5kbGVfcmVxdWVzdHMoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKK2Jvb2wga3ZtaV9oeXBl
cmNhbGxfZXZlbnQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIAogI2Vsc2UKIApAQCAtODAsNiAr
ODEsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQga3ZtaV9kZXN0cm95X3ZtKHN0cnVjdCBrdm0gKmt2
bSkgeyB9CiBzdGF0aWMgaW5saW5lIHZvaWQga3ZtaV92Y3B1X3VuaW5pdChzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHUpIHsgfQogCiBzdGF0aWMgaW5saW5lIHZvaWQga3ZtaV9oYW5kbGVfcmVxdWVzdHMo
c3RydWN0IGt2bV92Y3B1ICp2Y3B1KSB7IH0KK3N0YXRpYyBpbmxpbmUgYm9vbCBrdm1pX2h5cGVy
Y2FsbF9ldmVudChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpIHsgcmV0dXJuIGZhbHNlOyB9CiAKICNl
bmRpZiAvKiBDT05GSUdfS1ZNX0lOVFJPU1BFQ1RJT04gKi8KIApkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS91YXBpL2xpbnV4L2t2bV9wYXJhLmggYi9pbmNsdWRlL3VhcGkvbGludXgva3ZtX3BhcmEuaApp
bmRleCAxNmE4Njc5MTA0NTkuLjZhNzZlNTQ0OTljYSAxMDA2NDQKLS0tIGEvaW5jbHVkZS91YXBp
L2xpbnV4L2t2bV9wYXJhLmgKKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L2t2bV9wYXJhLmgKQEAg
LTM0LDYgKzM0LDcgQEAKICNkZWZpbmUgS1ZNX0hDX1NFTkRfSVBJCQkxMAogI2RlZmluZSBLVk1f
SENfU0NIRURfWUlFTEQJCTExCiAjZGVmaW5lIEtWTV9IQ19NQVBfR1BBX1JBTkdFCQkxMgorI2Rl
ZmluZSBLVk1fSENfWEVOX0hWTV9PUAkJMzQgLyogWGVuJ3MgX19IWVBFUlZJU09SX2h2bV9vcCAq
LwogCiAvKgogICogaHlwZXJjYWxscyB1c2UgYXJjaGl0ZWN0dXJlIHNwZWNpZmljCmRpZmYgLS1n
aXQgYS9pbmNsdWRlL3VhcGkvbGludXgva3ZtaS5oIGIvaW5jbHVkZS91YXBpL2xpbnV4L2t2bWku
aAppbmRleCAyYzkzYTM2YmZhNDMuLjNkZmMzNDg2Y2M0NiAxMDA2NDQKLS0tIGEvaW5jbHVkZS91
YXBpL2xpbnV4L2t2bWkuaAorKysgYi9pbmNsdWRlL3VhcGkvbGludXgva3ZtaS5oCkBAIC01NCw3
ICs1NCw4IEBAIGVudW0gewogfTsKIAogZW51bSB7Ci0JS1ZNSV9WQ1BVX0VWRU5UX1BBVVNFID0g
S1ZNSV9WQ1BVX0VWRU5UX0lEKDApLAorCUtWTUlfVkNQVV9FVkVOVF9QQVVTRSAgICAgPSBLVk1J
X1ZDUFVfRVZFTlRfSUQoMCksCisJS1ZNSV9WQ1BVX0VWRU5UX0hZUEVSQ0FMTCA9IEtWTUlfVkNQ
VV9FVkVOVF9JRCgxKSwKIAogCUtWTUlfTkVYVF9WQ1BVX0VWRU5UCiB9OwpkaWZmIC0tZ2l0IGEv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3g4Nl82NC9rdm1pX3Rlc3QuYyBiL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2t2bS94ODZfNjQva3ZtaV90ZXN0LmMKaW5kZXggODM3ZDE0ZGFlNDQ4
Li45MzU3MzMwNzg4OGYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS94
ODZfNjQva3ZtaV90ZXN0LmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3g4Nl82
NC9rdm1pX3Rlc3QuYwpAQCAtNTMsNiArNTMsNyBAQCBzdHJ1Y3QgdmNwdV93b3JrZXJfZGF0YSB7
CiAKIGVudW0gewogCUdVRVNUX1RFU1RfTk9PUCA9IDAsCisJR1VFU1RfVEVTVF9IWVBFUkNBTEws
CiB9OwogCiAjZGVmaW5lIEdVRVNUX1JFUVVFU1RfVEVTVCgpICAgICBHVUVTVF9TWU5DKDApCkBA
IC03MCwxMiArNzEsMjMgQEAgc3RhdGljIGludCBndWVzdF90ZXN0X2lkKHZvaWQpCiAJcmV0dXJu
IFJFQURfT05DRSh0ZXN0X2lkKTsKIH0KIAorc3RhdGljIHZvaWQgZ3Vlc3RfaHlwZXJjYWxsX3Rl
c3Qodm9pZCkKK3sKKwlhc20gdm9sYXRpbGUoIm1vdiAkMzQsICVyYXgiKTsKKwlhc20gdm9sYXRp
bGUoIm1vdiAkMjQsICVyZGkiKTsKKwlhc20gdm9sYXRpbGUoIm1vdiAkMCwgJXJzaSIpOworCWFz
bSB2b2xhdGlsZSgiLmJ5dGUgMHgwZiwweDAxLDB4YzEiKTsKK30KKwogc3RhdGljIHZvaWQgZ3Vl
c3RfY29kZSh2b2lkKQogewogCXdoaWxlICh0cnVlKSB7CiAJCXN3aXRjaCAoZ3Vlc3RfdGVzdF9p
ZCgpKSB7CiAJCWNhc2UgR1VFU1RfVEVTVF9OT09QOgogCQkJYnJlYWs7CisJCWNhc2UgR1VFU1Rf
VEVTVF9IWVBFUkNBTEw6CisJCQlndWVzdF9oeXBlcmNhbGxfdGVzdCgpOworCQkJYnJlYWs7CiAJ
CX0KIAkJR1VFU1RfU0lHTkFMX1RFU1RfRE9ORSgpOwogCX0KQEAgLTk5MSw2ICsxMDAzLDM1IEBA
IHN0YXRpYyB2b2lkIHRlc3RfY21kX3ZjcHVfZ2V0X2NwdWlkKHN0cnVjdCBrdm1fdm0gKnZtKQog
CSAgICAgIGZ1bmN0aW9uLCBpbmRleCwgcnBsLmVheCwgcnBsLmVieCwgcnBsLmVjeCwgcnBsLmVk
eCk7CiB9CiAKK3N0YXRpYyB2b2lkIHRlc3RfZXZlbnRfaHlwZXJjYWxsKHN0cnVjdCBrdm1fdm0g
KnZtKQoreworCXN0cnVjdCB2Y3B1X3dvcmtlcl9kYXRhIGRhdGEgPSB7CisJCS52bSA9IHZtLAor
CQkudmNwdV9pZCA9IFZDUFVfSUQsCisJCS50ZXN0X2lkID0gR1VFU1RfVEVTVF9IWVBFUkNBTEws
CisJfTsKKwlzdHJ1Y3Qga3ZtaV9tc2dfaGRyIGhkcjsKKwlzdHJ1Y3QgdmNwdV9ldmVudCBldjsK
KwlzdHJ1Y3QgdmNwdV9yZXBseSBycGwgPSB7fTsKKwlfX3UxNiBldmVudF9pZCA9IEtWTUlfVkNQ
VV9FVkVOVF9IWVBFUkNBTEw7CisJcHRocmVhZF90IHZjcHVfdGhyZWFkOworCisJZW5hYmxlX3Zj
cHVfZXZlbnQodm0sIGV2ZW50X2lkKTsKKworCXZjcHVfdGhyZWFkID0gc3RhcnRfdmNwdV93b3Jr
ZXIoJmRhdGEpOworCisJcmVjZWl2ZV92Y3B1X2V2ZW50KCZoZHIsICZldiwgc2l6ZW9mKGV2KSwg
ZXZlbnRfaWQpOworCisJcHJfZGVidWcoIkh5cGVyY2FsbCBldmVudCwgcmlwIDB4JWxseFxuIiwg
ZXYuY29tbW9uLmFyY2gucmVncy5yaXApOworCisJcmVwbHlfdG9fZXZlbnQoJmhkciwgJmV2LCBL
Vk1JX0VWRU5UX0FDVElPTl9DT05USU5VRSwKKwkJCSZycGwsIHNpemVvZihycGwpKTsKKworCXdh
aXRfdmNwdV93b3JrZXIodmNwdV90aHJlYWQpOworCisJZGlzYWJsZV92Y3B1X2V2ZW50KHZtLCBl
dmVudF9pZCk7Cit9CisKIHN0YXRpYyB2b2lkIHRlc3RfaW50cm9zcGVjdGlvbihzdHJ1Y3Qga3Zt
X3ZtICp2bSkKIHsKIAlzcmFuZG9tKHRpbWUoMCkpOwpAQCAtMTAxMSw2ICsxMDUyLDcgQEAgc3Rh
dGljIHZvaWQgdGVzdF9pbnRyb3NwZWN0aW9uKHN0cnVjdCBrdm1fdm0gKnZtKQogCXRlc3RfY21k
X3ZjcHVfZ2V0X3JlZ2lzdGVycyh2bSk7CiAJdGVzdF9jbWRfdmNwdV9zZXRfcmVnaXN0ZXJzKHZt
KTsKIAl0ZXN0X2NtZF92Y3B1X2dldF9jcHVpZCh2bSk7CisJdGVzdF9ldmVudF9oeXBlcmNhbGwo
dm0pOwogCiAJdW5ob29rX2ludHJvc3BlY3Rpb24odm0pOwogfQpkaWZmIC0tZ2l0IGEvdmlydC9r
dm0vaW50cm9zcGVjdGlvbi9rdm1pLmMgYi92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWkuYwpp
bmRleCA5NmY2MDlmNjY5NGEuLmYyM2MwMjU5NzhmYSAxMDA2NDQKLS0tIGEvdmlydC9rdm0vaW50
cm9zcGVjdGlvbi9rdm1pLmMKKysrIGIvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pLmMKQEAg
LTgzNywzICs4MzcsNDEgQEAgaW50IGt2bWlfY21kX3ZjcHVfcGF1c2Uoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LCBib29sIHdhaXQpCiAKIAlyZXR1cm4gMDsKIH0KKworc3RhdGljIGJvb2wgX19rdm1p
X2h5cGVyY2FsbF9ldmVudChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCit7CisJdTMyIGFjdGlvbjsK
Kwlib29sIHJldDsKKworCWFjdGlvbiA9IGt2bWlfbXNnX3NlbmRfdmNwdV9oeXBlcmNhbGwodmNw
dSk7CisJc3dpdGNoIChhY3Rpb24pIHsKKwljYXNlIEtWTUlfRVZFTlRfQUNUSU9OX0NPTlRJTlVF
OgorCQlyZXQgPSB0cnVlOworCQlicmVhazsKKwlkZWZhdWx0OgorCQlrdm1pX2hhbmRsZV9jb21t
b25fZXZlbnRfYWN0aW9ucyh2Y3B1LCBhY3Rpb24pOworCQlyZXQgPSBmYWxzZTsKKwl9CisKKwly
ZXR1cm4gcmV0OworfQorCitib29sIGt2bWlfaHlwZXJjYWxsX2V2ZW50KHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSkKK3sKKwlzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2bWk7CisJYm9vbCByZXQg
PSBmYWxzZTsKKworCWlmICgha3ZtaV9hcmNoX2lzX2FnZW50X2h5cGVyY2FsbCh2Y3B1KSkKKwkJ
cmV0dXJuIHJldDsKKworCWt2bWkgPSBrdm1pX2dldCh2Y3B1LT5rdm0pOworCWlmICgha3ZtaSkK
KwkJcmV0dXJuIHJldDsKKworCWlmIChpc192Y3B1X2V2ZW50X2VuYWJsZWQodmNwdSwgS1ZNSV9W
Q1BVX0VWRU5UX0hZUEVSQ0FMTCkpCisJCXJldCA9IF9fa3ZtaV9oeXBlcmNhbGxfZXZlbnQodmNw
dSk7CisKKwlrdm1pX3B1dCh2Y3B1LT5rdm0pOworCisJcmV0dXJuIHJldDsKK30KZGlmZiAtLWdp
dCBhL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9pbnQuaCBiL3ZpcnQva3ZtL2ludHJvc3Bl
Y3Rpb24va3ZtaV9pbnQuaAppbmRleCAwMTg3NjRjYTFiNzEuLjcyZjBiNzVkMmNmNSAxMDA2NDQK
LS0tIGEvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX2ludC5oCisrKyBiL3ZpcnQva3ZtL2lu
dHJvc3BlY3Rpb24va3ZtaV9pbnQuaApAQCAtMjYsNiArMjYsMTEgQEAgdHlwZWRlZiBpbnQgKCpr
dm1pX3ZjcHVfbXNnX2pvYl9mY3QpKGNvbnN0IHN0cnVjdCBrdm1pX3ZjcHVfbXNnX2pvYiAqam9i
LAogCQkJCSAgICAgY29uc3Qgc3RydWN0IGt2bWlfbXNnX2hkciAqbXNnLAogCQkJCSAgICAgY29u
c3Qgdm9pZCAqcmVxKTsKIAorc3RhdGljIGlubGluZSBib29sIGlzX3ZjcHVfZXZlbnRfZW5hYmxl
ZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHUxNiBldmVudF9pZCkKK3sKKwlyZXR1cm4gdGVzdF9i
aXQoZXZlbnRfaWQsIFZDUFVJKHZjcHUpLT5ldl9lbmFibGVfbWFzayk7Cit9CisKIC8qIGt2bWlf
bXNnLmMgKi8KIGJvb2wga3ZtaV9zb2NrX2dldChzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2
bWksIGludCBmZCk7CiB2b2lkIGt2bWlfc29ja19zaHV0ZG93bihzdHJ1Y3Qga3ZtX2ludHJvc3Bl
Y3Rpb24gKmt2bWkpOwpAQCAtMzksNiArNDQsNyBAQCBpbnQga3ZtaV9tc2dfdmNwdV9yZXBseShj
b25zdCBzdHJ1Y3Qga3ZtaV92Y3B1X21zZ19qb2IgKmpvYiwKIAkJCWNvbnN0IHN0cnVjdCBrdm1p
X21zZ19oZHIgKm1zZywgaW50IGVyciwKIAkJCWNvbnN0IHZvaWQgKnJwbCwgc2l6ZV90IHJwbF9z
aXplKTsKIHUzMiBrdm1pX21zZ19zZW5kX3ZjcHVfcGF1c2Uoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
KTsKK3UzMiBrdm1pX21zZ19zZW5kX3ZjcHVfaHlwZXJjYWxsKHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSk7CiAKIC8qIGt2bWkuYyAqLwogdm9pZCAqa3ZtaV9tc2dfYWxsb2Modm9pZCk7CkBAIC01Miw2
ICs1OCw3IEBAIGludCBrdm1pX2FkZF9qb2Ioc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCQkgdm9p
ZCAoKmZjdCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB2b2lkICpjdHgpLAogCQkgdm9pZCAqY3R4
LCB2b2lkICgqZnJlZV9mY3QpKHZvaWQgKmN0eCkpOwogdm9pZCBrdm1pX3J1bl9qb2JzKHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSk7Cit2b2lkIGt2bWlfaGFuZGxlX2NvbW1vbl9ldmVudF9hY3Rpb25z
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdTMyIGFjdGlvbik7CiBpbnQga3ZtaV9jbWRfdm1fY29u
dHJvbF9ldmVudHMoc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uICprdm1pLAogCQkJICAgICAgIHUx
NiBldmVudF9pZCwgYm9vbCBlbmFibGUpOwogaW50IGt2bWlfY21kX3ZjcHVfY29udHJvbF9ldmVu
dHMoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LApAQCAtNzEsNSArNzgsNiBAQCBrdm1pX3ZjcHVfbXNn
X2pvYl9mY3Qga3ZtaV9hcmNoX3ZjcHVfbXNnX2hhbmRsZXIodTE2IGlkKTsKIHZvaWQga3ZtaV9h
cmNoX3NldHVwX3ZjcHVfZXZlbnQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCQkJCXN0cnVjdCBr
dm1pX3ZjcHVfZXZlbnQgKmV2KTsKIHZvaWQga3ZtaV9hcmNoX3Bvc3RfcmVwbHkoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1KTsKK2Jvb2wga3ZtaV9hcmNoX2lzX2FnZW50X2h5cGVyY2FsbChzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUpOwogCiAjZW5kaWYKZGlmZiAtLWdpdCBhL3ZpcnQva3ZtL2ludHJvc3Bl
Y3Rpb24va3ZtaV9tc2cuYyBiL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9tc2cuYwppbmRl
eCA4ZWUwMjRmYTU5ZDAuLjFmZTI4MGQ1YTJkNiAxMDA2NDQKLS0tIGEvdmlydC9rdm0vaW50cm9z
cGVjdGlvbi9rdm1pX21zZy5jCisrKyBiL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9tc2cu
YwpAQCAtNzQ0LDMgKzc0NCwxNiBAQCB1MzIga3ZtaV9tc2dfc2VuZF92Y3B1X3BhdXNlKHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSkKIAogCXJldHVybiBhY3Rpb247CiB9CisKK3UzMiBrdm1pX21zZ19z
ZW5kX3ZjcHVfaHlwZXJjYWxsKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKK3sKKwl1MzIgYWN0aW9u
OworCWludCBlcnI7CisKKwllcnIgPSBrdm1pX3NlbmRfdmNwdV9ldmVudCh2Y3B1LCBLVk1JX1ZD
UFVfRVZFTlRfSFlQRVJDQUxMLCBOVUxMLCAwLAorCQkJCSAgIE5VTEwsIDAsICZhY3Rpb24pOwor
CWlmIChlcnIpCisJCXJldHVybiBLVk1JX0VWRU5UX0FDVElPTl9DT05USU5VRTsKKworCXJldHVy
biBhY3Rpb247Cit9Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51
eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
