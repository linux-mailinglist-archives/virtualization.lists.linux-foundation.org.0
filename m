Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E4D130C37
	for <lists.virtualization@lfdr.de>; Mon,  6 Jan 2020 03:47:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 58F548739D;
	Mon,  6 Jan 2020 02:47:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bcx2gZRplKA5; Mon,  6 Jan 2020 02:47:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CC7B88738A;
	Mon,  6 Jan 2020 02:47:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1244C0881;
	Mon,  6 Jan 2020 02:47:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BC136C0881
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jan 2020 02:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B1D2681E6F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jan 2020 02:47:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t6ere7escTfR
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jan 2020 02:47:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5102281DFD
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jan 2020 02:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578278867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5jHs+ncyMkPMxI5AsiGIl7F6vLxr1/FM/W1+8uxJ60Q=;
 b=iYAwGKrRkHiLRkU5AvjTBCGENVmW3G6S7GeFofT9QmsDopbEUgtkbKm3420M9+f2PHNcJ/
 HLqM29jgDmB8hqAkjLKJfeFbbtuvS4LV5qJTtNPNLl6TNsKdHfc+PgfvTYPp6I0xDLNami
 MU9kecTdaXTDsAl5tqYMhGOZczkjHY0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-bEdDg_oCPxqNF6G2z-hkxg-1; Sun, 05 Jan 2020 21:47:44 -0500
X-MC-Unique: bEdDg_oCPxqNF6G2z-hkxg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA9DB10054E3;
 Mon,  6 Jan 2020 02:47:42 +0000 (UTC)
