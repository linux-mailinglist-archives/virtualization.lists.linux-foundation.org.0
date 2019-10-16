Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC69D8791
	for <lists.virtualization@lfdr.de>; Wed, 16 Oct 2019 06:38:41 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 312A4AEF;
	Wed, 16 Oct 2019 04:38:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 62D3540B
	for <virtualization@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 04:38:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4B54370D
	for <virtualization@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 04:38:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ABFD53082B40;
	Wed, 16 Oct 2019 04:38:32 +0000 (UTC)
Received: from [10.72.12.53] (ovpn-12-53.pek2.redhat.com [10.72.12.53])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2228819C5B;
	Wed, 16 Oct 2019 04:38:19 +0000 (UTC)
Subject: Re: [PATCH RFC v1 1/2] vhost: option to fetch descriptors through an
	independent struct
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20191011134358.16912-1-mst@redhat.com>
	<20191011134358.16912-2-mst@redhat.com>
	<3b2a6309-9d21-7172-a581-9f0f1d5c1427@redhat.com>
	<20191012162445-mutt-send-email-mst@kernel.org>
	<fea337ec-7c09-508b-3efa-b75afd6fe33b@redhat.com>
	<20191014085806-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <e0e9cf30-8db6-e83a-3a69-dc86efff919b@redhat.com>
Date: Wed, 16 Oct 2019 12:38:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191014085806-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Wed, 16 Oct 2019 04:38:32 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org
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

