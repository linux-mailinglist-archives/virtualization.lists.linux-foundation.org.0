Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 275E66E266
	for <lists.virtualization@lfdr.de>; Fri, 19 Jul 2019 10:22:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id F1A8F220A;
	Fri, 19 Jul 2019 08:22:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 67F3B220A
	for <virtualization@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 08:22:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5757CFE
	for <virtualization@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 08:22:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 95A7630860D3;
	Fri, 19 Jul 2019 08:22:03 +0000 (UTC)
Received: from [10.72.12.179] (ovpn-12-179.pek2.redhat.com [10.72.12.179])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 147D65DA35;
	Fri, 19 Jul 2019 08:21:53 +0000 (UTC)
Subject: Re: [PATCH v4 4/5] vhost/vsock: split packets to send using multiple
	buffers
To: Stefano Garzarella <sgarzare@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
References: <20190717113030.163499-1-sgarzare@redhat.com>
	<20190717113030.163499-5-sgarzare@redhat.com>
	<20190717105336-mutt-send-email-mst@kernel.org>
	<CAGxU2F45v40qAOHkm1Hk2E69gCS0UwVgS5NS+tDXXuzdF4EixA@mail.gmail.com>
	<20190718041234-mutt-send-email-mst@kernel.org>
	<CAGxU2F6oo7Cou7t9o=gG2=wxHMKX9xYQXNxVtDYeHq5fyEhJWg@mail.gmail.com>
	<20190718072741-mutt-send-email-mst@kernel.org>
	<20190719080832.7hoeus23zjyrx3cc@steredhat>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <fcd19719-e5a9-adad-1e6c-c84487187088@redhat.com>
Date: Fri, 19 Jul 2019 16:21:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190719080832.7hoeus23zjyrx3cc@steredhat>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Fri, 19 Jul 2019 08:22:03 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
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

