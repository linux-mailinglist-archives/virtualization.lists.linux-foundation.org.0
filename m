Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4513EE6B9C
	for <lists.virtualization@lfdr.de>; Mon, 28 Oct 2019 04:51:17 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BBC77ACD;
	Mon, 28 Oct 2019 03:51:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3328541C
	for <virtualization@lists.linux-foundation.org>;
	Mon, 28 Oct 2019 03:51:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
	[207.211.31.81])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 6069C63D
	for <virtualization@lists.linux-foundation.org>;
	Mon, 28 Oct 2019 03:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572234666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=c3g4UjEb9DWKqjphn6WUlg8TodMgT3MFxKe3D2APMzQ=;
	b=O58oaPqCBm2CehB2m7pxkM4bzB0imAOwss6cOANmChQeDoeCTrPTwiZ5U6RX96sVWjjJ4y
	nPBhsvxi6fn1I8KvNcNKAG63lZa8RQiULW2ewId2F3t5W0ALB8KCS2Pac/5oGmk2n+pBEk
	r0uzNzFFjOr9AcIFKcv14Ne9osO85c8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-193-ZuWQpeT7OoiBddLiSa6f_Q-1; Sun, 27 Oct 2019 23:51:02 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0C975EC;
	Mon, 28 Oct 2019 03:51:00 +0000 (UTC)
Received: from [10.72.12.246] (ovpn-12-246.pek2.redhat.com [10.72.12.246])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D0AC35C219;
	Mon, 28 Oct 2019 03:50:51 +0000 (UTC)
Subject: Re: [PATCH v2] vhost: introduce mdev based hardware backend
To: Tiwei Bie <tiwei.bie@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>
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
	<20191028015842.GA9005@___>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <5e8a623d-9d91-607a-1f9e-7a7086ba9a68@redhat.com>
