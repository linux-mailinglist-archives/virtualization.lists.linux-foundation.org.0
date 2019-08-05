Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6825581417
	for <lists.virtualization@lfdr.de>; Mon,  5 Aug 2019 10:22:29 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0634DD84;
	Mon,  5 Aug 2019 08:22:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 73FF1D4F
	for <virtualization@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 08:22:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 238F25E4
	for <virtualization@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 08:22:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A704879705;
	Mon,  5 Aug 2019 08:22:21 +0000 (UTC)
Received: from [10.72.12.115] (ovpn-12-115.pek2.redhat.com [10.72.12.115])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E1DB55D9C0;
	Mon,  5 Aug 2019 08:22:16 +0000 (UTC)
Subject: Re: [PATCH V2 7/9] vhost: do not use RCU to synchronize MMU notifier
	with worker
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20190731084655.7024-8-jasowang@redhat.com>
	<20190731123935.GC3946@ziepe.ca>
	<7555c949-ae6f-f105-6e1d-df21ddae9e4e@redhat.com>
	<20190731193057.GG3946@ziepe.ca>
	<a3bde826-6329-68e4-2826-8a9de4c5bd1e@redhat.com>
	<20190801141512.GB23899@ziepe.ca>
	<42ead87b-1749-4c73-cbe4-29dbeb945041@redhat.com>
	<20190802124613.GA11245@ziepe.ca>
	<20190802100414-mutt-send-email-mst@kernel.org>
	<e8ecb811-6653-cff4-bc11-81f4ccb0dbbf@redhat.com>
	<20190805022833-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <9d81ac79-1cc4-fba0-5aad-7acd8578d957@redhat.com>
Date: Mon, 5 Aug 2019 16:22:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190805022833-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 05 Aug 2019 08:22:21 +0000 (UTC)
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

