Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD221AD8DD
	for <lists.virtualization@lfdr.de>; Fri, 17 Apr 2020 10:46:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C8B6588170;
	Fri, 17 Apr 2020 08:46:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yCevxOwvRGzp; Fri, 17 Apr 2020 08:46:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2075286C3A;
	Fri, 17 Apr 2020 08:46:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EC871C0172;
	Fri, 17 Apr 2020 08:46:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0B58EC0172
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 08:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id F2A4586C3A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 08:46:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ENsL5CyF-c94
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 08:46:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1BC3485C6F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 08:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587113178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wE/WARZLg+d1WCxCwrHkOlSrWaAPnJuSBoxihd1UamI=;
 b=Seu/Ct5P5l77DWdgC1LVRK6gmIPyTR6oIto3nL0MqQrJg0ie0oEEGJgGc7cCHlhHx0/e4v
 mmiMe3gjbfA8R8FCOOR94zhXAVO6KSDPlxKgMBVOubG4GApqFLBiumRIo1GyALxcSftNEg
 xynTp/Su1pkh+kMcfBOfrOG+9EqS4ak=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-Aa66WpLHN6mPpk50sjcaFQ-1; Fri, 17 Apr 2020 04:46:15 -0400
X-MC-Unique: Aa66WpLHN6mPpk50sjcaFQ-1
Received: by mail-wr1-f69.google.com with SMTP id u4so651210wrm.13
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 01:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wE/WARZLg+d1WCxCwrHkOlSrWaAPnJuSBoxihd1UamI=;
 b=of1ziCithqarRWfN/fpm8219wKf/extnk+Swjquvusil/iCzxl2USgQ5TR+xPFu92R
 RstyTn3al/gFtgc7so9oSYw/UmOBg426KsUPFGGcmyIe3sZ61p2pJqBRGWCgt4YUrfAX
 xWp30rW+2trgv/QmE70Rooytxonsiye+dI2UrswbW35Qp7GVCOAhjaYABEkZt//C6wmz
 nNWvz9QLMWUGlsX/TGw6eq57n53HI170K0EsCzxPrCZh95vmxavWDuN3zKWNhDf85IkD
 GjLQYoYsA6I9VIpAN7bAChSPusQEL0d8GSpLfJSE9clbl0Jx/oWTqDG29Gk5BDSWX+mn
 Zpkw==
X-Gm-Message-State: AGi0PubDTJ4tub2pymzi+K7a7v5NKrn2OGWIKiwkS8acwmYB1USHeQyk
 kdWiJEMidj1jvuSiQaJ2imjpcMHKE1D2a8TYphBcs5cJfoDD6BzsfDi/aShTtIfHYe7uWcog8dI
 p2UN4O/2qpz4tlS3QO8CknUCQpP8dIvTe+mjpp2qzTg==
X-Received: by 2002:a1c:3b0a:: with SMTP id i10mr2207022wma.26.1587113173864; 
 Fri, 17 Apr 2020 01:46:13 -0700 (PDT)
X-Google-Smtp-Source: APiQypL7wwVAY2VUk1Sf/olefVQONEzwVRmuwANF/2eIBwUJQiUqpjYTnQ3meLl2WX6+2mTArW0sHw==
X-Received: by 2002:a1c:3b0a:: with SMTP id i10mr2206989wma.26.1587113173640; 
 Fri, 17 Apr 2020 01:46:13 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id l5sm31065502wrm.66.2020.04.17.01.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 01:46:13 -0700 (PDT)
Date: Fri, 17 Apr 2020 04:46:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2] vhost: do not enable VHOST_MENU by default
Message-ID: <20200417044230-mutt-send-email-mst@kernel.org>
References: <20200415024356.23751-1-jasowang@redhat.com>
 <20200416185426-mutt-send-email-mst@kernel.org>
 <b7e2deb7-cb64-b625-aeb4-760c7b28c0c8@redhat.com>
 <20200417022929-mutt-send-email-mst@kernel.org>
 <4274625d-6feb-81b6-5b0a-695229e7c33d@redhat.com>
 <20200417042912-mutt-send-email-mst@kernel.org>
 <fdb555a6-4b8d-15b6-0849-3fe0e0786038@redhat.com>
MIME-Version: 1.0
In-Reply-To: <fdb555a6-4b8d-15b6-0849-3fe0e0786038@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-s390@vger.kernel.org, tsbogend@alpha.franken.de,
 benh@kernel.crashing.org, gor@linux.ibm.com, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, heiko.carstens@de.ibm.com,
 linux-mips@vger.kernel.org, virtualization@lists.linux-foundation.org,
 borntraeger@de.ibm.com, geert@linux-m68k.org,
 Michael Ellerman <mpe@ellerman.id.au>, netdev@vger.kernel.org,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org
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