Ck9uIDIwMTkvMTAvMTYg5LiK5Y2INDoyMCwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+IE9u
IE1vbiwgT2N0IDE0LCAyMDE5IGF0IDA5OjQzOjI1QU0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6
Cj4+IE9uIDIwMTkvMTAvMTMg5LiK5Y2INDoyNywgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+
Pj4gT24gU2F0LCBPY3QgMTIsIDIwMTkgYXQgMDM6Mjg6NDlQTSArMDgwMCwgSmFzb24gV2FuZyB3
cm90ZToKPj4+PiBPbiAyMDE5LzEwLzExIOS4i+WNiDk6NDUsIE1pY2hhZWwgUy4gVHNpcmtpbiB3
cm90ZToKPj4+Pj4gVGhlIGlkZWEgaXMgdG8gc3VwcG9ydCBtdWx0aXBsZSByaW5nIGZvcm1hdHMg
YnkgY29udmVydGluZwo+Pj4+PiB0byBhIGZvcm1hdC1pbmRlcGVuZGVudCBhcnJheSBvZiBkZXNj
cmlwdG9ycy4KPj4+Pj4KPj4+Pj4gVGhpcyBjb3N0cyBleHRyYSBjeWNsZXMsIGJ1dCB3ZSBnYWlu
IGluIGFiaWxpdHkKPj4+Pj4gdG8gZmV0Y2ggYSBiYXRjaCBvZiBkZXNjcmlwdG9ycyBpbiBvbmUg
Z28sIHdoaWNoCj4+Pj4+IGlzIGdvb2QgZm9yIGNvZGUgY2FjaGUgbG9jYWxpdHkuCj4+Pj4+Cj4+
Pj4+IFRvIHNpbXBsaWZ5IGJlbmNobWFya2luZywgSSBrZXB0IHRoZSBvbGQgY29kZQo+Pj4+PiBh
cm91bmQgc28gb25lIGNhbiBzd2l0Y2ggYmFjayBhbmQgZm9ydGggYnkKPj4+Pj4gd3JpdGluZyBp
bnRvIGEgbW9kdWxlIHBhcmFtZXRlci4KPj4+Pj4gVGhpcyB3aWxsIGdvIGF3YXkgaW4gdGhlIGZp
bmFsIHN1Ym1pc3Npb24uCj4+Pj4+Cj4+Pj4+IFRoaXMgcGF0Y2ggY2F1c2VzIGEgbWlub3IgcGVy
Zm9ybWFuY2UgZGVncmFkYXRpb24sCj4+Pj4+IGl0J3MgYmVlbiBrZXB0IGFzIHNpbXBsZSBhcyBw
b3NzaWJsZSBmb3IgZWFzZSBvZiByZXZpZXcuCj4+Pj4+IE5leHQgcGF0Y2ggZ2V0cyB1cyBiYWNr
IHRoZSBwZXJmb3JtYW5jZSBieSBhZGRpbmcgYmF0Y2hpbmcuCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1v
ZmYtYnk6IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+Cj4+Pj4+IC0tLQo+Pj4+
PiAgICAgZHJpdmVycy92aG9zdC90ZXN0LmMgIHwgIDE3ICsrLQo+Pj4+PiAgICAgZHJpdmVycy92
aG9zdC92aG9zdC5jIHwgMjk5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrLQo+Pj4+PiAgICAgZHJpdmVycy92aG9zdC92aG9zdC5oIHwgIDE2ICsrKwo+Pj4+PiAgICAg
MyBmaWxlcyBjaGFuZ2VkLCAzMjcgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPj4+Pj4K
Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3QvdGVzdC5jIGIvZHJpdmVycy92aG9zdC90
ZXN0LmMKPj4+Pj4gaW5kZXggMDU2MzA4MDA4Mjg4Li4zOWEwMThhN2FmMmQgMTAwNjQ0Cj4+Pj4+
IC0tLSBhL2RyaXZlcnMvdmhvc3QvdGVzdC5jCj4+Pj4+ICsrKyBiL2RyaXZlcnMvdmhvc3QvdGVz
dC5jCj4+Pj4+IEBAIC0xOCw2ICsxOCw5IEBACj4+Pj4+ICAgICAjaW5jbHVkZSAidGVzdC5oIgo+
Pj4+PiAgICAgI2luY2x1ZGUgInZob3N0LmgiCj4+Pj4+ICtzdGF0aWMgaW50IG5ld2NvZGUgPSAw
Owo+Pj4+PiArbW9kdWxlX3BhcmFtKG5ld2NvZGUsIGludCwgMDY0NCk7Cj4+Pj4+ICsKPj4+Pj4g
ICAgIC8qIE1heCBudW1iZXIgb2YgYnl0ZXMgdHJhbnNmZXJyZWQgYmVmb3JlIHJlcXVldWVpbmcg
dGhlIGpvYi4KPj4+Pj4gICAgICAqIFVzaW5nIHRoaXMgbGltaXQgcHJldmVudHMgb25lIHZpcnRx
dWV1ZSBmcm9tIHN0YXJ2aW5nIG90aGVycy4gKi8KPj4+Pj4gICAgICNkZWZpbmUgVkhPU1RfVEVT
VF9XRUlHSFQgMHg4MDAwMAo+Pj4+PiBAQCAtNTgsMTAgKzYxLDE2IEBAIHN0YXRpYyB2b2lkIGhh
bmRsZV92cShzdHJ1Y3Qgdmhvc3RfdGVzdCAqbikKPj4+Pj4gICAgIAl2aG9zdF9kaXNhYmxlX25v
dGlmeSgmbi0+ZGV2LCB2cSk7Cj4+Pj4+ICAgICAJZm9yICg7Oykgewo+Pj4+PiAtCQloZWFkID0g
dmhvc3RfZ2V0X3ZxX2Rlc2ModnEsIHZxLT5pb3YsCj4+Pj4+IC0JCQkJCSBBUlJBWV9TSVpFKHZx
LT5pb3YpLAo+Pj4+PiAtCQkJCQkgJm91dCwgJmluLAo+Pj4+PiAtCQkJCQkgTlVMTCwgTlVMTCk7
Cj4+Pj4+ICsJCWlmIChuZXdjb2RlKQo+Pj4+PiArCQkJaGVhZCA9IHZob3N0X2dldF92cV9kZXNj
X2JhdGNoKHZxLCB2cS0+aW92LAo+Pj4+PiArCQkJCQkJICAgICAgIEFSUkFZX1NJWkUodnEtPmlv
diksCj4+Pj4+ICsJCQkJCQkgICAgICAgJm91dCwgJmluLAo+Pj4+PiArCQkJCQkJICAgICAgIE5V
TEwsIE5VTEwpOwo+Pj4+PiArCQllbHNlCj4+Pj4+ICsJCQloZWFkID0gdmhvc3RfZ2V0X3ZxX2Rl
c2ModnEsIHZxLT5pb3YsCj4+Pj4+ICsJCQkJCQkgQVJSQVlfU0laRSh2cS0+aW92KSwKPj4+Pj4g
KwkJCQkJCSAmb3V0LCAmaW4sCj4+Pj4+ICsJCQkJCQkgTlVMTCwgTlVMTCk7Cj4+Pj4+ICAgICAJ
CS8qIE9uIGVycm9yLCBzdG9wIGhhbmRsaW5nIHVudGlsIHRoZSBuZXh0IGtpY2suICovCj4+Pj4+
ICAgICAJCWlmICh1bmxpa2VseShoZWFkIDwgMCkpCj4+Pj4+ICAgICAJCQlicmVhazsKPj4+Pj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYyBiL2RyaXZlcnMvdmhvc3Qvdmhvc3Qu
Ywo+Pj4+PiBpbmRleCAzNmNhMmNmNDE5YmYuLjM2NjYxZDZjYjUxZiAxMDA2NDQKPj4+Pj4gLS0t
IGEvZHJpdmVycy92aG9zdC92aG9zdC5jCj4+Pj4+ICsrKyBiL2RyaXZlcnMvdmhvc3Qvdmhvc3Qu
Ywo+Pj4+PiBAQCAtMzAxLDYgKzMwMSw3IEBAIHN0YXRpYyB2b2lkIHZob3N0X3ZxX3Jlc2V0KHN0
cnVjdCB2aG9zdF9kZXYgKmRldiwKPj4+Pj4gICAgIAkJCSAgIHN0cnVjdCB2aG9zdF92aXJ0cXVl
dWUgKnZxKQo+Pj4+PiAgICAgewo+Pj4+PiAgICAgCXZxLT5udW0gPSAxOwo+Pj4+PiArCXZxLT5u
ZGVzY3MgPSAwOwo+Pj4+PiAgICAgCXZxLT5kZXNjID0gTlVMTDsKPj4+Pj4gICAgIAl2cS0+YXZh
aWwgPSBOVUxMOwo+Pj4+PiAgICAgCXZxLT51c2VkID0gTlVMTDsKPj4+Pj4gQEAgLTM2OSw2ICsz
NzAsOSBAQCBzdGF0aWMgaW50IHZob3N0X3dvcmtlcih2b2lkICpkYXRhKQo+Pj4+PiAgICAgc3Rh
dGljIHZvaWQgdmhvc3RfdnFfZnJlZV9pb3ZlY3Moc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnEp
Cj4+Pj4+ICAgICB7Cj4+Pj4+ICsJa2ZyZWUodnEtPmRlc2NzKTsKPj4+Pj4gKwl2cS0+ZGVzY3Mg
PSBOVUxMOwo+Pj4+PiArCXZxLT5tYXhfZGVzY3MgPSAwOwo+Pj4+PiAgICAgCWtmcmVlKHZxLT5p
bmRpcmVjdCk7Cj4+Pj4+ICAgICAJdnEtPmluZGlyZWN0ID0gTlVMTDsKPj4+Pj4gICAgIAlrZnJl
ZSh2cS0+bG9nKTsKPj4+Pj4gQEAgLTM4NSw2ICszODksMTAgQEAgc3RhdGljIGxvbmcgdmhvc3Rf
ZGV2X2FsbG9jX2lvdmVjcyhzdHJ1Y3Qgdmhvc3RfZGV2ICpkZXYpCj4+Pj4+ICAgICAJZm9yIChp
ID0gMDsgaSA8IGRldi0+bnZxczsgKytpKSB7Cj4+Pj4+ICAgICAJCXZxID0gZGV2LT52cXNbaV07
Cj4+Pj4+ICsJCXZxLT5tYXhfZGVzY3MgPSBkZXYtPmlvdl9saW1pdDsKPj4+Pj4gKwkJdnEtPmRl
c2NzID0ga21hbGxvY19hcnJheSh2cS0+bWF4X2Rlc2NzLAo+Pj4+PiArCQkJCQkgIHNpemVvZigq
dnEtPmRlc2NzKSwKPj4+Pj4gKwkJCQkJICBHRlBfS0VSTkVMKTsKPj4+PiBJcyBpb3ZfbGltaXQg
dG9vIG11Y2ggaGVyZT8gSXQgY2FuIG9idmlvdXNseSBpbmNyZWFzZSB0aGUgZm9vdHByaW50LiBJ
IGd1ZXNzCj4+Pj4gdGhlIGJhdGNoaW5nIGNhbiBvbmx5IGJlIGRvbmUgZm9yIGRlc2NyaXB0b3Ig
d2l0aG91dCBpbmRpcmVjdCBvciBuZXh0IHNldC4KPj4+PiBUaGVuIHdlIG1heSBiYXRjaCAxNiBv
ciA2NC4KPj4+Pgo+Pj4+IFRoYW5rcwo+Pj4gWWVzLCBuZXh0IHBhdGNoIG9ubHkgYmF0Y2hlcyB1
cCB0byA2NC4gIEJ1dCB3ZSBkbyBuZWVkIGlvdl9saW1pdCBiZWNhdXNlCj4+PiBndWVzdCBjYW4g
cGFzcyBhIGxvbmcgY2hhaW4gb2Ygc2NhdHRlci9nYXRoZXIuCj4+PiBXZSBhbHJlYWR5IGhhdmUg
aW92ZWNzIGluIGEgaHVnZSBhcnJheSBzbyB0aGlzIGRvZXMgbm90IGxvb2sgbGlrZQo+Pj4gYSBi
aWcgZGVhbC4gSWYgd2UgZXZlciB0ZWFjaCB0aGUgY29kZSB0byBhdm9pZCB0aGUgaHVnZQo+Pj4g
aW92IGFycmF5cyBieSBoYW5kbGluZyBodWdlIHMvZyBsaXN0cyBwaWVjZSBieSBwaWVjZSwKPj4+
IHdlIGNhbiBtYWtlIHRoZSBkZXNjIGFycmF5IHNtYWxsZXIgYXQgdGhlIHNhbWUgcG9pbnQuCj4+
Pgo+PiBBbm90aGVyIHBvc3NpYmxlIGlzc3VlLCBpZiB3ZSB0cnkgdG8gYmF0Y2ggZGVzY3JpcHRv
ciBjaGFpbiB3aGVuIHdlJ3ZlCj4+IGFscmVhZHkgYmF0Y2hlZCBzb21lIGRlc2NyaXB0b3JzLCB3
ZSBtYXkgcmVhY2ggdGhlIGxpbWl0IHRoZW4gc29tZSBvZiB0aGUKPj4gZGVzY3JpcHRvcnMgbWln
aHQgbmVlZCByZS1yZWFkLgo+Pgo+PiBPciB3ZSBtYXkgbmVlZCBjaXJjdWxhciBpbmRleCAoaGVh
ZCwgdGFpbCkgaW4gdGhpcyBjYXNlPwo+Pgo+PiBUaGFua3MKPiBXZSBuZXZlciBzdXBwb3J0ZWQg
bW9yZSB0aGFuIElPVl9NQVggZGVzY3JpcHRvcnMuCj4gQW5kIHdlIGRvbid0IGJhdGNoIG1vcmUg
dGhhbiBpb3ZfbGltaXQgLSBJT1ZfTUFYLgoKCk9rLCBidXQgd2hhdCBoYXBwZW5zIHdoZW4gd2Un
dmUgYWxyZWFkeSBiYXRjaGVkIDYzIGRlc2NyaXB0b3JzIHRoZW4gY29tZSAKYSAzIGRlc2NyaXB0
b3IgY2hhaW4/CgpBbmQgaXQgbG9va3MgdG8gbWUgd2UgbmVlZCBmb3JnZXQgdGhlIGNhY2hlZCBk
ZXNjcmlwdG9yIGR1cmluZyAKc2V0X3ZyaW5nX2Jhc2UoKQoKVGhhbmtzCgoKPgo+IHNvIGJ1ZmZl
ciBuZXZlciBvdmVyZmxvd3MuCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxp
c3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
