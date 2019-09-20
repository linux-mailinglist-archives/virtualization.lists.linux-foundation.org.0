Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 839EAB88C5
	for <lists.virtualization@lfdr.de>; Fri, 20 Sep 2019 02:59:55 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 071CBC96;
	Fri, 20 Sep 2019 00:59:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 888E7C84
	for <virtualization@lists.linux-foundation.org>;
	Fri, 20 Sep 2019 00:59:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E9BECF8
	for <virtualization@lists.linux-foundation.org>;
	Fri, 20 Sep 2019 00:59:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2C55B81DE7;
	Fri, 20 Sep 2019 00:59:46 +0000 (UTC)
Received: from [10.72.12.88] (ovpn-12-88.pek2.redhat.com [10.72.12.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4F6D75D9CD;
	Fri, 20 Sep 2019 00:59:34 +0000 (UTC)
Subject: Re: [RFC v4 0/3] vhost: introduce mdev based hardware backend
To: Tiwei Bie <tiwei.bie@intel.com>
References: <20190917010204.30376-1-tiwei.bie@intel.com>
	<993841ed-942e-c90b-8016-8e7dc76bf13a@redhat.com>
	<20190917105801.GA24855@___>
	<fa6957f3-19ad-f351-8c43-65bc8342b82e@redhat.com>
	<20190918102923-mutt-send-email-mst@kernel.org>
	<d2efe7e4-cf13-437d-e2dc-e2779fac7d2f@redhat.com>
	<20190919154552.GA27657@___>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <11bc30a9-1cf5-4a5f-109a-f307d70c35fa@redhat.com>
Date: Fri, 20 Sep 2019 08:59:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919154552.GA27657@___>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 20 Sep 2019 00:59:46 +0000 (UTC)
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

Ck9uIDIwMTkvOS8xOSDkuIvljYgxMTo0NSwgVGl3ZWkgQmllIHdyb3RlOgo+IE9uIFRodSwgU2Vw
IDE5LCAyMDE5IGF0IDA5OjA4OjExUE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+IE9uIDIw
MTkvOS8xOCDkuIvljYgxMDozMiwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+Pj4+Pj4gU28g
SSBoYXZlIHNvbWUgcXVlc3Rpb25zOgo+Pj4+Pj4KPj4+Pj4+IDEpIENvbXBhcmVkIHRvIG1ldGhv
ZCAyLCB3aGF0J3MgdGhlIGFkdmFudGFnZSBvZiBjcmVhdGluZyBhIG5ldyB2aG9zdCBjaGFyCj4+
Pj4+PiBkZXZpY2U/IEkgZ3Vlc3MgaXQncyBmb3Iga2VlcCB0aGUgQVBJIGNvbXBhdGliaWxpdHk/
Cj4+Pj4+IE9uZSBiZW5lZml0IGlzIHRoYXQgd2UgY2FuIGF2b2lkIGRvaW5nIHZob3N0IGlvY3Rs
cyBvbgo+Pj4+PiBWRklPIGRldmljZSBmZC4KPj4+PiBZZXMsIGJ1dCBhbnkgYmVuZWZpdCBmcm9t
IGRvaW5nIHRoaXM/Cj4+PiBJdCBkb2VzIHNlZW0gYSBiaXQgbW9yZSBtb2R1bGFyLCBidXQgaXQn
cyBjZXJ0YWlubHkgbm90IGEgYmlnIGRlYWwuCj4+IE9rLCBpZiB3ZSBnbyB0aGlzIHdheSwgaXQg
Y291bGQgYmUgYXMgc2ltcGxlIGFzIHByb3ZpZGUgc29tZSBjYWxsYmFjayB0bwo+PiB2aG9zdCwg
dGhlbiB2aG9zdCBjYW4ganVzdCBmb3J3YXJkIHRoZSBpb2N0bCB0aHJvdWdoIHBhcmVudF9vcHMu
Cj4+Cj4+Pj4+PiAyKSBGb3IgbWV0aG9kIDIsIGlzIHRoZXJlIGFueSBlYXN5IHdheSBmb3IgdXNl
ci9hZG1pbiB0byBkaXN0aW5ndWlzaCBlLmcKPj4+Pj4+IG9yZGluYXJ5IHZmaW8tbWRldiBmb3Ig
dmhvc3QgZnJvbSBvcmRpbmFyeSB2ZmlvLW1kZXY/Cj4+Pj4+IEkgdGhpbmsgZGV2aWNlLWFwaSBj
b3VsZCBiZSBhIGNob2ljZS4KPj4+PiBPay4KPj4+Pgo+Pj4+Cj4+Pj4+PiBJIHNhdyB5b3UgaW50
cm9kdWNlCj4+Pj4+PiBvcHMgbWF0Y2hpbmcgaGVscGVyIGJ1dCBpdCdzIG5vdCBmcmllbmRseSB0
byBtYW5hZ2VtZW50Lgo+Pj4+PiBUaGUgb3BzIG1hdGNoaW5nIGhlbHBlciBpcyBqdXN0IHRvIGNo
ZWNrIHdoZXRoZXIgYSBnaXZlbgo+Pj4+PiB2ZmlvLWRldmljZSBpcyBiYXNlZCBvbiBhIG1kZXYg
ZGV2aWNlLgo+Pj4+Pgo+Pj4+Pj4gMykgQSBkcmF3YmFjayBvZiAxKSBhbmQgMikgaXMgdGhhdCBp
dCBtdXN0IGZvbGxvdyB2ZmlvX2RldmljZV9vcHMgdGhhdAo+Pj4+Pj4gYXNzdW1lcyB0aGUgcGFy
YW1ldGVyIGNvbWVzIGZyb20gdXNlcnNwYWNlLCBpdCBwcmV2ZW50cyBzdXBwb3J0IGtlcm5lbAo+
Pj4+Pj4gdmlydGlvIGRyaXZlcnMuCj4+Pj4+Pgo+Pj4+Pj4gNCkgU28gY29tZXMgdGhlIGlkZWEg
b2YgbWV0aG9kIDMsIHNpbmNlIGl0IHJlZ2lzdGVyIGEgbmV3IHZob3N0LW1kZXYgZHJpdmVyLAo+
Pj4+Pj4gd2UgY2FuIHVzZSBkZXZpY2Ugc3BlY2lmaWMgb3BzIGluc3RlYWQgb2YgVkZJTyBvbmVz
LCB0aGVuIHdlIGNhbiBoYXZlIGEKPj4+Pj4+IGNvbW1vbiBBUEkgYmV0d2VlbiB2RFBBIHBhcmVu
dCBhbmQgdmhvc3QtbWRldi92aXJ0aW8tbWRldiBkcml2ZXJzLgo+Pj4+PiBBcyB0aGUgYWJvdmUg
ZHJhZnQgc2hvd3MsIHRoaXMgcmVxdWlyZXMgaW50cm9kdWNpbmcgYSBuZXcKPj4+Pj4gVkZJTyBk
ZXZpY2UgZHJpdmVyLiBJIHRoaW5rIEFsZXgncyBvcGluaW9uIG1hdHRlcnMgaGVyZS4KPj4gSnVz
dCB0byBjbGFyaWZ5LCBhIG5ldyB0eXBlIG9mIG1kZXYgZHJpdmVyIGJ1dCBwcm92aWRlcyBkdW1t
eQo+PiB2ZmlvX2RldmljZV9vcHMgZm9yIFZGSU8gdG8gbWFrZSBjb250YWluZXIgRE1BIGlvY3Rs
IHdvcmsuCj4gSSBzZWUuIFRoYW5rcyEgSUlVQywgeW91IG1lYW4gd2UgY2FuIHByb3ZpZGUgYSB2
ZXJ5IHRpbnkKPiBWRklPIGRldmljZSBkcml2ZXIgaW4gZHJpdmVycy92aG9zdC9tZGV2LmMsIGUu
Zy46Cj4KPiBzdGF0aWMgaW50IHZmaW9fdmhvc3RfbWRldl9vcGVuKHZvaWQgKmRldmljZV9kYXRh
KQo+IHsKPiAJaWYgKCF0cnlfbW9kdWxlX2dldChUSElTX01PRFVMRSkpCj4gCQlyZXR1cm4gLUVO
T0RFVjsKPiAJcmV0dXJuIDA7Cj4gfQo+Cj4gc3RhdGljIHZvaWQgdmZpb192aG9zdF9tZGV2X3Jl
bGVhc2Uodm9pZCAqZGV2aWNlX2RhdGEpCj4gewo+IAltb2R1bGVfcHV0KFRISVNfTU9EVUxFKTsK
PiB9Cj4KPiBzdGF0aWMgY29uc3Qgc3RydWN0IHZmaW9fZGV2aWNlX29wcyB2ZmlvX3Zob3N0X21k
ZXZfZGV2X29wcyA9IHsKPiAJLm5hbWUJCT0gInZmaW8tdmhvc3QtbWRldiIsCj4gCS5vcGVuCQk9
IHZmaW9fdmhvc3RfbWRldl9vcGVuLAo+IAkucmVsZWFzZQk9IHZmaW9fdmhvc3RfbWRldl9yZWxl
YXNlLAo+IH07Cj4KPiBzdGF0aWMgaW50IHZob3N0X21kZXZfcHJvYmUoc3RydWN0IGRldmljZSAq
ZGV2KQo+IHsKPiAJc3RydWN0IG1kZXZfZGV2aWNlICptZGV2ID0gdG9fbWRldl9kZXZpY2UoZGV2
KTsKPgo+IAkuLi4gQ2hlY2sgdGhlIG1kZXYgZGV2aWNlX2lkIHByb3Bvc2VkIGluIC4uLgo+IAku
Li4gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvOS8xMi8xNTEgLi4uCj4KPiAJcmV0dXJuIHZm
aW9fYWRkX2dyb3VwX2RldihkZXYsICZ2ZmlvX3Zob3N0X21kZXZfZGV2X29wcywgbWRldik7Cj4g
fQo+Cj4gc3RhdGljIHZvaWQgdmhvc3RfbWRldl9yZW1vdmUoc3RydWN0IGRldmljZSAqZGV2KQo+
IHsKPiAJdmZpb19kZWxfZ3JvdXBfZGV2KGRldik7Cj4gfQo+Cj4gc3RhdGljIHN0cnVjdCBtZGV2
X2RyaXZlciB2aG9zdF9tZGV2X2RyaXZlciA9IHsKPiAJLm5hbWUJPSAidmhvc3RfbWRldiIsCj4g
CS5wcm9iZQk9IHZob3N0X21kZXZfcHJvYmUsCj4gCS5yZW1vdmUJPSB2aG9zdF9tZGV2X3JlbW92
ZSwKPiB9Owo+Cj4gU28gd2UgY2FuIGJpbmQgYWJvdmUgbWRldiBkcml2ZXIgdG8gdGhlIHZpcnRp
by1tZGV2IGNvbXBhdGlibGUKPiBtZGV2IGRldmljZXMgd2hlbiB3ZSB3YW50IHRvIHVzZSB2aG9z
dC1tZGV2Lgo+Cj4gQWZ0ZXIgYmluZGluZyBhYm92ZSBkcml2ZXIgdG8gdGhlIG1kZXYgZGV2aWNl
LCB3ZSBjYW4gc2V0dXAgSU9NTVUKPiB2aWEgVkZJTyBhbmQgZ2V0IFZGSU8gZGV2aWNlIGZkIG9m
IHRoaXMgbWRldiBkZXZpY2UsIGFuZCBwYXNzIGl0Cj4gdG8gdmhvc3QgZmQgKC9kZXYvdmhvc3Qt
bWRldikgd2l0aCBhIFNFVF9CQUNLRU5EIGlvY3RsLgo+Cj4gVGhhbmtzLAo+IFRpd2VpCgoKWWVz
LCBzb21ldGhpbmcgbGlrZSB0aGlzLgoKVGhhbmtzCgoKPj4gVGhhbmtzCj4+Cj4+Cj4+Pj4gWWVz
LCBpdCBpcy4KPj4+Pgo+Pj4+IFRoYW5rcwo+Pj4+Cj4+Pj4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZp
cnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGlu
dXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
