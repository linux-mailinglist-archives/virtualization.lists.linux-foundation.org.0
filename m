Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C72BCF15F8
	for <lists.virtualization@lfdr.de>; Wed,  6 Nov 2019 13:22:24 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DA3ACC5D;
	Wed,  6 Nov 2019 12:22:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D7195B5F
	for <virtualization@lists.linux-foundation.org>;
	Wed,  6 Nov 2019 12:22:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 08459196
	for <virtualization@lists.linux-foundation.org>;
	Wed,  6 Nov 2019 12:22:14 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Nov 2019 04:22:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,274,1569308400"; d="scan'208";a="377032520"
Received: from dpdk-virtio-tbie-2.sh.intel.com (HELO ___) ([10.67.104.74])
	by orsmga005.jf.intel.com with ESMTP; 06 Nov 2019 04:22:06 -0800
Date: Wed, 6 Nov 2019 20:22:50 +0800
From: Tiwei Bie <tiwei.bie@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v5] vhost: introduce mdev based hardware backend
Message-ID: <20191106122249.GA3235@___>
References: <20191105115332.11026-1-tiwei.bie@intel.com>
	<16f31c27-3a0e-09d7-3925-dc9777f5e229@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <16f31c27-3a0e-09d7-3925-dc9777f5e229@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	zhihong.wang@intel.com, maxime.coquelin@redhat.com, lingshan.zhu@intel.com
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

