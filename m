Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9367B81420
	for <lists.virtualization@lfdr.de>; Mon,  5 Aug 2019 10:24:47 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6C9A1D84;
	Mon,  5 Aug 2019 08:24:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 43025D7A
	for <virtualization@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 08:24:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C82365E4
	for <virtualization@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 08:24:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5938630923D0;
	Mon,  5 Aug 2019 08:24:33 +0000 (UTC)
Received: from [10.72.12.115] (ovpn-12-115.pek2.redhat.com [10.72.12.115])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9AC761000323;
	Mon,  5 Aug 2019 08:24:28 +0000 (UTC)
Subject: Re: [PATCH V2 7/9] vhost: do not use RCU to synchronize MMU notifier
	with worker
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20190731123935.GC3946@ziepe.ca>
	<7555c949-ae6f-f105-6e1d-df21ddae9e4e@redhat.com>
	<20190731193057.GG3946@ziepe.ca>
	<a3bde826-6329-68e4-2826-8a9de4c5bd1e@redhat.com>
	<20190801141512.GB23899@ziepe.ca>
	<42ead87b-1749-4c73-cbe4-29dbeb945041@redhat.com>
	<20190802124613.GA11245@ziepe.ca>
	<20190802100414-mutt-send-email-mst@kernel.org>
	<e8ecb811-6653-cff4-bc11-81f4ccb0dbbf@redhat.com>
	<494ac30d-b750-52c8-b927-16cd4b9414c4@redhat.com>
	<20190805023106-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <86444f93-e507-cfd9-598b-51466bb02354@redhat.com>
Date: Mon, 5 Aug 2019 16:24:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190805023106-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Mon, 05 Aug 2019 08:24:33 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	Jason Gunthorpe <jgg@ziepe.ca>
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

