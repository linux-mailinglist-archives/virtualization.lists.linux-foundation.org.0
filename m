Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4356D5A59
	for <lists.virtualization@lfdr.de>; Tue,  4 Apr 2023 10:10:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE8EE81B35;
	Tue,  4 Apr 2023 08:10:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE8EE81B35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rXpziDJVs2ro; Tue,  4 Apr 2023 08:10:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E1F3981AC4;
	Tue,  4 Apr 2023 08:10:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1F3981AC4
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 142EEC0089;
	Tue,  4 Apr 2023 08:10:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E5C3C002F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Apr 2023 08:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C39540131
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Apr 2023 08:10:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C39540131
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P2I0auZaN5WH
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Apr 2023 08:10:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B06F740121
Received: from out30-118.freemail.mail.aliyun.com
 (out30-118.freemail.mail.aliyun.com [115.124.30.118])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B06F740121
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Apr 2023 08:10:07 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R531e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0VfL-EMQ_1680595798; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VfL-EMQ_1680595798) by smtp.aliyun-inc.com;
 Tue, 04 Apr 2023 16:09:59 +0800
Message-ID: <1680595780.1943583-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH net-next 3/8] virtio_net: introduce virtnet_xdp_handler()
 to seprate the logic of run xdp
Date: Tue, 4 Apr 2023 16:09:40 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Jason Wang <jasowang@redhat.com>
References: <20230328120412.110114-1-xuanzhuo@linux.alibaba.com>
 <20230328120412.110114-4-xuanzhuo@linux.alibaba.com>
 <CACGkMEvZ=-G4QVTDnoSa1N0UspW8u_oz-7xosrXV0f1YcytVXw@mail.gmail.com>
 <1680495148.1559556-3-xuanzhuo@linux.alibaba.com>
 <CACGkMEvfTE1F7Wa3P2do1o+149kSdGkjyVYt6e4r2r5UQZ6ocA@mail.gmail.com>
 <1680588670.6153247-1-xuanzhuo@linux.alibaba.com>
 <CACGkMEtTFk40ShdgyAJeBrUphZnMgk-RE0RpcHyc1uvSNoXAOA@mail.gmail.com>
 <1680590673.0168557-1-xuanzhuo@linux.alibaba.com>
 <CACGkMEt=dO+G89v+G8goOtgOHpzKdw_bUuL-o7u1g6tsP=bfJQ@mail.gmail.com>
 <1680592019.471209-2-xuanzhuo@linux.alibaba.com>
 <CACGkMEtFWrdUGTv=ySGNGuojgFrxicgxnV1Xj7S426HbWHuK4g@mail.gmail.com>
In-Reply-To: <CACGkMEtFWrdUGTv=ySGNGuojgFrxicgxnV1Xj7S426HbWHuK4g@mail.gmail.com>
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

