Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 80937BAC4F
	for <lists.virtualization@lfdr.de>; Mon, 23 Sep 2019 03:07:13 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AF86849F;
	Mon, 23 Sep 2019 01:07:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E0F14408
	for <virtualization@lists.linux-foundation.org>;
	Mon, 23 Sep 2019 01:07:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6830487D
	for <virtualization@lists.linux-foundation.org>;
	Mon, 23 Sep 2019 01:07:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 90431C051688;
	Mon, 23 Sep 2019 01:06:59 +0000 (UTC)
Received: from [10.72.12.112] (ovpn-12-112.pek2.redhat.com [10.72.12.112])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A96FC6092F;
	Mon, 23 Sep 2019 01:06:38 +0000 (UTC)
Subject: Re: [RFC PATCH V2 0/6] mdev based hardware virtio offloading support
To: kvm@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
	kwankhede@nvidia.com, alex.williamson@redhat.com, mst@redhat.com,
	tiwei.bie@intel.com
References: <20190920082050.19352-1-jasowang@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <0cea96a3-f941-3181-d320-7c15b33ad552@redhat.com>
Date: Mon, 23 Sep 2019 09:06:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190920082050.19352-1-jasowang@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 23 Sep 2019 01:07:00 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: sebott@linux.ibm.com, airlied@linux.ie, joonas.lahtinen@linux.intel.com,
	heiko.carstens@de.ibm.com, virtualization@lists.linux-foundation.org,
	rob.miller@broadcom.com, lulu@redhat.com, eperezma@redhat.com,
	pasic@linux.ibm.com, borntraeger@de.ibm.com,
	haotian.wang@sifive.com, zhi.a.wang@intel.com,
	farman@linux.ibm.com, idos@mellanox.com, gor@linux.ibm.com,
	zhenyuw@linux.intel.com, rodrigo.vivi@intel.com,
	xiao.w.wang@intel.com, freude@linux.ibm.com,
	jani.nikula@linux.intel.com, parav@mellanox.com,
	zhihong.wang@intel.com, akrowiak@linux.ibm.com,
	pmorel@linux.ibm.com, netdev@vger.kernel.org, cohuck@redhat.com,
	oberpar@linux.ibm.com, maxime.coquelin@redhat.com,
	daniel@ffwll.ch, lingshan.zhu@intel.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Ck9uIDIwMTkvOS8yMCDkuIvljYg0OjIwLCBKYXNvbiBXYW5nIHdyb3RlOgo+IEhpIGFsbDoKPgo+
