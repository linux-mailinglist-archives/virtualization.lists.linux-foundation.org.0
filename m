Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 140CFC062D
	for <lists.virtualization@lfdr.de>; Fri, 27 Sep 2019 15:18:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3AC101023;
	Fri, 27 Sep 2019 13:18:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 81B5B101B
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 13:18:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 165BF8AB
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 13:18:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8AFDA30ADBBB;
	Fri, 27 Sep 2019 13:18:12 +0000 (UTC)
Received: from [10.72.12.24] (ovpn-12-24.pek2.redhat.com [10.72.12.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3C9315D9C9;
	Fri, 27 Sep 2019 13:17:58 +0000 (UTC)
Subject: Re: [PATCH] vhost: introduce mdev based hardware backend
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20190926045427.4973-1-tiwei.bie@intel.com>
	<20190926042156-mutt-send-email-mst@kernel.org>
	<20190926131439.GA11652@___>
	<8ab5a8d9-284d-bba5-803d-08523c0814e1@redhat.com>
	<20190927053935-mutt-send-email-mst@kernel.org>
	<a959fe1e-3095-e0f0-0c9b-57f6eaa9c8b7@redhat.com>
	<20190927084408-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b6f6ffb2-0b16-5041-be2e-94b805c6a4c9@redhat.com>
Date: Fri, 27 Sep 2019 21:17:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190927084408-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Fri, 27 Sep 2019 13:18:12 +0000 (UTC)
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

Ck9uIDIwMTkvOS8yNyDkuIvljYg4OjQ2LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
RnJpLCBTZXAgMjcsIDIwMTkgYXQgMDg6MTc6NDdQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAxOS85LzI3IOS4i+WNiDU6NDEsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+
IE9uIEZyaSwgU2VwIDI3LCAyMDE5IGF0IDExOjI3OjEyQU0gKzA4MDAsIEphc29uIFdhbmcgd3Jv
dGU6Cj4+Pj4gT24gMjAxOS85LzI2IOS4i+WNiDk6MTQsIFRpd2VpIEJpZSB3cm90ZToKPj4+Pj4g
T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMDQ6MzU6MThBTSAtMDQwMCwgTWljaGFlbCBTLiBUc2ly
a2luIHdyb3RlOgo+Pj4+Pj4gT24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTI6NTQ6MjdQTSArMDgw
MCwgVGl3ZWkgQmllIHdyb3RlOgo+Pj4+PiBbLi4uXQo+Pj4+Pj4+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL3VhcGkvbGludXgvdmhvc3QuaCBiL2luY2x1ZGUvdWFwaS9saW51eC92aG9zdC5oCj4+Pj4+
Pj4gaW5kZXggNDBkMDI4ZWVkNjQ1Li41YWZiYzJmMDhmYTMgMTAwNjQ0Cj4+Pj4+Pj4gLS0tIGEv
aW5jbHVkZS91YXBpL2xpbnV4L3Zob3N0LmgKPj4+Pj4+PiArKysgYi9pbmNsdWRlL3VhcGkvbGlu
dXgvdmhvc3QuaAo+Pj4+Pj4+IEBAIC0xMTYsNCArMTE2LDEyIEBACj4+Pj4+Pj4gICAgICNkZWZp
bmUgVkhPU1RfVlNPQ0tfU0VUX0dVRVNUX0NJRAlfSU9XKFZIT1NUX1ZJUlRJTywgMHg2MCwgX191
NjQpCj4+Pj4+Pj4gICAgICNkZWZpbmUgVkhPU1RfVlNPQ0tfU0VUX1JVTk5JTkcJCV9JT1coVkhP
U1RfVklSVElPLCAweDYxLCBpbnQpCj4+Pj4+Pj4gKy8qIFZIT1NUX01ERVYgc3BlY2lmaWMgZGVm
aW5lcyAqLwo+Pj4+Pj4+ICsKPj4+Pj4+PiArI2RlZmluZSBWSE9TVF9NREVWX1NFVF9TVEFURQlf
SU9XKFZIT1NUX1ZJUlRJTywgMHg3MCwgX191NjQpCj4+Pj4+Pj4gKwo+Pj4+Pj4+ICsjZGVmaW5l
IFZIT1NUX01ERVZfU19TVE9QUEVECTAKPj4+Pj4+PiArI2RlZmluZSBWSE9TVF9NREVWX1NfUlVO
TklORwkxCj4+Pj4+Pj4gKyNkZWZpbmUgVkhPU1RfTURFVl9TX01BWAkyCj4+Pj4+Pj4gKwo+Pj4+
Pj4+ICAgICAjZW5kaWYKPj4+Pj4+IFNvIGFzc3VtaW5nIHdlIGhhdmUgYW4gdW5kZXJseWluZyBk
ZXZpY2UgdGhhdCBiZWhhdmVzIGxpa2UgdmlydGlvOgo+Pj4+PiBJIHRoaW5rIHRoZXkgYXJlIHJl
YWxseSBnb29kIHF1ZXN0aW9ucy9zdWdnZXN0aW9ucy4gVGhhbmtzIQo+Pj4+Pgo+Pj4+Pj4gMS4g
U2hvdWxkIHdlIHVzZSBTRVRfU1RBVFVTIG1heWJlPwo+Pj4+PiBJIGxpa2UgdGhpcyBpZGVhLiBJ
IHdpbGwgZ2l2ZSBpdCBhIHRyeS4KPj4+Pj4KPj4+Pj4+IDIuIERvIHdlIHdhbnQgYSByZXNldCBp
b2N0bD8KPj4+Pj4gSSB0aGluayBpdCBpcyBoZWxwZnVsLiBJZiB3ZSB1c2UgU0VUX1NUQVRVUywg
bWF5YmUgd2UKPj4+Pj4gY2FuIHVzZSBpdCB0byBzdXBwb3J0IHRoZSByZXNldC4KPj4+Pj4KPj4+
Pj4+IDMuIERvIHdlIHdhbnQgYWJpbGl0eSB0byBlbmFibGUgcmluZ3MgaW5kaXZpZHVhbGx5Pwo+
Pj4+PiBJIHdpbGwgbWFrZSBpdCBwb3NzaWJsZSBhdCBsZWFzdCBpbiB0aGUgdmhvc3QgbGF5ZXIu
Cj4+Pj4gTm90ZSB0aGUgQVBJIHN1cHBvcnQgZS5nIHNldF92cV9yZWFkeSgpLgo+Pj4gdmlydGlv
IHNwZWMgY2FsbHMgdGhpcyAiZW5hYmxlZCIgc28gbGV0J3Mgc3RpY2sgdG8gdGhhdC4KPj4KPj4g
T2suCj4+Cj4+Cj4+Pj4+PiA0LiBEb2VzIGRldmljZSBuZWVkIHRvIGxpbWl0IG1heCByaW5nIHNp
emU/Cj4+Pj4+PiA1LiBEb2VzIGRldmljZSBuZWVkIHRvIGxpbWl0IG1heCBudW1iZXIgb2YgcXVl
dWVzPwo+Pj4+PiBJIHRoaW5rIHNvLiBJdCdzIGhlbHBmdWwgdG8gaGF2ZSBpb2N0bHMgdG8gcmVw
b3J0IHRoZSBtYXgKPj4+Pj4gcmluZyBzaXplIGFuZCBtYXggbnVtYmVyIG9mIHF1ZXVlcy4KPj4+
PiBBbiBpc3N1ZSBpcyB0aGUgbWF4IG51bWJlciBvZiBxdWV1ZXMgaXMgZG9uZSB0aHJvdWdoIGEg
ZGV2aWNlIHNwZWNpZmljIHdheSwKPj4+PiB1c3VhbGx5IGRldmljZSBjb25maWd1cmF0aW9uIHNw
YWNlLiBUaGlzIGlzIHN1cHBvcnRlZCBieSB0aGUgdHJhbnNwb3J0IEFQSSwKPj4+PiBidXQgaG93
IHRvIGV4cG9zZSBpdCB0byB1c2Vyc3BhY2UgbWF5IG5lZWQgbW9yZSB0aG91Z2h0Lgo+Pj4+Cj4+
Pj4gVGhhbmtzCj4+PiBhbiBpb2N0bCBmb3IgZGV2aWNlIGNvbmZpZz8gIEJ1dCBmb3IgdjEgSSdk
IGJlIHF1aXRlIGhhcHB5IHRvIGp1c3QgaGF2ZQo+Pj4gYSBtaW5pbWFsIHdvcmtpbmcgZGV2aWNl
IHdpdGggMiBxdWV1ZXMuCj4+Cj4+IEknbSBmdWxseSBhZ3JlZSwgYW5kIGl0IHdpbGwgd29yayBh
cyBsb25nIGFzIFZJUlRJT19ORVRfRl9NUSBhbmQKPj4gVklSVElPX05FVF9GX0NUUkxfVlEgaXMg
bm90IGFkdmVydGlzZWQgYnkgdGhlIG1kZXYgZGV2aWNlLgo+Pgo+PiBUaGFua3MKPiBIbW0gdGhp
cyBtZWFucyB3ZSBuZWVkIHRvIHZhbGlkYXRlIHRoZSBmZWF0dXJlcyBiaXRzLAo+IG5vdCBqdXN0
IHBhc3MgdGhlbSB0aHJvdWdoIHRvIHRoZSBoYXJkd2FyZS4KPiBQcm9ibGVtIGlzLCBob3cgZG8g
d2UgYWRkIG1vcmUgZmVhdHVyZSBiaXRzIGxhdGVyLAo+IHdpdGhvdXQgdGVzdGluZyBhbGwgaGFy
ZHdhcmU/Cj4gSSBndWVzcyB0aGlzIG1lYW5zIHRoZSBkZXZpY2Ugc3BlY2lmaWMgZHJpdmVyIG11
c3QgZG8gaXQuCj4KClRoYXQgbG9va3Mgbm90IGdvb2QsIG1heWJlIGEgdmlydGlvIGRldmljZSBp
ZCBiYXNlZCBmZWF0dXJlcyBibGFja2xpc3QgCmluIHZob3N0LW1kZXYuIFRoZW4gTVEgYW5kIENU
UkxfVlEgY291bGQgYmUgZmlsdGVyZWQgb3V0IGJ5IHZob3N0LW1kZXYuCgpUaGFua3MKCgo+Pj4+
PiBUaGFua3MhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
ClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1m
b3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9s
aXN0aW5mby92aXJ0dWFsaXphdGlvbg==