Ck9uIDIwMTkvOC81IOS4i+WNiDI6MzAsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBN
b24sIEF1ZyAwNSwgMjAxOSBhdCAxMjozNjo0MFBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
PiBPbiAyMDE5LzgvMiDkuIvljYgxMDoyNywgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+Pj4g
T24gRnJpLCBBdWcgMDIsIDIwMTkgYXQgMDk6NDY6MTNBTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+Pj4+IE9uIEZyaSwgQXVnIDAyLCAyMDE5IGF0IDA1OjQwOjA3UE0gKzA4MDAsIEph
c29uIFdhbmcgd3JvdGU6Cj4+Pj4+PiBUaGlzIG11c3QgYmUgYSBwcm9wZXIgYmFycmllciwgbGlr
ZSBhIHNwaW5sb2NrLCBtdXRleCwgb3IKPj4+Pj4+IHN5bmNocm9uaXplX3JjdS4KPj4+Pj4gSSBz
dGFydCB3aXRoIHN5bmNocm9uaXplX3JjdSgpIGJ1dCBib3RoIHlvdSBhbmQgTWljaGFlbCByYWlz
ZSBzb21lCj4+Pj4+IGNvbmNlcm4uCj4+Pj4gSSd2ZSBhbHNvIGlkbHkgd29uZGVyZWQgaWYgY2Fs
bGluZyBzeW5jaHJvbml6ZV9yY3UoKSB1bmRlciB0aGUgdmFyaW91cwo+Pj4+IG1tIGxvY2tzIGlz
IGEgZGVhZGxvY2sgc2l0dWF0aW9uLgo+Pj4+Cj4+Pj4+IFRoZW4gSSB0cnkgc3BpbmxvY2sgYW5k
IG11dGV4Ogo+Pj4+Pgo+Pj4+PiAxKSBzcGlubG9jazogYWRkIGxvdHMgb2Ygb3ZlcmhlYWQgb24g
ZGF0YXBhdGgsIHRoaXMgbGVhZHMgMCBwZXJmb3JtYW5jZQo+Pj4+PiBpbXByb3ZlbWVudC4KPj4+
PiBJIHRoaW5rIHRoZSB0b3BpYyBoZXJlIGlzIGNvcnJlY3RuZXNzIG5vdCBwZXJmb3JtYW5jZSBp
bXByb3ZlbWVudAo+Pj4gVGhlIHRvcGljIGlzIHdoZXRoZXIgd2Ugc2hvdWxkIHJldmVydAo+Pj4g
Y29tbWl0IDdmNDY2MDMyZGM5ICgidmhvc3Q6IGFjY2VzcyB2cSBtZXRhZGF0YSB0aHJvdWdoIGtl
cm5lbCB2aXJ0dWFsIGFkZHJlc3MiKQo+Pj4KPj4+IG9yIGtlZXAgaXQgaW4uIFRoZSBvbmx5IHJl
YXNvbiB0byBrZWVwIGl0IGlzIHBlcmZvcm1hbmNlLgo+Pgo+PiBNYXliZSBpdCdzIHRpbWUgdG8g
aW50cm9kdWNlIHRoZSBjb25maWcgb3B0aW9uPwo+IERlcGVuZGluZyBvbiBDT05GSUdfQlJPS0VO
PyBJJ20gbm90IHN1cmUgaXQncyBhIGdvb2QgaWRlYS4KCgpPay4KCgo+Pj4gTm93IGFzIGxvbmcg
YXMgYWxsIHRoaXMgY29kZSBpcyBkaXNhYmxlZCBhbnl3YXksIHdlIGNhbiBleHBlcmltZW50IGEK
Pj4+IGJpdC4KPj4+Cj4+PiBJIHBlcnNvbmFsbHkgZmVlbCB3ZSB3b3VsZCBiZSBiZXN0IHNlcnZl
ZCBieSBoYXZpbmcgdHdvIGNvZGUgcGF0aHM6Cj4+Pgo+Pj4gLSBBY2Nlc3MgdG8gVk0gbWVtb3J5
IGRpcmVjdGx5IG1hcHBlZCBpbnRvIGtlcm5lbAo+Pj4gLSBBY2Nlc3MgdG8gdXNlcnNwYWNlCj4+
Pgo+Pj4KPj4+IEhhdmluZyBpdCBhbGwgY2xlYW5seSBzcGxpdCB3aWxsIGFsbG93IGEgYnVuY2gg
b2Ygb3B0aW1pemF0aW9ucywgZm9yCj4+PiBleGFtcGxlIGZvciB5ZWFycyBub3cgd2UgcGxhbm5l
ZCB0byBiZSBhYmxlIHRvIHByb2Nlc3MgYW4gaW5jb21pbmcgc2hvcnQKPj4+IHBhY2tldCBkaXJl
Y3RseSBvbiBzb2Z0aXJxIHBhdGgsIG9yIGFuIG91dGdvaW5nIG9uIGRpcmVjdGx5IHdpdGhpbgo+
Pj4gZXZlbnRmZC4KPj4KPj4gSXQncyBub3QgaGFyZCBjb25zaWRlciB3ZSd2ZSBhbHJlYWR5IGhh
ZCBvdXIgb3duIGFjY3Nzb3JzLiBCdXQgdGhlIHF1ZXN0aW9uCj4+IGlzIChhcyBhc2tlZCBpbiBh
bm90aGVyIHRocmVhZCksIGRvIHlvdSB3YW50IHBlcm1hbmVudCBHVVAgb3Igc3RpbGwgdXNlIE1N
VQo+PiBub3RpZmllcnMuCj4+Cj4+IFRoYW5rcwo+IFdlIHdhbnQgVEhQIGFuZCBOVU1BIHRvIHdv
cmsuIEJvdGggYXJlIGltcG9ydGFudCBmb3IgcGVyZm9ybWFuY2UuCj4KClllcy4KClRoYW5rcwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6
YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24u
b3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3Zp
cnR1YWxpemF0aW9u
