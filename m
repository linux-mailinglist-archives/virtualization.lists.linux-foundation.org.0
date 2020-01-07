Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B1043132169
	for <lists.virtualization@lfdr.de>; Tue,  7 Jan 2020 09:31:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 577B880C8A;
	Tue,  7 Jan 2020 08:31:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BI7dQVzwMZ0K; Tue,  7 Jan 2020 08:31:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B00CD8072F;
	Tue,  7 Jan 2020 08:31:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C0C3C0881;
	Tue,  7 Jan 2020 08:31:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A0D7AC0881
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 08:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8FBA580C8A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 08:31:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jRbRepoadSKr
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 08:31:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 94E218072F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 08:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578385878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vF6sDbkc+WEm8XglHdUKDkPI3i4BPn8PiMseQ0QvR8o=;
 b=Q+KhMrlI08m1hX5+FZo5aQZVqpyM+n30OXU1yqLukHKK8TmSy6H3/fLpWOOue6TCkkSd4l
 +Th3hH2hQLqWCsHM0jiLGUfmohnPNXiy/p+oKZlnpdtL2RsJm+4ZK3XS8Dk3RULenAlgNf
 uoQ1N1lcjis1UEX/nWaCVOr5hibbuxQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-0qH6OMJ0PnqNauFDKp8scQ-1; Tue, 07 Jan 2020 03:31:14 -0500
X-MC-Unique: 0qH6OMJ0PnqNauFDKp8scQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B10F1807465;
 Tue,  7 Jan 2020 08:31:13 +0000 (UTC)
Received: from [10.72.12.248] (ovpn-12-248.pek2.redhat.com [10.72.12.248])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8FE3F85EE6;
 Tue,  7 Jan 2020 08:31:07 +0000 (UTC)
Subject: Re: [PATCH v2] virtio_net: CTRL_GUEST_OFFLOADS depends on CTRL_VQ
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200105132120.92370-1-mst@redhat.com>
 <2d7053b5-295c-4051-a722-7656350bdb74@redhat.com>
 <20200106074426-mutt-send-email-mst@kernel.org>
 <eab75b06-453d-2e17-1e77-439a66c3c86a@redhat.com>
 <20200107020303-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <6febe3fd-f243-13d2-b3cf-efd172f229c7@redhat.com>
Date: Tue, 7 Jan 2020 16:31:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200107020303-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: Alistair Delva <adelva@google.com>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 "David S. Miller" <davem@davemloft.net>
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

