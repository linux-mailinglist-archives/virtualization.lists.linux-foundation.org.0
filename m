Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6224723CA6A
	for <lists.virtualization@lfdr.de>; Wed,  5 Aug 2020 14:06:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9755486DEA;
	Wed,  5 Aug 2020 12:06:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Dtx3ZdFc813; Wed,  5 Aug 2020 12:06:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2CCAE86F1B;
	Wed,  5 Aug 2020 12:06:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1736BC004C;
	Wed,  5 Aug 2020 12:06:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38E4DC004C
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 12:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 26D8486F1B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 12:06:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EoiosI6qOsZx
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 12:06:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1D6D186DEA
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 12:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596629193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Wdsv5NGZyVonagnzh6lv+hK8JZ33+nOyMh4yKpcewg=;
 b=FeF3QLb4/zDD0Nn3QJuvBZM69hkgdp0RiQ9IRS/WbEyJH4Mk5Uukv4nME+E7bT7fKI00qz
 W/Yatln9YK6lddltt4SI3AvvMI7MyFhBBPdfBkAzpESjKDmDWCzkMDdiYxQcO3JIt5Qaik
 sBn4xEvUJsXnTGtpVQS4g4C3QZ43nrA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-9yymm2qjPJqR-rO7wBs26Q-1; Wed, 05 Aug 2020 08:06:32 -0400
X-MC-Unique: 9yymm2qjPJqR-rO7wBs26Q-1
Received: by mail-wr1-f69.google.com with SMTP id j2so10936994wrr.14
 for <virtualization@lists.linux-foundation.org>;
 Wed, 05 Aug 2020 05:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6Wdsv5NGZyVonagnzh6lv+hK8JZ33+nOyMh4yKpcewg=;
 b=tW/E/qqLEkNyoRailmpLS8D7Mr4fDprVs/l3aUo2UJ6h9iondSLQ2109CpL8H2A3LR
 v38/4biwmRlEZJSj/QpM5494P0IxYdDZHApM9/Pa+3fFOREgfrya0609DAe/qx22dpvx
 XS1kiZfoG1X9JTjA2YJPerU0E7ciwtoda0JO+PUJ/MxH3CCnWoS70ew7HE7YQdTGXIVA
 2OwMQ/QTkjSOYRTkoXfLfCsmjbgdak0OTwdC0MbgZwe3tVOHNKMcCwOJ5Nc4zUGqcANe
 t8Gp8AzP6ABsiJmHzLj6EUavX8aeeIlMwJg2555WezwtZFKY74pe6oXIzG2LaRpGzRWh
 aJYA==
X-Gm-Message-State: AOAM533LARCs2e7YKtKXuyw3Fmt0vwHKWVfnkBmks8ciZ+DGS71RiqOI
 zXWRR/M/PuNa26zekUa1bPW/quP+Fnrh9eyipxJWnUUhFvXCRzmrrnKUTV5pZl3wQPFSSxP/ZR8
 kEzq9EPvyQtNpzINc6Rjqmz6KAJshpo+qE/TYi/UqsA==
X-Received: by 2002:a5d:5383:: with SMTP id d3mr2542596wrv.42.1596629190864;
 Wed, 05 Aug 2020 05:06:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZuhkjYyykrKtOumF/F3YP5RrGgyXQ0BRm0Jfqs17/ihVgE1clIPp9LTPQCR4244U4NhuYQw==
X-Received: by 2002:a5d:5383:: with SMTP id d3mr2542578wrv.42.1596629190605;
 Wed, 05 Aug 2020 05:06:30 -0700 (PDT)
Received: from redhat.com (bzq-79-178-123-8.red.bezeqint.net. [79.178.123.8])
 by smtp.gmail.com with ESMTPSA id
 h7sm2543166wmf.43.2020.08.05.05.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 05:06:29 -0700 (PDT)
Date: Wed, 5 Aug 2020 08:06:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v2 22/24] vdpa_sim: fix endian-ness of config space
Message-ID: <20200805080434-mutt-send-email-mst@kernel.org>
References: <20200803205814.540410-1-mst@redhat.com>
 <20200803205814.540410-23-mst@redhat.com>
 <dd24f2e6-4aef-4a26-374c-2349fe1e6a66@redhat.com>
