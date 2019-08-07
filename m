Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B89844CF
	for <lists.virtualization@lfdr.de>; Wed,  7 Aug 2019 08:50:11 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 12C47E63;
	Wed,  7 Aug 2019 06:50:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 464FEE61
	for <virtualization@lists.linux-foundation.org>;
	Wed,  7 Aug 2019 06:50:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E1F1C82F
	for <virtualization@lists.linux-foundation.org>;
	Wed,  7 Aug 2019 06:50:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2729730DDBD8;
	Wed,  7 Aug 2019 06:50:03 +0000 (UTC)
Received: from [10.72.12.139] (ovpn-12-139.pek2.redhat.com [10.72.12.139])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7BBF825263;
	Wed,  7 Aug 2019 06:49:58 +0000 (UTC)
Subject: Re: [PATCH V2 7/9] vhost: do not use RCU to synchronize MMU notifier
	with worker
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20190731084655.7024-1-jasowang@redhat.com>
	<20190731084655.7024-8-jasowang@redhat.com>
	<20190731123935.GC3946@ziepe.ca>
	<7555c949-ae6f-f105-6e1d-df21ddae9e4e@redhat.com>
	<20190731193057.GG3946@ziepe.ca>
	<a3bde826-6329-68e4-2826-8a9de4c5bd1e@redhat.com>
	<20190801141512.GB23899@ziepe.ca>
	<42ead87b-1749-4c73-cbe4-29dbeb945041@redhat.com>
	<20190802124613.GA11245@ziepe.ca>
	<11b2a930-eae4-522c-4132-3f8a2da05666@redhat.com>
	<20190806120416.GB11627@ziepe.ca>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <4b448aa5-2c92-a6ca-67d6-d30fad67254c@redhat.com>
Date: Wed, 7 Aug 2019 14:49:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190806120416.GB11627@ziepe.ca>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Wed, 07 Aug 2019 06:50:03 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org
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

