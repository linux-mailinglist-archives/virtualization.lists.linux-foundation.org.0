Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 650C9170549
	for <lists.virtualization@lfdr.de>; Wed, 26 Feb 2020 18:01:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D995B2001F;
	Wed, 26 Feb 2020 17:01:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CVd0-55Sj8m6; Wed, 26 Feb 2020 17:01:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 310762010C;
	Wed, 26 Feb 2020 17:01:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 115F3C0177;
	Wed, 26 Feb 2020 17:01:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8E273C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Feb 2020 17:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7B5022010C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Feb 2020 17:01:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f6u8KHsLibSI
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Feb 2020 17:01:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by silver.osuosl.org (Postfix) with ESMTPS id C86692001F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Feb 2020 17:01:37 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01QH1VWD001892;
 Wed, 26 Feb 2020 11:01:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582736491;
 bh=CZdphqXj3swfr3rshZA/0w1MD1hpzkcAcBfN76SapQ8=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=SNNkUAvXoggAOVNecqUg9xSNEJYjzrLU6umWjXK4EPh0R4/cJ/S47rUlRWY1b9T+P
 QDhnsksn0ISK030JdOaEcCRXcUbbV17LamWBReCcdX8mRyEN9OyLX+FQAd/jH99MMd
 UVOujwFW11cmasY9pEYlXh6M9mCuqTTCNzmHbROg=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01QH1V69116205
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 26 Feb 2020 11:01:31 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 26
 Feb 2020 11:01:30 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 26 Feb 2020 11:01:31 -0600
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01QH1Ukv121969;
 Wed, 26 Feb 2020 11:01:30 -0600
Subject: Re: [PATCH] virtio_ring: Fix mem leak with vring_new_virtqueue()
To: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20200224212643.30672-1-s-anna@ti.com>
 <b622c831-9adb-b9af-dd4a-21605bc124a8@redhat.com>
 <0ace3a3b-cf2f-7977-5337-f74f530afbe1@ti.com>
 <1ce2bee4-64ed-f630-2695-8e8b9b8e27c1@redhat.com>
