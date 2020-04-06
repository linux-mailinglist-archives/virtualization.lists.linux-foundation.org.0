Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD5219F700
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 15:34:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D9D6D232BD;
	Mon,  6 Apr 2020 13:34:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KmG-bbGPqhjo; Mon,  6 Apr 2020 13:34:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 75D21233B8;
	Mon,  6 Apr 2020 13:34:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5D4EBC0177;
	Mon,  6 Apr 2020 13:34:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3E15CC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 13:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2697E2046E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 13:34:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cE32-V7AflPc
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 13:34:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id A9EB1233B0
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 13:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586180051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Vgo7PmY6XRwUGwyUrdIW6ngf/mYRofULc4TfPkTyZY=;
 b=BvPejWvF62X0MSz4WOnQPwDCcuOdqhbs17F7VAiAlgvk+sl+hntau1izK/X+iXgXT63dDQ
 JQ72OCE8HVjs2mmWWlWCHhZfONUFW0GctMevBxMWGs26leDam6C0XSx3BQYZhI2U8hnmCX
 cLUbsdHzt13NLPucFe+sAChNF4Dry4s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-OOOB-UXuOJGo5RROJLVUvg-1; Mon, 06 Apr 2020 09:34:07 -0400
X-MC-Unique: OOOB-UXuOJGo5RROJLVUvg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C015801E5C;
 Mon,  6 Apr 2020 13:34:06 +0000 (UTC)
