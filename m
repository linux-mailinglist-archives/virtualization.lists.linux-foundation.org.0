Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F2A1AD788
	for <lists.virtualization@lfdr.de>; Fri, 17 Apr 2020 09:37:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 023B820526;
	Fri, 17 Apr 2020 07:37:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gqYCRtGuIjjf; Fri, 17 Apr 2020 07:37:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 379BC20413;
	Fri, 17 Apr 2020 07:37:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19E97C1D8D;
	Fri, 17 Apr 2020 07:37:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6E779C0172
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 07:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5AAF2862EC
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 07:37:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1SUbXdi35F3b
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 07:37:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0F0D2862C1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 07:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587109031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jaBkf60z6Ucgd4MtXh8B5Z8TuNHfL0rGLFOOLfFygBo=;
 b=eTKyP+NXMG3bpX2Nv6S0dWcQ1PBTD3IwZdmQ0zx/pZQ8M0fIk35IZSVbK5DAvbMWxSRqOc
 9W3HYDdlDdlFJkKarYbx9HtxNvZT5w01ZmJK/gVSYdxXHRAXBRhs9oMPfoQQMhHyzuzAS1
 c6zAqR2ZS40hk9BahZvx5OL3gAPo62k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-Oz42WgarOu2KCxpJlj-H3w-1; Fri, 17 Apr 2020 03:37:05 -0400
X-MC-Unique: Oz42WgarOu2KCxpJlj-H3w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 932298017F6;
 Fri, 17 Apr 2020 07:37:02 +0000 (UTC)
