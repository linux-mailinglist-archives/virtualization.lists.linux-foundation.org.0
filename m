Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B81644D2C1E
	for <lists.virtualization@lfdr.de>; Wed,  9 Mar 2022 10:34:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69A5F81371;
	Wed,  9 Mar 2022 09:34:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LWYr11tiRleo; Wed,  9 Mar 2022 09:34:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D3FC181367;
	Wed,  9 Mar 2022 09:34:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 61F9AC0073;
	Wed,  9 Mar 2022 09:34:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49B65C000B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Mar 2022 09:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 362A840159
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Mar 2022 09:34:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YGQUg8Eb50dJ
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Mar 2022 09:34:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7FCEE4002B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Mar 2022 09:34:50 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R681e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407; MF=xuanzhuo@linux.alibaba.com;
 NM=1; PH=DS; RN=33; SR=0; TI=SMTPD_---0V6j5w1D_1646818482; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0V6j5w1D_1646818482) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 09 Mar 2022 17:34:44 +0800
Message-ID: <1646818472.5069678-10-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v7 18/26] virtio: find_vqs() add arg sizes
Date: Wed, 9 Mar 2022 17:34:32 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Jason Wang <jasowang@redhat.com>
References: <20220308123518.33800-1-xuanzhuo@linux.alibaba.com>
 <20220308123518.33800-19-xuanzhuo@linux.alibaba.com>
 <0fb55c37-69a6-a700-504b-e8d78b86fed4@redhat.com>
In-Reply-To: <0fb55c37-69a6-a700-504b-e8d78b86fed4@redhat.com>
Cc: Vadim Pasternak <vadimp@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-remoteproc@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-s390@vger.kernel.org,
 Johannes Berg <johannes.berg@intel.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Richard Weinberger <richard@nod.at>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 John Fastabend <john.fastabend@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jakub Kicinski <kuba@kernel.org>, virtualization@lists.linux-foundation.org,
 Heiko Carstens <hca@linux.ibm.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Jeff Dike <jdike@addtoit.com>,
 linux-um@lists.infradead.org, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, kvm@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, netdev@vger.kernel.org,
 Cornelia Huck <cohuck@redhat.com>, Sven Schnelle <svens@linux.ibm.com>,
 bpf@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
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

