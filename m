Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA0ABD6E9
	for <lists.virtualization@lfdr.de>; Wed, 25 Sep 2019 06:00:21 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1CA4AB9E;
	Wed, 25 Sep 2019 04:00:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D7583B4B
	for <virtualization@lists.linux-foundation.org>;
	Wed, 25 Sep 2019 04:00:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B7AD38A
	for <virtualization@lists.linux-foundation.org>;
	Wed, 25 Sep 2019 04:00:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 02DB23DFD7;
	Wed, 25 Sep 2019 04:00:04 +0000 (UTC)
Received: from [10.72.12.148] (ovpn-12-148.pek2.redhat.com [10.72.12.148])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 83E855C21F;
	Wed, 25 Sep 2019 03:59:58 +0000 (UTC)
Subject: Re: [PATCH] vhost: It's better to use size_t for the 3rd parameter of
	vhost_exceeds_weight()
To: "wangxu (AE)" <wangxu72@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <1569224801-101248-1-git-send-email-wangxu72@huawei.com>
	<20190923040518-mutt-send-email-mst@kernel.org>
	<FCFCADD62FC0CA4FAEA05F13220975B01717A091@dggeml525-mbx.china.huawei.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <fc06afd5-0e2d-c3ae-c118-3292e16db186@redhat.com>
Date: Wed, 25 Sep 2019 11:59:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <FCFCADD62FC0CA4FAEA05F13220975B01717A091@dggeml525-mbx.china.huawei.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 25 Sep 2019 04:00:04 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>
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

