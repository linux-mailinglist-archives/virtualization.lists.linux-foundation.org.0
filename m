Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8F1E6A99
	for <lists.virtualization@lfdr.de>; Mon, 28 Oct 2019 02:58:03 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 98A13A80;
	Mon, 28 Oct 2019 01:57:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9DBCE2C
	for <virtualization@lists.linux-foundation.org>;
	Mon, 28 Oct 2019 01:57:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2720842D
	for <virtualization@lists.linux-foundation.org>;
	Mon, 28 Oct 2019 01:57:54 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Oct 2019 18:57:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,238,1569308400"; d="scan'208";a="229541691"
Received: from dpdk-virtio-tbie-2.sh.intel.com (HELO ___) ([10.67.104.74])
	by fmsmga002.fm.intel.com with ESMTP; 27 Oct 2019 18:57:51 -0700
Date: Mon, 28 Oct 2019 09:58:42 +0800
From: Tiwei Bie <tiwei.bie@intel.com>
To: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2] vhost: introduce mdev based hardware backend
Message-ID: <20191028015842.GA9005@___>
References: <106834b5-dae5-82b2-0f97-16951709d075@redhat.com>
	<20191023101135.GA6367@___>
	<5a7bc5da-d501-2750-90bf-545dd55f85fa@redhat.com>
	<20191024042155.GA21090@___>
	<d37529e1-5147-bbe5-cb9d-299bd6d4aa1a@redhat.com>
	<d4cc4f4e-2635-4041-2f68-cd043a97f25a@redhat.com>
	<20191024091839.GA17463@___>
	<fefc82a3-a137-bc03-e1c3-8de79b238080@redhat.com>
	<e7e239ba-2461-4f8d-7dd7-0f557ac7f4bf@redhat.com>
	<20191025080143-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191025080143-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, maxime.coquelin@redhat.com,
	virtualization@lists.linux-foundation.org,
	zhihong.wang@intel.com, lingshan.zhu@intel.com,
	linux-kernel@vger.kernel.org
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