Ck9uIDIwMTkvNy8xOSDkuIvljYg0OjA4LCBTdGVmYW5vIEdhcnphcmVsbGEgd3JvdGU6Cj4gT24g
VGh1LCBKdWwgMTgsIDIwMTkgYXQgMDc6MzU6NDZBTSAtMDQwMCwgTWljaGFlbCBTLiBUc2lya2lu
IHdyb3RlOgo+PiBPbiBUaHUsIEp1bCAxOCwgMjAxOSBhdCAxMTozNzozMEFNICswMjAwLCBTdGVm
YW5vIEdhcnphcmVsbGEgd3JvdGU6Cj4+PiBPbiBUaHUsIEp1bCAxOCwgMjAxOSBhdCAxMDoxMyBB
TSBNaWNoYWVsIFMuIFRzaXJraW48bXN0QHJlZGhhdC5jb20+ICB3cm90ZToKPj4+PiBPbiBUaHUs
IEp1bCAxOCwgMjAxOSBhdCAwOTo1MDoxNEFNICswMjAwLCBTdGVmYW5vIEdhcnphcmVsbGEgd3Jv
dGU6Cj4+Pj4+IE9uIFdlZCwgSnVsIDE3LCAyMDE5IGF0IDQ6NTUgUE0gTWljaGFlbCBTLiBUc2ly
a2luPG1zdEByZWRoYXQuY29tPiAgd3JvdGU6Cj4+Pj4+PiBPbiBXZWQsIEp1bCAxNywgMjAxOSBh
dCAwMTozMDoyOVBNICswMjAwLCBTdGVmYW5vIEdhcnphcmVsbGEgd3JvdGU6Cj4+Pj4+Pj4gSWYg
dGhlIHBhY2tldHMgdG8gc2VudCB0byB0aGUgZ3Vlc3QgYXJlIGJpZ2dlciB0aGFuIHRoZSBidWZm
ZXIKPj4+Pj4+PiBhdmFpbGFibGUsIHdlIGNhbiBzcGxpdCB0aGVtLCB1c2luZyBtdWx0aXBsZSBi
dWZmZXJzIGFuZCBmaXhpbmcKPj4+Pj4+PiB0aGUgbGVuZ3RoIGluIHRoZSBwYWNrZXQgaGVhZGVy
Lgo+Pj4+Pj4+IFRoaXMgaXMgc2FmZSBzaW5jZSB2aXJ0aW8tdnNvY2sgc3VwcG9ydHMgb25seSBz
dHJlYW0gc29ja2V0cy4KPj4+Pj4+Pgo+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gR2Fy
emFyZWxsYTxzZ2FyemFyZUByZWRoYXQuY29tPgo+Pj4+Pj4gU28gaG93IGRvZXMgaXQgd29yayBy
aWdodCBub3c/IElmIGFuIGFwcAo+Pj4+Pj4gZG9lcyBzZW5kbXNnIHdpdGggYSA2NEsgYnVmZmVy
IGFuZCB0aGUgb3RoZXIKPj4+Pj4+IHNpZGUgcHVibGlzaGVzIDRLIGJ1ZmZlcnMgLSBkb2VzIGl0
IGp1c3Qgc3RhbGw/Cj4+Pj4+IEJlZm9yZSB0aGlzIHNlcmllcywgdGhlIDY0SyAob3IgYmlnZ2Vy
KSB1c2VyIG1lc3NhZ2VzIHdhcyBzcGxpdCBpbiA0SyBwYWNrZXRzCj4+Pj4+IChmaXhlZCBpbiB0
aGUgY29kZSkgYW5kIHF1ZXVlZCBpbiBhbiBpbnRlcm5hbCBsaXN0IGZvciB0aGUgVFggd29ya2Vy
Lgo+Pj4+Pgo+Pj4+PiBBZnRlciB0aGlzIHNlcmllcywgd2Ugd2lsbCBxdWV1ZSB1cCB0byA2NEsg
cGFja2V0cyBhbmQgdGhlbiBpdCB3aWxsIGJlIHNwbGl0IGluCj4+Pj4+IHRoZSBUWCB3b3JrZXIs
IGRlcGVuZGluZyBvbiB0aGUgc2l6ZSBvZiB0aGUgYnVmZmVycyBhdmFpbGFibGUgaW4gdGhlCj4+
Pj4+IHZyaW5nLiAoVGhlIGlkZWEgd2FzIHRvIGFsbG93IEVXTUEgb3IgYSBjb25maWd1cmF0aW9u
IG9mIHRoZSBidWZmZXJzIHNpemUsIGJ1dAo+Pj4+PiBmb3Igbm93IHdlIHBvc3Rwb25lZCBpdCkK
Pj4+PiBHb3QgaXQuIFVzaW5nIHdvcmtlcnMgZm9yIHhtaXQgaXMgSU1ITyBhIGJhZCBpZGVhIGJ0
dy4KPj4+PiBXaHkgaXMgaXQgZG9uZSBsaWtlIHRoaXM/Cj4+PiBIb25lc3RseSwgSSBkb24ndCBr
bm93IHRoZSBleGFjdCByZWFzb25zIGZvciB0aGlzIGRlc2lnbiwgYnV0IEkgc3VwcG9zZQo+Pj4g
dGhhdCB0aGUgaWRlYSB3YXMgdG8gaGF2ZSBvbmx5IG9uZSB3b3JrZXIgdGhhdCB1c2VzIHRoZSB2
cmluZywgYW5kCj4+PiBtdWx0aXBsZSB1c2VyIHRocmVhZHMgdGhhdCBlbnF1ZXVlIHBhY2tldHMg
aW4gdGhlIGxpc3QuCj4+PiBUaGlzIGNhbiBzaW1wbGlmeSB0aGUgY29kZSBhbmQgd2UgY2FuIHB1
dCB0aGUgdXNlciB0aHJlYWRzIHRvIHNsZWVwIGlmCj4+PiB3ZSBkb24ndCBoYXZlICJjcmVkaXQi
IGF2YWlsYWJsZSAodGhpcyBtZWFucyB0aGF0IHRoZSByZWNlaXZlciBkb2Vzbid0Cj4+PiBoYXZl
IHNwYWNlIHRvIHJlY2VpdmUgdGhlIHBhY2tldCkuCj4+IEkgdGhpbmsgeW91IG1lYW4gdGhlIHJl
dmVyc2U6IGV2ZW4gd2l0aG91dCBjcmVkaXRzIHlvdSBjYW4gY29weSBmcm9tCj4+IHVzZXIgYW5k
IHF1ZXVlIHVwIGRhdGEsIHRoZW4gcHJvY2VzcyBpdCB3aXRob3V0IHdha2luZyB1cCB0aGUgdXNl
cgo+PiB0aHJlYWQuCj4gSSBjaGVja2VkIHRoZSBjb2RlIGJldHRlciwgYnV0IGl0IGRvZXNuJ3Qg
c2VlbSB0byBkbyB0aGF0Lgo+IFRoZSAuc2VuZG1zZyBjYWxsYmFjayBvZiBhZl92c29jaywgY2hl
Y2sgaWYgdGhlIHRyYW5zcG9ydCBoYXMgc3BhY2UKPiAodmlydGlvLXZzb2NrIHRyYW5zcG9ydCBy
ZXR1cm5zIHRoZSBjcmVkaXQgYXZhaWxhYmxlKS4gSWYgdGhlcmUgaXMgbm8KPiBzcGFjZSwgaXQg
cHV0IHRoZSB0aHJlYWQgdG8gc2xlZXAgb24gdGhlICdza19zbGVlcChzayknIHdhaXRfcXVldWUu
Cj4KPiBXaGVuIHRoZSB0cmFuc3BvcnQgcmVjZWl2ZXMgYW4gdXBkYXRlIG9mIGNyZWRpdCBhdmFp
bGFibGUgb24gdGhlIG90aGVyCj4gcGVlciwgaXQgY2FsbHMgJ3NrLT5za193cml0ZV9zcGFjZShz
ayknIHRoYXQgd2FrZXMgdXAgdGhlIHRocmVhZAo+IHNsZWVwaW5nLCB0aGF0IHdpbGwgcXVldWUg
dGhlIG5ldyBwYWNrZXQuCj4KPiBTbywgaW4gdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24sIHRo
ZSBUWCB3b3JrZXIgZG9lc24ndCBjaGVjayB0aGUKPiBjcmVkaXQgYXZhaWxhYmxlLCBpdCBvbmx5
IHNlbmRzIHRoZSBwYWNrZXRzLgo+Cj4+IERvZXMgaXQgaGVscCB0aG91Z2g/IEl0IGNlcnRhaW5s
eSBhZGRzIHVwIHdvcmsgb3V0c2lkZSBvZgo+PiB1c2VyIHRocmVhZCBjb250ZXh0IHdoaWNoIG1l
YW5zIGl0J3Mgbm90IGFjY291bnRlZCBmb3IKPj4gY29ycmVjdGx5Lgo+IEkgY2FuIHRyeSB0byB4
bWl0IHRoZSBwYWNrZXQgZGlyZWN0bHkgaW4gdGhlIHVzZXIgdGhyZWFkIGNvbnRleHQsIHRvIHNl
ZQo+IHRoZSBpbXByb3ZlbWVudHMuCgoKSXQgd2lsbCB0aGVuIGxvb2tzIG1vcmUgbGlrZSB3aGF0
IHZpcnRpby1uZXQgKGFuZCBvdGhlciBuZXR3b3JraW5nIApkZXZpY2UpIGRpZC4KCgo+Cj4+IE1h
eWJlIHdlIHdhbnQgbW9yZSBWUXMuIFdvdWxkIGhlbHAgaW1wcm92ZSBwYXJhbGxlbGlzbS4gVGhl
IHF1ZXN0aW9uCj4+IHdvdWxkIHRoZW4gYmVjb21lIGhvdyB0byBtYXAgc29ja2V0cyB0byBWUXMu
IFdpdGggYSBzaW1wbGUgaGFzaAo+PiBpdCdzIGVhc3kgdG8gY3JlYXRlIGNvbGxpc2lvbnMgLi4u
Cj4gWWVzLCBtb3JlIFZRcyBjYW4gaGVscCBidXQgdGhlIG1hcCBxdWVzdGlvbiBpcyBub3Qgc2lt
cGxlIHRvIGFuc3dlci4KPiBNYXliZSB3ZSBjYW4gZG8gYW4gaGFzaCBvbiB0aGUgKGNpZCwgcG9y
dCkgb3IgZG8gc29tZSBraW5kIG9mIGVzdGltYXRpb24KPiBvZiBxdWV1ZSB1dGlsaXphdGlvbiBh
bmQgdHJ5IHRvIGJhbGFuY2UuCj4gU2hvdWxkIHRoZSBtYXBwaW5nIGJlIHVuaXF1ZT8KCgpJdCBz
b3VuZHMgdG8gbWUgeW91IHdhbnQgc29tZSBraW5kIG9mIGZhaXIgcXVldWluZz8gV2UndmUgYWxy
ZWFkeSBoYWQgCnNldmVyYWwgcWRpc2NzIHRoYXQgZG8gdGhpcy4KClNvIGlmIHdlIHVzZSB0aGUg
a2VybmVsIG5ldHdvcmtpbmcgeG1pdCBwYXRoLCBhbGwgdGhvc2UgaXNzdWVzIGNvdWxkIGJlIAph
ZGRyZXNzZWQuCgpUaGFua3MKCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxp
c3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
