Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1B675019E
	for <lists.virtualization@lfdr.de>; Wed, 12 Jul 2023 10:33:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 136D740142;
	Wed, 12 Jul 2023 08:33:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 136D740142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8an7diQ3rATB; Wed, 12 Jul 2023 08:33:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id EE218403E9;
	Wed, 12 Jul 2023 08:33:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE218403E9
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5C8A7C0032;
	Wed, 12 Jul 2023 08:33:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 339EBC0DD5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Jul 2023 08:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDF6E81414
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Jul 2023 08:33:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDF6E81414
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nZ4le5lRVcnv
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Jul 2023 08:33:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14214813EE
Received: from out30-113.freemail.mail.aliyun.com
 (out30-113.freemail.mail.aliyun.com [115.124.30.113])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 14214813EE
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Jul 2023 08:33:32 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=15; SR=0;
 TI=SMTPD_---0VnCC9Xk_1689150802; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VnCC9Xk_1689150802) by smtp.aliyun-inc.com;
 Wed, 12 Jul 2023 16:33:23 +0800
Message-ID: <1689150730.075546-2-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH vhost v11 10/10] virtio_net: merge dma operation for one
 page
Date: Wed, 12 Jul 2023 16:32:10 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
References: <20230710034237.12391-1-xuanzhuo@linux.alibaba.com>
 <20230710034237.12391-11-xuanzhuo@linux.alibaba.com>
 <20230710051818-mutt-send-email-mst@kernel.org>
 <1688984310.480753-2-xuanzhuo@linux.alibaba.com>
 <20230710075534-mutt-send-email-mst@kernel.org>
 <1688992712.1534917-3-xuanzhuo@linux.alibaba.com>
 <CACGkMEsp0S2APzXENcK-SY8KZwu-1=w3xXNxh5kXT36EsiwaNQ@mail.gmail.com>
 <1689043238.4362252-1-xuanzhuo@linux.alibaba.com>
 <CACGkMEvT+o4kHSMY5_8PXFMGP3YEJkmLe3fuZ2GuektTmtLE5A@mail.gmail.com>
 <1689148498.6023948-1-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1689148498.6023948-1-xuanzhuo@linux.alibaba.com>
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, virtualization@lists.linux-foundation.org,
 Christoph Hellwig <hch@infradead.org>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
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

