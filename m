Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E04646C6111
	for <lists.virtualization@lfdr.de>; Thu, 23 Mar 2023 08:47:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8340D41CB1;
	Thu, 23 Mar 2023 07:47:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8340D41CB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xvWmvONQWM76; Thu, 23 Mar 2023 07:47:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id F121A41CAF;
	Thu, 23 Mar 2023 07:47:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F121A41CAF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1198AC008A;
	Thu, 23 Mar 2023 07:47:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BCB85C0032
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Mar 2023 07:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FA9741DC5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Mar 2023 07:47:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FA9741DC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KRDOBu9pbtvU
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Mar 2023 07:46:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A894641D8E
Received: from out30-98.freemail.mail.aliyun.com
 (out30-98.freemail.mail.aliyun.com [115.124.30.98])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A894641D8E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Mar 2023 07:46:58 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R981e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=11; SR=0;
 TI=SMTPD_---0VeTgHVB_1679557611; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VeTgHVB_1679557611) by smtp.aliyun-inc.com;
 Thu, 23 Mar 2023 15:46:52 +0800
Message-ID: <1679557537.9112334-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v4] virtio: add VIRTIO_F_NOTIFICATION_DATA feature support
Date: Thu, 23 Mar 2023 15:45:37 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20230322141031.2211141-1-viktor@daynix.com>
 <1679534465.5760474-1-xuanzhuo@linux.alibaba.com>
 <CAPv0NP5gusfkyvX4qhMMiXsTZpckammmc5R7M=e9USi3C=1QAQ@mail.gmail.com>
 <20230323032320-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230323032320-mutt-send-email-mst@kernel.org>
Cc: linux-s390@vger.kernel.org, farman@linux.ibm.com, kvm@vger.kernel.org,
 cohuck@redhat.com, Viktor Prutyanov <viktor@daynix.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 pasic@linux.ibm.com, yan@daynix.com
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

