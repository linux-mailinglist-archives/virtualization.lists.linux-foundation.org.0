Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CACB75F2BD
	for <lists.virtualization@lfdr.de>; Thu,  4 Jul 2019 08:23:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E2F38BE7;
	Thu,  4 Jul 2019 06:23:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9F9AD5AA
	for <virtualization@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 06:23:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2640687F
	for <virtualization@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 06:23:01 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Jul 2019 23:23:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,449,1557212400"; d="scan'208";a="247853485"
Received: from npg-dpdk-virtio-tbie-2.sh.intel.com (HELO ___) ([10.67.104.151])
	by orsmga001.jf.intel.com with ESMTP; 03 Jul 2019 23:22:58 -0700
Date: Thu, 4 Jul 2019 14:21:34 +0800
From: Tiwei Bie <tiwei.bie@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [RFC v2] vhost: introduce mdev based hardware vhost backend
Message-ID: <20190704062134.GA21116@___>
References: <20190703091339.1847-1-tiwei.bie@intel.com>
	<7b8279b2-aa7e-7adc-eeff-20dfaf4400d0@redhat.com>
	<20190703115245.GA22374@___>
	<64833f91-02cd-7143-f12e-56ab93b2418d@redhat.com>
	<20190703130817.GA1978@___>
	<b01b8e28-8d96-31dd-56f4-ca7793498c55@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b01b8e28-8d96-31dd-56f4-ca7793498c55@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

