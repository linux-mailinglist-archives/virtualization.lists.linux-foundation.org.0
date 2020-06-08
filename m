Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9891F1549
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 11:19:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 698C187EA8;
	Mon,  8 Jun 2020 09:19:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hKuhaI2Mv6S6; Mon,  8 Jun 2020 09:19:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E35B387E8E;
	Mon,  8 Jun 2020 09:19:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE084C016F;
	Mon,  8 Jun 2020 09:19:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D37BCC016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B3FBD2076E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:19:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PSW1v-drc1OL
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:19:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id BB6F62051B
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591607954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oS/KVBpran494cCFbIQ4AK45fomUTGyPOMA3CK9qr/I=;
 b=IObOPmrwZMW9F2wJIkpGwmiODWV4sPcRq/EDAiaI4hrzm+nnEcxZkKjJX85jdbxCULRums
 5SCEgXB80OkydbLUhvnlUOeMZYOh5NoTr0ZCa8BNBl7HiJxxXBjYbze/PmVJlJKbc2XkIH
 kEYS0k3biZ1pzHobpCTGugM+uzacIvo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-VxbcQD1KO5K7RxYLu9namw-1; Mon, 08 Jun 2020 05:19:12 -0400
X-MC-Unique: VxbcQD1KO5K7RxYLu9namw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 900E98064DF;
 Mon,  8 Jun 2020 09:19:10 +0000 (UTC)
