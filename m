Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCC316EBC1
	for <lists.virtualization@lfdr.de>; Tue, 25 Feb 2020 17:52:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2C7AB8560F;
	Tue, 25 Feb 2020 16:52:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S3tHpzKBQy5u; Tue, 25 Feb 2020 16:52:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 86ADE8552C;
	Tue, 25 Feb 2020 16:52:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 63758C0177;
	Tue, 25 Feb 2020 16:52:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CC75AC0177
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 16:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B3F258539F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 16:51:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KR72pXxWlmTt
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 16:51:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0492C85374
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 16:51:57 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01PGprxU059312;
 Tue, 25 Feb 2020 10:51:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582649513;
 bh=0h+nCmhnPTm+AmSxpQrAQWVhspSA8igiHXC6K5jdZ+0=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=bl1xy3cQ+PDdt/XPMLXVfsyZTCfJxByP4KaL4YmYWsDj6i+sVPvRsxGjrGyIGo6jj
 ehQszO9pMmr7EchOe455Im5yIoWVdtb7BUGa52oJJKKtOp4k/z1UkcR4f81FlCSTGJ
 oE4lb1K0sQn1llZ2mz0dYWgyf7tWvsLg0MYtbJ4g=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01PGpr20102297;
 Tue, 25 Feb 2020 10:51:53 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 25
 Feb 2020 10:51:53 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 25 Feb 2020 10:51:53 -0600
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01PGpq6Q073429;
 Tue, 25 Feb 2020 10:51:53 -0600
Subject: Re: [PATCH] virtio_ring: Fix mem leak with vring_new_virtqueue()
To: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20200224212643.30672-1-s-anna@ti.com>
 <b622c831-9adb-b9af-dd4a-21605bc124a8@redhat.com>
Message-ID: <0ace3a3b-cf2f-7977-5337-f74f530afbe1@ti.com>
Date: Tue, 25 Feb 2020 10:51:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b622c831-9adb-b9af-dd4a-21605bc124a8@redhat.com>
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

