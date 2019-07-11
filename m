Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 532C1652A0
	for <lists.virtualization@lfdr.de>; Thu, 11 Jul 2019 09:47:34 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 482B14C09;
	Thu, 11 Jul 2019 07:47:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 321BA4A41
	for <virtualization@lists.linux-foundation.org>;
	Thu, 11 Jul 2019 07:37:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C0105CF
	for <virtualization@lists.linux-foundation.org>;
	Thu, 11 Jul 2019 07:37:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3F0B9307D983;
	Thu, 11 Jul 2019 07:37:08 +0000 (UTC)
Received: from [10.72.12.56] (ovpn-12-56.pek2.redhat.com [10.72.12.56])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 11B9F5D9DC;
	Thu, 11 Jul 2019 07:37:01 +0000 (UTC)
Subject: Re: [RFC] virtio-net: share receive_*() and add_recvbuf_*() with
	virtio-vsock
To: Stefano Garzarella <sgarzare@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
References: <20190710153707.twmzgmwqqw3pstos@steredhat>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <9574bc38-4c5c-2325-986b-430e4a2b6661@redhat.com>
Date: Thu, 11 Jul 2019 15:37:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190710153707.twmzgmwqqw3pstos@steredhat>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Thu, 11 Jul 2019 07:37:08 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, virtualization@lists.linux-foundation.org
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

