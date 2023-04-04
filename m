Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7107E6D593A
	for <lists.virtualization@lfdr.de>; Tue,  4 Apr 2023 09:12:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C02F61012;
	Tue,  4 Apr 2023 07:12:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C02F61012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tZNa36tJdQrd; Tue,  4 Apr 2023 07:12:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D75256100F;
	Tue,  4 Apr 2023 07:12:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D75256100F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E88AC0089;
	Tue,  4 Apr 2023 07:12:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 60103C002F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Apr 2023 07:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CAF9410D0
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Apr 2023 07:12:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CAF9410D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RVvJ9DuE9Ljl
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Apr 2023 07:12:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9951B410A3
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9951B410A3
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Apr 2023 07:12:18 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0VfKhaH3_1680592332; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VfKhaH3_1680592332) by smtp.aliyun-inc.com;
 Tue, 04 Apr 2023 15:12:13 +0800
Message-ID: <1680592019.471209-2-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH net-next 3/8] virtio_net: introduce virtnet_xdp_handler()
 to seprate the logic of run xdp
Date: Tue, 4 Apr 2023 15:06:59 +0800
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
In-Reply-To: <CACGkMEt=dO+G89v+G8goOtgOHpzKdw_bUuL-o7u1g6tsP=bfJQ@mail.gmail.com>
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

