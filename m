Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4568E8B27D
	for <lists.virtualization@lfdr.de>; Tue, 13 Aug 2019 10:31:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 855EFC79;
	Tue, 13 Aug 2019 08:31:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 63272B4B
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 08:31:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DFDF012F
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 08:31:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 640B2309266A;
	Tue, 13 Aug 2019 08:31:16 +0000 (UTC)
Received: from [10.72.12.191] (ovpn-12-191.pek2.redhat.com [10.72.12.191])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F1FEF1001B28;
	Tue, 13 Aug 2019 08:31:08 +0000 (UTC)
Subject: Re: [PATCH V5 0/9] Fixes for vhost metadata acceleration
To: Jason Gunthorpe <jgg@ziepe.ca>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20190809054851.20118-1-jasowang@redhat.com>
	<20190810134948-mutt-send-email-mst@kernel.org>
	<360a3b91-1ac5-84c0-d34b-a4243fa748c4@redhat.com>
	<20190812054429-mutt-send-email-mst@kernel.org>
	<20190812130252.GE24457@ziepe.ca>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <9a9641fe-b48f-f32a-eecc-af9c2f4fbe0e@redhat.com>
Date: Tue, 13 Aug 2019 16:31:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812130252.GE24457@ziepe.ca>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Tue, 13 Aug 2019 08:31:16 +0000 (UTC)
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

