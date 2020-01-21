Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9241437FC
	for <lists.virtualization@lfdr.de>; Tue, 21 Jan 2020 09:01:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 719891FFC1;
	Tue, 21 Jan 2020 08:01:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LclfGXhhPdyS; Tue, 21 Jan 2020 08:01:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A1FA92041B;
	Tue, 21 Jan 2020 08:01:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 86F57C0176;
	Tue, 21 Jan 2020 08:01:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C092CC0176
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 08:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A997A879A7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 08:01:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 061c4MyNLH8p
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 08:01:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 098CE87934
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 08:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579593660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LFJhchaBLZH9C5ENtjBAtVm2hXUIBMF4njoRuoiz0/s=;
 b=ZuU1J5pTWJZmnl+GJZwB4zp05fOvBewgkLJDKfNxnwrX41uhV5VAcpnEcDbfiY+C6TrLBX
 kDX6yus/mUAjbwqVMzj/6NkXGdvhuTsv65j+gCaf6l+bM51prFIHEsmMFZmvx9nRMwEiUf
 htqqxKL/2saeLg99hkUugHdRlSenUbw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-8Kk2CU-6MI2Wx8TUBDCoiA-1; Tue, 21 Jan 2020 03:00:59 -0500
X-MC-Unique: 8Kk2CU-6MI2Wx8TUBDCoiA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D45E718AAFA4;
 Tue, 21 Jan 2020 08:00:56 +0000 (UTC)
