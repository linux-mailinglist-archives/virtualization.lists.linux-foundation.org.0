Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1791C1AD8C7
	for <lists.virtualization@lfdr.de>; Fri, 17 Apr 2020 10:40:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7A86E20243;
	Fri, 17 Apr 2020 08:40:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TkVVP+FEDIpr; Fri, 17 Apr 2020 08:40:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1F5C120104;
	Fri, 17 Apr 2020 08:40:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0D8A2C0172;
	Fri, 17 Apr 2020 08:40:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 19489C0172
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 08:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1520C86199
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 08:40:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xZ1-iSjWtFPF
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 08:40:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A7BA5860EF
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 08:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587112805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0FUsH4tufAJaMC98c0oFTGbfyRpyKw0gpf2wi60SU+8=;
 b=JpYAGBWMOBKA7ScThz0V9X4NcKKxgpodgzzWm62AJcrTFFt8PJ7QzKKVoX7yDxmjWK4LnX
 Ya5IoHvtfKpNZd4YpVIZcXwqgzwmoXR2QUCKGlrXme8+4B97Owkx7ZpYvx7qb+6W+/3HJF
 /bJ3BHXIP1LQuy5FmGAkO0pbO9MT8CA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-wDRv0H_YMDq_MOxphoyW1g-1; Fri, 17 Apr 2020 04:40:01 -0400
X-MC-Unique: wDRv0H_YMDq_MOxphoyW1g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B23A107ACC4;
 Fri, 17 Apr 2020 08:39:59 +0000 (UTC)
