Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E5216F8C
	for <lists.virtualization@lfdr.de>; Wed,  8 May 2019 05:43:34 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CF8B7B7D;
	Wed,  8 May 2019 03:43:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A0BBF9D
	for <virtualization@lists.linux-foundation.org>;
	Wed,  8 May 2019 03:43:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 31F92196
	for <virtualization@lists.linux-foundation.org>;
	Wed,  8 May 2019 03:43:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 94D853087944;
	Wed,  8 May 2019 03:43:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82EFC60C4E;
	Wed,  8 May 2019 03:43:25 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 28F5E65D13;
	Wed,  8 May 2019 03:43:25 +0000 (UTC)
Date: Tue, 7 May 2019 23:43:24 -0400 (EDT)
From: Jason Wang <jasowang@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <1430527294.27174562.1557287004441.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190507154753.GA8809@infradead.org>
References: <20190507154753.GA8809@infradead.org>
Subject: Re: [PATCH RFC] vhost: don't use kmap() to log dirty pages
MIME-Version: 1.0
X-Originating-IP: [10.68.5.20, 10.4.195.23]
Thread-Topic: vhost: don't use kmap() to log dirty pages
Thread-Index: K7z0d3UL1bhTV/QW5Sb3gPqIWKhUvg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Wed, 08 May 2019 03:43:25 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Andrea Arcangeli <aarcange@redhat.com>, kvm@vger.kernel.org, mst@redhat.com,
	Peter Zijlstra <peterz@infradead.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Ingo Molnar <mingo@redhat.com>, Darren Hart <dvhart@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

