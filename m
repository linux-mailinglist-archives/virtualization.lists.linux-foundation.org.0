Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FFB5F229
	for <lists.virtualization@lfdr.de>; Thu,  4 Jul 2019 06:32:13 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5A377CAB;
	Thu,  4 Jul 2019 04:32:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3D475C9A
	for <virtualization@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 04:32:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B2E8587B
	for <virtualization@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 04:32:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EE19F3082132;
	Thu,  4 Jul 2019 04:32:00 +0000 (UTC)
Received: from [10.72.12.202] (ovpn-12-202.pek2.redhat.com [10.72.12.202])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B705F968C7;
	Thu,  4 Jul 2019 04:31:50 +0000 (UTC)
Subject: Re: [RFC v2] vhost: introduce mdev based hardware vhost backend
To: Tiwei Bie <tiwei.bie@intel.com>
References: <20190703091339.1847-1-tiwei.bie@intel.com>
	<7b8279b2-aa7e-7adc-eeff-20dfaf4400d0@redhat.com>
	<20190703115245.GA22374@___>
	<64833f91-02cd-7143-f12e-56ab93b2418d@redhat.com>
	<20190703130817.GA1978@___>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b01b8e28-8d96-31dd-56f4-ca7793498c55@redhat.com>
Date: Thu, 4 Jul 2019 12:31:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190703130817.GA1978@___>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Thu, 04 Jul 2019 04:32:06 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	zhihong.wang@intel.com, maxime.coquelin@redhat.com
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