Received: from [10.72.13.202] (ovpn-13-202.pek2.redhat.com [10.72.13.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D94860BE0;
 Fri, 17 Apr 2020 07:36:53 +0000 (UTC)
Subject: Re: [PATCH V2] vhost: do not enable VHOST_MENU by default
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200415024356.23751-1-jasowang@redhat.com>
 <20200416185426-mutt-send-email-mst@kernel.org>
 <b7e2deb7-cb64-b625-aeb4-760c7b28c0c8@redhat.com>
 <20200417022929-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <4274625d-6feb-81b6-5b0a-695229e7c33d@redhat.com>
Date: Fri, 17 Apr 2020 15:36:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200417022929-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjAvNC8xNyDkuIvljYgyOjMzLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
RnJpLCBBcHIgMTcsIDIwMjAgYXQgMTE6MTI6MTRBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAyMC80LzE3IOS4iuWNiDY6NTUsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+
IE9uIFdlZCwgQXByIDE1LCAyMDIwIGF0IDEwOjQzOjU2QU0gKzA4MDAsIEphc29uIFdhbmcgd3Jv
dGU6Cj4+Pj4gV2UgdHJ5IHRvIGtlZXAgdGhlIGRlZmNvbmZpZyB1bnRvdWNoZWQgYWZ0ZXIgZGVj
b3VwbGluZyBDT05GSUdfVkhPU1QKPj4+PiBvdXQgb2YgQ09ORklHX1ZJUlRVQUxJWkFUSU9OIGlu
IGNvbW1pdCAyMGMzODRmMWVhMWEKPj4+PiAoInZob3N0OiByZWZpbmUgdmhvc3QgYW5kIHZyaW5n
aCBrY29uZmlnIikgYnkgZW5hYmxpbmcgVkhPU1RfTUVOVSBieQo+Pj4+IGRlZmF1bHQuIFRoZW4g
dGhlIGRlZmNvbmZpZ3MgY2FuIGtlZXAgZW5hYmxpbmcgQ09ORklHX1ZIT1NUX05FVAo+Pj4+IHdp
dGhvdXQgdGhlIGNhcmluZyBvZiBDT05GSUdfVkhPU1QuCj4+Pj4KPj4+PiBCdXQgdGhpcyB3aWxs
IGxlYXZlIGEgIkNPTkZJR19WSE9TVF9NRU5VPXkiIGluIGFsbCBkZWZjb25maWdzIGFuZCBldmVu
Cj4+Pj4gZm9yIHRoZSBvbmVzIHRoYXQgZG9lc24ndCB3YW50IHZob3N0LiBTbyBpdCBhY3R1YWxs
eSBzaGlmdHMgdGhlCj4+Pj4gYnVyZGVucyB0byB0aGUgbWFpbnRhaW5lcnMgb2YgYWxsIG90aGVy
IHRvIGFkZCAiQ09ORklHX1ZIT1NUX01FTlUgaXMKPj4+PiBub3Qgc2V0Ii4gU28gdGhpcyBwYXRj
aCB0cmllcyB0byBlbmFibGUgQ09ORklHX1ZIT1NUIGV4cGxpY2l0bHkgaW4KPj4+PiBkZWZjb25m
aWdzIHRoYXQgZW5hYmxlcyBDT05GSUdfVkhPU1RfTkVUIGFuZCBDT05GSUdfVkhPU1RfVlNPQ0su
Cj4+Pj4KPj4+PiBBY2tlZC1ieTogQ2hyaXN0aWFuIEJvcm50cmFlZ2VyPGJvcm50cmFlZ2VyQGRl
LmlibS5jb20+ICAoczM5MCkKPj4+PiBBY2tlZC1ieTogTWljaGFlbCBFbGxlcm1hbjxtcGVAZWxs
ZXJtYW4uaWQuYXU+ICAocG93ZXJwYykKPj4+PiBDYzogVGhvbWFzIEJvZ2VuZG9lcmZlcjx0c2Jv
Z2VuZEBhbHBoYS5mcmFua2VuLmRlPgo+Pj4+IENjOiBCZW5qYW1pbiBIZXJyZW5zY2htaWR0PGJl
bmhAa2VybmVsLmNyYXNoaW5nLm9yZz4KPj4+PiBDYzogUGF1bCBNYWNrZXJyYXM8cGF1bHVzQHNh
bWJhLm9yZz4KPj4+PiBDYzogTWljaGFlbCBFbGxlcm1hbjxtcGVAZWxsZXJtYW4uaWQuYXU+Cj4+
Pj4gQ2M6IEhlaWtvIENhcnN0ZW5zPGhlaWtvLmNhcnN0ZW5zQGRlLmlibS5jb20+Cj4+Pj4gQ2M6
IFZhc2lseSBHb3JiaWs8Z29yQGxpbnV4LmlibS5jb20+Cj4+Pj4gQ2M6IENocmlzdGlhbiBCb3Ju
dHJhZWdlcjxib3JudHJhZWdlckBkZS5pYm0uY29tPgo+Pj4+IFJlcG9ydGVkLWJ5OiBHZWVydCBV
eXR0ZXJob2V2ZW48Z2VlcnRAbGludXgtbTY4ay5vcmc+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSmFz
b24gV2FuZzxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+Pj4gSSByZWJhc2VkIHRoaXMgb24gdG9wIG9m
IE9BQkkgZml4IHNpbmNlIHRoYXQKPj4+IHNlZW1zIG1vcmUgb3JnZW50IHRvIGZpeC4KPj4+IFB1
c2hlZCB0byBteSB2aG9zdCBicmFuY2ggcGxzIHRha2UgYSBsb29rIGFuZAo+Pj4gaWYgcG9zc2li
bGUgdGVzdC4KPj4+IFRoYW5rcyEKPj4KPj4gSSB0ZXN0IHRoaXMgcGF0Y2ggYnkgZ2VuZXJhdGlu
ZyB0aGUgZGVmY29uZmlncyB0aGF0IHdhbnRzIHZob3N0X25ldCBvcgo+PiB2aG9zdF92c29jay4g
QWxsIGxvb2tzIGZpbmUuCj4+Cj4+IEJ1dCBoYXZpbmcgQ09ORklHX1ZIT1NUX0RQTj15IG1heSBl
bmQgdXAgd2l0aCB0aGUgc2ltaWxhciBzaXR1YXRpb24gdGhhdAo+PiB0aGlzIHBhdGNoIHdhbnQg
dG8gYWRkcmVzcy4KPj4gTWF5YmUgd2UgY2FuIGxldCBDT05GSUdfVkhPU1QgZGVwZW5kcyBvbiAh
QVJNIHx8IEFFQUJJIHRoZW4gYWRkIGFub3RoZXIKPj4gbWVudWNvbmZpZyBmb3IgVkhPU1RfUklO
RyBhbmQgZG8gc29tZXRoaW5nIHNpbWlsYXI/Cj4+Cj4+IFRoYW5rcwo+IFNvcnJ5IEkgZG9uJ3Qg
dW5kZXJzdGFuZC4gQWZ0ZXIgdGhpcyBwYXRjaCBDT05GSUdfVkhPU1RfRFBOIGlzIGp1c3QKPiBh
biBpbnRlcm5hbCB2YXJpYWJsZSBmb3IgdGhlIE9BQkkgZml4LiBJIGtlcHQgaXQgc2VwYXJhdGUK
PiBzbyBpdCdzIGVhc3kgdG8gcmV2ZXJ0IGZvciA1LjguIFllcyB3ZSBjb3VsZCBzcXVhc2ggaXQg
aW50bwo+IFZIT1NUIGRpcmVjdGx5IGJ1dCBJIGRvbid0IHNlZSBob3cgdGhhdCBjaGFuZ2VzIGxv
Z2ljIGF0IGFsbC4KCgpTb3JyeSBmb3IgYmVpbmcgdW5jbGVhci4KCkkgbWVhbnQgc2luY2UgaXQg
d2FzIGVuYWJsZWQgYnkgZGVmYXVsdCwgIkNPTkZJR19WSE9TVF9EUE49eSIgd2lsbCBiZSAKbGVm
dCBpbiB0aGUgZGVmY29uZmlncy4gVGhpcyByZXF1aXJlcyB0aGUgYXJjaCBtYWludGFpbmVycyB0
byBhZGQgCiJDT05GSUdfVkhPU1RfVkRQTiBpcyBub3Qgc2V0Ii4gKEdlZXJ0IGNvbXBsYWlucyBh
Ym91dCB0aGlzKQoKVGhhbmtzCgoKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9u
QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9u
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