T24gRnJpLCBBcHIgMTcsIDIwMjAgYXQgMDQ6Mzk6NDlQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzQvMTcg5LiL5Y2INDoyOSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gRnJpLCBBcHIgMTcsIDIwMjAgYXQgMDM6MzY6NTJQTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPiA+ID4gT24gMjAyMC80LzE3IOS4i+WNiDI6MzMsIE1pY2hhZWwgUy4gVHNpcmtp
biB3cm90ZToKPiA+ID4gPiBPbiBGcmksIEFwciAxNywgMjAyMCBhdCAxMToxMjoxNEFNICswODAw
LCBKYXNvbiBXYW5nIHdyb3RlOgo+ID4gPiA+ID4gT24gMjAyMC80LzE3IOS4iuWNiDY6NTUsIE1p
Y2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiA+ID4gPiA+ID4gT24gV2VkLCBBcHIgMTUsIDIwMjAg
YXQgMTA6NDM6NTZBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPiA+ID4gPiA+ID4gPiBXZSB0
cnkgdG8ga2VlcCB0aGUgZGVmY29uZmlnIHVudG91Y2hlZCBhZnRlciBkZWNvdXBsaW5nIENPTkZJ
R19WSE9TVAo+ID4gPiA+ID4gPiA+IG91dCBvZiBDT05GSUdfVklSVFVBTElaQVRJT04gaW4gY29t
bWl0IDIwYzM4NGYxZWExYQo+ID4gPiA+ID4gPiA+ICgidmhvc3Q6IHJlZmluZSB2aG9zdCBhbmQg
dnJpbmdoIGtjb25maWciKSBieSBlbmFibGluZyBWSE9TVF9NRU5VIGJ5Cj4gPiA+ID4gPiA+ID4g
ZGVmYXVsdC4gVGhlbiB0aGUgZGVmY29uZmlncyBjYW4ga2VlcCBlbmFibGluZyBDT05GSUdfVkhP
U1RfTkVUCj4gPiA+ID4gPiA+ID4gd2l0aG91dCB0aGUgY2FyaW5nIG9mIENPTkZJR19WSE9TVC4K
PiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBCdXQgdGhpcyB3aWxsIGxlYXZlIGEgIkNPTkZJ
R19WSE9TVF9NRU5VPXkiIGluIGFsbCBkZWZjb25maWdzIGFuZCBldmVuCj4gPiA+ID4gPiA+ID4g
Zm9yIHRoZSBvbmVzIHRoYXQgZG9lc24ndCB3YW50IHZob3N0LiBTbyBpdCBhY3R1YWxseSBzaGlm
dHMgdGhlCj4gPiA+ID4gPiA+ID4gYnVyZGVucyB0byB0aGUgbWFpbnRhaW5lcnMgb2YgYWxsIG90
aGVyIHRvIGFkZCAiQ09ORklHX1ZIT1NUX01FTlUgaXMKPiA+ID4gPiA+ID4gPiBub3Qgc2V0Ii4g
U28gdGhpcyBwYXRjaCB0cmllcyB0byBlbmFibGUgQ09ORklHX1ZIT1NUIGV4cGxpY2l0bHkgaW4K
PiA+ID4gPiA+ID4gPiBkZWZjb25maWdzIHRoYXQgZW5hYmxlcyBDT05GSUdfVkhPU1RfTkVUIGFu
ZCBDT05GSUdfVkhPU1RfVlNPQ0suCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gQWNrZWQt
Ynk6IENocmlzdGlhbiBCb3JudHJhZWdlcjxib3JudHJhZWdlckBkZS5pYm0uY29tPiAgKHMzOTAp
Cj4gPiA+ID4gPiA+ID4gQWNrZWQtYnk6IE1pY2hhZWwgRWxsZXJtYW48bXBlQGVsbGVybWFuLmlk
LmF1PiAgKHBvd2VycGMpCj4gPiA+ID4gPiA+ID4gQ2M6IFRob21hcyBCb2dlbmRvZXJmZXI8dHNi
b2dlbmRAYWxwaGEuZnJhbmtlbi5kZT4KPiA+ID4gPiA+ID4gPiBDYzogQmVuamFtaW4gSGVycmVu
c2NobWlkdDxiZW5oQGtlcm5lbC5jcmFzaGluZy5vcmc+Cj4gPiA+ID4gPiA+ID4gQ2M6IFBhdWwg
TWFja2VycmFzPHBhdWx1c0BzYW1iYS5vcmc+Cj4gPiA+ID4gPiA+ID4gQ2M6IE1pY2hhZWwgRWxs
ZXJtYW48bXBlQGVsbGVybWFuLmlkLmF1Pgo+ID4gPiA+ID4gPiA+IENjOiBIZWlrbyBDYXJzdGVu
czxoZWlrby5jYXJzdGVuc0BkZS5pYm0uY29tPgo+ID4gPiA+ID4gPiA+IENjOiBWYXNpbHkgR29y
YmlrPGdvckBsaW51eC5pYm0uY29tPgo+ID4gPiA+ID4gPiA+IENjOiBDaHJpc3RpYW4gQm9ybnRy
YWVnZXI8Ym9ybnRyYWVnZXJAZGUuaWJtLmNvbT4KPiA+ID4gPiA+ID4gPiBSZXBvcnRlZC1ieTog
R2VlcnQgVXl0dGVyaG9ldmVuPGdlZXJ0QGxpbnV4LW02OGsub3JnPgo+ID4gPiA+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IEphc29uIFdhbmc8amFzb3dhbmdAcmVkaGF0LmNvbT4KPiA+ID4gPiA+ID4g
SSByZWJhc2VkIHRoaXMgb24gdG9wIG9mIE9BQkkgZml4IHNpbmNlIHRoYXQKPiA+ID4gPiA+ID4g
c2VlbXMgbW9yZSBvcmdlbnQgdG8gZml4Lgo+ID4gPiA+ID4gPiBQdXNoZWQgdG8gbXkgdmhvc3Qg
YnJhbmNoIHBscyB0YWtlIGEgbG9vayBhbmQKPiA+ID4gPiA+ID4gaWYgcG9zc2libGUgdGVzdC4K
PiA+ID4gPiA+ID4gVGhhbmtzIQo+ID4gPiA+ID4gSSB0ZXN0IHRoaXMgcGF0Y2ggYnkgZ2VuZXJh
dGluZyB0aGUgZGVmY29uZmlncyB0aGF0IHdhbnRzIHZob3N0X25ldCBvcgo+ID4gPiA+ID4gdmhv
c3RfdnNvY2suIEFsbCBsb29rcyBmaW5lLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBCdXQgaGF2aW5n
IENPTkZJR19WSE9TVF9EUE49eSBtYXkgZW5kIHVwIHdpdGggdGhlIHNpbWlsYXIgc2l0dWF0aW9u
IHRoYXQKPiA+ID4gPiA+IHRoaXMgcGF0Y2ggd2FudCB0byBhZGRyZXNzLgo+ID4gPiA+ID4gTWF5
YmUgd2UgY2FuIGxldCBDT05GSUdfVkhPU1QgZGVwZW5kcyBvbiAhQVJNIHx8IEFFQUJJIHRoZW4g
YWRkIGFub3RoZXIKPiA+ID4gPiA+IG1lbnVjb25maWcgZm9yIFZIT1NUX1JJTkcgYW5kIGRvIHNv
bWV0aGluZyBzaW1pbGFyPwo+ID4gPiA+ID4gCj4gPiA+ID4gPiBUaGFua3MKPiA+ID4gPiBTb3Jy
eSBJIGRvbid0IHVuZGVyc3RhbmQuIEFmdGVyIHRoaXMgcGF0Y2ggQ09ORklHX1ZIT1NUX0RQTiBp
cyBqdXN0Cj4gPiA+ID4gYW4gaW50ZXJuYWwgdmFyaWFibGUgZm9yIHRoZSBPQUJJIGZpeC4gSSBr
ZXB0IGl0IHNlcGFyYXRlCj4gPiA+ID4gc28gaXQncyBlYXN5IHRvIHJldmVydCBmb3IgNS44LiBZ
ZXMgd2UgY291bGQgc3F1YXNoIGl0IGludG8KPiA+ID4gPiBWSE9TVCBkaXJlY3RseSBidXQgSSBk
b24ndCBzZWUgaG93IHRoYXQgY2hhbmdlcyBsb2dpYyBhdCBhbGwuCj4gPiA+IAo+ID4gPiBTb3Jy
eSBmb3IgYmVpbmcgdW5jbGVhci4KPiA+ID4gCj4gPiA+IEkgbWVhbnQgc2luY2UgaXQgd2FzIGVu
YWJsZWQgYnkgZGVmYXVsdCwgIkNPTkZJR19WSE9TVF9EUE49eSIgd2lsbCBiZSBsZWZ0Cj4gPiA+
IGluIHRoZSBkZWZjb25maWdzLgo+ID4gQnV0IHdobyBjYXJlcz8KPiAKPiAKPiBGWUksIHBsZWFz
ZSBzZWUgaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMva3ZtL21zZzIxMjY4NS5odG1sCgpU
aGUgY29tcGxhaW50IHdhcyBub3QgYWJvdXQgdGhlIHN5bWJvbCBJSVVDLiAgSXQgd2FzIHRoYXQg
d2UgY2F1c2VkCmV2ZXJ5b25lIHRvIGJ1aWxkIHZob3N0IHVubGVzcyB0aGV5IG1hbnVhbGx5IGRp
c2FibGVkIGl0LgoKPiAKPiA+IFRoYXQgZG9lcyBub3QgYWRkIGFueSBjb2RlLCBkb2VzIGl0Pwo+
IAo+IAo+IEl0IGRvZXNuJ3QuCj4gCj4gVGhhbmtzCj4gCj4gCj4gPiAKPiA+ID4gVGhpcyByZXF1
aXJlcyB0aGUgYXJjaCBtYWludGFpbmVycyB0byBhZGQKPiA+ID4gIkNPTkZJR19WSE9TVF9WRFBO
IGlzIG5vdCBzZXQiLiAoR2VlcnQgY29tcGxhaW5zIGFib3V0IHRoaXMpCj4gPiA+IAo+ID4gPiBU
aGFua3MKPiA+ID4gCj4gPiA+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxp
c3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
