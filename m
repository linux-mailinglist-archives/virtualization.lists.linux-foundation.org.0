Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F43D1E6EA
	for <lists.virtualization@lfdr.de>; Wed, 15 May 2019 04:50:59 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AB887B6C;
	Wed, 15 May 2019 02:50:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 22B09AC7
	for <virtualization@lists.linux-foundation.org>;
	Wed, 15 May 2019 02:50:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A72C327B
	for <virtualization@lists.linux-foundation.org>;
	Wed, 15 May 2019 02:50:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3A6C53082A8D;
	Wed, 15 May 2019 02:50:52 +0000 (UTC)
Received: from [10.72.12.103] (ovpn-12-103.pek2.redhat.com [10.72.12.103])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EA6BB5D9C0;
	Wed, 15 May 2019 02:50:44 +0000 (UTC)
Subject: Re: [PATCH v2 7/8] vsock/virtio: increase RX buffer size to 64 KiB
To: Stefano Garzarella <sgarzare@redhat.com>
References: <20190510125843.95587-1-sgarzare@redhat.com>
	<20190510125843.95587-8-sgarzare@redhat.com>
	<bf0416f1-0e69-722d-75ce-3d101e6d7d71@redhat.com>
	<20190513175138.4yycad2xi65komw6@steredhat>
	<fd934a4c-f7d2-8a04-ed93-a3b690ed0d79@redhat.com>
	<20190514162056.5aotcuzsi6e6wya7@steredhat>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <646275c5-3530-f428-98da-56da99d72fe1@redhat.com>
Date: Wed, 15 May 2019 10:50:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190514162056.5aotcuzsi6e6wya7@steredhat>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Wed, 15 May 2019 02:50:52 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"David S. Miller" <davem@davemloft.net>
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

