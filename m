Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 971FF230329
	for <lists.virtualization@lfdr.de>; Tue, 28 Jul 2020 08:41:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id F2EC88832F;
	Tue, 28 Jul 2020 06:41:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lyZo9V+QvwVy; Tue, 28 Jul 2020 06:41:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0881388334;
	Tue, 28 Jul 2020 06:41:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5403C004D;
	Tue, 28 Jul 2020 06:41:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DEEC4C004D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 06:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C63C3881B7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 06:41:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rnP0hYoDILFD
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 06:41:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C0A4088183
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 06:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595918469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OBVILI65w6kAlvMCmeO/p3+Mu658pM7kH5zrHcmbav8=;
 b=NDbeBXKq+ShhY/o6lRXvSECCA55DynQ48HXY3mmn8mgFyZ18tvGu8IfbxuIXiE3KvNvLm0
 P9jSSQwm/zwczBNm7eAoqayNNyH7a/GJf9WqGO+adYJzm76EWXHqgU0g/7SXo3M7t0Rrbh
 ZL3Q+SVk5LZDOuCiajubersYEXUz0SQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-X3q0ApOzPtO73Lum7ivpYA-1; Tue, 28 Jul 2020 02:41:04 -0400
X-MC-Unique: X3q0ApOzPtO73Lum7ivpYA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B32C0106B250;
 Tue, 28 Jul 2020 06:41:01 +0000 (UTC)
Received: from [10.72.13.242] (ovpn-13-242.pek2.redhat.com [10.72.13.242])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E17B55D9CD;
 Tue, 28 Jul 2020 06:40:53 +0000 (UTC)
Subject: Re: [PATCH V3 vhost next 00/10] VDPA support for Mellanox ConnectX
 devices
To: Eli Cohen <eli@mellanox.com>
References: <20200728060539.4163-1-eli@mellanox.com>
 <1dbac14a-5909-ff0a-8e90-534847f93d50@redhat.com>
 <20200728063211.GA229972@mtl-vdi-166.wap.labs.mlnx>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ef857921-4b9a-8e48-d5cd-5ef585e8f15c@redhat.com>
Date: Tue, 28 Jul 2020 14:40:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728063211.GA229972@mtl-vdi-166.wap.labs.mlnx>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: shahafs@mellanox.com, parav@mellanox.com, mst@redhat.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 saeedm@mellanox.com
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

