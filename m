Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2C8E9492
	for <lists.virtualization@lfdr.de>; Wed, 30 Oct 2019 02:26:50 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 92AA5D2E;
	Wed, 30 Oct 2019 01:26:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 03695D07
	for <virtualization@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 01:26:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B583A174
	for <virtualization@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 01:26:40 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Oct 2019 18:26:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,245,1569308400"; d="scan'208";a="203039462"
Received: from dpdk-virtio-tbie-2.sh.intel.com (HELO ___) ([10.67.104.74])
	by orsmga003.jf.intel.com with ESMTP; 29 Oct 2019 18:26:36 -0700
Date: Wed, 30 Oct 2019 09:27:28 +0800
From: Tiwei Bie <tiwei.bie@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v2] vhost: introduce mdev based hardware backend
Message-ID: <20191030012728.GA29333@___>
References: <d37529e1-5147-bbe5-cb9d-299bd6d4aa1a@redhat.com>
	<d4cc4f4e-2635-4041-2f68-cd043a97f25a@redhat.com>
	<20191024091839.GA17463@___>
	<fefc82a3-a137-bc03-e1c3-8de79b238080@redhat.com>
	<e7e239ba-2461-4f8d-7dd7-0f557ac7f4bf@redhat.com>
	<20191025080143-mutt-send-email-mst@kernel.org>
	<20191028015842.GA9005@___>
	<5e8a623d-9d91-607a-1f9e-7a7086ba9a68@redhat.com>
	<20191029095738.GA7228@___>
	<146752f4-174c-c916-3682-b965b96d7872@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <146752f4-174c-c916-3682-b965b96d7872@redhat.com>
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

