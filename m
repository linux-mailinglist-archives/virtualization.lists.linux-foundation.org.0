Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F3B5F2EF
	for <lists.virtualization@lfdr.de>; Thu,  4 Jul 2019 08:35:46 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6BE16BE7;
	Thu,  4 Jul 2019 06:35:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 17F37B7D
	for <virtualization@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 06:35:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6239C87E
	for <virtualization@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 06:35:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 83BE830917AC;
	Thu,  4 Jul 2019 06:35:37 +0000 (UTC)
Received: from [10.72.12.202] (ovpn-12-202.pek2.redhat.com [10.72.12.202])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4247B17CCB;
	Thu,  4 Jul 2019 06:35:22 +0000 (UTC)
Subject: Re: [RFC v2] vhost: introduce mdev based hardware vhost backend
To: Tiwei Bie <tiwei.bie@intel.com>
References: <20190703091339.1847-1-tiwei.bie@intel.com>
	<7b8279b2-aa7e-7adc-eeff-20dfaf4400d0@redhat.com>
	<20190703115245.GA22374@___>
	<64833f91-02cd-7143-f12e-56ab93b2418d@redhat.com>
	<20190703130817.GA1978@___>
	<b01b8e28-8d96-31dd-56f4-ca7793498c55@redhat.com>
	<20190704062134.GA21116@___>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c67f628f-e0c1-9a41-6c5d-b6bbda31467d@redhat.com>
Date: Thu, 4 Jul 2019 14:35:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190704062134.GA21116@___>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Thu, 04 Jul 2019 06:35:39 +0000 (UTC)
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