T24gV2VkLCAxMiBKdWwgMjAyMyAxNTo1NDo1OCArMDgwMCwgWHVhbiBaaHVvIDx4dWFuemh1b0Bs
aW51eC5hbGliYWJhLmNvbT4gd3JvdGU6Cj4gT24gVHVlLCAxMSBKdWwgMjAyMyAxMDo1ODo1MSAr
MDgwMCwgSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiBPbiBUdWUs
IEp1bCAxMSwgMjAyMyBhdCAxMDo0MuKAr0FNIFh1YW4gWmh1byA8eHVhbnpodW9AbGludXguYWxp
YmFiYS5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBUdWUsIDExIEp1bCAyMDIzIDEwOjM2OjE3
ICswODAwLCBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPiB3cm90ZToKPiA+ID4gPiBP
biBNb24sIEp1bCAxMCwgMjAyMyBhdCA4OjQx4oCvUE0gWHVhbiBaaHVvIDx4dWFuemh1b0BsaW51
eC5hbGliYWJhLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gT24gTW9uLCAxMCBKdWwg
MjAyMyAwNzo1OTowMyAtMDQwMCwgIk1pY2hhZWwgUy4gVHNpcmtpbiIgPG1zdEByZWRoYXQuY29t
PiB3cm90ZToKPiA+ID4gPiA+ID4gT24gTW9uLCBKdWwgMTAsIDIwMjMgYXQgMDY6MTg6MzBQTSAr
MDgwMCwgWHVhbiBaaHVvIHdyb3RlOgo+ID4gPiA+ID4gPiA+IE9uIE1vbiwgMTAgSnVsIDIwMjMg
MDU6NDA6MjEgLTA0MDAsICJNaWNoYWVsIFMuIFRzaXJraW4iIDxtc3RAcmVkaGF0LmNvbT4gd3Jv
dGU6Cj4gPiA+ID4gPiA+ID4gPiBPbiBNb24sIEp1bCAxMCwgMjAyMyBhdCAxMTo0MjozN0FNICsw
ODAwLCBYdWFuIFpodW8gd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPiA+IEN1cnJlbnRseSwgdGhlIHZp
cnRpbyBjb3JlIHdpbGwgcGVyZm9ybSBhIGRtYSBvcGVyYXRpb24gZm9yIGVhY2gKPiA+ID4gPiA+
ID4gPiA+ID4gb3BlcmF0aW9uLiBBbHRob3VnaCwgdGhlIHNhbWUgcGFnZSBtYXkgYmUgb3BlcmF0
ZWQgbXVsdGlwbGUgdGltZXMuCj4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+IFRo
ZSBkcml2ZXIgZG9lcyB0aGUgZG1hIG9wZXJhdGlvbiBhbmQgbWFuYWdlcyB0aGUgZG1hIGFkZHJl
c3MgYmFzZWQgdGhlCj4gPiA+ID4gPiA+ID4gPiA+IGZlYXR1cmUgcHJlbWFwcGVkIG9mIHZpcnRp
byBjb3JlLgo+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiBUaGlzIHdheSwgd2Ug
Y2FuIHBlcmZvcm0gb25seSBvbmUgZG1hIG9wZXJhdGlvbiBmb3IgdGhlIHNhbWUgcGFnZS4gSW4K
PiA+ID4gPiA+ID4gPiA+ID4gdGhlIGNhc2Ugb2YgbXR1IDE1MDAsIHRoaXMgY2FuIHJlZHVjZSBh
IGxvdCBvZiBkbWEgb3BlcmF0aW9ucy4KPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+
ID4gVGVzdGVkIG9uIEFsaXl1biBnNy40bGFyZ2UgbWFjaGluZSwgaW4gdGhlIGNhc2Ugb2YgYSBj
cHUgMTAwJSwgcHBzCj4gPiA+ID4gPiA+ID4gPiA+IGluY3JlYXNlZCBmcm9tIDE4OTM3NjYgdG8g
MTkwMTEwNS4gQW4gaW5jcmVhc2Ugb2YgMC40JS4KPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
ID4gPiB3aGF0IGtpbmQgb2YgZG1hIHdhcyB0aGVyZT8gYW4gSU9NTVU/IHdoaWNoIHZlbmRvcnM/
IGluIHdoaWNoIG1vZGUKPiA+ID4gPiA+ID4gPiA+IG9mIG9wZXJhdGlvbj8KPiA+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gRG8geW91IG1lYW4gdGhpczoKPiA+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiA+IFsgICAgMC40NzA4MTZdIGlvbW11OiBEZWZhdWx0IGRvbWFpbiB0
eXBlOiBQYXNzdGhyb3VnaAo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFdp
dGggcGFzc3Rocm91Z2gsIGRtYSBBUEkgaXMganVzdCBzb21lIGluZGlyZWN0IGZ1bmN0aW9uIGNh
bGxzLCB0aGV5IGRvCj4gPiA+ID4gPiA+IG5vdCBhZmZlY3QgdGhlIHBlcmZvcm1hbmNlIGEgbG90
Lgo+ID4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBZZXMsIHRoaXMgYmVuZWZpdCBpcyB3b3J0
aGxlc3MuIEkgc2VlbSB0byBoYXZlIGRvbmUgYSBtZWFuaW5nbGVzcyB0aGluZy4gVGhlCj4gPiA+
ID4gPiBvdmVyaGVhZCBvZiBETUEgSSBvYnNlcnZlZCBpcyBpbmRlZWQgbm90IHRvbyBoaWdoLgo+
ID4gPiA+Cj4gPiA+ID4gSGF2ZSB5b3UgbWVhc3VyZWQgd2l0aCBpb21tdT1zdHJpY3Q/Cj4gPiA+
Cj4gPiA+IEkgaGF2ZSBub3QgdGVzdGVkIHRoaXMgd2F5LCBvdXIgZW52aXJvbm1lbnQgaXMgcHQs
IEkgd29uZGVyIGlmIHN0cmljdCBpcyBhCj4gPiA+IGNvbW1vbiBzY2VuYXJpby4gSSBjYW4gdGVz
dCBpdC4KPiA+Cj4gPiBJdCdzIG5vdCBhIGNvbW1vbiBzZXR1cCwgYnV0IGl0J3MgYSB3YXkgdG8g
c3RyZXNzIERNQSBsYXllciB0byBzZWUgdGhlIG92ZXJoZWFkLgo+Cj4ga2VybmVsIGNvbW1hbmQg
bGluZTogaW50ZWxfaW9tbXU9b24gaW9tbXUuc3RyaWN0PTEgaW9tbXUucGFzc3Rocm91Z2g9MAo+
Cj4gdmlydGlvLW5ldCB3aXRob3V0IG1lcmdlIGRtYSA0Mjg2MTQuMDAgcHBzCj4KPiB2aXJ0aW8t
bmV0IHdpdGggbWVyZ2UgZG1hICAgIDc0Mjg1My4wMCBwcHMKCgprZXJuZWwgY29tbWFuZCBsaW5l
OiBpbnRlbF9pb21tdT1vbiBpb21tdS5zdHJpY3Q9MCBpb21tdS5wYXNzdGhyb3VnaD0wCgp2aXJ0
aW8tbmV0IHdpdGhvdXQgbWVyZ2UgZG1hIDc3NTQ5Ni4wMCBwcHMKCnZpcnRpby1uZXQgd2l0aCBt
ZXJnZSBkbWEgICAgMTAxMDUxNC4wMCBwcHMKCgpUaGFua3MuCgo+Cj4KPiBUaGFua3MuCj4KPgo+
Cj4KPiA+Cj4gPiBUaGFua3MKPiA+Cj4gPiA+Cj4gPiA+IFRoYW5rcy4KPiA+ID4KPiA+ID4KPiA+
ID4gPgo+ID4gPiA+IFRoYW5rcwo+ID4gPiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhhbmtzLgo+
ID4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFRyeSBlLmcuIGJvdW5j
ZSBidWZmZXIuIFdoaWNoIGlzIHdoZXJlIHlvdSB3aWxsIHNlZSBhIHByb2JsZW06IHlvdXIKPiA+
ID4gPiA+ID4gcGF0Y2hlcyB3b24ndCB3b3JrLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogWHVhbiBaaHVvIDx4
dWFuemh1b0BsaW51eC5hbGliYWJhLmNvbT4KPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4g
PiBUaGlzIGtpbmQgb2YgZGlmZmVyZW5jZSBpcyBsaWtlbHkgaW4gdGhlIG5vaXNlLgo+ID4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+ID4gSXQncyByZWFsbHkgbm90IGhpZ2gsIGJ1dCB0aGlzIGlzIGJl
Y2F1c2UgdGhlIHByb3BvcnRpb24gb2YgRE1BIHVuZGVyIHBlcmYgdG9wCj4gPiA+ID4gPiA+ID4g
aXMgbm90IGhpZ2guIFByb2JhYmx5IHRoYXQgbXVjaC4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
U28gbWF5YmUgbm90IHdvcnRoIHRoZSBjb21wbGV4aXR5Lgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiA+ID4KPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gPiA+
ID4gPiAgZHJpdmVycy9uZXQvdmlydGlvX25ldC5jIHwgMjgzICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0tLQo+ID4gPiA+ID4gPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDI2
NyBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3ZpcnRpb19uZXQuYyBiL2RyaXZl
cnMvbmV0L3ZpcnRpb19uZXQuYwo+ID4gPiA+ID4gPiA+ID4gPiBpbmRleCA0ODZiNTg0OTAzM2Qu
LjRkZTg0NWQzNWJlZCAxMDA2NDQKPiA+ID4gPiA+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9uZXQv
dmlydGlvX25ldC5jCj4gPiA+ID4gPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvbmV0L3ZpcnRpb19u
ZXQuYwo+ID4gPiA+ID4gPiA+ID4gPiBAQCAtMTI2LDYgKzEyNiwyNyBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IHZpcnRuZXRfc3RhdF9kZXNjIHZpcnRuZXRfcnFfc3RhdHNfZGVzY1tdID0gewo+ID4g
PiA+ID4gPiA+ID4gPiAgI2RlZmluZSBWSVJUTkVUX1NRX1NUQVRTX0xFTiAgIEFSUkFZX1NJWkUo
dmlydG5ldF9zcV9zdGF0c19kZXNjKQo+ID4gPiA+ID4gPiA+ID4gPiAgI2RlZmluZSBWSVJUTkVU
X1JRX1NUQVRTX0xFTiAgIEFSUkFZX1NJWkUodmlydG5ldF9ycV9zdGF0c19kZXNjKQo+ID4gPiA+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiArLyogVGhlIGJ1ZnMgb24gdGhlIHNhbWUgcGFn
ZSBtYXkgc2hhcmUgdGhpcyBzdHJ1Y3QuICovCj4gPiA+ID4gPiA+ID4gPiA+ICtzdHJ1Y3Qgdmly
dG5ldF9ycV9kbWEgewo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgIHN0cnVjdCB2aXJ0bmV0X3Jx
X2RtYSAqbmV4dDsKPiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAg
IGRtYV9hZGRyX3QgYWRkcjsKPiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gPiAr
ICAgICAgIHZvaWQgKmJ1ZjsKPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICB1MzIgbGVuOwo+ID4g
PiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgdTMyIHJlZjsKPiA+ID4g
PiA+ID4gPiA+ID4gK307Cj4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ID4gKy8q
IFJlY29yZCB0aGUgZG1hIGFuZCBidWYuICovCj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+
ID4gSSBndWVzcyBJIHNlZSB0aGF0LiBCdXQgd2h5Pwo+ID4gPiA+ID4gPiA+ID4gQW5kIHRoZXNl
IHR3byBjb21tZW50cyBhcmUgdGhlIGV4dGVudCBvZiB0aGUgYXZhaWxhYmxlCj4gPiA+ID4gPiA+
ID4gPiBkb2N1bWVudGF0aW9uLCB0aGF0J3Mgbm90IGVub3VnaCBJIGZlZWwuCj4gPiA+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gK3N0cnVjdCB2aXJ0bmV0X3Jx
X2RhdGEgewo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgIHN0cnVjdCB2aXJ0bmV0X3JxX2RhdGEg
Km5leHQ7Cj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gSXMgbWFudWFsbHkgcmVpbXBs
ZW1lbnRpbmcgYSBsaW5rZWQgbGlzdCB0aGUgYmVzdAo+ID4gPiA+ID4gPiA+ID4gd2UgY2FuIGRv
Pwo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gWWVzLCB3ZSBjYW4gdXNlIGxsaXN0Lgo+ID4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+
ID4gPiA+ICsgICAgICAgdm9pZCAqYnVmOwo+ID4gPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+
ID4gPiA+ICsgICAgICAgc3RydWN0IHZpcnRuZXRfcnFfZG1hICpkbWE7Cj4gPiA+ID4gPiA+ID4g
PiA+ICt9Owo+ID4gPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gPiA+ICAvKiBJbnRlcm5h
bCByZXByZXNlbnRhdGlvbiBvZiBhIHNlbmQgdmlydHF1ZXVlICovCj4gPiA+ID4gPiA+ID4gPiA+
ICBzdHJ1Y3Qgc2VuZF9xdWV1ZSB7Cj4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgLyogVmlydHF1
ZXVlIGFzc29jaWF0ZWQgd2l0aCB0aGlzIHNlbmQgX3F1ZXVlICovCj4gPiA+ID4gPiA+ID4gPiA+
IEBAIC0xNzUsNiArMTk2LDEzIEBAIHN0cnVjdCByZWNlaXZlX3F1ZXVlIHsKPiA+ID4gPiA+ID4g
PiA+ID4gICAgICAgICBjaGFyIG5hbWVbMTZdOwo+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiA+ID4gPiAgICAgICAgIHN0cnVjdCB4ZHBfcnhxX2luZm8geGRwX3J4cTsKPiA+ID4gPiA+ID4g
PiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgIHN0cnVjdCB2aXJ0bmV0X3JxX2RhdGEg
KmRhdGFfYXJyYXk7Cj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgc3RydWN0IHZpcnRuZXRfcnFf
ZGF0YSAqZGF0YV9mcmVlOwo+ID4gPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gPiA+ICsg
ICAgICAgc3RydWN0IHZpcnRuZXRfcnFfZG1hICpkbWFfYXJyYXk7Cj4gPiA+ID4gPiA+ID4gPiA+
ICsgICAgICAgc3RydWN0IHZpcnRuZXRfcnFfZG1hICpkbWFfZnJlZTsKPiA+ID4gPiA+ID4gPiA+
ID4gKyAgICAgICBzdHJ1Y3QgdmlydG5ldF9ycV9kbWEgKmxhc3RfZG1hOwo+ID4gPiA+ID4gPiA+
ID4gPiAgfTsKPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gIC8qIFRoaXMgc3Ry
dWN0dXJlIGNhbiBjb250YWluIHJzcyBtZXNzYWdlIHdpdGggbWF4aW11bSBzZXR0aW5ncyBmb3Ig
aW5kaXJlY3Rpb24gdGFibGUgYW5kIGtleXNpemUKPiA+ID4gPiA+ID4gPiA+ID4gQEAgLTU0OSw2
ICs1NzcsMTc2IEBAIHN0YXRpYyBzdHJ1Y3Qgc2tfYnVmZiAqcGFnZV90b19za2Ioc3RydWN0IHZp
cnRuZXRfaW5mbyAqdmksCj4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgcmV0dXJuIHNrYjsKPiA+
ID4gPiA+ID4gPiA+ID4gIH0KPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gK3N0
YXRpYyB2b2lkIHZpcnRuZXRfcnFfdW5tYXAoc3RydWN0IHJlY2VpdmVfcXVldWUgKnJxLCBzdHJ1
Y3QgdmlydG5ldF9ycV9kbWEgKmRtYSkKPiA+ID4gPiA+ID4gPiA+ID4gK3sKPiA+ID4gPiA+ID4g
PiA+ID4gKyAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXY7Cj4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+
ID4gPiA+ID4gPiA+ID4gKyAgICAgICAtLWRtYS0+cmVmOwo+ID4gPiA+ID4gPiA+ID4gPiArCj4g
PiA+ID4gPiA+ID4gPiA+ICsgICAgICAgaWYgKGRtYS0+cmVmKQo+ID4gPiA+ID4gPiA+ID4gPiAr
ICAgICAgICAgICAgICAgcmV0dXJuOwo+ID4gPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiA+ID4gSWYgeW91IGRvbid0IHVubWFwIHRoZXJlIGlzIG5vIGd1YXJhbnRl
ZSB2YWxpZCBkYXRhIHdpbGwgYmUKPiA+ID4gPiA+ID4gPiA+IHRoZXJlIGluIHRoZSBidWZmZXIu
Cj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgIGRldiA9IHZpcnRxdWV1
ZV9kbWFfZGV2KHJxLT52cSk7Cj4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ID4g
KyAgICAgICBkbWFfdW5tYXBfcGFnZShkZXYsIGRtYS0+YWRkciwgZG1hLT5sZW4sIERNQV9GUk9N
X0RFVklDRSk7Cj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+
Cj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4g
PiA+ID4gPiA+ID4gPiArICAgICAgIGRtYS0+bmV4dCA9IHJxLT5kbWFfZnJlZTsKPiA+ID4gPiA+
ID4gPiA+ID4gKyAgICAgICBycS0+ZG1hX2ZyZWUgPSBkbWE7Cj4gPiA+ID4gPiA+ID4gPiA+ICt9
Cj4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ID4gK3N0YXRpYyB2b2lkICp2aXJ0
bmV0X3JxX3JlY3ljbGVfZGF0YShzdHJ1Y3QgcmVjZWl2ZV9xdWV1ZSAqcnEsCj4gPiA+ID4gPiA+
ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgdmlydG5l
dF9ycV9kYXRhICpkYXRhKQo+ID4gPiA+ID4gPiA+ID4gPiArewo+ID4gPiA+ID4gPiA+ID4gPiAr
ICAgICAgIHZvaWQgKmJ1ZjsKPiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gPiAr
ICAgICAgIGJ1ZiA9IGRhdGEtPmJ1ZjsKPiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+
ID4gPiArICAgICAgIGRhdGEtPm5leHQgPSBycS0+ZGF0YV9mcmVlOwo+ID4gPiA+ID4gPiA+ID4g
PiArICAgICAgIHJxLT5kYXRhX2ZyZWUgPSBkYXRhOwo+ID4gPiA+ID4gPiA+ID4gPiArCj4gPiA+
ID4gPiA+ID4gPiA+ICsgICAgICAgcmV0dXJuIGJ1ZjsKPiA+ID4gPiA+ID4gPiA+ID4gK30KPiA+
ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gPiArc3RhdGljIHN0cnVjdCB2aXJ0bmV0
X3JxX2RhdGEgKnZpcnRuZXRfcnFfZ2V0X2RhdGEoc3RydWN0IHJlY2VpdmVfcXVldWUgKnJxLAo+
ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB2b2lkICpidWYsCj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2aXJ0bmV0X3JxX2RtYSAq
ZG1hKQo+ID4gPiA+ID4gPiA+ID4gPiArewo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgIHN0cnVj
dCB2aXJ0bmV0X3JxX2RhdGEgKmRhdGE7Cj4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4g
PiA+ID4gKyAgICAgICBkYXRhID0gcnEtPmRhdGFfZnJlZTsKPiA+ID4gPiA+ID4gPiA+ID4gKyAg
ICAgICBycS0+ZGF0YV9mcmVlID0gZGF0YS0+bmV4dDsKPiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4g
PiA+ID4gPiA+ID4gPiArICAgICAgIGRhdGEtPmJ1ZiA9IGJ1ZjsKPiA+ID4gPiA+ID4gPiA+ID4g
KyAgICAgICBkYXRhLT5kbWEgPSBkbWE7Cj4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4g
PiA+ID4gKyAgICAgICByZXR1cm4gZGF0YTsKPiA+ID4gPiA+ID4gPiA+ID4gK30KPiA+ID4gPiA+
ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gPiArc3RhdGljIHZvaWQgKnZpcnRuZXRfcnFfZ2V0
X2J1ZihzdHJ1Y3QgcmVjZWl2ZV9xdWV1ZSAqcnEsIHUzMiAqbGVuLCB2b2lkICoqY3R4KQo+ID4g
PiA+ID4gPiA+ID4gPiArewo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgIHN0cnVjdCB2aXJ0bmV0
X3JxX2RhdGEgKmRhdGE7Cj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgdm9pZCAqYnVmOwo+ID4g
PiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgYnVmID0gdmlydHF1ZXVl
X2dldF9idWZfY3R4KHJxLT52cSwgbGVuLCBjdHgpOwo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAg
IGlmICghYnVmIHx8ICFycS0+ZGF0YV9hcnJheSkKPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAg
ICAgICAgIHJldHVybiBidWY7Cj4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ID4g
KyAgICAgICBkYXRhID0gYnVmOwo+ID4gPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gPiA+
ICsgICAgICAgdmlydG5ldF9ycV91bm1hcChycSwgZGF0YS0+ZG1hKTsKPiA+ID4gPiA+ID4gPiA+
ID4gKwo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgIHJldHVybiB2aXJ0bmV0X3JxX3JlY3ljbGVf
ZGF0YShycSwgZGF0YSk7Cj4gPiA+ID4gPiA+ID4gPiA+ICt9Cj4gPiA+ID4gPiA+ID4gPiA+ICsK
PiA+ID4gPiA+ID4gPiA+ID4gK3N0YXRpYyB2b2lkICp2aXJ0bmV0X3JxX2RldGFjaF91bnVzZWRf
YnVmKHN0cnVjdCByZWNlaXZlX3F1ZXVlICpycSkKPiA+ID4gPiA+ID4gPiA+ID4gK3sKPiA+ID4g
PiA+ID4gPiA+ID4gKyAgICAgICBzdHJ1Y3QgdmlydG5ldF9ycV9kYXRhICpkYXRhOwo+ID4gPiA+
ID4gPiA+ID4gPiArICAgICAgIHZvaWQgKmJ1ZjsKPiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+
ID4gPiA+ID4gPiArICAgICAgIGJ1ZiA9IHZpcnRxdWV1ZV9kZXRhY2hfdW51c2VkX2J1ZihycS0+
dnEpOwo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgIGlmICghYnVmIHx8ICFycS0+ZGF0YV9hcnJh
eSkKPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBidWY7Cj4gPiA+ID4g
PiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICBkYXRhID0gYnVmOwo+ID4gPiA+
ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgdmlydG5ldF9ycV91bm1hcChy
cSwgZGF0YS0+ZG1hKTsKPiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gPiArICAg
ICAgIHJldHVybiB2aXJ0bmV0X3JxX3JlY3ljbGVfZGF0YShycSwgZGF0YSk7Cj4gPiA+ID4gPiA+
ID4gPiA+ICt9Cj4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ID4gK3N0YXRpYyBp
bnQgdmlydG5ldF9ycV9tYXBfc2coc3RydWN0IHJlY2VpdmVfcXVldWUgKnJxLCB2b2lkICpidWYs
IHUzMiBsZW4pCj4gPiA+ID4gPiA+ID4gPiA+ICt7Cj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAg
c3RydWN0IHZpcnRuZXRfcnFfZG1hICpkbWEgPSBycS0+bGFzdF9kbWE7Cj4gPiA+ID4gPiA+ID4g
PiA+ICsgICAgICAgc3RydWN0IGRldmljZSAqZGV2Owo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAg
IHUzMiBvZmYsIG1hcF9sZW47Cj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgZG1hX2FkZHJfdCBh
ZGRyOwo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgIHZvaWQgKmVuZDsKPiA+ID4gPiA+ID4gPiA+
ID4gKwo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgIGlmIChsaWtlbHkoZG1hKSAmJiBidWYgPj0g
ZG1hLT5idWYgJiYgKGJ1ZiArIGxlbiA8PSBkbWEtPmJ1ZiArIGRtYS0+bGVuKSkgewo+ID4gPiA+
ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgKytkbWEtPnJlZjsKPiA+ID4gPiA+ID4gPiA+ID4g
KyAgICAgICAgICAgICAgIGFkZHIgPSBkbWEtPmFkZHIgKyAoYnVmIC0gZG1hLT5idWYpOwo+ID4g
PiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgZ290byBvazsKPiA+ID4gPiA+ID4gPiA+ID4g
KyAgICAgICB9Cj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gU28gdGhpcyBpcyB0aGUg
bWVhdCBvZiB0aGUgcHJvcG9zZWQgb3B0aW1pemF0aW9uLiBJIGd1ZXNzIHRoYXQKPiA+ID4gPiA+
ID4gPiA+IGlmIHRoZSBsYXN0IGJ1ZmZlciB3ZSBhbGxvY2F0ZWQgaGFwcGVucyB0byBiZSBpbiB0
aGUgc2FtZSBwYWdlCj4gPiA+ID4gPiA+ID4gPiBhcyB0aGlzIG9uZSB0aGVuIHRoZXkgY2FuIGJv
dGggYmUgbWFwcGVkIGZvciBETUEgdG9nZXRoZXIuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
PiBTaW5jZSB3ZSB1c2UgcGFnZV9mcmFnLCB0aGUgYnVmZmVycyB3ZSBhbGxvY2F0ZWQgYXJlIGFs
bCBjb250aW51b3VzLgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBXaHkgbGFzdCBvbmUg
c3BlY2lmaWNhbGx5PyBXaGV0aGVyIG5leHQgb25lIGhhcHBlbnMgdG8KPiA+ID4gPiA+ID4gPiA+
IGJlIGNsb3NlIGRlcGVuZHMgb24gbHVjay4gSWYgeW91IHdhbnQgdG8gdHJ5IG9wdGltaXppbmcg
dGhpcwo+ID4gPiA+ID4gPiA+ID4gdGhlIHJpZ2h0IHRoaW5nIHRvIGRvIGlzIGxpa2VseSBieSB1
c2luZyBhIHBhZ2UgcG9vbC4KPiA+ID4gPiA+ID4gPiA+IFRoZXJlJ3MgYWN0dWFsbHkgd29yayB1
cHN0cmVhbSBvbiBwYWdlIHBvb2wsIGxvb2sgaXQgdXAuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gPiBBcyB3ZSBkaXNjdXNzZWQgaW4gYW5vdGhlciB0aHJlYWQsIHRoZSBwYWdlIHBvb2wgaXMg
Zmlyc3QgdXNlZCBmb3IgeGRwLiBMZXQncwo+ID4gPiA+ID4gPiA+IHRyYW5zZm9ybSBpdCBzdGVw
IGJ5IHN0ZXAuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBUaGFua3MuCj4gPiA+ID4gPiA+
Cj4gPiA+ID4gPiA+IG9rIHNvIHRoaXMgc2hvdWxkIHdhaXQgdGhlbj8KPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAg
ICBlbmQgPSBidWYgKyBsZW4gLSAxOwo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgIG9mZiA9IG9m
ZnNldF9pbl9wYWdlKGVuZCk7Cj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgbWFwX2xlbiA9IGxl
biArIFBBR0VfU0laRSAtIG9mZjsKPiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4g
PiArICAgICAgIGRldiA9IHZpcnRxdWV1ZV9kbWFfZGV2KHJxLT52cSk7Cj4gPiA+ID4gPiA+ID4g
PiA+ICsKPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICBhZGRyID0gZG1hX21hcF9wYWdlX2F0dHJz
KGRldiwgdmlydF90b19wYWdlKGJ1ZiksIG9mZnNldF9pbl9wYWdlKGJ1ZiksCj4gPiA+ID4gPiA+
ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYXBfbGVuLCBETUFfRlJP
TV9ERVZJQ0UsIDApOwo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgIGlmIChhZGRyID09IERNQV9N
QVBQSU5HX0VSUk9SKQo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgcmV0dXJuIC1F
Tk9NRU07Cj4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICBkbWEg
PSBycS0+ZG1hX2ZyZWU7Cj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgcnEtPmRtYV9mcmVlID0g
ZG1hLT5uZXh0Owo+ID4gPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAg
ZG1hLT5yZWYgPSAxOwo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgIGRtYS0+YnVmID0gYnVmOwo+
ID4gPiA+ID4gPiA+ID4gPiArICAgICAgIGRtYS0+YWRkciA9IGFkZHI7Cj4gPiA+ID4gPiA+ID4g
PiA+ICsgICAgICAgZG1hLT5sZW4gPSBtYXBfbGVuOwo+ID4gPiA+ID4gPiA+ID4gPiArCj4gPiA+
ID4gPiA+ID4gPiA+ICsgICAgICAgcnEtPmxhc3RfZG1hID0gZG1hOwo+ID4gPiA+ID4gPiA+ID4g
PiArCj4gPiA+ID4gPiA+ID4gPiA+ICtvazoKPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICBzZ19p
bml0X3RhYmxlKHJxLT5zZywgMSk7Cj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgcnEtPnNnWzBd
LmRtYV9hZGRyZXNzID0gYWRkcjsKPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICBycS0+c2dbMF0u
bGVuZ3RoID0gbGVuOwo+ID4gPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gPiA+ICsgICAg
ICAgcmV0dXJuIDA7Cj4gPiA+ID4gPiA+ID4gPiA+ICt9Cj4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+
ID4gPiA+ID4gPiA+ID4gK3N0YXRpYyBpbnQgdmlydG5ldF9ycV9tZXJnZV9tYXBfaW5pdChzdHJ1
Y3QgdmlydG5ldF9pbmZvICp2aSkKPiA+ID4gPiA+ID4gPiA+ID4gK3sKPiA+ID4gPiA+ID4gPiA+
ID4gKyAgICAgICBzdHJ1Y3QgcmVjZWl2ZV9xdWV1ZSAqcnE7Cj4gPiA+ID4gPiA+ID4gPiA+ICsg
ICAgICAgaW50IGksIGVyciwgaiwgbnVtOwo+ID4gPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+
ID4gPiA+ICsgICAgICAgLyogZGlzYWJsZSBmb3IgYmlnIG1vZGUgKi8KPiA+ID4gPiA+ID4gPiA+
ID4gKyAgICAgICBpZiAoIXZpLT5tZXJnZWFibGVfcnhfYnVmcyAmJiB2aS0+YmlnX3BhY2tldHMp
Cj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsKPiA+ID4gPiA+ID4g
PiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgIGZvciAoaSA9IDA7IGkgPCB2aS0+bWF4
X3F1ZXVlX3BhaXJzOyBpKyspIHsKPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIGVy
ciA9IHZpcnRxdWV1ZV9zZXRfcHJlbWFwcGVkKHZpLT5ycVtpXS52cSk7Cj4gPiA+ID4gPiA+ID4g
PiA+ICsgICAgICAgICAgICAgICBpZiAoZXJyKQo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAg
ICAgICAgICAgICAgICBjb250aW51ZTsKPiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+
ID4gPiArICAgICAgICAgICAgICAgcnEgPSAmdmktPnJxW2ldOwo+ID4gPiA+ID4gPiA+ID4gPiAr
Cj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBudW0gPSB2aXJ0cXVldWVfZ2V0X3Zy
aW5nX3NpemUocnEtPnZxKTsKPiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gPiAr
ICAgICAgICAgICAgICAgcnEtPmRhdGFfYXJyYXkgPSBrbWFsbG9jX2FycmF5KG51bSwgc2l6ZW9m
KCpycS0+ZGF0YV9hcnJheSksIEdGUF9LRVJORUwpOwo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAg
ICAgICAgICAgaWYgKCFycS0+ZGF0YV9hcnJheSkKPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgZ290byBlcnI7Cj4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4g
PiA+ID4gKyAgICAgICAgICAgICAgIHJxLT5kbWFfYXJyYXkgPSBrbWFsbG9jX2FycmF5KG51bSwg
c2l6ZW9mKCpycS0+ZG1hX2FycmF5KSwgR0ZQX0tFUk5FTCk7Cj4gPiA+ID4gPiA+ID4gPiA+ICsg
ICAgICAgICAgICAgICBpZiAoIXJxLT5kbWFfYXJyYXkpCj4gPiA+ID4gPiA+ID4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyOwo+ID4gPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4g
PiA+ID4gPiA+ICsgICAgICAgICAgICAgICBmb3IgKGogPSAwOyBqIDwgbnVtOyArK2opIHsKPiA+
ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcnEtPmRhdGFfYXJyYXlbal0u
bmV4dCA9IHJxLT5kYXRhX2ZyZWU7Cj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgIHJxLT5kYXRhX2ZyZWUgPSAmcnEtPmRhdGFfYXJyYXlbal07Cj4gPiA+ID4gPiA+ID4g
PiA+ICsKPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcnEtPmRtYV9h
cnJheVtqXS5uZXh0ID0gcnEtPmRtYV9mcmVlOwo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAg
ICAgICAgICAgICAgICBycS0+ZG1hX2ZyZWUgPSAmcnEtPmRtYV9hcnJheVtqXTsKPiA+ID4gPiA+
ID4gPiA+ID4gKyAgICAgICAgICAgICAgIH0KPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICB9Cj4g
PiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICByZXR1cm4gMDsKPiA+
ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gPiArZXJyOgo+ID4gPiA+ID4gPiA+ID4g
PiArICAgICAgIGZvciAoaSA9IDA7IGkgPCB2aS0+bWF4X3F1ZXVlX3BhaXJzOyBpKyspIHsKPiA+
ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIHN0cnVjdCByZWNlaXZlX3F1ZXVlICpycTsK
PiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgcnEg
PSAmdmktPnJxW2ldOwo+ID4gPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gPiA+ICsgICAg
ICAgICAgICAgICBrZnJlZShycS0+ZG1hX2FycmF5KTsKPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAg
ICAgICAgICAgIGtmcmVlKHJxLT5kYXRhX2FycmF5KTsKPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAg
ICB9Cj4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICByZXR1cm4g
LUVOT01FTTsKPiA+ID4gPiA+ID4gPiA+ID4gK30KPiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+
ID4gPiA+ID4gPiAgc3RhdGljIHZvaWQgZnJlZV9vbGRfeG1pdF9za2JzKHN0cnVjdCBzZW5kX3F1
ZXVlICpzcSwgYm9vbCBpbl9uYXBpKQo+ID4gPiA+ID4gPiA+ID4gPiAgewo+ID4gPiA+ID4gPiA+
ID4gPiAgICAgICAgIHVuc2lnbmVkIGludCBsZW47Cj4gPiA+ID4gPiA+ID4gPiA+IEBAIC04MzUs
NyArMTAzMyw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGFnZSAqeGRwX2xpbmVhcml6ZV9wYWdlKHN0cnVj
dCByZWNlaXZlX3F1ZXVlICpycSwKPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgIHZv
aWQgKmJ1ZjsKPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgIGludCBvZmY7Cj4gPiA+
ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICBidWYgPSB2aXJ0
cXVldWVfZ2V0X2J1ZihycS0+dnEsICZidWZsZW4pOwo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAg
ICAgICAgICAgYnVmID0gdmlydG5ldF9ycV9nZXRfYnVmKHJxLCAmYnVmbGVuLCBOVUxMKTsKPiA+
ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgIGlmICh1bmxpa2VseSghYnVmKSkKPiA+ID4g
PiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgZ290byBlcnJfYnVmOwo+ID4gPiA+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiBAQCAtMTEyNiw3ICsxMzI0LDcgQEAgc3RhdGlj
IGludCB2aXJ0bmV0X2J1aWxkX3hkcF9idWZmX21yZyhzdHJ1Y3QgbmV0X2RldmljZSAqZGV2LAo+
ID4gPiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiA+ID4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgd2hpbGUgKC0tKm51bV9idWYgPiAw
KSB7Cj4gPiA+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICBidWYgPSB2aXJ0cXVldWVfZ2V0
X2J1Zl9jdHgocnEtPnZxLCAmbGVuLCAmY3R4KTsKPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAg
ICAgICAgIGJ1ZiA9IHZpcnRuZXRfcnFfZ2V0X2J1ZihycSwgJmxlbiwgJmN0eCk7Cj4gPiA+ID4g
PiA+ID4gPiA+ICAgICAgICAgICAgICAgICBpZiAodW5saWtlbHkoIWJ1ZikpIHsKPiA+ID4gPiA+
ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcHJfZGVidWcoIiVzOiByeCBlcnJvcjog
JWQgYnVmZmVycyBvdXQgb2YgJWQgbWlzc2luZ1xuIiwKPiA+ID4gPiA+ID4gPiA+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2LT5uYW1lLCAqbnVtX2J1ZiwKPiA+ID4gPiA+
ID4gPiA+ID4gQEAgLTEzNTEsNyArMTU0OSw3IEBAIHN0YXRpYyBzdHJ1Y3Qgc2tfYnVmZiAqcmVj
ZWl2ZV9tZXJnZWFibGUoc3RydWN0IG5ldF9kZXZpY2UgKmRldiwKPiA+ID4gPiA+ID4gPiA+ID4g
ICAgICAgICB3aGlsZSAoLS1udW1fYnVmKSB7Cj4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAg
ICAgICBpbnQgbnVtX3NrYl9mcmFnczsKPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+
ID4gLSAgICAgICAgICAgICAgIGJ1ZiA9IHZpcnRxdWV1ZV9nZXRfYnVmX2N0eChycS0+dnEsICZs
ZW4sICZjdHgpOwo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgYnVmID0gdmlydG5l
dF9ycV9nZXRfYnVmKHJxLCAmbGVuLCAmY3R4KTsKPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICAg
ICAgICAgIGlmICh1bmxpa2VseSghYnVmKSkgewo+ID4gPiA+ID4gPiA+ID4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICBwcl9kZWJ1ZygiJXM6IHJ4IGVycm9yOiAlZCBidWZmZXJzIG91dCBvZiAl
ZCBtaXNzaW5nXG4iLAo+ID4gPiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBkZXYtPm5hbWUsIG51bV9idWYsCj4gPiA+ID4gPiA+ID4gPiA+IEBAIC0xNDE0LDcg
KzE2MTIsNyBAQCBzdGF0aWMgc3RydWN0IHNrX2J1ZmYgKnJlY2VpdmVfbWVyZ2VhYmxlKHN0cnVj
dCBuZXRfZGV2aWNlICpkZXYsCj4gPiA+ID4gPiA+ID4gPiA+ICBlcnJfc2tiOgo+ID4gPiA+ID4g
PiA+ID4gPiAgICAgICAgIHB1dF9wYWdlKHBhZ2UpOwo+ID4gPiA+ID4gPiA+ID4gPiAgICAgICAg
IHdoaWxlIChudW1fYnVmLS0gPiAxKSB7Cj4gPiA+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAg
ICBidWYgPSB2aXJ0cXVldWVfZ2V0X2J1ZihycS0+dnEsICZsZW4pOwo+ID4gPiA+ID4gPiA+ID4g
PiArICAgICAgICAgICAgICAgYnVmID0gdmlydG5ldF9ycV9nZXRfYnVmKHJxLCAmbGVuLCBOVUxM
KTsKPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgIGlmICh1bmxpa2VseSghYnVmKSkg
ewo+ID4gPiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICBwcl9kZWJ1ZygiJXM6
IHJ4IGVycm9yOiAlZCBidWZmZXJzIG1pc3NpbmdcbiIsCj4gPiA+ID4gPiA+ID4gPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRldi0+bmFtZSwgbnVtX2J1Zik7Cj4gPiA+ID4g
PiA+ID4gPiA+IEBAIC0xNTI5LDYgKzE3MjcsNyBAQCBzdGF0aWMgaW50IGFkZF9yZWN2YnVmX3Nt
YWxsKHN0cnVjdCB2aXJ0bmV0X2luZm8gKnZpLCBzdHJ1Y3QgcmVjZWl2ZV9xdWV1ZSAqcnEsCj4g
PiA+ID4gPiA+ID4gPiA+ICAgICAgICAgdW5zaWduZWQgaW50IHhkcF9oZWFkcm9vbSA9IHZpcnRu
ZXRfZ2V0X2hlYWRyb29tKHZpKTsKPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICB2b2lkICpjdHgg
PSAodm9pZCAqKSh1bnNpZ25lZCBsb25nKXhkcF9oZWFkcm9vbTsKPiA+ID4gPiA+ID4gPiA+ID4g
ICAgICAgICBpbnQgbGVuID0gdmktPmhkcl9sZW4gKyBWSVJUTkVUX1JYX1BBRCArIEdPT0RfUEFD
S0VUX0xFTiArIHhkcF9oZWFkcm9vbTsKPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICBzdHJ1Y3Qg
dmlydG5ldF9ycV9kYXRhICpkYXRhOwo+ID4gPiA+ID4gPiA+ID4gPiAgICAgICAgIGludCBlcnI7
Cj4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgbGVuID0gU0tCX0RB
VEFfQUxJR04obGVuKSArCj4gPiA+ID4gPiA+ID4gPiA+IEBAIC0xNTM5LDExICsxNzM4LDM0IEBA
IHN0YXRpYyBpbnQgYWRkX3JlY3ZidWZfc21hbGwoc3RydWN0IHZpcnRuZXRfaW5mbyAqdmksIHN0
cnVjdCByZWNlaXZlX3F1ZXVlICpycSwKPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICBidWYgPSAo
Y2hhciAqKXBhZ2VfYWRkcmVzcyhhbGxvY19mcmFnLT5wYWdlKSArIGFsbG9jX2ZyYWctPm9mZnNl
dDsKPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICBnZXRfcGFnZShhbGxvY19mcmFnLT5wYWdlKTsK
PiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICBhbGxvY19mcmFnLT5vZmZzZXQgKz0gbGVuOwo+ID4g
PiA+ID4gPiA+ID4gPiAtICAgICAgIHNnX2luaXRfb25lKHJxLT5zZywgYnVmICsgVklSVE5FVF9S
WF9QQUQgKyB4ZHBfaGVhZHJvb20sCj4gPiA+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAg
ICAgdmktPmhkcl9sZW4gKyBHT09EX1BBQ0tFVF9MRU4pOwo+ID4gPiA+ID4gPiA+ID4gPiAtICAg
ICAgIGVyciA9IHZpcnRxdWV1ZV9hZGRfaW5idWZfY3R4KHJxLT52cSwgcnEtPnNnLCAxLCBidWYs
IGN0eCwgZ2ZwKTsKPiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAg
IGlmIChycS0+ZGF0YV9hcnJheSkgewo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAg
ZXJyID0gdmlydG5ldF9ycV9tYXBfc2cocnEsIGJ1ZiArIFZJUlRORVRfUlhfUEFEICsgeGRwX2hl
YWRyb29tLAo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdmktPmhkcl9sZW4gKyBHT09EX1BBQ0tFVF9MRU4pOwo+ID4gPiA+ID4gPiA+ID4g
PiArICAgICAgICAgICAgICAgaWYgKGVycikKPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgZ290byBtYXBfZXJyOwo+ID4gPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+
ID4gPiA+ICsgICAgICAgICAgICAgICBkYXRhID0gdmlydG5ldF9ycV9nZXRfZGF0YShycSwgYnVm
LCBycS0+bGFzdF9kbWEpOwo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgIH0gZWxzZSB7Cj4gPiA+
ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBzZ19pbml0X29uZShycS0+c2csIGJ1ZiArIFZJ
UlRORVRfUlhfUEFEICsgeGRwX2hlYWRyb29tLAo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdmktPmhkcl9sZW4gKyBHT09EX1BBQ0tFVF9MRU4pOwo+ID4gPiA+
ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgZGF0YSA9ICh2b2lkICopYnVmOwo+ID4gPiA+ID4g
PiA+ID4gPiArICAgICAgIH0KPiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gPiAr
ICAgICAgIGVyciA9IHZpcnRxdWV1ZV9hZGRfaW5idWZfY3R4KHJxLT52cSwgcnEtPnNnLCAxLCBk
YXRhLCBjdHgsIGdmcCk7Cj4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgaWYgKGVyciA8IDApCj4g
PiA+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICBwdXRfcGFnZSh2aXJ0X3RvX2hlYWRfcGFn
ZShidWYpKTsKPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIGdvdG8gYWRkX2VycjsK
PiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgIHJldHVybiBlcnI7
Cj4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ID4gK2FkZF9lcnI6Cj4gPiA+ID4g
PiA+ID4gPiA+ICsgICAgICAgaWYgKHJxLT5kYXRhX2FycmF5KSB7Cj4gPiA+ID4gPiA+ID4gPiA+
ICsgICAgICAgICAgICAgICB2aXJ0bmV0X3JxX3VubWFwKHJxLCBkYXRhLT5kbWEpOwo+ID4gPiA+
ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgdmlydG5ldF9ycV9yZWN5Y2xlX2RhdGEocnEsIGRh
dGEpOwo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgIH0KPiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4g
PiA+ID4gPiA+ID4gPiArbWFwX2VycjoKPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICBwdXRfcGFn
ZSh2aXJ0X3RvX2hlYWRfcGFnZShidWYpKTsKPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICByZXR1
cm4gZXJyOwo+ID4gPiA+ID4gPiA+ID4gPiAgfQo+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiA+ID4gPiBAQCAtMTYyMCw2ICsxODQyLDcgQEAgc3RhdGljIGludCBhZGRfcmVjdmJ1Zl9tZXJn
ZWFibGUoc3RydWN0IHZpcnRuZXRfaW5mbyAqdmksCj4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAg
dW5zaWduZWQgaW50IGhlYWRyb29tID0gdmlydG5ldF9nZXRfaGVhZHJvb20odmkpOwo+ID4gPiA+
ID4gPiA+ID4gPiAgICAgICAgIHVuc2lnbmVkIGludCB0YWlscm9vbSA9IGhlYWRyb29tID8gc2l6
ZW9mKHN0cnVjdCBza2Jfc2hhcmVkX2luZm8pIDogMDsKPiA+ID4gPiA+ID4gPiA+ID4gICAgICAg
ICB1bnNpZ25lZCBpbnQgcm9vbSA9IFNLQl9EQVRBX0FMSUdOKGhlYWRyb29tICsgdGFpbHJvb20p
Owo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgIHN0cnVjdCB2aXJ0bmV0X3JxX2RhdGEgKmRhdGE7
Cj4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgY2hhciAqYnVmOwo+ID4gPiA+ID4gPiA+ID4gPiAg
ICAgICAgIHZvaWQgKmN0eDsKPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICBpbnQgZXJyOwo+ID4g
PiA+ID4gPiA+ID4gPiBAQCAtMTY1MCwxMiArMTg3MywzMiBAQCBzdGF0aWMgaW50IGFkZF9yZWN2
YnVmX21lcmdlYWJsZShzdHJ1Y3QgdmlydG5ldF9pbmZvICp2aSwKPiA+ID4gPiA+ID4gPiA+ID4g
ICAgICAgICAgICAgICAgIGFsbG9jX2ZyYWctPm9mZnNldCArPSBob2xlOwo+ID4gPiA+ID4gPiA+
ID4gPiAgICAgICAgIH0KPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gLSAgICAg
ICBzZ19pbml0X29uZShycS0+c2csIGJ1ZiwgbGVuKTsKPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAg
ICBpZiAocnEtPmRhdGFfYXJyYXkpIHsKPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAg
IGVyciA9IHZpcnRuZXRfcnFfbWFwX3NnKHJxLCBidWYsIGxlbik7Cj4gPiA+ID4gPiA+ID4gPiA+
ICsgICAgICAgICAgICAgICBpZiAoZXJyKQo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICBnb3RvIG1hcF9lcnI7Cj4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4g
PiA+ID4gKyAgICAgICAgICAgICAgIGRhdGEgPSB2aXJ0bmV0X3JxX2dldF9kYXRhKHJxLCBidWYs
IHJxLT5sYXN0X2RtYSk7Cj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgfSBlbHNlIHsKPiA+ID4g
PiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIHNnX2luaXRfb25lKHJxLT5zZywgYnVmLCBsZW4p
Owo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgZGF0YSA9ICh2b2lkICopYnVmOwo+
ID4gPiA+ID4gPiA+ID4gPiArICAgICAgIH0KPiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4g
PiA+ID4gPiAgICAgICAgIGN0eCA9IG1lcmdlYWJsZV9sZW5fdG9fY3R4KGxlbiArIHJvb20sIGhl
YWRyb29tKTsKPiA+ID4gPiA+ID4gPiA+ID4gLSAgICAgICBlcnIgPSB2aXJ0cXVldWVfYWRkX2lu
YnVmX2N0eChycS0+dnEsIHJxLT5zZywgMSwgYnVmLCBjdHgsIGdmcCk7Cj4gPiA+ID4gPiA+ID4g
PiA+ICsgICAgICAgZXJyID0gdmlydHF1ZXVlX2FkZF9pbmJ1Zl9jdHgocnEtPnZxLCBycS0+c2cs
IDEsIGRhdGEsIGN0eCwgZ2ZwKTsKPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICBpZiAoZXJyIDwg
MCkKPiA+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgIHB1dF9wYWdlKHZpcnRfdG9faGVh
ZF9wYWdlKGJ1ZikpOwo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgZ290byBhZGRf
ZXJyOwo+ID4gPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgcmV0dXJu
IDA7Cj4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ID4gK2FkZF9lcnI6Cj4gPiA+
ID4gPiA+ID4gPiA+ICsgICAgICAgaWYgKHJxLT5kYXRhX2FycmF5KSB7Cj4gPiA+ID4gPiA+ID4g
PiA+ICsgICAgICAgICAgICAgICB2aXJ0bmV0X3JxX3VubWFwKHJxLCBkYXRhLT5kbWEpOwo+ID4g
PiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgdmlydG5ldF9ycV9yZWN5Y2xlX2RhdGEocnEs
IGRhdGEpOwo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgIH0KPiA+ID4gPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gPiA+ID4gK21hcF9lcnI6Cj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgcHV0X3Bh
Z2UodmlydF90b19oZWFkX3BhZ2UoYnVmKSk7Cj4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgcmV0
dXJuIGVycjsKPiA+ID4gPiA+ID4gPiA+ID4gIH0KPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gPiA+ID4gQEAgLTE3NzUsMTMgKzIwMTgsMTMgQEAgc3RhdGljIGludCB2aXJ0bmV0X3JlY2Vp
dmUoc3RydWN0IHJlY2VpdmVfcXVldWUgKnJxLCBpbnQgYnVkZ2V0LAo+ID4gPiA+ID4gPiA+ID4g
PiAgICAgICAgICAgICAgICAgdm9pZCAqY3R4Owo+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiA+ID4gPiAgICAgICAgICAgICAgICAgd2hpbGUgKHN0YXRzLnBhY2tldHMgPCBidWRnZXQgJiYK
PiA+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAoYnVmID0gdmlydHF1ZXVl
X2dldF9idWZfY3R4KHJxLT52cSwgJmxlbiwgJmN0eCkpKSB7Cj4gPiA+ID4gPiA+ID4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgKGJ1ZiA9IHZpcnRuZXRfcnFfZ2V0X2J1ZihycSwgJmxlbiwg
JmN0eCkpKSB7Cj4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHJlY2Vp
dmVfYnVmKHZpLCBycSwgYnVmLCBsZW4sIGN0eCwgeGRwX3htaXQsICZzdGF0cyk7Cj4gPiA+ID4g
PiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXRzLnBhY2tldHMrKzsKPiA+ID4g
PiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgIH0KPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICB9
IGVsc2Ugewo+ID4gPiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgd2hpbGUgKHN0YXRzLnBh
Y2tldHMgPCBidWRnZXQgJiYKPiA+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAg
ICAoYnVmID0gdmlydHF1ZXVlX2dldF9idWYocnEtPnZxLCAmbGVuKSkgIT0gTlVMTCkgewo+ID4g
PiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgIChidWYgPSB2aXJ0bmV0X3JxX2dl
dF9idWYocnEsICZsZW4sIE5VTEwpKSAhPSBOVUxMKSB7Cj4gPiA+ID4gPiA+ID4gPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgIHJlY2VpdmVfYnVmKHZpLCBycSwgYnVmLCBsZW4sIE5VTEwsIHhk
cF94bWl0LCAmc3RhdHMpOwo+ID4gPiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICBzdGF0cy5wYWNrZXRzKys7Cj4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICB9Cj4g
PiA+ID4gPiA+ID4gPiA+IEBAIC0zNTE0LDYgKzM3NTcsOSBAQCBzdGF0aWMgdm9pZCB2aXJ0bmV0
X2ZyZWVfcXVldWVzKHN0cnVjdCB2aXJ0bmV0X2luZm8gKnZpKQo+ID4gPiA+ID4gPiA+ID4gPiAg
ICAgICAgIGZvciAoaSA9IDA7IGkgPCB2aS0+bWF4X3F1ZXVlX3BhaXJzOyBpKyspIHsKPiA+ID4g
PiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgIF9fbmV0aWZfbmFwaV9kZWwoJnZpLT5ycVtpXS5u
YXBpKTsKPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgIF9fbmV0aWZfbmFwaV9kZWwo
JnZpLT5zcVtpXS5uYXBpKTsKPiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gPiAr
ICAgICAgICAgICAgICAga2ZyZWUodmktPnJxW2ldLmRhdGFfYXJyYXkpOwo+ID4gPiA+ID4gPiA+
ID4gPiArICAgICAgICAgICAgICAga2ZyZWUodmktPnJxW2ldLmRtYV9hcnJheSk7Cj4gPiA+ID4g
PiA+ID4gPiA+ICAgICAgICAgfQo+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiAg
ICAgICAgIC8qIFdlIGNhbGxlZCBfX25ldGlmX25hcGlfZGVsKCksCj4gPiA+ID4gPiA+ID4gPiA+
IEBAIC0zNTkxLDkgKzM4MzcsMTAgQEAgc3RhdGljIHZvaWQgZnJlZV91bnVzZWRfYnVmcyhzdHJ1
Y3QgdmlydG5ldF9pbmZvICp2aSkKPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICB9Cj4gPiA+ID4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgZm9yIChpID0gMDsgaSA8IHZpLT5t
YXhfcXVldWVfcGFpcnM7IGkrKykgewo+ID4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAg
c3RydWN0IHZpcnRxdWV1ZSAqdnEgPSB2aS0+cnFbaV0udnE7Cj4gPiA+ID4gPiA+ID4gPiA+IC0g
ICAgICAgICAgICAgICB3aGlsZSAoKGJ1ZiA9IHZpcnRxdWV1ZV9kZXRhY2hfdW51c2VkX2J1Zih2
cSkpICE9IE5VTEwpCj4gPiA+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIHZp
cnRuZXRfcnFfZnJlZV91bnVzZWRfYnVmKHZxLCBidWYpOwo+ID4gPiA+ID4gPiA+ID4gPiArICAg
ICAgICAgICAgICAgc3RydWN0IHJlY2VpdmVfcXVldWUgKnJxID0gJnZpLT5ycVtpXTsKPiA+ID4g
PiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgd2hpbGUgKChi
dWYgPSB2aXJ0bmV0X3JxX2RldGFjaF91bnVzZWRfYnVmKHJxKSkgIT0gTlVMTCkKPiA+ID4gPiA+
ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgdmlydG5ldF9ycV9mcmVlX3VudXNlZF9i
dWYocnEtPnZxLCBidWYpOwo+ID4gPiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgY29uZF9y
ZXNjaGVkKCk7Cj4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgfQo+ID4gPiA+ID4gPiA+ID4gPiAg
fQo+ID4gPiA+ID4gPiA+ID4gPiBAQCAtMzc2Nyw2ICs0MDE0LDEwIEBAIHN0YXRpYyBpbnQgaW5p
dF92cXMoc3RydWN0IHZpcnRuZXRfaW5mbyAqdmkpCj4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAg
aWYgKHJldCkKPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgIGdvdG8gZXJyX2ZyZWU7
Cj4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgcmV0ID0gdmlydG5l
dF9ycV9tZXJnZV9tYXBfaW5pdCh2aSk7Cj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgaWYgKHJl
dCkKPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIGdvdG8gZXJyX2ZyZWU7Cj4gPiA+
ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICBjcHVzX3JlYWRfbG9jaygp
Owo+ID4gPiA+ID4gPiA+ID4gPiAgICAgICAgIHZpcnRuZXRfc2V0X2FmZmluaXR5KHZpKTsKPiA+
ID4gPiA+ID4gPiA+ID4gICAgICAgICBjcHVzX3JlYWRfdW5sb2NrKCk7Cj4gPiA+ID4gPiA+ID4g
PiA+IC0tCj4gPiA+ID4gPiA+ID4gPiA+IDIuMzIuMC4zLmcwMTE5NWNmOWYKPiA+ID4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPgo+ID4gPiA+Cj4gPiA+Cj4gPgo+Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxp
bmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlv
bg==