T24gVHVlLCA0IEFwciAyMDIzIDE1OjAxOjM2ICswODAwLCBKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
ZWRoYXQuY29tPiB3cm90ZToKPiBPbiBUdWUsIEFwciA0LCAyMDIzIGF0IDI6NTXigK9QTSBYdWFu
IFpodW8gPHh1YW56aHVvQGxpbnV4LmFsaWJhYmEuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUdWUs
IDQgQXByIDIwMjMgMTQ6MzU6MDUgKzA4MDAsIEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5j
b20+IHdyb3RlOgo+ID4gPiBPbiBUdWUsIEFwciA0LCAyMDIzIGF0IDI6MjLigK9QTSBYdWFuIFpo
dW8gPHh1YW56aHVvQGxpbnV4LmFsaWJhYmEuY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9u
IFR1ZSwgNCBBcHIgMjAyMyAxMzowNDowMiArMDgwMCwgSmFzb24gV2FuZyA8amFzb3dhbmdAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiBPbiBNb24sIEFwciAzLCAyMDIzIGF0IDEyOjE34oCv
UE0gWHVhbiBaaHVvIDx4dWFuemh1b0BsaW51eC5hbGliYWJhLmNvbT4gd3JvdGU6Cj4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+IE9uIE1vbiwgMyBBcHIgMjAyMyAxMDo0MzowMyArMDgwMCwgSmFzb24g
V2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+ID4gT24gVHVlLCBN
YXIgMjgsIDIwMjMgYXQgODowNOKAr1BNIFh1YW4gWmh1byA8eHVhbnpodW9AbGludXguYWxpYmFi
YS5jb20+IHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IEF0IHByZXNlbnQs
IHdlIGhhdmUgdHdvIHNpbWlsYXIgbG9naWMgdG8gcGVyZm9ybSB0aGUgWERQIHByb2cuCj4gPiA+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gVGhlcmVmb3JlLCB0aGlzIFBBVENIIHNlcGFyYXRl
cyB0aGUgY29kZSBvZiBleGVjdXRpbmcgWERQLCB3aGljaCBpcwo+ID4gPiA+ID4gPiA+ID4gY29u
ZHVjaXZlIHRvIGxhdGVyIG1haW50ZW5hbmNlLgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IFh1YW4gWmh1byA8eHVhbnpodW9AbGludXguYWxpYmFiYS5jb20+
Cj4gPiA+ID4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ID4gPiA+ICBkcml2ZXJzL25ldC92aXJ0aW9f
bmV0LmMgfCAxNDIgKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiA+
ID4gPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDc1IGluc2VydGlvbnMoKyksIDY3IGRlbGV0aW9u
cygtKQo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L25ldC92aXJ0aW9fbmV0LmMgYi9kcml2ZXJzL25ldC92aXJ0aW9fbmV0LmMKPiA+ID4gPiA+ID4g
PiA+IGluZGV4IGJiNDI2OTU4Y2RkNC4uNzJiOWQ2ZWU0MDI0IDEwMDY0NAo+ID4gPiA+ID4gPiA+
ID4gLS0tIGEvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jCj4gPiA+ID4gPiA+ID4gPiArKysgYi9k
cml2ZXJzL25ldC92aXJ0aW9fbmV0LmMKPiA+ID4gPiA+ID4gPiA+IEBAIC0zMDEsNiArMzAxLDE1
IEBAIHN0cnVjdCBwYWRkZWRfdm5ldF9oZHIgewo+ID4gPiA+ID4gPiA+ID4gICAgICAgICBjaGFy
IHBhZGRpbmdbMTJdOwo+ID4gPiA+ID4gPiA+ID4gIH07Cj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+
ID4gPiA+ID4gK2VudW0gewo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAvKiB4ZHAgcGFzcyAqLwo+
ID4gPiA+ID4gPiA+ID4gKyAgICAgICBWSVJUTkVUX1hEUF9SRVNfUEFTUywKPiA+ID4gPiA+ID4g
PiA+ICsgICAgICAgLyogZHJvcCBwYWNrZXQuIHRoZSBjYWxsZXIgbmVlZHMgdG8gcmVsZWFzZSB0
aGUgcGFnZS4gKi8KPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgVklSVE5FVF9YRFBfUkVTX0RST1As
Cj4gPiA+ID4gPiA+ID4gPiArICAgICAgIC8qIHBhY2tldCBpcyBjb25zdW1lZCBieSB4ZHAuIHRo
ZSBjYWxsZXIgbmVlZHMgdG8gZG8gbm90aGluZy4gKi8KPiA+ID4gPiA+ID4gPiA+ICsgICAgICAg
VklSVE5FVF9YRFBfUkVTX0NPTlNVTUVELAo+ID4gPiA+ID4gPiA+ID4gK307Cj4gPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gPiBJJ2QgcHJlZmVyIHRoaXMgdG8gYmUgZG9uZSBvbiB0b3AgdW5sZXNz
IGl0IGlzIGEgbXVzdC4gQnV0IEkgZG9uJ3Qgc2VlCj4gPiA+ID4gPiA+ID4gYW55IGFkdmFudGFn
ZSBvZiBpbnRyb2R1Y2luZyB0aGlzLCBpdCdzIHBhcnRpYWwgbWFwcGluZyBvZiBYRFAgYWN0aW9u
Cj4gPiA+ID4gPiA+ID4gYW5kIGl0IG5lZWRzIHRvIGJlIGV4dGVuZGVkIHdoZW4gWERQIGFjdGlv
biBpcyBleHRlbmRlZC4gKEFuZCB3ZSd2ZQo+ID4gPiA+ID4gPiA+IGFscmVhZHkgaGFkOiBWSVJU
SU9fWERQX1JFRElSIGFuZCBWSVJUSU9fWERQX1RYIC4uLikKPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gTm8sIHRoZXNlIGFyZSB0aGUgdGhyZWUgc3RhdGVzIG9mIGJ1ZmZlciBhZnRlciBYRFAgcHJv
Y2Vzc2luZy4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gKiBQQVNTOiBnb3RvIG1ha2Ugc2tiCj4g
PiA+ID4gPgo+ID4gPiA+ID4gWERQX1BBU1MgZ29lcyBmb3IgdGhpcy4KPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+ICogRFJPUDogd2Ugc2hvdWxkIHJlbGVhc2UgYnVmZmVyCj4gPiA+ID4gPgo+ID4gPiA+
ID4gWERQX0RST1AgYW5kIGVycm9yIGNvbmRpdGlvbnMgZ28gd2l0aCB0aGlzLgo+ID4gPiA+ID4K
PiA+ID4gPiA+ID4gKiBDVU5TVU1FRDogeGRwIHByb2cgdXNlZCB0aGUgYnVmZmVyLCB3ZSBkbyBu
b3RoaW5nCj4gPiA+ID4gPgo+ID4gPiA+ID4gWERQX1RYL1hEUF9SRURJUkVDVElPTiBnb2VzIGZv
ciB0aGlzLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFNvIHQgdmlydG5ldF94ZHBfaGFuZGxlcigpIGp1
c3QgbWFwcyBYRFAgQUNUSU9OIHBsdXMgdGhlIGVycm9yCj4gPiA+ID4gPiBjb25kaXRpb25zIHRv
IHRoZSBhYm92ZSB0aHJlZSBzdGF0ZXMuCj4gPiA+ID4gPgo+ID4gPiA+ID4gV2UgY2FuIHNpbXBs
eSBtYXAgZXJyb3IgdG8gWERQX0RST1AgbGlrZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiAgICAgICAg
Y2FzZSBYRFBfVFg6Cj4gPiA+ID4gPiAgICAgICAgICAgICAgIHN0YXRzLT54ZHBfdHgrKzsKPiA+
ID4gPiA+ICAgICAgICAgICAgICAgIHhkcGYgPSB4ZHBfY29udmVydF9idWZmX3RvX2ZyYW1lKHhk
cCk7Cj4gPiA+ID4gPiAgICAgICAgICAgICAgICBpZiAodW5saWtlbHkoIXhkcGYpKQo+ID4gPiA+
ID4gICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gWERQX0RST1A7Cj4gPiA+ID4gPgo+ID4g
PiA+ID4gQSBnb29kIHNpZGUgZWZmZWN0IGlzIHRvIGF2b2lkIHRoZSB4ZHBfeG1pdCBwb2ludGVy
IHRvIGJlIHBhc3NlZCB0bwo+ID4gPiA+ID4gdGhlIGZ1bmN0aW9uLgo+ID4gPiA+Cj4gPiA+ID4K
PiA+ID4gPiBTbywgSSBndWVzcyB5b3UgbWVhbiB0aGlzOgo+ID4gPiA+Cj4gPiA+ID4gICAgICAg
ICBzd2l0Y2ggKGFjdCkgewo+ID4gPiA+ICAgICAgICAgY2FzZSBYRFBfUEFTUzoKPiA+ID4gPiAg
ICAgICAgICAgICAgICAgLyogaGFuZGxlIHBhc3MgKi8KPiA+ID4gPiAgICAgICAgICAgICAgICAg
cmV0dXJuIHNrYjsKPiA+ID4gPgo+ID4gPiA+ICAgICAgICAgY2FzZSBYRFBfVFg6Cj4gPiA+ID4g
ICAgICAgICAgICAgICAgICp4ZHBfeG1pdCB8PSBWSVJUSU9fWERQX1RYOwo+ID4gPiA+ICAgICAg
ICAgICAgICAgICBnb3RvIHhtaXQ7Cj4gPiA+ID4KPiA+ID4gPiAgICAgICAgIGNhc2UgWERQX1JF
RElSRUNUOgo+ID4gPiA+ICAgICAgICAgICAgICAgICAqeGRwX3htaXQgfD0gVklSVElPX1hEUF9S
RURJUjsKPiA+ID4gPiAgICAgICAgICAgICAgICAgZ290byB4bWl0Owo+ID4gPiA+Cj4gPiA+ID4g
ICAgICAgICBjYXNlIFhEUF9EUk9QOgo+ID4gPiA+ICAgICAgICAgZGVmYXVsdDoKPiA+ID4gPiAg
ICAgICAgICAgICAgICAgZ290byBlcnJfeGRwOwo+ID4gPiA+ICAgICAgICAgfQo+ID4gPiA+Cj4g
PiA+ID4gSSBoYXZlIHRvIHNheSB0aGVyZSBpcyBubyBwcm9ibGVtIGZyb20gdGhlIHBlcnNwZWN0
aXZlIG9mIGNvZGUgaW1wbGVtZW50YXRpb24uCj4gPiA+Cj4gPiA+IE5vdGUgdGhhdCB0aGlzIGlz
IHRoZSBjdXJyZW50IGxvZ2ljIHdoZXJlIGl0IGlzIGRldGVybWluZWQgaW4KPiA+ID4gcmVjZWl2
ZV9zbWFsbCgpIGFuZCByZWNlaXZlX21lcmdlYWJsZSgpLgo+ID4KPiA+IFllcywgYnV0IHRoZSBw
dXJwb3NlIG9mIHRoaXMgcGF0Y2hlcyBpcyB0byBzaW1wbGlmeSB0aGUgY2FsbC4KPgo+IFlvdSBt
ZWFuIHNpbXBsaWZ5IHRoZSByZWNlaXZlX3NtYWxsKCkvbWVyZ2VhYmxlKCk/CgpZRVMuCgoKPgo+
ID4KPiA+ID4KPiA+ID4gPgo+ID4gPiA+IEJ1dCBpZiB0aGUgYSBuZXcgQUNUSU9OIGxpa2luZyBY
RFBfVFgsWERQX1JFRElSRUNUIGlzIGFkZGVkIGluIHRoZSBmdXR1cmUsIHRoZW4KPiA+ID4gPiB3
ZSBtdXN0IG1vZGlmeSBhbGwgdGhlIGNhbGxlcnMuCj4gPiA+Cj4gPiA+IFRoaXMgaXMgZmluZSBz
aW5jZSB3ZSBvbmx5IHVzZSBhIHNpbmdsZSB0eXBlIGZvciBYRFAgYWN0aW9uLgo+ID4KPiA+IGEg
c2luZ2xlIHR5cGU/Cj4KPiBJbnN0ZWFkIG9mIChwYXJ0aWFsKSBkdXBsaWNhdGluZyBYRFAgYWN0
aW9ucyBpbiB0aGUgbmV3IGVudW1zLgoKCkkgdGhpbmsgaXQncyByZWFsbHkgbWlzdW5kZXJzdGFu
ZCBoZXJlLiBTbyB5b3VyIHRob3VnaHQgaXMgdGhlc2U/CgogICBWSVJUTkVUX1hEUF9SRVNfUEFT
UywKICAgVklSVE5FVF9YRFBfUkVTX1RYX1JFRElSRUNULAogICBWSVJUTkVUX1hEUF9SRVNfRFJP
UCwKCgoKPgo+ID4KPiA+ID4KPiA+ID4gPiBUaGlzIGlzIHRoZSBiZW5lZml0IG9mIHVzaW5nIENV
TlNVTUVELgo+ID4gPgo+ID4gPiBJdCdzIHZlcnkgaGFyZCB0byBzYXksIGUuZyBpZiB3ZSB3YW50
IHRvIHN1cHBvcnQgY2xvbmluZyBpbiB0aGUgZnV0dXJlLgo+ID4KPiA+IGNsb25pbmc/IFlvdSBt
ZWFuIGNsb25lIG9uZSBuZXcgYnVmZmVyLgo+ID4KPiA+IEl0IGlzIHRydWUgdGhhdCBubyBtYXR0
ZXIgd2hhdCByZWFsaXphdGlvbiwgdGhlIGxvZ2ljIG11c3QgYmUgbW9kaWZpZWQuCj4KPiBZZXMu
Cj4KPiA+Cj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBJIHRoaW5rIGl0IGlzIGEgZ29vZCBhZHZhbnRh
Z2UgdG8gcHV0IHhkcF94bWl0IGluIHZpcnRuZXRfeGRwX2hhbmRsZXIoKSwKPiA+ID4gPiB3aGlj
aCBtYWtlcyB0aGUgY2FsbGVyIG5vdCBjYXJlIHRvbyBtdWNoIGFib3V0IHRoZXNlIGRldGFpbHMu
Cj4gPiA+Cj4gPiA+IFRoaXMgcGFydCBJIGRvbid0IHVuZGVyc3RhbmQsIGhhdmluZyB4ZHBfeG1p
dCBtZWFucyB0aGUgY2FsbGVyIG5lZWQgdG8KPiA+ID4ga25vdyB3aGV0aGVyIGl0IGlzIHhtaXRl
ZCBvciByZWRpcmVjdGVkLiBUaGUgcG9pbnQgb2YgdGhlIGVudW0gaXMgdG8KPiA+ID4gaGlkZSB0
aGUgWERQIGFjdGlvbnMsIGJ1dCBpdCdzIGNvbmZsaWN0IHdpdGggd2hhdCB4ZHBfeG1pdCB3aG8g
d2FudCB0bwo+ID4gPiBleHBvc2UgKHBhcnQgb2YpIHRoZSBYRFAgYWN0aW9ucy4KPiA+Cj4gPiBJ
IG1lYW4sIG5vIG1hdHRlciB3aGF0IHZpcnRuZXRfeGRwX2hhbmRsZXIgKCkgcmV0dXJucz8gWERQ
X0FDVElPTiBvciBzb21lIG9uZSBJCj4gPiBkZWZpbmVkLCBJIHdhbnQgdG8gaGlkZSB0aGUgbW9k
aWZpY2F0aW9uIG9mIHhkcF94bWl0IHRvIHZpcnRuZXRfeGRwX2hhbmRsZXIoKS4KPiA+Cj4gPiBF
dmVuIGlmIHZpcnRuZXRfeGRwX2hhbmRsZXIoKSByZXR1cm5zIFhEUF9UWCwgd2UgY2FuIGFsc28g
Y29tcGxldGUgdGhlCj4gPiBtb2RpZmljYXRpb24gb2YgWERQX1hNSVQgd2l0aGluIFZpcnRuZXRf
eGRwX2hhbmRsZXIoKS4KPiA+Cj4gPgo+ID4gPgo+ID4gPiA+IElmIHlvdSB0YWtlIGludG8KPiA+
ID4gPiBhY2NvdW50IHRoZSBwcm9ibGVtIG9mIGluY3JlYXNpbmcgdGhlIG51bWJlciBvZiBwYXJh
bWV0ZXJzLCBJIGFkdmlzZSB0byBwdXQgaXQKPiA+ID4gPiBpbiBycS4KPiA+ID4KPiA+ID4gSSBk
b24ndCBoYXZlIHN0cm9uZyBvcGluaW9uIHRvIGludHJvZHVjZSB0aGUgZW51bSwKPiA+Cj4gPiBP
SywgSSB3aWxsIGRyb3AgdGhlc2UgbmV3IGVudW1zLgo+Cj4gSnVzdCB0byBtYWtlIHN1cmUgd2Ug
YXJlIGF0IHRoZSBzYW1lIHBhZ2UuIEkgbWVhbiwgaWYgdGhlcmUgaXMgbm8KPiBvYmplY3Rpb24g
ZnJvbSBvdGhlcnMsIEknbSBvayB0byBoYXZlIGFuIGVudW0sIGJ1dCB3ZSBuZWVkIHRvIHVzZSBh
Cj4gc2VwYXJhdGUgcGF0Y2ggdG8gZG8gdGhhdC4KCkRvIHlvdSByZWZlciB0byBpbnRyb2R1Y2Ug
ZW51bXMgYWxvbmUgd2l0aG91dCB2aXJ0bmV0X3hkcF9oYW5kbGVyKCk/Cgo+Cj4gPgo+ID4gPiB3
aGF0IEkgd2FudCB0byBzYXkKPiA+ID4gaXMsIHVzZSBhIHNlcGFyYXRlZCBwYXRjaCB0byBkbyB0
aGF0Lgo+ID4KPiA+IERvZXMgdGhpcyBwYXJ0IHJlZmVyIHRvIHB1dHRpbmcgeGRwX3htaXQgaW4g
cnE/Cj4KPiBJIG1lYW4gaXQncyBiZXR0ZXIgdG8gYmUgZG9uZSBzZXBhcmF0ZWx5LiBCdXQgSSBk
b24ndCBzZWUgdGhlCj4gYWR2YW50YWdlIG9mIHRoaXMgb3RoZXIgdGhhbiByZWR1Y2luZyB0aGUg
cGFyYW1ldGVycy4KCkkgdGhpbmsgc28gYWxzby4KClRoYW5rcy4KCgo+Cj4gVGhhbmtzCj4KPiA+
Cj4gPiBUaGFua3MuCj4gPgo+ID4KPiA+ID4KPiA+ID4gVGhhbmtzCj4gPiA+Cj4gPiA+ID4KPiA+
ID4gPiBUaGFua3MuCj4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiBUaGUgbGF0dGVyIHR3byBhcmUgbm90IHBhcnRpY3VsYXJseSByZWxhdGVk
IHRvIFhEUCBBQ1RJT04uIEFuZCBpdCBkb2VzIG5vdCBuZWVkCj4gPiA+ID4gPiA+IHRvIGV4dGVu
ZCB3aGVuIFhEUCBhY3Rpb24gaXMgZXh0ZW5kZWQuIEF0IGxlYXN0IEkgaGF2ZSBub3QgdGhvdWdo
dCBvZiB0aGlzCj4gPiA+ID4gPiA+IHNpdHVhdGlvbi4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBXaGF0
J3MgdGhlIGFkdmFudGFnZXMgb2Ygc3VjaCBpbmRpcmVjdGlvbiBjb21wYXJlZCB0byB1c2luZyBY
RFAgYWN0aW9uIGRpcmVjdGx5Pwo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoYW5rcwo+ID4gPiA+ID4K
PiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gKwo+
ID4gPiA+ID4gPiA+ID4gIHN0YXRpYyB2b2lkIHZpcnRuZXRfcnFfZnJlZV91bnVzZWRfYnVmKHN0
cnVjdCB2aXJ0cXVldWUgKnZxLCB2b2lkICpidWYpOwo+ID4gPiA+ID4gPiA+ID4gIHN0YXRpYyB2
b2lkIHZpcnRuZXRfc3FfZnJlZV91bnVzZWRfYnVmKHN0cnVjdCB2aXJ0cXVldWUgKnZxLCB2b2lk
ICpidWYpOwo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IEBAIC03ODksNiArNzk4LDU5
IEBAIHN0YXRpYyBpbnQgdmlydG5ldF94ZHBfeG1pdChzdHJ1Y3QgbmV0X2RldmljZSAqZGV2LAo+
ID4gPiA+ID4gPiA+ID4gICAgICAgICByZXR1cm4gcmV0Owo+ID4gPiA+ID4gPiA+ID4gIH0KPiA+
ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiArc3RhdGljIGludCB2aXJ0bmV0X3hkcF9oYW5k
bGVyKHN0cnVjdCBicGZfcHJvZyAqeGRwX3Byb2csIHN0cnVjdCB4ZHBfYnVmZiAqeGRwLAo+ID4g
PiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBuZXRfZGV2
aWNlICpkZXYsCj4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dW5zaWduZWQgaW50ICp4ZHBfeG1pdCwKPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzdHJ1Y3QgdmlydG5ldF9ycV9zdGF0cyAqc3RhdHMpCj4gPiA+ID4gPiA+
ID4gPiArewo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICBzdHJ1Y3QgeGRwX2ZyYW1lICp4ZHBmOwo+
ID4gPiA+ID4gPiA+ID4gKyAgICAgICBpbnQgZXJyOwo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICB1
MzIgYWN0Owo+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICBhY3QgPSBi
cGZfcHJvZ19ydW5feGRwKHhkcF9wcm9nLCB4ZHApOwo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICBz
dGF0cy0+eGRwX3BhY2tldHMrKzsKPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ICsg
ICAgICAgc3dpdGNoIChhY3QpIHsKPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgY2FzZSBYRFBfUEFT
UzoKPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gVklSVE5FVF9YRFBfUkVT
X1BBU1M7Cj4gPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gPiArICAgICAgIGNhc2UgWERQ
X1RYOgo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIHN0YXRzLT54ZHBfdHgrKzsKPiA+
ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICB4ZHBmID0geGRwX2NvbnZlcnRfYnVmZl90b19m
cmFtZSh4ZHApOwo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIGlmICh1bmxpa2VseSgh
eGRwZikpCj4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gVklS
VE5FVF9YRFBfUkVTX0RST1A7Cj4gPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gPiArICAg
ICAgICAgICAgICAgZXJyID0gdmlydG5ldF94ZHBfeG1pdChkZXYsIDEsICZ4ZHBmLCAwKTsKPiA+
ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBpZiAodW5saWtlbHkoIWVycikpIHsKPiA+ID4g
PiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHhkcF9yZXR1cm5fZnJhbWVfcnhfbmFw
aSh4ZHBmKTsKPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICB9IGVsc2UgaWYgKHVubGlr
ZWx5KGVyciA8IDApKSB7Cj4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICB0
cmFjZV94ZHBfZXhjZXB0aW9uKGRldiwgeGRwX3Byb2csIGFjdCk7Cj4gPiA+ID4gPiA+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gVklSVE5FVF9YRFBfUkVTX0RST1A7Cj4gPiA+
ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgfQo+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4g
PiA+ID4gKyAgICAgICAgICAgICAgICp4ZHBfeG1pdCB8PSBWSVJUSU9fWERQX1RYOwo+ID4gPiA+
ID4gPiA+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBWSVJUTkVUX1hEUF9SRVNfQ09OU1VNRUQ7
Cj4gPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gPiArICAgICAgIGNhc2UgWERQX1JFRElS
RUNUOgo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIHN0YXRzLT54ZHBfcmVkaXJlY3Rz
Kys7Cj4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgZXJyID0geGRwX2RvX3JlZGlyZWN0
KGRldiwgeGRwLCB4ZHBfcHJvZyk7Cj4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgaWYg
KGVycikKPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBWSVJU
TkVUX1hEUF9SRVNfRFJPUDsKPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ICsgICAg
ICAgICAgICAgICAqeGRwX3htaXQgfD0gVklSVElPX1hEUF9SRURJUjsKPiA+ID4gPiA+ID4gPiA+
ICsgICAgICAgICAgICAgICByZXR1cm4gVklSVE5FVF9YRFBfUkVTX0NPTlNVTUVEOwo+ID4gPiA+
ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICBkZWZhdWx0Ogo+ID4gPiA+ID4gPiA+
ID4gKyAgICAgICAgICAgICAgIGJwZl93YXJuX2ludmFsaWRfeGRwX2FjdGlvbihkZXYsIHhkcF9w
cm9nLCBhY3QpOwo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIGZhbGx0aHJvdWdoOwo+
ID4gPiA+ID4gPiA+ID4gKyAgICAgICBjYXNlIFhEUF9BQk9SVEVEOgo+ID4gPiA+ID4gPiA+ID4g
KyAgICAgICAgICAgICAgIHRyYWNlX3hkcF9leGNlcHRpb24oZGV2LCB4ZHBfcHJvZywgYWN0KTsK
PiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBmYWxsdGhyb3VnaDsKPiA+ID4gPiA+ID4g
PiA+ICsgICAgICAgY2FzZSBYRFBfRFJPUDoKPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAg
ICByZXR1cm4gVklSVE5FVF9YRFBfUkVTX0RST1A7Cj4gPiA+ID4gPiA+ID4gPiArICAgICAgIH0K
PiA+ID4gPiA+ID4gPiA+ICt9Cj4gPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gPiAgc3Rh
dGljIHVuc2lnbmVkIGludCB2aXJ0bmV0X2dldF9oZWFkcm9vbShzdHJ1Y3QgdmlydG5ldF9pbmZv
ICp2aSkKPiA+ID4gPiA+ID4gPiA+ICB7Cj4gPiA+ID4gPiA+ID4gPiAgICAgICAgIHJldHVybiB2
aS0+eGRwX2VuYWJsZWQgPyBWSVJUSU9fWERQX0hFQURST09NIDogMDsKPiA+ID4gPiA+ID4gPiA+
IEBAIC04NzYsNyArOTM4LDYgQEAgc3RhdGljIHN0cnVjdCBza19idWZmICpyZWNlaXZlX3NtYWxs
KHN0cnVjdCBuZXRfZGV2aWNlICpkZXYsCj4gPiA+ID4gPiA+ID4gPiAgICAgICAgIHN0cnVjdCBw
YWdlICpwYWdlID0gdmlydF90b19oZWFkX3BhZ2UoYnVmKTsKPiA+ID4gPiA+ID4gPiA+ICAgICAg
ICAgdW5zaWduZWQgaW50IGRlbHRhID0gMDsKPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgc3RydWN0
IHBhZ2UgKnhkcF9wYWdlOwo+ID4gPiA+ID4gPiA+ID4gLSAgICAgICBpbnQgZXJyOwo+ID4gPiA+
ID4gPiA+ID4gICAgICAgICB1bnNpZ25lZCBpbnQgbWV0YXNpemUgPSAwOwo+ID4gPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgbGVuIC09IHZpLT5oZHJfbGVuOwo+ID4gPiA+ID4g
PiA+ID4gQEAgLTg5OCw3ICs5NTksNiBAQCBzdGF0aWMgc3RydWN0IHNrX2J1ZmYgKnJlY2VpdmVf
c21hbGwoc3RydWN0IG5ldF9kZXZpY2UgKmRldiwKPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgeGRw
X3Byb2cgPSByY3VfZGVyZWZlcmVuY2UocnEtPnhkcF9wcm9nKTsKPiA+ID4gPiA+ID4gPiA+ICAg
ICAgICAgaWYgKHhkcF9wcm9nKSB7Cj4gPiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgc3Ry
dWN0IHZpcnRpb19uZXRfaGRyX21yZ19yeGJ1ZiAqaGRyID0gYnVmICsgaGVhZGVyX29mZnNldDsK
PiA+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICBzdHJ1Y3QgeGRwX2ZyYW1lICp4ZHBmOwo+
ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgIHN0cnVjdCB4ZHBfYnVmZiB4ZHA7Cj4gPiA+
ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgdm9pZCAqb3JpZ19kYXRhOwo+ID4gPiA+ID4gPiA+
ID4gICAgICAgICAgICAgICAgIHUzMiBhY3Q7Cj4gPiA+ID4gPiA+ID4gPiBAQCAtOTMxLDQ2ICs5
OTEsMjIgQEAgc3RhdGljIHN0cnVjdCBza19idWZmICpyZWNlaXZlX3NtYWxsKHN0cnVjdCBuZXRf
ZGV2aWNlICpkZXYsCj4gPiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgeGRwX3ByZXBhcmVf
YnVmZigmeGRwLCBidWYgKyBWSVJUTkVUX1JYX1BBRCArIHZpLT5oZHJfbGVuLAo+ID4gPiA+ID4g
PiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgeGRwX2hlYWRyb29tLCBsZW4s
IHRydWUpOwo+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgIG9yaWdfZGF0YSA9IHhkcC5k
YXRhOwo+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgIGFjdCA9IGJwZl9wcm9nX3J1bl94
ZHAoeGRwX3Byb2csICZ4ZHApOwo+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgIHN0YXRz
LT54ZHBfcGFja2V0cysrOwo+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gKyAgICAg
ICAgICAgICAgIGFjdCA9IHZpcnRuZXRfeGRwX2hhbmRsZXIoeGRwX3Byb2csICZ4ZHAsIGRldiwg
eGRwX3htaXQsIHN0YXRzKTsKPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiAgICAgICAg
ICAgICAgICAgc3dpdGNoIChhY3QpIHsKPiA+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICBj
YXNlIFhEUF9QQVNTOgo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIGNhc2UgVklSVE5F
VF9YRFBfUkVTX1BBU1M6Cj4gPiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAv
KiBSZWNhbGN1bGF0ZSBsZW5ndGggaW4gY2FzZSBicGYgcHJvZ3JhbSBjaGFuZ2VkIGl0ICovCj4g
PiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICBkZWx0YSA9IG9yaWdfZGF0YSAt
IHhkcC5kYXRhOwo+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgbGVuID0g
eGRwLmRhdGFfZW5kIC0geGRwLmRhdGE7Cj4gPiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICBtZXRhc2l6ZSA9IHhkcC5kYXRhIC0geGRwLmRhdGFfbWV0YTsKPiA+ID4gPiA+ID4g
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gPiA+ID4gPiA+ID4gLSAgICAg
ICAgICAgICAgIGNhc2UgWERQX1RYOgo+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAg
ICAgICAgc3RhdHMtPnhkcF90eCsrOwo+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAg
ICAgICAgeGRwZiA9IHhkcF9jb252ZXJ0X2J1ZmZfdG9fZnJhbWUoJnhkcCk7Cj4gPiA+ID4gPiA+
ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICBpZiAodW5saWtlbHkoIXhkcGYpKQo+ID4gPiA+
ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGVycl94ZHA7Cj4g
PiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICBlcnIgPSB2aXJ0bmV0X3hkcF94
bWl0KGRldiwgMSwgJnhkcGYsIDApOwo+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAg
ICAgICAgaWYgKHVubGlrZWx5KCFlcnIpKSB7Cj4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHhkcF9yZXR1cm5fZnJhbWVfcnhfbmFwaSh4ZHBmKTsKPiA+ID4g
PiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIH0gZWxzZSBpZiAodW5saWtlbHkoZXJy
IDwgMCkpIHsKPiA+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dHJhY2VfeGRwX2V4Y2VwdGlvbih2aS0+ZGV2LCB4ZHBfcHJvZywgYWN0KTsKPiA+ID4gPiA+ID4g
PiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBlcnJfeGRwOwo+ID4gPiA+
ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgfQo+ID4gPiA+ID4gPiA+ID4gLSAgICAg
ICAgICAgICAgICAgICAgICAgKnhkcF94bWl0IHw9IFZJUlRJT19YRFBfVFg7Cj4gPiA+ID4gPiA+
ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICByY3VfcmVhZF91bmxvY2soKTsKPiA+ID4gPiA+
ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGdvdG8geGRwX3htaXQ7Cj4gPiA+ID4gPiA+
ID4gPiAtICAgICAgICAgICAgICAgY2FzZSBYRFBfUkVESVJFQ1Q6Cj4gPiA+ID4gPiA+ID4gPiAt
ICAgICAgICAgICAgICAgICAgICAgICBzdGF0cy0+eGRwX3JlZGlyZWN0cysrOwo+ID4gPiA+ID4g
PiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgZXJyID0geGRwX2RvX3JlZGlyZWN0KGRldiwg
JnhkcCwgeGRwX3Byb2cpOwo+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAg
aWYgKGVycikKPiA+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Z290byBlcnJfeGRwOwo+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgKnhk
cF94bWl0IHw9IFZJUlRJT19YRFBfUkVESVI7Cj4gPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+
ID4gPiArICAgICAgICAgICAgICAgY2FzZSBWSVJUTkVUX1hEUF9SRVNfQ09OU1VNRUQ6Cj4gPiA+
ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICByY3VfcmVhZF91bmxvY2soKTsKPiA+
ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8geGRwX3htaXQ7Cj4gPiA+
ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgZGVmYXVsdDoKPiA+ID4gPiA+ID4gPiA+IC0gICAg
ICAgICAgICAgICAgICAgICAgIGJwZl93YXJuX2ludmFsaWRfeGRwX2FjdGlvbih2aS0+ZGV2LCB4
ZHBfcHJvZywgYWN0KTsKPiA+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGZh
bGx0aHJvdWdoOwo+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgIGNhc2UgWERQX0FCT1JU
RUQ6Cj4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICB0cmFjZV94ZHBfZXhj
ZXB0aW9uKHZpLT5kZXYsIHhkcF9wcm9nLCBhY3QpOwo+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAg
ICAgICAgICAgICAgICAgZ290byBlcnJfeGRwOwo+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAg
ICAgIGNhc2UgWERQX0RST1A6Cj4gPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gPiArICAg
ICAgICAgICAgICAgY2FzZSBWSVJUTkVUX1hEUF9SRVNfRFJPUDoKPiA+ID4gPiA+ID4gPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyX3hkcDsKPiA+ID4gPiA+ID4gPiA+ICAgICAg
ICAgICAgICAgICB9Cj4gPiA+ID4gPiA+ID4gPiAgICAgICAgIH0KPiA+ID4gPiA+ID4gPiA+IEBA
IC0xMjc3LDcgKzEzMTMsNiBAQCBzdGF0aWMgc3RydWN0IHNrX2J1ZmYgKnJlY2VpdmVfbWVyZ2Vh
YmxlKHN0cnVjdCBuZXRfZGV2aWNlICpkZXYsCj4gPiA+ID4gPiA+ID4gPiAgICAgICAgIGlmICh4
ZHBfcHJvZykgewo+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCB4
ZHBfZnJhZ3NfdHJ1ZXN6ID0gMDsKPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICBzdHJ1
Y3Qgc2tiX3NoYXJlZF9pbmZvICpzaGluZm87Cj4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAg
ICAgc3RydWN0IHhkcF9mcmFtZSAqeGRwZjsKPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAg
ICBzdHJ1Y3QgcGFnZSAqeGRwX3BhZ2U7Cj4gPiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAg
c3RydWN0IHhkcF9idWZmIHhkcDsKPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICB2b2lk
ICpkYXRhOwo+ID4gPiA+ID4gPiA+ID4gQEAgLTEyOTQsNDkgKzEzMjksMjIgQEAgc3RhdGljIHN0
cnVjdCBza19idWZmICpyZWNlaXZlX21lcmdlYWJsZShzdHJ1Y3QgbmV0X2RldmljZSAqZGV2LAo+
ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgIGlmICh1bmxpa2VseShlcnIpKQo+ID4gPiA+
ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgZ290byBlcnJfeGRwX2ZyYWdzOwo+ID4g
PiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICBhY3QgPSBicGZfcHJv
Z19ydW5feGRwKHhkcF9wcm9nLCAmeGRwKTsKPiA+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAg
ICBzdGF0cy0+eGRwX3BhY2tldHMrKzsKPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBh
Y3QgPSB2aXJ0bmV0X3hkcF9oYW5kbGVyKHhkcF9wcm9nLCAmeGRwLCBkZXYsIHhkcF94bWl0LCBz
dGF0cyk7Cj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgIHN3
aXRjaCAoYWN0KSB7Cj4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgY2FzZSBYRFBfUEFT
UzoKPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBjYXNlIFZJUlRORVRfWERQX1JFU19Q
QVNTOgo+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgaGVhZF9za2IgPSBi
dWlsZF9za2JfZnJvbV94ZHBfYnVmZihkZXYsIHZpLCAmeGRwLCB4ZHBfZnJhZ3NfdHJ1ZXN6KTsK
PiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGlmICh1bmxpa2VseSghaGVh
ZF9za2IpKQo+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBn
b3RvIGVycl94ZHBfZnJhZ3M7Cj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgcmN1X3JlYWRfdW5sb2NrKCk7Cj4gPiA+ID4gPiA+ID4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICByZXR1cm4gaGVhZF9za2I7Cj4gPiA+ID4gPiA+ID4gPiAtICAg
ICAgICAgICAgICAgY2FzZSBYRFBfVFg6Cj4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAg
ICAgICAgICBzdGF0cy0+eGRwX3R4Kys7Cj4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAg
ICAgICAgICB4ZHBmID0geGRwX2NvbnZlcnRfYnVmZl90b19mcmFtZSgmeGRwKTsKPiA+ID4gPiA+
ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGlmICh1bmxpa2VseSgheGRwZikpIHsKPiA+
ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbmV0ZGV2X2RiZyhk
ZXYsICJjb252ZXJ0IGJ1ZmYgdG8gZnJhbWUgZmFpbGVkIGZvciB4ZHBcbiIpOwo+ID4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+ID4gTml0OiBUaGlzIGRlYnVnIGlzIGxvc3QgYWZ0ZXIgdGhlIGNvbnZl
cnNpb24uCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFdpbGwgZml4Lgo+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiBUaGFua3MuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBU
aGFua3MKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBnb3RvIGVycl94ZHBfZnJhZ3M7Cj4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAg
ICAgICAgICAgICAgICB9Cj4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICBl
cnIgPSB2aXJ0bmV0X3hkcF94bWl0KGRldiwgMSwgJnhkcGYsIDApOwo+ID4gPiA+ID4gPiA+ID4g
LSAgICAgICAgICAgICAgICAgICAgICAgaWYgKHVubGlrZWx5KCFlcnIpKSB7Cj4gPiA+ID4gPiA+
ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHhkcF9yZXR1cm5fZnJhbWVfcnhf
bmFwaSh4ZHBmKTsKPiA+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIH0gZWxz
ZSBpZiAodW5saWtlbHkoZXJyIDwgMCkpIHsKPiA+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdHJhY2VfeGRwX2V4Y2VwdGlvbih2aS0+ZGV2LCB4ZHBfcHJvZywg
YWN0KTsKPiA+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290
byBlcnJfeGRwX2ZyYWdzOwo+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAg
fQo+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgKnhkcF94bWl0IHw9IFZJ
UlRJT19YRFBfVFg7Cj4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICByY3Vf
cmVhZF91bmxvY2soKTsKPiA+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGdv
dG8geGRwX3htaXQ7Cj4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgY2FzZSBYRFBfUkVE
SVJFQ1Q6Cj4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICBzdGF0cy0+eGRw
X3JlZGlyZWN0cysrOwo+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgZXJy
ID0geGRwX2RvX3JlZGlyZWN0KGRldiwgJnhkcCwgeGRwX3Byb2cpOwo+ID4gPiA+ID4gPiA+ID4g
LSAgICAgICAgICAgICAgICAgICAgICAgaWYgKGVycikKPiA+ID4gPiA+ID4gPiA+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZ290byBlcnJfeGRwX2ZyYWdzOwo+ID4gPiA+ID4gPiA+
ID4gLSAgICAgICAgICAgICAgICAgICAgICAgKnhkcF94bWl0IHw9IFZJUlRJT19YRFBfUkVESVI7
Cj4gPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgY2FzZSBW
SVJUTkVUX1hEUF9SRVNfQ09OU1VNRUQ6Cj4gPiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICByY3VfcmVhZF91bmxvY2soKTsKPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgIGdvdG8geGRwX3htaXQ7Cj4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAg
ZGVmYXVsdDoKPiA+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGJwZl93YXJu
X2ludmFsaWRfeGRwX2FjdGlvbih2aS0+ZGV2LCB4ZHBfcHJvZywgYWN0KTsKPiA+ID4gPiA+ID4g
PiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGZhbGx0aHJvdWdoOwo+ID4gPiA+ID4gPiA+ID4g
LSAgICAgICAgICAgICAgIGNhc2UgWERQX0FCT1JURUQ6Cj4gPiA+ID4gPiA+ID4gPiAtICAgICAg
ICAgICAgICAgICAgICAgICB0cmFjZV94ZHBfZXhjZXB0aW9uKHZpLT5kZXYsIHhkcF9wcm9nLCBh
Y3QpOwo+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgZmFsbHRocm91Z2g7
Cj4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgY2FzZSBYRFBfRFJPUDoKPiA+ID4gPiA+
ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBjYXNlIFZJUlRORVRfWERQ
X1JFU19EUk9QOgo+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgZ290byBl
cnJfeGRwX2ZyYWdzOwo+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgIH0KPiA+ID4gPiA+
ID4gPiA+ICBlcnJfeGRwX2ZyYWdzOgo+ID4gPiA+ID4gPiA+ID4gLS0KPiA+ID4gPiA+ID4gPiA+
IDIuMzIuMC4zLmcwMTE5NWNmOWYKPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4KPiA+ID4g
PiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4KPiA+ID4KPiA+Cj4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZp
cnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGlu
dXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