MIME-Version: 1.0
In-Reply-To: <dd24f2e6-4aef-4a26-374c-2349fe1e6a66@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

T24gV2VkLCBBdWcgMDUsIDIwMjAgYXQgMDI6MjE6MDdQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzgvNCDkuIrljYg1OjAwLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6
Cj4gPiBWRFBBIHNpbSBhY2Nlc3NlcyBjb25maWcgc3BhY2UgYXMgbmF0aXZlIGVuZGlhbiAtIHRo
aXMgaXMKPiA+IHdyb25nIHNpbmNlIGl0J3MgYSBtb2Rlcm4gZGV2aWNlIGFuZCBhY3R1YWxseSB1
c2VzIExFLgo+ID4gCj4gPiBJdCBvbmx5IHN1cHBvcnRzIG1vZGVybiBndWVzdHMgc28gd2UgY291
bGQgcHVudCBhbmQKPiA+IGp1c3QgZm9yY2UgTEUsIGJ1dCBsZXQncyB1c2UgdGhlIGZ1bGwgdmly
dGlvIEFQSXMgc2luY2UgcGVvcGxlCj4gPiB0ZW5kIHRvIGNvcHkvcGFzdGUgY29kZSwgYW5kIHRo
aXMgaXMgbm90IGRhdGEgcGF0aCBhbnl3YXkuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE1pY2hh
ZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+Cj4gPiAtLS0KPiA+ICAgZHJpdmVycy92ZHBh
L3ZkcGFfc2ltL3ZkcGFfc2ltLmMgfCAzMSArKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0t
Cj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+
ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZHBhL3ZkcGFfc2ltL3ZkcGFfc2ltLmMgYi9k
cml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW0uYwo+ID4gaW5kZXggYTliYzVlMGZiMzUzLi5m
YTA1ZTA2NWZmNjkgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9z
aW0uYwo+ID4gKysrIGIvZHJpdmVycy92ZHBhL3ZkcGFfc2ltL3ZkcGFfc2ltLmMKPiA+IEBAIC0y
NCw2ICsyNCw3IEBACj4gPiAgICNpbmNsdWRlIDxsaW51eC9ldGhlcmRldmljZS5oPgo+ID4gICAj
aW5jbHVkZSA8bGludXgvdnJpbmdoLmg+Cj4gPiAgICNpbmNsdWRlIDxsaW51eC92ZHBhLmg+Cj4g
PiArI2luY2x1ZGUgPGxpbnV4L3ZpcnRpb19ieXRlb3JkZXIuaD4KPiA+ICAgI2luY2x1ZGUgPGxp
bnV4L3Zob3N0X2lvdGxiLmg+Cj4gPiAgICNpbmNsdWRlIDx1YXBpL2xpbnV4L3ZpcnRpb19jb25m
aWcuaD4KPiA+ICAgI2luY2x1ZGUgPHVhcGkvbGludXgvdmlydGlvX25ldC5oPgo+ID4gQEAgLTcy
LDYgKzczLDIzIEBAIHN0cnVjdCB2ZHBhc2ltIHsKPiA+ICAgCXU2NCBmZWF0dXJlczsKPiA+ICAg
fTsKPiA+ICsvKiBUT0RPOiBjcm9zcy1lbmRpYW4gc3VwcG9ydCAqLwo+ID4gK3N0YXRpYyBpbmxp
bmUgYm9vbCB2ZHBhc2ltX2lzX2xpdHRsZV9lbmRpYW4oc3RydWN0IHZkcGFzaW0gKnZkcGFzaW0p
Cj4gPiArewo+ID4gKwlyZXR1cm4gdmlydGlvX2xlZ2FjeV9pc19saXR0bGVfZW5kaWFuKCkgfHwK
PiA+ICsJCSh2ZHBhc2ltLT5mZWF0dXJlcyAmICgxVUxMIDw8IFZJUlRJT19GX1ZFUlNJT05fMSkp
Owo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgaW5saW5lIHUxNiB2ZHBhc2ltMTZfdG9fY3B1KHN0
cnVjdCB2ZHBhc2ltICp2ZHBhc2ltLCBfX3ZpcnRpbzE2IHZhbCkKPiA+ICt7Cj4gPiArCXJldHVy
biBfX3ZpcnRpbzE2X3RvX2NwdSh2ZHBhc2ltX2lzX2xpdHRsZV9lbmRpYW4odmRwYXNpbSksIHZh
bCk7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBpbmxpbmUgX192aXJ0aW8xNiBjcHVfdG9fdmRw
YXNpbTE2KHN0cnVjdCB2ZHBhc2ltICp2ZHBhc2ltLCB1MTYgdmFsKQo+ID4gK3sKPiA+ICsJcmV0
dXJuIF9fY3B1X3RvX3ZpcnRpbzE2KHZkcGFzaW1faXNfbGl0dGxlX2VuZGlhbih2ZHBhc2ltKSwg
dmFsKTsKPiA+ICt9Cj4gPiArCj4gPiAgIHN0YXRpYyBzdHJ1Y3QgdmRwYXNpbSAqdmRwYXNpbV9k
ZXY7Cj4gPiAgIHN0YXRpYyBzdHJ1Y3QgdmRwYXNpbSAqdmRwYV90b19zaW0oc3RydWN0IHZkcGFf
ZGV2aWNlICp2ZHBhKQo+ID4gQEAgLTMwNiw3ICszMjQsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IHZkcGFfY29uZmlnX29wcyB2ZHBhc2ltX25ldF9jb25maWdfb3BzOwo+ID4gICBzdGF0aWMgc3Ry
dWN0IHZkcGFzaW0gKnZkcGFzaW1fY3JlYXRlKHZvaWQpCj4gPiAgIHsKPiA+IC0Jc3RydWN0IHZp
cnRpb19uZXRfY29uZmlnICpjb25maWc7Cj4gPiAgIAlzdHJ1Y3QgdmRwYXNpbSAqdmRwYXNpbTsK
PiA+ICAgCXN0cnVjdCBkZXZpY2UgKmRldjsKPiA+ICAgCWludCByZXQgPSAtRU5PTUVNOwo+ID4g
QEAgLTMzMSwxMCArMzQ4LDcgQEAgc3RhdGljIHN0cnVjdCB2ZHBhc2ltICp2ZHBhc2ltX2NyZWF0
ZSh2b2lkKQo+ID4gICAJaWYgKCF2ZHBhc2ltLT5idWZmZXIpCj4gPiAgIAkJZ290byBlcnJfaW9t
bXU7Cj4gPiAtCWNvbmZpZyA9ICZ2ZHBhc2ltLT5jb25maWc7Cj4gPiAtCWNvbmZpZy0+bXR1ID0g
MTUwMDsKPiA+IC0JY29uZmlnLT5zdGF0dXMgPSBWSVJUSU9fTkVUX1NfTElOS19VUDsKPiA+IC0J
ZXRoX3JhbmRvbV9hZGRyKGNvbmZpZy0+bWFjKTsKPiA+ICsJZXRoX3JhbmRvbV9hZGRyKHZkcGFz
aW0tPmNvbmZpZy5tYWMpOwo+ID4gICAJdnJpbmdoX3NldF9pb3RsYigmdmRwYXNpbS0+dnFzWzBd
LnZyaW5nLCB2ZHBhc2ltLT5pb21tdSk7Cj4gPiAgIAl2cmluZ2hfc2V0X2lvdGxiKCZ2ZHBhc2lt
LT52cXNbMV0udnJpbmcsIHZkcGFzaW0tPmlvbW11KTsKPiA+IEBAIC00NDgsNiArNDYyLDcgQEAg
c3RhdGljIHU2NCB2ZHBhc2ltX2dldF9mZWF0dXJlcyhzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkcGEp
Cj4gPiAgIHN0YXRpYyBpbnQgdmRwYXNpbV9zZXRfZmVhdHVyZXMoc3RydWN0IHZkcGFfZGV2aWNl
ICp2ZHBhLCB1NjQgZmVhdHVyZXMpCj4gPiAgIHsKPiA+ICAgCXN0cnVjdCB2ZHBhc2ltICp2ZHBh
c2ltID0gdmRwYV90b19zaW0odmRwYSk7Cj4gPiArCXN0cnVjdCB2aXJ0aW9fbmV0X2NvbmZpZyAq
Y29uZmlnID0gJnZkcGFzaW0tPmNvbmZpZzsKPiA+ICAgCS8qIERNQSBtYXBwaW5nIG11c3QgYmUg
ZG9uZSBieSBkcml2ZXIgKi8KPiA+ICAgCWlmICghKGZlYXR1cmVzICYgKDFVTEwgPDwgVklSVElP
X0ZfQUNDRVNTX1BMQVRGT1JNKSkpCj4gPiBAQCAtNDU1LDYgKzQ3MCwxMiBAQCBzdGF0aWMgaW50
IHZkcGFzaW1fc2V0X2ZlYXR1cmVzKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRwYSwgdTY0IGZlYXR1
cmVzKQo+ID4gICAJdmRwYXNpbS0+ZmVhdHVyZXMgPSBmZWF0dXJlcyAmIHZkcGFzaW1fZmVhdHVy
ZXM7Cj4gPiArCS8qIFdlIG9ubHkga25vdyB3aGV0aGVyIGd1ZXN0IGlzIHVzaW5nIHRoZSBsZWdh
Y3kgaW50ZXJmYWNlIGhlcmUsIHNvCj4gPiArCSAqIHRoYXQncyB0aGUgZWFybGllc3Qgd2UgY2Fu
IHNldCBjb25maWcgZmllbGRzLgo+ID4gKwkgKi8KPiAKPiAKPiBXZSBjaGVjayB3aGV0aGVyIG9y
IG5vdCBBQ0NFU1NfUExBVEZPUk0gaXMgc2V0IGJlZm9yZSB3aGljaCBpcyBwcm9iYWJseSBhCj4g
aGludCB0aGF0IG9ubHkgbW9kZXJuIGRldmljZSBpcyBzdXBwb3J0ZWQuIFNvIEkgd29uZGVyIGp1
c3QgZm9yY2UgTEUgYW5kCj4gZmFpbCBpZiBWRVJTSU9OXzEgaXMgbm90IHNldCBpcyBiZXR0ZXI/
Cj4gCj4gVGhhbmtzCgpTbyBob3cgYWJvdXQgSSBhZGQgYSBjb21tZW50IGFsb25nIHRoZSBsaW5l
cyBvZgoKLyoKICogdmRwYXNpbSBBVE0gcmVxdWlyZXMgVklSVElPX0ZfQUNDRVNTX1BMQVRGT1JN
LCBzbyB3ZSBkb24ndCBuZWVkIHRvCiAqIHN1cHBvcnQgbGVnYWN5IGd1ZXN0cy4gS2VlcCB0cmFu
c2l0aW9uYWwgZGV2aWNlIGNvZGUgYXJvdW5kIGZvcgogKiB0aGUgYmVuZWZpdCBvZiBwZW9wbGUg
d2hvIG1pZ2h0IGNvcHktYW5kLXBhc3RlIHRoaXMgaW50byB0cmFuc2l0aW9uYWwKICogZGV2aWNl
IGNvZGUuCiAqLwoKCj4gCj4gPiArCj4gPiArCWNvbmZpZy0+bXR1ID0gY3B1X3RvX3ZkcGFzaW0x
Nih2ZHBhc2ltLCAxNTAwKTsKPiA+ICsJY29uZmlnLT5zdGF0dXMgPSBjcHVfdG9fdmRwYXNpbTE2
KHZkcGFzaW0sIFZJUlRJT19ORVRfU19MSU5LX1VQKTsKPiA+ICAgCXJldHVybiAwOwo+ID4gICB9
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFs
aXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlv
bi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8v
dmlydHVhbGl6YXRpb24=