T24gMjAxOS81Lzcg5LiL5Y2IMTE6NDcsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+IE9uIE1v
biwgTWF5IDA2LCAyMDE5IGF0IDEwOjIzOjI5UE0gLTA0MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+
IE5vdGU6IHRoZXJlJ3JlIGFyY2hzIChmZXcgbm9uIHBvcHVsYXIgb25lcykgdGhhdCBkb24ndCBp
bXBsZW1lbnQKPj4gZnV0ZXggaGVscGVyLCB3ZSBjYW4ndCBsb2cgZGlydHkgcGFnZXMuIFdlIGNh
biBmaXggdGhlbSBvbiB0b3Agb3IKPj4gc2ltcGx5IGRpc2FibGUgTE9HX0FMTCBmZWF0dXJlcyBv
ZiB2aG9zdC4KPgo+IFRoYXQgbWVhbnMgdmhvc3Qgbm93IGhhcyB0byBkZXBlbmQgb24gSEFWRV9G
VVRFWF9DTVBYQ0hHIHRvIG1ha2UKPiBzdXJlIHdlIGhhdmUgYSB3b3JraW5nIGltcGxlbWVudGF0
aW9uLgoKSSBmb3VuZCBIQVZFX0ZVVEVYX0NNUFhDSEcgaXMgbm90IGEgbXVzdCBmb3IgYXJjaCB0
aGF0IGhhcyB0aGUKaW1wbGVtZW50YXRpb24gYW5kIGZ1dGV4IGRvZXMgc29tZSBraW5kIG9mIHJ1
bnRpbWUgZGV0ZWN0aW9uIGxpa2U6CgpzdGF0aWMgdm9pZCBfX2luaXQgZnV0ZXhfZGV0ZWN0X2Nt
cHhjaGcodm9pZCkKewojaWZuZGVmIENPTkZJR19IQVZFX0ZVVEVYX0NNUFhDSEcKCXUzMiBjdXJ2
YWw7CgoJLyoKCSAqIFRoaXMgd2lsbCBmYWlsIGFuZCB3ZSB3YW50IGl0LiBTb21lIGFyY2ggaW1w
bGVtZW50YXRpb25zIGRvCgkgKiBydW50aW1lIGRldGVjdGlvbiBvZiB0aGUgZnV0ZXhfYXRvbWlj
X2NtcHhjaGdfaW5hdG9taWMoKQoJICogZnVuY3Rpb25hbGl0eS4gV2Ugd2FudCB0byBrbm93IHRo
YXQgYmVmb3JlIHdlIGNhbGwgaW4gYW55CgkgKiBvZiB0aGUgY29tcGxleCBjb2RlIHBhdGhzLiBB
bHNvIHdlIHdhbnQgdG8gcHJldmVudAoJICogcmVnaXN0cmF0aW9uIG9mIHJvYnVzdCBsaXN0cyBp
biB0aGF0IGNhc2UuIE5VTEwgaXMKCSAqIGd1YXJhbnRlZWQgdG8gZmF1bHQgYW5kIHdlIGdldCAt
RUZBVUxUIG9uIGZ1bmN0aW9uYWwKCSAqIGltcGxlbWVudGF0aW9uLCB0aGUgbm9uLWZ1bmN0aW9u
YWwgb25lcyB3aWxsIHJldHVybgoJICogLUVOT1NZUy4KCSAqLwoJaWYgKGNtcHhjaGdfZnV0ZXhf
dmFsdWVfbG9ja2VkKCZjdXJ2YWwsIE5VTEwsIDAsIDApID09IC1FRkFVTFQpCgkJZnV0ZXhfY21w
eGNoZ19lbmFibGVkID0gMTsKI2VuZGlmCn0KCgo+Cj4KPj4gICNpbmNsdWRlIDxsaW51eC9zY2hl
ZC9zaWduYWwuaD4KPj4gICNpbmNsdWRlIDxsaW51eC9pbnRlcnZhbF90cmVlX2dlbmVyaWMuaD4K
Pj4gICNpbmNsdWRlIDxsaW51eC9ub3NwZWMuaD4KPj4gKyNpbmNsdWRlIDxhc20vZnV0ZXguaD4K
Pgo+IEFsc28gcGxlYXNlIGluY2x1ZGUgdGhlIGZ1dGV4IG1haW50YWluZXJzIHRvIG1ha2Ugc3Vy
ZSB0aGV5IGFyZSBmaW5lCj4gd2l0aCB0aGlzIGZpcnN0IHVzYWdlIG9mIDxhc20vZnV0ZXguaD4g
b3V0c2lkZSBvZiBrZXJuZWwvZnV0ZXguYy4KPgoKVGhhbmtzIGZvciBjY2luZyB0aGVtLiBXaWxs
IGRvIGZvciBuZXh0IHZlcnNpb24uCgpJZiB3ZSBkZWNpZGUgdG8gZ28gdGhpcyB3YXksIHdlIHBy
b2JhYmx5IG5lZWQgdG8gbW92ZSBpdCB0byB1YWNjZXNzCmZvciBhIG1vcmUgZ2VuZXJpYyBoZWxw
ZXIuCgo+Cj4+ICtzdGF0aWMgaW50IHNldF9iaXRfdG9fdXNlcihpbnQgbnIsIHUzMiBfX3VzZXIg
KmFkZHIpCj4+ICB7Cj4+ICAJdW5zaWduZWQgbG9uZyBsb2cgPSAodW5zaWduZWQgbG9uZylhZGRy
Owo+PiAgCXN0cnVjdCBwYWdlICpwYWdlOwo+PiArCXUzMiBvbGRfbG9nOwo+PiAgCWludCByOwo+
PiAgCj4+ICAJciA9IGdldF91c2VyX3BhZ2VzX2Zhc3QobG9nLCAxLCAxLCAmcGFnZSk7Cj4+ICAJ
aWYgKHIgPCAwKQo+PiAgCQlyZXR1cm4gcjsKPj4gIAlCVUdfT04ociAhPSAxKTsKPj4gKwo+PiAr
CXIgPSBmdXRleF9hdG9taWNfY21weGNoZ19pbmF0b21pYygmb2xkX2xvZywgYWRkciwgMCwgMCk7
Cj4+ICsJaWYgKHIgPCAwKQo+PiArCQlyZXR1cm4gcjsKPj4gKwo+PiArCW9sZF9sb2cgfD0gMSA8
PCBucjsKPj4gKwlyID0gcHV0X3VzZXIob2xkX2xvZywgYWRkcik7Cj4+ICsJaWYgKHIgPCAwKQo+
PiArCQlyZXR1cm4gcjsKPgo+IEFuZCB0aGlzIGp1c3QgbG9va3Mgb2RkIHRvIG1lLiAgV2h5IGRv
IHdlIG5lZWQgdGhlIGZ1dGV4IGNhbGwgdG8KPiByZXBsYWNlIGEgMCB2YWx1ZSB3aXRoIDA/ICBX
aHkgZG9lcyBpdCBzdGlsbCBkdXBsaWNhdGUgdGhlCj4gcHV0X3VzZXI/ICBUaGlzIGRvZXNuJ3Qg
bG9vayBsaWtlIGFjdHVhbGx5IHdvcmtpbmcgY29kZSB0byBtZS4KClllcywgdGhpcyBpcyBhIGJ1
Zy4gU2hvdWxkIGJlIHNvbWV0aGluZyBsaWtlOgoKc3RhdGljIGludCBzZXRfYml0X3RvX3VzZXIo
aW50IG5yLCB1MzIgX191c2VyICphZGRyKQp7CiAgICAgICAgdW5zaWduZWQgbG9uZyBsb2cgPSAo
dW5zaWduZWQgbG9uZylhZGRyOwogICAgICAgIHN0cnVjdCBwYWdlICpwYWdlOwogICAgICAgIHUz
MiBvbGRfbG9nLCBuZXdfbG9nLCBsOwogICAgICAgIGludCByOwoKICAgICAgICByID0gZ2V0X3Vz
ZXJfcGFnZXNfZmFzdChsb2csIDEsIDEsICZwYWdlKTsKICAgICAgICBpZiAociA8IDApCiAgICAg
ICAgICAgICAgICByZXR1cm4gcjsKCUJVR19PTihyICE9IDEpOwoKICAgICAgICBkbyB7CiAgICAg
ICAgICAgICAgICByID0gZ2V0X3VzZXIob2xkX2xvZywgYWRkcik7CiAgICAgICAgICAgICAgICBp
ZiAociA8IDApCiAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByOwogICAgICAgICAgICAg
ICAgbmV3X2xvZyA9IG9sZF9sb2cgfCAoMSA8PCBucik7CgkJciA9IGZ1dGV4X2F0b21pY19jbXB4
Y2hnX2luYXRvbWljKCZsLCBhZGRyLCBvbGRfbG9nLCBuZXdfbG9nKTsKICAgICAgICAgICAgICAg
IGlmIChyIDwgMCkKICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHI7CiAgICAgICAgfSB3
aGlsZShsICE9IG5ld19sb2cpOwoKCXNldF9wYWdlX2RpcnR5X2xvY2socGFnZSk7CiAgICAgICAg
cHV0X3BhZ2UocGFnZSk7CiAgICAgICAgcmV0dXJuIDA7Cn0KCj4KPiBBbHNvIGRvbid0IHdlIG5l
ZWQgYSBwYWdlZmF1bHRfZGlzYWJsZSgpIGFyb3VuZAo+IGZ1dGV4X2F0b21pY19jbXB4Y2hnX2lu
YXRvbWljPwoKU2luY2Ugd2UgZG9uJ3Qgd2FudCB0byBkZWFsIHdpdGggcGFnZWZhdWx0LCBzbyB0
aGUgcGFnZSBoYXMgYmVlbgpwaW5uZWQgYmVmb3JlIGZ1dGV4X2F0b21pY19jbXB4Y2hnX2luYXRv
bWljKCkuCgpUaGFua3MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxp
bnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWls
bWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
