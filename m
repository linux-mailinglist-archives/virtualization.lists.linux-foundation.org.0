Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 942A9230281
	for <lists.virtualization@lfdr.de>; Tue, 28 Jul 2020 08:19:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1DC30226E9;
	Tue, 28 Jul 2020 06:19:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UILeF305EF78; Tue, 28 Jul 2020 06:19:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 96A99204DC;
	Tue, 28 Jul 2020 06:19:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D328C004D;
	Tue, 28 Jul 2020 06:19:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D2B88C004D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 06:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BF9AC87D6E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 06:19:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zp637f-nO29Q
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 06:19:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 61EA187CD2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 06:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595917139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L19gJxjlvbSfxrLYXKkArq/ADh0RRhZZZKs2hhgA8nw=;
 b=e+ers7NUKdNNKvV7ap0HJ/O3EG/gVI+R21bGLI7bGApGvJWRs1/MHcecowSZnuxzLTA7Yb
 pUj4UJ7n7eMOUhr2OW0bzOJtt0ztimR/jcnk+KAb8VHzrltW4MWm+hjBPw5zhUbI0GZdBE
 cl60+ok1I9stspjG4cv79L7o/YxvGMg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-PcCkU7-kMquVvQ8GCS5I4Q-1; Tue, 28 Jul 2020 02:18:54 -0400
X-MC-Unique: PcCkU7-kMquVvQ8GCS5I4Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B765C106B251;
 Tue, 28 Jul 2020 06:18:34 +0000 (UTC)
Received: from [10.72.13.242] (ovpn-13-242.pek2.redhat.com [10.72.13.242])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3ABCD69719;
 Tue, 28 Jul 2020 06:18:17 +0000 (UTC)
Subject: Re: [PATCH V3 vhost next 00/10] VDPA support for Mellanox ConnectX
 devices
To: Eli Cohen <eli@mellanox.com>, mst@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20200728060539.4163-1-eli@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <1dbac14a-5909-ff0a-8e90-534847f93d50@redhat.com>
Date: Tue, 28 Jul 2020 14:18:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728060539.4163-1-eli@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: shahafs@mellanox.com, parav@mellanox.com, saeedm@mellanox.com
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

