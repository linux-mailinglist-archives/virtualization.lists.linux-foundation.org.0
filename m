Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 425A781114
	for <lists.virtualization@lfdr.de>; Mon,  5 Aug 2019 06:36:56 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D0CA7C7C;
	Mon,  5 Aug 2019 04:36:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7279DB50
	for <virtualization@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 04:36:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 23F795E4
	for <virtualization@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 04:36:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9FDEA30A5408;
	Mon,  5 Aug 2019 04:36:47 +0000 (UTC)
Received: from [10.72.12.115] (ovpn-12-115.pek2.redhat.com [10.72.12.115])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B7AA560856;
	Mon,  5 Aug 2019 04:36:42 +0000 (UTC)
Subject: Re: [PATCH V2 7/9] vhost: do not use RCU to synchronize MMU notifier
	with worker
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>
References: <20190731084655.7024-1-jasowang@redhat.com>
	<20190731084655.7024-8-jasowang@redhat.com>
	<20190731123935.GC3946@ziepe.ca>
	<7555c949-ae6f-f105-6e1d-df21ddae9e4e@redhat.com>
	<20190731193057.GG3946@ziepe.ca>
	<a3bde826-6329-68e4-2826-8a9de4c5bd1e@redhat.com>
	<20190801141512.GB23899@ziepe.ca>
	<42ead87b-1749-4c73-cbe4-29dbeb945041@redhat.com>
	<20190802124613.GA11245@ziepe.ca>
	<20190802100414-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <e8ecb811-6653-cff4-bc11-81f4ccb0dbbf@redhat.com>
Date: Mon, 5 Aug 2019 12:36:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802100414-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Mon, 05 Aug 2019 04:36:47 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-mm@kvack.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
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

Ck9uIDIwMTkvOC8yIOS4i+WNiDEwOjI3LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
RnJpLCBBdWcgMDIsIDIwMTkgYXQgMDk6NDY6MTNBTSAtMDMwMCwgSmFzb24gR3VudGhvcnBlIHdy
b3RlOgo+PiBPbiBGcmksIEF1ZyAwMiwgMjAxOSBhdCAwNTo0MDowN1BNICswODAwLCBKYXNvbiBX
YW5nIHdyb3RlOgo+Pj4+IFRoaXMgbXVzdCBiZSBhIHByb3BlciBiYXJyaWVyLCBsaWtlIGEgc3Bp
bmxvY2ssIG11dGV4LCBvcgo+Pj4+IHN5bmNocm9uaXplX3JjdS4KPj4+Cj4+PiBJIHN0YXJ0IHdp
dGggc3luY2hyb25pemVfcmN1KCkgYnV0IGJvdGggeW91IGFuZCBNaWNoYWVsIHJhaXNlIHNvbWUK
Pj4+IGNvbmNlcm4uCj4+IEkndmUgYWxzbyBpZGx5IHdvbmRlcmVkIGlmIGNhbGxpbmcgc3luY2hy
b25pemVfcmN1KCkgdW5kZXIgdGhlIHZhcmlvdXMKPj4gbW0gbG9ja3MgaXMgYSBkZWFkbG9jayBz
aXR1YXRpb24uCj4+Cj4+PiBUaGVuIEkgdHJ5IHNwaW5sb2NrIGFuZCBtdXRleDoKPj4+Cj4+PiAx
KSBzcGlubG9jazogYWRkIGxvdHMgb2Ygb3ZlcmhlYWQgb24gZGF0YXBhdGgsIHRoaXMgbGVhZHMg
MCBwZXJmb3JtYW5jZQo+Pj4gaW1wcm92ZW1lbnQuCj4+IEkgdGhpbmsgdGhlIHRvcGljIGhlcmUg
aXMgY29ycmVjdG5lc3Mgbm90IHBlcmZvcm1hbmNlIGltcHJvdmVtZW50Cj4gVGhlIHRvcGljIGlz
IHdoZXRoZXIgd2Ugc2hvdWxkIHJldmVydAo+IGNvbW1pdCA3ZjQ2NjAzMmRjOSAoInZob3N0OiBh
Y2Nlc3MgdnEgbWV0YWRhdGEgdGhyb3VnaCBrZXJuZWwgdmlydHVhbCBhZGRyZXNzIikKPgo+IG9y
IGtlZXAgaXQgaW4uIFRoZSBvbmx5IHJlYXNvbiB0byBrZWVwIGl0IGlzIHBlcmZvcm1hbmNlLgoK
Ck1heWJlIGl0J3MgdGltZSB0byBpbnRyb2R1Y2UgdGhlIGNvbmZpZyBvcHRpb24/CgoKPgo+IE5v
dyBhcyBsb25nIGFzIGFsbCB0aGlzIGNvZGUgaXMgZGlzYWJsZWQgYW55d2F5LCB3ZSBjYW4gZXhw
ZXJpbWVudCBhCj4gYml0Lgo+Cj4gSSBwZXJzb25hbGx5IGZlZWwgd2Ugd291bGQgYmUgYmVzdCBz
ZXJ2ZWQgYnkgaGF2aW5nIHR3byBjb2RlIHBhdGhzOgo+Cj4gLSBBY2Nlc3MgdG8gVk0gbWVtb3J5
IGRpcmVjdGx5IG1hcHBlZCBpbnRvIGtlcm5lbAo+IC0gQWNjZXNzIHRvIHVzZXJzcGFjZQo+Cj4K
PiBIYXZpbmcgaXQgYWxsIGNsZWFubHkgc3BsaXQgd2lsbCBhbGxvdyBhIGJ1bmNoIG9mIG9wdGlt
aXphdGlvbnMsIGZvcgo+IGV4YW1wbGUgZm9yIHllYXJzIG5vdyB3ZSBwbGFubmVkIHRvIGJlIGFi
bGUgdG8gcHJvY2VzcyBhbiBpbmNvbWluZyBzaG9ydAo+IHBhY2tldCBkaXJlY3RseSBvbiBzb2Z0
aXJxIHBhdGgsIG9yIGFuIG91dGdvaW5nIG9uIGRpcmVjdGx5IHdpdGhpbgo+IGV2ZW50ZmQuCgoK
SXQncyBub3QgaGFyZCBjb25zaWRlciB3ZSd2ZSBhbHJlYWR5IGhhZCBvdXIgb3duIGFjY3Nzb3Jz
LiBCdXQgdGhlIApxdWVzdGlvbiBpcyAoYXMgYXNrZWQgaW4gYW5vdGhlciB0aHJlYWQpLCBkbyB5
b3Ugd2FudCBwZXJtYW5lbnQgR1VQIG9yIApzdGlsbCB1c2UgTU1VIG5vdGlmaWVycy4KClRoYW5r
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVh
bGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRp
b24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3ZpcnR1YWxpemF0aW9u