Ck9uIDIwMTkvNy80IOS4i+WNiDI6MjEsIFRpd2VpIEJpZSB3cm90ZToKPiBPbiBUaHUsIEp1bCAw
NCwgMjAxOSBhdCAxMjozMTo0OFBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+PiBPbiAyMDE5
LzcvMyDkuIvljYg5OjA4LCBUaXdlaSBCaWUgd3JvdGU6Cj4+PiBPbiBXZWQsIEp1bCAwMywgMjAx
OSBhdCAwODoxNjoyM1BNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+Pj4+IE9uIDIwMTkvNy8z
IOS4i+WNiDc6NTIsIFRpd2VpIEJpZSB3cm90ZToKPj4+Pj4gT24gV2VkLCBKdWwgMDMsIDIwMTkg
YXQgMDY6MDk6NTFQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4+Pj4+IE9uIDIwMTkvNy8z
IOS4i+WNiDU6MTMsIFRpd2VpIEJpZSB3cm90ZToKPj4+Pj4+PiBEZXRhaWxzIGFib3V0IHRoaXMg
Y2FuIGJlIGZvdW5kIGhlcmU6Cj4+Pj4+Pj4KPj4+Pj4+PiBodHRwczovL2x3bi5uZXQvQXJ0aWNs
ZXMvNzUwNzcwLwo+Pj4+Pj4+Cj4+Pj4+Pj4gV2hhdCdzIG5ldyBpbiB0aGlzIHZlcnNpb24KPj4+
Pj4+PiA9PT09PT09PT09PT09PT09PT09PT09PT09PQo+Pj4+Pj4+Cj4+Pj4+Pj4gQSBuZXcgVkZJ
TyBkZXZpY2UgdHlwZSBpcyBpbnRyb2R1Y2VkIC0gdmZpby12aG9zdC4gVGhpcyBhZGRyZXNzZWQK
Pj4+Pj4+PiBzb21lIGNvbW1lbnRzIGZyb20gaGVyZTpodHRwczovL3BhdGNod29yay5vemxhYnMu
b3JnL2NvdmVyLzk4NDc2My8KPj4+Pj4+Pgo+Pj4+Pj4+IEJlbG93IGlzIHRoZSB1cGRhdGVkIGRl
dmljZSBpbnRlcmZhY2U6Cj4+Pj4+Pj4KPj4+Pj4+PiBDdXJyZW50bHksIHRoZXJlIGFyZSB0d28g
cmVnaW9ucyBvZiB0aGlzIGRldmljZTogMSkgQ09ORklHX1JFR0lPTgo+Pj4+Pj4+IChWRklPX1ZI
T1NUX0NPTkZJR19SRUdJT05fSU5ERVgpLCB3aGljaCBjYW4gYmUgdXNlZCB0byBzZXR1cCB0aGUK
Pj4+Pj4+PiBkZXZpY2U7IDIpIE5PVElGWV9SRUdJT04gKFZGSU9fVkhPU1RfTk9USUZZX1JFR0lP
Tl9JTkRFWCksIHdoaWNoCj4+Pj4+Pj4gY2FuIGJlIHVzZWQgdG8gbm90aWZ5IHRoZSBkZXZpY2Uu
Cj4+Pj4+Pj4KPj4+Pj4+PiAxLiBDT05GSUdfUkVHSU9OCj4+Pj4+Pj4KPj4+Pj4+PiBUaGUgcmVn
aW9uIGRlc2NyaWJlZCBieSBDT05GSUdfUkVHSU9OIGlzIHRoZSBtYWluIGNvbnRyb2wgaW50ZXJm
YWNlLgo+Pj4+Pj4+IE1lc3NhZ2VzIHdpbGwgYmUgd3JpdHRlbiB0byBvciByZWFkIGZyb20gdGhp
cyByZWdpb24uCj4+Pj4+Pj4KPj4+Pj4+PiBUaGUgbWVzc2FnZSB0eXBlIGlzIGRldGVybWluZWQg
YnkgdGhlIGByZXF1ZXN0YCBmaWVsZCBpbiBtZXNzYWdlCj4+Pj4+Pj4gaGVhZGVyLiBUaGUgbWVz
c2FnZSBzaXplIGlzIGVuY29kZWQgaW4gdGhlIG1lc3NhZ2UgaGVhZGVyIHRvby4KPj4+Pj4+PiBU
aGUgbWVzc2FnZSBmb3JtYXQgbG9va3MgbGlrZSB0aGlzOgo+Pj4+Pj4+Cj4+Pj4+Pj4gc3RydWN0
IHZob3N0X3ZmaW9fb3Agewo+Pj4+Pj4+IAlfX3U2NCByZXF1ZXN0Owo+Pj4+Pj4+IAlfX3UzMiBm
bGFnczsKPj4+Pj4+PiAJLyogRmxhZyB2YWx1ZXM6ICovCj4+Pj4+Pj4gICAgICAjZGVmaW5lIFZI
T1NUX1ZGSU9fTkVFRF9SRVBMWSAweDEgLyogV2hldGhlciBuZWVkIHJlcGx5ICovCj4+Pj4+Pj4g
CV9fdTMyIHNpemU7Cj4+Pj4+Pj4gCXVuaW9uIHsKPj4+Pj4+PiAJCV9fdTY0IHU2NDsKPj4+Pj4+
PiAJCXN0cnVjdCB2aG9zdF92cmluZ19zdGF0ZSBzdGF0ZTsKPj4+Pj4+PiAJCXN0cnVjdCB2aG9z
dF92cmluZ19hZGRyIGFkZHI7Cj4+Pj4+Pj4gCX0gcGF5bG9hZDsKPj4+Pj4+PiB9Owo+Pj4+Pj4+
Cj4+Pj4+Pj4gVGhlIGV4aXN0aW5nIHZob3N0LWtlcm5lbCBpb2N0bCBjbWRzIGFyZSByZXVzZWQg
YXMgdGhlIG1lc3NhZ2UKPj4+Pj4+PiByZXF1ZXN0cyBpbiBhYm92ZSBzdHJ1Y3R1cmUuCj4+Pj4+
PiBTdGlsbCBhIGNvbW1lbnRzIGxpa2UgVjEuIFdoYXQncyB0aGUgYWR2YW50YWdlIG9mIGludmVu
dGluZyBhIG5ldyBwcm90b2NvbD8KPj4+Pj4gSSdtIHRyeWluZyB0byBtYWtlIGl0IHdvcmsgaW4g
VkZJTydzIHdheS4uCj4+Pj4+Cj4+Pj4+PiBJIGJlbGlldmUgZWl0aGVyIG9mIHRoZSBmb2xsb3dp
bmcgc2hvdWxkIGJlIGJldHRlcjoKPj4+Pj4+Cj4+Pj4+PiAtIHVzaW5nIHZob3N0IGlvY3RsLMKg
IHdlIGNhbiBzdGFydCBmcm9tIFNFVF9WUklOR19LSUNLL1NFVF9WUklOR19DQUxMIGFuZAo+Pj4+
Pj4gZXh0ZW5kIGl0IHdpdGggZS5nIG5vdGlmeSByZWdpb24uIFRoZSBhZHZhbnRhZ2VzIGlzIHRo
YXQgYWxsIGV4aXN0IHVzZXJzcGFjZQo+Pj4+Pj4gcHJvZ3JhbSBjb3VsZCBiZSByZXVzZWQgd2l0
aG91dCBtb2RpZmljYXRpb24gKG9yIG1pbmltYWwgbW9kaWZpY2F0aW9uKS4gQW5kCj4+Pj4+PiB2
aG9zdCBBUEkgaGlkZXMgbG90cyBvZiBkZXRhaWxzIHRoYXQgaXMgbm90IG5lY2Vzc2FyeSB0byBi
ZSB1bmRlcnN0b29kIGJ5Cj4+Pj4+PiBhcHBsaWNhdGlvbiAoZS5nIGluIHRoZSBjYXNlIG9mIGNv
bnRhaW5lcikuCj4+Pj4+IERvIHlvdSBtZWFuIHJldXNpbmcgdmhvc3QncyBpb2N0bCBvbiBWRklP
IGRldmljZSBmZCBkaXJlY3RseSwKPj4+Pj4gb3IgaW50cm9kdWNpbmcgYW5vdGhlciBtZGV2IGRy
aXZlciAoaS5lLiB2aG9zdF9tZGV2IGluc3RlYWQgb2YKPj4+Pj4gdXNpbmcgdGhlIGV4aXN0aW5n
IHZmaW9fbWRldikgZm9yIG1kZXYgZGV2aWNlPwo+Pj4+IENhbiB3ZSBzaW1wbHkgYWRkIHRoZW0g
aW50byBpb2N0bCBvZiBtZGV2X3BhcmVudF9vcHM/Cj4+PiBSaWdodCwgZWl0aGVyIHdheSwgdGhl
c2UgaW9jdGxzIGhhdmUgdG8gYmUgYW5kIGp1c3QgbmVlZCB0byBiZQo+Pj4gYWRkZWQgaW4gdGhl
IGlvY3RsIG9mIHRoZSBtZGV2X3BhcmVudF9vcHMuIEJ1dCBhbm90aGVyIHRoaW5nIHdlCj4+PiBh
bHNvIG5lZWQgdG8gY29uc2lkZXIgaXMgdGhhdCB3aGljaCBmaWxlIGRlc2NyaXB0b3IgdGhlIHVz
ZXJzcGFjZQo+Pj4gd2lsbCBkbyB0aGUgaW9jdGwoKSBvbi4gU28gSSdtIHdvbmRlcmluZyBkbyB5
b3UgbWVhbiBsZXQgdGhlCj4+PiB1c2Vyc3BhY2UgZG8gdGhlIGlvY3RsKCkgb24gdGhlIFZGSU8g
ZGV2aWNlIGZkIG9mIHRoZSBtZGV2Cj4+PiBkZXZpY2U/Cj4+Pgo+PiBZZXMuCj4gR290IGl0ISBJ
J20gbm90IHN1cmUgd2hhdCdzIEFsZXggb3BpbmlvbiBvbiB0aGlzLiBJZiB3ZSBhbGwKPiBhZ3Jl
ZSB3aXRoIHRoaXMsIEkgY2FuIGRvIGl0IGluIHRoaXMgd2F5Lgo+Cj4+IElzIHRoZXJlIGFueSBv
dGhlciB3YXkgYnR3Pwo+IEp1c3QgYSBxdWljayB0aG91Z2h0Li4gTWF5YmUgdG90YWxseSBhIGJh
ZCBpZGVhLgoKCkl0J3Mgbm90IGZvciBzdXJlIDopCgoKPiAgIEkgd2FzIHRoaW5raW5nCj4gd2hl
dGhlciBpdCB3b3VsZCBiZSBvZGQgdG8gZG8gbm9uLVZGSU8ncyBpb2N0bHMgb24gVkZJTydzIGRl
dmljZQo+IGZkLiBTbyBJIHdhcyB3b25kZXJpbmcgd2hldGhlciBpdCdzIHBvc3NpYmxlIHRvIGFs
bG93IGJpbmRpbmcKPiBhbm90aGVyIG1kZXYgZHJpdmVyIChlLmcuIHZob3N0X21kZXYpIHRvIHRo
ZSBzdXBwb3J0ZWQgbWRldgo+IGRldmljZXMuIFRoZSBuZXcgbWRldiBkcml2ZXIsIHZob3N0X21k
ZXYsIGNhbiBwcm92aWRlIHNpbWlsYXIKPiB3YXlzIHRvIGxldCB1c2Vyc3BhY2Ugb3BlbiB0aGUg
bWRldiBkZXZpY2UgYW5kIGRvIHRoZSB2aG9zdCBpb2N0bHMKPiBvbiBpdC4gVG8gZGlzdGluZ3Vp
c2ggd2l0aCB0aGUgdmZpb19tZGV2IGNvbXBhdGlibGUgbWRldiBkZXZpY2VzLAo+IHRoZSBkZXZp
Y2UgQVBJIG9mIHRoZSBuZXcgdmhvc3RfbWRldiBjb21wYXRpYmxlIG1kZXYgZGV2aWNlcwo+IG1p
Z2h0IGJlIGUuZy4gInZob3N0LW5ldCIgZm9yIG5ldD8KPgo+IFNvIGluIFZGSU8gY2FzZSwgdGhl
IGRldmljZSB3aWxsIGJlIGZvciBwYXNzdGhydSBkaXJlY3RseS4gQW5kCj4gaW4gVkhPU1QgY2Fz
ZSwgdGhlIGRldmljZSBjYW4gYmUgdXNlZCB0byBhY2NlbGVyYXRlIHRoZSBleGlzdGluZwo+IHZp
cnR1YWxpemVkIGRldmljZXMuCj4KPiBIb3cgZG8geW91IHRoaW5rPwoKCklmIG15IHVuZGVyc3Rh
bmRpbmcgaXMgY29ycmVjdCwgdGhlcmUgd2lsbCBiZSBubyBWRklPIGlvY3RsIGlmIHdlIGdvIGZv
ciAKdmhvc3RfbWRldj8KClRoYW5rcwoKCj4KPiBUaGFua3MsCj4gVGl3ZWkKPj4gVGhhbmtzCj4+
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxp
emF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9u
Lm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92
aXJ0dWFsaXphdGlvbg==