Received: from [10.72.12.191] (ovpn-12-191.pek2.redhat.com [10.72.12.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD718B19CB;
 Mon,  6 Apr 2020 13:34:01 +0000 (UTC)
Subject: Re: [PATCH] vhost: force spec specified alignment on types
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20200406124931.120768-1-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <045c84ed-151e-a850-9c72-5079bd2775e6@redhat.com>
Date: Mon, 6 Apr 2020 21:34:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200406124931.120768-1-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: netdev@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjAvNC82IOS4i+WNiDg6NTAsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBUaGUg
cmluZyBlbGVtZW50IGFkZHJlc3NlcyBhcmUgcGFzc2VkIGJldHdlZW4gY29tcG9uZW50cyB3aXRo
IGRpZmZlcmVudAo+IGFsaWdubWVudHMgYXNzdW1wdGlvbnMuIFRodXMsIGlmIGd1ZXN0L3VzZXJz
cGFjZSBzZWxlY3RzIGEgcG9pbnRlciBhbmQKPiBob3N0IHRoZW4gZ2V0cyBhbmQgZGVyZWZlcmVu
Y2VzIGl0LCB3ZSBtaWdodCBuZWVkIHRvIGRlY3JlYXNlIHRoZQo+IGNvbXBpbGVyLXNlbGVjdGVk
IGFsaWdubWVudCB0byBwcmV2ZW50IGNvbXBpbGVyIG9uIHRoZSBob3N0IGZyb20KPiBhc3N1bWlu
ZyBwb2ludGVyIGlzIGFsaWduZWQuCj4KPiBUaGlzIGFjdHVhbGx5IHRyaWdnZXJzIG9uIEFSTSB3
aXRoIC1tYWJpPWFwY3MtZ251IC0gd2hpY2ggaXMgYQo+IGRlcHJlY2F0ZWQgY29uZmlndXJhdGlv
biwgYnV0IGl0IHNlZW1zIHNhZmVyIHRvIGhhbmRsZSB0aGlzCj4gZ2VuZXJhbGx5Lgo+Cj4gSSB2
ZXJpZmllZCB0aGF0IHRoZSBwcm9kdWNlZCBiaW5hcnkgaXMgZXhhY3RseSBpZGVudGljYWwgb24g
eDg2Lgo+Cj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNv
bT4KPiAtLS0KPgo+IFRoaXMgaXMgbXkgcHJlZmVycmVkIHdheSB0byBoYW5kbGUgdGhlIEFSTSBp
bmNvbXBhdGliaWxpdHkgaXNzdWVzCj4gKGluIHByZWZlcmVuY2UgdG8ga2NvbmZpZyBoYWNrcyku
Cj4gSSB3aWxsIHB1c2ggdGhpcyBpbnRvIG5leHQgbm93Lgo+IENvbW1lbnRzPwoKCkknbSBub3Qg
c3VyZSBpZiBpdCdzIHRvbyBsYXRlIHRvIGZpeC4gSXQgd291bGQgc3RpbGwgYmUgc3RpbGwgCnBy
b2JsZW1hdGljIGZvciB0aGUgdXNlcnNwYWNlIHRoYXQgaXMgdXNpbmcgb2xkIHVhcGkgaGVhZGVy
cz8KClRoYW5rcwoKCj4KPiAgIGRyaXZlcnMvdmhvc3Qvdmhvc3QuaCAgICAgICAgICAgIHwgIDYg
KystLS0KPiAgIGluY2x1ZGUvdWFwaS9saW51eC92aXJ0aW9fcmluZy5oIHwgNDEgKysrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9u
cygrKSwgMTMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC92aG9z
dC5oIGIvZHJpdmVycy92aG9zdC92aG9zdC5oCj4gaW5kZXggY2M4MjkxODE1OGQyLi5hNjdiZGE5
NzkyZWMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aG9zdC92aG9zdC5oCj4gKysrIGIvZHJpdmVy
cy92aG9zdC92aG9zdC5oCj4gQEAgLTc0LDkgKzc0LDkgQEAgc3RydWN0IHZob3N0X3ZpcnRxdWV1
ZSB7Cj4gICAJLyogVGhlIGFjdHVhbCByaW5nIG9mIGJ1ZmZlcnMuICovCj4gICAJc3RydWN0IG11
dGV4IG11dGV4Owo+ICAgCXVuc2lnbmVkIGludCBudW07Cj4gLQlzdHJ1Y3QgdnJpbmdfZGVzYyBf
X3VzZXIgKmRlc2M7Cj4gLQlzdHJ1Y3QgdnJpbmdfYXZhaWwgX191c2VyICphdmFpbDsKPiAtCXN0
cnVjdCB2cmluZ191c2VkIF9fdXNlciAqdXNlZDsKPiArCXZyaW5nX2Rlc2NfdCBfX3VzZXIgKmRl
c2M7Cj4gKwl2cmluZ19hdmFpbF90IF9fdXNlciAqYXZhaWw7Cj4gKwl2cmluZ191c2VkX3QgX191
c2VyICp1c2VkOwo+ICAgCWNvbnN0IHN0cnVjdCB2aG9zdF9pb3RsYl9tYXAgKm1ldGFfaW90bGJb
VkhPU1RfTlVNX0FERFJTXTsKPiAgIAo+ICAgCXN0cnVjdCB2aG9zdF9kZXNjICpkZXNjczsKPiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4L3ZpcnRpb19yaW5nLmggYi9pbmNsdWRlL3Vh
cGkvbGludXgvdmlydGlvX3JpbmcuaAo+IGluZGV4IDU1OWY0MmU3MzMxNS4uY2Q2ZTBiMmVhZjJm
IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC92aXJ0aW9fcmluZy5oCj4gKysrIGIv
aW5jbHVkZS91YXBpL2xpbnV4L3ZpcnRpb19yaW5nLmgKPiBAQCAtMTE4LDE2ICsxMTgsNiBAQCBz
dHJ1Y3QgdnJpbmdfdXNlZCB7Cj4gICAJc3RydWN0IHZyaW5nX3VzZWRfZWxlbSByaW5nW107Cj4g
ICB9Owo+ICAgCj4gLXN0cnVjdCB2cmluZyB7Cj4gLQl1bnNpZ25lZCBpbnQgbnVtOwo+IC0KPiAt
CXN0cnVjdCB2cmluZ19kZXNjICpkZXNjOwo+IC0KPiAtCXN0cnVjdCB2cmluZ19hdmFpbCAqYXZh
aWw7Cj4gLQo+IC0Jc3RydWN0IHZyaW5nX3VzZWQgKnVzZWQ7Cj4gLX07Cj4gLQo+ICAgLyogQWxp
Z25tZW50IHJlcXVpcmVtZW50cyBmb3IgdnJpbmcgZWxlbWVudHMuCj4gICAgKiBXaGVuIHVzaW5n
IHByZS12aXJ0aW8gMS4wIGxheW91dCwgdGhlc2UgZmFsbCBvdXQgbmF0dXJhbGx5Lgo+ICAgICov
Cj4gQEAgLTE2NCw2ICsxNTQsMzcgQEAgc3RydWN0IHZyaW5nIHsKPiAgICNkZWZpbmUgdnJpbmdf
dXNlZF9ldmVudCh2cikgKCh2ciktPmF2YWlsLT5yaW5nWyh2ciktPm51bV0pCj4gICAjZGVmaW5l
IHZyaW5nX2F2YWlsX2V2ZW50KHZyKSAoKihfX3ZpcnRpbzE2ICopJih2ciktPnVzZWQtPnJpbmdb
KHZyKS0+bnVtXSkKPiAgIAo+ICsvKgo+ICsgKiBUaGUgcmluZyBlbGVtZW50IGFkZHJlc3NlcyBh
cmUgcGFzc2VkIGJldHdlZW4gY29tcG9uZW50cyB3aXRoIGRpZmZlcmVudAo+ICsgKiBhbGlnbm1l
bnRzIGFzc3VtcHRpb25zLiBUaHVzLCB3ZSBtaWdodCBuZWVkIHRvIGRlY3JlYXNlIHRoZSBjb21w
aWxlci1zZWxlY3RlZAo+ICsgKiBhbGlnbm1lbnQsIGFuZCBzbyBtdXN0IHVzZSBhIHR5cGVkZWYg
dG8gbWFrZSBzdXJlIHRoZSBfX2FsaWduZWQgYXR0cmlidXRlCj4gKyAqIGFjdHVhbGx5IHRha2Vz
IGhvbGQ6Cj4gKyAqCj4gKyAqIGh0dHBzOi8vZ2NjLmdudS5vcmcvb25saW5lZG9jcy8vZ2NjL0Nv
bW1vbi1UeXBlLUF0dHJpYnV0ZXMuaHRtbCNDb21tb24tVHlwZS1BdHRyaWJ1dGVzCj4gKyAqCj4g
KyAqIFdoZW4gdXNlZCBvbiBhIHN0cnVjdCwgb3Igc3RydWN0IG1lbWJlciwgdGhlIGFsaWduZWQg
YXR0cmlidXRlIGNhbiBvbmx5Cj4gKyAqIGluY3JlYXNlIHRoZSBhbGlnbm1lbnQ7IGluIG9yZGVy
IHRvIGRlY3JlYXNlIGl0LCB0aGUgcGFja2VkIGF0dHJpYnV0ZSBtdXN0Cj4gKyAqIGJlIHNwZWNp
ZmllZCBhcyB3ZWxsLiBXaGVuIHVzZWQgYXMgcGFydCBvZiBhIHR5cGVkZWYsIHRoZSBhbGlnbmVk
IGF0dHJpYnV0ZQo+ICsgKiBjYW4gYm90aCBpbmNyZWFzZSBhbmQgZGVjcmVhc2UgYWxpZ25tZW50
LCBhbmQgc3BlY2lmeWluZyB0aGUgcGFja2VkCj4gKyAqIGF0dHJpYnV0ZSBnZW5lcmF0ZXMgYSB3
YXJuaW5nLgo+ICsgKi8KPiArdHlwZWRlZiBzdHJ1Y3QgdnJpbmdfZGVzYyBfX2F0dHJpYnV0ZV9f
KChhbGlnbmVkKFZSSU5HX0RFU0NfQUxJR05fU0laRSkpKQo+ICsJdnJpbmdfZGVzY190Owo+ICt0
eXBlZGVmIHN0cnVjdCB2cmluZ19hdmFpbCBfX2F0dHJpYnV0ZV9fKChhbGlnbmVkKFZSSU5HX0FW
QUlMX0FMSUdOX1NJWkUpKSkKPiArCXZyaW5nX2F2YWlsX3Q7Cj4gK3R5cGVkZWYgc3RydWN0IHZy
aW5nX3VzZWQgX19hdHRyaWJ1dGVfXygoYWxpZ25lZChWUklOR19VU0VEX0FMSUdOX1NJWkUpKSkK
PiArCXZyaW5nX3VzZWRfdDsKPiArCj4gK3N0cnVjdCB2cmluZyB7Cj4gKwl1bnNpZ25lZCBpbnQg
bnVtOwo+ICsKPiArCXZyaW5nX2Rlc2NfdCAqZGVzYzsKPiArCj4gKwl2cmluZ19hdmFpbF90ICph
dmFpbDsKPiArCj4gKwl2cmluZ191c2VkX3QgKnVzZWQ7Cj4gK307Cj4gKwo+ICAgc3RhdGljIGlu
bGluZSB2b2lkIHZyaW5nX2luaXQoc3RydWN0IHZyaW5nICp2ciwgdW5zaWduZWQgaW50IG51bSwg
dm9pZCAqcCwKPiAgIAkJCSAgICAgIHVuc2lnbmVkIGxvbmcgYWxpZ24pCj4gICB7CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBt
YWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0
cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6
YXRpb24=
