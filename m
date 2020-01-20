Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1FB142600
	for <lists.virtualization@lfdr.de>; Mon, 20 Jan 2020 09:44:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 90E71203A4;
	Mon, 20 Jan 2020 08:44:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gpxwOuqwZDKC; Mon, 20 Jan 2020 08:44:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 660BC203F3;
	Mon, 20 Jan 2020 08:44:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3B445C0174;
	Mon, 20 Jan 2020 08:44:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23C18C0174
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 08:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1A34686F1B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 08:44:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id thLWt-uwN2m1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 08:44:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CE07E86DAC
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 08:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579509855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NaXsioYjljuVY6jZb4aFMxl3jkckcuLg1JicxfVLDqk=;
 b=bY+YZNNZR7kqxotMZLFNxFshZfuQwpll3OmWdIUXznhwqCEEl5LUyl9KIb7LvjaGWsIhls
 gQ6Rqe9YXfoznJOFdMIoBP28rb45SiqPHGh2jmdg0gxSK5PphP0uoK9USa0A7GsxWz5UHE
 BnZ1DQ43AxTWJqoT0J00M7uOqr2mG/M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-bGkbTfTSOqe8wSHGCrl1cw-1; Mon, 20 Jan 2020 03:44:14 -0500
X-MC-Unique: bGkbTfTSOqe8wSHGCrl1cw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3508800D50;
 Mon, 20 Jan 2020 08:44:11 +0000 (UTC)