Ck9uIDIwMTkvNS8xNSDkuIrljYgxMjoyMCwgU3RlZmFubyBHYXJ6YXJlbGxhIHdyb3RlOgo+IE9u
IFR1ZSwgTWF5IDE0LCAyMDE5IGF0IDExOjM4OjA1QU0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6
Cj4+IE9uIDIwMTkvNS8xNCDkuIrljYgxOjUxLCBTdGVmYW5vIEdhcnphcmVsbGEgd3JvdGU6Cj4+
PiBPbiBNb24sIE1heSAxMywgMjAxOSBhdCAwNjowMTo1MlBNICswODAwLCBKYXNvbiBXYW5nIHdy
b3RlOgo+Pj4+IE9uIDIwMTkvNS8xMCDkuIvljYg4OjU4LCBTdGVmYW5vIEdhcnphcmVsbGEgd3Jv
dGU6Cj4+Pj4+IEluIG9yZGVyIHRvIGluY3JlYXNlIGhvc3QgLT4gZ3Vlc3QgdGhyb3VnaHB1dCB3
aXRoIGxhcmdlIHBhY2tldHMsCj4+Pj4+IHdlIGNhbiB1c2UgNjQgS2lCIFJYIGJ1ZmZlcnMuCj4+
Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gR2FyemFyZWxsYSA8c2dhcnphcmVAcmVk
aGF0LmNvbT4KPj4+Pj4gLS0tCj4+Pj4+ICAgICBpbmNsdWRlL2xpbnV4L3ZpcnRpb192c29jay5o
IHwgMiArLQo+Pj4+PiAgICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3ZpcnRpb192c29j
ay5oIGIvaW5jbHVkZS9saW51eC92aXJ0aW9fdnNvY2suaAo+Pj4+PiBpbmRleCA4NGI3MjAyNmQz
MjcuLjVhOWQyNWJlNzJkZiAxMDA2NDQKPj4+Pj4gLS0tIGEvaW5jbHVkZS9saW51eC92aXJ0aW9f
dnNvY2suaAo+Pj4+PiArKysgYi9pbmNsdWRlL2xpbnV4L3ZpcnRpb192c29jay5oCj4+Pj4+IEBA
IC0xMCw3ICsxMCw3IEBACj4+Pj4+ICAgICAjZGVmaW5lIFZJUlRJT19WU09DS19ERUZBVUxUX01J
Tl9CVUZfU0laRQkxMjgKPj4+Pj4gICAgICNkZWZpbmUgVklSVElPX1ZTT0NLX0RFRkFVTFRfQlVG
X1NJWkUJCSgxMDI0ICogMjU2KQo+Pj4+PiAgICAgI2RlZmluZSBWSVJUSU9fVlNPQ0tfREVGQVVM
VF9NQVhfQlVGX1NJWkUJKDEwMjQgKiAyNTYpCj4+Pj4+IC0jZGVmaW5lIFZJUlRJT19WU09DS19E
RUZBVUxUX1JYX0JVRl9TSVpFCSgxMDI0ICogNCkKPj4+Pj4gKyNkZWZpbmUgVklSVElPX1ZTT0NL
X0RFRkFVTFRfUlhfQlVGX1NJWkUJKDEwMjQgKiA2NCkKPj4+Pj4gICAgICNkZWZpbmUgVklSVElP
X1ZTT0NLX01BWF9CVUZfU0laRQkJMHhGRkZGRkZGRlVMCj4+Pj4+ICAgICAjZGVmaW5lIFZJUlRJ
T19WU09DS19NQVhfUEtUX0JVRl9TSVpFCQkoMTAyNCAqIDY0KQo+Pj4+IFdlIHByb2JhYmx5IGRv
bid0IHdhbnQgc3VjaCBoaWdoIG9yZGVyIGFsbG9jYXRpb24uIEl0J3MgYmV0dGVyIHRvIHN3aXRj
aCB0bwo+Pj4+IHVzZSBvcmRlciAwIHBhZ2VzIGluIHRoaXMgY2FzZS4gU2VlIGFkZF9yZWN2YnVm
X2JpZygpIGZvciB2aXJ0aW8tbmV0LiBJZiB3ZQo+Pj4+IGdldCBkYXRhcGF0aCB1bmlmaWVkLCB3
ZSB3aWxsIGdldCBtb3JlIHN0dWZmcyBzZXQuCj4+PiBJSVVDLCB5b3UgYXJlIHN1Z2dlc3Rpbmcg
dG8gYWxsb2NhdGUgb25seSBwYWdlcyBhbmQgcHV0IHRoZW0gaW4gYQo+Pj4gc2NhdHRlcmxpc3Qs
IHRoZW4gYWRkIHRoZW0gdG8gdGhlIHZpcnRxdWV1ZS4KPj4+Cj4+PiBJcyBpdCBjb3JyZWN0Pwo+
Pgo+PiBZZXMgc2luY2UgeW91IGFyZSB1c2luZzoKPj4KPj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBwa3QtPmJ1ZiA9IGttYWxsb2MoYnVmX2xlbiwgR0ZQX0tFUk5FTCk7Cj4+ICDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFwa3QtPmJ1Zikgewo+PiAgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2aXJ0aW9fdHJhbnNwb3J0
X2ZyZWVfcGt0KHBrdCk7Cj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGJyZWFrOwo+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4K
Pj4gVGhpcyBpcyBsaWtlbHkgdG8gZmFpbCB3aGVuIHRoZSBtZW1vcnkgaXMgZnJhZ21lbnRlZCB3
aGljaCBpcyBraW5kIG9mCj4+IGZyYWdpbGUuCj4+Cj4+Cj4gVGhhbmtzIGZvciBwb2ludGluZyB0
aGF0IG91dC4KPgo+Pj4gVGhlIGlzc3VlIHRoYXQgSSBoYXZlIGhlcmUsIGlzIHRoYXQgdGhlIHZp
cnRpby12c29jayBndWVzdCBkcml2ZXIsIHNlZQo+Pj4gdmlydGlvX3Zzb2NrX3J4X2ZpbGwoKSwg
YWxsb2NhdGVzIGEgc3RydWN0IHZpcnRpb192c29ja19wa3QgdGhhdAo+Pj4gY29udGFpbnMgdGhl
IHJvb20gZm9yIHRoZSBoZWFkZXIsIHRoZW4gYWxsb2NhdGVzIHRoZSBidWZmZXIgZm9yIHRoZSBw
YXlsb2FkLgo+Pj4gQXQgdGhpcyBwb2ludCBpdCBmaWxscyB0aGUgc2NhdHRlcmxpc3Qgd2l0aCB0
aGUgJnZpcnRpb192c29ja19wa3QuaGRyIGFuZCB0aGUKPj4+IGJ1ZmZlciBmb3IgdGhlIHBheWxv
YWQuCj4+Cj4+IFRoaXMgcGFydCBzaG91bGQgYmUgZmluZSBzaW5jZSB3aGF0IGlzIG5lZWRlZCBp
cyBqdXN0IGFkZGluZyBtb3JlIHBhZ2VzIHRvCj4+IHNnW10gYW5kIGNhbGwgdmlydHVxZXVldV9h
ZGRfc2coKS4KPj4KPj4KPiBZZXMsIEkgYWdyZWUuCj4KPj4+IENoYW5naW5nIHRoaXMgd2lsbCBy
ZXF1aXJlIHNldmVyYWwgbW9kaWZpY2F0aW9ucywgYW5kIGlmIHdlIGdldCBkYXRhcGF0aAo+Pj4g
dW5pZmllZCwgSSdtIG5vdCBzdXJlIGl0J3Mgd29ydGggaXQuCj4+PiBPZiBjb3Vyc2UsIGlmIHdl
IGxlYXZlIHRoZSBkYXRhcGF0aHMgc2VwYXJhdGVkLCBJJ2QgbGlrZSB0byBkbyB0aGF0IGxhdGVy
Lgo+Pj4KPj4+IFdoYXQgZG8geW91IHRoaW5rPwo+Pgo+PiBGb3IgdGhlIGRyaXZlciBpdCBzZWxm
LCBpdCBzaG91bGQgbm90IGJlIGhhcmQuIEJ1dCBJIHRoaW5rIHlvdSBtZWFuIHRoZQo+PiBpc3N1
ZSBvZiBlLmcgdmlydGlvX3Zzb2NrX3BrdCBpdHNlbGYgd2hpY2ggZG9lc24ndCBzdXBwb3J0IHNn
LiBGb3Igc2hvcnQKPj4gdGltZSwgbWF5YmUgd2UgY2FuIHVzZSBrdmVjIGluc3RlYWQuCj4gSSds
bCB0cnkgdG8gdXNlIGt2ZWMgaW4gdGhlIHZpcnRpb192c29ja19wa3QuCj4KPiBTaW5jZSB0aGlz
IHN0cnVjdCBpcyBzaGFyZWQgYWxzbyB3aXRoIHRoZSBob3N0IGRyaXZlciAodmhvc3QtdnNvY2sp
LAo+IEkgaG9wZSB0aGUgY2hhbmdlcyBjb3VsZCBiZSBsaW1pdGVkLCBvdGhlcndpc2Ugd2UgY2Fu
IHJlbW92ZSB0aGUgbGFzdCAyCj4gcGF0Y2hlcyBvZiB0aGUgc2VyaWVzIGZvciBub3csIGxlYXZp
bmcgdGhlIFJYIGJ1ZmZlciBzaXplIHRvIDRLQi4KCgpZZXMgYW5kIGlmIGl0IGludHJvZHVjZXMg
dG9vIG11Y2ggY2hhbmdlcywgbWF5YmUgd2UgY2FuIGRvIHRoZSA2NEtCIApidWZmZXIgaW4gdGhl
IGZ1dHVyZSB3aXRoIHRoZSBjb252ZXJzaW9uIG9mIHVzaW5nIHNrYiB3aGVyZSBzdXBwb3J0cyAK
cGFnZSBmcmFnIG5hdGl2ZWx5LgoKVGhhbmtzCgoKPgo+IFRoYW5rcywKPiBTdGVmYW5vCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9u
IG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpo
dHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFs
aXphdGlvbg==
