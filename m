Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4066F0308
	for <lists.virtualization@lfdr.de>; Thu, 27 Apr 2023 11:07:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFA2541F93;
	Thu, 27 Apr 2023 09:07:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFA2541F93
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d/qIEJSd
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZEhbQhZWRxpZ; Thu, 27 Apr 2023 09:07:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2C79341F87;
	Thu, 27 Apr 2023 09:07:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C79341F87
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E9EAC008A;
	Thu, 27 Apr 2023 09:07:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D65DC002A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Apr 2023 09:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1149741F87
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Apr 2023 09:07:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1149741F87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MfmqmmXQCDEZ
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Apr 2023 09:07:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A08B241E96
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A08B241E96
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Apr 2023 09:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682586452; x=1714122452;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+RWgwJUlze2R4HQzYeLjxmiGV6GnAgNR+1eKEuY4muM=;
 b=d/qIEJSdTjx4QUs4hJn3RIpq609oXqAz0Pmb+DN8P6Ij5R9Y0AxqRhIA
 zjm6nVMmOivZV05OmSyemzVE7dTyb2JePK4TnVP+tqUV/fp3j0r7b5F+0
 d/pzKn0TgyD4ylkRsn48eUKOSbc+INWZYJq864y5ZhJ7BGyfULHVPlMZ5
 VeXR9ApYU8IbdRC2qjLqFTDwtSXTEx56REnHe/+QgsjZDGlvdKP2RD0Bm
 lypw2sQARsnyuIyrQG5x4+VEsc4bdRMgbzM5RXXROWwYV0xvT5s3D29SY
 C2in3SSw1mP8y06oh8qnhH71ffOP38VaQokfRB95I4zMQwn7kdtSgiFrk g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="350225029"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="350225029"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 02:07:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="759017844"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="759017844"
Received: from lingshan-mobl.ccr.corp.intel.com (HELO [10.254.208.193])
 ([10.254.208.193])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 02:07:15 -0700
Message-ID: <d5bfd95a-a3b9-bfd3-8690-4e739428f0b9@intel.com>
Date: Thu, 27 Apr 2023 17:07:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [PATCH 4/5] synchronize irqs in the reset routine
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, mst@redhat.com
References: <20230331204854.20082-1-lingshan.zhu@intel.com>
 <20230331204854.20082-5-lingshan.zhu@intel.com>
 <329f4dbf-442e-2171-bad4-cceb9efd6dc7@redhat.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <329f4dbf-442e-2171-bad4-cceb9efd6dc7@redhat.com>
Cc: virtualization@lists.linux-foundation.org
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