Ck9uIDIwMTkvOS8yMyDkuIvljYg1OjEyLCB3YW5neHUgKEFFKSB3cm90ZToKPiBIaSBNaWNoYWVs
Cj4KPiAJVGhhbmtzIGZvciB5b3VyIGZhc3QgcmVwbHkuCj4KPiAJQXMgdGhlIGZvbGxvd2luZyBj
b2RlLCB0aGUgMm5kIGJyYW5jaCBvZiBpb3ZfaXRlcl9hZHZhbmNlKCkgZG9lcyBub3QgY2hlY2sg
aWYgaS0+Y291bnQgPCBzaXplLCB3aGVuIHRoaXMgaGFwcGVucywgaS0+Y291bnQgLT0gc2l6ZSBt
YXkgY2F1c2UgbGVuIGV4Y2VlZCBJTlRfTUFYLCBhbmQgdGhlbiB0b3RhbF9sZW4gZXhjZWVkIElO
VF9NQVguCj4KPiAJaGFuZGxlX3R4X2NvcHkoKSAtPgo+IAkJZ2V0X3R4X2J1ZnMoLi4uLCAmbGVu
LCAuLi4pIC0+Cj4gCQkJaW5pdF9pb3ZfaXRlcigpIC0+Cj4gCQkJCWlvdl9pdGVyX2FkdmFuY2Uo
aXRlciwgLi4uKSAJLy8gaGFzIDMgYnJhbmNoZXM6Cj4gCQkJCQlwaXBlX2FkdmFuY2UoKSAJIAkv
LyBoYXMgY2hlY2tlZCB0aGUgc2l6ZTogaWYgKHVubGlrZWx5KGktPmNvdW50IDwgc2l6ZSkpIHNp
emUgPSBpLT5jb3VudDsKPiAJCQkJCWlvdl9pdGVyX2lzX2Rpc2NhcmQoKSAuLi4gCS8vIG5vIGNo
ZWNrLgoKClllcywgYnV0IEkgZG9uJ3QgdGhpbmsgd2UgdXNlIElURVJfRElTQ0FSRC4KClRoYW5r
cwoKCj4gCQkJCQlpdGVyYXRlX2FuZF9hZHZhbmNlKCkgCS8vaGFzIGNoZWNrZWQ6IGlmICh1bmxp
a2VseShpLT5jb3VudCA8IG4pKSBuID0gaS0+Y291bnQ7Cj4gCQkJCXJldHVybiBpb3ZfaXRlcl9j
b3VudChpdGVyKTsKPgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogTWljaGFl
bCBTLiBUc2lya2luIFttYWlsdG86bXN0QHJlZGhhdC5jb21dCj4gU2VudDogTW9uZGF5LCBTZXB0
ZW1iZXIgMjMsIDIwMTkgNDowNyBQTQo+IFRvOiB3YW5neHUgKEFFKSA8d2FuZ3h1NzJAaHVhd2Vp
LmNvbT4KPiBDYzogamFzb3dhbmdAcmVkaGF0LmNvbTsga3ZtQHZnZXIua2VybmVsLm9yZzsgdmly
dHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmc7IG5ldGRldkB2Z2VyLmtlcm5l
bC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPiBTdWJqZWN0OiBSZTogW1BBVENI
XSB2aG9zdDogSXQncyBiZXR0ZXIgdG8gdXNlIHNpemVfdCBmb3IgdGhlIDNyZCBwYXJhbWV0ZXIg
b2Ygdmhvc3RfZXhjZWVkc193ZWlnaHQoKQo+Cj4gT24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMDM6
NDY6NDFQTSArMDgwMCwgd2FuZ3h1IHdyb3RlOgo+PiBGcm9tOiBXYW5nIFh1IDx3YW5neHU3MkBo
dWF3ZWkuY29tPgo+Pgo+PiBDYWxsZXIgb2Ygdmhvc3RfZXhjZWVkc193ZWlnaHQoLi4uLCB0b3Rh
bF9sZW4pIGluIGRyaXZlcnMvdmhvc3QvbmV0LmMKPj4gdXN1YWxseSBwYXNzIHNpemVfdCB0b3Rh
bF9sZW4sIHdoaWNoIG1heSBiZSBhZmZlY3RlZCBieSByeC90eCBwYWNrYWdlLgo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBXYW5nIFh1IDx3YW5neHU3MkBodWF3ZWkuY29tPgo+Cj4gUHV0cyBhIGJpdCBt
b3JlIHByZXNzdXJlIG9uIHRoZSByZWdpc3RlciBmaWxlIC4uLgo+IHdoeSBkbyB3ZSBjYXJlPyBJ
cyB0aGVyZSBzb21lIHdheSB0aGF0IGl0IGNhbiBleGNlZWQgSU5UX01BWD8KPgo+PiAtLS0KPj4g
ICBkcml2ZXJzL3Zob3N0L3Zob3N0LmMgfCA0ICsrLS0KPj4gICBkcml2ZXJzL3Zob3N0L3Zob3N0
LmggfCA3ICsrKystLS0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNSBk
ZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYyBiL2Ry
aXZlcnMvdmhvc3Qvdmhvc3QuYyBpbmRleAo+PiAzNmNhMmNmLi4xNTkyMjNhIDEwMDY0NAo+PiAt
LS0gYS9kcml2ZXJzL3Zob3N0L3Zob3N0LmMKPj4gKysrIGIvZHJpdmVycy92aG9zdC92aG9zdC5j
Cj4+IEBAIC00MTIsNyArNDEyLDcgQEAgc3RhdGljIHZvaWQgdmhvc3RfZGV2X2ZyZWVfaW92ZWNz
KHN0cnVjdCB2aG9zdF9kZXYKPj4gKmRldikgIH0KPj4gICAKPj4gICBib29sIHZob3N0X2V4Y2Vl
ZHNfd2VpZ2h0KHN0cnVjdCB2aG9zdF92aXJ0cXVldWUgKnZxLAo+PiAtCQkJICBpbnQgcGt0cywg
aW50IHRvdGFsX2xlbikKPj4gKwkJCSAgaW50IHBrdHMsIHNpemVfdCB0b3RhbF9sZW4pCj4+ICAg
ewo+PiAgIAlzdHJ1Y3Qgdmhvc3RfZGV2ICpkZXYgPSB2cS0+ZGV2Owo+PiAgIAo+PiBAQCAtNDU0
LDcgKzQ1NCw3IEBAIHN0YXRpYyBzaXplX3Qgdmhvc3RfZ2V0X2Rlc2Nfc2l6ZShzdHJ1Y3QKPj4g
dmhvc3RfdmlydHF1ZXVlICp2cSwKPj4gICAKPj4gICB2b2lkIHZob3N0X2Rldl9pbml0KHN0cnVj
dCB2aG9zdF9kZXYgKmRldiwKPj4gICAJCSAgICBzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICoqdnFz
LCBpbnQgbnZxcywKPj4gLQkJICAgIGludCBpb3ZfbGltaXQsIGludCB3ZWlnaHQsIGludCBieXRl
X3dlaWdodCkKPj4gKwkJICAgIGludCBpb3ZfbGltaXQsIGludCB3ZWlnaHQsIHNpemVfdCBieXRl
X3dlaWdodCkKPj4gICB7Cj4+ICAgCXN0cnVjdCB2aG9zdF92aXJ0cXVldWUgKnZxOwo+PiAgIAlp
bnQgaTsKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3Qvdmhvc3QuaCBiL2RyaXZlcnMvdmhv
c3Qvdmhvc3QuaCBpbmRleAo+PiBlOWVkMjcyLi44ZDgwMzg5ZCAxMDA2NDQKPj4gLS0tIGEvZHJp
dmVycy92aG9zdC92aG9zdC5oCj4+ICsrKyBiL2RyaXZlcnMvdmhvc3Qvdmhvc3QuaAo+PiBAQCAt
MTcyLDEyICsxNzIsMTMgQEAgc3RydWN0IHZob3N0X2RldiB7Cj4+ICAgCXdhaXRfcXVldWVfaGVh
ZF90IHdhaXQ7Cj4+ICAgCWludCBpb3ZfbGltaXQ7Cj4+ICAgCWludCB3ZWlnaHQ7Cj4+IC0JaW50
IGJ5dGVfd2VpZ2h0Owo+PiArCXNpemVfdCBieXRlX3dlaWdodDsKPj4gICB9Owo+PiAgIAo+Cj4g
VGhpcyBqdXN0IGNvc3RzIGV4dHJhIG1lbW9yeSwgYW5kIHZhbHVlIGlzIG5ldmVyIGxhcmdlLCBz
byBJIGRvbid0IHRoaW5rIHRoaXMgbWF0dGVycy4KPgo+PiAtYm9vbCB2aG9zdF9leGNlZWRzX3dl
aWdodChzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cSwgaW50IHBrdHMsIGludAo+PiB0b3RhbF9s
ZW4pOwo+PiArYm9vbCB2aG9zdF9leGNlZWRzX3dlaWdodChzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVl
ICp2cSwgaW50IHBrdHMsCj4+ICsJCQkgIHNpemVfdCB0b3RhbF9sZW4pOwo+PiAgIHZvaWQgdmhv
c3RfZGV2X2luaXQoc3RydWN0IHZob3N0X2RldiAqLCBzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICoq
dnFzLAo+PiAtCQkgICAgaW50IG52cXMsIGludCBpb3ZfbGltaXQsIGludCB3ZWlnaHQsIGludCBi
eXRlX3dlaWdodCk7Cj4+ICsJCSAgICBpbnQgbnZxcywgaW50IGlvdl9saW1pdCwgaW50IHdlaWdo
dCwgc2l6ZV90IGJ5dGVfd2VpZ2h0KTsKPj4gICBsb25nIHZob3N0X2Rldl9zZXRfb3duZXIoc3Ry
dWN0IHZob3N0X2RldiAqZGV2KTsgIGJvb2wKPj4gdmhvc3RfZGV2X2hhc19vd25lcihzdHJ1Y3Qg
dmhvc3RfZGV2ICpkZXYpOyAgbG9uZwo+PiB2aG9zdF9kZXZfY2hlY2tfb3duZXIoc3RydWN0IHZo
b3N0X2RldiAqKTsKPj4gLS0KPj4gMS44LjUuNgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6
YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5k
YXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
