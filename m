Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6831E32E1D5
	for <lists.virtualization@lfdr.de>; Fri,  5 Mar 2021 06:47:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA6BA844C9;
	Fri,  5 Mar 2021 05:47:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B2HKI0-M5DFV; Fri,  5 Mar 2021 05:47:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id E046D844CD;
	Fri,  5 Mar 2021 05:47:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6EDFDC0010;
	Fri,  5 Mar 2021 05:47:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8D3D4C0001
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Mar 2021 05:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74EA5844C9
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Mar 2021 05:47:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0xOVfSxffz6M
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Mar 2021 05:47:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3549684449
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Mar 2021 05:47:26 +0000 (UTC)
IronPort-SDR: lBHSP1QTnCZOSA/Ch/BERhruuQY9EETA8Dov0ByVGA6TIenOgnOs46LldHUdk+2GEIK5NYbXWF
 eDQfSUI6ml9g==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="175205451"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; d="scan'208";a="175205451"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2021 21:47:25 -0800
IronPort-SDR: bvAV4jaOx1icaxZC8oT8G5KH2rlZhINXLLjl9XIlJ+wUPwKgDbChpwKfpfl+yEwFMXRt1zlrB9
 PB+XAwogQ7Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; d="scan'208";a="597657945"
Received: from unknown (HELO [10.239.154.55]) ([10.239.154.55])
 by fmsmga006.fm.intel.com with ESMTP; 04 Mar 2021 21:47:20 -0800
Subject: Re: [PATCH v6] i2c: virtio: add a virtio i2c frontend driver
To: Jason Wang <jasowang@redhat.com>, linux-i2c@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <9a2086f37c0a62069b67c39a3f75941b78a0039c.1614749417.git.jie.deng@intel.com>
 <43b0842b-8b0f-1979-ed07-d6124e3a6b79@redhat.com>
