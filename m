Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB2A6312E
	for <lists.virtualization@lfdr.de>; Tue,  9 Jul 2019 08:44:06 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D09252F05;
	Tue,  9 Jul 2019 06:43:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9371D2EC5
	for <virtualization@lists.linux-foundation.org>;
	Tue,  9 Jul 2019 06:34:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B23A9148
	for <virtualization@lists.linux-foundation.org>;
	Tue,  9 Jul 2019 06:34:54 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jul 2019 23:34:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,469,1557212400"; d="scan'208";a="167889966"
Received: from npg-dpdk-virtio-tbie-2.sh.intel.com (HELO ___) ([10.67.104.66])
	by orsmga003.jf.intel.com with ESMTP; 08 Jul 2019 23:34:50 -0700
Date: Tue, 9 Jul 2019 14:33:17 +0800
From: Tiwei Bie <tiwei.bie@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [RFC v2] vhost: introduce mdev based hardware vhost backend
Message-ID: <20190709063317.GA29300@___>
References: <20190703091339.1847-1-tiwei.bie@intel.com>
	<7b8279b2-aa7e-7adc-eeff-20dfaf4400d0@redhat.com>
	<20190703115245.GA22374@___>
	<64833f91-02cd-7143-f12e-56ab93b2418d@redhat.com>
	<20190703130817.GA1978@___>
	<b01b8e28-8d96-31dd-56f4-ca7793498c55@redhat.com>
	<20190704062134.GA21116@___> <20190705084946.67b8f9f5@x1.home>
	<20190708061625.GA15936@___>
	<deae5ede-57e9-41e6-ea42-d84e07ca480a@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <deae5ede-57e9-41e6-ea42-d84e07ca480a@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: idos@mellanox.com, kvm@vger.kernel.org, mst@redhat.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	zhihong.wang@intel.com, maxime.coquelin@redhat.com,
	Rob Miller <rob.miller@broadcom.com>
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

