Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id F262D131258
	for <lists.virtualization@lfdr.de>; Mon,  6 Jan 2020 13:55:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8AA5785F57;
	Mon,  6 Jan 2020 12:55:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uw2-UpVTZidB; Mon,  6 Jan 2020 12:55:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 03A2785FD5;
	Mon,  6 Jan 2020 12:55:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C99E2C0881;
	Mon,  6 Jan 2020 12:55:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 87DA1C0881
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jan 2020 12:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 707F485F57
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jan 2020 12:55:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aArbKf-DUwTS
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jan 2020 12:55:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 803AF85F41
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jan 2020 12:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578315303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yhPHPLkCZ8lM3SxpsRZPADXb9w62jCJdaNx5uMlL9bE=;
 b=QHn6AfftDHhWcBp2kDvR84wpn4l4ojc/ocHtsdI2sLz4tkJaUlcV+Zah2y9chwy6Ig5UBw
 3kR3aVpSLjnyw2IFhBxaZFk6IgBav64z5g2m6oD+9UQ5YbwnR4+YHh0C1GBS2uyUyrYHym
 8cA3Nqi8miel9u4IeEGg2VQUy7qqcC8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-D9FAO12mOri2HUp4ipkNvQ-1; Mon, 06 Jan 2020 07:54:59 -0500
Received: by mail-qv1-f71.google.com with SMTP id di5so18248422qvb.3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Jan 2020 04:54:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=yhPHPLkCZ8lM3SxpsRZPADXb9w62jCJdaNx5uMlL9bE=;
 b=UfREI576y8zns5Bt0DzI/DLRy3WYJd39Bsl2jWg/S59E8wYN79Eo6yNoEUbIp+8eul
 +VW4u9wWePNdImQJSf5X35hldmghkno3AF9Won2nIXRbgLCdnb+MPDMlacKo7DUGI3Oj
 oDMGXbleu/eVm6QlakmGN8JNC2wvHqfwcquhGv472Z0vcLZ+wm2MyrCikgN+e7Hkgxmz
 ie03STsa8Rf5EBNRfdX/rA+YPahcIlUwCzJCqAb0J1EhbE0WpMQDAsh4LHzb/Sw2lub4
 J85D4Ihcee1VfNL+rOmI+/fKVzrSmvoQ6KYC2jAg95fYLvtuJ0VSltm61hNJiZF5Qn+b
 ZnQw==
X-Gm-Message-State: APjAAAU6AiSufcTjMipYKXn1dGy22KHB2GyoIw3noV1bzZmi9Vw6hZLM
 IAIujgn5nV3azBRP3UBsQuxwfg2kkm9jKCIHYragARuSbGITlHmrBYFM1b2WLUwnB+0A4ZJ9GZD
 WbeGAtItWXDnhJNF1ieUDaO68oUSeAmGR+OlWhg42Fw==
X-Received: by 2002:ae9:c018:: with SMTP id u24mr82140920qkk.339.1578315299359; 
 Mon, 06 Jan 2020 04:54:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqxDXcUxpr3THHQDy0ezxTflLL2W1afkjCl20F4fSV1ea/2dz+3q8ot7JpP826jzMXK+20FIoA==
X-Received: by 2002:ae9:c018:: with SMTP id u24mr82140903qkk.339.1578315299104; 
 Mon, 06 Jan 2020 04:54:59 -0800 (PST)
Received: from redhat.com (bzq-79-183-34-164.red.bezeqint.net. [79.183.34.164])
 by smtp.gmail.com with ESMTPSA id c3sm20686592qkk.8.2020.01.06.04.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 04:54:58 -0800 (PST)
Date: Mon, 6 Jan 2020 07:54:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v2] virtio_net: CTRL_GUEST_OFFLOADS depends on CTRL_VQ
Message-ID: <20200106074426-mutt-send-email-mst@kernel.org>
References: <20200105132120.92370-1-mst@redhat.com>
 <2d7053b5-295c-4051-a722-7656350bdb74@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2d7053b5-295c-4051-a722-7656350bdb74@redhat.com>
X-MC-Unique: D9FAO12mOri2HUp4ipkNvQ-1
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

