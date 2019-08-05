Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DE29881415
	for <lists.virtualization@lfdr.de>; Mon,  5 Aug 2019 10:22:03 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C0B04D82;
	Mon,  5 Aug 2019 08:21:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 814ACD6A
	for <virtualization@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 08:21:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C75895E4
	for <virtualization@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 08:21:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 41395309175E;
	Mon,  5 Aug 2019 08:21:55 +0000 (UTC)
Received: from [10.72.12.115] (ovpn-12-115.pek2.redhat.com [10.72.12.115])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 176741000321;
	Mon,  5 Aug 2019 08:21:49 +0000 (UTC)
Subject: Re: [PATCH V2 7/9] vhost: do not use RCU to synchronize MMU notifier
	with worker
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20190731084655.7024-1-jasowang@redhat.com>
	<20190731084655.7024-8-jasowang@redhat.com>
	<20190731123935.GC3946@ziepe.ca>
	<7555c949-ae6f-f105-6e1d-df21ddae9e4e@redhat.com>
	<20190731193057.GG3946@ziepe.ca>
	<a3bde826-6329-68e4-2826-8a9de4c5bd1e@redhat.com>
	<20190801141512.GB23899@ziepe.ca>
	<42ead87b-1749-4c73-cbe4-29dbeb945041@redhat.com>
	<20190802094331-mutt-send-email-mst@kernel.org>
	<6c3a0a1c-ce87-907b-7bc8-ec41bf9056d8@redhat.com>
	<20190805020752-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <817bad8f-6a7d-e192-3a3f-621de7b0300b@redhat.com>
Date: Mon, 5 Aug 2019 16:21:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190805020752-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Mon, 05 Aug 2019 08:21:55 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, netdev@vger.kernel.org,
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

