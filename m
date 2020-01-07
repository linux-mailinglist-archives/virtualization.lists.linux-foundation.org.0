Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id F01EE132033
	for <lists.virtualization@lfdr.de>; Tue,  7 Jan 2020 08:06:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 622ED2050E;
	Tue,  7 Jan 2020 07:06:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5pCdD-ukM3eW; Tue,  7 Jan 2020 07:06:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2936F2050C;
	Tue,  7 Jan 2020 07:06:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 07F7BC0881;
	Tue,  7 Jan 2020 07:06:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 797A6C0881
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 07:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 596F8871E0
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 07:06:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VRh4Sq--RLGs
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 07:06:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4569E87196
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 07:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578380781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/efjXzZHBg1iCroxSDJqHPrwvRqUs+JXRk92V6GEKaU=;
 b=ariA9HDMw9Ty7RS2RfjA4/aK4OHCXnfomW//gIkqfVS7poJ4xzy6ZgJoW371TJviXLDF3G
 dRL3UfuyOmHattOR+/CsJfaUhV6E57HaIxFQTJhupFAz++b+tORNTZZimHAUKQB1SP9e1F
 MRYUhVPAhIBiRJMon62AjQS3taPc4e0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-kGO0QmjiNumHT4znhO7aaQ-1; Tue, 07 Jan 2020 02:06:19 -0500
Received: by mail-qk1-f198.google.com with SMTP id l7so16494198qke.8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Jan 2020 23:06:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/efjXzZHBg1iCroxSDJqHPrwvRqUs+JXRk92V6GEKaU=;
 b=raeyzMAwyUzgRMjCacH0jv8aAl5YpFY+rVE5yRRrjPpdOGY4QMzdItfUDAdwOjGj0z
 gxnRi5z5XJUG1RC9jxDBhgGFafdJHF0qTg0OeYsXKAELT2Ukc0qCmDmOWxaFPlQhPde2
 qvnsZl6CzjMMXR/gbRySpGncYWyFWrlHYAcarN6SLy8T71JdJpPH8P5OnrGtU8AyLWcg
 E7Y73qdnlELIbp/laZ02+EE5MJPW0z5gVahzCodSrr5L7AyIFvfrNzrQoxVNr4A8B79s
 qUGp3yXcAn2dXKd/gGp6R/t+UjlFYPkZvksvrJyprw407vbCtiv4PWjJyTrIRreFT+Iv
 OT+A==
X-Gm-Message-State: APjAAAXL1lb4O64dWiow4e9baQesO/4YM2FH4Q8w1YGw9i273ie8NmM/
 bjE0ziLcLClB4j73a0jzmyD4S7sLuIcMT6SnOGkuwrsa3IYNVYedBrxls27VvNTkrn0790g1V+v
 AStnX94gQLpOgCLVkSiaHMto67AQmnkyawrQ3+MZ6tQ==
X-Received: by 2002:ac8:709a:: with SMTP id y26mr78234902qto.304.1578380779295; 
 Mon, 06 Jan 2020 23:06:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqyK5Mb+pOAlU+KoIVfxx6YvoZ+HKotsgyRPL144jEGAH30ilnJpURC7Q9CI21MUoelMWJIJHQ==
X-Received: by 2002:ac8:709a:: with SMTP id y26mr78234888qto.304.1578380779070; 
 Mon, 06 Jan 2020 23:06:19 -0800 (PST)
Received: from redhat.com (bzq-79-183-34-164.red.bezeqint.net. [79.183.34.164])
 by smtp.gmail.com with ESMTPSA id o16sm21915243qkj.91.2020.01.06.23.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 23:06:18 -0800 (PST)
Date: Tue, 7 Jan 2020 02:06:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v2] virtio_net: CTRL_GUEST_OFFLOADS depends on CTRL_VQ
Message-ID: <20200107020303-mutt-send-email-mst@kernel.org>
References: <20200105132120.92370-1-mst@redhat.com>
 <2d7053b5-295c-4051-a722-7656350bdb74@redhat.com>
 <20200106074426-mutt-send-email-mst@kernel.org>
 <eab75b06-453d-2e17-1e77-439a66c3c86a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <eab75b06-453d-2e17-1e77-439a66c3c86a@redhat.com>
