Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id F018B4AD1BC
	for <lists.virtualization@lfdr.de>; Tue,  8 Feb 2022 07:47:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A885D40275;
	Tue,  8 Feb 2022 06:47:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ODG-_8avpxE3; Tue,  8 Feb 2022 06:47:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9895240181;
	Tue,  8 Feb 2022 06:47:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 06E4FC0073;
	Tue,  8 Feb 2022 06:47:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A9EEEC000B
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Feb 2022 06:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D44040178
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Feb 2022 06:47:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yLnZKbO4YHcp
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Feb 2022 06:47:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 416E540102
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Feb 2022 06:47:28 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=xuanzhuo@linux.alibaba.com;
 NM=1; PH=DS; RN=11; SR=0; TI=SMTPD_---0V3vFiDe_1644302843; 
Received: from fengidri.local(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0V3vFiDe_1644302843) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 08 Feb 2022 14:47:24 +0800
Subject: Re: [PATCH v3 13/17] virtio_pci: queue_reset: support
 VIRTIO_F_RING_RESET
To: Jason Wang <jasowang@redhat.com>
References: <20220126073533.44994-1-xuanzhuo@linux.alibaba.com>
 <0908a9f6-562d-fab5-39c3-2f0125acc80e@redhat.com>
 <1644220750.6834595-1-xuanzhuo@linux.alibaba.com>
 <CACGkMEuemxceN-uQ9Pg1bkaW6jba_jzWkoduRM_FqXUKQy26AA@mail.gmail.com>
From: xuanzhuo <xuanzhuo@linux.alibaba.com>
Message-ID: <79fd067f-d9e8-668d-9d1b-e1d909999d15@linux.alibaba.com>
Date: Tue, 8 Feb 2022 14:47:23 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CACGkMEuemxceN-uQ9Pg1bkaW6jba_jzWkoduRM_FqXUKQy26AA@mail.gmail.com>
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev <netdev@vger.kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

