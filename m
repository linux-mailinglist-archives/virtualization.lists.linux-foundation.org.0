Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E38C53A9739
	for <lists.virtualization@lfdr.de>; Wed, 16 Jun 2021 12:27:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 736DF60622;
	Wed, 16 Jun 2021 10:27:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5nNDZXeYhDzU; Wed, 16 Jun 2021 10:27:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7F3A4607A6;
	Wed, 16 Jun 2021 10:27:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1C6EC0024;
	Wed, 16 Jun 2021 10:27:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1796BC000B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Jun 2021 10:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04C904060B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Jun 2021 10:27:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Na7TTXBloiFx
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Jun 2021 10:27:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-45.freemail.mail.aliyun.com
 (out30-45.freemail.mail.aliyun.com [115.124.30.45])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DFCA1405E2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Jun 2021 10:27:36 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R341e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04420; MF=xuanzhuo@linux.alibaba.com;
 NM=1; PH=DS; RN=20; SR=0; TI=SMTPD_---0Ucbk8xE_1623839252; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0Ucbk8xE_1623839252) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 16 Jun 2021 18:27:33 +0800
MIME-Version: 1.0
Message-Id: <1623838784.446967-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH net-next v5 12/15] virtio-net: support AF_XDP zc tx
Date: Wed, 16 Jun 2021 18:19:44 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Jason Wang <jasowang@redhat.com>
In-Reply-To: <99116ba9-9c17-a519-471d-98ae96d049d9@redhat.com>
X-Mailing-List: netdev@vger.kernel.org
Cc: Song Liu <songliubraving@fb.com>, Martin KaFai Lau <kafai@fb.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 netdev@vger.kernel.org, =?utf-8?b?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 "dust . li" <dust.li@linux.alibaba.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 "David S. Miller" <davem@davemloft.net>,
 Magnus Karlsson <magnus.karlsson@intel.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gV2VkLCAxNiBKdW4gMjAyMSAxNzoyNjozMyArMDgwMCwgSmFzb24gV2FuZyA8amFzb3dhbmdA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiDlnKggMjAyMS82LzEwIOS4i+WNiDQ6MjIsIFh1YW4gWmh1
