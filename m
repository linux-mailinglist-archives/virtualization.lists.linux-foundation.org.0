Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F85D6D3C5D
	for <lists.virtualization@lfdr.de>; Mon,  3 Apr 2023 06:17:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7703C81E91;
	Mon,  3 Apr 2023 04:17:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7703C81E91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2JeqLjo4H1Lz; Mon,  3 Apr 2023 04:17:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1B8FD81E81;
	Mon,  3 Apr 2023 04:17:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B8FD81E81
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 32343C008C;
	Mon,  3 Apr 2023 04:17:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5BD43C002F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Apr 2023 04:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DB144013D
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Apr 2023 04:17:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DB144013D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dk4bvXgmwJgC
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Apr 2023 04:17:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 975C940135
Received: from out30-111.freemail.mail.aliyun.com
 (out30-111.freemail.mail.aliyun.com [115.124.30.111])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 975C940135
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Apr 2023 04:17:31 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0VfBgAZz_1680495445; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VfBgAZz_1680495445) by smtp.aliyun-inc.com;
 Mon, 03 Apr 2023 12:17:26 +0800
Message-ID: <1680495148.1559556-3-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH net-next 3/8] virtio_net: introduce virtnet_xdp_handler()
 to seprate the logic of run xdp
Date: Mon, 3 Apr 2023 12:12:28 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Jason Wang <jasowang@redhat.com>
References: <20230328120412.110114-1-xuanzhuo@linux.alibaba.com>
 <20230328120412.110114-4-xuanzhuo@linux.alibaba.com>
 <CACGkMEvZ=-G4QVTDnoSa1N0UspW8u_oz-7xosrXV0f1YcytVXw@mail.gmail.com>
In-Reply-To: <CACGkMEvZ=-G4QVTDnoSa1N0UspW8u_oz-7xosrXV0f1YcytVXw@mail.gmail.com>
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

