Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2931E6F6
	for <lists.virtualization@lfdr.de>; Wed, 15 May 2019 04:55:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 810CCAC7;
	Wed, 15 May 2019 02:55:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C859CAC7
	for <virtualization@lists.linux-foundation.org>;
	Wed, 15 May 2019 02:55:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3621227B
	for <virtualization@lists.linux-foundation.org>;
	Wed, 15 May 2019 02:55:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 97B25308123F;
	Wed, 15 May 2019 02:55:43 +0000 (UTC)
Received: from [10.72.12.103] (ovpn-12-103.pek2.redhat.com [10.72.12.103])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3C576608A6;
	Wed, 15 May 2019 02:55:36 +0000 (UTC)
Subject: Re: [PATCH net] vhost: don't use kmap() to log dirty pages
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1557725265-63525-1-git-send-email-jasowang@redhat.com>
	<20190514181150-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d4b64662-42b3-3ac3-0019-92935acb6bc7@redhat.com>
Date: Wed, 15 May 2019 10:55:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190514181150-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Wed, 15 May 2019 02:55:43 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Andrea Arcangeli <aarcange@redhat.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Christoph Hellwig <hch@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Darren Hart <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
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

Ck9uIDIwMTkvNS8xNSDkuIrljYg2OjE2LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
TW9uLCBNYXkgMTMsIDIwMTkgYXQgMDE6Mjc6NDVBTSAtMDQwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gVmhvc3QgbG9nIGRpcnR5IHBhZ2VzIGRpcmVjdGx5IHRvIGEgdXNlcnNwYWNlIGJpdG1hcCB0
aHJvdWdoIEdVUCBhbmQKPj4ga21hcF9hdG9taWMoKSBzaW5jZSBrZXJuZWwgZG9lc24ndCBoYXZl
IGEgc2V0X2JpdF90b191c2VyKCkKPj4gaGVscGVyLiBUaGlzIHdpbGwgY2F1c2UgaXNzdWVzIGZv
ciB0aGUgYXJjaCB0aGF0IGhhcyB2aXJ0dWFsbHkgdGFnZ2VkCj4+IGNhY2hlcy4gVGhlIHdheSB0
byBmaXggaXMgdG8ga2VlcCB1c2luZyB1c2Vyc3BhY2UgdmlydHVhbAo+PiBhZGRyZXNzLiBGb3J0
dW5hdGVseSwgZnV0ZXggaGFzIGFyY2hfZnV0ZXhfYXRvbWljX29wX2ludXNlcigpIHdoaWNoCj4+
IGNvdWxkIGJlIHVzZWQgZm9yIHNldHRpbmcgYSBiaXQgdG8gdXNlci4KPj4KPj4gTm90ZSB0aGVy
ZSdyZSBzZXZlcmFsIGNhc2VzIHRoYXQgZnV0ZXggaGVscGVyIGNhbiBmYWlsIGUuZyBhIHBhZ2UK
Pj4gZmF1bHQgb3IgdGhlIGFyY2ggdGhhdCBkb2Vzbid0IGhhdmUgdGhlIHN1cHBvcnQuIEZvciB0
aG9zZSBjYXNlcywgYQo+PiBzaW1wbGlmaWVkIGdldF91c2VyKCkvcHV0X3VzZXIoKSBwYWlyIHBy
b3RlY3RlZCBieSBhIGdsb2JhbCBtdXRleCBpcwo+PiBwcm92aWRlZCBhcyBhIGZhbGxiYWNrLiBU
aGUgZmFsbGJhY2sgbWF5IGxlYWQgZmFsc2UgcG9zaXRpdmUgdGhhdAo+PiB1c2Vyc3BhY2UgbWF5
IHNlZSBtb3JlIGRpcnR5IHBhZ2VzLgo+Pgo+PiBDYzogQ2hyaXN0b3BoIEhlbGx3aWc8aGNoQGlu
ZnJhZGVhZC5vcmc+Cj4+IENjOiBKYW1lcyBCb3R0b21sZXk8SmFtZXMuQm90dG9tbGV5QEhhbnNl
blBhcnRuZXJzaGlwLmNvbT4KPj4gQ2M6IEFuZHJlYSBBcmNhbmdlbGk8YWFyY2FuZ2VAcmVkaGF0
LmNvbT4KPj4gQ2M6IFRob21hcyBHbGVpeG5lcjx0Z2x4QGxpbnV0cm9uaXguZGU+Cj4+IENjOiBJ
bmdvIE1vbG5hcjxtaW5nb0ByZWRoYXQuY29tPgo+PiBDYzogUGV0ZXIgWmlqbHN0cmE8cGV0ZXJ6
QGluZnJhZGVhZC5vcmc+Cj4+IENjOiBEYXJyZW4gSGFydDxkdmhhcnRAaW5mcmFkZWFkLm9yZz4K
Pj4gRml4ZXM6IDNhNGQ1Yzk0ZTk1OTMgKCJ2aG9zdF9uZXQ6IGEga2VybmVsLWxldmVsIHZpcnRp
byBzZXJ2ZXIiKQo+PiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBXYW5nPGphc293YW5nQHJlZGhhdC5j
b20+Cj4+IC0tLQo+PiBDaGFuZ2VzIGZyb20gUkZDIFYyOgo+PiAtIGRyb3AgR1VQIGFuZCBwcm92
aWRlIGdldF91c2VyKCkvcHV0X3VzZXIoKSBmYWxsYmFja3MKPj4gLSByb3VuZCBkb3duIGxvZ19i
YXNlCj4+IENoYW5nZXMgZnJvbSBSRkMgVjE6Cj4+IC0gc3dpdGNoIHRvIHVzZSBhcmNoX2Z1dGV4
X2F0b21pY19vcF9pbnVzZXIoKQo+PiAtLS0KPj4gICBkcml2ZXJzL3Zob3N0L3Zob3N0LmMgfCA1
NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4g
ICAxIGZpbGUgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0pCj4+Cj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L3Zob3N0LmMgYi9kcml2ZXJzL3Zob3N0L3Zob3N0
LmMKPj4gaW5kZXggMzUxYWY4OC4uN2ZhMDViYSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy92aG9z
dC92aG9zdC5jCj4+ICsrKyBiL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYwo+PiBAQCAtMzEsNiArMzEs
NyBAQAo+PiAgICNpbmNsdWRlIDxsaW51eC9zY2hlZC9zaWduYWwuaD4KPj4gICAjaW5jbHVkZSA8
bGludXgvaW50ZXJ2YWxfdHJlZV9nZW5lcmljLmg+Cj4+ICAgI2luY2x1ZGUgPGxpbnV4L25vc3Bl
Yy5oPgo+PiArI2luY2x1ZGUgPGFzbS9mdXRleC5oPgo+PiAgIAo+PiAgICNpbmNsdWRlICJ2aG9z
dC5oIgo+PiAgIAo+PiBAQCAtNDMsNiArNDQsOCBAQAo+PiAgIE1PRFVMRV9QQVJNX0RFU0MobWF4
X2lvdGxiX2VudHJpZXMsCj4+ICAgCSJNYXhpbXVtIG51bWJlciBvZiBpb3RsYiBlbnRyaWVzLiAo
ZGVmYXVsdDogMjA0OCkiKTsKPj4gICAKPj4gK3N0YXRpYyBERUZJTkVfTVVURVgodmhvc3RfbG9n
X2xvY2spOwo+PiArCj4+ICAgZW51bSB7Cj4+ICAgCVZIT1NUX01FTU9SWV9GX0xPRyA9IDB4MSwK
Pj4gICB9Owo+PiBAQCAtMTY5MiwyOCArMTY5NSwzMSBAQCBsb25nIHZob3N0X2Rldl9pb2N0bChz
dHJ1Y3Qgdmhvc3RfZGV2ICpkLCB1bnNpZ25lZCBpbnQgaW9jdGwsIHZvaWQgX191c2VyICphcmdw
KQo+PiAgIH0KPj4gICBFWFBPUlRfU1lNQk9MX0dQTCh2aG9zdF9kZXZfaW9jdGwpOwo+PiAgIAo+
PiAtLyogVE9ETzogVGhpcyBpcyByZWFsbHkgaW5lZmZpY2llbnQuICBXZSBuZWVkIHNvbWV0aGlu
ZyBsaWtlIGdldF91c2VyKCkKPj4gLSAqIChpbnN0cnVjdGlvbiBkaXJlY3RseSBhY2Nlc3NlcyB0
aGUgZGF0YSwgd2l0aCBhbiBleGNlcHRpb24gdGFibGUgZW50cnkKPj4gLSAqIHJldHVybmluZyAt
RUZBVUxUKS4gU2VlIERvY3VtZW50YXRpb24veDg2L2V4Y2VwdGlvbi10YWJsZXMudHh0Lgo+PiAt
ICovCj4+IC1zdGF0aWMgaW50IHNldF9iaXRfdG9fdXNlcihpbnQgbnIsIHZvaWQgX191c2VyICph
ZGRyKQo+PiArc3RhdGljIGludCBzZXRfYml0X3RvX3VzZXIoaW50IG5yLCB1MzIgX191c2VyICph
ZGRyKQo+PiAgIHsKPj4gLQl1bnNpZ25lZCBsb25nIGxvZyA9ICh1bnNpZ25lZCBsb25nKWFkZHI7
Cj4+IC0Jc3RydWN0IHBhZ2UgKnBhZ2U7Cj4+IC0Jdm9pZCAqYmFzZTsKPj4gLQlpbnQgYml0ID0g
bnIgKyAobG9nICUgUEFHRV9TSVpFKSAqIDg7Cj4+ICsJdTMyIG9sZDsKPj4gICAJaW50IHI7Cj4+
ICAgCj4+IC0JciA9IGdldF91c2VyX3BhZ2VzX2Zhc3QobG9nLCAxLCAxLCAmcGFnZSk7Cj4+IC0J
aWYgKHIgPCAwKQo+PiAtCQlyZXR1cm4gcjsKPj4gLQlCVUdfT04ociAhPSAxKTsKPj4gLQliYXNl
ID0ga21hcF9hdG9taWMocGFnZSk7Cj4+IC0Jc2V0X2JpdChiaXQsIGJhc2UpOwo+PiAtCWt1bm1h
cF9hdG9taWMoYmFzZSk7Cj4+IC0Jc2V0X3BhZ2VfZGlydHlfbG9jayhwYWdlKTsKPj4gLQlwdXRf
cGFnZShwYWdlKTsKPj4gKwlyID0gYXJjaF9mdXRleF9hdG9taWNfb3BfaW51c2VyKEZVVEVYX09Q
X09SLCAxIDw8IG5yLCAmb2xkLCBhZGRyKTsKPj4gKwlpZiAocikgewo+PiArCQkvKiBGYWxsYmFj
ayB0aHJvdWdoIGdldF91c2VyKCkvcHV0X3VzZXIoKSwgdGhpcyBtYXkKPj4gKwkJICogbGVhZCBm
YWxzZSBwb3NpdGl2ZSB0aGF0IHVzZXJzcGFjZSBtYXkgc2VlIG1vcmUKPj4gKwkJICogZGlydHkg
cGFnZXMuIEEgbXV0ZXggaXMgdXNlZCB0byBzeW5jaHJvbml6ZSBsb2cKPj4gKwkJICogYWNjZXNz
IGJldHdlZW4gdmhvc3QgdGhyZWFkcy4KPj4gKwkJICovCj4+ICsJCW11dGV4X2xvY2soJnZob3N0
X2xvZ19sb2NrKTsKPj4gKwkJciA9IGdldF91c2VyKG9sZCwgYWRkcik7Cj4+ICsJCWlmIChyKQo+
PiArCQkJZ290byBlcnI7Cj4+ICsJCXIgPSBwdXRfdXNlcihvbGQgfCAxIDw8IG5yLCBhZGRyKTsK
Pj4gKwkJaWYgKHIpCj4+ICsJCQlnb3RvIGVycjsKPj4gKwkJbXV0ZXhfdW5sb2NrKCZ2aG9zdF9s
b2dfbG9jayk7Cj4+ICsJfQo+IFByb2JsZW0gaXMsIHdlIGFsd2F5cyBzYWlkIGl0J3MgYXRvbWlj
Lgo+Cj4gVGhpcyB0cmljayB3aWxsIHdvcmsgaWYgdXNlcnNwYWNlIG9ubHkgY2xlYXJzIGJpdHMK
PiBpbiB0aGUgbG9nLCBidXQgd29uJ3QgaWYgaXQgc2V0cyBiaXRzIGluIHRoZSBsb2cuCj4gRS5n
LiByZXVzaW5nIHRoZSBsb2cgc3RydWN0dXJlIGZvciB2aG9zdC11c2VyCj4gd2lsbCBoYXZlIGV4
YWN0bHkgdGhpcyBlZmZlY3QuCj4KCk9rLCBJIGFkbWl0IHRoaXMgaXMgYW4gaXNzdWUuCgpUaGVu
IEkgdGhpbmsgbWF5YmUgd2UgY2FuIHNpbXBseSBmYWxsYmFjayB0byBhIHU4IHB1dF91c2VyKCkg
d2hpY2ggaXMgCmd1YXJhbnRlZWQgdG8gYmUgYXRvbWljIGxpa2U6CgpwdXRfdXNlcigweEYsIGFk
ZHIpOwoKVGhlbiB3ZSBtYXkgYXQgbW9zdCBoYXZlIDcgbW9yZSBkaXJ0eSBwYWdlcyB0byBiZSBz
ZWVuIGJ5IGd1ZXN0LiAKQ29uc2lkZXIgZnV0ZXggaGVscGVyIGlzIGltcGxlbWVudGVkIGlzIG1v
c3QgYXJjaGl0ZWN0dXJlcyBhbmQgaXQncyAKbGlrZWx5IHRvIHN1Y2NlZWQuIEl0IHNob3VsZCBi
ZSBhY2NlcHRhYmxlLgoKRG9lcyB0aGlzIG1ha2Ugc2Vuc2U/CgpUaGFua3MKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxp
bmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlv
bg==
