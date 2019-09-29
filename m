Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DCCC13CB
	for <lists.virtualization@lfdr.de>; Sun, 29 Sep 2019 09:39:29 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 04B81B7D;
	Sun, 29 Sep 2019 07:39:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D0403A95
	for <virtualization@lists.linux-foundation.org>;
	Sun, 29 Sep 2019 07:39:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2FF2471C
	for <virtualization@lists.linux-foundation.org>;
	Sun, 29 Sep 2019 07:39:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 812D485360;
	Sun, 29 Sep 2019 07:39:20 +0000 (UTC)
Received: from [10.72.12.202] (ovpn-12-202.pek2.redhat.com [10.72.12.202])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3F877600D1;
	Sun, 29 Sep 2019 07:39:06 +0000 (UTC)
Subject: Re: [PATCH] vhost: introduce mdev based hardware backend
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20190926045427.4973-1-tiwei.bie@intel.com>
	<20190926042156-mutt-send-email-mst@kernel.org>
	<20190926131439.GA11652@___>
	<8ab5a8d9-284d-bba5-803d-08523c0814e1@redhat.com>
	<20190927053935-mutt-send-email-mst@kernel.org>
	<a959fe1e-3095-e0f0-0c9b-57f6eaa9c8b7@redhat.com>
	<20190927084408-mutt-send-email-mst@kernel.org>
	<b6f6ffb2-0b16-5041-be2e-94b805c6a4c9@redhat.com>
	<20190927092219-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <1aba781c-d776-422d-2629-86b11990a9b5@redhat.com>
Date: Sun, 29 Sep 2019 15:39:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190927092219-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Sun, 29 Sep 2019 07:39:20 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, zhihong.wang@intel.com,
	maxime.coquelin@redhat.com, virtualization@lists.linux-foundation.org,
	netdev@vger.kernel.org, lingshan.zhu@intel.com
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

