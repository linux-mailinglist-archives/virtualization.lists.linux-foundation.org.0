Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF367D28B2
	for <lists.virtualization@lfdr.de>; Mon, 23 Oct 2023 04:47:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5906C60E72;
	Mon, 23 Oct 2023 02:47:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5906C60E72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bXG48WlMazpV; Mon, 23 Oct 2023 02:47:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DDE1E60E6F;
	Mon, 23 Oct 2023 02:47:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDE1E60E6F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 279D2C0DD3;
	Mon, 23 Oct 2023 02:47:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17DECC0032
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Oct 2023 02:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E791F8213F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Oct 2023 02:47:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E791F8213F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 99ZTHyK6aOf7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Oct 2023 02:47:21 +0000 (UTC)
Received: from out30-101.freemail.mail.aliyun.com
 (out30-101.freemail.mail.aliyun.com [115.124.30.101])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA9ED8213E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Oct 2023 02:47:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA9ED8213E
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0Vud3n0v_1698029232; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0Vud3n0v_1698029232) by smtp.aliyun-inc.com;
 Mon, 23 Oct 2023 10:47:13 +0800
Message-ID: <1698028779.8400478-2-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH net-next v1 16/19] virtio_net: xsk: rx: introduce
 receive_xsk() to recv xsk buffer
Date: Mon, 23 Oct 2023 10:39:39 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Jason Wang <jasowang@redhat.com>
References: <20231016120033.26933-1-xuanzhuo@linux.alibaba.com>
 <20231016120033.26933-17-xuanzhuo@linux.alibaba.com>
 <CACGkMEtvVBXupsiE8=Mt4CWJqckS5tF-w_ZdG2qs-AoYBWptWA@mail.gmail.com>
