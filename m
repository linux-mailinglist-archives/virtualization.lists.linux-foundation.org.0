Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBDA131D98
	for <lists.virtualization@lfdr.de>; Tue,  7 Jan 2020 03:29:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2FC29868F5;
	Tue,  7 Jan 2020 02:29:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UlKkKOwu34rF; Tue,  7 Jan 2020 02:29:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A30108625E;
	Tue,  7 Jan 2020 02:29:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 886B7C0881;
	Tue,  7 Jan 2020 02:29:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C266BC0881
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 02:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BED27882CC
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 02:29:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cyzlymjz+jyd
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 02:29:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2061288303
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 02:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578364159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a3NrYC6nLk2sIb5nX+9+ItV/rLLzipIiRhUOZDl8IvI=;
 b=WCY3SQffarRCQoHz8jVKrBu5DYy83O2gjwudSlU670lrV3xpTSpcqxSKpvMj8p9rLPducU
 ascbKNaLZyaKYtkrlZef4O4xYQYmvgv8RpR31VarXWPe+u+sqNZ/QqfJe45es7hynJRSGE
 toEvJCUXVebnwF0kfA9xr7g+RDoyyxc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-un0kcg4QPnac9ZYn9AzVQA-1; Mon, 06 Jan 2020 21:29:16 -0500
X-MC-Unique: un0kcg4QPnac9ZYn9AzVQA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7EE88024E7;
 Tue,  7 Jan 2020 02:29:14 +0000 (UTC)
Received: from [10.72.12.248] (ovpn-12-248.pek2.redhat.com [10.72.12.248])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B1DE5D9CA;
 Tue,  7 Jan 2020 02:29:09 +0000 (UTC)
Subject: Re: [PATCH v2] virtio_net: CTRL_GUEST_OFFLOADS depends on CTRL_VQ
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200105132120.92370-1-mst@redhat.com>
 <2d7053b5-295c-4051-a722-7656350bdb74@redhat.com>
 <20200106074426-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <eab75b06-453d-2e17-1e77-439a66c3c86a@redhat.com>
