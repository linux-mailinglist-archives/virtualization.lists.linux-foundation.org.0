Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AE4158898
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 04:12:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A0715855D8;
	Tue, 11 Feb 2020 03:12:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w8A+X2k+VTBH; Tue, 11 Feb 2020 03:12:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 354448627B;
	Tue, 11 Feb 2020 03:12:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0A886C07FE;
	Tue, 11 Feb 2020 03:12:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9B4CC07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 03:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D28D4879C3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 03:12:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eygCU4xmam-T
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 03:12:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F01FB87850
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 03:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581390764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q+EmKIrsTYodqEbhl714OL2yeXOxjPittki/IV3oU/E=;
 b=Bw3P/38weRF4kZWBaULPb2UQONoUp8hrbBUXNIaAnGzjAMWFLcHPYQylBUFiMj8hCpTIFk
 0OXSOUlHl7AdfIPhPh7FUE3tNd4p6AnctJ47gYavPpINbEwwmbRSQZRdlm9ABkpwb1dAKx
 qnAfhzv0tro34QaE8P9+rlJkkqXEVx0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-j-AC7TOhNd6v0QTR3XvrnQ-1; Mon, 10 Feb 2020 22:12:41 -0500
X-MC-Unique: j-AC7TOhNd6v0QTR3XvrnQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DF6A800EBB;
 Tue, 11 Feb 2020 03:12:39 +0000 (UTC)