Received: from [10.72.12.103] (ovpn-12-103.pek2.redhat.com [10.72.12.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82AF85D9E2;
 Tue, 21 Jan 2020 08:00:39 +0000 (UTC)
Subject: Re: [PATCH 3/5] vDPA: introduce vDPA bus
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200116124231.20253-1-jasowang@redhat.com>
 <20200116124231.20253-4-jasowang@redhat.com>
 <20200117070324-mutt-send-email-mst@kernel.org>
 <239b042c-2d9e-0eec-a1ef-b03b7e2c5419@redhat.com>
 <CAJPjb1+fG9L3=iKbV4Vn13VwaeDZZdcfBPvarogF_Nzhk+FnKg@mail.gmail.com>
 <AM0PR0502MB379553984D0D55FDE25426F6C3330@AM0PR0502MB3795.eurprd05.prod.outlook.com>
 <d69918ca-8af4-44b2-9652-633530d4c113@redhat.com>
 <20200120174933.GB3891@mellanox.com>
 <2a324cec-2863-58f4-c58a-2414ee32c930@redhat.com>
 <20200121004047-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b9ad744e-c4cd-82f9-f56a-1ecc185e9cd7@redhat.com>
Date: Tue, 21 Jan 2020 16:00:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200121004047-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Rob Miller <rob.miller@broadcom.com>, "lulu@redhat.com" <lulu@redhat.com>,
 "hanand@xilinx.com" <hanand@xilinx.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Shahaf Shuler <shahafs@mellanox.com>,
 Parav Pandit <parav@mellanox.com>, Jiri Pirko <jiri@mellanox.com>, "Wang,
 Xiao W" <xiao.w.wang@intel.com>, "stefanha@redhat.com" <stefanha@redhat.com>,
 "Wang, Zhihong" <zhihong.wang@intel.com>, Netdev <netdev@vger.kernel.org>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>, "Zhu,
 Lingshan" <lingshan.zhu@intel.com>
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

Ck9uIDIwMjAvMS8yMSDkuIvljYgxOjQ3LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
VHVlLCBKYW4gMjEsIDIwMjAgYXQgMTI6MDA6NTdQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAyMC8xLzIxIOS4iuWNiDE6NDksIEphc29uIEd1bnRob3JwZSB3cm90ZToKPj4+IE9u
IE1vbiwgSmFuIDIwLCAyMDIwIGF0IDA0OjQzOjUzUE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6
Cj4+Pj4gVGhpcyBpcyBzaW1pbGFyIHRvIHRoZSBkZXNpZ24gb2YgcGxhdGZvcm0gSU9NTVUgcGFy
dCBvZiB2aG9zdC12ZHBhLiBXZQo+Pj4+IGRlY2lkZSB0byBzZW5kIGRpZmZzIHRvIHBsYXRmb3Jt
IElPTU1VIHRoZXJlLiBJZiBpdCdzIG9rIHRvIGRvIHRoYXQgaW4KPj4+PiBkcml2ZXIsIHdlIGNh
biByZXBsYWNlIHNldF9tYXAgd2l0aCBpbmNyZW1lbnRhbCBBUEkgbGlrZSBtYXAoKS91bm1hcCgp
Lgo+Pj4+Cj4+Pj4gVGhlbiBkcml2ZXIgbmVlZCB0byBtYWludGFpbiByYnRyZWUgaXRzZWxmLgo+
Pj4gSSB0aGluayB3ZSByZWFsbHkgbmVlZCB0byBzZWUgdHdvIG1vZGVzLCBvbmUgd2hlcmUgdGhl
cmUgaXMgYSBmaXhlZAo+Pj4gdHJhbnNsYXRpb24gd2l0aG91dCBkeW5hbWljIHZJT01NVSBkcml2
ZW4gY2hhbmdlcyBhbmQgb25lIHRoYXQKPj4+IHN1cHBvcnRzIHZJT01NVS4KPj4KPj4gSSB0aGlu
ayBpbiB0aGlzIGNhc2UsIHlvdSBtZWFudCB0aGUgbWV0aG9kIHByb3Bvc2VkIGJ5IFNoYWhhZiB0
aGF0IHNlbmRzCj4+IGRpZmZzIG9mICJmaXhlZCB0cmFuc2xhdGlvbiIgdG8gZGV2aWNlPwo+Pgo+
PiBJdCB3b3VsZCBiZSBraW5kIG9mIHRyaWNreSB0byBkZWFsIHdpdGggdGhlIGZvbGxvd2luZyBj
YXNlIGZvciBleGFtcGxlOgo+Pgo+PiBvbGQgbWFwIFs0RywgMTZHKSBuZXcgbWFwIFs0RywgOEcp
Cj4+Cj4+IElmIHdlIGRvCj4+Cj4+IDEpIGZsdXNoIFs0RywgMTZHKQo+PiAyKSBhZGQgWzRHLCA4
RykKPj4KPj4gVGhlcmUgY291bGQgYmUgYSB3aW5kb3cgYmV0d2VlbiAxKSBhbmQgMikuCj4+Cj4+
IEl0IHJlcXVpcmVzIHRoZSBJT01NVSB0aGF0IGNhbiBkbwo+Pgo+PiAxKSByZW1vdmUgWzhHLCAx
NkcpCj4+IDIpIGZsdXNoIFs4RywgMTZHKQo+PiAzKSBjaGFuZ2UgWzRHLCA4RykKPj4KPj4gLi4u
Lgo+IEJhc2ljYWxseSB3aGF0IEkgaGFkIGluIG1pbmQgaXMgc29tZXRoaW5nIGxpa2UgcWVtdSBt
ZW1vcnkgYXBpCj4KPiAwLiBiZWdpbgo+IDEuIHJlbW92ZSBbOEcsIDE2RykKPiAyLiBhZGQgWzRH
LCA4RykKPiAzLiBjb21taXQKCgpUaGlzIHNvdW5kcyBtb3JlIGZsZXhpYmxlIGUuZyBkcml2ZXIg
bWF5IGNob29zZSB0byBpbXBsZW1lbnQgc3RhdGljIAptYXBwaW5nIG9uZSB0aHJvdWdoIGNvbW1p
dC4gQnV0IGEgcXVlc3Rpb24gaGVyZSwgaXQgbG9va3MgdG8gbWUgdGhpcyAKc3RpbGwgcmVxdWly
ZXMgdGhlIERNQSB0byBiZSBzeW5jZWQgd2l0aCBhdCBsZWFzdCBjb21taXQgaGVyZS4gT3RoZXJ3
aXNlIApkZXZpY2UgbWF5IGdldCBETUEgZmF1bHQ/IE9yIGRldmljZSBpcyBleHBlY3RlZCB0byBi
ZSBwYXVzZWQgRE1BIGR1cmluZyAKYmVnaW4/CgpUaGFua3MKCgo+Cj4gQW55d2F5LCBJJ20gZmlu
ZSB3aXRoIGEgb25lLXNob3QgQVBJIGZvciBub3csIHdlIGNhbgo+IGltcHJvdmUgaXQgbGF0ZXIu
Cj4KPj4+IFRoZXJlIGFyZSBkaWZmZXJlbnQgb3B0aW1pemF0aW9uIGdvYWxzIGluIHRoZSBkcml2
ZXJzIGZvciB0aGVzZSB0d28KPj4+IGNvbmZpZ3VyYXRpb25zLgo+Pj4KPj4+Pj4gSWYgdGhlIGZp
cnN0IG9uZSwgdGhlbiBJIHRoaW5rIG1lbW9yeSBob3RwbHVnIGlzIGEgaGVhdnkgZmxvdwo+Pj4+
PiByZWdhcmRsZXNzLiBEbyB5b3UgdGhpbmsgdGhlIGV4dHJhIGN5Y2xlcyBmb3IgdGhlIHRyZWUg
dHJhdmVyc2UKPj4+Pj4gd2lsbCBiZSB2aXNpYmxlIGluIGFueSB3YXk/Cj4+Pj4gSSB0aGluayBp
ZiB0aGUgZHJpdmVyIGNhbiBwYXVzZSB0aGUgRE1BIGR1cmluZyB0aGUgdGltZSBmb3Igc2V0dGlu
ZyB1cCBuZXcKPj4+PiBtYXBwaW5nLCBpdCBzaG91bGQgYmUgZmluZS4KPj4+IFRoaXMgaXMgdmVy
eSB0cmlja3kgZm9yIGFueSBkcml2ZXIgaWYgdGhlIG1hcHBpbmcgY2hhbmdlIGhpdHMgdGhlCj4+
PiB2aXJ0aW8gcmluZ3MuIDooCj4+Pgo+Pj4gRXZlbiBhIElPTU1VIHVzaW5nIGRyaXZlciBpcyBn
b2luZyB0byBoYXZlIHByb2JsZW1zIHdpdGggdGhhdC4uCj4+Pgo+Pj4gSmFzb24KPj4KPj4gT3Ig
SSB3b25kZXIgd2hldGhlciBBVFMvUFJJIGNhbiBoZWxwIGhlcmUuIEUuZyBkdXJpbmcgSS9PIHBh
Z2UgZmF1bHQsCj4+IGRyaXZlci9kZXZpY2UgY2FuIHdhaXQgZm9yIHRoZSBuZXcgbWFwcGluZyB0
byBiZSBzZXQgYW5kIHRoZW4gcmVwbGF5IHRoZQo+PiBETUEuCj4+Cj4+IFRoYW5rcwo+Pgo+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXph
dGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5v
cmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmly
dHVhbGl6YXRpb24=