Ck9uIDIwMTkvOC81IOS4i+WNiDI6MjgsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBN
b24sIEF1ZyAwNSwgMjAxOSBhdCAxMjozMzo0NVBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
PiBPbiAyMDE5LzgvMiDkuIvljYgxMDowMywgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+Pj4g
T24gRnJpLCBBdWcgMDIsIDIwMTkgYXQgMDU6NDA6MDdQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPj4+PiBCdHcsIEkgY29tZSB1cCBhbm90aGVyIGlkZWEsIHRoYXQgaXMgdG8gZGlzYWJsZSBw
cmVlbXB0aW9uIHdoZW4gdmhvc3QgdGhyZWFkCj4+Pj4gbmVlZCB0byBhY2Nlc3MgdGhlIG1lbW9y
eS4gVGhlbiByZWdpc3RlciBwcmVlbXB0IG5vdGlmaWVyIGFuZCBpZiB2aG9zdAo+Pj4+IHRocmVh
ZCBpcyBwcmVlbXB0ZWQsIHdlJ3JlIHN1cmUgbm8gb25lIHdpbGwgYWNjZXNzIHRoZSBtZW1vcnkg
YW5kIGNhbiBkbyB0aGUKPj4+PiBjbGVhbnVwLgo+Pj4gR3JlYXQsIG1vcmUgbm90aWZpZXJzIDoo
Cj4+Pgo+Pj4gTWF5YmUgY2FuIGxpdmUgd2l0aAo+Pj4gMS0gZGlzYWJsZSBwcmVlbXB0aW9uIHdo
aWxlIHVzaW5nIHRoZSBjYWNoZWQgcG9pbnRlcgo+Pj4gMi0gdGVhY2ggdmhvc3QgdG8gcmVjb3Zl
ciBmcm9tIG1lbW9yeSBhY2Nlc3MgZmFpbHVyZXMsCj4+PiAgICAgIGJ5IHN3aXRjaGluZyB0byBy
ZWd1bGFyIGZyb20vdG8gdXNlciBwYXRoCj4+Cj4+IEkgZG9uJ3QgZ2V0IHRoaXMsIEkgYmVsaWV2
ZSB3ZSB3YW50IHRvIHJlY292ZXIgZnJvbSByZWd1bGFyIGZyb20vdG8gdXNlcgo+PiBwYXRoLCBp
c24ndCBpdD8KPiBUaGF0IChkaXNhYmxlIGNvcHkgdG8vZnJvbSB1c2VyIGNvbXBsZXRlbHkpIHdv
dWxkIGJlIGEgbmljZSB0byBoYXZlCj4gc2luY2UgaXQgd291bGQgcmVkdWNlIHRoZSBhdHRhY2sg
c3VyZmFjZSBvZiB0aGUgZHJpdmVyLCBidXQgZS5nLiB5b3VyCj4gY29kZSBhbHJlYWR5IGRvZXNu
J3QgZG8gdGhhdC4KPgoKWWVzIHNpbmNlIGl0IHJlcXVpcmVzIGEgbG90IG9mIGNoYW5nZXMuCgoK
Pgo+Pj4gU28gaWYgeW91IHdhbnQgdG8gdHJ5IHRoYXQsIGZpbmUgc2luY2UgaXQncyBhIHN0ZXAg
aW4KPj4+IHRoZSByaWdodCBkaXJlY3Rpb24uCj4+Pgo+Pj4gQnV0IEkgdGhpbmsgZnVuZGFtZW50
YWxseSBpdCdzIG5vdCB3aGF0IHdlIHdhbnQgdG8gZG8gbG9uZyB0ZXJtLgo+Pgo+PiBZZXMuCj4+
Cj4+Cj4+PiBJdCdzIGFsd2F5cyBiZWVuIGEgZnVuZGFtZW50YWwgcHJvYmxlbSB3aXRoIHRoaXMg
cGF0Y2ggc2VyaWVzIHRoYXQgb25seQo+Pj4gbWV0YWRhdGEgaXMgYWNjZXNzZWQgdGhyb3VnaCBh
IGRpcmVjdCBwb2ludGVyLgo+Pj4KPj4+IFRoZSBkaWZmZXJlbmNlIGluIHdheXMgeW91IGhhbmRs
ZSBtZXRhZGF0YSBhbmQgZGF0YSBpcyB3aGF0IGlzCj4+PiBub3cgY29taW5nIGFuZCBtZXNzaW5n
IGV2ZXJ5dGhpbmcgdXAuCj4+Cj4+IEkgZG8gcHJvcG9zZSBzb2VtdGhpbmcgbGlrZSB0aGlzIGlu
IHRoZSBwYXN0Ogo+PiBodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9saW51eC12aXJ0dWFs
aXphdGlvbi9tc2czNjgyNC5odG1sLiBCdXQgbG9va3MKPj4gbGlrZSB5b3UgaGF2ZSBzb21lIGNv
bmNlcm4gYWJvdXQgaXRzIGxvY2FsaXR5Lgo+IFJpZ2h0IGFuZCBpdCBkb2Vzbid0IGdvIGF3YXku
IFlvdSdsbCBuZWVkIHRvIGNvbWUgdXAKPiB3aXRoIGEgdGVzdCB0aGF0IG1lc3NlcyBpdCB1cCBh
bmQgdHJpZ2dlcnMgYSB3b3JzdC1jYXNlCj4gc2NlbmFyaW8sIHNvIHdlIGNhbiBtZWFzdXJlIGhv
dyBiYWQgaXMgdGhhdCB3b3JzdC1jYXNlLgoKCgoKPgo+PiBCdXQgdGhlIHByb2JsZW0gc3RpbGwg
dGhlcmUsIEdVUCBjYW4gZG8gcGFnZSBmYXVsdCwgc28gc3RpbGwgbmVlZCB0bwo+PiBzeW5jaHJv
bml6ZSBpdCB3aXRoIE1NVSBub3RpZmllcnMuCj4gSSB0aGluayB0aGUgaWRlYSB3YXMsIGlmIEdV
UCB3b3VsZCBuZWVkIGEgcGFnZWZhdWx0LCBkb24ndAo+IGRvIGEgR1VQIGFuZCBkbyB0by9mcm9t
IHVzZXIgaW5zdGVhZC4KCgpCdXQgdGhpcyBzdGlsbCBuZWVkIHRvIGJlIHN5bmNocm9uaXplZCB3
aXRoIE1NVSBub3RpZmllcnMgKG9yIHVzaW5nIApkZWRpY2F0ZWQgd29yayBmb3IgR1VQKS4KCgo+
ICAgSG9wZWZ1bGx5IHRoYXQKPiB3aWxsIGZhdWx0IHRoZSBwYWdlIGluIGFuZCB0aGUgbmV4dCBh
Y2Nlc3Mgd2lsbCBnbyB0aHJvdWdoLgo+Cj4+IFRoZSBzb2x1dGlvbiBtaWdodCBiZSBzb21ldGhp
bmcgbGlrZQo+PiBtb3ZpbmcgR1VQIHRvIGEgZGVkaWNhdGVkIGtpbmQgb2Ygdmhvc3Qgd29yay4K
PiBSaWdodCwgZ2VuZXJhbGx5IEdVUC4KPgo+Pj4gU28gaWYgY29udGludWluZyB0aGUgZGlyZWN0
IG1hcCBhcHByb2FjaCwKPj4+IHdoYXQgaXMgbmVlZGVkIGlzIGEgY2FjaGUgb2YgbWFwcGVkIFZN
IG1lbW9yeSwgdGhlbiBvbiBhIGNhY2hlIG1pc3MKPj4+IHdlJ2QgcXVldWUgd29yayBhbG9uZyB0
aGUgbGluZXMgb2YgMS0yIGFib3ZlLgo+Pj4KPj4+IFRoYXQncyBvbmUgZGlyZWN0aW9uIHRvIHRh
a2UuIEFub3RoZXIgb25lIGlzIHRvIGdpdmUgdXAgb24gdGhhdCBhbmQKPj4+IHdyaXRlIG91ciBv
d24gdmVyc2lvbiBvZiB1YWNjZXNzIG1hY3Jvcy4gIEFkZCBhICJoaWdoIHNlY3VyaXR5IiBmbGFn
IHRvCj4+PiB0aGUgdmhvc3QgbW9kdWxlIGFuZCBpZiBub3QgYWN0aXZlIHVzZSB0aGVzZSBmb3Ig
dXNlcnNwYWNlIG1lbW9yeQo+Pj4gYWNjZXNzLgo+Pgo+PiBPciB1c2luZyBTRVRfQkFDS0VORF9G
RUFUVVJFUz8KPiBObywgSSBkb24ndCB0aGluayBpdCdzIGNvbnNpZGVyZWQgYmVzdCBwcmFjdGlj
ZSB0byBhbGxvdyB1bnByaXZlbGVkZ2VkCj4gdXNlcnNwYWNlIGNvbnRyb2wgb3ZlciB3aGV0aGVy
IGtlcm5lbCBlbmFibGVzIHNlY3VyaXR5IGZlYXR1cmVzLgoKCkdldCB0aGlzLgoKCj4KPj4gQnV0
IGRvIHlvdSBtZWFuIHBlcm1hbmVudCBHVVAgYXMgSSBkaWQgaW4KPj4gb3JpZ2luYWwgUkZDIGh0
dHBzOi8vbGttbC5vcmcvbGttbC8yMDE4LzEyLzEzLzIxOD8KPj4KPj4gVGhhbmtzCj4gUGVybWFu
ZW50IEdVUCBicmVha3MgVEhQIGFuZCBOVU1BLgoKClllcy4KClRoYW5rcwoKCj4KPj4+Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9u
IG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpo
dHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFs
aXphdGlvbg==
