Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3A5214EC7
	for <lists.virtualization@lfdr.de>; Sun,  5 Jul 2020 21:00:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 53ADF22785;
	Sun,  5 Jul 2020 19:00:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LzD0Bu3JmOyh; Sun,  5 Jul 2020 19:00:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 06FEB226F5;
	Sun,  5 Jul 2020 19:00:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DE6CBC016F;
	Sun,  5 Jul 2020 19:00:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42D3BC016F
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jul 2020 19:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2809D874AA
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jul 2020 19:00:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0oIJ1MnN9cPD
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jul 2020 19:00:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2DA2B87434
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jul 2020 19:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593975627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QRbjCVGiS+K3wjBojGpFQuJRSNreXkAJC07JF2rP2ac=;
 b=fHq+wi72lpiZ+pp1AW7nr8JpmA4bjLDbgZCmNq/GHbktAQKfJSSR+GR6/ZFyaLl68Mtf88
 x1rk/XT0cSVgUw9WDfdR4rJBq3y5fspUX7yHDMBQPbSU34eH/e52+zKDqoZ2FWwvkBQVdv
 Mh4l0tIROHpkZM+aUIr2E1gVzDqo9xI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194--h0XVojeMPy8x53Oioav9g-1; Sun, 05 Jul 2020 15:00:25 -0400
X-MC-Unique: -h0XVojeMPy8x53Oioav9g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F26A5EB;
 Sun,  5 Jul 2020 19:00:23 +0000 (UTC)