Date: Tue, 7 Jan 2020 10:29:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200106074426-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Ck9uIDIwMjAvMS82IOS4i+WNiDg6NTQsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBN
b24sIEphbiAwNiwgMjAyMCBhdCAxMDo0NzozNUFNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
PiBPbiAyMDIwLzEvNSDkuIvljYg5OjIyLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+PiBU
aGUgb25seSB3YXkgZm9yIGd1ZXN0IHRvIGNvbnRyb2wgb2ZmbG9hZHMgKGFzIGVuYWJsZWQgYnkK
Pj4+IFZJUlRJT19ORVRfRl9DVFJMX0dVRVNUX09GRkxPQURTKSBpcyBieSBzZW5kaW5nIGNvbW1h
bmRzCj4+PiB0aHJvdWdoIENUUkxfVlEuIFNvIGl0IGRvZXMgbm90IG1ha2Ugc2Vuc2UgdG8KPj4+
IGFja25vd2xlZGdlIFZJUlRJT19ORVRfRl9DVFJMX0dVRVNUX09GRkxPQURTIHdpdGhvdXQKPj4+
IFZJUlRJT19ORVRfRl9DVFJMX1ZRLgo+Pj4KPj4+IFRoZSBzcGVjIGRvZXMgbm90IG91dGxhdyBk
ZXZpY2VzIHdpdGggc3VjaCBhIGNvbmZpZ3VyYXRpb24sIHNvIHdlIGhhdmUKPj4+IHRvIHN1cHBv
cnQgaXQuIFNpbXBseSBjbGVhciBWSVJUSU9fTkVUX0ZfQ1RSTF9HVUVTVF9PRkZMT0FEUy4KPj4+
IE5vdGUgdGhhdCBMaW51eCBpcyBzdGlsbCBjcmFzaGluZyBpZiBpdCB0cmllcyB0bwo+Pj4gY2hh
bmdlIHRoZSBvZmZsb2FkcyB3aGVuIHRoZXJlJ3Mgbm8gY29udHJvbCB2cS4KPj4+IFRoYXQgbmVl
ZHMgdG8gYmUgZml4ZWQgYnkgYW5vdGhlciBwYXRjaC4KPj4+Cj4+PiBSZXBvcnRlZC1ieTogQWxp
c3RhaXIgRGVsdmEgPGFkZWx2YUBnb29nbGUuY29tPgo+Pj4gUmVwb3J0ZWQtYnk6IFdpbGxlbSBk
ZSBCcnVpam4gPHdpbGxlbWRlYnJ1aWpuLmtlcm5lbEBnbWFpbC5jb20+Cj4+PiBGaXhlczogM2Y5
MzUyMmZmYWIyICgidmlydGlvLW5ldDogc3dpdGNoIG9mZiBvZmZsb2FkcyBvbiBkZW1hbmQgaWYg
cG9zc2libGUgb24gWERQIHNldCIpCj4+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFMuIFRzaXJr
aW4gPG1zdEByZWRoYXQuY29tPgo+Pj4gLS0tCj4+Pgo+Pj4gU2FtZSBwYXRjaCBhcyB2MSBidXQg
dXBkYXRlIGRvY3VtZW50YXRpb24gc28gaXQncyBjbGVhciBpdCdzIG5vdAo+Pj4gZW5vdWdoIHRv
IGZpeCB0aGUgY3Jhc2guCj4+Pgo+Pj4gICAgZHJpdmVycy9uZXQvdmlydGlvX25ldC5jIHwgOSAr
KysrKysrKysKPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKPj4+Cj4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jIGIvZHJpdmVycy9uZXQvdmlydGlv
X25ldC5jCj4+PiBpbmRleCA0ZDdkNTQzNGNjNWQuLjdiODgwNWI0N2YwZCAxMDA2NDQKPj4+IC0t
LSBhL2RyaXZlcnMvbmV0L3ZpcnRpb19uZXQuYwo+Pj4gKysrIGIvZHJpdmVycy9uZXQvdmlydGlv
X25ldC5jCj4+PiBAQCAtMjk3MSw2ICsyOTcxLDE1IEBAIHN0YXRpYyBpbnQgdmlydG5ldF92YWxp
ZGF0ZShzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldikKPj4+ICAgIAlpZiAoIXZpcnRuZXRfdmFs
aWRhdGVfZmVhdHVyZXModmRldikpCj4+PiAgICAJCXJldHVybiAtRUlOVkFMOwo+Pj4gKwkvKiBW
SVJUSU9fTkVUX0ZfQ1RSTF9HVUVTVF9PRkZMT0FEUyBkb2VzIG5vdCB3b3JrIHdpdGhvdXQKPj4+
ICsJICogVklSVElPX05FVF9GX0NUUkxfVlEuIFVuZm9ydHVuYXRlbHkgc3BlYyBmb3Jnb3QgdG8K
Pj4+ICsJICogc3BlY2lmeSB0aGF0IFZJUlRJT19ORVRfRl9DVFJMX0dVRVNUX09GRkxPQURTIGRl
cGVuZHMKPj4+ICsJICogb24gVklSVElPX05FVF9GX0NUUkxfVlEgc28gZGV2aWNlcyBjYW4gc2V0
IHRoZSBsYXRlciBidXQKPj4+ICsJICogbm90IHRoZSBmb3JtZXIuCj4+PiArCSAqLwo+Pj4gKwlp
ZiAoIXZpcnRpb19oYXNfZmVhdHVyZSh2ZGV2LCBWSVJUSU9fTkVUX0ZfQ1RSTF9WUSkpCj4+PiAr
CQkJX192aXJ0aW9fY2xlYXJfYml0KHZkZXYsIFZJUlRJT19ORVRfRl9DVFJMX0dVRVNUX09GRkxP
QURTKTsKPj4KPj4gSWYgaXQncyBqdXN0IGJlY2F1c2UgYSBidWcgb2Ygc3BlYywgc2hvdWxkIHdl
IHNpbXBseSBmaXggdGhlIGJ1ZyBhbmQgZmFpbAo+PiB0aGUgbmVnb3RpYXRpb24gaW4gdmlydG5l
dF92YWxpZGF0ZV9mZWF0dXJlKCk/Cj4gT25lIG1hbidzIGJ1ZyBpcyBhbm90aGVyIG1hbidzIGZl
YXR1cmU6IGFyZ3VhYmx5IGxlYXZpbmcgdGhlIGZlYXR1cmVzCj4gaW5kZXBlbmRlbnQgaW4gdGhl
IHNwZWMgbWlnaHQgYWxsb3cgcmV1c2Ugb2YgdGhlIGZlYXR1cmUgYml0IHdpdGhvdXQKPiBicmVh
a2luZyBndWVzdHMuCj4KPiBBbmQgZXZlbiBpZiB3ZSBzYXkgaXQncyBhIGJ1ZyB3ZSBjYW4ndCBz
aW1wbHkgZml4IHRoZSBidWcgaW4gdGhlCj4gc3BlYzogY2hhbmdpbmcgdGhlIHRleHQgZm9yIGEg
ZnV0dXJlIHZlcnNpb24gZG9lcyBub3QgY2hhbmdlIHRoZSBmYWN0Cj4gdGhhdCBkZXZpY2VzIGJl
aGF2aW5nIGFjY29yZGluZyB0byB0aGUgc3BlYyBleGlzdC4KPgo+PiBPdGhlcndpc2UgdGhlcmUg
d291bGQgYmUgaW5jb25zaXN0ZW5jeSBpbiBoYW5kbGluZyBmZWF0dXJlIGRlcGVuZGVuY2llcyBm
b3IKPj4gY3RybCB2cS4KPj4KPj4gVGhhbmtzCj4gVGhhdCdzIGEgY29zbWV0aWMgcHJvYmxlbSBB
VE0uIEl0IG1pZ2h0IGJlIGEgZ29vZCBpZGVhIHRvIGdlbmVyYWxseQo+IGNoYW5nZSBvdXIgaGFu
ZGxpbmcgb2YgZGVwZW5kZW5jaWVzLCBhbmQgY2xlYXIgZmVhdHVyZSBiaXRzIGluc3RlYWQgb2YK
PiBmYWlsaW5nIHByb2JlIG9uIGEgbWlzbWF0Y2guCgoKU29tZXRoaW5nIGxpa2UgSSBwcm9wb3Nl
ZCBpbiB0aGUgcGFzdCA/IFsxXQoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3BhdGNod29y
ay9wYXRjaC81MTkwNzQvCgoKPiAgIEl0J3Mgd29ydGggdGhpbmtpbmcgIC0gYXQgdGhlIHNwZWMg
bGV2ZWwgLQo+IGhvdyB3ZSBjYW4gYmVzdCBtYWtlIHRoZSBjb25maWd1cmF0aW9uIGV4dGVuc2li
bGUuCj4gQnV0IHRoYXQncyBub3Qgc29tZXRoaW5nIHNwZWMgc2hvdWxkIHdvcnJ5IGFib3V0Lgo+
Cj4KPj4+ICsKPj4+ICAgIAlpZiAodmlydGlvX2hhc19mZWF0dXJlKHZkZXYsIFZJUlRJT19ORVRf
Rl9NVFUpKSB7Cj4+PiAgICAJCWludCBtdHUgPSB2aXJ0aW9fY3JlYWQxNih2ZGV2LAo+Pj4gICAg
CQkJCQkgb2Zmc2V0b2Yoc3RydWN0IHZpcnRpb19uZXRfY29uZmlnLAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBs
aXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