X-MC-Unique: kGO0QmjiNumHT4znhO7aaQ-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gVHVlLCBKYW4gMDcsIDIwMjAgYXQgMTA6Mjk6MDhBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzEvNiDkuIvljYg4OjU0LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6
Cj4gPiBPbiBNb24sIEphbiAwNiwgMjAyMCBhdCAxMDo0NzozNUFNICswODAwLCBKYXNvbiBXYW5n
IHdyb3RlOgo+ID4gPiBPbiAyMDIwLzEvNSDkuIvljYg5OjIyLCBNaWNoYWVsIFMuIFRzaXJraW4g
d3JvdGU6Cj4gPiA+ID4gVGhlIG9ubHkgd2F5IGZvciBndWVzdCB0byBjb250cm9sIG9mZmxvYWRz
IChhcyBlbmFibGVkIGJ5Cj4gPiA+ID4gVklSVElPX05FVF9GX0NUUkxfR1VFU1RfT0ZGTE9BRFMp
IGlzIGJ5IHNlbmRpbmcgY29tbWFuZHMKPiA+ID4gPiB0aHJvdWdoIENUUkxfVlEuIFNvIGl0IGRv
ZXMgbm90IG1ha2Ugc2Vuc2UgdG8KPiA+ID4gPiBhY2tub3dsZWRnZSBWSVJUSU9fTkVUX0ZfQ1RS
TF9HVUVTVF9PRkZMT0FEUyB3aXRob3V0Cj4gPiA+ID4gVklSVElPX05FVF9GX0NUUkxfVlEuCj4g
PiA+ID4gCj4gPiA+ID4gVGhlIHNwZWMgZG9lcyBub3Qgb3V0bGF3IGRldmljZXMgd2l0aCBzdWNo
IGEgY29uZmlndXJhdGlvbiwgc28gd2UgaGF2ZQo+ID4gPiA+IHRvIHN1cHBvcnQgaXQuIFNpbXBs
eSBjbGVhciBWSVJUSU9fTkVUX0ZfQ1RSTF9HVUVTVF9PRkZMT0FEUy4KPiA+ID4gPiBOb3RlIHRo
YXQgTGludXggaXMgc3RpbGwgY3Jhc2hpbmcgaWYgaXQgdHJpZXMgdG8KPiA+ID4gPiBjaGFuZ2Ug
dGhlIG9mZmxvYWRzIHdoZW4gdGhlcmUncyBubyBjb250cm9sIHZxLgo+ID4gPiA+IFRoYXQgbmVl
ZHMgdG8gYmUgZml4ZWQgYnkgYW5vdGhlciBwYXRjaC4KPiA+ID4gPiAKPiA+ID4gPiBSZXBvcnRl
ZC1ieTogQWxpc3RhaXIgRGVsdmEgPGFkZWx2YUBnb29nbGUuY29tPgo+ID4gPiA+IFJlcG9ydGVk
LWJ5OiBXaWxsZW0gZGUgQnJ1aWpuIDx3aWxsZW1kZWJydWlqbi5rZXJuZWxAZ21haWwuY29tPgo+
ID4gPiA+IEZpeGVzOiAzZjkzNTIyZmZhYjIgKCJ2aXJ0aW8tbmV0OiBzd2l0Y2ggb2ZmIG9mZmxv
YWRzIG9uIGRlbWFuZCBpZiBwb3NzaWJsZSBvbiBYRFAgc2V0IikKPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPgo+ID4gPiA+IC0tLQo+ID4g
PiA+IAo+ID4gPiA+IFNhbWUgcGF0Y2ggYXMgdjEgYnV0IHVwZGF0ZSBkb2N1bWVudGF0aW9uIHNv
IGl0J3MgY2xlYXIgaXQncyBub3QKPiA+ID4gPiBlbm91Z2ggdG8gZml4IHRoZSBjcmFzaC4KPiA+
ID4gPiAKPiA+ID4gPiAgICBkcml2ZXJzL25ldC92aXJ0aW9fbmV0LmMgfCA5ICsrKysrKysrKwo+
ID4gPiA+ICAgIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKPiA+ID4gPiAKPiA+ID4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jIGIvZHJpdmVycy9uZXQvdmly
dGlvX25ldC5jCj4gPiA+ID4gaW5kZXggNGQ3ZDU0MzRjYzVkLi43Yjg4MDViNDdmMGQgMTAwNjQ0
Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jCj4gPiA+ID4gKysrIGIvZHJp
dmVycy9uZXQvdmlydGlvX25ldC5jCj4gPiA+ID4gQEAgLTI5NzEsNiArMjk3MSwxNSBAQCBzdGF0
aWMgaW50IHZpcnRuZXRfdmFsaWRhdGUoc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYpCj4gPiA+
ID4gICAgCWlmICghdmlydG5ldF92YWxpZGF0ZV9mZWF0dXJlcyh2ZGV2KSkKPiA+ID4gPiAgICAJ
CXJldHVybiAtRUlOVkFMOwo+ID4gPiA+ICsJLyogVklSVElPX05FVF9GX0NUUkxfR1VFU1RfT0ZG
TE9BRFMgZG9lcyBub3Qgd29yayB3aXRob3V0Cj4gPiA+ID4gKwkgKiBWSVJUSU9fTkVUX0ZfQ1RS
TF9WUS4gVW5mb3J0dW5hdGVseSBzcGVjIGZvcmdvdCB0bwo+ID4gPiA+ICsJICogc3BlY2lmeSB0
aGF0IFZJUlRJT19ORVRfRl9DVFJMX0dVRVNUX09GRkxPQURTIGRlcGVuZHMKPiA+ID4gPiArCSAq
IG9uIFZJUlRJT19ORVRfRl9DVFJMX1ZRIHNvIGRldmljZXMgY2FuIHNldCB0aGUgbGF0ZXIgYnV0
Cj4gPiA+ID4gKwkgKiBub3QgdGhlIGZvcm1lci4KPiA+ID4gPiArCSAqLwo+ID4gPiA+ICsJaWYg
KCF2aXJ0aW9faGFzX2ZlYXR1cmUodmRldiwgVklSVElPX05FVF9GX0NUUkxfVlEpKQo+ID4gPiA+
ICsJCQlfX3ZpcnRpb19jbGVhcl9iaXQodmRldiwgVklSVElPX05FVF9GX0NUUkxfR1VFU1RfT0ZG
TE9BRFMpOwo+ID4gPiAKPiA+ID4gSWYgaXQncyBqdXN0IGJlY2F1c2UgYSBidWcgb2Ygc3BlYywg
c2hvdWxkIHdlIHNpbXBseSBmaXggdGhlIGJ1ZyBhbmQgZmFpbAo+ID4gPiB0aGUgbmVnb3RpYXRp
b24gaW4gdmlydG5ldF92YWxpZGF0ZV9mZWF0dXJlKCk/Cj4gPiBPbmUgbWFuJ3MgYnVnIGlzIGFu
b3RoZXIgbWFuJ3MgZmVhdHVyZTogYXJndWFibHkgbGVhdmluZyB0aGUgZmVhdHVyZXMKPiA+IGlu
ZGVwZW5kZW50IGluIHRoZSBzcGVjIG1pZ2h0IGFsbG93IHJldXNlIG9mIHRoZSBmZWF0dXJlIGJp
dCB3aXRob3V0Cj4gPiBicmVha2luZyBndWVzdHMuCj4gPiAKPiA+IEFuZCBldmVuIGlmIHdlIHNh
eSBpdCdzIGEgYnVnIHdlIGNhbid0IHNpbXBseSBmaXggdGhlIGJ1ZyBpbiB0aGUKPiA+IHNwZWM6
IGNoYW5naW5nIHRoZSB0ZXh0IGZvciBhIGZ1dHVyZSB2ZXJzaW9uIGRvZXMgbm90IGNoYW5nZSB0
aGUgZmFjdAo+ID4gdGhhdCBkZXZpY2VzIGJlaGF2aW5nIGFjY29yZGluZyB0byB0aGUgc3BlYyBl
eGlzdC4KPiA+IAo+ID4gPiBPdGhlcndpc2UgdGhlcmUgd291bGQgYmUgaW5jb25zaXN0ZW5jeSBp
biBoYW5kbGluZyBmZWF0dXJlIGRlcGVuZGVuY2llcyBmb3IKPiA+ID4gY3RybCB2cS4KPiA+ID4g
Cj4gPiA+IFRoYW5rcwo+ID4gVGhhdCdzIGEgY29zbWV0aWMgcHJvYmxlbSBBVE0uIEl0IG1pZ2h0
IGJlIGEgZ29vZCBpZGVhIHRvIGdlbmVyYWxseQo+ID4gY2hhbmdlIG91ciBoYW5kbGluZyBvZiBk
ZXBlbmRlbmNpZXMsIGFuZCBjbGVhciBmZWF0dXJlIGJpdHMgaW5zdGVhZCBvZgo+ID4gZmFpbGlu
ZyBwcm9iZSBvbiBhIG1pc21hdGNoLgo+IAo+IAo+IFNvbWV0aGluZyBsaWtlIEkgcHJvcG9zZWQg
aW4gdGhlIHBhc3QgPyBbMV0KPiAKPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0Y2h3
b3JrL3BhdGNoLzUxOTA3NC8KCgpObyB0aGF0IHN0aWxsIGZhaWxzIHByb2JlLgoKSSBhbSBhc2tp
bmcgd2hldGhlciBpdCdzIG1vcmUgZnV0dXJlIHByb29mIHRvIGZhaWwgcHJvYmUKb24gZmVhdHVy
ZSBjb21iaW5hdGlvbnMgZGlzYWxsb3dlZCBieSBzcGVjLCBvciB0byBjbGVhciBiaXRzCnRvIGdl
dCB0byBhbiBleHBlY3RlZCBjb21iaW5hdGlvbi4KCkluIGFueSBjYXNlLCB3ZSBzaG91bGQgcHJv
YmFibHkgZG9jdW1lbnQgaW4gdGhlIHNwZWMgaG93CmRyaXZlcnMgYmVoYXZlIG9uIHN1Y2ggY29t
YmluYXRpb25zLgoKCj4gCj4gPiAgIEl0J3Mgd29ydGggdGhpbmtpbmcgIC0gYXQgdGhlIHNwZWMg
bGV2ZWwgLQo+ID4gaG93IHdlIGNhbiBiZXN0IG1ha2UgdGhlIGNvbmZpZ3VyYXRpb24gZXh0ZW5z
aWJsZS4KPiA+IEJ1dCB0aGF0J3Mgbm90IHNvbWV0aGluZyBzcGVjIHNob3VsZCB3b3JyeSBhYm91
dC4KPiA+IAo+ID4gCj4gPiA+ID4gKwo+ID4gPiA+ICAgIAlpZiAodmlydGlvX2hhc19mZWF0dXJl
KHZkZXYsIFZJUlRJT19ORVRfRl9NVFUpKSB7Cj4gPiA+ID4gICAgCQlpbnQgbXR1ID0gdmlydGlv
X2NyZWFkMTYodmRldiwKPiA+ID4gPiAgICAJCQkJCSBvZmZzZXRvZihzdHJ1Y3QgdmlydGlvX25l
dF9jb25maWcsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgt
Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4v
bGlzdGluZm8vdmlydHVhbGl6YXRpb24=