T24gTW9uLCBKYW4gMDYsIDIwMjAgYXQgMTA6NDc6MzVBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzEvNSDkuIvljYg5OjIyLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6
Cj4gPiBUaGUgb25seSB3YXkgZm9yIGd1ZXN0IHRvIGNvbnRyb2wgb2ZmbG9hZHMgKGFzIGVuYWJs
ZWQgYnkKPiA+IFZJUlRJT19ORVRfRl9DVFJMX0dVRVNUX09GRkxPQURTKSBpcyBieSBzZW5kaW5n
IGNvbW1hbmRzCj4gPiB0aHJvdWdoIENUUkxfVlEuIFNvIGl0IGRvZXMgbm90IG1ha2Ugc2Vuc2Ug
dG8KPiA+IGFja25vd2xlZGdlIFZJUlRJT19ORVRfRl9DVFJMX0dVRVNUX09GRkxPQURTIHdpdGhv
dXQKPiA+IFZJUlRJT19ORVRfRl9DVFJMX1ZRLgo+ID4gCj4gPiBUaGUgc3BlYyBkb2VzIG5vdCBv
dXRsYXcgZGV2aWNlcyB3aXRoIHN1Y2ggYSBjb25maWd1cmF0aW9uLCBzbyB3ZSBoYXZlCj4gPiB0
byBzdXBwb3J0IGl0LiBTaW1wbHkgY2xlYXIgVklSVElPX05FVF9GX0NUUkxfR1VFU1RfT0ZGTE9B
RFMuCj4gPiBOb3RlIHRoYXQgTGludXggaXMgc3RpbGwgY3Jhc2hpbmcgaWYgaXQgdHJpZXMgdG8K
PiA+IGNoYW5nZSB0aGUgb2ZmbG9hZHMgd2hlbiB0aGVyZSdzIG5vIGNvbnRyb2wgdnEuCj4gPiBU
aGF0IG5lZWRzIHRvIGJlIGZpeGVkIGJ5IGFub3RoZXIgcGF0Y2guCj4gPiAKPiA+IFJlcG9ydGVk
LWJ5OiBBbGlzdGFpciBEZWx2YSA8YWRlbHZhQGdvb2dsZS5jb20+Cj4gPiBSZXBvcnRlZC1ieTog
V2lsbGVtIGRlIEJydWlqbiA8d2lsbGVtZGVicnVpam4ua2VybmVsQGdtYWlsLmNvbT4KPiA+IEZp
eGVzOiAzZjkzNTIyZmZhYjIgKCJ2aXJ0aW8tbmV0OiBzd2l0Y2ggb2ZmIG9mZmxvYWRzIG9uIGRl
bWFuZCBpZiBwb3NzaWJsZSBvbiBYRFAgc2V0IikKPiA+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwg
Uy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+Cj4gPiAtLS0KPiA+IAo+ID4gU2FtZSBwYXRjaCBh
cyB2MSBidXQgdXBkYXRlIGRvY3VtZW50YXRpb24gc28gaXQncyBjbGVhciBpdCdzIG5vdAo+ID4g
ZW5vdWdoIHRvIGZpeCB0aGUgY3Jhc2guCj4gPiAKPiA+ICAgZHJpdmVycy9uZXQvdmlydGlvX25l
dC5jIHwgOSArKysrKysrKysKPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQo+
ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jIGIvZHJpdmVycy9u
ZXQvdmlydGlvX25ldC5jCj4gPiBpbmRleCA0ZDdkNTQzNGNjNWQuLjdiODgwNWI0N2YwZCAxMDA2
NDQKPiA+IC0tLSBhL2RyaXZlcnMvbmV0L3ZpcnRpb19uZXQuYwo+ID4gKysrIGIvZHJpdmVycy9u
ZXQvdmlydGlvX25ldC5jCj4gPiBAQCAtMjk3MSw2ICsyOTcxLDE1IEBAIHN0YXRpYyBpbnQgdmly
dG5ldF92YWxpZGF0ZShzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldikKPiA+ICAgCWlmICghdmly
dG5ldF92YWxpZGF0ZV9mZWF0dXJlcyh2ZGV2KSkKPiA+ICAgCQlyZXR1cm4gLUVJTlZBTDsKPiA+
ICsJLyogVklSVElPX05FVF9GX0NUUkxfR1VFU1RfT0ZGTE9BRFMgZG9lcyBub3Qgd29yayB3aXRo
b3V0Cj4gPiArCSAqIFZJUlRJT19ORVRfRl9DVFJMX1ZRLiBVbmZvcnR1bmF0ZWx5IHNwZWMgZm9y
Z290IHRvCj4gPiArCSAqIHNwZWNpZnkgdGhhdCBWSVJUSU9fTkVUX0ZfQ1RSTF9HVUVTVF9PRkZM
T0FEUyBkZXBlbmRzCj4gPiArCSAqIG9uIFZJUlRJT19ORVRfRl9DVFJMX1ZRIHNvIGRldmljZXMg
Y2FuIHNldCB0aGUgbGF0ZXIgYnV0Cj4gPiArCSAqIG5vdCB0aGUgZm9ybWVyLgo+ID4gKwkgKi8K
PiA+ICsJaWYgKCF2aXJ0aW9faGFzX2ZlYXR1cmUodmRldiwgVklSVElPX05FVF9GX0NUUkxfVlEp
KQo+ID4gKwkJCV9fdmlydGlvX2NsZWFyX2JpdCh2ZGV2LCBWSVJUSU9fTkVUX0ZfQ1RSTF9HVUVT
VF9PRkZMT0FEUyk7Cj4gCj4gCj4gSWYgaXQncyBqdXN0IGJlY2F1c2UgYSBidWcgb2Ygc3BlYywg
c2hvdWxkIHdlIHNpbXBseSBmaXggdGhlIGJ1ZyBhbmQgZmFpbAo+IHRoZSBuZWdvdGlhdGlvbiBp
biB2aXJ0bmV0X3ZhbGlkYXRlX2ZlYXR1cmUoKT8KCk9uZSBtYW4ncyBidWcgaXMgYW5vdGhlciBt
YW4ncyBmZWF0dXJlOiBhcmd1YWJseSBsZWF2aW5nIHRoZSBmZWF0dXJlcwppbmRlcGVuZGVudCBp
biB0aGUgc3BlYyBtaWdodCBhbGxvdyByZXVzZSBvZiB0aGUgZmVhdHVyZSBiaXQgd2l0aG91dApi
cmVha2luZyBndWVzdHMuCgpBbmQgZXZlbiBpZiB3ZSBzYXkgaXQncyBhIGJ1ZyB3ZSBjYW4ndCBz
aW1wbHkgZml4IHRoZSBidWcgaW4gdGhlCnNwZWM6IGNoYW5naW5nIHRoZSB0ZXh0IGZvciBhIGZ1
dHVyZSB2ZXJzaW9uIGRvZXMgbm90IGNoYW5nZSB0aGUgZmFjdAp0aGF0IGRldmljZXMgYmVoYXZp
bmcgYWNjb3JkaW5nIHRvIHRoZSBzcGVjIGV4aXN0LgoKPiBPdGhlcndpc2UgdGhlcmUgd291bGQg
YmUgaW5jb25zaXN0ZW5jeSBpbiBoYW5kbGluZyBmZWF0dXJlIGRlcGVuZGVuY2llcyBmb3IKPiBj
dHJsIHZxLgo+IAo+IFRoYW5rcwoKVGhhdCdzIGEgY29zbWV0aWMgcHJvYmxlbSBBVE0uIEl0IG1p
Z2h0IGJlIGEgZ29vZCBpZGVhIHRvIGdlbmVyYWxseQpjaGFuZ2Ugb3VyIGhhbmRsaW5nIG9mIGRl
cGVuZGVuY2llcywgYW5kIGNsZWFyIGZlYXR1cmUgYml0cyBpbnN0ZWFkIG9mCmZhaWxpbmcgcHJv
YmUgb24gYSBtaXNtYXRjaC4gSXQncyB3b3J0aCB0aGlua2luZyAgLSBhdCB0aGUgc3BlYyBsZXZl
bCAtCmhvdyB3ZSBjYW4gYmVzdCBtYWtlIHRoZSBjb25maWd1cmF0aW9uIGV4dGVuc2libGUuCkJ1
dCB0aGF0J3Mgbm90IHNvbWV0aGluZyBzcGVjIHNob3VsZCB3b3JyeSBhYm91dC4KCgo+IAo+ID4g
Kwo+ID4gICAJaWYgKHZpcnRpb19oYXNfZmVhdHVyZSh2ZGV2LCBWSVJUSU9fTkVUX0ZfTVRVKSkg
ewo+ID4gICAJCWludCBtdHUgPSB2aXJ0aW9fY3JlYWQxNih2ZGV2LAo+ID4gICAJCQkJCSBvZmZz
ZXRvZihzdHJ1Y3QgdmlydGlvX25ldF9jb25maWcsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVh
bGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