Ck9uIDIwMTkvNy8zIOS4i+WNiDk6MDgsIFRpd2VpIEJpZSB3cm90ZToKPiBPbiBXZWQsIEp1bCAw
MywgMjAxOSBhdCAwODoxNjoyM1BNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+PiBPbiAyMDE5
LzcvMyDkuIvljYg3OjUyLCBUaXdlaSBCaWUgd3JvdGU6Cj4+PiBPbiBXZWQsIEp1bCAwMywgMjAx
OSBhdCAwNjowOTo1MVBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+Pj4+IE9uIDIwMTkvNy8z
IOS4i+WNiDU6MTMsIFRpd2VpIEJpZSB3cm90ZToKPj4+Pj4gRGV0YWlscyBhYm91dCB0aGlzIGNh
biBiZSBmb3VuZCBoZXJlOgo+Pj4+Pgo+Pj4+PiBodHRwczovL2x3bi5uZXQvQXJ0aWNsZXMvNzUw
NzcwLwo+Pj4+Pgo+Pj4+PiBXaGF0J3MgbmV3IGluIHRoaXMgdmVyc2lvbgo+Pj4+PiA9PT09PT09
PT09PT09PT09PT09PT09PT09PQo+Pj4+Pgo+Pj4+PiBBIG5ldyBWRklPIGRldmljZSB0eXBlIGlz
IGludHJvZHVjZWQgLSB2ZmlvLXZob3N0LiBUaGlzIGFkZHJlc3NlZAo+Pj4+PiBzb21lIGNvbW1l
bnRzIGZyb20gaGVyZTpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL2NvdmVyLzk4NDc2My8K
Pj4+Pj4KPj4+Pj4gQmVsb3cgaXMgdGhlIHVwZGF0ZWQgZGV2aWNlIGludGVyZmFjZToKPj4+Pj4K
Pj4+Pj4gQ3VycmVudGx5LCB0aGVyZSBhcmUgdHdvIHJlZ2lvbnMgb2YgdGhpcyBkZXZpY2U6IDEp
IENPTkZJR19SRUdJT04KPj4+Pj4gKFZGSU9fVkhPU1RfQ09ORklHX1JFR0lPTl9JTkRFWCksIHdo
aWNoIGNhbiBiZSB1c2VkIHRvIHNldHVwIHRoZQo+Pj4+PiBkZXZpY2U7IDIpIE5PVElGWV9SRUdJ
T04gKFZGSU9fVkhPU1RfTk9USUZZX1JFR0lPTl9JTkRFWCksIHdoaWNoCj4+Pj4+IGNhbiBiZSB1
c2VkIHRvIG5vdGlmeSB0aGUgZGV2aWNlLgo+Pj4+Pgo+Pj4+PiAxLiBDT05GSUdfUkVHSU9OCj4+
Pj4+Cj4+Pj4+IFRoZSByZWdpb24gZGVzY3JpYmVkIGJ5IENPTkZJR19SRUdJT04gaXMgdGhlIG1h
aW4gY29udHJvbCBpbnRlcmZhY2UuCj4+Pj4+IE1lc3NhZ2VzIHdpbGwgYmUgd3JpdHRlbiB0byBv
ciByZWFkIGZyb20gdGhpcyByZWdpb24uCj4+Pj4+Cj4+Pj4+IFRoZSBtZXNzYWdlIHR5cGUgaXMg
ZGV0ZXJtaW5lZCBieSB0aGUgYHJlcXVlc3RgIGZpZWxkIGluIG1lc3NhZ2UKPj4+Pj4gaGVhZGVy
LiBUaGUgbWVzc2FnZSBzaXplIGlzIGVuY29kZWQgaW4gdGhlIG1lc3NhZ2UgaGVhZGVyIHRvby4K
Pj4+Pj4gVGhlIG1lc3NhZ2UgZm9ybWF0IGxvb2tzIGxpa2UgdGhpczoKPj4+Pj4KPj4+Pj4gc3Ry
dWN0IHZob3N0X3ZmaW9fb3Agewo+Pj4+PiAJX191NjQgcmVxdWVzdDsKPj4+Pj4gCV9fdTMyIGZs
YWdzOwo+Pj4+PiAJLyogRmxhZyB2YWx1ZXM6ICovCj4+Pj4+ICAgICAjZGVmaW5lIFZIT1NUX1ZG
SU9fTkVFRF9SRVBMWSAweDEgLyogV2hldGhlciBuZWVkIHJlcGx5ICovCj4+Pj4+IAlfX3UzMiBz
aXplOwo+Pj4+PiAJdW5pb24gewo+Pj4+PiAJCV9fdTY0IHU2NDsKPj4+Pj4gCQlzdHJ1Y3Qgdmhv
c3RfdnJpbmdfc3RhdGUgc3RhdGU7Cj4+Pj4+IAkJc3RydWN0IHZob3N0X3ZyaW5nX2FkZHIgYWRk
cjsKPj4+Pj4gCX0gcGF5bG9hZDsKPj4+Pj4gfTsKPj4+Pj4KPj4+Pj4gVGhlIGV4aXN0aW5nIHZo
b3N0LWtlcm5lbCBpb2N0bCBjbWRzIGFyZSByZXVzZWQgYXMgdGhlIG1lc3NhZ2UKPj4+Pj4gcmVx
dWVzdHMgaW4gYWJvdmUgc3RydWN0dXJlLgo+Pj4+IFN0aWxsIGEgY29tbWVudHMgbGlrZSBWMS4g
V2hhdCdzIHRoZSBhZHZhbnRhZ2Ugb2YgaW52ZW50aW5nIGEgbmV3IHByb3RvY29sPwo+Pj4gSSdt
IHRyeWluZyB0byBtYWtlIGl0IHdvcmsgaW4gVkZJTydzIHdheS4uCj4+Pgo+Pj4+IEkgYmVsaWV2
ZSBlaXRoZXIgb2YgdGhlIGZvbGxvd2luZyBzaG91bGQgYmUgYmV0dGVyOgo+Pj4+Cj4+Pj4gLSB1
c2luZyB2aG9zdCBpb2N0bCzCoCB3ZSBjYW4gc3RhcnQgZnJvbSBTRVRfVlJJTkdfS0lDSy9TRVRf
VlJJTkdfQ0FMTCBhbmQKPj4+PiBleHRlbmQgaXQgd2l0aCBlLmcgbm90aWZ5IHJlZ2lvbi4gVGhl
IGFkdmFudGFnZXMgaXMgdGhhdCBhbGwgZXhpc3QgdXNlcnNwYWNlCj4+Pj4gcHJvZ3JhbSBjb3Vs
ZCBiZSByZXVzZWQgd2l0aG91dCBtb2RpZmljYXRpb24gKG9yIG1pbmltYWwgbW9kaWZpY2F0aW9u
KS4gQW5kCj4+Pj4gdmhvc3QgQVBJIGhpZGVzIGxvdHMgb2YgZGV0YWlscyB0aGF0IGlzIG5vdCBu
ZWNlc3NhcnkgdG8gYmUgdW5kZXJzdG9vZCBieQo+Pj4+IGFwcGxpY2F0aW9uIChlLmcgaW4gdGhl
IGNhc2Ugb2YgY29udGFpbmVyKS4KPj4+IERvIHlvdSBtZWFuIHJldXNpbmcgdmhvc3QncyBpb2N0
bCBvbiBWRklPIGRldmljZSBmZCBkaXJlY3RseSwKPj4+IG9yIGludHJvZHVjaW5nIGFub3RoZXIg
bWRldiBkcml2ZXIgKGkuZS4gdmhvc3RfbWRldiBpbnN0ZWFkIG9mCj4+PiB1c2luZyB0aGUgZXhp
c3RpbmcgdmZpb19tZGV2KSBmb3IgbWRldiBkZXZpY2U/Cj4+IENhbiB3ZSBzaW1wbHkgYWRkIHRo
ZW0gaW50byBpb2N0bCBvZiBtZGV2X3BhcmVudF9vcHM/Cj4gUmlnaHQsIGVpdGhlciB3YXksIHRo
ZXNlIGlvY3RscyBoYXZlIHRvIGJlIGFuZCBqdXN0IG5lZWQgdG8gYmUKPiBhZGRlZCBpbiB0aGUg
aW9jdGwgb2YgdGhlIG1kZXZfcGFyZW50X29wcy4gQnV0IGFub3RoZXIgdGhpbmcgd2UKPiBhbHNv
IG5lZWQgdG8gY29uc2lkZXIgaXMgdGhhdCB3aGljaCBmaWxlIGRlc2NyaXB0b3IgdGhlIHVzZXJz
cGFjZQo+IHdpbGwgZG8gdGhlIGlvY3RsKCkgb24uIFNvIEknbSB3b25kZXJpbmcgZG8geW91IG1l
YW4gbGV0IHRoZQo+IHVzZXJzcGFjZSBkbyB0aGUgaW9jdGwoKSBvbiB0aGUgVkZJTyBkZXZpY2Ug
ZmQgb2YgdGhlIG1kZXYKPiBkZXZpY2U/Cj4KClllcy4gSXMgdGhlcmUgYW55IG90aGVyIHdheSBi
dHc/CgpUaGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51
eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
