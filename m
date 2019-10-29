Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B8AE8610
	for <lists.virtualization@lfdr.de>; Tue, 29 Oct 2019 11:49:28 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4D166C7F;
	Tue, 29 Oct 2019 10:49:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1CFF3B7D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 10:49:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
	[205.139.110.61])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 7FB5E8A
	for <virtualization@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 10:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572346160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=ku5QMX1PXe0RMduAjOLbTYKTX3zeaaRJXqe/yt5ek0A=;
	b=Ps3rMyfT85QtyBGghcVd6o8ogKzK9DP4dOTrTVvbT20LY2C0NlVVvFcMNk3dEGTDefCWlM
	Nz5viSKEr1K7zgG//DL2uJqv/r1xh4OMuhyYJp85W3CVH/X432iKiTDCjdNMBVv0jNHkCx
	Izzzq1ExcGUcvlyalWIKP7KPGyjMzyg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-350-Ojy6gkM5P2myIxO3H-nb5w-1; Tue, 29 Oct 2019 06:49:17 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 844FC476;
	Tue, 29 Oct 2019 10:49:15 +0000 (UTC)
Received: from [10.72.12.223] (ovpn-12-223.pek2.redhat.com [10.72.12.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1916B600F0;
	Tue, 29 Oct 2019 10:48:35 +0000 (UTC)
Subject: Re: [PATCH v2] vhost: introduce mdev based hardware backend
To: Tiwei Bie <tiwei.bie@intel.com>
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
	<20191029095738.GA7228@___>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <146752f4-174c-c916-3682-b965b96d7872@redhat.com>
Date: Tue, 29 Oct 2019 18:48:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191029095738.GA7228@___>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: Ojy6gkM5P2myIxO3H-nb5w-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
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

Ck9uIDIwMTkvMTAvMjkg5LiL5Y2INTo1NywgVGl3ZWkgQmllIHdyb3RlOgo+IE9uIE1vbiwgT2N0
IDI4LCAyMDE5IGF0IDExOjUwOjQ5QU0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+IE9uIDIw
MTkvMTAvMjgg5LiK5Y2IOTo1OCwgVGl3ZWkgQmllIHdyb3RlOgo+Pj4gT24gRnJpLCBPY3QgMjUs
IDIwMTkgYXQgMDg6MTY6MjZBTSAtMDQwMCwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+Pj4+
IE9uIEZyaSwgT2N0IDI1LCAyMDE5IGF0IDA1OjU0OjU1UE0gKzA4MDAsIEphc29uIFdhbmcgd3Jv
dGU6Cj4+Pj4+IE9uIDIwMTkvMTAvMjQg5LiL5Y2INjo0MiwgSmFzb24gV2FuZyB3cm90ZToKPj4+
Pj4+IFllcy4KPj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4+ICDCoCBBbmQgd2Ugc2hvdWxkIHRyeSB0byBh
dm9pZAo+Pj4+Pj4+IHB1dHRpbmcgY3RybCB2cSBhbmQgUngvVHggdnFzIGluIHRoZSBzYW1lIERN
QSBzcGFjZSB0byBwcmV2ZW50Cj4+Pj4+Pj4gZ3Vlc3RzIGhhdmluZyB0aGUgY2hhbmNlIHRvIGJ5
cGFzcyB0aGUgaG9zdCAoZS5nLiBRRU1VKSB0bwo+Pj4+Pj4+IHNldHVwIHRoZSBiYWNrZW5kIGFj
Y2VsZXJhdG9yIGRpcmVjdGx5Lgo+Pj4+Pj4gVGhhdCdzIHJlYWxseSBnb29kIHBvaW50LsKgIFNv
IHdoZW4gInZob3N0IiB0eXBlIGlzIGNyZWF0ZWQsIHBhcmVudAo+Pj4+Pj4gc2hvdWxkIGFzc3Vt
ZSBhZGRyIG9mIGN0cmxfdnEgaXMgaHZhLgo+Pj4+Pj4KPj4+Pj4+IFRoYW5rcwo+Pj4+PiBUaGlz
IHdvcmtzIGZvciB2aG9zdCBidXQgbm90IHZpcnRpbyBzaW5jZSB0aGVyZSdzIG5vIHdheSBmb3Ig
dmlydGlvIGtlcm5lbAo+Pj4+PiBkcml2ZXIgdG8gZGlmZmVyIGN0cmxfdnEgd2l0aCB0aGUgcmVz
dCB3aGVuIGRvaW5nIERNQSBtYXAuIE9uZSBwb3NzaWJsZQo+Pj4+PiBzb2x1dGlvbiBpcyB0byBw
cm92aWRlIERNQSBkb21haW4gaXNvbGF0aW9uIGJldHdlZW4gdmlydHF1ZXVlcy4gVGhlbiBjdHJs
IHZxCj4+Pj4+IGNhbiB1c2UgaXRzIGRlZGljYXRlZCBETUEgZG9tYWluIGZvciB0aGUgd29yay4K
Pj4+IEl0IG1pZ2h0IG5vdCBiZSBhIGJhZCBpZGVhIHRvIGxldCB0aGUgcGFyZW50IGRyaXZlcnMg
ZGlzdGluZ3Vpc2gKPj4+IGJldHdlZW4gdmlydGlvLW1kZXYgbWRldnMgYW5kIHZob3N0LW1kZXYg
bWRldnMgaW4gY3RybC12cSBoYW5kbGluZwo+Pj4gYnkgbWRldidzIGNsYXNzIGlkLgo+PiBZZXMs
IHRoYXQgc2hvdWxkIHdvcmssIEkgaGF2ZSBzb21ldGhpbmcgcHJvYmFibGUgYmV0dGVyLCBzZWUg
YmVsb3cuCj4+Cj4+Cj4+Pj4+IEFueXdheSwgdGhpcyBjb3VsZCBiZSBkb25lIGluIHRoZSBmdXR1
cmUuIFdlIGNhbiBoYXZlIGEgdmVyc2lvbiBmaXJzdCB0aGF0Cj4+Pj4+IGRvZXNuJ3Qgc3VwcG9y
dCBjdHJsX3ZxLgo+Pj4gKzEsIHRoYW5rcwo+Pj4KPj4+Pj4gVGhhbmtzCj4+Pj4gV2VsbCBubyBj
dHJsX3ZxIGltcGxpZXMgZWl0aGVyIG5vIG9mZmxvYWRzLCBvciBubyBYRFAgKHNpbmNlIFhEUCBu
ZWVkcwo+Pj4+IHRvIGRpc2FibGUgb2ZmbG9hZHMgZHluYW1pY2FsbHkpLgo+Pj4+Cj4+Pj4gICAg
ICAgICAgaWYgKCF2aXJ0aW9faGFzX2ZlYXR1cmUodmktPnZkZXYsIFZJUlRJT19ORVRfRl9DVFJM
X0dVRVNUX09GRkxPQURTKQo+Pj4+ICAgICAgICAgICAgICAmJiAodmlydGlvX2hhc19mZWF0dXJl
KHZpLT52ZGV2LCBWSVJUSU9fTkVUX0ZfR1VFU1RfVFNPNCkgfHwKPj4+PiAgICAgICAgICAgICAg
ICAgIHZpcnRpb19oYXNfZmVhdHVyZSh2aS0+dmRldiwgVklSVElPX05FVF9GX0dVRVNUX1RTTzYp
IHx8Cj4+Pj4gICAgICAgICAgICAgICAgICB2aXJ0aW9faGFzX2ZlYXR1cmUodmktPnZkZXYsIFZJ
UlRJT19ORVRfRl9HVUVTVF9FQ04pIHx8Cj4+Pj4gICAgICAgICAgICAgICAgICB2aXJ0aW9faGFz
X2ZlYXR1cmUodmktPnZkZXYsIFZJUlRJT19ORVRfRl9HVUVTVF9VRk8pIHx8Cj4+Pj4gICAgICAg
ICAgICAgICAgICB2aXJ0aW9faGFzX2ZlYXR1cmUodmktPnZkZXYsIFZJUlRJT19ORVRfRl9HVUVT
VF9DU1VNKSkpIHsKPj4+PiAgICAgICAgICAgICAgICAgIE5MX1NFVF9FUlJfTVNHX01PRChleHRh
Y2ssICJDYW4ndCBzZXQgWERQIHdoaWxlIGhvc3QgaXMgaW1wbGVtZW50aW5nIExSTy9DU1VNLCBk
aXNhYmxlIExSTy9DU1VNIGZpcnN0Iik7Cj4+Pj4gICAgICAgICAgICAgICAgICByZXR1cm4gLUVP
UE5PVFNVUFA7Cj4+Pj4gICAgICAgICAgfQo+Pj4+Cj4+Pj4gbmVpdGhlciBpcyB2ZXJ5IGF0dHJh
Y3RpdmUuCj4+Pj4KPj4+PiBTbyB5ZXMgb2sganVzdCBmb3IgZGV2ZWxvcG1lbnQgYnV0IHdlIGRv
IG5lZWQgdG8gZmlndXJlIG91dCBob3cgaXQgd2lsbAo+Pj4+IHdvcmsgZG93biB0aGUgcm9hZCBp
biBwcm9kdWN0aW9uLgo+Pj4gVG90YWxseSBhZ3JlZS4KPj4+Cj4+Pj4gU28gcmVhbGx5IHRoaXMg
c3BlY2lmaWMgdmlydGlvIG5ldCBkZXZpY2UgZG9lcyBub3Qgc3VwcG9ydCBjb250cm9sIHZxLAo+
Pj4+IGluc3RlYWQgaXQgc3VwcG9ydHMgYSBkaWZmZXJlbnQgdHJhbnNwb3J0IHNwZWNpZmljIHdh
eSB0byBzZW5kIGNvbW1hbmRzCj4+Pj4gdG8gZGV2aWNlLgo+Pj4+Cj4+Pj4gU29tZSBraW5kIG9m
IGV4dGVuc2lvbiB0byB0aGUgdHJhbnNwb3J0PyBJZGVhcz8KPj4gU28gaXQncyBiYXNpY2FsbHkg
YW4gaXNzdWUgb2YgaXNvbGF0aW5nIERNQSBkb21haW5zLiBNYXliZSB3ZSBjYW4gc3RhcnQgd2l0
aAo+PiB0cmFuc3BvcnQgQVBJIGZvciBxdWVyeWluZyBwZXIgdnEgRE1BIGRvbWFpbi9BU0lEPwo+
Pgo+PiAtIGZvciB2aG9zdC1tZGV2LCB1c2Vyc3BhY2UgY2FuIHF1ZXJ5IHRoZSBETUEgZG9tYWlu
IGZvciBlYWNoIHNwZWNpZmljCj4+IHZpcnRxdWV1ZS4gRm9yIGNvbnRyb2wgdnEsIG1kZXYgY2Fu
IHJldHVybiBpZCBmb3Igc29mdHdhcmUgZG9tYWluLCBmb3IgdGhlCj4+IHJlc3QgbWRldiB3aWxs
IHJldHVybiBpZCBvZiBWRklPIGRvbWFpbi4gVGhlbiB1c2Vyc3BhY2Uga25vdyB0aGF0IGl0IHNo
b3VsZAo+PiB1c2UgZGlmZmVyZW50IEFQSSBmb3IgcHJlcGFyaW5nIHRoZSB2aXJ0cXVldWUsIGUu
ZyBmb3IgdnEgb3RoZXIgdGhhbiBjb250cm9sCj4+IHZxLCBpdCBzaG91bGQgdXNlIFZGSU8gRE1B
IEFQSS4gVGhlIGNvbnRyb2wgdnEgaXQgc2hvdWxkIHVzZSBodmEgaW5zdGVhZC4KPj4KPj4gLSBm
b3IgdmlyaXRvLW1kZXYsIHdlIGNhbiBpbnRyb2R1Y2UgcGVyLXZxIERNQSBkZXZpY2UsIGFuZCBy
b3V0ZSBETUEgbWFwcGluZwo+PiByZXF1ZXN0IGZvciBjb250cm9sIHZxIGJhY2sgdG8gbWRldiBp
bnN0ZWFkIG9mIHRoZSBoYXJkd2FyZS4gKFdlIGNhbiB3cmFwCj4+IHRoZW0gaW50byBsaWJyYXJ5
IG9yIGhlbHBlcnMgdG8gZWFzZSB0aGUgZGV2ZWxvcG1lbnQgb2YgdmVuZG9yIHBoeXNpY2FsCj4+
IGRyaXZlcnMpLgo+IFRoYW5rcyBmb3IgdGhpcyBwcm9wb3NhbCEgSSdtIHRoaW5raW5nIGFib3V0
IGl0IHRoZXNlIGRheXMuCj4gSSB0aGluayBpdCBtaWdodCBiZSB0b28gY29tcGxpY2F0ZWQuIEkn
bSB3b25kZXJpbmcgd2hldGhlciB3ZQo+IGNhbiBoYXZlIHNvbWV0aGluZyBzaW1wbGVyLiBJIHdp
bGwgcG9zdCBhIFJGQyBwYXRjaCB0byBzaG93Cj4gbXkgaWRlYSB0b2RheS4KCgpUaGFua3MsIHdp
bGwgY2hlY2suCgpCdHcsIGZvciB2aXJ0aW8tbWRldiwgdGhlIGNoYW5nZSBzaG91bGQgYmUgdmVy
eSBtaW5pbWFsLCB3aWxsIHBvc3QgYW4KUkZDIGFzIHdlbGwuIEZvciB2aG9zdC1tZGV2LCBpdCBj
b3VsZCBiZSBqdXN0IGEgaGVscGVyIHRvIHJldHVybiBhbiBJRApmb3IgRE1BIGRvbWFpbiBsaWtl
IElEX1ZGSU8gb3IgSURfSFZBLgoKT3IgYSBtb3JlIHN0cmFpZ2h0Zm9yd2FyZCB3YXkgaXMgdG8g
Zm9yY2UgcXVldWVzIGxpa2UgY29udHJvbCB2cSB0byB1c2UgUEEuCgoKPgo+IFRoYW5rcywKPiBU
aXdlaQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpW
aXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91
bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlz
dGluZm8vdmlydHVhbGl6YXRpb24=