Ck9uIDIwMTkvOC81IOS4i+WNiDI6NDAsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBN
b24sIEF1ZyAwNSwgMjAxOSBhdCAxMjo0MTo0NVBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
PiBPbiAyMDE5LzgvNSDkuIvljYgxMjozNiwgSmFzb24gV2FuZyB3cm90ZToKPj4+IE9uIDIwMTkv
OC8yIOS4i+WNiDEwOjI3LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+Pj4gT24gRnJpLCBB
dWcgMDIsIDIwMTkgYXQgMDk6NDY6MTNBTSAtMDMwMCwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+
Pj4+PiBPbiBGcmksIEF1ZyAwMiwgMjAxOSBhdCAwNTo0MDowN1BNICswODAwLCBKYXNvbiBXYW5n
IHdyb3RlOgo+Pj4+Pj4+IFRoaXMgbXVzdCBiZSBhIHByb3BlciBiYXJyaWVyLCBsaWtlIGEgc3Bp
bmxvY2ssIG11dGV4LCBvcgo+Pj4+Pj4+IHN5bmNocm9uaXplX3JjdS4KPj4+Pj4+IEkgc3RhcnQg
d2l0aCBzeW5jaHJvbml6ZV9yY3UoKSBidXQgYm90aCB5b3UgYW5kIE1pY2hhZWwgcmFpc2Ugc29t
ZQo+Pj4+Pj4gY29uY2Vybi4KPj4+Pj4gSSd2ZSBhbHNvIGlkbHkgd29uZGVyZWQgaWYgY2FsbGlu
ZyBzeW5jaHJvbml6ZV9yY3UoKSB1bmRlciB0aGUgdmFyaW91cwo+Pj4+PiBtbSBsb2NrcyBpcyBh
IGRlYWRsb2NrIHNpdHVhdGlvbi4KPj4+Pj4KPj4+Pj4+IFRoZW4gSSB0cnkgc3BpbmxvY2sgYW5k
IG11dGV4Ogo+Pj4+Pj4KPj4+Pj4+IDEpIHNwaW5sb2NrOiBhZGQgbG90cyBvZiBvdmVyaGVhZCBv
biBkYXRhcGF0aCwgdGhpcyBsZWFkcyAwCj4+Pj4+PiBwZXJmb3JtYW5jZQo+Pj4+Pj4gaW1wcm92
ZW1lbnQuCj4+Pj4+IEkgdGhpbmsgdGhlIHRvcGljIGhlcmUgaXMgY29ycmVjdG5lc3Mgbm90IHBl
cmZvcm1hbmNlIGltcHJvdmVtZW50Cj4+Pj4gVGhlIHRvcGljIGlzIHdoZXRoZXIgd2Ugc2hvdWxk
IHJldmVydAo+Pj4+IGNvbW1pdCA3ZjQ2NjAzMmRjOSAoInZob3N0OiBhY2Nlc3MgdnEgbWV0YWRh
dGEgdGhyb3VnaCBrZXJuZWwKPj4+PiB2aXJ0dWFsIGFkZHJlc3MiKQo+Pj4+Cj4+Pj4gb3Iga2Vl
cCBpdCBpbi4gVGhlIG9ubHkgcmVhc29uIHRvIGtlZXAgaXQgaXMgcGVyZm9ybWFuY2UuCj4+Pgo+
Pj4gTWF5YmUgaXQncyB0aW1lIHRvIGludHJvZHVjZSB0aGUgY29uZmlnIG9wdGlvbj8KPj4KPj4g
T3IgZG9lcyBpdCBtYWtlIHNlbnNlIGlmIEkgcG9zdCBhIFYzIHdpdGg6Cj4+Cj4+IC0gaW50cm9k
dWNlIGNvbmZpZyBvcHRpb24gYW5kIGRpc2FibGUgdGhlIG9wdGltaXphdGlvbiBieSBkZWZhdWx0
Cj4+Cj4+IC0gc3dpdGNoIGZyb20gc3luY2hyb25pemVfcmN1KCkgdG8gdmhvc3RfZmx1c2hfd29y
aygpLCBidXQgdGhlIHJlc3QgYXJlIHRoZQo+PiBzYW1lCj4+Cj4+IFRoaXMgY2FuIGdpdmUgdXMg
c29tZSBicmVhdGggdG8gZGVjaWRlIHdoaWNoIHdheSBzaG91bGQgZ28gZm9yIG5leHQgcmVsZWFz
ZT8KPj4KPj4gVGhhbmtzCj4gQXMgaXMsIHdpdGggcHJlZW1wdCBlbmFibGVkPyAgTm9wZSBJIGRv
bid0IHRoaW5rIGJsb2NraW5nIGFuIGludmFsaWRhdG9yCj4gb24gc3dhcCBJTyBpcyBvaywgc28g
SSBkb24ndCBiZWxpZXZlIHRoaXMgc3R1ZmYgaXMgZ29pbmcgaW50byB0aGlzCj4gcmVsZWFzZSBh
dCB0aGlzIHBvaW50Lgo+Cj4gU28gaXQncyBtb3JlIGEgcXVlc3Rpb24gb2Ygd2hldGhlciBpdCdz
IGJldHRlciB0byByZXZlcnQgYW5kIGFwcGx5IGEgY2xlYW4KPiBwYXRjaCBvbiB0b3AsIG9yIGp1
c3Qga2VlcCB0aGUgY29kZSBhcm91bmQgYnV0IGRpc2FibGVkIHdpdGggYW4gaWZkZWYgYXMgaXMu
Cj4gSSdtIG9wZW4gdG8gYm90aCBvcHRpb25zLCBhbmQgd291bGQgbGlrZSB5b3VyIG9waW5pb24g
b24gdGhpcy4KCgpUaGVuIEkgcHJlZmVyIHRvIGxlYXZlIGN1cnJlbnQgY29kZSAoVkhPU1RfQVJD
SF9DQU5fQUNDRUwgdG8gMCkgYXMgaXMuIApUaGlzIGNhbiBhbHNvIHNhdmUgZWZmb3J0cyBvbiBy
ZWJhc2luZyBwYWNrZWQgdmlydHF1ZXVlcy4KClRoYW5rcwoKCj4KPj4+Cj4+Pj4gTm93IGFzIGxv
bmcgYXMgYWxsIHRoaXMgY29kZSBpcyBkaXNhYmxlZCBhbnl3YXksIHdlIGNhbiBleHBlcmltZW50
IGEKPj4+PiBiaXQuCj4+Pj4KPj4+PiBJIHBlcnNvbmFsbHkgZmVlbCB3ZSB3b3VsZCBiZSBiZXN0
IHNlcnZlZCBieSBoYXZpbmcgdHdvIGNvZGUgcGF0aHM6Cj4+Pj4KPj4+PiAtIEFjY2VzcyB0byBW
TSBtZW1vcnkgZGlyZWN0bHkgbWFwcGVkIGludG8ga2VybmVsCj4+Pj4gLSBBY2Nlc3MgdG8gdXNl
cnNwYWNlCj4+Pj4KPj4+Pgo+Pj4+IEhhdmluZyBpdCBhbGwgY2xlYW5seSBzcGxpdCB3aWxsIGFs
bG93IGEgYnVuY2ggb2Ygb3B0aW1pemF0aW9ucywgZm9yCj4+Pj4gZXhhbXBsZSBmb3IgeWVhcnMg
bm93IHdlIHBsYW5uZWQgdG8gYmUgYWJsZSB0byBwcm9jZXNzIGFuIGluY29taW5nIHNob3J0Cj4+
Pj4gcGFja2V0IGRpcmVjdGx5IG9uIHNvZnRpcnEgcGF0aCwgb3IgYW4gb3V0Z29pbmcgb24gZGly
ZWN0bHkgd2l0aGluCj4+Pj4gZXZlbnRmZC4KPj4+Cj4+PiBJdCdzIG5vdCBoYXJkIGNvbnNpZGVy
IHdlJ3ZlIGFscmVhZHkgaGFkIG91ciBvd24gYWNjc3NvcnMuIEJ1dCB0aGUKPj4+IHF1ZXN0aW9u
IGlzIChhcyBhc2tlZCBpbiBhbm90aGVyIHRocmVhZCksIGRvIHlvdSB3YW50IHBlcm1hbmVudCBH
VVAgb3IKPj4+IHN0aWxsIHVzZSBNTVUgbm90aWZpZXJzLgo+Pj4KPj4+IFRoYW5rcwo+Pj4KPj4+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+PiBWaXJ0
dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKPj4+IFZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCj4+PiBodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby92aXJ0dWFsaXphdGlvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRp
b25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRp
b24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
