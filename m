Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7B71439A9
	for <lists.virtualization@lfdr.de>; Tue, 21 Jan 2020 10:39:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 241D985693;
	Tue, 21 Jan 2020 09:39:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7l69LDDNBJXh; Tue, 21 Jan 2020 09:39:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A0E978506C;
	Tue, 21 Jan 2020 09:39:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D9AEC0174;
	Tue, 21 Jan 2020 09:39:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A7B22C0174
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 09:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9058D85693
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 09:39:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sy4L6sIbhfwV
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 09:39:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 94AE38506C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 09:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579599579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kgGWPH2qJri2TmOIIhSVNudNErzIIx6+vIt4WpsZSc0=;
 b=ED4FbTQWIZubDh/R7oZQk/dP5a1CLmdltW5vznES9p4rDlIbC8cMPiUcj8t3+cWXTEETTD
 maFivL+L+yUa86QWBkeL8mAwHO/6aH8WqR3cYiGak+MhX2cy1yXoos2+RuLCvDS9vWHFTG
 GuxL2mG1kHQYCcQeuhJ0lOI/qdUqb4c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-vlmfGg1DMDiWOGcO6XPaqw-1; Tue, 21 Jan 2020 04:39:37 -0500
X-MC-Unique: vlmfGg1DMDiWOGcO6XPaqw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0E7C8010DC;
 Tue, 21 Jan 2020 09:39:33 +0000 (UTC)
