Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A295FF10
	for <lists.virtualization@lfdr.de>; Fri,  5 Jul 2019 02:30:35 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 85104B5F;
	Fri,  5 Jul 2019 00:30:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9EDD0B5F
	for <virtualization@lists.linux-foundation.org>;
	Fri,  5 Jul 2019 00:30:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DEDD787B
	for <virtualization@lists.linux-foundation.org>;
	Fri,  5 Jul 2019 00:30:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 81A66308FE9A;
	Fri,  5 Jul 2019 00:30:20 +0000 (UTC)
Received: from [10.72.12.202] (ovpn-12-202.pek2.redhat.com [10.72.12.202])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9E2F499391;
	Fri,  5 Jul 2019 00:30:08 +0000 (UTC)
Subject: Re: [RFC v2] vhost: introduce mdev based hardware vhost backend
To: Tiwei Bie <tiwei.bie@intel.com>
References: <20190703091339.1847-1-tiwei.bie@intel.com>
	<7b8279b2-aa7e-7adc-eeff-20dfaf4400d0@redhat.com>
	<20190703115245.GA22374@___>
	<64833f91-02cd-7143-f12e-56ab93b2418d@redhat.com>
	<20190703130817.GA1978@___>
	<b01b8e28-8d96-31dd-56f4-ca7793498c55@redhat.com>
	<20190704062134.GA21116@___>
	<c67f628f-e0c1-9a41-6c5d-b6bbda31467d@redhat.com>
	<20190704070242.GA27369@___>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <513c62ba-3f44-f4cf-3b3d-e0e03b6a6de1@redhat.com>
Date: Fri, 5 Jul 2019 08:30:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190704070242.GA27369@___>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Fri, 05 Jul 2019 00:30:22 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=unavailable version=3.3.1
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