T24gVGh1LCBKdWwgMDQsIDIwMTkgYXQgMTI6MzE6NDhQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiBPbiAyMDE5LzcvMyDkuIvljYg5OjA4LCBUaXdlaSBCaWUgd3JvdGU6Cj4gPiBPbiBXZWQs
IEp1bCAwMywgMjAxOSBhdCAwODoxNjoyM1BNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+ID4g
PiBPbiAyMDE5LzcvMyDkuIvljYg3OjUyLCBUaXdlaSBCaWUgd3JvdGU6Cj4gPiA+ID4gT24gV2Vk
LCBKdWwgMDMsIDIwMTkgYXQgMDY6MDk6NTFQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPiA+
ID4gPiA+IE9uIDIwMTkvNy8zIOS4i+WNiDU6MTMsIFRpd2VpIEJpZSB3cm90ZToKPiA+ID4gPiA+
ID4gRGV0YWlscyBhYm91dCB0aGlzIGNhbiBiZSBmb3VuZCBoZXJlOgo+ID4gPiA+ID4gPiAKPiA+
ID4gPiA+ID4gaHR0cHM6Ly9sd24ubmV0L0FydGljbGVzLzc1MDc3MC8KPiA+ID4gPiA+ID4gCj4g
PiA+ID4gPiA+IFdoYXQncyBuZXcgaW4gdGhpcyB2ZXJzaW9uCj4gPiA+ID4gPiA+ID09PT09PT09
PT09PT09PT09PT09PT09PT09Cj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBBIG5ldyBWRklPIGRl
dmljZSB0eXBlIGlzIGludHJvZHVjZWQgLSB2ZmlvLXZob3N0LiBUaGlzIGFkZHJlc3NlZAo+ID4g
PiA+ID4gPiBzb21lIGNvbW1lbnRzIGZyb20gaGVyZTpodHRwczovL3BhdGNod29yay5vemxhYnMu
b3JnL2NvdmVyLzk4NDc2My8KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEJlbG93IGlzIHRoZSB1
cGRhdGVkIGRldmljZSBpbnRlcmZhY2U6Cj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBDdXJyZW50
bHksIHRoZXJlIGFyZSB0d28gcmVnaW9ucyBvZiB0aGlzIGRldmljZTogMSkgQ09ORklHX1JFR0lP
Tgo+ID4gPiA+ID4gPiAoVkZJT19WSE9TVF9DT05GSUdfUkVHSU9OX0lOREVYKSwgd2hpY2ggY2Fu
IGJlIHVzZWQgdG8gc2V0dXAgdGhlCj4gPiA+ID4gPiA+IGRldmljZTsgMikgTk9USUZZX1JFR0lP
TiAoVkZJT19WSE9TVF9OT1RJRllfUkVHSU9OX0lOREVYKSwgd2hpY2gKPiA+ID4gPiA+ID4gY2Fu
IGJlIHVzZWQgdG8gbm90aWZ5IHRoZSBkZXZpY2UuCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiAx
LiBDT05GSUdfUkVHSU9OCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBUaGUgcmVnaW9uIGRlc2Ny
aWJlZCBieSBDT05GSUdfUkVHSU9OIGlzIHRoZSBtYWluIGNvbnRyb2wgaW50ZXJmYWNlLgo+ID4g
PiA+ID4gPiBNZXNzYWdlcyB3aWxsIGJlIHdyaXR0ZW4gdG8gb3IgcmVhZCBmcm9tIHRoaXMgcmVn
aW9uLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gVGhlIG1lc3NhZ2UgdHlwZSBpcyBkZXRlcm1p
bmVkIGJ5IHRoZSBgcmVxdWVzdGAgZmllbGQgaW4gbWVzc2FnZQo+ID4gPiA+ID4gPiBoZWFkZXIu
IFRoZSBtZXNzYWdlIHNpemUgaXMgZW5jb2RlZCBpbiB0aGUgbWVzc2FnZSBoZWFkZXIgdG9vLgo+
ID4gPiA+ID4gPiBUaGUgbWVzc2FnZSBmb3JtYXQgbG9va3MgbGlrZSB0aGlzOgo+ID4gPiA+ID4g
PiAKPiA+ID4gPiA+ID4gc3RydWN0IHZob3N0X3ZmaW9fb3Agewo+ID4gPiA+ID4gPiAJX191NjQg
cmVxdWVzdDsKPiA+ID4gPiA+ID4gCV9fdTMyIGZsYWdzOwo+ID4gPiA+ID4gPiAJLyogRmxhZyB2
YWx1ZXM6ICovCj4gPiA+ID4gPiA+ICAgICAjZGVmaW5lIFZIT1NUX1ZGSU9fTkVFRF9SRVBMWSAw
eDEgLyogV2hldGhlciBuZWVkIHJlcGx5ICovCj4gPiA+ID4gPiA+IAlfX3UzMiBzaXplOwo+ID4g
PiA+ID4gPiAJdW5pb24gewo+ID4gPiA+ID4gPiAJCV9fdTY0IHU2NDsKPiA+ID4gPiA+ID4gCQlz
dHJ1Y3Qgdmhvc3RfdnJpbmdfc3RhdGUgc3RhdGU7Cj4gPiA+ID4gPiA+IAkJc3RydWN0IHZob3N0
X3ZyaW5nX2FkZHIgYWRkcjsKPiA+ID4gPiA+ID4gCX0gcGF5bG9hZDsKPiA+ID4gPiA+ID4gfTsK
PiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IFRoZSBleGlzdGluZyB2aG9zdC1rZXJuZWwgaW9jdGwg
Y21kcyBhcmUgcmV1c2VkIGFzIHRoZSBtZXNzYWdlCj4gPiA+ID4gPiA+IHJlcXVlc3RzIGluIGFi
b3ZlIHN0cnVjdHVyZS4KPiA+ID4gPiA+IFN0aWxsIGEgY29tbWVudHMgbGlrZSBWMS4gV2hhdCdz
IHRoZSBhZHZhbnRhZ2Ugb2YgaW52ZW50aW5nIGEgbmV3IHByb3RvY29sPwo+ID4gPiA+IEknbSB0
cnlpbmcgdG8gbWFrZSBpdCB3b3JrIGluIFZGSU8ncyB3YXkuLgo+ID4gPiA+IAo+ID4gPiA+ID4g
SSBiZWxpZXZlIGVpdGhlciBvZiB0aGUgZm9sbG93aW5nIHNob3VsZCBiZSBiZXR0ZXI6Cj4gPiA+
ID4gPiAKPiA+ID4gPiA+IC0gdXNpbmcgdmhvc3QgaW9jdGwswqAgd2UgY2FuIHN0YXJ0IGZyb20g
U0VUX1ZSSU5HX0tJQ0svU0VUX1ZSSU5HX0NBTEwgYW5kCj4gPiA+ID4gPiBleHRlbmQgaXQgd2l0
aCBlLmcgbm90aWZ5IHJlZ2lvbi4gVGhlIGFkdmFudGFnZXMgaXMgdGhhdCBhbGwgZXhpc3QgdXNl
cnNwYWNlCj4gPiA+ID4gPiBwcm9ncmFtIGNvdWxkIGJlIHJldXNlZCB3aXRob3V0IG1vZGlmaWNh
dGlvbiAob3IgbWluaW1hbCBtb2RpZmljYXRpb24pLiBBbmQKPiA+ID4gPiA+IHZob3N0IEFQSSBo
aWRlcyBsb3RzIG9mIGRldGFpbHMgdGhhdCBpcyBub3QgbmVjZXNzYXJ5IHRvIGJlIHVuZGVyc3Rv
b2QgYnkKPiA+ID4gPiA+IGFwcGxpY2F0aW9uIChlLmcgaW4gdGhlIGNhc2Ugb2YgY29udGFpbmVy
KS4KPiA+ID4gPiBEbyB5b3UgbWVhbiByZXVzaW5nIHZob3N0J3MgaW9jdGwgb24gVkZJTyBkZXZp
Y2UgZmQgZGlyZWN0bHksCj4gPiA+ID4gb3IgaW50cm9kdWNpbmcgYW5vdGhlciBtZGV2IGRyaXZl
ciAoaS5lLiB2aG9zdF9tZGV2IGluc3RlYWQgb2YKPiA+ID4gPiB1c2luZyB0aGUgZXhpc3Rpbmcg
dmZpb19tZGV2KSBmb3IgbWRldiBkZXZpY2U/Cj4gPiA+IENhbiB3ZSBzaW1wbHkgYWRkIHRoZW0g
aW50byBpb2N0bCBvZiBtZGV2X3BhcmVudF9vcHM/Cj4gPiBSaWdodCwgZWl0aGVyIHdheSwgdGhl
c2UgaW9jdGxzIGhhdmUgdG8gYmUgYW5kIGp1c3QgbmVlZCB0byBiZQo+ID4gYWRkZWQgaW4gdGhl
IGlvY3RsIG9mIHRoZSBtZGV2X3BhcmVudF9vcHMuIEJ1dCBhbm90aGVyIHRoaW5nIHdlCj4gPiBh
bHNvIG5lZWQgdG8gY29uc2lkZXIgaXMgdGhhdCB3aGljaCBmaWxlIGRlc2NyaXB0b3IgdGhlIHVz
ZXJzcGFjZQo+ID4gd2lsbCBkbyB0aGUgaW9jdGwoKSBvbi4gU28gSSdtIHdvbmRlcmluZyBkbyB5
b3UgbWVhbiBsZXQgdGhlCj4gPiB1c2Vyc3BhY2UgZG8gdGhlIGlvY3RsKCkgb24gdGhlIFZGSU8g
ZGV2aWNlIGZkIG9mIHRoZSBtZGV2Cj4gPiBkZXZpY2U/Cj4gPiAKPiAKPiBZZXMuCgpHb3QgaXQh
IEknbSBub3Qgc3VyZSB3aGF0J3MgQWxleCBvcGluaW9uIG9uIHRoaXMuIElmIHdlIGFsbAphZ3Jl
ZSB3aXRoIHRoaXMsIEkgY2FuIGRvIGl0IGluIHRoaXMgd2F5LgoKPiBJcyB0aGVyZSBhbnkgb3Ro
ZXIgd2F5IGJ0dz8KCkp1c3QgYSBxdWljayB0aG91Z2h0Li4gTWF5YmUgdG90YWxseSBhIGJhZCBp
ZGVhLiBJIHdhcyB0aGlua2luZwp3aGV0aGVyIGl0IHdvdWxkIGJlIG9kZCB0byBkbyBub24tVkZJ
TydzIGlvY3RscyBvbiBWRklPJ3MgZGV2aWNlCmZkLiBTbyBJIHdhcyB3b25kZXJpbmcgd2hldGhl
ciBpdCdzIHBvc3NpYmxlIHRvIGFsbG93IGJpbmRpbmcKYW5vdGhlciBtZGV2IGRyaXZlciAoZS5n
LiB2aG9zdF9tZGV2KSB0byB0aGUgc3VwcG9ydGVkIG1kZXYKZGV2aWNlcy4gVGhlIG5ldyBtZGV2
IGRyaXZlciwgdmhvc3RfbWRldiwgY2FuIHByb3ZpZGUgc2ltaWxhcgp3YXlzIHRvIGxldCB1c2Vy
c3BhY2Ugb3BlbiB0aGUgbWRldiBkZXZpY2UgYW5kIGRvIHRoZSB2aG9zdCBpb2N0bHMKb24gaXQu
IFRvIGRpc3Rpbmd1aXNoIHdpdGggdGhlIHZmaW9fbWRldiBjb21wYXRpYmxlIG1kZXYgZGV2aWNl
cywKdGhlIGRldmljZSBBUEkgb2YgdGhlIG5ldyB2aG9zdF9tZGV2IGNvbXBhdGlibGUgbWRldiBk
ZXZpY2VzCm1pZ2h0IGJlIGUuZy4gInZob3N0LW5ldCIgZm9yIG5ldD8KClNvIGluIFZGSU8gY2Fz
ZSwgdGhlIGRldmljZSB3aWxsIGJlIGZvciBwYXNzdGhydSBkaXJlY3RseS4gQW5kCmluIFZIT1NU
IGNhc2UsIHRoZSBkZXZpY2UgY2FuIGJlIHVzZWQgdG8gYWNjZWxlcmF0ZSB0aGUgZXhpc3RpbmcK
dmlydHVhbGl6ZWQgZGV2aWNlcy4KCkhvdyBkbyB5b3UgdGhpbms/CgpUaGFua3MsClRpd2VpCj4g
Cj4gVGhhbmtzCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51
eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
