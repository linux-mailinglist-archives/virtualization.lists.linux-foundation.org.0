Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 433902D30E
	for <lists.virtualization@lfdr.de>; Wed, 29 May 2019 03:01:53 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5C69823C4;
	Wed, 29 May 2019 01:01:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0DA252224
	for <virtualization@lists.linux-foundation.org>;
	Wed, 29 May 2019 00:59:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9F411619
	for <virtualization@lists.linux-foundation.org>;
	Wed, 29 May 2019 00:59:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1B66DC049D7C;
	Wed, 29 May 2019 00:59:12 +0000 (UTC)
Received: from [10.72.12.48] (ovpn-12-48.pek2.redhat.com [10.72.12.48])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C414760BF1;
	Wed, 29 May 2019 00:59:04 +0000 (UTC)
Subject: Re: [PATCH v2 1/8] vsock/virtio: limit the memory used per-socket
To: Stefano Garzarella <sgarzare@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
References: <20190510125843.95587-1-sgarzare@redhat.com>
	<20190510125843.95587-2-sgarzare@redhat.com>
	<3b275b52-63d9-d260-1652-8e8bf7dd679f@redhat.com>
	<20190513172322.vcgenx7xk4v6r2ay@steredhat>
	<f834c9e9-5d0e-8ebb-44e0-6d99b6284e5c@redhat.com>
	<20190514163500.a7moalixvpn5mkcr@steredhat>
	<034a5081-b4fb-011f-b5b7-fbf293c13b23@redhat.com>
	<20190528164521.k2euedfcmtvvynew@steredhat.homenet.telecomitalia.it>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <3f0019cc-29b5-1ddd-fbcf-d5f1716ca802@redhat.com>
Date: Wed, 29 May 2019 08:59:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190528164521.k2euedfcmtvvynew@steredhat.homenet.telecomitalia.it>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 29 May 2019 00:59:12 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
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

