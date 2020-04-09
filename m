Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 460AA1A344F
	for <lists.virtualization@lfdr.de>; Thu,  9 Apr 2020 14:44:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EA7168640E;
	Thu,  9 Apr 2020 12:44:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UhAxYArr3xcv; Thu,  9 Apr 2020 12:44:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A6243863DE;
	Thu,  9 Apr 2020 12:44:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 85209C1D85;
	Thu,  9 Apr 2020 12:44:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BB93DC0177
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 12:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B106A231B1
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 12:44:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HNuAu4Wpqq3j
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 12:44:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 2BB5120524
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 12:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586436253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hCTyTHNIoa/f4FCOf5RUI76bLbl3BtD2rSWLrU8gW5Y=;
 b=bZMAYl4QAGFPMpKROtpxLo8b7l2P34mC1ROPge8ll/H1nHUfZ7dhTbhygw/wO2lwrmmQBG
 D5G1lAcvFuM2HkWdk+Vp1mB1XTjXnhtsDAqOA4CsY2mpiDr6RYMg830QfV94kGPGd+Xw+5
 ZkN7oAN6tCSKyNMlF7xTYCuHy92DLI0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-zWT1uXBlOtKpx36KjtI44w-1; Thu, 09 Apr 2020 08:44:11 -0400
X-MC-Unique: zWT1uXBlOtKpx36KjtI44w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41F51DB61;
 Thu,  9 Apr 2020 12:44:08 +0000 (UTC)