T24gTW9uLCAzIEFwciAyMDIzIDEwOjQzOjAzICswODAwLCBKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
ZWRoYXQuY29tPiB3cm90ZToKPiBPbiBUdWUsIE1hciAyOCwgMjAyMyBhdCA4OjA04oCvUE0gWHVh
biBaaHVvIDx4dWFuemh1b0BsaW51eC5hbGliYWJhLmNvbT4gd3JvdGU6Cj4gPgo+ID4gQXQgcHJl
c2VudCwgd2UgaGF2ZSB0d28gc2ltaWxhciBsb2dpYyB0byBwZXJmb3JtIHRoZSBYRFAgcHJvZy4K
PiA+Cj4gPiBUaGVyZWZvcmUsIHRoaXMgUEFUQ0ggc2VwYXJhdGVzIHRoZSBjb2RlIG9mIGV4ZWN1
dGluZyBYRFAsIHdoaWNoIGlzCj4gPiBjb25kdWNpdmUgdG8gbGF0ZXIgbWFpbnRlbmFuY2UuCj4g
Pgo+ID4gU2lnbmVkLW9mZi1ieTogWHVhbiBaaHVvIDx4dWFuemh1b0BsaW51eC5hbGliYWJhLmNv
bT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvbmV0L3ZpcnRpb19uZXQuYyB8IDE0MiArKysrKysrKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNzUgaW5z
ZXJ0aW9ucygrKSwgNjcgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bmV0L3ZpcnRpb19uZXQuYyBiL2RyaXZlcnMvbmV0L3ZpcnRpb19uZXQuYwo+ID4gaW5kZXggYmI0
MjY5NThjZGQ0Li43MmI5ZDZlZTQwMjQgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL25ldC92aXJ0
aW9fbmV0LmMKPiA+ICsrKyBiL2RyaXZlcnMvbmV0L3ZpcnRpb19uZXQuYwo+ID4gQEAgLTMwMSw2
ICszMDEsMTUgQEAgc3RydWN0IHBhZGRlZF92bmV0X2hkciB7Cj4gPiAgICAgICAgIGNoYXIgcGFk
ZGluZ1sxMl07Cj4gPiAgfTsKPiA+Cj4gPiArZW51bSB7Cj4gPiArICAgICAgIC8qIHhkcCBwYXNz
ICovCj4gPiArICAgICAgIFZJUlRORVRfWERQX1JFU19QQVNTLAo+ID4gKyAgICAgICAvKiBkcm9w
IHBhY2tldC4gdGhlIGNhbGxlciBuZWVkcyB0byByZWxlYXNlIHRoZSBwYWdlLiAqLwo+ID4gKyAg
ICAgICBWSVJUTkVUX1hEUF9SRVNfRFJPUCwKPiA+ICsgICAgICAgLyogcGFja2V0IGlzIGNvbnN1
bWVkIGJ5IHhkcC4gdGhlIGNhbGxlciBuZWVkcyB0byBkbyBub3RoaW5nLiAqLwo+ID4gKyAgICAg
ICBWSVJUTkVUX1hEUF9SRVNfQ09OU1VNRUQsCj4gPiArfTsKPgo+IEknZCBwcmVmZXIgdGhpcyB0
byBiZSBkb25lIG9uIHRvcCB1bmxlc3MgaXQgaXMgYSBtdXN0LiBCdXQgSSBkb24ndCBzZWUKPiBh
bnkgYWR2YW50YWdlIG9mIGludHJvZHVjaW5nIHRoaXMsIGl0J3MgcGFydGlhbCBtYXBwaW5nIG9m
IFhEUCBhY3Rpb24KPiBhbmQgaXQgbmVlZHMgdG8gYmUgZXh0ZW5kZWQgd2hlbiBYRFAgYWN0aW9u
IGlzIGV4dGVuZGVkLiAoQW5kIHdlJ3ZlCj4gYWxyZWFkeSBoYWQ6IFZJUlRJT19YRFBfUkVESVIg
YW5kIFZJUlRJT19YRFBfVFggLi4uKQoKTm8sIHRoZXNlIGFyZSB0aGUgdGhyZWUgc3RhdGVzIG9m
IGJ1ZmZlciBhZnRlciBYRFAgcHJvY2Vzc2luZy4KCiogUEFTUzogZ290byBtYWtlIHNrYgoqIERS
T1A6IHdlIHNob3VsZCByZWxlYXNlIGJ1ZmZlcgoqIENVTlNVTUVEOiB4ZHAgcHJvZyB1c2VkIHRo
ZSBidWZmZXIsIHdlIGRvIG5vdGhpbmcKClRoZSBsYXR0ZXIgdHdvIGFyZSBub3QgcGFydGljdWxh
cmx5IHJlbGF0ZWQgdG8gWERQIEFDVElPTi4gQW5kIGl0IGRvZXMgbm90IG5lZWQKdG8gZXh0ZW5k
IHdoZW4gWERQIGFjdGlvbiBpcyBleHRlbmRlZC4gQXQgbGVhc3QgSSBoYXZlIG5vdCB0aG91Z2h0
IG9mIHRoaXMKc2l0dWF0aW9uLgoKCj4KPiA+ICsKPiA+ICBzdGF0aWMgdm9pZCB2aXJ0bmV0X3Jx
X2ZyZWVfdW51c2VkX2J1ZihzdHJ1Y3QgdmlydHF1ZXVlICp2cSwgdm9pZCAqYnVmKTsKPiA+ICBz
dGF0aWMgdm9pZCB2aXJ0bmV0X3NxX2ZyZWVfdW51c2VkX2J1ZihzdHJ1Y3QgdmlydHF1ZXVlICp2
cSwgdm9pZCAqYnVmKTsKPiA+Cj4gPiBAQCAtNzg5LDYgKzc5OCw1OSBAQCBzdGF0aWMgaW50IHZp
cnRuZXRfeGRwX3htaXQoc3RydWN0IG5ldF9kZXZpY2UgKmRldiwKPiA+ICAgICAgICAgcmV0dXJu
IHJldDsKPiA+ICB9Cj4gPgo+ID4gK3N0YXRpYyBpbnQgdmlydG5ldF94ZHBfaGFuZGxlcihzdHJ1
Y3QgYnBmX3Byb2cgKnhkcF9wcm9nLCBzdHJ1Y3QgeGRwX2J1ZmYgKnhkcCwKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgbmV0X2RldmljZSAqZGV2LAo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCAqeGRwX3htaXQsCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHZpcnRuZXRfcnFfc3RhdHMgKnN0YXRz
KQo+ID4gK3sKPiA+ICsgICAgICAgc3RydWN0IHhkcF9mcmFtZSAqeGRwZjsKPiA+ICsgICAgICAg
aW50IGVycjsKPiA+ICsgICAgICAgdTMyIGFjdDsKPiA+ICsKPiA+ICsgICAgICAgYWN0ID0gYnBm
X3Byb2dfcnVuX3hkcCh4ZHBfcHJvZywgeGRwKTsKPiA+ICsgICAgICAgc3RhdHMtPnhkcF9wYWNr
ZXRzKys7Cj4gPiArCj4gPiArICAgICAgIHN3aXRjaCAoYWN0KSB7Cj4gPiArICAgICAgIGNhc2Ug
WERQX1BBU1M6Cj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIFZJUlRORVRfWERQX1JFU19QQVNT
Owo+ID4gKwo+ID4gKyAgICAgICBjYXNlIFhEUF9UWDoKPiA+ICsgICAgICAgICAgICAgICBzdGF0
cy0+eGRwX3R4Kys7Cj4gPiArICAgICAgICAgICAgICAgeGRwZiA9IHhkcF9jb252ZXJ0X2J1ZmZf
dG9fZnJhbWUoeGRwKTsKPiA+ICsgICAgICAgICAgICAgICBpZiAodW5saWtlbHkoIXhkcGYpKQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFZJUlRORVRfWERQX1JFU19EUk9QOwo+
ID4gKwo+ID4gKyAgICAgICAgICAgICAgIGVyciA9IHZpcnRuZXRfeGRwX3htaXQoZGV2LCAxLCAm
eGRwZiwgMCk7Cj4gPiArICAgICAgICAgICAgICAgaWYgKHVubGlrZWx5KCFlcnIpKSB7Cj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICB4ZHBfcmV0dXJuX2ZyYW1lX3J4X25hcGkoeGRwZik7Cj4g
PiArICAgICAgICAgICAgICAgfSBlbHNlIGlmICh1bmxpa2VseShlcnIgPCAwKSkgewo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgdHJhY2VfeGRwX2V4Y2VwdGlvbihkZXYsIHhkcF9wcm9nLCBh
Y3QpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFZJUlRORVRfWERQX1JFU19E
Uk9QOwo+ID4gKyAgICAgICAgICAgICAgIH0KPiA+ICsKPiA+ICsgICAgICAgICAgICAgICAqeGRw
X3htaXQgfD0gVklSVElPX1hEUF9UWDsKPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gVklSVE5F
VF9YRFBfUkVTX0NPTlNVTUVEOwo+ID4gKwo+ID4gKyAgICAgICBjYXNlIFhEUF9SRURJUkVDVDoK
PiA+ICsgICAgICAgICAgICAgICBzdGF0cy0+eGRwX3JlZGlyZWN0cysrOwo+ID4gKyAgICAgICAg
ICAgICAgIGVyciA9IHhkcF9kb19yZWRpcmVjdChkZXYsIHhkcCwgeGRwX3Byb2cpOwo+ID4gKyAg
ICAgICAgICAgICAgIGlmIChlcnIpCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4g
VklSVE5FVF9YRFBfUkVTX0RST1A7Cj4gPiArCj4gPiArICAgICAgICAgICAgICAgKnhkcF94bWl0
IHw9IFZJUlRJT19YRFBfUkVESVI7Cj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIFZJUlRORVRf
WERQX1JFU19DT05TVU1FRDsKPiA+ICsKPiA+ICsgICAgICAgZGVmYXVsdDoKPiA+ICsgICAgICAg
ICAgICAgICBicGZfd2Fybl9pbnZhbGlkX3hkcF9hY3Rpb24oZGV2LCB4ZHBfcHJvZywgYWN0KTsK
PiA+ICsgICAgICAgICAgICAgICBmYWxsdGhyb3VnaDsKPiA+ICsgICAgICAgY2FzZSBYRFBfQUJP
UlRFRDoKPiA+ICsgICAgICAgICAgICAgICB0cmFjZV94ZHBfZXhjZXB0aW9uKGRldiwgeGRwX3By
b2csIGFjdCk7Cj4gPiArICAgICAgICAgICAgICAgZmFsbHRocm91Z2g7Cj4gPiArICAgICAgIGNh
c2UgWERQX0RST1A6Cj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIFZJUlRORVRfWERQX1JFU19E
Uk9QOwo+ID4gKyAgICAgICB9Cj4gPiArfQo+ID4gKwo+ID4gIHN0YXRpYyB1bnNpZ25lZCBpbnQg
dmlydG5ldF9nZXRfaGVhZHJvb20oc3RydWN0IHZpcnRuZXRfaW5mbyAqdmkpCj4gPiAgewo+ID4g
ICAgICAgICByZXR1cm4gdmktPnhkcF9lbmFibGVkID8gVklSVElPX1hEUF9IRUFEUk9PTSA6IDA7
Cj4gPiBAQCAtODc2LDcgKzkzOCw2IEBAIHN0YXRpYyBzdHJ1Y3Qgc2tfYnVmZiAqcmVjZWl2ZV9z
bWFsbChzdHJ1Y3QgbmV0X2RldmljZSAqZGV2LAo+ID4gICAgICAgICBzdHJ1Y3QgcGFnZSAqcGFn
ZSA9IHZpcnRfdG9faGVhZF9wYWdlKGJ1Zik7Cj4gPiAgICAgICAgIHVuc2lnbmVkIGludCBkZWx0
YSA9IDA7Cj4gPiAgICAgICAgIHN0cnVjdCBwYWdlICp4ZHBfcGFnZTsKPiA+IC0gICAgICAgaW50
IGVycjsKPiA+ICAgICAgICAgdW5zaWduZWQgaW50IG1ldGFzaXplID0gMDsKPiA+Cj4gPiAgICAg
ICAgIGxlbiAtPSB2aS0+aGRyX2xlbjsKPiA+IEBAIC04OTgsNyArOTU5LDYgQEAgc3RhdGljIHN0
cnVjdCBza19idWZmICpyZWNlaXZlX3NtYWxsKHN0cnVjdCBuZXRfZGV2aWNlICpkZXYsCj4gPiAg
ICAgICAgIHhkcF9wcm9nID0gcmN1X2RlcmVmZXJlbmNlKHJxLT54ZHBfcHJvZyk7Cj4gPiAgICAg
ICAgIGlmICh4ZHBfcHJvZykgewo+ID4gICAgICAgICAgICAgICAgIHN0cnVjdCB2aXJ0aW9fbmV0
X2hkcl9tcmdfcnhidWYgKmhkciA9IGJ1ZiArIGhlYWRlcl9vZmZzZXQ7Cj4gPiAtICAgICAgICAg
ICAgICAgc3RydWN0IHhkcF9mcmFtZSAqeGRwZjsKPiA+ICAgICAgICAgICAgICAgICBzdHJ1Y3Qg
eGRwX2J1ZmYgeGRwOwo+ID4gICAgICAgICAgICAgICAgIHZvaWQgKm9yaWdfZGF0YTsKPiA+ICAg
ICAgICAgICAgICAgICB1MzIgYWN0Owo+ID4gQEAgLTkzMSw0NiArOTkxLDIyIEBAIHN0YXRpYyBz
dHJ1Y3Qgc2tfYnVmZiAqcmVjZWl2ZV9zbWFsbChzdHJ1Y3QgbmV0X2RldmljZSAqZGV2LAo+ID4g
ICAgICAgICAgICAgICAgIHhkcF9wcmVwYXJlX2J1ZmYoJnhkcCwgYnVmICsgVklSVE5FVF9SWF9Q
QUQgKyB2aS0+aGRyX2xlbiwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHhk
cF9oZWFkcm9vbSwgbGVuLCB0cnVlKTsKPiA+ICAgICAgICAgICAgICAgICBvcmlnX2RhdGEgPSB4
ZHAuZGF0YTsKPiA+IC0gICAgICAgICAgICAgICBhY3QgPSBicGZfcHJvZ19ydW5feGRwKHhkcF9w
cm9nLCAmeGRwKTsKPiA+IC0gICAgICAgICAgICAgICBzdGF0cy0+eGRwX3BhY2tldHMrKzsKPiA+
ICsKPiA+ICsgICAgICAgICAgICAgICBhY3QgPSB2aXJ0bmV0X3hkcF9oYW5kbGVyKHhkcF9wcm9n
LCAmeGRwLCBkZXYsIHhkcF94bWl0LCBzdGF0cyk7Cj4gPgo+ID4gICAgICAgICAgICAgICAgIHN3
aXRjaCAoYWN0KSB7Cj4gPiAtICAgICAgICAgICAgICAgY2FzZSBYRFBfUEFTUzoKPiA+ICsgICAg
ICAgICAgICAgICBjYXNlIFZJUlRORVRfWERQX1JFU19QQVNTOgo+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgLyogUmVjYWxjdWxhdGUgbGVuZ3RoIGluIGNhc2UgYnBmIHByb2dyYW0gY2hhbmdl
ZCBpdCAqLwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgZGVsdGEgPSBvcmlnX2RhdGEgLSB4
ZHAuZGF0YTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGxlbiA9IHhkcC5kYXRhX2VuZCAt
IHhkcC5kYXRhOwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgbWV0YXNpemUgPSB4ZHAuZGF0
YSAtIHhkcC5kYXRhX21ldGE7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+
IC0gICAgICAgICAgICAgICBjYXNlIFhEUF9UWDoKPiA+IC0gICAgICAgICAgICAgICAgICAgICAg
IHN0YXRzLT54ZHBfdHgrKzsKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIHhkcGYgPSB4ZHBf
Y29udmVydF9idWZmX3RvX2ZyYW1lKCZ4ZHApOwo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAg
aWYgKHVubGlrZWx5KCF4ZHBmKSkKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Z290byBlcnJfeGRwOwo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgZXJyID0gdmlydG5ldF94
ZHBfeG1pdChkZXYsIDEsICZ4ZHBmLCAwKTsKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGlm
ICh1bmxpa2VseSghZXJyKSkgewo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB4
ZHBfcmV0dXJuX2ZyYW1lX3J4X25hcGkoeGRwZik7Cj4gPiAtICAgICAgICAgICAgICAgICAgICAg
ICB9IGVsc2UgaWYgKHVubGlrZWx5KGVyciA8IDApKSB7Cj4gPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHRyYWNlX3hkcF9leGNlcHRpb24odmktPmRldiwgeGRwX3Byb2csIGFjdCk7
Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyX3hkcDsKPiA+IC0g
ICAgICAgICAgICAgICAgICAgICAgIH0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICp4ZHBf
eG1pdCB8PSBWSVJUSU9fWERQX1RYOwo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgcmN1X3Jl
YWRfdW5sb2NrKCk7Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICBnb3RvIHhkcF94bWl0Owo+
ID4gLSAgICAgICAgICAgICAgIGNhc2UgWERQX1JFRElSRUNUOgo+ID4gLSAgICAgICAgICAgICAg
ICAgICAgICAgc3RhdHMtPnhkcF9yZWRpcmVjdHMrKzsKPiA+IC0gICAgICAgICAgICAgICAgICAg
ICAgIGVyciA9IHhkcF9kb19yZWRpcmVjdChkZXYsICZ4ZHAsIHhkcF9wcm9nKTsKPiA+IC0gICAg
ICAgICAgICAgICAgICAgICAgIGlmIChlcnIpCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGdvdG8gZXJyX3hkcDsKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICp4ZHBfeG1p
dCB8PSBWSVJUSU9fWERQX1JFRElSOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgIGNhc2UgVklS
VE5FVF9YRFBfUkVTX0NPTlNVTUVEOgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcmN1X3Jl
YWRfdW5sb2NrKCk7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIHhkcF94bWl0Owo+
ID4gLSAgICAgICAgICAgICAgIGRlZmF1bHQ6Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICBi
cGZfd2Fybl9pbnZhbGlkX3hkcF9hY3Rpb24odmktPmRldiwgeGRwX3Byb2csIGFjdCk7Cj4gPiAt
ICAgICAgICAgICAgICAgICAgICAgICBmYWxsdGhyb3VnaDsKPiA+IC0gICAgICAgICAgICAgICBj
YXNlIFhEUF9BQk9SVEVEOgo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgdHJhY2VfeGRwX2V4
Y2VwdGlvbih2aS0+ZGV2LCB4ZHBfcHJvZywgYWN0KTsKPiA+IC0gICAgICAgICAgICAgICAgICAg
ICAgIGdvdG8gZXJyX3hkcDsKPiA+IC0gICAgICAgICAgICAgICBjYXNlIFhEUF9EUk9QOgo+ID4g
Kwo+ID4gKyAgICAgICAgICAgICAgIGNhc2UgVklSVE5FVF9YRFBfUkVTX0RST1A6Cj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICBnb3RvIGVycl94ZHA7Cj4gPiAgICAgICAgICAgICAgICAgfQo+
ID4gICAgICAgICB9Cj4gPiBAQCAtMTI3Nyw3ICsxMzEzLDYgQEAgc3RhdGljIHN0cnVjdCBza19i
dWZmICpyZWNlaXZlX21lcmdlYWJsZShzdHJ1Y3QgbmV0X2RldmljZSAqZGV2LAo+ID4gICAgICAg
ICBpZiAoeGRwX3Byb2cpIHsKPiA+ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgeGRwX2Zy
YWdzX3RydWVzeiA9IDA7Cj4gPiAgICAgICAgICAgICAgICAgc3RydWN0IHNrYl9zaGFyZWRfaW5m
byAqc2hpbmZvOwo+ID4gLSAgICAgICAgICAgICAgIHN0cnVjdCB4ZHBfZnJhbWUgKnhkcGY7Cj4g
PiAgICAgICAgICAgICAgICAgc3RydWN0IHBhZ2UgKnhkcF9wYWdlOwo+ID4gICAgICAgICAgICAg
ICAgIHN0cnVjdCB4ZHBfYnVmZiB4ZHA7Cj4gPiAgICAgICAgICAgICAgICAgdm9pZCAqZGF0YTsK
PiA+IEBAIC0xMjk0LDQ5ICsxMzI5LDIyIEBAIHN0YXRpYyBzdHJ1Y3Qgc2tfYnVmZiAqcmVjZWl2
ZV9tZXJnZWFibGUoc3RydWN0IG5ldF9kZXZpY2UgKmRldiwKPiA+ICAgICAgICAgICAgICAgICBp
ZiAodW5saWtlbHkoZXJyKSkKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyX3hk
cF9mcmFnczsKPiA+Cj4gPiAtICAgICAgICAgICAgICAgYWN0ID0gYnBmX3Byb2dfcnVuX3hkcCh4
ZHBfcHJvZywgJnhkcCk7Cj4gPiAtICAgICAgICAgICAgICAgc3RhdHMtPnhkcF9wYWNrZXRzKys7
Cj4gPiArICAgICAgICAgICAgICAgYWN0ID0gdmlydG5ldF94ZHBfaGFuZGxlcih4ZHBfcHJvZywg
JnhkcCwgZGV2LCB4ZHBfeG1pdCwgc3RhdHMpOwo+ID4KPiA+ICAgICAgICAgICAgICAgICBzd2l0
Y2ggKGFjdCkgewo+ID4gLSAgICAgICAgICAgICAgIGNhc2UgWERQX1BBU1M6Cj4gPiArICAgICAg
ICAgICAgICAgY2FzZSBWSVJUTkVUX1hEUF9SRVNfUEFTUzoKPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgIGhlYWRfc2tiID0gYnVpbGRfc2tiX2Zyb21feGRwX2J1ZmYoZGV2LCB2aSwgJnhkcCwg
eGRwX2ZyYWdzX3RydWVzeik7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBpZiAodW5saWtl
bHkoIWhlYWRfc2tiKSkKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBl
cnJfeGRwX2ZyYWdzOwo+ID4KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHJjdV9yZWFkX3Vu
bG9jaygpOwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGhlYWRfc2tiOwo+ID4g
LSAgICAgICAgICAgICAgIGNhc2UgWERQX1RYOgo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAg
c3RhdHMtPnhkcF90eCsrOwo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgeGRwZiA9IHhkcF9j
b252ZXJ0X2J1ZmZfdG9fZnJhbWUoJnhkcCk7Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICBp
ZiAodW5saWtlbHkoIXhkcGYpKSB7Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IG5ldGRldl9kYmcoZGV2LCAiY29udmVydCBidWZmIHRvIGZyYW1lIGZhaWxlZCBmb3IgeGRwXG4i
KTsKPgo+IE5pdDogVGhpcyBkZWJ1ZyBpcyBsb3N0IGFmdGVyIHRoZSBjb252ZXJzaW9uLgoKV2ls
bCBmaXguCgpUaGFua3MuCgo+Cj4gVGhhbmtzCj4KPiA+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZ290byBlcnJfeGRwX2ZyYWdzOwo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAg
fQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgZXJyID0gdmlydG5ldF94ZHBfeG1pdChkZXYs
IDEsICZ4ZHBmLCAwKTsKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGlmICh1bmxpa2VseSgh
ZXJyKSkgewo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB4ZHBfcmV0dXJuX2Zy
YW1lX3J4X25hcGkoeGRwZik7Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICB9IGVsc2UgaWYg
KHVubGlrZWx5KGVyciA8IDApKSB7Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHRyYWNlX3hkcF9leGNlcHRpb24odmktPmRldiwgeGRwX3Byb2csIGFjdCk7Cj4gPiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyX3hkcF9mcmFnczsKPiA+IC0gICAgICAg
ICAgICAgICAgICAgICAgIH0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICp4ZHBfeG1pdCB8
PSBWSVJUSU9fWERQX1RYOwo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgcmN1X3JlYWRfdW5s
b2NrKCk7Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICBnb3RvIHhkcF94bWl0Owo+ID4gLSAg
ICAgICAgICAgICAgIGNhc2UgWERQX1JFRElSRUNUOgo+ID4gLSAgICAgICAgICAgICAgICAgICAg
ICAgc3RhdHMtPnhkcF9yZWRpcmVjdHMrKzsKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGVy
ciA9IHhkcF9kb19yZWRpcmVjdChkZXYsICZ4ZHAsIHhkcF9wcm9nKTsKPiA+IC0gICAgICAgICAg
ICAgICAgICAgICAgIGlmIChlcnIpCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGdvdG8gZXJyX3hkcF9mcmFnczsKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICp4ZHBfeG1p
dCB8PSBWSVJUSU9fWERQX1JFRElSOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgIGNhc2UgVklS
VE5FVF9YRFBfUkVTX0NPTlNVTUVEOgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcmN1X3Jl
YWRfdW5sb2NrKCk7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIHhkcF94bWl0Owo+
ID4gLSAgICAgICAgICAgICAgIGRlZmF1bHQ6Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICBi
cGZfd2Fybl9pbnZhbGlkX3hkcF9hY3Rpb24odmktPmRldiwgeGRwX3Byb2csIGFjdCk7Cj4gPiAt
ICAgICAgICAgICAgICAgICAgICAgICBmYWxsdGhyb3VnaDsKPiA+IC0gICAgICAgICAgICAgICBj
YXNlIFhEUF9BQk9SVEVEOgo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgdHJhY2VfeGRwX2V4
Y2VwdGlvbih2aS0+ZGV2LCB4ZHBfcHJvZywgYWN0KTsKPiA+IC0gICAgICAgICAgICAgICAgICAg
ICAgIGZhbGx0aHJvdWdoOwo+ID4gLSAgICAgICAgICAgICAgIGNhc2UgWERQX0RST1A6Cj4gPiAr
Cj4gPiArICAgICAgICAgICAgICAgY2FzZSBWSVJUTkVUX1hEUF9SRVNfRFJPUDoKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyX3hkcF9mcmFnczsKPiA+ICAgICAgICAgICAgICAg
ICB9Cj4gPiAgZXJyX3hkcF9mcmFnczoKPiA+IC0tCj4gPiAyLjMyLjAuMy5nMDExOTVjZjlmCj4g
Pgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1
YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0
aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5m
by92aXJ0dWFsaXphdGlvbg==