CgpPbiAyMDIyLzIvOCDkuIrljYgxMDo1NSwgSmFzb24gV2FuZyB3cm90ZToKPiBPbiBNb24sIEZl
YiA3LCAyMDIyIGF0IDQ6MTkgUE0gWHVhbiBaaHVvIDx4dWFuemh1b0BsaW51eC5hbGliYWJhLmNv
bT4gd3JvdGU6Cj4+IE9uIE1vbiwgNyBGZWIgMjAyMiAxNDo1NzoxMyArMDgwMCwgSmFzb24gV2Fu
ZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4gd3JvdGU6Cj4+PiDlnKggMjAyMi8xLzI2IOS4i+WNiDM6
MzUsIFh1YW4gWmh1byDlhpnpgZM6Cj4+Pj4gVGhpcyBwYXRjaCBpbXBsZW1lbnRzIHZpcnRpbyBw
Y2kgc3VwcG9ydCBmb3IgUVVFVUUgUkVTRVQuCj4+Pj4KPj4+PiBQZXJmb3JtaW5nIHJlc2V0IG9u
IGEgcXVldWUgaXMgZGl2aWRlZCBpbnRvIHR3byBzdGVwczoKPj4+Pgo+Pj4+IDEuIHJlc2V0X3Zx
OiByZXNldCBvbmUgdnEKPj4+PiAyLiBlbmFibGVfcmVzZXRfdnE6IHJlLWVuYWJsZSB0aGUgcmVz
ZXQgcXVldWUKPj4+Pgo+Pj4+IEluIHRoZSBmaXJzdCBzdGVwLCB0aGVzZSB0YXNrcyB3aWxsIGJl
IGNvbXBsZXRlZDoKPj4+PiAgICAgIDEuIG5vdGlmeSB0aGUgaGFyZHdhcmUgcXVldWUgdG8gcmVz
ZXQKPj4+PiAgICAgIDIuIHJlY3ljbGUgdGhlIGJ1ZmZlciBmcm9tIHZxCj4+Pj4gICAgICAzLiBy
ZWxlYXNlIHRoZSByaW5nIG9mIHRoZSB2cQo+Pj4+Cj4+Pj4gVGhlIHByb2Nlc3Mgb2YgZW5hYmxl
IHJlc2V0IHZxOgo+Pj4+ICAgICAgIHZwX21vZGVybl9lbmFibGVfcmVzZXRfdnEoKQo+Pj4+ICAg
ICAgIHZwX2VuYWJsZV9yZXNldF92cSgpCj4+Pj4gICAgICAgX192cF9zZXR1cF92cSgpCj4+Pj4g
ICAgICAgc2V0dXBfdnEoKQo+Pj4+ICAgICAgIHZyaW5nX3NldHVwX3ZpcnRxdWV1ZSgpCj4+Pj4K
Pj4+PiBJbiB0aGlzIHByb2Nlc3MsIHdlIGFkZGVkIHR3byBwYXJhbWV0ZXJzLCB2cSBhbmQgbnVt
LCBhbmQgZmluYWxseSBwYXNzZWQKPj4+PiB0aGVtIHRvIHZyaW5nX3NldHVwX3ZpcnRxdWV1ZSgp
LiAgQW5kIHJldXNlIHRoZSBvcmlnaW5hbCBpbmZvIGFuZCB2cS4KPj4+Pgo+Pj4+IFNpZ25lZC1v
ZmYtYnk6IFh1YW4gWmh1byA8eHVhbnpodW9AbGludXguYWxpYmFiYS5jb20+Cj4+Pj4gLS0tCj4+
Pj4gICAgZHJpdmVycy92aXJ0aW8vdmlydGlvX3BjaV9jb21tb24uYyB8ICAzNiArKysrKysrLS0t
LQo+Pj4+ICAgIGRyaXZlcnMvdmlydGlvL3ZpcnRpb19wY2lfY29tbW9uLmggfCAgIDUgKysKPj4+
PiAgICBkcml2ZXJzL3ZpcnRpby92aXJ0aW9fcGNpX21vZGVybi5jIHwgMTAwICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCj4+Pj4gICAgMyBmaWxlcyBjaGFuZ2VkLCAxMjggaW5zZXJ0aW9u
cygrKSwgMTMgZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aXJ0
aW8vdmlydGlvX3BjaV9jb21tb24uYyBiL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19wY2lfY29tbW9u
LmMKPj4+PiBpbmRleCBjMDI5MzZkMjlhMzEuLmFkMjE2MzhmYmY2NiAxMDA2NDQKPj4+PiAtLS0g
YS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcGNpX2NvbW1vbi5jCj4+Pj4gKysrIGIvZHJpdmVycy92
aXJ0aW8vdmlydGlvX3BjaV9jb21tb24uYwo+Pj4+IEBAIC0yMDUsMjMgKzIwNSwyOCBAQCBzdGF0
aWMgaW50IHZwX3JlcXVlc3RfbXNpeF92ZWN0b3JzKHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2
LCBpbnQgbnZlY3RvcnMsCj4+Pj4gICAgICByZXR1cm4gZXJyOwo+Pj4+ICAgIH0KPj4+Pgo+Pj4+
IC1zdGF0aWMgc3RydWN0IHZpcnRxdWV1ZSAqdnBfc2V0dXBfdnEoc3RydWN0IHZpcnRpb19kZXZp
Y2UgKnZkZXYsIHVuc2lnbmVkIGluZGV4LAo+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHZvaWQgKCpjYWxsYmFjaykoc3RydWN0IHZpcnRxdWV1ZSAqdnEpLAo+Pj4+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKm5hbWUsCj4+Pj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCBjdHgsCj4+Pj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdTE2IG1zaXhfdmVjLCB1MTYgbnVtKQo+Pj4+ICtzdHJ1Y3Qgdmly
dHF1ZXVlICp2cF9zZXR1cF92cShzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldiwgdW5zaWduZWQg
aW5kZXgsCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICgqY2FsbGJhY2spKHN0
cnVjdCB2aXJ0cXVldWUgKnZxKSwKPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0
IGNoYXIgKm5hbWUsCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICBib29sIGN0eCwKPj4+
PiArICAgICAgICAgICAgICAgICAgICAgICAgIHUxNiBtc2l4X3ZlYywgdTE2IG51bSkKPj4+PiAg
ICB7Cj4+Pj4gICAgICBzdHJ1Y3QgdmlydGlvX3BjaV9kZXZpY2UgKnZwX2RldiA9IHRvX3ZwX2Rl
dmljZSh2ZGV2KTsKPj4+PiAtICAgc3RydWN0IHZpcnRpb19wY2lfdnFfaW5mbyAqaW5mbyA9IGtt
YWxsb2Moc2l6ZW9mICppbmZvLCBHRlBfS0VSTkVMKTsKPj4+PiArICAgc3RydWN0IHZpcnRpb19w
Y2lfdnFfaW5mbyAqaW5mbzsKPj4+PiAgICAgIHN0cnVjdCB2aXJ0cXVldWUgKnZxOwo+Pj4+ICAg
ICAgdW5zaWduZWQgbG9uZyBmbGFnczsKPj4+Pgo+Pj4+IC0gICAvKiBmaWxsIG91dCBvdXIgc3Ry
dWN0dXJlIHRoYXQgcmVwcmVzZW50cyBhbiBhY3RpdmUgcXVldWUgKi8KPj4+PiAtICAgaWYgKCFp
bmZvKQo+Pj4+IC0gICAgICAgICAgIHJldHVybiBFUlJfUFRSKC1FTk9NRU0pOwo+Pj4+ICsgICBp
bmZvID0gdnBfZGV2LT52cXNbaW5kZXhdOwo+Pj4+ICsgICBpZiAoIWluZm8pIHsKPj4+PiArICAg
ICAgICAgICBpbmZvID0ga3phbGxvYyhzaXplb2YgKmluZm8sIEdGUF9LRVJORUwpOwo+Pj4+ICsK
Pj4+PiArICAgICAgICAgICAvKiBmaWxsIG91dCBvdXIgc3RydWN0dXJlIHRoYXQgcmVwcmVzZW50
cyBhbiBhY3RpdmUgcXVldWUgKi8KPj4+PiArICAgICAgICAgICBpZiAoIWluZm8pCj4+Pj4gKyAg
ICAgICAgICAgICAgICAgICByZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsKPj4+PiArICAgfQo+Pj4+
Cj4+Pj4gICAgICB2cSA9IHZwX2Rldi0+c2V0dXBfdnEodnBfZGV2LCBpbmZvLCBpbmRleCwgY2Fs
bGJhY2ssIG5hbWUsIGN0eCwKPj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgIG1zaXhfdmVj
LCBOVUxMLCBudW0pOwo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgbXNpeF92ZWMsIGlu
Zm8tPnZxLCBudW0pOwo+Pj4+ICAgICAgaWYgKElTX0VSUih2cSkpCj4+Pj4gICAgICAgICAgICAg
IGdvdG8gb3V0X2luZm87Cj4+Pj4KPj4+PiBAQCAtMjM4LDYgKzI0Myw5IEBAIHN0YXRpYyBzdHJ1
Y3QgdmlydHF1ZXVlICp2cF9zZXR1cF92cShzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldiwgdW5z
aWduZWQgaW5kZXgsCj4+Pj4gICAgICByZXR1cm4gdnE7Cj4+Pj4KPj4+PiAgICBvdXRfaW5mbzoK
Pj4+PiArICAgaWYgKGluZm8tPnZxICYmIGluZm8tPnZxLT5yZXNldCkKPj4+PiArICAgICAgICAg
ICByZXR1cm4gdnE7Cj4+Pj4gKwo+Pj4+ICAgICAga2ZyZWUoaW5mbyk7Cj4+Pj4gICAgICByZXR1
cm4gdnE7Cj4+Pj4gICAgfQo+Pj4+IEBAIC0yNDgsOSArMjU2LDExIEBAIHN0YXRpYyB2b2lkIHZw
X2RlbF92cShzdHJ1Y3QgdmlydHF1ZXVlICp2cSkKPj4+PiAgICAgIHN0cnVjdCB2aXJ0aW9fcGNp
X3ZxX2luZm8gKmluZm8gPSB2cF9kZXYtPnZxc1t2cS0+aW5kZXhdOwo+Pj4+ICAgICAgdW5zaWdu
ZWQgbG9uZyBmbGFnczsKPj4+Pgo+Pj4+IC0gICBzcGluX2xvY2tfaXJxc2F2ZSgmdnBfZGV2LT5s
b2NrLCBmbGFncyk7Cj4+Pj4gLSAgIGxpc3RfZGVsKCZpbmZvLT5ub2RlKTsKPj4+PiAtICAgc3Bp
bl91bmxvY2tfaXJxcmVzdG9yZSgmdnBfZGV2LT5sb2NrLCBmbGFncyk7Cj4+Pj4gKyAgIGlmICgh
dnEtPnJlc2V0KSB7Cj4+Pj4gKyAgICAgICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJnZwX2Rldi0+
bG9jaywgZmxhZ3MpOwo+Pj4+ICsgICAgICAgICAgIGxpc3RfZGVsKCZpbmZvLT5ub2RlKTsKPj4+
PiArICAgICAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZ2cF9kZXYtPmxvY2ssIGZsYWdz
KTsKPj4+PiArICAgfQo+Pj4+Cj4+Pj4gICAgICB2cF9kZXYtPmRlbF92cShpbmZvKTsKPj4+PiAg
ICAgIGtmcmVlKGluZm8pOwo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9f
cGNpX2NvbW1vbi5oIGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX3BjaV9jb21tb24uaAo+Pj4+IGlu
ZGV4IDY1ZGI5MjI0NWU0MS4uYzFkMTVmN2MwYmU0IDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMv
dmlydGlvL3ZpcnRpb19wY2lfY29tbW9uLmgKPj4+PiArKysgYi9kcml2ZXJzL3ZpcnRpby92aXJ0
aW9fcGNpX2NvbW1vbi5oCj4+Pj4gQEAgLTExOSw2ICsxMTksMTEgQEAgaW50IHZwX2ZpbmRfdnFz
KHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2LCB1bnNpZ25lZCBudnFzLAo+Pj4+ICAgICAgICAg
ICAgICBzdHJ1Y3QgdmlydHF1ZXVlICp2cXNbXSwgdnFfY2FsbGJhY2tfdCAqY2FsbGJhY2tzW10s
Cj4+Pj4gICAgICAgICAgICAgIGNvbnN0IGNoYXIgKiBjb25zdCBuYW1lc1tdLCBjb25zdCBib29s
ICpjdHgsCj4+Pj4gICAgICAgICAgICAgIHN0cnVjdCBpcnFfYWZmaW5pdHkgKmRlc2MpOwo+Pj4+
ICtzdHJ1Y3QgdmlydHF1ZXVlICp2cF9zZXR1cF92cShzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRl
diwgdW5zaWduZWQgaW5kZXgsCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICgq
Y2FsbGJhY2spKHN0cnVjdCB2aXJ0cXVldWUgKnZxKSwKPj4+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbnN0IGNoYXIgKm5hbWUsCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICBi
b29sIGN0eCwKPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgIHUxNiBtc2l4X3ZlYywgdTE2
IG51bSk7Cj4+Pj4gICAgY29uc3QgY2hhciAqdnBfYnVzX25hbWUoc3RydWN0IHZpcnRpb19kZXZp
Y2UgKnZkZXYpOwo+Pj4+Cj4+Pj4gICAgLyogU2V0dXAgdGhlIGFmZmluaXR5IGZvciBhIHZpcnRx
dWV1ZToKPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aXJ0aW8vdmlydGlvX3BjaV9tb2Rlcm4u
YyBiL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19wY2lfbW9kZXJuLmMKPj4+PiBpbmRleCAyY2U1OGRl
NTQ5ZGUuLjY3ODk0MTExNjllNCAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL3ZpcnRpby92aXJ0
aW9fcGNpX21vZGVybi5jCj4+Pj4gKysrIGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX3BjaV9tb2Rl
cm4uYwo+Pj4+IEBAIC0zNCw2ICszNCw5IEBAIHN0YXRpYyB2b2lkIHZwX3RyYW5zcG9ydF9mZWF0
dXJlcyhzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldiwgdTY0IGZlYXR1cmVzKQo+Pj4+ICAgICAg
aWYgKChmZWF0dXJlcyAmIEJJVF9VTEwoVklSVElPX0ZfU1JfSU9WKSkgJiYKPj4+PiAgICAgICAg
ICAgICAgICAgICAgICBwY2lfZmluZF9leHRfY2FwYWJpbGl0eShwY2lfZGV2LCBQQ0lfRVhUX0NB
UF9JRF9TUklPVikpCj4+Pj4gICAgICAgICAgICAgIF9fdmlydGlvX3NldF9iaXQodmRldiwgVklS
VElPX0ZfU1JfSU9WKTsKPj4+PiArCj4+Pj4gKyAgIGlmIChmZWF0dXJlcyAmIEJJVF9VTEwoVklS
VElPX0ZfUklOR19SRVNFVCkpCj4+Pj4gKyAgICAgICAgICAgX192aXJ0aW9fc2V0X2JpdCh2ZGV2
LCBWSVJUSU9fRl9SSU5HX1JFU0VUKTsKPj4+PiAgICB9Cj4+Pj4KPj4+PiAgICAvKiB2aXJ0aW8g
Y29uZmlnLT5maW5hbGl6ZV9mZWF0dXJlcygpIGltcGxlbWVudGF0aW9uICovCj4+Pj4gQEAgLTE3
Niw2ICsxNzksOTQgQEAgc3RhdGljIHZvaWQgdnBfcmVzZXQoc3RydWN0IHZpcnRpb19kZXZpY2Ug
KnZkZXYpCj4+Pj4gICAgICB2cF9kaXNhYmxlX2Nicyh2ZGV2KTsKPj4+PiAgICB9Cj4+Pj4KPj4+
PiArc3RhdGljIGludCB2cF9tb2Rlcm5fcmVzZXRfdnEoc3RydWN0IHZpcnRpb19yZXNldF92cSAq
cGFyYW0pCj4+Pj4gK3sKPj4+PiArICAgc3RydWN0IHZpcnRpb19wY2lfZGV2aWNlICp2cF9kZXYg
PSB0b192cF9kZXZpY2UocGFyYW0tPnZkZXYpOwo+Pj4+ICsgICBzdHJ1Y3QgdmlydGlvX3BjaV9t
b2Rlcm5fZGV2aWNlICptZGV2ID0gJnZwX2Rldi0+bWRldjsKPj4+PiArICAgc3RydWN0IHZpcnRp
b19wY2lfdnFfaW5mbyAqaW5mbzsKPj4+PiArICAgdTE2IG1zaXhfdmVjLCBxdWV1ZV9pbmRleDsK
Pj4+PiArICAgdW5zaWduZWQgbG9uZyBmbGFnczsKPj4+PiArICAgdm9pZCAqYnVmOwo+Pj4+ICsK
Pj4+PiArICAgaWYgKCF2aXJ0aW9faGFzX2ZlYXR1cmUocGFyYW0tPnZkZXYsIFZJUlRJT19GX1JJ
TkdfUkVTRVQpKQo+Pj4+ICsgICAgICAgICAgIHJldHVybiAtRU5PRU5UOwo+Pj4+ICsKPj4+PiAr
ICAgcXVldWVfaW5kZXggPSBwYXJhbS0+cXVldWVfaW5kZXg7Cj4+Pj4gKwo+Pj4+ICsgICB2cF9t
b2Rlcm5fc2V0X3F1ZXVlX3Jlc2V0KG1kZXYsIHF1ZXVlX2luZGV4KTsKPj4+PiArCj4+Pj4gKyAg
IC8qIEFmdGVyIHdyaXRlIDEgdG8gcXVldWUgcmVzZXQsIHRoZSBkcml2ZXIgTVVTVCB3YWl0IGZv
ciBhIHJlYWQgb2YKPj4+PiArICAgICogcXVldWUgcmVzZXQgdG8gcmV0dXJuIDEuCj4+Pj4gKyAg
ICAqLwo+Pj4+ICsgICB3aGlsZSAodnBfbW9kZXJuX2dldF9xdWV1ZV9yZXNldChtZGV2LCBxdWV1
ZV9pbmRleCkgIT0gMSkKPj4+PiArICAgICAgICAgICBtc2xlZXAoMSk7Cj4+Pgo+Pj4gSXMgdGhp
cyBiZXR0ZXIgdG8gbW92ZSB0aGlzIGxvZ2ljIGludG8gdnBfbW9kZXJuX3NldF9xdWV1ZV9yZXNl
dCgpPwo+Pj4KPj4gT0suCj4+Cj4+Pj4gKwo+Pj4+ICsgICBpbmZvID0gdnBfZGV2LT52cXNbcXVl
dWVfaW5kZXhdOwo+Pj4+ICsgICBtc2l4X3ZlYyA9IGluZm8tPm1zaXhfdmVjdG9yOwo+Pj4+ICsK
Pj4+PiArICAgLyogRGlzYWJsZSBWUSBjYWxsYmFjay4gKi8KPj4+PiArICAgaWYgKHZwX2Rldi0+
cGVyX3ZxX3ZlY3RvcnMgJiYgbXNpeF92ZWMgIT0gVklSVElPX01TSV9OT19WRUNUT1IpCj4+Pj4g
KyAgICAgICAgICAgZGlzYWJsZV9pcnEocGNpX2lycV92ZWN0b3IodnBfZGV2LT5wY2lfZGV2LCBt
c2l4X3ZlYykpOwo+Pj4KPj4+IEhvdyBhYm91dCB0aGUgSU5UWCBjYXNlIHdoZXJlIGlycSBpcyBz
aGFyZWQ/IEkgZ3Vlc3Mgd2UgbmVlZCB0byBkaXNhYmxlCj4+PiBhbmQgZW5hYmxlIHRoZSBpcnEg
YXMgd2VsbC4KPj4gRm9yIHRoZSBJTlRYIHNjZW5hcmlvLCBJIGRvbid0IHRoaW5rIHdlIG5lZWQg
dG8gZGlzYWJsZS9lbmFibGUgdGhlIGlycS4gQnV0IEkgZG8KPj4gaGF2ZSBhIG1pc3Rha2UsIEkg
c2hvdWxkIHB1dCB0aGUgZm9sbG93aW5nIGxpc3RfZGVsKCZpbmZvLT5ub2RlKSBoZXJlLCBzbyB0
aGF0Cj4+IHdoZW4gdGhlIGlycSBjb21lcywgaXQgd2lsbCBubyBsb25nZXIgb3BlcmF0ZSB0aGlz
IHZxLgo+Pgo+PiBJbiBmYWN0LCBmb3Igbm8gSU5UWCBjYXNlLCB0aGUgZGlzYWJsZV9pcnEgaGVy
ZSBpcyBub3QgbmVjZXNzYXJ5LCBhY2NvcmRpbmcgdG8KPj4gdGhlIHJlcXVpcmVtZW50cyBvZiB0
aGUgc3BlYywgYWZ0ZXIgcmVzZXQsIHRoZSBkZXZpY2Ugc2hvdWxkIG5vdCBnZW5lcmF0ZSBpcnEK
Pj4gYW55bW9yZS4KPiBJIG1heSBtaXNzIHNvbWV0aGluZyBidXQgSSBkb24ndCB0aGluayBJTlRY
IGRpZmZlcnMgZnJvbSBNU0kgZnJvbSB0aGUKPiB2cSBoYW5kbGVyIHBlcnNwZWN0aXZlLgo+Cj4+
IEhlcmUganVzdCB0byBwcmV2ZW50IGFjY2lkZW50cy4KPiBUaGUgcHJvYmxlbSBpcyB0aGF0IGlm
IHlvdSBkb24ndCBkaXNhYmxlL3N5bmMgSVJRIHRoZXJlIGNvdWxkIGJlIGEKPiByYWNlIGJldHdl
ZW4gdGhlIHZxIGlycSBoYW5kbGVyIGFuZCB0aGUgdmlydHF1ZXVlX2RldGFjaF91bnVzZWRfYnVm
KCk/CgpJIHVuZGVyc3RhbmQgdGhhdCB1bmRlciBJTlRYLCB0aGUgaXJxIGhhbmRsZXIgKHZwX3Zy
aW5nX2ludGVycnVwdCkgd2lsbCAKY2hlY2sKdGhlIGxpc3QgdnBfZGV2LT52aXJ0cXVldWVzIHRv
IGNhbGwgdGhlIHZxIGNhbGxiYWNrLiBUaGVuIGlmIHdlIGhhdmUgCmRlbGV0ZWQgaXQKZnJvbSB2
cF9kZXYtPnZpcnRxdWV1ZXMsIHRoZW4gdGhlcmUgaXMgbm8gbmVlZCB0byBkaXNhYmxlIGlycS4g
QW5kIHRoaXMgCnByb2Nlc3MKaXMgbG9ja2VkIGJ5IHZwX2Rldi0+bG9jay4KPj4+Cj4+Pj4gKwo+
Pj4+ICsgICB3aGlsZSAoKGJ1ZiA9IHZpcnRxdWV1ZV9kZXRhY2hfdW51c2VkX2J1ZihpbmZvLT52
cSkpICE9IE5VTEwpCj4+Pj4gKyAgICAgICAgICAgcGFyYW0tPmZyZWVfdW51c2VkX2NiKHBhcmFt
LCBidWYpOwo+Pj4KPj4+IEFueSByZWFzb24gdGhhdCB3ZSBjYW4ndCBsZWF2ZSB0aGlzIGxvZ2lj
IHRvIGRyaXZlcj8gKE9yIGlzIHRoZXJlIGFueQo+Pj4gb3BlcmF0aW9ucyB0aGF0IG11c3QgYmUg
ZG9uZSBiZWZvcmUgdGhlIGZvbGxvd2luZyBvcGVyYXRpb25zPykKPj4gQXMgeW91IGNvbW1lbnRl
ZCBiZWZvcmUsIHdlIG1lcmdlZCBmcmVlIHVudXNlZCBidWYgYW5kIHJlc2V0IHF1ZXVlLgo+Pgo+
PiBJIHRoaW5rIGl0J3MgYSBnb29kIG5vdGUsIG90aGVyd2lzZSwgd2UncmUgZ29pbmcgdG8KPj4K
Pj4gICAgICAgICAgMS4gcmVzZXQgdnEKPj4gICAgICAgICAgMi4gZnJlZSB1bnVzZWQoYnkgZHJp
dmVyKQo+PiAgICAgICAgICAzLiBmcmVlIHJpbmcgb2YgdnEKPiBSZXRoaW5rIGFib3V0IHRoaXMs
IEknZCBwcmVmZXIgdG8gbGVhdmUgaXQgdG8gdGhlIGRyaXZlciBmb3IgY29uc2lzdGVuY3kuCj4K
PiBFLmcgdGhlIHZpcnRxdWV1ZV9kZXRhY2hfdW51c2VkX2J1ZigpIGlzIGNhbGxlZCBieSBlYWNo
IGRyaXZlciBub3dkYXlzLgo+Ck9LCj4+Cj4+Pgo+Pj4+ICsKPj4+PiArICAgLyogZGVsZXRlIHZx
ICovCj4+Pj4gKyAgIHNwaW5fbG9ja19pcnFzYXZlKCZ2cF9kZXYtPmxvY2ssIGZsYWdzKTsKPj4+
PiArICAgbGlzdF9kZWwoJmluZm8tPm5vZGUpOwo+Pj4+ICsgICBzcGluX3VubG9ja19pcnFyZXN0
b3JlKCZ2cF9kZXYtPmxvY2ssIGZsYWdzKTsKPj4+PiArCj4+Pj4gKyAgIElOSVRfTElTVF9IRUFE
KCZpbmZvLT5ub2RlKTsKPj4+PiArCj4+Pj4gKyAgIGlmICh2cF9kZXYtPm1zaXhfZW5hYmxlZCkK
Pj4+PiArICAgICAgICAgICB2cF9tb2Rlcm5fcXVldWVfdmVjdG9yKG1kZXYsIGluZm8tPnZxLT5p
bmRleCwKPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFZJUlRJT19NU0lf
Tk9fVkVDVE9SKTsKPj4+Cj4+PiBJIHdvbmRlciBpZiB0aGlzIGlzIGEgbXVzdC4KPj4+Cj4+Pgo+
Pj4+ICsKPj4+PiArICAgaWYgKCFtZGV2LT5ub3RpZnlfYmFzZSkKPj4+PiArICAgICAgICAgICBw
Y2lfaW91bm1hcChtZGV2LT5wY2lfZGV2LAo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICh2
b2lkIF9fZm9yY2UgX19pb21lbSAqKWluZm8tPnZxLT5wcml2KTsKPj4+Cj4+PiBJcyB0aGlzIGEg
bXVzdD8gd2hhdCBoYXBwZW5zIGlmIHdlIHNpbXBseSBkb24ndCBkbyB0aGlzPwo+Pj4KPj4gVGhl
IHB1cnBvc2Ugb2YgdGhlc2UgdHdvIG9wZXJhdGlvbnMgaXMgbWFpbmx5IHRvIGJlIHN5bW1ldHJp
Y2FsIHdpdGggZGVsX3ZxKCkuCj4gVGhpcyBpcyBhbm90aGVyIHF1ZXN0aW9uIEkgd2FudCB0byBh
c2suIEFueSByZWFzb24gZm9yIGNhbGxpbmcKPiBkZWxfdnEoKT8gSXMgaXQgYmVjYXVzZSB5b3Ug
bmVlZCB0byBleGNsdWRlIGEgdnEgZnJvbSB0aGUgdnEgaGFuZGxlcj8KSSBkaWRuJ3QgYWN0dWFs
bHkgY2FsbCBkZWxfdnEoKSwgYnV0IEkgdGhpbmsgdGhlIHByb2Nlc3MgaXMgc2ltaWxhciB0byAK
aXQsIHNvCkknZCBsaWtlIHRvIGJlIHN5bW1ldHJpYyB3aXRoIGRlbF92cSgpIGluIGltcGxlbWVu
dGF0aW9uLgoKVGhlIHNlcGFyYXRpb24gZnJvbSB0aGUgdnEgaGFuZGxlciBpcyBhY2hpZXZlZCBi
eSB0aGUgZm9sbG93aW5nIGNvZGU6CgogwqAgc3Bpbl9sb2NrX2lycXNhdmUoJnZwX2Rldi0+bG9j
aywgZmxhZ3MpOwogwqAgbGlzdF9kZWwoJmluZm8tPm5vZGUpOwogwqAgc3Bpbl91bmxvY2tfaXJx
cmVzdG9yZSgmdnBfZGV2LT5sb2NrLCBmbGFncyk7Cj4gRm9yIGFueSBjYXNlLCB0aGUgTVNJIGFu
ZCBub3RpZmljYXRpb24gc3R1ZmYgc2VlbXMgdW5uZWNlc3NhcnkuCgpJIHdpbGwgcmVtb3ZlIHRo
ZXNlIGluIG5leHQgdmVyc2lvbi4KClRoYW5rcy4KPiBUaGFua3MKPgo+Pgo+Pj4+ICsKPj4+PiAr
ICAgdnJpbmdfcmVzZXRfdmlydHF1ZXVlKGluZm8tPnZxKTsKPj4+PiArCj4+Pj4gKyAgIHJldHVy
biAwOwo+Pj4+ICt9Cj4+Pj4gKwo+Pj4+ICtzdGF0aWMgc3RydWN0IHZpcnRxdWV1ZSAqdnBfbW9k
ZXJuX2VuYWJsZV9yZXNldF92cShzdHJ1Y3QgdmlydGlvX3Jlc2V0X3ZxICpwYXJhbSkKPj4+PiAr
ewo+Pj4+ICsgICBzdHJ1Y3QgdmlydGlvX3BjaV9kZXZpY2UgKnZwX2RldiA9IHRvX3ZwX2Rldmlj
ZShwYXJhbS0+dmRldik7Cj4+Pj4gKyAgIHN0cnVjdCB2aXJ0aW9fcGNpX21vZGVybl9kZXZpY2Ug
Km1kZXYgPSAmdnBfZGV2LT5tZGV2Owo+Pj4+ICsgICBzdHJ1Y3QgdmlydGlvX3BjaV92cV9pbmZv
ICppbmZvOwo+Pj4+ICsgICB1MTYgbXNpeF92ZWMsIHF1ZXVlX2luZGV4Owo+Pj4+ICsgICBzdHJ1
Y3QgdmlydHF1ZXVlICp2cTsKPj4+PiArCj4+Pj4gKyAgIGlmICghdmlydGlvX2hhc19mZWF0dXJl
KHBhcmFtLT52ZGV2LCBWSVJUSU9fRl9SSU5HX1JFU0VUKSkKPj4+PiArICAgICAgICAgICByZXR1
cm4gRVJSX1BUUigtRU5PRU5UKTsKPj4+PiArCj4+Pj4gKyAgIHF1ZXVlX2luZGV4ID0gcGFyYW0t
PnF1ZXVlX2luZGV4Owo+Pj4+ICsKPj4+PiArICAgaW5mbyA9IHZwX2Rldi0+dnFzW3F1ZXVlX2lu
ZGV4XTsKPj4+PiArCj4+Pj4gKyAgIGlmICghaW5mby0+dnEtPnJlc2V0KQo+Pj4+ICsgICAgICAg
ICAgIHJldHVybiBFUlJfUFRSKC1FUEVSTSk7Cj4+Pj4gKwo+Pj4+ICsgICAvKiBjaGVjayBxdWV1
ZSByZXNldCBzdGF0dXMgKi8KPj4+PiArICAgaWYgKHZwX21vZGVybl9nZXRfcXVldWVfcmVzZXQo
bWRldiwgcXVldWVfaW5kZXgpICE9IDEpCj4+Pj4gKyAgICAgICAgICAgcmV0dXJuIEVSUl9QVFIo
LUVCVVNZKTsKPj4+PiArCj4+Pj4gKyAgIHZxID0gdnBfc2V0dXBfdnEocGFyYW0tPnZkZXYsIHF1
ZXVlX2luZGV4LCBwYXJhbS0+Y2FsbGJhY2ssIHBhcmFtLT5uYW1lLAo+Pj4+ICsgICAgICAgICAg
ICAgICAgICAgIHBhcmFtLT5jdHgsIGluZm8tPm1zaXhfdmVjdG9yLCBwYXJhbS0+cmluZ19udW0p
Owo+Pj4+ICsgICBpZiAoSVNfRVJSKHZxKSkKPj4+PiArICAgICAgICAgICByZXR1cm4gdnE7Cj4+
Pj4gKwo+Pj4+ICsgICB2cF9tb2Rlcm5fc2V0X3F1ZXVlX2VuYWJsZSgmdnBfZGV2LT5tZGV2LCB2
cS0+aW5kZXgsIHRydWUpOwo+Pj4+ICsKPj4+PiArICAgbXNpeF92ZWMgPSB2cF9kZXYtPnZxc1tx
dWV1ZV9pbmRleF0tPm1zaXhfdmVjdG9yOwo+Pj4+ICsgICBpZiAodnBfZGV2LT5wZXJfdnFfdmVj
dG9ycyAmJiBtc2l4X3ZlYyAhPSBWSVJUSU9fTVNJX05PX1ZFQ1RPUikKPj4+PiArICAgICAgICAg
ICBlbmFibGVfaXJxKHBjaV9pcnFfdmVjdG9yKHZwX2Rldi0+cGNpX2RldiwgbXNpeF92ZWMpKTsK
Pj4+Cj4+PiBIb3cgYWJvdXQgdGhlIElOVC1YIGNhc2U/Cj4+IEV4cGxhaW5lZCBhYm92ZS4KPj4K
Pj4gVGhhbmtzLgo+Pgo+Pj4gVGhhbmtzCj4+Pgo+Pj4KPj4+PiArCj4+Pj4gKyAgIHJldHVybiB2
cTsKPj4+PiArfQo+Pj4+ICsKPj4+PiAgICBzdGF0aWMgdTE2IHZwX2NvbmZpZ192ZWN0b3Ioc3Ry
dWN0IHZpcnRpb19wY2lfZGV2aWNlICp2cF9kZXYsIHUxNiB2ZWN0b3IpCj4+Pj4gICAgewo+Pj4+
ICAgICAgcmV0dXJuIHZwX21vZGVybl9jb25maWdfdmVjdG9yKCZ2cF9kZXYtPm1kZXYsIHZlY3Rv
cik7Cj4+Pj4gQEAgLTI4NCw2ICszNzUsMTEgQEAgc3RhdGljIHZvaWQgZGVsX3ZxKHN0cnVjdCB2
aXJ0aW9fcGNpX3ZxX2luZm8gKmluZm8pCj4+Pj4gICAgICBzdHJ1Y3QgdmlydGlvX3BjaV9kZXZp
Y2UgKnZwX2RldiA9IHRvX3ZwX2RldmljZSh2cS0+dmRldik7Cj4+Pj4gICAgICBzdHJ1Y3Qgdmly
dGlvX3BjaV9tb2Rlcm5fZGV2aWNlICptZGV2ID0gJnZwX2Rldi0+bWRldjsKPj4+Pgo+Pj4+ICsg
ICBpZiAodnEtPnJlc2V0KSB7Cj4+Pj4gKyAgICAgICAgICAgdnJpbmdfZGVsX3ZpcnRxdWV1ZSh2
cSk7Cj4+Pj4gKyAgICAgICAgICAgcmV0dXJuOwo+Pj4+ICsgICB9Cj4+Pj4gKwo+Pj4+ICAgICAg
aWYgKHZwX2Rldi0+bXNpeF9lbmFibGVkKQo+Pj4+ICAgICAgICAgICAgICB2cF9tb2Rlcm5fcXVl
dWVfdmVjdG9yKG1kZXYsIHZxLT5pbmRleCwKPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBWSVJUSU9fTVNJX05PX1ZFQ1RPUik7Cj4+Pj4gQEAgLTQwMyw2ICs0OTksOCBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IHZpcnRpb19jb25maWdfb3BzIHZpcnRpb19wY2lfY29uZmln
X25vZGV2X29wcyA9IHsKPj4+PiAgICAgIC5zZXRfdnFfYWZmaW5pdHkgPSB2cF9zZXRfdnFfYWZm
aW5pdHksCj4+Pj4gICAgICAuZ2V0X3ZxX2FmZmluaXR5ID0gdnBfZ2V0X3ZxX2FmZmluaXR5LAo+
Pj4+ICAgICAgLmdldF9zaG1fcmVnaW9uICA9IHZwX2dldF9zaG1fcmVnaW9uLAo+Pj4+ICsgICAu
cmVzZXRfdnEgICAgICAgID0gdnBfbW9kZXJuX3Jlc2V0X3ZxLAo+Pj4+ICsgICAuZW5hYmxlX3Jl
c2V0X3ZxID0gdnBfbW9kZXJuX2VuYWJsZV9yZXNldF92cSwKPj4+PiAgICB9Owo+Pj4+Cj4+Pj4g
ICAgc3RhdGljIGNvbnN0IHN0cnVjdCB2aXJ0aW9fY29uZmlnX29wcyB2aXJ0aW9fcGNpX2NvbmZp
Z19vcHMgPSB7Cj4+Pj4gQEAgLTQyMSw2ICs1MTksOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHZp
cnRpb19jb25maWdfb3BzIHZpcnRpb19wY2lfY29uZmlnX29wcyA9IHsKPj4+PiAgICAgIC5zZXRf
dnFfYWZmaW5pdHkgPSB2cF9zZXRfdnFfYWZmaW5pdHksCj4+Pj4gICAgICAuZ2V0X3ZxX2FmZmlu
aXR5ID0gdnBfZ2V0X3ZxX2FmZmluaXR5LAo+Pj4+ICAgICAgLmdldF9zaG1fcmVnaW9uICA9IHZw
X2dldF9zaG1fcmVnaW9uLAo+Pj4+ICsgICAucmVzZXRfdnEgICAgICAgID0gdnBfbW9kZXJuX3Jl
c2V0X3ZxLAo+Pj4+ICsgICAuZW5hYmxlX3Jlc2V0X3ZxID0gdnBfbW9kZXJuX2VuYWJsZV9yZXNl
dF92cSwKPj4+PiAgICB9Owo+Pj4+Cj4+Pj4gICAgLyogdGhlIFBDSSBwcm9iaW5nIGZ1bmN0aW9u
ICovCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0
dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRh
dGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGlu
Zm8vdmlydHVhbGl6YXRpb24=