Received: from [10.72.12.130] (ovpn-12-130.pek2.redhat.com [10.72.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07E9119756;
 Thu,  9 Apr 2020 12:43:50 +0000 (UTC)
Subject: Re: [PATCH V9 9/9] virtio: Intel IFC VF driver for VDPA
To: Arnd Bergmann <arnd@arndb.de>, lingshan.zhu@intel.com
References: <20200326140125.19794-1-jasowang@redhat.com>
 <20200326140125.19794-10-jasowang@redhat.com>
 <CAK8P3a1RXUXs5oYjB=Jq5cpvG11eTnmJ+vc18_-0fzgTH6envA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ffc4c788-2319-efda-508c-275b9f7efb95@redhat.com>
Date: Thu, 9 Apr 2020 20:43:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1RXUXs5oYjB=Jq5cpvG11eTnmJ+vc18_-0fzgTH6envA@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: kvm list <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 mhabets@solarflare.com, virtualization@lists.linux-foundation.org,
 rob.miller@broadcom.com, saugatm@xilinx.com, lulu@redhat.com,
 hanand@xilinx.com, Christoph Hellwig <hch@infradead.org>, eperezma@redhat.com,
 Jason Gunthorpe <jgg@mellanox.com>, shahafs@mellanox.com,
 Parav Pandit <parav@mellanox.com>, vmireyno@marvell.com, gdawar@xilinx.com,
 Jiri Pirko <jiri@mellanox.com>, xiao.w.wang@intel.com,
 Stefan Hajnoczi <stefanha@redhat.com>, zhihong.wang@intel.com,
 zhangweining@ruijie.com.cn, Bie Tiwei <tiwei.bie@intel.com>,
 Networking <netdev@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 maxime.coquelin@redhat.com
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

Ck9uIDIwMjAvNC85IOS4i+WNiDY6NDEsIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gT24gVGh1LCBN
YXIgMjYsIDIwMjAgYXQgMzowOCBQTSBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPiB3
cm90ZToKPj4gRnJvbTogWmh1IExpbmdzaGFuIDxsaW5nc2hhbi56aHVAaW50ZWwuY29tPgo+Pgo+
PiBUaGlzIGNvbW1pdCBpbnRyb2R1Y2VkIHR3byBsYXllcnMgdG8gZHJpdmUgSUZDIFZGOgo+Pgo+
PiAoMSkgaWZjdmZfYmFzZSBsYXllciwgd2hpY2ggaGFuZGxlcyBJRkMgVkYgTklDIGhhcmR3YXJl
IG9wZXJhdGlvbnMgYW5kCj4+ICAgICAgY29uZmlndXJhdGlvbnMuCj4+Cj4+ICgyKSBpZmN2Zl9t
YWluIGxheWVyLCB3aGljaCBjb21wbGllcyB0byBWRFBBIGJ1cyBmcmFtZXdvcmssCj4+ICAgICAg
aW1wbGVtZW50ZWQgZGV2aWNlIG9wZXJhdGlvbnMgZm9yIFZEUEEgYnVzLCBoYW5kbGVzIGRldmlj
ZSBwcm9iZSwKPj4gICAgICBidXMgYXR0YWNoaW5nLCB2cmluZyBvcGVyYXRpb25zLCBldGMuCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IFpodSBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGludGVsLmNvbT4K
Pj4gU2lnbmVkLW9mZi1ieTogQmllIFRpd2VpIDx0aXdlaS5iaWVAaW50ZWwuY29tPgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBXYW5nIFhpYW8gPHhpYW8udy53YW5nQGludGVsLmNvbT4KPj4gU2lnbmVkLW9m
Zi1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPj4gKwo+PiArI2RlZmluZSBJ
RkNWRl9RVUVVRV9BTElHTk1FTlQgIFBBR0VfU0laRQo+PiArI2RlZmluZSBJRkNWRl9RVUVVRV9N
QVggICAgICAgICAgICAgICAgMzI3NjgKPj4gK3N0YXRpYyB1MTYgaWZjdmZfdmRwYV9nZXRfdnFf
YWxpZ24oc3RydWN0IHZkcGFfZGV2aWNlICp2ZHBhX2RldikKPj4gK3sKPj4gKyAgICAgICByZXR1
cm4gSUZDVkZfUVVFVUVfQUxJR05NRU5UOwo+PiArfQo+IFRoaXMgZmFpbHMgdG8gYnVpbGQgb24g
YXJtNjQgd2l0aCA2NGtiIHBhZ2Ugc2l6ZSAoZm91bmQgaW4gbGludXgtbmV4dCk6Cj4KPiAvZHJp
dmVycy92ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYzogSW4gZnVuY3Rpb24gJ2lmY3ZmX3ZkcGFfZ2V0
X3ZxX2FsaWduJzoKPiBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL3BhZ2UtZGVmLmg6MTc6MjA6IGVy
cm9yOiBjb252ZXJzaW9uIGZyb20gJ2xvbmcKPiB1bnNpZ25lZCBpbnQnIHRvICd1MTYnIHtha2Eg
J3Nob3J0IHVuc2lnbmVkIGludCd9IGNoYW5nZXMgdmFsdWUgZnJvbQo+ICc2NTUzNicgdG8gJzAn
IFstV2Vycm9yPW92ZXJmbG93XQo+ICAgICAxNyB8ICNkZWZpbmUgUEFHRV9TSVpFICAoX0FDKDEs
IFVMKSA8PCBQQUdFX1NISUZUKQo+ICAgICAgICB8ICAgICAgICAgICAgICAgICAgICBeCj4gZHJp
dmVycy92ZHBhL2lmY3ZmL2lmY3ZmX2Jhc2UuaDozNzozMTogbm90ZTogaW4gZXhwYW5zaW9uIG9m
IG1hY3JvICdQQUdFX1NJWkUnCj4gICAgIDM3IHwgI2RlZmluZSBJRkNWRl9RVUVVRV9BTElHTk1F
TlQgUEFHRV9TSVpFCj4gICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+
fn5+fn5+Cj4gZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYzoyMzE6OTogbm90ZTogaW4g
ZXhwYW5zaW9uIG9mIG1hY3JvCj4gJ0lGQ1ZGX1FVRVVFX0FMSUdOTUVOVCcKPiAgICAyMzEgfCAg
cmV0dXJuIElGQ1ZGX1FVRVVFX0FMSUdOTUVOVDsKPiAgICAgICAgfCAgICAgICAgIF5+fn5+fn5+
fn5+fn5+fn5+fn5+fgo+Cj4gSXQncyBwcm9iYWJseSBnb29kIGVub3VnaCB0byBqdXN0IG5vdCBh
bGxvdyB0aGUgZHJpdmVyIHRvIGJlIGJ1aWx0IGluIHRoYXQKPiBjb25maWd1cmF0aW9uIGFzIGl0
J3MgZmFpcmx5IHJhcmUgYnV0IHVuZm9ydHVuYXRlbHkgdGhlcmUgaXMgbm8gc2ltcGxlIEtjb25m
aWcKPiBzeW1ib2wgZm9yIGl0LgoKCk9yIEkgdGhpbmsgdGhlIDY0S0IgYWxpZ25tZW50IGlzIHBy
b2JhYmx5IG1vcmUgdGhhbiBlbm91Z2guCgpMaW5nIFNoYW4sIGNhbiB3ZSB1c2Ugc21hbGxlciB2
YWx1ZSBoZXJlPwoKVGhhbmtzCgoKPgo+IEluIGEgc2ltaWxhciBkcml2ZXIsIHdlIGRpZAo+Cj4g
Y29uZmlnIFZNWE5FVDMKPiAgICAgICAgICB0cmlzdGF0ZSAiVk13YXJlIFZNWE5FVDMgZXRoZXJu
ZXQgZHJpdmVyIgo+ICAgICAgICAgIGRlcGVuZHMgb24gUENJICYmIElORVQKPiAgICAgICAgICBk
ZXBlbmRzIG9uICEoUEFHRV9TSVpFXzY0S0IgfHwgQVJNNjRfNjRLX1BBR0VTIHx8IFwKPiAgICAg
ICAgICAgICAgICAgICAgICAgSUE2NF9QQUdFX1NJWkVfNjRLQiB8fCBNSUNST0JMQVpFXzY0S19Q
QUdFUyB8fCBcCj4gICAgICAgICAgICAgICAgICAgICAgIFBBUklTQ19QQUdFX1NJWkVfNjRLQiB8
fCBQUENfNjRLX1BBR0VTKQo+Cj4gSSB0aGluayB3ZSBzaG91bGQgcHJvYmFibHkgbWFrZSBQQUdF
X1NJWkVfNjRLQiBhIGdsb2JhbCBzeW1ib2wKPiBpbiBhcmNoL0tjb25maWcgYW5kIGhhdmUgaXQg
c2VsZWN0ZWQgYnkgdGhlIG90aGVyIHN5bWJvbHMgc28gZHJpdmVycwo+IGxpa2UgeW91cnMgY2Fu
IGFkZCBhIGRlcGVuZGVuY3kgZm9yIGl0Lgo+Cj4gICAgICAgICAgIEFybmQKPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFp
bGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBz
Oi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0
aW9u