Ck9uIDIwMjAvNy8yOCDkuIvljYgyOjA1LCBFbGkgQ29oZW4gd3JvdGU6Cj4gSGkgTWljaGFlbCwK
PiBwbGVhc2Ugbm90ZSB0aGF0IHRoaXMgc2VyaWVzIGRlcGVuZHMgb24gbWx4NSBjb3JlIGRldmlj
ZSBkcml2ZXIgcGF0Y2hlcwo+IGluIG1seDUtbmV4dCBicmFuY2ggaW4KPiBnaXQ6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbWVsbGFub3gvbGludXguZ2l0Lgo+Cj4g
Z2l0IHB1bGwgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L21l
bGxhbm94L2xpbnV4LmdpdCBtbHg1LW5leHQKPgo+IFRoZXkgYWxzbyBkZXBlbmQgSmFzb24gV2Fu
ZydzIHBhdGNoZXMgc3VibWl0dGVkIGEgY291cGxlIG9mIHdlZWtzIGFnby4KPgo+IHZkcGFfc2lt
OiB1c2UgdGhlIGJhdGNoaW5nIEFQSQo+IHZob3N0LXZkcGE6IHN1cHBvcnQgYmF0Y2ggdXBkYXRp
bmcKCgpKdXN0IG5vdGljZSB0aGF0IGEgbmV3IHZlcnNpb24gaXMgcG9zdGVkWzFdICh5b3Ugd2Vy
ZSBjY2VkKS4gVGFsa2VkIHdpdGggCk1pY2hhZWwsIGFuZCBpdCdzIGJldHRlciBmb3IgeW91IHRv
IG1lcmdlIHRoZSBuZXcgdmVyc2lvbiBpbiB0aGlzIHNlcmllcy4KClNvcnJ5IGZvciBub3Qgc3Bv
dHRpbmcgdGhpcyBiZWZvcmUuCgpbMV0gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjAvNy8xLzMw
MQoKVGhhbmtzCgoKPgo+Cj4gVGhlIGZvbGxvd2luZyBzZXJpZXMgb2YgcGF0Y2hlcyBwcm92aWRl
IFZEUEEgc3VwcG9ydCBmb3IgTWVsbGFub3gKPiBkZXZpY2VzLiBUaGUgc3VwcG9ydGVkIGRldmlj
ZXMgYXJlIENvbm5lY3RYNiBEWCBhbmQgbmV3ZXIuCj4KPiBDdXJyZW50bHksIG9ubHkgYSBuZXR3
b3JrIGRyaXZlciBpcyBpbXBsZW1lbnRlZDsgZnV0dXJlIHBhdGNoZXMgd2lsbAo+IGludHJvZHVj
ZSBhIGJsb2NrIGRldmljZSBkcml2ZXIuIGlwZXJmIHBlcmZvcm1hbmNlIG9uIGEgc2luZ2xlIHF1
ZXVlIGlzCj4gYXJvdW5kIDEyIEdicHMuICBGdXR1cmUgcGF0Y2hlcyB3aWxsIGludHJvZHVjZSBt
dWx0aSBxdWV1ZSBzdXBwb3J0Lgo+Cj4gVGhlIGZpbGVzIGFyZSBvcmdhbml6ZWQgaW4gc3VjaCBh
IHdheSB0aGF0IGNvZGUgdGhhdCBjYW4gYmUgdXNlZCBieQo+IGRpZmZlcmVudCBWRFBBIGltcGxl
bWVudGF0aW9ucyB3aWxsIGJlIHBsYWNlZCBpbiBhIGNvbW1vbiBhcmUgcmVzaWRlcyBpbgo+IGRy
aXZlcnMvdmRwYS9tbHg1L2NvcmUuCj4KPiBPbmx5IHZpcnR1YWwgZnVuY3Rpb25zIGFyZSBjdXJy
ZW50bHkgc3VwcG9ydGVkLiBBbHNvLCBjZXJ0YWluIGZpcm13YXJlCj4gY2FwYWJpbGl0aWVzIG11
c3QgYmUgc2V0IHRvIGVuYWJsZSB0aGUgZHJpdmVyLiBQaHlzaWNhbCBmdW5jdGlvbnMgKFBGcykK
PiBhcmUgc2tpcHBlZCBieSB0aGUgZHJpdmVyLgo+Cj4gVG8gbWFrZSB1c2Ugb2YgdGhlIFZEUEEg
bmV0IGRyaXZlciwgb25lIG11c3QgbG9hZCBtbHg1X3ZkcGEuIEluIHN1Y2gKPiBjYXNlLCBWRnMg
d2lsbCBiZSBvcGVyYXRlZCBieSB0aGUgVkRQQSBkcml2ZXIuIEFsdGhvdWdoIG9uZSBjYW4gc2Vl
IGEKPiByZWd1bGFyIGluc3RhbmNlIG9mIGEgbmV0d29yayBkcml2ZXIgb24gdGhlIFZGLCB0aGUg
VkRQQSBkcml2ZXIgdGFrZXMKPiBwcmVjZWRlbmNlIG92ZXIgdGhlIE5JQyBkcml2ZXIsIHN0ZWVy
aW5nLXdpemUuCj4KPiBDdXJyZW50bHksIHRoZSBkZXZpY2UvaW50ZXJmYWNlIGluZnJhc3RydWN0
dXJlIGluIG1seDVfY29yZSBpcyB1c2VkIHRvCj4gcHJvYmUgZHJpdmVycy4gRnV0dXJlIHBhdGNo
ZXMgd2lsbCBpbnRyb2R1Y2UgdmlydGJ1cyBhcyBhIG1lYW5zIHRvCj4gcmVnaXN0ZXIgZGV2aWNl
cyBhbmQgZHJpdmVycyBhbmQgVkRQQSB3aWxsIGJlIGFkYXB0ZWQgdG8gaXQuCj4KPiBUaGUgbWx4
NSBtb2RlIG9mIG9wZXJhdGlvbiByZXF1aXJlZCB0byBzdXBwb3J0IFZEUEEgaXMgc3dpdGNoZGV2
IG1vZGUuCj4gT25jZSBjYW4gdXNlIExpbnV4IG9yIE9WUyBicmlkZ2UgdG8gdGFrZSBjYXJlIG9m
IGxheWVyIDIgc3dpdGNoaW5nLgo+Cj4gSW4gb3JkZXIgdG8gcHJvdmlkZSB2aXJ0aW8gbmV0d29y
a2luZyB0byBhIGd1ZXN0LCBhbiB1cGRhdGVkIHZlcnNpb24gb2YKPiBxZW11IGlzIHJlcXVpcmVk
LiBUaGlzIHZlcnNpb24gaGFzIGJlZW4gdGVzdGVkIGJ5IHRoZSBmb2xsb3dpbmcgcXVlbXUKPiB2
ZXJzaW9uOgo+Cj4gdXJsOiBodHRwczovL2dpdGh1Yi5jb20vamFzb3dhbmcvcWVtdS5naXQKPiBi
cmFuY2g6IHZkcGEKPiBDb21taXQgSUQ6IDZmNGU1OWI4MDdkYgo+Cj4KPiBWMi0+VjMKPiBGaXgg
bWFrZWZpbGUgdG8gdXNlIGluY2x1ZGUgcGF0aCByZWxhdGl2ZSB0byB0aGUgcm9vdCBvZiB0aGUg
a2VybmVsCj4KPiBFbGkgQ29oZW4gKDcpOgo+ICAgIG5ldC92ZHBhOiBVc2Ugc3RydWN0IGZvciBz
ZXQvZ2V0IHZxIHN0YXRlCj4gICAgdmhvc3Q6IEZpeCBkb2N1bWVudGF0aW9uCj4gICAgdmRwYTog
TW9kaWZ5IGdldF92cV9zdGF0ZSgpIHRvIHJldHVybiBlcnJvciBjb2RlCj4gICAgdmRwYS9tbHg1
OiBBZGQgaGFyZHdhcmUgZGVzY3JpcHRpdmUgaGVhZGVyIGZpbGUKPiAgICB2ZHBhL21seDU6IEFk
ZCBzdXBwb3J0IGxpYnJhcnkgZm9yIG1seDUgVkRQQSBpbXBsZW1lbnRhdGlvbgo+ICAgIHZkcGEv
bWx4NTogQWRkIHNoYXJlZCBtZW1vcnkgcmVnaXN0cmF0aW9uIGNvZGUKPiAgICB2ZHBhL21seDU6
IEFkZCBWRFBBIGRyaXZlciBmb3Igc3VwcG9ydGVkIG1seDUgZGV2aWNlcwo+Cj4gSmFzb24gV2Fu
ZyAoMik6Cj4gICAgdmhvc3QtdmRwYTogc3VwcG9ydCBiYXRjaCB1cGRhdGluZwo+ICAgIHZkcGFf
c2ltOiB1c2UgdGhlIGJhdGNoaW5nIEFQSQo+Cj4gTWF4IEd1cnRvdm95ICgxKToKPiAgICB2ZHBh
OiByZW1vdmUgaGFyZCBjb2RlZCB2aXJ0cSBudW0KPgo+ICAgZHJpdmVycy92ZHBhL0tjb25maWcg
ICAgICAgICAgICAgICAgICAgfCAgIDE4ICsKPiAgIGRyaXZlcnMvdmRwYS9NYWtlZmlsZSAgICAg
ICAgICAgICAgICAgIHwgICAgMSArCj4gICBkcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfYmFzZS5j
ICAgICAgICB8ICAgIDQgKy0KPiAgIGRyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9iYXNlLmggICAg
ICAgIHwgICAgNCArLQo+ICAgZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYyAgICAgICAg
fCAgIDEzICstCj4gICBkcml2ZXJzL3ZkcGEvbWx4NS9NYWtlZmlsZSAgICAgICAgICAgICB8ICAg
IDQgKwo+ICAgZHJpdmVycy92ZHBhL21seDUvY29yZS9tbHg1X3ZkcGEuaCAgICAgfCAgIDkxICsr
Cj4gICBkcml2ZXJzL3ZkcGEvbWx4NS9jb3JlL21seDVfdmRwYV9pZmMuaCB8ICAxNjggKysKPiAg
IGRyaXZlcnMvdmRwYS9tbHg1L2NvcmUvbXIuYyAgICAgICAgICAgIHwgIDQ3MyArKysrKysKPiAg
IGRyaXZlcnMvdmRwYS9tbHg1L2NvcmUvcmVzb3VyY2VzLmMgICAgIHwgIDI4NCArKysrCj4gICBk
cml2ZXJzL3ZkcGEvbWx4NS9uZXQvbWFpbi5jICAgICAgICAgICB8ICAgNzYgKwo+ICAgZHJpdmVy
cy92ZHBhL21seDUvbmV0L21seDVfdm5ldC5jICAgICAgfCAxOTUwICsrKysrKysrKysrKysrKysr
KysrKysrKwo+ICAgZHJpdmVycy92ZHBhL21seDUvbmV0L21seDVfdm5ldC5oICAgICAgfCAgIDI0
ICsKPiAgIGRyaXZlcnMvdmRwYS92ZHBhLmMgICAgICAgICAgICAgICAgICAgIHwgICAgMyArCj4g
ICBkcml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW0uYyAgICAgICB8ICAgMzUgKy0KPiAgIGRy
aXZlcnMvdmhvc3QvaW90bGIuYyAgICAgICAgICAgICAgICAgIHwgICAgNCArLQo+ICAgZHJpdmVy
cy92aG9zdC92ZHBhLmMgICAgICAgICAgICAgICAgICAgfCAgIDQ2ICstCj4gICBpbmNsdWRlL2xp
bnV4L3ZkcGEuaCAgICAgICAgICAgICAgICAgICB8ICAgMjQgKy0KPiAgIGluY2x1ZGUvdWFwaS9s
aW51eC92aG9zdF90eXBlcy5oICAgICAgIHwgICAgMiArCj4gICAxOSBmaWxlcyBjaGFuZ2VkLCAz
MTY1IGluc2VydGlvbnMoKyksIDU5IGRlbGV0aW9ucygtKQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvdmRwYS9tbHg1L01ha2VmaWxlCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy92ZHBhL21seDUvY29yZS9tbHg1X3ZkcGEuaAo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvdmRwYS9tbHg1L2NvcmUvbWx4NV92ZHBhX2lmYy5oCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy92ZHBhL21seDUvY29yZS9tci5jCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy92ZHBhL21seDUvY29yZS9yZXNvdXJjZXMuYwo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvdmRwYS9tbHg1L25ldC9tYWluLmMKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3Zk
cGEvbWx4NS9uZXQvbWx4NV92bmV0LmMKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3Zk
cGEvbWx4NS9uZXQvbWx4NV92bmV0LmgKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0
aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0
aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