From: Jie Deng <jie.deng@intel.com>
Message-ID: <76554717-fc77-1c63-58d2-58aa04f7af9b@intel.com>
Date: Fri, 5 Mar 2021 13:47:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <43b0842b-8b0f-1979-ed07-d6124e3a6b79@redhat.com>
Content-Language: en-US
Cc: Sergey.Semin@baikalelectronics.ru, bjorn.andersson@linaro.org,
 loic.poulain@linaro.org, yu1.wang@intel.com, arnd@arndb.de, mst@redhat.com,
 viresh.kumar@linaro.org, shuo.a.liu@intel.com, tali.perry1@gmail.com,
 wsa@kernel.org, wsa+renesas@sang-engineering.com, pbonzini@redhat.com,
 jarkko.nikula@linux.intel.com, stefanha@redhat.com,
 u.kleine-koenig@pengutronix.de, kblaiech@mellanox.com,
 andriy.shevchenko@linux.intel.com, conghui.chen@intel.com, rppt@kernel.org
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjEvMy80IDE3OjE1LCBKYXNvbiBXYW5nIHdyb3RlOgo+Cj4gT24gMjAyMS8zLzQgOTo1
OSDkuIrljYgsIEppZSBEZW5nIHdyb3RlOgo+PiBBZGQgYW4gSTJDIGJ1cyBkcml2ZXIgZm9yIHZp
cnRpbyBwYXJhLXZpcnR1YWxpemF0aW9uLgo+Pgo+PiBUaGUgY29udHJvbGxlciBjYW4gYmUgZW11
bGF0ZWQgYnkgdGhlIGJhY2tlbmQgZHJpdmVyIGluCj4+IGFueSBkZXZpY2UgbW9kZWwgc29mdHdh
cmUgYnkgZm9sbG93aW5nIHRoZSB2aXJ0aW8gcHJvdG9jb2wuCj4+Cj4+IFRoZSBkZXZpY2Ugc3Bl
Y2lmaWNhdGlvbiBjYW4gYmUgZm91bmQgb24KPj4gaHR0cHM6Ly9saXN0cy5vYXNpcy1vcGVuLm9y
Zy9hcmNoaXZlcy92aXJ0aW8tY29tbWVudC8yMDIxMDEvbXNnMDAwMDguaHRtbC4gCj4+Cj4+Cj4+
IEJ5IGZvbGxvd2luZyB0aGUgc3BlY2lmaWNhdGlvbiwgcGVvcGxlIG1heSBpbXBsZW1lbnQgZGlm
ZmVyZW50Cj4+IGJhY2tlbmQgZHJpdmVycyB0byBlbXVsYXRlIGRpZmZlcmVudCBjb250cm9sbGVy
cyBhY2NvcmRpbmcgdG8KPj4gdGhlaXIgbmVlZHMuCj4+Cj4+IENvLWRldmVsb3BlZC1ieTogQ29u
Z2h1aSBDaGVuIDxjb25naHVpLmNoZW5AaW50ZWwuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBDb25n
aHVpIENoZW4gPGNvbmdodWkuY2hlbkBpbnRlbC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEppZSBE
ZW5nIDxqaWUuZGVuZ0BpbnRlbC5jb20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL2kyYy9idXNzZXMv
S2NvbmZpZ8KgwqDCoMKgwqAgfMKgIDExICsrCj4+IMKgIGRyaXZlcnMvaTJjL2J1c3Nlcy9NYWtl
ZmlsZcKgwqDCoMKgIHzCoMKgIDMgKwo+PiDCoCBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLXZpcnRp
by5jIHwgMjg5IAo+PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+
IMKgIGluY2x1ZGUvdWFwaS9saW51eC92aXJ0aW9faTJjLmggfMKgIDQyICsrKysrKwo+PiDCoCBp
bmNsdWRlL3VhcGkvbGludXgvdmlydGlvX2lkcy5oIHzCoMKgIDEgKwo+PiDCoCA1IGZpbGVzIGNo
YW5nZWQsIDM0NiBpbnNlcnRpb25zKCspCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L2kyYy9idXNzZXMvaTJjLXZpcnRpby5jCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRl
L3VhcGkvbGludXgvdmlydGlvX2kyYy5oCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9i
dXNzZXMvS2NvbmZpZyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9LY29uZmlnCj4+IGluZGV4IDA1ZWJm
NzUuLjA4NjAzOTUgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9LY29uZmlnCj4+
ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9LY29uZmlnCj4+IEBAIC0yMSw2ICsyMSwxNyBAQCBj
b25maWcgSTJDX0FMSTE1MzUKPj4gwqDCoMKgwqDCoMKgwqAgVGhpcyBkcml2ZXIgY2FuIGFsc28g
YmUgYnVpbHQgYXMgYSBtb2R1bGUuwqAgSWYgc28sIHRoZSBtb2R1bGUKPj4gwqDCoMKgwqDCoMKg
wqAgd2lsbCBiZSBjYWxsZWQgaTJjLWFsaTE1MzUuCj4+IMKgICtjb25maWcgSTJDX1ZJUlRJTwo+
PiArwqDCoMKgIHRyaXN0YXRlICJWaXJ0aW8gSTJDIEFkYXB0ZXIiCj4+ICvCoMKgwqAgZGVwZW5k
cyBvbiBWSVJUSU8KPgo+Cj4gUGxlYXNlIHVzZSBzZWxlY3QgaGVyZS4gVGhlcmUncyBubyBwcm9t
cHQgZm9yIFZJUlRJTy4KPgpPSy4KPgo+PiArwqDCoMKgIGhlbHAKPj4gK8KgwqDCoMKgwqAgSWYg
eW91IHNheSB5ZXMgdG8gdGhpcyBvcHRpb24sIHN1cHBvcnQgd2lsbCBiZSBpbmNsdWRlZCBmb3Ig
Cj4+IHRoZSB2aXJ0aW8KPj4gK8KgwqDCoMKgwqAgSTJDIGFkYXB0ZXIgZHJpdmVyLiBUaGUgaGFy
ZHdhcmUgY2FuIGJlIGVtdWxhdGVkIGJ5IGFueSBkZXZpY2UgCj4+IG1vZGVsCj4+ICvCoMKgwqDC
oMKgIHNvZnR3YXJlIGFjY29yZGluZyB0byB0aGUgdmlydGlvIHByb3RvY29sLgo+PiArCj4+ICvC
oMKgwqDCoMKgIFRoaXMgZHJpdmVyIGNhbiBhbHNvIGJlIGJ1aWx0IGFzIGEgbW9kdWxlLiBJZiBz
bywgdGhlIG1vZHVsZQo+PiArwqDCoMKgwqDCoCB3aWxsIGJlIGNhbGxlZCBpMmMtdmlydGlvLgo+
PiArCj4+IMKgIGNvbmZpZyBJMkNfQUxJMTU2Mwo+PiDCoMKgwqDCoMKgIHRyaXN0YXRlICJBTEkg
MTU2MyIKPj4gwqDCoMKgwqDCoCBkZXBlbmRzIG9uIFBDSQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9pMmMvYnVzc2VzL01ha2VmaWxlIGIvZHJpdmVycy9pMmMvYnVzc2VzL01ha2VmaWxlCj4+IGlu
ZGV4IDYxNWYzNWUuLmI4OGRhMDggMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9N
YWtlZmlsZQo+PiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvTWFrZWZpbGUKPj4gQEAgLTYsNiAr
Niw5IEBACj4+IMKgICMgQUNQSSBkcml2ZXJzCj4+IMKgIG9iai0kKENPTkZJR19JMkNfU0NNSSnC
oMKgwqDCoMKgwqDCoCArPSBpMmMtc2NtaS5vCj4+IMKgICsjIFZJUlRJTyBJMkMgaG9zdCBjb250
cm9sbGVyIGRyaXZlcgo+PiArb2JqLSQoQ09ORklHX0kyQ19WSVJUSU8pwqDCoMKgICs9IGkyYy12
aXJ0aW8ubwo+PiArCj4+IMKgICMgUEMgU01CdXMgaG9zdCBjb250cm9sbGVyIGRyaXZlcnMKPj4g
wqAgb2JqLSQoQ09ORklHX0kyQ19BTEkxNTM1KcKgwqDCoCArPSBpMmMtYWxpMTUzNS5vCj4+IMKg
IG9iai0kKENPTkZJR19JMkNfQUxJMTU2MynCoMKgwqAgKz0gaTJjLWFsaTE1NjMubwo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy12aXJ0aW8uYyAKPj4gYi9kcml2ZXJzL2ky
Yy9idXNzZXMvaTJjLXZpcnRpby5jCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAw
MDAwMDAuLjk4YzBmY2MKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9kcml2ZXJzL2kyYy9idXNz
ZXMvaTJjLXZpcnRpby5jCj4+IEBAIC0wLDAgKzEsMjg5IEBACj4+ICsvLyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgo+PiArLyoKPj4gKyAqIFZpcnRpbyBJMkMgQnVz
IERyaXZlcgo+PiArICoKPj4gKyAqIFRoZSBWaXJ0aW8gSTJDIFNwZWNpZmljYXRpb246Cj4+ICsg
KiAKPj4gaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL29hc2lzLXRjcy92aXJ0aW8t
c3BlYy9tYXN0ZXIvdmlydGlvLWkyYy50ZXgKPj4gKyAqCj4+ICsgKiBDb3B5cmlnaHQgKGMpIDIw
MjEgSW50ZWwgQ29ycG9yYXRpb24uIEFsbCByaWdodHMgcmVzZXJ2ZWQuCj4+ICsgKi8KPj4gKwo+
PiArI2luY2x1ZGUgPGxpbnV4L2FjcGkuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9jb21wbGV0aW9u
Lmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvZXJyLmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvaTJjLmg+
Cj4+ICsjaW5jbHVkZSA8bGludXgvaW8uaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9qaWZmaWVzLmg+
Cj4+ICsjaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxl
Lmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4+ICsjaW5jbHVkZSA8
bGludXgvd2FpdC5oPgo+PiArCj4+ICsjaW5jbHVkZSA8bGludXgvdmlydGlvLmg+Cj4+ICsjaW5j
bHVkZSA8bGludXgvdmlydGlvX2kyYy5oPgo+PiArCj4+ICsvKioKPj4gKyAqIHN0cnVjdCB2aXJ0
aW9faTJjIC0gdmlydGlvIEkyQyBkYXRhCj4+ICsgKiBAdmRldjogdmlydGlvIGRldmljZSBmb3Ig
dGhpcyBjb250cm9sbGVyCj4+ICsgKiBAY29tcGxldGlvbjogY29tcGxldGlvbiBvZiB2aXJ0aW8g
STJDIG1lc3NhZ2UKPj4gKyAqIEBhZGFwOiBJMkMgYWRhcHRlciBmb3IgdGhpcyBjb250cm9sbGVy
Cj4+ICsgKiBAaTJjX2xvY2s6IGxvY2sgZm9yIHZpcnRxdWV1ZSBwcm9jZXNzaW5nCj4+ICsgKiBA
dnE6IHRoZSB2aXJ0aW8gdmlydHF1ZXVlIGZvciBjb21tdW5pY2F0aW9uCj4+ICsgKi8KPj4gK3N0
cnVjdCB2aXJ0aW9faTJjIHsKPj4gK8KgwqDCoCBzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldjsK
Pj4gK8KgwqDCoCBzdHJ1Y3QgY29tcGxldGlvbiBjb21wbGV0aW9uOwo+PiArwqDCoMKgIHN0cnVj
dCBpMmNfYWRhcHRlciBhZGFwOwo+PiArwqDCoMKgIHN0cnVjdCBtdXRleCBpMmNfbG9jazsKPj4g
K8KgwqDCoCBzdHJ1Y3QgdmlydHF1ZXVlICp2cTsKPj4gK307Cj4+ICsKPj4gKy8qKgo+PiArICog
c3RydWN0IHZpcnRpb19pMmNfcmVxIC0gdGhlIHZpcnRpbyBJMkMgcmVxdWVzdCBzdHJ1Y3R1cmUK
Pj4gKyAqIEBvdXRfaGRyOiB0aGUgT1VUIGhlYWRlciBvZiB0aGUgdmlydGlvIEkyQyBtZXNzYWdl
Cj4+ICsgKiBAYnVmOiB0aGUgYnVmZmVyIGludG8gd2hpY2ggZGF0YSBpcyByZWFkLCBvciBmcm9t
IHdoaWNoIGl0J3Mgd3JpdHRlbgo+PiArICogQGluX2hkcjogdGhlIElOIGhlYWRlciBvZiB0aGUg
dmlydGlvIEkyQyBtZXNzYWdlCj4+ICsgKi8KPj4gK3N0cnVjdCB2aXJ0aW9faTJjX3JlcSB7Cj4+
ICvCoMKgwqAgc3RydWN0IHZpcnRpb19pMmNfb3V0X2hkciBvdXRfaGRyOwo+PiArwqDCoMKgIHU4
ICpidWY7Cj4+ICvCoMKgwqAgc3RydWN0IHZpcnRpb19pMmNfaW5faGRyIGluX2hkcjsKPj4gK307
Cj4+ICsKPj4gK3N0YXRpYyB2b2lkIHZpcnRpb19pMmNfbXNnX2RvbmUoc3RydWN0IHZpcnRxdWV1
ZSAqdnEpCj4+ICt7Cj4+ICvCoMKgwqAgc3RydWN0IHZpcnRpb19pMmMgKnZpID0gdnEtPnZkZXYt
PnByaXY7Cj4+ICsKPj4gK8KgwqDCoCBjb21wbGV0ZSgmdmktPmNvbXBsZXRpb24pOwo+PiArfQo+
PiArCj4+ICtzdGF0aWMgaW50IHZpcnRpb19pMmNfc2VuZF9yZXFzKHN0cnVjdCB2aXJ0cXVldWUg
KnZxLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCB2aXJ0aW9faTJj
X3JlcSAqcmVxcywKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgaTJj
X21zZyAqbXNncywgaW50IG5yKQo+PiArewo+PiArwqDCoMKgIHN0cnVjdCBzY2F0dGVybGlzdCAq
c2dzWzNdLCBvdXRfaGRyLCBtc2dfYnVmLCBpbl9oZHI7Cj4+ICvCoMKgwqAgaW50IGksIG91dGNu
dCwgaW5jbnQsIGVyciA9IDA7Cj4+ICvCoMKgwqAgdTggKmJ1ZjsKPj4gKwo+PiArwqDCoMKgIGZv
ciAoaSA9IDA7IGkgPCBucjsgaSsrKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIW1zZ3NbaV0u
bGVuKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4gKwo+PiArwqDCoMKgwqDC
oMKgwqAgLyogT25seSA3LWJpdCBtb2RlIHN1cHBvcnRlZCBmb3IgdGhpcyBtb21lbnQuIEZvciB0
aGUgCj4+IGFkZHJlc3MgZm9ybWF0LAo+PiArwqDCoMKgwqDCoMKgwqDCoCAqIFBsZWFzZSBjaGVj
ayB0aGUgVmlydGlvIEkyQyBTcGVjaWZpY2F0aW9uLgo+PiArwqDCoMKgwqDCoMKgwqDCoCAqLwo+
PiArwqDCoMKgwqDCoMKgwqAgcmVxc1tpXS5vdXRfaGRyLmFkZHIgPSBjcHVfdG9fbGUxNihtc2dz
W2ldLmFkZHIgPDwgMSk7Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmIChpICE9IG5yIC0gMSkK
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVxc1tpXS5vdXRfaGRyLmZsYWdzIHw9IFZJUlRJ
T19JMkNfRkxBR1NfRkFJTF9ORVhUOwo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoCBvdXRjbnQgPSBp
bmNudCA9IDA7Cj4+ICvCoMKgwqDCoMKgwqDCoCBzZ19pbml0X29uZSgmb3V0X2hkciwgJnJlcXNb
aV0ub3V0X2hkciwgCj4+IHNpemVvZihyZXFzW2ldLm91dF9oZHIpKTsKPj4gK8KgwqDCoMKgwqDC
oMKgIHNnc1tvdXRjbnQrK10gPSAmb3V0X2hkcjsKPj4gKwo+PiArwqDCoMKgwqDCoMKgwqAgYnVm
ID0ga3phbGxvYyhtc2dzW2ldLmxlbiwgR0ZQX0tFUk5FTCk7Cj4+ICvCoMKgwqDCoMKgwqDCoCBp
ZiAoIWJ1ZikKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+ICsKPj4gK8KgwqDC
oMKgwqDCoMKgIHJlcXNbaV0uYnVmID0gYnVmOwo+PiArwqDCoMKgwqDCoMKgwqAgc2dfaW5pdF9v
bmUoJm1zZ19idWYsIHJlcXNbaV0uYnVmLCBtc2dzW2ldLmxlbik7Cj4+ICsKPj4gK8KgwqDCoMKg
wqDCoMKgIGlmIChtc2dzW2ldLmZsYWdzICYgSTJDX01fUkQpIHsKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgc2dzW291dGNudCArIGluY250KytdID0gJm1zZ19idWY7Cj4+ICvCoMKgwqDCoMKg
wqDCoCB9IGVsc2Ugewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtZW1jcHkocmVxc1tpXS5i
dWYsIG1zZ3NbaV0uYnVmLCBtc2dzW2ldLmxlbik7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHNnc1tvdXRjbnQrK10gPSAmbXNnX2J1ZjsKPj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4gKwo+PiAr
wqDCoMKgwqDCoMKgwqAgc2dfaW5pdF9vbmUoJmluX2hkciwgJnJlcXNbaV0uaW5faGRyLCBzaXpl
b2YocmVxc1tpXS5pbl9oZHIpKTsKPj4gK8KgwqDCoMKgwqDCoMKgIHNnc1tvdXRjbnQgKyBpbmNu
dCsrXSA9ICZpbl9oZHI7Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgIGVyciA9IHZpcnRxdWV1ZV9h
ZGRfc2dzKHZxLCBzZ3MsIG91dGNudCwgaW5jbnQsICZyZXFzW2ldLCAKPj4gR0ZQX0tFUk5FTCk7
Cj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoZXJyIDwgMCkgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBwcl9lcnIoImZhaWxlZCB0byBhZGQgbXNnWyVkXSB0byB2aXJ0cXVldWUuXG4iLCBpKTsK
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAga2ZyZWUocmVxc1tpXS5idWYpOwo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZXFzW2ldLmJ1ZiA9IE5VTEw7Cj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGJyZWFrOwo+PiArwqDCoMKgwqDCoMKgwqAgfQo+PiArwqDCoMKgIH0KPj4gKwo+PiAr
wqDCoMKgIHJldHVybiBpOwo+PiArfQo+PiArCj4+ICtzdGF0aWMgaW50IHZpcnRpb19pMmNfY29t
cGxldGVfcmVxcyhzdHJ1Y3QgdmlydHF1ZXVlICp2cSwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCB2aXJ0aW9faTJjX3JlcSAqcmVxcywKPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBpMmNfbXNnICptc2dzLCBp
bnQgbnIpCj4+ICt7Cj4+ICvCoMKgwqAgc3RydWN0IHZpcnRpb19pMmNfcmVxICpyZXE7Cj4+ICvC
oMKgwqAgdW5zaWduZWQgaW50IGxlbjsKPj4gK8KgwqDCoCBpbnQgaTsKPj4gKwo+PiArwqDCoMKg
IGZvciAoaSA9IDA7IGkgPCBucjsgaSsrKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCByZXEgPSAoc3Ry
dWN0IHZpcnRpb19pMmNfcmVxICopdmlydHF1ZXVlX2dldF9idWYodnEsICZsZW4pOwo+Cj4KPiBU
aGUgY2FzZSBpcyB1bm5lY2Vzc2FyeS4KPgpSaWdodC4gV2lsbCByZW1vdmUgdGhlIGNvbnZlcnNp
b24uCj4KPj4gK8KgwqDCoMKgwqDCoMKgIGlmICghKHJlcSAmJiByZXEgPT0gJnJlcXNbaV0pKSB7
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHByX2VycigibXNnWyVkXTogYWRkcj0weCV4IHZp
cnRxdWV1ZSBlcnJvci5cbiIsIGksIAo+PiBtc2dzW2ldLmFkZHIpOwo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBicmVhazsKPj4gK8KgwqDCoMKgwqDCoMKgIH0KPgo+Cj4gSXQncyBiZXR0ZXIg
dG8gYmUgbW9yZSBzcGVjaWZpYyBoZXJlLCBlLmcgd2UgY2FuIHNheSB3ZSBzYXcgb3V0IG9mIAo+
IG9yZGVyIGNvbXBsZXRpb24gaGVyZS4KPgpPSy4KPgo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoCBp
ZiAocmVxLT5pbl9oZHIuc3RhdHVzICE9IFZJUlRJT19JMkNfTVNHX09LKSB7Cj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHByX2VycigibXNnWyVkXTogYWRkcj0weCV4IGJhY2tlbmQgZXJyb3Iu
XG4iLCBpLCAKPj4gbXNnc1tpXS5hZGRyKTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJl
YWs7Cj4KPgo+IERvbid0IHdlIG5lZWQgdG8gY2xlYW4gdXNlZCByaW5nIGJ5IGtlZXBpbmcgY2Fs
bGluZyAKPiB2aXJ0cXVldWVfZ2V0X2J1ZigpIGhlcmU/Cj4KWW91IGFyZSByaWdodC4gTmVlZCB0
byBkZXRhY2ggYWxsIHRoZSB1c2VkIGJ1ZmZlcnMgZnJvbSB0aGUgdnEgYmVmb3JlIApxdWV1aW5n
IG5ldyBidWZmZXJzLgoKPj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4gKwo+PiArwqDCoMKgwqDCoMKg
wqAgaWYgKG1zZ3NbaV0uZmxhZ3MgJiBJMkNfTV9SRCkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgbWVtY3B5KG1zZ3NbaV0uYnVmLCByZXEtPmJ1ZiwgbXNnc1tpXS5sZW4pOwo+Cj4KPiBTb3Jy
eSBpZiBJIGhhZCBhc2tlZCB0aGlzIGJlZm9yZSBidXQgYW55IHJhc29uIG5vdCB0byB1c2UgbXNn
W2ldLmJ1ZiAKPiBkaXJlY3RseT8KPgpXaWxsIHRyeSB0byB1c2UgbXNnW2ldLmJ1Zi4KPgo+PiAr
Cj4+ICvCoMKgwqDCoMKgwqDCoCBrZnJlZShyZXEtPmJ1Zik7Cj4+ICvCoMKgwqDCoMKgwqDCoCBy
ZXEtPmJ1ZiA9IE5VTEw7Cj4+ICvCoMKgwqAgfQo+PiArCj4+ICvCoMKgwqAgcmV0dXJuIGk7Cj4+
ICt9Cj4+ICsKPj4gK3N0YXRpYyBpbnQgdmlydGlvX2kyY194ZmVyKHN0cnVjdCBpMmNfYWRhcHRl
ciAqYWRhcCwgc3RydWN0IGkyY19tc2cgCj4+ICptc2dzLCBpbnQgbnVtKQo+PiArewo+PiArwqDC
oMKgIHN0cnVjdCB2aXJ0aW9faTJjICp2aSA9IGkyY19nZXRfYWRhcGRhdGEoYWRhcCk7Cj4+ICvC
oMKgwqAgc3RydWN0IHZpcnRxdWV1ZSAqdnEgPSB2aS0+dnE7Cj4+ICvCoMKgwqAgc3RydWN0IHZp
cnRpb19pMmNfcmVxICpyZXFzOwo+PiArwqDCoMKgIHVuc2lnbmVkIGxvbmcgdGltZV9sZWZ0Owo+
PiArwqDCoMKgIGludCByZXQsIG5yOwo+PiArCj4+ICvCoMKgwqAgcmVxcyA9IGtjYWxsb2MobnVt
LCBzaXplb2YoKnJlcXMpLCBHRlBfS0VSTkVMKTsKPj4gK8KgwqDCoCBpZiAoIXJlcXMpCj4+ICvC
oMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT01FTTsKPj4gKwo+PiArwqDCoMKgIG11dGV4X2xvY2so
JnZpLT5pMmNfbG9jayk7Cj4+ICsKPj4gK8KgwqDCoCByZXQgPSB2aXJ0aW9faTJjX3NlbmRfcmVx
cyh2cSwgcmVxcywgbXNncywgbnVtKTsKPj4gK8KgwqDCoCBpZiAocmV0ID09IDApCj4+ICvCoMKg
wqDCoMKgwqDCoCBnb3RvIGVycl91bmxvY2tfZnJlZTsKPj4gKwo+PiArwqDCoMKgIG5yID0gcmV0
Owo+PiArCj4+ICvCoMKgwqAgdmlydHF1ZXVlX2tpY2sodnEpOwo+PiArCj4+ICvCoMKgwqAgdGlt
ZV9sZWZ0ID0gd2FpdF9mb3JfY29tcGxldGlvbl90aW1lb3V0KCZ2aS0+Y29tcGxldGlvbiwgCj4+
IGFkYXAtPnRpbWVvdXQpOwo+PiArwqDCoMKgIGlmICghdGltZV9sZWZ0KSB7Cj4+ICvCoMKgwqDC
oMKgwqDCoCBkZXZfZXJyKCZhZGFwLT5kZXYsICJ2aXJ0aW8gaTJjIGJhY2tlbmQgdGltZW91dC5c
biIpOwo+PiArwqDCoMKgwqDCoMKgwqAgcmV0ID0gLUVUSU1FRE9VVDsKPj4gK8KgwqDCoMKgwqDC
oMKgIGdvdG8gZXJyX3VubG9ja19mcmVlOwo+Cj4KPiBTbyBpZiB0aGUgcmVxdWVzdCBpcyBmaW5p
c2hlZCBhZnRlciB0aGUgdGltZXJvdXQsIGFsbCB0aGUgZm9sbG93aW5nIAo+IHJlcXVlc3Qgd2ls
bCBmYWlsLCBpcyB0aGlzIGV4cGVjdGVkPwo+Cj4KVGhpcyBpcyBhbiBleHBlY3RlZCBiZWhhdmlv
ci4gSWYgdGltZW91dCBoYXBwZW5zLCB3ZSBkb24ndCBuZWVkIHRvIGNhcmUgCmFib3V0IHRoZSBy
ZXF1ZXN0cyB3aGV0aGVyCnJlYWxseSBjb21wbGV0ZWQgYnkgIkhXIiBvciBub3QuIEp1c3QgcmV0
dXJuIGVycm9yIGFuZCBsZXQgdGhlIGkyYyBjb3JlIAp0byBkZWNpZGUgd2hldGhlciB0byByZXNl
bmQuCj4+ICvCoMKgwqAgfQo+PiArCj4+ICvCoMKgwqAgcmV0ID0gdmlydGlvX2kyY19jb21wbGV0
ZV9yZXFzKHZxLCByZXFzLCBtc2dzLCBucik7Cj4KPgo+IFNvIGNvbnNpZGVyIGRyaXZlciBxdWV1
ZSBOIHJlcXVlc3RzLCBjYW4gZGV2aWNlIHJhaXNlIGludGVycnVwdCBpZiBpdCAKPiBjb21wbGV0
ZXMgdGhlIGZpcnN0IHJlcXVlc3Q/IElmIHllcywgdGhlIGNvZGUgYnJlYWssIGlmIG5vdCBpdCBu
ZWVkIHRvIAo+IGJlIGNsYXJpZmllZCBpbiB0aGUgc3BlYy4KVGhlIGRldmljZSBjYW4gcmFpc2Ug
aW50ZXJydXB0IHdoZW4gc29tZSByZXF1ZXN0cyBhcmUgc3RpbGwgbm90IApjb21wbGV0ZWQgdGhv
dWdoIHRoaXMgaXMgbm90IGEgZ29vZCBvcGVyYXRpb24uCkluIHRoaXMgY2FzZSwgdGhlIHJlbWFp
bmluZyByZXF1ZXN0cyBpbiB0aGUgdnEgd2lsbCBiZSBpZ25vcmVkIGFuZCB0aGUgCmkyY19hbGdv
cml0aG0uIG1hc3Rlcl94ZmVyIHdpbGwgcmV0dXJuIDEgZm9yCnlvdXIgZXhhbXBsZS4gQW5kIGxl
dCB0aGUgaTJjIGNvcmUgdG8gZGVjaWRlIHdoZXRoZXIgdG8gcmVzZW5kLgo+Cj4gQWNhdWx0bHkg
SSByZW1lbWJlciB0aGVyZSdzIG5vIFZJUlRJT19JMkNfRkxBR1NfRkFJTF9ORVhUIGluIHByZXZp
b3VzIAo+IHZlcnNpb25zLCBhbmQgYWZ0ZXIgcmVhZGluZyB0aGUgc3BlYyBJIHN0aWxsIGRvbid0
IGdldCB0aGUgbW90aXZhdGlvbiAKPiBmb3IgdGhhdCAoaXQgbWF5IGNvbXBsaWNhdGVzIGJvdGgg
ZHJpdmVyIGFuZCBkZXZpY2UgYWN0dWFsbHkpLgo+ClRoaXMgZmxhZyBpcyBpbnRyb2R1Y2VkIGJ5
IFN0ZWZhbi4gUGxlYXNlIGNoZWNrIGZvbGxvd2luZyBsaW5rIGZvciB0aGUgCmRldGFpbHMKaHR0
cHM6Ly9saXN0cy5vYXNpcy1vcGVuLm9yZy9hcmNoaXZlcy92aXJ0aW8tY29tbWVudC8yMDIwMTIv
bXNnMDAwNzUuaHRtbC4KPgo+PiArCj4+ICvCoMKgwqAgcmVpbml0X2NvbXBsZXRpb24oJnZpLT5j
b21wbGV0aW9uKTsKPgo+Cj4gU28gaWYgYSByZXF1ZXN0IGl0IHRpbWVvdXQgYnV0IGludGVycnVw
dCBpcyByYWlzZWQgaGVyZSwgZXZlcnl0aGluZyBpcyAKPiBicm9rZW4uCj4KPiBUaGFua3MKPgpJ
ZiBpbnRlcnJ1cHQgaXMgcmFpc2VkIGFmdGVyIHRpbWVvdXQsIHRob3NlIHJlcXVlc3RzIGluIHRo
ZSB2cSB3aWxsIGJlIAppZ25vcmVkLgpObyBuZWVkIHRvIGNhcmUgYWJvdXQgdGhlbSBiZWluZyBo
YW5kbGVkIG9yIG5vdC4gSnVzdCBsZXQgdGhlIGkyYyBjb3JlIHRvCmRlY2lkZSB3aGV0aGVyIG5l
ZWQgdG8gcmVzZW5kIG9yIG5vdC4KPgo+PiArCj4+ICtlcnJfdW5sb2NrX2ZyZWU6Cj4+ICvCoMKg
wqAgbXV0ZXhfdW5sb2NrKCZ2aS0+aTJjX2xvY2spOwo+PiArwqDCoMKgIGtmcmVlKHJlcXMpOwo+
PiArwqDCoMKgIHJldHVybiByZXQ7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyB2b2lkIHZpcnRpb19p
MmNfZGVsX3ZxcyhzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldikKPj4gK3sKPj4gK8KgwqDCoCB2
ZGV2LT5jb25maWctPnJlc2V0KHZkZXYpOwo+PiArwqDCoMKgIHZkZXYtPmNvbmZpZy0+ZGVsX3Zx
cyh2ZGV2KTsKPj4gK30KPj4gKwo+PiArc3RhdGljIGludCB2aXJ0aW9faTJjX3NldHVwX3Zxcyhz
dHJ1Y3QgdmlydGlvX2kyYyAqdmkpCj4+ICt7Cj4+ICvCoMKgwqAgc3RydWN0IHZpcnRpb19kZXZp
Y2UgKnZkZXYgPSB2aS0+dmRldjsKPj4gKwo+PiArwqDCoMKgIHZpLT52cSA9IHZpcnRpb19maW5k
X3NpbmdsZV92cSh2ZGV2LCB2aXJ0aW9faTJjX21zZ19kb25lLCAibXNnIik7Cj4+ICvCoMKgwqAg
cmV0dXJuIFBUUl9FUlJfT1JfWkVSTyh2aS0+dnEpOwo+PiArfQo+PiArCj4+ICtzdGF0aWMgdTMy
IHZpcnRpb19pMmNfZnVuYyhzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXApCj4+ICt7Cj4+ICvCoMKg
wqAgcmV0dXJuIEkyQ19GVU5DX0kyQyB8IEkyQ19GVU5DX1NNQlVTX0VNVUw7Cj4+ICt9Cj4+ICsK
Pj4gK3N0YXRpYyBzdHJ1Y3QgaTJjX2FsZ29yaXRobSB2aXJ0aW9fYWxnb3JpdGhtID0gewo+PiAr
wqDCoMKgIC5tYXN0ZXJfeGZlciA9IHZpcnRpb19pMmNfeGZlciwKPj4gK8KgwqDCoCAuZnVuY3Rp
b25hbGl0eSA9IHZpcnRpb19pMmNfZnVuYywKPj4gK307Cj4+ICsKPj4gK3N0YXRpYyBzdHJ1Y3Qg
aTJjX2FkYXB0ZXIgdmlydGlvX2FkYXB0ZXIgPSB7Cj4+ICvCoMKgwqAgLm93bmVyID0gVEhJU19N
T0RVTEUsCj4+ICvCoMKgwqAgLm5hbWUgPSAiVmlydGlvIEkyQyBBZGFwdGVyIiwKPj4gK8KgwqDC
oCAuY2xhc3MgPSBJMkNfQ0xBU1NfREVQUkVDQVRFRCwKPj4gK8KgwqDCoCAuYWxnbyA9ICZ2aXJ0
aW9fYWxnb3JpdGhtLAo+PiArfTsKPj4gKwo+PiArc3RhdGljIGludCB2aXJ0aW9faTJjX3Byb2Jl
KHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2KQo+PiArewo+PiArwqDCoMKgIHN0cnVjdCBkZXZp
Y2UgKnBkZXYgPSB2ZGV2LT5kZXYucGFyZW50Owo+PiArwqDCoMKgIHN0cnVjdCB2aXJ0aW9faTJj
ICp2aTsKPj4gK8KgwqDCoCBpbnQgcmV0Owo+PiArCj4+ICvCoMKgwqAgdmkgPSBkZXZtX2t6YWxs
b2MoJnZkZXYtPmRldiwgc2l6ZW9mKCp2aSksIEdGUF9LRVJORUwpOwo+PiArwqDCoMKgIGlmICgh
dmkpCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT01FTTsKPj4gKwo+PiArwqDCoMKgIHZk
ZXYtPnByaXYgPSB2aTsKPj4gK8KgwqDCoCB2aS0+dmRldiA9IHZkZXY7Cj4+ICsKPj4gK8KgwqDC
oCBtdXRleF9pbml0KCZ2aS0+aTJjX2xvY2spOwo+PiArwqDCoMKgIGluaXRfY29tcGxldGlvbigm
dmktPmNvbXBsZXRpb24pOwo+PiArCj4+ICvCoMKgwqAgcmV0ID0gdmlydGlvX2kyY19zZXR1cF92
cXModmkpOwo+PiArwqDCoMKgIGlmIChyZXQpCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0
Owo+PiArCj4+ICvCoMKgwqAgdmktPmFkYXAgPSB2aXJ0aW9fYWRhcHRlcjsKPj4gK8KgwqDCoCBp
MmNfc2V0X2FkYXBkYXRhKCZ2aS0+YWRhcCwgdmkpOwo+PiArwqDCoMKgIHZpLT5hZGFwLmRldi5w
YXJlbnQgPSAmdmRldi0+ZGV2Owo+PiArwqDCoMKgIC8qIFNldHVwIEFDUEkgbm9kZSBmb3IgY29u
dHJvbGxlZCBkZXZpY2VzIHdoaWNoIHdpbGwgYmUgcHJvYmVkIAo+PiB0aHJvdWdoIEFDUEkgKi8K
Pj4gK8KgwqDCoCBBQ1BJX0NPTVBBTklPTl9TRVQoJnZpLT5hZGFwLmRldiwgQUNQSV9DT01QQU5J
T04ocGRldikpOwo+PiArwqDCoMKgIHZpLT5hZGFwLnRpbWVvdXQgPSBIWiAvIDEwOwo+PiArCj4+
ICvCoMKgwqAgcmV0ID0gaTJjX2FkZF9hZGFwdGVyKCZ2aS0+YWRhcCk7Cj4+ICvCoMKgwqAgaWYg
KHJldCkgewo+PiArwqDCoMKgwqDCoMKgwqAgdmlydGlvX2kyY19kZWxfdnFzKHZkZXYpOwo+PiAr
wqDCoMKgwqDCoMKgwqAgZGV2X2VycigmdmRldi0+ZGV2LCAiZmFpbGVkIHRvIGFkZCB2aXJ0aW8t
aTJjIGFkYXB0ZXIuXG4iKTsKPj4gK8KgwqDCoCB9Cj4+ICsKPj4gK8KgwqDCoCByZXR1cm4gcmV0
Owo+PiArfQo+PiArCj4+ICtzdGF0aWMgdm9pZCB2aXJ0aW9faTJjX3JlbW92ZShzdHJ1Y3Qgdmly
dGlvX2RldmljZSAqdmRldikKPj4gK3sKPj4gK8KgwqDCoCBzdHJ1Y3QgdmlydGlvX2kyYyAqdmkg
PSB2ZGV2LT5wcml2Owo+PiArCj4+ICvCoMKgwqAgaTJjX2RlbF9hZGFwdGVyKCZ2aS0+YWRhcCk7
Cj4+ICvCoMKgwqAgdmlydGlvX2kyY19kZWxfdnFzKHZkZXYpOwo+PiArfQo+PiArCj4+ICtzdGF0
aWMgc3RydWN0IHZpcnRpb19kZXZpY2VfaWQgaWRfdGFibGVbXSA9IHsKPj4gK8KgwqDCoCB7IFZJ
UlRJT19JRF9JMkNfQURQVEVSLCBWSVJUSU9fREVWX0FOWV9JRCB9LAo+PiArwqDCoMKgIHt9Cj4+
ICt9Owo+PiArTU9EVUxFX0RFVklDRV9UQUJMRSh2aXJ0aW8sIGlkX3RhYmxlKTsKPj4gKwo+PiAr
c3RhdGljIGludCBfX21heWJlX3VudXNlZCB2aXJ0aW9faTJjX2ZyZWV6ZShzdHJ1Y3QgdmlydGlv
X2RldmljZSAqdmRldikKPj4gK3sKPj4gK8KgwqDCoCB2aXJ0aW9faTJjX2RlbF92cXModmRldik7
Cj4+ICvCoMKgwqAgcmV0dXJuIDA7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyBpbnQgX19tYXliZV91
bnVzZWQgdmlydGlvX2kyY19yZXN0b3JlKHN0cnVjdCB2aXJ0aW9fZGV2aWNlIAo+PiAqdmRldikK
Pj4gK3sKPj4gK8KgwqDCoCByZXR1cm4gdmlydGlvX2kyY19zZXR1cF92cXModmRldi0+cHJpdik7
Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyBzdHJ1Y3QgdmlydGlvX2RyaXZlciB2aXJ0aW9faTJjX2Ry
aXZlciA9IHsKPj4gK8KgwqDCoCAuaWRfdGFibGXCoMKgwqAgPSBpZF90YWJsZSwKPj4gK8KgwqDC
oCAucHJvYmXCoMKgwqDCoMKgwqDCoCA9IHZpcnRpb19pMmNfcHJvYmUsCj4+ICvCoMKgwqAgLnJl
bW92ZcKgwqDCoMKgwqDCoMKgID0gdmlydGlvX2kyY19yZW1vdmUsCj4+ICvCoMKgwqAgLmRyaXZl
csKgwqDCoCA9IHsKPj4gK8KgwqDCoMKgwqDCoMKgIC5uYW1lwqDCoMKgID0gImkyY192aXJ0aW8i
LAo+PiArwqDCoMKgIH0sCj4+ICsjaWZkZWYgQ09ORklHX1BNX1NMRUVQCj4+ICvCoMKgwqAgLmZy
ZWV6ZSA9IHZpcnRpb19pMmNfZnJlZXplLAo+PiArwqDCoMKgIC5yZXN0b3JlID0gdmlydGlvX2ky
Y19yZXN0b3JlLAo+PiArI2VuZGlmCj4+ICt9Owo+PiArbW9kdWxlX3ZpcnRpb19kcml2ZXIodmly
dGlvX2kyY19kcml2ZXIpOwo+PiArCj4+ICtNT0RVTEVfREVTQ1JJUFRJT04oIlZpcnRpbyBpMmMg
YnVzIGRyaXZlciIpOwo+PiArTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOwo+PiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS91YXBpL2xpbnV4L3ZpcnRpb19pMmMuaCAKPj4gYi9pbmNsdWRlL3VhcGkvbGludXgv
dmlydGlvX2kyYy5oCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAuLjAw
ZjQ1MDgKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9pbmNsdWRlL3VhcGkvbGludXgvdmlydGlv
X2kyYy5oCj4+IEBAIC0wLDAgKzEsNDIgQEAKPj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wLW9yLWxhdGVyIFdJVEggTGludXgtc3lzY2FsbC1ub3RlICovCj4+ICsvKgo+PiAr
ICogRGVmaW5pdGlvbnMgZm9yIHZpcnRpbyBJMkMgQWRwdGVyCj4+ICsgKgo+PiArICogQ29weXJp
Z2h0IChjKSAyMDIxIEludGVsIENvcnBvcmF0aW9uLiBBbGwgcmlnaHRzIHJlc2VydmVkLgo+PiAr
ICovCj4+ICsKPj4gKyNpZm5kZWYgX1VBUElfTElOVVhfVklSVElPX0kyQ19ICj4+ICsjZGVmaW5l
IF9VQVBJX0xJTlVYX1ZJUlRJT19JMkNfSAo+PiArCj4+ICsjaW5jbHVkZSA8bGludXgvdHlwZXMu
aD4KPj4gKyNpbmNsdWRlIDxsaW51eC92aXJ0aW9faWRzLmg+Cj4+ICsjaW5jbHVkZSA8bGludXgv
dmlydGlvX2NvbmZpZy5oPgo+PiArCj4+ICsvKioKPj4gKyAqIHN0cnVjdCB2aXJ0aW9faTJjX291
dF9oZHIgLSB0aGUgdmlydGlvIEkyQyBtZXNzYWdlIE9VVCBoZWFkZXIKPj4gKyAqIEBhZGRyOiB0
aGUgY29udHJvbGxlZCBkZXZpY2UgYWRkcmVzcwo+PiArICogQHBhZGRpbmc6IHVzZWQgdG8gcGFk
IHRvIGZ1bGwgZHdvcmQKPj4gKyAqIEBmbGFnczogdXNlZCBmb3IgZmVhdHVyZSBleHRlbnNpYmls
aXR5Cj4+ICsgKi8KPj4gK3N0cnVjdCB2aXJ0aW9faTJjX291dF9oZHIgewo+PiArwqDCoMKgIF9f
bGUxNiBhZGRyOwo+PiArwqDCoMKgIF9fbGUxNiBwYWRkaW5nOwo+PiArwqDCoMKgIF9fbGUzMiBm
bGFnczsKPj4gK307Cj4+ICsKPj4gKy8qIFRoZSBiaXQgMCBvZiB0aGUgQHZpcnRpb19pMmNfb3V0
X2hkci5AZmxhZ3MsIHVzZWQgdG8gZ3JvdXAgdGhlIAo+PiByZXF1ZXN0cyAqLwo+PiArI2RlZmlu
ZSBWSVJUSU9fSTJDX0ZMQUdTX0ZBSUxfTkVYVMKgwqDCoCAweDAwMDAwMDAxCj4+ICsKPj4gKy8q
Kgo+PiArICogc3RydWN0IHZpcnRpb19pMmNfaW5faGRyIC0gdGhlIHZpcnRpbyBJMkMgbWVzc2Fn
ZSBJTiBoZWFkZXIKPj4gKyAqIEBzdGF0dXM6IHRoZSBwcm9jZXNzaW5nIHJlc3VsdCBmcm9tIHRo
ZSBiYWNrZW5kCj4+ICsgKi8KPj4gK3N0cnVjdCB2aXJ0aW9faTJjX2luX2hkciB7Cj4+ICvCoMKg
wqAgdTggc3RhdHVzOwo+PiArfTsKPj4gKwo+PiArLyogVGhlIGZpbmFsIHN0YXR1cyB3cml0dGVu
IGJ5IHRoZSBkZXZpY2UgKi8KPj4gKyNkZWZpbmUgVklSVElPX0kyQ19NU0dfT0vCoMKgwqAgMAo+
PiArI2RlZmluZSBWSVJUSU9fSTJDX01TR19FUlLCoMKgwqAgMQo+PiArCj4+ICsjZW5kaWYgLyog
X1VBUElfTElOVVhfVklSVElPX0kyQ19IICovCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkv
bGludXgvdmlydGlvX2lkcy5oIAo+PiBiL2luY2x1ZGUvdWFwaS9saW51eC92aXJ0aW9faWRzLmgK
Pj4gaW5kZXggYmMxYzA2Mi4uNmFlMzJkYiAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS91YXBpL2xp
bnV4L3ZpcnRpb19pZHMuaAo+PiArKysgYi9pbmNsdWRlL3VhcGkvbGludXgvdmlydGlvX2lkcy5o
Cj4+IEBAIC01NCw1ICs1NCw2IEBACj4+IMKgICNkZWZpbmUgVklSVElPX0lEX0ZTwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAyNiAvKiB2aXJ0aW8gZmlsZXN5c3RlbSAqLwo+PiDCoCAjZGVmaW5lIFZJ
UlRJT19JRF9QTUVNwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAyNyAvKiB2aXJ0aW8gcG1lbSAqLwo+
PiDCoCAjZGVmaW5lIFZJUlRJT19JRF9NQUM4MDIxMV9IV1NJTcKgwqDCoCAyOSAvKiB2aXJ0aW8g
bWFjODAyMTEtaHdzaW0gKi8KPj4gKyNkZWZpbmUgVklSVElPX0lEX0kyQ19BRFBURVLCoMKgwqDC
oMKgwqDCoCAzNCAvKiB2aXJ0aW8gaTJjIGFkcHRlciAqLwo+PiDCoCDCoCAjZW5kaWYgLyogX0xJ
TlVYX1ZJUlRJT19JRFNfSCAqLwo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBs
aXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5v
cmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