T24gVHVlLCBKdWwgMDksIDIwMTkgYXQgMTA6NTA6MzhBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiBPbiAyMDE5LzcvOCDkuIvljYgyOjE2LCBUaXdlaSBCaWUgd3JvdGU6Cj4gPiBPbiBGcmks
IEp1bCAwNSwgMjAxOSBhdCAwODo0OTo0NkFNIC0wNjAwLCBBbGV4IFdpbGxpYW1zb24gd3JvdGU6
Cj4gPiA+IE9uIFRodSwgNCBKdWwgMjAxOSAxNDoyMTozNCArMDgwMAo+ID4gPiBUaXdlaSBCaWUg
PHRpd2VpLmJpZUBpbnRlbC5jb20+IHdyb3RlOgo+ID4gPiA+IE9uIFRodSwgSnVsIDA0LCAyMDE5
IGF0IDEyOjMxOjQ4UE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4gPiA+ID4gPiBPbiAyMDE5
LzcvMyDkuIvljYg5OjA4LCBUaXdlaSBCaWUgd3JvdGU6Cj4gPiA+ID4gPiA+IE9uIFdlZCwgSnVs
IDAzLCAyMDE5IGF0IDA4OjE2OjIzUE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4gPiA+ID4g
PiA+ID4gT24gMjAxOS83LzMg5LiL5Y2INzo1MiwgVGl3ZWkgQmllIHdyb3RlOgo+ID4gPiA+ID4g
PiA+ID4gT24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDY6MDk6NTFQTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPiA+ID4gPiA+ID4gPiA+ID4gT24gMjAxOS83LzMg5LiL5Y2INToxMywgVGl3ZWkg
QmllIHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gPiA+IERldGFpbHMgYWJvdXQgdGhpcyBjYW4gYmUg
Zm91bmQgaGVyZToKPiA+ID4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+ID4gPiBodHRw
czovL2x3bi5uZXQvQXJ0aWNsZXMvNzUwNzcwLwo+ID4gPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+
ID4gPiA+ID4gPiA+IFdoYXQncyBuZXcgaW4gdGhpcyB2ZXJzaW9uCj4gPiA+ID4gPiA+ID4gPiA+
ID4gPT09PT09PT09PT09PT09PT09PT09PT09PT0KPiA+ID4gPiA+ID4gPiA+ID4gPiAKPiA+ID4g
PiA+ID4gPiA+ID4gPiBBIG5ldyBWRklPIGRldmljZSB0eXBlIGlzIGludHJvZHVjZWQgLSB2Zmlv
LXZob3N0LiBUaGlzIGFkZHJlc3NlZAo+ID4gPiA+ID4gPiA+ID4gPiA+IHNvbWUgY29tbWVudHMg
ZnJvbSBoZXJlOmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvY292ZXIvOTg0NzYzLwo+ID4g
PiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gPiA+IEJlbG93IGlzIHRoZSB1cGRhdGVk
IGRldmljZSBpbnRlcmZhY2U6Cj4gPiA+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiA+
ID4gQ3VycmVudGx5LCB0aGVyZSBhcmUgdHdvIHJlZ2lvbnMgb2YgdGhpcyBkZXZpY2U6IDEpIENP
TkZJR19SRUdJT04KPiA+ID4gPiA+ID4gPiA+ID4gPiAoVkZJT19WSE9TVF9DT05GSUdfUkVHSU9O
X0lOREVYKSwgd2hpY2ggY2FuIGJlIHVzZWQgdG8gc2V0dXAgdGhlCj4gPiA+ID4gPiA+ID4gPiA+
ID4gZGV2aWNlOyAyKSBOT1RJRllfUkVHSU9OIChWRklPX1ZIT1NUX05PVElGWV9SRUdJT05fSU5E
RVgpLCB3aGljaAo+ID4gPiA+ID4gPiA+ID4gPiA+IGNhbiBiZSB1c2VkIHRvIG5vdGlmeSB0aGUg
ZGV2aWNlLgo+ID4gPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gPiA+IDEuIENPTkZJ
R19SRUdJT04KPiA+ID4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+ID4gPiBUaGUgcmVn
aW9uIGRlc2NyaWJlZCBieSBDT05GSUdfUkVHSU9OIGlzIHRoZSBtYWluIGNvbnRyb2wgaW50ZXJm
YWNlLgo+ID4gPiA+ID4gPiA+ID4gPiA+IE1lc3NhZ2VzIHdpbGwgYmUgd3JpdHRlbiB0byBvciBy
ZWFkIGZyb20gdGhpcyByZWdpb24uCj4gPiA+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4g
PiA+ID4gVGhlIG1lc3NhZ2UgdHlwZSBpcyBkZXRlcm1pbmVkIGJ5IHRoZSBgcmVxdWVzdGAgZmll
bGQgaW4gbWVzc2FnZQo+ID4gPiA+ID4gPiA+ID4gPiA+IGhlYWRlci4gVGhlIG1lc3NhZ2Ugc2l6
ZSBpcyBlbmNvZGVkIGluIHRoZSBtZXNzYWdlIGhlYWRlciB0b28uCj4gPiA+ID4gPiA+ID4gPiA+
ID4gVGhlIG1lc3NhZ2UgZm9ybWF0IGxvb2tzIGxpa2UgdGhpczoKPiA+ID4gPiA+ID4gPiA+ID4g
PiAKPiA+ID4gPiA+ID4gPiA+ID4gPiBzdHJ1Y3Qgdmhvc3RfdmZpb19vcCB7Cj4gPiA+ID4gPiA+
ID4gPiA+ID4gCV9fdTY0IHJlcXVlc3Q7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gCV9fdTMyIGZsYWdz
Owo+ID4gPiA+ID4gPiA+ID4gPiA+IAkvKiBGbGFnIHZhbHVlczogKi8KPiA+ID4gPiA+ID4gPiA+
ID4gPiAgICAgICNkZWZpbmUgVkhPU1RfVkZJT19ORUVEX1JFUExZIDB4MSAvKiBXaGV0aGVyIG5l
ZWQgcmVwbHkgKi8KPiA+ID4gPiA+ID4gPiA+ID4gPiAJX191MzIgc2l6ZTsKPiA+ID4gPiA+ID4g
PiA+ID4gPiAJdW5pb24gewo+ID4gPiA+ID4gPiA+ID4gPiA+IAkJX191NjQgdTY0Owo+ID4gPiA+
ID4gPiA+ID4gPiA+IAkJc3RydWN0IHZob3N0X3ZyaW5nX3N0YXRlIHN0YXRlOwo+ID4gPiA+ID4g
PiA+ID4gPiA+IAkJc3RydWN0IHZob3N0X3ZyaW5nX2FkZHIgYWRkcjsKPiA+ID4gPiA+ID4gPiA+
ID4gPiAJfSBwYXlsb2FkOwo+ID4gPiA+ID4gPiA+ID4gPiA+IH07Cj4gPiA+ID4gPiA+ID4gPiA+
ID4gCj4gPiA+ID4gPiA+ID4gPiA+ID4gVGhlIGV4aXN0aW5nIHZob3N0LWtlcm5lbCBpb2N0bCBj
bWRzIGFyZSByZXVzZWQgYXMgdGhlIG1lc3NhZ2UKPiA+ID4gPiA+ID4gPiA+ID4gPiByZXF1ZXN0
cyBpbiBhYm92ZSBzdHJ1Y3R1cmUuCj4gPiA+ID4gPiA+ID4gPiA+IFN0aWxsIGEgY29tbWVudHMg
bGlrZSBWMS4gV2hhdCdzIHRoZSBhZHZhbnRhZ2Ugb2YgaW52ZW50aW5nIGEgbmV3IHByb3RvY29s
Pwo+ID4gPiA+ID4gPiA+ID4gSSdtIHRyeWluZyB0byBtYWtlIGl0IHdvcmsgaW4gVkZJTydzIHdh
eS4uCj4gPiA+ID4gPiA+ID4gPiA+IEkgYmVsaWV2ZSBlaXRoZXIgb2YgdGhlIGZvbGxvd2luZyBz
aG91bGQgYmUgYmV0dGVyOgo+ID4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+ID4gLSB1
c2luZyB2aG9zdCBpb2N0bCzCoCB3ZSBjYW4gc3RhcnQgZnJvbSBTRVRfVlJJTkdfS0lDSy9TRVRf
VlJJTkdfQ0FMTCBhbmQKPiA+ID4gPiA+ID4gPiA+ID4gZXh0ZW5kIGl0IHdpdGggZS5nIG5vdGlm
eSByZWdpb24uIFRoZSBhZHZhbnRhZ2VzIGlzIHRoYXQgYWxsIGV4aXN0IHVzZXJzcGFjZQo+ID4g
PiA+ID4gPiA+ID4gPiBwcm9ncmFtIGNvdWxkIGJlIHJldXNlZCB3aXRob3V0IG1vZGlmaWNhdGlv
biAob3IgbWluaW1hbCBtb2RpZmljYXRpb24pLiBBbmQKPiA+ID4gPiA+ID4gPiA+ID4gdmhvc3Qg
QVBJIGhpZGVzIGxvdHMgb2YgZGV0YWlscyB0aGF0IGlzIG5vdCBuZWNlc3NhcnkgdG8gYmUgdW5k
ZXJzdG9vZCBieQo+ID4gPiA+ID4gPiA+ID4gPiBhcHBsaWNhdGlvbiAoZS5nIGluIHRoZSBjYXNl
IG9mIGNvbnRhaW5lcikuCj4gPiA+ID4gPiA+ID4gPiBEbyB5b3UgbWVhbiByZXVzaW5nIHZob3N0
J3MgaW9jdGwgb24gVkZJTyBkZXZpY2UgZmQgZGlyZWN0bHksCj4gPiA+ID4gPiA+ID4gPiBvciBp
bnRyb2R1Y2luZyBhbm90aGVyIG1kZXYgZHJpdmVyIChpLmUuIHZob3N0X21kZXYgaW5zdGVhZCBv
Zgo+ID4gPiA+ID4gPiA+ID4gdXNpbmcgdGhlIGV4aXN0aW5nIHZmaW9fbWRldikgZm9yIG1kZXYg
ZGV2aWNlPwo+ID4gPiA+ID4gPiA+IENhbiB3ZSBzaW1wbHkgYWRkIHRoZW0gaW50byBpb2N0bCBv
ZiBtZGV2X3BhcmVudF9vcHM/Cj4gPiA+ID4gPiA+IFJpZ2h0LCBlaXRoZXIgd2F5LCB0aGVzZSBp
b2N0bHMgaGF2ZSB0byBiZSBhbmQganVzdCBuZWVkIHRvIGJlCj4gPiA+ID4gPiA+IGFkZGVkIGlu
IHRoZSBpb2N0bCBvZiB0aGUgbWRldl9wYXJlbnRfb3BzLiBCdXQgYW5vdGhlciB0aGluZyB3ZQo+
ID4gPiA+ID4gPiBhbHNvIG5lZWQgdG8gY29uc2lkZXIgaXMgdGhhdCB3aGljaCBmaWxlIGRlc2Ny
aXB0b3IgdGhlIHVzZXJzcGFjZQo+ID4gPiA+ID4gPiB3aWxsIGRvIHRoZSBpb2N0bCgpIG9uLiBT
byBJJ20gd29uZGVyaW5nIGRvIHlvdSBtZWFuIGxldCB0aGUKPiA+ID4gPiA+ID4gdXNlcnNwYWNl
IGRvIHRoZSBpb2N0bCgpIG9uIHRoZSBWRklPIGRldmljZSBmZCBvZiB0aGUgbWRldgo+ID4gPiA+
ID4gPiBkZXZpY2U/Cj4gPiA+ID4gPiBZZXMuCj4gPiA+ID4gR290IGl0ISBJJ20gbm90IHN1cmUg
d2hhdCdzIEFsZXggb3BpbmlvbiBvbiB0aGlzLiBJZiB3ZSBhbGwKPiA+ID4gPiBhZ3JlZSB3aXRo
IHRoaXMsIEkgY2FuIGRvIGl0IGluIHRoaXMgd2F5Lgo+ID4gPiA+IAo+ID4gPiA+ID4gSXMgdGhl
cmUgYW55IG90aGVyIHdheSBidHc/Cj4gPiA+ID4gSnVzdCBhIHF1aWNrIHRob3VnaHQuLiBNYXli
ZSB0b3RhbGx5IGEgYmFkIGlkZWEuIEkgd2FzIHRoaW5raW5nCj4gPiA+ID4gd2hldGhlciBpdCB3
b3VsZCBiZSBvZGQgdG8gZG8gbm9uLVZGSU8ncyBpb2N0bHMgb24gVkZJTydzIGRldmljZQo+ID4g
PiA+IGZkLiBTbyBJIHdhcyB3b25kZXJpbmcgd2hldGhlciBpdCdzIHBvc3NpYmxlIHRvIGFsbG93
IGJpbmRpbmcKPiA+ID4gPiBhbm90aGVyIG1kZXYgZHJpdmVyIChlLmcuIHZob3N0X21kZXYpIHRv
IHRoZSBzdXBwb3J0ZWQgbWRldgo+ID4gPiA+IGRldmljZXMuIFRoZSBuZXcgbWRldiBkcml2ZXIs
IHZob3N0X21kZXYsIGNhbiBwcm92aWRlIHNpbWlsYXIKPiA+ID4gPiB3YXlzIHRvIGxldCB1c2Vy
c3BhY2Ugb3BlbiB0aGUgbWRldiBkZXZpY2UgYW5kIGRvIHRoZSB2aG9zdCBpb2N0bHMKPiA+ID4g
PiBvbiBpdC4gVG8gZGlzdGluZ3Vpc2ggd2l0aCB0aGUgdmZpb19tZGV2IGNvbXBhdGlibGUgbWRl
diBkZXZpY2VzLAo+ID4gPiA+IHRoZSBkZXZpY2UgQVBJIG9mIHRoZSBuZXcgdmhvc3RfbWRldiBj
b21wYXRpYmxlIG1kZXYgZGV2aWNlcwo+ID4gPiA+IG1pZ2h0IGJlIGUuZy4gInZob3N0LW5ldCIg
Zm9yIG5ldD8KPiA+ID4gPiAKPiA+ID4gPiBTbyBpbiBWRklPIGNhc2UsIHRoZSBkZXZpY2Ugd2ls
bCBiZSBmb3IgcGFzc3RocnUgZGlyZWN0bHkuIEFuZAo+ID4gPiA+IGluIFZIT1NUIGNhc2UsIHRo
ZSBkZXZpY2UgY2FuIGJlIHVzZWQgdG8gYWNjZWxlcmF0ZSB0aGUgZXhpc3RpbmcKPiA+ID4gPiB2
aXJ0dWFsaXplZCBkZXZpY2VzLgo+ID4gPiA+IAo+ID4gPiA+IEhvdyBkbyB5b3UgdGhpbms/Cj4g
PiA+IFZGSU8gcmVhbGx5IGNhbid0IHByZXZlbnQgdmVuZG9yIHNwZWNpZmljIGlvY3RscyBvbiB0
aGUgZGV2aWNlIGZpbGUKPiA+ID4gZGVzY3JpcHRvciBmb3IgbWRldnMsIGJ1dCBhKSB3ZSdkIHdh
bnQgdG8gYmUgc3VyZSB0aGUgaW9jdGwgYWRkcmVzcwo+ID4gPiBzcGFjZSBjYW4ndCBjb2xsaWRl
IHdpdGggaW9jdGxzIHdlJ2QgdXNlIGZvciB2ZmlvIGRlZmluZWQgcHVycG9zZXMgYW5kCj4gPiA+
IGIpIG1heWJlIHRoZSBWRklPIHVzZXIgQVBJIGlzbid0IHdoYXQgeW91IHdhbnQgaW4gdGhlIGZp
cnN0IHBsYWNlIGlmCj4gPiA+IHlvdSBpbnRlbmQgdG8gbW9zdGx5L2VudGlyZWx5IGlnbm9yZSB0
aGUgZGVmaW5lZCBpb2N0bCBzZXQgYW5kIHJlcGxhY2UKPiA+ID4gdGhlbSB3aXRoIHlvdXIgb3du
LiAgSW4gdGhlIGNhc2Ugb2YgdGhlIGxhdHRlciwgeW91J3JlIGFsc28gbm90IGdldHRpbmcKPiA+
ID4gdGhlIGFkdmFudGFnZXMgb2YgdGhlIGV4aXN0aW5nIFZGSU8gdXNlcnNwYWNlIGNvZGUsIHNv
IHdoeSBleHBvc2UgYQo+ID4gPiBWRklPIGRldmljZSBhdCBhbGwuCj4gPiBZZWFoLCBJIHRvdGFs
bHkgYWdyZWUuCj4gCj4gCj4gSSBndWVzcyB0aGUgb3JpZ2luYWwgaWRlYSBpcyB0byByZXVzZSB0
aGUgVkZJTyBETUEvSU9NTVUgQVBJIGZvciB0aGlzLiBUaGVuCj4gd2UgaGF2ZSB0aGUgY2hhbmNl
IHRvIHJldXNlIHZmaW8gY29kZXMgaW4gcWVtdSBmb3IgZGVhbGluZyB3aXRoIGUuZyB2SU9NTVUu
CgpZZWFoLCB5b3UgYXJlIHJpZ2h0LiBXZSBoYXZlIHNldmVyYWwgY2hvaWNlcyBoZXJlOgoKIzEu
IFdlIGV4cG9zZSBhIFZGSU8gZGV2aWNlLCBzbyB3ZSBjYW4gcmV1c2UgdGhlIFZGSU8gY29udGFp
bmVyL2dyb3VwCiAgICBiYXNlZCBETUEgQVBJIGFuZCBwb3RlbnRpYWxseSByZXVzZSBhIGxvdCBv
ZiBWRklPIGNvZGUgaW4gUUVNVS4KCiAgICBCdXQgaW4gdGhpcyBjYXNlLCB3ZSBoYXZlIHR3byBj
aG9pY2VzIGZvciB0aGUgVkZJTyBkZXZpY2UgaW50ZXJmYWNlCiAgICAoaS5lLiB0aGUgaW50ZXJm
YWNlIG9uIHRvcCBvZiBWRklPIGRldmljZSBmZCk6CgogICAgQSkgd2UgbWF5IGludmVudCBhIG5l
dyB2aG9zdCBwcm90b2NvbCAoYXMgZGVtb25zdHJhdGVkIGJ5IHRoZSBjb2RlCiAgICAgICBpbiB0
aGlzIFJGQykgb24gVkZJTyBkZXZpY2UgZmQgdG8gbWFrZSBpdCB3b3JrIGluIFZGSU8ncyB3YXks
CiAgICAgICBpLmUuIHJlZ2lvbnMgYW5kIGlycXMuCgogICAgQikgT3IgYXMgeW91IHByb3Bvc2Vk
LCBpbnN0ZWFkIG9mIGludmVudGluZyBhIG5ldyB2aG9zdCBwcm90b2NvbCwKICAgICAgIHdlIGNh
biByZXVzZSBtb3N0IGV4aXN0aW5nIHZob3N0IGlvY3RscyBvbiB0aGUgVkZJTyBkZXZpY2UgZmQK
ICAgICAgIGRpcmVjdGx5LiBUaGVyZSBzaG91bGQgYmUgbm8gY29uZmxpY3RzIGJldHdlZW4gdGhl
IFZGSU8gaW9jdGxzCiAgICAgICAodHlwZSBpcyAweDNCKSBhbmQgVkhPU1QgaW9jdGxzICh0eXBl
IGlzIDB4QUYpIGN1cnJlbnRseS4KCiMyLiBJbnN0ZWFkIG9mIGV4cG9zaW5nIGEgVkZJTyBkZXZp
Y2UsIHdlIG1heSBleHBvc2UgYSBWSE9TVCBkZXZpY2UuCiAgICBBbmQgd2Ugd2lsbCBpbnRyb2R1
Y2UgYSBuZXcgbWRldiBkcml2ZXIgdmhvc3QtbWRldiB0byBkbyB0aGlzLgogICAgSXQgd291bGQg
YmUgbmF0dXJhbCB0byByZXVzZSB0aGUgZXhpc3Rpbmcga2VybmVsIHZob3N0IGludGVyZmFjZQog
ICAgKGlvY3Rscykgb24gaXQgYXMgbXVjaCBhcyBwb3NzaWJsZS4gQnV0IHdlIHdpbGwgbmVlZCB0
byBpbnZlbnQKICAgIHNvbWUgQVBJcyBmb3IgRE1BIHByb2dyYW1taW5nIChyZXVzaW5nIFZIT1NU
X1NFVF9NRU1fVEFCTEUgaXMgYQogICAgY2hvaWNlLCBidXQgaXQncyB0b28gaGVhdnkgYW5kIGRv
ZXNuJ3Qgc3VwcG9ydCB2SU9NTVUgYnkgaXRzZWxmKS4KCkknbSBub3Qgc3VyZSB3aGljaCBvbmUg
aXMgdGhlIGJlc3QgY2hvaWNlIHdlIGFsbCB3YW50Li4KV2hpY2ggb25lICgjMS9BLCAjMS9CLCBv
ciAjMikgd291bGQgeW91IHByZWZlcj8KCj4gCj4gCj4gPiAKPiA+ID4gVGhlIG1kZXYgaW50ZXJm
YWNlIGRvZXMgcHJvdmlkZSBhIGdlbmVyYWwgaW50ZXJmYWNlIGZvciBjcmVhdGluZyBhbmQKPiA+
ID4gbWFuYWdpbmcgdmlydHVhbCBkZXZpY2VzLCB2ZmlvLW1kZXYgaXMganVzdCBvbmUgZHJpdmVy
IG9uIHRoZSBtZGV2Cj4gPiA+IGJ1cy4gIFBhcmF2IChNZWxsYW5veCkgaGFzIGJlZW4gZG9pbmcg
d29yayBvbiBtZGV2LWNvcmUgdG8gaGVscCBjbGVhbgo+ID4gPiBvdXQgdmZpby1pc21zIGZyb20g
dGhlIGludGVyZmFjZSwgYWl1aSwgd2l0aCB0aGUgaW50ZW50IG9mIGltcGxlbWVudGluZwo+ID4g
PiBhbm90aGVyIG1kZXYgYnVzIGRyaXZlciBmb3IgdXNpbmcgdGhlIGRldmljZXMgd2l0aGluIHRo
ZSBrZXJuZWwuCj4gPiBHcmVhdCB0byBrbm93IHRoaXMhIEkgZm91bmQgYmVsb3cgc2VyaWVzIGFm
dGVyIHNvbWUgc2VhcmNoaW5nOgo+ID4gCj4gPiBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS8z
LzgvODIxCj4gPiAKPiA+IEluIGFib3ZlIHNlcmllcywgdGhlIG5ldyBtbHg1X2NvcmUgbWRldiBk
cml2ZXIgd2lsbCBkbyB0aGUgcHJvYmUKPiA+IGJ5IGNhbGxpbmcgbWx4NV9nZXRfY29yZV9kZXYo
KSBmaXJzdCBvbiB0aGUgcGFyZW50IGRldmljZSBvZiB0aGUKPiA+IG1kZXYgZGV2aWNlLiBJbiB2
aG9zdF9tZGV2LCBtYXliZSB3ZSBjYW4gYWxzbyBrZWVwIHRyYWNrIG9mIGFsbAo+ID4gdGhlIGNv
bXBhdGlibGUgbWRldiBkZXZpY2VzIGFuZCB1c2UgdGhpcyBpbmZvIHRvIGRvIHRoZSBwcm9iZS4K
PiAKPiAKPiBJIGRvbid0IGdldCB3aHkgdGhpcyBpcyBuZWVkZWQuIE15IHVuZGVyc3RhbmRpbmcg
aXMgaWYgd2Ugd2FudCB0byBnbyB0aGlzCj4gd2F5LCB0aGVyZSdyZSBhY3R1YWxseSB0d28gcGFy
dHMuIDEpIFZob3N0IG1kZXYgdGhhdCBpbXBsZW1lbnRzIHRoZSBkZXZpY2UKPiBtYW5hZ2VtZW50
cyBhbmQgdmhvc3QgaW9jdGwuIDIpIFZob3N0IGl0IHNlbGYsIHdoaWNoIGNhbiBhY2NlcHQgbWRl
diBmZCBhcwo+IGl0IGJhY2tlbmQgdGhyb3VnaCBWSE9TVF9ORVRfU0VUX0JBQ0tFTkQuCgpJIHRo
aW5rIHdpdGggdmhvc3QtbWRldiAob3Igd2l0aCB2ZmlvLW1kZXYgaWYgd2UgYWdyZWUgdG8gZG8g
dmhvc3QKaW9jdGxzIG9uIHZmaW8gZGV2aWNlIGZkIGRpcmVjdGx5KSwgd2UgZG9uJ3QgbmVlZCB0
byBvcGVuIC9kZXYvdmhvc3QtbmV0CihhbmQgdGhlcmUgaXMgbm8gVkhPU1RfTkVUX1NFVF9CQUNL
RU5EIG5lZWRlZCkgYXQgYWxsLiBFaXRoZXIgd2F5LAphZnRlciBnZXR0aW5nIHRoZSBmZCBvZiB0
aGUgbWRldiwgd2UganVzdCBuZWVkIHRvIGRvIHZob3N0IGlvY3RscwpvbiBpdCBkaXJlY3RseS4K
Cj4gCj4gCj4gPiBCdXQgd2UgYWxzbyBuZWVkIGEgd2F5IHRvIGFsbG93IHZmaW9fbWRldiBkcml2
ZXIgdG8gZGlzdGluZ3Vpc2gKPiA+IGFuZCByZWplY3QgdGhlIGluY29tcGF0aWJsZSBtZGV2IGRl
dmljZXMuCj4gCj4gCj4gT25lIGlzc3VlIGZvciB0aGlzIHNlcmllcyBpcyB0aGF0IGl0IGRvZXNu
J3QgY29uc2lkZXIgRE1BIGlzb2xhdGlvbiBhdCBhbGwuCj4gCj4gCj4gPiAKPiA+ID4gSXQKPiA+
ID4gc2VlbXMgbGlrZSB0aGlzIHZob3N0LW1kZXYgZHJpdmVyIG1pZ2h0IGJlIHNpbWlsYXIsIHVz
aW5nIG1kZXYgYnV0IG5vdAo+ID4gPiBuZWNlc3NhcmlseSB2ZmlvLW1kZXYgdG8gZXhwb3NlIGRl
dmljZXMuICBUaGFua3MsCj4gPiBZZWFoLCBJIGFsc28gdGhpbmsgc28hCj4gCj4gCj4gSSd2ZSBj
Y2VkIHNvbWUgZHJpdmVyIGRldmVsb3BlcnMgZm9yIHRoZWlyIGlucHV0cy4gSSB0aGluayB3ZSBu
ZWVkIGEgc2FtcGxlCj4gcGFyZW50IGRyaXZlcnMgaW4gdGhlIG5leHQgdmVyc2lvbiBmb3IgdXMg
dG8gdW5kZXJzdGFuZCB0aGUgZnVsbCBwaWN0dXJlLgo+IAo+IAo+IFRoYW5rcwo+IAo+IAo+ID4g
Cj4gPiBUaGFua3MhCj4gPiBUaXdlaQo+ID4gCj4gPiA+IEFsZXgKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0
ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
