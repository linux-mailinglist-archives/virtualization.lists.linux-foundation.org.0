Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3907CBBD1
	for <lists.virtualization@lfdr.de>; Tue, 17 Oct 2023 09:00:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7951641762;
	Tue, 17 Oct 2023 07:00:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7951641762
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DjToAHGeE6Tq; Tue, 17 Oct 2023 07:00:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id CB30A410B2;
	Tue, 17 Oct 2023 07:00:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB30A410B2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 005FAC0DD3;
	Tue, 17 Oct 2023 07:00:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BAD51C0032
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Oct 2023 07:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E5FF402D4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Oct 2023 07:00:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E5FF402D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id su69CjEYN9wR
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Oct 2023 07:00:17 +0000 (UTC)
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5138D4000B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Oct 2023 07:00:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5138D4000B
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R271e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0VuM1tfj_1697526008; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VuM1tfj_1697526008) by smtp.aliyun-inc.com;
 Tue, 17 Oct 2023 15:00:09 +0800
Message-ID: <1697525013.7650406-3-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH net-next v1 00/19] virtio-net: support AF_XDP zero copy
Date: Tue, 17 Oct 2023 14:43:33 +0800
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
In-Reply-To: <CACGkMEu4tSHd4RVo0zEp1A6uM-6h42y+yAB2xzHTv8SzYdZPXQ@mail.gmail.com>
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

