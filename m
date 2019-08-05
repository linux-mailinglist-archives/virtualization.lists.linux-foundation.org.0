Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A58D8111F
	for <lists.virtualization@lfdr.de>; Mon,  5 Aug 2019 06:41:59 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B075CCA1;
	Mon,  5 Aug 2019 04:41:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7C074C83
	for <virtualization@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 04:41:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 194D45E4
	for <virtualization@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 04:41:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9510FC0AD2BB;
	Mon,  5 Aug 2019 04:41:51 +0000 (UTC)
Received: from [10.72.12.115] (ovpn-12-115.pek2.redhat.com [10.72.12.115])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EE54619C59;
	Mon,  5 Aug 2019 04:41:46 +0000 (UTC)
Subject: Re: [PATCH V2 7/9] vhost: do not use RCU to synchronize MMU notifier
	with worker
From: Jason Wang <jasowang@redhat.com>
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
	<e8ecb811-6653-cff4-bc11-81f4ccb0dbbf@redhat.com>
Message-ID: <494ac30d-b750-52c8-b927-16cd4b9414c4@redhat.com>
Date: Mon, 5 Aug 2019 12:41:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e8ecb811-6653-cff4-bc11-81f4ccb0dbbf@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 05 Aug 2019 04:41:51 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-mm@kvack.org, virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, netdev@vger.kernel.org
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

Ck9uIDIwMTkvOC81IOS4i+WNiDEyOjM2LCBKYXNvbiBXYW5nIHdyb3RlOgo+Cj4gT24gMjAxOS84
LzIg5LiL5Y2IMTA6MjcsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4gT24gRnJpLCBBdWcg
MDIsIDIwMTkgYXQgMDk6NDY6MTNBTSAtMDMwMCwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+Pj4g
T24gRnJpLCBBdWcgMDIsIDIwMTkgYXQgMDU6NDA6MDdQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPj4+Pj4gVGhpcyBtdXN0IGJlIGEgcHJvcGVyIGJhcnJpZXIsIGxpa2UgYSBzcGlubG9jaywg
bXV0ZXgsIG9yCj4+Pj4+IHN5bmNocm9uaXplX3JjdS4KPj4+Pgo+Pj4+IEkgc3RhcnQgd2l0aCBz
eW5jaHJvbml6ZV9yY3UoKSBidXQgYm90aCB5b3UgYW5kIE1pY2hhZWwgcmFpc2Ugc29tZQo+Pj4+
IGNvbmNlcm4uCj4+PiBJJ3ZlIGFsc28gaWRseSB3b25kZXJlZCBpZiBjYWxsaW5nIHN5bmNocm9u
aXplX3JjdSgpIHVuZGVyIHRoZSB2YXJpb3VzCj4+PiBtbSBsb2NrcyBpcyBhIGRlYWRsb2NrIHNp
dHVhdGlvbi4KPj4+Cj4+Pj4gVGhlbiBJIHRyeSBzcGlubG9jayBhbmQgbXV0ZXg6Cj4+Pj4KPj4+
PiAxKSBzcGlubG9jazogYWRkIGxvdHMgb2Ygb3ZlcmhlYWQgb24gZGF0YXBhdGgsIHRoaXMgbGVh
ZHMgMCAKPj4+PiBwZXJmb3JtYW5jZQo+Pj4+IGltcHJvdmVtZW50Lgo+Pj4gSSB0aGluayB0aGUg
dG9waWMgaGVyZSBpcyBjb3JyZWN0bmVzcyBub3QgcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnQKPj4g
VGhlIHRvcGljIGlzIHdoZXRoZXIgd2Ugc2hvdWxkIHJldmVydAo+PiBjb21taXQgN2Y0NjYwMzJk
YzkgKCJ2aG9zdDogYWNjZXNzIHZxIG1ldGFkYXRhIHRocm91Z2gga2VybmVsIHZpcnR1YWwgCj4+
IGFkZHJlc3MiKQo+Pgo+PiBvciBrZWVwIGl0IGluLiBUaGUgb25seSByZWFzb24gdG8ga2VlcCBp
dCBpcyBwZXJmb3JtYW5jZS4KPgo+Cj4gTWF5YmUgaXQncyB0aW1lIHRvIGludHJvZHVjZSB0aGUg
Y29uZmlnIG9wdGlvbj8KCgpPciBkb2VzIGl0IG1ha2Ugc2Vuc2UgaWYgSSBwb3N0IGEgVjMgd2l0
aDoKCi0gaW50cm9kdWNlIGNvbmZpZyBvcHRpb24gYW5kIGRpc2FibGUgdGhlIG9wdGltaXphdGlv
biBieSBkZWZhdWx0CgotIHN3aXRjaCBmcm9tIHN5bmNocm9uaXplX3JjdSgpIHRvIHZob3N0X2Zs
dXNoX3dvcmsoKSwgYnV0IHRoZSByZXN0IGFyZSAKdGhlIHNhbWUKClRoaXMgY2FuIGdpdmUgdXMg
c29tZSBicmVhdGggdG8gZGVjaWRlIHdoaWNoIHdheSBzaG91bGQgZ28gZm9yIG5leHQgcmVsZWFz
ZT8KClRoYW5rcwoKCj4KPgo+Pgo+PiBOb3cgYXMgbG9uZyBhcyBhbGwgdGhpcyBjb2RlIGlzIGRp
c2FibGVkIGFueXdheSwgd2UgY2FuIGV4cGVyaW1lbnQgYQo+PiBiaXQuCj4+Cj4+IEkgcGVyc29u
YWxseSBmZWVsIHdlIHdvdWxkIGJlIGJlc3Qgc2VydmVkIGJ5IGhhdmluZyB0d28gY29kZSBwYXRo
czoKPj4KPj4gLSBBY2Nlc3MgdG8gVk0gbWVtb3J5IGRpcmVjdGx5IG1hcHBlZCBpbnRvIGtlcm5l
bAo+PiAtIEFjY2VzcyB0byB1c2Vyc3BhY2UKPj4KPj4KPj4gSGF2aW5nIGl0IGFsbCBjbGVhbmx5
IHNwbGl0IHdpbGwgYWxsb3cgYSBidW5jaCBvZiBvcHRpbWl6YXRpb25zLCBmb3IKPj4gZXhhbXBs
ZSBmb3IgeWVhcnMgbm93IHdlIHBsYW5uZWQgdG8gYmUgYWJsZSB0byBwcm9jZXNzIGFuIGluY29t
aW5nIHNob3J0Cj4+IHBhY2tldCBkaXJlY3RseSBvbiBzb2Z0aXJxIHBhdGgsIG9yIGFuIG91dGdv
aW5nIG9uIGRpcmVjdGx5IHdpdGhpbgo+PiBldmVudGZkLgo+Cj4KPiBJdCdzIG5vdCBoYXJkIGNv
bnNpZGVyIHdlJ3ZlIGFscmVhZHkgaGFkIG91ciBvd24gYWNjc3NvcnMuIEJ1dCB0aGUgCj4gcXVl
c3Rpb24gaXMgKGFzIGFza2VkIGluIGFub3RoZXIgdGhyZWFkKSwgZG8geW91IHdhbnQgcGVybWFu
ZW50IEdVUCBvciAKPiBzdGlsbCB1c2UgTU1VIG5vdGlmaWVycy4KPgo+IFRoYW5rcwo+Cj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBWaXJ0dWFsaXph
dGlvbiBtYWlsaW5nIGxpc3QKPiBWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9u
Lm9yZwo+IGh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3ZpcnR1YWxpemF0aW9uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5s
aW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFp
bG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
