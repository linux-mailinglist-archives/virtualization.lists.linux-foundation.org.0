Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D45D4E0A
	for <lists.virtualization@lfdr.de>; Sat, 12 Oct 2019 09:40:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4C27F1DFC;
	Sat, 12 Oct 2019 07:39:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 859091DEB
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 07:31:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3D413D0
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 07:31:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C683D36961;
	Sat, 12 Oct 2019 07:31:56 +0000 (UTC)
Received: from [10.72.12.150] (ovpn-12-150.pek2.redhat.com [10.72.12.150])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4361C600D1;
	Sat, 12 Oct 2019 07:31:51 +0000 (UTC)
Subject: Re: [PATCH RFC v1 0/2] vhost: ring format independence
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
	netdev@vger.kernel.org
References: <20191011134358.16912-1-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b24b3c9e-3a5d-fa5e-8218-ea7def0e5a39@redhat.com>
Date: Sat, 12 Oct 2019 15:31:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191011134358.16912-1-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Sat, 12 Oct 2019 07:31:56 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
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

Ck9uIDIwMTkvMTAvMTEg5LiL5Y2IOTo0NSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+IFNv
IHRoZSBpZGVhIGlzIGFzIGZvbGxvd3M6IHdlIGNvbnZlcnQgZGVzY3JpcHRvcnMgdG8gYW4KPiBp
bmRlcGVuZGVudCBmb3JtYXQgZmlyc3QsIGFuZCBwcm9jZXNzIHRoYXQgY29udmVydGluZyB0bwo+
IGlvdiBsYXRlci4KPgo+IFRoZSBwb2ludCBpcyB0aGF0IHdlIGhhdmUgYSB0aWdodCBsb29wIHRo
YXQgZmV0Y2hlcwo+IGRlc2NyaXB0b3JzLCB3aGljaCBpcyBnb29kIGZvciBjYWNoZSB1dGlsaXph
dGlvbi4KPiBUaGlzIHdpbGwgYWxzbyBhbGxvdyBhbGwga2luZCBvZiBiYXRjaGluZyB0cmlja3Mg
LQo+IGUuZy4gaXQgc2VlbXMgcG9zc2libGUgdG8ga2VlcCBTTUFQIGRpc2FibGVkIHdoaWxlCj4g
d2UgYXJlIGZldGNoaW5nIG11bHRpcGxlIGRlc2NyaXB0b3JzLgo+Cj4gQW5kIHBlcmhhcHMgbW9y
ZSBpbXBvcnRhbnRseSwgdGhpcyBpcyBhIHZlcnkgZ29vZCBmaXQgZm9yIHRoZSBwYWNrZWQKPiBy
aW5nIGxheW91dCwgd2hlcmUgd2UgZ2V0IGFuZCBwdXQgZGVzY3JpcHRvcnMgaW4gb3JkZXIuCj4K
PiBUaGlzIHBhdGNoc2V0IHNlZW1zIHRvIGFscmVhZHkgcGVyZm9ybSBleGFjdGx5IHRoZSBzYW1l
IGFzIHRoZSBvcmlnaW5hbAo+IGNvZGUgYWxyZWFkeSBiYXNlZCBvbiBhIG1pY3JvYmVuY2htYXJr
LiAgTW9yZSB0ZXN0aW5nIHdvdWxkIGJlIHZlcnkgbXVjaAo+IGFwcHJlY2lhdGVkLgo+Cj4gQmln
Z2VzdCBUT0RPIGJlZm9yZSB0aGlzIGZpcnN0IHN0ZXAgaXMgcmVhZHkgdG8gZ28gaW4gaXMgdG8K
PiBiYXRjaCBpbmRpcmVjdCBkZXNjcmlwdG9ycyBhcyB3ZWxsLgo+Cj4gSW50ZWdyYXRpbmcgaW50
byB2aG9zdC1uZXQgaXMgYmFzaWNhbGx5Cj4gcy92aG9zdF9nZXRfdnFfZGVzYy92aG9zdF9nZXRf
dnFfZGVzY19iYXRjaC8gLQo+IG9yIGFkZCBhIG1vZHVsZSBwYXJhbWV0ZXIgbGlrZSBJIGRpZCBp
biB0aGUgdGVzdCBtb2R1bGUuCgoKSXQgd291bGQgYmUgYmV0dGVyIHRvIGNvbnZlcnQgdmhvc3Rf
bmV0IHRoZW4gSSBjYW4gZG8gc29tZSBiZW5jaG1hcmsgb24gCnRoYXQuCgpUaGFua3MKCgo+Cj4K
Pgo+IE1pY2hhZWwgUy4gVHNpcmtpbiAoMik6Cj4gICAgdmhvc3Q6IG9wdGlvbiB0byBmZXRjaCBk
ZXNjcmlwdG9ycyB0aHJvdWdoIGFuIGluZGVwZW5kZW50IHN0cnVjdAo+ICAgIHZob3N0OiBiYXRj
aGluZyBmZXRjaGVzCj4KPiAgIGRyaXZlcnMvdmhvc3QvdGVzdC5jICB8ICAxOSArKy0KPiAgIGRy
aXZlcnMvdmhvc3Qvdmhvc3QuYyB8IDMzMyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKy0KPiAgIGRyaXZlcnMvdmhvc3Qvdmhvc3QuaCB8ICAyMCArKy0KPiAgIDMgZmls
ZXMgY2hhbmdlZCwgMzY1IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFp
bGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBz
Oi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0
aW9u
