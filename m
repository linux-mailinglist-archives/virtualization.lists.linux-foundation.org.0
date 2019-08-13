Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D738B217
	for <lists.virtualization@lfdr.de>; Tue, 13 Aug 2019 10:13:05 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DC81BBA9;
	Tue, 13 Aug 2019 08:12:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C953ABA0
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 08:12:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6658D8D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 08:12:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AF6EA2DE49;
	Tue, 13 Aug 2019 08:12:56 +0000 (UTC)
Received: from [10.72.12.191] (ovpn-12-191.pek2.redhat.com [10.72.12.191])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 04B34795BC;
	Tue, 13 Aug 2019 08:12:51 +0000 (UTC)
Subject: Re: [PATCH V5 0/9] Fixes for vhost metadata acceleration
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20190809054851.20118-1-jasowang@redhat.com>
	<20190810134948-mutt-send-email-mst@kernel.org>
	<360a3b91-1ac5-84c0-d34b-a4243fa748c4@redhat.com>
	<20190812054429-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <663be71f-f96d-cfbc-95a0-da0ac6b82d9f@redhat.com>
Date: Tue, 13 Aug 2019 16:12:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812054429-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 13 Aug 2019 08:12:56 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, jgg@ziepe.ca, netdev@vger.kernel.org,
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

