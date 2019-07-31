Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 696E07BE2C
	for <lists.virtualization@lfdr.de>; Wed, 31 Jul 2019 12:19:57 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CAB5C3B5C;
	Wed, 31 Jul 2019 10:19:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9E07A2FBD
	for <virtualization@lists.linux-foundation.org>;
	Wed, 31 Jul 2019 10:06:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 39CCDE7
	for <virtualization@lists.linux-foundation.org>;
	Wed, 31 Jul 2019 10:06:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A9BF5285AE;
	Wed, 31 Jul 2019 10:06:04 +0000 (UTC)
Received: from [10.72.12.118] (ovpn-12-118.pek2.redhat.com [10.72.12.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 906F15C219;
	Wed, 31 Jul 2019 10:05:59 +0000 (UTC)
Subject: Re: [PATCH V2 9/9] vhost: do not return -EAGIAN for non blocking
	invalidation too early
To: Stefano Garzarella <sgarzare@redhat.com>
References: <20190731084655.7024-1-jasowang@redhat.com>
	<20190731084655.7024-10-jasowang@redhat.com>
	<20190731095950.d6zr472megt7rgkt@steredhat>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <e00259ec-af5d-3c58-a936-2e1c6e1bc2b9@redhat.com>
Date: Wed, 31 Jul 2019 18:05:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190731095950.d6zr472megt7rgkt@steredhat>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 31 Jul 2019 10:06:04 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: jgg@ziepe.ca, kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
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

Ck9uIDIwMTkvNy8zMSDkuIvljYg1OjU5LCBTdGVmYW5vIEdhcnphcmVsbGEgd3JvdGU6Cj4gQSBs
aXR0bGUgdHlwbyBpbiB0aGUgdGl0bGU6IHMvRUFHSUFOL0VBR0FJTgo+Cj4gVGhhbmtzLAo+IFN0
ZWZhbm8KCgpSaWdodCwgd2lsbCBmaXggaWYgbmVlZCByZXNwaW4gb3IgTWljaGFlbCBjYW4gaGVs
cCB0byBmaXguCgpUaGFua3MKCgo+Cj4gT24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMDQ6NDY6NTVB
TSAtMDQwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4gSW5zdGVhZCBvZiByZXR1cm5pbmcgLUVBR0FJ
TiB1bmNvbmRpdGlvbmFsbHksIHdlJ2QgYmV0dGVyIGRvIHRoYXQgb25seQo+PiB3ZSdyZSBzdXJl
IHRoZSByYW5nZSBpcyBvdmVybGFwcGVkIHdpdGggdGhlIG1ldGFkYXRhIGFyZWEuCj4+Cj4+IFJl
cG9ydGVkLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVwZS5jYT4KPj4gRml4ZXM6IDdmNDY2
MDMyZGM5ZSAoInZob3N0OiBhY2Nlc3MgdnEgbWV0YWRhdGEgdGhyb3VnaCBrZXJuZWwgdmlydHVh
bCBhZGRyZXNzIikKPj4gU2lnbmVkLW9mZi1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0
LmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy92aG9zdC92aG9zdC5jIHwgMzIgKysrKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygr
KSwgMTMgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L3Zob3N0
LmMgYi9kcml2ZXJzL3Zob3N0L3Zob3N0LmMKPj4gaW5kZXggZmMyZGE4YTBjNjcxLi45NmM2YWVi
MTg3MWYgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYwo+PiArKysgYi9kcml2
ZXJzL3Zob3N0L3Zob3N0LmMKPj4gQEAgLTM5OSwxNiArMzk5LDE5IEBAIHN0YXRpYyB2b2lkIGlu
bGluZSB2aG9zdF92cV9zeW5jX2FjY2VzcyhzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cSkKPj4g
ICAJc21wX21iKCk7Cj4+ICAgfQo+PiAgIAo+PiAtc3RhdGljIHZvaWQgdmhvc3RfaW52YWxpZGF0
ZV92cV9zdGFydChzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cSwKPj4gLQkJCQkgICAgICBpbnQg
aW5kZXgsCj4+IC0JCQkJICAgICAgdW5zaWduZWQgbG9uZyBzdGFydCwKPj4gLQkJCQkgICAgICB1
bnNpZ25lZCBsb25nIGVuZCkKPj4gK3N0YXRpYyBpbnQgdmhvc3RfaW52YWxpZGF0ZV92cV9zdGFy
dChzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cSwKPj4gKwkJCQkgICAgIGludCBpbmRleCwKPj4g
KwkJCQkgICAgIHVuc2lnbmVkIGxvbmcgc3RhcnQsCj4+ICsJCQkJICAgICB1bnNpZ25lZCBsb25n
IGVuZCwKPj4gKwkJCQkgICAgIGJvb2wgYmxvY2thYmxlKQo+PiAgIHsKPj4gICAJc3RydWN0IHZo
b3N0X3VhZGRyICp1YWRkciA9ICZ2cS0+dWFkZHJzW2luZGV4XTsKPj4gICAJc3RydWN0IHZob3N0
X21hcCAqbWFwOwo+PiAgIAo+PiAgIAlpZiAoIXZob3N0X21hcF9yYW5nZV9vdmVybGFwKHVhZGRy
LCBzdGFydCwgZW5kKSkKPj4gLQkJcmV0dXJuOwo+PiArCQlyZXR1cm4gMDsKPj4gKwllbHNlIGlm
ICghYmxvY2thYmxlKQo+PiArCQlyZXR1cm4gLUVBR0FJTjsKPj4gICAKPj4gICAJc3Bpbl9sb2Nr
KCZ2cS0+bW11X2xvY2spOwo+PiAgIAkrK3ZxLT5pbnZhbGlkYXRlX2NvdW50Owo+PiBAQCAtNDIz
LDYgKzQyNiw4IEBAIHN0YXRpYyB2b2lkIHZob3N0X2ludmFsaWRhdGVfdnFfc3RhcnQoc3RydWN0
IHZob3N0X3ZpcnRxdWV1ZSAqdnEsCj4+ICAgCQl2aG9zdF9zZXRfbWFwX2RpcnR5KHZxLCBtYXAs
IGluZGV4KTsKPj4gICAJCXZob3N0X21hcF91bnByZWZldGNoKG1hcCk7Cj4+ICAgCX0KPj4gKwo+
PiArCXJldHVybiAwOwo+PiAgIH0KPj4gICAKPj4gICBzdGF0aWMgdm9pZCB2aG9zdF9pbnZhbGlk
YXRlX3ZxX2VuZChzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cSwKPj4gQEAgLTQ0MywxOCArNDQ4
LDE5IEBAIHN0YXRpYyBpbnQgdmhvc3RfaW52YWxpZGF0ZV9yYW5nZV9zdGFydChzdHJ1Y3QgbW11
X25vdGlmaWVyICptbiwKPj4gICB7Cj4+ICAgCXN0cnVjdCB2aG9zdF9kZXYgKmRldiA9IGNvbnRh
aW5lcl9vZihtbiwgc3RydWN0IHZob3N0X2RldiwKPj4gICAJCQkJCSAgICAgbW11X25vdGlmaWVy
KTsKPj4gLQlpbnQgaSwgajsKPj4gLQo+PiAtCWlmICghbW11X25vdGlmaWVyX3JhbmdlX2Jsb2Nr
YWJsZShyYW5nZSkpCj4+IC0JCXJldHVybiAtRUFHQUlOOwo+PiArCWJvb2wgYmxvY2thYmxlID0g
bW11X25vdGlmaWVyX3JhbmdlX2Jsb2NrYWJsZShyYW5nZSk7Cj4+ICsJaW50IGksIGosIHJldDsK
Pj4gICAKPj4gICAJZm9yIChpID0gMDsgaSA8IGRldi0+bnZxczsgaSsrKSB7Cj4+ICAgCQlzdHJ1
Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cSA9IGRldi0+dnFzW2ldOwo+PiAgIAo+PiAtCQlmb3IgKGog
PSAwOyBqIDwgVkhPU1RfTlVNX0FERFJTOyBqKyspCj4+IC0JCQl2aG9zdF9pbnZhbGlkYXRlX3Zx
X3N0YXJ0KHZxLCBqLAo+PiAtCQkJCQkJICByYW5nZS0+c3RhcnQsCj4+IC0JCQkJCQkgIHJhbmdl
LT5lbmQpOwo+PiArCQlmb3IgKGogPSAwOyBqIDwgVkhPU1RfTlVNX0FERFJTOyBqKyspIHsKPj4g
KwkJCXJldCA9IHZob3N0X2ludmFsaWRhdGVfdnFfc3RhcnQodnEsIGosCj4+ICsJCQkJCQkJcmFu
Z2UtPnN0YXJ0LAo+PiArCQkJCQkJCXJhbmdlLT5lbmQsIGJsb2NrYWJsZSk7Cj4+ICsJCQlpZiAo
cmV0KQo+PiArCQkJCXJldHVybiByZXQ7Cj4+ICsJCX0KPj4gICAJfQo+PiAgIAo+PiAgIAlyZXR1
cm4gMDsKPj4gLS0gCj4+IDIuMTguMQo+PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRp
b25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRp
b24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
