Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBF6D4E44
	for <lists.virtualization@lfdr.de>; Sat, 12 Oct 2019 10:25:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C1C671E35;
	Sat, 12 Oct 2019 08:25:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 83E291DCE
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 08:15:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 266A1D0
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 08:15:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 51D5D368DA;
	Sat, 12 Oct 2019 08:15:48 +0000 (UTC)
Received: from [10.72.12.150] (ovpn-12-150.pek2.redhat.com [10.72.12.150])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2CB301C93D;
	Sat, 12 Oct 2019 08:15:43 +0000 (UTC)
Subject: Re: [PATCH RFC v1 0/2] vhost: ring format independence
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
	netdev@vger.kernel.org
References: <20191011134358.16912-1-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f650ac1a-6e2a-9215-6e4f-a1095f4a89cd@redhat.com>
Date: Sat, 12 Oct 2019 16:15:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191011134358.16912-1-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Sat, 12 Oct 2019 08:15:48 +0000 (UTC)
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
d2UgYXJlIGZldGNoaW5nIG11bHRpcGxlIGRlc2NyaXB0b3JzLgoKCkkgd29uZGVyIHRoaXMgbWF5
IGhlbHAgZm9yIHBlcmZvcm1hbmNlOgoKLSBhbm90aGVyIGluZGlyZWN0aW9uIGxheWVyLCBpbmNy
ZWFzZWQgZm9vdHByaW50CgotIHdvbid0IGhlbHAgb3IgZXZlbiBkZWdyYWRlIHdoZW4gdGhlcmUn
cyBubyBiYXRjaAoKLSBhbiBleHRyYSBvdmVyaGVhZCBpbiB0aGUgY2FzZSBvZiBpbiBvcmRlciB3
aGVyZSB3ZSBzaG91bGQgYWxyZWFkeSBoYWQgCnRpZ2h0IGxvb3AKCi0gbmVlZCBjYXJlZnVsbHkg
ZGVhbCB3aXRoIGluZGlyZWN0IGFuZCBjaGFpbiBvciBtYWtlIGl0IG9ubHkgd29yayBmb3IgCnBh
Y2tldCBzaXQganVzdCBpbiBhIHNpbmdsZSBkZXNjcmlwdG9yCgpUaGFua3MKCgo+Cj4gQW5kIHBl
cmhhcHMgbW9yZSBpbXBvcnRhbnRseSwgdGhpcyBpcyBhIHZlcnkgZ29vZCBmaXQgZm9yIHRoZSBw
YWNrZWQKPiByaW5nIGxheW91dCwgd2hlcmUgd2UgZ2V0IGFuZCBwdXQgZGVzY3JpcHRvcnMgaW4g
b3JkZXIuCj4KPiBUaGlzIHBhdGNoc2V0IHNlZW1zIHRvIGFscmVhZHkgcGVyZm9ybSBleGFjdGx5
IHRoZSBzYW1lIGFzIHRoZSBvcmlnaW5hbAo+IGNvZGUgYWxyZWFkeSBiYXNlZCBvbiBhIG1pY3Jv
YmVuY2htYXJrLiAgTW9yZSB0ZXN0aW5nIHdvdWxkIGJlIHZlcnkgbXVjaAo+IGFwcHJlY2lhdGVk
Lgo+Cj4gQmlnZ2VzdCBUT0RPIGJlZm9yZSB0aGlzIGZpcnN0IHN0ZXAgaXMgcmVhZHkgdG8gZ28g
aW4gaXMgdG8KPiBiYXRjaCBpbmRpcmVjdCBkZXNjcmlwdG9ycyBhcyB3ZWxsLgo+Cj4gSW50ZWdy
YXRpbmcgaW50byB2aG9zdC1uZXQgaXMgYmFzaWNhbGx5Cj4gcy92aG9zdF9nZXRfdnFfZGVzYy92
aG9zdF9nZXRfdnFfZGVzY19iYXRjaC8gLQo+IG9yIGFkZCBhIG1vZHVsZSBwYXJhbWV0ZXIgbGlr
ZSBJIGRpZCBpbiB0aGUgdGVzdCBtb2R1bGUuCj4KPgo+Cj4gTWljaGFlbCBTLiBUc2lya2luICgy
KToKPiAgICB2aG9zdDogb3B0aW9uIHRvIGZldGNoIGRlc2NyaXB0b3JzIHRocm91Z2ggYW4gaW5k
ZXBlbmRlbnQgc3RydWN0Cj4gICAgdmhvc3Q6IGJhdGNoaW5nIGZldGNoZXMKPgo+ICAgZHJpdmVy
cy92aG9zdC90ZXN0LmMgIHwgIDE5ICsrLQo+ICAgZHJpdmVycy92aG9zdC92aG9zdC5jIHwgMzMz
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+ICAgZHJpdmVycy92
aG9zdC92aG9zdC5oIHwgIDIwICsrLQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAzNjUgaW5zZXJ0aW9u
cygrKSwgNyBkZWxldGlvbnMoLSkKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25A
bGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24u
b3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