T24gVHVlLCAxNyBPY3QgMjAyMyAxNDoyNjowMSArMDgwMCwgSmFzb24gV2FuZyA8amFzb3dhbmdA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4gT24gVHVlLCBPY3QgMTcsIDIwMjMgYXQgMjoxN+KAr1BNIFh1
YW4gWmh1byA8eHVhbnpodW9AbGludXguYWxpYmFiYS5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFR1
ZSwgMTcgT2N0IDIwMjMgMTM6Mjc6NDcgKzA4MDAsIEphc29uIFdhbmcgPGphc293YW5nQHJlZGhh
dC5jb20+IHdyb3RlOgo+ID4gPiBPbiBUdWUsIE9jdCAxNywgMjAyMyBhdCAxMToyOOKAr0FNIEph
c29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gT24g
VHVlLCBPY3QgMTcsIDIwMjMgYXQgMTE6MjbigK9BTSBYdWFuIFpodW8gPHh1YW56aHVvQGxpbnV4
LmFsaWJhYmEuY29tPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiBPbiBUdWUsIDE3IE9jdCAy
MDIzIDExOjIwOjQxICswODAwLCBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPiB3cm90
ZToKPiA+ID4gPiA+ID4gT24gVHVlLCBPY3QgMTcsIDIwMjMgYXQgMTE6MTHigK9BTSBYdWFuIFpo
dW8gPHh1YW56aHVvQGxpbnV4LmFsaWJhYmEuY29tPiB3cm90ZToKPiA+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiA+IE9uIFR1ZSwgMTcgT2N0IDIwMjMgMTA6NTM6NDQgKzA4MDAsIEphc29uIFdhbmcg
PGphc293YW5nQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gT24gTW9uLCBPY3Qg
MTYsIDIwMjMgYXQgODowMOKAr1BNIFh1YW4gWmh1byA8eHVhbnpodW9AbGludXguYWxpYmFiYS5j
b20+IHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiAjIyBBRl9YRFAK
PiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gWERQIHNvY2tldChBRl9YRFApIGlz
IGFuIGV4Y2VsbGVudCBieXBhc3Mga2VybmVsIG5ldHdvcmsgZnJhbWV3b3JrLiBUaGUgemVybwo+
ID4gPiA+ID4gPiA+ID4gPiBjb3B5IGZlYXR1cmUgb2YgeHNrIChYRFAgc29ja2V0KSBuZWVkcyB0
byBiZSBzdXBwb3J0ZWQgYnkgdGhlIGRyaXZlci4gVGhlCj4gPiA+ID4gPiA+ID4gPiA+IHBlcmZv
cm1hbmNlIG9mIHplcm8gY29weSBpcyB2ZXJ5IGdvb2QuIG1seDUgYW5kIGludGVsIGl4Z2JlIGFs
cmVhZHkgc3VwcG9ydAo+ID4gPiA+ID4gPiA+ID4gPiB0aGlzIGZlYXR1cmUsIFRoaXMgcGF0Y2gg
c2V0IGFsbG93cyB2aXJ0aW8tbmV0IHRvIHN1cHBvcnQgeHNrJ3MgemVyb2NvcHkgeG1pdAo+ID4g
PiA+ID4gPiA+ID4gPiBmZWF0dXJlLgo+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4g
PiBBdCBwcmVzZW50LCB3ZSBoYXZlIGNvbXBsZXRlZCBzb21lIHByZXBhcmF0aW9uOgo+ID4gPiA+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiAxLiB2cS1yZXNldCAodmlydGlvIHNwZWMgYW5k
IGtlcm5lbCBjb2RlKQo+ID4gPiA+ID4gPiA+ID4gPiAyLiB2aXJ0aW8tY29yZSBwcmVtYXBwZWQg
ZG1hCj4gPiA+ID4gPiA+ID4gPiA+IDMuIHZpcnRpby1uZXQgeGRwIHJlZmFjdG9yCj4gPiA+ID4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+IFNvIGl0IGlzIHRpbWUgZm9yIFZpcnRpby1OZXQg
dG8gY29tcGxldGUgdGhlIHN1cHBvcnQgZm9yIHRoZSBYRFAgU29ja2V0Cj4gPiA+ID4gPiA+ID4g
PiA+IFplcm9jb3B5Lgo+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiBWaXJ0aW8t
bmV0IGNhbiBub3QgaW5jcmVhc2UgdGhlIHF1ZXVlIG51bSBhdCB3aWxsLCBzbyB4c2sgc2hhcmVz
IHRoZSBxdWV1ZSB3aXRoCj4gPiA+ID4gPiA+ID4gPiA+IGtlcm5lbC4KPiA+ID4gPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gPiA+ID4gT24gdGhlIG90aGVyIGhhbmQsIFZpcnRpby1OZXQgZG9lcyBu
b3Qgc3VwcG9ydCBnZW5lcmF0ZSBpbnRlcnJ1cHQgZnJvbSBkcml2ZXIKPiA+ID4gPiA+ID4gPiA+
ID4gbWFudWFsbHksIHNvIHdoZW4gd2Ugd2FrZXVwIHR4IHhtaXQsIHdlIHVzZWQgc29tZSB0aXBz
LiBJZiB0aGUgQ1BVIHJ1biBieSBUWAo+ID4gPiA+ID4gPiA+ID4gPiBOQVBJIGxhc3QgdGltZSBp
cyBvdGhlciBDUFVzLCB1c2UgSVBJIHRvIHdha2UgdXAgTkFQSSBvbiB0aGUgcmVtb3RlIENQVS4g
SWYgaXQKPiA+ID4gPiA+ID4gPiA+ID4gaXMgYWxzbyB0aGUgbG9jYWwgQ1BVLCB0aGVuIHdlIHdh
a2UgdXAgbmFwaSBkaXJlY3RseS4KPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4g
VGhpcyBwYXRjaCBzZXQgaW5jbHVkZXMgc29tZSByZWZhY3RvciB0byB0aGUgdmlydGlvLW5ldCB0
byBsZXQgdGhhdCB0byBzdXBwb3J0Cj4gPiA+ID4gPiA+ID4gPiA+IEFGX1hEUC4KPiA+ID4gPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gIyMgcGVyZm9ybWFuY2UKPiA+ID4gPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gPiA+ID4gRU5WOiBRZW11IHdpdGggdmhvc3QtdXNlcihwb2xsaW5nIG1v
ZGUpLgo+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiBTb2NrcGVyZjogaHR0cHM6
Ly9naXRodWIuY29tL01lbGxhbm94L3NvY2twZXJmCj4gPiA+ID4gPiA+ID4gPiA+IEkgdXNlIHRo
aXMgdG9vbCB0byBzZW5kIHVkcCBwYWNrZXQgYnkga2VybmVsIHN5c2NhbGwuCj4gPiA+ID4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+IHhtaXQgY29tbWFuZDogc29ja3BlcmYgdHAgLWkgMTAu
MC4zLjEgLXQgMTAwMAo+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiBJIHdyaXRl
IGEgdG9vbCB0aGF0IHNlbmRzIHVkcCBwYWNrZXRzIG9yIHJlY3ZzIHVkcCBwYWNrZXRzIGJ5IEFG
X1hEUC4KPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAg
ICAgfCBHdWVzdCBBUFAgQ1BVIHxHdWVzdCBTb2Z0aXJxIENQVSB8IFVEUCBQUFMKPiA+ID4gPiA+
ID4gPiA+ID4gLS0tLS0tLS0tLS0tLS0tLS0tfC0tLS0tLS0tLS0tLS0tLXwtLS0tLS0tLS0tLS0t
LS0tLS18LS0tLS0tLS0tLS0tCj4gPiA+ID4gPiA+ID4gPiA+IHhtaXQgYnkgc3lzY2FsbCAgIHwg
ICAxMDAlICAgICAgICB8ICAgICAgICAgICAgICAgICAgfCAgIDY3Niw5MTUKPiA+ID4gPiA+ID4g
PiA+ID4geG1pdCBieSB4c2sgICAgICAgfCAgIDU5LjElICAgICAgIHwgICAxMDAlICAgICAgICAg
ICB8IDUsNDQ3LDE2OAo+ID4gPiA+ID4gPiA+ID4gPiByZWN2IGJ5IHN5c2NhbGwgICB8ICAgNjAl
ICAgICAgICAgfCAgIDEwMCUgICAgICAgICAgIHwgICA5MzIsMjg4Cj4gPiA+ID4gPiA+ID4gPiA+
IHJlY3YgYnkgeHNrICAgICAgIHwgICAzNS43JSAgICAgICB8ICAgMTAwJSAgICAgICAgICAgfCAz
LDM0MywxNjgKPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBBbnkgY2hhbmNlIHdlIGNh
biBnZXQgYSB0ZXN0cG1kIHJlc3VsdCAod2hpY2ggSSBndWVzcyBzaG91bGQgYmUgYmV0dGVyCj4g
PiA+ID4gPiA+ID4gPiB0aGFuIFBQUyBhYm92ZSk/Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
PiBEbyB5b3UgbWVhbiB0ZXN0cG1kICsgRFBESyArIEFGX1hEUD8KPiA+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gWWVzLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gWWVzLiBU
aGlzIGlzIHByb2JhYmx5IGJldHRlciBiZWNhdXNlIG15IHRvb2wgZG9lcyBtb3JlIHdvcmsuIFRo
YXQgaXMgbm90IGEKPiA+ID4gPiA+ID4gPiBjb21wbGV0ZSB0ZXN0aW5nIHRvb2wgdXNlZCBieSBv
dXIgYnVzaW5lc3MuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFByb2JhYmx5LCBidXQgaXQgd291
bGQgYmUgYXBwZWFsaW5nIGZvciBvdGhlcnMuIEVzcGVjaWFsbHkgY29uc2lkZXJpbmcKPiA+ID4g
PiA+ID4gRFBESyBzdXBwb3J0cyBBRl9YRFAgUE1EIG5vdy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBP
Sy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBMZXQgbWUgdHJ5Lgo+ID4gPiA+ID4KPiA+ID4gPiA+IEJ1
dCBjb3VsZCB5b3Ugc3RhcnQgdG8gcmV2aWV3IGZpcnN0bHk/Cj4gPiA+ID4KPiA+ID4gPiBZZXMs
IGl0J3MgaW4gbXkgdG9kbyBsaXN0Lgo+ID4gPgo+ID4gPiBTcGVha2luZyB0b28gZmFzdCwgSSB0
aGluayBpZiBpdCBkb2Vzbid0IHRha2UgdG9vIGxvbmcgdGltZSwgSSB3b3VsZAo+ID4gPiB3YWl0
IGZvciB0aGUgcmVzdWx0IGZpcnN0IGFzIG5ldGRpbSBzZXJpZXMuIE9uZSByZWFzb24gaXMgdGhh
dCBJCj4gPiA+IHJlbWVtYmVyIGNsYWltcyB0byBiZSBvbmx5IDEwJSB0byAyMCUgbG9zcyBjb21w
YXJpbmcgdG8gd2lyZSBzcGVlZCwgc28KPiA+ID4gSSdkIGV4cGVjdCBpdCBzaG91bGQgYmUgbXVj
aCBmYXN0ZXIuIEkgdmFndWVseSByZW1lbWJlciwgZXZlbiBhIHZob3N0Cj4gPiA+IGNhbiBnaXZl
cyB1cyBtb3JlIHRoYW4gM00gUFBTIGlmIHdlIGRpc2FibGUgU01BUCwgc28gdGhlIG51bWJlcnMg
aGVyZQo+ID4gPiBhcmUgbm90IGFzIGltcHJlc3NpdmUgYXMgZXhwZWN0ZWQuCj4gPgo+ID4KPiA+
IFdoYXQgaXMgU01BUD8gQ2xvdWQgeW91IGdpdmUgbWUgbW9yZSBpbmZvPwo+Cj4gU3VwZXJ2aXNv
ciBNb2RlIEFjY2VzcyBQcmV2ZW50aW9uCj4KPiBWaG9zdCBzdWZmZXJzIGZyb20gdGhpcy4KPgo+
ID4KPiA+IFNvIGlmIHdlIHRoaW5rIHRoZSAzTSBhcyB0aGUgd2lyZSBzcGVlZCwgeW91IGV4cGVj
dCB0aGUgcmVzdWx0Cj4gPiBjYW4gcmVhY2ggMi44TSBwcHMvY29yZSwgcmlnaHQ/Cj4KPiBJdCdz
IEFGX1hEUCB0aGF0IGNsYWltcyB0byBiZSA4MCUgaWYgbXkgbWVtb3J5IGlzIGNvcnJlY3QuIFNv
IGEKPiBjb3JyZWN0IEFGX1hEUCBpbXBsZW1lbnRhdGlvbiBzaG91bGQgbm90IHNpdCBiZWhpbmQg
dGhpcyB0b28gbXVjaC4KPgo+ID4gTm93IHRoZSByZWN2IHJlc3VsdCBpcyAyLjVNKDI0NjM2NDYp
IHBwcy9jb3JlLgo+ID4gRG8geW91IHRoaW5rIHRoZXJlIGlzIGEgaHVnZSBnYXA/Cj4KPiBZb3Ug
bmV2ZXIgZGVzY3JpYmUgeW91ciB0ZXN0aW5nIGVudmlyb25tZW50IGluIGRldGFpbHMuIEZvciBl
eGFtcGxlLAo+IGlzIHRoaXMgYSB2aXJ0dWFsIGVudmlyb25tZW50PyBXaGF0J3MgdGhlIENQVSBt
b2RlbCBhbmQgZnJlcXVlbmN5IGV0Yy4KPgo+IEJlY2F1c2UgSSBuZXZlciBzZWUgYSBOSUMgd2hv
c2Ugd2lyZSBzcGVlZCBpcyAzTS4KPgo+ID4KPiA+IE15IHRvb2wgbWFrZXMgdWRwIHBhY2tldCBh
bmQgbG9va3VwIHJvdXRlLCBzbyBpdCB0YWtlIG1vcmUgbXVjaCBjcHUuCj4KPiBUaGF0J3Mgd2h5
IEkgc3VnZ2VzdCB5b3UgdG8gdGVzdCByYXcgUFBTLgoKT0suIExldCdzIGFsaWduIHNvbWUgaW5m
by4KCjEuIE15IHRlc3QgZW52IGlzIHZob3N0LXVzZXIuIFFlbXUgKyB2aG9zdC11c2VyKHBvbGxp
bmcgbW9kZSkuCiAgIEkgZG8gbm90IHVzZSB0aGUgRFBESywgYmVjYXVzZSB0aGF0IHRoZXJlIGlz
IHNvbWUgdHJvdWJsZSBmb3IgbWUuCiAgIEkgdXNlIHRoZSBWQVBQIChodHRwczovL2dpdGh1Yi5j
b20vZmVuZ2lkcmkvdmFwcCkgYXMgdGhlIHZob3N0LXVzZXIgZGV2aWNlLgogICBUaGF0IGhhcyB0
d28gdGhyZWFkcyBhbGwgYXJlIGJ1c3kgbW9kZSBmb3IgdHggYW5kIHJ4LgogICB0eCB0aHJlYWQg
Y29uc3VtZXMgdGhlIHR4IHJpbmcgYW5kIGRyb3AgdGhlIHBhY2tldC4KICAgcnggdGhyZWFkIHB1
dCB0aGUgcGFja2V0IHRvIHRoZSByeCByaW5nLgoKMi4gTXkgSG9zdCBDUFU6IEludGVsKFIpIFhl
b24oUikgUGxhdGludW0gODE2MyBDUFUgQCAyLjUwR0h6CgozLiBGcm9tIHRoaXMgaHR0cDovL2Zh
c3QuZHBkay5vcmcvZG9jL3BlcmYvRFBES18yM18wM19JbnRlbF92aXJ0aW9fcGVyZm9ybWFuY2Vf
cmVwb3J0LnBkZgogICBJIHRoaW5rIHdlIGNhbiBhbGlnbiB0aGF0IHRoZSB2aG9zdCBtYXggc3Bl
ZWQgaXMgOC41IE1QUFMuCiAgIElzIHRoYXQgb2s/CiAgIEFuZCB0aGUgZXhwZWN0ZWQgQUZfWERQ
IHBwcyBpcyBhYm91dCA2IE1QUFMuCgo0LiBBYm91dCB0aGUgcmF3IFBQUywgSSBhZ3JlZSB0aGF0
LiBJIHdpbGwgdGVzdCB3aXRoIHRlc3RwbWQuCgoKVGhhbmtzLgoKCj4KPiBUaGFua3MKPgo+ID4K
PiA+IEkgYW0gY29uZnVzZWQuCj4gPgo+ID4KPiA+IFdoYXQgaXMgU01BUD8gQ291bGQgeW91IGdp
dmUgbWUgbW9yZSBpbmZvcm1hdGlvbj8KPiA+Cj4gPiBTbyBpZiB3ZSB1c2UgM00gYXMgdGhlIHdp
cmUgc3BlZWQsIHlvdSB3b3VsZCBleHBlY3QgdGhlIHJlc3VsdCB0byBiZSAyLjhNCj4gPiBwcHMv
Y29yZSwgcmlnaHQ/Cj4gPgo+ID4gTm93IHRoZSByZWN2IHJlc3VsdCBpcyAyLjVNICgyNDYzNjQ2
ID0gMywzNDMsMTY4LzEuMzU3KSBwcHMvY29yZS4gRG8geW91IHRoaW5rCj4gPiB0aGUgZGlmZmVy
ZW5jZSBpcyBiaWc/Cj4gPgo+ID4gTXkgdG9vbCBtYWtlcyB1ZHAgcGFja2V0cyBhbmQgbG9va3Mg
dXAgcm91dGVzLCBzbyBpdCByZXF1aXJlcyBtb3JlIENQVS4KPiA+Cj4gPiBJJ20gY29uZnVzZWQu
IElzIHRoZXJlIHNvbWV0aGluZyBJIG1pc3VuZGVyc3Rvb2Q/Cj4gPgo+ID4gVGhhbmtzLgo+ID4K
PiA+ID4KPiA+ID4gVGhhbmtzCj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPgo+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gV2hhdCBJIG5vdGljZWQgaXMgdGhh
dCB0aGUgaG90c3BvdCBpcyB0aGUgZHJpdmVyIHdyaXRpbmcgdmlydGlvIGRlc2MuIEJlY2F1c2UK
PiA+ID4gPiA+ID4gPiB0aGUgZGV2aWNlIGlzIGluIGJ1c3kgbW9kZS4gU28gdGhlcmUgaXMgcmFj
ZSBiZXR3ZWVuIGRyaXZlciBhbmQgZGV2aWNlLgo+ID4gPiA+ID4gPiA+IFNvIEkgbW9kaWZpZWQg
dGhlIHZpcnRpbyBjb3JlIGFuZCBsYXppbHkgdXBkYXRlZCBhdmFpbCBpZHguIFRoZW4gcHBzIGNh
biByZWFjaAo+ID4gPiA+ID4gPiA+IDEwLDAwMCwwMDAuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
IENhcmUgdG8gcG9zdCBhIGRyYWZ0IGZvciB0aGlzPwo+ID4gPiA+ID4KPiA+ID4gPiA+IFlFUywg
SSBpcyB0aGlua2luZyBmb3IgdGhpcy4KPiA+ID4gPiA+IEJ1dCBtYXliZSB0aGF0IGlzIGp1c3Qg
d29yayBmb3Igc3BsaXQuIFRoZSBwYWNrZWQgbW9kZSBoYXMgc29tZSB0cm91Ymxlcy4KPiA+ID4g
Pgo+ID4gPiA+IE9rLgo+ID4gPiA+Cj4gPiA+ID4gVGhhbmtzCj4gPiA+ID4KPiA+ID4gPiA+Cj4g
PiA+ID4gPiBUaGFua3MuCj4gPiA+ID4gPgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBUaGFua3MK
PiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IFRoYW5rcy4KPiA+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IFRoYW5rcwo+ID4gPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gIyMgbWFpbnRhaW4KPiA+ID4g
PiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gSSBhbSBjdXJyZW50bHkgYSByZXZpZXdlciBm
b3IgdmlydGlvLW5ldC4gSSBjb21taXQgdG8gbWFpbnRhaW4gQUZfWERQIHN1cHBvcnQgaW4KPiA+
ID4gPiA+ID4gPiA+ID4gdmlydGlvLW5ldC4KPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
PiA+ID4gUGxlYXNlIHJldmlldy4KPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4g
VGhhbmtzLgo+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiB2MToKPiA+ID4gPiA+
ID4gPiA+ID4gICAgIDEuIHJlbW92ZSB0d28gdmlydGlvIGNvbW1pdHMuIFB1c2ggdGhpcyBwYXRj
aHNldCB0byBuZXQtbmV4dAo+ID4gPiA+ID4gPiA+ID4gPiAgICAgMi4gc3F1YXNoICJ2aXJ0aW9f
bmV0OiB2aXJ0bmV0X3BvbGxfdHggc3VwcG9ydCByZXNjaGVkdWxlZCIgdG8geHNrOiBzdXBwb3J0
IHR4Cj4gPiA+ID4gPiA+ID4gPiA+ICAgICAzLiBmaXggc29tZSB3YXJuaW5ncwo+ID4gPiA+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiBYdWFuIFpodW8gKDE5KToKPiA+ID4gPiA+ID4gPiA+
ID4gICB2aXJ0aW9fbmV0OiByZW5hbWUgZnJlZV9vbGRfeG1pdF9za2JzIHRvIGZyZWVfb2xkX3ht
aXQKPiA+ID4gPiA+ID4gPiA+ID4gICB2aXJ0aW9fbmV0OiB1bmlmeSB0aGUgY29kZSBmb3IgcmVj
eWNsaW5nIHRoZSB4bWl0IHB0cgo+ID4gPiA+ID4gPiA+ID4gPiAgIHZpcnRpb19uZXQ6IGluZGVw
ZW5kZW50IGRpcmVjdG9yeQo+ID4gPiA+ID4gPiA+ID4gPiAgIHZpcnRpb19uZXQ6IG1vdmUgdG8g
dmlydGlvX25ldC5oCj4gPiA+ID4gPiA+ID4gPiA+ICAgdmlydGlvX25ldDogYWRkIHByZWZpeCB2
aXJ0bmV0IHRvIGFsbCBzdHJ1Y3QvYXBpIGluc2lkZSB2aXJ0aW9fbmV0LmgKPiA+ID4gPiA+ID4g
PiA+ID4gICB2aXJ0aW9fbmV0OiBzZXBhcmF0ZSB2aXJ0bmV0X3J4X3Jlc2l6ZSgpCj4gPiA+ID4g
PiA+ID4gPiA+ICAgdmlydGlvX25ldDogc2VwYXJhdGUgdmlydG5ldF90eF9yZXNpemUoKQo+ID4g
PiA+ID4gPiA+ID4gPiAgIHZpcnRpb19uZXQ6IHNxIHN1cHBvcnQgcHJlbWFwcGVkIG1vZGUKPiA+
ID4gPiA+ID4gPiA+ID4gICB2aXJ0aW9fbmV0OiB4c2s6IGJpbmQvdW5iaW5kIHhzawo+ID4gPiA+
ID4gPiA+ID4gPiAgIHZpcnRpb19uZXQ6IHhzazogcHJldmVudCBkaXNhYmxlIHR4IG5hcGkKPiA+
ID4gPiA+ID4gPiA+ID4gICB2aXJ0aW9fbmV0OiB4c2s6IHR4OiBzdXBwb3J0IHR4Cj4gPiA+ID4g
PiA+ID4gPiA+ICAgdmlydGlvX25ldDogeHNrOiB0eDogc3VwcG9ydCB3YWtldXAKPiA+ID4gPiA+
ID4gPiA+ID4gICB2aXJ0aW9fbmV0OiB4c2s6IHR4OiB2aXJ0bmV0X2ZyZWVfb2xkX3htaXQoKSBk
aXN0aW5ndWlzaGVzIHhzayBidWZmZXIKPiA+ID4gPiA+ID4gPiA+ID4gICB2aXJ0aW9fbmV0OiB4
c2s6IHR4OiB2aXJ0bmV0X3NxX2ZyZWVfdW51c2VkX2J1ZigpIGNoZWNrIHhzayBidWZmZXIKPiA+
ID4gPiA+ID4gPiA+ID4gICB2aXJ0aW9fbmV0OiB4c2s6IHJ4OiBpbnRyb2R1Y2UgYWRkX3JlY3Zi
dWZfeHNrKCkKPiA+ID4gPiA+ID4gPiA+ID4gICB2aXJ0aW9fbmV0OiB4c2s6IHJ4OiBpbnRyb2R1
Y2UgcmVjZWl2ZV94c2soKSB0byByZWN2IHhzayBidWZmZXIKPiA+ID4gPiA+ID4gPiA+ID4gICB2
aXJ0aW9fbmV0OiB4c2s6IHJ4OiB2aXJ0bmV0X3JxX2ZyZWVfdW51c2VkX2J1ZigpIGNoZWNrIHhz
ayBidWZmZXIKPiA+ID4gPiA+ID4gPiA+ID4gICB2aXJ0aW9fbmV0OiB1cGRhdGUgdHggdGltZW91
dCByZWNvcmQKPiA+ID4gPiA+ID4gPiA+ID4gICB2aXJ0aW9fbmV0OiB4ZHBfZmVhdHVyZXMgYWRk
IE5FVERFVl9YRFBfQUNUX1hTS19aRVJPQ09QWQo+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiA+ID4gPiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAg
MiArLQo+ID4gPiA+ID4gPiA+ID4gPiAgZHJpdmVycy9uZXQvS2NvbmZpZyAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgOCArLQo+ID4gPiA+ID4gPiA+ID4gPiAgZHJpdmVycy9uZXQvTWFrZWZp
bGUgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQo+ID4gPiA+ID4gPiA+ID4gPiAgZHJp
dmVycy9uZXQvdmlydGlvL0tjb25maWcgICAgICAgICAgICAgICAgICB8ICAxMyArCj4gPiA+ID4g
PiA+ID4gPiA+ICBkcml2ZXJzL25ldC92aXJ0aW8vTWFrZWZpbGUgICAgICAgICAgICAgICAgIHwg
ICA4ICsKPiA+ID4gPiA+ID4gPiA+ID4gIGRyaXZlcnMvbmV0L3t2aXJ0aW9fbmV0LmMgPT4gdmly
dGlvL21haW4uY30gfCA2NTIgKysrKysrKysrLS0tLS0tLS0tLS0KPiA+ID4gPiA+ID4gPiA+ID4g
IGRyaXZlcnMvbmV0L3ZpcnRpby92aXJ0aW9fbmV0LmggICAgICAgICAgICAgfCAzNTkgKysrKysr
KysrKysKPiA+ID4gPiA+ID4gPiA+ID4gIGRyaXZlcnMvbmV0L3ZpcnRpby94c2suYyAgICAgICAg
ICAgICAgICAgICAgfCA1NDUgKysrKysrKysrKysrKysrKwo+ID4gPiA+ID4gPiA+ID4gPiAgZHJp
dmVycy9uZXQvdmlydGlvL3hzay5oICAgICAgICAgICAgICAgICAgICB8ICAzMiArCj4gPiA+ID4g
PiA+ID4gPiA+ICA5IGZpbGVzIGNoYW5nZWQsIDEyNDcgaW5zZXJ0aW9ucygrKSwgMzc0IGRlbGV0
aW9ucygtKQo+ID4gPiA+ID4gPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbmV0
L3ZpcnRpby9LY29uZmlnCj4gPiA+ID4gPiA+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9uZXQvdmlydGlvL01ha2VmaWxlCj4gPiA+ID4gPiA+ID4gPiA+ICByZW5hbWUgZHJpdmVy
cy9uZXQve3ZpcnRpb19uZXQuYyA9PiB2aXJ0aW8vbWFpbi5jfSAoOTElKQo+ID4gPiA+ID4gPiA+
ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbmV0L3ZpcnRpby92aXJ0aW9fbmV0LmgK
PiA+ID4gPiA+ID4gPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL25ldC92aXJ0aW8v
eHNrLmMKPiA+ID4gPiA+ID4gPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL25ldC92
aXJ0aW8veHNrLmgKPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gLS0KPiA+ID4g
PiA+ID4gPiA+ID4gMi4zMi4wLjMuZzAxMTk1Y2Y5Zgo+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4KPiA+Cj4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6
YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24u
b3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3Zp
cnR1YWxpemF0aW9u