byDlhpnpgZM6Cj4gPiBBRl9YRFAoeGRwIHNvY2tldCwgeHNrKSBpcyBhIGhpZ2gtcGVyZm9ybWFu
Y2UgcGFja2V0IHJlY2VpdmluZyBhbmQKPiA+IHNlbmRpbmcgdGVjaG5vbG9neS4KPiA+Cj4gPiBU
aGlzIHBhdGNoIGltcGxlbWVudHMgdGhlIGJpbmRpbmcgYW5kIHVuYmluZGluZyBvcGVyYXRpb25z
IG9mIHhzayBhbmQKPiA+IHRoZSB2aXJ0aW8tbmV0IHF1ZXVlIGZvciB4c2sgemVybyBjb3B5IHht
aXQuCj4gPgo+ID4gVGhlIHhzayB6ZXJvIGNvcHkgeG1pdCBkZXBlbmRzIG9uIHR4IG5hcGkuIEJl
Y2F1c2UgdGhlIGFjdHVhbCBzZW5kaW5nCj4gPiBvZiBkYXRhIGlzIGRvbmUgaW4gdGhlIHByb2Nl
c3Mgb2YgdHggbmFwaS4gSWYgdHggbmFwaSBkb2VzIG5vdAo+ID4gd29yaywgdGhlbiB0aGUgZGF0
YSBvZiB0aGUgeHNrIHR4IHF1ZXVlIHdpbGwgbm90IGJlIHNlbnQuCj4gPiBTbyBpZiB0eCBuYXBp
IGlzIG5vdCB0cnVlLCBhbiBlcnJvciB3aWxsIGJlIHJlcG9ydGVkIHdoZW4gYmluZCB4c2suCj4g
Pgo+ID4gSWYgeHNrIGlzIGFjdGl2ZSwgaXQgd2lsbCBwcmV2ZW50IGV0aHRvb2wgZnJvbSBtb2Rp
ZnlpbmcgdHggbmFwaS4KPiA+Cj4gPiBXaGVuIHJlY2xhaW1pbmcgcHRyLCBhIG5ldyB0eXBlIG9m
IHB0ciBpcyBhZGRlZCwgd2hpY2ggaXMgZGlzdGluZ3Vpc2hlZAo+ID4gYmFzZWQgb24gdGhlIGxh
c3QgdHdvIGRpZ2l0cyBvZiBwdHI6Cj4gPiAwMDogc2tiCj4gPiAwMTogeGRwIGZyYW1lCj4gPiAx
MDogeHNrIHhtaXQgcHRyCj4gPgo+ID4gQWxsIHNlbnQgeHNrIHBhY2tldHMgc2hhcmUgdGhlIHZp
cnRpby1uZXQgaGVhZGVyIG9mIHhza19oZHIuIElmIHhzawo+ID4gbmVlZHMgdG8gc3VwcG9ydCBj
c3VtIGFuZCBvdGhlciBmdW5jdGlvbnMgbGF0ZXIsIGNvbnNpZGVyIGFzc2lnbmluZyB4c2sKPiA+
IGhkciBzZXBhcmF0ZWx5IGZvciBlYWNoIHNlbnQgcGFja2V0Lgo+ID4KPiA+IERpZmZlcmVudCBm
cm9tIG90aGVyIHBoeXNpY2FsIG5ldHdvcmsgY2FyZHMsIHlvdSBjYW4gcmVpbml0aWFsaXplIHRo
ZQo+ID4gY2hhbm5lbCB3aGVuIHlvdSBiaW5kIHhzay4gQW5kIHZydGlvIGRvZXMgbm90IHN1cHBv
cnQgaW5kZXBlbmRlbnQgcmVzZXQKPiA+IGNoYW5uZWwsIHlvdSBjYW4gb25seSByZXNldCB0aGUg
ZW50aXJlIGRldmljZS4gSSB0aGluayBpdCBpcyBub3QKPiA+IGFwcHJvcHJpYXRlIGZvciB1cyB0
byBkaXJlY3RseSByZXNldCB0aGUgZW50aXJlIHNldHRpbmcuIFNvIHRoZQo+ID4gc2l0dWF0aW9u
IGJlY29tZXMgYSBiaXQgbW9yZSBjb21wbGljYXRlZC4gV2UgaGF2ZSB0byBjb25zaWRlciBob3cK
PiA+IHRvIGRlYWwgd2l0aCB0aGUgYnVmZmVyIHJlZmVyZW5jZWQgaW4gdnEgYWZ0ZXIgeHNrIGlz
IHVuYmluZC4KPiA+Cj4gPiBJIGFkZGVkIHRoZSByaW5nIHNpemUgc3RydWN0IHZpcnRuZXRfeHNr
X2N0eCB3aGVuIHhzayBiZWVuIGJpbmQuIEVhY2ggeHNrCj4gPiBidWZmZXIgYWRkZWQgdG8gdnEg
Y29ycmVzcG9uZHMgdG8gYSBjdHguIFRoaXMgY3R4IGlzIHVzZWQgdG8gcmVjb3JkIHRoZQo+ID4g
cGFnZSB3aGVyZSB0aGUgeHNrIGJ1ZmZlciBpcyBsb2NhdGVkLCBhbmQgYWRkIGEgcGFnZSByZWZl
cmVuY2UuIFdoZW4gdGhlCj4gPiBidWZmZXIgaXMgcmVjeWNsaW5nLCByZWR1Y2UgdGhlIHJlZmVy
ZW5jZSB0byBwYWdlLiBXaGVuIHhzayBoYXMgYmVlbgo+ID4gdW5iaW5kLCBhbmQgYWxsIHJlbGF0
ZWQgeHNrIGJ1ZmZlcnMgaGF2ZSBiZWVuIHJlY3ljbGVkLCByZWxlYXNlIGFsbCBjdHguCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogWHVhbiBaaHVvIDx4dWFuemh1b0BsaW51eC5hbGliYWJhLmNvbT4K
PiA+IFJldmlld2VkLWJ5OiBEdXN0IExpIDxkdXN0LmxpQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4g
LS0tCj4gPiAgIGRyaXZlcnMvbmV0L3ZpcnRpby9NYWtlZmlsZSAgICAgfCAgIDEgKwo+ID4gICBk
cml2ZXJzL25ldC92aXJ0aW8vdmlydGlvX25ldC5jIHwgIDIwICstCj4gPiAgIGRyaXZlcnMvbmV0
L3ZpcnRpby92aXJ0aW9fbmV0LmggfCAgMzcgKysrLQo+ID4gICBkcml2ZXJzL25ldC92aXJ0aW8v
eHNrLmMgICAgICAgIHwgMzQ2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAg
IGRyaXZlcnMvbmV0L3ZpcnRpby94c2suaCAgICAgICAgfCAgOTkgKysrKysrKysrCj4gPiAgIDUg
ZmlsZXMgY2hhbmdlZCwgNDk3IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gPiAgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL25ldC92aXJ0aW8veHNrLmMKPiA+ICAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvbmV0L3ZpcnRpby94c2suaAo+ID4KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL25ldC92aXJ0aW8vTWFrZWZpbGUgYi9kcml2ZXJzL25ldC92aXJ0aW8vTWFrZWZpbGUK
PiA+IGluZGV4IGNjYzgwZjQwZjMzYS4uZGI3OWQyZTc5MjVmIDEwMDY0NAo+ID4gLS0tIGEvZHJp
dmVycy9uZXQvdmlydGlvL01ha2VmaWxlCj4gPiArKysgYi9kcml2ZXJzL25ldC92aXJ0aW8vTWFr
ZWZpbGUKPiA+IEBAIC00LDMgKzQsNCBAQAo+ID4gICAjCj4gPgo+ID4gICBvYmotJChDT05GSUdf
VklSVElPX05FVCkgKz0gdmlydGlvX25ldC5vCj4gPiArb2JqLSQoQ09ORklHX1ZJUlRJT19ORVQp
ICs9IHhzay5vCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvdmlydGlvL3ZpcnRpb19uZXQu
YyBiL2RyaXZlcnMvbmV0L3ZpcnRpby92aXJ0aW9fbmV0LmMKPiA+IGluZGV4IDM5NWVjMWYxODMz
MS4uNDBkNzc1MWYxYzVmIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9uZXQvdmlydGlvL3ZpcnRp
b19uZXQuYwo+ID4gKysrIGIvZHJpdmVycy9uZXQvdmlydGlvL3ZpcnRpb19uZXQuYwo+ID4gQEAg
LTE0MjMsNiArMTQyMyw3IEBAIHN0YXRpYyBpbnQgdmlydG5ldF9wb2xsX3R4KHN0cnVjdCBuYXBp
X3N0cnVjdCAqbmFwaSwgaW50IGJ1ZGdldCkKPiA+Cj4gPiAgIAl0eHEgPSBuZXRkZXZfZ2V0X3R4
X3F1ZXVlKHZpLT5kZXYsIGluZGV4KTsKPiA+ICAgCV9fbmV0aWZfdHhfbG9jayh0eHEsIHJhd19z
bXBfcHJvY2Vzc29yX2lkKCkpOwo+ID4gKwl3b3JrX2RvbmUgKz0gdmlydG5ldF9wb2xsX3hzayhz
cSwgYnVkZ2V0KTsKPiA+ICAgCWZyZWVfb2xkX3htaXQoc3EsIHRydWUpOwo+ID4gICAJX19uZXRp
Zl90eF91bmxvY2sodHhxKTsKPiA+Cj4gPiBAQCAtMjEzMyw4ICsyMTM0LDE2IEBAIHN0YXRpYyBp
bnQgdmlydG5ldF9zZXRfY29hbGVzY2Uoc3RydWN0IG5ldF9kZXZpY2UgKmRldiwKPiA+ICAgCWlm
IChuYXBpX3dlaWdodCBeIHZpLT5zcVswXS5uYXBpLndlaWdodCkgewo+ID4gICAJCWlmIChkZXYt
PmZsYWdzICYgSUZGX1VQKQo+ID4gICAJCQlyZXR1cm4gLUVCVVNZOwo+ID4gLQkJZm9yIChpID0g
MDsgaSA8IHZpLT5tYXhfcXVldWVfcGFpcnM7IGkrKykKPiA+ICsKPiA+ICsJCWZvciAoaSA9IDA7
IGkgPCB2aS0+bWF4X3F1ZXVlX3BhaXJzOyBpKyspIHsKPiA+ICsJCQkvKiB4c2sgeG1pdCBkZXBl
bmQgb24gdGhlIHR4IG5hcGkuIFNvIGlmIHhzayBpcyBhY3RpdmUsCj4gPiArCQkJICogcHJldmVu
dCBtb2RpZmljYXRpb25zIHRvIHR4IG5hcGkuCj4gPiArCQkJICovCj4gPiArCQkJaWYgKHJ0bmxf
ZGVyZWZlcmVuY2UodmktPnNxW2ldLnhzay5wb29sKSkKPiA+ICsJCQkJY29udGludWU7Cj4KPgo+
IFNvIHRoaXMgY2FuIHJlc3VsdCB0eCBOQVBJIGlzIHVzZWQgYnkgc29tZSBxdWV1ZXMgYnV5IG5v
dCB0aGUgb3RoZXJzLiBJCj4gdGhpbmsgc3VjaCBpbmNvbnNpc3RlbmN5IGJyZWFrcyB0aGUgc2Vt
YW50aWMgb2Ygc2V0X2NvYWxlc2NlKCkgd2hpY2gKPiBhc3N1bWVzIHRoZSBvcGVyYXRpb24gaXMg
ZG9uZSBhdCB0aGUgZGV2aWNlIG5vdCBzb21lIHNwZWNpZmljIHF1ZXVlcy4KPgo+IEhvdyBhYm91
dCBqdXN0IGZhaWwgaGVyZT8KPgo+Cj4gPiArCj4gPiAgIAkJCXZpLT5zcVtpXS5uYXBpLndlaWdo
dCA9IG5hcGlfd2VpZ2h0Owo+ID4gKwkJfQo+ID4gICAJfQo+ID4KPiA+ICAgCXJldHVybiAwOwo+
ID4gQEAgLTI0MDcsNiArMjQxNiw4IEBAIHN0YXRpYyBpbnQgdmlydG5ldF94ZHAoc3RydWN0IG5l
dF9kZXZpY2UgKmRldiwgc3RydWN0IG5ldGRldl9icGYgKnhkcCkKPiA+ICAgCXN3aXRjaCAoeGRw
LT5jb21tYW5kKSB7Cj4gPiAgIAljYXNlIFhEUF9TRVRVUF9QUk9HOgo+ID4gICAJCXJldHVybiB2
aXJ0bmV0X3hkcF9zZXQoZGV2LCB4ZHAtPnByb2csIHhkcC0+ZXh0YWNrKTsKPiA+ICsJY2FzZSBY
RFBfU0VUVVBfWFNLX1BPT0w6Cj4gPiArCQlyZXR1cm4gdmlydG5ldF94c2tfcG9vbF9zZXR1cChk
ZXYsIHhkcCk7Cj4gPiAgIAlkZWZhdWx0Ogo+ID4gICAJCXJldHVybiAtRUlOVkFMOwo+ID4gICAJ
fQo+ID4gQEAgLTI0NjYsNiArMjQ3Nyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbmV0X2Rldmlj
ZV9vcHMgdmlydG5ldF9uZXRkZXYgPSB7Cj4gPiAgIAkubmRvX3ZsYW5fcnhfa2lsbF92aWQgPSB2
aXJ0bmV0X3ZsYW5fcnhfa2lsbF92aWQsCj4gPiAgIAkubmRvX2JwZgkJPSB2aXJ0bmV0X3hkcCwK
PiA+ICAgCS5uZG9feGRwX3htaXQJCT0gdmlydG5ldF94ZHBfeG1pdCwKPiA+ICsJLm5kb194c2tf
d2FrZXVwICAgICAgICAgPSB2aXJ0bmV0X3hza193YWtldXAsCj4gPiAgIAkubmRvX2ZlYXR1cmVz
X2NoZWNrCT0gcGFzc3RocnVfZmVhdHVyZXNfY2hlY2ssCj4gPiAgIAkubmRvX2dldF9waHlzX3Bv
cnRfbmFtZQk9IHZpcnRuZXRfZ2V0X3BoeXNfcG9ydF9uYW1lLAo+ID4gICAJLm5kb19zZXRfZmVh
dHVyZXMJPSB2aXJ0bmV0X3NldF9mZWF0dXJlcywKPiA+IEBAIC0yNTY5LDEwICsyNTgxLDEyIEBA
IHN0YXRpYyB2b2lkIGZyZWVfdW51c2VkX2J1ZnMoc3RydWN0IHZpcnRuZXRfaW5mbyAqdmkpCj4g
PiAgIAlmb3IgKGkgPSAwOyBpIDwgdmktPm1heF9xdWV1ZV9wYWlyczsgaSsrKSB7Cj4gPiAgIAkJ
c3RydWN0IHZpcnRxdWV1ZSAqdnEgPSB2aS0+c3FbaV0udnE7Cj4gPiAgIAkJd2hpbGUgKChidWYg
PSB2aXJ0cXVldWVfZGV0YWNoX3VudXNlZF9idWYodnEpKSAhPSBOVUxMKSB7Cj4gPiAtCQkJaWYg
KCFpc194ZHBfZnJhbWUoYnVmKSkKPiA+ICsJCQlpZiAoaXNfc2tiX3B0cihidWYpKQo+ID4gICAJ
CQkJZGV2X2tmcmVlX3NrYihidWYpOwo+ID4gLQkJCWVsc2UKPiA+ICsJCQllbHNlIGlmIChpc194
ZHBfZnJhbWUoYnVmKSkKPiA+ICAgCQkJCXhkcF9yZXR1cm5fZnJhbWUocHRyX3RvX3hkcChidWYp
KTsKPiA+ICsJCQllbHNlCj4gPiArCQkJCXZpcnRuZXRfeHNrX2N0eF90eF9wdXQocHRyX3RvX3hz
ayhidWYpKTsKPiA+ICAgCQl9Cj4gPiAgIAl9Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bmV0L3ZpcnRpby92aXJ0aW9fbmV0LmggYi9kcml2ZXJzL25ldC92aXJ0aW8vdmlydGlvX25ldC5o
Cj4gPiBpbmRleCA5MzFjYzgxZjkyZmIuLmUzZGE4Mjk4ODdkYyAxMDA2NDQKPiA+IC0tLSBhL2Ry
aXZlcnMvbmV0L3ZpcnRpby92aXJ0aW9fbmV0LmgKPiA+ICsrKyBiL2RyaXZlcnMvbmV0L3ZpcnRp
by92aXJ0aW9fbmV0LmgKPiA+IEBAIC0xMzUsNiArMTM1LDE2IEBAIHN0cnVjdCBzZW5kX3F1ZXVl
IHsKPiA+ICAgCXN0cnVjdCB2aXJ0bmV0X3NxX3N0YXRzIHN0YXRzOwo+ID4KPiA+ICAgCXN0cnVj
dCBuYXBpX3N0cnVjdCBuYXBpOwo+ID4gKwo+ID4gKwlzdHJ1Y3Qgewo+ID4gKwkJc3RydWN0IHhz
a19idWZmX3Bvb2wgX19yY3UgKnBvb2w7Cj4gPiArCj4gPiArCQkvKiB4c2sgd2FpdCBmb3IgdHgg
aW50ZXIgb3Igc29mdGlycSAqLwo+ID4gKwkJYm9vbCBuZWVkX3dha2V1cDsKPiA+ICsKPiA+ICsJ
CS8qIGN0eCB1c2VkIHRvIHJlY29yZCB0aGUgcGFnZSBhZGRlZCB0byB2cSAqLwo+ID4gKwkJc3Ry
dWN0IHZpcnRuZXRfeHNrX2N0eF9oZWFkICpjdHhfaGVhZDsKPiA+ICsJfSB4c2s7Cj4gPiAgIH07
Cj4gPgo+ID4gICAvKiBJbnRlcm5hbCByZXByZXNlbnRhdGlvbiBvZiBhIHJlY2VpdmUgdmlydHF1
ZXVlICovCj4gPiBAQCAtMTg4LDYgKzE5OCwxMyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgdmlydHF1
ZXVlX25hcGlfc2NoZWR1bGUoc3RydWN0IG5hcGlfc3RydWN0ICpuYXBpLAo+ID4gICAJfQo+ID4g
ICB9Cj4gPgo+ID4gKyNpbmNsdWRlICJ4c2suaCIKPiA+ICsKPiA+ICtzdGF0aWMgaW5saW5lIGJv
b2wgaXNfc2tiX3B0cih2b2lkICpwdHIpCj4gPiArewo+ID4gKwlyZXR1cm4gISgodW5zaWduZWQg
bG9uZylwdHIgJiAoVklSVElPX1hEUF9GTEFHIHwgVklSVElPX1hTS19GTEFHKSk7Cj4gPiArfQo+
ID4gKwo+ID4gICBzdGF0aWMgaW5saW5lIGJvb2wgaXNfeGRwX2ZyYW1lKHZvaWQgKnB0cikKPiA+
ICAgewo+ID4gICAJcmV0dXJuICh1bnNpZ25lZCBsb25nKXB0ciAmIFZJUlRJT19YRFBfRkxBRzsK
PiA+IEBAIC0yMDYsMjUgKzIyMywzOSBAQCBzdGF0aWMgaW5saW5lIHN0cnVjdCB4ZHBfZnJhbWUg
KnB0cl90b194ZHAodm9pZCAqcHRyKQo+ID4gICBzdGF0aWMgaW5saW5lIHZvaWQgX19mcmVlX29s
ZF94bWl0KHN0cnVjdCBzZW5kX3F1ZXVlICpzcSwgYm9vbCBpbl9uYXBpLAo+ID4gICAJCQkJICAg
c3RydWN0IHZpcnRuZXRfc3Ffc3RhdHMgKnN0YXRzKQo+ID4gICB7Cj4gPiArCXVuc2lnbmVkIGlu
dCB4c2tudW0gPSAwOwo+ID4gICAJdW5zaWduZWQgaW50IGxlbjsKPiA+ICAgCXZvaWQgKnB0cjsK
PiA+Cj4gPiAgIAl3aGlsZSAoKHB0ciA9IHZpcnRxdWV1ZV9nZXRfYnVmKHNxLT52cSwgJmxlbikp
ICE9IE5VTEwpIHsKPiA+IC0JCWlmICghaXNfeGRwX2ZyYW1lKHB0cikpIHsKPiA+ICsJCWlmIChp
c19za2JfcHRyKHB0cikpIHsKPiA+ICAgCQkJc3RydWN0IHNrX2J1ZmYgKnNrYiA9IHB0cjsKPiA+
Cj4gPiAgIAkJCXByX2RlYnVnKCJTZW50IHNrYiAlcFxuIiwgc2tiKTsKPiA+Cj4gPiAgIAkJCXN0
YXRzLT5ieXRlcyArPSBza2ItPmxlbjsKPiA+ICAgCQkJbmFwaV9jb25zdW1lX3NrYihza2IsIGlu
X25hcGkpOwo+ID4gLQkJfSBlbHNlIHsKPiA+ICsJCX0gZWxzZSBpZiAoaXNfeGRwX2ZyYW1lKHB0
cikpIHsKPiA+ICAgCQkJc3RydWN0IHhkcF9mcmFtZSAqZnJhbWUgPSBwdHJfdG9feGRwKHB0cik7
Cj4gPgo+ID4gICAJCQlzdGF0cy0+Ynl0ZXMgKz0gZnJhbWUtPmxlbjsKPiA+ICAgCQkJeGRwX3Jl
dHVybl9mcmFtZShmcmFtZSk7Cj4gPiArCQl9IGVsc2Ugewo+ID4gKwkJCXN0cnVjdCB2aXJ0bmV0
X3hza19jdHhfdHggKmN0eDsKPiA+ICsKPiA+ICsJCQljdHggPSBwdHJfdG9feHNrKHB0cik7Cj4g
PiArCj4gPiArCQkJLyogTWF5YmUgdGhpcyBwdHIgd2FzIHNlbnQgYnkgdGhlIGxhc3QgeHNrLiAq
Lwo+ID4gKwkJCWlmIChjdHgtPmN0eC5oZWFkLT5hY3RpdmUpCj4gPiArCQkJCSsreHNrbnVtOwo+
ID4gKwo+ID4gKwkJCXN0YXRzLT5ieXRlcyArPSBjdHgtPmxlbjsKPiA+ICsJCQl2aXJ0bmV0X3hz
a19jdHhfdHhfcHV0KGN0eCk7Cj4gPiAgIAkJfQo+ID4gICAJCXN0YXRzLT5wYWNrZXRzKys7Cj4g
PiAgIAl9Cj4gPiAtfQo+ID4KPiA+ICsJaWYgKHhza251bSkKPiA+ICsJCXZpcnRuZXRfeHNrX2Nv
bXBsZXRlKHNxLCB4c2tudW0pOwo+ID4gK30KPiA+ICAgI2VuZGlmCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9uZXQvdmlydGlvL3hzay5jIGIvZHJpdmVycy9uZXQvdmlydGlvL3hzay5jCj4gPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5mOThiNjg1NzY3MDkK
PiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL2RyaXZlcnMvbmV0L3ZpcnRpby94c2suYwo+ID4g
QEAgLTAsMCArMSwzNDYgQEAKPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MC1vci1sYXRlcgo+ID4gKy8qCj4gPiArICogdmlydGlvLW5ldCB4c2sKPiA+ICsgKi8KPiA+ICsK
PiA+ICsjaW5jbHVkZSAidmlydGlvX25ldC5oIgo+ID4gKwo+ID4gK3N0YXRpYyBzdHJ1Y3Qgdmly
dGlvX25ldF9oZHJfbXJnX3J4YnVmIHhza19oZHI7Cj4gPiArCj4gPiArc3RhdGljIHN0cnVjdCB2
aXJ0bmV0X3hza19jdHggKnZpcnRuZXRfeHNrX2N0eF9nZXQoc3RydWN0IHZpcnRuZXRfeHNrX2N0
eF9oZWFkICpoZWFkKQo+ID4gK3sKPiA+ICsJc3RydWN0IHZpcnRuZXRfeHNrX2N0eCAqY3R4Owo+
ID4gKwo+ID4gKwljdHggPSBoZWFkLT5jdHg7Cj4gPiArCWhlYWQtPmN0eCA9IGN0eC0+bmV4dDsK
PiA+ICsKPiA+ICsJKytoZWFkLT5yZWY7Cj4gPiArCj4gPiArCXJldHVybiBjdHg7Cj4gPiArfQo+
ID4gKwo+ID4gKyNkZWZpbmUgdmlydG5ldF94c2tfY3R4X3R4X2dldChoZWFkKSAoKHN0cnVjdCB2
aXJ0bmV0X3hza19jdHhfdHggKil2aXJ0bmV0X3hza19jdHhfZ2V0KGhlYWQpKQo+ID4gKwo+ID4g
K3N0YXRpYyB2b2lkIHZpcnRuZXRfeHNrX2NoZWNrX3F1ZXVlKHN0cnVjdCBzZW5kX3F1ZXVlICpz
cSkKPiA+ICt7Cj4gPiArCXN0cnVjdCB2aXJ0bmV0X2luZm8gKnZpID0gc3EtPnZxLT52ZGV2LT5w
cml2Owo+ID4gKwlzdHJ1Y3QgbmV0X2RldmljZSAqZGV2ID0gdmktPmRldjsKPiA+ICsJaW50IHFu
dW0gPSBzcSAtIHZpLT5zcTsKPiA+ICsKPiA+ICsJLyogSWYgaXQgaXMgYSByYXcgYnVmZmVyIHF1
ZXVlLCBpdCBkb2VzIG5vdCBjaGVjayB3aGV0aGVyIHRoZSBzdGF0dXMKPiA+ICsJICogb2YgdGhl
IHF1ZXVlIGlzIHN0b3BwZWQgd2hlbiBzZW5kaW5nLiBTbyB0aGVyZSBpcyBubyBuZWVkIHRvIGNo
ZWNrCj4gPiArCSAqIHRoZSBzaXR1YXRpb24gb2YgdGhlIHJhdyBidWZmZXIgcXVldWUuCj4gPiAr
CSAqLwo+ID4gKwlpZiAoaXNfeGRwX3Jhd19idWZmZXJfcXVldWUodmksIHFudW0pKQo+ID4gKwkJ
cmV0dXJuOwo+ID4gKwo+ID4gKwkvKiBJZiB0aGlzIHNxIGlzIG5vdCB0aGUgZXhjbHVzaXZlIHF1
ZXVlIG9mIHRoZSBjdXJyZW50IGNwdSwKPiA+ICsJICogdGhlbiBpdCBtYXkgYmUgY2FsbGVkIGJ5
IHN0YXJ0X3htaXQsIHNvIGNoZWNrIGl0IHJ1bm5pbmcgb3V0Cj4gPiArCSAqIG9mIHNwYWNlLgo+
ID4gKwkgKgo+ID4gKwkgKiBTdG9wIHRoZSBxdWV1ZSB0byBhdm9pZCBnZXR0aW5nIHBhY2tldHMg
dGhhdCB3ZSBhcmUKPiA+ICsJICogdGhlbiB1bmFibGUgdG8gdHJhbnNtaXQuIFRoZW4gd2FpdCB0
aGUgdHggaW50ZXJydXB0Lgo+ID4gKwkgKi8KPiA+ICsJaWYgKHNxLT52cS0+bnVtX2ZyZWUgPCAy
ICsgTUFYX1NLQl9GUkFHUykKPiA+ICsJCW5ldGlmX3N0b3Bfc3VicXVldWUoZGV2LCBxbnVtKTsK
PiA+ICt9Cj4gPiArCj4gPiArdm9pZCB2aXJ0bmV0X3hza19jb21wbGV0ZShzdHJ1Y3Qgc2VuZF9x
dWV1ZSAqc3EsIHUzMiBudW0pCj4gPiArewo+ID4gKwlzdHJ1Y3QgeHNrX2J1ZmZfcG9vbCAqcG9v
bDsKPiA+ICsKPiA+ICsJcmN1X3JlYWRfbG9jaygpOwo+ID4gKwlwb29sID0gcmN1X2RlcmVmZXJl
bmNlKHNxLT54c2sucG9vbCk7Cj4gPiArCWlmICghcG9vbCkgewo+ID4gKwkJcmN1X3JlYWRfdW5s
b2NrKCk7Cj4gPiArCQlyZXR1cm47Cj4gPiArCX0KPiA+ICsJeHNrX3R4X2NvbXBsZXRlZChwb29s
LCBudW0pOwo+ID4gKwlyY3VfcmVhZF91bmxvY2soKTsKPiA+ICsKPiA+ICsJaWYgKHNxLT54c2su
bmVlZF93YWtldXApIHsKPiA+ICsJCXNxLT54c2submVlZF93YWtldXAgPSBmYWxzZTsKPiA+ICsJ
CXZpcnRxdWV1ZV9uYXBpX3NjaGVkdWxlKCZzcS0+bmFwaSwgc3EtPnZxKTsKPiA+ICsJfQo+ID4g
K30KPiA+ICsKPiA+ICtzdGF0aWMgaW50IHZpcnRuZXRfeHNrX3htaXQoc3RydWN0IHNlbmRfcXVl
dWUgKnNxLCBzdHJ1Y3QgeHNrX2J1ZmZfcG9vbCAqcG9vbCwKPiA+ICsJCQkgICAgc3RydWN0IHhk
cF9kZXNjICpkZXNjKQo+ID4gK3sKPiA+ICsJc3RydWN0IHZpcnRuZXRfeHNrX2N0eF90eCAqY3R4
Owo+ID4gKwlzdHJ1Y3QgdmlydG5ldF9pbmZvICp2aTsKPiA+ICsJdTMyIG9mZnNldCwgbiwgbGVu
Owo+ID4gKwlzdHJ1Y3QgcGFnZSAqcGFnZTsKPiA+ICsJdm9pZCAqZGF0YTsKPiA+ICsKPiA+ICsJ
dmkgPSBzcS0+dnEtPnZkZXYtPnByaXY7Cj4gPiArCj4gPiArCWRhdGEgPSB4c2tfYnVmZl9yYXdf
Z2V0X2RhdGEocG9vbCwgZGVzYy0+YWRkcik7Cj4gPiArCW9mZnNldCA9IG9mZnNldF9pbl9wYWdl
KGRhdGEpOwo+ID4gKwo+ID4gKwljdHggPSB2aXJ0bmV0X3hza19jdHhfdHhfZ2V0KHNxLT54c2su
Y3R4X2hlYWQpOwo+ID4gKwo+ID4gKwkvKiB4c2sgdW5hbGlnbmVkIG1vZGUsIGRlc2MgbWF5IHVz
ZSB0d28gcGFnZXMgKi8KPiA+ICsJaWYgKGRlc2MtPmxlbiA+IFBBR0VfU0laRSAtIG9mZnNldCkK
PiA+ICsJCW4gPSAzOwo+ID4gKwllbHNlCj4gPiArCQluID0gMjsKPiA+ICsKPiA+ICsJc2dfaW5p
dF90YWJsZShzcS0+c2csIG4pOwo+ID4gKwlzZ19zZXRfYnVmKHNxLT5zZywgJnhza19oZHIsIHZp
LT5oZHJfbGVuKTsKPiA+ICsKPiA+ICsJLyogaGFuZGxlIGZvciB4c2sgZmlyc3QgcGFnZSAqLwo+
ID4gKwlsZW4gPSBtaW5fdChpbnQsIGRlc2MtPmxlbiwgUEFHRV9TSVpFIC0gb2Zmc2V0KTsKPiA+
ICsJcGFnZSA9IHZtYWxsb2NfdG9fcGFnZShkYXRhKTsKPiA+ICsJc2dfc2V0X3BhZ2Uoc3EtPnNn
ICsgMSwgcGFnZSwgbGVuLCBvZmZzZXQpOwo+ID4gKwo+ID4gKwkvKiBjdHggaXMgdXNlZCB0byBy
ZWNvcmQgYW5kIHJlZmVyZW5jZSB0aGlzIHBhZ2UgdG8gcHJldmVudCB4c2sgZnJvbQo+ID4gKwkg
KiBiZWluZyByZWxlYXNlZCBiZWZvcmUgdGhpcyB4bWl0IGlzIHJlY3ljbGVkCj4gPiArCSAqLwo+
Cj4KPiBJJ20gYSBsaXR0bGUgYml0IHN1cnByaXNlZCB0aGF0IHRoaXMgaXMgZG9uZSBtYW51YWxs
eSBwZXIgZGV2aWNlIGluc3RlYWQKPiBvZiBkb2luZyBpdCBpbiB4c2sgY29yZS4KPgo+Cj4gPiAr
CWN0eC0+Y3R4LnBhZ2UgPSBwYWdlOwo+ID4gKwlnZXRfcGFnZShwYWdlKTsKPiA+ICsKPiA+ICsJ
LyogeHNrIHVuYWxpZ25lZCBtb2RlLCBoYW5kbGUgZm9yIHRoZSBzZWNvbmQgcGFnZSAqLwo+ID4g
KwlpZiAobGVuIDwgZGVzYy0+bGVuKSB7Cj4gPiArCQlwYWdlID0gdm1hbGxvY190b19wYWdlKGRh
dGEgKyBsZW4pOwo+ID4gKwkJbGVuID0gbWluX3QoaW50LCBkZXNjLT5sZW4gLSBsZW4sIFBBR0Vf
U0laRSk7Cj4gPiArCQlzZ19zZXRfcGFnZShzcS0+c2cgKyAyLCBwYWdlLCBsZW4sIDApOwo+ID4g
Kwo+ID4gKwkJY3R4LT5jdHgucGFnZV91bmFsaWduZWQgPSBwYWdlOwo+ID4gKwkJZ2V0X3BhZ2Uo
cGFnZSk7Cj4gPiArCX0gZWxzZSB7Cj4gPiArCQljdHgtPmN0eC5wYWdlX3VuYWxpZ25lZCA9IE5V
TEw7Cj4gPiArCX0KPiA+ICsKPiA+ICsJcmV0dXJuIHZpcnRxdWV1ZV9hZGRfb3V0YnVmKHNxLT52
cSwgc3EtPnNnLCBuLAo+ID4gKwkJCQkgICB4c2tfdG9fcHRyKGN0eCksIEdGUF9BVE9NSUMpOwo+
ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgaW50IHZpcnRuZXRfeHNrX3htaXRfYmF0Y2goc3RydWN0
IHNlbmRfcXVldWUgKnNxLAo+ID4gKwkJCQkgIHN0cnVjdCB4c2tfYnVmZl9wb29sICpwb29sLAo+
ID4gKwkJCQkgIHVuc2lnbmVkIGludCBidWRnZXQsCj4gPiArCQkJCSAgYm9vbCBpbl9uYXBpLCBp
bnQgKmRvbmUsCj4gPiArCQkJCSAgc3RydWN0IHZpcnRuZXRfc3Ffc3RhdHMgKnN0YXRzKQo+ID4g
K3sKPiA+ICsJc3RydWN0IHhkcF9kZXNjIGRlc2M7Cj4gPiArCWludCBlcnIsIHBhY2tldCA9IDA7
Cj4gPiArCWludCByZXQgPSAtRUFHQUlOOwo+ID4gKwo+ID4gKwl3aGlsZSAoYnVkZ2V0LS0gPiAw
KSB7Cj4gPiArCQlpZiAoc3EtPnZxLT5udW1fZnJlZSA8IDIgKyBNQVhfU0tCX0ZSQUdTKSB7Cj4K
Pgo+IEFGX1hEUCBkb2Vzbid0IHVzZSBza2IsIHNvIEkgZG9uJ3Qgc2VlIHdoeSBNQVhfU0tCX0ZS
QUdTIGlzIHVzZWQuCj4KPiBMb29raW5nIGF0IHZpcnRuZXRfeHNrX3htaXQoKSwgaXQgbG9va3Mg
dG8gbWUgMyBpcyBtb3JlIHN1aXRhYmxlIGhlcmUuCj4gT3IgZGlkIEFGX1hEUCBjb3JlIGNhbiBo
YW5kbGUgcXVldWUgZnVsbCBncmFjZWZ1bGx5IHRoZW4gd2UgZG9uJ3QgZXZlbgo+IG5lZWQgdG8g
d29ycnkgYWJvdXQgdGhpcz8KPgo+Cj4gPiArCQkJcmV0ID0gLUVCVVNZOwo+Cj4KPiAtRU5PU1BD
IGxvb2tzIGJldHRlci4KPgo+Cj4gPiArCQkJYnJlYWs7Cj4gPiArCQl9Cj4gPiArCj4gPiArCQlp
ZiAoIXhza190eF9wZWVrX2Rlc2MocG9vbCwgJmRlc2MpKSB7Cj4gPiArCQkJLyogZG9uZSAqLwo+
ID4gKwkJCXJldCA9IDA7Cj4gPiArCQkJYnJlYWs7Cj4gPiArCQl9Cj4gPiArCj4gPiArCQllcnIg
PSB2aXJ0bmV0X3hza194bWl0KHNxLCBwb29sLCAmZGVzYyk7Cj4gPiArCQlpZiAodW5saWtlbHko
ZXJyKSkgewo+Cj4KPiBJZiB3ZSBhbHdheXMgcmVzZXJ2ZSBzdWZmaWNpZW50IHNsb3RzLCB0aGlz
IHNob3VsZCBiZSBhbiB1bmV4cGVjdGVkCj4gZXJyb3IsIGRvIHdlIG5lZWQgbG9nIHRoaXMgYXMg
d2hhdCBoYXMgYmVlbiBkb25lIGluIHN0YXJ0X3htaXQoKT8KPgo+ICDCoMKgwqDCoMKgwqDCoCAv
KiBUaGlzIHNob3VsZCBub3QgaGFwcGVuISAqLwo+ICDCoMKgwqDCoMKgwqDCoCBpZiAodW5saWtl
bHkoZXJyKSkgewo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2LT5zdGF0cy50
eF9maWZvX2Vycm9ycysrOwo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKG5l
dF9yYXRlbGltaXQoKSkKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBkZXZfd2FybigmZGV2LT5kZXYsCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIlVuZXhwZWN0ZWQgVFhRICgl
ZCkgcXVldWUgZmFpbHVyZTogJWRcbiIsCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcW51bSwgZXJyKTsKPgo+Cj4gPiAr
CQkJcmV0ID0gLUVCVVNZOwo+ID4gKwkJCWJyZWFrOwo+ID4gKwkJfQo+ID4gKwo+ID4gKwkJKytw
YWNrZXQ7Cj4gPiArCX0KPiA+ICsKPiA+ICsJaWYgKHBhY2tldCkgewo+ID4gKwkJaWYgKHZpcnRx
dWV1ZV9raWNrX3ByZXBhcmUoc3EtPnZxKSAmJiB2aXJ0cXVldWVfbm90aWZ5KHNxLT52cSkpCj4g
PiArCQkJKytzdGF0cy0+a2lja3M7Cj4gPiArCj4gPiArCQkqZG9uZSArPSBwYWNrZXQ7Cj4gPiAr
CQlzdGF0cy0+eGRwX3R4ICs9IHBhY2tldDsKPiA+ICsKPiA+ICsJCXhza190eF9yZWxlYXNlKHBv
b2wpOwo+ID4gKwl9Cj4gPiArCj4gPiArCXJldHVybiByZXQ7Cj4gPiArfQo+ID4gKwo+ID4gK3N0
YXRpYyBpbnQgdmlydG5ldF94c2tfcnVuKHN0cnVjdCBzZW5kX3F1ZXVlICpzcSwgc3RydWN0IHhz
a19idWZmX3Bvb2wgKnBvb2wsCj4gPiArCQkJICAgaW50IGJ1ZGdldCwgYm9vbCBpbl9uYXBpKQo+
ID4gK3sKPiA+ICsJc3RydWN0IHZpcnRuZXRfc3Ffc3RhdHMgc3RhdHMgPSB7fTsKPiA+ICsJaW50
IGRvbmUgPSAwOwo+ID4gKwlpbnQgZXJyOwo+ID4gKwo+ID4gKwlzcS0+eHNrLm5lZWRfd2FrZXVw
ID0gZmFsc2U7Cj4gPiArCV9fZnJlZV9vbGRfeG1pdChzcSwgaW5fbmFwaSwgJnN0YXRzKTsKPiA+
ICsKPiA+ICsJLyogcmV0dXJuIGVycjoKPiA+ICsJICogLUVBR0FJTjogZG9uZSA9PSBidWRnZXQK
PiA+ICsJICogLUVCVVNZOiAgZG9uZSA8IGJ1ZGdldAo+ID4gKwkgKiAgMCAgICA6ICBkb25lIDwg
YnVkZ2V0Cj4gPiArCSAqLwo+Cj4KPiBJdCdzIGJldHRlciB0byBtb3ZlIHRoZSBjb21tZW50IHRv
IHRoZSBpbXBsZW1lbnRhdGlvbiBvZgo+IHZpcnRuZXRfeHNrX3htaXRfYmF0Y2goKS4KPgo+Cj4g
PiAreG1pdDoKPiA+ICsJZXJyID0gdmlydG5ldF94c2tfeG1pdF9iYXRjaChzcSwgcG9vbCwgYnVk
Z2V0IC0gZG9uZSwgaW5fbmFwaSwKPiA+ICsJCQkJICAgICAmZG9uZSwgJnN0YXRzKTsKPiA+ICsJ
aWYgKGVyciA9PSAtRUJVU1kpIHsKPiA+ICsJCV9fZnJlZV9vbGRfeG1pdChzcSwgaW5fbmFwaSwg
JnN0YXRzKTsKPiA+ICsKPiA+ICsJCS8qIElmIHRoZSBzcGFjZSBpcyBlbm91Z2gsIGxldCBuYXBp
IHJ1biBhZ2Fpbi4gKi8KPiA+ICsJCWlmIChzcS0+dnEtPm51bV9mcmVlID49IDIgKyBNQVhfU0tC
X0ZSQUdTKQo+Cj4KPiBUaGUgY29tbWVudCBkb2VzIG5vdCBtYXRjaCB0aGUgY29kZS4KPgo+Cj4g
PiArCQkJZ290byB4bWl0Owo+ID4gKwkJZWxzZQo+ID4gKwkJCXNxLT54c2submVlZF93YWtldXAg
PSB0cnVlOwo+ID4gKwl9Cj4gPiArCj4gPiArCXZpcnRuZXRfeHNrX2NoZWNrX3F1ZXVlKHNxKTsK
PiA+ICsKPiA+ICsJdTY0X3N0YXRzX3VwZGF0ZV9iZWdpbigmc3EtPnN0YXRzLnN5bmNwKTsKPiA+
ICsJc3EtPnN0YXRzLnBhY2tldHMgKz0gc3RhdHMucGFja2V0czsKPiA+ICsJc3EtPnN0YXRzLmJ5
dGVzICs9IHN0YXRzLmJ5dGVzOwo+ID4gKwlzcS0+c3RhdHMua2lja3MgKz0gc3RhdHMua2lja3M7
Cj4gPiArCXNxLT5zdGF0cy54ZHBfdHggKz0gc3RhdHMueGRwX3R4Owo+ID4gKwl1NjRfc3RhdHNf
dXBkYXRlX2VuZCgmc3EtPnN0YXRzLnN5bmNwKTsKPiA+ICsKPiA+ICsJcmV0dXJuIGRvbmU7Cj4g
PiArfQo+ID4gKwo+ID4gK2ludCB2aXJ0bmV0X3BvbGxfeHNrKHN0cnVjdCBzZW5kX3F1ZXVlICpz
cSwgaW50IGJ1ZGdldCkKPiA+ICt7Cj4gPiArCXN0cnVjdCB4c2tfYnVmZl9wb29sICpwb29sOwo+
ID4gKwlpbnQgd29ya19kb25lID0gMDsKPiA+ICsKPiA+ICsJcmN1X3JlYWRfbG9jaygpOwo+ID4g
Kwlwb29sID0gcmN1X2RlcmVmZXJlbmNlKHNxLT54c2sucG9vbCk7Cj4gPiArCWlmIChwb29sKQo+
ID4gKwkJd29ya19kb25lID0gdmlydG5ldF94c2tfcnVuKHNxLCBwb29sLCBidWRnZXQsIHRydWUp
Owo+ID4gKwlyY3VfcmVhZF91bmxvY2soKTsKPiA+ICsJcmV0dXJuIHdvcmtfZG9uZTsKPiA+ICt9
Cj4gPiArCj4gPiAraW50IHZpcnRuZXRfeHNrX3dha2V1cChzdHJ1Y3QgbmV0X2RldmljZSAqZGV2
LCB1MzIgcWlkLCB1MzIgZmxhZykKPiA+ICt7Cj4gPiArCXN0cnVjdCB2aXJ0bmV0X2luZm8gKnZp
ID0gbmV0ZGV2X3ByaXYoZGV2KTsKPiA+ICsJc3RydWN0IHhza19idWZmX3Bvb2wgKnBvb2w7Cj4g
PiArCXN0cnVjdCBzZW5kX3F1ZXVlICpzcTsKPiA+ICsKPiA+ICsJaWYgKCFuZXRpZl9ydW5uaW5n
KGRldikpCj4gPiArCQlyZXR1cm4gLUVORVRET1dOOwo+ID4gKwo+ID4gKwlpZiAocWlkID49IHZp
LT5jdXJyX3F1ZXVlX3BhaXJzKQo+ID4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4KPgo+IEkgd29uZGVy
IGhvdyB3ZSBjYW4gaGl0IHRoaXMgY2hlY2suIE5vdGUgdGhhdCB3ZSBwcmV2ZW50IHRoZSB1c2Vy
IGZyb20KPiBtb2RpZnlpbmcgcXVldWUgcGFpcnMgd2hlbiBYRFAgaXMgZW5hYmxlZDoKPgo+ICDC
oMKgwqDCoMKgwqDCoCAvKiBGb3Igbm93IHdlIGRvbid0IHN1cHBvcnQgbW9kaWZ5aW5nIGNoYW5u
ZWxzIHdoaWxlIFhEUCBpcyBsb2FkZWQKPiAgwqDCoMKgwqDCoMKgwqDCoCAqIGFsc28gd2hlbiBY
RFAgaXMgbG9hZGVkIGFsbCBSWCBxdWV1ZXMgaGF2ZSBYRFAgcHJvZ3JhbXMgc28KPiB3ZSBvbmx5
Cj4gIMKgwqDCoMKgwqDCoMKgwqAgKiBuZWVkIHRvIGNoZWNrIGEgc2luZ2xlIFJYIHF1ZXVlLgo+
ICDCoMKgwqDCoMKgwqDCoMKgICovCj4gIMKgwqDCoMKgwqDCoMKgIGlmICh2aS0+cnFbMF0ueGRw
X3Byb2cpCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsK
Pgo+ID4gKwo+ID4gKwlzcSA9ICZ2aS0+c3FbcWlkXTsKPiA+ICsKPiA+ICsJcmN1X3JlYWRfbG9j
aygpOwo+Cj4KPiBDYW4gd2Ugc2ltcGx5IHVzZSByY3VfcmVhZF9sb2NrX2JoKCkgaGVyZT8KPgo+
Cj4gPiArCXBvb2wgPSByY3VfZGVyZWZlcmVuY2Uoc3EtPnhzay5wb29sKTsKPiA+ICsJaWYgKHBv
b2wpIHsKPiA+ICsJCWxvY2FsX2JoX2Rpc2FibGUoKTsKPiA+ICsJCXZpcnRxdWV1ZV9uYXBpX3Nj
aGVkdWxlKCZzcS0+bmFwaSwgc3EtPnZxKTsKPiA+ICsJCWxvY2FsX2JoX2VuYWJsZSgpOwo+ID4g
Kwl9Cj4gPiArCXJjdV9yZWFkX3VubG9jaygpOwo+ID4gKwlyZXR1cm4gMDsKPiA+ICt9Cj4gPiAr
Cj4gPiArc3RhdGljIHN0cnVjdCB2aXJ0bmV0X3hza19jdHhfaGVhZCAqdmlydG5ldF94c2tfY3R4
X2FsbG9jKHN0cnVjdCB4c2tfYnVmZl9wb29sICpwb29sLAo+ID4gKwkJCQkJCQkgIHN0cnVjdCB2
aXJ0cXVldWUgKnZxKQo+ID4gK3sKPiA+ICsJc3RydWN0IHZpcnRuZXRfeHNrX2N0eF9oZWFkICpo
ZWFkOwo+ID4gKwl1MzIgc2l6ZSwgbiwgcmluZ19zaXplLCBjdHhfc3o7Cj4gPiArCXN0cnVjdCB2
aXJ0bmV0X3hza19jdHggKmN0eDsKPiA+ICsJdm9pZCAqcDsKPiA+ICsKPiA+ICsJY3R4X3N6ID0g
c2l6ZW9mKHN0cnVjdCB2aXJ0bmV0X3hza19jdHhfdHgpOwo+ID4gKwo+ID4gKwlyaW5nX3NpemUg
PSB2aXJ0cXVldWVfZ2V0X3ZyaW5nX3NpemUodnEpOwo+ID4gKwlzaXplID0gc2l6ZW9mKCpoZWFk
KSArIGN0eF9zeiAqIHJpbmdfc2l6ZTsKPiA+ICsKPiA+ICsJaGVhZCA9IGttYWxsb2Moc2l6ZSwg
R0ZQX0FUT01JQyk7Cj4gPiArCWlmICghaGVhZCkKPiA+ICsJCXJldHVybiBOVUxMOwo+ID4gKwo+
ID4gKwltZW1zZXQoaGVhZCwgMCwgc2l6ZW9mKCpoZWFkKSk7Cj4gPiArCj4gPiArCWhlYWQtPmFj
dGl2ZSA9IHRydWU7Cj4gPiArCWhlYWQtPmZyYW1lX3NpemUgPSB4c2tfcG9vbF9nZXRfcnhfZnJh
bWVfc2l6ZShwb29sKTsKPiA+ICsKPiA+ICsJcCA9IGhlYWQgKyAxOwo+ID4gKwlmb3IgKG4gPSAw
OyBuIDwgcmluZ19zaXplOyArK24pIHsKPiA+ICsJCWN0eCA9IHA7Cj4gPiArCQljdHgtPmhlYWQg
PSBoZWFkOwo+ID4gKwkJY3R4LT5uZXh0ID0gaGVhZC0+Y3R4Owo+ID4gKwkJaGVhZC0+Y3R4ID0g
Y3R4Owo+ID4gKwo+ID4gKwkJcCArPSBjdHhfc3o7Cj4gPiArCX0KPiA+ICsKPiA+ICsJcmV0dXJu
IGhlYWQ7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBpbnQgdmlydG5ldF94c2tfcG9vbF9lbmFi
bGUoc3RydWN0IG5ldF9kZXZpY2UgKmRldiwKPiA+ICsJCQkJICAgc3RydWN0IHhza19idWZmX3Bv
b2wgKnBvb2wsCj4gPiArCQkJCSAgIHUxNiBxaWQpCj4gPiArewo+ID4gKwlzdHJ1Y3QgdmlydG5l
dF9pbmZvICp2aSA9IG5ldGRldl9wcml2KGRldik7Cj4gPiArCXN0cnVjdCBzZW5kX3F1ZXVlICpz
cTsKPiA+ICsKPiA+ICsJaWYgKHFpZCA+PSB2aS0+Y3Vycl9xdWV1ZV9wYWlycykKPiA+ICsJCXJl
dHVybiAtRUlOVkFMOwo+ID4gKwo+ID4gKwlzcSA9ICZ2aS0+c3FbcWlkXTsKPiA+ICsKPiA+ICsJ
LyogeHNrIHplcm9jb3B5IGRlcGVuZCBvbiB0aGUgdHggbmFwaS4KPiA+ICsJICoKPiA+ICsJICog
QWxsIGRhdGEgaXMgYWN0dWFsbHkgY29uc3VtZWQgYW5kIHNlbnQgb3V0IGZyb20gdGhlIHhzayB0
eCBxdWV1ZQo+ID4gKwkgKiB1bmRlciB0aGUgdHggbmFwaSBtZWNoYW5pc20uCj4gPiArCSAqLwo+
ID4gKwlpZiAoIXNxLT5uYXBpLndlaWdodCkKPiA+ICsJCXJldHVybiAtRVBFUk07Cj4gPiArCj4g
PiArCW1lbXNldCgmc3EtPnhzaywgMCwgc2l6ZW9mKHNxLT54c2spKTsKPiA+ICsKPiA+ICsJc3Et
Pnhzay5jdHhfaGVhZCA9IHZpcnRuZXRfeHNrX2N0eF9hbGxvYyhwb29sLCBzcS0+dnEpOwo+ID4g
KwlpZiAoIXNxLT54c2suY3R4X2hlYWQpCj4gPiArCQlyZXR1cm4gLUVOT01FTTsKPiA+ICsKPiA+
ICsJLyogSGVyZSBpcyBhbHJlYWR5IHByb3RlY3RlZCBieSBydG5sX2xvY2ssIHNvIHJjdV9hc3Np
Z25fcG9pbnRlciBpcwo+ID4gKwkgKiBzYWZlLgo+ID4gKwkgKi8KPiA+ICsJcmN1X2Fzc2lnbl9w
b2ludGVyKHNxLT54c2sucG9vbCwgcG9vbCk7Cj4gPiArCj4gPiArCXJldHVybiAwOwo+ID4gK30K
PiA+ICsKPiA+ICtzdGF0aWMgaW50IHZpcnRuZXRfeHNrX3Bvb2xfZGlzYWJsZShzdHJ1Y3QgbmV0
X2RldmljZSAqZGV2LCB1MTYgcWlkKQo+ID4gK3sKPiA+ICsJc3RydWN0IHZpcnRuZXRfaW5mbyAq
dmkgPSBuZXRkZXZfcHJpdihkZXYpOwo+ID4gKwlzdHJ1Y3Qgc2VuZF9xdWV1ZSAqc3E7Cj4gPiAr
Cj4gPiArCWlmIChxaWQgPj0gdmktPmN1cnJfcXVldWVfcGFpcnMpCj4gPiArCQlyZXR1cm4gLUVJ
TlZBTDsKPiA+ICsKPiA+ICsJc3EgPSAmdmktPnNxW3FpZF07Cj4gPiArCj4gPiArCS8qIEhlcmUg
aXMgYWxyZWFkeSBwcm90ZWN0ZWQgYnkgcnRubF9sb2NrLCBzbyByY3VfYXNzaWduX3BvaW50ZXIg
aXMKPiA+ICsJICogc2FmZS4KPiA+ICsJICovCj4gPiArCXJjdV9hc3NpZ25fcG9pbnRlcihzcS0+
eHNrLnBvb2wsIE5VTEwpOwo+ID4gKwo+ID4gKwkvKiBTeW5jIHdpdGggdGhlIFhTSyB3YWtldXAg
YW5kIHdpdGggTkFQSS4gKi8KPiA+ICsJc3luY2hyb25pemVfbmV0KCk7Cj4gPiArCj4gPiArCWlm
IChSRUFEX09OQ0Uoc3EtPnhzay5jdHhfaGVhZC0+cmVmKSkKPiA+ICsJCVdSSVRFX09OQ0Uoc3Et
Pnhzay5jdHhfaGVhZC0+YWN0aXZlLCBmYWxzZSk7Cj4gPiArCWVsc2UKPiA+ICsJCWtmcmVlKHNx
LT54c2suY3R4X2hlYWQpOwo+ID4gKwo+ID4gKwlzcS0+eHNrLmN0eF9oZWFkID0gTlVMTDsKPiA+
ICsKPiA+ICsJcmV0dXJuIDA7Cj4gPiArfQo+ID4gKwo+ID4gK2ludCB2aXJ0bmV0X3hza19wb29s
X3NldHVwKHN0cnVjdCBuZXRfZGV2aWNlICpkZXYsIHN0cnVjdCBuZXRkZXZfYnBmICp4ZHApCj4g
PiArewo+ID4gKwlpZiAoeGRwLT54c2sucG9vbCkKPiA+ICsJCXJldHVybiB2aXJ0bmV0X3hza19w
b29sX2VuYWJsZShkZXYsIHhkcC0+eHNrLnBvb2wsCj4gPiArCQkJCQkgICAgICAgeGRwLT54c2su
cXVldWVfaWQpOwo+ID4gKwllbHNlCj4gPiArCQlyZXR1cm4gdmlydG5ldF94c2tfcG9vbF9kaXNh
YmxlKGRldiwgeGRwLT54c2sucXVldWVfaWQpOwo+ID4gK30KPiA+ICsKPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL25ldC92aXJ0aW8veHNrLmggYi9kcml2ZXJzL25ldC92aXJ0aW8veHNrLmgKPiA+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjU0OTQ4ZTBiMDdm
Ywo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvZHJpdmVycy9uZXQvdmlydGlvL3hzay5oCj4g
PiBAQCAtMCwwICsxLDk5IEBACj4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0y
LjAtb3ItbGF0ZXIgKi8KPiA+ICsKPiA+ICsjaWZuZGVmIF9fWFNLX0hfXwo+ID4gKyNkZWZpbmUg
X19YU0tfSF9fCj4gPiArCj4gPiArI2RlZmluZSBWSVJUSU9fWFNLX0ZMQUcJQklUKDEpCj4gPiAr
Cj4gPiArLyogV2hlbiB4c2sgZGlzYWJsZSwgdW5kZXIgbm9ybWFsIGNpcmN1bXN0YW5jZXMsIHRo
ZSBuZXR3b3JrIGNhcmQgbXVzdCByZWNsYWltCj4gPiArICogYWxsIHRoZSBtZW1vcnkgdGhhdCBo
YXMgYmVlbiBzZW50IGFuZCB0aGUgbWVtb3J5IGFkZGVkIHRvIHRoZSBycSBxdWV1ZSBieQo+ID4g
KyAqIGRlc3Ryb3lpbmcgdGhlIHF1ZXVlLgo+ID4gKyAqCj4gPiArICogQnV0IHZpcnRpbydzIHF1
ZXVlIGRvZXMgbm90IHN1cHBvcnQgc2VwYXJhdGUgc2V0dGluZyB0byBiZWVuIGRpc2FibGUuCj4K
Pgo+IFRoaXMgaXMgYSBjYWxsIGZvciB1cyB0byBpbXBsZW1lbnQgcGVyIHF1ZXVlIGVuYWJsZS9k
aXNhYmxlLiBWaXJ0aW8tbW1pbwo+IGhhcyBzdWNoIGZhY2lsaXR5IGJ1dCB2aXJ0aW8tcGNpIG9u
bHkgYWxsb3cgdG8gZGlzYWJsZSBhIHF1ZXVlIChub3QgZW5hYmxlKS4KPgo+Cj4gPiAiUmVzZXQi
Cj4gPiArICogaXMgbm90IHZlcnkgc3VpdGFibGUuCj4gPiArICoKPiA+ICsgKiBUaGUgbWV0aG9k
IGhlcmUgaXMgdGhhdCBlYWNoIHNlbnQgY2h1bmsgb3IgY2h1bmsgYWRkZWQgdG8gdGhlIHJxIHF1
ZXVlIGlzCj4gPiArICogZGVzY3JpYmVkIGJ5IGFuIGluZGVwZW5kZW50IHN0cnVjdHVyZSBzdHJ1
Y3QgdmlydG5ldF94c2tfY3R4Lgo+ID4gKyAqCj4gPiArICogV2Ugd2lsbCB1c2UgZ2V0X3BhZ2Uo
cGFnZSkgdG8gcmVmZXIgdG8gdGhlIHBhZ2Ugd2hlcmUgdGhlc2UgY2h1bmtzIGFyZQo+ID4gKyAq
IGxvY2F0ZWQuIEFuZCB0aGVzZSBwYWdlcyB3aWxsIGJlIHJlY29yZGVkIGluIHN0cnVjdCB2aXJ0
bmV0X3hza19jdHguIFNvIHRoZXNlCj4gPiArICogY2h1bmtzIGluIHZxIGFyZSBzYWZlLiBXaGVu
IHJlY3ljbGluZywgcHV0IHRoZSB0aGVzZSBwYWdlLgo+ID4gKyAqCj4gPiArICogVGhlc2Ugc3Ry
dWN0dXJlcyBwb2ludCB0byBzdHJ1Y3QgdmlydG5ldF94c2tfY3R4X2hlYWQsIGFuZCByZWYgcmVj
b3JkcyBob3cKPiA+ICsgKiBtYW55IGNodW5rcyBoYXZlIG5vdCBiZWVuIHJlY2xhaW1lZC4gSWYg
YWN0aXZlID09IDAsIGl0IG1lYW5zIHRoYXQgeHNrIGhhcwo+ID4gKyAqIGJlZW4gZGlzYWJsZWQu
Cj4gPiArICoKPiA+ICsgKiBJbiB0aGlzIHdheSwgZXZlbiBpZiB4c2sgaGFzIGJlZW4gdW5idW5k
bGVkIHdpdGggcnEvc3EsIG9yIGEgbmV3IHhzayBhbmQKPiA+ICsgKiBycS9zcSAgYXJlIGJvdW5k
LCBhbmQgYSBuZXcgdmlydG5ldF94c2tfY3R4X2hlYWQgaXMgY3JlYXRlZC4gSXQgd2lsbCBub3QK
PiA+ICsgKiBhZmZlY3QgdGhlIG9sZCB2aXJ0bmV0X3hza19jdHggdG8gYmUgcmVjeWNsZWQuIEFu
ZCBmcmVlIGFsbCBoZWFkIGFuZCBjdHggd2hlbgo+ID4gKyAqIHJlZiBpcyAwLgo+Cj4KPiBUaGlz
IGxvb2tzIGNvbXBsaWNhdGVkIGFuZCBpdCB3aWxsIGluY3JlYXNlIHRoZSBmb290cHJpbnQuIENv
bnNpZGVyIHRoZQo+IHBlcmZvcm1hbmNlIHBlbmFsdHkgYW5kIHRoZSBjb21wbGV4aXR5LCBJIHdv
dWxkIHN1Z2dlc3QgdG8gdXNlIHJlc2V0Cj4gaW5zdGVhZC4KPgo+IFRoZW4gd2UgZG9uJ3QgbmVl
ZCB0byBpbnRyb2R1Y2Ugc3VjaCBjb250ZXh0LgoKCkkgZG9uJ3QgbGlrZSB0aGlzIGVpdGhlci4g
SXQgaXMgYmVzdCBpZiB3ZSBjYW4gcmVzZXQgdGhlIHF1ZXVlLCBidXQgdGhlbiwKYWNjb3JkaW5n
IHRvIG15IHVuZGVyc3RhbmRpbmcsIHRoZSBiYWNrZW5kIHNob3VsZCBhbHNvIGJlIHN1cHBvcnRl
ZApzeW5jaHJvbm91c2x5LCBzbyBpZiB5b3UgZG9uJ3QgdXBkYXRlIHRoZSBiYWNrZW5kIHN5bmNo
cm9ub3VzbHksIHlvdSBjYW4ndCB1c2UKeHNrLgoKSSBkb27igJl0IHRoaW5rIHJlc2V0dGluZyB0
aGUgZW50aXJlIGRldiBpcyBhIGdvb2Qgc29sdXRpb24uIElmIHlvdSB3YW50IHRvIGJpbmQKeHNr
IHRvIDEwIHF1ZXVlcywgeW91IG1heSBoYXZlIHRvIHJlc2V0IHRoZSBlbnRpcmUgZGV2aWNlIDEw
IHRpbWVzLiBJIGRvbuKAmXQKdGhpbmsgdGhpcyBpcyBhIGdvb2Qgd2F5LiBCdXQgdGhlIGN1cnJl
bnQgc3BlYyBkb2VzIG5vdCBzdXBwb3J0IHJlc2V0IHNpbmdsZQpxdWV1ZSwgc28gSSBjaG9zZSB0
aGUgY3VycmVudCBzb2x1dGlvbi4KCkphc29uLCB3aGF0IGRvIHlvdSB0aGluayB3ZSBhcmUgZ29p
bmcgdG8gZG8/IFJlYWxpemUgdGhlIHJlc2V0IGZ1bmN0aW9uIG9mIGEKc2luZ2xlIHF1ZXVlPwoK
TG9va2luZyBmb3J3YXJkIHRvIHlvdXIgcmVwbHkhISEKClRoYW5rcwoKPgo+IFRoYW5rcwo+Cj4K
PiA+ICsgKi8KPiA+ICtzdHJ1Y3QgdmlydG5ldF94c2tfY3R4Owo+ID4gK3N0cnVjdCB2aXJ0bmV0
X3hza19jdHhfaGVhZCB7Cj4gPiArCXN0cnVjdCB2aXJ0bmV0X3hza19jdHggKmN0eDsKPiA+ICsK
PiA+ICsJLyogaG93IG1hbnkgY3R4IGhhcyBiZWVuIGFkZCB0byB2cSAqLwo+ID4gKwl1NjQgcmVm
Owo+ID4gKwo+ID4gKwl1bnNpZ25lZCBpbnQgZnJhbWVfc2l6ZTsKPiA+ICsKPiA+ICsJLyogdGhl
IHhzayBzdGF0dXMgKi8KPiA+ICsJYm9vbCBhY3RpdmU7Cj4gPiArfTsKPiA+ICsKPiA+ICtzdHJ1
Y3QgdmlydG5ldF94c2tfY3R4IHsKPiA+ICsJc3RydWN0IHZpcnRuZXRfeHNrX2N0eF9oZWFkICpo
ZWFkOwo+ID4gKwlzdHJ1Y3QgdmlydG5ldF94c2tfY3R4ICpuZXh0Owo+ID4gKwo+ID4gKwlzdHJ1
Y3QgcGFnZSAqcGFnZTsKPiA+ICsKPiA+ICsJLyogeHNrIHVuYWxpZ25lZCBtb2RlIHdpbGwgdXNl
IHR3byBwYWdlIGluIG9uZSBkZXNjICovCj4gPiArCXN0cnVjdCBwYWdlICpwYWdlX3VuYWxpZ25l
ZDsKPiA+ICt9Owo+ID4gKwo+ID4gK3N0cnVjdCB2aXJ0bmV0X3hza19jdHhfdHggewo+ID4gKwkv
KiB0aGlzICpNVVNUKiBiZSB0aGUgZmlyc3QgKi8KPiA+ICsJc3RydWN0IHZpcnRuZXRfeHNrX2N0
eCBjdHg7Cj4gPiArCj4gPiArCS8qIHhzayB0eCB4bWl0IHVzZSB0aGlzIHJlY29yZCB0aGUgbGVu
IG9mIHBhY2tldCAqLwo+ID4gKwl1MzIgbGVuOwo+ID4gK307Cj4gPiArCj4gPiArc3RhdGljIGlu
bGluZSB2b2lkICp4c2tfdG9fcHRyKHN0cnVjdCB2aXJ0bmV0X3hza19jdHhfdHggKmN0eCkKPiA+
ICt7Cj4gPiArCXJldHVybiAodm9pZCAqKSgodW5zaWduZWQgbG9uZyljdHggfCBWSVJUSU9fWFNL
X0ZMQUcpOwo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgaW5saW5lIHN0cnVjdCB2aXJ0bmV0X3hz
a19jdHhfdHggKnB0cl90b194c2sodm9pZCAqcHRyKQo+ID4gK3sKPiA+ICsJdW5zaWduZWQgbG9u
ZyBwOwo+ID4gKwo+ID4gKwlwID0gKHVuc2lnbmVkIGxvbmcpcHRyOwo+ID4gKwlyZXR1cm4gKHN0
cnVjdCB2aXJ0bmV0X3hza19jdHhfdHggKikocCAmIH5WSVJUSU9fWFNLX0ZMQUcpOwo+ID4gK30K
PiA+ICsKPiA+ICtzdGF0aWMgaW5saW5lIHZvaWQgdmlydG5ldF94c2tfY3R4X3B1dChzdHJ1Y3Qg
dmlydG5ldF94c2tfY3R4ICpjdHgpCj4gPiArewo+ID4gKwlwdXRfcGFnZShjdHgtPnBhZ2UpOwo+
ID4gKwlpZiAoY3R4LT5wYWdlX3VuYWxpZ25lZCkKPiA+ICsJCXB1dF9wYWdlKGN0eC0+cGFnZV91
bmFsaWduZWQpOwo+ID4gKwo+ID4gKwktLWN0eC0+aGVhZC0+cmVmOwo+ID4gKwo+ID4gKwlpZiAo
Y3R4LT5oZWFkLT5hY3RpdmUpIHsKPiA+ICsJCWN0eC0+bmV4dCA9IGN0eC0+aGVhZC0+Y3R4Owo+
ID4gKwkJY3R4LT5oZWFkLT5jdHggPSBjdHg7Cj4gPiArCX0gZWxzZSB7Cj4gPiArCQlpZiAoIWN0
eC0+aGVhZC0+cmVmKQo+ID4gKwkJCWtmcmVlKGN0eC0+aGVhZCk7Cj4gPiArCX0KPiA+ICt9Cj4g
PiArCj4gPiArI2RlZmluZSB2aXJ0bmV0X3hza19jdHhfdHhfcHV0KGN0eCkgXAo+ID4gKwl2aXJ0
bmV0X3hza19jdHhfcHV0KChzdHJ1Y3QgdmlydG5ldF94c2tfY3R4ICopY3R4KQo+ID4gKwo+ID4g
K2ludCB2aXJ0bmV0X3hza193YWtldXAoc3RydWN0IG5ldF9kZXZpY2UgKmRldiwgdTMyIHFpZCwg
dTMyIGZsYWcpOwo+ID4gK2ludCB2aXJ0bmV0X3BvbGxfeHNrKHN0cnVjdCBzZW5kX3F1ZXVlICpz
cSwgaW50IGJ1ZGdldCk7Cj4gPiArdm9pZCB2aXJ0bmV0X3hza19jb21wbGV0ZShzdHJ1Y3Qgc2Vu
ZF9xdWV1ZSAqc3EsIHUzMiBudW0pOwo+ID4gK2ludCB2aXJ0bmV0X3hza19wb29sX3NldHVwKHN0
cnVjdCBuZXRfZGV2aWNlICpkZXYsIHN0cnVjdCBuZXRkZXZfYnBmICp4ZHApOwo+ID4gKyNlbmRp
Zgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1
YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0
aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5m
by92aXJ0dWFsaXphdGlvbg==