T24gV2VkLCA5IE1hciAyMDIyIDE2OjU5OjMyICswODAwLCBKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
ZWRoYXQuY29tPiB3cm90ZToKPgo+IOWcqCAyMDIyLzMvOCDkuIvljYg4OjM1LCBYdWFuIFpodW8g
5YaZ6YGTOgo+ID4gZmluZF92cXMoKSBhZGRzIGEgbmV3IHBhcmFtZXRlciBzaXplcyB0byBzcGVj
aWZ5IHRoZSBzaXplIG9mIGVhY2ggdnEKPiA+IHZyaW5nLgo+ID4KPiA+IDAgbWVhbnMgdXNlIHRo
ZSBtYXhpbXVtIHNpemUgc3VwcG9ydGVkIGJ5IHRoZSBiYWNrZW5kLgo+ID4KPiA+IEluIHRoZSBz
cGxpdCBzY2VuYXJpbywgdGhlIG1lYW5pbmcgb2Ygc2l6ZSBpcyB0aGUgbGFyZ2VzdCBzaXplLCBi
ZWNhdXNlCj4gPiBpdCBtYXkgYmUgbGltaXRlZCBieSBtZW1vcnksIHRoZSB2aXJ0aW8gY29yZSB3
aWxsIHRyeSBhIHNtYWxsZXIgc2l6ZS4KPiA+IEFuZCB0aGUgc2l6ZSBpcyBwb3dlciBvZiAyLgo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFh1YW4gWmh1byA8eHVhbnpodW9AbGludXguYWxpYmFiYS5j
b20+Cj4gPiAtLS0KPiA+ICAgYXJjaC91bS9kcml2ZXJzL3ZpcnRpb191bWwuYyAgICAgICAgICAg
ICB8ICAyICstCj4gPiAgIGRyaXZlcnMvcGxhdGZvcm0vbWVsbGFub3gvbWx4YmYtdG1maWZvLmMg
fCAgMyArKy0KPiA+ICAgZHJpdmVycy9yZW1vdGVwcm9jL3JlbW90ZXByb2NfdmlydGlvLmMgICB8
ICAyICstCj4gPiAgIGRyaXZlcnMvczM5MC92aXJ0aW8vdmlydGlvX2Njdy5jICAgICAgICAgfCAg
MiArLQo+ID4gICBkcml2ZXJzL3ZpcnRpby92aXJ0aW9fbW1pby5jICAgICAgICAgICAgIHwgIDIg
Ky0KPiA+ICAgZHJpdmVycy92aXJ0aW8vdmlydGlvX3BjaV9jb21tb24uYyAgICAgICB8ICAyICst
Cj4gPiAgIGRyaXZlcnMvdmlydGlvL3ZpcnRpb19wY2lfY29tbW9uLmggICAgICAgfCAgMiArLQo+
ID4gICBkcml2ZXJzL3ZpcnRpby92aXJ0aW9fcGNpX21vZGVybi5jICAgICAgIHwgIDUgKysrLS0K
PiA+ICAgZHJpdmVycy92aXJ0aW8vdmlydGlvX3ZkcGEuYyAgICAgICAgICAgICB8ICAyICstCj4g
PiAgIGluY2x1ZGUvbGludXgvdmlydGlvX2NvbmZpZy5oICAgICAgICAgICAgfCAxMSArKysrKysr
LS0tLQo+ID4gICAxMCBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlv
bnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC91bS9kcml2ZXJzL3ZpcnRpb191bWwuYyBi
L2FyY2gvdW0vZHJpdmVycy92aXJ0aW9fdW1sLmMKPiA+IGluZGV4IGJhNTYyZDY4ZGMwNC4uMDU1
YjkxY2NiZThhIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC91bS9kcml2ZXJzL3ZpcnRpb191bWwuYwo+
ID4gKysrIGIvYXJjaC91bS9kcml2ZXJzL3ZpcnRpb191bWwuYwo+ID4gQEAgLTk5OCw3ICs5OTgs
NyBAQCBzdGF0aWMgc3RydWN0IHZpcnRxdWV1ZSAqdnVfc2V0dXBfdnEoc3RydWN0IHZpcnRpb19k
ZXZpY2UgKnZkZXYsCj4gPiAgIHN0YXRpYyBpbnQgdnVfZmluZF92cXMoc3RydWN0IHZpcnRpb19k
ZXZpY2UgKnZkZXYsIHVuc2lnbmVkIG52cXMsCj4gPiAgIAkJICAgICAgIHN0cnVjdCB2aXJ0cXVl
dWUgKnZxc1tdLCB2cV9jYWxsYmFja190ICpjYWxsYmFja3NbXSwKPiA+ICAgCQkgICAgICAgY29u
c3QgY2hhciAqIGNvbnN0IG5hbWVzW10sIGNvbnN0IGJvb2wgKmN0eCwKPiA+IC0JCSAgICAgICBz
dHJ1Y3QgaXJxX2FmZmluaXR5ICpkZXNjKQo+ID4gKwkJICAgICAgIHN0cnVjdCBpcnFfYWZmaW5p
dHkgKmRlc2MsIHUzMiBzaXplc1tdKQo+ID4gICB7Cj4gPiAgIAlzdHJ1Y3QgdmlydGlvX3VtbF9k
ZXZpY2UgKnZ1X2RldiA9IHRvX3ZpcnRpb191bWxfZGV2aWNlKHZkZXYpOwo+ID4gICAJaW50IGks
IHF1ZXVlX2lkeCA9IDAsIHJjOwo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0vbWVs
bGFub3gvbWx4YmYtdG1maWZvLmMgYi9kcml2ZXJzL3BsYXRmb3JtL21lbGxhbm94L21seGJmLXRt
Zmlmby5jCj4gPiBpbmRleCAzODgwMGU4NmVkOGEuLmFlYTdhYTIxOGIyMiAxMDA2NDQKPiA+IC0t
LSBhL2RyaXZlcnMvcGxhdGZvcm0vbWVsbGFub3gvbWx4YmYtdG1maWZvLmMKPiA+ICsrKyBiL2Ry
aXZlcnMvcGxhdGZvcm0vbWVsbGFub3gvbWx4YmYtdG1maWZvLmMKPiA+IEBAIC05MjksNyArOTI5
LDggQEAgc3RhdGljIGludCBtbHhiZl90bWZpZm9fdmlydGlvX2ZpbmRfdnFzKHN0cnVjdCB2aXJ0
aW9fZGV2aWNlICp2ZGV2LAo+ID4gICAJCQkJCXZxX2NhbGxiYWNrX3QgKmNhbGxiYWNrc1tdLAo+
ID4gICAJCQkJCWNvbnN0IGNoYXIgKiBjb25zdCBuYW1lc1tdLAo+Cj4KPiBOaXQ6IExldCdzIGJl
IGNvbnNpc3RlbnQgaGVyZSwgZS5nIG1vdmUgc2l6ZXMgYmVmb3JlIGN0eCAodGhpcyBpcyB3aGF0
Cj4gbmV4dCBwYXRjaCBkaWQgYW5kIHNlZW1zIGNsZWFuZXIpLgoKT0suCgpUaGFua3MuCgo+Cj4g
VGhhbmtzCj4KPgo+ID4gICAJCQkJCWNvbnN0IGJvb2wgKmN0eCwKPiA+IC0JCQkJCXN0cnVjdCBp
cnFfYWZmaW5pdHkgKmRlc2MpCj4gPiArCQkJCQlzdHJ1Y3QgaXJxX2FmZmluaXR5ICpkZXNjLAo+
ID4gKwkJCQkJdTMyIHNpemVzW10pCj4gPiAgIHsKPiA+ICAgCXN0cnVjdCBtbHhiZl90bWZpZm9f
dmRldiAqdG1fdmRldiA9IG1seGJmX3ZkZXZfdG9fdG1maWZvKHZkZXYpOwo+ID4gICAJc3RydWN0
IG1seGJmX3RtZmlmb192cmluZyAqdnJpbmc7Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZW1v
dGVwcm9jL3JlbW90ZXByb2NfdmlydGlvLmMgYi9kcml2ZXJzL3JlbW90ZXByb2MvcmVtb3RlcHJv
Y192aXJ0aW8uYwo+ID4gaW5kZXggNzBhYjQ5NmQwNDMxLi4zYTE2N2JlYzViMDkgMTAwNjQ0Cj4g
PiAtLS0gYS9kcml2ZXJzL3JlbW90ZXByb2MvcmVtb3RlcHJvY192aXJ0aW8uYwo+ID4gKysrIGIv
ZHJpdmVycy9yZW1vdGVwcm9jL3JlbW90ZXByb2NfdmlydGlvLmMKPiA+IEBAIC0xNTcsNyArMTU3
LDcgQEAgc3RhdGljIGludCBycHJvY192aXJ0aW9fZmluZF92cXMoc3RydWN0IHZpcnRpb19kZXZp
Y2UgKnZkZXYsIHVuc2lnbmVkIGludCBudnFzLAo+ID4gICAJCQkJIHZxX2NhbGxiYWNrX3QgKmNh
bGxiYWNrc1tdLAo+ID4gICAJCQkJIGNvbnN0IGNoYXIgKiBjb25zdCBuYW1lc1tdLAo+ID4gICAJ
CQkJIGNvbnN0IGJvb2wgKiBjdHgsCj4gPiAtCQkJCSBzdHJ1Y3QgaXJxX2FmZmluaXR5ICpkZXNj
KQo+ID4gKwkJCQkgc3RydWN0IGlycV9hZmZpbml0eSAqZGVzYywgdTMyIHNpemVzW10pCj4gPiAg
IHsKPiA+ICAgCWludCBpLCByZXQsIHF1ZXVlX2lkeCA9IDA7Cj4gPgo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvczM5MC92aXJ0aW8vdmlydGlvX2Njdy5jIGIvZHJpdmVycy9zMzkwL3ZpcnRpby92
aXJ0aW9fY2N3LmMKPiA+IGluZGV4IGQzNWU3YTNmNzA2Ny4uYjc0ZTA4YzcxNTM0IDEwMDY0NAo+
ID4gLS0tIGEvZHJpdmVycy9zMzkwL3ZpcnRpby92aXJ0aW9fY2N3LmMKPiA+ICsrKyBiL2RyaXZl
cnMvczM5MC92aXJ0aW8vdmlydGlvX2Njdy5jCj4gPiBAQCAtNjMyLDcgKzYzMiw3IEBAIHN0YXRp
YyBpbnQgdmlydGlvX2Njd19maW5kX3ZxcyhzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldiwgdW5z
aWduZWQgbnZxcywKPiA+ICAgCQkJICAgICAgIHZxX2NhbGxiYWNrX3QgKmNhbGxiYWNrc1tdLAo+
ID4gICAJCQkgICAgICAgY29uc3QgY2hhciAqIGNvbnN0IG5hbWVzW10sCj4gPiAgIAkJCSAgICAg
ICBjb25zdCBib29sICpjdHgsCj4gPiAtCQkJICAgICAgIHN0cnVjdCBpcnFfYWZmaW5pdHkgKmRl
c2MpCj4gPiArCQkJICAgICAgIHN0cnVjdCBpcnFfYWZmaW5pdHkgKmRlc2MsIHUzMiBzaXplc1td
KQo+ID4gICB7Cj4gPiAgIAlzdHJ1Y3QgdmlydGlvX2Njd19kZXZpY2UgKnZjZGV2ID0gdG9fdmNf
ZGV2aWNlKHZkZXYpOwo+ID4gICAJdW5zaWduZWQgbG9uZyAqaW5kaWNhdG9ycCA9IE5VTEw7Cj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aXJ0aW8vdmlydGlvX21taW8uYyBiL2RyaXZlcnMvdmly
dGlvL3ZpcnRpb19tbWlvLmMKPiA+IGluZGV4IGE0MWFiYzgwNTFiOS4uNTVkNTc1ZjZlZjJkIDEw
MDY0NAo+ID4gLS0tIGEvZHJpdmVycy92aXJ0aW8vdmlydGlvX21taW8uYwo+ID4gKysrIGIvZHJp
dmVycy92aXJ0aW8vdmlydGlvX21taW8uYwo+ID4gQEAgLTQ2Miw3ICs0NjIsNyBAQCBzdGF0aWMg
aW50IHZtX2ZpbmRfdnFzKHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2LCB1bnNpZ25lZCBudnFz
LAo+ID4gICAJCSAgICAgICB2cV9jYWxsYmFja190ICpjYWxsYmFja3NbXSwKPiA+ICAgCQkgICAg
ICAgY29uc3QgY2hhciAqIGNvbnN0IG5hbWVzW10sCj4gPiAgIAkJICAgICAgIGNvbnN0IGJvb2wg
KmN0eCwKPiA+IC0JCSAgICAgICBzdHJ1Y3QgaXJxX2FmZmluaXR5ICpkZXNjKQo+ID4gKwkJICAg
ICAgIHN0cnVjdCBpcnFfYWZmaW5pdHkgKmRlc2MsIHUzMiBzaXplc1tdKQo+ID4gICB7Cj4gPiAg
IAlzdHJ1Y3QgdmlydGlvX21taW9fZGV2aWNlICp2bV9kZXYgPSB0b192aXJ0aW9fbW1pb19kZXZp
Y2UodmRldik7Cj4gPiAgIAlpbnQgaXJxID0gcGxhdGZvcm1fZ2V0X2lycSh2bV9kZXYtPnBkZXYs
IDApOwo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19wY2lfY29tbW9uLmMg
Yi9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcGNpX2NvbW1vbi5jCj4gPiBpbmRleCA4NjNkM2E4YTA5
NTYuLjhlOGZhN2U1YWQ4MCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19w
Y2lfY29tbW9uLmMKPiA+ICsrKyBiL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19wY2lfY29tbW9uLmMK
PiA+IEBAIC00MjgsNyArNDI4LDcgQEAgc3RhdGljIGludCB2cF9maW5kX3Zxc19pbnR4KHN0cnVj
dCB2aXJ0aW9fZGV2aWNlICp2ZGV2LCB1bnNpZ25lZCBudnFzLAo+ID4gICBpbnQgdnBfZmluZF92
cXMoc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYsIHVuc2lnbmVkIG52cXMsCj4gPiAgIAkJc3Ry
dWN0IHZpcnRxdWV1ZSAqdnFzW10sIHZxX2NhbGxiYWNrX3QgKmNhbGxiYWNrc1tdLAo+ID4gICAJ
CWNvbnN0IGNoYXIgKiBjb25zdCBuYW1lc1tdLCBjb25zdCBib29sICpjdHgsCj4gPiAtCQlzdHJ1
Y3QgaXJxX2FmZmluaXR5ICpkZXNjKQo+ID4gKwkJc3RydWN0IGlycV9hZmZpbml0eSAqZGVzYywg
dTMyIHNpemVzW10pCj4gPiAgIHsKPiA+ICAgCWludCBlcnI7Cj4gPgo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvdmlydGlvL3ZpcnRpb19wY2lfY29tbW9uLmggYi9kcml2ZXJzL3ZpcnRpby92aXJ0
aW9fcGNpX2NvbW1vbi5oCj4gPiBpbmRleCAyM2Y2YzVjNjc4ZDUuLjlkYmYxZDU1NWRmZiAxMDA2
NDQKPiA+IC0tLSBhL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19wY2lfY29tbW9uLmgKPiA+ICsrKyBi
L2RyaXZlcnMvdmlydGlvL3ZpcnRpb19wY2lfY29tbW9uLmgKPiA+IEBAIC0xMTQsNyArMTE0LDcg
QEAgdm9pZCB2cF9kZWxfdnFzKHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2KTsKPiA+ICAgaW50
IHZwX2ZpbmRfdnFzKHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2LCB1bnNpZ25lZCBudnFzLAo+
ID4gICAJCXN0cnVjdCB2aXJ0cXVldWUgKnZxc1tdLCB2cV9jYWxsYmFja190ICpjYWxsYmFja3Nb
XSwKPiA+ICAgCQljb25zdCBjaGFyICogY29uc3QgbmFtZXNbXSwgY29uc3QgYm9vbCAqY3R4LAo+
ID4gLQkJc3RydWN0IGlycV9hZmZpbml0eSAqZGVzYyk7Cj4gPiArCQlzdHJ1Y3QgaXJxX2FmZmlu
aXR5ICpkZXNjLCB1MzIgc2l6ZXNbXSk7Cj4gPiAgIGNvbnN0IGNoYXIgKnZwX2J1c19uYW1lKHN0
cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2KTsKPiA+Cj4gPiAgIC8qIFNldHVwIHRoZSBhZmZpbml0
eSBmb3IgYSB2aXJ0cXVldWU6Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aXJ0aW8vdmlydGlv
X3BjaV9tb2Rlcm4uYyBiL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19wY2lfbW9kZXJuLmMKPiA+IGlu
ZGV4IDNjNjdkMzYwNzgwMi4uMzQyNzk1MTc1YzI5IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy92
aXJ0aW8vdmlydGlvX3BjaV9tb2Rlcm4uYwo+ID4gKysrIGIvZHJpdmVycy92aXJ0aW8vdmlydGlv
X3BjaV9tb2Rlcm4uYwo+ID4gQEAgLTM0MywxMSArMzQzLDEyIEBAIHN0YXRpYyBpbnQgdnBfbW9k
ZXJuX2ZpbmRfdnFzKHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2LCB1bnNpZ25lZCBudnFzLAo+
ID4gICAJCQkgICAgICBzdHJ1Y3QgdmlydHF1ZXVlICp2cXNbXSwKPiA+ICAgCQkJICAgICAgdnFf
Y2FsbGJhY2tfdCAqY2FsbGJhY2tzW10sCj4gPiAgIAkJCSAgICAgIGNvbnN0IGNoYXIgKiBjb25z
dCBuYW1lc1tdLCBjb25zdCBib29sICpjdHgsCj4gPiAtCQkJICAgICAgc3RydWN0IGlycV9hZmZp
bml0eSAqZGVzYykKPiA+ICsJCQkgICAgICBzdHJ1Y3QgaXJxX2FmZmluaXR5ICpkZXNjLCB1MzIg
c2l6ZXNbXSkKPiA+ICAgewo+ID4gICAJc3RydWN0IHZpcnRpb19wY2lfZGV2aWNlICp2cF9kZXYg
PSB0b192cF9kZXZpY2UodmRldik7Cj4gPiAgIAlzdHJ1Y3QgdmlydHF1ZXVlICp2cTsKPiA+IC0J
aW50IHJjID0gdnBfZmluZF92cXModmRldiwgbnZxcywgdnFzLCBjYWxsYmFja3MsIG5hbWVzLCBj
dHgsIGRlc2MpOwo+ID4gKwlpbnQgcmMgPSB2cF9maW5kX3Zxcyh2ZGV2LCBudnFzLCB2cXMsIGNh
bGxiYWNrcywgbmFtZXMsIGN0eCwgZGVzYywKPiA+ICsJCQkgICAgIHNpemVzKTsKPiA+Cj4gPiAg
IAlpZiAocmMpCj4gPiAgIAkJcmV0dXJuIHJjOwo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmly
dGlvL3ZpcnRpb192ZHBhLmMgYi9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fdmRwYS5jCj4gPiBpbmRl
eCA3NzY3YTdmMDExOWIuLmVlMDhkMDFlZThiMSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvdmly
dGlvL3ZpcnRpb192ZHBhLmMKPiA+ICsrKyBiL2RyaXZlcnMvdmlydGlvL3ZpcnRpb192ZHBhLmMK
PiA+IEBAIC0yNjgsNyArMjY4LDcgQEAgc3RhdGljIGludCB2aXJ0aW9fdmRwYV9maW5kX3Zxcyhz
dHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldiwgdW5zaWduZWQgbnZxcywKPiA+ICAgCQkJCXZxX2Nh
bGxiYWNrX3QgKmNhbGxiYWNrc1tdLAo+ID4gICAJCQkJY29uc3QgY2hhciAqIGNvbnN0IG5hbWVz
W10sCj4gPiAgIAkJCQljb25zdCBib29sICpjdHgsCj4gPiAtCQkJCXN0cnVjdCBpcnFfYWZmaW5p
dHkgKmRlc2MpCj4gPiArCQkJCXN0cnVjdCBpcnFfYWZmaW5pdHkgKmRlc2MsIHUzMiBzaXplc1td
KQo+ID4gICB7Cj4gPiAgIAlzdHJ1Y3QgdmlydGlvX3ZkcGFfZGV2aWNlICp2ZF9kZXYgPSB0b192
aXJ0aW9fdmRwYV9kZXZpY2UodmRldik7Cj4gPiAgIAlzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkcGEg
PSB2ZF9nZXRfdmRwYSh2ZGV2KTsKPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3ZpcnRp
b19jb25maWcuaCBiL2luY2x1ZGUvbGludXgvdmlydGlvX2NvbmZpZy5oCj4gPiBpbmRleCAwYjgx
ZmJlMTdjODUuLjUxNTc1MjRkODAzNiAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvbGludXgvdmly
dGlvX2NvbmZpZy5oCj4gPiArKysgYi9pbmNsdWRlL2xpbnV4L3ZpcnRpb19jb25maWcuaAo+ID4g
QEAgLTU3LDYgKzU3LDcgQEAgc3RydWN0IHZpcnRpb19zaG1fcmVnaW9uIHsKPiA+ICAgICoJCWlu
Y2x1ZGUgYSBOVUxMIGVudHJ5IGZvciB2cXMgdGhhdCBkbyBub3QgbmVlZCBhIGNhbGxiYWNrCj4g
PiAgICAqCW5hbWVzOiBhcnJheSBvZiB2aXJ0cXVldWUgbmFtZXMgKG1haW5seSBmb3IgZGVidWdn
aW5nKQo+ID4gICAgKgkJaW5jbHVkZSBhIE5VTEwgZW50cnkgZm9yIHZxcyB1bnVzZWQgYnkgZHJp
dmVyCj4gPiArICoJc2l6ZXM6IGFycmF5IG9mIHZpcnRxdWV1ZSBzaXplcwo+ID4gICAgKglSZXR1
cm5zIDAgb24gc3VjY2VzcyBvciBlcnJvciBzdGF0dXMKPiA+ICAgICogQGRlbF92cXM6IGZyZWUg
dmlydHF1ZXVlcyBmb3VuZCBieSBmaW5kX3ZxcygpLgo+ID4gICAgKiBAZ2V0X2ZlYXR1cmVzOiBn
ZXQgdGhlIGFycmF5IG9mIGZlYXR1cmUgYml0cyBmb3IgdGhpcyBkZXZpY2UuCj4gPiBAQCAtOTgs
NyArOTksOCBAQCBzdHJ1Y3QgdmlydGlvX2NvbmZpZ19vcHMgewo+ID4gICAJaW50ICgqZmluZF92
cXMpKHN0cnVjdCB2aXJ0aW9fZGV2aWNlICosIHVuc2lnbmVkIG52cXMsCj4gPiAgIAkJCXN0cnVj
dCB2aXJ0cXVldWUgKnZxc1tdLCB2cV9jYWxsYmFja190ICpjYWxsYmFja3NbXSwKPiA+ICAgCQkJ
Y29uc3QgY2hhciAqIGNvbnN0IG5hbWVzW10sIGNvbnN0IGJvb2wgKmN0eCwKPiA+IC0JCQlzdHJ1
Y3QgaXJxX2FmZmluaXR5ICpkZXNjKTsKPiA+ICsJCQlzdHJ1Y3QgaXJxX2FmZmluaXR5ICpkZXNj
LAo+ID4gKwkJCXUzMiBzaXplc1tdKTsKPiA+ICAgCXZvaWQgKCpkZWxfdnFzKShzdHJ1Y3Qgdmly
dGlvX2RldmljZSAqKTsKPiA+ICAgCXU2NCAoKmdldF9mZWF0dXJlcykoc3RydWN0IHZpcnRpb19k
ZXZpY2UgKnZkZXYpOwo+ID4gICAJaW50ICgqZmluYWxpemVfZmVhdHVyZXMpKHN0cnVjdCB2aXJ0
aW9fZGV2aWNlICp2ZGV2KTsKPiA+IEBAIC0yMDUsNyArMjA3LDcgQEAgc3RydWN0IHZpcnRxdWV1
ZSAqdmlydGlvX2ZpbmRfc2luZ2xlX3ZxKHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2LAo+ID4g
ICAJY29uc3QgY2hhciAqbmFtZXNbXSA9IHsgbiB9Owo+ID4gICAJc3RydWN0IHZpcnRxdWV1ZSAq
dnE7Cj4gPiAgIAlpbnQgZXJyID0gdmRldi0+Y29uZmlnLT5maW5kX3Zxcyh2ZGV2LCAxLCAmdnEs
IGNhbGxiYWNrcywgbmFtZXMsIE5VTEwsCj4gPiAtCQkJCQkgTlVMTCk7Cj4gPiArCQkJCQkgTlVM
TCwgTlVMTCk7Cj4gPiAgIAlpZiAoZXJyIDwgMCkKPiA+ICAgCQlyZXR1cm4gRVJSX1BUUihlcnIp
Owo+ID4gICAJcmV0dXJuIHZxOwo+ID4gQEAgLTIxNyw3ICsyMTksOCBAQCBpbnQgdmlydGlvX2Zp
bmRfdnFzKHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2LCB1bnNpZ25lZCBudnFzLAo+ID4gICAJ
CQljb25zdCBjaGFyICogY29uc3QgbmFtZXNbXSwKPiA+ICAgCQkJc3RydWN0IGlycV9hZmZpbml0
eSAqZGVzYykKPiA+ICAgewo+ID4gLQlyZXR1cm4gdmRldi0+Y29uZmlnLT5maW5kX3Zxcyh2ZGV2
LCBudnFzLCB2cXMsIGNhbGxiYWNrcywgbmFtZXMsIE5VTEwsIGRlc2MpOwo+ID4gKwlyZXR1cm4g
dmRldi0+Y29uZmlnLT5maW5kX3Zxcyh2ZGV2LCBudnFzLCB2cXMsIGNhbGxiYWNrcywgbmFtZXMs
IE5VTEwsCj4gPiArCQkJCSAgICAgIGRlc2MsIE5VTEwpOwo+ID4gICB9Cj4gPgo+ID4gICBzdGF0
aWMgaW5saW5lCj4gPiBAQCAtMjI3LDcgKzIzMCw3IEBAIGludCB2aXJ0aW9fZmluZF92cXNfY3R4
KHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2LCB1bnNpZ25lZCBudnFzLAo+ID4gICAJCQlzdHJ1
Y3QgaXJxX2FmZmluaXR5ICpkZXNjKQo+ID4gICB7Cj4gPiAgIAlyZXR1cm4gdmRldi0+Y29uZmln
LT5maW5kX3Zxcyh2ZGV2LCBudnFzLCB2cXMsIGNhbGxiYWNrcywgbmFtZXMsIGN0eCwKPiA+IC0J
CQkJICAgICAgZGVzYyk7Cj4gPiArCQkJCSAgICAgIGRlc2MsIE5VTEwpOwo+ID4gICB9Cj4gPgo+
ID4gICAvKioKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgt
Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4v
bGlzdGluZm8vdmlydHVhbGl6YXRpb24=