Message-ID: <90f85329-9bec-1204-6a0d-892c92219eb1@ti.com>
Date: Wed, 26 Feb 2020 11:01:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1ce2bee4-64ed-f630-2695-8e8b9b8e27c1@redhat.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
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
From: Suman Anna via Virtualization <virtualization@lists.linux-foundation.org>
Reply-To: Suman Anna <s-anna@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gMi8yNS8yMCA5OjEzIFBNLCBKYXNvbiBXYW5nIHdyb3RlOgo+IAo+IE9uIDIwMjAvMi8yNiDk
uIrljYgxMjo1MSwgU3VtYW4gQW5uYSB3cm90ZToKPj4gSGkgSmFzb24sCj4+Cj4+IE9uIDIvMjQv
MjAgMTE6MzkgUE0sIEphc29uIFdhbmcgd3JvdGU6Cj4+PiBPbiAyMDIwLzIvMjUg5LiK5Y2INToy
NiwgU3VtYW4gQW5uYSB3cm90ZToKPj4+PiBUaGUgZnVuY3Rpb25zIHZyaW5nX25ld192aXJ0cXVl
dWUoKSBhbmQgX192cmluZ19uZXdfdmlydHF1ZXVlKCkgYXJlCj4+Pj4gdXNlZAo+Pj4+IHdpdGgg
c3BsaXQgcmluZ3MsIGFuZCBhbnkgYWxsb2NhdGlvbnMgd2l0aGluIHRoZXNlIGZ1bmN0aW9ucyBh
cmUKPj4+PiBtYW5hZ2VkCj4+Pj4gb3V0c2lkZSBvZiB0aGUgLndlX293bl9yaW5nIGZsYWcuIFRo
ZSBjb21taXQgY2JlZWRiNzJiOTdhCj4+Pj4gKCJ2aXJ0aW9fcmluZzoKPj4+PiBhbGxvY2F0ZSBk
ZXNjIHN0YXRlIGZvciBzcGxpdCByaW5nIHNlcGFyYXRlbHkiKSBhbGxvY2F0ZXMgdGhlIGRlc2MK
Pj4+PiBzdGF0ZQo+Pj4+IHdpdGhpbiB0aGUgX192cmluZ19uZXdfdmlydHF1ZXVlKCkgYnV0IGZy
ZWVzIGl0IG9ubHkgd2hlbiB0aGUKPj4+PiAud2Vfb3duX3JpbmcKPj4+PiBmbGFnIGlzIHNldC4g
VGhpcyBsZWFkcyB0byBhIG1lbW9yeSBsZWFrIHdoZW4gZnJlZWluZyBzdWNoIGFsbG9jYXRlZAo+
Pj4+IHZpcnRxdWV1ZXMgd2l0aCB0aGUgdnJpbmdfZGVsX3ZpcnRxdWV1ZSgpIGZ1bmN0aW9uLgo+
Pj4+Cj4+Pj4gRml4IHRoaXMgYnkgbW92aW5nIHRoZSBkZXNjX3N0YXRlIGZyZWUgY29kZSBvdXRz
aWRlIHRoZSBmbGFnIGFuZCBvbmx5Cj4+Pj4gZm9yIHNwbGl0IHJpbmdzLiBJc3N1ZSB3YXMgZGlz
Y292ZXJlZCBkdXJpbmcgdGVzdGluZyB3aXRoIHJlbW90ZXByb2MKPj4+PiBhbmQgdmlydGlvX3Jw
bXNnLgo+Pj4+Cj4+Pj4gRml4ZXM6IGNiZWVkYjcyYjk3YSAoInZpcnRpb19yaW5nOiBhbGxvY2F0
ZSBkZXNjIHN0YXRlIGZvciBzcGxpdCByaW5nCj4+Pj4gc2VwYXJhdGVseSIpCj4+Pj4gU2lnbmVk
LW9mZi1ieTogU3VtYW4gQW5uYTxzLWFubmFAdGkuY29tPgo+Pj4+IC0tLQo+Pj4+IMKgwqAgZHJp
dmVycy92aXJ0aW8vdmlydGlvX3JpbmcuYyB8IDQgKystLQo+Pj4+IMKgwqAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jCj4+Pj4gYi9kcml2ZXJzL3ZpcnRpby92aXJ0
aW9fcmluZy5jCj4+Pj4gaW5kZXggODY3YzdlYmQzZjEwLi41OGI5NmJhYThkNDggMTAwNjQ0Cj4+
Pj4gLS0tIGEvZHJpdmVycy92aXJ0aW8vdmlydGlvX3JpbmcuYwo+Pj4+ICsrKyBiL2RyaXZlcnMv
dmlydGlvL3ZpcnRpb19yaW5nLmMKPj4+PiBAQCAtMjIwMywxMCArMjIwMywxMCBAQCB2b2lkIHZy
aW5nX2RlbF92aXJ0cXVldWUoc3RydWN0IHZpcnRxdWV1ZSAqX3ZxKQo+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdnEtPnNwbGl0LnF1ZXVlX3NpemVf
aW5fYnl0ZXMsCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB2cS0+c3BsaXQudnJpbmcuZGVzYywKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZxLT5zcGxpdC5xdWV1ZV9kbWFfYWRkcik7Cj4+Pj4gLQo+
Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGtmcmVlKHZxLT5zcGxpdC5kZXNjX3N0YXRlKTsK
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4gwqDCoMKgwqDCoMKgIH0KPj4+PiArwqDC
oMKgIGlmICghdnEtPnBhY2tlZF9yaW5nKQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBrZnJlZSh2cS0+
c3BsaXQuZGVzY19zdGF0ZSk7Cj4+PiBOaXRwaWNrLCBpdCBsb29rcyB0byBtZSBpdCB3b3VsZCBi
ZSBtb3JlIGNsZWFyIGlmIHdlIGp1c3QgZnJlZQo+Pj4gZGVzY19zdGF0ZSB1bmNvbmRpdGlvbmFs
bHkgaGVyZSAoYW5kIHJlbW92ZSB0aGUga2ZyZWUgZm9yIHBhY2tlZCBhYm92ZSkuCj4+IE9LLCBh
cmUgeW91IHN1cmUgeW91IHdhbnQgdGhhdCB0byBiZSBmb2xkZWQgaW50byB0aGlzIHBhdGNoPyBJ
dCBsb29rcyB0bwo+PiBtZSBhIHNlcGFyYXRlIGNsZWFudXAvY29uc29saWRhdGlvbiBwYXRjaCwg
YW5kIHBhY2tlZCBkZXNjX3N0YXRlIGRvZXMKPj4gbm90IHN1ZmZlciB0aGlzIG1lbWxlYWssIGFu
ZCBuZWVkIG5vdCBiZSBiYWNrcG9ydGVkIGludG8gc3RhYmxlIGtlcm5lbHMuCj4+Cj4+IHJlZ2Fy
ZHMKPj4gU3VtYW4KPiAKPiAKPiBUaG91Z2ggaXQncyBqdXN0IGEgc21hbGwgdHdlYWssIEknbSBm
aW5lIGZvciBsZWF2aW5nIGl0IGZvciBmdXR1cmUuCj4gCj4gU28KPiAKPiBBY2tlZC1ieTogSmFz
b24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KClRoYW5rcyBKYXNvbiwgd2lsbCBwb3N0IGEg
cGF0Y2ggZm9yIHRoZSBzYW1lIG9uY2UgdGhpcyBpcyBtZXJnZWQuCgpyZWdhcmRzClN1bWFuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0
aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0
dWFsaXphdGlvbg==