Ck9uIDIwMTkvNS8yOSDkuIrljYgxMjo0NSwgU3RlZmFubyBHYXJ6YXJlbGxhIHdyb3RlOgo+IE9u
IFdlZCwgTWF5IDE1LCAyMDE5IGF0IDEwOjQ4OjQ0QU0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6
Cj4+IE9uIDIwMTkvNS8xNSDkuIrljYgxMjozNSwgU3RlZmFubyBHYXJ6YXJlbGxhIHdyb3RlOgo+
Pj4gT24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMTE6MjU6MzRBTSArMDgwMCwgSmFzb24gV2FuZyB3
cm90ZToKPj4+PiBPbiAyMDE5LzUvMTQg5LiK5Y2IMToyMywgU3RlZmFubyBHYXJ6YXJlbGxhIHdy
b3RlOgo+Pj4+PiBPbiBNb24sIE1heSAxMywgMjAxOSBhdCAwNTo1ODo1M1BNICswODAwLCBKYXNv
biBXYW5nIHdyb3RlOgo+Pj4+Pj4gT24gMjAxOS81LzEwIOS4i+WNiDg6NTgsIFN0ZWZhbm8gR2Fy
emFyZWxsYSB3cm90ZToKPj4+Pj4+PiArc3RhdGljIHN0cnVjdCB2aXJ0aW9fdnNvY2tfYnVmICoK
Pj4+Pj4+PiArdmlydGlvX3RyYW5zcG9ydF9hbGxvY19idWYoc3RydWN0IHZpcnRpb192c29ja19w
a3QgKnBrdCwgYm9vbCB6ZXJvX2NvcHkpCj4+Pj4+Pj4gK3sKPj4+Pj4+PiArCXN0cnVjdCB2aXJ0
aW9fdnNvY2tfYnVmICpidWY7Cj4+Pj4+Pj4gKwo+Pj4+Pj4+ICsJaWYgKHBrdC0+bGVuID09IDAp
Cj4+Pj4+Pj4gKwkJcmV0dXJuIE5VTEw7Cj4+Pj4+Pj4gKwo+Pj4+Pj4+ICsJYnVmID0ga3phbGxv
YyhzaXplb2YoKmJ1ZiksIEdGUF9LRVJORUwpOwo+Pj4+Pj4+ICsJaWYgKCFidWYpCj4+Pj4+Pj4g
KwkJcmV0dXJuIE5VTEw7Cj4+Pj4+Pj4gKwo+Pj4+Pj4+ICsJLyogSWYgdGhlIGJ1ZmZlciBpbiB0
aGUgdmlydGlvX3Zzb2NrX3BrdCBpcyBmdWxsLCB3ZSBjYW4gbW92ZSBpdCB0bwo+Pj4+Pj4+ICsJ
ICogdGhlIG5ldyB2aXJ0aW9fdnNvY2tfYnVmIGF2b2lkaW5nIHRoZSBjb3B5LCBiZWNhdXNlIHdl
IGFyZSBzdXJlIHRoYXQKPj4+Pj4+PiArCSAqIHdlIGFyZSBub3QgdXNlIG1vcmUgbWVtb3J5IHRo
YW4gdGhhdCBjb3VudGVkIGJ5IHRoZSBjcmVkaXQgbWVjaGFuaXNtLgo+Pj4+Pj4+ICsJICovCj4+
Pj4+Pj4gKwlpZiAoemVyb19jb3B5ICYmIHBrdC0+bGVuID09IHBrdC0+YnVmX2xlbikgewo+Pj4+
Pj4+ICsJCWJ1Zi0+YWRkciA9IHBrdC0+YnVmOwo+Pj4+Pj4+ICsJCXBrdC0+YnVmID0gTlVMTDsK
Pj4+Pj4+PiArCX0gZWxzZSB7Cj4+Pj4+PiBJcyB0aGUgY29weSBzdGlsbCBuZWVkZWQgaWYgd2Un
cmUganVzdCBmZXcgYnl0ZXMgbGVzcz8gV2UgbWVldCBzaW1pbGFyIGlzc3VlCj4+Pj4+PiBmb3Ig
dmlyaXRvLW5ldCwgYW5kIHZpcnRpby1uZXQgc29sdmUgdGhpcyBieSBhbHdheXMgY29weSBmaXJz
dCAxMjhieXRlcyBmb3IKPj4+Pj4+IGJpZyBwYWNrZXRzLgo+Pj4+Pj4KPj4+Pj4+IFNlZSByZWNl
aXZlX2JpZygpCj4+Pj4+IEknbSBzZWVpbmcsIEl0IGlzIG1vcmUgc29waGlzdGljYXRlZC4KPj4+
Pj4gSUlVQywgdmlydGlvLW5ldCBhbGxvY2F0ZXMgYSBza19idWZmIHdpdGggMTI4IGJ5dGVzIG9m
IGJ1ZmZlciwgdGhlbiBjb3BpZXMgdGhlCj4+Pj4+IGZpcnN0IDEyOCBieXRlcywgdGhlbiBhZGRz
IHRoZSBidWZmZXIgdXNlZCB0byByZWNlaXZlIHRoZSBwYWNrZXQgYXMgYSBmcmFnIHRvCj4+Pj4+
IHRoZSBza2IuCj4+Pj4gWWVzIGFuZCB0aGUgcG9pbnQgaXMgaWYgdGhlIHBhY2tldCBpcyBzbWFs
bGVyIHRoYW4gMTI4IGJ5dGVzIHRoZSBwYWdlcyB3aWxsCj4+Pj4gYmUgcmVjeWNsZWQuCj4+Pj4K
Pj4+Pgo+Pj4gU28gaXQncyBhdm9pZCB0aGUgb3ZlcmhlYWQgb2YgYWxsb2NhdGlvbiBvZiBhIGxh
cmdlIGJ1ZmZlci4gSSBnb3QgaXQuCj4+Pgo+Pj4gSnVzdCBhIGN1cmlvc2l0eSwgd2h5IHRoZSB0
aHJlc2hvbGQgaXMgMTI4IGJ5dGVzPwo+Pgo+PiAgRnJvbSBpdHMgbmFtZSAoR09PRF9DT1BZX0xF
TiksIEkgdGhpbmsgaXQganVzdCBhIHZhbHVlIHRoYXQgd29uJ3QgbG9zZSBtdWNoCj4+IHBlcmZv
cm1hbmNlLCBlLmcgdGhlIHNpemUgdHdvIGNhY2hlbGluZXMuCj4+Cj4gSmFzb24sIFN0ZWZhbiwK
PiBzaW5jZSBJJ20gcmVtb3ZpbmcgdGhlIHBhdGNoZXMgdG8gaW5jcmVhc2UgdGhlIGJ1ZmZlcnMg
dG8gNjQgS2lCIGFuZCBJJ20KPiBhZGRpbmcgYSB0aHJlc2hvbGQgZm9yIHNtYWxsIHBhY2tldHMs
IEkgd291bGQgc2ltcGxpZnkgdGhpcyBwYXRjaCwKPiByZW1vdmluZyB0aGUgbmV3IGJ1ZmZlciBh
bGxvY2F0aW9uIGFuZCBjb3B5aW5nIHNtYWxsIHBhY2tldHMgaW50byB0aGUKPiBidWZmZXJzIGFs
cmVhZHkgcXVldWVkIChpZiB0aGVyZSBpcyBhIHNwYWNlKS4KPiBJbiB0aGlzIHdheSwgSSBzaG91
bGQgc29sdmUgdGhlIGlzc3VlIG9mIDEgYnl0ZSBwYWNrZXRzLgo+Cj4gRG8geW91IHRoaW5rIGNv
dWxkIGJlIGJldHRlcj8KCgpJIHRoaW5rIHNvLgoKVGhhbmtzCgoKPgo+IFRoYW5rcywKPiBTdGVm
YW5vCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1
YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0
aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5m
by92aXJ0dWFsaXphdGlvbg==