T24gVHVlLCA0IEFwciAyMDIzIDE2OjAzOjQ5ICswODAwLCBKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
ZWRoYXQuY29tPiB3cm90ZToKPiBPbiBUdWUsIEFwciA0LCAyMDIzIGF0IDM6MTLigK9QTSBYdWFu
IFpodW8gPHh1YW56aHVvQGxpbnV4LmFsaWJhYmEuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUdWUs
IDQgQXByIDIwMjMgMTU6MDE6MzYgKzA4MDAsIEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5j
b20+IHdyb3RlOgo+ID4gPiBPbiBUdWUsIEFwciA0LCAyMDIzIGF0IDI6NTXigK9QTSBYdWFuIFpo
dW8gPHh1YW56aHVvQGxpbnV4LmFsaWJhYmEuY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9u
IFR1ZSwgNCBBcHIgMjAyMyAxNDozNTowNSArMDgwMCwgSmFzb24gV2FuZyA8amFzb3dhbmdAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiBPbiBUdWUsIEFwciA0LCAyMDIzIGF0IDI6MjLigK9Q
TSBYdWFuIFpodW8gPHh1YW56aHVvQGxpbnV4LmFsaWJhYmEuY29tPiB3cm90ZToKPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gT24gVHVlLCA0IEFwciAyMDIzIDEzOjA0OjAyICswODAwLCBKYXNvbiBX
YW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPiB3cm90ZToKPiA+ID4gPiA+ID4gPiBPbiBNb24sIEFw
ciAzLCAyMDIzIGF0IDEyOjE34oCvUE0gWHVhbiBaaHVvIDx4dWFuemh1b0BsaW51eC5hbGliYWJh
LmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gT24gTW9uLCAzIEFw
ciAyMDIzIDEwOjQzOjAzICswODAwLCBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPiB3
cm90ZToKPiA+ID4gPiA+ID4gPiA+ID4gT24gVHVlLCBNYXIgMjgsIDIwMjMgYXQgODowNOKAr1BN
IFh1YW4gWmh1byA8eHVhbnpodW9AbGludXguYWxpYmFiYS5jb20+IHdyb3RlOgo+ID4gPiA+ID4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+ID4gQXQgcHJlc2VudCwgd2UgaGF2ZSB0d28gc2lt
aWxhciBsb2dpYyB0byBwZXJmb3JtIHRoZSBYRFAgcHJvZy4KPiA+ID4gPiA+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiA+ID4gPiA+IFRoZXJlZm9yZSwgdGhpcyBQQVRDSCBzZXBhcmF0ZXMgdGhlIGNv
ZGUgb2YgZXhlY3V0aW5nIFhEUCwgd2hpY2ggaXMKPiA+ID4gPiA+ID4gPiA+ID4gPiBjb25kdWNp
dmUgdG8gbGF0ZXIgbWFpbnRlbmFuY2UuCj4gPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBYdWFuIFpodW8gPHh1YW56aHVvQGxpbnV4LmFsaWJhYmEu
Y29tPgo+ID4gPiA+ID4gPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gPiA+ID4gPiA+ICBkcml2ZXJz
L25ldC92aXJ0aW9fbmV0LmMgfCAxNDIgKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0tCj4gPiA+ID4gPiA+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3NSBpbnNlcnRpb25z
KCspLCA2NyBkZWxldGlvbnMoLSkKPiA+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4g
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC92aXJ0aW9fbmV0LmMgYi9kcml2ZXJzL25ldC92
aXJ0aW9fbmV0LmMKPiA+ID4gPiA+ID4gPiA+ID4gPiBpbmRleCBiYjQyNjk1OGNkZDQuLjcyYjlk
NmVlNDAyNCAxMDA2NDQKPiA+ID4gPiA+ID4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL25ldC92aXJ0
aW9fbmV0LmMKPiA+ID4gPiA+ID4gPiA+ID4gPiArKysgYi9kcml2ZXJzL25ldC92aXJ0aW9fbmV0
LmMKPiA+ID4gPiA+ID4gPiA+ID4gPiBAQCAtMzAxLDYgKzMwMSwxNSBAQCBzdHJ1Y3QgcGFkZGVk
X3ZuZXRfaGRyIHsKPiA+ID4gPiA+ID4gPiA+ID4gPiAgICAgICAgIGNoYXIgcGFkZGluZ1sxMl07
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gIH07Cj4gPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
PiA+ID4gPiArZW51bSB7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAvKiB4ZHAgcGFzcyAq
Lwo+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgVklSVE5FVF9YRFBfUkVTX1BBU1MsCj4gPiA+
ID4gPiA+ID4gPiA+ID4gKyAgICAgICAvKiBkcm9wIHBhY2tldC4gdGhlIGNhbGxlciBuZWVkcyB0
byByZWxlYXNlIHRoZSBwYWdlLiAqLwo+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgVklSVE5F
VF9YRFBfUkVTX0RST1AsCj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAvKiBwYWNrZXQgaXMg
Y29uc3VtZWQgYnkgeGRwLiB0aGUgY2FsbGVyIG5lZWRzIHRvIGRvIG5vdGhpbmcuICovCj4gPiA+
ID4gPiA+ID4gPiA+ID4gKyAgICAgICBWSVJUTkVUX1hEUF9SRVNfQ09OU1VNRUQsCj4gPiA+ID4g
PiA+ID4gPiA+ID4gK307Cj4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+IEknZCBw
cmVmZXIgdGhpcyB0byBiZSBkb25lIG9uIHRvcCB1bmxlc3MgaXQgaXMgYSBtdXN0LiBCdXQgSSBk
b24ndCBzZWUKPiA+ID4gPiA+ID4gPiA+ID4gYW55IGFkdmFudGFnZSBvZiBpbnRyb2R1Y2luZyB0
aGlzLCBpdCdzIHBhcnRpYWwgbWFwcGluZyBvZiBYRFAgYWN0aW9uCj4gPiA+ID4gPiA+ID4gPiA+
IGFuZCBpdCBuZWVkcyB0byBiZSBleHRlbmRlZCB3aGVuIFhEUCBhY3Rpb24gaXMgZXh0ZW5kZWQu
IChBbmQgd2UndmUKPiA+ID4gPiA+ID4gPiA+ID4gYWxyZWFkeSBoYWQ6IFZJUlRJT19YRFBfUkVE
SVIgYW5kIFZJUlRJT19YRFBfVFggLi4uKQo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+
IE5vLCB0aGVzZSBhcmUgdGhlIHRocmVlIHN0YXRlcyBvZiBidWZmZXIgYWZ0ZXIgWERQIHByb2Nl
c3NpbmcuCj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gKiBQQVNTOiBnb3RvIG1ha2Ug
c2tiCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBYRFBfUEFTUyBnb2VzIGZvciB0aGlzLgo+
ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiAqIERST1A6IHdlIHNob3VsZCByZWxlYXNlIGJ1
ZmZlcgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gWERQX0RST1AgYW5kIGVycm9yIGNvbmRp
dGlvbnMgZ28gd2l0aCB0aGlzLgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiAqIENVTlNV
TUVEOiB4ZHAgcHJvZyB1c2VkIHRoZSBidWZmZXIsIHdlIGRvIG5vdGhpbmcKPiA+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiA+IFhEUF9UWC9YRFBfUkVESVJFQ1RJT04gZ29lcyBmb3IgdGhpcy4KPiA+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IFNvIHQgdmlydG5ldF94ZHBfaGFuZGxlcigpIGp1c3Qg
bWFwcyBYRFAgQUNUSU9OIHBsdXMgdGhlIGVycm9yCj4gPiA+ID4gPiA+ID4gY29uZGl0aW9ucyB0
byB0aGUgYWJvdmUgdGhyZWUgc3RhdGVzLgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gV2Ug
Y2FuIHNpbXBseSBtYXAgZXJyb3IgdG8gWERQX0RST1AgbGlrZToKPiA+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiA+ICAgICAgICBjYXNlIFhEUF9UWDoKPiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAg
IHN0YXRzLT54ZHBfdHgrKzsKPiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICB4ZHBmID0geGRw
X2NvbnZlcnRfYnVmZl90b19mcmFtZSh4ZHApOwo+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAg
IGlmICh1bmxpa2VseSgheGRwZikpCj4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAg
ICByZXR1cm4gWERQX0RST1A7Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBBIGdvb2Qgc2lk
ZSBlZmZlY3QgaXMgdG8gYXZvaWQgdGhlIHhkcF94bWl0IHBvaW50ZXIgdG8gYmUgcGFzc2VkIHRv
Cj4gPiA+ID4gPiA+ID4gdGhlIGZ1bmN0aW9uLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiBTbywgSSBndWVzcyB5b3UgbWVhbiB0aGlzOgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiAgICAgICAgIHN3aXRjaCAoYWN0KSB7Cj4gPiA+ID4gPiA+ICAgICAgICAgY2FzZSBYRFBfUEFT
UzoKPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgIC8qIGhhbmRsZSBwYXNzICovCj4gPiA+ID4g
PiA+ICAgICAgICAgICAgICAgICByZXR1cm4gc2tiOwo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiAg
ICAgICAgIGNhc2UgWERQX1RYOgo+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgKnhkcF94bWl0
IHw9IFZJUlRJT19YRFBfVFg7Cj4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICBnb3RvIHhtaXQ7
Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ICAgICAgICAgY2FzZSBYRFBfUkVESVJFQ1Q6Cj4gPiA+
ID4gPiA+ICAgICAgICAgICAgICAgICAqeGRwX3htaXQgfD0gVklSVElPX1hEUF9SRURJUjsKPiA+
ID4gPiA+ID4gICAgICAgICAgICAgICAgIGdvdG8geG1pdDsKPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gICAgICAgICBjYXNlIFhEUF9EUk9QOgo+ID4gPiA+ID4gPiAgICAgICAgIGRlZmF1bHQ6Cj4g
PiA+ID4gPiA+ICAgICAgICAgICAgICAgICBnb3RvIGVycl94ZHA7Cj4gPiA+ID4gPiA+ICAgICAg
ICAgfQo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBJIGhhdmUgdG8gc2F5IHRoZXJlIGlzIG5vIHBy
b2JsZW0gZnJvbSB0aGUgcGVyc3BlY3RpdmUgb2YgY29kZSBpbXBsZW1lbnRhdGlvbi4KPiA+ID4g
PiA+Cj4gPiA+ID4gPiBOb3RlIHRoYXQgdGhpcyBpcyB0aGUgY3VycmVudCBsb2dpYyB3aGVyZSBp
dCBpcyBkZXRlcm1pbmVkIGluCj4gPiA+ID4gPiByZWNlaXZlX3NtYWxsKCkgYW5kIHJlY2VpdmVf
bWVyZ2VhYmxlKCkuCj4gPiA+ID4KPiA+ID4gPiBZZXMsIGJ1dCB0aGUgcHVycG9zZSBvZiB0aGlz
IHBhdGNoZXMgaXMgdG8gc2ltcGxpZnkgdGhlIGNhbGwuCj4gPiA+Cj4gPiA+IFlvdSBtZWFuIHNp
bXBsaWZ5IHRoZSByZWNlaXZlX3NtYWxsKCkvbWVyZ2VhYmxlKCk/Cj4gPgo+ID4gWUVTLgo+ID4K
PiA+Cj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEJ1dCBp
ZiB0aGUgYSBuZXcgQUNUSU9OIGxpa2luZyBYRFBfVFgsWERQX1JFRElSRUNUIGlzIGFkZGVkIGlu
IHRoZSBmdXR1cmUsIHRoZW4KPiA+ID4gPiA+ID4gd2UgbXVzdCBtb2RpZnkgYWxsIHRoZSBjYWxs
ZXJzLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoaXMgaXMgZmluZSBzaW5jZSB3ZSBvbmx5IHVzZSBh
IHNpbmdsZSB0eXBlIGZvciBYRFAgYWN0aW9uLgo+ID4gPiA+Cj4gPiA+ID4gYSBzaW5nbGUgdHlw
ZT8KPiA+ID4KPiA+ID4gSW5zdGVhZCBvZiAocGFydGlhbCkgZHVwbGljYXRpbmcgWERQIGFjdGlv
bnMgaW4gdGhlIG5ldyBlbnVtcy4KPiA+Cj4gPgo+ID4gSSB0aGluayBpdCdzIHJlYWxseSBtaXN1
bmRlcnN0YW5kIGhlcmUuIFNvIHlvdXIgdGhvdWdodCBpcyB0aGVzZT8KPiA+Cj4gPiAgICBWSVJU
TkVUX1hEUF9SRVNfUEFTUywKPiA+ICAgIFZJUlRORVRfWERQX1JFU19UWF9SRURJUkVDVCwKPiA+
ICAgIFZJUlRORVRfWERQX1JFU19EUk9QLAo+Cj4gTm8sIEkgbWVhbnQgdGhlIGVudW0geW91IGlu
dHJvZHVjZWQuCj4KPiA+Cj4gPgo+ID4KPiA+ID4KPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gVGhpcyBpcyB0aGUgYmVuZWZpdCBvZiB1c2luZyBDVU5TVU1FRC4KPiA+ID4gPiA+Cj4gPiA+
ID4gPiBJdCdzIHZlcnkgaGFyZCB0byBzYXksIGUuZyBpZiB3ZSB3YW50IHRvIHN1cHBvcnQgY2xv
bmluZyBpbiB0aGUgZnV0dXJlLgo+ID4gPiA+Cj4gPiA+ID4gY2xvbmluZz8gWW91IG1lYW4gY2xv
bmUgb25lIG5ldyBidWZmZXIuCj4gPiA+ID4KPiA+ID4gPiBJdCBpcyB0cnVlIHRoYXQgbm8gbWF0
dGVyIHdoYXQgcmVhbGl6YXRpb24sIHRoZSBsb2dpYyBtdXN0IGJlIG1vZGlmaWVkLgo+ID4gPgo+
ID4gPiBZZXMuCj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
IEkgdGhpbmsgaXQgaXMgYSBnb29kIGFkdmFudGFnZSB0byBwdXQgeGRwX3htaXQgaW4gdmlydG5l
dF94ZHBfaGFuZGxlcigpLAo+ID4gPiA+ID4gPiB3aGljaCBtYWtlcyB0aGUgY2FsbGVyIG5vdCBj
YXJlIHRvbyBtdWNoIGFib3V0IHRoZXNlIGRldGFpbHMuCj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhp
cyBwYXJ0IEkgZG9uJ3QgdW5kZXJzdGFuZCwgaGF2aW5nIHhkcF94bWl0IG1lYW5zIHRoZSBjYWxs
ZXIgbmVlZCB0bwo+ID4gPiA+ID4ga25vdyB3aGV0aGVyIGl0IGlzIHhtaXRlZCBvciByZWRpcmVj
dGVkLiBUaGUgcG9pbnQgb2YgdGhlIGVudW0gaXMgdG8KPiA+ID4gPiA+IGhpZGUgdGhlIFhEUCBh
Y3Rpb25zLCBidXQgaXQncyBjb25mbGljdCB3aXRoIHdoYXQgeGRwX3htaXQgd2hvIHdhbnQgdG8K
PiA+ID4gPiA+IGV4cG9zZSAocGFydCBvZikgdGhlIFhEUCBhY3Rpb25zLgo+ID4gPiA+Cj4gPiA+
ID4gSSBtZWFuLCBubyBtYXR0ZXIgd2hhdCB2aXJ0bmV0X3hkcF9oYW5kbGVyICgpIHJldHVybnM/
IFhEUF9BQ1RJT04gb3Igc29tZSBvbmUgSQo+ID4gPiA+IGRlZmluZWQsIEkgd2FudCB0byBoaWRl
IHRoZSBtb2RpZmljYXRpb24gb2YgeGRwX3htaXQgdG8gdmlydG5ldF94ZHBfaGFuZGxlcigpLgo+
ID4gPiA+Cj4gPiA+ID4gRXZlbiBpZiB2aXJ0bmV0X3hkcF9oYW5kbGVyKCkgcmV0dXJucyBYRFBf
VFgsIHdlIGNhbiBhbHNvIGNvbXBsZXRlIHRoZQo+ID4gPiA+IG1vZGlmaWNhdGlvbiBvZiBYRFBf
WE1JVCB3aXRoaW4gVmlydG5ldF94ZHBfaGFuZGxlcigpLgo+ID4gPiA+Cj4gPiA+ID4KPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+IElmIHlvdSB0YWtlIGludG8KPiA+ID4gPiA+ID4gYWNjb3VudCB0aGUg
cHJvYmxlbSBvZiBpbmNyZWFzaW5nIHRoZSBudW1iZXIgb2YgcGFyYW1ldGVycywgSSBhZHZpc2Ug
dG8gcHV0IGl0Cj4gPiA+ID4gPiA+IGluIHJxLgo+ID4gPiA+ID4KPiA+ID4gPiA+IEkgZG9uJ3Qg
aGF2ZSBzdHJvbmcgb3BpbmlvbiB0byBpbnRyb2R1Y2UgdGhlIGVudW0sCj4gPiA+ID4KPiA+ID4g
PiBPSywgSSB3aWxsIGRyb3AgdGhlc2UgbmV3IGVudW1zLgo+ID4gPgo+ID4gPiBKdXN0IHRvIG1h
a2Ugc3VyZSB3ZSBhcmUgYXQgdGhlIHNhbWUgcGFnZS4gSSBtZWFuLCBpZiB0aGVyZSBpcyBubwo+
ID4gPiBvYmplY3Rpb24gZnJvbSBvdGhlcnMsIEknbSBvayB0byBoYXZlIGFuIGVudW0sIGJ1dCB3
ZSBuZWVkIHRvIHVzZSBhCj4gPiA+IHNlcGFyYXRlIHBhdGNoIHRvIGRvIHRoYXQuCj4gPgo+ID4g
RG8geW91IHJlZmVyIHRvIGludHJvZHVjZSBlbnVtcyBhbG9uZSB3aXRob3V0IHZpcnRuZXRfeGRw
X2hhbmRsZXIoKT8KPgo+IEkgbWVhbnQsIGhhdmluZyB0d28gcGF0Y2hlcwo+Cj4gMSkgc3BsaXQg
b3V0IHZpcnRuZXRfeGRwX2hhbmRsZXIoKSB3aXRob3V0IGludHJvZHVjaW5nIGFueSBuZXcgZW51
bXMKPiAyKSBpbnRyb2R1Y2UgdGhlIG5ldyBlbnVtIHRvIHNpbXBsaWZ5IHRoZSBjb2RlcwoKT0su
IEkgc2VlLgoKVGhhbmtzLgoKCj4KPiBUaGFua3MKPgo+ID4KPiA+ID4KPiA+ID4gPgo+ID4gPiA+
ID4gd2hhdCBJIHdhbnQgdG8gc2F5Cj4gPiA+ID4gPiBpcywgdXNlIGEgc2VwYXJhdGVkIHBhdGNo
IHRvIGRvIHRoYXQuCj4gPiA+ID4KPiA+ID4gPiBEb2VzIHRoaXMgcGFydCByZWZlciB0byBwdXR0
aW5nIHhkcF94bWl0IGluIHJxPwo+ID4gPgo+ID4gPiBJIG1lYW4gaXQncyBiZXR0ZXIgdG8gYmUg
ZG9uZSBzZXBhcmF0ZWx5LiBCdXQgSSBkb24ndCBzZWUgdGhlCj4gPiA+IGFkdmFudGFnZSBvZiB0
aGlzIG90aGVyIHRoYW4gcmVkdWNpbmcgdGhlIHBhcmFtZXRlcnMuCj4gPgo+ID4gSSB0aGluayBz
byBhbHNvLgo+ID4KPiA+IFRoYW5rcy4KPiA+Cj4gPgo+ID4gPgo+ID4gPiBUaGFua3MKPiA+ID4K
PiA+ID4gPgo+ID4gPiA+IFRoYW5rcy4KPiA+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gPgo+ID4gPiA+
ID4gVGhhbmtzCj4gPiA+ID4gPgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBUaGFua3MuCj4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+ID4gPiBUaGUgbGF0dGVyIHR3byBhcmUgbm90IHBhcnRpY3VsYXJseSBy
ZWxhdGVkIHRvIFhEUCBBQ1RJT04uIEFuZCBpdCBkb2VzIG5vdCBuZWVkCj4gPiA+ID4gPiA+ID4g
PiB0byBleHRlbmQgd2hlbiBYRFAgYWN0aW9uIGlzIGV4dGVuZGVkLiBBdCBsZWFzdCBJIGhhdmUg
bm90IHRob3VnaHQgb2YgdGhpcwo+ID4gPiA+ID4gPiA+ID4gc2l0dWF0aW9uLgo+ID4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+ID4gV2hhdCdzIHRoZSBhZHZhbnRhZ2VzIG9mIHN1Y2ggaW5kaXJlY3Rp
b24gY29tcGFyZWQgdG8gdXNpbmcgWERQIGFjdGlvbiBkaXJlY3RseT8KPiA+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiA+IFRoYW5rcwo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4g
PiA+ID4gPiA+ID4gIHN0YXRpYyB2b2lkIHZpcnRuZXRfcnFfZnJlZV91bnVzZWRfYnVmKHN0cnVj
dCB2aXJ0cXVldWUgKnZxLCB2b2lkICpidWYpOwo+ID4gPiA+ID4gPiA+ID4gPiA+ICBzdGF0aWMg
dm9pZCB2aXJ0bmV0X3NxX2ZyZWVfdW51c2VkX2J1ZihzdHJ1Y3QgdmlydHF1ZXVlICp2cSwgdm9p
ZCAqYnVmKTsKPiA+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiA+IEBAIC03ODks
NiArNzk4LDU5IEBAIHN0YXRpYyBpbnQgdmlydG5ldF94ZHBfeG1pdChzdHJ1Y3QgbmV0X2Rldmlj
ZSAqZGV2LAo+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgcmV0dXJuIHJldDsKPiA+ID4gPiA+
ID4gPiA+ID4gPiAgfQo+ID4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+ID4gK3N0
YXRpYyBpbnQgdmlydG5ldF94ZHBfaGFuZGxlcihzdHJ1Y3QgYnBmX3Byb2cgKnhkcF9wcm9nLCBz
dHJ1Y3QgeGRwX2J1ZmYgKnhkcCwKPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc3RydWN0IG5ldF9kZXZpY2UgKmRldiwKPiA+ID4gPiA+ID4gPiA+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50ICp4ZHBfeG1pdCwK
PiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IHZpcnRuZXRfcnFfc3RhdHMgKnN0YXRzKQo+ID4gPiA+ID4gPiA+ID4gPiA+ICt7Cj4gPiA+ID4g
PiA+ID4gPiA+ID4gKyAgICAgICBzdHJ1Y3QgeGRwX2ZyYW1lICp4ZHBmOwo+ID4gPiA+ID4gPiA+
ID4gPiA+ICsgICAgICAgaW50IGVycjsKPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgIHUzMiBh
Y3Q7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgYWN0
ID0gYnBmX3Byb2dfcnVuX3hkcCh4ZHBfcHJvZywgeGRwKTsKPiA+ID4gPiA+ID4gPiA+ID4gPiAr
ICAgICAgIHN0YXRzLT54ZHBfcGFja2V0cysrOwo+ID4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4g
PiA+ID4gPiA+ID4gPiArICAgICAgIHN3aXRjaCAoYWN0KSB7Cj4gPiA+ID4gPiA+ID4gPiA+ID4g
KyAgICAgICBjYXNlIFhEUF9QQVNTOgo+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAg
ICByZXR1cm4gVklSVE5FVF9YRFBfUkVTX1BBU1M7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4g
PiA+ID4gPiA+ID4gPiA+ICsgICAgICAgY2FzZSBYRFBfVFg6Cj4gPiA+ID4gPiA+ID4gPiA+ID4g
KyAgICAgICAgICAgICAgIHN0YXRzLT54ZHBfdHgrKzsKPiA+ID4gPiA+ID4gPiA+ID4gPiArICAg
ICAgICAgICAgICAgeGRwZiA9IHhkcF9jb252ZXJ0X2J1ZmZfdG9fZnJhbWUoeGRwKTsKPiA+ID4g
PiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgaWYgKHVubGlrZWx5KCF4ZHBmKSkKPiA+ID4g
PiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gVklSVE5FVF9YRFBf
UkVTX0RST1A7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAg
ICAgICAgICAgICBlcnIgPSB2aXJ0bmV0X3hkcF94bWl0KGRldiwgMSwgJnhkcGYsIDApOwo+ID4g
PiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBpZiAodW5saWtlbHkoIWVycikpIHsKPiA+
ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICB4ZHBfcmV0dXJuX2ZyYW1l
X3J4X25hcGkoeGRwZik7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIH0gZWxz
ZSBpZiAodW5saWtlbHkoZXJyIDwgMCkpIHsKPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAg
ICAgICAgICAgICAgICB0cmFjZV94ZHBfZXhjZXB0aW9uKGRldiwgeGRwX3Byb2csIGFjdCk7Cj4g
PiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFZJUlRORVRf
WERQX1JFU19EUk9QOwo+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICB9Cj4gPiA+
ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAqeGRw
X3htaXQgfD0gVklSVElPX1hEUF9UWDsKPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAg
ICAgcmV0dXJuIFZJUlRORVRfWERQX1JFU19DT05TVU1FRDsKPiA+ID4gPiA+ID4gPiA+ID4gPiAr
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICBjYXNlIFhEUF9SRURJUkVDVDoKPiA+ID4gPiA+
ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgc3RhdHMtPnhkcF9yZWRpcmVjdHMrKzsKPiA+ID4g
PiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgZXJyID0geGRwX2RvX3JlZGlyZWN0KGRldiwg
eGRwLCB4ZHBfcHJvZyk7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIGlmIChl
cnIpCj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFZJ
UlRORVRfWERQX1JFU19EUk9QOwo+ID4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+
ID4gPiArICAgICAgICAgICAgICAgKnhkcF94bWl0IHw9IFZJUlRJT19YRFBfUkVESVI7Cj4gPiA+
ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBWSVJUTkVUX1hEUF9SRVNfQ09O
U1VNRUQ7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAg
ZGVmYXVsdDoKPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgYnBmX3dhcm5faW52
YWxpZF94ZHBfYWN0aW9uKGRldiwgeGRwX3Byb2csIGFjdCk7Cj4gPiA+ID4gPiA+ID4gPiA+ID4g
KyAgICAgICAgICAgICAgIGZhbGx0aHJvdWdoOwo+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAg
Y2FzZSBYRFBfQUJPUlRFRDoKPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgdHJh
Y2VfeGRwX2V4Y2VwdGlvbihkZXYsIHhkcF9wcm9nLCBhY3QpOwo+ID4gPiA+ID4gPiA+ID4gPiA+
ICsgICAgICAgICAgICAgICBmYWxsdGhyb3VnaDsKPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICAg
IGNhc2UgWERQX0RST1A6Cj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIHJldHVy
biBWSVJUTkVUX1hEUF9SRVNfRFJPUDsKPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgIH0KPiA+
ID4gPiA+ID4gPiA+ID4gPiArfQo+ID4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+
ID4gPiAgc3RhdGljIHVuc2lnbmVkIGludCB2aXJ0bmV0X2dldF9oZWFkcm9vbShzdHJ1Y3Qgdmly
dG5ldF9pbmZvICp2aSkKPiA+ID4gPiA+ID4gPiA+ID4gPiAgewo+ID4gPiA+ID4gPiA+ID4gPiA+
ICAgICAgICAgcmV0dXJuIHZpLT54ZHBfZW5hYmxlZCA/IFZJUlRJT19YRFBfSEVBRFJPT00gOiAw
Owo+ID4gPiA+ID4gPiA+ID4gPiA+IEBAIC04NzYsNyArOTM4LDYgQEAgc3RhdGljIHN0cnVjdCBz
a19idWZmICpyZWNlaXZlX3NtYWxsKHN0cnVjdCBuZXRfZGV2aWNlICpkZXYsCj4gPiA+ID4gPiA+
ID4gPiA+ID4gICAgICAgICBzdHJ1Y3QgcGFnZSAqcGFnZSA9IHZpcnRfdG9faGVhZF9wYWdlKGJ1
Zik7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICB1bnNpZ25lZCBpbnQgZGVsdGEgPSAwOwo+
ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgc3RydWN0IHBhZ2UgKnhkcF9wYWdlOwo+ID4gPiA+
ID4gPiA+ID4gPiA+IC0gICAgICAgaW50IGVycjsKPiA+ID4gPiA+ID4gPiA+ID4gPiAgICAgICAg
IHVuc2lnbmVkIGludCBtZXRhc2l6ZSA9IDA7Cj4gPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gPiA+ID4gPiAgICAgICAgIGxlbiAtPSB2aS0+aGRyX2xlbjsKPiA+ID4gPiA+ID4gPiA+ID4g
PiBAQCAtODk4LDcgKzk1OSw2IEBAIHN0YXRpYyBzdHJ1Y3Qgc2tfYnVmZiAqcmVjZWl2ZV9zbWFs
bChzdHJ1Y3QgbmV0X2RldmljZSAqZGV2LAo+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgeGRw
X3Byb2cgPSByY3VfZGVyZWZlcmVuY2UocnEtPnhkcF9wcm9nKTsKPiA+ID4gPiA+ID4gPiA+ID4g
PiAgICAgICAgIGlmICh4ZHBfcHJvZykgewo+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgdmlydGlvX25ldF9oZHJfbXJnX3J4YnVmICpoZHIgPSBidWYgKyBoZWFkZXJf
b2Zmc2V0Owo+ID4gPiA+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICBzdHJ1Y3QgeGRwX2Zy
YW1lICp4ZHBmOwo+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICBzdHJ1Y3QgeGRw
X2J1ZmYgeGRwOwo+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICB2b2lkICpvcmln
X2RhdGE7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgIHUzMiBhY3Q7Cj4gPiA+
ID4gPiA+ID4gPiA+ID4gQEAgLTkzMSw0NiArOTkxLDIyIEBAIHN0YXRpYyBzdHJ1Y3Qgc2tfYnVm
ZiAqcmVjZWl2ZV9zbWFsbChzdHJ1Y3QgbmV0X2RldmljZSAqZGV2LAo+ID4gPiA+ID4gPiA+ID4g
PiA+ICAgICAgICAgICAgICAgICB4ZHBfcHJlcGFyZV9idWZmKCZ4ZHAsIGJ1ZiArIFZJUlRORVRf
UlhfUEFEICsgdmktPmhkcl9sZW4sCj4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgeGRwX2hlYWRyb29tLCBsZW4sIHRydWUpOwo+ID4gPiA+ID4gPiA+
ID4gPiA+ICAgICAgICAgICAgICAgICBvcmlnX2RhdGEgPSB4ZHAuZGF0YTsKPiA+ID4gPiA+ID4g
PiA+ID4gPiAtICAgICAgICAgICAgICAgYWN0ID0gYnBmX3Byb2dfcnVuX3hkcCh4ZHBfcHJvZywg
JnhkcCk7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgIHN0YXRzLT54ZHBfcGFj
a2V0cysrOwo+ID4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICAg
ICAgICAgICAgYWN0ID0gdmlydG5ldF94ZHBfaGFuZGxlcih4ZHBfcHJvZywgJnhkcCwgZGV2LCB4
ZHBfeG1pdCwgc3RhdHMpOwo+ID4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+ID4g
ICAgICAgICAgICAgICAgIHN3aXRjaCAoYWN0KSB7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gLSAgICAg
ICAgICAgICAgIGNhc2UgWERQX1BBU1M6Cj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAg
ICAgIGNhc2UgVklSVE5FVF9YRFBfUkVTX1BBU1M6Cj4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgLyogUmVjYWxjdWxhdGUgbGVuZ3RoIGluIGNhc2UgYnBmIHByb2dy
YW0gY2hhbmdlZCBpdCAqLwo+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgIGRlbHRhID0gb3JpZ19kYXRhIC0geGRwLmRhdGE7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgbGVuID0geGRwLmRhdGFfZW5kIC0geGRwLmRhdGE7Cj4gPiA+
ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgbWV0YXNpemUgPSB4ZHAuZGF0
YSAtIHhkcC5kYXRhX21ldGE7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgYnJlYWs7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgIGNhc2UgWERQ
X1RYOgo+ID4gPiA+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIHN0YXRzLT54
ZHBfdHgrKzsKPiA+ID4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICB4ZHBm
ID0geGRwX2NvbnZlcnRfYnVmZl90b19mcmFtZSgmeGRwKTsKPiA+ID4gPiA+ID4gPiA+ID4gPiAt
ICAgICAgICAgICAgICAgICAgICAgICBpZiAodW5saWtlbHkoIXhkcGYpKQo+ID4gPiA+ID4gPiA+
ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBlcnJfeGRwOwo+ID4g
PiA+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGVyciA9IHZpcnRuZXRfeGRw
X3htaXQoZGV2LCAxLCAmeGRwZiwgMCk7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAg
ICAgICAgICAgICAgaWYgKHVubGlrZWx5KCFlcnIpKSB7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB4ZHBfcmV0dXJuX2ZyYW1lX3J4X25hcGkoeGRw
Zik7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgfSBlbHNlIGlm
ICh1bmxpa2VseShlcnIgPCAwKSkgewo+ID4gPiA+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdHJhY2VfeGRwX2V4Y2VwdGlvbih2aS0+ZGV2LCB4ZHBfcHJvZywg
YWN0KTsKPiA+ID4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGdvdG8gZXJyX3hkcDsKPiA+ID4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAg
ICB9Cj4gPiA+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgKnhkcF94bWl0
IHw9IFZJUlRJT19YRFBfVFg7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAg
ICAgICAgcmN1X3JlYWRfdW5sb2NrKCk7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAg
ICAgICAgICAgICAgZ290byB4ZHBfeG1pdDsKPiA+ID4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAg
ICAgICAgY2FzZSBYRFBfUkVESVJFQ1Q6Cj4gPiA+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAg
ICAgICAgICAgICAgc3RhdHMtPnhkcF9yZWRpcmVjdHMrKzsKPiA+ID4gPiA+ID4gPiA+ID4gPiAt
ICAgICAgICAgICAgICAgICAgICAgICBlcnIgPSB4ZHBfZG9fcmVkaXJlY3QoZGV2LCAmeGRwLCB4
ZHBfcHJvZyk7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgaWYg
KGVycikKPiA+ID4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGdvdG8gZXJyX3hkcDsKPiA+ID4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAg
ICAqeGRwX3htaXQgfD0gVklSVElPX1hEUF9SRURJUjsKPiA+ID4gPiA+ID4gPiA+ID4gPiArCj4g
PiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIGNhc2UgVklSVE5FVF9YRFBfUkVTX0NP
TlNVTUVEOgo+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHJjdV9y
ZWFkX3VubG9jaygpOwo+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
IGdvdG8geGRwX3htaXQ7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgIGRlZmF1
bHQ6Cj4gPiA+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgYnBmX3dhcm5f
aW52YWxpZF94ZHBfYWN0aW9uKHZpLT5kZXYsIHhkcF9wcm9nLCBhY3QpOwo+ID4gPiA+ID4gPiA+
ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGZhbGx0aHJvdWdoOwo+ID4gPiA+ID4gPiA+
ID4gPiA+IC0gICAgICAgICAgICAgICBjYXNlIFhEUF9BQk9SVEVEOgo+ID4gPiA+ID4gPiA+ID4g
PiA+IC0gICAgICAgICAgICAgICAgICAgICAgIHRyYWNlX3hkcF9leGNlcHRpb24odmktPmRldiwg
eGRwX3Byb2csIGFjdCk7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAg
ICAgZ290byBlcnJfeGRwOwo+ID4gPiA+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICBjYXNl
IFhEUF9EUk9QOgo+ID4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ID4gPiArICAg
ICAgICAgICAgICAgY2FzZSBWSVJUTkVUX1hEUF9SRVNfRFJPUDoKPiA+ID4gPiA+ID4gPiA+ID4g
PiAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGVycl94ZHA7Cj4gPiA+ID4gPiA+ID4gPiA+
ID4gICAgICAgICAgICAgICAgIH0KPiA+ID4gPiA+ID4gPiA+ID4gPiAgICAgICAgIH0KPiA+ID4g
PiA+ID4gPiA+ID4gPiBAQCAtMTI3Nyw3ICsxMzEzLDYgQEAgc3RhdGljIHN0cnVjdCBza19idWZm
ICpyZWNlaXZlX21lcmdlYWJsZShzdHJ1Y3QgbmV0X2RldmljZSAqZGV2LAo+ID4gPiA+ID4gPiA+
ID4gPiA+ICAgICAgICAgaWYgKHhkcF9wcm9nKSB7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAg
ICAgICAgICAgIHVuc2lnbmVkIGludCB4ZHBfZnJhZ3NfdHJ1ZXN6ID0gMDsKPiA+ID4gPiA+ID4g
PiA+ID4gPiAgICAgICAgICAgICAgICAgc3RydWN0IHNrYl9zaGFyZWRfaW5mbyAqc2hpbmZvOwo+
ID4gPiA+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICBzdHJ1Y3QgeGRwX2ZyYW1lICp4ZHBm
Owo+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICBzdHJ1Y3QgcGFnZSAqeGRwX3Bh
Z2U7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgIHN0cnVjdCB4ZHBfYnVmZiB4
ZHA7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgIHZvaWQgKmRhdGE7Cj4gPiA+
ID4gPiA+ID4gPiA+ID4gQEAgLTEyOTQsNDkgKzEzMjksMjIgQEAgc3RhdGljIHN0cnVjdCBza19i
dWZmICpyZWNlaXZlX21lcmdlYWJsZShzdHJ1Y3QgbmV0X2RldmljZSAqZGV2LAo+ID4gPiA+ID4g
PiA+ID4gPiA+ICAgICAgICAgICAgICAgICBpZiAodW5saWtlbHkoZXJyKSkKPiA+ID4gPiA+ID4g
PiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGVycl94ZHBfZnJhZ3M7Cj4gPiA+
ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgYWN0ID0g
YnBmX3Byb2dfcnVuX3hkcCh4ZHBfcHJvZywgJnhkcCk7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gLSAg
ICAgICAgICAgICAgIHN0YXRzLT54ZHBfcGFja2V0cysrOwo+ID4gPiA+ID4gPiA+ID4gPiA+ICsg
ICAgICAgICAgICAgICBhY3QgPSB2aXJ0bmV0X3hkcF9oYW5kbGVyKHhkcF9wcm9nLCAmeGRwLCBk
ZXYsIHhkcF94bWl0LCBzdGF0cyk7Cj4gPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+
ID4gPiAgICAgICAgICAgICAgICAgc3dpdGNoIChhY3QpIHsKPiA+ID4gPiA+ID4gPiA+ID4gPiAt
ICAgICAgICAgICAgICAgY2FzZSBYRFBfUEFTUzoKPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICAg
ICAgICAgICAgY2FzZSBWSVJUTkVUX1hEUF9SRVNfUEFTUzoKPiA+ID4gPiA+ID4gPiA+ID4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICBoZWFkX3NrYiA9IGJ1aWxkX3NrYl9mcm9tX3hkcF9idWZm
KGRldiwgdmksICZ4ZHAsIHhkcF9mcmFnc190cnVlc3opOwo+ID4gPiA+ID4gPiA+ID4gPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgIGlmICh1bmxpa2VseSghaGVhZF9za2IpKQo+ID4gPiA+ID4g
PiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBlcnJfeGRwX2Zy
YWdzOwo+ID4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgcmN1X3JlYWRfdW5sb2NrKCk7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuIGhlYWRfc2tiOwo+ID4gPiA+ID4gPiA+ID4gPiA+IC0g
ICAgICAgICAgICAgICBjYXNlIFhEUF9UWDoKPiA+ID4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAg
ICAgICAgICAgICAgICBzdGF0cy0+eGRwX3R4Kys7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gLSAgICAg
ICAgICAgICAgICAgICAgICAgeGRwZiA9IHhkcF9jb252ZXJ0X2J1ZmZfdG9fZnJhbWUoJnhkcCk7
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgaWYgKHVubGlrZWx5
KCF4ZHBmKSkgewo+ID4gPiA+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgbmV0ZGV2X2RiZyhkZXYsICJjb252ZXJ0IGJ1ZmYgdG8gZnJhbWUgZmFpbGVkIGZvciB4
ZHBcbiIpOwo+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiBOaXQ6IFRoaXMgZGVi
dWcgaXMgbG9zdCBhZnRlciB0aGUgY29udmVyc2lvbi4KPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+ID4gPiBXaWxsIGZpeC4KPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBUaGFua3Mu
Cj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiBUaGFu
a3MKPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGdvdG8gZXJyX3hkcF9mcmFnczsKPiA+ID4gPiA+ID4gPiA+ID4gPiAt
ICAgICAgICAgICAgICAgICAgICAgICB9Cj4gPiA+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAg
ICAgICAgICAgICAgZXJyID0gdmlydG5ldF94ZHBfeG1pdChkZXYsIDEsICZ4ZHBmLCAwKTsKPiA+
ID4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICBpZiAodW5saWtlbHkoIWVy
cikpIHsKPiA+ID4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHhkcF9yZXR1cm5fZnJhbWVfcnhfbmFwaSh4ZHBmKTsKPiA+ID4gPiA+ID4gPiA+ID4gPiAtICAg
ICAgICAgICAgICAgICAgICAgICB9IGVsc2UgaWYgKHVubGlrZWx5KGVyciA8IDApKSB7Cj4gPiA+
ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0cmFjZV94ZHBf
ZXhjZXB0aW9uKHZpLT5kZXYsIHhkcF9wcm9nLCBhY3QpOwo+ID4gPiA+ID4gPiA+ID4gPiA+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBlcnJfeGRwX2ZyYWdzOwo+ID4gPiA+
ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIH0KPiA+ID4gPiA+ID4gPiA+ID4g
PiAtICAgICAgICAgICAgICAgICAgICAgICAqeGRwX3htaXQgfD0gVklSVElPX1hEUF9UWDsKPiA+
ID4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICByY3VfcmVhZF91bmxvY2so
KTsKPiA+ID4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICBnb3RvIHhkcF94
bWl0Owo+ID4gPiA+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICBjYXNlIFhEUF9SRURJUkVD
VDoKPiA+ID4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICBzdGF0cy0+eGRw
X3JlZGlyZWN0cysrOwo+ID4gPiA+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAg
IGVyciA9IHhkcF9kb19yZWRpcmVjdChkZXYsICZ4ZHAsIHhkcF9wcm9nKTsKPiA+ID4gPiA+ID4g
PiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICBpZiAoZXJyKQo+ID4gPiA+ID4gPiA+ID4g
PiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBlcnJfeGRwX2ZyYWdzOwo+
ID4gPiA+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICp4ZHBfeG1pdCB8PSBW
SVJUSU9fWERQX1JFRElSOwo+ID4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ID4g
PiArICAgICAgICAgICAgICAgY2FzZSBWSVJUTkVUX1hEUF9SRVNfQ09OU1VNRUQ6Cj4gPiA+ID4g
PiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcmN1X3JlYWRfdW5sb2NrKCk7Cj4g
PiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgZ290byB4ZHBfeG1pdDsK
PiA+ID4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgZGVmYXVsdDoKPiA+ID4gPiA+ID4g
PiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICBicGZfd2Fybl9pbnZhbGlkX3hkcF9hY3Rp
b24odmktPmRldiwgeGRwX3Byb2csIGFjdCk7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAg
ICAgICAgICAgICAgICAgZmFsbHRocm91Z2g7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAg
ICAgICAgIGNhc2UgWERQX0FCT1JURUQ6Cj4gPiA+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAg
ICAgICAgICAgICAgdHJhY2VfeGRwX2V4Y2VwdGlvbih2aS0+ZGV2LCB4ZHBfcHJvZywgYWN0KTsK
PiA+ID4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICBmYWxsdGhyb3VnaDsK
PiA+ID4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgY2FzZSBYRFBfRFJPUDoKPiA+ID4g
PiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIGNhc2Ug
VklSVE5FVF9YRFBfUkVTX0RST1A6Cj4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgZ290byBlcnJfeGRwX2ZyYWdzOwo+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAg
ICAgICAgICB9Cj4gPiA+ID4gPiA+ID4gPiA+ID4gIGVycl94ZHBfZnJhZ3M6Cj4gPiA+ID4gPiA+
ID4gPiA+ID4gLS0KPiA+ID4gPiA+ID4gPiA+ID4gPiAyLjMyLjAuMy5nMDExOTVjZjlmCj4gPiA+
ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+ID4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4KPiA+ID4KPiA+Cj4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFp
bGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBz
Oi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0
aW9u