T24gVHVlLCBPY3QgMjksIDIwMTkgYXQgMDY6NDg6MjdQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiBPbiAyMDE5LzEwLzI5IOS4i+WNiDU6NTcsIFRpd2VpIEJpZSB3cm90ZToKPiA+IE9uIE1v
biwgT2N0IDI4LCAyMDE5IGF0IDExOjUwOjQ5QU0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4g
Pj4gT24gMjAxOS8xMC8yOCDkuIrljYg5OjU4LCBUaXdlaSBCaWUgd3JvdGU6Cj4gPj4+IE9uIEZy
aSwgT2N0IDI1LCAyMDE5IGF0IDA4OjE2OjI2QU0gLTA0MDAsIE1pY2hhZWwgUy4gVHNpcmtpbiB3
cm90ZToKPiA+Pj4+IE9uIEZyaSwgT2N0IDI1LCAyMDE5IGF0IDA1OjU0OjU1UE0gKzA4MDAsIEph
c29uIFdhbmcgd3JvdGU6Cj4gPj4+Pj4gT24gMjAxOS8xMC8yNCDkuIvljYg2OjQyLCBKYXNvbiBX
YW5nIHdyb3RlOgo+ID4+Pj4+PiBZZXMuCj4gPj4+Pj4+Cj4gPj4+Pj4+Cj4gPj4+Pj4+PiAgwqAg
QW5kIHdlIHNob3VsZCB0cnkgdG8gYXZvaWQKPiA+Pj4+Pj4+IHB1dHRpbmcgY3RybCB2cSBhbmQg
UngvVHggdnFzIGluIHRoZSBzYW1lIERNQSBzcGFjZSB0byBwcmV2ZW50Cj4gPj4+Pj4+PiBndWVz
dHMgaGF2aW5nIHRoZSBjaGFuY2UgdG8gYnlwYXNzIHRoZSBob3N0IChlLmcuIFFFTVUpIHRvCj4g
Pj4+Pj4+PiBzZXR1cCB0aGUgYmFja2VuZCBhY2NlbGVyYXRvciBkaXJlY3RseS4KPiA+Pj4+Pj4g
VGhhdCdzIHJlYWxseSBnb29kIHBvaW50LsKgIFNvIHdoZW4gInZob3N0IiB0eXBlIGlzIGNyZWF0
ZWQsIHBhcmVudAo+ID4+Pj4+PiBzaG91bGQgYXNzdW1lIGFkZHIgb2YgY3RybF92cSBpcyBodmEu
Cj4gPj4+Pj4+Cj4gPj4+Pj4+IFRoYW5rcwo+ID4+Pj4+IFRoaXMgd29ya3MgZm9yIHZob3N0IGJ1
dCBub3QgdmlydGlvIHNpbmNlIHRoZXJlJ3Mgbm8gd2F5IGZvciB2aXJ0aW8ga2VybmVsCj4gPj4+
Pj4gZHJpdmVyIHRvIGRpZmZlciBjdHJsX3ZxIHdpdGggdGhlIHJlc3Qgd2hlbiBkb2luZyBETUEg
bWFwLiBPbmUgcG9zc2libGUKPiA+Pj4+PiBzb2x1dGlvbiBpcyB0byBwcm92aWRlIERNQSBkb21h
aW4gaXNvbGF0aW9uIGJldHdlZW4gdmlydHF1ZXVlcy4gVGhlbiBjdHJsIHZxCj4gPj4+Pj4gY2Fu
IHVzZSBpdHMgZGVkaWNhdGVkIERNQSBkb21haW4gZm9yIHRoZSB3b3JrLgo+ID4+PiBJdCBtaWdo
dCBub3QgYmUgYSBiYWQgaWRlYSB0byBsZXQgdGhlIHBhcmVudCBkcml2ZXJzIGRpc3Rpbmd1aXNo
Cj4gPj4+IGJldHdlZW4gdmlydGlvLW1kZXYgbWRldnMgYW5kIHZob3N0LW1kZXYgbWRldnMgaW4g
Y3RybC12cSBoYW5kbGluZwo+ID4+PiBieSBtZGV2J3MgY2xhc3MgaWQuCj4gPj4gWWVzLCB0aGF0
IHNob3VsZCB3b3JrLCBJIGhhdmUgc29tZXRoaW5nIHByb2JhYmxlIGJldHRlciwgc2VlIGJlbG93
Lgo+ID4+Cj4gPj4KPiA+Pj4+PiBBbnl3YXksIHRoaXMgY291bGQgYmUgZG9uZSBpbiB0aGUgZnV0
dXJlLiBXZSBjYW4gaGF2ZSBhIHZlcnNpb24gZmlyc3QgdGhhdAo+ID4+Pj4+IGRvZXNuJ3Qgc3Vw
cG9ydCBjdHJsX3ZxLgo+ID4+PiArMSwgdGhhbmtzCj4gPj4+Cj4gPj4+Pj4gVGhhbmtzCj4gPj4+
PiBXZWxsIG5vIGN0cmxfdnEgaW1wbGllcyBlaXRoZXIgbm8gb2ZmbG9hZHMsIG9yIG5vIFhEUCAo
c2luY2UgWERQIG5lZWRzCj4gPj4+PiB0byBkaXNhYmxlIG9mZmxvYWRzIGR5bmFtaWNhbGx5KS4K
PiA+Pj4+Cj4gPj4+PiAgICAgICAgICBpZiAoIXZpcnRpb19oYXNfZmVhdHVyZSh2aS0+dmRldiwg
VklSVElPX05FVF9GX0NUUkxfR1VFU1RfT0ZGTE9BRFMpCj4gPj4+PiAgICAgICAgICAgICAgJiYg
KHZpcnRpb19oYXNfZmVhdHVyZSh2aS0+dmRldiwgVklSVElPX05FVF9GX0dVRVNUX1RTTzQpIHx8
Cj4gPj4+PiAgICAgICAgICAgICAgICAgIHZpcnRpb19oYXNfZmVhdHVyZSh2aS0+dmRldiwgVklS
VElPX05FVF9GX0dVRVNUX1RTTzYpIHx8Cj4gPj4+PiAgICAgICAgICAgICAgICAgIHZpcnRpb19o
YXNfZmVhdHVyZSh2aS0+dmRldiwgVklSVElPX05FVF9GX0dVRVNUX0VDTikgfHwKPiA+Pj4+ICAg
ICAgICAgICAgICAgICAgdmlydGlvX2hhc19mZWF0dXJlKHZpLT52ZGV2LCBWSVJUSU9fTkVUX0Zf
R1VFU1RfVUZPKSB8fAo+ID4+Pj4gICAgICAgICAgICAgICAgICB2aXJ0aW9faGFzX2ZlYXR1cmUo
dmktPnZkZXYsIFZJUlRJT19ORVRfRl9HVUVTVF9DU1VNKSkpIHsKPiA+Pj4+ICAgICAgICAgICAg
ICAgICAgTkxfU0VUX0VSUl9NU0dfTU9EKGV4dGFjaywgIkNhbid0IHNldCBYRFAgd2hpbGUgaG9z
dCBpcyBpbXBsZW1lbnRpbmcgTFJPL0NTVU0sIGRpc2FibGUgTFJPL0NTVU0gZmlyc3QiKTsKPiA+
Pj4+ICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOwo+ID4+Pj4gICAgICAgICAg
fQo+ID4+Pj4KPiA+Pj4+IG5laXRoZXIgaXMgdmVyeSBhdHRyYWN0aXZlLgo+ID4+Pj4KPiA+Pj4+
IFNvIHllcyBvayBqdXN0IGZvciBkZXZlbG9wbWVudCBidXQgd2UgZG8gbmVlZCB0byBmaWd1cmUg
b3V0IGhvdyBpdCB3aWxsCj4gPj4+PiB3b3JrIGRvd24gdGhlIHJvYWQgaW4gcHJvZHVjdGlvbi4K
PiA+Pj4gVG90YWxseSBhZ3JlZS4KPiA+Pj4KPiA+Pj4+IFNvIHJlYWxseSB0aGlzIHNwZWNpZmlj
IHZpcnRpbyBuZXQgZGV2aWNlIGRvZXMgbm90IHN1cHBvcnQgY29udHJvbCB2cSwKPiA+Pj4+IGlu
c3RlYWQgaXQgc3VwcG9ydHMgYSBkaWZmZXJlbnQgdHJhbnNwb3J0IHNwZWNpZmljIHdheSB0byBz
ZW5kIGNvbW1hbmRzCj4gPj4+PiB0byBkZXZpY2UuCj4gPj4+Pgo+ID4+Pj4gU29tZSBraW5kIG9m
IGV4dGVuc2lvbiB0byB0aGUgdHJhbnNwb3J0PyBJZGVhcz8KPiA+PiBTbyBpdCdzIGJhc2ljYWxs
eSBhbiBpc3N1ZSBvZiBpc29sYXRpbmcgRE1BIGRvbWFpbnMuIE1heWJlIHdlIGNhbiBzdGFydCB3
aXRoCj4gPj4gdHJhbnNwb3J0IEFQSSBmb3IgcXVlcnlpbmcgcGVyIHZxIERNQSBkb21haW4vQVNJ
RD8KPiA+Pgo+ID4+IC0gZm9yIHZob3N0LW1kZXYsIHVzZXJzcGFjZSBjYW4gcXVlcnkgdGhlIERN
QSBkb21haW4gZm9yIGVhY2ggc3BlY2lmaWMKPiA+PiB2aXJ0cXVldWUuIEZvciBjb250cm9sIHZx
LCBtZGV2IGNhbiByZXR1cm4gaWQgZm9yIHNvZnR3YXJlIGRvbWFpbiwgZm9yIHRoZQo+ID4+IHJl
c3QgbWRldiB3aWxsIHJldHVybiBpZCBvZiBWRklPIGRvbWFpbi4gVGhlbiB1c2Vyc3BhY2Uga25v
dyB0aGF0IGl0IHNob3VsZAo+ID4+IHVzZSBkaWZmZXJlbnQgQVBJIGZvciBwcmVwYXJpbmcgdGhl
IHZpcnRxdWV1ZSwgZS5nIGZvciB2cSBvdGhlciB0aGFuIGNvbnRyb2wKPiA+PiB2cSwgaXQgc2hv
dWxkIHVzZSBWRklPIERNQSBBUEkuIFRoZSBjb250cm9sIHZxIGl0IHNob3VsZCB1c2UgaHZhIGlu
c3RlYWQuCj4gPj4KPiA+PiAtIGZvciB2aXJpdG8tbWRldiwgd2UgY2FuIGludHJvZHVjZSBwZXIt
dnEgRE1BIGRldmljZSwgYW5kIHJvdXRlIERNQSBtYXBwaW5nCj4gPj4gcmVxdWVzdCBmb3IgY29u
dHJvbCB2cSBiYWNrIHRvIG1kZXYgaW5zdGVhZCBvZiB0aGUgaGFyZHdhcmUuIChXZSBjYW4gd3Jh
cAo+ID4+IHRoZW0gaW50byBsaWJyYXJ5IG9yIGhlbHBlcnMgdG8gZWFzZSB0aGUgZGV2ZWxvcG1l
bnQgb2YgdmVuZG9yIHBoeXNpY2FsCj4gPj4gZHJpdmVycykuCj4gPiBUaGFua3MgZm9yIHRoaXMg
cHJvcG9zYWwhIEknbSB0aGlua2luZyBhYm91dCBpdCB0aGVzZSBkYXlzLgo+ID4gSSB0aGluayBp
dCBtaWdodCBiZSB0b28gY29tcGxpY2F0ZWQuIEknbSB3b25kZXJpbmcgd2hldGhlciB3ZQo+ID4g
Y2FuIGhhdmUgc29tZXRoaW5nIHNpbXBsZXIuIEkgd2lsbCBwb3N0IGEgUkZDIHBhdGNoIHRvIHNo
b3cKPiA+IG15IGlkZWEgdG9kYXkuCj4gCj4gCj4gVGhhbmtzLCB3aWxsIGNoZWNrLgo+IAo+IEJ0
dywgZm9yIHZpcnRpby1tZGV2LCB0aGUgY2hhbmdlIHNob3VsZCBiZSB2ZXJ5IG1pbmltYWwsIHdp
bGwgcG9zdCBhbgo+IFJGQyBhcyB3ZWxsLiBGb3Igdmhvc3QtbWRldiwgaXQgY291bGQgYmUganVz
dCBhIGhlbHBlciB0byByZXR1cm4gYW4gSUQKPiBmb3IgRE1BIGRvbWFpbiBsaWtlIElEX1ZGSU8g
b3IgSURfSFZBLgo+IAo+IE9yIGEgbW9yZSBzdHJhaWdodGZvcndhcmQgd2F5IGlzIHRvIGZvcmNl
IHF1ZXVlcyBsaWtlIGNvbnRyb2wgdnEgdG8gdXNlIFBBLgoKV2lsbCBjaGVjay4gVGhhbmtzIQoK
PiAKPiAKPiA+Cj4gPiBUaGFua3MsCj4gPiBUaXdlaQo+ID4KPiAKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0
ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