Ck9uIDIwMjAvMS83IOS4i+WNiDM6MDYsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBU
dWUsIEphbiAwNywgMjAyMCBhdCAxMDoyOTowOEFNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
PiBPbiAyMDIwLzEvNiDkuIvljYg4OjU0LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+PiBP
biBNb24sIEphbiAwNiwgMjAyMCBhdCAxMDo0NzozNUFNICswODAwLCBKYXNvbiBXYW5nIHdyb3Rl
Ogo+Pj4+IE9uIDIwMjAvMS81IOS4i+WNiDk6MjIsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToK
Pj4+Pj4gVGhlIG9ubHkgd2F5IGZvciBndWVzdCB0byBjb250cm9sIG9mZmxvYWRzIChhcyBlbmFi
bGVkIGJ5Cj4+Pj4+IFZJUlRJT19ORVRfRl9DVFJMX0dVRVNUX09GRkxPQURTKSBpcyBieSBzZW5k
aW5nIGNvbW1hbmRzCj4+Pj4+IHRocm91Z2ggQ1RSTF9WUS4gU28gaXQgZG9lcyBub3QgbWFrZSBz
ZW5zZSB0bwo+Pj4+PiBhY2tub3dsZWRnZSBWSVJUSU9fTkVUX0ZfQ1RSTF9HVUVTVF9PRkZMT0FE
UyB3aXRob3V0Cj4+Pj4+IFZJUlRJT19ORVRfRl9DVFJMX1ZRLgo+Pj4+Pgo+Pj4+PiBUaGUgc3Bl
YyBkb2VzIG5vdCBvdXRsYXcgZGV2aWNlcyB3aXRoIHN1Y2ggYSBjb25maWd1cmF0aW9uLCBzbyB3
ZSBoYXZlCj4+Pj4+IHRvIHN1cHBvcnQgaXQuIFNpbXBseSBjbGVhciBWSVJUSU9fTkVUX0ZfQ1RS
TF9HVUVTVF9PRkZMT0FEUy4KPj4+Pj4gTm90ZSB0aGF0IExpbnV4IGlzIHN0aWxsIGNyYXNoaW5n
IGlmIGl0IHRyaWVzIHRvCj4+Pj4+IGNoYW5nZSB0aGUgb2ZmbG9hZHMgd2hlbiB0aGVyZSdzIG5v
IGNvbnRyb2wgdnEuCj4+Pj4+IFRoYXQgbmVlZHMgdG8gYmUgZml4ZWQgYnkgYW5vdGhlciBwYXRj
aC4KPj4+Pj4KPj4+Pj4gUmVwb3J0ZWQtYnk6IEFsaXN0YWlyIERlbHZhIDxhZGVsdmFAZ29vZ2xl
LmNvbT4KPj4+Pj4gUmVwb3J0ZWQtYnk6IFdpbGxlbSBkZSBCcnVpam4gPHdpbGxlbWRlYnJ1aWpu
Lmtlcm5lbEBnbWFpbC5jb20+Cj4+Pj4+IEZpeGVzOiAzZjkzNTIyZmZhYjIgKCJ2aXJ0aW8tbmV0
OiBzd2l0Y2ggb2ZmIG9mZmxvYWRzIG9uIGRlbWFuZCBpZiBwb3NzaWJsZSBvbiBYRFAgc2V0IikK
Pj4+Pj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4K
Pj4+Pj4gLS0tCj4+Pj4+Cj4+Pj4+IFNhbWUgcGF0Y2ggYXMgdjEgYnV0IHVwZGF0ZSBkb2N1bWVu
dGF0aW9uIHNvIGl0J3MgY2xlYXIgaXQncyBub3QKPj4+Pj4gZW5vdWdoIHRvIGZpeCB0aGUgY3Jh
c2guCj4+Pj4+Cj4+Pj4+ICAgICBkcml2ZXJzL25ldC92aXJ0aW9fbmV0LmMgfCA5ICsrKysrKysr
Kwo+Pj4+PiAgICAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQo+Pj4+Pgo+Pj4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jIGIvZHJpdmVycy9uZXQvdmlydGlv
X25ldC5jCj4+Pj4+IGluZGV4IDRkN2Q1NDM0Y2M1ZC4uN2I4ODA1YjQ3ZjBkIDEwMDY0NAo+Pj4+
PiAtLS0gYS9kcml2ZXJzL25ldC92aXJ0aW9fbmV0LmMKPj4+Pj4gKysrIGIvZHJpdmVycy9uZXQv
dmlydGlvX25ldC5jCj4+Pj4+IEBAIC0yOTcxLDYgKzI5NzEsMTUgQEAgc3RhdGljIGludCB2aXJ0
bmV0X3ZhbGlkYXRlKHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2KQo+Pj4+PiAgICAgCWlmICgh
dmlydG5ldF92YWxpZGF0ZV9mZWF0dXJlcyh2ZGV2KSkKPj4+Pj4gICAgIAkJcmV0dXJuIC1FSU5W
QUw7Cj4+Pj4+ICsJLyogVklSVElPX05FVF9GX0NUUkxfR1VFU1RfT0ZGTE9BRFMgZG9lcyBub3Qg
d29yayB3aXRob3V0Cj4+Pj4+ICsJICogVklSVElPX05FVF9GX0NUUkxfVlEuIFVuZm9ydHVuYXRl
bHkgc3BlYyBmb3Jnb3QgdG8KPj4+Pj4gKwkgKiBzcGVjaWZ5IHRoYXQgVklSVElPX05FVF9GX0NU
UkxfR1VFU1RfT0ZGTE9BRFMgZGVwZW5kcwo+Pj4+PiArCSAqIG9uIFZJUlRJT19ORVRfRl9DVFJM
X1ZRIHNvIGRldmljZXMgY2FuIHNldCB0aGUgbGF0ZXIgYnV0Cj4+Pj4+ICsJICogbm90IHRoZSBm
b3JtZXIuCj4+Pj4+ICsJICovCj4+Pj4+ICsJaWYgKCF2aXJ0aW9faGFzX2ZlYXR1cmUodmRldiwg
VklSVElPX05FVF9GX0NUUkxfVlEpKQo+Pj4+PiArCQkJX192aXJ0aW9fY2xlYXJfYml0KHZkZXYs
IFZJUlRJT19ORVRfRl9DVFJMX0dVRVNUX09GRkxPQURTKTsKPj4+PiBJZiBpdCdzIGp1c3QgYmVj
YXVzZSBhIGJ1ZyBvZiBzcGVjLCBzaG91bGQgd2Ugc2ltcGx5IGZpeCB0aGUgYnVnIGFuZCBmYWls
Cj4+Pj4gdGhlIG5lZ290aWF0aW9uIGluIHZpcnRuZXRfdmFsaWRhdGVfZmVhdHVyZSgpPwo+Pj4g
T25lIG1hbidzIGJ1ZyBpcyBhbm90aGVyIG1hbidzIGZlYXR1cmU6IGFyZ3VhYmx5IGxlYXZpbmcg
dGhlIGZlYXR1cmVzCj4+PiBpbmRlcGVuZGVudCBpbiB0aGUgc3BlYyBtaWdodCBhbGxvdyByZXVz
ZSBvZiB0aGUgZmVhdHVyZSBiaXQgd2l0aG91dAo+Pj4gYnJlYWtpbmcgZ3Vlc3RzLgo+Pj4KPj4+
IEFuZCBldmVuIGlmIHdlIHNheSBpdCdzIGEgYnVnIHdlIGNhbid0IHNpbXBseSBmaXggdGhlIGJ1
ZyBpbiB0aGUKPj4+IHNwZWM6IGNoYW5naW5nIHRoZSB0ZXh0IGZvciBhIGZ1dHVyZSB2ZXJzaW9u
IGRvZXMgbm90IGNoYW5nZSB0aGUgZmFjdAo+Pj4gdGhhdCBkZXZpY2VzIGJlaGF2aW5nIGFjY29y
ZGluZyB0byB0aGUgc3BlYyBleGlzdC4KPj4+Cj4+Pj4gT3RoZXJ3aXNlIHRoZXJlIHdvdWxkIGJl
IGluY29uc2lzdGVuY3kgaW4gaGFuZGxpbmcgZmVhdHVyZSBkZXBlbmRlbmNpZXMgZm9yCj4+Pj4g
Y3RybCB2cS4KPj4+Pgo+Pj4+IFRoYW5rcwo+Pj4gVGhhdCdzIGEgY29zbWV0aWMgcHJvYmxlbSBB
VE0uIEl0IG1pZ2h0IGJlIGEgZ29vZCBpZGVhIHRvIGdlbmVyYWxseQo+Pj4gY2hhbmdlIG91ciBo
YW5kbGluZyBvZiBkZXBlbmRlbmNpZXMsIGFuZCBjbGVhciBmZWF0dXJlIGJpdHMgaW5zdGVhZCBv
Zgo+Pj4gZmFpbGluZyBwcm9iZSBvbiBhIG1pc21hdGNoLgo+Pgo+PiBTb21ldGhpbmcgbGlrZSBJ
IHByb3Bvc2VkIGluIHRoZSBwYXN0ID8gWzFdCj4+Cj4+IFsxXSBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9wYXRjaHdvcmsvcGF0Y2gvNTE5MDc0Lwo+Cj4gTm8gdGhhdCBzdGlsbCBmYWlscyBwcm9i
ZS4KPgo+IEkgYW0gYXNraW5nIHdoZXRoZXIgaXQncyBtb3JlIGZ1dHVyZSBwcm9vZiB0byBmYWls
IHByb2JlCj4gb24gZmVhdHVyZSBjb21iaW5hdGlvbnMgZGlzYWxsb3dlZCBieSBzcGVjLCBvciB0
byBjbGVhciBiaXRzCj4gdG8gZ2V0IHRvIGFuIGV4cGVjdGVkIGNvbWJpbmF0aW9uLgoKClNvcnJ5
IHdyb25nIGxpbmsuCgpJdCBzaG91bGQgYmU6IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE0LzEx
LzE3LzgyCgoKPgo+IEluIGFueSBjYXNlLCB3ZSBzaG91bGQgcHJvYmFibHkgZG9jdW1lbnQgaW4g
dGhlIHNwZWMgaG93Cj4gZHJpdmVycyBiZWhhdmUgb24gc3VjaCBjb21iaW5hdGlvbnMuCgoKWWVz
LgoKVGhhbmtzCgoKPgo+Cj4+PiAgICBJdCdzIHdvcnRoIHRoaW5raW5nICAtIGF0IHRoZSBzcGVj
IGxldmVsIC0KPj4+IGhvdyB3ZSBjYW4gYmVzdCBtYWtlIHRoZSBjb25maWd1cmF0aW9uIGV4dGVu
c2libGUuCj4+PiBCdXQgdGhhdCdzIG5vdCBzb21ldGhpbmcgc3BlYyBzaG91bGQgd29ycnkgYWJv
dXQuCj4+Pgo+Pj4KPj4+Pj4gKwo+Pj4+PiAgICAgCWlmICh2aXJ0aW9faGFzX2ZlYXR1cmUodmRl
diwgVklSVElPX05FVF9GX01UVSkpIHsKPj4+Pj4gICAgIAkJaW50IG10dSA9IHZpcnRpb19jcmVh
ZDE2KHZkZXYsCj4+Pj4+ICAgICAJCQkJCSBvZmZzZXRvZihzdHJ1Y3QgdmlydGlvX25ldF9jb25m
aWcsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0
dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRh
dGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGlu
Zm8vdmlydHVhbGl6YXRpb24=