Date: Mon, 28 Oct 2019 11:50:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191028015842.GA9005@___>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: ZuWQpeT7OoiBddLiSa6f_Q-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Ck9uIDIwMTkvMTAvMjgg5LiK5Y2IOTo1OCwgVGl3ZWkgQmllIHdyb3RlOgo+IE9uIEZyaSwgT2N0
IDI1LCAyMDE5IGF0IDA4OjE2OjI2QU0gLTA0MDAsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToK
Pj4gT24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgMDU6NTQ6NTVQTSArMDgwMCwgSmFzb24gV2FuZyB3
cm90ZToKPj4+IE9uIDIwMTkvMTAvMjQg5LiL5Y2INjo0MiwgSmFzb24gV2FuZyB3cm90ZToKPj4+
PiBZZXMuCj4+Pj4KPj4+Pgo+Pj4+PiAgwqAgQW5kIHdlIHNob3VsZCB0cnkgdG8gYXZvaWQKPj4+
Pj4gcHV0dGluZyBjdHJsIHZxIGFuZCBSeC9UeCB2cXMgaW4gdGhlIHNhbWUgRE1BIHNwYWNlIHRv
IHByZXZlbnQKPj4+Pj4gZ3Vlc3RzIGhhdmluZyB0aGUgY2hhbmNlIHRvIGJ5cGFzcyB0aGUgaG9z
dCAoZS5nLiBRRU1VKSB0bwo+Pj4+PiBzZXR1cCB0aGUgYmFja2VuZCBhY2NlbGVyYXRvciBkaXJl
Y3RseS4KPj4+Pgo+Pj4+IFRoYXQncyByZWFsbHkgZ29vZCBwb2ludC7CoCBTbyB3aGVuICJ2aG9z
dCIgdHlwZSBpcyBjcmVhdGVkLCBwYXJlbnQKPj4+PiBzaG91bGQgYXNzdW1lIGFkZHIgb2YgY3Ry
bF92cSBpcyBodmEuCj4+Pj4KPj4+PiBUaGFua3MKPj4+Cj4+PiBUaGlzIHdvcmtzIGZvciB2aG9z
dCBidXQgbm90IHZpcnRpbyBzaW5jZSB0aGVyZSdzIG5vIHdheSBmb3IgdmlydGlvIGtlcm5lbAo+
Pj4gZHJpdmVyIHRvIGRpZmZlciBjdHJsX3ZxIHdpdGggdGhlIHJlc3Qgd2hlbiBkb2luZyBETUEg
bWFwLiBPbmUgcG9zc2libGUKPj4+IHNvbHV0aW9uIGlzIHRvIHByb3ZpZGUgRE1BIGRvbWFpbiBp
c29sYXRpb24gYmV0d2VlbiB2aXJ0cXVldWVzLiBUaGVuIGN0cmwgdnEKPj4+IGNhbiB1c2UgaXRz
IGRlZGljYXRlZCBETUEgZG9tYWluIGZvciB0aGUgd29yay4KPiBJdCBtaWdodCBub3QgYmUgYSBi
YWQgaWRlYSB0byBsZXQgdGhlIHBhcmVudCBkcml2ZXJzIGRpc3Rpbmd1aXNoCj4gYmV0d2VlbiB2
aXJ0aW8tbWRldiBtZGV2cyBhbmQgdmhvc3QtbWRldiBtZGV2cyBpbiBjdHJsLXZxIGhhbmRsaW5n
Cj4gYnkgbWRldidzIGNsYXNzIGlkLgoKClllcywgdGhhdCBzaG91bGQgd29yaywgSSBoYXZlIHNv
bWV0aGluZyBwcm9iYWJsZSBiZXR0ZXIsIHNlZSBiZWxvdy4KCgo+Cj4+PiBBbnl3YXksIHRoaXMg
Y291bGQgYmUgZG9uZSBpbiB0aGUgZnV0dXJlLiBXZSBjYW4gaGF2ZSBhIHZlcnNpb24gZmlyc3Qg
dGhhdAo+Pj4gZG9lc24ndCBzdXBwb3J0IGN0cmxfdnEuCj4gKzEsIHRoYW5rcwo+Cj4+PiBUaGFu
a3MKPj4gV2VsbCBubyBjdHJsX3ZxIGltcGxpZXMgZWl0aGVyIG5vIG9mZmxvYWRzLCBvciBubyBY
RFAgKHNpbmNlIFhEUCBuZWVkcwo+PiB0byBkaXNhYmxlIG9mZmxvYWRzIGR5bmFtaWNhbGx5KS4K
Pj4KPj4gICAgICAgICAgaWYgKCF2aXJ0aW9faGFzX2ZlYXR1cmUodmktPnZkZXYsIFZJUlRJT19O
RVRfRl9DVFJMX0dVRVNUX09GRkxPQURTKQo+PiAgICAgICAgICAgICAgJiYgKHZpcnRpb19oYXNf
ZmVhdHVyZSh2aS0+dmRldiwgVklSVElPX05FVF9GX0dVRVNUX1RTTzQpIHx8Cj4+ICAgICAgICAg
ICAgICAgICAgdmlydGlvX2hhc19mZWF0dXJlKHZpLT52ZGV2LCBWSVJUSU9fTkVUX0ZfR1VFU1Rf
VFNPNikgfHwKPj4gICAgICAgICAgICAgICAgICB2aXJ0aW9faGFzX2ZlYXR1cmUodmktPnZkZXYs
IFZJUlRJT19ORVRfRl9HVUVTVF9FQ04pIHx8Cj4+ICAgICAgICAgICAgICAgICAgdmlydGlvX2hh
c19mZWF0dXJlKHZpLT52ZGV2LCBWSVJUSU9fTkVUX0ZfR1VFU1RfVUZPKSB8fAo+PiAgICAgICAg
ICAgICAgICAgIHZpcnRpb19oYXNfZmVhdHVyZSh2aS0+dmRldiwgVklSVElPX05FVF9GX0dVRVNU
X0NTVU0pKSkgewo+PiAgICAgICAgICAgICAgICAgIE5MX1NFVF9FUlJfTVNHX01PRChleHRhY2ss
ICJDYW4ndCBzZXQgWERQIHdoaWxlIGhvc3QgaXMgaW1wbGVtZW50aW5nIExSTy9DU1VNLCBkaXNh
YmxlIExSTy9DU1VNIGZpcnN0Iik7Cj4+ICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RT
VVBQOwo+PiAgICAgICAgICB9Cj4+Cj4+IG5laXRoZXIgaXMgdmVyeSBhdHRyYWN0aXZlLgo+Pgo+
PiBTbyB5ZXMgb2sganVzdCBmb3IgZGV2ZWxvcG1lbnQgYnV0IHdlIGRvIG5lZWQgdG8gZmlndXJl
IG91dCBob3cgaXQgd2lsbAo+PiB3b3JrIGRvd24gdGhlIHJvYWQgaW4gcHJvZHVjdGlvbi4KPiBU
b3RhbGx5IGFncmVlLgo+Cj4+IFNvIHJlYWxseSB0aGlzIHNwZWNpZmljIHZpcnRpbyBuZXQgZGV2
aWNlIGRvZXMgbm90IHN1cHBvcnQgY29udHJvbCB2cSwKPj4gaW5zdGVhZCBpdCBzdXBwb3J0cyBh
IGRpZmZlcmVudCB0cmFuc3BvcnQgc3BlY2lmaWMgd2F5IHRvIHNlbmQgY29tbWFuZHMKPj4gdG8g
ZGV2aWNlLgo+Pgo+PiBTb21lIGtpbmQgb2YgZXh0ZW5zaW9uIHRvIHRoZSB0cmFuc3BvcnQ/IElk
ZWFzPwoKClNvIGl0J3MgYmFzaWNhbGx5IGFuIGlzc3VlIG9mIGlzb2xhdGluZyBETUEgZG9tYWlu
cy4gTWF5YmUgd2UgY2FuIHN0YXJ0IAp3aXRoIHRyYW5zcG9ydCBBUEkgZm9yIHF1ZXJ5aW5nIHBl
ciB2cSBETUEgZG9tYWluL0FTSUQ/CgotIGZvciB2aG9zdC1tZGV2LCB1c2Vyc3BhY2UgY2FuIHF1
ZXJ5IHRoZSBETUEgZG9tYWluIGZvciBlYWNoIHNwZWNpZmljIAp2aXJ0cXVldWUuIEZvciBjb250
cm9sIHZxLCBtZGV2IGNhbiByZXR1cm4gaWQgZm9yIHNvZnR3YXJlIGRvbWFpbiwgZm9yIAp0aGUg
cmVzdCBtZGV2IHdpbGwgcmV0dXJuIGlkIG9mIFZGSU8gZG9tYWluLiBUaGVuIHVzZXJzcGFjZSBr
bm93IHRoYXQgaXQgCnNob3VsZCB1c2UgZGlmZmVyZW50IEFQSSBmb3IgcHJlcGFyaW5nIHRoZSB2
aXJ0cXVldWUsIGUuZyBmb3IgdnEgb3RoZXIgCnRoYW4gY29udHJvbCB2cSwgaXQgc2hvdWxkIHVz
ZSBWRklPIERNQSBBUEkuIFRoZSBjb250cm9sIHZxIGl0IHNob3VsZCAKdXNlIGh2YSBpbnN0ZWFk
LgoKLSBmb3IgdmlyaXRvLW1kZXYsIHdlIGNhbiBpbnRyb2R1Y2UgcGVyLXZxIERNQSBkZXZpY2Us
IGFuZCByb3V0ZSBETUEgCm1hcHBpbmcgcmVxdWVzdCBmb3IgY29udHJvbCB2cSBiYWNrIHRvIG1k
ZXYgaW5zdGVhZCBvZiB0aGUgaGFyZHdhcmUuIChXZSAKY2FuIHdyYXAgdGhlbSBpbnRvIGxpYnJh
cnkgb3IgaGVscGVycyB0byBlYXNlIHRoZSBkZXZlbG9wbWVudCBvZiB2ZW5kb3IgCnBoeXNpY2Fs
IGRyaXZlcnMpLgoKVGhhbmtzCgoKPj4KPj4KPj4gLS0gCj4+IE1TVAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBs
aXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
