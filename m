Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 358F2C04FB
	for <lists.virtualization@lfdr.de>; Fri, 27 Sep 2019 14:18:09 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7892C1097;
	Fri, 27 Sep 2019 12:18:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A12ED108D
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 12:18:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4B2338A
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 12:18:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CC55C10DCC9D;
	Fri, 27 Sep 2019 12:18:00 +0000 (UTC)
Received: from [10.72.12.24] (ovpn-12-24.pek2.redhat.com [10.72.12.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E731E5D9C9;
	Fri, 27 Sep 2019 12:17:49 +0000 (UTC)
Subject: Re: [PATCH] vhost: introduce mdev based hardware backend
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20190926045427.4973-1-tiwei.bie@intel.com>
	<20190926042156-mutt-send-email-mst@kernel.org>
	<20190926131439.GA11652@___>
	<8ab5a8d9-284d-bba5-803d-08523c0814e1@redhat.com>
	<20190927053935-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a959fe1e-3095-e0f0-0c9b-57f6eaa9c8b7@redhat.com>
Date: Fri, 27 Sep 2019 20:17:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190927053935-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.64]);
	Fri, 27 Sep 2019 12:18:00 +0000 (UTC)
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

Ck9uIDIwMTkvOS8yNyDkuIvljYg1OjQxLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
RnJpLCBTZXAgMjcsIDIwMTkgYXQgMTE6Mjc6MTJBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAxOS85LzI2IOS4i+WNiDk6MTQsIFRpd2VpIEJpZSB3cm90ZToKPj4+IE9uIFRodSwg
U2VwIDI2LCAyMDE5IGF0IDA0OjM1OjE4QU0gLTA0MDAsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90
ZToKPj4+PiBPbiBUaHUsIFNlcCAyNiwgMjAxOSBhdCAxMjo1NDoyN1BNICswODAwLCBUaXdlaSBC
aWUgd3JvdGU6Cj4+PiBbLi4uXQo+Pj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4
L3Zob3N0LmggYi9pbmNsdWRlL3VhcGkvbGludXgvdmhvc3QuaAo+Pj4+PiBpbmRleCA0MGQwMjhl
ZWQ2NDUuLjVhZmJjMmYwOGZhMyAxMDA2NDQKPj4+Pj4gLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4
L3Zob3N0LmgKPj4+Pj4gKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L3Zob3N0LmgKPj4+Pj4gQEAg
LTExNiw0ICsxMTYsMTIgQEAKPj4+Pj4gICAgI2RlZmluZSBWSE9TVF9WU09DS19TRVRfR1VFU1Rf
Q0lECV9JT1coVkhPU1RfVklSVElPLCAweDYwLCBfX3U2NCkKPj4+Pj4gICAgI2RlZmluZSBWSE9T
VF9WU09DS19TRVRfUlVOTklORwkJX0lPVyhWSE9TVF9WSVJUSU8sIDB4NjEsIGludCkKPj4+Pj4g
Ky8qIFZIT1NUX01ERVYgc3BlY2lmaWMgZGVmaW5lcyAqLwo+Pj4+PiArCj4+Pj4+ICsjZGVmaW5l
IFZIT1NUX01ERVZfU0VUX1NUQVRFCV9JT1coVkhPU1RfVklSVElPLCAweDcwLCBfX3U2NCkKPj4+
Pj4gKwo+Pj4+PiArI2RlZmluZSBWSE9TVF9NREVWX1NfU1RPUFBFRAkwCj4+Pj4+ICsjZGVmaW5l
IFZIT1NUX01ERVZfU19SVU5OSU5HCTEKPj4+Pj4gKyNkZWZpbmUgVkhPU1RfTURFVl9TX01BWAky
Cj4+Pj4+ICsKPj4+Pj4gICAgI2VuZGlmCj4+Pj4gU28gYXNzdW1pbmcgd2UgaGF2ZSBhbiB1bmRl
cmx5aW5nIGRldmljZSB0aGF0IGJlaGF2ZXMgbGlrZSB2aXJ0aW86Cj4+PiBJIHRoaW5rIHRoZXkg
YXJlIHJlYWxseSBnb29kIHF1ZXN0aW9ucy9zdWdnZXN0aW9ucy4gVGhhbmtzIQo+Pj4KPj4+PiAx
LiBTaG91bGQgd2UgdXNlIFNFVF9TVEFUVVMgbWF5YmU/Cj4+PiBJIGxpa2UgdGhpcyBpZGVhLiBJ
IHdpbGwgZ2l2ZSBpdCBhIHRyeS4KPj4+Cj4+Pj4gMi4gRG8gd2Ugd2FudCBhIHJlc2V0IGlvY3Rs
Pwo+Pj4gSSB0aGluayBpdCBpcyBoZWxwZnVsLiBJZiB3ZSB1c2UgU0VUX1NUQVRVUywgbWF5YmUg
d2UKPj4+IGNhbiB1c2UgaXQgdG8gc3VwcG9ydCB0aGUgcmVzZXQuCj4+Pgo+Pj4+IDMuIERvIHdl
IHdhbnQgYWJpbGl0eSB0byBlbmFibGUgcmluZ3MgaW5kaXZpZHVhbGx5Pwo+Pj4gSSB3aWxsIG1h
a2UgaXQgcG9zc2libGUgYXQgbGVhc3QgaW4gdGhlIHZob3N0IGxheWVyLgo+Pgo+PiBOb3RlIHRo
ZSBBUEkgc3VwcG9ydCBlLmcgc2V0X3ZxX3JlYWR5KCkuCj4gdmlydGlvIHNwZWMgY2FsbHMgdGhp
cyAiZW5hYmxlZCIgc28gbGV0J3Mgc3RpY2sgdG8gdGhhdC4KCgpPay4KCgo+Cj4+Pj4gNC4gRG9l
cyBkZXZpY2UgbmVlZCB0byBsaW1pdCBtYXggcmluZyBzaXplPwo+Pj4+IDUuIERvZXMgZGV2aWNl
IG5lZWQgdG8gbGltaXQgbWF4IG51bWJlciBvZiBxdWV1ZXM/Cj4+PiBJIHRoaW5rIHNvLiBJdCdz
IGhlbHBmdWwgdG8gaGF2ZSBpb2N0bHMgdG8gcmVwb3J0IHRoZSBtYXgKPj4+IHJpbmcgc2l6ZSBh
bmQgbWF4IG51bWJlciBvZiBxdWV1ZXMuCj4+Cj4+IEFuIGlzc3VlIGlzIHRoZSBtYXggbnVtYmVy
IG9mIHF1ZXVlcyBpcyBkb25lIHRocm91Z2ggYSBkZXZpY2Ugc3BlY2lmaWMgd2F5LAo+PiB1c3Vh
bGx5IGRldmljZSBjb25maWd1cmF0aW9uIHNwYWNlLiBUaGlzIGlzIHN1cHBvcnRlZCBieSB0aGUg
dHJhbnNwb3J0IEFQSSwKPj4gYnV0IGhvdyB0byBleHBvc2UgaXQgdG8gdXNlcnNwYWNlIG1heSBu
ZWVkIG1vcmUgdGhvdWdodC4KPj4KPj4gVGhhbmtzCj4gYW4gaW9jdGwgZm9yIGRldmljZSBjb25m
aWc/ICBCdXQgZm9yIHYxIEknZCBiZSBxdWl0ZSBoYXBweSB0byBqdXN0IGhhdmUKPiBhIG1pbmlt
YWwgd29ya2luZyBkZXZpY2Ugd2l0aCAyIHF1ZXVlcy4KCgpJJ20gZnVsbHkgYWdyZWUsIGFuZCBp
dCB3aWxsIHdvcmsgYXMgbG9uZyBhcyBWSVJUSU9fTkVUX0ZfTVEgYW5kIApWSVJUSU9fTkVUX0Zf
Q1RSTF9WUSBpcyBub3QgYWR2ZXJ0aXNlZCBieSB0aGUgbWRldiBkZXZpY2UuCgpUaGFua3MKCgo+
Cj4+PiBUaGFua3MhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51
eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