T24gVGh1LCAyMyBNYXIgMjAyMyAwMzoyNToyNSAtMDQwMCwgIk1pY2hhZWwgUy4gVHNpcmtpbiIg
PG1zdEByZWRoYXQuY29tPiB3cm90ZToKPiBPbiBUaHUsIE1hciAyMywgMjAyMyBhdCAxMDoxODo1
NkFNICswMzAwLCBWaWt0b3IgUHJ1dHlhbm92IHdyb3RlOgo+ID4gT24gVGh1LCBNYXIgMjMsIDIw
MjMgYXQgNDoyMuKAr0FNIFh1YW4gWmh1byA8eHVhbnpodW9AbGludXguYWxpYmFiYS5jb20+IHdy
b3RlOgo+ID4gPgo+ID4gPiBPbiBXZWQsIDIyIE1hciAyMDIzIDE3OjEwOjMxICswMzAwLCBWaWt0
b3IgUHJ1dHlhbm92IDx2aWt0b3JAZGF5bml4LmNvbT4gd3JvdGU6Cj4gPiA+ID4gQWNjb3JkaW5n
IHRvIFZpcnRJTyBzcGVjIHYxLjIsIFZJUlRJT19GX05PVElGSUNBVElPTl9EQVRBIGZlYXR1cmUK
PiA+ID4gPiBpbmRpY2F0ZXMgdGhhdCB0aGUgZHJpdmVyIHBhc3NlcyBleHRyYSBkYXRhIGFsb25n
IHdpdGggdGhlIHF1ZXVlCj4gPiA+ID4gbm90aWZpY2F0aW9ucy4KPiA+ID4gPgo+ID4gPiA+IElu
IGEgc3BsaXQgcXVldWUgY2FzZSwgdGhlIGV4dHJhIGRhdGEgaXMgMTYtYml0IGF2YWlsYWJsZSBp
bmRleC4gSW4gYQo+ID4gPiA+IHBhY2tlZCBxdWV1ZSBjYXNlLCB0aGUgZXh0cmEgZGF0YSBpcyAx
LWJpdCB3cmFwIGNvdW50ZXIgYW5kIDE1LWJpdAo+ID4gPiA+IGF2YWlsYWJsZSBpbmRleC4KPiA+
ID4gPgo+ID4gPiA+IEFkZCBzdXBwb3J0IGZvciB0aGlzIGZlYXR1cmUgZm9yIE1NSU8sIGNoYW5u
ZWwgSS9PIGFuZCBtb2Rlcm4gUENJCj4gPiA+ID4gdHJhbnNwb3J0cy4KPiA+ID4gPgo+ID4gPiA+
IFNpZ25lZC1vZmYtYnk6IFZpa3RvciBQcnV0eWFub3YgPHZpa3RvckBkYXluaXguY29tPgo+ID4g
PiA+IC0tLQo+ID4gPiA+ICB2NDogcmVtb3ZlIFZQX05PVElGWSBtYWNybyBhbmQgbGVnYWN5IFBD
SSBzdXBwb3J0LCBhZGQKPiA+ID4gPiAgICAgdmlydGlvX2Njd19rdm1fbm90aWZ5X3dpdGhfZGF0
YSB0byB2aXJ0aW9fY2N3Cj4gPiA+ID4gIHYzOiBzdXBwb3J0IGZlYXR1cmUgaW4gdmlydGlvX2Nj
dywgcmVtb3ZlIFZNX05PVElGWSwgdXNlIGF2YWlsX2lkeF9zaGFkb3csCj4gPiA+ID4gICAgIHJl
bW92ZSBieXRlIHN3YXAsIHJlbmFtZSB0byB2cmluZ19ub3RpZmljYXRpb25fZGF0YQo+ID4gPiA+
ICB2MjogcmVqZWN0IHRoZSBmZWF0dXJlIGluIHZpcnRpb19jY3csIHJlcGxhY2UgX19sZTMyIHdp
dGggdTMyCj4gPiA+ID4KPiA+ID4gPiAgVGVzdGVkIHdpdGggZGlzYWJsZWQgVklSVElPX0ZfTk9U
SUZJQ0FUSU9OX0RBVEEgb24gcWVtdS1zeXN0ZW0tczM5MHgKPiA+ID4gPiAgKHZpcnRpby1ibGst
Y2N3KSwgcWVtdS1zeXN0ZW0tcmlzY3Y2NCAodmlydGlvLWJsay1kZXZpY2UsCj4gPiA+ID4gIHZp
cnRpby1ybmctZGV2aWNlKSwgcWVtdS1zeXN0ZW0teDg2XzY0ICh2aXJ0aW8tYmxrLXBjaSwgdmly
dGlvLW5ldC1wY2kpCj4gPiA+ID4gIHRvIG1ha2Ugc3VyZSBub3RoaW5nIGlzIGJyb2tlbi4KPiA+
ID4gPiAgVGVzdGVkIHdpdGggZW5hYmxlZCBWSVJUSU9fRl9OT1RJRklDQVRJT05fREFUQSBvbiA2
NC1iaXQgUklTQy1WIExpbnV4Cj4gPiA+ID4gIGFuZCBteSBoYXJkd2FyZSBpbXBsZW1lbnRhdGlv
biBvZiB2aXJ0aW8tcm5nLgo+ID4gPiA+Cj4gPiA+ID4gIGRyaXZlcnMvczM5MC92aXJ0aW8vdmly
dGlvX2Njdy5jICAgfCAxOSArKysrKysrKysrKysrKysrLS0tCj4gPiA+ID4gIGRyaXZlcnMvdmly
dGlvL3ZpcnRpb19tbWlvLmMgICAgICAgfCAxNCArKysrKysrKysrKysrLQo+ID4gPiA+ICBkcml2
ZXJzL3ZpcnRpby92aXJ0aW9fcGNpX21vZGVybi5jIHwgMTMgKysrKysrKysrKysrLQo+ID4gPiA+
ICBkcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jICAgICAgIHwgMTcgKysrKysrKysrKysrKysr
KysKPiA+ID4gPiAgaW5jbHVkZS9saW51eC92aXJ0aW9fcmluZy5oICAgICAgICB8ICAyICsrCj4g
PiA+ID4gIGluY2x1ZGUvdWFwaS9saW51eC92aXJ0aW9fY29uZmlnLmggfCAgNiArKysrKysKPiA+
ID4gPiAgNiBmaWxlcyBjaGFuZ2VkLCA2NiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+
ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvczM5MC92aXJ0aW8vdmlydGlvX2Nj
dy5jIGIvZHJpdmVycy9zMzkwL3ZpcnRpby92aXJ0aW9fY2N3LmMKPiA+ID4gPiBpbmRleCA5NTRm
YzMxYjRiYzcuLjM2MTk2NzZlZmZiOCAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL3MzOTAv
dmlydGlvL3ZpcnRpb19jY3cuYwo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvczM5MC92aXJ0aW8vdmly
dGlvX2Njdy5jCj4gPiA+ID4gQEAgLTM5MSw3ICszOTEsNyBAQCBzdGF0aWMgdm9pZCB2aXJ0aW9f
Y2N3X2Ryb3BfaW5kaWNhdG9yKHN0cnVjdCB2aXJ0aW9fY2N3X2RldmljZSAqdmNkZXYsCj4gPiA+
ID4gICAgICAgY2N3X2RldmljZV9kbWFfZnJlZSh2Y2Rldi0+Y2RldiwgdGhpbmludF9hcmVhLCBz
aXplb2YoKnRoaW5pbnRfYXJlYSkpOwo+ID4gPiA+ICB9Cj4gPiA+ID4KPiA+ID4gPiAtc3RhdGlj
IGJvb2wgdmlydGlvX2Njd19rdm1fbm90aWZ5KHN0cnVjdCB2aXJ0cXVldWUgKnZxKQo+ID4gPiA+
ICtzdGF0aWMgaW5saW5lIGJvb2wgdmlydGlvX2Njd19kb19rdm1fbm90aWZ5KHN0cnVjdCB2aXJ0
cXVldWUgKnZxLCB1MzIgZGF0YSkKPiA+ID4gPiAgewo+ID4gPiA+ICAgICAgIHN0cnVjdCB2aXJ0
aW9fY2N3X3ZxX2luZm8gKmluZm8gPSB2cS0+cHJpdjsKPiA+ID4gPiAgICAgICBzdHJ1Y3Qgdmly
dGlvX2Njd19kZXZpY2UgKnZjZGV2Owo+ID4gPiA+IEBAIC00MDIsMTIgKzQwMiwyMiBAQCBzdGF0
aWMgYm9vbCB2aXJ0aW9fY2N3X2t2bV9ub3RpZnkoc3RydWN0IHZpcnRxdWV1ZSAqdnEpCj4gPiA+
ID4gICAgICAgQlVJTERfQlVHX09OKHNpemVvZihzdHJ1Y3Qgc3ViY2hhbm5lbF9pZCkgIT0gc2l6
ZW9mKHVuc2lnbmVkIGludCkpOwo+ID4gPiA+ICAgICAgIGluZm8tPmNvb2tpZSA9IGt2bV9oeXBl
cmNhbGwzKEtWTV9TMzkwX1ZJUlRJT19DQ1dfTk9USUZZLAo+ID4gPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICooKHVuc2lnbmVkIGludCAqKSZzY2hpZCksCj4gPiA+ID4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdnEtPmluZGV4LCBpbmZvLT5jb29r
aWUpOwo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRhdGEsIGlu
Zm8tPmNvb2tpZSk7Cj4gPiA+ID4gICAgICAgaWYgKGluZm8tPmNvb2tpZSA8IDApCj4gPiA+ID4g
ICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPiA+ID4gICAgICAgcmV0dXJuIHRydWU7Cj4g
PiA+ID4gIH0KPiA+ID4gPgo+ID4gPiA+ICtzdGF0aWMgYm9vbCB2aXJ0aW9fY2N3X2t2bV9ub3Rp
Znkoc3RydWN0IHZpcnRxdWV1ZSAqdnEpCj4gPiA+ID4gK3sKPiA+ID4gPiArICAgICByZXR1cm4g
dmlydGlvX2Njd19kb19rdm1fbm90aWZ5KHZxLCB2cS0+aW5kZXgpOwo+ID4gPiA+ICt9Cj4gPiA+
ID4gKwo+ID4gPiA+ICtzdGF0aWMgYm9vbCB2aXJ0aW9fY2N3X2t2bV9ub3RpZnlfd2l0aF9kYXRh
KHN0cnVjdCB2aXJ0cXVldWUgKnZxKQo+ID4gPiA+ICt7Cj4gPiA+ID4gKyAgICAgcmV0dXJuIHZp
cnRpb19jY3dfZG9fa3ZtX25vdGlmeSh2cSwgdnJpbmdfbm90aWZpY2F0aW9uX2RhdGEodnEpKTsK
PiA+ID4gPiArfQo+ID4gPiA+ICsKPiA+ID4gPiAgc3RhdGljIGludCB2aXJ0aW9fY2N3X3JlYWRf
dnFfY29uZihzdHJ1Y3QgdmlydGlvX2Njd19kZXZpY2UgKnZjZGV2LAo+ID4gPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBjY3cxICpjY3csIGludCBpbmRleCkKPiA+
ID4gPiAgewo+ID4gPiA+IEBAIC01MDEsNiArNTExLDkgQEAgc3RhdGljIHN0cnVjdCB2aXJ0cXVl
dWUgKnZpcnRpb19jY3dfc2V0dXBfdnEoc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYsCj4gPiA+
ID4gICAgICAgdTY0IHF1ZXVlOwo+ID4gPiA+ICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4g
PiA+ID4gICAgICAgYm9vbCBtYXlfcmVkdWNlOwo+ID4gPiA+ICsgICAgIGJvb2wgKCpub3RpZnkp
KHN0cnVjdCB2aXJ0cXVldWUgKnZxKSA9IF9fdmlydGlvX3Rlc3RfYml0KHZkZXYsCj4gPiA+ID4g
KyAgICAgICAgICAgICBWSVJUSU9fRl9OT1RJRklDQVRJT05fREFUQSkgPwo+ID4gPiA+ICsgICAg
ICAgICAgICAgdmlydGlvX2Njd19rdm1fbm90aWZ5X3dpdGhfZGF0YSA6IHZpcnRpb19jY3dfa3Zt
X25vdGlmeTsKPiA+ID4gPgo+ID4gPiA+ICAgICAgIC8qIEFsbG9jYXRlIHF1ZXVlLiAqLwo+ID4g
PiA+ICAgICAgIGluZm8gPSBremFsbG9jKHNpemVvZihzdHJ1Y3QgdmlydGlvX2Njd192cV9pbmZv
KSwgR0ZQX0tFUk5FTCk7Cj4gPiA+ID4gQEAgLTUyNCw3ICs1MzcsNyBAQCBzdGF0aWMgc3RydWN0
IHZpcnRxdWV1ZSAqdmlydGlvX2Njd19zZXR1cF92cShzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRl
diwKPiA+ID4gPiAgICAgICBtYXlfcmVkdWNlID0gdmNkZXYtPnJldmlzaW9uID4gMDsKPiA+ID4g
PiAgICAgICB2cSA9IHZyaW5nX2NyZWF0ZV92aXJ0cXVldWUoaSwgaW5mby0+bnVtLCBLVk1fVklS
VElPX0NDV19SSU5HX0FMSUdOLAo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB2ZGV2LCB0cnVlLCBtYXlfcmVkdWNlLCBjdHgsCj4gPiA+ID4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHZpcnRpb19jY3dfa3ZtX25vdGlmeSwgY2FsbGJhY2ssIG5hbWUp
Owo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBub3RpZnksIGNhbGxi
YWNrLCBuYW1lKTsKPiA+ID4gPgo+ID4gPiA+ICAgICAgIGlmICghdnEpIHsKPiA+ID4gPiAgICAg
ICAgICAgICAgIC8qIEZvciBub3csIHdlIGZhaWwgaWYgd2UgY2FuJ3QgZ2V0IHRoZSByZXF1ZXN0
ZWQgc2l6ZS4gKi8KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aXJ0aW8vdmlydGlvX21t
aW8uYyBiL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19tbWlvLmMKPiA+ID4gPiBpbmRleCAzZmY3NDZl
M2YyNGEuLjdjMTZlNjIyYzMzZCAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL3ZpcnRpby92
aXJ0aW9fbW1pby5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX21taW8uY3YK
PiA+ID4gPiBAQCAtMjg1LDYgKzI4NSwxNiBAQCBzdGF0aWMgYm9vbCB2bV9ub3RpZnkoc3RydWN0
IHZpcnRxdWV1ZSAqdnEpCj4gPiA+ID4gICAgICAgcmV0dXJuIHRydWU7Cj4gPiA+ID4gIH0KPiA+
ID4gPgo+ID4gPiA+ICtzdGF0aWMgYm9vbCB2bV9ub3RpZnlfd2l0aF9kYXRhKHN0cnVjdCB2aXJ0
cXVldWUgKnZxKQo+ID4gPiA+ICt7Cj4gPiA+ID4gKyAgICAgc3RydWN0IHZpcnRpb19tbWlvX2Rl
dmljZSAqdm1fZGV2ID0gdG9fdmlydGlvX21taW9fZGV2aWNlKHZxLT52ZGV2KTsKPiA+ID4gPiAr
ICAgICB1MzIgZGF0YSA9IHZyaW5nX25vdGlmaWNhdGlvbl9kYXRhKHZxKTsKPiA+ID4gPiArCj4g
PiA+ID4gKyAgICAgd3JpdGVsKGRhdGEsIHZtX2Rldi0+YmFzZSArIFZJUlRJT19NTUlPX1FVRVVF
X05PVElGWSk7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgIHJldHVybiB0cnVlOwo+ID4gPiA+ICt9
Cj4gPiA+ID4gKwo+ID4gPiA+ICAvKiBOb3RpZnkgYWxsIHZpcnRxdWV1ZXMgb24gYW4gaW50ZXJy
dXB0LiAqLwo+ID4gPiA+ICBzdGF0aWMgaXJxcmV0dXJuX3Qgdm1faW50ZXJydXB0KGludCBpcnEs
IHZvaWQgKm9wYXF1ZSkKPiA+ID4gPiAgewo+ID4gPiA+IEBAIC0zNjgsNiArMzc4LDggQEAgc3Rh
dGljIHN0cnVjdCB2aXJ0cXVldWUgKnZtX3NldHVwX3ZxKHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2
ZGV2LCB1bnNpZ25lZCBpbnQgaW4KPiA+ID4gPiAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwo+
ID4gPiA+ICAgICAgIHVuc2lnbmVkIGludCBudW07Cj4gPiA+ID4gICAgICAgaW50IGVycjsKPiA+
ID4gPiArICAgICBib29sICgqbm90aWZ5KShzdHJ1Y3QgdmlydHF1ZXVlICp2cSkgPSBfX3ZpcnRp
b190ZXN0X2JpdCh2ZGV2LAo+ID4gPiA+ICsgICAgICAgICAgICAgVklSVElPX0ZfTk9USUZJQ0FU
SU9OX0RBVEEpID8gdm1fbm90aWZ5X3dpdGhfZGF0YSA6IHZtX25vdGlmeTsKPiA+ID4KPiA+ID4K
PiA+ID4gQ2FuIHdlIG9wdGltaXplIHRoaXMgbGluZT8KPiA+Cj4gPiBXaGF0IGtpbmQgb2Ygb3B0
aW1pemF0aW9uIGRvIHlvdSBtZWFuPwo+Cj4gSW4gZmFjdCBzcGVlZCBkb2VzIG5vdCBtYXR0ZXIg
aGVyZSBidXQgaXQgaXMgbm90IHZlcnkgcmVhZGFibGUuCj4gVXNlIG9mICI/IiB3YXMganVzdGlm
aWVkIGlmIHlvdSBwdXQgdGhpcyBpbnNpZGUgdGhlIGNhbGwgdG8gdnJpbmdfY3JlYXRlX3ZpcnRx
dWV1ZQo+ICh3aGljaCBJIHN0aWxsIGZlZWwgd291bGQgYmUgYmVzdCkuCj4gQnV0IGlmIHlvdSB1
c2UgYSB2YXJpYWJsZSwganVzdCB1c2UgcGxhaW4gaWY6Cj4KPiAJYm9vbCAoKm5vdGlmeSkoc3Ry
dWN0IHZpcnRxdWV1ZSAqdnEpOwo+Cj4gCWlmIChfX3ZpcnRpb190ZXN0X2JpdCh2ZGV2LFZJUlRJ
T19GX05PVElGSUNBVElPTl9EQVRBKSkKPiAJCQl2cSA9IHZtX25vdGlmeV93aXRoX2RhdGE7Cj4g
CWVsc2UKPiAJCQl2cSA9IHZtX25vdGlmeTsKCgpZZXMsIEkgbWVhbiB0aGlzLCBJIGRvbid0IG1l
YW4gcGVyZm9ybWFuY2UuIEl0IHJlZmVycyB0byB0aGUgZm9ybSBvZiBjb2RlLiBJdApzaG91bGQg
YmUgdGhhdCBteSBleHByZXNzaW9uIGlzIGluYWNjdXJhdGUuCgoKVGhhbmtzLgoKPgo+Cj4gPiA+
Cj4gPiA+IFRoYW5rcy4KPiA+ID4KPiA+ID4gPgo+ID4gPiA+ICAgICAgIGlmICghbmFtZSkKPiA+
ID4gPiAgICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+ID4gPiA+IEBAIC0zOTcsNyArNDA5LDcg
QEAgc3RhdGljIHN0cnVjdCB2aXJ0cXVldWUgKnZtX3NldHVwX3ZxKHN0cnVjdCB2aXJ0aW9fZGV2
aWNlICp2ZGV2LCB1bnNpZ25lZCBpbnQgaW4KPiA+ID4gPgo+ID4gPiA+ICAgICAgIC8qIENyZWF0
ZSB0aGUgdnJpbmcgKi8KPiA+ID4gPiAgICAgICB2cSA9IHZyaW5nX2NyZWF0ZV92aXJ0cXVldWUo
aW5kZXgsIG51bSwgVklSVElPX01NSU9fVlJJTkdfQUxJR04sIHZkZXYsCj4gPiA+ID4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHRydWUsIHRydWUsIGN0eCwgdm1fbm90aWZ5LCBjYWxs
YmFjaywgbmFtZSk7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRydWUs
IHRydWUsIGN0eCwgbm90aWZ5LCBjYWxsYmFjaywgbmFtZSk7Cj4gPiA+ID4gICAgICAgaWYgKCF2
cSkgewo+ID4gPiA+ICAgICAgICAgICAgICAgZXJyID0gLUVOT01FTTsKPiA+ID4gPiAgICAgICAg
ICAgICAgIGdvdG8gZXJyb3JfbmV3X3ZpcnRxdWV1ZTsKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy92aXJ0aW8vdmlydGlvX3BjaV9tb2Rlcm4uYyBiL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19w
Y2lfbW9kZXJuLmMKPiA+ID4gPiBpbmRleCA5ZTQ5NmUyODhjZmEuLjljYzU2ZjQ2M2RiYSAxMDA2
NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcGNpX21vZGVybi5jCj4gPiA+
ID4gKysrIGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX3BjaV9tb2Rlcm4uYwo+ID4gPiA+IEBAIC0y
ODgsNiArMjg4LDE1IEBAIHN0YXRpYyB1MTYgdnBfY29uZmlnX3ZlY3RvcihzdHJ1Y3QgdmlydGlv
X3BjaV9kZXZpY2UgKnZwX2RldiwgdTE2IHZlY3RvcikKPiA+ID4gPiAgICAgICByZXR1cm4gdnBf
bW9kZXJuX2NvbmZpZ192ZWN0b3IoJnZwX2Rldi0+bWRldiwgdmVjdG9yKTsKPiA+ID4gPiAgfQo+
ID4gPiA+Cj4gPiA+ID4gK3N0YXRpYyBib29sIHZwX25vdGlmeV93aXRoX2RhdGEoc3RydWN0IHZp
cnRxdWV1ZSAqdnEpCj4gPiA+ID4gK3sKPiA+ID4gPiArICAgICB1MzIgZGF0YSA9IHZyaW5nX25v
dGlmaWNhdGlvbl9kYXRhKHZxKTsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgaW93cml0ZTMyKGRh
dGEsICh2b2lkIF9faW9tZW0gKil2cS0+cHJpdik7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgIHJl
dHVybiB0cnVlOwo+ID4gPiA+ICt9Cj4gPiA+ID4gKwo+ID4gPiA+ICBzdGF0aWMgc3RydWN0IHZp
cnRxdWV1ZSAqc2V0dXBfdnEoc3RydWN0IHZpcnRpb19wY2lfZGV2aWNlICp2cF9kZXYsCj4gPiA+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgdmlydGlvX3BjaV92cV9p
bmZvICppbmZvLAo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgaW50IGluZGV4LAo+ID4gPiA+IEBAIC0zMDEsNiArMzEwLDggQEAgc3RhdGljIHN0cnVjdCB2
aXJ0cXVldWUgKnNldHVwX3ZxKHN0cnVjdCB2aXJ0aW9fcGNpX2RldmljZSAqdnBfZGV2LAo+ID4g
PiA+ICAgICAgIHN0cnVjdCB2aXJ0cXVldWUgKnZxOwo+ID4gPiA+ICAgICAgIHUxNiBudW07Cj4g
PiA+ID4gICAgICAgaW50IGVycjsKPiA+ID4gPiArICAgICBib29sICgqbm90aWZ5KShzdHJ1Y3Qg
dmlydHF1ZXVlICp2cSkgPSBfX3ZpcnRpb190ZXN0X2JpdCgmdnBfZGV2LT52ZGV2LAo+ID4gPiA+
ICsgICAgICAgICAgICAgVklSVElPX0ZfTk9USUZJQ0FUSU9OX0RBVEEpID8gdnBfbm90aWZ5X3dp
dGhfZGF0YSA6IHZwX25vdGlmeTsKPiA+ID4gPgo+ID4gPiA+ICAgICAgIGlmIChpbmRleCA+PSB2
cF9tb2Rlcm5fZ2V0X251bV9xdWV1ZXMobWRldikpCj4gPiA+ID4gICAgICAgICAgICAgICByZXR1
cm4gRVJSX1BUUigtRUlOVkFMKTsKPiA+ID4gPiBAQCAtMzIxLDcgKzMzMiw3IEBAIHN0YXRpYyBz
dHJ1Y3QgdmlydHF1ZXVlICpzZXR1cF92cShzdHJ1Y3QgdmlydGlvX3BjaV9kZXZpY2UgKnZwX2Rl
diwKPiA+ID4gPiAgICAgICB2cSA9IHZyaW5nX2NyZWF0ZV92aXJ0cXVldWUoaW5kZXgsIG51bSwK
PiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU01QX0NBQ0hFX0JZVEVT
LCAmdnBfZGV2LT52ZGV2LAo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB0cnVlLCB0cnVlLCBjdHgsCj4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHZwX25vdGlmeSwgY2FsbGJhY2ssIG5hbWUpOwo+ID4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBub3RpZnksIGNhbGxiYWNrLCBuYW1lKTsKPiA+ID4gPiAgICAgICBp
ZiAoIXZxKQo+ID4gPiA+ICAgICAgICAgICAgICAgcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7Cj4g
PiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aXJ0aW8vdmlydGlvX3JpbmcuYyBi
L2RyaXZlcnMvdmlydGlvL3ZpcnRpb19yaW5nLmMKPiA+ID4gPiBpbmRleCA0YzNiYjBkZGViOWIu
LjgzNzg3NWNjMzE5MCAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9f
cmluZy5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX3JpbmcuYwo+ID4gPiA+
IEBAIC0yNzUyLDYgKzI3NTIsMjEgQEAgdm9pZCB2cmluZ19kZWxfdmlydHF1ZXVlKHN0cnVjdCB2
aXJ0cXVldWUgKl92cSkKPiA+ID4gPiAgfQo+ID4gPiA+ICBFWFBPUlRfU1lNQk9MX0dQTCh2cmlu
Z19kZWxfdmlydHF1ZXVlKTsKPiA+ID4gPgo+ID4gPiA+ICt1MzIgdnJpbmdfbm90aWZpY2F0aW9u
X2RhdGEoc3RydWN0IHZpcnRxdWV1ZSAqX3ZxKQo+ID4gPiA+ICt7Cj4gPiA+ID4gKyAgICAgc3Ry
dWN0IHZyaW5nX3ZpcnRxdWV1ZSAqdnEgPSB0b192dnEoX3ZxKTsKPiA+ID4gPiArICAgICB1MTYg
bmV4dDsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgaWYgKHZxLT5wYWNrZWRfcmluZykKPiA+ID4g
PiArICAgICAgICAgICAgIG5leHQgPSAodnEtPnBhY2tlZC5uZXh0X2F2YWlsX2lkeCAmIH4oMSA8
PCAxNSkpIHwKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgdnEtPnBhY2tlZC5hdmFpbF93
cmFwX2NvdW50ZXIgPDwgMTU7Cj4gPiA+ID4gKyAgICAgZWxzZQo+ID4gPiA+ICsgICAgICAgICAg
ICAgbmV4dCA9IHZxLT5zcGxpdC5hdmFpbF9pZHhfc2hhZG93Owo+ID4gPiA+ICsKPiA+ID4gPiAr
ICAgICByZXR1cm4gbmV4dCA8PCAxNiB8IF92cS0+aW5kZXg7Cj4gPiA+ID4gK30KPiA+ID4gPiAr
RVhQT1JUX1NZTUJPTF9HUEwodnJpbmdfbm90aWZpY2F0aW9uX2RhdGEpOwo+ID4gPiA+ICsKPiA+
ID4gPiAgLyogTWFuaXB1bGF0ZXMgdHJhbnNwb3J0LXNwZWNpZmljIGZlYXR1cmUgYml0cy4gKi8K
PiA+ID4gPiAgdm9pZCB2cmluZ190cmFuc3BvcnRfZmVhdHVyZXMoc3RydWN0IHZpcnRpb19kZXZp
Y2UgKnZkZXYpCj4gPiA+ID4gIHsKPiA+ID4gPiBAQCAtMjc3MSw2ICsyNzg2LDggQEAgdm9pZCB2
cmluZ190cmFuc3BvcnRfZmVhdHVyZXMoc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYpCj4gPiA+
ID4gICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gPiA+ICAgICAgICAgICAgICAgY2Fz
ZSBWSVJUSU9fRl9PUkRFUl9QTEFURk9STToKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAg
YnJlYWs7Cj4gPiA+ID4gKyAgICAgICAgICAgICBjYXNlIFZJUlRJT19GX05PVElGSUNBVElPTl9E
QVRBOgo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+ID4gPiAgICAgICAg
ICAgICAgIGRlZmF1bHQ6Cj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIC8qIFdlIGRvbid0
IHVuZGVyc3RhbmQgdGhpcyBiaXQuICovCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIF9f
dmlydGlvX2NsZWFyX2JpdCh2ZGV2LCBpKTsKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9s
aW51eC92aXJ0aW9fcmluZy5oIGIvaW5jbHVkZS9saW51eC92aXJ0aW9fcmluZy5oCj4gPiA+ID4g
aW5kZXggOGI5NWI2OWVmNjk0Li4yNTUwYzkxNzBmNGYgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvaW5j
bHVkZS9saW51eC92aXJ0aW9fcmluZy5oCj4gPiA+ID4gKysrIGIvaW5jbHVkZS9saW51eC92aXJ0
aW9fcmluZy5oCj4gPiA+ID4gQEAgLTExNyw0ICsxMTcsNiBAQCB2b2lkIHZyaW5nX2RlbF92aXJ0
cXVldWUoc3RydWN0IHZpcnRxdWV1ZSAqdnEpOwo+ID4gPiA+ICB2b2lkIHZyaW5nX3RyYW5zcG9y
dF9mZWF0dXJlcyhzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldik7Cj4gPiA+ID4KPiA+ID4gPiAg
aXJxcmV0dXJuX3QgdnJpbmdfaW50ZXJydXB0KGludCBpcnEsIHZvaWQgKl92cSk7Cj4gPiA+ID4g
Kwo+ID4gPiA+ICt1MzIgdnJpbmdfbm90aWZpY2F0aW9uX2RhdGEoc3RydWN0IHZpcnRxdWV1ZSAq
X3ZxKTsKPiA+ID4gPiAgI2VuZGlmIC8qIF9MSU5VWF9WSVJUSU9fUklOR19IICovCj4gPiA+ID4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC92aXJ0aW9fY29uZmlnLmggYi9pbmNsdWRl
L3VhcGkvbGludXgvdmlydGlvX2NvbmZpZy5oCj4gPiA+ID4gaW5kZXggM2MwNTE2MmJjOTg4Li4y
YzcxMmM2NTQxNjUgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L3ZpcnRp
b19jb25maWcuaAo+ID4gPiA+ICsrKyBiL2luY2x1ZGUvdWFwaS9saW51eC92aXJ0aW9fY29uZmln
LmgKPiA+ID4gPiBAQCAtOTksNiArOTksMTIgQEAKPiA+ID4gPiAgICovCj4gPiA+ID4gICNkZWZp
bmUgVklSVElPX0ZfU1JfSU9WICAgICAgICAgICAgICAgICAgICAgIDM3Cj4gPiA+ID4KPiA+ID4g
PiArLyoKPiA+ID4gPiArICogVGhpcyBmZWF0dXJlIGluZGljYXRlcyB0aGF0IHRoZSBkcml2ZXIg
cGFzc2VzIGV4dHJhIGRhdGEgKGJlc2lkZXMKPiA+ID4gPiArICogaWRlbnRpZnlpbmcgdGhlIHZp
cnRxdWV1ZSkgaW4gaXRzIGRldmljZSBub3RpZmljYXRpb25zLgo+ID4gPiA+ICsgKi8KPiA+ID4g
PiArI2RlZmluZSBWSVJUSU9fRl9OT1RJRklDQVRJT05fREFUQSAgIDM4Cj4gPiA+ID4gKwo+ID4g
PiA+ICAvKgo+ID4gPiA+ICAgKiBUaGlzIGZlYXR1cmUgaW5kaWNhdGVzIHRoYXQgdGhlIGRyaXZl
ciBjYW4gcmVzZXQgYSBxdWV1ZSBpbmRpdmlkdWFsbHkuCj4gPiA+ID4gICAqLwo+ID4gPiA+IC0t
Cj4gPiA+ID4gMi4zNS4xCj4gPiA+ID4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRp
b25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRp
b24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
