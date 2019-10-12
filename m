Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F63D4FE5
	for <lists.virtualization@lfdr.de>; Sat, 12 Oct 2019 15:08:55 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A005E1EC3;
	Sat, 12 Oct 2019 13:08:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E4BE91EB3
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 13:01:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7ED52735
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 13:01:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0B34AC05AA65;
	Sat, 12 Oct 2019 13:01:36 +0000 (UTC)
Received: from [10.72.12.16] (ovpn-12-16.pek2.redhat.com [10.72.12.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CD7911C945;
	Sat, 12 Oct 2019 13:01:30 +0000 (UTC)
Subject: Re: [PATCH RFC net-next 2/2] drivers: net: virtio_net: Add tx_timeout
	function
To: jcfaracco@gmail.com, netdev@vger.kernel.org
References: <20191006184515.23048-1-jcfaracco@gmail.com>
	<20191006184515.23048-3-jcfaracco@gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <6c7a48ee-b900-c77d-8d12-35fd242f2e6f@redhat.com>
Date: Sat, 12 Oct 2019 21:01:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191006184515.23048-3-jcfaracco@gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Sat, 12 Oct 2019 13:01:36 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-kernel@vger.kernel.org, dnmendes76@gmail.com,
	virtualization@lists.linux-foundation.org, davem@davemloft.net,
	mst@redhat.com
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

Ck9uIDIwMTkvMTAvNyDkuIrljYgyOjQ1LCBqY2ZhcmFjY29AZ21haWwuY29tIHdyb3RlOgo+IEZy
b206IEp1bGlvIEZhcmFjY28gPGpjZmFyYWNjb0BnbWFpbC5jb20+Cj4KPiBUbyBlbmFibGUgZGV2
X3dhdGNoZG9nLCB2aXJ0aW9fbmV0IHNob3VsZCBoYXZlIGEgdHhfdGltZW91dCBkZWZpbmVkCj4g
KC5uZG9fdHhfdGltZW91dCkuIFRoaXMgaXMgb25seSBhIHNrZWxldG9uIHRvIHRocm93IGEgd2Fy
biBtZXNzYWdlLiBJdAo+IG5vdGlmaWVzIHRoZSBldmVudCBpbiBzb21lIHNwZWNpZmljIHF1ZXVl
IG9mIGRldmljZS4gVGhpcyBmdW5jdGlvbgo+IHN0aWxsIGNvdW50cyB0eF90aW1lb3V0IHN0YXRp
c3RpYyBhbmQgY29uc2lkZXIgdGhpcyBldmVudCBhcyBhbiBlcnJvcgo+IChvbmUgZXJyb3IgcGVy
IHF1ZXVlKSwgcmVwb3J0aW5nIGl0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogSnVsaW8gRmFyYWNjbyA8
amNmYXJhY2NvQGdtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEYWlhbmUgTWVuZGVzIDxkbm1l
bmRlczc2QGdtYWlsLmNvbT4KPiBDYzogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4K
PiAtLS0KPiAgIGRyaXZlcnMvbmV0L3ZpcnRpb19uZXQuYyB8IDI3ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKykKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL25ldC92aXJ0aW9fbmV0LmMgYi9kcml2ZXJzL25ldC92aXJ0aW9fbmV0
LmMKPiBpbmRleCAyN2Y5YjIxMmM5ZjUuLjRiNzAzYjRiOTQ0MSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL25ldC92aXJ0aW9fbmV0LmMKPiArKysgYi9kcml2ZXJzL25ldC92aXJ0aW9fbmV0LmMKPiBA
QCAtMjU4NSw2ICsyNTg1LDI5IEBAIHN0YXRpYyBpbnQgdmlydG5ldF9zZXRfZmVhdHVyZXMoc3Ry
dWN0IG5ldF9kZXZpY2UgKmRldiwKPiAgIAlyZXR1cm4gMDsKPiAgIH0KPiAgIAo+ICtzdGF0aWMg
dm9pZCB2aXJ0bmV0X3R4X3RpbWVvdXQoc3RydWN0IG5ldF9kZXZpY2UgKmRldikKPiArewo+ICsJ
c3RydWN0IHZpcnRuZXRfaW5mbyAqdmkgPSBuZXRkZXZfcHJpdihkZXYpOwo+ICsJdTMyIGk7Cj4g
Kwo+ICsJLyogZmluZCB0aGUgc3RvcHBlZCBxdWV1ZSB0aGUgc2FtZSB3YXkgZGV2X3dhdGNoZG9n
KCkgZG9lcyAqLwo+ICsJZm9yIChpID0gMDsgaSA8IHZpLT5jdXJyX3F1ZXVlX3BhaXJzOyBpKysp
IHsKPiArCQlzdHJ1Y3Qgc2VuZF9xdWV1ZSAqc3EgPSAmdmktPnNxW2ldOwo+ICsKPiArCQlpZiAo
IW5ldGlmX3htaXRfc3RvcHBlZChuZXRkZXZfZ2V0X3R4X3F1ZXVlKGRldiwgaSkpKQo+ICsJCQlj
b250aW51ZTsKPiArCj4gKwkJdTY0X3N0YXRzX3VwZGF0ZV9iZWdpbigmc3EtPnN0YXRzLnN5bmNw
KTsKPiArCQlzcS0+c3RhdHMudHhfdGltZW91dHMrKzsKPiArCQl1NjRfc3RhdHNfdXBkYXRlX2Vu
ZCgmc3EtPnN0YXRzLnN5bmNwKTsKPiArCj4gKwkJbmV0ZGV2X3dhcm4oZGV2LCAiVFggdGltZW91
dCBvbiBzZW5kIHF1ZXVlOiAlZCwgc3E6ICVzLCB2cTogJWQsIG5hbWU6ICVzXG4iLAo+ICsJCQkg
ICAgaSwgc3EtPm5hbWUsIHNxLT52cS0+aW5kZXgsIHNxLT52cS0+bmFtZSk7CgoKSWYgdGhpcyBp
cyBqdXN0IGEgd2FybiBmb3IgYSBzcGVjaWZpYyBxdWV1ZSwgbWF5YmUgaXQncyBiZXR0ZXIgdG8g
ZG8gaXQgCmluIHRoZSBkZXZfd2F0Y2hkb2coKT8KCk9yIHdlIG1heSB3YW50IG1vcmUgaW5mb3Jt
YXRpb24gbGlrZSBhdmFpbCx1c2VkIGlkeCBldGMuCgpBbmQgdXN1YWxseSB0aGVyZSB3aWxsIGJl
IGEgcmVzZXQsIGFueSByZWFzb24gZm9yIG5vdCBkb2luZyB0aGlzPwoKVGhhbmtzCgoKPiArCj4g
KwkJZGV2LT5zdGF0cy50eF9lcnJvcnMrKzsKPiArCX0KPiArfQo+ICsKPiAgIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgbmV0X2RldmljZV9vcHMgdmlydG5ldF9uZXRkZXYgPSB7Cj4gICAJLm5kb19vcGVu
ICAgICAgICAgICAgPSB2aXJ0bmV0X29wZW4sCj4gICAJLm5kb19zdG9wICAgCSAgICAgPSB2aXJ0
bmV0X2Nsb3NlLAo+IEBAIC0yNjAwLDYgKzI2MjMsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG5l
dF9kZXZpY2Vfb3BzIHZpcnRuZXRfbmV0ZGV2ID0gewo+ICAgCS5uZG9fZmVhdHVyZXNfY2hlY2sJ
PSBwYXNzdGhydV9mZWF0dXJlc19jaGVjaywKPiAgIAkubmRvX2dldF9waHlzX3BvcnRfbmFtZQk9
IHZpcnRuZXRfZ2V0X3BoeXNfcG9ydF9uYW1lLAo+ICAgCS5uZG9fc2V0X2ZlYXR1cmVzCT0gdmly
dG5ldF9zZXRfZmVhdHVyZXMsCj4gKwkubmRvX3R4X3RpbWVvdXQJCT0gdmlydG5ldF90eF90aW1l
b3V0LAo+ICAgfTsKPiAgIAo+ICAgc3RhdGljIHZvaWQgdmlydG5ldF9jb25maWdfY2hhbmdlZF93
b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKPiBAQCAtMzAxOCw2ICszMDQyLDkgQEAgc3Rh
dGljIGludCB2aXJ0bmV0X3Byb2JlKHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2KQo+ICAgCWRl
di0+bmV0ZGV2X29wcyA9ICZ2aXJ0bmV0X25ldGRldjsKPiAgIAlkZXYtPmZlYXR1cmVzID0gTkVU
SUZfRl9ISUdIRE1BOwo+ICAgCj4gKwkvKiBTZXQgdXAgZGV2X3dhdGNoZG9nIGN5Y2xlLiAqLwo+
ICsJZGV2LT53YXRjaGRvZ190aW1lbyA9IDUgKiBIWjsKPiArCj4gICAJZGV2LT5ldGh0b29sX29w
cyA9ICZ2aXJ0bmV0X2V0aHRvb2xfb3BzOwo+ICAgCVNFVF9ORVRERVZfREVWKGRldiwgJnZkZXYt
PmRldik7Cj4gICAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4
LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