Received: from [10.72.12.184] (ovpn-12-184.pek2.redhat.com [10.72.12.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA73A89F24;
 Tue, 11 Feb 2020 03:12:20 +0000 (UTC)
Subject: Re: [PATCH V2 5/5] vdpasim: vDPA device simulator
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200210035608.10002-1-jasowang@redhat.com>
 <20200210035608.10002-6-jasowang@redhat.com>
 <20200210062219-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d738e251-d03b-c2a0-bf0a-045ea0b1871c@redhat.com>
Date: Tue, 11 Feb 2020 11:12:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200210062219-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: kvm@vger.kernel.org, mhabets@solarflare.com, haotian.wang@sifive.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 lulu@redhat.com, hanand@xilinx.com, hch@infradead.org, eperezma@redhat.com,
 jgg@mellanox.com, shahafs@mellanox.com, parav@mellanox.com, jiri@mellanox.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, zhihong.wang@intel.com,
 netdev@vger.kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 maxime.coquelin@redhat.com, lingshan.zhu@intel.com
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

Ck9uIDIwMjAvMi8xMCDkuIvljYg3OjIzLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
TW9uLCBGZWIgMTAsIDIwMjAgYXQgMTE6NTY6MDhBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gVGhpcyBwYXRjaCBpbXBsZW1lbnRzIGEgc29mdHdhcmUgdkRQQSBuZXR3b3JraW5nIGRldmlj
ZS4gVGhlIGRhdGFwYXRoCj4+IGlzIGltcGxlbWVudGVkIHRocm91Z2ggdnJpbmdoIGFuZCB3b3Jr
cXVldWUuIFRoZSBkZXZpY2UgaGFzIGFuIG9uLWNoaXAKPj4gSU9NTVUgd2hpY2ggdHJhbnNsYXRl
cyBJT1ZBIHRvIFBBLiBGb3Iga2VybmVsIHZpcnRpbyBkcml2ZXJzLCB2RFBBCj4+IHNpbXVsYXRv
ciBkcml2ZXIgcHJvdmlkZXMgZG1hX29wcy4gRm9yIHZob3N0IGRyaWVycywgc2V0X21hcCgpIG1l
dGhvZHMKPj4gb2YgdmRwYV9jb25maWdfb3BzIGlzIGltcGxlbWVudGVkIHRvIGFjY2VwdCBtYXBw
aW5ncyBmcm9tIHZob3N0Lgo+Pgo+PiBDdXJyZW50bHksIHZEUEEgZGV2aWNlIHNpbXVsYXRvciB3
aWxsIGxvb3BiYWNrIFRYIHRyYWZmaWMgdG8gUlguIFNvCj4+IHRoZSBtYWluIHVzZSBjYXNlIGZv
ciB0aGUgZGV2aWNlIGlzIHZEUEEgZmVhdHVyZSB0ZXN0aW5nLCBwcm90b3R5cGluZwo+PiBhbmQg
ZGV2ZWxvcG1lbnQuCj4+Cj4+IE5vdGUsIHRoZXJlJ3Mgbm8gbWFuYWdlbWVudCBBUEkgaW1wbGVt
ZW50ZWQsIGEgdkRQQSBkZXZpY2Ugd2lsbCBiZQo+PiByZWdpc3RlcmVkIG9uY2UgdGhlIG1vZHVs
ZSBpcyBwcm9iZWQuIFdlIG5lZWQgdG8gaGFuZGxlIHRoaXMgaW4gdGhlCj4+IGZ1dHVyZSBkZXZl
bG9wbWVudC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFzb24gV2FuZzxqYXNvd2FuZ0ByZWRoYXQu
Y29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL3ZpcnRpby92ZHBhL0tjb25maWcgICAgfCAgMTcgKwo+
PiAgIGRyaXZlcnMvdmlydGlvL3ZkcGEvTWFrZWZpbGUgICB8ICAgMSArCj4+ICAgZHJpdmVycy92
aXJ0aW8vdmRwYS92ZHBhX3NpbS5jIHwgNjc4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwo+PiAgIDMgZmlsZXMgY2hhbmdlZCwgNjk2IGluc2VydGlvbnMoKykKPj4gICBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy92aXJ0aW8vdmRwYS92ZHBhX3NpbS5jCj4+Cj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3ZpcnRpby92ZHBhL0tjb25maWcgYi9kcml2ZXJzL3ZpcnRpby92ZHBhL0tj
b25maWcKPj4gaW5kZXggN2E5OTE3MGU2YzMwLi5hNzg4ODk3NGRkYTggMTAwNjQ0Cj4+IC0tLSBh
L2RyaXZlcnMvdmlydGlvL3ZkcGEvS2NvbmZpZwo+PiArKysgYi9kcml2ZXJzL3ZpcnRpby92ZHBh
L0tjb25maWcKPj4gQEAgLTcsMyArNywyMCBAQCBjb25maWcgVkRQQQo+PiAgICAgICAgICAgICBk
YXRhcGF0aCB3aGljaCBjb21wbGllcyB3aXRoIHZpcnRpbyBzcGVjaWZpY2F0aW9ucyB3aXRoCj4+
ICAgICAgICAgICAgIHZlbmRvciBzcGVjaWZpYyBjb250cm9sIHBhdGguCj4+ICAgCj4+ICttZW51
Y29uZmlnIFZEUEFfTUVOVQo+PiArCWJvb2wgIlZEUEEgZHJpdmVycyIKPj4gKwlkZWZhdWx0IG4K
Pj4gKwo+PiAraWYgVkRQQV9NRU5VCj4+ICsKPj4gK2NvbmZpZyBWRFBBX1NJTQo+PiArCXRyaXN0
YXRlICJ2RFBBIGRldmljZSBzaW11bGF0b3IiCj4+ICsgICAgICAgIHNlbGVjdCBWRFBBCj4+ICsg
ICAgICAgIGRlZmF1bHQgbgo+PiArICAgICAgICBoZWxwCj4+ICsgICAgICAgICAgdkRQQSBuZXR3
b3JraW5nIGRldmljZSBzaW11bGF0b3Igd2hpY2ggbG9vcCBUWCB0cmFmZmljIGJhY2sKPj4gKyAg
ICAgICAgICB0byBSWC4gVGhpcyBkZXZpY2UgaXMgdXNlZCBmb3IgdGVzdGluZywgcHJvdG90eXBp
bmcgYW5kCj4+ICsgICAgICAgICAgZGV2ZWxvcG1lbnQgb2YgdkRQQS4KPiBTbyBob3cgYWJvdXQg
d2UgbWFrZSB0aGlzIGRlcGVuZCBvbiBSVU5USU1FX1RFU1RJTkdfTUVOVT8KPgo+CgpJJ20gbm90
IHN1cmUgaG93IG11Y2ggaXQgY2FuIGhlbHAgYnV0IEkgY2FuIGRvIHRoYXQgaW4gbmV4dCB2ZXJz
aW9uLgoKVGhhbmtzCgpSVU5USU1FX1RFU1RJTkdfTUVOVQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZp
cnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGlu
dXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