IFRoZXJlIGFyZSBoYXJkd2FyZSB0aGF0IGNhbiBkbyB2aXJ0aW8gZGF0YXBhdGggb2ZmbG9hZGlu
ZyB3aGlsZSBoYXZpbmcKPiBpdHMgb3duIGNvbnRyb2wgcGF0aC4gVGhpcyBwYXRoIHRyaWVzIHRv
IGltcGxlbWVudCBhIG1kZXYgYmFzZWQKPiB1bmlmaWVkIEFQSSB0byBzdXBwb3J0IHVzaW5nIGtl
cm5lbCB2aXJ0aW8gZHJpdmVyIHRvIGRyaXZlIHRob3NlCj4gZGV2aWNlcy4gVGhpcyBpcyBkb25l
IGJ5IGludHJvZHVjaW5nIGEgbmV3IG1kZXYgdHJhbnNwb3J0IGZvciB2aXJ0aW8KPiAodmlydGlv
X21kZXYpIGFuZCByZWdpc3RlciBpdHNlbGYgYXMgYSBuZXcga2luZCBvZiBtZGV2IGRyaXZlci4g
VGhlbgo+IGl0IHByb3ZpZGVzIGEgdW5pZmllZCB3YXkgZm9yIGtlcm5lbCB2aXJ0aW8gZHJpdmVy
IHRvIHRhbGsgd2l0aCBtZGV2Cj4gZGV2aWNlIGltcGxlbWVudGF0aW9uLgo+Cj4gVGhvdWdoIHRo
ZSBzZXJpZXMgb25seSBjb250YWluIGtlcm5lbCBkcml2ZXIgc3VwcG9ydCwgdGhlIGdvYWwgaXMg
dG8KPiBtYWtlIHRoZSB0cmFuc3BvcnQgZ2VuZXJpYyBlbm91Z2ggdG8gc3VwcG9ydCB1c2Vyc3Bh
Y2UgZHJpdmVycy4gVGhpcwo+IG1lYW5zIHZob3N0LW1kZXZbMV0gY291bGQgYmUgYnVpbHQgb24g
dG9wIGFzIHdlbGwgYnkgcmVzdWluZyB0aGUKPiB0cmFuc3BvcnQuCj4KPiBBIHNhbXBsZSBkcml2
ZXIgaXMgYWxzbyBpbXBsZW1lbnRlZCB3aGljaCBzaW11bGF0ZSBhIHZpcml0by1uZXQKPiBsb29w
YmFjayBldGhlcm5ldCBkZXZpY2Ugb24gdG9wIG9mIHZyaW5naCArIHdvcmtxdWV1ZS4gVGhpcyBj
b3VsZCBiZQo+IHVzZWQgYXMgYSByZWZlcmVuY2UgaW1wbGVtZW50YXRpb24gZm9yIHJlYWwgaGFy
ZHdhcmUgZHJpdmVyLgo+Cj4gQ29uc2lkZXIgbWRldiBmcmFtZXdvcmsgb25seSBzdXBwb3J0IFZG
SU8gZGV2aWNlIGFuZCBkcml2ZXIgcmlnaHQgbm93LAo+IHRoaXMgc2VyaWVzIGFsc28gZXh0ZW5k
IGl0IHRvIHN1cHBvcnQgb3RoZXIgdHlwZXMuIFRoaXMgaXMgZG9uZQo+IHRocm91Z2ggaW50cm9k
dWNpbmcgY2xhc3MgaWQgdG8gdGhlIGRldmljZSBhbmQgcGFpcmluZyBpdCB3aXRoCj4gaWRfdGFs
YmUgY2xhaW1lZCBieSB0aGUgZHJpdmVyLiBPbiB0b3AsIHRoaXMgc2VyaXMgYWxzbyBkZWNvdXBs
ZQo+IGRldmljZSBzcGVjaWZpYyBwYXJlbnRzIG9wcyBvdXQgb2YgdGhlIGNvbW1vbiBvbmVzLgo+
Cj4gUGt0Z2VuIHRlc3Qgd2FzIGRvbmUgd2l0aCB2aXJpdG8tbmV0ICsgbXZuZXQgbG9vcCBiYWNr
IGRldmljZS4KPgo+IFBsZWFzZSByZXZpZXcuCgoKQ0MgUGFyYXYuCgpUaGFua3MKCgo+Cj4gQ2hh
bmdlcyBmcm9tIFYxOgo+Cj4gLSByZW5hbWUgZGV2aWNlIGlkIHRvIGNsYXNzIGlkCj4gLSBhZGQg
ZG9jcyBmb3IgY2xhc3MgaWQgYW5kIGRldmljZSBzcGVjaWZpYyBvcHMgKGRldmljZV9vcHMpCj4g
LSBzcGxpdCBkZXZpY2Vfb3BzIGludG8gc2VwZXJhdGUgaGVhZGVycwo+IC0gZHJvcCB0aGUgbWRl
dl9zZXRfZG1hX29wcygpCj4gLSB1c2UgZGV2aWNlX29wcyB0byBpbXBsZW1lbnQgdGhlIHRyYW5z
cG9ydCBBUEksIHRoZW4gaXQncyBub3QgYSBwYXJ0Cj4gICAgb2YgVUFQSSBhbnkgbW9yZQo+IC0g
dXNlIEdGUF9BVE9NSUMgaW4gbXZuZXQgc2FtcGxlIGRldmljZSBhbmQgb3RoZXIgdHdlYWtzCj4g
LSBzZXRfdnJpbmdfYmFzZS9nZXRfdnJpbmdfYmFzZSBzdXBwb3J0IGZvciBtdm5ldCBkZXZpY2UK
Pgo+IEphc29uIFdhbmcgKDYpOgo+ICAgIG1kZXY6IGNsYXNzIGlkIHN1cHBvcnQKPiAgICBtZGV2
OiBpbnRyb2R1Y2UgZGV2aWNlIHNwZWNpZmljIG9wcwo+ICAgIG1kZXY6IGludHJvZHVjZSB2aXJ0
aW8gZGV2aWNlIGFuZCBpdHMgZGV2aWNlIG9wcwo+ICAgIHZpcnRpbzogaW50cm91ZGNlIGEgbWRl
diBiYXNlZCB0cmFuc3BvcnQKPiAgICB2cmluZ2g6IGZpeCBjb3B5IGRpcmVjdGlvbiBvZiB2cmlu
Z2hfaW92X3B1c2hfa2VybigpCj4gICAgZG9jczogU2FtcGxlIGRyaXZlciB0byBkZW1vbnN0cmF0
ZSBob3cgdG8gaW1wbGVtZW50IHZpcnRpby1tZGV2Cj4gICAgICBmcmFtZXdvcmsKPgo+ICAgLi4u
L2RyaXZlci1hcGkvdmZpby1tZWRpYXRlZC1kZXZpY2UucnN0ICAgICAgIHwgIDExICstCj4gICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYyAgICAgICAgICAgICAgfCAgMTcgKy0KPiAg
IGRyaXZlcnMvczM5MC9jaW8vdmZpb19jY3dfb3BzLmMgICAgICAgICAgICAgICB8ICAxNyArLQo+
ICAgZHJpdmVycy9zMzkwL2NyeXB0by92ZmlvX2FwX29wcy5jICAgICAgICAgICAgIHwgIDE0ICst
Cj4gICBkcml2ZXJzL3ZmaW8vbWRldi9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgfCAgIDcg
Kwo+ICAgZHJpdmVycy92ZmlvL21kZXYvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgIHwgICAx
ICsKPiAgIGRyaXZlcnMvdmZpby9tZGV2L21kZXZfY29yZS5jICAgICAgICAgICAgICAgICB8ICAy
MSArLQo+ICAgZHJpdmVycy92ZmlvL21kZXYvbWRldl9kcml2ZXIuYyAgICAgICAgICAgICAgIHwg
IDE0ICsKPiAgIGRyaXZlcnMvdmZpby9tZGV2L21kZXZfcHJpdmF0ZS5oICAgICAgICAgICAgICB8
ICAgMSArCj4gICBkcml2ZXJzL3ZmaW8vbWRldi92ZmlvX21kZXYuYyAgICAgICAgICAgICAgICAg
fCAgMzcgKy0KPiAgIGRyaXZlcnMvdmZpby9tZGV2L3ZpcnRpb19tZGV2LmMgICAgICAgICAgICAg
ICB8IDQxOCArKysrKysrKysrKwo+ICAgZHJpdmVycy92aG9zdC92cmluZ2guYyAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICA4ICstCj4gICBpbmNsdWRlL2xpbnV4L21kZXYuaCAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgNDYgKy0KPiAgIGluY2x1ZGUvbGludXgvbW9kX2RldmljZXRhYmxl
LmggICAgICAgICAgICAgICB8ICAgOCArCj4gICBpbmNsdWRlL2xpbnV4L3ZmaW9fbWRldi5oICAg
ICAgICAgICAgICAgICAgICAgfCAgNTAgKysKPiAgIGluY2x1ZGUvbGludXgvdmlydGlvX21kZXYu
aCAgICAgICAgICAgICAgICAgICB8IDE0MSArKysrCj4gICBzYW1wbGVzL0tjb25maWcgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDcgKwo+ICAgc2FtcGxlcy92ZmlvLW1kZXYvTWFr
ZWZpbGUgICAgICAgICAgICAgICAgICAgIHwgICAxICsKPiAgIHNhbXBsZXMvdmZpby1tZGV2L21i
b2Nocy5jICAgICAgICAgICAgICAgICAgICB8ICAxOSArLQo+ICAgc2FtcGxlcy92ZmlvLW1kZXYv
bWRweS5jICAgICAgICAgICAgICAgICAgICAgIHwgIDE5ICstCj4gICBzYW1wbGVzL3ZmaW8tbWRl
di9tdHR5LmMgICAgICAgICAgICAgICAgICAgICAgfCAgMTcgKy0KPiAgIHNhbXBsZXMvdmZpby1t
ZGV2L212bmV0LmMgICAgICAgICAgICAgICAgICAgICB8IDY4OCArKysrKysrKysrKysrKysrKysK
PiAgIDIyIGZpbGVzIGNoYW5nZWQsIDE0NzMgaW5zZXJ0aW9ucygrKSwgODkgZGVsZXRpb25zKC0p
Cj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy92ZmlvL21kZXYvdmlydGlvX21kZXYuYwo+
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvdmZpb19tZGV2LmgKPiAgIGNyZWF0
ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L3ZpcnRpb19tZGV2LmgKPiAgIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBzYW1wbGVzL3ZmaW8tbWRldi9tdm5ldC5jCj4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZp
cnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGlu
dXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
