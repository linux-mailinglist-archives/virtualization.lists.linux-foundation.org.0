Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAA94EBAA7
	for <lists.virtualization@lfdr.de>; Wed, 30 Mar 2022 08:13:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A4AD8454D;
	Wed, 30 Mar 2022 06:13:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZQPi7loCdx1j; Wed, 30 Mar 2022 06:13:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1383C8456F;
	Wed, 30 Mar 2022 06:13:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 71567C0082;
	Wed, 30 Mar 2022 06:13:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38C14C0012
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Mar 2022 06:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 126D340C9A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Mar 2022 06:13:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6OHRWA2y-HUQ
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Mar 2022 06:13:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65E61400FD
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Mar 2022 06:13:11 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R921e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400; MF=xuanzhuo@linux.alibaba.com;
 NM=1; PH=DS; RN=3; SR=0; TI=SMTPD_---0V8cb4BB_1648620787; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0V8cb4BB_1648620787) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 30 Mar 2022 14:13:07 +0800
Message-ID: <1648620448.1551938-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v8 11/16] virtio_ring: packed: extract the logic of alloc
 queue
Date: Wed, 30 Mar 2022 14:07:28 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Jason Wang <jasowang@redhat.com>
References: <20220314093455.34707-1-xuanzhuo@linux.alibaba.com>
 <20220314093455.34707-12-xuanzhuo@linux.alibaba.com>
 <6e3082b6-98df-670f-748c-baae6246211c@redhat.com>
 <1648110531.7509174-2-xuanzhuo@linux.alibaba.com>
 <1a819720-c672-0a53-5a8f-d5b21179bb63@redhat.com>
In-Reply-To: <1a819720-c672-0a53-5a8f-d5b21179bb63@redhat.com>
Cc: virtualization@lists.linux-foundation.org,
 "Michael S. Tsirkin" <mst@redhat.com>
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

