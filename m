Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CA971909
	for <lists.virtualization@lfdr.de>; Tue, 23 Jul 2019 15:19:42 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D4382CC0;
	Tue, 23 Jul 2019 13:19:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CEAD0C74
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 13:19:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6AAFF102
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 13:19:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EC6C981F19;
	Tue, 23 Jul 2019 13:19:33 +0000 (UTC)
Received: from [10.72.12.26] (ovpn-12-26.pek2.redhat.com [10.72.12.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F409660BEC;
	Tue, 23 Jul 2019 13:19:28 +0000 (UTC)
Subject: Re: [PATCH 5/6] vhost: mark dirty pages during map uninit
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20190723075718.6275-1-jasowang@redhat.com>
	<20190723075718.6275-6-jasowang@redhat.com>
	<20190723041702-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a670cd0d-581d-1aba-41bd-c643c19f9604@redhat.com>
Date: Tue, 23 Jul 2019 21:19:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190723041702-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 23 Jul 2019 13:19:34 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org
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

Ck9uIDIwMTkvNy8yMyDkuIvljYg1OjE3LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
VHVlLCBKdWwgMjMsIDIwMTkgYXQgMDM6NTc6MTdBTSAtMDQwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gV2UgZG9uJ3QgbWFyayBkaXJ0eSBwYWdlcyBpZiB0aGUgbWFwIHdhcyB0ZWFyZWQgZG93biBv
dXRzaWRlIE1NVQo+PiBub3RpZmllci4gVGhpcyB3aWxsIGxlYWQgdW50cmFja2VkIGRpcnR5IHBh
Z2VzLiBGaXhpbmcgYnkgbWFya2luZwo+PiBkaXJ0eSBwYWdlcyBkdXJpbmcgbWFwIHVuaW5pdC4K
Pj4KPj4gUmVwb3J0ZWQtYnk6IE1pY2hhZWwgUy4gVHNpcmtpbjxtc3RAcmVkaGF0LmNvbT4KPj4g
Rml4ZXM6IDdmNDY2MDMyZGM5ZSAoInZob3N0OiBhY2Nlc3MgdnEgbWV0YWRhdGEgdGhyb3VnaCBr
ZXJuZWwgdmlydHVhbCBhZGRyZXNzIikKPj4gU2lnbmVkLW9mZi1ieTogSmFzb24gV2FuZzxqYXNv
d2FuZ0ByZWRoYXQuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL3Zob3N0L3Zob3N0LmMgfCAyMiAr
KysrKysrKysrKysrKysrLS0tLS0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMo
KyksIDYgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L3Zob3N0
LmMgYi9kcml2ZXJzL3Zob3N0L3Zob3N0LmMKPj4gaW5kZXggODljOWYwOGI1MTQ2Li41Yjg4MjFk
MDBmZTQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYwo+PiArKysgYi9kcml2
ZXJzL3Zob3N0L3Zob3N0LmMKPj4gQEAgLTMwNiw2ICszMDYsMTggQEAgc3RhdGljIHZvaWQgdmhv
c3RfbWFwX3VucHJlZmV0Y2goc3RydWN0IHZob3N0X21hcCAqbWFwKQo+PiAgIAlrZnJlZShtYXAp
Owo+PiAgIH0KPj4gICAKPj4gK3N0YXRpYyB2b2lkIHZob3N0X3NldF9tYXBfZGlydHkoc3RydWN0
IHZob3N0X3ZpcnRxdWV1ZSAqdnEsCj4+ICsJCQkJc3RydWN0IHZob3N0X21hcCAqbWFwLCBpbnQg
aW5kZXgpCj4+ICt7Cj4+ICsJc3RydWN0IHZob3N0X3VhZGRyICp1YWRkciA9ICZ2cS0+dWFkZHJz
W2luZGV4XTsKPj4gKwlpbnQgaTsKPj4gKwo+PiArCWlmICh1YWRkci0+d3JpdGUpIHsKPj4gKwkJ
Zm9yIChpID0gMDsgaSA8IG1hcC0+bnBhZ2VzOyBpKyspCj4+ICsJCQlzZXRfcGFnZV9kaXJ0eSht
YXAtPnBhZ2VzW2ldKTsKPj4gKwl9Cj4+ICt9Cj4+ICsKPj4gICBzdGF0aWMgdm9pZCB2aG9zdF91
bmluaXRfdnFfbWFwcyhzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cSkKPj4gICB7Cj4+ICAgCXN0
cnVjdCB2aG9zdF9tYXAgKm1hcFtWSE9TVF9OVU1fQUREUlNdOwo+PiBAQCAtMzE1LDggKzMyNywx
MCBAQCBzdGF0aWMgdm9pZCB2aG9zdF91bmluaXRfdnFfbWFwcyhzdHJ1Y3Qgdmhvc3RfdmlydHF1
ZXVlICp2cSkKPj4gICAJZm9yIChpID0gMDsgaSA8IFZIT1NUX05VTV9BRERSUzsgaSsrKSB7Cj4+
ICAgCQltYXBbaV0gPSByY3VfZGVyZWZlcmVuY2VfcHJvdGVjdGVkKHZxLT5tYXBzW2ldLAo+PiAg
IAkJCQkgIGxvY2tkZXBfaXNfaGVsZCgmdnEtPm1tdV9sb2NrKSk7Cj4+IC0JCWlmIChtYXBbaV0p
Cj4+ICsJCWlmIChtYXBbaV0pIHsKPj4gKwkJCXZob3N0X3NldF9tYXBfZGlydHkodnEsIG1hcFtp
XSwgaSk7Cj4+ICAgCQkJcmN1X2Fzc2lnbl9wb2ludGVyKHZxLT5tYXBzW2ldLCBOVUxMKTsKPj4g
KwkJfQo+PiAgIAl9Cj4+ICAgCXNwaW5fdW5sb2NrKCZ2cS0+bW11X2xvY2spOwo+PiAgIAo+PiBA
QCAtMzU0LDcgKzM2OCw2IEBAIHN0YXRpYyB2b2lkIHZob3N0X2ludmFsaWRhdGVfdnFfc3RhcnQo
c3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnEsCj4+ICAgewo+PiAgIAlzdHJ1Y3Qgdmhvc3RfdWFk
ZHIgKnVhZGRyID0gJnZxLT51YWRkcnNbaW5kZXhdOwo+PiAgIAlzdHJ1Y3Qgdmhvc3RfbWFwICpt
YXA7Cj4+IC0JaW50IGk7Cj4+ICAgCj4+ICAgCWlmICghdmhvc3RfbWFwX3JhbmdlX292ZXJsYXAo
dWFkZHIsIHN0YXJ0LCBlbmQpKQo+PiAgIAkJcmV0dXJuOwo+PiBAQCAtMzY1LDEwICszNzgsNyBA
QCBzdGF0aWMgdm9pZCB2aG9zdF9pbnZhbGlkYXRlX3ZxX3N0YXJ0KHN0cnVjdCB2aG9zdF92aXJ0
cXVldWUgKnZxLAo+PiAgIAltYXAgPSByY3VfZGVyZWZlcmVuY2VfcHJvdGVjdGVkKHZxLT5tYXBz
W2luZGV4XSwKPj4gICAJCQkJCWxvY2tkZXBfaXNfaGVsZCgmdnEtPm1tdV9sb2NrKSk7Cj4+ICAg
CWlmIChtYXApIHsKPj4gLQkJaWYgKHVhZGRyLT53cml0ZSkgewo+PiAtCQkJZm9yIChpID0gMDsg
aSA8IG1hcC0+bnBhZ2VzOyBpKyspCj4+IC0JCQkJc2V0X3BhZ2VfZGlydHkobWFwLT5wYWdlc1tp
XSk7Cj4+IC0JCX0KPj4gKwkJdmhvc3Rfc2V0X21hcF9kaXJ0eSh2cSwgbWFwLCBpbmRleCk7Cj4+
ICAgCQlyY3VfYXNzaWduX3BvaW50ZXIodnEtPm1hcHNbaW5kZXhdLCBOVUxMKTsKPj4gICAJfQo+
PiAgIAlzcGluX3VubG9jaygmdnEtPm1tdV9sb2NrKTsKPiBPSyBhbmQgdGhlIHJlYXNvbiBpdCdz
IHNhZmUgaXMgYmVjYXVzZSB0aGUgaW52YWxpZGF0ZSBjb3VudGVyCj4gZ290IGluY3JlbWVudGVk
IHNvIHdlIGtub3cgcGFnZSB3aWxsIG5vdCBnZXQgbWFwcGVkIGFnYWluLgo+Cj4gQnV0IHdlKmRv
KiAgbmVlZCB0byB3YWl0IGZvciBwYWdlIG5vdCB0byBiZSBtYXBwZWQuCj4gQW5kIGlmIHRoYXQg
bWVhbnMgd2FpdGluZyBmb3IgVlEgcHJvY2Vzc2luZyB0byBmaW5pc2gsCj4gdGhlbiBJIHdvcnJ5
IHRoYXQgaXMgYSB2ZXJ5IGxvZyB0aW1lLgo+CgpJJ20gbm90IHN1cmUgSSBnZXQgeW91IGhlcmUu
IElmIHdlIGRvbid0IGhhdmUgc3VjaCBtYXAsIHdlIHdpbGwgZmFsbCAKYmFjayB0byBub3JtYWwg
dWFjY2VzcyBoZWxwZXIuIEFuZCBpbiB0aGUgbWVtb3J5IGFjY2Vzc29yLCB0aGUgcmN1IApjcml0
aWNhbCBzZWN0aW9uIGlzIHByZXR0eSBzbWFsbC4KClRoYW5rcwoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxp
c3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0
cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
