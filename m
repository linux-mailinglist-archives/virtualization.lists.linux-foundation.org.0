Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 425267CD278
	for <lists.virtualization@lfdr.de>; Wed, 18 Oct 2023 04:58:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3B828225F;
	Wed, 18 Oct 2023 02:58:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3B828225F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nbKpo3c_V_ua; Wed, 18 Oct 2023 02:58:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C24B382236;
	Wed, 18 Oct 2023 02:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C24B382236
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E6F2DC0DD3;
	Wed, 18 Oct 2023 02:58:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C8E07C0032
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Oct 2023 02:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 965C140273
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Oct 2023 02:58:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 965C140273
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bnpUWdjAOiX2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Oct 2023 02:58:05 +0000 (UTC)
Received: from out30-124.freemail.mail.aliyun.com
 (out30-124.freemail.mail.aliyun.com [115.124.30.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D7CB40160
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Oct 2023 02:58:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D7CB40160
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0VuP8dr6_1697597878; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VuP8dr6_1697597878) by smtp.aliyun-inc.com;
 Wed, 18 Oct 2023 10:57:59 +0800
Message-ID: <1697597798.3310452-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH net-next v1 00/19] virtio-net: support AF_XDP zero copy
Date: Wed, 18 Oct 2023 10:56:38 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Jason Wang <jasowang@redhat.com>
References: <20231016120033.26933-1-xuanzhuo@linux.alibaba.com>
 <CACGkMEs4u-4ch2UAK14hNfKeORjqMu4BX7=46OfaXpvxW+VT7w@mail.gmail.com>
 <1697511725.2037013-1-xuanzhuo@linux.alibaba.com>
 <CACGkMEskfXDo+bnx5hbGU3JRwOgBRwOC-bYDdFYSmEO2jjgPnA@mail.gmail.com>
 <1697512950.0813534-1-xuanzhuo@linux.alibaba.com>
 <CACGkMEtppjoX_WAM+vjzkMKaMQQ0iZL=C_xS4RObuoLbm0udUw@mail.gmail.com>
 <CACGkMEvWAhH3uj2DEo=m7qWg3-pQjE-EtEBvTT8JXzqZ+RYEXQ@mail.gmail.com>
 <1697522771.0390663-2-xuanzhuo@linux.alibaba.com>
 <CACGkMEu4tSHd4RVo0zEp1A6uM-6h42y+yAB2xzHTv8SzYdZPXQ@mail.gmail.com>
 <1697525013.7650406-3-xuanzhuo@linux.alibaba.com>
 <1697541581.967358-1-xuanzhuo@linux.alibaba.com>
 <CACGkMEuXJaGEyAtdz1d3ajwx9jBqkWUyoUrg8DZ6dCXLPJxiOw@mail.gmail.com>
In-Reply-To: <CACGkMEuXJaGEyAtdz1d3ajwx9jBqkWUyoUrg8DZ6dCXLPJxiOw@mail.gmail.com>
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

