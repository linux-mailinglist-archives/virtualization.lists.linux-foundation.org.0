Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E14A7B88EE
	for <lists.virtualization@lfdr.de>; Fri, 20 Sep 2019 03:31:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 54401B88;
	Fri, 20 Sep 2019 01:31:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0CF95B49
	for <virtualization@lists.linux-foundation.org>;
	Fri, 20 Sep 2019 01:31:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 807CDF8
	for <virtualization@lists.linux-foundation.org>;
	Fri, 20 Sep 2019 01:31:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CA48B308FB9D;
	Fri, 20 Sep 2019 01:31:19 +0000 (UTC)
Received: from [10.72.12.88] (ovpn-12-88.pek2.redhat.com [10.72.12.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5392F100197A;
	Fri, 20 Sep 2019 01:31:00 +0000 (UTC)
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
Message-ID: <43aaf7dc-f08b-8898-3c55-908ff4d68866@redhat.com>
Date: Fri, 20 Sep 2019 09:30:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919154552.GA27657@___>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 20 Sep 2019 01:31:19 +0000 (UTC)
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
Li4gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvOS8xMi8xNTEgLi4uCgoKVG8gY2xhcmlmeSwg
dGhpcyBzaG91bGQgYmUgZG9uZSB0aHJvdWdoIHRoZSBpZF90YWJsZSBmaWVsZHMgaW4gCnZob3N0
X21kZXZfZHJpdmVyLCBhbmQgaXQgc2hvdWxkIGNsYWltIGl0IHN1cHBvcnRzIHZpcnRpby1tZGV2
IGRldmljZSBvbmx5OgoKCnN0YXRpYyBzdHJ1Y3QgbWRldl9jbGFzc19pZCBpZF90YWJsZVtdID0g
ewogwqDCoMKgIHsgTURFVl9JRF9WSVJUSU8gfSwKIMKgwqDCoCB7IDAgfSwKfTsKCgpzdGF0aWMg
c3RydWN0IG1kZXZfZHJpdmVyIHZob3N0X21kZXZfZHJpdmVyID0gewogwqDCoMKgIC4uLgogwqDC
oMKgIC5pZF90YWJsZSA9IGlkX3RhYmxlLAp9CgoKPgo+IAlyZXR1cm4gdmZpb19hZGRfZ3JvdXBf
ZGV2KGRldiwgJnZmaW9fdmhvc3RfbWRldl9kZXZfb3BzLCBtZGV2KTsKCgpBbmQgaW4gdmZpb192
aG9zdF9tZGV2X29wcywgYWxsIGl0cyBuZWVkIGlzIHRvIGp1c3QgaW1wbGVtZW50IHZob3N0LW5l
dCAKaW9jdGwgYW5kIHRyYW5zbGF0ZSB0aGVtIHRvIHZpcnRpby1tZGV2IHRyYW5zcG9ydCAoZS5n
IGRldmljZV9vcHMgSSAKcHJvcG9zZWQgb3IgaW9jdGxzIG90aGVyIHdoYXRldmVyIG90aGVyIG1l
dGhvZCkgQVBJLiBBbmQgaXQgY291bGQgaGF2ZSBhIApkdW1teSBvcHMgaW1wbGVtZW50YXRpb24g
Zm9yIHRoZSBvdGhlciBkZXZpY2Vfb3BzLgoKCj4gfQo+Cj4gc3RhdGljIHZvaWQgdmhvc3RfbWRl
dl9yZW1vdmUoc3RydWN0IGRldmljZSAqZGV2KQo+IHsKPiAJdmZpb19kZWxfZ3JvdXBfZGV2KGRl
dik7Cj4gfQo+Cj4gc3RhdGljIHN0cnVjdCBtZGV2X2RyaXZlciB2aG9zdF9tZGV2X2RyaXZlciA9
IHsKPiAJLm5hbWUJPSAidmhvc3RfbWRldiIsCj4gCS5wcm9iZQk9IHZob3N0X21kZXZfcHJvYmUs
Cj4gCS5yZW1vdmUJPSB2aG9zdF9tZGV2X3JlbW92ZSwKPiB9Owo+Cj4gU28gd2UgY2FuIGJpbmQg
YWJvdmUgbWRldiBkcml2ZXIgdG8gdGhlIHZpcnRpby1tZGV2IGNvbXBhdGlibGUKPiBtZGV2IGRl
dmljZXMgd2hlbiB3ZSB3YW50IHRvIHVzZSB2aG9zdC1tZGV2Lgo+Cj4gQWZ0ZXIgYmluZGluZyBh
Ym92ZSBkcml2ZXIgdG8gdGhlIG1kZXYgZGV2aWNlLCB3ZSBjYW4gc2V0dXAgSU9NTVUKPiB2aWEg
VkZJTyBhbmQgZ2V0IFZGSU8gZGV2aWNlIGZkIG9mIHRoaXMgbWRldiBkZXZpY2UsIGFuZCBwYXNz
IGl0Cj4gdG8gdmhvc3QgZmQgKC9kZXYvdmhvc3QtbWRldikgd2l0aCBhIFNFVF9CQUNLRU5EIGlv
Y3RsLgoKClRoZW4gd2hhdCB2aG9zdC1tZGV2IGNoYXIgZGV2aWNlIGRpZCBpcyBqdXN0IGZvcndh
cmRpbmcgaW9jdGwgYmFjayB0byAKdGhpcyB2ZmlvIGRldmljZSBmZCB3aGljaCBzZWVtcyBhIG92
ZXJraWxsLiBJdCdzIHNpbXBsZXIgdGhhdCBqdXN0IGRvIAppb2N0bCBvbiB0aGUgZGV2aWNlIG9w
cyBkaXJlY3RseS4KClRoYW5rcwoKCj4KPiBUaGFua3MsCj4gVGl3ZWkKPgo+PiBUaGFua3MKPj4K
Pj4KPj4+PiBZZXMsIGl0IGlzLgo+Pj4+Cj4+Pj4gVGhhbmtzCj4+Pj4KPj4+PgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWls
aW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6
Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRp
b24=