Ck9uIDIwMjAvNy8yOCDkuIvljYgyOjMyLCBFbGkgQ29oZW4gd3JvdGU6Cj4gT24gVHVlLCBKdWwg
MjgsIDIwMjAgYXQgMDI6MTg6MTZQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4gT24gMjAy
MC83LzI4IOS4i+WNiDI6MDUsIEVsaSBDb2hlbiB3cm90ZToKPj4+IEhpIE1pY2hhZWwsCj4+PiBw
bGVhc2Ugbm90ZSB0aGF0IHRoaXMgc2VyaWVzIGRlcGVuZHMgb24gbWx4NSBjb3JlIGRldmljZSBk
cml2ZXIgcGF0Y2hlcwo+Pj4gaW4gbWx4NS1uZXh0IGJyYW5jaCBpbgo+Pj4gZ2l0Oi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L21lbGxhbm94L2xpbnV4LmdpdC4KPj4+
Cj4+PiBnaXQgcHVsbCBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvbWVsbGFub3gvbGludXguZ2l0IG1seDUtbmV4dAo+Pj4KPj4+IFRoZXkgYWxzbyBkZXBlbmQg
SmFzb24gV2FuZydzIHBhdGNoZXMgc3VibWl0dGVkIGEgY291cGxlIG9mIHdlZWtzIGFnby4KPj4+
Cj4+PiB2ZHBhX3NpbTogdXNlIHRoZSBiYXRjaGluZyBBUEkKPj4+IHZob3N0LXZkcGE6IHN1cHBv
cnQgYmF0Y2ggdXBkYXRpbmcKPj4KPj4gSnVzdCBub3RpY2UgdGhhdCBhIG5ldyB2ZXJzaW9uIGlz
IHBvc3RlZFsxXSAoeW91IHdlcmUgY2NlZCkuIFRhbGtlZAo+PiB3aXRoIE1pY2hhZWwsIGFuZCBp
dCdzIGJldHRlciBmb3IgeW91IHRvIG1lcmdlIHRoZSBuZXcgdmVyc2lvbiBpbgo+PiB0aGlzIHNl
cmllcy4KPj4KPiBPSywgd2lsbCBzZW5kIGFnYWluLiBKdXN0IHRvIG1ha2Ugc3VyZSwgSSBzaG91
bGQgcHV0IHlvdXIgc2VyaWVzIGFuZCBteQo+IHNlcmllcyBvbiBNaWNoYWwncyB2aG9zdCBicmFu
Y2gsIHRoZSBzYW1lIHRyZWUgSSBoYXZlIGJlZW4gdXNpbmcgc28gZmFyPwoKClllcy4gSSB0aGlu
ayBzby4KClRoYW5rcwoKCj4KPj4gU29ycnkgZm9yIG5vdCBzcG90dGluZyB0aGlzIGJlZm9yZS4K
Pj4KPj4gWzFdIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDIwLzcvMS8zMDEKPj4KPj4gVGhhbmtz
Cj4+Cj4+Cj4+Pgo+Pj4gVGhlIGZvbGxvd2luZyBzZXJpZXMgb2YgcGF0Y2hlcyBwcm92aWRlIFZE
UEEgc3VwcG9ydCBmb3IgTWVsbGFub3gKPj4+IGRldmljZXMuIFRoZSBzdXBwb3J0ZWQgZGV2aWNl
cyBhcmUgQ29ubmVjdFg2IERYIGFuZCBuZXdlci4KPj4+Cj4+PiBDdXJyZW50bHksIG9ubHkgYSBu
ZXR3b3JrIGRyaXZlciBpcyBpbXBsZW1lbnRlZDsgZnV0dXJlIHBhdGNoZXMgd2lsbAo+Pj4gaW50
cm9kdWNlIGEgYmxvY2sgZGV2aWNlIGRyaXZlci4gaXBlcmYgcGVyZm9ybWFuY2Ugb24gYSBzaW5n
bGUgcXVldWUgaXMKPj4+IGFyb3VuZCAxMiBHYnBzLiAgRnV0dXJlIHBhdGNoZXMgd2lsbCBpbnRy
b2R1Y2UgbXVsdGkgcXVldWUgc3VwcG9ydC4KPj4+Cj4+PiBUaGUgZmlsZXMgYXJlIG9yZ2FuaXpl
ZCBpbiBzdWNoIGEgd2F5IHRoYXQgY29kZSB0aGF0IGNhbiBiZSB1c2VkIGJ5Cj4+PiBkaWZmZXJl
bnQgVkRQQSBpbXBsZW1lbnRhdGlvbnMgd2lsbCBiZSBwbGFjZWQgaW4gYSBjb21tb24gYXJlIHJl
c2lkZXMgaW4KPj4+IGRyaXZlcnMvdmRwYS9tbHg1L2NvcmUuCj4+Pgo+Pj4gT25seSB2aXJ0dWFs
IGZ1bmN0aW9ucyBhcmUgY3VycmVudGx5IHN1cHBvcnRlZC4gQWxzbywgY2VydGFpbiBmaXJtd2Fy
ZQo+Pj4gY2FwYWJpbGl0aWVzIG11c3QgYmUgc2V0IHRvIGVuYWJsZSB0aGUgZHJpdmVyLiBQaHlz
aWNhbCBmdW5jdGlvbnMgKFBGcykKPj4+IGFyZSBza2lwcGVkIGJ5IHRoZSBkcml2ZXIuCj4+Pgo+
Pj4gVG8gbWFrZSB1c2Ugb2YgdGhlIFZEUEEgbmV0IGRyaXZlciwgb25lIG11c3QgbG9hZCBtbHg1
X3ZkcGEuIEluIHN1Y2gKPj4+IGNhc2UsIFZGcyB3aWxsIGJlIG9wZXJhdGVkIGJ5IHRoZSBWRFBB
IGRyaXZlci4gQWx0aG91Z2ggb25lIGNhbiBzZWUgYQo+Pj4gcmVndWxhciBpbnN0YW5jZSBvZiBh
IG5ldHdvcmsgZHJpdmVyIG9uIHRoZSBWRiwgdGhlIFZEUEEgZHJpdmVyIHRha2VzCj4+PiBwcmVj
ZWRlbmNlIG92ZXIgdGhlIE5JQyBkcml2ZXIsIHN0ZWVyaW5nLXdpemUuCj4+Pgo+Pj4gQ3VycmVu
dGx5LCB0aGUgZGV2aWNlL2ludGVyZmFjZSBpbmZyYXN0cnVjdHVyZSBpbiBtbHg1X2NvcmUgaXMg
dXNlZCB0bwo+Pj4gcHJvYmUgZHJpdmVycy4gRnV0dXJlIHBhdGNoZXMgd2lsbCBpbnRyb2R1Y2Ug
dmlydGJ1cyBhcyBhIG1lYW5zIHRvCj4+PiByZWdpc3RlciBkZXZpY2VzIGFuZCBkcml2ZXJzIGFu
ZCBWRFBBIHdpbGwgYmUgYWRhcHRlZCB0byBpdC4KPj4+Cj4+PiBUaGUgbWx4NSBtb2RlIG9mIG9w
ZXJhdGlvbiByZXF1aXJlZCB0byBzdXBwb3J0IFZEUEEgaXMgc3dpdGNoZGV2IG1vZGUuCj4+PiBP
bmNlIGNhbiB1c2UgTGludXggb3IgT1ZTIGJyaWRnZSB0byB0YWtlIGNhcmUgb2YgbGF5ZXIgMiBz
d2l0Y2hpbmcuCj4+Pgo+Pj4gSW4gb3JkZXIgdG8gcHJvdmlkZSB2aXJ0aW8gbmV0d29ya2luZyB0
byBhIGd1ZXN0LCBhbiB1cGRhdGVkIHZlcnNpb24gb2YKPj4+IHFlbXUgaXMgcmVxdWlyZWQuIFRo
aXMgdmVyc2lvbiBoYXMgYmVlbiB0ZXN0ZWQgYnkgdGhlIGZvbGxvd2luZyBxdWVtdQo+Pj4gdmVy
c2lvbjoKPj4+Cj4+PiB1cmw6IGh0dHBzOi8vZ2l0aHViLmNvbS9qYXNvd2FuZy9xZW11LmdpdAo+
Pj4gYnJhbmNoOiB2ZHBhCj4+PiBDb21taXQgSUQ6IDZmNGU1OWI4MDdkYgo+Pj4KPj4+Cj4+PiBW
Mi0+VjMKPj4+IEZpeCBtYWtlZmlsZSB0byB1c2UgaW5jbHVkZSBwYXRoIHJlbGF0aXZlIHRvIHRo
ZSByb290IG9mIHRoZSBrZXJuZWwKPj4+Cj4+PiBFbGkgQ29oZW4gKDcpOgo+Pj4gICAgbmV0L3Zk
cGE6IFVzZSBzdHJ1Y3QgZm9yIHNldC9nZXQgdnEgc3RhdGUKPj4+ICAgIHZob3N0OiBGaXggZG9j
dW1lbnRhdGlvbgo+Pj4gICAgdmRwYTogTW9kaWZ5IGdldF92cV9zdGF0ZSgpIHRvIHJldHVybiBl
cnJvciBjb2RlCj4+PiAgICB2ZHBhL21seDU6IEFkZCBoYXJkd2FyZSBkZXNjcmlwdGl2ZSBoZWFk
ZXIgZmlsZQo+Pj4gICAgdmRwYS9tbHg1OiBBZGQgc3VwcG9ydCBsaWJyYXJ5IGZvciBtbHg1IFZE
UEEgaW1wbGVtZW50YXRpb24KPj4+ICAgIHZkcGEvbWx4NTogQWRkIHNoYXJlZCBtZW1vcnkgcmVn
aXN0cmF0aW9uIGNvZGUKPj4+ICAgIHZkcGEvbWx4NTogQWRkIFZEUEEgZHJpdmVyIGZvciBzdXBw
b3J0ZWQgbWx4NSBkZXZpY2VzCj4+Pgo+Pj4gSmFzb24gV2FuZyAoMik6Cj4+PiAgICB2aG9zdC12
ZHBhOiBzdXBwb3J0IGJhdGNoIHVwZGF0aW5nCj4+PiAgICB2ZHBhX3NpbTogdXNlIHRoZSBiYXRj
aGluZyBBUEkKPj4+Cj4+PiBNYXggR3VydG92b3kgKDEpOgo+Pj4gICAgdmRwYTogcmVtb3ZlIGhh
cmQgY29kZWQgdmlydHEgbnVtCj4+Pgo+Pj4gICBkcml2ZXJzL3ZkcGEvS2NvbmZpZyAgICAgICAg
ICAgICAgICAgICB8ICAgMTggKwo+Pj4gICBkcml2ZXJzL3ZkcGEvTWFrZWZpbGUgICAgICAgICAg
ICAgICAgICB8ICAgIDEgKwo+Pj4gICBkcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfYmFzZS5jICAg
ICAgICB8ICAgIDQgKy0KPj4+ICAgZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX2Jhc2UuaCAgICAg
ICAgfCAgICA0ICstCj4+PiAgIGRyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9tYWluLmMgICAgICAg
IHwgICAxMyArLQo+Pj4gICBkcml2ZXJzL3ZkcGEvbWx4NS9NYWtlZmlsZSAgICAgICAgICAgICB8
ICAgIDQgKwo+Pj4gICBkcml2ZXJzL3ZkcGEvbWx4NS9jb3JlL21seDVfdmRwYS5oICAgICB8ICAg
OTEgKysKPj4+ICAgZHJpdmVycy92ZHBhL21seDUvY29yZS9tbHg1X3ZkcGFfaWZjLmggfCAgMTY4
ICsrCj4+PiAgIGRyaXZlcnMvdmRwYS9tbHg1L2NvcmUvbXIuYyAgICAgICAgICAgIHwgIDQ3MyAr
KysrKysKPj4+ICAgZHJpdmVycy92ZHBhL21seDUvY29yZS9yZXNvdXJjZXMuYyAgICAgfCAgMjg0
ICsrKysKPj4+ICAgZHJpdmVycy92ZHBhL21seDUvbmV0L21haW4uYyAgICAgICAgICAgfCAgIDc2
ICsKPj4+ICAgZHJpdmVycy92ZHBhL21seDUvbmV0L21seDVfdm5ldC5jICAgICAgfCAxOTUwICsr
KysrKysrKysrKysrKysrKysrKysrKwo+Pj4gICBkcml2ZXJzL3ZkcGEvbWx4NS9uZXQvbWx4NV92
bmV0LmggICAgICB8ICAgMjQgKwo+Pj4gICBkcml2ZXJzL3ZkcGEvdmRwYS5jICAgICAgICAgICAg
ICAgICAgICB8ICAgIDMgKwo+Pj4gICBkcml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW0uYyAg
ICAgICB8ICAgMzUgKy0KPj4+ICAgZHJpdmVycy92aG9zdC9pb3RsYi5jICAgICAgICAgICAgICAg
ICAgfCAgICA0ICstCj4+PiAgIGRyaXZlcnMvdmhvc3QvdmRwYS5jICAgICAgICAgICAgICAgICAg
IHwgICA0NiArLQo+Pj4gICBpbmNsdWRlL2xpbnV4L3ZkcGEuaCAgICAgICAgICAgICAgICAgICB8
ICAgMjQgKy0KPj4+ICAgaW5jbHVkZS91YXBpL2xpbnV4L3Zob3N0X3R5cGVzLmggICAgICAgfCAg
ICAyICsKPj4+ICAgMTkgZmlsZXMgY2hhbmdlZCwgMzE2NSBpbnNlcnRpb25zKCspLCA1OSBkZWxl
dGlvbnMoLSkKPj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmRwYS9tbHg1L01ha2Vm
aWxlCj4+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZkcGEvbWx4NS9jb3JlL21seDVf
dmRwYS5oCj4+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZkcGEvbWx4NS9jb3JlL21s
eDVfdmRwYV9pZmMuaAo+Pj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy92ZHBhL21seDUv
Y29yZS9tci5jCj4+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZkcGEvbWx4NS9jb3Jl
L3Jlc291cmNlcy5jCj4+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZkcGEvbWx4NS9u
ZXQvbWFpbi5jCj4+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZkcGEvbWx4NS9uZXQv
bWx4NV92bmV0LmMKPj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmRwYS9tbHg1L25l
dC9tbHg1X3ZuZXQuaAo+Pj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0
cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcv
bWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