T24gV2VkLCAzMCBNYXIgMjAyMiAxMTo1MDo0OSArMDgwMCwgSmFzb24gV2FuZyA8amFzb3dhbmdA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiDlnKggMjAyMi8zLzI0IOS4i+WNiDQ6MjgsIFh1YW4gWmh1
byDlhpnpgZM6Cj4gPiBPbiBUdWUsIDIyIE1hciAyMDIyIDE0OjM4OjEyICswODAwLCBKYXNvbiBX
YW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPiB3cm90ZToKPiA+PiDlnKggMjAyMi8zLzE0IOS4i+WN
iDU6MzQsIFh1YW4gWmh1byDlhpnpgZM6Cj4gPj4+IFNlcGFyYXRlIHRoZSBsb2dpYyBvZiBwYWNr
ZWQgdG8gY3JlYXRlIHZyaW5nIHF1ZXVlLgo+ID4+Pgo+ID4+PiBGb3IgdGhlIGNvbnZlbmllbmNl
IG9mIHBhc3NpbmcgcGFyYW1ldGVycywgYWRkIGEgc3RydWN0dXJlCj4gPj4+IHZyaW5nX3BhY2tl
ZC4KPiA+Pj4KPiA+Pj4gVGhpcyBmZWF0dXJlIGlzIHJlcXVpcmVkIGZvciBzdWJzZXF1ZW50IHZp
cnR1cXVldWUgcmVzZXQgdnJpbmcuCj4gPj4+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IFh1YW4gWmh1
byA8eHVhbnpodW9AbGludXguYWxpYmFiYS5jb20+Cj4gPj4+IC0tLQo+ID4+PiAgICBkcml2ZXJz
L3ZpcnRpby92aXJ0aW9fcmluZy5jIHwgMTIxICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tCj4gPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA5MiBpbnNlcnRpb25zKCspLCAyOSBkZWxl
dGlvbnMoLSkKPiA+Pj4KPiA+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19y
aW5nLmMgYi9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jCj4gPj4+IGluZGV4IGExNTg2OTUx
NDE0Ni4uOTZmZjJkYWJkYTE0IDEwMDY0NAo+ID4+PiAtLS0gYS9kcml2ZXJzL3ZpcnRpby92aXJ0
aW9fcmluZy5jCj4gPj4+ICsrKyBiL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19yaW5nLmMKPiA+Pj4g
QEAgLTg1LDYgKzg1LDE4IEBAIHN0cnVjdCB2cmluZ19kZXNjX2V4dHJhIHsKPiA+Pj4gICAgCXUx
NiBuZXh0OwkJCS8qIFRoZSBuZXh0IGRlc2Mgc3RhdGUgaW4gYSBsaXN0LiAqLwo+ID4+PiAgICB9
Owo+ID4+Pgo+ID4+PiArc3RydWN0IHZyaW5nX3BhY2tlZCB7Cj4gPj4+ICsJdTMyIG51bTsKPiA+
Pj4gKwlzdHJ1Y3QgdnJpbmdfcGFja2VkX2Rlc2MgKnJpbmc7Cj4gPj4+ICsJc3RydWN0IHZyaW5n
X3BhY2tlZF9kZXNjX2V2ZW50ICpkcml2ZXI7Cj4gPj4+ICsJc3RydWN0IHZyaW5nX3BhY2tlZF9k
ZXNjX2V2ZW50ICpkZXZpY2U7Cj4gPj4+ICsJZG1hX2FkZHJfdCByaW5nX2RtYV9hZGRyOwo+ID4+
PiArCWRtYV9hZGRyX3QgZHJpdmVyX2V2ZW50X2RtYV9hZGRyOwo+ID4+PiArCWRtYV9hZGRyX3Qg
ZGV2aWNlX2V2ZW50X2RtYV9hZGRyOwo+ID4+PiArCXNpemVfdCByaW5nX3NpemVfaW5fYnl0ZXM7
Cj4gPj4+ICsJc2l6ZV90IGV2ZW50X3NpemVfaW5fYnl0ZXM7Cj4gPj4+ICt9Owo+ID4+PiArCj4g
Pj4KPiA+PiBJbnRlcmVzdGluZyzCoCBhIG5pdHBpY2sgaGVyZSBpcyB0aGF0IGlmIGl0IGlzIG9u
bHkgdXNlZCBieSBvbmUgaGVscGVyLAo+ID4+IGl0J3MgcHJvYmFibHkgbm90IHdvcnRoIHRvIGJv
dGhlci4KPiA+Cj4gPiBJbmRlZWQgb25seSBvbmUgaGVscGVyIHdpbGwgdXNlIGl0LiBCZWNhdXNl
IHZyaW5nX2FsbG9jX3F1ZXVlX3BhY2tlZCB3aWxsIHBhc3MKPiA+IHRvbyBtYW55IHZhcmlhYmxl
cy4gSWYgd2UgdXNlIGZ1bmN0aW9uIHBhcmFtZXRlcnMsIEkgdGhpbmsgdGhpcyBmdW5jdGlvbiBp
cyB0b28KPiA+IHVnbHkuCj4gPgo+ID4KPiA+PiBBbmQgaWYgd2Ugd2FudCB0byBkbyB0aGF0LCB3
ZSBuZWVkCj4gPj4KPiA+PiAxKSB1c2UgYSBzZXBhcmF0ZWQgcGF0Y2gKPiA+IElmIHdlIHNwbGl0
IHRoaXMgcGF0Y2ggYWdhaW4sIHdlIGNhbiBvbmx5IHNlcGFyYXRlIHZyaW5nX2ZyZWVfdnJpbmdf
cGFja2VkKCkKPiA+IG91dC4KPiA+Cj4gPj4gMikgZG8gaXQgZm9yIHNwbGl0IHZpcnRxdWV1ZSBh
cyB3ZWxsCj4gPiBFYXJsaWVyIHZlcnNpb25zLCBJIGRpZCBjcmVhdGUgYSBzdHJ1Y3QgZm9yIHNw
bGl0IHRvbywgYnV0IHlvdSByZXBsaWVkIHRoYXQgaXQKPiA+IHdhc24ndCB3b3J0aCBpdCwgc28g
SSByZW1vdmVkIHRoZSBzZXBhcmF0ZSBzdHJ1Y3QgdXNlZCBieSBzcGxpdC4KPgo+Cj4gU28gSSB0
aGluayBsZXQncyBqdXN0IHN0aWNrIHRvIHRoZSBjdXJyZW50IHN0eWxlIGJ5IHBhc3NpbmcgaW5k
aXZpZHVhbAo+IHBhcmFtZXRlcnMsIGFuZCB3ZSBjYW4gcmVmYWN0b3IgaXQgb24gdG9wIG9mIHRo
aXMgc2VyaWVzLgo+Cj4gVGhpcyB3aWxsIGxldCB1cyB0byBmb2N1cyBvbiB0aGUgY29yZSBsb2dp
Yy4KCkkgYW0gaW1wbGVtZW50aW5nIHRoZSBmdW5jdGlvbiBvZiByZXVzaW5nIHRoZSBidWZmZXIg
bWVudGlvbmVkIGJ5IE1pY2hhZWwsIGFuZAphdCB0aGlzIHRpbWUgdGhlcmUgd2lsbCBiZSBhIGxv
dCBvZiBkZXBlbmRlbmNlIG9uIHRoaXMgc3RydWN0dXJlLiBCZWNhdXNlIEkKd2FudCB0byBzYXZl
IHNvbWUgaW5mb3JtYXRpb24oZGVzYywgZGVzY19leHRyYSwgZGVzY19zdGV0ZSksIHRoZXNlIHN0
cnVjdHVyZXMKYXJlIHZlcnkgdXNlZnVsIGF0IHRoaXMgdGltZS4KClRoZSBvbmx5IHByb2JsZW0g
aXMgdGhhdCB0aGlzIHBhdGNoIHNldCBpcyB0b28gYmlnLiBeX14KClRoYW5rcy4KCj4KPiBUaGFu
a3MKPgo+Cj4gPgo+ID4gVGhhbmtzLgo+ID4KPiA+PiBUaGFua3MKPiA+Pgo+ID4+Cj4gPj4+ICAg
IHN0cnVjdCB2cmluZ192aXJ0cXVldWUgewo+ID4+PiAgICAJc3RydWN0IHZpcnRxdWV1ZSB2cTsK
PiA+Pj4KPiA+Pj4gQEAgLTE3MzUsNDUgKzE3NDcsMTAxIEBAIHN0YXRpYyBzdHJ1Y3QgdnJpbmdf
ZGVzY19leHRyYSAqdnJpbmdfYWxsb2NfZGVzY19leHRyYSh1bnNpZ25lZCBpbnQgbnVtKQo+ID4+
PiAgICAJcmV0dXJuIGRlc2NfZXh0cmE7Cj4gPj4+ICAgIH0KPiA+Pj4KPiA+Pj4gLXN0YXRpYyBz
dHJ1Y3QgdmlydHF1ZXVlICp2cmluZ19jcmVhdGVfdmlydHF1ZXVlX3BhY2tlZCgKPiA+Pj4gLQl1
bnNpZ25lZCBpbnQgaW5kZXgsCj4gPj4+IC0JdW5zaWduZWQgaW50IG51bSwKPiA+Pj4gLQl1bnNp
Z25lZCBpbnQgdnJpbmdfYWxpZ24sCj4gPj4+IC0Jc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYs
Cj4gPj4+IC0JYm9vbCB3ZWFrX2JhcnJpZXJzLAo+ID4+PiAtCWJvb2wgbWF5X3JlZHVjZV9udW0s
Cj4gPj4+IC0JYm9vbCBjb250ZXh0LAo+ID4+PiAtCWJvb2wgKCpub3RpZnkpKHN0cnVjdCB2aXJ0
cXVldWUgKiksCj4gPj4+IC0Jdm9pZCAoKmNhbGxiYWNrKShzdHJ1Y3QgdmlydHF1ZXVlICopLAo+
ID4+PiAtCWNvbnN0IGNoYXIgKm5hbWUpCj4gPj4+ICtzdGF0aWMgdm9pZCB2cmluZ19mcmVlX3Zy
aW5nX3BhY2tlZChzdHJ1Y3QgdnJpbmdfcGFja2VkICp2cmluZywKPiA+Pj4gKwkJCQkgICAgc3Ry
dWN0IHZpcnRpb19kZXZpY2UgKnZkZXYpCj4gPj4+ICt7Cj4gPj4+ICsJZG1hX2FkZHJfdCByaW5n
X2RtYV9hZGRyLCBkcml2ZXJfZXZlbnRfZG1hX2FkZHIsIGRldmljZV9ldmVudF9kbWFfYWRkcjsK
PiA+Pj4gKwlzdHJ1Y3QgdnJpbmdfcGFja2VkX2Rlc2NfZXZlbnQgKmRyaXZlciwgKmRldmljZTsK
PiA+Pj4gKwlzaXplX3QgcmluZ19zaXplX2luX2J5dGVzLCBldmVudF9zaXplX2luX2J5dGVzOwo+
ID4+PiArCXN0cnVjdCB2cmluZ19wYWNrZWRfZGVzYyAqcmluZzsKPiA+Pj4gKwo+ID4+PiArCXJp
bmcgICAgICAgICAgICAgICAgICA9IHZyaW5nLT5yaW5nOwo+ID4+PiArCWRyaXZlciAgICAgICAg
ICAgICAgICA9IHZyaW5nLT5kcml2ZXI7Cj4gPj4+ICsJZGV2aWNlICAgICAgICAgICAgICAgID0g
dnJpbmctPmRldmljZTsKPiA+Pj4gKwlyaW5nX3NpemVfaW5fYnl0ZXMgICAgPSB2cmluZy0+cmlu
Z19zaXplX2luX2J5dGVzOwo+ID4+PiArCWV2ZW50X3NpemVfaW5fYnl0ZXMgICA9IHZyaW5nLT5l
dmVudF9zaXplX2luX2J5dGVzOwo+ID4+PiArCXJpbmdfZG1hX2FkZHIgICAgICAgICA9IHZyaW5n
LT5yaW5nX2RtYV9hZGRyOwo+ID4+PiArCWRyaXZlcl9ldmVudF9kbWFfYWRkciA9IHZyaW5nLT5k
cml2ZXJfZXZlbnRfZG1hX2FkZHI7Cj4gPj4+ICsJZGV2aWNlX2V2ZW50X2RtYV9hZGRyID0gdnJp
bmctPmRldmljZV9ldmVudF9kbWFfYWRkcjsKPiA+Pj4gKwo+ID4+PiArCWlmIChkZXZpY2UpCj4g
Pj4+ICsJCXZyaW5nX2ZyZWVfcXVldWUodmRldiwgZXZlbnRfc2l6ZV9pbl9ieXRlcywgZGV2aWNl
LCBkZXZpY2VfZXZlbnRfZG1hX2FkZHIpOwo+ID4+PiArCj4gPj4+ICsJaWYgKGRyaXZlcikKPiA+
Pj4gKwkJdnJpbmdfZnJlZV9xdWV1ZSh2ZGV2LCBldmVudF9zaXplX2luX2J5dGVzLCBkcml2ZXIs
IGRyaXZlcl9ldmVudF9kbWFfYWRkcik7Cj4gPj4+ICsKPiA+Pj4gKwlpZiAocmluZykKPiA+Pj4g
KwkJdnJpbmdfZnJlZV9xdWV1ZSh2ZGV2LCByaW5nX3NpemVfaW5fYnl0ZXMsIHJpbmcsIHJpbmdf
ZG1hX2FkZHIpOwo+ID4+PiArfQo+ID4+PiArCj4gPj4+ICtzdGF0aWMgaW50IHZyaW5nX2FsbG9j
X3F1ZXVlX3BhY2tlZChzdHJ1Y3QgdnJpbmdfcGFja2VkICp2cmluZywKPiA+Pj4gKwkJCQkgICAg
c3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYsCj4gPj4+ICsJCQkJICAgIHUzMiBudW0pCj4gPj4+
ICAgIHsKPiA+Pj4gLQlzdHJ1Y3QgdnJpbmdfdmlydHF1ZXVlICp2cTsKPiA+Pj4gICAgCXN0cnVj
dCB2cmluZ19wYWNrZWRfZGVzYyAqcmluZzsKPiA+Pj4gICAgCXN0cnVjdCB2cmluZ19wYWNrZWRf
ZGVzY19ldmVudCAqZHJpdmVyLCAqZGV2aWNlOwo+ID4+PiAgICAJZG1hX2FkZHJfdCByaW5nX2Rt
YV9hZGRyLCBkcml2ZXJfZXZlbnRfZG1hX2FkZHIsIGRldmljZV9ldmVudF9kbWFfYWRkcjsKPiA+
Pj4gICAgCXNpemVfdCByaW5nX3NpemVfaW5fYnl0ZXMsIGV2ZW50X3NpemVfaW5fYnl0ZXM7Cj4g
Pj4+Cj4gPj4+ICsJbWVtc2V0KHZyaW5nLCAwLCBzaXplb2YoKnZyaW5nKSk7Cj4gPj4+ICsKPiA+
Pj4gICAgCXJpbmdfc2l6ZV9pbl9ieXRlcyA9IG51bSAqIHNpemVvZihzdHJ1Y3QgdnJpbmdfcGFj
a2VkX2Rlc2MpOwo+ID4+Pgo+ID4+PiAgICAJcmluZyA9IHZyaW5nX2FsbG9jX3F1ZXVlKHZkZXYs
IHJpbmdfc2l6ZV9pbl9ieXRlcywKPiA+Pj4gICAgCQkJCSAmcmluZ19kbWFfYWRkciwKPiA+Pj4g
ICAgCQkJCSBHRlBfS0VSTkVMfF9fR0ZQX05PV0FSTnxfX0dGUF9aRVJPKTsKPiA+Pj4gICAgCWlm
ICghcmluZykKPiA+Pj4gLQkJZ290byBlcnJfcmluZzsKPiA+Pj4gKwkJZ290byBlcnI7Cj4gPj4+
ICsKPiA+Pj4gKwl2cmluZy0+bnVtID0gbnVtOwo+ID4+PiArCXZyaW5nLT5yaW5nID0gcmluZzsK
PiA+Pj4gKwl2cmluZy0+cmluZ19zaXplX2luX2J5dGVzID0gcmluZ19zaXplX2luX2J5dGVzOwo+
ID4+PiArCXZyaW5nLT5yaW5nX2RtYV9hZGRyID0gcmluZ19kbWFfYWRkcjsKPiA+Pj4KPiA+Pj4g
ICAgCWV2ZW50X3NpemVfaW5fYnl0ZXMgPSBzaXplb2Yoc3RydWN0IHZyaW5nX3BhY2tlZF9kZXNj
X2V2ZW50KTsKPiA+Pj4gKwl2cmluZy0+ZXZlbnRfc2l6ZV9pbl9ieXRlcyA9IGV2ZW50X3NpemVf
aW5fYnl0ZXM7Cj4gPj4+Cj4gPj4+ICAgIAlkcml2ZXIgPSB2cmluZ19hbGxvY19xdWV1ZSh2ZGV2
LCBldmVudF9zaXplX2luX2J5dGVzLAo+ID4+PiAgICAJCQkJICAgJmRyaXZlcl9ldmVudF9kbWFf
YWRkciwKPiA+Pj4gICAgCQkJCSAgIEdGUF9LRVJORUx8X19HRlBfTk9XQVJOfF9fR0ZQX1pFUk8p
Owo+ID4+PiAgICAJaWYgKCFkcml2ZXIpCj4gPj4+IC0JCWdvdG8gZXJyX2RyaXZlcjsKPiA+Pj4g
KwkJZ290byBlcnI7Cj4gPj4+ICsKPiA+Pj4gKwl2cmluZy0+ZHJpdmVyID0gZHJpdmVyOwo+ID4+
PiArCXZyaW5nLT5kcml2ZXJfZXZlbnRfZG1hX2FkZHIgPSBkcml2ZXJfZXZlbnRfZG1hX2FkZHI7
Cj4gPj4+Cj4gPj4+ICAgIAlkZXZpY2UgPSB2cmluZ19hbGxvY19xdWV1ZSh2ZGV2LCBldmVudF9z
aXplX2luX2J5dGVzLAo+ID4+PiAgICAJCQkJICAgJmRldmljZV9ldmVudF9kbWFfYWRkciwKPiA+
Pj4gICAgCQkJCSAgIEdGUF9LRVJORUx8X19HRlBfTk9XQVJOfF9fR0ZQX1pFUk8pOwo+ID4+PiAg
ICAJaWYgKCFkZXZpY2UpCj4gPj4+IC0JCWdvdG8gZXJyX2RldmljZTsKPiA+Pj4gKwkJZ290byBl
cnI7Cj4gPj4+ICsKPiA+Pj4gKwl2cmluZy0+ZGV2aWNlID0gZGV2aWNlOwo+ID4+PiArCXZyaW5n
LT5kZXZpY2VfZXZlbnRfZG1hX2FkZHIgPSBkZXZpY2VfZXZlbnRfZG1hX2FkZHI7Cj4gPj4+ICsJ
cmV0dXJuIDA7Cj4gPj4+ICsKPiA+Pj4gK2VycjoKPiA+Pj4gKwl2cmluZ19mcmVlX3ZyaW5nX3Bh
Y2tlZCh2cmluZywgdmRldik7Cj4gPj4+ICsJcmV0dXJuIC1FTk9NRU07Cj4gPj4+ICt9Cj4gPj4+
ICsKPiA+Pj4gK3N0YXRpYyBzdHJ1Y3QgdmlydHF1ZXVlICp2cmluZ19jcmVhdGVfdmlydHF1ZXVl
X3BhY2tlZCgKPiA+Pj4gKwl1bnNpZ25lZCBpbnQgaW5kZXgsCj4gPj4+ICsJdW5zaWduZWQgaW50
IG51bSwKPiA+Pj4gKwl1bnNpZ25lZCBpbnQgdnJpbmdfYWxpZ24sCj4gPj4+ICsJc3RydWN0IHZp
cnRpb19kZXZpY2UgKnZkZXYsCj4gPj4+ICsJYm9vbCB3ZWFrX2JhcnJpZXJzLAo+ID4+PiArCWJv
b2wgbWF5X3JlZHVjZV9udW0sCj4gPj4+ICsJYm9vbCBjb250ZXh0LAo+ID4+PiArCWJvb2wgKCpu
b3RpZnkpKHN0cnVjdCB2aXJ0cXVldWUgKiksCj4gPj4+ICsJdm9pZCAoKmNhbGxiYWNrKShzdHJ1
Y3QgdmlydHF1ZXVlICopLAo+ID4+PiArCWNvbnN0IGNoYXIgKm5hbWUpCj4gPj4+ICt7Cj4gPj4+
ICsJc3RydWN0IHZyaW5nX3ZpcnRxdWV1ZSAqdnE7Cj4gPj4+ICsJc3RydWN0IHZyaW5nX3BhY2tl
ZCB2cmluZzsKPiA+Pj4gKwo+ID4+PiArCWlmICh2cmluZ19hbGxvY19xdWV1ZV9wYWNrZWQoJnZy
aW5nLCB2ZGV2LCBudW0pKQo+ID4+PiArCQlnb3RvIGVycl92cTsKPiA+Pj4KPiA+Pj4gICAgCXZx
ID0ga21hbGxvYyhzaXplb2YoKnZxKSwgR0ZQX0tFUk5FTCk7Cj4gPj4+ICAgIAlpZiAoIXZxKQo+
ID4+PiBAQCAtMTgwNSwxNyArMTg3MywxNyBAQCBzdGF0aWMgc3RydWN0IHZpcnRxdWV1ZSAqdnJp
bmdfY3JlYXRlX3ZpcnRxdWV1ZV9wYWNrZWQoCj4gPj4+ICAgIAlpZiAodmlydGlvX2hhc19mZWF0
dXJlKHZkZXYsIFZJUlRJT19GX09SREVSX1BMQVRGT1JNKSkKPiA+Pj4gICAgCQl2cS0+d2Vha19i
YXJyaWVycyA9IGZhbHNlOwo+ID4+Pgo+ID4+PiAtCXZxLT5wYWNrZWQucmluZ19kbWFfYWRkciA9
IHJpbmdfZG1hX2FkZHI7Cj4gPj4+IC0JdnEtPnBhY2tlZC5kcml2ZXJfZXZlbnRfZG1hX2FkZHIg
PSBkcml2ZXJfZXZlbnRfZG1hX2FkZHI7Cj4gPj4+IC0JdnEtPnBhY2tlZC5kZXZpY2VfZXZlbnRf
ZG1hX2FkZHIgPSBkZXZpY2VfZXZlbnRfZG1hX2FkZHI7Cj4gPj4+ICsJdnEtPnBhY2tlZC5yaW5n
X2RtYV9hZGRyID0gdnJpbmcucmluZ19kbWFfYWRkcjsKPiA+Pj4gKwl2cS0+cGFja2VkLmRyaXZl
cl9ldmVudF9kbWFfYWRkciA9IHZyaW5nLmRyaXZlcl9ldmVudF9kbWFfYWRkcjsKPiA+Pj4gKwl2
cS0+cGFja2VkLmRldmljZV9ldmVudF9kbWFfYWRkciA9IHZyaW5nLmRldmljZV9ldmVudF9kbWFf
YWRkcjsKPiA+Pj4KPiA+Pj4gLQl2cS0+cGFja2VkLnJpbmdfc2l6ZV9pbl9ieXRlcyA9IHJpbmdf
c2l6ZV9pbl9ieXRlczsKPiA+Pj4gLQl2cS0+cGFja2VkLmV2ZW50X3NpemVfaW5fYnl0ZXMgPSBl
dmVudF9zaXplX2luX2J5dGVzOwo+ID4+PiArCXZxLT5wYWNrZWQucmluZ19zaXplX2luX2J5dGVz
ID0gdnJpbmcucmluZ19zaXplX2luX2J5dGVzOwo+ID4+PiArCXZxLT5wYWNrZWQuZXZlbnRfc2l6
ZV9pbl9ieXRlcyA9IHZyaW5nLmV2ZW50X3NpemVfaW5fYnl0ZXM7Cj4gPj4+Cj4gPj4+ICAgIAl2
cS0+cGFja2VkLnZyaW5nLm51bSA9IG51bTsKPiA+Pj4gLQl2cS0+cGFja2VkLnZyaW5nLmRlc2Mg
PSByaW5nOwo+ID4+PiAtCXZxLT5wYWNrZWQudnJpbmcuZHJpdmVyID0gZHJpdmVyOwo+ID4+PiAt
CXZxLT5wYWNrZWQudnJpbmcuZGV2aWNlID0gZGV2aWNlOwo+ID4+PiArCXZxLT5wYWNrZWQudnJp
bmcuZGVzYyA9IHZyaW5nLnJpbmc7Cj4gPj4+ICsJdnEtPnBhY2tlZC52cmluZy5kcml2ZXIgPSB2
cmluZy5kcml2ZXI7Cj4gPj4+ICsJdnEtPnBhY2tlZC52cmluZy5kZXZpY2UgPSB2cmluZy5kZXZp
Y2U7Cj4gPj4+Cj4gPj4+ICAgIAl2cS0+cGFja2VkLm5leHRfYXZhaWxfaWR4ID0gMDsKPiA+Pj4g
ICAgCXZxLT5wYWNrZWQuYXZhaWxfd3JhcF9jb3VudGVyID0gMTsKPiA+Pj4gQEAgLTE4NTYsMTIg
KzE5MjQsNyBAQCBzdGF0aWMgc3RydWN0IHZpcnRxdWV1ZSAqdnJpbmdfY3JlYXRlX3ZpcnRxdWV1
ZV9wYWNrZWQoCj4gPj4+ICAgIGVycl9kZXNjX3N0YXRlOgo+ID4+PiAgICAJa2ZyZWUodnEpOwo+
ID4+PiAgICBlcnJfdnE6Cj4gPj4+IC0JdnJpbmdfZnJlZV9xdWV1ZSh2ZGV2LCBldmVudF9zaXpl
X2luX2J5dGVzLCBkZXZpY2UsIGRldmljZV9ldmVudF9kbWFfYWRkcik7Cj4gPj4+IC1lcnJfZGV2
aWNlOgo+ID4+PiAtCXZyaW5nX2ZyZWVfcXVldWUodmRldiwgZXZlbnRfc2l6ZV9pbl9ieXRlcywg
ZHJpdmVyLCBkcml2ZXJfZXZlbnRfZG1hX2FkZHIpOwo+ID4+PiAtZXJyX2RyaXZlcjoKPiA+Pj4g
LQl2cmluZ19mcmVlX3F1ZXVlKHZkZXYsIHJpbmdfc2l6ZV9pbl9ieXRlcywgcmluZywgcmluZ19k
bWFfYWRkcik7Cj4gPj4+IC1lcnJfcmluZzoKPiA+Pj4gKwl2cmluZ19mcmVlX3ZyaW5nX3BhY2tl
ZCgmdnJpbmcsIHZkZXYpOwo+ID4+PiAgICAJcmV0dXJuIE5VTEw7Cj4gPj4+ICAgIH0KPiA+Pj4K
PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFs
aXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlv
bi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8v
dmlydHVhbGl6YXRpb24=