Received: from [10.72.12.147] (ovpn-12-147.pek2.redhat.com [10.72.12.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73D9328981;
 Mon,  6 Jan 2020 02:47:37 +0000 (UTC)
Subject: Re: [PATCH v2] virtio_net: CTRL_GUEST_OFFLOADS depends on CTRL_VQ
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20200105132120.92370-1-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <2d7053b5-295c-4051-a722-7656350bdb74@redhat.com>
Date: Mon, 6 Jan 2020 10:47:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200105132120.92370-1-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: Alistair Delva <adelva@google.com>, netdev@vger.kernel.org,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjAvMS81IOS4i+WNiDk6MjIsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBUaGUg
b25seSB3YXkgZm9yIGd1ZXN0IHRvIGNvbnRyb2wgb2ZmbG9hZHMgKGFzIGVuYWJsZWQgYnkKPiBW
SVJUSU9fTkVUX0ZfQ1RSTF9HVUVTVF9PRkZMT0FEUykgaXMgYnkgc2VuZGluZyBjb21tYW5kcwo+
IHRocm91Z2ggQ1RSTF9WUS4gU28gaXQgZG9lcyBub3QgbWFrZSBzZW5zZSB0bwo+IGFja25vd2xl
ZGdlIFZJUlRJT19ORVRfRl9DVFJMX0dVRVNUX09GRkxPQURTIHdpdGhvdXQKPiBWSVJUSU9fTkVU
X0ZfQ1RSTF9WUS4KPgo+IFRoZSBzcGVjIGRvZXMgbm90IG91dGxhdyBkZXZpY2VzIHdpdGggc3Vj
aCBhIGNvbmZpZ3VyYXRpb24sIHNvIHdlIGhhdmUKPiB0byBzdXBwb3J0IGl0LiBTaW1wbHkgY2xl
YXIgVklSVElPX05FVF9GX0NUUkxfR1VFU1RfT0ZGTE9BRFMuCj4gTm90ZSB0aGF0IExpbnV4IGlz
IHN0aWxsIGNyYXNoaW5nIGlmIGl0IHRyaWVzIHRvCj4gY2hhbmdlIHRoZSBvZmZsb2FkcyB3aGVu
IHRoZXJlJ3Mgbm8gY29udHJvbCB2cS4KPiBUaGF0IG5lZWRzIHRvIGJlIGZpeGVkIGJ5IGFub3Ro
ZXIgcGF0Y2guCj4KPiBSZXBvcnRlZC1ieTogQWxpc3RhaXIgRGVsdmEgPGFkZWx2YUBnb29nbGUu
Y29tPgo+IFJlcG9ydGVkLWJ5OiBXaWxsZW0gZGUgQnJ1aWpuIDx3aWxsZW1kZWJydWlqbi5rZXJu
ZWxAZ21haWwuY29tPgo+IEZpeGVzOiAzZjkzNTIyZmZhYjIgKCJ2aXJ0aW8tbmV0OiBzd2l0Y2gg
b2ZmIG9mZmxvYWRzIG9uIGRlbWFuZCBpZiBwb3NzaWJsZSBvbiBYRFAgc2V0IikKPiBTaWduZWQt
b2ZmLWJ5OiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPgo+IC0tLQo+Cj4gU2Ft
ZSBwYXRjaCBhcyB2MSBidXQgdXBkYXRlIGRvY3VtZW50YXRpb24gc28gaXQncyBjbGVhciBpdCdz
IG5vdAo+IGVub3VnaCB0byBmaXggdGhlIGNyYXNoLgo+Cj4gICBkcml2ZXJzL25ldC92aXJ0aW9f
bmV0LmMgfCA5ICsrKysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3ZpcnRpb19uZXQuYyBiL2RyaXZlcnMvbmV0L3Zp
cnRpb19uZXQuYwo+IGluZGV4IDRkN2Q1NDM0Y2M1ZC4uN2I4ODA1YjQ3ZjBkIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvbmV0L3ZpcnRpb19uZXQuYwo+ICsrKyBiL2RyaXZlcnMvbmV0L3ZpcnRpb19u
ZXQuYwo+IEBAIC0yOTcxLDYgKzI5NzEsMTUgQEAgc3RhdGljIGludCB2aXJ0bmV0X3ZhbGlkYXRl
KHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2KQo+ICAgCWlmICghdmlydG5ldF92YWxpZGF0ZV9m
ZWF0dXJlcyh2ZGV2KSkKPiAgIAkJcmV0dXJuIC1FSU5WQUw7Cj4gICAKPiArCS8qIFZJUlRJT19O
RVRfRl9DVFJMX0dVRVNUX09GRkxPQURTIGRvZXMgbm90IHdvcmsgd2l0aG91dAo+ICsJICogVklS
VElPX05FVF9GX0NUUkxfVlEuIFVuZm9ydHVuYXRlbHkgc3BlYyBmb3Jnb3QgdG8KPiArCSAqIHNw
ZWNpZnkgdGhhdCBWSVJUSU9fTkVUX0ZfQ1RSTF9HVUVTVF9PRkZMT0FEUyBkZXBlbmRzCj4gKwkg
KiBvbiBWSVJUSU9fTkVUX0ZfQ1RSTF9WUSBzbyBkZXZpY2VzIGNhbiBzZXQgdGhlIGxhdGVyIGJ1
dAo+ICsJICogbm90IHRoZSBmb3JtZXIuCj4gKwkgKi8KPiArCWlmICghdmlydGlvX2hhc19mZWF0
dXJlKHZkZXYsIFZJUlRJT19ORVRfRl9DVFJMX1ZRKSkKPiArCQkJX192aXJ0aW9fY2xlYXJfYml0
KHZkZXYsIFZJUlRJT19ORVRfRl9DVFJMX0dVRVNUX09GRkxPQURTKTsKCgpJZiBpdCdzIGp1c3Qg
YmVjYXVzZSBhIGJ1ZyBvZiBzcGVjLCBzaG91bGQgd2Ugc2ltcGx5IGZpeCB0aGUgYnVnIGFuZCAK
ZmFpbCB0aGUgbmVnb3RpYXRpb24gaW4gdmlydG5ldF92YWxpZGF0ZV9mZWF0dXJlKCk/CgpPdGhl
cndpc2UgdGhlcmUgd291bGQgYmUgaW5jb25zaXN0ZW5jeSBpbiBoYW5kbGluZyBmZWF0dXJlIGRl
cGVuZGVuY2llcyAKZm9yIGN0cmwgdnEuCgpUaGFua3MKCgo+ICsKPiAgIAlpZiAodmlydGlvX2hh
c19mZWF0dXJlKHZkZXYsIFZJUlRJT19ORVRfRl9NVFUpKSB7Cj4gICAJCWludCBtdHUgPSB2aXJ0
aW9fY3JlYWQxNih2ZGV2LAo+ICAgCQkJCQkgb2Zmc2V0b2Yoc3RydWN0IHZpcnRpb19uZXRfY29u
ZmlnLAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmly
dHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5k
YXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3ZpcnR1YWxpemF0aW9u