T24gV2VkLCAxOCBPY3QgMjAyMyAxMDo0NjozOCArMDgwMCwgSmFzb24gV2FuZyA8amFzb3dhbmdA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4gT24gVHVlLCBPY3QgMTcsIDIwMjMgYXQgNzoyOOKAr1BNIFh1
YW4gWmh1byA8eHVhbnpodW9AbGludXguYWxpYmFiYS5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFR1
ZSwgMTcgT2N0IDIwMjMgMTQ6NDM6MzMgKzA4MDAsIFh1YW4gWmh1byA8eHVhbnpodW9AbGludXgu
YWxpYmFiYS5jb20+IHdyb3RlOgo+ID4gPiBPbiBUdWUsIDE3IE9jdCAyMDIzIDE0OjI2OjAxICsw
ODAwLCBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPiB3cm90ZToKPiA+ID4gPiBPbiBU
dWUsIE9jdCAxNywgMjAyMyBhdCAyOjE34oCvUE0gWHVhbiBaaHVvIDx4dWFuemh1b0BsaW51eC5h
bGliYWJhLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gT24gVHVlLCAxNyBPY3QgMjAy
MyAxMzoyNzo0NyArMDgwMCwgSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4gd3JvdGU6
Cj4gPiA+ID4gPiA+IE9uIFR1ZSwgT2N0IDE3LCAyMDIzIGF0IDExOjI44oCvQU0gSmFzb24gV2Fu
ZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
PiBPbiBUdWUsIE9jdCAxNywgMjAyMyBhdCAxMToyNuKAr0FNIFh1YW4gWmh1byA8eHVhbnpodW9A
bGludXguYWxpYmFiYS5jb20+IHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+
IE9uIFR1ZSwgMTcgT2N0IDIwMjMgMTE6MjA6NDEgKzA4MDAsIEphc29uIFdhbmcgPGphc293YW5n
QHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gPiBPbiBUdWUsIE9jdCAxNywgMjAy
MyBhdCAxMToxMeKAr0FNIFh1YW4gWmh1byA8eHVhbnpodW9AbGludXguYWxpYmFiYS5jb20+IHdy
b3RlOgo+ID4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+ID4gT24gVHVlLCAxNyBP
Y3QgMjAyMyAxMDo1Mzo0NCArMDgwMCwgSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4g
d3JvdGU6Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBPbiBNb24sIE9jdCAxNiwgMjAyMyBhdCA4OjAw
4oCvUE0gWHVhbiBaaHVvIDx4dWFuemh1b0BsaW51eC5hbGliYWJhLmNvbT4gd3JvdGU6Cj4gPiA+
ID4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICMjIEFGX1hEUAo+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiBYRFAgc29ja2V0KEFG
X1hEUCkgaXMgYW4gZXhjZWxsZW50IGJ5cGFzcyBrZXJuZWwgbmV0d29yayBmcmFtZXdvcmsuIFRo
ZSB6ZXJvCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IGNvcHkgZmVhdHVyZSBvZiB4c2sgKFhEUCBz
b2NrZXQpIG5lZWRzIHRvIGJlIHN1cHBvcnRlZCBieSB0aGUgZHJpdmVyLiBUaGUKPiA+ID4gPiA+
ID4gPiA+ID4gPiA+ID4gcGVyZm9ybWFuY2Ugb2YgemVybyBjb3B5IGlzIHZlcnkgZ29vZC4gbWx4
NSBhbmQgaW50ZWwgaXhnYmUgYWxyZWFkeSBzdXBwb3J0Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+
IHRoaXMgZmVhdHVyZSwgVGhpcyBwYXRjaCBzZXQgYWxsb3dzIHZpcnRpby1uZXQgdG8gc3VwcG9y
dCB4c2sncyB6ZXJvY29weSB4bWl0Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IGZlYXR1cmUuCj4g
PiA+ID4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IEF0IHByZXNlbnQs
IHdlIGhhdmUgY29tcGxldGVkIHNvbWUgcHJlcGFyYXRpb246Cj4gPiA+ID4gPiA+ID4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IDEuIHZxLXJlc2V0ICh2aXJ0aW8gc3BlYyBhbmQg
a2VybmVsIGNvZGUpCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IDIuIHZpcnRpby1jb3JlIHByZW1h
cHBlZCBkbWEKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gMy4gdmlydGlvLW5ldCB4ZHAgcmVmYWN0
b3IKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gU28gaXQg
aXMgdGltZSBmb3IgVmlydGlvLU5ldCB0byBjb21wbGV0ZSB0aGUgc3VwcG9ydCBmb3IgdGhlIFhE
UCBTb2NrZXQKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gWmVyb2NvcHkuCj4gPiA+ID4gPiA+ID4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IFZpcnRpby1uZXQgY2FuIG5vdCBpbmNy
ZWFzZSB0aGUgcXVldWUgbnVtIGF0IHdpbGwsIHNvIHhzayBzaGFyZXMgdGhlIHF1ZXVlIHdpdGgK
PiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4ga2VybmVsLgo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiBPbiB0aGUgb3RoZXIgaGFuZCwgVmlydGlvLU5ldCBkb2Vz
IG5vdCBzdXBwb3J0IGdlbmVyYXRlIGludGVycnVwdCBmcm9tIGRyaXZlcgo+ID4gPiA+ID4gPiA+
ID4gPiA+ID4gPiBtYW51YWxseSwgc28gd2hlbiB3ZSB3YWtldXAgdHggeG1pdCwgd2UgdXNlZCBz
b21lIHRpcHMuIElmIHRoZSBDUFUgcnVuIGJ5IFRYCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IE5B
UEkgbGFzdCB0aW1lIGlzIG90aGVyIENQVXMsIHVzZSBJUEkgdG8gd2FrZSB1cCBOQVBJIG9uIHRo
ZSByZW1vdGUgQ1BVLiBJZiBpdAo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiBpcyBhbHNvIHRoZSBs
b2NhbCBDUFUsIHRoZW4gd2Ugd2FrZSB1cCBuYXBpIGRpcmVjdGx5Lgo+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiBUaGlzIHBhdGNoIHNldCBpbmNsdWRlcyBz
b21lIHJlZmFjdG9yIHRvIHRoZSB2aXJ0aW8tbmV0IHRvIGxldCB0aGF0IHRvIHN1cHBvcnQKPiA+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gQUZfWERQLgo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gPiAjIyBwZXJmb3JtYW5jZQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiBFTlY6IFFlbXUgd2l0aCB2aG9zdC11c2VyKHBvbGxp
bmcgbW9kZSkuCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+
IFNvY2twZXJmOiBodHRwczovL2dpdGh1Yi5jb20vTWVsbGFub3gvc29ja3BlcmYKPiA+ID4gPiA+
ID4gPiA+ID4gPiA+ID4gSSB1c2UgdGhpcyB0b29sIHRvIHNlbmQgdWRwIHBhY2tldCBieSBrZXJu
ZWwgc3lzY2FsbC4KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gPiA+
ID4geG1pdCBjb21tYW5kOiBzb2NrcGVyZiB0cCAtaSAxMC4wLjMuMSAtdCAxMDAwCj4gPiA+ID4g
PiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IEkgd3JpdGUgYSB0b29sIHRo
YXQgc2VuZHMgdWRwIHBhY2tldHMgb3IgcmVjdnMgdWRwIHBhY2tldHMgYnkgQUZfWERQLgo+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAg
ICAgICB8IEd1ZXN0IEFQUCBDUFUgfEd1ZXN0IFNvZnRpcnEgQ1BVIHwgVURQIFBQUwo+ID4gPiA+
ID4gPiA+ID4gPiA+ID4gPiAtLS0tLS0tLS0tLS0tLS0tLS18LS0tLS0tLS0tLS0tLS0tfC0tLS0t
LS0tLS0tLS0tLS0tLXwtLS0tLS0tLS0tLS0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4geG1pdCBi
eSBzeXNjYWxsICAgfCAgIDEwMCUgICAgICAgIHwgICAgICAgICAgICAgICAgICB8ICAgNjc2LDkx
NQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiB4bWl0IGJ5IHhzayAgICAgICB8ICAgNTkuMSUgICAg
ICAgfCAgIDEwMCUgICAgICAgICAgIHwgNSw0NDcsMTY4Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+
IHJlY3YgYnkgc3lzY2FsbCAgIHwgICA2MCUgICAgICAgICB8ICAgMTAwJSAgICAgICAgICAgfCAg
IDkzMiwyODgKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gcmVjdiBieSB4c2sgICAgICAgfCAgIDM1
LjclICAgICAgIHwgICAxMDAlICAgICAgICAgICB8IDMsMzQzLDE2OAo+ID4gPiA+ID4gPiA+ID4g
PiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IEFueSBjaGFuY2Ugd2UgY2FuIGdldCBhIHRlc3Rw
bWQgcmVzdWx0ICh3aGljaCBJIGd1ZXNzIHNob3VsZCBiZSBiZXR0ZXIKPiA+ID4gPiA+ID4gPiA+
ID4gPiA+IHRoYW4gUFBTIGFib3ZlKT8KPiA+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+
ID4gPiA+IERvIHlvdSBtZWFuIHRlc3RwbWQgKyBEUERLICsgQUZfWERQPwo+ID4gPiA+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiBZZXMuCj4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gPiBZZXMuIFRoaXMgaXMgcHJvYmFibHkgYmV0dGVy
IGJlY2F1c2UgbXkgdG9vbCBkb2VzIG1vcmUgd29yay4gVGhhdCBpcyBub3QgYQo+ID4gPiA+ID4g
PiA+ID4gPiA+IGNvbXBsZXRlIHRlc3RpbmcgdG9vbCB1c2VkIGJ5IG91ciBidXNpbmVzcy4KPiA+
ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gUHJvYmFibHksIGJ1dCBpdCB3b3VsZCBi
ZSBhcHBlYWxpbmcgZm9yIG90aGVycy4gRXNwZWNpYWxseSBjb25zaWRlcmluZwo+ID4gPiA+ID4g
PiA+ID4gPiBEUERLIHN1cHBvcnRzIEFGX1hEUCBQTUQgbm93Lgo+ID4gPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gPiA+IE9LLgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IExldCBtZSB0
cnkuCj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gQnV0IGNvdWxkIHlvdSBzdGFydCB0
byByZXZpZXcgZmlyc3RseT8KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IFllcywgaXQncyBp
biBteSB0b2RvIGxpc3QuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFNwZWFraW5nIHRvbyBmYXN0
LCBJIHRoaW5rIGlmIGl0IGRvZXNuJ3QgdGFrZSB0b28gbG9uZyB0aW1lLCBJIHdvdWxkCj4gPiA+
ID4gPiA+IHdhaXQgZm9yIHRoZSByZXN1bHQgZmlyc3QgYXMgbmV0ZGltIHNlcmllcy4gT25lIHJl
YXNvbiBpcyB0aGF0IEkKPiA+ID4gPiA+ID4gcmVtZW1iZXIgY2xhaW1zIHRvIGJlIG9ubHkgMTAl
IHRvIDIwJSBsb3NzIGNvbXBhcmluZyB0byB3aXJlIHNwZWVkLCBzbwo+ID4gPiA+ID4gPiBJJ2Qg
ZXhwZWN0IGl0IHNob3VsZCBiZSBtdWNoIGZhc3Rlci4gSSB2YWd1ZWx5IHJlbWVtYmVyLCBldmVu
IGEgdmhvc3QKPiA+ID4gPiA+ID4gY2FuIGdpdmVzIHVzIG1vcmUgdGhhbiAzTSBQUFMgaWYgd2Ug
ZGlzYWJsZSBTTUFQLCBzbyB0aGUgbnVtYmVycyBoZXJlCj4gPiA+ID4gPiA+IGFyZSBub3QgYXMg
aW1wcmVzc2l2ZSBhcyBleHBlY3RlZC4KPiA+ID4gPiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gV2hh
dCBpcyBTTUFQPyBDbG91ZCB5b3UgZ2l2ZSBtZSBtb3JlIGluZm8/Cj4gPiA+ID4KPiA+ID4gPiBT
dXBlcnZpc29yIE1vZGUgQWNjZXNzIFByZXZlbnRpb24KPiA+ID4gPgo+ID4gPiA+IFZob3N0IHN1
ZmZlcnMgZnJvbSB0aGlzLgo+ID4gPiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gU28gaWYgd2UgdGhp
bmsgdGhlIDNNIGFzIHRoZSB3aXJlIHNwZWVkLCB5b3UgZXhwZWN0IHRoZSByZXN1bHQKPiA+ID4g
PiA+IGNhbiByZWFjaCAyLjhNIHBwcy9jb3JlLCByaWdodD8KPiA+ID4gPgo+ID4gPiA+IEl0J3Mg
QUZfWERQIHRoYXQgY2xhaW1zIHRvIGJlIDgwJSBpZiBteSBtZW1vcnkgaXMgY29ycmVjdC4gU28g
YQo+ID4gPiA+IGNvcnJlY3QgQUZfWERQIGltcGxlbWVudGF0aW9uIHNob3VsZCBub3Qgc2l0IGJl
aGluZCB0aGlzIHRvbyBtdWNoLgo+ID4gPiA+Cj4gPiA+ID4gPiBOb3cgdGhlIHJlY3YgcmVzdWx0
IGlzIDIuNU0oMjQ2MzY0NikgcHBzL2NvcmUuCj4gPiA+ID4gPiBEbyB5b3UgdGhpbmsgdGhlcmUg
aXMgYSBodWdlIGdhcD8KPiA+ID4gPgo+ID4gPiA+IFlvdSBuZXZlciBkZXNjcmliZSB5b3VyIHRl
c3RpbmcgZW52aXJvbm1lbnQgaW4gZGV0YWlscy4gRm9yIGV4YW1wbGUsCj4gPiA+ID4gaXMgdGhp
cyBhIHZpcnR1YWwgZW52aXJvbm1lbnQ/IFdoYXQncyB0aGUgQ1BVIG1vZGVsIGFuZCBmcmVxdWVu
Y3kgZXRjLgo+ID4gPiA+Cj4gPiA+ID4gQmVjYXVzZSBJIG5ldmVyIHNlZSBhIE5JQyB3aG9zZSB3
aXJlIHNwZWVkIGlzIDNNLgo+ID4gPiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gTXkgdG9vbCBtYWtl
cyB1ZHAgcGFja2V0IGFuZCBsb29rdXAgcm91dGUsIHNvIGl0IHRha2UgbW9yZSBtdWNoIGNwdS4K
PiA+ID4gPgo+ID4gPiA+IFRoYXQncyB3aHkgSSBzdWdnZXN0IHlvdSB0byB0ZXN0IHJhdyBQUFMu
Cj4gPiA+Cj4gPiA+IE9LLiBMZXQncyBhbGlnbiBzb21lIGluZm8uCj4gPiA+Cj4gPiA+IDEuIE15
IHRlc3QgZW52IGlzIHZob3N0LXVzZXIuIFFlbXUgKyB2aG9zdC11c2VyKHBvbGxpbmcgbW9kZSku
Cj4gPiA+ICAgIEkgZG8gbm90IHVzZSB0aGUgRFBESywgYmVjYXVzZSB0aGF0IHRoZXJlIGlzIHNv
bWUgdHJvdWJsZSBmb3IgbWUuCj4gPiA+ICAgIEkgdXNlIHRoZSBWQVBQIChodHRwczovL2dpdGh1
Yi5jb20vZmVuZ2lkcmkvdmFwcCkgYXMgdGhlIHZob3N0LXVzZXIgZGV2aWNlLgo+ID4gPiAgICBU
aGF0IGhhcyB0d28gdGhyZWFkcyBhbGwgYXJlIGJ1c3kgbW9kZSBmb3IgdHggYW5kIHJ4Lgo+ID4g
PiAgICB0eCB0aHJlYWQgY29uc3VtZXMgdGhlIHR4IHJpbmcgYW5kIGRyb3AgdGhlIHBhY2tldC4K
PiA+ID4gICAgcnggdGhyZWFkIHB1dCB0aGUgcGFja2V0IHRvIHRoZSByeCByaW5nLgo+ID4gPgo+
ID4gPiAyLiBNeSBIb3N0IENQVTogSW50ZWwoUikgWGVvbihSKSBQbGF0aW51bSA4MTYzIENQVSBA
IDIuNTBHSHoKPiA+ID4KPiA+ID4gMy4gRnJvbSB0aGlzIGh0dHA6Ly9mYXN0LmRwZGsub3JnL2Rv
Yy9wZXJmL0RQREtfMjNfMDNfSW50ZWxfdmlydGlvX3BlcmZvcm1hbmNlX3JlcG9ydC5wZGYKPiA+
ID4gICAgSSB0aGluayB3ZSBjYW4gYWxpZ24gdGhhdCB0aGUgdmhvc3QgbWF4IHNwZWVkIGlzIDgu
NSBNUFBTLgo+ID4gPiAgICBJcyB0aGF0IG9rPwo+ID4gPiAgICBBbmQgdGhlIGV4cGVjdGVkIEFG
X1hEUCBwcHMgaXMgYWJvdXQgNiBNUFBTLgo+ID4gPgo+ID4gPiA0LiBBYm91dCB0aGUgcmF3IFBQ
UywgSSBhZ3JlZSB0aGF0LiBJIHdpbGwgdGVzdCB3aXRoIHRlc3RwbWQuCj4gPiA+Cj4gPgo+ID4g
IyMgdGVzdHBtZCBjb21tYW5kCj4gPgo+ID4gLi9idWlsZC9hcHAvZHBkay10ZXN0cG1kIC1sIDEt
MiAtLW5vLXBjaSAtLW1haW4tbGNvcmU9MiBcCj4gPiAgICAgICAgIC0tdmRldiBuZXRfYWZfeGRw
MCxpZmFjZT1lbnM1LHF1ZXVlX2NvdW50PTEsYnVzeV9idWRnZXQ9MCBcCj4gPiAgICAgICAgIC0t
bG9nLWxldmVsPXBtZC5uZXQuYWZfeGRwOjggXAo+ID4gICAgICAgICAtLSAtaSAtYSAtLW5iLWNv
cmVzPTEgLS1yeHE9MSAtLXR4cT0xIC0tZm9yd2FyZC1tb2RlPW1hY3N3YXAKPiA+Cj4gPiAjIyB3
b3JrIHdpdGhvdXQgdGhlIGZvbGxvdyBwYXRjaFswXQo+ID4KPiA+IHRlc3RwbWQ+IHNob3cgcG9y
dCBzdGF0cyBhbGwKPiA+Cj4gPiAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyBOSUMgc3RhdGlz
dGljcyBmb3IgcG9ydCAwICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiA+ICAgUlgtcGFja2V0
czogMzYxNTgyNDMzNiBSWC1taXNzZWQ6IDAgICAgICAgICAgUlgtYnl0ZXM6ICAyMDI0ODYxNjI4
MTYKPiA+ICAgUlgtZXJyb3JzOiAwCj4gPiAgIFJYLW5vbWJ1ZjogIDAKPiA+ICAgVFgtcGFja2V0
czogMzYxNTc5NTU5MiBUWC1lcnJvcnM6IDIwNzM4ICAgICAgVFgtYnl0ZXM6ICAyMDI0ODQ1NTMx
NTIKPiA+Cj4gPiAgIFRocm91Z2hwdXQgKHNpbmNlIGxhc3Qgc2hvdykKPiA+ICAgUngtcHBzOiAg
ICAgIDM3OTA0NDYgICAgICAgICAgUngtYnBzOiAgIDE2OTgxMjAwNTYKPiA+ICAgVHgtcHBzOiAg
ICAgIDM3OTA0NDYgICAgICAgICAgVHgtYnBzOiAgIDE2OTgxMjAwNTYKPiA+ICAgIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIwo+ID4KPiA+Cj4gPiAjIyB3b3JrIHdpdGggdGhlIGZvbGxvdyBwYXRjaFswXQo+
ID4KPiA+IHRlc3RwbWQ+IHNob3cgcG9ydCBzdGF0cyBhbGwKPiA+Cj4gPiAgICMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyBOSUMgc3RhdGlzdGljcyBmb3IgcG9ydCAwICAjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMKPiA+ICAgUlgtcGFja2V0czogNjgxNTI3MjcgICBSWC1taXNzZWQ6IDAgICAgICAg
ICAgUlgtYnl0ZXM6ICAzODE2NTUyNzEyCj4gPiAgIFJYLWVycm9yczogMAo+ID4gICBSWC1ub21i
dWY6ICAwCj4gPiAgIFRYLXBhY2tldHM6IDY4MTE0OTY3ICAgVFgtZXJyb3JzOiAzMzIxNiAgICAg
IFRYLWJ5dGVzOiAgMzgxNDQzODE1Mgo+ID4KPiA+ICAgVGhyb3VnaHB1dCAoc2luY2UgbGFzdCBz
aG93KQo+ID4gICBSeC1wcHM6ICAgICAgNjMzMzE5NiAgICAgICAgICBSeC1icHM6ICAgMjgzNzI3
MjA4OAo+ID4gICBUeC1wcHM6ICAgICAgNjMzMzIyNyAgICAgICAgICBUeC1icHM6ICAgMjgzNzI4
NTkzNgo+ID4gICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gPgo+ID4gSSBzZWFyY2ggdGhlIGRwZGsg
Y29kZSB0aGF0IHRoZSBkcGRrIHZpcnRpbyBkcml2ZXIgaGFzIHRoZSBzaW1pbGFyIGNvZGUuCj4g
Pgo+ID4gdmlydGlvX3htaXRfcGt0cyh2b2lkICp0eF9xdWV1ZSwgc3RydWN0IHJ0ZV9tYnVmICoq
dHhfcGt0cywgdWludDE2X3QgbmJfcGt0cykKPiA+IHsKPiA+ICAgICAgICAgWy4uLl0KPiA+Cj4g
PiAgICAgICAgIGZvciAobmJfdHggPSAwOyBuYl90eCA8IG5iX3BrdHM7IG5iX3R4KyspIHsKPiA+
Cj4gPiAgICAgICAgICAgICAgICAgWy4uLl0KPiA+Cj4gPiAgICAgICAgICAgICAgICAgLyogRW5x
dWV1ZSBQYWNrZXQgYnVmZmVycyAqLwo+ID4gICAgICAgICAgICAgICAgIHZpcnRxdWV1ZV9lbnF1
ZXVlX3htaXQodHh2cSwgdHhtLCBzbG90cywgdXNlX2luZGlyZWN0LAo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgY2FuX3B1c2gsIDApOwo+ID4gICAgICAgICB9Cj4gPgo+ID4gICAgICAgICBb
Li4uXQo+ID4KPiA+ICAgICAgICAgaWYgKGxpa2VseShuYl90eCkpIHsKPiA+IC0tPiAgICAgICAg
ICAgICB2cV91cGRhdGVfYXZhaWxfaWR4KHZxKTsKPiA+Cj4gPiAgICAgICAgICAgICAgICAgaWYg
KHVubGlrZWx5KHZpcnRxdWV1ZV9raWNrX3ByZXBhcmUodnEpKSkgewo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgdmlydHF1ZXVlX25vdGlmeSh2cSk7Cj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICBQTURfVFhfTE9HKERFQlVHLCAiTm90aWZpZWQgYmFja2VuZCBhZnRlciB4bWl0Iik7Cj4g
PiAgICAgICAgICAgICAgICAgfQo+ID4gICAgICAgICB9Cj4gPiB9Cj4gPgo+ID4gIyMgcGF0Y2hb
MF0KPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aXJ0aW8vdmlydGlvX3JpbmcuYyBiL2Ry
aXZlcnMvdmlydGlvL3ZpcnRpb19yaW5nLmMKPiA+IGluZGV4IDUxZDhmMzI5OWMxMC4uY2ZlNTU2
YjVkODhmIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy92aXJ0aW8vdmlydGlvX3JpbmcuYwo+ID4g
KysrIGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX3JpbmcuYwo+ID4gQEAgLTY4NywxMiArNjg3LDcg
QEAgc3RhdGljIGlubGluZSBpbnQgdmlydHF1ZXVlX2FkZF9zcGxpdChzdHJ1Y3QgdmlydHF1ZXVl
ICpfdnEsCj4gPiAgICAgICAgIGF2YWlsID0gdnEtPnNwbGl0LmF2YWlsX2lkeF9zaGFkb3cgJiAo
dnEtPnNwbGl0LnZyaW5nLm51bSAtIDEpOwo+ID4gICAgICAgICB2cS0+c3BsaXQudnJpbmcuYXZh
aWwtPnJpbmdbYXZhaWxdID0gY3B1X3RvX3ZpcnRpbzE2KF92cS0+dmRldiwgaGVhZCk7Cj4gPgo+
ID4gLSAgICAgICAvKiBEZXNjcmlwdG9ycyBhbmQgYXZhaWxhYmxlIGFycmF5IG5lZWQgdG8gYmUg
c2V0IGJlZm9yZSB3ZSBleHBvc2UgdGhlCj4gPiAtICAgICAgICAqIG5ldyBhdmFpbGFibGUgYXJy
YXkgZW50cmllcy4gKi8KPiA+IC0gICAgICAgdmlydGlvX3dtYih2cS0+d2Vha19iYXJyaWVycyk7
Cj4gPiAgICAgICAgIHZxLT5zcGxpdC5hdmFpbF9pZHhfc2hhZG93Kys7Cj4gPiAtICAgICAgIHZx
LT5zcGxpdC52cmluZy5hdmFpbC0+aWR4ID0gY3B1X3RvX3ZpcnRpbzE2KF92cS0+dmRldiwKPiA+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZxLT5zcGxp
dC5hdmFpbF9pZHhfc2hhZG93KTsKPiA+ICAgICAgICAgdnEtPm51bV9hZGRlZCsrOwo+ID4KPiA+
ICAgICAgICAgcHJfZGVidWcoIkFkZGVkIGJ1ZmZlciBoZWFkICVpIHRvICVwXG4iLCBoZWFkLCB2
cSk7Cj4gPiBAQCAtNzAwLDggKzY5NSwxMiBAQCBzdGF0aWMgaW5saW5lIGludCB2aXJ0cXVldWVf
YWRkX3NwbGl0KHN0cnVjdCB2aXJ0cXVldWUgKl92cSwKPiA+Cj4gPiAgICAgICAgIC8qIFRoaXMg
aXMgdmVyeSB1bmxpa2VseSwgYnV0IHRoZW9yZXRpY2FsbHkgcG9zc2libGUuICBLaWNrCj4gPiAg
ICAgICAgICAqIGp1c3QgaW4gY2FzZS4gKi8KPiA+IC0gICAgICAgaWYgKHVubGlrZWx5KHZxLT5u
dW1fYWRkZWQgPT0gKDEgPDwgMTYpIC0gMSkpCj4gPiArICAgICAgIGlmICh1bmxpa2VseSh2cS0+
bnVtX2FkZGVkID09ICgxIDw8IDE2KSAtIDEpKSB7Cj4gPiArICAgICAgICAgICAgICAgdmlydGlv
X3dtYih2cS0+d2Vha19iYXJyaWVycyk7Cj4gPiArICAgICAgICAgICAgICAgdnEtPnNwbGl0LnZy
aW5nLmF2YWlsLT5pZHggPSBjcHVfdG9fdmlydGlvMTYoX3ZxLT52ZGV2LAo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZxLT5z
cGxpdC5hdmFpbF9pZHhfc2hhZG93KTsKPiA+ICAgICAgICAgICAgICAgICB2aXJ0cXVldWVfa2lj
ayhfdnEpOwo+ID4gKyAgICAgICB9Cj4gPgo+ID4gICAgICAgICByZXR1cm4gMDsKPiA+Cj4gPiBA
QCAtNzQyLDYgKzc0MSw5IEBAIHN0YXRpYyBib29sIHZpcnRxdWV1ZV9raWNrX3ByZXBhcmVfc3Bs
aXQoc3RydWN0IHZpcnRxdWV1ZSAqX3ZxKQo+ID4gICAgICAgICAgKiBldmVudC4gKi8KPiA+ICAg
ICAgICAgdmlydGlvX21iKHZxLT53ZWFrX2JhcnJpZXJzKTsKPiA+Cj4gPiArICAgICAgIHZxLT5z
cGxpdC52cmluZy5hdmFpbC0+aWR4ID0gY3B1X3RvX3ZpcnRpbzE2KF92cS0+dmRldiwKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZxLT5zcGxpdC5h
dmFpbF9pZHhfc2hhZG93KTsKPiA+ICsKPgo+IExvb2tzIGxpa2UgYW4gaW50ZXJlc3Rpbmcgb3B0
aW1pemF0aW9uLgo+Cj4gV291bGQgeW91IG1pbmQgcG9zdGluZyB0aGlzIHdpdGggbnVtYmVycyBz
ZXBhcmF0ZWx5PwoKSSB3aWxsIHBvc3QgdGhpcyBsYXRlci4KCgo+Cj4gQnR3LCBkb2VzIHRoZSBj
dXJyZW50IEFQSSByZXF1aXJlIHZpcnRxdWV1ZV9raWNrX3ByZXBhcmUoKSB0byBiZSBkb25lCj4g
YmVmb3JlIGEgdmlydHF1ZXVlX25vdGlmeSgpLiBJZiBub3QsIHdlIG5lZWQgZG8gc29tZXRoaW5n
IHNpbWlsYXIgaW4KPiB2aXJ0cXVldWVfbm90aWZ5KCk/CgpBcyBJIGtub3csIHByZXBhcmUgaXMg
ZG9uZSBiZWZvcmUgYSBub3RpZnkuCgpJIHdpbGwgY2hlY2sgdGhpcyBkb3VibHkuCgpUaGFua3Mu
CgoKPgo+IFRoYW5rcwo+Cj4gPiAgICAgICAgIG9sZCA9IHZxLT5zcGxpdC5hdmFpbF9pZHhfc2hh
ZG93IC0gdnEtPm51bV9hZGRlZDsKPiA+ICAgICAgICAgbmV3ID0gdnEtPnNwbGl0LmF2YWlsX2lk
eF9zaGFkb3c7Cj4gPiAgICAgICAgIHZxLT5udW1fYWRkZWQgPSAwOwo+ID4KPiA+IC0tLS0tLS0t
LS0tLS0tLQo+ID4KPiA+IFRoYW5rcy4KPiA+Cj4gPgo+ID4gPgo+ID4gPiBUaGFua3MuCj4gPiA+
Cj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBUaGFua3MKPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+
IEkgYW0gY29uZnVzZWQuCj4gPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+IFdoYXQgaXMgU01B
UD8gQ291bGQgeW91IGdpdmUgbWUgbW9yZSBpbmZvcm1hdGlvbj8KPiA+ID4gPiA+Cj4gPiA+ID4g
PiBTbyBpZiB3ZSB1c2UgM00gYXMgdGhlIHdpcmUgc3BlZWQsIHlvdSB3b3VsZCBleHBlY3QgdGhl
IHJlc3VsdCB0byBiZSAyLjhNCj4gPiA+ID4gPiBwcHMvY29yZSwgcmlnaHQ/Cj4gPiA+ID4gPgo+
ID4gPiA+ID4gTm93IHRoZSByZWN2IHJlc3VsdCBpcyAyLjVNICgyNDYzNjQ2ID0gMywzNDMsMTY4
LzEuMzU3KSBwcHMvY29yZS4gRG8geW91IHRoaW5rCj4gPiA+ID4gPiB0aGUgZGlmZmVyZW5jZSBp
cyBiaWc/Cj4gPiA+ID4gPgo+ID4gPiA+ID4gTXkgdG9vbCBtYWtlcyB1ZHAgcGFja2V0cyBhbmQg
bG9va3MgdXAgcm91dGVzLCBzbyBpdCByZXF1aXJlcyBtb3JlIENQVS4KPiA+ID4gPiA+Cj4gPiA+
ID4gPiBJJ20gY29uZnVzZWQuIElzIHRoZXJlIHNvbWV0aGluZyBJIG1pc3VuZGVyc3Rvb2Q/Cj4g
PiA+ID4gPgo+ID4gPiA+ID4gVGhhbmtzLgo+ID4gPiA+ID4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gVGhhbmtzCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+ID4gPiA+ID4gV2hhdCBJIG5vdGljZWQgaXMgdGhhdCB0aGUgaG90c3BvdCBpcyB0aGUgZHJp
dmVyIHdyaXRpbmcgdmlydGlvIGRlc2MuIEJlY2F1c2UKPiA+ID4gPiA+ID4gPiA+ID4gPiB0aGUg
ZGV2aWNlIGlzIGluIGJ1c3kgbW9kZS4gU28gdGhlcmUgaXMgcmFjZSBiZXR3ZWVuIGRyaXZlciBh
bmQgZGV2aWNlLgo+ID4gPiA+ID4gPiA+ID4gPiA+IFNvIEkgbW9kaWZpZWQgdGhlIHZpcnRpbyBj
b3JlIGFuZCBsYXppbHkgdXBkYXRlZCBhdmFpbCBpZHguIFRoZW4gcHBzIGNhbiByZWFjaAo+ID4g
PiA+ID4gPiA+ID4gPiA+IDEwLDAwMCwwMDAuCj4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
ID4gPiA+IENhcmUgdG8gcG9zdCBhIGRyYWZ0IGZvciB0aGlzPwo+ID4gPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gPiA+IFlFUywgSSBpcyB0aGlua2luZyBmb3IgdGhpcy4KPiA+ID4gPiA+ID4gPiA+
IEJ1dCBtYXliZSB0aGF0IGlzIGp1c3Qgd29yayBmb3Igc3BsaXQuIFRoZSBwYWNrZWQgbW9kZSBo
YXMgc29tZSB0cm91Ymxlcy4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IE9rLgo+ID4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+ID4gVGhhbmtzCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+
Cj4gPiA+ID4gPiA+ID4gPiBUaGFua3MuCj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiA+ID4gPiBUaGFua3MKPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiA+IFRoYW5rcy4KPiA+ID4gPiA+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IFRoYW5rcwo+ID4gPiA+
ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gIyMgbWFpbnRhaW4KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+
ID4gPiA+ID4gSSBhbSBjdXJyZW50bHkgYSByZXZpZXdlciBmb3IgdmlydGlvLW5ldC4gSSBjb21t
aXQgdG8gbWFpbnRhaW4gQUZfWERQIHN1cHBvcnQgaW4KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4g
dmlydGlvLW5ldC4KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gPiA+
ID4gUGxlYXNlIHJldmlldy4KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+
ID4gPiA+ID4gVGhhbmtzLgo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gPiB2MToKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gICAgIDEuIHJlbW92ZSB0d28gdmly
dGlvIGNvbW1pdHMuIFB1c2ggdGhpcyBwYXRjaHNldCB0byBuZXQtbmV4dAo+ID4gPiA+ID4gPiA+
ID4gPiA+ID4gPiAgICAgMi4gc3F1YXNoICJ2aXJ0aW9fbmV0OiB2aXJ0bmV0X3BvbGxfdHggc3Vw
cG9ydCByZXNjaGVkdWxlZCIgdG8geHNrOiBzdXBwb3J0IHR4Cj4gPiA+ID4gPiA+ID4gPiA+ID4g
PiA+ICAgICAzLiBmaXggc29tZSB3YXJuaW5ncwo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gPiBYdWFuIFpodW8gKDE5KToKPiA+ID4gPiA+ID4gPiA+ID4gPiA+
ID4gICB2aXJ0aW9fbmV0OiByZW5hbWUgZnJlZV9vbGRfeG1pdF9za2JzIHRvIGZyZWVfb2xkX3ht
aXQKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gICB2aXJ0aW9fbmV0OiB1bmlmeSB0aGUgY29kZSBm
b3IgcmVjeWNsaW5nIHRoZSB4bWl0IHB0cgo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiAgIHZpcnRp
b19uZXQ6IGluZGVwZW5kZW50IGRpcmVjdG9yeQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiAgIHZp
cnRpb19uZXQ6IG1vdmUgdG8gdmlydGlvX25ldC5oCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICAg
dmlydGlvX25ldDogYWRkIHByZWZpeCB2aXJ0bmV0IHRvIGFsbCBzdHJ1Y3QvYXBpIGluc2lkZSB2
aXJ0aW9fbmV0LmgKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gICB2aXJ0aW9fbmV0OiBzZXBhcmF0
ZSB2aXJ0bmV0X3J4X3Jlc2l6ZSgpCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICAgdmlydGlvX25l
dDogc2VwYXJhdGUgdmlydG5ldF90eF9yZXNpemUoKQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiAg
IHZpcnRpb19uZXQ6IHNxIHN1cHBvcnQgcHJlbWFwcGVkIG1vZGUKPiA+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gICB2aXJ0aW9fbmV0OiB4c2s6IGJpbmQvdW5iaW5kIHhzawo+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gPiAgIHZpcnRpb19uZXQ6IHhzazogcHJldmVudCBkaXNhYmxlIHR4IG5hcGkKPiA+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gICB2aXJ0aW9fbmV0OiB4c2s6IHR4OiBzdXBwb3J0IHR4Cj4gPiA+
ID4gPiA+ID4gPiA+ID4gPiA+ICAgdmlydGlvX25ldDogeHNrOiB0eDogc3VwcG9ydCB3YWtldXAK
PiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gICB2aXJ0aW9fbmV0OiB4c2s6IHR4OiB2aXJ0bmV0X2Zy
ZWVfb2xkX3htaXQoKSBkaXN0aW5ndWlzaGVzIHhzayBidWZmZXIKPiA+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gICB2aXJ0aW9fbmV0OiB4c2s6IHR4OiB2aXJ0bmV0X3NxX2ZyZWVfdW51c2VkX2J1Zigp
IGNoZWNrIHhzayBidWZmZXIKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gICB2aXJ0aW9fbmV0OiB4
c2s6IHJ4OiBpbnRyb2R1Y2UgYWRkX3JlY3ZidWZfeHNrKCkKPiA+ID4gPiA+ID4gPiA+ID4gPiA+
ID4gICB2aXJ0aW9fbmV0OiB4c2s6IHJ4OiBpbnRyb2R1Y2UgcmVjZWl2ZV94c2soKSB0byByZWN2
IHhzayBidWZmZXIKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gICB2aXJ0aW9fbmV0OiB4c2s6IHJ4
OiB2aXJ0bmV0X3JxX2ZyZWVfdW51c2VkX2J1ZigpIGNoZWNrIHhzayBidWZmZXIKPiA+ID4gPiA+
ID4gPiA+ID4gPiA+ID4gICB2aXJ0aW9fbmV0OiB1cGRhdGUgdHggdGltZW91dCByZWNvcmQKPiA+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gICB2aXJ0aW9fbmV0OiB4ZHBfZmVhdHVyZXMgYWRkIE5FVERF
Vl9YRFBfQUNUX1hTS19aRVJPQ09QWQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiA+ID4gPiA+ID4gPiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAgMiArLQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiAgZHJpdmVycy9uZXQvS2NvbmZpZyAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgOCArLQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiAg
ZHJpdmVycy9uZXQvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQo+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gPiAgZHJpdmVycy9uZXQvdmlydGlvL0tjb25maWcgICAgICAgICAg
ICAgICAgICB8ICAxMyArCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICBkcml2ZXJzL25ldC92aXJ0
aW8vTWFrZWZpbGUgICAgICAgICAgICAgICAgIHwgICA4ICsKPiA+ID4gPiA+ID4gPiA+ID4gPiA+
ID4gIGRyaXZlcnMvbmV0L3t2aXJ0aW9fbmV0LmMgPT4gdmlydGlvL21haW4uY30gfCA2NTIgKysr
KysrKysrLS0tLS0tLS0tLS0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gIGRyaXZlcnMvbmV0L3Zp
cnRpby92aXJ0aW9fbmV0LmggICAgICAgICAgICAgfCAzNTkgKysrKysrKysrKysKPiA+ID4gPiA+
ID4gPiA+ID4gPiA+ID4gIGRyaXZlcnMvbmV0L3ZpcnRpby94c2suYyAgICAgICAgICAgICAgICAg
ICAgfCA1NDUgKysrKysrKysrKysrKysrKwo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiAgZHJpdmVy
cy9uZXQvdmlydGlvL3hzay5oICAgICAgICAgICAgICAgICAgICB8ICAzMiArCj4gPiA+ID4gPiA+
ID4gPiA+ID4gPiA+ICA5IGZpbGVzIGNoYW5nZWQsIDEyNDcgaW5zZXJ0aW9ucygrKSwgMzc0IGRl
bGV0aW9ucygtKQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvbmV0L3ZpcnRpby9LY29uZmlnCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9uZXQvdmlydGlvL01ha2VmaWxlCj4gPiA+ID4gPiA+ID4gPiA+
ID4gPiA+ICByZW5hbWUgZHJpdmVycy9uZXQve3ZpcnRpb19uZXQuYyA9PiB2aXJ0aW8vbWFpbi5j
fSAoOTElKQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvbmV0L3ZpcnRpby92aXJ0aW9fbmV0LmgKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL25ldC92aXJ0aW8veHNrLmMKPiA+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL25ldC92aXJ0aW8veHNrLmgKPiA+ID4g
PiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gLS0KPiA+ID4gPiA+ID4g
PiA+ID4gPiA+ID4gMi4zMi4wLjMuZzAxMTk1Y2Y5Zgo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4KPiA+ID4KPiA+
Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVh
bGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRp
b24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3ZpcnR1YWxpemF0aW9u