Ck9uIDIwMTkvOC8xMiDkuIvljYg5OjAyLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gT24gTW9u
LCBBdWcgMTIsIDIwMTkgYXQgMDU6NDk6MDhBTSAtMDQwMCwgTWljaGFlbCBTLiBUc2lya2luIHdy
b3RlOgo+PiBPbiBNb24sIEF1ZyAxMiwgMjAxOSBhdCAxMDo0NDo1MUFNICswODAwLCBKYXNvbiBX
YW5nIHdyb3RlOgo+Pj4gT24gMjAxOS84LzExIOS4iuWNiDE6NTIsIE1pY2hhZWwgUy4gVHNpcmtp
biB3cm90ZToKPj4+PiBPbiBGcmksIEF1ZyAwOSwgMjAxOSBhdCAwMTo0ODo0MkFNIC0wNDAwLCBK
YXNvbiBXYW5nIHdyb3RlOgo+Pj4+PiBIaSBhbGw6Cj4+Pj4+Cj4+Pj4+IFRoaXMgc2VyaWVzIHRy
eSB0byBmaXggc2V2ZXJhbCBpc3N1ZXMgaW50cm9kdWNlZCBieSBtZXRhIGRhdGEKPj4+Pj4gYWNj
ZWxyZWF0aW9uIHNlcmllcy4gUGxlYXNlIHJldmlldy4KPj4+Pj4KPj4+Pj4gQ2hhbmdlcyBmcm9t
IFY0Ogo+Pj4+PiAtIHN3aXRjaCB0byB1c2Ugc3BpbmxvY2sgc3luY2hyb25pemUgTU1VIG5vdGlm
aWVyIHdpdGggYWNjZXNzb3JzCj4+Pj4+Cj4+Pj4+IENoYW5nZXMgZnJvbSBWMzoKPj4+Pj4gLSBy
ZW1vdmUgdGhlIHVubmVjZXNzYXJ5IHBhdGNoCj4+Pj4+Cj4+Pj4+IENoYW5nZXMgZnJvbSBWMjoK
Pj4+Pj4gLSB1c2Ugc2VxbGNrIGhlbHBlciB0byBzeW5jaHJvbml6ZSBNTVUgbm90aWZpZXIgd2l0
aCB2aG9zdCB3b3JrZXIKPj4+Pj4KPj4+Pj4gQ2hhbmdlcyBmcm9tIFYxOgo+Pj4+PiAtIHRyeSBu
b3QgdXNlIFJDVSB0byBzeW5jcmhvbml6ZSBNTVUgbm90aWZpZXIgd2l0aCB2aG9zdCB3b3JrZXIK
Pj4+Pj4gLSBzZXQgZGlydHkgcGFnZXMgYWZ0ZXIgbm8gcmVhZGVycwo+Pj4+PiAtIHJldHVybiAt
RUFHQUlOIG9ubHkgd2hlbiB3ZSBmaW5kIHRoZSByYW5nZSBpcyBvdmVybGFwcGVkIHdpdGgKPj4+
Pj4gICAgIG1ldGFkYXRhCj4+Pj4+Cj4+Pj4+IEphc29uIFdhbmcgKDkpOgo+Pj4+PiAgICAgdmhv
c3Q6IGRvbid0IHNldCB1YWRkciBmb3IgaW52YWxpZCBhZGRyZXNzCj4+Pj4+ICAgICB2aG9zdDog
dmFsaWRhdGUgTU1VIG5vdGlmaWVyIHJlZ2lzdHJhdGlvbgo+Pj4+PiAgICAgdmhvc3Q6IGZpeCB2
aG9zdCBtYXAgbGVhawo+Pj4+PiAgICAgdmhvc3Q6IHJlc2V0IGludmFsaWRhdGVfY291bnQgaW4g
dmhvc3Rfc2V0X3ZyaW5nX251bV9hZGRyKCkKPj4+Pj4gICAgIHZob3N0OiBtYXJrIGRpcnR5IHBh
Z2VzIGR1cmluZyBtYXAgdW5pbml0Cj4+Pj4+ICAgICB2aG9zdDogZG9uJ3QgZG8gc3luY2hyb25p
emVfcmN1KCkgaW4gdmhvc3RfdW5pbml0X3ZxX21hcHMoKQo+Pj4+PiAgICAgdmhvc3Q6IGRvIG5v
dCB1c2UgUkNVIHRvIHN5bmNocm9uaXplIE1NVSBub3RpZmllciB3aXRoIHdvcmtlcgo+Pj4+PiAg
ICAgdmhvc3Q6IGNvcnJlY3RseSBzZXQgZGlydHkgcGFnZXMgaW4gTU1VIG5vdGlmaWVycyBjYWxs
YmFjawo+Pj4+PiAgICAgdmhvc3Q6IGRvIG5vdCByZXR1cm4gLUVBR0FJTiBmb3Igbm9uIGJsb2Nr
aW5nIGludmFsaWRhdGlvbiB0b28gZWFybHkKPj4+Pj4KPj4+Pj4gICAgZHJpdmVycy92aG9zdC92
aG9zdC5jIHwgMjAyICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQo+
Pj4+PiAgICBkcml2ZXJzL3Zob3N0L3Zob3N0LmggfCAgIDYgKy0KPj4+Pj4gICAgMiBmaWxlcyBj
aGFuZ2VkLCAxMjIgaW5zZXJ0aW9ucygrKSwgODYgZGVsZXRpb25zKC0pCj4+Pj4gVGhpcyBnZW5l
cmFsbHkgbG9va3MgbW9yZSBzb2xpZC4KPj4+Pgo+Pj4+IEJ1dCB0aGlzIGFtb3VudHMgdG8gYSBz
aWduaWZpY2FudCBvdmVyaGF1bCBvZiB0aGUgY29kZS4KPj4+Pgo+Pj4+IEF0IHRoaXMgcG9pbnQg
aG93IGFib3V0IHdlIHJldmVydCA3ZjQ2NjAzMmRjOWU1YTYxMjE3ZjIyZWEzNGIyZGY5MzI3ODZi
YmZjCj4+Pj4gZm9yIHRoaXMgcmVsZWFzZSwgYW5kIHRoZW4gcmUtYXBwbHkgYSBjb3JyZWN0ZWQg
dmVyc2lvbgo+Pj4+IGZvciB0aGUgbmV4dCBvbmU/Cj4+Pgo+Pj4gSWYgcG9zc2libGUsIGNvbnNp
ZGVyIHdlJ3ZlIGFjdHVhbGx5IGRpc2FibGVkIHRoZSBmZWF0dXJlLiBIb3cgYWJvdXQganVzdAo+
Pj4gcXVldWVkIHRob3NlIHBhdGNoZXMgZm9yIG5leHQgcmVsZWFzZT8KPj4+Cj4+PiBUaGFua3MK
Pj4gU29ycnkgaWYgSSB3YXMgdW5jbGVhci4gTXkgaWRlYSBpcyB0aGF0Cj4+IDEuIEkgcmV2ZXJ0
IHRoZSBkaXNhYmxlZCBjb2RlCj4+IDIuIFlvdSBzZW5kIGEgcGF0Y2ggcmVhZGRpbmcgaXQgd2l0
aCBhbGwgdGhlIGZpeGVzIHNxdWFzaGVkCj4+IDMuIE1heWJlIG9wdGltaXphdGlvbnMgb24gdG9w
IHJpZ2h0IGF3YXk/Cj4+IDQuIFdlIHF1ZXVlICp0aGF0KiBmb3IgbmV4dCBhbmQgc2VlIHdoYXQg
aGFwcGVucy4KPj4KPj4gQW5kIHRoZSBhZHZhbnRhZ2Ugb3ZlciB0aGUgcGF0Y2h5IGFwcHJvYWNo
IGlzIHRoYXQgdGhlIGN1cnJlbnQgcGF0Y2hlcwo+PiBhcmUgaGFyZCB0byByZXZpZXcuIEUuZy4g
IGl0J3Mgbm90IHJlYXNvbmFibGUgdG8gYXNrIFJDVSBndXlzIHRvIHJldmlldwo+PiB0aGUgd2hv
bGUgb2Ygdmhvc3QgZm9yIFJDVSB1c2FnZSBidXQgaXQncyBtdWNoIG1vcmUgcmVhc29uYWJsZSB0
byBhc2sKPj4gYWJvdXQgYSBzcGVjaWZpYyBwYXRjaC4KPiBJIHRoaW5rIHRoZXJlIGFyZSBvdGhl
ciBwcm9ibGVtcyBoZXJlIHRvbywgSSBkb24ndCBsaWtlIHRoYXQgdGhlIHVzZQo+IG9mIG1tdSBu
b3RpZmllcnMgaXMgc28gZGlmZmVyZW50IGZyb20gZXZlcnkgb3RoZXIgZHJpdmVyLCBvciB0aGF0
IEdVUAo+IGlzIGNhbGxlZCB1bmRlciBzcGlubG9jay4KCgpXaGF0IGtpbmQgb2YgaXNzdWVzIGRv
IHlvdSBzZWU/IFNwaW5sb2NrIGlzIHRvIHN5bmNocm9uaXplIEdVUCB3aXRoIE1NVSAKbm90aWZp
ZXIgaW4gdGhpcyBzZXJpZXMuCgpCdHcsIGJhY2sgdG8gdGhlIG9yaWdpbmFsIHF1ZXN0aW9uLiBN
YXkgSSBrbm93IHdoeSBzeW5jaHJvbml6ZV9yY3UoKSBpcyAKbm90IHN1aXRhYmxlPyBDb25zaWRl
cjoKCi0gTU1VIG5vdGlmaWVyIGFyZSBhbGxvd2VkIHRvIHNsZWVwCi0gTU1VIG5vdGlmaWVyIGNv
dWxkIGJlIHByZWVtcHRlZAoKSWYgeW91IG1lYW4gc29tZXRoaW5nIHRoYXQgcHJldmVudHMgUkNV
IGdyYWNlIHBlcmlvZCBmcm9tIHJ1bm5pbmcuIEknbSAKYWZyYWlkIE1NVSBub3RpZmllciBpcyBu
b3QgdGhlIG9ubHkgdmljdGltLsKgIEJ1dCBpdCBzaG91bGQgYmUgbm8gbW9yZSAKd29yc2UgdGhh
biBzb21lIG9uZSBpcyBob2xkaW5nIGEgbG9jayBmb3IgdmVyeSBsb25nIHRpbWUuIElmIHRoZSBv
bmx5IApjb25jZXJuIGlzIHRoZSBwcmVlbXB0aW9uIG9mIHZob3N0IGt0aHJlYWQsIEkgY2FuIHN3
aXRjaCB0byB1c2UgCnJjdV9yZWFkX2xvY2tfYmgoKSBpbnN0ZWFkLgoKVGhhbmtzCgoKPgo+IFNv
IEkgZmF2b3IgdGhlIHJldmVydCBhbmQgdHJ5IGFnYWluIGFwcHJvYWNoIGFzIHdlbGwuIEl0IGlz
IGhhcmQgdG8KPiBnZXQgYSBjbGVhciBwaWN0dXJlIHdpdGggdGhlc2UgZW5kbGVzcyBidWcgZml4
IHBhdGNoZXMKPgo+IEphc29uCgoKT2suCgpUaGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0
dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4
Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