Received: from [10.72.12.103] (ovpn-12-103.pek2.redhat.com [10.72.12.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8CE6419C6A;
 Tue, 21 Jan 2020 09:39:17 +0000 (UTC)
Subject: Re: [PATCH 0/5] vDPA support
To: "Tian, Kevin" <kevin.tian@intel.com>, "mst@redhat.com" <mst@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <20200116124231.20253-1-jasowang@redhat.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D73EC6B@SHSMSX104.ccr.corp.intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <0185b91a-f984-681e-b7c0-af8eca81d053@redhat.com>
Date: Tue, 21 Jan 2020 17:39:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D73EC6B@SHSMSX104.ccr.corp.intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: "shahafs@mellanox.com" <shahafs@mellanox.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
 "lulu@redhat.com" <lulu@redhat.com>, "Wang, Xiao W" <xiao.w.wang@intel.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "jgg@mellanox.com" <jgg@mellanox.com>, "hanand@xilinx.com" <hanand@xilinx.com>,
 "parav@mellanox.com" <parav@mellanox.com>, "Wang,
 Zhihong" <zhihong.wang@intel.com>, "Zhu, Lingshan" <lingshan.zhu@intel.com>,
 "jiri@mellanox.com" <jiri@mellanox.com>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>
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

Ck9uIDIwMjAvMS8yMSDkuIvljYg0OjQ0LCBUaWFuLCBLZXZpbiB3cm90ZToKPj4gRnJvbTogSmFz
b24gV2FuZwo+PiBTZW50OiBUaHVyc2RheSwgSmFudWFyeSAxNiwgMjAyMCA4OjQyIFBNCj4+Cj4+
IEhpIGFsbDoKPj4KPj4gQmFzZWQgb24gdGhlIGNvbW1lbnRzIGFuZCBkaXNjdXNzaW9uIGZvciBt
ZGV2IGJhc2VkIGhhcmR3YXJlIHZpcnRpbwo+PiBvZmZsb2FkaW5nIHN1cHBvcnRbMV0uIEEgZGlm
ZmVyZW50IGFwcHJvYWNoIHRvIHN1cHBvcnQgdkRQQSBkZXZpY2UgaXMKPj4gcHJvcG9zZWQgaW4g
dGhpcyBzZXJpZXMuCj4gQ2FuIHlvdSBwb2ludCB0byB0aGUgYWN0dWFsIGxpbmsgd2hpY2ggdHJp
Z2dlcmVkIHRoZSBkaXJlY3Rpb24gY2hhbmdlPwo+IEEgcXVpY2sgZ2xpbXBzZSBpbiB0aGF0IHRo
cmVhZCBkb2Vzbid0IHJldmVhbCBzdWNoIGluZm9ybWF0aW9uLi4uCgoKUmlnaHQsIHBsZWFzZSBz
ZWUgdGhpcyBsaW5rLCB0aGUgYWN0dWFsIGRpc2N1c3Npb24gaGFwcGVucyBvbiB0aGUgdGhyZWFk
IApvZiB2aXJ0dWFsLWJ1cyBmb3Igc29tZSByZWFzb25zLi4uCgpodHRwczovL3BhdGNod29yay5v
emxhYnMub3JnL3BhdGNoLzExOTU4OTUvCgpUaGFua3MKCgo+Cj4+IEluc3RlYWQgb2YgbGV2ZXJh
Z2luZyBWRklPL21kZXYgd2hpY2ggbWF5IG5vdCB3b3JrIGZvciBzb21lCj4+IHZlbmRvcnMuIFRo
aXMgc2VyaWVzIHRyaWVzIHRvIGludHJvZHVjZSBhIGRlZGljYXRlZCB2RFBBIGJ1cyBhbmQKPj4g
bGV2ZXJhZ2Ugdmhvc3QgZm9yIHVzZXJzcGFjZSBkcml2ZXJzLiBUaGlzIGhlbHAgZm9yIHRoZSBk
ZXZpY2VzIHRoYXQKPj4gYXJlIG5vdCBmaXQgZm9yIFZGSU8gYW5kIG1heSByZWR1Y2UgdGhlIGNv
bmZsaWN0IHdoZW4gdHJ5IHRvIHByb3Bvc2UgYQo+PiBidXMgdGVtcGxhdGUgZm9yIHZpcnR1YWwg
ZGV2aWNlcyBpbiBbMV0uCj4+Cj4+IFRoZSB2RFBBIHN1cHBvcnQgaXMgc3BsaXQgaW50byBmb2xs
b3dpbmcgcGFydHM6Cj4+Cj4+IDEpIHZEUEEgY29yZSAoYnVzLCBkZXZpY2UgYW5kIGRyaXZlciBh
YnN0cmFjdGlvbikKPj4gMikgdmlydGlvIHZEUEEgdHJhbnNwb3J0IGZvciBrZXJuZWwgdmlydGlv
IGRyaXZlciB0byBjb250cm9sIHZEUEEKPj4gICAgIGRldmljZQo+PiAzKSB2aG9zdCB2RFBBIGJ1
cyBkcml2ZXIgZm9yIHVzZXJzcGFjZSB2aG9zdCBkcml2ZXIgdG8gY29udHJvbCB2RFBBCj4+ICAg
ICBkZXZpY2UKPj4gNCkgdmVuZG9yIHZEUEEgZHJpdmVycwo+PiA1KSBtYW5hZ2VtZW50IEFQSQo+
Pgo+PiBCb3RoIDEpIGFuZCAyKSBhcmUgaW5jbHVkZWQgaW4gdGhpcyBzZXJpZXMuIFRpd2VpIHdp
bGwgd29yayBvbiBwYXJ0Cj4+IDMpLiBGb3IgNCksIExpbmcgU2hhbiB3aWxsIHdvcmsgYW5kIHBv
c3QgSUZDVkYgZHJpdmVyLiBGb3IgNSkgd2UgbGVhdmUKPj4gaXQgdG8gdmVuZG9yIHRvIGltcGxl
bWVudCwgYnV0IGl0J3MgYmV0dGVyIHRvIGNvbWUgaW50byBhbiBhZ3JlZW1lbnQKPj4gZm9yIG1h
bmFnZW1lbnQgdG8gY3JlYXRlL2NvbmZpZ3VyZS9kZXN0cm95IHZEUEEgZGV2aWNlLgo+Pgo+PiBU
aGUgc2FtcGxlIGRyaXZlciBpcyBrZXB0IGJ1dCByZW5hbWVkIHRvIHZkYXBfc2ltLiBBbiBvbi1j
aGlwIElPTU1VCj4+IGltcGxlbWVudGF0aW9uIGlzIGFkZGVkIHRvIHNhbXBsZSBkZXZpY2UgdG8g
bWFrZSBpdCB3b3JrIGZvciBib3RoCj4+IGtlcm5lbCB2aXJ0aW8gZHJpdmVyIGFuZCB1c2Vyc3Bh
Y2Ugdmhvc3QgZHJpdmVyLiBJdCBpbXBsZW1lbnRzIGEgc3lzZnMKPj4gYmFzZWQgbWFuYWdlbWVu
dCBBUEksIGJ1dCBpdCBjYW4gc3dpdGNoIHRvIGFueSBvdGhlciAoZS5nIGRldmxpbmspIGlmCj4+
IG5lY2Vzc2FyeS4KPj4KPj4gUGxlYXNlIHJlZmVyIGVhY2ggcGF0Y2ggZm9yIG1vcmUgaW5mb3Jt
YXRpb24uCj4+Cj4+IENvbW1lbnRzIGFyZSB3ZWxjb21lZC4KPj4KPj4gWzFdIGh0dHBzOi8vbGtt
bC5vcmcvbGttbC8yMDE5LzExLzE4LzI2MQo+Pgo+PiBKYXNvbiBXYW5nICg1KToKPj4gICAgdmhv
c3Q6IGZhY3RvciBvdXQgSU9UTEIKPj4gICAgdnJpbmdoOiBJT1RMQiBzdXBwb3J0Cj4+ICAgIHZE
UEE6IGludHJvZHVjZSB2RFBBIGJ1cwo+PiAgICB2aXJ0aW86IGludHJvZHVjZSBhIHZEUEEgYmFz
ZWQgdHJhbnNwb3J0Cj4+ICAgIHZkcGFzaW06IHZEUEEgZGV2aWNlIHNpbXVsYXRvcgo+Pgo+PiAg
IE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICB8ICAgMiArCj4+ICAgZHJpdmVycy92aG9z
dC9LY29uZmlnICAgICAgICAgIHwgICA3ICsKPj4gICBkcml2ZXJzL3Zob3N0L0tjb25maWcudnJp
bmdoICAgfCAgIDEgKwo+PiAgIGRyaXZlcnMvdmhvc3QvTWFrZWZpbGUgICAgICAgICB8ICAgMiAr
Cj4+ICAgZHJpdmVycy92aG9zdC9uZXQuYyAgICAgICAgICAgIHwgICAyICstCj4+ICAgZHJpdmVy
cy92aG9zdC92aG9zdC5jICAgICAgICAgIHwgMjIxICsrKy0tLS0tLQo+PiAgIGRyaXZlcnMvdmhv
c3Qvdmhvc3QuaCAgICAgICAgICB8ICAzNiArLQo+PiAgIGRyaXZlcnMvdmhvc3Qvdmhvc3RfaW90
bGIuYyAgICB8IDE3MSArKysrKysrCj4+ICAgZHJpdmVycy92aG9zdC92cmluZ2guYyAgICAgICAg
IHwgNDM0ICsrKysrKysrKysrKysrKysrLQo+PiAgIGRyaXZlcnMvdmlydGlvL0tjb25maWcgICAg
ICAgICB8ICAxNSArCj4+ICAgZHJpdmVycy92aXJ0aW8vTWFrZWZpbGUgICAgICAgIHwgICAyICsK
Pj4gICBkcml2ZXJzL3ZpcnRpby92ZHBhL0tjb25maWcgICAgfCAgMjYgKysKPj4gICBkcml2ZXJz
L3ZpcnRpby92ZHBhL01ha2VmaWxlICAgfCAgIDMgKwo+PiAgIGRyaXZlcnMvdmlydGlvL3ZkcGEv
dmRwYS5jICAgICB8IDE0MSArKysrKysKPj4gICBkcml2ZXJzL3ZpcnRpby92ZHBhL3ZkcGFfc2lt
LmMgfCA3OTYKPj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+ICAgZHJpdmVy
cy92aXJ0aW8vdmlydGlvX3ZkcGEuYyAgIHwgNDAwICsrKysrKysrKysrKysrKysrCj4+ICAgaW5j
bHVkZS9saW51eC92ZHBhLmggICAgICAgICAgIHwgMTkxICsrKysrKysrCj4+ICAgaW5jbHVkZS9s
aW51eC92aG9zdF9pb3RsYi5oICAgIHwgIDQ1ICsrCj4+ICAgaW5jbHVkZS9saW51eC92cmluZ2gu
aCAgICAgICAgIHwgIDM2ICsrCj4+ICAgMTkgZmlsZXMgY2hhbmdlZCwgMjMyNyBpbnNlcnRpb25z
KCspLCAyMDQgZGVsZXRpb25zKC0pCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmhv
c3Qvdmhvc3RfaW90bGIuYwo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZpcnRpby92
ZHBhL0tjb25maWcKPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy92aXJ0aW8vdmRwYS9N
YWtlZmlsZQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZpcnRpby92ZHBhL3ZkcGEu
Ywo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZpcnRpby92ZHBhL3ZkcGFfc2ltLmMK
Pj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy92aXJ0aW8vdmlydGlvX3ZkcGEuYwo+PiAg
IGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L3ZkcGEuaAo+PiAgIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBpbmNsdWRlL2xpbnV4L3Zob3N0X2lvdGxiLmgKPj4KPj4gLS0KPj4gMi4xOS4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXph
dGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5v
cmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmly
dHVhbGl6YXRpb24=