T24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgMDg6MTY6MjZBTSAtMDQwMCwgTWljaGFlbCBTLiBUc2ly
a2luIHdyb3RlOgo+IE9uIEZyaSwgT2N0IDI1LCAyMDE5IGF0IDA1OjU0OjU1UE0gKzA4MDAsIEph
c29uIFdhbmcgd3JvdGU6Cj4gPiBPbiAyMDE5LzEwLzI0IOS4i+WNiDY6NDIsIEphc29uIFdhbmcg
d3JvdGU6Cj4gPiA+IAo+ID4gPiBZZXMuCj4gPiA+IAo+ID4gPiAKPiA+ID4gPiDCoCBBbmQgd2Ug
c2hvdWxkIHRyeSB0byBhdm9pZAo+ID4gPiA+IHB1dHRpbmcgY3RybCB2cSBhbmQgUngvVHggdnFz
IGluIHRoZSBzYW1lIERNQSBzcGFjZSB0byBwcmV2ZW50Cj4gPiA+ID4gZ3Vlc3RzIGhhdmluZyB0
aGUgY2hhbmNlIHRvIGJ5cGFzcyB0aGUgaG9zdCAoZS5nLiBRRU1VKSB0bwo+ID4gPiA+IHNldHVw
IHRoZSBiYWNrZW5kIGFjY2VsZXJhdG9yIGRpcmVjdGx5Lgo+ID4gPiAKPiA+ID4gCj4gPiA+IFRo
YXQncyByZWFsbHkgZ29vZCBwb2ludC7CoCBTbyB3aGVuICJ2aG9zdCIgdHlwZSBpcyBjcmVhdGVk
LCBwYXJlbnQKPiA+ID4gc2hvdWxkIGFzc3VtZSBhZGRyIG9mIGN0cmxfdnEgaXMgaHZhLgo+ID4g
PiAKPiA+ID4gVGhhbmtzCj4gPiAKPiA+IAo+ID4gVGhpcyB3b3JrcyBmb3Igdmhvc3QgYnV0IG5v
dCB2aXJ0aW8gc2luY2UgdGhlcmUncyBubyB3YXkgZm9yIHZpcnRpbyBrZXJuZWwKPiA+IGRyaXZl
ciB0byBkaWZmZXIgY3RybF92cSB3aXRoIHRoZSByZXN0IHdoZW4gZG9pbmcgRE1BIG1hcC4gT25l
IHBvc3NpYmxlCj4gPiBzb2x1dGlvbiBpcyB0byBwcm92aWRlIERNQSBkb21haW4gaXNvbGF0aW9u
IGJldHdlZW4gdmlydHF1ZXVlcy4gVGhlbiBjdHJsIHZxCj4gPiBjYW4gdXNlIGl0cyBkZWRpY2F0
ZWQgRE1BIGRvbWFpbiBmb3IgdGhlIHdvcmsuCgpJdCBtaWdodCBub3QgYmUgYSBiYWQgaWRlYSB0
byBsZXQgdGhlIHBhcmVudCBkcml2ZXJzIGRpc3Rpbmd1aXNoCmJldHdlZW4gdmlydGlvLW1kZXYg
bWRldnMgYW5kIHZob3N0LW1kZXYgbWRldnMgaW4gY3RybC12cSBoYW5kbGluZwpieSBtZGV2J3Mg
Y2xhc3MgaWQuCgo+ID4gCj4gPiBBbnl3YXksIHRoaXMgY291bGQgYmUgZG9uZSBpbiB0aGUgZnV0
dXJlLiBXZSBjYW4gaGF2ZSBhIHZlcnNpb24gZmlyc3QgdGhhdAo+ID4gZG9lc24ndCBzdXBwb3J0
IGN0cmxfdnEuCgorMSwgdGhhbmtzCgo+ID4gCj4gPiBUaGFua3MKPiAKPiBXZWxsIG5vIGN0cmxf
dnEgaW1wbGllcyBlaXRoZXIgbm8gb2ZmbG9hZHMsIG9yIG5vIFhEUCAoc2luY2UgWERQIG5lZWRz
Cj4gdG8gZGlzYWJsZSBvZmZsb2FkcyBkeW5hbWljYWxseSkuCj4gCj4gICAgICAgICBpZiAoIXZp
cnRpb19oYXNfZmVhdHVyZSh2aS0+dmRldiwgVklSVElPX05FVF9GX0NUUkxfR1VFU1RfT0ZGTE9B
RFMpCj4gICAgICAgICAgICAgJiYgKHZpcnRpb19oYXNfZmVhdHVyZSh2aS0+dmRldiwgVklSVElP
X05FVF9GX0dVRVNUX1RTTzQpIHx8Cj4gICAgICAgICAgICAgICAgIHZpcnRpb19oYXNfZmVhdHVy
ZSh2aS0+dmRldiwgVklSVElPX05FVF9GX0dVRVNUX1RTTzYpIHx8Cj4gICAgICAgICAgICAgICAg
IHZpcnRpb19oYXNfZmVhdHVyZSh2aS0+dmRldiwgVklSVElPX05FVF9GX0dVRVNUX0VDTikgfHwK
PiAgICAgICAgICAgICAgICAgdmlydGlvX2hhc19mZWF0dXJlKHZpLT52ZGV2LCBWSVJUSU9fTkVU
X0ZfR1VFU1RfVUZPKSB8fAo+ICAgICAgICAgICAgICAgICB2aXJ0aW9faGFzX2ZlYXR1cmUodmkt
PnZkZXYsIFZJUlRJT19ORVRfRl9HVUVTVF9DU1VNKSkpIHsKPiAgICAgICAgICAgICAgICAgTkxf
U0VUX0VSUl9NU0dfTU9EKGV4dGFjaywgIkNhbid0IHNldCBYRFAgd2hpbGUgaG9zdCBpcyBpbXBs
ZW1lbnRpbmcgTFJPL0NTVU0sIGRpc2FibGUgTFJPL0NTVU0gZmlyc3QiKTsKPiAgICAgICAgICAg
ICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOwo+ICAgICAgICAgfQo+IAo+IG5laXRoZXIgaXMgdmVy
eSBhdHRyYWN0aXZlLgo+IAo+IFNvIHllcyBvayBqdXN0IGZvciBkZXZlbG9wbWVudCBidXQgd2Ug
ZG8gbmVlZCB0byBmaWd1cmUgb3V0IGhvdyBpdCB3aWxsCj4gd29yayBkb3duIHRoZSByb2FkIGlu
IHByb2R1Y3Rpb24uCgpUb3RhbGx5IGFncmVlLgoKPiAKPiBTbyByZWFsbHkgdGhpcyBzcGVjaWZp
YyB2aXJ0aW8gbmV0IGRldmljZSBkb2VzIG5vdCBzdXBwb3J0IGNvbnRyb2wgdnEsCj4gaW5zdGVh
ZCBpdCBzdXBwb3J0cyBhIGRpZmZlcmVudCB0cmFuc3BvcnQgc3BlY2lmaWMgd2F5IHRvIHNlbmQg
Y29tbWFuZHMKPiB0byBkZXZpY2UuCj4gCj4gU29tZSBraW5kIG9mIGV4dGVuc2lvbiB0byB0aGUg
dHJhbnNwb3J0PyBJZGVhcz8KPiAKPiAKPiAtLSAKPiBNU1QKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZp
cnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGlu
dXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