Ck9uIDIwMTkvOS8yNyDkuIvljYg5OjIzLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
RnJpLCBTZXAgMjcsIDIwMTkgYXQgMDk6MTc6NTZQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAxOS85LzI3IOS4i+WNiDg6NDYsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+
IE9uIEZyaSwgU2VwIDI3LCAyMDE5IGF0IDA4OjE3OjQ3UE0gKzA4MDAsIEphc29uIFdhbmcgd3Jv
dGU6Cj4+Pj4gT24gMjAxOS85LzI3IOS4i+WNiDU6NDEsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90
ZToKPj4+Pj4gT24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMTE6Mjc6MTJBTSArMDgwMCwgSmFzb24g
V2FuZyB3cm90ZToKPj4+Pj4+IE9uIDIwMTkvOS8yNiDkuIvljYg5OjE0LCBUaXdlaSBCaWUgd3Jv
dGU6Cj4+Pj4+Pj4gT24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMDQ6MzU6MThBTSAtMDQwMCwgTWlj
aGFlbCBTLiBUc2lya2luIHdyb3RlOgo+Pj4+Pj4+PiBPbiBUaHUsIFNlcCAyNiwgMjAxOSBhdCAx
Mjo1NDoyN1BNICswODAwLCBUaXdlaSBCaWUgd3JvdGU6Cj4+Pj4+Pj4gWy4uLl0KPj4+Pj4+Pj4+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgvdmhvc3QuaCBiL2luY2x1ZGUvdWFwaS9s
aW51eC92aG9zdC5oCj4+Pj4+Pj4+PiBpbmRleCA0MGQwMjhlZWQ2NDUuLjVhZmJjMmYwOGZhMyAx
MDA2NDQKPj4+Pj4+Pj4+IC0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC92aG9zdC5oCj4+Pj4+Pj4+
PiArKysgYi9pbmNsdWRlL3VhcGkvbGludXgvdmhvc3QuaAo+Pj4+Pj4+Pj4gQEAgLTExNiw0ICsx
MTYsMTIgQEAKPj4+Pj4+Pj4+ICAgICAgI2RlZmluZSBWSE9TVF9WU09DS19TRVRfR1VFU1RfQ0lE
CV9JT1coVkhPU1RfVklSVElPLCAweDYwLCBfX3U2NCkKPj4+Pj4+Pj4+ICAgICAgI2RlZmluZSBW
SE9TVF9WU09DS19TRVRfUlVOTklORwkJX0lPVyhWSE9TVF9WSVJUSU8sIDB4NjEsIGludCkKPj4+
Pj4+Pj4+ICsvKiBWSE9TVF9NREVWIHNwZWNpZmljIGRlZmluZXMgKi8KPj4+Pj4+Pj4+ICsKPj4+
Pj4+Pj4+ICsjZGVmaW5lIFZIT1NUX01ERVZfU0VUX1NUQVRFCV9JT1coVkhPU1RfVklSVElPLCAw
eDcwLCBfX3U2NCkKPj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+ICsjZGVmaW5lIFZIT1NUX01ERVZfU19T
VE9QUEVECTAKPj4+Pj4+Pj4+ICsjZGVmaW5lIFZIT1NUX01ERVZfU19SVU5OSU5HCTEKPj4+Pj4+
Pj4+ICsjZGVmaW5lIFZIT1NUX01ERVZfU19NQVgJMgo+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4gICAg
ICAjZW5kaWYKPj4+Pj4+Pj4gU28gYXNzdW1pbmcgd2UgaGF2ZSBhbiB1bmRlcmx5aW5nIGRldmlj
ZSB0aGF0IGJlaGF2ZXMgbGlrZSB2aXJ0aW86Cj4+Pj4+Pj4gSSB0aGluayB0aGV5IGFyZSByZWFs
bHkgZ29vZCBxdWVzdGlvbnMvc3VnZ2VzdGlvbnMuIFRoYW5rcyEKPj4+Pj4+Pgo+Pj4+Pj4+PiAx
LiBTaG91bGQgd2UgdXNlIFNFVF9TVEFUVVMgbWF5YmU/Cj4+Pj4+Pj4gSSBsaWtlIHRoaXMgaWRl
YS4gSSB3aWxsIGdpdmUgaXQgYSB0cnkuCj4+Pj4+Pj4KPj4+Pj4+Pj4gMi4gRG8gd2Ugd2FudCBh
IHJlc2V0IGlvY3RsPwo+Pj4+Pj4+IEkgdGhpbmsgaXQgaXMgaGVscGZ1bC4gSWYgd2UgdXNlIFNF
VF9TVEFUVVMsIG1heWJlIHdlCj4+Pj4+Pj4gY2FuIHVzZSBpdCB0byBzdXBwb3J0IHRoZSByZXNl
dC4KPj4+Pj4+Pgo+Pj4+Pj4+PiAzLiBEbyB3ZSB3YW50IGFiaWxpdHkgdG8gZW5hYmxlIHJpbmdz
IGluZGl2aWR1YWxseT8KPj4+Pj4+PiBJIHdpbGwgbWFrZSBpdCBwb3NzaWJsZSBhdCBsZWFzdCBp
biB0aGUgdmhvc3QgbGF5ZXIuCj4+Pj4+PiBOb3RlIHRoZSBBUEkgc3VwcG9ydCBlLmcgc2V0X3Zx
X3JlYWR5KCkuCj4+Pj4+IHZpcnRpbyBzcGVjIGNhbGxzIHRoaXMgImVuYWJsZWQiIHNvIGxldCdz
IHN0aWNrIHRvIHRoYXQuCj4+Pj4gT2suCj4+Pj4KPj4+Pgo+Pj4+Pj4+PiA0LiBEb2VzIGRldmlj
ZSBuZWVkIHRvIGxpbWl0IG1heCByaW5nIHNpemU/Cj4+Pj4+Pj4+IDUuIERvZXMgZGV2aWNlIG5l
ZWQgdG8gbGltaXQgbWF4IG51bWJlciBvZiBxdWV1ZXM/Cj4+Pj4+Pj4gSSB0aGluayBzby4gSXQn
cyBoZWxwZnVsIHRvIGhhdmUgaW9jdGxzIHRvIHJlcG9ydCB0aGUgbWF4Cj4+Pj4+Pj4gcmluZyBz
aXplIGFuZCBtYXggbnVtYmVyIG9mIHF1ZXVlcy4KPj4+Pj4+IEFuIGlzc3VlIGlzIHRoZSBtYXgg
bnVtYmVyIG9mIHF1ZXVlcyBpcyBkb25lIHRocm91Z2ggYSBkZXZpY2Ugc3BlY2lmaWMgd2F5LAo+
Pj4+Pj4gdXN1YWxseSBkZXZpY2UgY29uZmlndXJhdGlvbiBzcGFjZS4gVGhpcyBpcyBzdXBwb3J0
ZWQgYnkgdGhlIHRyYW5zcG9ydCBBUEksCj4+Pj4+PiBidXQgaG93IHRvIGV4cG9zZSBpdCB0byB1
c2Vyc3BhY2UgbWF5IG5lZWQgbW9yZSB0aG91Z2h0Lgo+Pj4+Pj4KPj4+Pj4+IFRoYW5rcwo+Pj4+
PiBhbiBpb2N0bCBmb3IgZGV2aWNlIGNvbmZpZz8gIEJ1dCBmb3IgdjEgSSdkIGJlIHF1aXRlIGhh
cHB5IHRvIGp1c3QgaGF2ZQo+Pj4+PiBhIG1pbmltYWwgd29ya2luZyBkZXZpY2Ugd2l0aCAyIHF1
ZXVlcy4KPj4+PiBJJ20gZnVsbHkgYWdyZWUsIGFuZCBpdCB3aWxsIHdvcmsgYXMgbG9uZyBhcyBW
SVJUSU9fTkVUX0ZfTVEgYW5kCj4+Pj4gVklSVElPX05FVF9GX0NUUkxfVlEgaXMgbm90IGFkdmVy
dGlzZWQgYnkgdGhlIG1kZXYgZGV2aWNlLgo+Pj4+Cj4+Pj4gVGhhbmtzCj4+PiBIbW0gdGhpcyBt
ZWFucyB3ZSBuZWVkIHRvIHZhbGlkYXRlIHRoZSBmZWF0dXJlcyBiaXRzLAo+Pj4gbm90IGp1c3Qg
cGFzcyB0aGVtIHRocm91Z2ggdG8gdGhlIGhhcmR3YXJlLgo+Pj4gUHJvYmxlbSBpcywgaG93IGRv
IHdlIGFkZCBtb3JlIGZlYXR1cmUgYml0cyBsYXRlciwKPj4+IHdpdGhvdXQgdGVzdGluZyBhbGwg
aGFyZHdhcmU/Cj4+PiBJIGd1ZXNzIHRoaXMgbWVhbnMgdGhlIGRldmljZSBzcGVjaWZpYyBkcml2
ZXIgbXVzdCBkbyBpdC4KPj4+Cj4+IFRoYXQgbG9va3Mgbm90IGdvb2QsIG1heWJlIGEgdmlydGlv
IGRldmljZSBpZCBiYXNlZCBmZWF0dXJlcyBibGFja2xpc3QgaW4KPj4gdmhvc3QtbWRldi4gVGhl
biBNUSBhbmQgQ1RSTF9WUSBjb3VsZCBiZSBmaWx0ZXJlZCBvdXQgYnkgdmhvc3QtbWRldi4KPj4K
Pj4gVGhhbmtzCj4gVHdvIGltcGxlbWVudGF0aW9ucyBvZiBlLmcuIHZpcnRpbyBuZXQgY2FuIGhh
dmUgZGlmZmVyZW50Cj4gZmVhdHVyZXMgd2hpdGVsaXN0ZWQuCgoKSSBtZWFudCBmb3Iga2VybmVs
IGRyaXZlciwgd2Ugd29uJ3QgYmxhY2tsaXN0IGFueSBmZWF0dXJlLCBidXQgZm9yIAp2aG9zdC1t
ZGV2LCB3ZSBuZWVkIHRvIGRvIHRoYXQuCgoKPiAgIFNvIEkgdGhpbmsgdGhlcmUncyBubyB3YXkg
YnV0IGxldAo+IHRoZSBkcml2ZXIgZG8gaXQuIFdlIHNob3VsZCBwcm9iYWJseSBwcm92aWRlIGEg
c3RhbmRhcmQgcGxhY2UKPiBpbiB0aGUgb3BzIGZvciBkcml2ZXIgdG8gc3VwcGx5IHRoZSB3aGl0
ZWxpc3QsIHRvIG1ha2Ugc3VyZQo+IGRyaXZlcnMgZG9uJ3QgZm9yZ2V0LgoKCkZvciAnZHJpdmVy
JyBkbyB5b3UgbWVhbiB1c2Vyc3BhY2UgZHJpdmVyIG9mwqAgdGhlIG1kZXYgZGV2aWNlPwoKVGhh
bmtzCgoKCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3ZpcnR1YWxpemF0aW9u