T24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMDM6NTQ6NDVQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiBPbiAyMDE5LzExLzUg5LiL5Y2INzo1MywgVGl3ZWkgQmllIHdyb3RlOgo+ID4gVGhpcyBw
YXRjaCBpbnRyb2R1Y2VzIGEgbWRldiBiYXNlZCBoYXJkd2FyZSB2aG9zdCBiYWNrZW5kLgo+ID4g
VGhpcyBiYWNrZW5kIGlzIGJ1aWx0IG9uIHRvcCBvZiB0aGUgc2FtZSBhYnN0cmFjdGlvbiB1c2Vk
Cj4gPiBpbiB2aXJ0aW8tbWRldiBhbmQgcHJvdmlkZXMgYSBnZW5lcmljIHZob3N0IGludGVyZmFj
ZSBmb3IKPiA+IHVzZXJzcGFjZSB0byBhY2NlbGVyYXRlIHRoZSB2aXJ0aW8gZGV2aWNlcyBpbiBn
dWVzdC4KPiA+IAo+ID4gVGhpcyBiYWNrZW5kIGlzIGltcGxlbWVudGVkIGFzIGEgbWRldiBkZXZp
Y2UgZHJpdmVyIG9uIHRvcAo+ID4gb2YgdGhlIHNhbWUgbWRldiBkZXZpY2Ugb3BzIHVzZWQgaW4g
dmlydGlvLW1kZXYgYnV0IHVzaW5nCj4gPiBhIGRpZmZlcmVudCBtZGV2IGNsYXNzIGlkLCBhbmQg
aXQgd2lsbCByZWdpc3RlciB0aGUgZGV2aWNlCj4gPiBhcyBhIFZGSU8gZGV2aWNlIGZvciB1c2Vy
c3BhY2UgdG8gdXNlLiBVc2Vyc3BhY2UgY2FuIHNldHVwCj4gPiB0aGUgSU9NTVUgd2l0aCB0aGUg
ZXhpc3RpbmcgVkZJTyBjb250YWluZXIvZ3JvdXAgQVBJcyBhbmQKPiA+IHRoZW4gZ2V0IHRoZSBk
ZXZpY2UgZmQgd2l0aCB0aGUgZGV2aWNlIG5hbWUuIEFmdGVyIGdldHRpbmcKPiA+IHRoZSBkZXZp
Y2UgZmQsIHVzZXJzcGFjZSBjYW4gdXNlIHZob3N0IGlvY3RscyBvbiB0b3Agb2YgaXQKPiA+IHRv
IHNldHVwIHRoZSBiYWNrZW5kLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBUaXdlaSBCaWUgPHRp
d2VpLmJpZUBpbnRlbC5jb20+Cj4gCj4gCj4gTG9va3MgZ29vZCB0byBtZS4gT25seSBtaW5vciBu
aXRzIHdoaWNoIGNvdWxkIGJlIGFkZHJlc3NlZCBvbiB0b3AuCj4gCj4gUmV2aWV3ZWQtYnk6IEph
c29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+CgpUaGFua3MhCgo+IAo+IAo+ID4gLS0tCj4g
PiBUaGlzIHBhdGNoIGRlcGVuZHMgb24gYmVsb3cgc2VyaWVzOgo+ID4gaHR0cHM6Ly9sa21sLm9y
Zy9sa21sLzIwMTkvMTEvNS8yMTcKPiA+IAo+ID4gdjQgLT4gdjU6Cj4gPiAtIFJlYmFzZSBvbiB0
b3Agb2YgdmlydGlvLW1kZXYgc2VyaWVzIHY4Owo+ID4gLSBVc2UgdGhlIHZpcnRpb19vcHMgb2Yg
bWRldl9kZXZpY2UgaW4gdmhvc3QtbWRldiAoSmFzb24pOwo+ID4gLSBTb21lIG1pbm9yIGltcHJv
dmVtZW50cyBvbiBjb21taXQgbG9nOwo+ID4gCj4gPiB2MyAtPiB2NDoKPiA+IC0gUmViYXNlIG9u
IHRvcCBvZiB2aXJ0aW8tbWRldiBzZXJpZXMgdjY7Cj4gPiAtIFNvbWUgbWlub3IgdHdlYWtzIGFu
ZCBpbXByb3ZlbWVudHM7Cj4gPiAKPiA+IHYyIC0+IHYzOgo+ID4gLSBGaXggdGhlIHJldHVybiB2
YWx1ZSAoSmFzb24pOwo+ID4gLSBEb24ndCBjYWNoZSB1bm5lY2Vzc2FyeSBpbmZvcm1hdGlvbiBp
biB2aG9zdC1tZGV2IChKYXNvbik7Cj4gPiAtIEdldCByaWQgb2YgdGhlIG1lbXNldCBpbiBvcGVu
IChKYXNvbik7Cj4gPiAtIEFkZCBjb21tZW50cyBmb3IgVkhPU1RfU0VUX01FTV9UQUJMRSwgLi4u
IChKYXNvbik7Cj4gPiAtIEZpbHRlciBvdXQgdW5zdXBwb3J0ZWQgZmVhdHVyZXMgaW4gdmhvc3Qt
bWRldiAoSmFzb24pOwo+ID4gLSBBZGQgX0dFVF9ERVZJQ0VfSUQgaW9jdGwgKEphc29uKTsKPiA+
IC0gQWRkIF9HRVRfQ09ORklHL19TRVRfQ09ORklHIGlvY3RscyAoSmFzb24pOwo+ID4gLSBEcm9w
IF9HRVRfUVVFVUVfTlVNIGlvY3RsIChKYXNvbik7Cj4gPiAtIEZpeCB0aGUgY29weS1wYXN0ZSBl
cnJvcnMgaW4gX0lPVy9fSU9SIHVzYWdlOwo+ID4gLSBTb21lIG1pbm9yIGZpeGVzIGFuZCBpbXBy
b3ZlbWVudHM7Cj4gPiAKPiA+IHYxIC0+IHYyOgo+ID4gLSBSZXBsYWNlIF9TRVRfU1RBVEUgd2l0
aCBfU0VUX1NUQVRVUyAoTVNUKTsKPiA+IC0gQ2hlY2sgc3RhdHVzIGJpdHMgYXQgZWFjaCBzdGVw
IChNU1QpOwo+ID4gLSBSZXBvcnQgdGhlIG1heCByaW5nIHNpemUgYW5kIG1heCBudW1iZXIgb2Yg
cXVldWVzIChNU1QpOwo+ID4gLSBBZGQgbWlzc2luZyBNT0RVTEVfREVWSUNFX1RBQkxFIChKYXNv
bik7Cj4gPiAtIE9ubHkgc3VwcG9ydCB0aGUgbmV0d29yayBiYWNrZW5kIHcvbyBtdWx0aXF1ZXVl
IGZvciBub3c7Cj4gPiAtIFNvbWUgbWlub3IgZml4ZXMgYW5kIGltcHJvdmVtZW50czsKPiA+IC0g
UmViYXNlIG9uIHRvcCBvZiB2aXJ0aW8tbWRldiBzZXJpZXMgdjQ7Cj4gPiAKPiA+IFJGQyB2NCAt
PiB2MToKPiA+IC0gSW1wbGVtZW50IHZob3N0LW1kZXYgYXMgYSBtZGV2IGRldmljZSBkcml2ZXIg
ZGlyZWN0bHkgYW5kCj4gPiAgICBjb25uZWN0IGl0IHRvIFZGSU8gY29udGFpbmVyL2dyb3VwLiAo
SmFzb24pOwo+ID4gLSBQYXNzIHJpbmcgYWRkcmVzc2VzIGFzIEdQQXMvSU9WQXMgaW4gdmhvc3Qt
bWRldiB0byBhdm9pZAo+ID4gICAgbWVhbmluZ2xlc3MgSFZBLT5HUEEgdHJhbnNsYXRpb25zIChK
YXNvbik7Cj4gPiAKPiA+IFJGQyB2MyAtPiBSRkMgdjQ6Cj4gPiAtIEJ1aWxkIHZob3N0LW1kZXYg
b24gdG9wIG9mIHRoZSBzYW1lIGFic3RyYWN0aW9uIHVzZWQgYnkKPiA+ICAgIHZpcnRpby1tZGV2
IChKYXNvbik7Cj4gPiAtIEludHJvZHVjZSB2aG9zdCBmZCBhbmQgcGFzcyBWRklPIGZkIHZpYSBT
RVRfQkFDS0VORCBpb2N0bCAoTVNUKTsKPiA+IAo+ID4gUkZDIHYyIC0+IFJGQyB2MzoKPiA+IC0g
UmV1c2Ugdmhvc3QncyBpb2N0bHMgaW5zdGVhZCBvZiBpbnZlbnRpbmcgYSBWRklPIHJlZ2lvbnMv
aXJxcwo+ID4gICAgYmFzZWQgdmhvc3QgcHJvdG9jb2wgb24gdG9wIG9mIHZmaW8tbWRldiAoSmFz
b24pOwo+ID4gCj4gPiBSRkMgdjEgLT4gUkZDIHYyOgo+ID4gLSBJbnRyb2R1Y2UgYSBuZXcgVkZJ
TyBkZXZpY2UgdHlwZSB0byBidWlsZCBhIHZob3N0IHByb3RvY29sCj4gPiAgICBvbiB0b3Agb2Yg
dmZpby1tZGV2Owo+ID4gCj4gPiAgIGRyaXZlcnMvdmZpby9tZGV2L21kZXZfY29yZS5jICAgIHwg
IDIxICsrCj4gPiAgIGRyaXZlcnMvdmhvc3QvS2NvbmZpZyAgICAgICAgICAgIHwgIDEyICsKPiA+
ICAgZHJpdmVycy92aG9zdC9NYWtlZmlsZSAgICAgICAgICAgfCAgIDMgKwo+ID4gICBkcml2ZXJz
L3Zob3N0L21kZXYuYyAgICAgICAgICAgICB8IDU1MyArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4gPiAgIGluY2x1ZGUvbGludXgvbWRldi5oICAgICAgICAgICAgIHwgICA1ICsKPiA+
ICAgaW5jbHVkZS91YXBpL2xpbnV4L3Zob3N0LmggICAgICAgfCAgMTggKwo+ID4gICBpbmNsdWRl
L3VhcGkvbGludXgvdmhvc3RfdHlwZXMuaCB8ICAgOCArCj4gPiAgIDcgZmlsZXMgY2hhbmdlZCwg
NjIwIGluc2VydGlvbnMoKykKPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmhvc3Qv
bWRldi5jCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZmaW8vbWRldi9tZGV2X2NvcmUu
YyBiL2RyaXZlcnMvdmZpby9tZGV2L21kZXZfY29yZS5jCj4gPiBpbmRleCBjNTgyNTM0MDRlZDUu
LmQ4NTViZTVhZmJhZSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvdmZpby9tZGV2L21kZXZfY29y
ZS5jCj4gPiArKysgYi9kcml2ZXJzL3ZmaW8vbWRldi9tZGV2X2NvcmUuYwo+ID4gQEAgLTk5LDYg
Kzk5LDI3IEBAIG1kZXZfZ2V0X3ZpcnRpb19vcHMoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2KQo+
ID4gICB9Cj4gPiAgIEVYUE9SVF9TWU1CT0wobWRldl9nZXRfdmlydGlvX29wcyk7Cj4gPiArLyoK
PiA+ICsgKiBTcGVjaWZ5IHRoZSB2aG9zdCBkZXZpY2Ugb3BzIGZvciB0aGUgbWRldiBkZXZpY2Us
IHRoaXMKPiA+ICsgKiBtdXN0IGJlIGNhbGxlZCBkdXJpbmcgY3JlYXRlKCkgY2FsbGJhY2sgZm9y
IHZob3N0IG1kZXYgZGV2aWNlLgo+ID4gKyAqLwo+ID4gK3ZvaWQgbWRldl9zZXRfdmhvc3Rfb3Bz
KHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwKPiA+ICsJCQljb25zdCBzdHJ1Y3QgbWRldl92aXJ0
aW9fZGV2aWNlX29wcyAqdmhvc3Rfb3BzKQo+ID4gK3sKPiA+ICsJbWRldl9zZXRfY2xhc3MobWRl
diwgTURFVl9DTEFTU19JRF9WSE9TVCk7Cj4gPiArCW1kZXYtPnZpcnRpb19vcHMgPSB2aG9zdF9v
cHM7Cj4gPiArfQo+ID4gK0VYUE9SVF9TWU1CT0wobWRldl9zZXRfdmhvc3Rfb3BzKTsKPiA+ICsK
PiA+ICsvKiBHZXQgdGhlIHZob3N0IGRldmljZSBvcHMgZm9yIHRoZSBtZGV2IGRldmljZS4gKi8K
PiA+ICtjb25zdCBzdHJ1Y3QgbWRldl92aXJ0aW9fZGV2aWNlX29wcyAqCj4gPiArbWRldl9nZXRf
dmhvc3Rfb3BzKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldikKPiA+ICt7Cj4gPiArCVdBUk5fT04o
bWRldi0+Y2xhc3NfaWQgIT0gTURFVl9DTEFTU19JRF9WSE9TVCk7Cj4gPiArCXJldHVybiBtZGV2
LT52aXJ0aW9fb3BzOwo+ID4gK30KPiA+ICtFWFBPUlRfU1lNQk9MKG1kZXZfZ2V0X3Zob3N0X29w
cyk7Cj4gPiArCj4gPiAgIHN0cnVjdCBkZXZpY2UgKm1kZXZfZGV2KHN0cnVjdCBtZGV2X2Rldmlj
ZSAqbWRldikKPiA+ICAgewo+ID4gICAJcmV0dXJuICZtZGV2LT5kZXY7Cj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy92aG9zdC9LY29uZmlnIGIvZHJpdmVycy92aG9zdC9LY29uZmlnCj4gPiBpbmRl
eCAzZDAzY2NiZDFhZGMuLjA2MmNhZGEyOGY4OSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvdmhv
c3QvS2NvbmZpZwo+ID4gKysrIGIvZHJpdmVycy92aG9zdC9LY29uZmlnCj4gPiBAQCAtMzQsNiAr
MzQsMTggQEAgY29uZmlnIFZIT1NUX1ZTT0NLCj4gPiAgIAlUbyBjb21waWxlIHRoaXMgZHJpdmVy
IGFzIGEgbW9kdWxlLCBjaG9vc2UgTSBoZXJlOiB0aGUgbW9kdWxlIHdpbGwgYmUgY2FsbGVkCj4g
PiAgIAl2aG9zdF92c29jay4KPiA+ICtjb25maWcgVkhPU1RfTURFVgo+ID4gKwl0cmlzdGF0ZSAi
Vmhvc3QgZHJpdmVyIGZvciBNZWRpYXRlZCBkZXZpY2VzIgo+ID4gKwlkZXBlbmRzIG9uIEVWRU5U
RkQgJiYgVkZJTyAmJiBWRklPX01ERVYKPiA+ICsJc2VsZWN0IFZIT1NUCj4gPiArCWRlZmF1bHQg
bgo+ID4gKwktLS1oZWxwLS0tCj4gPiArCVRoaXMga2VybmVsIG1vZHVsZSBjYW4gYmUgbG9hZGVk
IGluIGhvc3Qga2VybmVsIHRvIGFjY2VsZXJhdGUKPiA+ICsJZ3Vlc3QgdmlydGlvIGRldmljZXMg
d2l0aCB0aGUgbWVkaWF0ZWQgZGV2aWNlIGJhc2VkIGJhY2tlbmRzLgo+ID4gKwo+ID4gKwlUbyBj
b21waWxlIHRoaXMgZHJpdmVyIGFzIGEgbW9kdWxlLCBjaG9vc2UgTSBoZXJlOiB0aGUgbW9kdWxl
IHdpbGwKPiA+ICsJYmUgY2FsbGVkIHZob3N0X21kZXYuCj4gPiArCj4gPiAgIGNvbmZpZyBWSE9T
VAo+ID4gICAJdHJpc3RhdGUKPiA+ICAgCS0tLWhlbHAtLS0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3Zob3N0L01ha2VmaWxlIGIvZHJpdmVycy92aG9zdC9NYWtlZmlsZQo+ID4gaW5kZXggNmM2
ZGYyNGY3NzBjLi5hZDljMGY4YzZkOGMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3Zob3N0L01h
a2VmaWxlCj4gPiArKysgYi9kcml2ZXJzL3Zob3N0L01ha2VmaWxlCj4gPiBAQCAtMTAsNCArMTAs
NyBAQCB2aG9zdF92c29jay15IDo9IHZzb2NrLm8KPiA+ICAgb2JqLSQoQ09ORklHX1ZIT1NUX1JJ
TkcpICs9IHZyaW5naC5vCj4gPiArb2JqLSQoQ09ORklHX1ZIT1NUX01ERVYpICs9IHZob3N0X21k
ZXYubwo+ID4gK3Zob3N0X21kZXYteSA6PSBtZGV2Lm8KPiA+ICsKPiA+ICAgb2JqLSQoQ09ORklH
X1ZIT1NUKQkrPSB2aG9zdC5vCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC9tZGV2LmMg
Yi9kcml2ZXJzL3Zob3N0L21kZXYuYwo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4
IDAwMDAwMDAwMDAwMC4uMGJjZGUwZjNhOWNkCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9k
cml2ZXJzL3Zob3N0L21kZXYuYwo+ID4gQEAgLTAsMCArMSw1NTMgQEAKPiA+ICsvLyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ID4gKy8qCj4gPiArICogVmhvc3QgZHJpdmVyIGZv
ciBtZWRpYXRlZCBkZXZpY2UgYmFzZWQgYmFja2VuZHMuCj4gPiArICoKPiA+ICsgKiBDb3B5cmln
aHQgKEMpIDIwMTgtMjAxOSBJbnRlbCBDb3Jwb3JhdGlvbi4KPiA+ICsgKgo+ID4gKyAqIEF1dGhv
cjogVGl3ZWkgQmllIDx0aXdlaS5iaWVAaW50ZWwuY29tPgo+ID4gKyAqCj4gPiArICogVGhhbmtz
IHRvIEphc29uIFdhbmcgYW5kIE1pY2hhZWwgUy4gVHNpcmtpbiBmb3IgdGhlIHZhbHVhYmxlCj4g
PiArICogY29tbWVudHMgYW5kIHN1Z2dlc3Rpb25zLiAgQW5kIHRoYW5rcyB0byBDdW5taW5nIExp
YW5nIGFuZAo+ID4gKyAqIFpoaWhvbmcgV2FuZyBmb3IgYWxsIHRoZWlyIHN1cHBvcnRzLgo+ID4g
KyAqLwo+ID4gKwo+ID4gKyNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiA+ICsjaW5jbHVkZSA8
bGludXgvbW9kdWxlLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L21kZXYuaD4KPiA+ICsjaW5jbHVk
ZSA8bGludXgvbWRldl92aXJ0aW9fb3BzLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L25vc3BlYy5o
Pgo+ID4gKyNpbmNsdWRlIDxsaW51eC92ZmlvLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L3Zob3N0
Lmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L3ZpcnRpb19uZXQuaD4KPiA+ICsKPiA+ICsjaW5jbHVk
ZSAidmhvc3QuaCIKPiA+ICsKPiA+ICtlbnVtIHsKPiA+ICsJVkhPU1RfTURFVl9GRUFUVVJFUyA9
Cj4gPiArCQkoMVVMTCA8PCBWSVJUSU9fRl9OT1RJRllfT05fRU1QVFkpIHwKPiA+ICsJCSgxVUxM
IDw8IFZJUlRJT19GX0FOWV9MQVlPVVQpIHwKPiA+ICsJCSgxVUxMIDw8IFZJUlRJT19GX1ZFUlNJ
T05fMSkgfAo+ID4gKwkJKDFVTEwgPDwgVklSVElPX0ZfSU9NTVVfUExBVEZPUk0pIHwKPiA+ICsJ
CSgxVUxMIDw8IFZJUlRJT19GX1JJTkdfUEFDS0VEKSB8Cj4gPiArCQkoMVVMTCA8PCBWSVJUSU9f
Rl9PUkRFUl9QTEFURk9STSkgfAo+ID4gKwkJKDFVTEwgPDwgVklSVElPX1JJTkdfRl9JTkRJUkVD
VF9ERVNDKSB8Cj4gPiArCQkoMVVMTCA8PCBWSVJUSU9fUklOR19GX0VWRU5UX0lEWCksCj4gPiAr
Cj4gPiArCVZIT1NUX01ERVZfTkVUX0ZFQVRVUkVTID0gVkhPU1RfTURFVl9GRUFUVVJFUyB8Cj4g
PiArCQkoMVVMTCA8PCBWSVJUSU9fTkVUX0ZfQ1NVTSkgfAo+ID4gKwkJKDFVTEwgPDwgVklSVElP
X05FVF9GX0dVRVNUX0NTVU0pIHwKPiA+ICsJCSgxVUxMIDw8IFZJUlRJT19ORVRfRl9NVFUpIHwK
PiA+ICsJCSgxVUxMIDw8IFZJUlRJT19ORVRfRl9NQUMpIHwKPiA+ICsJCSgxVUxMIDw8IFZJUlRJ
T19ORVRfRl9HVUVTVF9UU080KSB8Cj4gPiArCQkoMVVMTCA8PCBWSVJUSU9fTkVUX0ZfR1VFU1Rf
VFNPNikgfAo+ID4gKwkJKDFVTEwgPDwgVklSVElPX05FVF9GX0dVRVNUX0VDTikgfAo+ID4gKwkJ
KDFVTEwgPDwgVklSVElPX05FVF9GX0dVRVNUX1VGTykgfAo+ID4gKwkJKDFVTEwgPDwgVklSVElP
X05FVF9GX0hPU1RfVFNPNCkgfAo+ID4gKwkJKDFVTEwgPDwgVklSVElPX05FVF9GX0hPU1RfVFNP
NikgfAo+ID4gKwkJKDFVTEwgPDwgVklSVElPX05FVF9GX0hPU1RfRUNOKSB8Cj4gPiArCQkoMVVM
TCA8PCBWSVJUSU9fTkVUX0ZfSE9TVF9VRk8pIHwKPiA+ICsJCSgxVUxMIDw8IFZJUlRJT19ORVRf
Rl9NUkdfUlhCVUYpIHwKPiA+ICsJCSgxVUxMIDw8IFZJUlRJT19ORVRfRl9TVEFUVVMpIHwKPiA+
ICsJCSgxVUxMIDw8IFZJUlRJT19ORVRfRl9TUEVFRF9EVVBMRVgpLAo+ID4gK307Cj4gPiArCj4g
PiArLyogQ3VycmVudGx5LCBvbmx5IG5ldHdvcmsgYmFja2VuZCB3L28gbXVsdGlxdWV1ZSBpcyBz
dXBwb3J0ZWQuICovCj4gPiArI2RlZmluZSBWSE9TVF9NREVWX1ZRX01BWAkyCj4gPiArCj4gPiAr
c3RydWN0IHZob3N0X21kZXYgewo+ID4gKwkvKiBUaGUgbG9jayBpcyB0byBwcm90ZWN0IHRoaXMg
c3RydWN0dXJlLiAqLwo+ID4gKwlzdHJ1Y3QgbXV0ZXggbXV0ZXg7Cj4gPiArCXN0cnVjdCB2aG9z
dF9kZXYgZGV2Owo+ID4gKwlzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cXM7Cj4gPiArCWludCBu
dnFzOwo+ID4gKwlpbnQgdmlydGlvX2lkOwo+ID4gKwlib29sIG9wZW5lZDsKPiA+ICsJc3RydWN0
IG1kZXZfZGV2aWNlICptZGV2Owo+ID4gK307Cj4gPiArCj4gPiArc3RhdGljIGNvbnN0IHU2NCB2
aG9zdF9tZGV2X2ZlYXR1cmVzW10gPSB7Cj4gPiArCVtWSVJUSU9fSURfTkVUXSA9IFZIT1NUX01E
RVZfTkVUX0ZFQVRVUkVTLAo+ID4gK307Cj4gPiArCj4gPiArc3RhdGljIHZvaWQgaGFuZGxlX3Zx
X2tpY2soc3RydWN0IHZob3N0X3dvcmsgKndvcmspCj4gPiArewo+ID4gKwlzdHJ1Y3Qgdmhvc3Rf
dmlydHF1ZXVlICp2cSA9IGNvbnRhaW5lcl9vZih3b3JrLCBzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVl
LAo+ID4gKwkJCQkJCSAgcG9sbC53b3JrKTsKPiA+ICsJc3RydWN0IHZob3N0X21kZXYgKm0gPSBj
b250YWluZXJfb2YodnEtPmRldiwgc3RydWN0IHZob3N0X21kZXYsIGRldik7Cj4gPiArCWNvbnN0
IHN0cnVjdCBtZGV2X3ZpcnRpb19kZXZpY2Vfb3BzICpvcHMgPSBtZGV2X2dldF92aG9zdF9vcHMo
bS0+bWRldik7Cj4gPiArCj4gPiArCW9wcy0+a2lja192cShtLT5tZGV2LCB2cSAtIG0tPnZxcyk7
Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBpcnFyZXR1cm5fdCB2aG9zdF9tZGV2X3ZpcnRxdWV1
ZV9jYih2b2lkICpwcml2YXRlKQo+ID4gK3sKPiA+ICsJc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAq
dnEgPSBwcml2YXRlOwo+ID4gKwlzdHJ1Y3QgZXZlbnRmZF9jdHggKmNhbGxfY3R4ID0gdnEtPmNh
bGxfY3R4Owo+ID4gKwo+ID4gKwlpZiAoY2FsbF9jdHgpCj4gPiArCQlldmVudGZkX3NpZ25hbChj
YWxsX2N0eCwgMSk7Cj4gPiArCj4gPiArCXJldHVybiBJUlFfSEFORExFRDsKPiA+ICt9Cj4gPiAr
Cj4gPiArc3RhdGljIHZvaWQgdmhvc3RfbWRldl9yZXNldChzdHJ1Y3Qgdmhvc3RfbWRldiAqbSkK
PiA+ICt7Cj4gPiArCXN0cnVjdCBtZGV2X2RldmljZSAqbWRldiA9IG0tPm1kZXY7Cj4gPiArCWNv
bnN0IHN0cnVjdCBtZGV2X3ZpcnRpb19kZXZpY2Vfb3BzICpvcHMgPSBtZGV2X2dldF92aG9zdF9v
cHMobWRldik7Cj4gPiArCj4gPiArCW9wcy0+c2V0X3N0YXR1cyhtZGV2LCAwKTsKPiA+ICt9Cj4g
PiArCj4gPiArc3RhdGljIGxvbmcgdmhvc3RfbWRldl9nZXRfZGV2aWNlX2lkKHN0cnVjdCB2aG9z
dF9tZGV2ICptLCB1OCBfX3VzZXIgKmFyZ3ApCj4gPiArewo+ID4gKwlzdHJ1Y3QgbWRldl9kZXZp
Y2UgKm1kZXYgPSBtLT5tZGV2Owo+ID4gKwljb25zdCBzdHJ1Y3QgbWRldl92aXJ0aW9fZGV2aWNl
X29wcyAqb3BzID0gbWRldl9nZXRfdmhvc3Rfb3BzKG1kZXYpOwo+ID4gKwl1MzIgZGV2aWNlX2lk
Owo+ID4gKwo+ID4gKwlkZXZpY2VfaWQgPSBvcHMtPmdldF9kZXZpY2VfaWQobWRldik7Cj4gPiAr
Cj4gPiArCWlmIChjb3B5X3RvX3VzZXIoYXJncCwgJmRldmljZV9pZCwgc2l6ZW9mKGRldmljZV9p
ZCkpKQo+ID4gKwkJcmV0dXJuIC1FRkFVTFQ7Cj4gPiArCj4gPiArCXJldHVybiAwOwo+ID4gK30K
PiA+ICsKPiA+ICtzdGF0aWMgbG9uZyB2aG9zdF9tZGV2X2dldF9zdGF0dXMoc3RydWN0IHZob3N0
X21kZXYgKm0sIHU4IF9fdXNlciAqc3RhdHVzcCkKPiA+ICt7Cj4gPiArCXN0cnVjdCBtZGV2X2Rl
dmljZSAqbWRldiA9IG0tPm1kZXY7Cj4gPiArCWNvbnN0IHN0cnVjdCBtZGV2X3ZpcnRpb19kZXZp
Y2Vfb3BzICpvcHMgPSBtZGV2X2dldF92aG9zdF9vcHMobWRldik7Cj4gPiArCXU4IHN0YXR1czsK
PiA+ICsKPiA+ICsJc3RhdHVzID0gb3BzLT5nZXRfc3RhdHVzKG1kZXYpOwo+ID4gKwo+ID4gKwlp
ZiAoY29weV90b191c2VyKHN0YXR1c3AsICZzdGF0dXMsIHNpemVvZihzdGF0dXMpKSkKPiA+ICsJ
CXJldHVybiAtRUZBVUxUOwo+ID4gKwo+ID4gKwlyZXR1cm4gMDsKPiA+ICt9Cj4gPiArCj4gPiAr
c3RhdGljIGxvbmcgdmhvc3RfbWRldl9zZXRfc3RhdHVzKHN0cnVjdCB2aG9zdF9tZGV2ICptLCB1
OCBfX3VzZXIgKnN0YXR1c3ApCj4gPiArewo+ID4gKwlzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYg
PSBtLT5tZGV2Owo+ID4gKwljb25zdCBzdHJ1Y3QgbWRldl92aXJ0aW9fZGV2aWNlX29wcyAqb3Bz
ID0gbWRldl9nZXRfdmhvc3Rfb3BzKG1kZXYpOwo+ID4gKwl1OCBzdGF0dXM7Cj4gPiArCj4gPiAr
CWlmIChjb3B5X2Zyb21fdXNlcigmc3RhdHVzLCBzdGF0dXNwLCBzaXplb2Yoc3RhdHVzKSkpCj4g
PiArCQlyZXR1cm4gLUVGQVVMVDsKPiA+ICsKPiA+ICsJLyoKPiA+ICsJICogVXNlcnNwYWNlIHNo
b3VsZG4ndCByZW1vdmUgc3RhdHVzIGJpdHMgdW5sZXNzIHJlc2V0IHRoZQo+ID4gKwkgKiBzdGF0
dXMgdG8gMC4KPiA+ICsJICovCj4gPiArCWlmIChzdGF0dXMgIT0gMCAmJiAob3BzLT5nZXRfc3Rh
dHVzKG1kZXYpICYgfnN0YXR1cykgIT0gMCkKPiA+ICsJCXJldHVybiAtRUlOVkFMOwo+ID4gKwo+
ID4gKwlvcHMtPnNldF9zdGF0dXMobWRldiwgc3RhdHVzKTsKPiA+ICsKPiA+ICsJcmV0dXJuIDA7
Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBpbnQgdmhvc3RfbWRldl9jb25maWdfdmFsaWRhdGUo
c3RydWN0IHZob3N0X21kZXYgKm0sCj4gPiArCQkJCSAgICAgIHN0cnVjdCB2aG9zdF9tZGV2X2Nv
bmZpZyAqYykKPiA+ICt7Cj4gPiArCWxvbmcgc2l6ZSA9IDA7Cj4gPiArCj4gPiArCXN3aXRjaCAo
bS0+dmlydGlvX2lkKSB7Cj4gPiArCWNhc2UgVklSVElPX0lEX05FVDoKPiA+ICsJCXNpemUgPSBz
aXplb2Yoc3RydWN0IHZpcnRpb19uZXRfY29uZmlnKTsKPiA+ICsJCWJyZWFrOwo+ID4gKwl9Cj4g
PiArCj4gPiArCWlmIChjLT5sZW4gPT0gMCkKPiA+ICsJCXJldHVybiAtRUlOVkFMOwo+ID4gKwo+
ID4gKwlpZiAoYy0+b2ZmID49IHNpemUgfHwgYy0+bGVuID4gc2l6ZSB8fCBjLT5vZmYgKyBjLT5s
ZW4gPiBzaXplKQo+ID4gKwkJcmV0dXJuIC1FMkJJRzsKPiAKPiAKPiBOaXQ6IEl0IHNob3VsZCBi
ZSB0aGUgc2FtZSBhcyBjaGVjayB3aXRoIGMtPm9mZiArIGMtPmxlbiA+IHNpemUgb25seS4KCkkg
ZGlkIGEgcXVpY2sgdGVzdCB3aXRoIGJlbG93IHByb2dyYW06CgojaW5jbHVkZSA8c3RkaW8uaD4K
CmludCBtYWluKHZvaWQpCnsKCXVuc2lnbmVkIGludCBhLCBiOwoJbG9uZyBjOwoKCXNjYW5mKCIl
dSV1JWxkIiwgJmEsICZiLCAmYyk7CglwcmludGYoIiVkXG4iLCBhICsgYiA+IGMpOwoJcHJpbnRm
KCIlZFxuIiwgKGxvbmcpYSArIGIgPiBjKTsKCglyZXR1cm4gMDsKfQoKQW5kIEkgZ290IHRoaXM6
CgokIGVjaG8gNDI5NDk2NzI5NSAxIDEgfCAuL2Eub3V0CjAKMQoKQXMgYy0+b2ZmIGFuZCBjLT5s
ZW4gYXJlIF9fdTMyLCB3ZSB3b3VsZCBuZWVkIHRvIGNhc3Qgb25lIG9mCnRoZW0gdG8gbG9uZyBp
ZiB3ZSB3YW50IHRvIGp1c3QgY2hlY2sgYy0+b2ZmICsgYy0+bGVuID4gc2l6ZSwKZS5nLiAobG9u
ZyljLT5vZmYgKyBjLT5sZW4gPiBzaXplCgpPZmYgdGhlIHRvcGljLCBvbmUgdGhpbmcgSSdtIG5v
dCBxdWl0ZSBzdXJlIGFib3V0IGFuZCB3YW50IHRvCmNvbmZpcm0gaXMgdGhhdCwgd2lsbCBpdCBi
ZSBiZXR0ZXIgdG8gZGVmaW5lIGMtPm9mZiBhbmQgYy0+bGVuCmFzIF9fdTY0ICh0aGV5IGFyZSBw
YXJ0cyBvZiBVQVBJKT8KCj4gCj4gCj4gPiArCj4gPiArCXJldHVybiAwOwo+ID4gK30KPiA+ICsK
PiA+ICtzdGF0aWMgbG9uZyB2aG9zdF9tZGV2X2dldF9jb25maWcoc3RydWN0IHZob3N0X21kZXYg
Km0sCj4gPiArCQkJCSAgc3RydWN0IHZob3N0X21kZXZfY29uZmlnIF9fdXNlciAqYykKPiA+ICt7
Cj4gPiArCXN0cnVjdCBtZGV2X2RldmljZSAqbWRldiA9IG0tPm1kZXY7Cj4gPiArCWNvbnN0IHN0
cnVjdCBtZGV2X3ZpcnRpb19kZXZpY2Vfb3BzICpvcHMgPSBtZGV2X2dldF92aG9zdF9vcHMobWRl
dik7Cj4gPiArCXN0cnVjdCB2aG9zdF9tZGV2X2NvbmZpZyBjb25maWc7Cj4gPiArCXVuc2lnbmVk
IGxvbmcgc2l6ZSA9IG9mZnNldG9mKHN0cnVjdCB2aG9zdF9tZGV2X2NvbmZpZywgYnVmKTsKPiA+
ICsJdTggKmJ1ZjsKPiA+ICsKPiA+ICsJaWYgKGNvcHlfZnJvbV91c2VyKCZjb25maWcsIGMsIHNp
emUpKQo+ID4gKwkJcmV0dXJuIC1FRkFVTFQ7Cj4gPiArCWlmICh2aG9zdF9tZGV2X2NvbmZpZ192
YWxpZGF0ZShtLCAmY29uZmlnKSkKPiA+ICsJCXJldHVybiAtRUlOVkFMOwo+ID4gKwlidWYgPSBr
dnphbGxvYyhjb25maWcubGVuLCBHRlBfS0VSTkVMKTsKPiA+ICsJaWYgKCFidWYpCj4gPiArCQly
ZXR1cm4gLUVOT01FTTsKPiA+ICsKPiA+ICsJb3BzLT5nZXRfY29uZmlnKG1kZXYsIGNvbmZpZy5v
ZmYsIGJ1ZiwgY29uZmlnLmxlbik7Cj4gPiArCj4gPiArCWlmIChjb3B5X3RvX3VzZXIoYy0+YnVm
LCBidWYsIGNvbmZpZy5sZW4pKSB7Cj4gPiArCQlrdmZyZWUoYnVmKTsKPiA+ICsJCXJldHVybiAt
RUZBVUxUOwo+ID4gKwl9Cj4gPiArCj4gPiArCWt2ZnJlZShidWYpOwo+ID4gKwlyZXR1cm4gMDsK
PiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIGxvbmcgdmhvc3RfbWRldl9zZXRfY29uZmlnKHN0cnVj
dCB2aG9zdF9tZGV2ICptLAo+ID4gKwkJCQkgIHN0cnVjdCB2aG9zdF9tZGV2X2NvbmZpZyBfX3Vz
ZXIgKmMpCj4gPiArewo+ID4gKwlzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYgPSBtLT5tZGV2Owo+
ID4gKwljb25zdCBzdHJ1Y3QgbWRldl92aXJ0aW9fZGV2aWNlX29wcyAqb3BzID0gbWRldl9nZXRf
dmhvc3Rfb3BzKG1kZXYpOwo+ID4gKwlzdHJ1Y3Qgdmhvc3RfbWRldl9jb25maWcgY29uZmlnOwo+
ID4gKwl1bnNpZ25lZCBsb25nIHNpemUgPSBvZmZzZXRvZihzdHJ1Y3Qgdmhvc3RfbWRldl9jb25m
aWcsIGJ1Zik7Cj4gPiArCXU4ICpidWY7Cj4gPiArCj4gPiArCWlmIChjb3B5X2Zyb21fdXNlcigm
Y29uZmlnLCBjLCBzaXplKSkKPiA+ICsJCXJldHVybiAtRUZBVUxUOwo+ID4gKwlpZiAodmhvc3Rf
bWRldl9jb25maWdfdmFsaWRhdGUobSwgJmNvbmZpZykpCj4gPiArCQlyZXR1cm4gLUVJTlZBTDsK
PiA+ICsJYnVmID0ga3Z6YWxsb2MoY29uZmlnLmxlbiwgR0ZQX0tFUk5FTCk7Cj4gPiArCWlmICgh
YnVmKQo+ID4gKwkJcmV0dXJuIC1FTk9NRU07Cj4gPiArCj4gPiArCWlmIChjb3B5X2Zyb21fdXNl
cihidWYsIGMtPmJ1ZiwgY29uZmlnLmxlbikpIHsKPiA+ICsJCWt2ZnJlZShidWYpOwo+ID4gKwkJ
cmV0dXJuIC1FRkFVTFQ7Cj4gPiArCX0KPiA+ICsKPiA+ICsJb3BzLT5zZXRfY29uZmlnKG1kZXYs
IGNvbmZpZy5vZmYsIGJ1ZiwgY29uZmlnLmxlbik7Cj4gPiArCj4gPiArCWt2ZnJlZShidWYpOwo+
ID4gKwlyZXR1cm4gMDsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIGxvbmcgdmhvc3RfbWRldl9n
ZXRfZmVhdHVyZXMoc3RydWN0IHZob3N0X21kZXYgKm0sIHU2NCBfX3VzZXIgKmZlYXR1cmVwKQo+
ID4gK3sKPiA+ICsJc3RydWN0IG1kZXZfZGV2aWNlICptZGV2ID0gbS0+bWRldjsKPiA+ICsJY29u
c3Qgc3RydWN0IG1kZXZfdmlydGlvX2RldmljZV9vcHMgKm9wcyA9IG1kZXZfZ2V0X3Zob3N0X29w
cyhtZGV2KTsKPiA+ICsJdTY0IGZlYXR1cmVzOwo+ID4gKwo+ID4gKwlmZWF0dXJlcyA9IG9wcy0+
Z2V0X2ZlYXR1cmVzKG1kZXYpOwo+ID4gKwlmZWF0dXJlcyAmPSB2aG9zdF9tZGV2X2ZlYXR1cmVz
W20tPnZpcnRpb19pZF07Cj4gPiArCj4gPiArCWlmIChjb3B5X3RvX3VzZXIoZmVhdHVyZXAsICZm
ZWF0dXJlcywgc2l6ZW9mKGZlYXR1cmVzKSkpCj4gPiArCQlyZXR1cm4gLUVGQVVMVDsKPiA+ICsK
PiA+ICsJcmV0dXJuIDA7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBsb25nIHZob3N0X21kZXZf
c2V0X2ZlYXR1cmVzKHN0cnVjdCB2aG9zdF9tZGV2ICptLCB1NjQgX191c2VyICpmZWF0dXJlcCkK
PiA+ICt7Cj4gPiArCXN0cnVjdCBtZGV2X2RldmljZSAqbWRldiA9IG0tPm1kZXY7Cj4gPiArCWNv
bnN0IHN0cnVjdCBtZGV2X3ZpcnRpb19kZXZpY2Vfb3BzICpvcHMgPSBtZGV2X2dldF92aG9zdF9v
cHMobWRldik7Cj4gPiArCXU2NCBmZWF0dXJlczsKPiA+ICsKPiA+ICsJLyoKPiA+ICsJICogSXQn
cyBub3QgYWxsb3dlZCB0byBjaGFuZ2UgdGhlIGZlYXR1cmVzIGFmdGVyIHRoZXkgaGF2ZQo+ID4g
KwkgKiBiZWVuIG5lZ290aWF0ZWQuCj4gPiArCSAqLwo+ID4gKwlpZiAob3BzLT5nZXRfc3RhdHVz
KG1kZXYpICYgVklSVElPX0NPTkZJR19TX0ZFQVRVUkVTX09LKQo+ID4gKwkJcmV0dXJuIC1FQlVT
WTsKPiA+ICsKPiA+ICsJaWYgKGNvcHlfZnJvbV91c2VyKCZmZWF0dXJlcywgZmVhdHVyZXAsIHNp
emVvZihmZWF0dXJlcykpKQo+ID4gKwkJcmV0dXJuIC1FRkFVTFQ7Cj4gPiArCj4gPiArCWlmIChm
ZWF0dXJlcyAmIH52aG9zdF9tZGV2X2ZlYXR1cmVzW20tPnZpcnRpb19pZF0pCj4gPiArCQlyZXR1
cm4gLUVJTlZBTDsKPiA+ICsKPiA+ICsJaWYgKG9wcy0+c2V0X2ZlYXR1cmVzKG1kZXYsIGZlYXR1
cmVzKSkKPiA+ICsJCXJldHVybiAtRUlOVkFMOwo+ID4gKwo+ID4gKwlyZXR1cm4gMDsKPiA+ICt9
Cj4gPiArCj4gPiArc3RhdGljIGxvbmcgdmhvc3RfbWRldl9nZXRfdnJpbmdfbnVtKHN0cnVjdCB2
aG9zdF9tZGV2ICptLCB1MTYgX191c2VyICphcmdwKQo+ID4gK3sKPiA+ICsJc3RydWN0IG1kZXZf
ZGV2aWNlICptZGV2ID0gbS0+bWRldjsKPiA+ICsJY29uc3Qgc3RydWN0IG1kZXZfdmlydGlvX2Rl
dmljZV9vcHMgKm9wcyA9IG1kZXZfZ2V0X3Zob3N0X29wcyhtZGV2KTsKPiA+ICsJdTE2IG51bTsK
PiA+ICsKPiA+ICsJbnVtID0gb3BzLT5nZXRfdnFfbnVtX21heChtZGV2KTsKPiA+ICsKPiA+ICsJ
aWYgKGNvcHlfdG9fdXNlcihhcmdwLCAmbnVtLCBzaXplb2YobnVtKSkpCj4gPiArCQlyZXR1cm4g
LUVGQVVMVDsKPiA+ICsKPiA+ICsJcmV0dXJuIDA7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBs
b25nIHZob3N0X21kZXZfdnJpbmdfaW9jdGwoc3RydWN0IHZob3N0X21kZXYgKm0sIHVuc2lnbmVk
IGludCBjbWQsCj4gPiArCQkJCSAgIHZvaWQgX191c2VyICphcmdwKQo+ID4gK3sKPiA+ICsJc3Ry
dWN0IG1kZXZfZGV2aWNlICptZGV2ID0gbS0+bWRldjsKPiA+ICsJY29uc3Qgc3RydWN0IG1kZXZf
dmlydGlvX2RldmljZV9vcHMgKm9wcyA9IG1kZXZfZ2V0X3Zob3N0X29wcyhtZGV2KTsKPiA+ICsJ
c3RydWN0IHZpcnRpb19tZGV2X2NhbGxiYWNrIGNiOwo+ID4gKwlzdHJ1Y3Qgdmhvc3RfdmlydHF1
ZXVlICp2cTsKPiA+ICsJc3RydWN0IHZob3N0X3ZyaW5nX3N0YXRlIHM7Cj4gPiArCXU4IHN0YXR1
czsKPiA+ICsJdTMyIGlkeDsKPiA+ICsJbG9uZyByOwo+ID4gKwo+ID4gKwlyID0gZ2V0X3VzZXIo
aWR4LCAodTMyIF9fdXNlciAqKWFyZ3ApOwo+ID4gKwlpZiAociA8IDApCj4gPiArCQlyZXR1cm4g
cjsKPiA+ICsJaWYgKGlkeCA+PSBtLT5udnFzKQo+ID4gKwkJcmV0dXJuIC1FTk9CVUZTOwo+ID4g
Kwo+ID4gKwlpZHggPSBhcnJheV9pbmRleF9ub3NwZWMoaWR4LCBtLT5udnFzKTsKPiA+ICsJdnEg
PSAmbS0+dnFzW2lkeF07Cj4gPiArCj4gPiArCXN0YXR1cyA9IG9wcy0+Z2V0X3N0YXR1cyhtZGV2
KTsKPiA+ICsKPiA+ICsJLyoKPiA+ICsJICogSXQncyBub3QgYWxsb3dlZCB0byBkZXRlY3QgYW5k
IHByb2dyYW0gdnFzIGJlZm9yZQo+ID4gKwkgKiBmZWF0dXJlcyBuZWdvdGlhdGlvbiBvciBhZnRl
ciBlbmFibGluZyBkcml2ZXIuCj4gPiArCSAqLwo+ID4gKwlpZiAoIShzdGF0dXMgJiBWSVJUSU9f
Q09ORklHX1NfRkVBVFVSRVNfT0spIHx8Cj4gPiArCSAgICAoc3RhdHVzICYgVklSVElPX0NPTkZJ
R19TX0RSSVZFUl9PSykpCj4gPiArCQlyZXR1cm4gLUVCVVNZOwo+ID4gKwo+ID4gKwlpZiAoY21k
ID09IFZIT1NUX01ERVZfU0VUX1ZSSU5HX0VOQUJMRSkgewo+ID4gKwkJaWYgKGNvcHlfZnJvbV91
c2VyKCZzLCBhcmdwLCBzaXplb2YocykpKQo+ID4gKwkJCXJldHVybiAtRUZBVUxUOwo+ID4gKwkJ
b3BzLT5zZXRfdnFfcmVhZHkobWRldiwgaWR4LCBzLm51bSk7Cj4gPiArCQlyZXR1cm4gMDsKPiA+
ICsJfQo+ID4gKwo+ID4gKwkvKgo+ID4gKwkgKiBJdCdzIG5vdCBhbGxvd2VkIHRvIGRldGVjdCBh
bmQgcHJvZ3JhbSB2cXMgd2l0aAo+ID4gKwkgKiB2cXMgZW5hYmxlZC4KPiA+ICsJICovCj4gPiAr
CWlmIChvcHMtPmdldF92cV9yZWFkeShtZGV2LCBpZHgpKQo+ID4gKwkJcmV0dXJuIC1FQlVTWTsK
PiA+ICsKPiA+ICsJaWYgKGNtZCA9PSBWSE9TVF9HRVRfVlJJTkdfQkFTRSkKPiA+ICsJCXZxLT5s
YXN0X2F2YWlsX2lkeCA9IG9wcy0+Z2V0X3ZxX3N0YXRlKG0tPm1kZXYsIGlkeCk7Cj4gPiArCj4g
PiArCXIgPSB2aG9zdF92cmluZ19pb2N0bCgmbS0+ZGV2LCBjbWQsIGFyZ3ApOwo+ID4gKwlpZiAo
cikKPiA+ICsJCXJldHVybiByOwo+ID4gKwo+ID4gKwlzd2l0Y2ggKGNtZCkgewo+ID4gKwljYXNl
IFZIT1NUX1NFVF9WUklOR19BRERSOgo+ID4gKwkJLyoKPiA+ICsJCSAqIEluIHZob3N0LW1kZXYs
IHRoZSByaW5nIGFkZHJlc3NlcyBzZXQgYnkgdXNlcnNwYWNlIHNob3VsZAo+ID4gKwkJICogYmUg
dGhlIERNQSBhZGRyZXNzZXMgd2l0aGluIHRoZSBWRklPIGNvbnRhaW5lci9ncm91cC4KPiA+ICsJ
CSAqLwo+ID4gKwkJaWYgKG9wcy0+c2V0X3ZxX2FkZHJlc3MobWRldiwgaWR4LCAodTY0KXZxLT5k
ZXNjLAo+ID4gKwkJCQkJKHU2NCl2cS0+YXZhaWwsICh1NjQpdnEtPnVzZWQpKQo+ID4gKwkJCXIg
PSAtRUlOVkFMOwo+ID4gKwkJYnJlYWs7Cj4gPiArCj4gPiArCWNhc2UgVkhPU1RfU0VUX1ZSSU5H
X0JBU0U6Cj4gPiArCQlpZiAob3BzLT5zZXRfdnFfc3RhdGUobWRldiwgaWR4LCB2cS0+bGFzdF9h
dmFpbF9pZHgpKQo+ID4gKwkJCXIgPSAtRUlOVkFMOwo+ID4gKwkJYnJlYWs7Cj4gPiArCj4gPiAr
CWNhc2UgVkhPU1RfU0VUX1ZSSU5HX0NBTEw6Cj4gPiArCQlpZiAodnEtPmNhbGxfY3R4KSB7Cj4g
PiArCQkJY2IuY2FsbGJhY2sgPSB2aG9zdF9tZGV2X3ZpcnRxdWV1ZV9jYjsKPiA+ICsJCQljYi5w
cml2YXRlID0gdnE7Cj4gPiArCQl9IGVsc2Ugewo+ID4gKwkJCWNiLmNhbGxiYWNrID0gTlVMTDsK
PiA+ICsJCQljYi5wcml2YXRlID0gTlVMTDsKPiA+ICsJCX0KPiA+ICsJCW9wcy0+c2V0X3ZxX2Ni
KG1kZXYsIGlkeCwgJmNiKTsKPiA+ICsJCWJyZWFrOwo+ID4gKwo+ID4gKwljYXNlIFZIT1NUX1NF
VF9WUklOR19OVU06Cj4gPiArCQlvcHMtPnNldF92cV9udW0obWRldiwgaWR4LCB2cS0+bnVtKTsK
PiA+ICsJCWJyZWFrOwo+ID4gKwl9Cj4gPiArCj4gPiArCXJldHVybiByOwo+ID4gK30KPiA+ICsK
PiA+ICtzdGF0aWMgaW50IHZob3N0X21kZXZfb3Blbih2b2lkICpkZXZpY2VfZGF0YSkKPiA+ICt7
Cj4gPiArCXN0cnVjdCB2aG9zdF9tZGV2ICptID0gZGV2aWNlX2RhdGE7Cj4gPiArCXN0cnVjdCB2
aG9zdF9kZXYgKmRldjsKPiA+ICsJc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqKnZxczsKPiA+ICsJ
aW50IG52cXMsIGksIHI7Cj4gPiArCj4gPiArCWlmICghdHJ5X21vZHVsZV9nZXQoVEhJU19NT0RV
TEUpKQo+ID4gKwkJcmV0dXJuIC1FTk9ERVY7Cj4gPiArCj4gPiArCW11dGV4X2xvY2soJm0tPm11
dGV4KTsKPiA+ICsKPiA+ICsJaWYgKG0tPm9wZW5lZCkgewo+ID4gKwkJciA9IC1FQlVTWTsKPiA+
ICsJCWdvdG8gZXJyOwo+ID4gKwl9Cj4gPiArCj4gPiArCW52cXMgPSBtLT5udnFzOwo+ID4gKwl2
aG9zdF9tZGV2X3Jlc2V0KG0pOwo+ID4gKwo+ID4gKwl2cXMgPSBrbWFsbG9jX2FycmF5KG52cXMs
IHNpemVvZigqdnFzKSwgR0ZQX0tFUk5FTCk7Cj4gPiArCWlmICghdnFzKSB7Cj4gPiArCQlyID0g
LUVOT01FTTsKPiA+ICsJCWdvdG8gZXJyOwo+ID4gKwl9Cj4gPiArCj4gPiArCWRldiA9ICZtLT5k
ZXY7Cj4gPiArCWZvciAoaSA9IDA7IGkgPCBudnFzOyBpKyspIHsKPiA+ICsJCXZxc1tpXSA9ICZt
LT52cXNbaV07Cj4gPiArCQl2cXNbaV0tPmhhbmRsZV9raWNrID0gaGFuZGxlX3ZxX2tpY2s7Cj4g
PiArCX0KPiA+ICsJdmhvc3RfZGV2X2luaXQoZGV2LCB2cXMsIG52cXMsIDAsIDAsIDApOwo+ID4g
KwltLT5vcGVuZWQgPSB0cnVlOwo+ID4gKwltdXRleF91bmxvY2soJm0tPm11dGV4KTsKPiA+ICsK
PiA+ICsJcmV0dXJuIDA7Cj4gPiArCj4gPiArZXJyOgo+ID4gKwltdXRleF91bmxvY2soJm0tPm11
dGV4KTsKPiA+ICsJbW9kdWxlX3B1dChUSElTX01PRFVMRSk7Cj4gPiArCXJldHVybiByOwo+ID4g
K30KPiA+ICsKPiA+ICtzdGF0aWMgdm9pZCB2aG9zdF9tZGV2X3JlbGVhc2Uodm9pZCAqZGV2aWNl
X2RhdGEpCj4gPiArewo+ID4gKwlzdHJ1Y3Qgdmhvc3RfbWRldiAqbSA9IGRldmljZV9kYXRhOwo+
ID4gKwo+ID4gKwltdXRleF9sb2NrKCZtLT5tdXRleCk7Cj4gPiArCXZob3N0X21kZXZfcmVzZXQo
bSk7Cj4gPiArCXZob3N0X2Rldl9zdG9wKCZtLT5kZXYpOwo+ID4gKwl2aG9zdF9kZXZfY2xlYW51
cCgmbS0+ZGV2KTsKPiA+ICsKPiA+ICsJa2ZyZWUobS0+ZGV2LnZxcyk7Cj4gPiArCW0tPm9wZW5l
ZCA9IGZhbHNlOwo+ID4gKwltdXRleF91bmxvY2soJm0tPm11dGV4KTsKPiA+ICsJbW9kdWxlX3B1
dChUSElTX01PRFVMRSk7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBsb25nIHZob3N0X21kZXZf
dW5sb2NrZWRfaW9jdGwodm9pZCAqZGV2aWNlX2RhdGEsCj4gPiArCQkJCSAgICAgIHVuc2lnbmVk
IGludCBjbWQsIHVuc2lnbmVkIGxvbmcgYXJnKQo+ID4gK3sKPiA+ICsJc3RydWN0IHZob3N0X21k
ZXYgKm0gPSBkZXZpY2VfZGF0YTsKPiA+ICsJdm9pZCBfX3VzZXIgKmFyZ3AgPSAodm9pZCBfX3Vz
ZXIgKilhcmc7Cj4gPiArCWxvbmcgcjsKPiA+ICsKPiA+ICsJbXV0ZXhfbG9jaygmbS0+bXV0ZXgp
Owo+ID4gKwo+ID4gKwlzd2l0Y2ggKGNtZCkgewo+ID4gKwljYXNlIFZIT1NUX01ERVZfR0VUX0RF
VklDRV9JRDoKPiA+ICsJCXIgPSB2aG9zdF9tZGV2X2dldF9kZXZpY2VfaWQobSwgYXJncCk7Cj4g
PiArCQlicmVhazsKPiA+ICsJY2FzZSBWSE9TVF9NREVWX0dFVF9TVEFUVVM6Cj4gPiArCQlyID0g
dmhvc3RfbWRldl9nZXRfc3RhdHVzKG0sIGFyZ3ApOwo+ID4gKwkJYnJlYWs7Cj4gPiArCWNhc2Ug
VkhPU1RfTURFVl9TRVRfU1RBVFVTOgo+ID4gKwkJciA9IHZob3N0X21kZXZfc2V0X3N0YXR1cyht
LCBhcmdwKTsKPiA+ICsJCWJyZWFrOwo+ID4gKwljYXNlIFZIT1NUX01ERVZfR0VUX0NPTkZJRzoK
PiA+ICsJCXIgPSB2aG9zdF9tZGV2X2dldF9jb25maWcobSwgYXJncCk7Cj4gPiArCQlicmVhazsK
PiA+ICsJY2FzZSBWSE9TVF9NREVWX1NFVF9DT05GSUc6Cj4gPiArCQlyID0gdmhvc3RfbWRldl9z
ZXRfY29uZmlnKG0sIGFyZ3ApOwo+ID4gKwkJYnJlYWs7Cj4gPiArCWNhc2UgVkhPU1RfR0VUX0ZF
QVRVUkVTOgo+ID4gKwkJciA9IHZob3N0X21kZXZfZ2V0X2ZlYXR1cmVzKG0sIGFyZ3ApOwo+ID4g
KwkJYnJlYWs7Cj4gPiArCWNhc2UgVkhPU1RfU0VUX0ZFQVRVUkVTOgo+ID4gKwkJciA9IHZob3N0
X21kZXZfc2V0X2ZlYXR1cmVzKG0sIGFyZ3ApOwo+ID4gKwkJYnJlYWs7Cj4gPiArCWNhc2UgVkhP
U1RfTURFVl9HRVRfVlJJTkdfTlVNOgo+ID4gKwkJciA9IHZob3N0X21kZXZfZ2V0X3ZyaW5nX251
bShtLCBhcmdwKTsKPiA+ICsJCWJyZWFrOwo+ID4gKwlkZWZhdWx0Ogo+ID4gKwkJLyoKPiA+ICsJ
CSAqIFZIT1NUX1NFVF9NRU1fVEFCTEUsIFZIT1NUX1NFVF9MT0dfQkFTRSwgYW5kCj4gPiArCQkg
KiBWSE9TVF9TRVRfTE9HX0ZEIGFyZSBub3QgdXNlZCB5ZXQuCj4gPiArCQkgKi8KPiAKPiAKPiBJ
ZiB3ZSBkb24ndCBldmVuIHVzZSB0aGVtLCB0aGVyZSdzIHByb2JhYmx5IG5vIG5lZWQgdG8gY2Fs
bAo+IHZob3N0X2Rldl9pb2N0bCgpLiBUaGlzIG1heSBoZWxwIHRvIGF2b2lkIGNvbmZ1c2lvbiB3
aGVuIHdlIHdhbnQgdG8gZGV2ZWxvcAo+IG5ldyBBUEkgZm9yIGUuZyBkaXJ0eSBwYWdlIHRyYWNr
aW5nLgoKR29vZCBwb2ludC4gSXQncyBiZXR0ZXIgdG8gcmVqZWN0IHRoZXNlIGlvY3RscyBmb3Ig
bm93LgoKUFMuIE9uZSB0aGluZyBJIG1heSBuZWVkIHRvIGNsYXJpZnkgaXMgdGhhdCwgd2UgbmVl
ZCB0aGUKVkhPU1RfU0VUX09XTkVSIGlvY3RsIHRvIGdldCB0aGUgdnEtPmhhbmRsZV9raWNrIHRv
IHdvcmsuClNvIGlmIHdlIGRvbid0IGNhbGwgdmhvc3RfZGV2X2lvY3RsKCksIHdlIHdpbGwgbmVl
ZCB0bwpjYWxsIHZob3N0X2Rldl9zZXRfb3duZXIoKSBkaXJlY3RseS4KCj4gCj4gCj4gPiArCQly
ID0gdmhvc3RfZGV2X2lvY3RsKCZtLT5kZXYsIGNtZCwgYXJncCk7Cj4gPiArCQlpZiAociA9PSAt
RU5PSU9DVExDTUQpCj4gPiArCQkJciA9IHZob3N0X21kZXZfdnJpbmdfaW9jdGwobSwgY21kLCBh
cmdwKTsKPiA+ICsJfQo+ID4gKwo+ID4gKwltdXRleF91bmxvY2soJm0tPm11dGV4KTsKPiA+ICsJ
cmV0dXJuIHI7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgdmZpb19kZXZp
Y2Vfb3BzIHZmaW9fdmhvc3RfbWRldl9kZXZfb3BzID0gewo+ID4gKwkubmFtZQkJPSAidmZpby12
aG9zdC1tZGV2IiwKPiA+ICsJLm9wZW4JCT0gdmhvc3RfbWRldl9vcGVuLAo+ID4gKwkucmVsZWFz
ZQk9IHZob3N0X21kZXZfcmVsZWFzZSwKPiA+ICsJLmlvY3RsCQk9IHZob3N0X21kZXZfdW5sb2Nr
ZWRfaW9jdGwsCj4gPiArfTsKPiA+ICsKPiA+ICtzdGF0aWMgaW50IHZob3N0X21kZXZfcHJvYmUo
c3RydWN0IGRldmljZSAqZGV2KQo+ID4gK3sKPiA+ICsJc3RydWN0IG1kZXZfZGV2aWNlICptZGV2
ID0gbWRldl9mcm9tX2RldihkZXYpOwo+ID4gKwljb25zdCBzdHJ1Y3QgbWRldl92aXJ0aW9fZGV2
aWNlX29wcyAqb3BzID0gbWRldl9nZXRfdmhvc3Rfb3BzKG1kZXYpOwo+ID4gKwlzdHJ1Y3Qgdmhv
c3RfbWRldiAqbTsKPiA+ICsJaW50IG52cXMsIHI7Cj4gPiArCj4gPiArCS8qIEN1cnJlbnRseSwg
d2Ugb25seSBhY2NlcHQgdGhlIG5ldHdvcmsgZGV2aWNlcy4gKi8KPiA+ICsJaWYgKG9wcy0+Z2V0
X2RldmljZV9pZChtZGV2KSAhPSBWSVJUSU9fSURfTkVUKQo+ID4gKwkJcmV0dXJuIC1FTk9UU1VQ
UDsKPiA+ICsKPiA+ICsJbSA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqbSksIEdGUF9LRVJO
RUwgfCBfX0dGUF9SRVRSWV9NQVlGQUlMKTsKPiA+ICsJaWYgKCFtKQo+ID4gKwkJcmV0dXJuIC1F
Tk9NRU07Cj4gPiArCj4gPiArCW52cXMgPSBWSE9TVF9NREVWX1ZRX01BWDsKPiAKPiAKPiBPbiB0
b3AuIEkgdGhpbmsgd2UgcHJvYmFibHkgbmVlZCBhIGJldHRlciB3YXkgb3RoZXIgdGhhbiBoYXJk
LWNvZGVkIHZhbHVlCj4gaGVyZS4KPiAKPiBFLmcgd2UgY2FuIHJlYWQgY29uZmlnIGFuZCBkZXRl
Y3QgdGhlIG1heCB2aXJ0cXVldWUgc3VwcG9ydGVkIGJhc2VkIG9uCj4gZGV2aWNlIGlkLgoKVG90
YWxseSBhZ3JlZS4gV2UgZG8gbmVlZCBhIGJldHRlciB3YXkgdGhhbiB0aGUgaGFyZGNvZGVkCnZh
bHVlIGluIHRoZSBmdXR1cmUuIEZvciBub3csIGl0IG1pZ2h0IGJlIGJldHRlciB0byBrZWVwCml0
IGFzIGlzIGZvciBzaW1wbGljaXR5IGJlZm9yZSB3ZSBoYXZlIHRoZSBNUSBzdXBwb3J0LgoKCj4g
Cj4gVGhhbmtzCj4gCj4gCj4gPiArCj4gPiArCW0tPnZxcyA9IGRldm1fa21hbGxvY19hcnJheShk
ZXYsIG52cXMsIHNpemVvZihzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlKSwKPiA+ICsJCQkJICAgIEdG
UF9LRVJORUwpOwo+ID4gKwlpZiAoIW0tPnZxcykKPiA+ICsJCXJldHVybiAtRU5PTUVNOwo+ID4g
Kwo+ID4gKwltdXRleF9pbml0KCZtLT5tdXRleCk7Cj4gPiArCj4gPiArCW0tPm1kZXYgPSBtZGV2
Owo+ID4gKwltLT5udnFzID0gbnZxczsKPiA+ICsJbS0+dmlydGlvX2lkID0gb3BzLT5nZXRfZGV2
aWNlX2lkKG1kZXYpOwo+ID4gKwo+ID4gKwlyID0gdmZpb19hZGRfZ3JvdXBfZGV2KGRldiwgJnZm
aW9fdmhvc3RfbWRldl9kZXZfb3BzLCBtKTsKPiA+ICsJaWYgKHIpIHsKPiA+ICsJCW11dGV4X2Rl
c3Ryb3koJm0tPm11dGV4KTsKPiA+ICsJCXJldHVybiByOwo+ID4gKwl9Cj4gPiArCj4gPiArCXJl
dHVybiAwOwo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgdm9pZCB2aG9zdF9tZGV2X3JlbW92ZShz
dHJ1Y3QgZGV2aWNlICpkZXYpCj4gPiArewo+ID4gKwlzdHJ1Y3Qgdmhvc3RfbWRldiAqbTsKPiA+
ICsKPiA+ICsJbSA9IHZmaW9fZGVsX2dyb3VwX2RldihkZXYpOwo+ID4gKwltdXRleF9kZXN0cm95
KCZtLT5tdXRleCk7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbWRldl9j
bGFzc19pZCB2aG9zdF9tZGV2X21hdGNoW10gPSB7Cj4gPiArCXsgTURFVl9DTEFTU19JRF9WSE9T
VCB9LAo+ID4gKwl7IDAgfSwKPiA+ICt9Owo+ID4gK01PRFVMRV9ERVZJQ0VfVEFCTEUobWRldiwg
dmhvc3RfbWRldl9tYXRjaCk7Cj4gPiArCj4gPiArc3RhdGljIHN0cnVjdCBtZGV2X2RyaXZlciB2
aG9zdF9tZGV2X2RyaXZlciA9IHsKPiA+ICsJLm5hbWUJPSAidmhvc3RfbWRldiIsCj4gPiArCS5w
cm9iZQk9IHZob3N0X21kZXZfcHJvYmUsCj4gPiArCS5yZW1vdmUJPSB2aG9zdF9tZGV2X3JlbW92
ZSwKPiA+ICsJLmlkX3RhYmxlID0gdmhvc3RfbWRldl9tYXRjaCwKPiA+ICt9Owo+ID4gKwo+ID4g
K3N0YXRpYyBpbnQgX19pbml0IHZob3N0X21kZXZfaW5pdCh2b2lkKQo+ID4gK3sKPiA+ICsJcmV0
dXJuIG1kZXZfcmVnaXN0ZXJfZHJpdmVyKCZ2aG9zdF9tZGV2X2RyaXZlciwgVEhJU19NT0RVTEUp
Owo+ID4gK30KPiA+ICttb2R1bGVfaW5pdCh2aG9zdF9tZGV2X2luaXQpOwo+ID4gKwo+ID4gK3N0
YXRpYyB2b2lkIF9fZXhpdCB2aG9zdF9tZGV2X2V4aXQodm9pZCkKPiA+ICt7Cj4gPiArCW1kZXZf
dW5yZWdpc3Rlcl9kcml2ZXIoJnZob3N0X21kZXZfZHJpdmVyKTsKPiA+ICt9Cj4gPiArbW9kdWxl
X2V4aXQodmhvc3RfbWRldl9leGl0KTsKPiA+ICsKPiA+ICtNT0RVTEVfVkVSU0lPTigiMC4wLjEi
KTsKPiA+ICtNT0RVTEVfTElDRU5TRSgiR1BMIHYyIik7Cj4gPiArTU9EVUxFX0FVVEhPUigiSW50
ZWwgQ29ycG9yYXRpb24iKTsKPiA+ICtNT0RVTEVfREVTQ1JJUFRJT04oIk1lZGlhdGVkIGRldmlj
ZSBiYXNlZCBhY2NlbGVyYXRvciBmb3IgdmlydGlvIik7Cj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9saW51eC9tZGV2LmggYi9pbmNsdWRlL2xpbnV4L21kZXYuaAo+ID4gaW5kZXggZjNkNzVhNjBj
MmI1Li44YWY3ZmI5ZTAxNDkgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L21kZXYuaAo+
ID4gKysrIGIvaW5jbHVkZS9saW51eC9tZGV2LmgKPiA+IEBAIC0xMTcsNiArMTE3LDEwIEBAIHZv
aWQgbWRldl9zZXRfdmlydGlvX29wcyhzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsCj4gPiAgIAkJ
CSBjb25zdCBzdHJ1Y3QgbWRldl92aXJ0aW9fZGV2aWNlX29wcyAqdmlydGlvX29wcyk7Cj4gPiAg
IGNvbnN0IHN0cnVjdCBtZGV2X3ZpcnRpb19kZXZpY2Vfb3BzICoKPiA+ICAgbWRldl9nZXRfdmly
dGlvX29wcyhzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYpOwo+ID4gK3ZvaWQgbWRldl9zZXRfdmhv
c3Rfb3BzKHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwKPiA+ICsJCQljb25zdCBzdHJ1Y3QgbWRl
dl92aXJ0aW9fZGV2aWNlX29wcyAqdmhvc3Rfb3BzKTsKPiA+ICtjb25zdCBzdHJ1Y3QgbWRldl92
aXJ0aW9fZGV2aWNlX29wcyAqCj4gPiArbWRldl9nZXRfdmhvc3Rfb3BzKHN0cnVjdCBtZGV2X2Rl
dmljZSAqbWRldik7Cj4gPiAgIGV4dGVybiBzdHJ1Y3QgYnVzX3R5cGUgbWRldl9idXNfdHlwZTsK
PiA+IEBAIC0xMzMsNiArMTM3LDcgQEAgc3RydWN0IG1kZXZfZGV2aWNlICptZGV2X2Zyb21fZGV2
KHN0cnVjdCBkZXZpY2UgKmRldik7Cj4gPiAgIGVudW0gewo+ID4gICAJTURFVl9DTEFTU19JRF9W
RklPID0gMSwKPiA+ICAgCU1ERVZfQ0xBU1NfSURfVklSVElPID0gMiwKPiA+ICsJTURFVl9DTEFT
U19JRF9WSE9TVCA9IDMsCj4gPiAgIAkvKiBOZXcgZW50cmllcyBtdXN0IGJlIGFkZGVkIGhlcmUg
Ki8KPiA+ICAgfTsKPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgvdmhvc3QuaCBi
L2luY2x1ZGUvdWFwaS9saW51eC92aG9zdC5oCj4gPiBpbmRleCA0MGQwMjhlZWQ2NDUuLjA2MWEy
ODI0YTFiMyAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC92aG9zdC5oCj4gPiAr
KysgYi9pbmNsdWRlL3VhcGkvbGludXgvdmhvc3QuaAo+ID4gQEAgLTExNiw0ICsxMTYsMjIgQEAK
PiA+ICAgI2RlZmluZSBWSE9TVF9WU09DS19TRVRfR1VFU1RfQ0lECV9JT1coVkhPU1RfVklSVElP
LCAweDYwLCBfX3U2NCkKPiA+ICAgI2RlZmluZSBWSE9TVF9WU09DS19TRVRfUlVOTklORwkJX0lP
VyhWSE9TVF9WSVJUSU8sIDB4NjEsIGludCkKPiA+ICsvKiBWSE9TVF9NREVWIHNwZWNpZmljIGRl
ZmluZXMgKi8KPiA+ICsKPiA+ICsvKiBHZXQgdGhlIGRldmljZSBpZC4gVGhlIGRldmljZSBpZHMg
Zm9sbG93IHRoZSBzYW1lIGRlZmluaXRpb24gb2YKPiA+ICsgKiB0aGUgZGV2aWNlIGlkIGRlZmlu
ZWQgaW4gdmlydGlvLXNwZWMuICovCj4gPiArI2RlZmluZSBWSE9TVF9NREVWX0dFVF9ERVZJQ0Vf
SUQJX0lPUihWSE9TVF9WSVJUSU8sIDB4NzAsIF9fdTMyKQo+ID4gKy8qIEdldCBhbmQgc2V0IHRo
ZSBzdGF0dXMuIFRoZSBzdGF0dXMgYml0cyBmb2xsb3cgdGhlIHNhbWUgZGVmaW5pdGlvbgo+ID4g
KyAqIG9mIHRoZSBkZXZpY2Ugc3RhdHVzIGRlZmluZWQgaW4gdmlydGlvLXNwZWMuICovCj4gPiAr
I2RlZmluZSBWSE9TVF9NREVWX0dFVF9TVEFUVVMJCV9JT1IoVkhPU1RfVklSVElPLCAweDcxLCBf
X3U4KQo+ID4gKyNkZWZpbmUgVkhPU1RfTURFVl9TRVRfU1RBVFVTCQlfSU9XKFZIT1NUX1ZJUlRJ
TywgMHg3MiwgX191OCkKPiA+ICsvKiBHZXQgYW5kIHNldCB0aGUgZGV2aWNlIGNvbmZpZy4gVGhl
IGRldmljZSBjb25maWcgZm9sbG93cyB0aGUgc2FtZQo+ID4gKyAqIGRlZmluaXRpb24gb2YgdGhl
IGRldmljZSBjb25maWcgZGVmaW5lZCBpbiB2aXJ0aW8tc3BlYy4gKi8KPiA+ICsjZGVmaW5lIFZI
T1NUX01ERVZfR0VUX0NPTkZJRwkJX0lPUihWSE9TVF9WSVJUSU8sIDB4NzMsIHN0cnVjdCB2aG9z
dF9tZGV2X2NvbmZpZykKPiA+ICsjZGVmaW5lIFZIT1NUX01ERVZfU0VUX0NPTkZJRwkJX0lPVyhW
SE9TVF9WSVJUSU8sIDB4NzQsIHN0cnVjdCB2aG9zdF9tZGV2X2NvbmZpZykKPiA+ICsvKiBFbmFi
bGUvZGlzYWJsZSB0aGUgcmluZy4gKi8KPiA+ICsjZGVmaW5lIFZIT1NUX01ERVZfU0VUX1ZSSU5H
X0VOQUJMRQlfSU9XKFZIT1NUX1ZJUlRJTywgMHg3NSwgc3RydWN0IHZob3N0X3ZyaW5nX3N0YXRl
KQo+ID4gKy8qIEdldCB0aGUgbWF4IHJpbmcgc2l6ZS4gKi8KPiA+ICsjZGVmaW5lIFZIT1NUX01E
RVZfR0VUX1ZSSU5HX05VTQlfSU9SKFZIT1NUX1ZJUlRJTywgMHg3NiwgX191MTYpCj4gPiArCj4g
PiAgICNlbmRpZgo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC92aG9zdF90eXBl
cy5oIGIvaW5jbHVkZS91YXBpL2xpbnV4L3Zob3N0X3R5cGVzLmgKPiA+IGluZGV4IGM5MDcyOTBm
ZjA2NS4uN2IxMDVkMGIyZmI5IDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L3Zo
b3N0X3R5cGVzLmgKPiA+ICsrKyBiL2luY2x1ZGUvdWFwaS9saW51eC92aG9zdF90eXBlcy5oCj4g
PiBAQCAtMTE5LDYgKzExOSwxNCBAQCBzdHJ1Y3Qgdmhvc3Rfc2NzaV90YXJnZXQgewo+ID4gICAJ
dW5zaWduZWQgc2hvcnQgcmVzZXJ2ZWQ7Cj4gPiAgIH07Cj4gPiArLyogVkhPU1RfTURFViBzcGVj
aWZpYyBkZWZpbml0aW9ucyAqLwo+ID4gKwo+ID4gK3N0cnVjdCB2aG9zdF9tZGV2X2NvbmZpZyB7
Cj4gPiArCV9fdTMyIG9mZjsKPiA+ICsJX191MzIgbGVuOwo+ID4gKwlfX3U4IGJ1ZlswXTsKPiA+
ICt9Owo+ID4gKwo+ID4gICAvKiBGZWF0dXJlIGJpdHMgKi8KPiA+ICAgLyogTG9nIGFsbCB3cml0
ZSBkZXNjcmlwdG9ycy4gQ2FuIGJlIGNoYW5nZWQgd2hpbGUgZGV2aWNlIGlzIGFjdGl2ZS4gKi8K
PiA+ICAgI2RlZmluZSBWSE9TVF9GX0xPR19BTEwgMjYKPiAKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZp
cnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGlu
dXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