SGkgSmFzb24sCgpPbiAyLzI0LzIwIDExOjM5IFBNLCBKYXNvbiBXYW5nIHdyb3RlOgo+IAo+IE9u
IDIwMjAvMi8yNSDkuIrljYg1OjI2LCBTdW1hbiBBbm5hIHdyb3RlOgo+PiBUaGUgZnVuY3Rpb25z
IHZyaW5nX25ld192aXJ0cXVldWUoKSBhbmQgX192cmluZ19uZXdfdmlydHF1ZXVlKCkgYXJlIHVz
ZWQKPj4gd2l0aCBzcGxpdCByaW5ncywgYW5kIGFueSBhbGxvY2F0aW9ucyB3aXRoaW4gdGhlc2Ug
ZnVuY3Rpb25zIGFyZSBtYW5hZ2VkCj4+IG91dHNpZGUgb2YgdGhlIC53ZV9vd25fcmluZyBmbGFn
LiBUaGUgY29tbWl0IGNiZWVkYjcyYjk3YSAoInZpcnRpb19yaW5nOgo+PiBhbGxvY2F0ZSBkZXNj
IHN0YXRlIGZvciBzcGxpdCByaW5nIHNlcGFyYXRlbHkiKSBhbGxvY2F0ZXMgdGhlIGRlc2Mgc3Rh
dGUKPj4gd2l0aGluIHRoZSBfX3ZyaW5nX25ld192aXJ0cXVldWUoKSBidXQgZnJlZXMgaXQgb25s
eSB3aGVuIHRoZQo+PiAud2Vfb3duX3JpbmcKPj4gZmxhZyBpcyBzZXQuIFRoaXMgbGVhZHMgdG8g
YSBtZW1vcnkgbGVhayB3aGVuIGZyZWVpbmcgc3VjaCBhbGxvY2F0ZWQKPj4gdmlydHF1ZXVlcyB3
aXRoIHRoZSB2cmluZ19kZWxfdmlydHF1ZXVlKCkgZnVuY3Rpb24uCj4+Cj4+IEZpeCB0aGlzIGJ5
IG1vdmluZyB0aGUgZGVzY19zdGF0ZSBmcmVlIGNvZGUgb3V0c2lkZSB0aGUgZmxhZyBhbmQgb25s
eQo+PiBmb3Igc3BsaXQgcmluZ3MuIElzc3VlIHdhcyBkaXNjb3ZlcmVkIGR1cmluZyB0ZXN0aW5n
IHdpdGggcmVtb3RlcHJvYwo+PiBhbmQgdmlydGlvX3JwbXNnLgo+Pgo+PiBGaXhlczogY2JlZWRi
NzJiOTdhICgidmlydGlvX3Jpbmc6IGFsbG9jYXRlIGRlc2Mgc3RhdGUgZm9yIHNwbGl0IHJpbmcK
Pj4gc2VwYXJhdGVseSIpCj4+IFNpZ25lZC1vZmYtYnk6IFN1bWFuIEFubmEgPHMtYW5uYUB0aS5j
b20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jIHwgNCArKy0tCj4+
IMKgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jIGIvZHJpdmVycy92aXJ0
aW8vdmlydGlvX3JpbmcuYwo+PiBpbmRleCA4NjdjN2ViZDNmMTAuLjU4Yjk2YmFhOGQ0OCAxMDA2
NDQKPj4gLS0tIGEvZHJpdmVycy92aXJ0aW8vdmlydGlvX3JpbmcuYwo+PiArKysgYi9kcml2ZXJz
L3ZpcnRpby92aXJ0aW9fcmluZy5jCj4+IEBAIC0yMjAzLDEwICsyMjAzLDEwIEBAIHZvaWQgdnJp
bmdfZGVsX3ZpcnRxdWV1ZShzdHJ1Y3QgdmlydHF1ZXVlICpfdnEpCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZxLT5zcGxpdC5xdWV1ZV9zaXplX2luX2J5
dGVzLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2cS0+
c3BsaXQudnJpbmcuZGVzYywKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgdnEtPnNwbGl0LnF1ZXVlX2RtYV9hZGRyKTsKPj4gLQo+PiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBrZnJlZSh2cS0+c3BsaXQuZGVzY19zdGF0ZSk7Cj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCB9Cj4+IMKgwqDCoMKgwqAgfQo+PiArwqDCoMKgIGlmICghdnEtPnBhY2tlZF9yaW5nKQo+
PiArwqDCoMKgwqDCoMKgwqAga2ZyZWUodnEtPnNwbGl0LmRlc2Nfc3RhdGUpOwo+IAo+IAo+IE5p
dHBpY2ssIGl0IGxvb2tzIHRvIG1lIGl0IHdvdWxkIGJlIG1vcmUgY2xlYXIgaWYgd2UganVzdCBm
cmVlCj4gZGVzY19zdGF0ZSB1bmNvbmRpdGlvbmFsbHkgaGVyZSAoYW5kIHJlbW92ZSB0aGUga2Zy
ZWUgZm9yIHBhY2tlZCBhYm92ZSkuCgpPSywgYXJlIHlvdSBzdXJlIHlvdSB3YW50IHRoYXQgdG8g
YmUgZm9sZGVkIGludG8gdGhpcyBwYXRjaD8gSXQgbG9va3MgdG8KbWUgYSBzZXBhcmF0ZSBjbGVh
bnVwL2NvbnNvbGlkYXRpb24gcGF0Y2gsIGFuZCBwYWNrZWQgZGVzY19zdGF0ZSBkb2VzCm5vdCBz
dWZmZXIgdGhpcyBtZW1sZWFrLCBhbmQgbmVlZCBub3QgYmUgYmFja3BvcnRlZCBpbnRvIHN0YWJs
ZSBrZXJuZWxzLgoKcmVnYXJkcwpTdW1hbgoKPiBBbnl3YXkgZGVzY19zdGF0ZSB3aWxsIGJlIGFs
bG9jYXRlZCBieSB1c2UgZXZlbiBpZiAhd2Vfb3duX3JpbmcuCj4gCj4gVGhhbmtzCj4gCj4gCj4+
IMKgwqDCoMKgwqAgbGlzdF9kZWwoJl92cS0+bGlzdCk7Cj4+IMKgwqDCoMKgwqAga2ZyZWUodnEp
Owo+PiDCoCB9Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGlu
dXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxt
YW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