In-Reply-To: <CACGkMEtvVBXupsiE8=Mt4CWJqckS5tF-w_ZdG2qs-AoYBWptWA@mail.gmail.com>
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, virtualization@lists.linux-foundation.org,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gRnJpLCAyMCBPY3QgMjAyMyAxNDo1NzowNiArMDgwMCwgSmFzb24gV2FuZyA8amFzb3dhbmdA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4gT24gTW9uLCBPY3QgMTYsIDIwMjMgYXQgODowMeKAr1BNIFh1
YW4gWmh1byA8eHVhbnpodW9AbGludXguYWxpYmFiYS5jb20+IHdyb3RlOgo+ID4KPiA+IEltcGxl
bWVudGluZyB0aGUgbG9naWMgb2YgeHNrIHJ4LiBJZiB0aGlzIHBhY2tldCBpcyBub3QgZm9yIFhT
Swo+ID4gZGV0ZXJtaW5lZCBpbiBYRFAsIHRoZW4gd2UgbmVlZCB0byBjb3B5IG9uY2UgdG8gZ2Vu
ZXJhdGUgYSBTS0IuCj4gPiBJZiBpdCBpcyBmb3IgWFNLLCBpdCBpcyBhIHplcm9jb3B5IHJlY2Vp
dmUgcGFja2V0IHByb2Nlc3MuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWHVhbiBaaHVvIDx4dWFu
emh1b0BsaW51eC5hbGliYWJhLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvbmV0L3ZpcnRpby9t
YWluLmMgICAgICAgfCAgMTQgKystLQo+ID4gIGRyaXZlcnMvbmV0L3ZpcnRpby92aXJ0aW9fbmV0
LmggfCAgIDQgKysKPiA+ICBkcml2ZXJzL25ldC92aXJ0aW8veHNrLmMgICAgICAgIHwgMTIwICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgZHJpdmVycy9uZXQvdmlydGlvL3hz
ay5oICAgICAgICB8ICAgNCArKwo+ID4gIDQgZmlsZXMgY2hhbmdlZCwgMTM3IGluc2VydGlvbnMo
KyksIDUgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3ZpcnRp
by9tYWluLmMgYi9kcml2ZXJzL25ldC92aXJ0aW8vbWFpbi5jCj4gPiBpbmRleCAwZTc0MDQ0N2Ix
NDIuLjAwM2RkNjdhYjcwNyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbmV0L3ZpcnRpby9tYWlu
LmMKPiA+ICsrKyBiL2RyaXZlcnMvbmV0L3ZpcnRpby9tYWluLmMKPiA+IEBAIC04MjIsMTAgKzgy
MiwxMCBAQCBzdGF0aWMgdm9pZCBwdXRfeGRwX2ZyYWdzKHN0cnVjdCB4ZHBfYnVmZiAqeGRwKQo+
ID4gICAgICAgICB9Cj4gPiAgfQo+ID4KPiA+IC1zdGF0aWMgaW50IHZpcnRuZXRfeGRwX2hhbmRs
ZXIoc3RydWN0IGJwZl9wcm9nICp4ZHBfcHJvZywgc3RydWN0IHhkcF9idWZmICp4ZHAsCj4gPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IG5ldF9kZXZpY2UgKmRldiwKPiA+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgKnhkcF94bWl0LAo+
ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2aXJ0bmV0X3JxX3N0YXRz
ICpzdGF0cykKPiA+ICtpbnQgdmlydG5ldF94ZHBfaGFuZGxlcihzdHJ1Y3QgYnBmX3Byb2cgKnhk
cF9wcm9nLCBzdHJ1Y3QgeGRwX2J1ZmYgKnhkcCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBuZXRfZGV2aWNlICpkZXYsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBpbnQgKnhkcF94bWl0LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHZp
cnRuZXRfcnFfc3RhdHMgKnN0YXRzKQo+ID4gIHsKPiA+ICAgICAgICAgc3RydWN0IHhkcF9mcmFt
ZSAqeGRwZjsKPiA+ICAgICAgICAgaW50IGVycjsKPiA+IEBAIC0xNTg5LDEzICsxNTg5LDE3IEBA
IHN0YXRpYyB2b2lkIHJlY2VpdmVfYnVmKHN0cnVjdCB2aXJ0bmV0X2luZm8gKnZpLCBzdHJ1Y3Qg
dmlydG5ldF9ycSAqcnEsCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+ID4gICAgICAgICB9
Cj4gPgo+ID4gLSAgICAgICBpZiAodmktPm1lcmdlYWJsZV9yeF9idWZzKQo+ID4gKyAgICAgICBy
Y3VfcmVhZF9sb2NrKCk7Cj4gPiArICAgICAgIGlmIChyY3VfZGVyZWZlcmVuY2UocnEtPnhzay5w
b29sKSkKPiA+ICsgICAgICAgICAgICAgICBza2IgPSB2aXJ0bmV0X3JlY2VpdmVfeHNrKGRldiwg
dmksIHJxLCBidWYsIGxlbiwgeGRwX3htaXQsIHN0YXRzKTsKPiA+ICsgICAgICAgZWxzZSBpZiAo
dmktPm1lcmdlYWJsZV9yeF9idWZzKQo+ID4gICAgICAgICAgICAgICAgIHNrYiA9IHJlY2VpdmVf
bWVyZ2VhYmxlKGRldiwgdmksIHJxLCBidWYsIGN0eCwgbGVuLCB4ZHBfeG1pdCwKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdGF0cyk7Cj4gPiAgICAgICAgIGVs
c2UgaWYgKHZpLT5iaWdfcGFja2V0cykKPiA+ICAgICAgICAgICAgICAgICBza2IgPSByZWNlaXZl
X2JpZyhkZXYsIHZpLCBycSwgYnVmLCBsZW4sIHN0YXRzKTsKPiA+ICAgICAgICAgZWxzZQo+ID4g
ICAgICAgICAgICAgICAgIHNrYiA9IHJlY2VpdmVfc21hbGwoZGV2LCB2aSwgcnEsIGJ1ZiwgY3R4
LCBsZW4sIHhkcF94bWl0LCBzdGF0cyk7Cj4gPiArICAgICAgIHJjdV9yZWFkX3VubG9jaygpOwo+
ID4KPiA+ICAgICAgICAgaWYgKHVubGlrZWx5KCFza2IpKQo+ID4gICAgICAgICAgICAgICAgIHJl
dHVybjsKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC92aXJ0aW8vdmlydGlvX25ldC5oIGIv
ZHJpdmVycy9uZXQvdmlydGlvL3ZpcnRpb19uZXQuaAo+ID4gaW5kZXggNmU3MTYyMmZjYTQ1Li5m
ZDdmMzQ3MDNjOWIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL25ldC92aXJ0aW8vdmlydGlvX25l
dC5oCj4gPiArKysgYi9kcml2ZXJzL25ldC92aXJ0aW8vdmlydGlvX25ldC5oCj4gPiBAQCAtMzQ2
LDYgKzM0NiwxMCBAQCBzdGF0aWMgaW5saW5lIGJvb2wgdmlydG5ldF9pc194ZHBfcmF3X2J1ZmZl
cl9xdWV1ZShzdHJ1Y3QgdmlydG5ldF9pbmZvICp2aSwgaW50Cj4gPiAgICAgICAgICAgICAgICAg
cmV0dXJuIGZhbHNlOwo+ID4gIH0KPiA+Cj4gPiAraW50IHZpcnRuZXRfeGRwX2hhbmRsZXIoc3Ry
dWN0IGJwZl9wcm9nICp4ZHBfcHJvZywgc3RydWN0IHhkcF9idWZmICp4ZHAsCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICBzdHJ1Y3QgbmV0X2RldmljZSAqZGV2LAo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgdW5zaWduZWQgaW50ICp4ZHBfeG1pdCwKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgIHN0cnVjdCB2aXJ0bmV0X3JxX3N0YXRzICpzdGF0cyk7Cj4gPiAgdm9pZCB2aXJ0bmV0
X3J4X3BhdXNlKHN0cnVjdCB2aXJ0bmV0X2luZm8gKnZpLCBzdHJ1Y3QgdmlydG5ldF9ycSAqcnEp
Owo+ID4gIHZvaWQgdmlydG5ldF9yeF9yZXN1bWUoc3RydWN0IHZpcnRuZXRfaW5mbyAqdmksIHN0
cnVjdCB2aXJ0bmV0X3JxICpycSk7Cj4gPiAgdm9pZCB2aXJ0bmV0X3R4X3BhdXNlKHN0cnVjdCB2
aXJ0bmV0X2luZm8gKnZpLCBzdHJ1Y3QgdmlydG5ldF9zcSAqc3EpOwo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbmV0L3ZpcnRpby94c2suYyBiL2RyaXZlcnMvbmV0L3ZpcnRpby94c2suYwo+ID4g
aW5kZXggODQxZmIwNzg4ODJhLi5mMWM2NDQxNGZhYzkgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJz
L25ldC92aXJ0aW8veHNrLmMKPiA+ICsrKyBiL2RyaXZlcnMvbmV0L3ZpcnRpby94c2suYwo+ID4g
QEAgLTEzLDYgKzEzLDE4IEBAIHN0YXRpYyB2b2lkIHNnX2ZpbGxfZG1hKHN0cnVjdCBzY2F0dGVy
bGlzdCAqc2csIGRtYV9hZGRyX3QgYWRkciwgdTMyIGxlbikKPiA+ICAgICAgICAgc2ctPmxlbmd0
aCA9IGxlbjsKPiA+ICB9Cj4gPgo+ID4gK3N0YXRpYyB1bnNpZ25lZCBpbnQgdmlydG5ldF9yZWNl
aXZlX2J1Zl9udW0oc3RydWN0IHZpcnRuZXRfaW5mbyAqdmksIGNoYXIgKmJ1ZikKPiA+ICt7Cj4g
PiArICAgICAgIHN0cnVjdCB2aXJ0aW9fbmV0X2hkcl9tcmdfcnhidWYgKmhkcjsKPiA+ICsKPiA+
ICsgICAgICAgaWYgKHZpLT5tZXJnZWFibGVfcnhfYnVmcykgewo+ID4gKyAgICAgICAgICAgICAg
IGhkciA9IChzdHJ1Y3QgdmlydGlvX25ldF9oZHJfbXJnX3J4YnVmICopYnVmOwo+ID4gKyAgICAg
ICAgICAgICAgIHJldHVybiB2aXJ0aW8xNl90b19jcHUodmktPnZkZXYsIGhkci0+bnVtX2J1ZmZl
cnMpOwo+ID4gKyAgICAgICB9Cj4gPiArCj4gPiArICAgICAgIHJldHVybiAxOwo+ID4gK30KPiA+
ICsKPiA+ICBzdGF0aWMgdm9pZCB2aXJ0bmV0X3hza19jaGVja19xdWV1ZShzdHJ1Y3QgdmlydG5l
dF9zcSAqc3EpCj4gPiAgewo+ID4gICAgICAgICBzdHJ1Y3QgdmlydG5ldF9pbmZvICp2aSA9IHNx
LT52cS0+dmRldi0+cHJpdjsKPiA+IEBAIC0zNyw2ICs0OSwxMTQgQEAgc3RhdGljIHZvaWQgdmly
dG5ldF94c2tfY2hlY2tfcXVldWUoc3RydWN0IHZpcnRuZXRfc3EgKnNxKQo+ID4gICAgICAgICAg
ICAgICAgIG5ldGlmX3N0b3Bfc3VicXVldWUoZGV2LCBxbnVtKTsKPiA+ICB9Cj4gPgo+ID4gK3N0
YXRpYyB2b2lkIG1lcmdlX2Ryb3BfZm9sbG93X3hkcChzdHJ1Y3QgbmV0X2RldmljZSAqZGV2LAo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2aXJ0bmV0X3JxICpy
cSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1MzIgbnVtX2J1ZiwKPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgdmlydG5ldF9ycV9zdGF0
cyAqc3RhdHMpCj4gPiArewo+ID4gKyAgICAgICBzdHJ1Y3QgeGRwX2J1ZmYgKnhkcDsKPiA+ICsg
ICAgICAgdTMyIGxlbjsKPiA+ICsKPiA+ICsgICAgICAgd2hpbGUgKG51bV9idWYtLSA+IDEpIHsK
PiA+ICsgICAgICAgICAgICAgICB4ZHAgPSB2aXJ0cXVldWVfZ2V0X2J1ZihycS0+dnEsICZsZW4p
Owo+ID4gKyAgICAgICAgICAgICAgIGlmICh1bmxpa2VseSgheGRwKSkgewo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgcHJfZGVidWcoIiVzOiByeCBlcnJvcjogJWQgYnVmZmVycyBtaXNzaW5n
XG4iLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2LT5uYW1lLCBudW1f
YnVmKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGRldi0+c3RhdHMucnhfbGVuZ3RoX2Vy
cm9ycysrOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiArICAgICAgICAg
ICAgICAgfQo+ID4gKyAgICAgICAgICAgICAgIHN0YXRzLT5ieXRlcyArPSBsZW47Cj4gPiArICAg
ICAgICAgICAgICAgeHNrX2J1ZmZfZnJlZSh4ZHApOwo+ID4gKyAgICAgICB9Cj4gPiArfQo+ID4g
Kwo+ID4gK3N0YXRpYyBzdHJ1Y3Qgc2tfYnVmZiAqY29uc3RydWN0X3NrYihzdHJ1Y3QgdmlydG5l
dF9ycSAqcnEsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IHhkcF9idWZmICp4ZHApCj4gPiArewo+ID4gKyAgICAgICB1bnNpZ25lZCBpbnQgbWV0YXNpemUg
PSB4ZHAtPmRhdGEgLSB4ZHAtPmRhdGFfbWV0YTsKPiA+ICsgICAgICAgc3RydWN0IHNrX2J1ZmYg
KnNrYjsKPiA+ICsgICAgICAgdW5zaWduZWQgaW50IHNpemU7Cj4gPiArCj4gPiArICAgICAgIHNp
emUgPSB4ZHAtPmRhdGFfZW5kIC0geGRwLT5kYXRhX2hhcmRfc3RhcnQ7Cj4gPiArICAgICAgIHNr
YiA9IG5hcGlfYWxsb2Nfc2tiKCZycS0+bmFwaSwgc2l6ZSk7Cj4gPiArICAgICAgIGlmICh1bmxp
a2VseSghc2tiKSkKPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gTlVMTDsKPiA+ICsKPiA+ICsg
ICAgICAgc2tiX3Jlc2VydmUoc2tiLCB4ZHAtPmRhdGFfbWV0YSAtIHhkcC0+ZGF0YV9oYXJkX3N0
YXJ0KTsKPiA+ICsKPiA+ICsgICAgICAgc2l6ZSA9IHhkcC0+ZGF0YV9lbmQgLSB4ZHAtPmRhdGFf
bWV0YTsKPiA+ICsgICAgICAgbWVtY3B5KF9fc2tiX3B1dChza2IsIHNpemUpLCB4ZHAtPmRhdGFf
bWV0YSwgc2l6ZSk7Cj4gPiArCj4gPiArICAgICAgIGlmIChtZXRhc2l6ZSkgewo+ID4gKyAgICAg
ICAgICAgICAgIF9fc2tiX3B1bGwoc2tiLCBtZXRhc2l6ZSk7Cj4gPiArICAgICAgICAgICAgICAg
c2tiX21ldGFkYXRhX3NldChza2IsIG1ldGFzaXplKTsKPiA+ICsgICAgICAgfQo+ID4gKwo+ID4g
KyAgICAgICByZXR1cm4gc2tiOwo+ID4gK30KPiA+ICsKPiA+ICtzdHJ1Y3Qgc2tfYnVmZiAqdmly
dG5ldF9yZWNlaXZlX3hzayhzdHJ1Y3QgbmV0X2RldmljZSAqZGV2LCBzdHJ1Y3QgdmlydG5ldF9p
bmZvICp2aSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2
aXJ0bmV0X3JxICpycSwgdm9pZCAqYnVmLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdW5zaWduZWQgaW50IGxlbiwgdW5zaWduZWQgaW50ICp4ZHBfeG1pdCwKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2aXJ0bmV0X3JxX3N0YXRz
ICpzdGF0cykKPiA+ICt7Cj4KPiBJIHdvbmRlciBpZiBhbnl0aGluZyBibG9ja3MgdXMgZnJvbSBy
ZXVzaW5nIHRoZSBleGlzdGluZyBYRFAgbG9naWM/Cj4gQXJlIHRoZXJlIHNvbWUgc3VidGxlIGRp
ZmZlcmVuY2VzPwoKMS4gV2UgbmVlZCB0byBjb3B5IGRhdGEgdG8gY3JlYXRlIHNrYiBmb3IgWERQ
X1BBU1MuCjIuIFdlIG5lZWQgdG8gY2FsbCB4c2tfYnVmZl9mcmVlKCkgdG8gcmVsZWFzZSB0aGUg
YnVmZmVyLgozLiBUaGUgaGFuZGxlIGZvciB4ZHBfYnVmZiBpcyBkaWZmZXJlbmNlLgoKdmlydG5l
dF94ZHBfaGFuZGxlcigpIGlzIHJlLXVzZWQuIFNvIHRoZSByZWNlaXZlIGNvZGUgaXMgc2ltcGxl
LgoKSWYgd2UgcHVzaGVkIHRoaXMgZnVuY3Rpb24gaW50byBleGlzdGluZyBjb2RlLCB3ZSB3b3Vs
ZCBoYXZlIHRvIG1haW50YWluCmNvZGUgc2NhdHRlcmVkIGluc2lkZSBtZXJnZSBhbmQgc21hbGwg
KGFuZCBiaWcpLiBTbyBJIHRoaW5rIGl0IGlzIGEgZ29vZApjaG9pY2UgZm9yIHVzIHRvIHB1dCB0
aGUgeHNrIGNvZGUgaW50byBhIGZ1bmN0aW9uLgoKClRoYW5rcy4KCgo+Cj4gVGhhbmtzCj4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRp
b24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3Jn
Cmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1
YWxpemF0aW9u