CgpPbiA0LzI2LzIwMjMgMTowNiBQTSwgSmFzb24gV2FuZyB3cm90ZToKPgo+IOWcqCAyMDIzLzQv
MSAwNDo0OCwgWmh1IExpbmdzaGFuIOWGmemBkzoKPj4gVGhpcyBjb21taXQgc3luY2hyb25pemUg
aXJxcyBvZiB0aGUgdmlydHF1ZXVlcwo+PiBhbmQgY29uZmlnIHNwYWNlIGluIHRoZSByZXNldCBy
b3V0aW5lLgo+PiBUaHVzIGlmY3ZmX3N0b3BfaHcoKSBhbmQgcmVzZXQoKSBhcmUgcmVmYWN0b3Jl
ZCBhcyB3ZWxsLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBaaHUgTGluZ3NoYW4gPGxpbmdzaGFuLnpo
dUBpbnRlbC5jb20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfYmFzZS5j
IHwgNjEgKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tCj4+IMKgIGRyaXZlcnMvdmRw
YS9pZmN2Zi9pZmN2Zl9tYWluLmMgfCA0NSArKystLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gwqAg
MiBmaWxlcyBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCspLCA1MiBkZWxldGlvbnMoLSkKPj4KPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9iYXNlLmMgCj4+IGIvZHJpdmVy
cy92ZHBhL2lmY3ZmL2lmY3ZmX2Jhc2UuYwo+PiBpbmRleCA3OWUzMTNjNWUxMGUuLjQ5OTQ5YWVj
MjBlZiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX2Jhc2UuYwo+PiAr
KysgYi9kcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfYmFzZS5jCj4+IEBAIC0xNzAsMTIgKzE3MCw3
IEBAIHZvaWQgaWZjdmZfc2V0X3N0YXR1cyhzdHJ1Y3QgaWZjdmZfaHcgKmh3LCB1OCAKPj4gc3Rh
dHVzKQo+PiDCoCDCoCB2b2lkIGlmY3ZmX3Jlc2V0KHN0cnVjdCBpZmN2Zl9odyAqaHcpCj4+IMKg
IHsKPj4gLcKgwqDCoCBody0+Y29uZmlnX2NiLmNhbGxiYWNrID0gTlVMTDsKPj4gLcKgwqDCoCBo
dy0+Y29uZmlnX2NiLnByaXZhdGUgPSBOVUxMOwo+PiAtCj4+IMKgwqDCoMKgwqAgaWZjdmZfc2V0
X3N0YXR1cyhodywgMCk7Cj4+IC3CoMKgwqAgLyogZmx1c2ggc2V0X3N0YXR1cywgbWFrZSBzdXJl
IFZGIGlzIHN0b3BwZWQsIHJlc2V0ICovCj4+IC3CoMKgwqAgaWZjdmZfZ2V0X3N0YXR1cyhodyk7
Cj4KPgo+IElmIHdlIGRvbid0IGZsdXNoIG9yIHBvbGwgaG93IGNhbiB3ZSBrbm93IHRoZSByZXNl
dCBpcyBkb25lPwo+Cj4gRS5nIG1vZGVybiB2aXJ0aW8tcGNpIGRpZDoKPgo+IMKgwqDCoMKgwqDC
oMKgIC8qIDAgc3RhdHVzIG1lYW5zIGEgcmVzZXQuICovCj4gwqDCoCDCoMKgwqDCoCB2cF9tb2Rl
cm5fc2V0X3N0YXR1cyhtZGV2LCAwKTsKPiDCoMKgwqDCoMKgwqDCoCAvKiBBZnRlciB3cml0aW5n
IDAgdG8gZGV2aWNlX3N0YXR1cywgdGhlIGRyaXZlciBNVVNUIHdhaXQgZm9yIAo+IGEgcmVhZCBv
Zgo+IMKgwqDCoMKgwqDCoMKgwqAgKiBkZXZpY2Vfc3RhdHVzIHRvIHJldHVybiAwIGJlZm9yZSBy
ZWluaXRpYWxpemluZyB0aGUgZGV2aWNlLgo+IMKgwqDCoMKgwqDCoMKgwqAgKiBUaGlzIHdpbGwg
Zmx1c2ggb3V0IHRoZSBzdGF0dXMgd3JpdGUsIGFuZCBmbHVzaCBpbiBkZXZpY2UgCj4gd3JpdGVz
LAo+IMKgwqDCoMKgwqDCoMKgwqAgKiBpbmNsdWRpbmcgTVNJLVggaW50ZXJydXB0cywgaWYgYW55
Lgo+IMKgwqDCoMKgwqDCoMKgwqAgKi8KPiDCoMKgwqDCoMKgwqDCoCB3aGlsZSAodnBfbW9kZXJu
X2dldF9zdGF0dXMobWRldikpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1zbGVl
cCgxKTsKPiDCoMKgwqDCoMKgwqDCoCAvKiBGbHVzaCBwZW5kaW5nIFZRL2NvbmZpZ3VyYXRpb24g
Y2FsbGJhY2tzLiAqLwo+IMKgwqAgwqDCoMKgIHZwX3N5bmNocm9uaXplX3ZlY3RvcnModmRldik7
ClRoYW5rcywgSSBjYW4gaW1wbGVtZW50IGEgc2ltaWxhciBnZXRfc3RhdHVzKCkgaGVyZS4KPgo+
PiDCoCB9Cj4+IMKgIMKgIHU2NCBpZmN2Zl9nZXRfaHdfZmVhdHVyZXMoc3RydWN0IGlmY3ZmX2h3
ICpodykKPj4gQEAgLTM2OCwyMCArMzYzLDYyIEBAIHZvaWQgaWZjdmZfc2V0X3ZxX3JlYWR5KHN0
cnVjdCBpZmN2Zl9odyAqaHcsIAo+PiB1MTYgcWlkLCBib29sIHJlYWR5KQo+PiDCoMKgwqDCoMKg
IHZwX2lvd3JpdGUxNihyZWFkeSwgJmNmZy0+cXVldWVfZW5hYmxlKTsKPj4gwqAgfQo+PiDCoCAt
c3RhdGljIHZvaWQgaWZjdmZfaHdfZGlzYWJsZShzdHJ1Y3QgaWZjdmZfaHcgKmh3KQo+PiArc3Rh
dGljIHZvaWQgc3luY2hyb25pemVfcGVyX3ZxX2lycShzdHJ1Y3QgaWZjdmZfaHcgKmh3KQo+PiDC
oCB7Cj4+IC3CoMKgwqAgdTMyIGk7Cj4+ICvCoMKgwqAgdTE2IHFpZDsKPj4gwqAgLcKgwqDCoCBp
ZmN2Zl9zZXRfY29uZmlnX3ZlY3RvcihodywgVklSVElPX01TSV9OT19WRUNUT1IpOwo+PiAtwqDC
oMKgIGZvciAoaSA9IDA7IGkgPCBody0+bnJfdnJpbmc7IGkrKykgewo+PiAtwqDCoMKgwqDCoMKg
wqAgaWZjdmZfc2V0X3ZxX3ZlY3RvcihodywgaSwgVklSVElPX01TSV9OT19WRUNUT1IpOwo+PiAr
wqDCoMKgIGZvciAocWlkID0gMDsgcWlkIDwgaHctPm5yX3ZyaW5nOyBxaWQrKykgewo+PiArwqDC
oMKgwqDCoMKgwqAgaWYgKGh3LT52cmluZ1txaWRdLmlycSAhPSAtRUlOVkFMKQo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBzeW5jaHJvbml6ZV9pcnEoaHctPnZyaW5nW3FpZF0uaXJxKTsKPj4g
wqDCoMKgwqDCoCB9Cj4+IMKgIH0KPj4gwqAgK3N0YXRpYyB2b2lkIHN5bmNocm9uaXplX3Zxc19y
ZXVzZWRfaXJxKHN0cnVjdCBpZmN2Zl9odyAqaHcpCj4+ICt7Cj4+ICvCoMKgwqAgaWYgKGh3LT52
cXNfcmV1c2VkX2lycSAhPSAtRUlOVkFMKQo+PiArwqDCoMKgwqDCoMKgwqAgc3luY2hyb25pemVf
aXJxKGh3LT52cXNfcmV1c2VkX2lycSk7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyB2b2lkIHN5bmNo
cm9uaXplX3ZxX2lycShzdHJ1Y3QgaWZjdmZfaHcgKmh3KQo+PiArewo+PiArwqDCoMKgIHU4IHN0
YXR1cyA9IGh3LT5tc2l4X3ZlY3Rvcl9zdGF0dXM7Cj4+ICsKPj4gK8KgwqDCoCBpZiAoc3RhdHVz
ID09IE1TSVhfVkVDVE9SX1BFUl9WUV9BTkRfQ09ORklHKQo+PiArwqDCoMKgwqDCoMKgwqAgc3lu
Y2hyb25pemVfcGVyX3ZxX2lycShodyk7Cj4+ICvCoMKgwqAgZWxzZQo+PiArwqDCoMKgwqDCoMKg
wqAgc3luY2hyb25pemVfdnFzX3JldXNlZF9pcnEoaHcpOwo+PiArfQo+Cj4KPiBJIHdvbmRlciBp
ZiB3ZSBuZWVkIHRvIGdvIHdpdGggc3VjaCBjb21wbGljYXRlZCB3YXlzLGNhbiB3ZSAKPiBzeW5j
aHJvbml6ZSB0aHJvdWdoIHRoZSB2ZWN0b3JzIGxpa2UgdmlydGlvLXBjaSBkaWQ/Cj4KPiDCoMKg
wqDCoMKgwqDCoCBmb3IgKGkgPSAwOyBpIDwgdnBfZGV2LT5tc2l4X3ZlY3RvcnM7ICsraSkKPiBz
eW5jaHJvbml6ZV9pcnEocGNpX2lycV92ZWN0b3IodnBfZGV2LT5wY2lfZGV2LCBpKSk7Cj4gPwpJ
IGNhbiByZWNvcmQgdGhlIG51bWJlciBvZiBtc2l4X3ZlY3RvcnMgYW5kIHN5Y24gaXJxIGJhc2Vk
IG9uIGl0IGluIFYyLgo+Cj4KPj4gKwo+PiArc3RhdGljIHZvaWQgc3luY2hyb25pemVfY29uZmln
X2lycShzdHJ1Y3QgaWZjdmZfaHcgKmh3KQo+PiArewo+PiArwqDCoMKgIGlmIChody0+Y29uZmln
X2lycSAhPSAtRUlOVkFMKQo+PiArwqDCoMKgwqDCoMKgwqAgc3luY2hyb25pemVfaXJxKGh3LT5j
b25maWdfaXJxKTsKPj4gK30KPj4gKwo+PiArc3RhdGljIHZvaWQgaWZjdmZfcmVzZXRfdnJpbmco
c3RydWN0IGlmY3ZmX2h3ICpodykKPj4gK3sKPj4gK8KgwqDCoCB1MTYgcWlkOwo+PiArCj4+ICvC
oMKgwqAgZm9yIChxaWQgPSAwOyBxaWQgPCBody0+bnJfdnJpbmc7IHFpZCsrKSB7Cj4+ICvCoMKg
wqDCoMKgwqDCoCBzeW5jaHJvbml6ZV92cV9pcnEoaHcpOwo+Cj4gU2luY2UgSVJRIGNvdWxkIGJl
IHNoYXJlZCwgdGhpcyB3aWxsIHJlc3VsdCBleHRyYSBjb21wbGV4aXR5LCBsaWtlIGEgCj4gaXJx
IGNvdWxkIGJlIGZsdXNoZWQgbXVsdGlwbGUgdGltZXM/Ck5vIGZvciB0aGlzIGNvZGUgcGF0aCwg
RS5nLiwgaWYgdGhlIGFsbCB2cXMgc2hhcmUgb25lIGlycSwgaXQgd2lsbCBvbmx5IApiZSBmbHVz
aGVkIG9uY2UgaW4gc3luY2hyb25pemVfdnFzX3JldXNlZF9pcnEoKQoKVGhhbmtzCj4KPiBUaGFu
a3MKPgo+Cj4+ICsgaHctPnZyaW5nW3FpZF0uY2IuY2FsbGJhY2sgPSBOVUxMOwo+PiArwqDCoMKg
wqDCoMKgwqAgaHctPnZyaW5nW3FpZF0uY2IucHJpdmF0ZSA9IE5VTEw7Cj4+ICvCoMKgwqDCoMKg
wqDCoCBpZmN2Zl9zZXRfdnFfdmVjdG9yKGh3LCBxaWQsIFZJUlRJT19NU0lfTk9fVkVDVE9SKTsK
Pj4gK8KgwqDCoCB9Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyB2b2lkIGlmY3ZmX3Jlc2V0X2NvbmZp
Z19oYW5kbGVyKHN0cnVjdCBpZmN2Zl9odyAqaHcpCj4+ICt7Cj4+ICvCoMKgwqAgc3luY2hyb25p
emVfY29uZmlnX2lycShodyk7Cj4+ICvCoMKgwqAgaHctPmNvbmZpZ19jYi5jYWxsYmFjayA9IE5V
TEw7Cj4+ICvCoMKgwqAgaHctPmNvbmZpZ19jYi5wcml2YXRlID0gTlVMTDsKPj4gK8KgwqDCoCBp
ZmN2Zl9zZXRfY29uZmlnX3ZlY3RvcihodywgVklSVElPX01TSV9OT19WRUNUT1IpOwo+PiArfQo+
PiArCj4+IMKgIHZvaWQgaWZjdmZfc3RvcF9odyhzdHJ1Y3QgaWZjdmZfaHcgKmh3KQo+PiDCoCB7
Cj4+IC3CoMKgwqAgaWZjdmZfaHdfZGlzYWJsZShodyk7Cj4+IC3CoMKgwqAgaWZjdmZfcmVzZXQo
aHcpOwo+PiArwqDCoMKgIGlmY3ZmX3Jlc2V0X3ZyaW5nKGh3KTsKPj4gK8KgwqDCoCBpZmN2Zl9y
ZXNldF9jb25maWdfaGFuZGxlcihodyk7Cj4+IMKgIH0KPj4gwqAgwqAgdm9pZCBpZmN2Zl9ub3Rp
ZnlfcXVldWUoc3RydWN0IGlmY3ZmX2h3ICpodywgdTE2IHFpZCkKPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9tYWluLmMgCj4+IGIvZHJpdmVycy92ZHBhL2lmY3ZmL2lm
Y3ZmX21haW4uYwo+PiBpbmRleCA5Njg2ODcxNTllNDQuLjE1YzYxNTdlZTg0MSAxMDA2NDQKPj4g
LS0tIGEvZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYwo+PiArKysgYi9kcml2ZXJzL3Zk
cGEvaWZjdmYvaWZjdmZfbWFpbi5jCj4+IEBAIC0zNDYsMzMgKzM0Niw2IEBAIHN0YXRpYyBpbnQg
aWZjdmZfcmVxdWVzdF9pcnEoc3RydWN0IGlmY3ZmX2h3ICp2ZikKPj4gwqDCoMKgwqDCoCByZXR1
cm4gMDsKPj4gwqAgfQo+PiDCoCAtc3RhdGljIGludCBpZmN2Zl9zdG9wX2RhdGFwYXRoKHN0cnVj
dCBpZmN2Zl9hZGFwdGVyICphZGFwdGVyKQo+PiAtewo+PiAtwqDCoMKgIHN0cnVjdCBpZmN2Zl9o
dyAqdmYgPSBhZGFwdGVyLT52ZjsKPj4gLcKgwqDCoCBpbnQgaTsKPj4gLQo+PiAtwqDCoMKgIGZv
ciAoaSA9IDA7IGkgPCB2Zi0+bnJfdnJpbmc7IGkrKykKPj4gLcKgwqDCoMKgwqDCoMKgIHZmLT52
cmluZ1tpXS5jYi5jYWxsYmFjayA9IE5VTEw7Cj4+IC0KPj4gLcKgwqDCoCBpZmN2Zl9zdG9wX2h3
KHZmKTsKPj4gLQo+PiAtwqDCoMKgIHJldHVybiAwOwo+PiAtfQo+PiAtCj4+IC1zdGF0aWMgdm9p
ZCBpZmN2Zl9yZXNldF92cmluZyhzdHJ1Y3QgaWZjdmZfYWRhcHRlciAqYWRhcHRlcikKPj4gLXsK
Pj4gLcKgwqDCoCBzdHJ1Y3QgaWZjdmZfaHcgKnZmID0gYWRhcHRlci0+dmY7Cj4+IC3CoMKgwqAg
aW50IGk7Cj4+IC0KPj4gLcKgwqDCoCBmb3IgKGkgPSAwOyBpIDwgdmYtPm5yX3ZyaW5nOyBpKysp
IHsKPj4gLcKgwqDCoMKgwqDCoMKgIHZmLT52cmluZ1tpXS5sYXN0X2F2YWlsX2lkeCA9IDA7Cj4+
IC3CoMKgwqDCoMKgwqDCoCB2Zi0+dnJpbmdbaV0uY2IuY2FsbGJhY2sgPSBOVUxMOwo+PiAtwqDC
oMKgwqDCoMKgwqAgdmYtPnZyaW5nW2ldLmNiLnByaXZhdGUgPSBOVUxMOwo+PiAtwqDCoMKgIH0K
Pj4gLQo+PiAtwqDCoMKgIGlmY3ZmX3Jlc2V0KHZmKTsKPj4gLX0KPj4gLQo+PiDCoCBzdGF0aWMg
c3RydWN0IGlmY3ZmX2FkYXB0ZXIgKnZkcGFfdG9fYWRhcHRlcihzdHJ1Y3QgdmRwYV9kZXZpY2Ug
Cj4+ICp2ZHBhX2RldikKPj4gwqAgewo+PiDCoMKgwqDCoMKgIHJldHVybiBjb250YWluZXJfb2Yo
dmRwYV9kZXYsIHN0cnVjdCBpZmN2Zl9hZGFwdGVyLCB2ZHBhKTsKPj4gQEAgLTQ2MiwyMyArNDM1
LDE1IEBAIHN0YXRpYyB2b2lkIGlmY3ZmX3ZkcGFfc2V0X3N0YXR1cyhzdHJ1Y3QgCj4+IHZkcGFf
ZGV2aWNlICp2ZHBhX2RldiwgdTggc3RhdHVzKQo+PiDCoCDCoCBzdGF0aWMgaW50IGlmY3ZmX3Zk
cGFfcmVzZXQoc3RydWN0IHZkcGFfZGV2aWNlICp2ZHBhX2RldikKPj4gwqAgewo+PiAtwqDCoMKg
IHN0cnVjdCBpZmN2Zl9hZGFwdGVyICphZGFwdGVyOwo+PiAtwqDCoMKgIHN0cnVjdCBpZmN2Zl9o
dyAqdmY7Cj4+IC3CoMKgwqAgdTggc3RhdHVzX29sZDsKPj4gLQo+PiAtwqDCoMKgIHZmwqAgPSB2
ZHBhX3RvX3ZmKHZkcGFfZGV2KTsKPj4gLcKgwqDCoCBhZGFwdGVyID0gdmRwYV90b19hZGFwdGVy
KHZkcGFfZGV2KTsKPj4gLcKgwqDCoCBzdGF0dXNfb2xkID0gaWZjdmZfZ2V0X3N0YXR1cyh2Zik7
Cj4+ICvCoMKgwqAgc3RydWN0IGlmY3ZmX2h3ICp2ZiA9IHZkcGFfdG9fdmYodmRwYV9kZXYpOwo+
PiArwqDCoMKgIHU4IHN0YXR1cyA9IGlmY3ZmX2dldF9zdGF0dXModmYpOwo+PiDCoCAtwqDCoMKg
IGlmIChzdGF0dXNfb2xkID09IDApCj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4gK8Kg
wqDCoCBpZmN2Zl9zdG9wX2h3KHZmKTsKPj4gwqAgLcKgwqDCoCBpZiAoc3RhdHVzX29sZCAmIFZJ
UlRJT19DT05GSUdfU19EUklWRVJfT0spIHsKPj4gLcKgwqDCoMKgwqDCoMKgIGlmY3ZmX3N0b3Bf
ZGF0YXBhdGgoYWRhcHRlcik7Cj4+ICvCoMKgwqAgaWYgKHN0YXR1cyAmIFZJUlRJT19DT05GSUdf
U19EUklWRVJfT0spCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpZmN2Zl9mcmVlX2lycSh2Zik7Cj4+
IC3CoMKgwqAgfQo+PiDCoCAtwqDCoMKgIGlmY3ZmX3Jlc2V0X3ZyaW5nKGFkYXB0ZXIpOwo+PiAr
wqDCoMKgIGlmY3ZmX3Jlc2V0KHZmKTsKPj4gwqAgwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4gwqAg
fQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0
dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRh
dGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGlu
Zm8vdmlydHVhbGl6YXRpb24=