Received: from [10.72.12.173] (ovpn-12-173.pek2.redhat.com [10.72.12.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7B53272A1;
 Mon, 20 Jan 2020 08:43:55 +0000 (UTC)
Subject: Re: [PATCH 3/5] vDPA: introduce vDPA bus
To: Shahaf Shuler <shahafs@mellanox.com>, Rob Miller <rob.miller@broadcom.com>
References: <20200116124231.20253-1-jasowang@redhat.com>
 <20200116124231.20253-4-jasowang@redhat.com>
 <20200117070324-mutt-send-email-mst@kernel.org>
 <239b042c-2d9e-0eec-a1ef-b03b7e2c5419@redhat.com>
 <CAJPjb1+fG9L3=iKbV4Vn13VwaeDZZdcfBPvarogF_Nzhk+FnKg@mail.gmail.com>
 <AM0PR0502MB379553984D0D55FDE25426F6C3330@AM0PR0502MB3795.eurprd05.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d69918ca-8af4-44b2-9652-633530d4c113@redhat.com>
Date: Mon, 20 Jan 2020 16:43:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <AM0PR0502MB379553984D0D55FDE25426F6C3330@AM0PR0502MB3795.eurprd05.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "lulu@redhat.com" <lulu@redhat.com>, "hanand@xilinx.com" <hanand@xilinx.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Parav Pandit <parav@mellanox.com>,
 Jiri Pirko <jiri@mellanox.com>, "Wang, Xiao W" <xiao.w.wang@intel.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>, "Wang,
 Zhihong" <zhihong.wang@intel.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 Netdev <netdev@vger.kernel.org>, "Zhu, Lingshan" <lingshan.zhu@intel.com>
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

Ck9uIDIwMjAvMS8xOSDkuIvljYg1OjA3LCBTaGFoYWYgU2h1bGVyIHdyb3RlOgo+IEZyaWRheSwg
SmFudWFyeSAxNywgMjAyMCA0OjEzIFBNLCBSb2IgTWlsbGVyOgo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggMy81XSB2RFBBOiBpbnRyb2R1Y2UgdkRQQSBidXMKPj4+IE9uIDIwMjAvMS8xNyDkuIvljYg4
OjEzLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+Pj4gT24gVGh1LCBKYW4gMTYsIDIwMjAg
YXQgMDg6NDI6MjlQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPiBbLi4uXQo+Cj4+Pj4gKyAq
IEBzZXRfbWFwOsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFNldCBkZXZpY2Ug
bWVtb3J5IG1hcHBpbmcsIG9wdGlvbmFsCj4+Pj4gKyAqwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgYW5kIG9ubHkgbmVlZGVkIGZvciBkZXZpY2UgdGhhdCB1c2luZwo+Pj4+
ICsgKsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGRldmljZSBzcGVjaWZp
YyBETUEgdHJhbnNsYXRpb24KPj4+PiArICrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCAob24tY2hpcCBJT01NVSkKPj4+PiArICrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBAdmRldjogdmRwYSBkZXZpY2UKPj4+PiArICrCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBAaW90bGI6IHZob3N0IG1lbW9yeSBtYXBwaW5nIHRvIGJl
Cj4+Pj4gKyAqwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdXNlZCBieSB0
aGUgdkRQQQo+Pj4+ICsgKsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFJl
dHVybnMgaW50ZWdlcjogc3VjY2VzcyAoMCkgb3IgZXJyb3IgKDwgMCkKPj4+IE9LIHNvIGFueSBj
aGFuZ2UganVzdCBzd2FwcyBpbiBhIGNvbXBsZXRlbHkgbmV3IG1hcHBpbmc/Cj4+PiBXb3VsZG4n
dCB0aGlzIG1ha2UgbWlub3IgY2hhbmdlcyBzdWNoIGFzIG1lbW9yeSBob3RwbHVnCj4+PiBxdWl0
ZSBleHBlbnNpdmU/Cj4gV2hhdCBpcyB0aGUgY29uY2Vybj8gVHJhdmVyc2luZyB0aGUgcmIgdHJl
ZSBvciBmdWxseSByZXBsYWNlIHRoZSBvbi1jaGlwIElPTU1VIHRyYW5zbGF0aW9ucz8KPiBJZiB0
aGUgbGF0ZXN0LCB0aGVuIEkgdGhpbmsgd2UgY2FuIHRha2Ugc3VjaCBvcHRpbWl6YXRpb24gb24g
dGhlIGRyaXZlciBsZXZlbCAoaS5lLiB0byB1cGRhdGUgb25seSB0aGUgZGlmZiBiZXR3ZWVuIHRo
ZSB0d28gbWFwcGluZykuCgoKVGhpcyBpcyBzaW1pbGFyIHRvIHRoZSBkZXNpZ24gb2YgcGxhdGZv
cm0gSU9NTVUgcGFydCBvZiB2aG9zdC12ZHBhLiBXZSAKZGVjaWRlIHRvIHNlbmQgZGlmZnMgdG8g
cGxhdGZvcm0gSU9NTVUgdGhlcmUuIElmIGl0J3Mgb2sgdG8gZG8gdGhhdCBpbiAKZHJpdmVyLCB3
ZSBjYW4gcmVwbGFjZSBzZXRfbWFwIHdpdGggaW5jcmVtZW50YWwgQVBJIGxpa2UgbWFwKCkvdW5t
YXAoKS4KClRoZW4gZHJpdmVyIG5lZWQgdG8gbWFpbnRhaW4gcmJ0cmVlIGl0c2VsZi4KCgo+IElm
IHRoZSBmaXJzdCBvbmUsIHRoZW4gSSB0aGluayBtZW1vcnkgaG90cGx1ZyBpcyBhIGhlYXZ5IGZs
b3cgcmVnYXJkbGVzcy4gRG8geW91IHRoaW5rIHRoZSBleHRyYSBjeWNsZXMgZm9yIHRoZSB0cmVl
IHRyYXZlcnNlIHdpbGwgYmUgdmlzaWJsZSBpbiBhbnkgd2F5PwoKCkkgdGhpbmsgaWYgdGhlIGRy
aXZlciBjYW4gcGF1c2UgdGhlIERNQSBkdXJpbmcgdGhlIHRpbWUgZm9yIHNldHRpbmcgdXAgCm5l
dyBtYXBwaW5nLCBpdCBzaG91bGQgYmUgZmluZS4KCgo+ICAgCj4KPj4gTXkgdW5kZXJzdGFuZGlu
ZyBpcyB0aGF0IHRoZSBpbmNyZW1lbnRhbCB1cGRhdGluZyBvZiB0aGUgb24gY2hpcCBJT01NVQo+
PiBtYXkgZGVncmFkZSB0aGXCoCBwZXJmb3JtYW5jZS4gU28gdmVuZG9yIHZEUEEgZHJpdmVycyBt
YXkgd2FudCB0byBrbm93Cj4+IGFsbCB0aGUgbWFwcGluZ3MgYXQgb25jZS4KPiBZZXMgZXhhY3Qu
IEZvciBNZWxsYW5veCBjYXNlIGZvciBpbnN0YW5jZSBtYW55IG9wdGltaXphdGlvbiBjYW4gYmUg
cGVyZm9ybWVkIG9uIGEgZ2l2ZW4gbWVtb3J5IGxheW91dC4KPgo+PiBUZWNobmljYWxseSwgd2Ug
Y2FuIGtlZXAgdGhlIGluY3JlbWVudGFsIEFQSQo+PiBoZXJlIGFuZCBsZXQgdGhlIHZlbmRvciB2
RFBBIGRyaXZlcnMgdG8gcmVjb3JkIHRoZSBmdWxsIG1hcHBpbmcKPj4gaW50ZXJuYWxseSB3aGlj
aCBtYXkgc2xpZ2h0bHkgaW5jcmVhc2UgdGhlIGNvbXBsZXhpdHkgb2YgdmVuZG9yIGRyaXZlci4K
PiBXaGF0IHdpbGwgYmUgdGhlIHRyaWdnZXIgZm9yIHRoZSBkcml2ZXIgdG8ga25vdyBpdCByZWNl
aXZlZCB0aGUgbGFzdCBtYXBwaW5nIG9uIHRoaXMgc2VyaWVzIGFuZCBpdCBjYW4gbm93IHB1c2gg
aXQgdG8gdGhlIG9uLWNoaXAgSU9NTVU/CgoKRm9yIEdQQS0+SFZBKEhQQSkgbWFwcGluZywgd2Ug
Y2FuIGhhdmUgZmxhZyBmb3IgdGhpcy4KCkJ1dCBmb3IgR0lPVkFfPkhWQShIUEEpIG1hcHBpbmcg
d2hpY2ggY291bGQgYmUgY2hhbmdlZCBieSBndWVzdCwgaXQgCmxvb2tzIHRvIG1lIHRoZXJlJ3Mg
bm8gY29uY2VwdCBvZiAibGFzdCBtYXBwaW5nIiB0aGVyZS4gSSBndWVzcyBpbiB0aGlzIApjYXNl
LCBtYXBwaW5ncyBuZWVkcyB0byBiZSBzZXQgZnJvbSB0aGUgZ3JvdW5kLiBUaGlzIGNvdWxkIGJl
IGV4cGVuc2l2ZSAKYnV0IGNvbnNpZGVyIG1vc3QgYXBwbGljYXRpb24gdXNlcyBzdGF0aWMgbWFw
cGluZ3MgKGUuZyBkcGRrIGluIGd1ZXN0KS4gCkl0IHNob3VsZCBiZSBvay4KClRoYW5rcwoKCj4K
Pj4gV2UgbmVlZCBtb3JlIGlucHV0cyBmcm9tIHZlbmRvcnMgaGVyZS4KPj4KPj4gVGhhbmtzCj4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxp
emF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9u
Lm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92
aXJ0dWFsaXphdGlvbg==
