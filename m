Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 707C269A32
	for <lists.virtualization@lfdr.de>; Mon, 15 Jul 2019 19:50:48 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E9F43F14;
	Mon, 15 Jul 2019 17:50:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E7B39C96
	for <virtualization@lists.linux-foundation.org>;
	Mon, 15 Jul 2019 17:50:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0EC5F8CB
	for <virtualization@lists.linux-foundation.org>;
	Mon, 15 Jul 2019 17:50:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 729E2356C4;
	Mon, 15 Jul 2019 17:50:38 +0000 (UTC)
Received: from redhat.com (ovpn-125-108.rdu2.redhat.com [10.10.125.108])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 675B460BF4;
	Mon, 15 Jul 2019 17:50:34 +0000 (UTC)
Date: Mon, 15 Jul 2019 13:50:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [RFC] virtio-net: share receive_*() and add_recvbuf_*() with
	virtio-vsock
Message-ID: <20190715134115-mutt-send-email-mst@kernel.org>
References: <20190710153707.twmzgmwqqw3pstos@steredhat>
	<9574bc38-4c5c-2325-986b-430e4a2b6661@redhat.com>
	<20190711114134.xhmpciyglb2angl6@steredhat>
	<20190711152855-mutt-send-email-mst@kernel.org>
	<20190712100033.xs3xesz2plfwj3ag@steredhat>
	<a514d8a4-3a12-feeb-4467-af7a9fbf5183@redhat.com>
	<20190715074416.a3s2i5ausognotbn@steredhat>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190715074416.a3s2i5ausognotbn@steredhat>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 15 Jul 2019 17:50:38 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
	virtualization@lists.linux-foundation.org
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

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMDk6NDQ6MTZBTSArMDIwMCwgU3RlZmFubyBHYXJ6YXJl
bGxhIHdyb3RlOgo+IE9uIEZyaSwgSnVsIDEyLCAyMDE5IGF0IDA2OjE0OjM5UE0gKzA4MDAsIEph
c29uIFdhbmcgd3JvdGU6Cj4gPiAKPiA+IE9uIDIwMTkvNy8xMiDkuIvljYg2OjAwLCBTdGVmYW5v
IEdhcnphcmVsbGEgd3JvdGU6Cj4gPiA+IE9uIFRodSwgSnVsIDExLCAyMDE5IGF0IDAzOjUyOjIx
UE0gLTA0MDAsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiA+ID4gPiBPbiBUaHUsIEp1bCAx
MSwgMjAxOSBhdCAwMTo0MTozNFBNICswMjAwLCBTdGVmYW5vIEdhcnphcmVsbGEgd3JvdGU6Cj4g
PiA+ID4gPiBPbiBUaHUsIEp1bCAxMSwgMjAxOSBhdCAwMzozNzowMFBNICswODAwLCBKYXNvbiBX
YW5nIHdyb3RlOgo+ID4gPiA+ID4gPiBPbiAyMDE5LzcvMTAg5LiL5Y2IMTE6MzcsIFN0ZWZhbm8g
R2FyemFyZWxsYSB3cm90ZToKPiA+ID4gPiA+ID4gPiBIaSwKPiA+ID4gPiA+ID4gPiBhcyBKYXNv
biBzdWdnZXN0ZWQgc29tZSBtb250aHMgYWdvLCBJIGxvb2tlZCBiZXR0ZXIgYXQgdGhlIHZpcnRp
by1uZXQgZHJpdmVyIHRvCj4gPiA+ID4gPiA+ID4gdW5kZXJzdGFuZCBpZiB3ZSBjYW4gcmV1c2Ug
c29tZSBwYXJ0cyBhbHNvIGluIHRoZSB2aXJ0aW8tdnNvY2sgZHJpdmVyLCBzaW5jZSB3ZQo+ID4g
PiA+ID4gPiA+IGhhdmUgc2ltaWxhciBjaGFsbGVuZ2VzIChtZXJnZWFibGUgYnVmZmVycywgcGFn
ZSBhbGxvY2F0aW9uLCBzbWFsbAo+ID4gPiA+ID4gPiA+IHBhY2tldHMsIGV0Yy4pLgo+ID4gPiA+
ID4gPiA+IAo+ID4gPiA+ID4gPiA+IEluaXRpYWxseSwgSSB3b3VsZCBhZGQgdGhlIHNrYnVmZiBp
biB0aGUgdmlydGlvLXZzb2NrIGluIG9yZGVyIHRvIHJlLXVzZQo+ID4gPiA+ID4gPiA+IHJlY2Vp
dmVfKigpIGZ1bmN0aW9ucy4KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IFllcywgdGhhdCB3aWxs
IGJlIGEgZ29vZCBzdGVwLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+IE9rYXksIEknbGwgZ28gb24g
dGhpcyB3YXkuCj4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBUaGVuIEkgd291bGQgbW92ZSByZWNl
aXZlX1tzbWFsbCwgYmlnLCBtZXJnZWFibGVdKCkgYW5kCj4gPiA+ID4gPiA+ID4gYWRkX3JlY3Zi
dWZfW3NtYWxsLCBiaWcsIG1lcmdlYWJsZV0oKSBvdXRzaWRlIG9mIHZpcnRpby1uZXQgZHJpdmVy
LCBpbiBvcmRlciB0bwo+ID4gPiA+ID4gPiA+IGNhbGwgdGhlbSBhbHNvIGZyb20gdmlydGlvLXZz
b2NrLiBJIG5lZWQgdG8gZG8gc29tZSByZWZhY3RvcmluZyAoZS5nLiBsZWF2ZSB0aGUKPiA+ID4g
PiA+ID4gPiBYRFAgcGFydCBvbiB0aGUgdmlydGlvLW5ldCBkcml2ZXIpLCBidXQgSSB0aGluayBp
dCBpcyBmZWFzaWJsZS4KPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBUaGUgaWRlYSBpcyB0
byBjcmVhdGUgYSB2aXJ0aW8tc2tiLltoLGNdIHdoZXJlIHB1dCB0aGVzZSBmdW5jdGlvbnMgYW5k
IGEgbmV3Cj4gPiA+ID4gPiA+ID4gb2JqZWN0IHdoZXJlIHN0b3JlcyBzb21lIGF0dHJpYnV0ZXMg
bmVlZGVkIChlLmcuIGhkcl9sZW4gKSBhbmQgc3RhdHVzIChlLmcuCj4gPiA+ID4gPiA+ID4gc29t
ZSBmaWVsZHMgb2Ygc3RydWN0IHJlY2VpdmVfcXVldWUpLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+
ID4gTXkgdW5kZXJzdGFuZGluZyBpcyB3ZSBjb3VsZCBiZSBtb3JlIGFtYml0aW91cyBoZXJlLiBE
byB5b3Ugc2VlIGFueSBibG9ja2VyCj4gPiA+ID4gPiA+IGZvciByZXVzaW5nIHZpcnRpby1uZXQg
ZGlyZWN0bHk/IEl0J3MgYmV0dGVyIHRvIHJldXNlIG5vdCBvbmx5IHRoZSBmdW5jdGlvbnMKPiA+
ID4gPiA+ID4gYnV0IGFsc28gdGhlIGxvZ2ljIGxpa2UgTkFQSSB0byBhdm9pZCByZS1pbnZlbnRp
bmcgc29tZXRoaW5nIGJ1Z2d5IGFuZAo+ID4gPiA+ID4gPiBkdXBsaWNhdGVkLgo+ID4gPiA+ID4g
PiAKPiA+ID4gPiA+IFRoZXNlIGFyZSBteSBjb25jZXJuczoKPiA+ID4gPiA+IC0gdmlydGlvLXZz
b2NrIGlzIG5vdCBhICJuZXRfZGV2aWNlIiwgc28gYSBsb3Qgb2YgY29kZSByZWxhdGVkIHRvCj4g
PiA+ID4gPiAgICBldGh0b29sLCBuZXQgZGV2aWNlcyAoTUFDIGFkZHJlc3MsIE1UVSwgc3BlZWQs
IFZMQU4sIFhEUCwgb2ZmbG9hZGluZykgd2lsbCBiZQo+ID4gPiA+ID4gICAgbm90IHVzZWQgYnkg
dmlydGlvLXZzb2NrLgo+ID4gCj4gPiAKPiA+IExpbnV4IHN1cHBvcnQgZGV2aWNlIG90aGVyIHRo
YW4gZXRoZXJuZXQsIHNvIGl0IHNob3VsZCBub3QgYmUgYSBwcm9ibGVtLgo+ID4gCj4gPiAKPiA+
ID4gPiA+IAo+ID4gPiA+ID4gLSB2aXJ0aW8tdnNvY2sgaGFzIGEgZGlmZmVyZW50IGhlYWRlci4g
V2UgY2FuIGNvbnNpZGVyIGl0IGFzIHBhcnQgb2YKPiA+ID4gPiA+ICAgIHZpcnRpb19uZXQgcGF5
bG9hZCwgYnV0IGl0IHByZWNsdWRlcyB0aGUgY29tcGF0aWJpbGl0eSB3aXRoIG9sZCBob3N0cy4g
VGhpcwo+ID4gPiA+ID4gICAgd2FzIG9uZSBvZiB0aGUgbWFqb3IgZG91YnRzIHRoYXQgbWFkZSBt
ZSB0aGluayBhYm91dCB1c2luZyBvbmx5IHRoZQo+ID4gPiA+ID4gICAgc2VuZC9yZWN2IHNrYnVm
ZiBmdW5jdGlvbnMsIHRoYXQgaXQgc2hvdWxkbid0IGJyZWFrIHRoZSBjb21wYXRpYmlsaXR5Lgo+
ID4gCj4gPiAKPiA+IFdlIGNhbiBleHRlbmQgdGhlIGN1cnJlbnQgdm5ldCBoZWFkZXIgaGVscGVy
IGZvciBpdCB0byB3b3JrIGZvciB2c29jay4KPiAKPiBPa2F5LCBJJ2xsIGRvIGl0Lgo+IAo+ID4g
Cj4gPiAKPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IFRoaXMgaXMgYW4gaWRlYSBvZiB2aXJ0aW8t
c2tiLmggdGhhdAo+ID4gPiA+ID4gPiA+IEkgaGF2ZSBpbiBtaW5kOgo+ID4gPiA+ID4gPiA+ICAg
ICAgIHN0cnVjdCB2aXJ0c2tiOwo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gV2hhdCBmaWVsZHMg
ZG8geW91IHdhbnQgdG8gc3RvcmUgaW4gdmlydHNrYj8gSXQgbG9va3MgdG8gYmUgZXhpc3Qgc2tf
YnVmZiBpcwo+ID4gPiA+ID4gPiBmbGV4aWJsZSBlbm91Z2ggdG8gdXM/Cj4gPiA+ID4gPiBNeSBp
ZGVhIGlzIHRvIHN0b3JlIHF1ZXVlcyBpbmZvcm1hdGlvbiwgbGlrZSBzdHJ1Y3QgcmVjZWl2ZV9x
dWV1ZSBvcgo+ID4gPiA+ID4gc3RydWN0IHNlbmRfcXVldWUsIGFuZCBzb21lIGRldmljZSBhdHRy
aWJ1dGVzIChlLmcuIGhkcl9sZW4gKS4KPiA+IAo+ID4gCj4gPiBJZiB5b3UgcmV1c2Ugc2tiIG9y
IHZpcnRuZXRfaW5mbywgdGhlcmUgaXMgbm90IG5lY2Vzc2FyeS4KPiA+IAo+IAo+IE9rYXkuCj4g
Cj4gPiAKPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiAgICAgICBzdHJ1Y3Qg
c2tfYnVmZiAqdmlydHNrYl9yZWNlaXZlX3NtYWxsKHN0cnVjdCB2aXJ0c2tiICp2cywgLi4uKTsK
PiA+ID4gPiA+ID4gPiAgICAgICBzdHJ1Y3Qgc2tfYnVmZiAqdmlydHNrYl9yZWNlaXZlX2JpZyhz
dHJ1Y3QgdmlydHNrYiAqdnMsIC4uLik7Cj4gPiA+ID4gPiA+ID4gICAgICAgc3RydWN0IHNrX2J1
ZmYgKnZpcnRza2JfcmVjZWl2ZV9tZXJnZWFibGUoc3RydWN0IHZpcnRza2IgKnZzLCAuLi4pOwo+
ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ICAgICAgIGludCB2aXJ0c2tiX2FkZF9yZWN2YnVm
X3NtYWxsKHN0cnVjdCB2aXJ0c2tiKnZzLCAuLi4pOwo+ID4gPiA+ID4gPiA+ICAgICAgIGludCB2
aXJ0c2tiX2FkZF9yZWN2YnVmX2JpZyhzdHJ1Y3QgdmlydHNrYiAqdnMsIC4uLik7Cj4gPiA+ID4g
PiA+ID4gICAgICAgaW50IHZpcnRza2JfYWRkX3JlY3ZidWZfbWVyZ2VhYmxlKHN0cnVjdCB2aXJ0
c2tiICp2cywgLi4uKTsKPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBGb3IgdGhlIEd1ZXN0
LT5Ib3N0IHBhdGggaXQgc2hvdWxkIGJlIGVhc2llciwgc28gbWF5YmUgSSBjYW4gYWRkIGEKPiA+
ID4gPiA+ID4gPiAidmlydHNrYl9zZW5kKHN0cnVjdCB2aXJ0c2tiICp2cywgc3RydWN0IHNrX2J1
ZmYgKnNrYikiIHdpdGggYSBwYXJ0IG9mIHRoZSBjb2RlCj4gPiA+ID4gPiA+ID4gb2YgeG1pdF9z
a2IoKS4KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEkgbWF5IG1pc3Mgc29tZXRoaW5nLCBidXQg
SSBkb24ndCBzZWUgYW55IHRoaW5nIHRoYXQgcHJldmVudHMgdXMgZnJvbSB1c2luZwo+ID4gPiA+
ID4gPiB4bWl0X3NrYigpIGRpcmVjdGx5Lgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+IFllcywgYnV0
IG15IGluaXRpYWwgaWRlYSB3YXMgdG8gbWFrZSBpdCBtb3JlIHBhcmFtZXRyaWMgYW5kIG5vdCBy
ZWxhdGVkIHRvIHRoZQo+ID4gPiA+ID4gdmlydGlvX25ldF9oZHIsIHNvIHRoZSAnaGRyX2xlbicg
Y291bGQgYmUgYSBwYXJhbWV0ZXIgYW5kIHRoZQo+ID4gPiA+ID4gJ251bV9idWZmZXJzJyBzaG91
bGQgYmUgaGFuZGxlZCBieSB0aGUgY2FsbGVyLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gTGV0
IG1lIGtub3cgaWYgeW91IGhhdmUgaW4gbWluZCBiZXR0ZXIgbmFtZXMgb3IgaWYgSSBzaG91bGQg
cHV0IHRoZXNlIGZ1bmN0aW9uCj4gPiA+ID4gPiA+ID4gaW4gYW5vdGhlciBwbGFjZS4KPiA+ID4g
PiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBJIHdvdWxkIGxpa2UgdG8gbGVhdmUgdGhlIGNvbnRyb2wg
cGFydCBjb21wbGV0ZWx5IHNlcGFyYXRlLCBzbywgZm9yIGV4YW1wbGUsCj4gPiA+ID4gPiA+ID4g
dGhlIHR3byBkcml2ZXJzIHdpbGwgbmVnb3RpYXRlIHRoZSBmZWF0dXJlcyBpbmRlcGVuZGVudGx5
IGFuZCB0aGV5IHdpbGwgY2FsbAo+ID4gPiA+ID4gPiA+IHRoZSByaWdodCB2aXJ0c2tiX3JlY2Vp
dmVfKigpIGZ1bmN0aW9uIGJhc2VkIG9uIHRoZSBuZWdvdGlhdGlvbi4KPiA+ID4gPiA+ID4gCj4g
PiA+ID4gPiA+IElmIGl0J3Mgb25lIHRoZSBpc3N1ZSBvZiBuZWdvdGlhdGlvbiwgd2UgY2FuIHNp
bXBseSBjaGFuZ2UgdGhlCj4gPiA+ID4gPiA+IHZpcnRuZXRfcHJvYmUoKSB0byBkZWFsIHdpdGgg
ZGlmZmVyZW50IGRldmljZXMuCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4g
PiBJIGFscmVhZHkgc3RhcnRlZCB0byB3b3JrIG9uIGl0LCBidXQgYmVmb3JlIHRvIGRvIG1vcmUg
c3RlcHMgYW5kIHNlbmQgYW4gUkZDCj4gPiA+ID4gPiA+ID4gcGF0Y2gsIEkgd291bGQgbGlrZSB0
byBoZWFyIHlvdXIgb3Bpbmlvbi4KPiA+ID4gPiA+ID4gPiBEbyB5b3UgdGhpbmsgdGhhdCBtYWtl
cyBzZW5zZT8KPiA+ID4gPiA+ID4gPiBEbyB5b3Ugc2VlIGFueSBpc3N1ZSBvciBhIGJldHRlciBz
b2x1dGlvbj8KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEkgc3RpbGwgdGhpbmsgd2UgbmVlZCB0
byBzZWVrIGEgd2F5IG9mIGFkZGluZyBzb21lIGNvZGVzIG9uIHZpcnRpby1uZXQuYwo+ID4gPiA+
ID4gPiBkaXJlY3RseSBpZiB0aGVyZSdzIG5vIGh1Z2UgZGlmZmVyZW50IGluIHRoZSBwcm9jZXNz
aW5nIG9mIFRYL1JYLiBUaGF0IHdvdWxkCj4gPiA+ID4gPiA+IHNhdmUgdXMgYSBsb3QgdGltZS4K
PiA+ID4gPiA+IEFmdGVyIHRoZSByZWFkaW5nIG9mIHRoZSBidWZmZXJzIGZyb20gdGhlIHZpcnRx
dWV1ZSBJIHRoaW5rIHRoZSBwcm9jZXNzCj4gPiA+ID4gPiBpcyBzbGlnaHRseSBkaWZmZXJlbnQs
IGJlY2F1c2UgdmlydGlvLW5ldCB3aWxsIGludGVyZmFjZSB3aXRoIHRoZSBuZXR3b3JrCj4gPiA+
ID4gPiBzdGFjaywgd2hpbGUgdmlydGlvLXZzb2NrIHdpbGwgaW50ZXJmYWNlIHdpdGggdGhlIHZz
b2NrLWNvcmUgKHNvY2tldCkuCj4gPiA+ID4gPiBTbyB0aGUgdmlydGlvLXZzb2NrIGltcGxlbWVu
dHMgdGhlIGZvbGxvd2luZzoKPiA+ID4gPiA+IC0gY29udHJvbCBmbG93IG1lY2hhbmlzbSB0byBh
dm9pZCB0byBsb29zZSBwYWNrZXRzLCBpbmZvcm1pbmcgdGhlIHBlZXIKPiA+ID4gPiA+ICAgIGFi
b3V0IHRoZSBhbW91bnQgb2YgbWVtb3J5IGF2YWlsYWJsZSBpbiB0aGUgcmVjZWl2ZSBxdWV1ZSB1
c2luZyBzb21lCj4gPiA+ID4gPiAgICBmaWVsZHMgaW4gdGhlIHZpcnRpb192c29ja19oZHIKPiA+
ID4gPiA+IC0gZGUtbXVsdGlwbGV4aW5nIHBhcnNpbmcgdGhlIHZpcnRpb192c29ja19oZHIgYW5k
IGNob29zaW5nIHRoZSByaWdodAo+ID4gPiA+ID4gICAgc29ja2V0IGRlcGVuZGluZyBvbiB0aGUg
cG9ydAo+ID4gPiA+ID4gLSBzb2NrZXQgc3RhdGUgaGFuZGxpbmcKPiA+IAo+ID4gCj4gPiBJIHRo
aW5rIGl0J3MganVzdCBhIGJyYW5jaCwgZm9yIGV0aGVybmV0LCBnbyBmb3IgbmV0d29ya2luZyBz
dGFjay4gb3RoZXJ3aXNlCj4gPiBnbyBmb3IgdnNvY2sgY29yZT8KPiA+IAo+IAo+IFllcywgdGhh
dCBzaG91bGQgd29yay4KPiAKPiBTbywgSSBzaG91bGQgcmVmYWN0b3IgdGhlIGZ1bmN0aW9ucyB0
aGF0IGNhbiBiZSBjYWxsZWQgYWxzbyBmcm9tIHRoZSB2c29jawo+IGNvcmUsIGluIG9yZGVyIHRv
IHJlbW92ZSAic3RydWN0IG5ldF9kZXZpY2UgKmRldiIgcGFyYW1ldGVyLgo+IE1heWJlIGNyZWF0
aW5nIHNvbWUgd3JhcHBlcnMgZm9yIHRoZSBuZXR3b3JrIHN0YWNrLgo+IAo+IE90aGVyd2lzZSBJ
IHNob3VsZCBjcmVhdGUgYSBmYWtlIG5ldF9kZXZpY2UgZm9yIHZzb2NrX2NvcmUuCj4gCj4gV2hh
dCBkbyB5b3Ugc3VnZ2VzdD8KCk5laXRoZXIuCgpJIHRoaW5rIHdoYXQgSmFzb24gd2FzIHNheWlu
ZyBhbGwgYWxvbmcgaXMgdGhpczoKCnZpcnRpbyBuZXQgZG9lc24ndCBhY3R1YWxseSBsb3NlIHBh
Y2tldHMsIGF0IGxlYXN0IG1vc3QKb2YgdGhlIHRpbWUuIEFuZCBpdCBhY3R1YWxseSBtb3N0IG9m
IHRoZSB0aW1lCnBhc3NlcyBhbGwgcGFja2V0cyB0byBob3N0LiBTbyBpdCdzIHBvc3NpYmxlIHRv
IHVzZSBhIHZpcnRpbyBuZXQKZGV2aWNlIChwb3NzaWJseSB3aXRoIGEgZmVhdHVyZSBmbGFnIHRo
YXQgc2F5cyAiZG9lcyBub3QgbG9zZSBwYWNrZXRzLAphbGwgcGFja2V0cyBnbyB0byBob3N0Iikg
YW5kIGJ1aWxkIHZzb2NrIG9uIHRvcC4KCmFuZCBhbGwgb2YgdGhpcyBpcyBuaWNlLCBidXQgZG9u
J3QgZXhwZWN0IGFueXRoaW5nIGVhc3ksCm9yIGFueSBxdWljayByZXN1bHRzLgoKQWxzbywgaW4g
YSBzZW5zZSBpdCdzIGEgbWlzc2VkIG9wcG9ydHVuaXR5OiB3ZSBjb3VsZCBjdXQgb3V0IGEgbG90
Cm9mIGZhdCBhbmQgc2VlIGp1c3QgaG93IGZhc3QgY2FuIGEgcHJvdG9jb2wgdGhhdCBpcyBjb21w
bGV0ZWx5Cm5ldyBhbmQgc2VwYXJhdGUgZnJvbSBuZXR3b3JraW5nIHN0YWNrIGdvLgpJbnN0ZWFk
IHZzb2NrIGltcGxlbWVudGF0aW9uIGNhcnJpZXMgc28gbXVjaCBiYWdnYWdlIGZyb20gYm90aApu
ZXR3b3JraW5nIHN0YWNrIC0gc3VjaCBhcyBzb2Z0aXJxIHByb2Nlc3NpbmcgLSBhbmQgaXRzZWxm
IHN1Y2ggYXMKd29ya3F1ZXVlcywgZ2xvYmFsIHN0YXRlIGFuZCBjcnVkZSBsb2NraW5nIC0gdG8g
dGhlIHBvaW50IHdoZXJlCml0J3MgYWN0dWFsbHkgc2xvd2VyIHRoYW4gVENQLgoKPiA+IAo+ID4g
PiA+ID4gCj4gPiA+ID4gPiBXZSBjYW4gdXNlIHRoZSB2aXJ0aW8tbmV0IGFzIHRyYW5zcG9ydCwg
YnV0IHdlIHNob3VsZCBhZGQgYSBsb3Qgb2YKPiA+ID4gPiA+IGNvZGUgdG8gc2tpcCAibmV0IGRl
dmljZSIgc3R1ZmYgd2hlbiBpdCBpcyB1c2VkIGJ5IHRoZSB2aXJ0aW8tdnNvY2suCj4gPiAKPiA+
IAo+ID4gVGhpcyBjb3VsZCBiZSBhbm90aGVyIGNob2ljZSwgYnV0IGNvbnNpZGVyIGl0IHdhcyBu
b3QgdHJhbnNwYXJlbnQgdG8gdGhlCj4gPiBhZG1pbiBhbmQgcmVxdWlyZSBuZXcgZmVhdHVyZXMs
IHdlIG1heSBzZWVrIGEgdHJhbnNwYXJlbnQgc29sdXRpb24gaGVyZS4KPiA+IAo+ID4gCj4gPiA+
ID4gPiBUaGlzIGNvdWxkIGJyZWFrIHNvbWV0aGluZyBpbiB2aXJ0aW8tbmV0LCBmb3IgdGhpcyBy
ZWFzb24sIEkgdGhvdWdodCB0byByZXVzZQo+ID4gPiA+ID4gb25seSB0aGUgc2VuZC9yZWN2IGZ1
bmN0aW9ucyBzdGFydGluZyBmcm9tIHRoZSBpZGVhIHRvIHNwbGl0IHRoZSB2aXJ0aW8tbmV0Cj4g
PiA+ID4gPiBkcml2ZXIgaW4gdHdvIHBhcnRzOgo+ID4gPiA+ID4gYS4gb25lIHdpdGggYWxsIHN0
dWZmIHJlbGF0ZWQgdG8gdGhlIG5ldHdvcmsgc3RhY2sKPiA+ID4gPiA+IGIuIG9uZSB3aXRoIHRo
ZSBzdHVmZiBuZWVkZWQgdG8gY29tbXVuaWNhdGUgd2l0aCB0aGUgaG9zdAo+ID4gPiA+ID4gCj4g
PiA+ID4gPiBBbmQgdXNlIHNrYnVmZiB0byBjb21tdW5pY2F0ZSBiZXR3ZWVuIHBhcnRzLiBJbiB0
aGlzIHdheSwgdmlydGlvLXZzb2NrCj4gPiA+ID4gPiBjYW4gdXNlIG9ubHkgdGhlIGIgcGFydC4K
PiA+ID4gPiA+IAo+ID4gPiA+ID4gTWF5YmUgd2UgY2FuIGRvIHRoaXMgc3BsaXQgaW4gYSBiZXR0
ZXIgd2F5LCBidXQgSSdtIG5vdCBzdXJlIGl0IGlzCj4gPiA+ID4gPiBzaW1wbGUuCj4gPiA+ID4g
PiAKPiA+ID4gPiA+IFRoYW5rcywKPiA+ID4gPiA+IFN0ZWZhbm8KPiA+ID4gPiBGcmFua2x5LCBz
a2IgaXMgYSBodWdlIHN0cnVjdHVyZSB3aGljaCBhZGRzIGEgbG90IG9mCj4gPiA+ID4gb3Zlcmhl
YWQuIEkgYW0gbm90IHN1cmUgdGhhdCB1c2luZyBpdCBpcyBzdWNoIGEgZ3JlYXQgaWRlYQo+ID4g
PiA+IGlmIGJ1aWxkaW5nIGEgZGV2aWNlIHRoYXQgZG9lcyBub3QgaGF2ZSB0byBpbnRlcmZhY2UK
PiA+ID4gPiB3aXRoIHRoZSBuZXR3b3JraW5nIHN0YWNrLgo+ID4gCj4gPiAKPiA+IEkgYmVsaWV2
ZSB2c29jayBpcyBtYWlubHkgdXNlZCBmb3Igc3RyZWFtIHBlcmZvcm1hbmNlIG5vdCBmb3IgUFBT
LiBTbyB0aGUKPiA+IGltcGFjdCBzaG91bGQgYmUgbWluaW1hbC4gV2UgY2FuIHVzZSBvdGhlciBt
ZXRhZGF0YSwganVzdCBuZWVkIGJyYW5jaCBpbgo+ID4gcmVjdl94eHgoKS4KPiA+IAo+IAo+IFll
cywgSSB0aGluayBzdHJlYW0gcGVyZm9ybWFuY2UgaXMgdGhlIGNhc2UuCj4gCj4gPiAKPiA+ID4g
VGhhbmtzIGZvciB0aGUgYWR2aWNlIQo+ID4gPiAKPiA+ID4gPiBTbyBJIGFncmVlIHdpdGggSmFz
b24gaW4gdGhlb3J5LiBUbyBjbGFyaWZ5LCBoZSBpcyBiYXNpY2FsbHkgc2F5aW5nCj4gPiA+ID4g
Y3VycmVudCBpbXBsZW1lbnRhdGlvbiBpcyBhbGwgd3JvbmcsIGl0IHNob3VsZCBiZSBhIHByb3Rv
Y29sIGFuZCB3ZQo+ID4gPiA+IHNob3VsZCB0ZWFjaCBuZXR3b3JraW5nIHN0YWNrIHRoYXQgdGhl
cmUgYXJlIHJlbGlhYmxlIG5ldCBkZXZpY2VzIHRoYXQKPiA+ID4gPiBoYW5kbGUganVzdCB0aGlz
IHByb3RvY29sLiBXZSBjb3VsZCBhZGQgYSBmbGFnIGluIHZpcnRpbyBuZXQgdGhhdAo+ID4gPiA+
IHdpbGwgc2F5IGl0J3Mgc3VjaCBhIGRldmljZS4KPiA+ID4gPiAKPiA+ID4gPiBXaGV0aGVyIGl0
J3MgZG9hYmxlLCBJIGRvbid0IGtub3csIGFuZCBpdCdzIGRlZmluaXRlbHkgbm90IHNpbXBsZSAt
IGluCj4gPiA+ID4gcGFydGljdWxhciB5b3Ugd2lsbCBoYXZlIHRvIGFsc28gcmUtaW1wbGVtZW50
IGV4aXN0aW5nIGRldmljZXMgaW4gdGhlc2UKPiA+ID4gPiB0ZXJtcywgYW5kIG5vdCBqdXN0IHZp
cnRpbyAtIHZtd2FyZSB2c29jayB0b28uCj4gPiAKPiA+IAo+ID4gTWVyZ2luZyB2c29jayBwcm90
b2NvbCB0byBleGlzdCBuZXR3b3JraW5nIHN0YWNrIGNvdWxkIGJlIGEgbG9uZyB0ZXJtIGdvYWws
Cj4gPiBJIGJlbGlldmUgZm9yIHRoZSBmaXJzdCBwaGFzZSwgd2UgY2FuIHNlZWsgdG8gdXNlIHZp
cnRpby1uZXQgZmlyc3QuCj4gPgo+IAo+IFllcywgSSBhZ3JlZS4KPiAKPiA+IAo+ID4gPiA+IAo+
ID4gPiA+IElmIHlvdSB3YW50IHRvIGRvIGEgUE9DIHlvdSBjYW4gYWRkIGEgbmV3IGFkZHJlc3Mg
ZmFtaWx5LAo+ID4gPiA+IHRoYXQncyBlYXNpZXIuCj4gPiA+IFZlcnkgaW50ZXJlc3RpbmchCj4g
PiA+IEkgYWdyZWUgd2l0aCB5b3UuIEluIHRoaXMgd2F5IHdlIGNhbiBjb21wbGV0ZWx5IHNwbGl0
IHRoZSBwcm90b2NvbAo+ID4gPiBsb2dpYywgZnJvbSB0aGUgZGV2aWNlLgo+ID4gPiAKPiA+ID4g
QXMgeW91IHNhaWQsIGl0IHdpbGwgbm90IHNpbXBsZSB0byBkbywgYnV0IGNhbiBiZSBhbiBvcHBv
cnR1bml0eSB0byBsZWFybgo+ID4gPiBiZXR0ZXIgdGhlIExpbnV4IG5ldHdvcmtpbmcgc3RhY2sh
Cj4gPiA+IEknbGwgdHJ5IHRvIGRvIGEgUG9DIHdpdGggQUZfVlNPQ0syIHRoYXQgd2lsbCB1c2Ug
dGhlIHZpcnRpby1uZXQuCj4gPiAKPiA+IAo+ID4gSSBzdWdnZXN0IHRvIGRvIHRoaXMgc3RlcCBi
eSBzdGVwOgo+ID4gCj4gPiAxKSB1c2UgdmlydGlvLW5ldCBidXQga2VlcCBzb21lIHByb3RvY29s
IGxvZ2ljCj4gPiAKPiA+IDIpIHNlcGFyYXRlIHByb3RvY29sIGxvZ2ljIGFuZCBtZXJnZSBpdCB0
byBleGlzdCBMaW51eCBuZXR3b3JraW5nIHN0YWNrCj4gCj4gTWFrZSBzZW5zZSwgdGhhbmtzIGZv
ciB0aGUgc3VnZ2VzdGlvbnMsIEknbGwgdHJ5IHRvIGRvIHRoZXNlIHN0ZXBzIQo+IAo+IFRoYW5r
cywKPiBTdGVmYW5vCgoKQW4gYWx0ZXJuYXRpdmUgaXMgbG9vayBhdCBzb3VyY2VzIG9mIG92ZXJo
ZWFkIGluIHZzb2NrIGFuZCBnZXQgcmlkIG9mCnRoZW0sIG9yIHJld3JpdGUgaXQgZnJvbSBzY3Jh
dGNoIGZvY3VzaW5nIG9uIHBlcmZvcm1hbmNlLgoKCi0tIApNU1QKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0
ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