Ck9uIDIwMTkvNy8xMCDkuIvljYgxMTozNywgU3RlZmFubyBHYXJ6YXJlbGxhIHdyb3RlOgo+IEhp
LAo+IGFzIEphc29uIHN1Z2dlc3RlZCBzb21lIG1vbnRocyBhZ28sIEkgbG9va2VkIGJldHRlciBh
dCB0aGUgdmlydGlvLW5ldCBkcml2ZXIgdG8KPiB1bmRlcnN0YW5kIGlmIHdlIGNhbiByZXVzZSBz
b21lIHBhcnRzIGFsc28gaW4gdGhlIHZpcnRpby12c29jayBkcml2ZXIsIHNpbmNlIHdlCj4gaGF2
ZSBzaW1pbGFyIGNoYWxsZW5nZXMgKG1lcmdlYWJsZSBidWZmZXJzLCBwYWdlIGFsbG9jYXRpb24s
IHNtYWxsCj4gcGFja2V0cywgZXRjLikuCj4KPiBJbml0aWFsbHksIEkgd291bGQgYWRkIHRoZSBz
a2J1ZmYgaW4gdGhlIHZpcnRpby12c29jayBpbiBvcmRlciB0byByZS11c2UKPiByZWNlaXZlXyoo
KSBmdW5jdGlvbnMuCgoKWWVzLCB0aGF0IHdpbGwgYmUgYSBnb29kIHN0ZXAuCgoKPiBUaGVuIEkg
d291bGQgbW92ZSByZWNlaXZlX1tzbWFsbCwgYmlnLCBtZXJnZWFibGVdKCkgYW5kCj4gYWRkX3Jl
Y3ZidWZfW3NtYWxsLCBiaWcsIG1lcmdlYWJsZV0oKSBvdXRzaWRlIG9mIHZpcnRpby1uZXQgZHJp
dmVyLCBpbiBvcmRlciB0bwo+IGNhbGwgdGhlbSBhbHNvIGZyb20gdmlydGlvLXZzb2NrLiBJIG5l
ZWQgdG8gZG8gc29tZSByZWZhY3RvcmluZyAoZS5nLiBsZWF2ZSB0aGUKPiBYRFAgcGFydCBvbiB0
aGUgdmlydGlvLW5ldCBkcml2ZXIpLCBidXQgSSB0aGluayBpdCBpcyBmZWFzaWJsZS4KPgo+IFRo
ZSBpZGVhIGlzIHRvIGNyZWF0ZSBhIHZpcnRpby1za2IuW2gsY10gd2hlcmUgcHV0IHRoZXNlIGZ1
bmN0aW9ucyBhbmQgYSBuZXcKPiBvYmplY3Qgd2hlcmUgc3RvcmVzIHNvbWUgYXR0cmlidXRlcyBu
ZWVkZWQgKGUuZy4gaGRyX2xlbiApIGFuZCBzdGF0dXMgKGUuZy4KPiBzb21lIGZpZWxkcyBvZiBz
dHJ1Y3QgcmVjZWl2ZV9xdWV1ZSkuCgoKTXkgdW5kZXJzdGFuZGluZyBpcyB3ZSBjb3VsZCBiZSBt
b3JlIGFtYml0aW91cyBoZXJlLiBEbyB5b3Ugc2VlIGFueSAKYmxvY2tlciBmb3IgcmV1c2luZyB2
aXJ0aW8tbmV0IGRpcmVjdGx5PyBJdCdzIGJldHRlciB0byByZXVzZSBub3Qgb25seSAKdGhlIGZ1
bmN0aW9ucyBidXQgYWxzbyB0aGUgbG9naWMgbGlrZSBOQVBJIHRvIGF2b2lkIHJlLWludmVudGlu
ZyAKc29tZXRoaW5nIGJ1Z2d5IGFuZCBkdXBsaWNhdGVkLgoKCj4gVGhpcyBpcyBhbiBpZGVhIG9m
IHZpcnRpby1za2IuaCB0aGF0Cj4gSSBoYXZlIGluIG1pbmQ6Cj4gICAgICBzdHJ1Y3QgdmlydHNr
YjsKCgpXaGF0IGZpZWxkcyBkbyB5b3Ugd2FudCB0byBzdG9yZSBpbiB2aXJ0c2tiPyBJdCBsb29r
cyB0byBiZSBleGlzdCAKc2tfYnVmZiBpcyBmbGV4aWJsZSBlbm91Z2ggdG8gdXM/CgoKPgo+ICAg
ICAgc3RydWN0IHNrX2J1ZmYgKnZpcnRza2JfcmVjZWl2ZV9zbWFsbChzdHJ1Y3QgdmlydHNrYiAq
dnMsIC4uLik7Cj4gICAgICBzdHJ1Y3Qgc2tfYnVmZiAqdmlydHNrYl9yZWNlaXZlX2JpZyhzdHJ1
Y3QgdmlydHNrYiAqdnMsIC4uLik7Cj4gICAgICBzdHJ1Y3Qgc2tfYnVmZiAqdmlydHNrYl9yZWNl
aXZlX21lcmdlYWJsZShzdHJ1Y3QgdmlydHNrYiAqdnMsIC4uLik7Cj4KPiAgICAgIGludCB2aXJ0
c2tiX2FkZF9yZWN2YnVmX3NtYWxsKHN0cnVjdCB2aXJ0c2tiKnZzLCAuLi4pOwo+ICAgICAgaW50
IHZpcnRza2JfYWRkX3JlY3ZidWZfYmlnKHN0cnVjdCB2aXJ0c2tiICp2cywgLi4uKTsKPiAgICAg
IGludCB2aXJ0c2tiX2FkZF9yZWN2YnVmX21lcmdlYWJsZShzdHJ1Y3QgdmlydHNrYiAqdnMsIC4u
Lik7Cj4KPiBGb3IgdGhlIEd1ZXN0LT5Ib3N0IHBhdGggaXQgc2hvdWxkIGJlIGVhc2llciwgc28g
bWF5YmUgSSBjYW4gYWRkIGEKPiAidmlydHNrYl9zZW5kKHN0cnVjdCB2aXJ0c2tiICp2cywgc3Ry
dWN0IHNrX2J1ZmYgKnNrYikiIHdpdGggYSBwYXJ0IG9mIHRoZSBjb2RlCj4gb2YgeG1pdF9za2Io
KS4KCgpJIG1heSBtaXNzIHNvbWV0aGluZywgYnV0IEkgZG9uJ3Qgc2VlIGFueSB0aGluZyB0aGF0
IHByZXZlbnRzIHVzIGZyb20gCnVzaW5nIHhtaXRfc2tiKCkgZGlyZWN0bHkuCgoKPgo+IExldCBt
ZSBrbm93IGlmIHlvdSBoYXZlIGluIG1pbmQgYmV0dGVyIG5hbWVzIG9yIGlmIEkgc2hvdWxkIHB1
dCB0aGVzZSBmdW5jdGlvbgo+IGluIGFub3RoZXIgcGxhY2UuCj4KPiBJIHdvdWxkIGxpa2UgdG8g
bGVhdmUgdGhlIGNvbnRyb2wgcGFydCBjb21wbGV0ZWx5IHNlcGFyYXRlLCBzbywgZm9yIGV4YW1w
bGUsCj4gdGhlIHR3byBkcml2ZXJzIHdpbGwgbmVnb3RpYXRlIHRoZSBmZWF0dXJlcyBpbmRlcGVu
ZGVudGx5IGFuZCB0aGV5IHdpbGwgY2FsbAo+IHRoZSByaWdodCB2aXJ0c2tiX3JlY2VpdmVfKigp
IGZ1bmN0aW9uIGJhc2VkIG9uIHRoZSBuZWdvdGlhdGlvbi4KCgpJZiBpdCdzIG9uZSB0aGUgaXNz
dWUgb2YgbmVnb3RpYXRpb24sIHdlIGNhbiBzaW1wbHkgY2hhbmdlIHRoZSAKdmlydG5ldF9wcm9i
ZSgpIHRvIGRlYWwgd2l0aCBkaWZmZXJlbnQgZGV2aWNlcy4KCgo+Cj4gSSBhbHJlYWR5IHN0YXJ0
ZWQgdG8gd29yayBvbiBpdCwgYnV0IGJlZm9yZSB0byBkbyBtb3JlIHN0ZXBzIGFuZCBzZW5kIGFu
IFJGQwo+IHBhdGNoLCBJIHdvdWxkIGxpa2UgdG8gaGVhciB5b3VyIG9waW5pb24uCj4gRG8geW91
IHRoaW5rIHRoYXQgbWFrZXMgc2Vuc2U/Cj4gRG8geW91IHNlZSBhbnkgaXNzdWUgb3IgYSBiZXR0
ZXIgc29sdXRpb24/CgoKSSBzdGlsbCB0aGluayB3ZSBuZWVkIHRvIHNlZWsgYSB3YXkgb2YgYWRk
aW5nIHNvbWUgY29kZXMgb24gdmlydGlvLW5ldC5jIApkaXJlY3RseSBpZiB0aGVyZSdzIG5vIGh1
Z2UgZGlmZmVyZW50IGluIHRoZSBwcm9jZXNzaW5nIG9mIFRYL1JYLiBUaGF0IAp3b3VsZCBzYXZl
IHVzIGEgbG90IHRpbWUuCgpUaGFua3MKCgo+Cj4gVGhhbmtzIGluIGFkdmFuY2UsCj4gU3RlZmFu
bwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFs
aXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlv
bi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8v
dmlydHVhbGl6YXRpb24=
