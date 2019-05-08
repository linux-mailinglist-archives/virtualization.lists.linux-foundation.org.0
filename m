Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DF817014
	for <lists.virtualization@lfdr.de>; Wed,  8 May 2019 06:28:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9ECFCC8F;
	Wed,  8 May 2019 04:28:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3FBF79D
	for <virtualization@lists.linux-foundation.org>;
	Wed,  8 May 2019 04:28:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B6B3B1FB
	for <virtualization@lists.linux-foundation.org>;
	Wed,  8 May 2019 04:28:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 33DDB307D987;
	Wed,  8 May 2019 04:28:51 +0000 (UTC)
Received: from [10.72.12.176] (ovpn-12-176.pek2.redhat.com [10.72.12.176])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 650282E041;
	Wed,  8 May 2019 04:28:44 +0000 (UTC)
Subject: Re: [PATCH RFC] vhost: don't use kmap() to log dirty pages
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1557195809-12373-1-git-send-email-jasowang@redhat.com>
	<20190507220526-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <84a2237e-d8cf-922c-0d0b-90009e99e8ee@redhat.com>
Date: Wed, 8 May 2019 12:28:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190507220526-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Wed, 08 May 2019 04:28:51 +0000 (UTC)
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

Ck9uIDIwMTkvNS84IOS4i+WNiDEyOjEyLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
TW9uLCBNYXkgMDYsIDIwMTkgYXQgMTA6MjM6MjlQTSAtMDQwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gVmhvc3QgbG9nIGRpcnR5IHBhZ2VzIGRpcmVjdGx5IHRvIGEgdXNlcnNwYWNlIGJpdG1hcCB0
aHJvdWdoIEdVUCBhbmQKPj4ga21hcF9hdG9taWMoKSBzaW5jZSBrZXJuZWwgZG9lc24ndCBoYXZl
IGEgc2V0X2JpdF90b191c2VyKCkKPj4gaGVscGVyLiBUaGlzIHdpbGwgY2F1c2UgaXNzdWVzIGZv
ciB0aGUgYXJjaCB0aGF0IGhhcyB2aXJ0dWFsbHkgdGFnZ2VkCj4+IGNhY2hlcy4gVGhlIHdheSB0
byBmaXggaXMgdG8ga2VlcCB1c2luZyB1c2Vyc3BhY2UgdmlydHVhbCBhZGRyZXNzLgo+Pgo+PiBG
b3J0dW5hdGVseSwgZnV0ZXggaGFzIGEgY21weGNoZyB0byB1c2Vyc3BhY2UgbWVtb3J5IGhlbHBl
cgo+PiBmdXRleF9hdG9taWNfY21weGNoZ19pbmF0b21pYygpLiBTbyBzd2l0Y2ggdG8gdXNlIGl0
IHRvIGV4Y2hhbmdlIHRoZQo+PiB1c2Vyc3BhY2UgYml0bWFwIHdpdGggemVybywgc2V0IHRoZSBi
aXQgYW5kIHRoZW4gd3JpdGUgaXQgYmFjayB0aHJvdWdoCj4+IHB1dF91c2VyKCkuCj4+Cj4+IE5v
dGU6IHRoZXJlJ3JlIGFyY2hzIChmZXcgbm9uIHBvcHVsYXIgb25lcykgdGhhdCBkb24ndCBpbXBs
ZW1lbnQKPj4gZnV0ZXggaGVscGVyLCB3ZSBjYW4ndCBsb2cgZGlydHkgcGFnZXMuIFdlIGNhbiBm
aXggdGhlbSBvbiB0b3Agb3IKPj4gc2ltcGx5IGRpc2FibGUgTE9HX0FMTCBmZWF0dXJlcyBvZiB2
aG9zdC4KPiBPciBpbXBsZW1lbnQgZnV0ZXhfYXRvbWljX2NtcHhjaGcgdXNpbmcga21hcCBpZiB0
aGV5IGRvbid0IGhhdmUKPiB2aXJ0dWFsbHkgdGFnZ2VkIGNhY2hlcy4KCgpZZXMsIHRoaXMgbWln
aHQgd29yay4KCgo+Cj4+IENjOiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGluZnJhZGVhZC5vcmc+
Cj4+IENjOiBKYW1lcyBCb3R0b21sZXkgPEphbWVzLkJvdHRvbWxleUBIYW5zZW5QYXJ0bmVyc2hp
cC5jb20+Cj4+IENjOiBBbmRyZWEgQXJjYW5nZWxpIDxhYXJjYW5nZUByZWRoYXQuY29tPgo+PiBG
aXhlczogM2E0ZDVjOTRlOTU5MyAoInZob3N0X25ldDogYSBrZXJuZWwtbGV2ZWwgdmlydGlvIHNl
cnZlciIpCj4+IFNpZ25lZC1vZmYtYnk6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+
Cj4+IC0tLQo+PiAgIGRyaXZlcnMvdmhvc3Qvdmhvc3QuYyB8IDI3ICsrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxMiBkZWxl
dGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYyBiL2RyaXZl
cnMvdmhvc3Qvdmhvc3QuYwo+PiBpbmRleCAzNTFhZjg4Li45Yzk0YzQxIDEwMDY0NAo+PiAtLS0g
YS9kcml2ZXJzL3Zob3N0L3Zob3N0LmMKPj4gKysrIGIvZHJpdmVycy92aG9zdC92aG9zdC5jCj4+
IEBAIC0zMSw2ICszMSw3IEBACj4+ICAgI2luY2x1ZGUgPGxpbnV4L3NjaGVkL3NpZ25hbC5oPgo+
PiAgICNpbmNsdWRlIDxsaW51eC9pbnRlcnZhbF90cmVlX2dlbmVyaWMuaD4KPj4gICAjaW5jbHVk
ZSA8bGludXgvbm9zcGVjLmg+Cj4+ICsjaW5jbHVkZSA8YXNtL2Z1dGV4Lmg+Cj4+ICAgCj4+ICAg
I2luY2x1ZGUgInZob3N0LmgiCj4+ICAgCj4+IEBAIC0xNjkyLDI1ICsxNjkzLDI3IEBAIGxvbmcg
dmhvc3RfZGV2X2lvY3RsKHN0cnVjdCB2aG9zdF9kZXYgKmQsIHVuc2lnbmVkIGludCBpb2N0bCwg
dm9pZCBfX3VzZXIgKmFyZ3ApCj4+ICAgfQo+PiAgIEVYUE9SVF9TWU1CT0xfR1BMKHZob3N0X2Rl
dl9pb2N0bCk7Cj4+ICAgCj4+IC0vKiBUT0RPOiBUaGlzIGlzIHJlYWxseSBpbmVmZmljaWVudC4g
IFdlIG5lZWQgc29tZXRoaW5nIGxpa2UgZ2V0X3VzZXIoKQo+PiAtICogKGluc3RydWN0aW9uIGRp
cmVjdGx5IGFjY2Vzc2VzIHRoZSBkYXRhLCB3aXRoIGFuIGV4Y2VwdGlvbiB0YWJsZSBlbnRyeQo+
PiAtICogcmV0dXJuaW5nIC1FRkFVTFQpLiBTZWUgRG9jdW1lbnRhdGlvbi94ODYvZXhjZXB0aW9u
LXRhYmxlcy50eHQuCj4+IC0gKi8KPj4gLXN0YXRpYyBpbnQgc2V0X2JpdF90b191c2VyKGludCBu
ciwgdm9pZCBfX3VzZXIgKmFkZHIpCj4+ICtzdGF0aWMgaW50IHNldF9iaXRfdG9fdXNlcihpbnQg
bnIsIHUzMiBfX3VzZXIgKmFkZHIpCj4+ICAgewo+PiAgIAl1bnNpZ25lZCBsb25nIGxvZyA9ICh1
bnNpZ25lZCBsb25nKWFkZHI7Cj4+ICAgCXN0cnVjdCBwYWdlICpwYWdlOwo+PiAtCXZvaWQgKmJh
c2U7Cj4+IC0JaW50IGJpdCA9IG5yICsgKGxvZyAlIFBBR0VfU0laRSkgKiA4Owo+PiArCXUzMiBv
bGRfbG9nOwo+PiAgIAlpbnQgcjsKPj4gICAKPj4gICAJciA9IGdldF91c2VyX3BhZ2VzX2Zhc3Qo
bG9nLCAxLCAxLCAmcGFnZSk7Cj4+ICAgCWlmIChyIDwgMCkKPj4gICAJCXJldHVybiByOwo+PiAg
IAlCVUdfT04ociAhPSAxKTsKPj4gLQliYXNlID0ga21hcF9hdG9taWMocGFnZSk7Cj4+IC0Jc2V0
X2JpdChiaXQsIGJhc2UpOwo+PiAtCWt1bm1hcF9hdG9taWMoYmFzZSk7Cj4+ICsKPj4gKwlyID0g
ZnV0ZXhfYXRvbWljX2NtcHhjaGdfaW5hdG9taWMoJm9sZF9sb2csIGFkZHIsIDAsIDApOwo+PiAr
CWlmIChyIDwgMCkKPj4gKwkJcmV0dXJuIHI7Cj4gU28gSSB0aGluayB0aGlzIGlzIGEgZ3JlYXQg
aWRlYSEKPgo+IEhvd2V2ZXIgb25lIGlzc3VlIGhlcmUgaXMgdGhhdCBmdXRleF9hdG9taWNfY21w
eGNoZ19pbmF0b21pYyB3aWxsIGZhaWwgaWYgdGhlCj4gcGFnZSBpcyBzd2FwcGVkIG91dC4gSSBz
dXNwZWN0IHdlIG5lZWQgYSB2YXJpYW50IHRoYXQgYmxvY2tzIHRoZSB0aHJlYWQKPiBpbnN0ZWFk
LgoKCkkgZ3Vlc3Mgbm90IHNpbmNlIHRoZSBwYXRjaCBzdGlsbCB0cnkgdG8gcGluIHRoZSBwYWdl
IGJlZm9yZS4KClRoYW5rcwoKCj4KPj4gKwo+PiArCW9sZF9sb2cgfD0gMSA8PCBucjsKPj4gKwly
ID0gcHV0X3VzZXIob2xkX2xvZywgYWRkcik7Cj4+ICsJaWYgKHIgPCAwKQo+PiArCQlyZXR1cm4g
cjsKPj4gKwo+PiAgIAlzZXRfcGFnZV9kaXJ0eV9sb2NrKHBhZ2UpOwo+PiAgIAlwdXRfcGFnZShw
YWdlKTsKPj4gICAJcmV0dXJuIDA7Cj4+IEBAIC0xNzI3LDggKzE3MzAsOCBAQCBzdGF0aWMgaW50
IGxvZ193cml0ZSh2b2lkIF9fdXNlciAqbG9nX2Jhc2UsCj4+ICAgCXdyaXRlX2xlbmd0aCArPSB3
cml0ZV9hZGRyZXNzICUgVkhPU1RfUEFHRV9TSVpFOwo+PiAgIAlmb3IgKDs7KSB7Cj4+ICAgCQl1
NjQgYmFzZSA9ICh1NjQpKHVuc2lnbmVkIGxvbmcpbG9nX2Jhc2U7Cj4+IC0JCXU2NCBsb2cgPSBi
YXNlICsgd3JpdGVfcGFnZSAvIDg7Cj4+IC0JCWludCBiaXQgPSB3cml0ZV9wYWdlICUgODsKPj4g
KwkJdTY0IGxvZyA9IGJhc2UgKyB3cml0ZV9wYWdlIC8gMzI7Cj4+ICsJCWludCBiaXQgPSB3cml0
ZV9wYWdlICUgMzI7Cj4+ICAgCQlpZiAoKHU2NCkodW5zaWduZWQgbG9uZylsb2cgIT0gbG9nKQo+
PiAgIAkJCXJldHVybiAtRUZBVUxUOwo+PiAgIAkJciA9IHNldF9iaXRfdG9fdXNlcihiaXQsICh2
b2lkIF9fdXNlciAqKSh1bnNpZ25lZCBsb25nKWxvZyk7Cj4+IC0tIAo+PiAxLjguMy4xCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9u
IG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpo
dHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFs
aXphdGlvbg==