Ck9uIDIwMTkvOC8xMiDkuIvljYg1OjQ5LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
TW9uLCBBdWcgMTIsIDIwMTkgYXQgMTA6NDQ6NTFBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAxOS84LzExIOS4iuWNiDE6NTIsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+
IE9uIEZyaSwgQXVnIDA5LCAyMDE5IGF0IDAxOjQ4OjQyQU0gLTA0MDAsIEphc29uIFdhbmcgd3Jv
dGU6Cj4+Pj4gSGkgYWxsOgo+Pj4+Cj4+Pj4gVGhpcyBzZXJpZXMgdHJ5IHRvIGZpeCBzZXZlcmFs
IGlzc3VlcyBpbnRyb2R1Y2VkIGJ5IG1ldGEgZGF0YQo+Pj4+IGFjY2VscmVhdGlvbiBzZXJpZXMu
IFBsZWFzZSByZXZpZXcuCj4+Pj4KPj4+PiBDaGFuZ2VzIGZyb20gVjQ6Cj4+Pj4gLSBzd2l0Y2gg
dG8gdXNlIHNwaW5sb2NrIHN5bmNocm9uaXplIE1NVSBub3RpZmllciB3aXRoIGFjY2Vzc29ycwo+
Pj4+Cj4+Pj4gQ2hhbmdlcyBmcm9tIFYzOgo+Pj4+IC0gcmVtb3ZlIHRoZSB1bm5lY2Vzc2FyeSBw
YXRjaAo+Pj4+Cj4+Pj4gQ2hhbmdlcyBmcm9tIFYyOgo+Pj4+IC0gdXNlIHNlcWxjayBoZWxwZXIg
dG8gc3luY2hyb25pemUgTU1VIG5vdGlmaWVyIHdpdGggdmhvc3Qgd29ya2VyCj4+Pj4KPj4+PiBD
aGFuZ2VzIGZyb20gVjE6Cj4+Pj4gLSB0cnkgbm90IHVzZSBSQ1UgdG8gc3luY3Job25pemUgTU1V
IG5vdGlmaWVyIHdpdGggdmhvc3Qgd29ya2VyCj4+Pj4gLSBzZXQgZGlydHkgcGFnZXMgYWZ0ZXIg
bm8gcmVhZGVycwo+Pj4+IC0gcmV0dXJuIC1FQUdBSU4gb25seSB3aGVuIHdlIGZpbmQgdGhlIHJh
bmdlIGlzIG92ZXJsYXBwZWQgd2l0aAo+Pj4+ICAgICBtZXRhZGF0YQo+Pj4+Cj4+Pj4gSmFzb24g
V2FuZyAoOSk6Cj4+Pj4gICAgIHZob3N0OiBkb24ndCBzZXQgdWFkZHIgZm9yIGludmFsaWQgYWRk
cmVzcwo+Pj4+ICAgICB2aG9zdDogdmFsaWRhdGUgTU1VIG5vdGlmaWVyIHJlZ2lzdHJhdGlvbgo+
Pj4+ICAgICB2aG9zdDogZml4IHZob3N0IG1hcCBsZWFrCj4+Pj4gICAgIHZob3N0OiByZXNldCBp
bnZhbGlkYXRlX2NvdW50IGluIHZob3N0X3NldF92cmluZ19udW1fYWRkcigpCj4+Pj4gICAgIHZo
b3N0OiBtYXJrIGRpcnR5IHBhZ2VzIGR1cmluZyBtYXAgdW5pbml0Cj4+Pj4gICAgIHZob3N0OiBk
b24ndCBkbyBzeW5jaHJvbml6ZV9yY3UoKSBpbiB2aG9zdF91bmluaXRfdnFfbWFwcygpCj4+Pj4g
ICAgIHZob3N0OiBkbyBub3QgdXNlIFJDVSB0byBzeW5jaHJvbml6ZSBNTVUgbm90aWZpZXIgd2l0
aCB3b3JrZXIKPj4+PiAgICAgdmhvc3Q6IGNvcnJlY3RseSBzZXQgZGlydHkgcGFnZXMgaW4gTU1V
IG5vdGlmaWVycyBjYWxsYmFjawo+Pj4+ICAgICB2aG9zdDogZG8gbm90IHJldHVybiAtRUFHQUlO
IGZvciBub24gYmxvY2tpbmcgaW52YWxpZGF0aW9uIHRvbyBlYXJseQo+Pj4+Cj4+Pj4gICAgZHJp
dmVycy92aG9zdC92aG9zdC5jIHwgMjAyICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tLS0tLS0tLQo+Pj4+ICAgIGRyaXZlcnMvdmhvc3Qvdmhvc3QuaCB8ICAgNiArLQo+Pj4+ICAg
IDIgZmlsZXMgY2hhbmdlZCwgMTIyIGluc2VydGlvbnMoKyksIDg2IGRlbGV0aW9ucygtKQo+Pj4g
VGhpcyBnZW5lcmFsbHkgbG9va3MgbW9yZSBzb2xpZC4KPj4+Cj4+PiBCdXQgdGhpcyBhbW91bnRz
IHRvIGEgc2lnbmlmaWNhbnQgb3ZlcmhhdWwgb2YgdGhlIGNvZGUuCj4+Pgo+Pj4gQXQgdGhpcyBw
b2ludCBob3cgYWJvdXQgd2UgcmV2ZXJ0IDdmNDY2MDMyZGM5ZTVhNjEyMTdmMjJlYTM0YjJkZjkz
Mjc4NmJiZmMKPj4+IGZvciB0aGlzIHJlbGVhc2UsIGFuZCB0aGVuIHJlLWFwcGx5IGEgY29ycmVj
dGVkIHZlcnNpb24KPj4+IGZvciB0aGUgbmV4dCBvbmU/Cj4+Cj4+IElmIHBvc3NpYmxlLCBjb25z
aWRlciB3ZSd2ZSBhY3R1YWxseSBkaXNhYmxlZCB0aGUgZmVhdHVyZS4gSG93IGFib3V0IGp1c3QK
Pj4gcXVldWVkIHRob3NlIHBhdGNoZXMgZm9yIG5leHQgcmVsZWFzZT8KPj4KPj4gVGhhbmtzCj4g
U29ycnkgaWYgSSB3YXMgdW5jbGVhci4gTXkgaWRlYSBpcyB0aGF0Cj4gMS4gSSByZXZlcnQgdGhl
IGRpc2FibGVkIGNvZGUKPiAyLiBZb3Ugc2VuZCBhIHBhdGNoIHJlYWRkaW5nIGl0IHdpdGggYWxs
IHRoZSBmaXhlcyBzcXVhc2hlZAo+IDMuIE1heWJlIG9wdGltaXphdGlvbnMgb24gdG9wIHJpZ2h0
IGF3YXk/Cj4gNC4gV2UgcXVldWUgKnRoYXQqIGZvciBuZXh0IGFuZCBzZWUgd2hhdCBoYXBwZW5z
Lgo+Cj4gQW5kIHRoZSBhZHZhbnRhZ2Ugb3ZlciB0aGUgcGF0Y2h5IGFwcHJvYWNoIGlzIHRoYXQg
dGhlIGN1cnJlbnQgcGF0Y2hlcwo+IGFyZSBoYXJkIHRvIHJldmlldy4gRS5nLiAgaXQncyBub3Qg
cmVhc29uYWJsZSB0byBhc2sgUkNVIGd1eXMgdG8gcmV2aWV3Cj4gdGhlIHdob2xlIG9mIHZob3N0
IGZvciBSQ1UgdXNhZ2UgYnV0IGl0J3MgbXVjaCBtb3JlIHJlYXNvbmFibGUgdG8gYXNrCj4gYWJv
dXQgYSBzcGVjaWZpYyBwYXRjaC4KCgpPay4gVGhlbiBJIGFncmVlIHRvIHJldmVydC4KClRoYW5r
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVh
bGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRp
b24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3ZpcnR1YWxpemF0aW9u