Received: from [10.72.13.202] (ovpn-13-202.pek2.redhat.com [10.72.13.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54BCA8D57F;
 Fri, 17 Apr 2020 08:39:50 +0000 (UTC)
Subject: Re: [PATCH V2] vhost: do not enable VHOST_MENU by default
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200415024356.23751-1-jasowang@redhat.com>
 <20200416185426-mutt-send-email-mst@kernel.org>
 <b7e2deb7-cb64-b625-aeb4-760c7b28c0c8@redhat.com>
 <20200417022929-mutt-send-email-mst@kernel.org>
 <4274625d-6feb-81b6-5b0a-695229e7c33d@redhat.com>
 <20200417042912-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <fdb555a6-4b8d-15b6-0849-3fe0e0786038@redhat.com>
Date: Fri, 17 Apr 2020 16:39:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200417042912-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

Ck9uIDIwMjAvNC8xNyDkuIvljYg0OjI5LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
RnJpLCBBcHIgMTcsIDIwMjAgYXQgMDM6MzY6NTJQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAyMC80LzE3IOS4i+WNiDI6MzMsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+
IE9uIEZyaSwgQXByIDE3LCAyMDIwIGF0IDExOjEyOjE0QU0gKzA4MDAsIEphc29uIFdhbmcgd3Jv
dGU6Cj4+Pj4gT24gMjAyMC80LzE3IOS4iuWNiDY6NTUsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90
ZToKPj4+Pj4gT24gV2VkLCBBcHIgMTUsIDIwMjAgYXQgMTA6NDM6NTZBTSArMDgwMCwgSmFzb24g
V2FuZyB3cm90ZToKPj4+Pj4+IFdlIHRyeSB0byBrZWVwIHRoZSBkZWZjb25maWcgdW50b3VjaGVk
IGFmdGVyIGRlY291cGxpbmcgQ09ORklHX1ZIT1NUCj4+Pj4+PiBvdXQgb2YgQ09ORklHX1ZJUlRV
QUxJWkFUSU9OIGluIGNvbW1pdCAyMGMzODRmMWVhMWEKPj4+Pj4+ICgidmhvc3Q6IHJlZmluZSB2
aG9zdCBhbmQgdnJpbmdoIGtjb25maWciKSBieSBlbmFibGluZyBWSE9TVF9NRU5VIGJ5Cj4+Pj4+
PiBkZWZhdWx0LiBUaGVuIHRoZSBkZWZjb25maWdzIGNhbiBrZWVwIGVuYWJsaW5nIENPTkZJR19W
SE9TVF9ORVQKPj4+Pj4+IHdpdGhvdXQgdGhlIGNhcmluZyBvZiBDT05GSUdfVkhPU1QuCj4+Pj4+
Pgo+Pj4+Pj4gQnV0IHRoaXMgd2lsbCBsZWF2ZSBhICJDT05GSUdfVkhPU1RfTUVOVT15IiBpbiBh
bGwgZGVmY29uZmlncyBhbmQgZXZlbgo+Pj4+Pj4gZm9yIHRoZSBvbmVzIHRoYXQgZG9lc24ndCB3
YW50IHZob3N0LiBTbyBpdCBhY3R1YWxseSBzaGlmdHMgdGhlCj4+Pj4+PiBidXJkZW5zIHRvIHRo
ZSBtYWludGFpbmVycyBvZiBhbGwgb3RoZXIgdG8gYWRkICJDT05GSUdfVkhPU1RfTUVOVSBpcwo+
Pj4+Pj4gbm90IHNldCIuIFNvIHRoaXMgcGF0Y2ggdHJpZXMgdG8gZW5hYmxlIENPTkZJR19WSE9T
VCBleHBsaWNpdGx5IGluCj4+Pj4+PiBkZWZjb25maWdzIHRoYXQgZW5hYmxlcyBDT05GSUdfVkhP
U1RfTkVUIGFuZCBDT05GSUdfVkhPU1RfVlNPQ0suCj4+Pj4+Pgo+Pj4+Pj4gQWNrZWQtYnk6IENo
cmlzdGlhbiBCb3JudHJhZWdlcjxib3JudHJhZWdlckBkZS5pYm0uY29tPiAgKHMzOTApCj4+Pj4+
PiBBY2tlZC1ieTogTWljaGFlbCBFbGxlcm1hbjxtcGVAZWxsZXJtYW4uaWQuYXU+ICAocG93ZXJw
YykKPj4+Pj4+IENjOiBUaG9tYXMgQm9nZW5kb2VyZmVyPHRzYm9nZW5kQGFscGhhLmZyYW5rZW4u
ZGU+Cj4+Pj4+PiBDYzogQmVuamFtaW4gSGVycmVuc2NobWlkdDxiZW5oQGtlcm5lbC5jcmFzaGlu
Zy5vcmc+Cj4+Pj4+PiBDYzogUGF1bCBNYWNrZXJyYXM8cGF1bHVzQHNhbWJhLm9yZz4KPj4+Pj4+
IENjOiBNaWNoYWVsIEVsbGVybWFuPG1wZUBlbGxlcm1hbi5pZC5hdT4KPj4+Pj4+IENjOiBIZWlr
byBDYXJzdGVuczxoZWlrby5jYXJzdGVuc0BkZS5pYm0uY29tPgo+Pj4+Pj4gQ2M6IFZhc2lseSBH
b3JiaWs8Z29yQGxpbnV4LmlibS5jb20+Cj4+Pj4+PiBDYzogQ2hyaXN0aWFuIEJvcm50cmFlZ2Vy
PGJvcm50cmFlZ2VyQGRlLmlibS5jb20+Cj4+Pj4+PiBSZXBvcnRlZC1ieTogR2VlcnQgVXl0dGVy
aG9ldmVuPGdlZXJ0QGxpbnV4LW02OGsub3JnPgo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogSmFzb24g
V2FuZzxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+Pj4+PiBJIHJlYmFzZWQgdGhpcyBvbiB0b3Agb2Yg
T0FCSSBmaXggc2luY2UgdGhhdAo+Pj4+PiBzZWVtcyBtb3JlIG9yZ2VudCB0byBmaXguCj4+Pj4+
IFB1c2hlZCB0byBteSB2aG9zdCBicmFuY2ggcGxzIHRha2UgYSBsb29rIGFuZAo+Pj4+PiBpZiBw
b3NzaWJsZSB0ZXN0Lgo+Pj4+PiBUaGFua3MhCj4+Pj4gSSB0ZXN0IHRoaXMgcGF0Y2ggYnkgZ2Vu
ZXJhdGluZyB0aGUgZGVmY29uZmlncyB0aGF0IHdhbnRzIHZob3N0X25ldCBvcgo+Pj4+IHZob3N0
X3Zzb2NrLiBBbGwgbG9va3MgZmluZS4KPj4+Pgo+Pj4+IEJ1dCBoYXZpbmcgQ09ORklHX1ZIT1NU
X0RQTj15IG1heSBlbmQgdXAgd2l0aCB0aGUgc2ltaWxhciBzaXR1YXRpb24gdGhhdAo+Pj4+IHRo
aXMgcGF0Y2ggd2FudCB0byBhZGRyZXNzLgo+Pj4+IE1heWJlIHdlIGNhbiBsZXQgQ09ORklHX1ZI
T1NUIGRlcGVuZHMgb24gIUFSTSB8fCBBRUFCSSB0aGVuIGFkZCBhbm90aGVyCj4+Pj4gbWVudWNv
bmZpZyBmb3IgVkhPU1RfUklORyBhbmQgZG8gc29tZXRoaW5nIHNpbWlsYXI/Cj4+Pj4KPj4+PiBU
aGFua3MKPj4+IFNvcnJ5IEkgZG9uJ3QgdW5kZXJzdGFuZC4gQWZ0ZXIgdGhpcyBwYXRjaCBDT05G
SUdfVkhPU1RfRFBOIGlzIGp1c3QKPj4+IGFuIGludGVybmFsIHZhcmlhYmxlIGZvciB0aGUgT0FC
SSBmaXguIEkga2VwdCBpdCBzZXBhcmF0ZQo+Pj4gc28gaXQncyBlYXN5IHRvIHJldmVydCBmb3Ig
NS44LiBZZXMgd2UgY291bGQgc3F1YXNoIGl0IGludG8KPj4+IFZIT1NUIGRpcmVjdGx5IGJ1dCBJ
IGRvbid0IHNlZSBob3cgdGhhdCBjaGFuZ2VzIGxvZ2ljIGF0IGFsbC4KPj4KPj4gU29ycnkgZm9y
IGJlaW5nIHVuY2xlYXIuCj4+Cj4+IEkgbWVhbnQgc2luY2UgaXQgd2FzIGVuYWJsZWQgYnkgZGVm
YXVsdCwgIkNPTkZJR19WSE9TVF9EUE49eSIgd2lsbCBiZSBsZWZ0Cj4+IGluIHRoZSBkZWZjb25m
aWdzLgo+IEJ1dCB3aG8gY2FyZXM/CgoKRllJLCBwbGVhc2Ugc2VlIGh0dHBzOi8vd3d3LnNwaW5p
Y3MubmV0L2xpc3RzL2t2bS9tc2cyMTI2ODUuaHRtbAoKCj4gVGhhdCBkb2VzIG5vdCBhZGQgYW55
IGNvZGUsIGRvZXMgaXQ/CgoKSXQgZG9lc24ndC4KClRoYW5rcwoKCj4KPj4gVGhpcyByZXF1aXJl
cyB0aGUgYXJjaCBtYWludGFpbmVycyB0byBhZGQKPj4gIkNPTkZJR19WSE9TVF9WRFBOIGlzIG5v
dCBzZXQiLiAoR2VlcnQgY29tcGxhaW5zIGFib3V0IHRoaXMpCj4+Cj4+IFRoYW5rcwo+Pgo+PgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6
YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24u
b3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3Zp
cnR1YWxpemF0aW9u