Ck9uIDIwMTkvNy80IOS4i+WNiDM6MDIsIFRpd2VpIEJpZSB3cm90ZToKPiBPbiBUaHUsIEp1bCAw
NCwgMjAxOSBhdCAwMjozNToyMFBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+PiBPbiAyMDE5
LzcvNCDkuIvljYgyOjIxLCBUaXdlaSBCaWUgd3JvdGU6Cj4+PiBPbiBUaHUsIEp1bCAwNCwgMjAx
OSBhdCAxMjozMTo0OFBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+Pj4+IE9uIDIwMTkvNy8z
IOS4i+WNiDk6MDgsIFRpd2VpIEJpZSB3cm90ZToKPj4+Pj4gT24gV2VkLCBKdWwgMDMsIDIwMTkg
YXQgMDg6MTY6MjNQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4+Pj4+IE9uIDIwMTkvNy8z
IOS4i+WNiDc6NTIsIFRpd2VpIEJpZSB3cm90ZToKPj4+Pj4+PiBPbiBXZWQsIEp1bCAwMywgMjAx
OSBhdCAwNjowOTo1MVBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+Pj4+Pj4+PiBPbiAyMDE5
LzcvMyDkuIvljYg1OjEzLCBUaXdlaSBCaWUgd3JvdGU6Cj4+Pj4+Pj4+PiBEZXRhaWxzIGFib3V0
IHRoaXMgY2FuIGJlIGZvdW5kIGhlcmU6Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gaHR0cHM6Ly9sd24u
bmV0L0FydGljbGVzLzc1MDc3MC8KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBXaGF0J3MgbmV3IGluIHRo
aXMgdmVyc2lvbgo+Pj4+Pj4+Pj4gPT09PT09PT09PT09PT09PT09PT09PT09PT0KPj4+Pj4+Pj4+
Cj4+Pj4+Pj4+PiBBIG5ldyBWRklPIGRldmljZSB0eXBlIGlzIGludHJvZHVjZWQgLSB2ZmlvLXZo
b3N0LiBUaGlzIGFkZHJlc3NlZAo+Pj4+Pj4+Pj4gc29tZSBjb21tZW50cyBmcm9tIGhlcmU6aHR0
cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9jb3Zlci85ODQ3NjMvCj4+Pj4+Pj4+Pgo+Pj4+Pj4+
Pj4gQmVsb3cgaXMgdGhlIHVwZGF0ZWQgZGV2aWNlIGludGVyZmFjZToKPj4+Pj4+Pj4+Cj4+Pj4+
Pj4+PiBDdXJyZW50bHksIHRoZXJlIGFyZSB0d28gcmVnaW9ucyBvZiB0aGlzIGRldmljZTogMSkg
Q09ORklHX1JFR0lPTgo+Pj4+Pj4+Pj4gKFZGSU9fVkhPU1RfQ09ORklHX1JFR0lPTl9JTkRFWCks
IHdoaWNoIGNhbiBiZSB1c2VkIHRvIHNldHVwIHRoZQo+Pj4+Pj4+Pj4gZGV2aWNlOyAyKSBOT1RJ
RllfUkVHSU9OIChWRklPX1ZIT1NUX05PVElGWV9SRUdJT05fSU5ERVgpLCB3aGljaAo+Pj4+Pj4+
Pj4gY2FuIGJlIHVzZWQgdG8gbm90aWZ5IHRoZSBkZXZpY2UuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4g
MS4gQ09ORklHX1JFR0lPTgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFRoZSByZWdpb24gZGVzY3JpYmVk
IGJ5IENPTkZJR19SRUdJT04gaXMgdGhlIG1haW4gY29udHJvbCBpbnRlcmZhY2UuCj4+Pj4+Pj4+
PiBNZXNzYWdlcyB3aWxsIGJlIHdyaXR0ZW4gdG8gb3IgcmVhZCBmcm9tIHRoaXMgcmVnaW9uLgo+
Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFRoZSBtZXNzYWdlIHR5cGUgaXMgZGV0ZXJtaW5lZCBieSB0aGUg
YHJlcXVlc3RgIGZpZWxkIGluIG1lc3NhZ2UKPj4+Pj4+Pj4+IGhlYWRlci4gVGhlIG1lc3NhZ2Ug
c2l6ZSBpcyBlbmNvZGVkIGluIHRoZSBtZXNzYWdlIGhlYWRlciB0b28uCj4+Pj4+Pj4+PiBUaGUg
bWVzc2FnZSBmb3JtYXQgbG9va3MgbGlrZSB0aGlzOgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IHN0cnVj
dCB2aG9zdF92ZmlvX29wIHsKPj4+Pj4+Pj4+IAlfX3U2NCByZXF1ZXN0Owo+Pj4+Pj4+Pj4gCV9f
dTMyIGZsYWdzOwo+Pj4+Pj4+Pj4gCS8qIEZsYWcgdmFsdWVzOiAqLwo+Pj4+Pj4+Pj4gICAgICAg
I2RlZmluZSBWSE9TVF9WRklPX05FRURfUkVQTFkgMHgxIC8qIFdoZXRoZXIgbmVlZCByZXBseSAq
Lwo+Pj4+Pj4+Pj4gCV9fdTMyIHNpemU7Cj4+Pj4+Pj4+PiAJdW5pb24gewo+Pj4+Pj4+Pj4gCQlf
X3U2NCB1NjQ7Cj4+Pj4+Pj4+PiAJCXN0cnVjdCB2aG9zdF92cmluZ19zdGF0ZSBzdGF0ZTsKPj4+
Pj4+Pj4+IAkJc3RydWN0IHZob3N0X3ZyaW5nX2FkZHIgYWRkcjsKPj4+Pj4+Pj4+IAl9IHBheWxv
YWQ7Cj4+Pj4+Pj4+PiB9Owo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFRoZSBleGlzdGluZyB2aG9zdC1r
ZXJuZWwgaW9jdGwgY21kcyBhcmUgcmV1c2VkIGFzIHRoZSBtZXNzYWdlCj4+Pj4+Pj4+PiByZXF1
ZXN0cyBpbiBhYm92ZSBzdHJ1Y3R1cmUuCj4+Pj4+Pj4+IFN0aWxsIGEgY29tbWVudHMgbGlrZSBW
MS4gV2hhdCdzIHRoZSBhZHZhbnRhZ2Ugb2YgaW52ZW50aW5nIGEgbmV3IHByb3RvY29sPwo+Pj4+
Pj4+IEknbSB0cnlpbmcgdG8gbWFrZSBpdCB3b3JrIGluIFZGSU8ncyB3YXkuLgo+Pj4+Pj4+Cj4+
Pj4+Pj4+IEkgYmVsaWV2ZSBlaXRoZXIgb2YgdGhlIGZvbGxvd2luZyBzaG91bGQgYmUgYmV0dGVy
Ogo+Pj4+Pj4+Pgo+Pj4+Pj4+PiAtIHVzaW5nIHZob3N0IGlvY3RsLMKgIHdlIGNhbiBzdGFydCBm
cm9tIFNFVF9WUklOR19LSUNLL1NFVF9WUklOR19DQUxMIGFuZAo+Pj4+Pj4+PiBleHRlbmQgaXQg
d2l0aCBlLmcgbm90aWZ5IHJlZ2lvbi4gVGhlIGFkdmFudGFnZXMgaXMgdGhhdCBhbGwgZXhpc3Qg
dXNlcnNwYWNlCj4+Pj4+Pj4+IHByb2dyYW0gY291bGQgYmUgcmV1c2VkIHdpdGhvdXQgbW9kaWZp
Y2F0aW9uIChvciBtaW5pbWFsIG1vZGlmaWNhdGlvbikuIEFuZAo+Pj4+Pj4+PiB2aG9zdCBBUEkg
aGlkZXMgbG90cyBvZiBkZXRhaWxzIHRoYXQgaXMgbm90IG5lY2Vzc2FyeSB0byBiZSB1bmRlcnN0
b29kIGJ5Cj4+Pj4+Pj4+IGFwcGxpY2F0aW9uIChlLmcgaW4gdGhlIGNhc2Ugb2YgY29udGFpbmVy
KS4KPj4+Pj4+PiBEbyB5b3UgbWVhbiByZXVzaW5nIHZob3N0J3MgaW9jdGwgb24gVkZJTyBkZXZp
Y2UgZmQgZGlyZWN0bHksCj4+Pj4+Pj4gb3IgaW50cm9kdWNpbmcgYW5vdGhlciBtZGV2IGRyaXZl
ciAoaS5lLiB2aG9zdF9tZGV2IGluc3RlYWQgb2YKPj4+Pj4+PiB1c2luZyB0aGUgZXhpc3Rpbmcg
dmZpb19tZGV2KSBmb3IgbWRldiBkZXZpY2U/Cj4+Pj4+PiBDYW4gd2Ugc2ltcGx5IGFkZCB0aGVt
IGludG8gaW9jdGwgb2YgbWRldl9wYXJlbnRfb3BzPwo+Pj4+PiBSaWdodCwgZWl0aGVyIHdheSwg
dGhlc2UgaW9jdGxzIGhhdmUgdG8gYmUgYW5kIGp1c3QgbmVlZCB0byBiZQo+Pj4+PiBhZGRlZCBp
biB0aGUgaW9jdGwgb2YgdGhlIG1kZXZfcGFyZW50X29wcy4gQnV0IGFub3RoZXIgdGhpbmcgd2UK
Pj4+Pj4gYWxzbyBuZWVkIHRvIGNvbnNpZGVyIGlzIHRoYXQgd2hpY2ggZmlsZSBkZXNjcmlwdG9y
IHRoZSB1c2Vyc3BhY2UKPj4+Pj4gd2lsbCBkbyB0aGUgaW9jdGwoKSBvbi4gU28gSSdtIHdvbmRl
cmluZyBkbyB5b3UgbWVhbiBsZXQgdGhlCj4+Pj4+IHVzZXJzcGFjZSBkbyB0aGUgaW9jdGwoKSBv
biB0aGUgVkZJTyBkZXZpY2UgZmQgb2YgdGhlIG1kZXYKPj4+Pj4gZGV2aWNlPwo+Pj4+Pgo+Pj4+
IFllcy4KPj4+IEdvdCBpdCEgSSdtIG5vdCBzdXJlIHdoYXQncyBBbGV4IG9waW5pb24gb24gdGhp
cy4gSWYgd2UgYWxsCj4+PiBhZ3JlZSB3aXRoIHRoaXMsIEkgY2FuIGRvIGl0IGluIHRoaXMgd2F5
Lgo+Pj4KPj4+PiBJcyB0aGVyZSBhbnkgb3RoZXIgd2F5IGJ0dz8KPj4+IEp1c3QgYSBxdWljayB0
aG91Z2h0Li4gTWF5YmUgdG90YWxseSBhIGJhZCBpZGVhLgo+Pgo+PiBJdCdzIG5vdCBmb3Igc3Vy
ZSA6KQo+IFRoYW5rcyEKPgo+Pgo+Pj4gICAgSSB3YXMgdGhpbmtpbmcKPj4+IHdoZXRoZXIgaXQg
d291bGQgYmUgb2RkIHRvIGRvIG5vbi1WRklPJ3MgaW9jdGxzIG9uIFZGSU8ncyBkZXZpY2UKPj4+
IGZkLiBTbyBJIHdhcyB3b25kZXJpbmcgd2hldGhlciBpdCdzIHBvc3NpYmxlIHRvIGFsbG93IGJp
bmRpbmcKPj4+IGFub3RoZXIgbWRldiBkcml2ZXIgKGUuZy4gdmhvc3RfbWRldikgdG8gdGhlIHN1
cHBvcnRlZCBtZGV2Cj4+PiBkZXZpY2VzLiBUaGUgbmV3IG1kZXYgZHJpdmVyLCB2aG9zdF9tZGV2
LCBjYW4gcHJvdmlkZSBzaW1pbGFyCj4+PiB3YXlzIHRvIGxldCB1c2Vyc3BhY2Ugb3BlbiB0aGUg
bWRldiBkZXZpY2UgYW5kIGRvIHRoZSB2aG9zdCBpb2N0bHMKPj4+IG9uIGl0LiBUbyBkaXN0aW5n
dWlzaCB3aXRoIHRoZSB2ZmlvX21kZXYgY29tcGF0aWJsZSBtZGV2IGRldmljZXMsCj4+PiB0aGUg
ZGV2aWNlIEFQSSBvZiB0aGUgbmV3IHZob3N0X21kZXYgY29tcGF0aWJsZSBtZGV2IGRldmljZXMK
Pj4+IG1pZ2h0IGJlIGUuZy4gInZob3N0LW5ldCIgZm9yIG5ldD8KPj4+Cj4+PiBTbyBpbiBWRklP
IGNhc2UsIHRoZSBkZXZpY2Ugd2lsbCBiZSBmb3IgcGFzc3RocnUgZGlyZWN0bHkuIEFuZAo+Pj4g
aW4gVkhPU1QgY2FzZSwgdGhlIGRldmljZSBjYW4gYmUgdXNlZCB0byBhY2NlbGVyYXRlIHRoZSBl
eGlzdGluZwo+Pj4gdmlydHVhbGl6ZWQgZGV2aWNlcy4KPj4+Cj4+PiBIb3cgZG8geW91IHRoaW5r
Pwo+Pgo+PiBJZiBteSB1bmRlcnN0YW5kaW5nIGlzIGNvcnJlY3QsIHRoZXJlIHdpbGwgYmUgbm8g
VkZJTyBpb2N0bCBpZiB3ZSBnbyBmb3IKPj4gdmhvc3RfbWRldj8KPiBZZWFoLCBleGFjdGx5LiBJ
ZiB3ZSBnbyBmb3Igdmhvc3RfbWRldiwgd2UgbWF5IGhhdmUgc29tZSB2aG9zdCBub2Rlcwo+IGlu
IC9kZXYgc2ltaWxhciB0byB3aGF0IC9kZXYvdmZpby8qIGRvZXMgdG8gaGFuZGxlIHRoZSAkVVVJ
RCBhbmQgb3Blbgo+IHRoZSBkZXZpY2UgKGUuZy4gc2ltaWxhciB0byBWRklPX0dST1VQX0dFVF9E
RVZJQ0VfRkQgaW4gVkZJTykuIEFuZAo+IHRvIHNldHVwIHRoZSBkZXZpY2UsIHdlIGNhbiB0cnkg
dG8gcmV1c2UgdGhlIGlvY3RscyBvZiB0aGUgZXhpc3RpbmcKPiBrZXJuZWwgdmhvc3QgYXMgbXVj
aCBhcyBwb3NzaWJsZS4KCgpJbnRlcmVzdGluZywgYWN0dWFsbHksIEkndmUgY29uc2lkZXJlZCBz
b21ldGhpbmcgc2ltaWxhci4gSSB0aGluayB0aGVyZSAKc2hvdWxkIGJlIG5vIGlzc3VlcyBvdGhl
ciB0aGFuIERNQToKCi0gTmVlZCB0byBpbnZlbnQgbmV3IEFQSSBmb3IgRE1BIG1hcHBpbmcgb3Ro
ZXIgdGhhbiBTRVRfTUVNX1RBQkxFPyAKKFdoaWNoIGlzIHRvbyBoZWF2eXdlaWdodCkuCgotIE5l
ZWQgdG8gY29uc2lkZXIgYSB3YXkgdG8gY28td29yayB3aXRoIGJvdGggb24gY2hpcCBJT01NVSAo
eW91ciAKcHJvcG9zYWwgc2hvdWxkIGJlIGZpbmUpIGFuZCBzY2FsYWJsZSBJT1YuCgpUaGFua3MK
Cgo+Cj4gVGhhbmtzLAo+IFRpd2VpCj4KPj4gVGhhbmtzCj4+Cj4+Cj4+PiBUaGFua3MsCj4+PiBU
aXdlaQo+Pj4+IFRoYW5rcwo+Pj4+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBs
aXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5v
cmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
