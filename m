Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F08A228B32
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 23:26:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5565A87C9C;
	Tue, 21 Jul 2020 21:26:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DT-LSxBOx6uO; Tue, 21 Jul 2020 21:26:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DC4DF884F2;
	Tue, 21 Jul 2020 21:26:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A5F43C016F;
	Tue, 21 Jul 2020 21:26:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BA347C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A888B882CB
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:26:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EquDftAEPQfV
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:26:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DF0C288280
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:56 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 7CA13305D4F3; Wed, 22 Jul 2020 00:09:28 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 55659304FA14;
 Wed, 22 Jul 2020 00:09:28 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v9 59/84] KVM: introspection: add KVMI_EVENT_HYPERCALL
Date: Wed, 22 Jul 2020 00:08:57 +0300
Message-Id: <20200721210922.7646-60-alazar@bitdefender.com>
In-Reply-To: <20200721210922.7646-1-alazar@bitdefender.com>
References: <20200721210922.7646-1-alazar@bitdefender.com>
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
CiBEb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2t2bWkucnN0ICAgICAgICAgICAgICAgfCAzNiArKysr
KysrKysrKysrKystCiBhcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL2t2bWkuaCAgICAgICAgICAg
ICAgfCAgMiArCiBhcmNoL3g4Ni9rdm0va3ZtaS5jICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAzMiArKysrKysrKysrKysrKwogYXJjaC94ODYva3ZtL3g4Ni5jICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgMTggKysrKysrLS0KIGluY2x1ZGUvbGludXgva3ZtaV9ob3N0LmggICAgICAg
ICAgICAgICAgICAgICB8ICAyICsKIGluY2x1ZGUvdWFwaS9saW51eC9rdm1fcGFyYS5oICAgICAg
ICAgICAgICAgICB8ICAxICsKIGluY2x1ZGUvdWFwaS9saW51eC9rdm1pLmggICAgICAgICAgICAg
ICAgICAgICB8ICAxICsKIC4uLi90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0veDg2XzY0L2t2bWlfdGVz
dC5jICB8IDQyICsrKysrKysrKysrKysrKysrKysKIHZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3Zt
aS5jICAgICAgICAgICAgICAgICB8IDIzICsrKysrKysrKysKIHZpcnQva3ZtL2ludHJvc3BlY3Rp
b24va3ZtaV9pbnQuaCAgICAgICAgICAgICB8ICA5ICsrKysKIHZpcnQva3ZtL2ludHJvc3BlY3Rp
b24va3ZtaV9tc2cuYyAgICAgICAgICAgICB8IDEyICsrKysrKwogMTIgZmlsZXMgY2hhbmdlZCwg
MjA4IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi92aXJ0L2t2bS9oeXBlcmNhbGxzLnJzdCBiL0RvY3VtZW50YXRpb24vdmlydC9rdm0vaHlw
ZXJjYWxscy5yc3QKaW5kZXggNzBlNzdjNjZiNjRjLi5hYmZiZmY5NmI5ZTMgMTAwNjQ0Ci0tLSBh
L0RvY3VtZW50YXRpb24vdmlydC9rdm0vaHlwZXJjYWxscy5yc3QKKysrIGIvRG9jdW1lbnRhdGlv
bi92aXJ0L2t2bS9oeXBlcmNhbGxzLnJzdApAQCAtMTY5LDMgKzE2OSwzOCBAQCBhMDogZGVzdGlu
YXRpb24gQVBJQyBJRAogCiA6VXNhZ2UgZXhhbXBsZTogV2hlbiBzZW5kaW5nIGEgY2FsbC1mdW5j
dGlvbiBJUEktbWFueSB0byB2Q1BVcywgeWllbGQgaWYKIAkgICAgICAgIGFueSBvZiB0aGUgSVBJ
IHRhcmdldCB2Q1BVcyB3YXMgcHJlZW1wdGVkLgorCis5LiBLVk1fSENfWEVOX0hWTV9PUAorLS0t
LS0tLS0tLS0tLS0tLS0tLS0KKworOkFyY2hpdGVjdHVyZTogeDg2Cis6U3RhdHVzOiBhY3RpdmUK
KzpQdXJwb3NlOiBUbyBlbmFibGUgY29tbXVuaWNhdGlvbiBiZXR3ZWVuIGEgZ3Vlc3QgYWdlbnQg
YW5kIGEgVk1JIGFwcGxpY2F0aW9uCisKK1VzYWdlOgorCitBbiBldmVudCB3aWxsIGJlIHNlbnQg
dG8gdGhlIFZNSSBhcHBsaWNhdGlvbiAoc2VlIGt2bWkucnN0KSBpZiB0aGUgZm9sbG93aW5nCity
ZWdpc3RlcnMsIHdoaWNoIGRpZmZlciBiZXR3ZWVuIDMyYml0IGFuZCA2NGJpdCwgaGF2ZSB0aGUg
Zm9sbG93aW5nIHZhbHVlczoKKworICAgICAgID09PT09PT09ICAgID09PT09ICAgICA9PT09PQor
ICAgICAgIDMyYml0ICAgICAgIDY0Yml0ICAgICB2YWx1ZQorICAgICAgID09PT09PT09ICAgID09
PT09ICAgICA9PT09PQorICAgICAgIGVieCAoYTApICAgIHJkaSAgICAgICBLVk1fSENfWEVOX0hW
TV9PUF9HVUVTVF9SRVFVRVNUX1ZNX0VWRU5UCisgICAgICAgZWN4IChhMSkgICAgcnNpICAgICAg
IDAKKyAgICAgICA9PT09PT09PSAgICA9PT09PSAgICAgPT09PT0KKworVGhpcyBzcGVjaWZpY2F0
aW9uIGNvcGllcyBYZW4ncyB7IF9fSFlQRVJWSVNPUl9odm1fb3AsCitIVk1PUF9ndWVzdF9yZXF1
ZXN0X3ZtX2V2ZW50IH0gaHlwZXJjYWxsIGFuZCBjYW4gb3JpZ2luYXRlIGZyb20ga2VybmVsIG9y
Cit1c2Vyc3BhY2UuCisKK0l0IHJldHVybnMgMCBpZiBzdWNjZXNzZnVsLCBvciBhIG5lZ2F0aXZl
IFBPU0lYLjEgZXJyb3IgY29kZSBpZiBpdCBmYWlscy4gVGhlCithYnNlbmNlIG9mIGFuIGFjdGl2
ZSBWTUkgYXBwbGljYXRpb24gaXMgbm90IHNpZ25hbGVkIGluIGFueSB3YXkuCisKK1RoZSBmb2xs
b3dpbmcgcmVnaXN0ZXJzIGFyZSBjbG9iYmVyZWQ6CisKKyAgKiAzMmJpdDogZWR4LCBlc2ksIGVk
aSwgZWJwCisgICogNjRiaXQ6IHJkeCwgcjEwLCByOCwgcjkKKworSW4gcGFydGljdWxhciwgZm9y
IEtWTV9IQ19YRU5fSFZNX09QX0dVRVNUX1JFUVVFU1RfVk1fRVZFTlQsIHRoZSBsYXN0IHR3bwor
cmVnaXN0ZXJzIGNhbiBiZSBwb2lzb25lZCBkZWxpYmVyYXRlbHkgYW5kIGNhbm5vdCBiZSB1c2Vk
IGZvciBwYXNzaW5nCitpbmZvcm1hdGlvbi4KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdmly
dC9rdm0va3ZtaS5yc3QgYi9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2t2bWkucnN0CmluZGV4IGZj
MmU4Yzc1NjE5MS4uZDA2MmYyY2NmMzY1IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL3ZpcnQv
a3ZtL2t2bWkucnN0CisrKyBiL0RvY3VtZW50YXRpb24vdmlydC9rdm0va3ZtaS5yc3QKQEAgLTU0
Niw3ICs1NDYsMTAgQEAgY29tbWFuZCkgYmVmb3JlIHJldHVybmluZyB0byBndWVzdC4KIAogCXN0
cnVjdCBrdm1pX2Vycm9yX2NvZGUKIAotRW5hYmxlcy9kaXNhYmxlcyB2Q1BVIGludHJvc3BlY3Rp
b24gZXZlbnRzLgorRW5hYmxlcy9kaXNhYmxlcyB2Q1BVIGludHJvc3BlY3Rpb24gZXZlbnRzLiBU
aGlzIGNvbW1hbmQgY2FuIGJlIHVzZWQgd2l0aAordGhlIGZvbGxvd2luZyBldmVudHM6OgorCisJ
S1ZNSV9FVkVOVF9IWVBFUkNBTEwKIAogV2hlbiBhbiBldmVudCBpcyBlbmFibGVkLCB0aGUgaW50
cm9zcGVjdGlvbiB0b29sIGlzIG5vdGlmaWVkIGFuZAogbXVzdCByZXBseSB3aXRoOiBjb250aW51
ZSwgcmV0cnksIGNyYXNoLCBldGMuIChzZWUgKipFdmVudHMqKiBiZWxvdykuCkBAIC03ODYsMyAr
Nzg5LDM0IEBAIGNhbm5vdCBiZSBjb250cm9sbGVkIHdpdGggKktWTUlfVkNQVV9DT05UUk9MX0VW
RU5UUyouCiBCZWNhdXNlIGl0IGhhcyBhIGxvdyBwcmlvcml0eSwgaXQgd2lsbCBiZSBzZW50IGFm
dGVyIGFueSBvdGhlciB2Q1BVCiBpbnRyb3NwZWN0aW9uIGV2ZW50IGFuZCB3aGVuIG5vIG90aGVy
IHZDUFUgaW50cm9zcGVjdGlvbiBjb21tYW5kIGlzCiBxdWV1ZWQuCisKKzMuIEtWTUlfRVZFTlRf
SFlQRVJDQUxMCistLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorCis6QXJjaGl0ZWN0dXJlczogeDg2
Cis6VmVyc2lvbnM6ID49IDEKKzpBY3Rpb25zOiBDT05USU5VRSwgQ1JBU0gKKzpQYXJhbWV0ZXJz
OgorCis6OgorCisJc3RydWN0IGt2bWlfZXZlbnQ7CisKKzpSZXR1cm5zOgorCis6OgorCisJc3Ry
dWN0IGt2bWlfdmNwdV9oZHI7CisJc3RydWN0IGt2bWlfZXZlbnRfcmVwbHk7CisKK1RoaXMgZXZl
bnQgaXMgc2VudCBvbiBhIHNwZWNpZmljIHVzZXIgaHlwZXJjYWxsIHdoZW4gdGhlIGludHJvc3Bl
Y3Rpb24gaGFzCitiZWVuIGVuYWJsZWQgZm9yIHRoaXMgZXZlbnQgKHNlZSAqS1ZNSV9WQ1BVX0NP
TlRST0xfRVZFTlRTKikuCisKK1RoZSBoeXBlcmNhbGwgbnVtYmVyIG11c3QgYmUgYGBLVk1fSENf
WEVOX0hWTV9PUGBgIHdpdGggdGhlCitgYEtWTV9IQ19YRU5fSFZNX09QX0dVRVNUX1JFUVVFU1Rf
Vk1fRVZFTlRgYCBzdWItZnVuY3Rpb24KKyhzZWUgaHlwZXJjYWxscy5yc3QpLgorCitJdCBpcyB1
c2VkIGJ5IHRoZSBjb2RlIHJlc2lkaW5nIGluc2lkZSB0aGUgaW50cm9zcGVjdGVkIGd1ZXN0IHRv
IGNhbGwgdGhlCitpbnRyb3NwZWN0aW9uIHRvb2wgYW5kIHRvIHJlcG9ydCBjZXJ0YWluIGRldGFp
bHMgYWJvdXQgaXRzIG9wZXJhdGlvbi4gRm9yCitleGFtcGxlLCBhIGNsYXNzaWMgYW50aW1hbHdh
cmUgcmVtZWRpYXRpb24gdG9vbCBjYW4gcmVwb3J0IHdoYXQgaXQgaGFzCitmb3VuZCBkdXJpbmcg
YSBzY2FuLgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9rdm1pLmggYi9h
cmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL2t2bWkuaAppbmRleCA1N2M0OGFjZTQxN2YuLjk4ODJl
NjhjYWI3NSAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9rdm1pLmgKKysr
IGIvYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9rdm1pLmgKQEAgLTgsNiArOCw4IEBACiAKICNp
bmNsdWRlIDxhc20va3ZtLmg+CiAKKyNkZWZpbmUgS1ZNX0hDX1hFTl9IVk1fT1BfR1VFU1RfUkVR
VUVTVF9WTV9FVkVOVCAyNAorCiBzdHJ1Y3Qga3ZtaV9ldmVudF9hcmNoIHsKIAlfX3U4IG1vZGU7
CQkvKiAyLCA0IG9yIDggKi8KIAlfX3U4IHBhZGRpbmdbN107CmRpZmYgLS1naXQgYS9hcmNoL3g4
Ni9rdm0va3ZtaS5jIGIvYXJjaC94ODYva3ZtL2t2bWkuYwppbmRleCA1M2M0YTM3ZTEwYzYuLjQ1
ZjFhNDVkNWMwZiAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL2t2bWkuYworKysgYi9hcmNoL3g4
Ni9rdm0va3ZtaS5jCkBAIC0yMTAsMyArMjEwLDM1IEBAIGludCBrdm1pX2FyY2hfY21kX3ZjcHVf
Z2V0X2NwdWlkKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKIAogCXJldHVybiAwOwogfQorCitib29s
IGt2bWlfYXJjaF9pc19hZ2VudF9oeXBlcmNhbGwoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQorewor
CXVuc2lnbmVkIGxvbmcgc3ViZnVuYzEsIHN1YmZ1bmMyOworCWJvb2wgbG9uZ21vZGUgPSBpc182
NF9iaXRfbW9kZSh2Y3B1KTsKKworCWlmIChsb25nbW9kZSkgeworCQlzdWJmdW5jMSA9IGt2bV9y
ZGlfcmVhZCh2Y3B1KTsKKwkJc3ViZnVuYzIgPSBrdm1fcnNpX3JlYWQodmNwdSk7CisJfSBlbHNl
IHsKKwkJc3ViZnVuYzEgPSBrdm1fcmJ4X3JlYWQodmNwdSk7CisJCXN1YmZ1bmMxICY9IDB4RkZG
RkZGRkY7CisJCXN1YmZ1bmMyID0ga3ZtX3JjeF9yZWFkKHZjcHUpOworCQlzdWJmdW5jMiAmPSAw
eEZGRkZGRkZGOworCX0KKworCXJldHVybiAoc3ViZnVuYzEgPT0gS1ZNX0hDX1hFTl9IVk1fT1Bf
R1VFU1RfUkVRVUVTVF9WTV9FVkVOVAorCQkmJiBzdWJmdW5jMiA9PSAwKTsKK30KKwordm9pZCBr
dm1pX2FyY2hfaHlwZXJjYWxsX2V2ZW50KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKK3sKKwl1MzIg
YWN0aW9uOworCisJYWN0aW9uID0ga3ZtaV9tc2dfc2VuZF9oeXBlcmNhbGwodmNwdSk7CisJc3dp
dGNoIChhY3Rpb24pIHsKKwljYXNlIEtWTUlfRVZFTlRfQUNUSU9OX0NPTlRJTlVFOgorCQlicmVh
azsKKwlkZWZhdWx0OgorCQlrdm1pX2hhbmRsZV9jb21tb25fZXZlbnRfYWN0aW9ucyh2Y3B1LT5r
dm0sIGFjdGlvbik7CisJfQorfQpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3g4Ni5jIGIvYXJj
aC94ODYva3ZtL3g4Ni5jCmluZGV4IDdmNTZlMjE0OWYxOC4uMGQ1Y2UwN2M0MTY0IDEwMDY0NAot
LS0gYS9hcmNoL3g4Ni9rdm0veDg2LmMKKysrIGIvYXJjaC94ODYva3ZtL3g4Ni5jCkBAIC03Njgx
LDExICs3NjgxLDE0IEBAIGludCBrdm1fZW11bGF0ZV9oeXBlcmNhbGwoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1KQogewogCXVuc2lnbmVkIGxvbmcgbnIsIGEwLCBhMSwgYTIsIGEzLCByZXQ7CiAJaW50
IG9wXzY0X2JpdDsKLQotCWlmIChrdm1faHZfaHlwZXJjYWxsX2VuYWJsZWQodmNwdS0+a3ZtKSkK
LQkJcmV0dXJuIGt2bV9odl9oeXBlcmNhbGwodmNwdSk7CisJYm9vbCBrdm1pX2hjOwogCiAJbnIg
PSBrdm1fcmF4X3JlYWQodmNwdSk7CisJa3ZtaV9oYyA9ICh1MzIpbnIgPT0gS1ZNX0hDX1hFTl9I
Vk1fT1A7CisKKwlpZiAoa3ZtX2h2X2h5cGVyY2FsbF9lbmFibGVkKHZjcHUtPmt2bSkgJiYgIWt2
bWlfaGMpCisJCXJldHVybiBrdm1faHZfaHlwZXJjYWxsKHZjcHUpOworCiAJYTAgPSBrdm1fcmJ4
X3JlYWQodmNwdSk7CiAJYTEgPSBrdm1fcmN4X3JlYWQodmNwdSk7CiAJYTIgPSBrdm1fcmR4X3Jl
YWQodmNwdSk7CkBAIC03NzAyLDcgKzc3MDUsNyBAQCBpbnQga3ZtX2VtdWxhdGVfaHlwZXJjYWxs
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIAkJYTMgJj0gMHhGRkZGRkZGRjsKIAl9CiAKLQlpZiAo
a3ZtX3g4Nl9vcHMuZ2V0X2NwbCh2Y3B1KSAhPSAwKSB7CisJaWYgKGt2bV94ODZfb3BzLmdldF9j
cGwodmNwdSkgIT0gMCAmJiAha3ZtaV9oYykgewogCQlyZXQgPSAtS1ZNX0VQRVJNOwogCQlnb3Rv
IG91dDsKIAl9CkBAIC03NzI4LDYgKzc3MzEsMTMgQEAgaW50IGt2bV9lbXVsYXRlX2h5cGVyY2Fs
bChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAJCWt2bV9zY2hlZF95aWVsZCh2Y3B1LT5rdm0sIGEw
KTsKIAkJcmV0ID0gMDsKIAkJYnJlYWs7CisjaWZkZWYgQ09ORklHX0tWTV9JTlRST1NQRUNUSU9O
CisJY2FzZSBLVk1fSENfWEVOX0hWTV9PUDoKKwkJcmV0ID0gMDsKKwkJaWYgKCFrdm1pX2h5cGVy
Y2FsbF9ldmVudCh2Y3B1KSkKKwkJCXJldCA9IC1LVk1fRU5PU1lTOworCQlicmVhazsKKyNlbmRp
ZiAvKiBDT05GSUdfS1ZNX0lOVFJPU1BFQ1RJT04gKi8KIAlkZWZhdWx0OgogCQlyZXQgPSAtS1ZN
X0VOT1NZUzsKIAkJYnJlYWs7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2t2bWlfaG9zdC5o
IGIvaW5jbHVkZS9saW51eC9rdm1pX2hvc3QuaAppbmRleCA4NTdiNzVhMjY2NGEuLjVjNGI5YzE2
MDAxOSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9rdm1pX2hvc3QuaAorKysgYi9pbmNsdWRl
L2xpbnV4L2t2bWlfaG9zdC5oCkBAIC03Miw2ICs3Miw3IEBAIGludCBrdm1pX2lvY3RsX2V2ZW50
KHN0cnVjdCBrdm0gKmt2bSwKIGludCBrdm1pX2lvY3RsX3ByZXVuaG9vayhzdHJ1Y3Qga3ZtICpr
dm0pOwogCiB2b2lkIGt2bWlfaGFuZGxlX3JlcXVlc3RzKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7
Citib29sIGt2bWlfaHlwZXJjYWxsX2V2ZW50KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7CiAKICNl
bHNlCiAKQEAgLTgyLDYgKzgzLDcgQEAgc3RhdGljIGlubGluZSB2b2lkIGt2bWlfZGVzdHJveV92
bShzdHJ1Y3Qga3ZtICprdm0pIHsgfQogc3RhdGljIGlubGluZSB2b2lkIGt2bWlfdmNwdV91bmlu
aXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KSB7IH0KIAogc3RhdGljIGlubGluZSB2b2lkIGt2bWlf
aGFuZGxlX3JlcXVlc3RzKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkgeyB9CitzdGF0aWMgaW5saW5l
IGJvb2wga3ZtaV9oeXBlcmNhbGxfZXZlbnQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KSB7IHJldHVy
biBmYWxzZTsgfQogCiAjZW5kaWYgLyogQ09ORklHX0tWTV9JTlRST1NQRUNUSU9OICovCiAKZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC9rdm1fcGFyYS5oIGIvaW5jbHVkZS91YXBpL2xp
bnV4L2t2bV9wYXJhLmgKaW5kZXggM2NlMzg4MjQ5NjgyLi41M2NlYmJlMjIwOTkgMTAwNjQ0Ci0t
LSBhL2luY2x1ZGUvdWFwaS9saW51eC9rdm1fcGFyYS5oCisrKyBiL2luY2x1ZGUvdWFwaS9saW51
eC9rdm1fcGFyYS5oCkBAIC0zMyw2ICszMyw3IEBACiAjZGVmaW5lIEtWTV9IQ19DTE9DS19QQUlS
SU5HCQk5CiAjZGVmaW5lIEtWTV9IQ19TRU5EX0lQSQkJMTAKICNkZWZpbmUgS1ZNX0hDX1NDSEVE
X1lJRUxECQkxMQorI2RlZmluZSBLVk1fSENfWEVOX0hWTV9PUAkJMzQgLyogWGVuJ3MgX19IWVBF
UlZJU09SX2h2bV9vcCAqLwogCiAvKgogICogaHlwZXJjYWxscyB1c2UgYXJjaGl0ZWN0dXJlIHNw
ZWNpZmljCmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgva3ZtaS5oIGIvaW5jbHVkZS91
YXBpL2xpbnV4L2t2bWkuaAppbmRleCBkN2Y0MzYwZTYwOWUuLjdkMWZlYmQ2NzFkNyAxMDA2NDQK
LS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaAorKysgYi9pbmNsdWRlL3VhcGkvbGludXgv
a3ZtaS5oCkBAIC0zOCw2ICszOCw3IEBAIGVudW0gewogZW51bSB7CiAJS1ZNSV9FVkVOVF9VTkhP
T0sgICAgID0gMCwKIAlLVk1JX0VWRU5UX1BBVVNFX1ZDUFUgPSAxLAorCUtWTUlfRVZFTlRfSFlQ
RVJDQUxMICA9IDIsCiAKIAlLVk1JX05VTV9FVkVOVFMKIH07CmRpZmYgLS1naXQgYS90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0veDg2XzY0L2t2bWlfdGVzdC5jIGIvdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMva3ZtL3g4Nl82NC9rdm1pX3Rlc3QuYwppbmRleCA3MjY5YWZkNGMzNmQuLjNhNzY4
NDJlNDhjNiAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3g4Nl82NC9r
dm1pX3Rlc3QuYworKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0veDg2XzY0L2t2bWlf
dGVzdC5jCkBAIC00OSw2ICs0OSw3IEBAIHN0cnVjdCB2Y3B1X3dvcmtlcl9kYXRhIHsKIAogZW51
bSB7CiAJR1VFU1RfVEVTVF9OT09QID0gMCwKKwlHVUVTVF9URVNUX0hZUEVSQ0FMTCwKIH07CiAK
ICNkZWZpbmUgR1VFU1RfUkVRVUVTVF9URVNUKCkgICAgIEdVRVNUX1NZTkMoMCkKQEAgLTYyLDEy
ICs2MywyMyBAQCBzdGF0aWMgaW50IGd1ZXN0X3Rlc3RfaWQodm9pZCkKIAlyZXR1cm4gUkVBRF9P
TkNFKHRlc3RfaWQpOwogfQogCitzdGF0aWMgdm9pZCBndWVzdF9oeXBlcmNhbGxfdGVzdCh2b2lk
KQoreworCWFzbSB2b2xhdGlsZSgibW92ICQzNCwgJXJheCIpOworCWFzbSB2b2xhdGlsZSgibW92
ICQyNCwgJXJkaSIpOworCWFzbSB2b2xhdGlsZSgibW92ICQwLCAlcnNpIik7CisJYXNtIHZvbGF0
aWxlKCIuYnl0ZSAweDBmLDB4MDEsMHhjMSIpOworfQorCiBzdGF0aWMgdm9pZCBndWVzdF9jb2Rl
KHZvaWQpCiB7CiAJd2hpbGUgKHRydWUpIHsKIAkJc3dpdGNoIChndWVzdF90ZXN0X2lkKCkpIHsK
IAkJY2FzZSBHVUVTVF9URVNUX05PT1A6CiAJCQlicmVhazsKKwkJY2FzZSBHVUVTVF9URVNUX0hZ
UEVSQ0FMTDoKKwkJCWd1ZXN0X2h5cGVyY2FsbF90ZXN0KCk7CisJCQlicmVhazsKIAkJfQogCQlH
VUVTVF9TSUdOQUxfVEVTVF9ET05FKCk7CiAJfQpAQCAtMTA2Niw2ICsxMDc4LDM1IEBAIHN0YXRp
YyB2b2lkIHRlc3RfY21kX3ZjcHVfZ2V0X2NwdWlkKHN0cnVjdCBrdm1fdm0gKnZtKQogCSAgICAg
IGZ1bmN0aW9uLCBpbmRleCwgcnBsLmVheCwgcnBsLmVieCwgcnBsLmVjeCwgcnBsLmVkeCk7CiB9
CiAKK3N0YXRpYyB2b2lkIHRlc3RfZXZlbnRfaHlwZXJjYWxsKHN0cnVjdCBrdm1fdm0gKnZtKQor
eworCXN0cnVjdCB2Y3B1X3dvcmtlcl9kYXRhIGRhdGEgPSB7CisJCS52bSA9IHZtLAorCQkudmNw
dV9pZCA9IFZDUFVfSUQsCisJCS50ZXN0X2lkID0gR1VFU1RfVEVTVF9IWVBFUkNBTEwsCisJfTsK
KwlzdHJ1Y3Qga3ZtaV9tc2dfaGRyIGhkcjsKKwlzdHJ1Y3Qga3ZtaV9ldmVudCBldjsKKwlzdHJ1
Y3QgdmNwdV9yZXBseSBycGwgPSB7fTsKKwlfX3UxNiBldmVudF9pZCA9IEtWTUlfRVZFTlRfSFlQ
RVJDQUxMOworCXB0aHJlYWRfdCB2Y3B1X3RocmVhZDsKKworCWVuYWJsZV92Y3B1X2V2ZW50KHZt
LCBldmVudF9pZCk7CisKKwl2Y3B1X3RocmVhZCA9IHN0YXJ0X3ZjcHVfd29ya2VyKCZkYXRhKTsK
KworCXJlY2VpdmVfZXZlbnQoJmhkciwgJmV2LCBzaXplb2YoZXYpLCBldmVudF9pZCk7CisKKwlw
cl9pbmZvKCJIeXBlcmNhbGwgZXZlbnQsIHJpcCAweCVsbHhcbiIsIGV2LmFyY2gucmVncy5yaXAp
OworCisJcmVwbHlfdG9fZXZlbnQoJmhkciwgJmV2LCBLVk1JX0VWRU5UX0FDVElPTl9DT05USU5V
RSwKKwkJCSZycGwsIHNpemVvZihycGwpKTsKKworCXN0b3BfdmNwdV93b3JrZXIodmNwdV90aHJl
YWQsICZkYXRhKTsKKworCWRpc2FibGVfdmNwdV9ldmVudCh2bSwgZXZlbnRfaWQpOworfQorCiBz
dGF0aWMgdm9pZCB0ZXN0X2ludHJvc3BlY3Rpb24oc3RydWN0IGt2bV92bSAqdm0pCiB7CiAJc3Jh
bmRvbSh0aW1lKDApKTsKQEAgLTEwODYsNiArMTEyNyw3IEBAIHN0YXRpYyB2b2lkIHRlc3RfaW50
cm9zcGVjdGlvbihzdHJ1Y3Qga3ZtX3ZtICp2bSkKIAl0ZXN0X2NtZF92Y3B1X2dldF9yZWdpc3Rl
cnModm0pOwogCXRlc3RfY21kX3ZjcHVfc2V0X3JlZ2lzdGVycyh2bSk7CiAJdGVzdF9jbWRfdmNw
dV9nZXRfY3B1aWQodm0pOworCXRlc3RfZXZlbnRfaHlwZXJjYWxsKHZtKTsKIAogCXVuaG9va19p
bnRyb3NwZWN0aW9uKHZtKTsKIH0KZGlmZiAtLWdpdCBhL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24v
a3ZtaS5jIGIvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pLmMKaW5kZXggMmJmZmU5ZWU1YjY5
Li41NzFiNzljNTIzNTMgMTAwNjQ0Ci0tLSBhL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaS5j
CisrKyBiL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaS5jCkBAIC05Nyw2ICs5Nyw3IEBAIHN0
YXRpYyB2b2lkIHNldHVwX2tub3duX2V2ZW50cyh2b2lkKQogCXNldF9iaXQoS1ZNSV9FVkVOVF9V
TkhPT0ssIEt2bWlfa25vd25fdm1fZXZlbnRzKTsKIAogCWJpdG1hcF96ZXJvKEt2bWlfa25vd25f
dmNwdV9ldmVudHMsIEtWTUlfTlVNX0VWRU5UUyk7CisJc2V0X2JpdChLVk1JX0VWRU5UX0hZUEVS
Q0FMTCwgS3ZtaV9rbm93bl92Y3B1X2V2ZW50cyk7CiAJc2V0X2JpdChLVk1JX0VWRU5UX1BBVVNF
X1ZDUFUsIEt2bWlfa25vd25fdmNwdV9ldmVudHMpOwogCiAJYml0bWFwX29yKEt2bWlfa25vd25f
ZXZlbnRzLCBLdm1pX2tub3duX3ZtX2V2ZW50cywKQEAgLTg4NSwzICs4ODYsMjUgQEAgdm9pZCBr
dm1pX3Bvc3RfcmVwbHkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogCQl2Y3B1aS0+aGF2ZV9kZWxh
eWVkX3JlZ3MgPSBmYWxzZTsKIAl9CiB9CisKK2Jvb2wga3ZtaV9oeXBlcmNhbGxfZXZlbnQoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1KQoreworCXN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqa3ZtaTsK
Kwlib29sIHJldCA9IGZhbHNlOworCisJaWYgKCFrdm1pX2FyY2hfaXNfYWdlbnRfaHlwZXJjYWxs
KHZjcHUpKQorCQlyZXR1cm4gcmV0OworCisJa3ZtaSA9IGt2bWlfZ2V0KHZjcHUtPmt2bSk7CisJ
aWYgKCFrdm1pKQorCQlyZXR1cm4gcmV0OworCisJaWYgKGlzX2V2ZW50X2VuYWJsZWQodmNwdSwg
S1ZNSV9FVkVOVF9IWVBFUkNBTEwpKSB7CisJCWt2bWlfYXJjaF9oeXBlcmNhbGxfZXZlbnQodmNw
dSk7CisJCXJldCA9IHRydWU7CisJfQorCisJa3ZtaV9wdXQodmNwdS0+a3ZtKTsKKworCXJldHVy
biByZXQ7Cit9CmRpZmYgLS1naXQgYS92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfaW50Lmgg
Yi92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfaW50LmgKaW5kZXggYmM4YjVjMDNiMDU3Li44
YzAyNTI4ZTMwNTYgMTAwNjQ0Ci0tLSBhL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9pbnQu
aAorKysgYi92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfaW50LmgKQEAgLTIxLDYgKzIxLDEx
IEBACiAjZGVmaW5lIEtWTUkoa3ZtKSAoKGt2bSktPmt2bWkpCiAjZGVmaW5lIFZDUFVJKHZjcHUp
ICgodmNwdSktPmt2bWkpCiAKK3N0YXRpYyBpbmxpbmUgYm9vbCBpc19ldmVudF9lbmFibGVkKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwgaW50IGV2ZW50KQoreworCXJldHVybiB0ZXN0X2JpdChldmVu
dCwgVkNQVUkodmNwdSktPmV2X2VuYWJsZV9tYXNrKTsKK30KKwogLyoga3ZtaV9tc2cuYyAqLwog
Ym9vbCBrdm1pX3NvY2tfZ2V0KHN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqa3ZtaSwgaW50IGZk
KTsKIHZvaWQga3ZtaV9zb2NrX3NodXRkb3duKHN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqa3Zt
aSk7CkBAIC0yOCw2ICszMyw3IEBAIHZvaWQga3ZtaV9zb2NrX3B1dChzdHJ1Y3Qga3ZtX2ludHJv
c3BlY3Rpb24gKmt2bWkpOwogYm9vbCBrdm1pX21zZ19wcm9jZXNzKHN0cnVjdCBrdm1faW50cm9z
cGVjdGlvbiAqa3ZtaSk7CiBpbnQga3ZtaV9tc2dfc2VuZF91bmhvb2soc3RydWN0IGt2bV9pbnRy
b3NwZWN0aW9uICprdm1pKTsKIHUzMiBrdm1pX21zZ19zZW5kX3ZjcHVfcGF1c2Uoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1KTsKK3UzMiBrdm1pX21zZ19zZW5kX2h5cGVyY2FsbChzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHUpOwogCiAvKiBrdm1pLmMgKi8KIHZvaWQgKmt2bWlfbXNnX2FsbG9jKHZvaWQpOwpA
QCAtNDEsNiArNDcsNyBAQCBpbnQga3ZtaV9hZGRfam9iKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwK
IAkJIHZvaWQgKmN0eCwgdm9pZCAoKmZyZWVfZmN0KSh2b2lkICpjdHgpKTsKIHZvaWQga3ZtaV9y
dW5fam9icyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogdm9pZCBrdm1pX3Bvc3RfcmVwbHkoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1KTsKK3ZvaWQga3ZtaV9oYW5kbGVfY29tbW9uX2V2ZW50X2FjdGlv
bnMoc3RydWN0IGt2bSAqa3ZtLCB1MzIgYWN0aW9uKTsKIGludCBrdm1pX2NtZF92bV9jb250cm9s
X2V2ZW50cyhzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2bWksCiAJCQkJdW5zaWduZWQgaW50
IGV2ZW50X2lkLCBib29sIGVuYWJsZSk7CiBpbnQga3ZtaV9jbWRfdmNwdV9jb250cm9sX2V2ZW50
cyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCkBAIC03MCw1ICs3Nyw3IEBAIGludCBrdm1pX2FyY2hf
Y21kX3ZjcHVfZ2V0X3JlZ2lzdGVycyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiBpbnQga3ZtaV9h
cmNoX2NtZF92Y3B1X2dldF9jcHVpZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJCQkJIGNvbnN0
IHN0cnVjdCBrdm1pX3ZjcHVfZ2V0X2NwdWlkICpyZXEsCiAJCQkJIHN0cnVjdCBrdm1pX3ZjcHVf
Z2V0X2NwdWlkX3JlcGx5ICpycGwpOworYm9vbCBrdm1pX2FyY2hfaXNfYWdlbnRfaHlwZXJjYWxs
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7Cit2b2lkIGt2bWlfYXJjaF9oeXBlcmNhbGxfZXZlbnQo
c3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIAogI2VuZGlmCmRpZmYgLS1naXQgYS92aXJ0L2t2bS9p
bnRyb3NwZWN0aW9uL2t2bWlfbXNnLmMgYi92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfbXNn
LmMKaW5kZXggNjFjOTZhMjRhNzMwLi44MGFkZTYwNTU3NDcgMTAwNjQ0Ci0tLSBhL3ZpcnQva3Zt
L2ludHJvc3BlY3Rpb24va3ZtaV9tc2cuYworKysgYi92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2
bWlfbXNnLmMKQEAgLTc5MywzICs3OTMsMTUgQEAgdTMyIGt2bWlfbXNnX3NlbmRfdmNwdV9wYXVz
ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAKIAlyZXR1cm4gYWN0aW9uOwogfQorCit1MzIga3Zt
aV9tc2dfc2VuZF9oeXBlcmNhbGwoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQoreworCWludCBlcnIs
IGFjdGlvbjsKKworCWVyciA9IGt2bWlfc2VuZF9ldmVudCh2Y3B1LCBLVk1JX0VWRU5UX0hZUEVS
Q0FMTCwgTlVMTCwgMCwKKwkJCSAgICAgIE5VTEwsIDAsICZhY3Rpb24pOworCWlmIChlcnIpCisJ
CXJldHVybiBLVk1JX0VWRU5UX0FDVElPTl9DT05USU5VRTsKKworCXJldHVybiBhY3Rpb247Cit9
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxp
emF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9u
Lm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92
aXJ0dWFsaXphdGlvbg==
