Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D347B896C
	for <lists.virtualization@lfdr.de>; Fri, 20 Sep 2019 04:37:22 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 15138C2C;
	Fri, 20 Sep 2019 02:37:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D2379B43
	for <virtualization@lists.linux-foundation.org>;
	Fri, 20 Sep 2019 02:37:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3F15B711
	for <virtualization@lists.linux-foundation.org>;
	Fri, 20 Sep 2019 02:37:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9A1B93082E44;
	Fri, 20 Sep 2019 02:37:13 +0000 (UTC)
Received: from [10.72.12.88] (ovpn-12-88.pek2.redhat.com [10.72.12.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 717C95D9CD;
	Fri, 20 Sep 2019 02:37:00 +0000 (UTC)
Subject: Re: [RFC v4 0/3] vhost: introduce mdev based hardware backend
To: Tiwei Bie <tiwei.bie@intel.com>
References: <20190917010204.30376-1-tiwei.bie@intel.com>
	<993841ed-942e-c90b-8016-8e7dc76bf13a@redhat.com>
	<20190917105801.GA24855@___>
	<fa6957f3-19ad-f351-8c43-65bc8342b82e@redhat.com>
	<20190918102923-mutt-send-email-mst@kernel.org>
	<d2efe7e4-cf13-437d-e2dc-e2779fac7d2f@redhat.com>
	<20190919154552.GA27657@___>
	<43aaf7dc-f08b-8898-3c55-908ff4d68866@redhat.com>
	<20190920021630.GA4108@___>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <09dced89-3892-be43-3748-054ce21e37ab@redhat.com>
Date: Fri, 20 Sep 2019 10:36:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190920021630.GA4108@___>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Fri, 20 Sep 2019 02:37:13 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Ck9uIDIwMTkvOS8yMCDkuIrljYgxMDoxNiwgVGl3ZWkgQmllIHdyb3RlOgo+IE9uIEZyaSwgU2Vw
IDIwLCAyMDE5IGF0IDA5OjMwOjU4QU0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+IE9uIDIw
MTkvOS8xOSDkuIvljYgxMTo0NSwgVGl3ZWkgQmllIHdyb3RlOgo+Pj4gT24gVGh1LCBTZXAgMTks
IDIwMTkgYXQgMDk6MDg6MTFQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4+PiBPbiAyMDE5
LzkvMTgg5LiL5Y2IMTA6MzIsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+Pj4+Pj4gU28g
SSBoYXZlIHNvbWUgcXVlc3Rpb25zOgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiAxKSBDb21wYXJlZCB0byBt
ZXRob2QgMiwgd2hhdCdzIHRoZSBhZHZhbnRhZ2Ugb2YgY3JlYXRpbmcgYSBuZXcgdmhvc3QgY2hh
cgo+Pj4+Pj4+PiBkZXZpY2U/IEkgZ3Vlc3MgaXQncyBmb3Iga2VlcCB0aGUgQVBJIGNvbXBhdGli
aWxpdHk/Cj4+Pj4+Pj4gT25lIGJlbmVmaXQgaXMgdGhhdCB3ZSBjYW4gYXZvaWQgZG9pbmcgdmhv
c3QgaW9jdGxzIG9uCj4+Pj4+Pj4gVkZJTyBkZXZpY2UgZmQuCj4+Pj4+PiBZZXMsIGJ1dCBhbnkg
YmVuZWZpdCBmcm9tIGRvaW5nIHRoaXM/Cj4+Pj4+IEl0IGRvZXMgc2VlbSBhIGJpdCBtb3JlIG1v
ZHVsYXIsIGJ1dCBpdCdzIGNlcnRhaW5seSBub3QgYSBiaWcgZGVhbC4KPj4+PiBPaywgaWYgd2Ug
Z28gdGhpcyB3YXksIGl0IGNvdWxkIGJlIGFzIHNpbXBsZSBhcyBwcm92aWRlIHNvbWUgY2FsbGJh
Y2sgdG8KPj4+PiB2aG9zdCwgdGhlbiB2aG9zdCBjYW4ganVzdCBmb3J3YXJkIHRoZSBpb2N0bCB0
aHJvdWdoIHBhcmVudF9vcHMuCj4+Pj4KPj4+Pj4+Pj4gMikgRm9yIG1ldGhvZCAyLCBpcyB0aGVy
ZSBhbnkgZWFzeSB3YXkgZm9yIHVzZXIvYWRtaW4gdG8gZGlzdGluZ3Vpc2ggZS5nCj4+Pj4+Pj4+
IG9yZGluYXJ5IHZmaW8tbWRldiBmb3Igdmhvc3QgZnJvbSBvcmRpbmFyeSB2ZmlvLW1kZXY/Cj4+
Pj4+Pj4gSSB0aGluayBkZXZpY2UtYXBpIGNvdWxkIGJlIGEgY2hvaWNlLgo+Pj4+Pj4gT2suCj4+
Pj4+Pgo+Pj4+Pj4KPj4+Pj4+Pj4gSSBzYXcgeW91IGludHJvZHVjZQo+Pj4+Pj4+PiBvcHMgbWF0
Y2hpbmcgaGVscGVyIGJ1dCBpdCdzIG5vdCBmcmllbmRseSB0byBtYW5hZ2VtZW50Lgo+Pj4+Pj4+
IFRoZSBvcHMgbWF0Y2hpbmcgaGVscGVyIGlzIGp1c3QgdG8gY2hlY2sgd2hldGhlciBhIGdpdmVu
Cj4+Pj4+Pj4gdmZpby1kZXZpY2UgaXMgYmFzZWQgb24gYSBtZGV2IGRldmljZS4KPj4+Pj4+Pgo+
Pj4+Pj4+PiAzKSBBIGRyYXdiYWNrIG9mIDEpIGFuZCAyKSBpcyB0aGF0IGl0IG11c3QgZm9sbG93
IHZmaW9fZGV2aWNlX29wcyB0aGF0Cj4+Pj4+Pj4+IGFzc3VtZXMgdGhlIHBhcmFtZXRlciBjb21l
cyBmcm9tIHVzZXJzcGFjZSwgaXQgcHJldmVudHMgc3VwcG9ydCBrZXJuZWwKPj4+Pj4+Pj4gdmly
dGlvIGRyaXZlcnMuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IDQpIFNvIGNvbWVzIHRoZSBpZGVhIG9mIG1l
dGhvZCAzLCBzaW5jZSBpdCByZWdpc3RlciBhIG5ldyB2aG9zdC1tZGV2IGRyaXZlciwKPj4+Pj4+
Pj4gd2UgY2FuIHVzZSBkZXZpY2Ugc3BlY2lmaWMgb3BzIGluc3RlYWQgb2YgVkZJTyBvbmVzLCB0
aGVuIHdlIGNhbiBoYXZlIGEKPj4+Pj4+Pj4gY29tbW9uIEFQSSBiZXR3ZWVuIHZEUEEgcGFyZW50
IGFuZCB2aG9zdC1tZGV2L3ZpcnRpby1tZGV2IGRyaXZlcnMuCj4+Pj4+Pj4gQXMgdGhlIGFib3Zl
IGRyYWZ0IHNob3dzLCB0aGlzIHJlcXVpcmVzIGludHJvZHVjaW5nIGEgbmV3Cj4+Pj4+Pj4gVkZJ
TyBkZXZpY2UgZHJpdmVyLiBJIHRoaW5rIEFsZXgncyBvcGluaW9uIG1hdHRlcnMgaGVyZS4KPj4+
PiBKdXN0IHRvIGNsYXJpZnksIGEgbmV3IHR5cGUgb2YgbWRldiBkcml2ZXIgYnV0IHByb3ZpZGVz
IGR1bW15Cj4+Pj4gdmZpb19kZXZpY2Vfb3BzIGZvciBWRklPIHRvIG1ha2UgY29udGFpbmVyIERN
QSBpb2N0bCB3b3JrLgo+Pj4gSSBzZWUuIFRoYW5rcyEgSUlVQywgeW91IG1lYW4gd2UgY2FuIHBy
b3ZpZGUgYSB2ZXJ5IHRpbnkKPj4+IFZGSU8gZGV2aWNlIGRyaXZlciBpbiBkcml2ZXJzL3Zob3N0
L21kZXYuYywgZS5nLjoKPj4+Cj4+PiBzdGF0aWMgaW50IHZmaW9fdmhvc3RfbWRldl9vcGVuKHZv
aWQgKmRldmljZV9kYXRhKQo+Pj4gewo+Pj4gCWlmICghdHJ5X21vZHVsZV9nZXQoVEhJU19NT0RV
TEUpKQo+Pj4gCQlyZXR1cm4gLUVOT0RFVjsKPj4+IAlyZXR1cm4gMDsKPj4+IH0KPj4+Cj4+PiBz
dGF0aWMgdm9pZCB2ZmlvX3Zob3N0X21kZXZfcmVsZWFzZSh2b2lkICpkZXZpY2VfZGF0YSkKPj4+
IHsKPj4+IAltb2R1bGVfcHV0KFRISVNfTU9EVUxFKTsKPj4+IH0KPj4+Cj4+PiBzdGF0aWMgY29u
c3Qgc3RydWN0IHZmaW9fZGV2aWNlX29wcyB2ZmlvX3Zob3N0X21kZXZfZGV2X29wcyA9IHsKPj4+
IAkubmFtZQkJPSAidmZpby12aG9zdC1tZGV2IiwKPj4+IAkub3BlbgkJPSB2ZmlvX3Zob3N0X21k
ZXZfb3BlbiwKPj4+IAkucmVsZWFzZQk9IHZmaW9fdmhvc3RfbWRldl9yZWxlYXNlLAo+Pj4gfTsK
Pj4+Cj4+PiBzdGF0aWMgaW50IHZob3N0X21kZXZfcHJvYmUoc3RydWN0IGRldmljZSAqZGV2KQo+
Pj4gewo+Pj4gCXN0cnVjdCBtZGV2X2RldmljZSAqbWRldiA9IHRvX21kZXZfZGV2aWNlKGRldik7
Cj4+Pgo+Pj4gCS4uLiBDaGVjayB0aGUgbWRldiBkZXZpY2VfaWQgcHJvcG9zZWQgaW4gLi4uCj4+
PiAJLi4uIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzkvMTIvMTUxIC4uLgo+Pgo+PiBUbyBj
bGFyaWZ5LCB0aGlzIHNob3VsZCBiZSBkb25lIHRocm91Z2ggdGhlIGlkX3RhYmxlIGZpZWxkcyBp
bgo+PiB2aG9zdF9tZGV2X2RyaXZlciwgYW5kIGl0IHNob3VsZCBjbGFpbSBpdCBzdXBwb3J0cyB2
aXJ0aW8tbWRldiBkZXZpY2Ugb25seToKPj4KPj4KPj4gc3RhdGljIHN0cnVjdCBtZGV2X2NsYXNz
X2lkIGlkX3RhYmxlW10gPSB7Cj4+ICDCoMKgwqAgeyBNREVWX0lEX1ZJUlRJTyB9LAo+PiAgwqDC
oMKgIHsgMCB9LAo+PiB9Owo+Pgo+Pgo+PiBzdGF0aWMgc3RydWN0IG1kZXZfZHJpdmVyIHZob3N0
X21kZXZfZHJpdmVyID0gewo+PiAgwqDCoMKgIC4uLgo+PiAgwqDCoMKgIC5pZF90YWJsZSA9IGlk
X3RhYmxlLAo+PiB9Cj4gSW4gdGhpcyB3YXksIGJvdGggb2YgdmlydGlvLW1kZXYgYW5kIHZob3N0
LW1kZXYgd2lsbCB0cnkgdG8KPiB0YWtlIHRoaXMgZGV2aWNlLiBXZSBtYXkgd2FudCBhIHdheSB0
byBsZXQgdmhvc3QtbWRldiB0YWtlIHRoaXMKPiBkZXZpY2Ugb25seSB3aGVuIHVzZXJzIGV4cGxp
Y2l0bHkgYXNrIGl0IHRvIGRvIGl0LiBPciBtYXliZSB3ZQo+IGNhbiBoYXZlIGEgZGlmZmVyZW50
IE1ERVZfSUQgZm9yIHZob3N0LW1kZXYgYnV0IHNoYXJlIHRoZSBkZXZpY2UKPiBvcHMgd2l0aCB2
aXJ0aW8tbWRldi4KCgpJIHRoaW5rIGl0J3Mgc2ltaWxhciB0byB2aXJ0aW8tcGNpIHZzIHZmaW8t
cGNpLiBVc2VyIGNhbiBjaG9vc2UgdG8gCnN3aXRjaCB0aGUgZHJpdmVyIHRocm91Z2ggYmluZC91
bmJpbmQuCgoKPgo+Pgo+Pj4gCXJldHVybiB2ZmlvX2FkZF9ncm91cF9kZXYoZGV2LCAmdmZpb192
aG9zdF9tZGV2X2Rldl9vcHMsIG1kZXYpOwo+Pgo+PiBBbmQgaW4gdmZpb192aG9zdF9tZGV2X29w
cywgYWxsIGl0cyBuZWVkIGlzIHRvIGp1c3QgaW1wbGVtZW50IHZob3N0LW5ldAo+PiBpb2N0bCBh
bmQgdHJhbnNsYXRlIHRoZW0gdG8gdmlydGlvLW1kZXYgdHJhbnNwb3J0IChlLmcgZGV2aWNlX29w
cyBJIHByb3Bvc2VkCj4+IG9yIGlvY3RscyBvdGhlciB3aGF0ZXZlciBvdGhlciBtZXRob2QpIEFQ
SS4KPiBJIHNlZSwgc28gbXkgcHJldmlvdXMgdW5kZXJzdGFuZGluZyBpcyBiYXNpY2FsbHkgY29y
cmVjdDoKPgo+IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzkvMTcvMzMyCj4KPiBJLmUuIHdl
IHdvbid0IGhhdmUgYSBzZXBhcmF0ZSB2aG9zdCBmZCBhbmQgd2Ugd2lsbCBkbyBhbGwgdmhvc3QK
PiBpb2N0bHMgb24gdGhlIFZGSU8gZGV2aWNlIGZkIGJhY2tlZCBieSB0aGlzIG5ldyBWRklPIGRy
aXZlci4KCgpZZXMuCgpUaGFua3MKCgo+Cj4+IEFuZCBpdCBjb3VsZCBoYXZlIGEgZHVtbXkgb3Bz
Cj4+IGltcGxlbWVudGF0aW9uIGZvciB0aGUgb3RoZXIgZGV2aWNlX29wcy4KPj4KPj4KPj4+IH0K
Pj4+Cj4+PiBzdGF0aWMgdm9pZCB2aG9zdF9tZGV2X3JlbW92ZShzdHJ1Y3QgZGV2aWNlICpkZXYp
Cj4+PiB7Cj4+PiAJdmZpb19kZWxfZ3JvdXBfZGV2KGRldik7Cj4+PiB9Cj4+Pgo+Pj4gc3RhdGlj
IHN0cnVjdCBtZGV2X2RyaXZlciB2aG9zdF9tZGV2X2RyaXZlciA9IHsKPj4+IAkubmFtZQk9ICJ2
aG9zdF9tZGV2IiwKPj4+IAkucHJvYmUJPSB2aG9zdF9tZGV2X3Byb2JlLAo+Pj4gCS5yZW1vdmUJ
PSB2aG9zdF9tZGV2X3JlbW92ZSwKPj4+IH07Cj4+Pgo+Pj4gU28gd2UgY2FuIGJpbmQgYWJvdmUg
bWRldiBkcml2ZXIgdG8gdGhlIHZpcnRpby1tZGV2IGNvbXBhdGlibGUKPj4+IG1kZXYgZGV2aWNl
cyB3aGVuIHdlIHdhbnQgdG8gdXNlIHZob3N0LW1kZXYuCj4+Pgo+Pj4gQWZ0ZXIgYmluZGluZyBh
Ym92ZSBkcml2ZXIgdG8gdGhlIG1kZXYgZGV2aWNlLCB3ZSBjYW4gc2V0dXAgSU9NTVUKPj4+IHZp
YSBWRklPIGFuZCBnZXQgVkZJTyBkZXZpY2UgZmQgb2YgdGhpcyBtZGV2IGRldmljZSwgYW5kIHBh
c3MgaXQKPj4+IHRvIHZob3N0IGZkICgvZGV2L3Zob3N0LW1kZXYpIHdpdGggYSBTRVRfQkFDS0VO
RCBpb2N0bC4KPj4KPj4gVGhlbiB3aGF0IHZob3N0LW1kZXYgY2hhciBkZXZpY2UgZGlkIGlzIGp1
c3QgZm9yd2FyZGluZyBpb2N0bCBiYWNrIHRvIHRoaXMKPj4gdmZpbyBkZXZpY2UgZmQgd2hpY2gg
c2VlbXMgYSBvdmVya2lsbC4gSXQncyBzaW1wbGVyIHRoYXQganVzdCBkbyBpb2N0bCBvbgo+PiB0
aGUgZGV2aWNlIG9wcyBkaXJlY3RseS4KPiBZZXMuCj4KPiBUaGFua3MsCj4gVGl3ZWkKPgo+Cj4+
IFRoYW5rcwo+Pgo+Pgo+Pj4gVGhhbmtzLAo+Pj4gVGl3ZWkKPj4+Cj4+Pj4gVGhhbmtzCj4+Pj4K
Pj4+Pgo+Pj4+Pj4gWWVzLCBpdCBpcy4KPj4+Pj4+Cj4+Pj4+PiBUaGFua3MKPj4+Pj4+Cj4+Pj4+
PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFs
aXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlv
bi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8v
dmlydHVhbGl6YXRpb24=
