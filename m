Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 423F9E84ED
	for <lists.virtualization@lfdr.de>; Tue, 29 Oct 2019 10:56:58 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 99F711445;
	Tue, 29 Oct 2019 09:56:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CDF3A143F
	for <virtualization@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 09:56:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 475778A
	for <virtualization@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 09:56:50 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Oct 2019 02:56:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,243,1569308400"; d="scan'208";a="374497156"
Received: from dpdk-virtio-tbie-2.sh.intel.com (HELO ___) ([10.67.104.74])
	by orsmga005.jf.intel.com with ESMTP; 29 Oct 2019 02:56:47 -0700
Date: Tue, 29 Oct 2019 17:57:38 +0800
From: Tiwei Bie <tiwei.bie@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v2] vhost: introduce mdev based hardware backend
Message-ID: <20191029095738.GA7228@___>
References: <5a7bc5da-d501-2750-90bf-545dd55f85fa@redhat.com>
	<20191024042155.GA21090@___>
	<d37529e1-5147-bbe5-cb9d-299bd6d4aa1a@redhat.com>
	<d4cc4f4e-2635-4041-2f68-cd043a97f25a@redhat.com>
	<20191024091839.GA17463@___>
	<fefc82a3-a137-bc03-e1c3-8de79b238080@redhat.com>
	<e7e239ba-2461-4f8d-7dd7-0f557ac7f4bf@redhat.com>
	<20191025080143-mutt-send-email-mst@kernel.org>
	<20191028015842.GA9005@___>
	<5e8a623d-9d91-607a-1f9e-7a7086ba9a68@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5e8a623d-9d91-607a-1f9e-7a7086ba9a68@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
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

