Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DDE39596A
	for <lists.virtualization@lfdr.de>; Mon, 31 May 2021 13:04:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 470C0831E3;
	Mon, 31 May 2021 11:04:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RTpqvqceCHqX; Mon, 31 May 2021 11:04:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2550E8329A;
	Mon, 31 May 2021 11:04:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1E10C0001;
	Mon, 31 May 2021 11:04:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AEDE8C0001
 for <virtualization@lists.linux-foundation.org>;
 Mon, 31 May 2021 11:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DF0640341
 for <virtualization@lists.linux-foundation.org>;
 Mon, 31 May 2021 11:04:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Gq7fR2qKClY
 for <virtualization@lists.linux-foundation.org>;
 Mon, 31 May 2021 11:04:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DF26D4033F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 31 May 2021 11:04:27 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R721e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04420; MF=xuanzhuo@linux.alibaba.com;
 NM=1; PH=DS; RN=11; SR=0; TI=SMTPD_---0Uaht2dq_1622459064; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0Uaht2dq_1622459064) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 31 May 2021 19:04:24 +0800
MIME-Version: 1.0
Message-Id: <1622458734.837168-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH net 2/2] virtio-net: get build_skb() buf by data ptr
Date: Mon, 31 May 2021 18:58:54 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Jason Wang <jasowang@redhat.com>
In-Reply-To: <2920ec92-43ac-714f-69b5-281467d1d5ad@redhat.com>
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, virtualization@lists.linux-foundation.org,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gTW9uLCAzMSBNYXkgMjAyMSAxNDoxMDo1NSArMDgwMCwgSmFzb24gV2FuZyA8amFzb3dhbmdA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiDlnKggMjAyMS81LzE0IOS4i+WNiDExOjE2LCBYdWFuIFpo
dW8g5YaZ6YGTOgo+ID4gSW4gdGhlIGNhc2Ugb2YgbWVyZ2UsIHRoZSBwYWdlIHBhc3NlZCBpbnRv
IHBhZ2VfdG9fc2tiKCkgbWF5IGJlIGEgaGVhZAo+ID4gcGFnZSwgbm90IHRoZSBwYWdlIHdoZXJl
IHRoZSBjdXJyZW50IGRhdGEgaXMgbG9jYXRlZC4KPgo+Cj4gSSBkb24ndCBnZXQgaG93IHRoaXMg
Y2FuIGhhcHBlbj8KPgo+IE1heWJlIHlvdSBjYW4gZXhwbGFpbiBhIGxpdHRsZSBiaXQgbW9yZT8K
Pgo+IHJlY2VpdmVfbWVyZ2VhYmxlKCkgY2FsbCBwYWdlX3RvX3NrYigpIGluIHR3byBwbGFjZXM6
Cj4KPiAxKSBYRFBfUEFTUyBmb3IgbGluZWFyaXplZCBwYWdlICwgaW4gdGhpcyBjYXNlIHdlIHVz
ZSB4ZHBfcGFnZQo+IDIpIHBhZ2VfdG9fc2tiKCkgZm9yICJub3JtYWwiIHBhZ2UsIGluIHRoaXMg
Y2FzZSB0aGUgcGFnZSBjb250YWlucyB0aGUgZGF0YQoKVGhlIG9mZnNldCBtYXkgYmUgZ3JlYXRl
ciB0aGFuIFBBR0VfU0laRSwgYmVjYXVzZSBwYWdlIGlzIG9idGFpbmVkIGJ5CnZpcnRfdG9faGVh
ZF9wYWdlKCksIG5vdCB0aGUgcGFnZSB3aGVyZSBidWYgaXMgbG9jYXRlZC4gQW5kICJvZmZzZXQi
IGlzIHRoZSBvZmZzZXQKb2YgYnVmIHJlbGF0aXZlIHRvIHBhZ2UuCgoJdGFpbHJvb20gPSB0cnVl
c2l6ZSAtIGxlbiAtIG9mZnNldDsKCkluIHRoaXMgY2FzZSwgdGhlIHRhaWxyb29tIG11c3QgYmUg
bGVzcyB0aGFuIDAuIEFsdGhvdWdoIHRoZXJlIG1heSBiZSBlbm91Z2gKY29udGVudCBvbiB0aGlz
IHBhZ2UgdG8gc2F2ZSBza2Jfc2hhcmVkX2luZm8uCgpUaGFua3MuCgo+Cj4gVGhhbmtzCj4KPgo+
ID4gU28gd2hlbiB0cnlpbmcgdG8KPiA+IGdldCB0aGUgYnVmIHdoZXJlIHRoZSBkYXRhIGlzIGxv
Y2F0ZWQsIHlvdSBzaG91bGQgZGlyZWN0bHkgdXNlIHRoZQo+ID4gcG9pbnRlcihwKSB0byBnZXQg
dGhlIGFkZHJlc3MgY29ycmVzcG9uZGluZyB0byB0aGUgcGFnZS4KPiA+Cj4gPiBBdCB0aGUgc2Ft
ZSB0aW1lLCB0aGUgb2Zmc2V0IG9mIHRoZSBkYXRhIGluIHRoZSBwYWdlIHNob3VsZCBhbHNvIGJl
Cj4gPiBvYnRhaW5lZCB1c2luZyBvZmZzZXRfaW5fcGFnZSgpLgo+ID4KPiA+IFRoaXMgcGF0Y2gg
c29sdmVzIHRoaXMgcHJvYmxlbS4gQnV0IGlmIHlvdSBkb27igJl0IHVzZSB0aGlzIHBhdGNoLCB0
aGUKPiA+IG9yaWdpbmFsIGNvZGUgY2FuIGFsc28gcnVuLCBiZWNhdXNlIGlmIHRoZSBwYWdlIGlz
IG5vdCB0aGUgcGFnZSBvZiB0aGUKPiA+IGN1cnJlbnQgZGF0YSwgdGhlIGNhbGN1bGF0ZWQgdGFp
bHJvb20gd2lsbCBiZSBsZXNzIHRoYW4gMCwgYW5kIHdpbGwgbm90Cj4gPiBlbnRlciB0aGUgbG9n
aWMgb2YgYnVpbGRfc2tiKCkgLiBUaGUgc2lnbmlmaWNhbmNlIG9mIHRoaXMgcGF0Y2ggaXMgdG8K
PiA+IG1vZGlmeSB0aGlzIGxvZ2ljYWwgcHJvYmxlbSwgYWxsb3dpbmcgbW9yZSBzaXR1YXRpb25z
IHRvIHVzZQo+ID4gYnVpbGRfc2tiKCkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWHVhbiBaaHVv
IDx4dWFuemh1b0BsaW51eC5hbGliYWJhLmNvbT4KPiA+IEFja2VkLWJ5OiBNaWNoYWVsIFMuIFRz
aXJraW4gPG1zdEByZWRoYXQuY29tPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvbmV0L3ZpcnRpb19u
ZXQuYyB8IDggKysrKysrLS0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvdmlydGlvX25l
dC5jIGIvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jCj4gPiBpbmRleCAzZTQ2YzEyZGRlMDguLjA3
M2ZlYzRjMGRmMSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbmV0L3ZpcnRpb19uZXQuYwo+ID4g
KysrIGIvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jCj4gPiBAQCAtNDA3LDggKzQwNywxMiBAQCBz
dGF0aWMgc3RydWN0IHNrX2J1ZmYgKnBhZ2VfdG9fc2tiKHN0cnVjdCB2aXJ0bmV0X2luZm8gKnZp
LAo+ID4gICAJCSAqIHNlZSBhZGRfcmVjdmJ1Zl9tZXJnZWFibGUoKSArIGdldF9tZXJnZWFibGVf
YnVmX2xlbigpCj4gPiAgIAkJICovCj4gPiAgIAkJdHJ1ZXNpemUgPSBQQUdFX1NJWkU7Cj4gPiAt
CQl0YWlscm9vbSA9IHRydWVzaXplIC0gbGVuIC0gb2Zmc2V0Owo+ID4gLQkJYnVmID0gcGFnZV9h
ZGRyZXNzKHBhZ2UpOwo+ID4gKwo+ID4gKwkJLyogcGFnZSBtYXliZSBoZWFkIHBhZ2UsIHNvIHdl
IHNob3VsZCBnZXQgdGhlIGJ1ZiBieSBwLCBub3QgdGhlCj4gPiArCQkgKiBwYWdlCj4gPiArCQkg
Ki8KPiA+ICsJCXRhaWxyb29tID0gdHJ1ZXNpemUgLSBsZW4gLSBvZmZzZXRfaW5fcGFnZShwKTsK
PiA+ICsJCWJ1ZiA9IChjaGFyICopKCh1bnNpZ25lZCBsb25nKXAgJiBQQUdFX01BU0spOwo+ID4g
ICAJfSBlbHNlIHsKPiA+ICAgCQl0YWlscm9vbSA9IHRydWVzaXplIC0gbGVuOwo+ID4gICAJCWJ1
ZiA9IHA7Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3ZpcnR1YWxpemF0aW9u