Received: from llong.remote.csb (ovpn-112-238.rdu2.redhat.com [10.10.112.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43C0B60BF3;
 Sun,  5 Jul 2020 19:00:22 +0000 (UTC)
Subject: Re: [PATCH v2 5/6] powerpc/pseries: implement paravirt qspinlocks for
 SPLPAR
To: Nicholas Piggin <npiggin@gmail.com>
References: <20200703073516.1354108-1-npiggin@gmail.com>
 <20200703073516.1354108-6-npiggin@gmail.com>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <81d9981b-8a20-729c-b861-c7229e40bb65@redhat.com>
Date: Sun, 5 Jul 2020 15:00:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200703073516.1354108-6-npiggin@gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: linux-arch@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Anton Blanchard <anton@ozlabs.org>, linuxppc-dev@lists.ozlabs.org
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

T24gNy8zLzIwIDM6MzUgQU0sIE5pY2hvbGFzIFBpZ2dpbiB3cm90ZToKPiBTaWduZWQtb2ZmLWJ5
OiBOaWNob2xhcyBQaWdnaW4gPG5waWdnaW5AZ21haWwuY29tPgo+IC0tLQo+ICAgYXJjaC9wb3dl
cnBjL2luY2x1ZGUvYXNtL3BhcmF2aXJ0LmggICAgICAgICAgIHwgMjggKysrKysrKysrKwo+ICAg
YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3FzcGlubG9jay5oICAgICAgICAgIHwgNTUgKysrKysr
KysrKysrKysrKysrKwo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3FzcGlubG9ja19wYXJh
dmlydC5oIHwgIDUgKysKPiAgIGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcHNlcmllcy9LY29uZmln
ICAgICAgICB8ICA1ICsrCj4gICBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3BzZXJpZXMvc2V0dXAu
YyAgICAgICAgfCAgNiArLQo+ICAgaW5jbHVkZS9hc20tZ2VuZXJpYy9xc3BpbmxvY2suaCAgICAg
ICAgICAgICAgIHwgIDIgKwo+ICAgNiBmaWxlcyBjaGFuZ2VkLCAxMDAgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcG93ZXJwYy9pbmNsdWRl
L2FzbS9xc3BpbmxvY2tfcGFyYXZpcnQuaAo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9p
bmNsdWRlL2FzbS9wYXJhdmlydC5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BhcmF2aXJ0
LmgKPiBpbmRleCA3YTg1NDY2NjBhNjMuLmYyZDUxZjkyOWNmNSAxMDA2NDQKPiAtLS0gYS9hcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20vcGFyYXZpcnQuaAo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9wYXJhdmlydC5oCj4gQEAgLTI5LDYgKzI5LDE2IEBAIHN0YXRpYyBpbmxpbmUgdm9p
ZCB5aWVsZF90b19wcmVlbXB0ZWQoaW50IGNwdSwgdTMyIHlpZWxkX2NvdW50KQo+ICAgewo+ICAg
CXBscGFyX2hjYWxsX25vcmV0cyhIX0NPTkZFUiwgZ2V0X2hhcmRfc21wX3Byb2Nlc3Nvcl9pZChj
cHUpLCB5aWVsZF9jb3VudCk7Cj4gICB9Cj4gKwo+ICtzdGF0aWMgaW5saW5lIHZvaWQgcHJvZF9j
cHUoaW50IGNwdSkKPiArewo+ICsJcGxwYXJfaGNhbGxfbm9yZXRzKEhfUFJPRCwgZ2V0X2hhcmRf
c21wX3Byb2Nlc3Nvcl9pZChjcHUpKTsKPiArfQo+ICsKPiArc3RhdGljIGlubGluZSB2b2lkIHlp
ZWxkX3RvX2FueSh2b2lkKQo+ICt7Cj4gKwlwbHBhcl9oY2FsbF9ub3JldHMoSF9DT05GRVIsIC0x
LCAwKTsKPiArfQo+ICAgI2Vsc2UKPiAgIHN0YXRpYyBpbmxpbmUgYm9vbCBpc19zaGFyZWRfcHJv
Y2Vzc29yKHZvaWQpCj4gICB7Cj4gQEAgLTQ1LDYgKzU1LDE5IEBAIHN0YXRpYyBpbmxpbmUgdm9p
ZCB5aWVsZF90b19wcmVlbXB0ZWQoaW50IGNwdSwgdTMyIHlpZWxkX2NvdW50KQo+ICAgewo+ICAg
CV9fX2JhZF95aWVsZF90b19wcmVlbXB0ZWQoKTsgLyogVGhpcyB3b3VsZCBiZSBhIGJ1ZyAqLwo+
ICAgfQo+ICsKPiArZXh0ZXJuIHZvaWQgX19fYmFkX3lpZWxkX3RvX2FueSh2b2lkKTsKPiArc3Rh
dGljIGlubGluZSB2b2lkIHlpZWxkX3RvX2FueSh2b2lkKQo+ICt7Cj4gKwlfX19iYWRfeWllbGRf
dG9fYW55KCk7IC8qIFRoaXMgd291bGQgYmUgYSBidWcgKi8KPiArfQo+ICsKPiArZXh0ZXJuIHZv
aWQgX19fYmFkX3Byb2RfY3B1KHZvaWQpOwo+ICtzdGF0aWMgaW5saW5lIHZvaWQgcHJvZF9jcHUo
aW50IGNwdSkKPiArewo+ICsJX19fYmFkX3Byb2RfY3B1KCk7IC8qIFRoaXMgd291bGQgYmUgYSBi
dWcgKi8KPiArfQo+ICsKPiAgICNlbmRpZgo+ICAgCj4gICAjZGVmaW5lIHZjcHVfaXNfcHJlZW1w
dGVkIHZjcHVfaXNfcHJlZW1wdGVkCj4gQEAgLTU3LDUgKzgwLDEwIEBAIHN0YXRpYyBpbmxpbmUg
Ym9vbCB2Y3B1X2lzX3ByZWVtcHRlZChpbnQgY3B1KQo+ICAgCXJldHVybiBmYWxzZTsKPiAgIH0K
PiAgIAo+ICtzdGF0aWMgaW5saW5lIGJvb2wgcHZfaXNfbmF0aXZlX3NwaW5fdW5sb2NrKHZvaWQp
Cj4gK3sKPiArICAgICByZXR1cm4gIWlzX3NoYXJlZF9wcm9jZXNzb3IoKTsKPiArfQo+ICsKPiAg
ICNlbmRpZiAvKiBfX0tFUk5FTF9fICovCj4gICAjZW5kaWYgLyogX19BU01fUEFSQVZJUlRfSCAq
Lwo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcXNwaW5sb2NrLmggYi9h
cmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcXNwaW5sb2NrLmgKPiBpbmRleCBjNDllMzNlMjRlZGQu
LjA5NjBhMGRlMjQ2NyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcXNw
aW5sb2NrLmgKPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcXNwaW5sb2NrLmgKPiBA
QCAtMyw5ICszLDM2IEBACj4gICAjZGVmaW5lIF9BU01fUE9XRVJQQ19RU1BJTkxPQ0tfSAo+ICAg
Cj4gICAjaW5jbHVkZSA8YXNtLWdlbmVyaWMvcXNwaW5sb2NrX3R5cGVzLmg+Cj4gKyNpbmNsdWRl
IDxhc20vcGFyYXZpcnQuaD4KPiAgIAo+ICAgI2RlZmluZSBfUV9QRU5ESU5HX0xPT1BTCSgxIDw8
IDkpIC8qIG5vdCB0dW5lZCAqLwo+ICAgCj4gKyNpZmRlZiBDT05GSUdfUEFSQVZJUlRfU1BJTkxP
Q0tTCj4gK2V4dGVybiB2b2lkIG5hdGl2ZV9xdWV1ZWRfc3Bpbl9sb2NrX3Nsb3dwYXRoKHN0cnVj
dCBxc3BpbmxvY2sgKmxvY2ssIHUzMiB2YWwpOwo+ICtleHRlcm4gdm9pZCBfX3B2X3F1ZXVlZF9z
cGluX2xvY2tfc2xvd3BhdGgoc3RydWN0IHFzcGlubG9jayAqbG9jaywgdTMyIHZhbCk7Cj4gKwo+
ICtzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgcXVldWVkX3NwaW5fbG9ja19zbG93cGF0aChz
dHJ1Y3QgcXNwaW5sb2NrICpsb2NrLCB1MzIgdmFsKQo+ICt7Cj4gKwlpZiAoIWlzX3NoYXJlZF9w
cm9jZXNzb3IoKSkKPiArCQluYXRpdmVfcXVldWVkX3NwaW5fbG9ja19zbG93cGF0aChsb2NrLCB2
YWwpOwo+ICsJZWxzZQo+ICsJCV9fcHZfcXVldWVkX3NwaW5fbG9ja19zbG93cGF0aChsb2NrLCB2
YWwpOwo+ICt9CgpJbiBhIHByZXZpb3VzIG1haWwsIEkgc2FpZCB0aGF0OgoKWW91IG1heSBuZWVk
IHRvIG1hdGNoIHRoZSB1c2Ugb2YgX19wdl9xdWV1ZWRfc3Bpbl9sb2NrX3Nsb3dwYXRoKCkgd2l0
aCAKdGhlIGNvcnJlc3BvbmRpbmcgX19wdl9xdWV1ZWRfc3Bpbl91bmxvY2soKSwgZS5nLgoKI2Rl
ZmluZSBxdWV1ZWRfc3Bpbl91bmxvY2sgcXVldWVkX3NwaW5fdW5sb2NrCnN0YXRpYyBpbmxpbmUg
cXVldWVkX3NwaW5fdW5sb2NrKHN0cnVjdCBxc3BpbmxvY2sgKmxvY2spCnsKIMKgwqDCoMKgwqDC
oMKgIGlmICghaXNfc2hhcmVkX3Byb2Nlc3NvcigpKQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHNtcF9zdG9yZV9yZWxlYXNlKCZsb2NrLT5sb2NrZWQsIDApOwogwqDCoMKgwqDCoMKg
wqAgZWxzZQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fcHZfcXVldWVkX3NwaW5f
dW5sb2NrKGxvY2spOwp9CgpPdGhlcndpc2UsIHB2X2tpY2soKSB3aWxsIG5ldmVyIGJlIGNhbGxl
ZC4KCk1heWJlIFBvd2VyUEMgSE1UIGlzIGRpZmZlcmVudCB0aGF0IHRoZSBzaGFyZWQgY3B1cyBj
YW4gc3RpbGwgcHJvY2VzcyAKaW5zdHJ1Y3Rpb24sIHRob3VnaCBzbG93ZXIsIHRoYXQgY3B1IGtp
Y2tpbmcgbGlrZSB3aGF0IHdhcyBkb25lIGluIGt2bSAKaXMgbm90IHJlYWxseSBuZWNlc3Nhcnku
IElmIHRoYXQgaXMgdGhlIGNhc2UsIEkgdGhpbmsgd2Ugc2hvdWxkIGRvY3VtZW50IAp0aGF0LgoK
Q2hlZXJzLApMb25nbWFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMu
bGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21h
aWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