T24gTW9uLCBPY3QgMjgsIDIwMTkgYXQgMTE6NTA6NDlBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiBPbiAyMDE5LzEwLzI4IOS4iuWNiDk6NTgsIFRpd2VpIEJpZSB3cm90ZToKPiA+IE9uIEZy
aSwgT2N0IDI1LCAyMDE5IGF0IDA4OjE2OjI2QU0gLTA0MDAsIE1pY2hhZWwgUy4gVHNpcmtpbiB3
cm90ZToKPiA+ID4gT24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgMDU6NTQ6NTVQTSArMDgwMCwgSmFz
b24gV2FuZyB3cm90ZToKPiA+ID4gPiBPbiAyMDE5LzEwLzI0IOS4i+WNiDY6NDIsIEphc29uIFdh
bmcgd3JvdGU6Cj4gPiA+ID4gPiBZZXMuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IAo+ID4gPiA+ID4g
PiAgwqAgQW5kIHdlIHNob3VsZCB0cnkgdG8gYXZvaWQKPiA+ID4gPiA+ID4gcHV0dGluZyBjdHJs
IHZxIGFuZCBSeC9UeCB2cXMgaW4gdGhlIHNhbWUgRE1BIHNwYWNlIHRvIHByZXZlbnQKPiA+ID4g
PiA+ID4gZ3Vlc3RzIGhhdmluZyB0aGUgY2hhbmNlIHRvIGJ5cGFzcyB0aGUgaG9zdCAoZS5nLiBR
RU1VKSB0bwo+ID4gPiA+ID4gPiBzZXR1cCB0aGUgYmFja2VuZCBhY2NlbGVyYXRvciBkaXJlY3Rs
eS4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gVGhhdCdzIHJlYWxseSBnb29kIHBvaW50LsKgIFNvIHdo
ZW4gInZob3N0IiB0eXBlIGlzIGNyZWF0ZWQsIHBhcmVudAo+ID4gPiA+ID4gc2hvdWxkIGFzc3Vt
ZSBhZGRyIG9mIGN0cmxfdnEgaXMgaHZhLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBUaGFua3MKPiA+
ID4gPiAKPiA+ID4gPiBUaGlzIHdvcmtzIGZvciB2aG9zdCBidXQgbm90IHZpcnRpbyBzaW5jZSB0
aGVyZSdzIG5vIHdheSBmb3IgdmlydGlvIGtlcm5lbAo+ID4gPiA+IGRyaXZlciB0byBkaWZmZXIg
Y3RybF92cSB3aXRoIHRoZSByZXN0IHdoZW4gZG9pbmcgRE1BIG1hcC4gT25lIHBvc3NpYmxlCj4g
PiA+ID4gc29sdXRpb24gaXMgdG8gcHJvdmlkZSBETUEgZG9tYWluIGlzb2xhdGlvbiBiZXR3ZWVu
IHZpcnRxdWV1ZXMuIFRoZW4gY3RybCB2cQo+ID4gPiA+IGNhbiB1c2UgaXRzIGRlZGljYXRlZCBE
TUEgZG9tYWluIGZvciB0aGUgd29yay4KPiA+IEl0IG1pZ2h0IG5vdCBiZSBhIGJhZCBpZGVhIHRv
IGxldCB0aGUgcGFyZW50IGRyaXZlcnMgZGlzdGluZ3Vpc2gKPiA+IGJldHdlZW4gdmlydGlvLW1k
ZXYgbWRldnMgYW5kIHZob3N0LW1kZXYgbWRldnMgaW4gY3RybC12cSBoYW5kbGluZwo+ID4gYnkg
bWRldidzIGNsYXNzIGlkLgo+IAo+IAo+IFllcywgdGhhdCBzaG91bGQgd29yaywgSSBoYXZlIHNv
bWV0aGluZyBwcm9iYWJsZSBiZXR0ZXIsIHNlZSBiZWxvdy4KPiAKPiAKPiA+IAo+ID4gPiA+IEFu
eXdheSwgdGhpcyBjb3VsZCBiZSBkb25lIGluIHRoZSBmdXR1cmUuIFdlIGNhbiBoYXZlIGEgdmVy
c2lvbiBmaXJzdCB0aGF0Cj4gPiA+ID4gZG9lc24ndCBzdXBwb3J0IGN0cmxfdnEuCj4gPiArMSwg
dGhhbmtzCj4gPiAKPiA+ID4gPiBUaGFua3MKPiA+ID4gV2VsbCBubyBjdHJsX3ZxIGltcGxpZXMg
ZWl0aGVyIG5vIG9mZmxvYWRzLCBvciBubyBYRFAgKHNpbmNlIFhEUCBuZWVkcwo+ID4gPiB0byBk
aXNhYmxlIG9mZmxvYWRzIGR5bmFtaWNhbGx5KS4KPiA+ID4gCj4gPiA+ICAgICAgICAgIGlmICgh
dmlydGlvX2hhc19mZWF0dXJlKHZpLT52ZGV2LCBWSVJUSU9fTkVUX0ZfQ1RSTF9HVUVTVF9PRkZM
T0FEUykKPiA+ID4gICAgICAgICAgICAgICYmICh2aXJ0aW9faGFzX2ZlYXR1cmUodmktPnZkZXYs
IFZJUlRJT19ORVRfRl9HVUVTVF9UU080KSB8fAo+ID4gPiAgICAgICAgICAgICAgICAgIHZpcnRp
b19oYXNfZmVhdHVyZSh2aS0+dmRldiwgVklSVElPX05FVF9GX0dVRVNUX1RTTzYpIHx8Cj4gPiA+
ICAgICAgICAgICAgICAgICAgdmlydGlvX2hhc19mZWF0dXJlKHZpLT52ZGV2LCBWSVJUSU9fTkVU
X0ZfR1VFU1RfRUNOKSB8fAo+ID4gPiAgICAgICAgICAgICAgICAgIHZpcnRpb19oYXNfZmVhdHVy
ZSh2aS0+dmRldiwgVklSVElPX05FVF9GX0dVRVNUX1VGTykgfHwKPiA+ID4gICAgICAgICAgICAg
ICAgICB2aXJ0aW9faGFzX2ZlYXR1cmUodmktPnZkZXYsIFZJUlRJT19ORVRfRl9HVUVTVF9DU1VN
KSkpIHsKPiA+ID4gICAgICAgICAgICAgICAgICBOTF9TRVRfRVJSX01TR19NT0QoZXh0YWNrLCAi
Q2FuJ3Qgc2V0IFhEUCB3aGlsZSBob3N0IGlzIGltcGxlbWVudGluZyBMUk8vQ1NVTSwgZGlzYWJs
ZSBMUk8vQ1NVTSBmaXJzdCIpOwo+ID4gPiAgICAgICAgICAgICAgICAgIHJldHVybiAtRU9QTk9U
U1VQUDsKPiA+ID4gICAgICAgICAgfQo+ID4gPiAKPiA+ID4gbmVpdGhlciBpcyB2ZXJ5IGF0dHJh
Y3RpdmUuCj4gPiA+IAo+ID4gPiBTbyB5ZXMgb2sganVzdCBmb3IgZGV2ZWxvcG1lbnQgYnV0IHdl
IGRvIG5lZWQgdG8gZmlndXJlIG91dCBob3cgaXQgd2lsbAo+ID4gPiB3b3JrIGRvd24gdGhlIHJv
YWQgaW4gcHJvZHVjdGlvbi4KPiA+IFRvdGFsbHkgYWdyZWUuCj4gPiAKPiA+ID4gU28gcmVhbGx5
IHRoaXMgc3BlY2lmaWMgdmlydGlvIG5ldCBkZXZpY2UgZG9lcyBub3Qgc3VwcG9ydCBjb250cm9s
IHZxLAo+ID4gPiBpbnN0ZWFkIGl0IHN1cHBvcnRzIGEgZGlmZmVyZW50IHRyYW5zcG9ydCBzcGVj
aWZpYyB3YXkgdG8gc2VuZCBjb21tYW5kcwo+ID4gPiB0byBkZXZpY2UuCj4gPiA+IAo+ID4gPiBT
b21lIGtpbmQgb2YgZXh0ZW5zaW9uIHRvIHRoZSB0cmFuc3BvcnQ/IElkZWFzPwo+IAo+IAo+IFNv
IGl0J3MgYmFzaWNhbGx5IGFuIGlzc3VlIG9mIGlzb2xhdGluZyBETUEgZG9tYWlucy4gTWF5YmUg
d2UgY2FuIHN0YXJ0IHdpdGgKPiB0cmFuc3BvcnQgQVBJIGZvciBxdWVyeWluZyBwZXIgdnEgRE1B
IGRvbWFpbi9BU0lEPwo+IAo+IC0gZm9yIHZob3N0LW1kZXYsIHVzZXJzcGFjZSBjYW4gcXVlcnkg
dGhlIERNQSBkb21haW4gZm9yIGVhY2ggc3BlY2lmaWMKPiB2aXJ0cXVldWUuIEZvciBjb250cm9s
IHZxLCBtZGV2IGNhbiByZXR1cm4gaWQgZm9yIHNvZnR3YXJlIGRvbWFpbiwgZm9yIHRoZQo+IHJl
c3QgbWRldiB3aWxsIHJldHVybiBpZCBvZiBWRklPIGRvbWFpbi4gVGhlbiB1c2Vyc3BhY2Uga25v
dyB0aGF0IGl0IHNob3VsZAo+IHVzZSBkaWZmZXJlbnQgQVBJIGZvciBwcmVwYXJpbmcgdGhlIHZp
cnRxdWV1ZSwgZS5nIGZvciB2cSBvdGhlciB0aGFuIGNvbnRyb2wKPiB2cSwgaXQgc2hvdWxkIHVz
ZSBWRklPIERNQSBBUEkuIFRoZSBjb250cm9sIHZxIGl0IHNob3VsZCB1c2UgaHZhIGluc3RlYWQu
Cj4gCj4gLSBmb3IgdmlyaXRvLW1kZXYsIHdlIGNhbiBpbnRyb2R1Y2UgcGVyLXZxIERNQSBkZXZp
Y2UsIGFuZCByb3V0ZSBETUEgbWFwcGluZwo+IHJlcXVlc3QgZm9yIGNvbnRyb2wgdnEgYmFjayB0
byBtZGV2IGluc3RlYWQgb2YgdGhlIGhhcmR3YXJlLiAoV2UgY2FuIHdyYXAKPiB0aGVtIGludG8g
bGlicmFyeSBvciBoZWxwZXJzIHRvIGVhc2UgdGhlIGRldmVsb3BtZW50IG9mIHZlbmRvciBwaHlz
aWNhbAo+IGRyaXZlcnMpLgoKVGhhbmtzIGZvciB0aGlzIHByb3Bvc2FsISBJJ20gdGhpbmtpbmcg
YWJvdXQgaXQgdGhlc2UgZGF5cy4KSSB0aGluayBpdCBtaWdodCBiZSB0b28gY29tcGxpY2F0ZWQu
IEknbSB3b25kZXJpbmcgd2hldGhlciB3ZQpjYW4gaGF2ZSBzb21ldGhpbmcgc2ltcGxlci4gSSB3
aWxsIHBvc3QgYSBSRkMgcGF0Y2ggdG8gc2hvdwpteSBpZGVhIHRvZGF5LgoKVGhhbmtzLApUaXdl
aQoKPiAKPiBUaGFua3MKPiAKPiAKPiA+ID4gCj4gPiA+IAo+ID4gPiAtLSAKPiA+ID4gTVNUCj4g
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxp
emF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9u
Lm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92
aXJ0dWFsaXphdGlvbg==