Received: from [10.72.13.71] (ovpn-13-71.pek2.redhat.com [10.72.13.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4CC1C7E577;
 Mon,  8 Jun 2020 09:18:52 +0000 (UTC)
Subject: Re: [PATCH 5/6] vdpa: introduce virtio pci driver
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200529080303.15449-1-jasowang@redhat.com>
 <20200529080303.15449-6-jasowang@redhat.com>
 <20200602010332-mutt-send-email-mst@kernel.org>
 <5dbb0386-beeb-5bf4-d12e-fb5427486bb8@redhat.com>
 <6b1d1ef3-d65e-08c2-5b65-32969bb5ecbc@redhat.com>
 <20200607095012-mutt-send-email-mst@kernel.org>
 <9b1abd2b-232c-aa0f-d8bb-03e65fd47de2@redhat.com>
 <20200608021438-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a1b1b7fb-b097-17b7-2e3a-0da07d2e48ae@redhat.com>
Date: Mon, 8 Jun 2020 17:18:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200608021438-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: shahafs@mellanox.com, lulu@redhat.com, kvm@vger.kernel.org,
 saugatm@xilinx.com, netdev@vger.kernel.org, mhabets@solarflare.com,
 vmireyno@marvell.com, linux-kernel@vger.kernel.org, gdawar@xilinx.com,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 hanand@xilinx.com, zhangweining@ruijie.com.cn, eli@mellanox.com,
 lingshan.zhu@intel.com, rob.miller@broadcom.com
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

Ck9uIDIwMjAvNi84IOS4i+WNiDI6MzIsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBN
b24sIEp1biAwOCwgMjAyMCBhdCAxMTozMjozMUFNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
PiBPbiAyMDIwLzYvNyDkuIvljYg5OjUxLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+PiBP
biBGcmksIEp1biAwNSwgMjAyMCBhdCAwNDo1NDoxN1BNICswODAwLCBKYXNvbiBXYW5nIHdyb3Rl
Ogo+Pj4+IE9uIDIwMjAvNi8yIOS4i+WNiDM6MDgsIEphc29uIFdhbmcgd3JvdGU6Cj4+Pj4+Pj4g
K3N0YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCB2cF92ZHBhX2lkX3RhYmxlW10gPSB7
Cj4+Pj4+Pj4gK8KgwqDCoCB7IFBDSV9ERVZJQ0UoUENJX1ZFTkRPUl9JRF9SRURIQVRfUVVNUkFO
RVQsIFBDSV9BTllfSUQpIH0sCj4+Pj4+Pj4gK8KgwqDCoCB7IDAgfQo+Pj4+Pj4+ICt9Owo+Pj4+
Pj4gVGhpcyBsb29rcyBsaWtlIGl0J2xsIGNyZWF0ZSBhIG1lc3Mgd2l0aCBlaXRoZXIgdmlydGlv
IHBjaQo+Pj4+Pj4gb3IgdmRwYSBiZWluZyBsb2FkZWQgYXQgcmFuZG9tLiBNYXliZSBqdXN0IGRv
bid0IHNwZWNpZnkKPj4+Pj4+IGFueSBJRHMgZm9yIG5vdy4gRG93biB0aGUgcm9hZCB3ZSBjb3Vs
ZCBnZXQgYQo+Pj4+Pj4gZGlzdGluY3QgdmVuZG9yIElEIG9yIGEgcmFuZ2Ugb2YgZGV2aWNlIElE
cyBmb3IgdGhpcy4KPj4+Pj4gUmlnaHQsIHdpbGwgZG8uCj4+Pj4+Cj4+Pj4+IFRoYW5rcwo+Pj4+
IFJldGhpbmsgYWJvdXQgdGhpcy4gSWYgd2UgZG9uJ3Qgc3BlY2lmeSBhbnkgSUQsIHRoZSBiaW5k
aW5nIHdvbid0IHdvcmsuCj4+PiBXZSBjYW4gYmluZCBtYW51YWxseS4gSXQncyBub3QgcmVhbGx5
IGZvciBwcm9kdWN0aW9uIGFueXdheSwgc28KPj4+IG5vdCBhIGJpZyBkZWFsIGltaG8uCj4+Cj4+
IEkgdGhpbmsgeW91IG1lYW4gZG9pbmcgaXQgdmlhICJuZXdfaWQiLCByaWdodC4KPiBJIHJlYWxs
eSBtZWFudCBkcml2ZXJfb3ZlcnJpZGUuIFRoaXMgaXMgd2hhdCBwZW9wbGUgaGF2ZSBiZWVuIHVz
aW5nCj4gd2l0aCBwY2ktc3R1YiBmb3IgeWVhcnMgbm93LgoKCkRvIHlvdSB3YW50IG1lIHRvIGlt
cGxlbWVudCAiZHJpdmVyX292ZXJyaWQiIGluIHRoaXMgc2VyaWVzLCBvciBhIE5VTEwgCmlkX3Rh
YmxlIGlzIHN1ZmZpY2llbnQ/CgoKPgo+Pj4+IEhvdyBhYm91dCB1c2luZyBhIGRlZGljYXRlZCBz
dWJzeXN0ZW0gdmVuZG9yIGlkIGZvciB0aGlzPwo+Pj4+Cj4+Pj4gVGhhbmtzCj4+PiBJZiB2aXJ0
aW8gdmVuZG9yIGlkIGlzIHVzZWQgdGhlbiBzdGFuZGFyZCBkcml2ZXIgaXMgZXhwZWN0ZWQKPj4+
IHRvIGJpbmQsIHJpZ2h0PyBNYXliZSB1c2UgYSBkZWRpY2F0ZWQgdmVuZG9yIGlkPwo+Pgo+PiBJ
IG1lYW50IHNvbWV0aGluZyBsaWtlOgo+Pgo+PiBzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9kZXZp
Y2VfaWQgdnBfdmRwYV9pZF90YWJsZVtdID0gewo+PiAgwqDCoMKgIHsgUENJX0RFVklDRV9TVUIo
UENJX1ZFTkRPUl9JRF9SRURIQVRfUVVNUkFORVQsIFBDSV9BTllfSUQsCj4+IFZQX1RFU1RfVkVO
RE9SX0lELCBWUF9URVNUX0RFVklDRV9JRCkgfSwKPj4gIMKgwqDCoCB7IDAgfQo+PiB9Owo+Pgo+
PiBUaGFua3MKPj4KPiBUaGVuIHJlZ3VsYXIgdmlydGlvIHdpbGwgc3RpbGwgYmluZCB0byBpdC4g
SXQgaGFzCj4KPiBkcml2ZXJzL3ZpcnRpby92aXJ0aW9fcGNpX2NvbW1vbi5jOiAgICAgeyBQQ0lf
REVWSUNFKFBDSV9WRU5ET1JfSURfUkVESEFUX1FVTVJBTkVULCBQQ0lfQU5ZX0lEKSB9LAo+Cj4K
CklGQ1ZGIHVzZSB0aGlzIHRvIGF2b2lkIHRoZSBiaW5kaW5nIHRvIHJlZ3VsYXIgdmlydGlvIGRl
dmljZS4gTG9va2luZyBhdCAKcGNpX21hdGNoX29uZV9kZXZpY2UoKSBpdCBjaGVja3MgYm90aCBz
dWJ2ZW5kb3IgYW5kIHN1YmRldmljZSB0aGVyZS4KClRoYW5rcwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0
ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
