Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0F4D4FE4
	for <lists.virtualization@lfdr.de>; Sat, 12 Oct 2019 15:08:48 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 626BB1EBF;
	Sat, 12 Oct 2019 13:08:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C51D81E22
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 12:59:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 52182709
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 12:59:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6FEED18C8910;
	Sat, 12 Oct 2019 12:59:56 +0000 (UTC)
Received: from [10.72.12.16] (ovpn-12-16.pek2.redhat.com [10.72.12.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7D5F11C945;
	Sat, 12 Oct 2019 12:59:51 +0000 (UTC)
Subject: Re: [PATCH RFC net-next 2/2] drivers: net: virtio_net: Add tx_timeout
	function
To: "Michael S. Tsirkin" <mst@redhat.com>, jcfaracco@gmail.com
References: <20191006184515.23048-1-jcfaracco@gmail.com>
	<20191006184515.23048-3-jcfaracco@gmail.com>
	<20191007034402-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <e9a88540-6f5c-23e5-b8d2-a3836ec71858@redhat.com>
Date: Sat, 12 Oct 2019 20:59:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191007034402-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.70]);
	Sat, 12 Oct 2019 12:59:56 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, dnmendes76@gmail.com, davem@davemloft.net,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

Ck9uIDIwMTkvMTAvNyDkuIvljYgzOjUxLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
U3VuLCBPY3QgMDYsIDIwMTkgYXQgMDM6NDU6MTVQTSAtMDMwMCwgamNmYXJhY2NvQGdtYWlsLmNv
bSB3cm90ZToKPj4gRnJvbTogSnVsaW8gRmFyYWNjbyA8amNmYXJhY2NvQGdtYWlsLmNvbT4KPj4K
Pj4gVG8gZW5hYmxlIGRldl93YXRjaGRvZywgdmlydGlvX25ldCBzaG91bGQgaGF2ZSBhIHR4X3Rp
bWVvdXQgZGVmaW5lZAo+PiAoLm5kb190eF90aW1lb3V0KS4gVGhpcyBpcyBvbmx5IGEgc2tlbGV0
b24gdG8gdGhyb3cgYSB3YXJuIG1lc3NhZ2UuIEl0Cj4+IG5vdGlmaWVzIHRoZSBldmVudCBpbiBz
b21lIHNwZWNpZmljIHF1ZXVlIG9mIGRldmljZS4gVGhpcyBmdW5jdGlvbgo+PiBzdGlsbCBjb3Vu
dHMgdHhfdGltZW91dCBzdGF0aXN0aWMgYW5kIGNvbnNpZGVyIHRoaXMgZXZlbnQgYXMgYW4gZXJy
b3IKPj4gKG9uZSBlcnJvciBwZXIgcXVldWUpLCByZXBvcnRpbmcgaXQuCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IEp1bGlvIEZhcmFjY28gPGpjZmFyYWNjb0BnbWFpbC5jb20+Cj4+IFNpZ25lZC1vZmYt
Ynk6IERhaWFuZSBNZW5kZXMgPGRubWVuZGVzNzZAZ21haWwuY29tPgo+PiBDYzogSmFzb24gV2Fu
ZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy9uZXQvdmlydGlvX25l
dC5jIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+ICAgMSBmaWxlIGNoYW5nZWQs
IDI3IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3ZpcnRpb19u
ZXQuYyBiL2RyaXZlcnMvbmV0L3ZpcnRpb19uZXQuYwo+PiBpbmRleCAyN2Y5YjIxMmM5ZjUuLjRi
NzAzYjRiOTQ0MSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jCj4+ICsr
KyBiL2RyaXZlcnMvbmV0L3ZpcnRpb19uZXQuYwo+PiBAQCAtMjU4NSw2ICsyNTg1LDI5IEBAIHN0
YXRpYyBpbnQgdmlydG5ldF9zZXRfZmVhdHVyZXMoc3RydWN0IG5ldF9kZXZpY2UgKmRldiwKPj4g
ICAJcmV0dXJuIDA7Cj4+ICAgfQo+PiAgIAo+PiArc3RhdGljIHZvaWQgdmlydG5ldF90eF90aW1l
b3V0KHN0cnVjdCBuZXRfZGV2aWNlICpkZXYpCj4+ICt7Cj4+ICsJc3RydWN0IHZpcnRuZXRfaW5m
byAqdmkgPSBuZXRkZXZfcHJpdihkZXYpOwo+PiArCXUzMiBpOwo+PiArCj4+ICsJLyogZmluZCB0
aGUgc3RvcHBlZCBxdWV1ZSB0aGUgc2FtZSB3YXkgZGV2X3dhdGNoZG9nKCkgZG9lcyAqLwo+IG5v
dCByZWFsbHkgLSB0aGUgd2F0Y2hkb2cgYWN0dWFsbHkgbG9va3MgYXQgdHJhbnNfc3RhcnQuCj4K
Pj4gKwlmb3IgKGkgPSAwOyBpIDwgdmktPmN1cnJfcXVldWVfcGFpcnM7IGkrKykgewo+PiArCQlz
dHJ1Y3Qgc2VuZF9xdWV1ZSAqc3EgPSAmdmktPnNxW2ldOwo+PiArCj4+ICsJCWlmICghbmV0aWZf
eG1pdF9zdG9wcGVkKG5ldGRldl9nZXRfdHhfcXVldWUoZGV2LCBpKSkpCj4+ICsJCQljb250aW51
ZTsKPj4gKwo+PiArCQl1NjRfc3RhdHNfdXBkYXRlX2JlZ2luKCZzcS0+c3RhdHMuc3luY3ApOwo+
PiArCQlzcS0+c3RhdHMudHhfdGltZW91dHMrKzsKPj4gKwkJdTY0X3N0YXRzX3VwZGF0ZV9lbmQo
JnNxLT5zdGF0cy5zeW5jcCk7Cj4+ICsKPj4gKwkJbmV0ZGV2X3dhcm4oZGV2LCAiVFggdGltZW91
dCBvbiBzZW5kIHF1ZXVlOiAlZCwgc3E6ICVzLCB2cTogJWQsIG5hbWU6ICVzXG4iLAo+PiArCQkJ
ICAgIGksIHNxLT5uYW1lLCBzcS0+dnEtPmluZGV4LCBzcS0+dnEtPm5hbWUpOwo+IHRoaXMgc2Vl
bXMgdG8gYXNzdW1lIGFueSBydW5uaW5nIHF1ZXVlIGlzIHRpbWVkIG91dC4KPiBkb2Vzbid0IGxv
b2sgcmlnaHQuCj4KPiBhbHNvIC0gdGhlcmUncyBhbHJlYWR5IGEgd2FybmluZyBpbiB0aGlzIGNh
c2UgaW4gdGhlIGNvcmUuIGRvIHdlIG5lZWQgYW5vdGhlciBvbmU/Cj4KPj4gKwkJZGV2LT5zdGF0
cy50eF9lcnJvcnMrKzsKPgo+Cj4+ICsJfQo+PiArfQo+PiArCj4+ICAgc3RhdGljIGNvbnN0IHN0
cnVjdCBuZXRfZGV2aWNlX29wcyB2aXJ0bmV0X25ldGRldiA9IHsKPj4gICAJLm5kb19vcGVuICAg
ICAgICAgICAgPSB2aXJ0bmV0X29wZW4sCj4+ICAgCS5uZG9fc3RvcCAgIAkgICAgID0gdmlydG5l
dF9jbG9zZSwKPj4gQEAgLTI2MDAsNiArMjYyMyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbmV0
X2RldmljZV9vcHMgdmlydG5ldF9uZXRkZXYgPSB7Cj4+ICAgCS5uZG9fZmVhdHVyZXNfY2hlY2sJ
PSBwYXNzdGhydV9mZWF0dXJlc19jaGVjaywKPj4gICAJLm5kb19nZXRfcGh5c19wb3J0X25hbWUJ
PSB2aXJ0bmV0X2dldF9waHlzX3BvcnRfbmFtZSwKPj4gICAJLm5kb19zZXRfZmVhdHVyZXMJPSB2
aXJ0bmV0X3NldF9mZWF0dXJlcywKPj4gKwkubmRvX3R4X3RpbWVvdXQJCT0gdmlydG5ldF90eF90
aW1lb3V0LAo+PiAgIH07Cj4+ICAgCj4+ICAgc3RhdGljIHZvaWQgdmlydG5ldF9jb25maWdfY2hh
bmdlZF93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKPj4gQEAgLTMwMTgsNiArMzA0Miw5
IEBAIHN0YXRpYyBpbnQgdmlydG5ldF9wcm9iZShzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldikK
Pj4gICAJZGV2LT5uZXRkZXZfb3BzID0gJnZpcnRuZXRfbmV0ZGV2Owo+PiAgIAlkZXYtPmZlYXR1
cmVzID0gTkVUSUZfRl9ISUdIRE1BOwo+PiAgIAo+PiArCS8qIFNldCB1cCBkZXZfd2F0Y2hkb2cg
Y3ljbGUuICovCj4+ICsJZGV2LT53YXRjaGRvZ190aW1lbyA9IDUgKiBIWjsKPj4gKwo+IFNlZW1z
IHRvIGJlIHN0aWxsIGJyb2tlbiB3aXRoIG5hcGlfdHggPSBmYWxzZS4KCgpXaXRoIG5hcGlfdHgg
PSBmYWxzZSwgd2Ugc3RpbGwgaGF2ZSB0eCBpbnRlcnJ1cHQgYWZ0ZXIgd2Ugc3RvcCB0aGUgcXVl
dWUgCndoaWNoIGxvb2tzIGZpbmUgSSBiZWxpZXZlPwoKVGhhbmtzCgoKPgo+PiAgIAlkZXYtPmV0
aHRvb2xfb3BzID0gJnZpcnRuZXRfZXRodG9vbF9vcHM7Cj4+ICAgCVNFVF9ORVRERVZfREVWKGRl
diwgJnZkZXYtPmRldik7Cj4+ICAgCj4+IC0tIAo+PiAyLjIxLjAKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0
ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