Ck9uIDIwMTkvOC82IOS4i+WNiDg6MDQsIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiBPbiBNb24s
IEF1ZyAwNSwgMjAxOSBhdCAxMjoyMDo0NVBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+PiBP
biAyMDE5LzgvMiDkuIvljYg4OjQ2LCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4+PiBPbiBGcmks
IEF1ZyAwMiwgMjAxOSBhdCAwNTo0MDowN1BNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+Pj4+
PiBUaGlzIG11c3QgYmUgYSBwcm9wZXIgYmFycmllciwgbGlrZSBhIHNwaW5sb2NrLCBtdXRleCwg
b3IKPj4+Pj4gc3luY2hyb25pemVfcmN1Lgo+Pj4+IEkgc3RhcnQgd2l0aCBzeW5jaHJvbml6ZV9y
Y3UoKSBidXQgYm90aCB5b3UgYW5kIE1pY2hhZWwgcmFpc2Ugc29tZQo+Pj4+IGNvbmNlcm4uCj4+
PiBJJ3ZlIGFsc28gaWRseSB3b25kZXJlZCBpZiBjYWxsaW5nIHN5bmNocm9uaXplX3JjdSgpIHVu
ZGVyIHRoZSB2YXJpb3VzCj4+PiBtbSBsb2NrcyBpcyBhIGRlYWRsb2NrIHNpdHVhdGlvbi4KPj4K
Pj4gTWF5YmUsIHRoYXQncyB3aHkgSSBzdWdnZXN0IHRvIHVzZSB2aG9zdF93b3JrX2ZsdXNoKCkg
d2hpY2ggaXMgbXVjaAo+PiBsaWdodHdlaWdodCBjYW4gY2FuIGFjaGlldmUgdGhlIHNhbWUgZnVu
Y3Rpb24uIEl0IGNhbiBndWFyYW50ZWUgYWxsIHByZXZpb3VzCj4+IHdvcmsgaGFzIGJlZW4gcHJv
Y2Vzc2VkIGFmdGVyIHZob3N0X3dvcmtfZmx1c2goKSByZXR1cm4uCj4gSWYgdGhpbmdzIGFyZSBh
bHJlYWR5IHJ1bm5pbmcgaW4gYSB3b3JrLCB0aGVuIHllcywgeW91IGNhbiBwaWdneWJhY2sKPiBv
biB0aGUgZXhpc3Rpbmcgc3BpbmxvY2tzIGluc2lkZSB0aGUgd29ya3F1ZXVlIGFuZCBiZSBPawo+
Cj4gSG93ZXZlciwgaWYgdGhhdCB3b3JrIGlzIGRvaW5nIGFueSBjb3B5X2Zyb21fdXNlciwgdGhl
biB0aGUgZmx1c2gKPiBiZWNvbWVzIGRlcGVuZGVudCBvbiBzd2FwIGFuZCBpdCB3b24ndCB3b3Jr
IGFnYWluLi4uCgoKWWVzIGl0IGRvIGNvcHlfZnJvbV91c2VyKCksIHNvIHdlIGNhbid0IGRvIHRo
aXMuCgoKPgo+Pj4+IDEpIHNwaW5sb2NrOiBhZGQgbG90cyBvZiBvdmVyaGVhZCBvbiBkYXRhcGF0
aCwgdGhpcyBsZWFkcyAwIHBlcmZvcm1hbmNlCj4+Pj4gaW1wcm92ZW1lbnQuCj4+PiBJIHRoaW5r
IHRoZSB0b3BpYyBoZXJlIGlzIGNvcnJlY3RuZXNzIG5vdCBwZXJmb3JtYW5jZSBpbXByb3ZlbWVu
dD4KPiAgIAo+PiBCdXQgdGhlIHdob2xlIHNlcmllcyBpcyB0byBzcGVlZCB1cCB2aG9zdC4KPiBT
bz8gU3RhcnRpbmcgd2l0aCBhIHdob2xlIGJ1bmNoIG9mIGNyYXp5LCBwb3NzaWJseSBicm9rZW4s
IGxvY2tpbmcgYW5kCj4gY2xhaW1pbmcgYSBwZXJmb3JtYW5jZSB3aW4gaXMgbm90IHJlYXNvbmFi
bGUuCgoKWWVzLCBJIGFkbWl0IHRoaXMgcGF0Y2ggaXMgdHJpY2t5LCBJJ20gbm90IGdvaW5nIHRv
IHB1c2ggdGhpcy4gV2lsbCBwb3N0IAphIFYzLgoKCj4KPj4gU3BpbmxvY2sgaXMgY29ycmVjdCBi
dXQgbWFrZSB0aGUgd2hvbGUgc2VyaWVzIG1lYW5pbmdsZXNzIGNvbnNpZGVyIGl0IHdvbid0Cj4+
IGJyaW5nIGFueSBwZXJmb3JtYW5jZSBpbXByb3ZlbWVudC4KPiBZb3UgY2FuJ3QgaW52ZW50IGEg
ZmFzdGVyIHNwaW5sb2NrIGJ5IG9wZW5jb2Rpbmcgc29tZSB3aWxkCj4gc2NoZW1lLiBUaGVyZSBp
cyBub3RoaW5nIHNwZWNpYWwgYWJvdXQgdGhlIHVzYWdlIGhlcmUsIGl0IG5lZWRzIGEKPiBibG9j
a2luZyBsb2NrLCBwbGFpbiBhbmQgc2ltcGxlLgo+Cj4gSmFzb24KCgpXaWxsIHBvc3QgVjMuIExl
dCdzIHNlZSBpZiB5b3UgYXJlIGhhcHB5IHdpdGggdGhhdCB2ZXJzaW9uLgoKVGhhbmtzCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRp
b24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3Jn
Cmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1
YWxpemF0aW9u
