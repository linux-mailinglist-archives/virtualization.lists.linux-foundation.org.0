Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E97464D2D00
	for <lists.virtualization@lfdr.de>; Wed,  9 Mar 2022 11:20:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 817CC40159;
	Wed,  9 Mar 2022 10:20:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WsgZx2w3GLTx; Wed,  9 Mar 2022 10:20:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9E76A40AA3;
	Wed,  9 Mar 2022 10:20:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 25ADCC0073;
	Wed,  9 Mar 2022 10:20:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D963C000B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Mar 2022 10:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 209C440159
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Mar 2022 10:20:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m9VjimB7q7Wh
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Mar 2022 10:20:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out199-14.us.a.mail.aliyun.com (out199-14.us.a.mail.aliyun.com
 [47.90.199.14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B64C4002B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Mar 2022 10:20:41 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424; MF=xuanzhuo@linux.alibaba.com;
 NM=1; PH=DS; RN=33; SR=0; TI=SMTPD_---0V6jFsoZ_1646821234; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0V6jFsoZ_1646821234) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 09 Mar 2022 18:20:35 +0800
Message-ID: <1646821007.3534708-15-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v7 24/26] virtio_net: support rx/tx queue reset
Date: Wed, 9 Mar 2022 18:16:47 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Jason Wang <jasowang@redhat.com>
References: <20220308123518.33800-1-xuanzhuo@linux.alibaba.com>
 <20220308123518.33800-25-xuanzhuo@linux.alibaba.com>
 <7ff78ff8-bdd0-bb5e-1cea-cf1126226feb@redhat.com>
In-Reply-To: <7ff78ff8-bdd0-bb5e-1cea-cf1126226feb@redhat.com>
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

U29ycnksIHRoZSBsYXN0IHJlcGx5IGVtYWlsIHdhcyB0b28gZmFzdCwgd2l0aCBzb21lIENoaW5l
c2UgbWl4ZWQgaW4uIFNvIHNlbmQKYW5vdGhlciBlbWFpbC4KCk9uIFdlZCwgOSBNYXIgMjAyMiAx
NzoxNDozNCArMDgwMCwgSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4gd3JvdGU6Cj4K
PiDlnKggMjAyMi8zLzgg5LiL5Y2IODozNSwgWHVhbiBaaHVvIOWGmemBkzoKPiA+IFRoaXMgcGF0
Y2ggaW1wbGVtZW50cyB0aGUgcmVzZXQgZnVuY3Rpb24gb2YgdGhlIHJ4LCB0eCBxdWV1ZXMuCj4g
Pgo+ID4gQmFzZWQgb24gdGhpcyBmdW5jdGlvbiwgaXQgaXMgcG9zc2libGUgdG8gbW9kaWZ5IHRo
ZSByaW5nIG51bSBvZiB0aGUKPiA+IHF1ZXVlLiBBbmQgcXVpY2tseSByZWN5Y2xlIHRoZSBidWZm
ZXIgaW4gdGhlIHF1ZXVlLgo+ID4KPiA+IEluIHRoZSBwcm9jZXNzIG9mIHRoZSBxdWV1ZSBkaXNh
YmxlLCBpbiB0aGVvcnksIGFzIGxvbmcgYXMgdmlydGlvCj4gPiBzdXBwb3J0cyBxdWV1ZSByZXNl
dCwgdGhlcmUgd2lsbCBiZSBubyBleGNlcHRpb25zLgo+ID4KPiA+IEhvd2V2ZXIsIGluIHRoZSBw
cm9jZXNzIG9mIHRoZSBxdWV1ZSBlbmFibGUsIHRoZXJlIG1heSBiZSBleGNlcHRpb25zIGR1ZSB0
bwo+ID4gbWVtb3J5IGFsbG9jYXRpb24uICBJbiB0aGlzIGNhc2UsIHZxIGlzIG5vdCBhdmFpbGFi
bGUsIGJ1dCB3ZSBzdGlsbCBoYXZlCj4gPiB0byBleGVjdXRlIG5hcGlfZW5hYmxlKCkuIEJlY2F1
c2UgbmFwaV9kaXNhYmxlIGlzIHNpbWlsYXIgdG8gYSBsb2NrLAo+ID4gbmFwaV9lbmFibGUgbXVz
dCBiZSBjYWxsZWQgYWZ0ZXIgY2FsbGluZyBuYXBpX2Rpc2FibGUuCj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogWHVhbiBaaHVvIDx4dWFuemh1b0BsaW51eC5hbGliYWJhLmNvbT4KPiA+IC0tLQo+ID4g
ICBkcml2ZXJzL25ldC92aXJ0aW9fbmV0LmMgfCAxMDcgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMDcgaW5zZXJ0aW9ucygrKQo+
ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC92aXJ0aW9fbmV0LmMgYi9kcml2ZXJzL25l
dC92aXJ0aW9fbmV0LmMKPiA+IGluZGV4IDQwOWE4ZTE4MDkxOC4uZmZmZjMyM2RjZWYwIDEwMDY0
NAo+ID4gLS0tIGEvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jCj4gPiArKysgYi9kcml2ZXJzL25l
dC92aXJ0aW9fbmV0LmMKPiA+IEBAIC0yNTEsNiArMjUxLDExIEBAIHN0cnVjdCBwYWRkZWRfdm5l
dF9oZHIgewo+ID4gICAJY2hhciBwYWRkaW5nWzRdOwo+ID4gICB9Owo+ID4KPiA+ICtzdGF0aWMg
dm9pZCB2aXJ0bmV0X3NxX2ZyZWVfdW51c2VkX2J1ZnMoc3RydWN0IHZpcnRuZXRfaW5mbyAqdmks
Cj4gPiArCQkJCQlzdHJ1Y3Qgc2VuZF9xdWV1ZSAqc3EpOwo+ID4gK3N0YXRpYyB2b2lkIHZpcnRu
ZXRfcnFfZnJlZV91bnVzZWRfYnVmcyhzdHJ1Y3QgdmlydG5ldF9pbmZvICp2aSwKPiA+ICsJCQkJ
CXN0cnVjdCByZWNlaXZlX3F1ZXVlICpycSk7Cj4gPiArCj4gPiAgIHN0YXRpYyBib29sIGlzX3hk
cF9mcmFtZSh2b2lkICpwdHIpCj4gPiAgIHsKPiA+ICAgCXJldHVybiAodW5zaWduZWQgbG9uZylw
dHIgJiBWSVJUSU9fWERQX0ZMQUc7Cj4gPiBAQCAtMTM2OSw2ICsxMzc0LDkgQEAgc3RhdGljIHZv
aWQgdmlydG5ldF9uYXBpX2VuYWJsZShzdHJ1Y3QgdmlydHF1ZXVlICp2cSwgc3RydWN0IG5hcGlf
c3RydWN0ICpuYXBpKQo+ID4gICB7Cj4gPiAgIAluYXBpX2VuYWJsZShuYXBpKTsKPiA+Cj4gPiAr
CWlmICh2cS0+cmVzZXQpCj4gPiArCQlyZXR1cm47Cj4gPiArCj4KPgo+IExldCdzIFdBUk5fT05D
RSgpIGhlcmU/Cj4KPgo+ID4gICAJLyogSWYgYWxsIGJ1ZmZlcnMgd2VyZSBmaWxsZWQgYnkgb3Ro
ZXIgc2lkZSBiZWZvcmUgd2UgbmFwaV9lbmFibGVkLCB3ZQo+ID4gICAJICogd29uJ3QgZ2V0IGFu
b3RoZXIgaW50ZXJydXB0LCBzbyBwcm9jZXNzIGFueSBvdXRzdGFuZGluZyBwYWNrZXRzIG5vdy4K
PiA+ICAgCSAqIENhbGwgbG9jYWxfYmhfZW5hYmxlIGFmdGVyIHRvIHRyaWdnZXIgc29mdElSUSBw
cm9jZXNzaW5nLgo+ID4gQEAgLTE0MTMsNiArMTQyMSwxMCBAQCBzdGF0aWMgdm9pZCByZWZpbGxf
d29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCj4gPiAgIAkJc3RydWN0IHJlY2VpdmVfcXVl
dWUgKnJxID0gJnZpLT5ycVtpXTsKPiA+Cj4gPiAgIAkJbmFwaV9kaXNhYmxlKCZycS0+bmFwaSk7
Cj4gPiArCQlpZiAocnEtPnZxLT5yZXNldCkgewo+ID4gKwkJCXZpcnRuZXRfbmFwaV9lbmFibGUo
cnEtPnZxLCAmcnEtPm5hcGkpOwo+ID4gKwkJCWNvbnRpbnVlOwo+ID4gKwkJfQo+Cj4KPiBUaGlz
IHNlZW1zIHJhY3kgYW5kIGl0J3MgYSBoaW50IHRoYXQgd2UgbmVlZCBzeW5jIHdpdGggdGhlIHJl
ZmlsbCB3b3JrCj4gZHVyaW5nIHJlc2V0IGxpa2Ugd2hhdCB3ZSBkaWQgaW4gdmlydG5ldF9jbG9z
ZSgpOgo+Cj4gIMKgwqDCoMKgwqDCoMKgIC8qIE1ha2Ugc3VyZSByZWZpbGxfd29yayBkb2Vzbid0
IHJlLWVuYWJsZSBuYXBpISAqLwo+ICDCoMKgwqDCoMKgwqDCoCBjYW5jZWxfZGVsYXllZF93b3Jr
X3N5bmMoJnZpLT5yZWZpbGwpOwo+Cj4KPiA+ICAgCQlzdGlsbF9lbXB0eSA9ICF0cnlfZmlsbF9y
ZWN2KHZpLCBycSwgR0ZQX0tFUk5FTCk7Cj4gPiAgIAkJdmlydG5ldF9uYXBpX2VuYWJsZShycS0+
dnEsICZycS0+bmFwaSk7Cj4gPgo+ID4gQEAgLTE1MjMsNiArMTUzNSw5IEBAIHN0YXRpYyB2b2lk
IHZpcnRuZXRfcG9sbF9jbGVhbnR4KHN0cnVjdCByZWNlaXZlX3F1ZXVlICpycSkKPiA+ICAgCWlm
ICghc3EtPm5hcGkud2VpZ2h0IHx8IGlzX3hkcF9yYXdfYnVmZmVyX3F1ZXVlKHZpLCBpbmRleCkp
Cj4gPiAgIAkJcmV0dXJuOwo+ID4KPiA+ICsJaWYgKHNxLT52cS0+cmVzZXQpCj4gPiArCQlyZXR1
cm47Cj4KPgo+IEl0IGxvb2tzIHRvIG1lIHdlJ2QgYmV0dGVyIGVpdGhlciBXQVJOIG9yIGp1c3Qg
cmVtb3ZlIHRoaXMuIFNpbmNlIGl0Cj4gbG9va3MgbGlrZSBhIHdvcmthcm91bmQgZm9yIHRoZSB1
bi1zeW5jaHJvbml6ZWQgTkFQSSBzb21laG93LgoKRHVyaW5nIHRoZSByZXNldCBwcm9jZXNzLCBi
b3RoIHJpbmcgcmVzZXQgYW5kIGVuYWJsZSBtYXkgZmFpbC4gSW4gdGhlIGNhc2Ugb2YKZmFpbHVy
ZSwgdnEgd2lsbCBiZSB1bmF2YWlsYWJsZS4gQWxsIHRocmVlIGNhc2VzIHByZXZlbnQgdGhpcyBz
aXR1YXRpb24uCgpFdmVuIGlmIGl0IGZhaWxzLCBuYXBpIHN0aWxsIG5lZWRzIHRvIGJlIGVuYWJs
ZWQuIFRoaXMgaXMgdG8gcHJldmVudApuYXBpX2Rpc2FibGUgZnJvbSBiZWluZyBzdHVjayB3aGVu
IHRoZSBuZXR3b3JrIGNhcmQgaXMgY2xvc2VkLgoKClNvIHRoZSBmaXJzdCBhbmQgc2Vjb25kIGNh
c2VzIGFib3ZlIGFyZSB0aGF0IG5hcGkgaXMgZW5hYmxlZCwgYnV0IHZxIGhhcyBub3QKYmVlbiBy
ZXNldCBzdWNjZXNzZnVsbHkgb3IgaXMgc3RpbGwgaW4gcmVzZXQuCgpBbmQgdGhlIHRoaXJkIGNh
c2UgaXMgdG8gZGVhbCB3aXRoIHR4IGluIHJlc2V0LCBhbmQgcnggaXMgaW4gd29ya2luZyBzdGF0
ZSwgdGhlbgpoZXJlIHdpbGwgYWNjZXNzIHRoZSB2cSBvZiBzcS4KCj4KPgo+ID4gKwo+ID4gICAJ
aWYgKF9fbmV0aWZfdHhfdHJ5bG9jayh0eHEpKSB7Cj4gPiAgIAkJZG8gewo+ID4gICAJCQl2aXJ0
cXVldWVfZGlzYWJsZV9jYihzcS0+dnEpOwo+ID4gQEAgLTE3NjksNiArMTc4NCw5OCBAQCBzdGF0
aWMgbmV0ZGV2X3R4X3Qgc3RhcnRfeG1pdChzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCBzdHJ1Y3QgbmV0
X2RldmljZSAqZGV2KQo+ID4gICAJcmV0dXJuIE5FVERFVl9UWF9PSzsKPiA+ICAgfQo+ID4KPiA+
ICtzdGF0aWMgaW50IHZpcnRuZXRfcnhfdnFfcmVzZXQoc3RydWN0IHZpcnRuZXRfaW5mbyAqdmks
Cj4gPiArCQkJICAgICAgIHN0cnVjdCByZWNlaXZlX3F1ZXVlICpycSwgdTMyIHJpbmdfbnVtKQo+
Cj4KPiBJdCdzIGJldHRlciB0byByZW5hbWUgdGhpcyBhcyB2aXJ0bmV0X3J4X3Jlc2l6ZSgpLgoK
SSBkb24ndCB0aGluayByZXNpemUgaXMgZ29vZCBlbm91Z2gsIGJlY2F1c2UgSSB0aGluayByZXNp
emUgaXMgYW4gZWZmZWN0IG9mCnJlc2V0LiBJbnNpZGUgYWZfeGRwLCB3ZSB3aWxsIGNhbGwgaXQg
anVzdCB0byByZXNldCB0byBmcmVlIHRoZSBidWZmZXIgd2l0aG91dApyZXNpemUgd2l0aCByaW5n
X251bSA9PSAwLgoKU28gdmlydG5ldF9yeF9yZXNldCgpIG1pZ2h0IGJlIGJldHRlci4KCgo+Cj4K
PiA+ICt7Cj4gPiArCWludCBlcnI7Cj4gPiArCj4gPiArCS8qIHN0b3AgbmFwaSAqLwo+ID4gKwlu
YXBpX2Rpc2FibGUoJnJxLT5uYXBpKTsKPiA+ICsKPgo+Cj4gSGVyZSwgYXMgZGlzY3Vzc2VkIGFi
b3ZlLCB3ZSBuZWVkIHN5bmNocm9uaXplIHdpdGggdGhlIHJlZmlsbCB3b3JrLgo+Cj4KPiA+ICsJ
LyogcmVzZXQgdGhlIHF1ZXVlICovCj4gPiArCWVyciA9IHZpcnRpb19yZXNldF92cShycS0+dnEp
Owo+ID4gKwlpZiAoZXJyKQo+ID4gKwkJZ290byBlcnI7Cj4KPgo+IEJ0dywgbW9zdCBjb21tZW50
IG9mIHRoaXMgZnVuY3Rpb24gc2VlbXMgdXNlbGVzcyBzaW5jZSBjb2RlIGFscmVhZHkKPiBleHBs
YWluIHRoZW1zZWx2ZXMuCj4KCk9LLCBJIHdpbGwgcmVtb3ZlIHRoZXNlLgoKPgo+ID4gKwo+ID4g
KwkvKiBmcmVlIGJ1ZnMgKi8KPiA+ICsJdmlydG5ldF9ycV9mcmVlX3VudXNlZF9idWZzKHZpLCBy
cSk7Cj4gPiArCj4gPiArCS8qIHJlc2V0IHZyaW5nLiAqLwo+ID4gKwllcnIgPSB2aXJ0cXVldWVf
cmVzZXRfdnJpbmcocnEtPnZxLCByaW5nX251bSk7Cj4gPiArCWlmIChlcnIpCj4gPiArCQlnb3Rv
IGVycjsKPiA+ICsKPiA+ICsJLyogZW5hYmxlIHJlc2V0IHF1ZXVlICovCj4gPiArCWVyciA9IHZp
cnRpb19lbmFibGVfcmVzZXRxKHJxLT52cSk7Cj4gPiArCWlmIChlcnIpCj4gPiArCQlnb3RvIGVy
cjsKPiA+ICsKPiA+ICsJLyogZmlsbCByZWN2ICovCj4gPiArCWlmICghdHJ5X2ZpbGxfcmVjdih2
aSwgcnEsIEdGUF9LRVJORUwpKQo+ID4gKwkJc2NoZWR1bGVfZGVsYXllZF93b3JrKCZ2aS0+cmVm
aWxsLCAwKTsKPiA+ICsKPiA+ICsJLyogZW5hYmxlIG5hcGkgKi8KPiA+ICsJdmlydG5ldF9uYXBp
X2VuYWJsZShycS0+dnEsICZycS0+bmFwaSk7Cj4gPiArCXJldHVybiAwOwo+ID4gKwo+ID4gK2Vy
cjoKPiA+ICsJbmV0ZGV2X2Vycih2aS0+ZGV2LAo+ID4gKwkJICAgInJlc2V0IHJ4IHJlc2V0IHZx
IGZhaWw6IHJ4IHF1ZXVlIGluZGV4OiAlbGQgZXJyOiAlZFxuIiwKPiA+ICsJCSAgIHJxIC0gdmkt
PnJxLCBlcnIpOwo+ID4gKwl2aXJ0bmV0X25hcGlfZW5hYmxlKHJxLT52cSwgJnJxLT5uYXBpKTsK
PiA+ICsJcmV0dXJuIGVycjsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIGludCB2aXJ0bmV0X3R4
X3ZxX3Jlc2V0KHN0cnVjdCB2aXJ0bmV0X2luZm8gKnZpLAo+ID4gKwkJCSAgICAgICBzdHJ1Y3Qg
c2VuZF9xdWV1ZSAqc3EsIHUzMiByaW5nX251bSkKPiA+ICt7Cj4KPgo+IEl0IGxvb2tzIHRvIG1l
IGl0J3MgYmV0dGVyIHRvIHJlbmFtZSB0aGlzIGFzICJ2aXJ0bmV0X3J4X3Jlc2l6ZSgpIgo+Cj4K
PiA+ICsJc3RydWN0IG5ldGRldl9xdWV1ZSAqdHhxOwo+ID4gKwlpbnQgZXJyLCBxaW5kZXg7Cj4g
PiArCj4gPiArCXFpbmRleCA9IHNxIC0gdmktPnNxOwo+ID4gKwo+ID4gKwl0eHEgPSBuZXRkZXZf
Z2V0X3R4X3F1ZXVlKHZpLT5kZXYsIHFpbmRleCk7Cj4gPiArCV9fbmV0aWZfdHhfbG9ja19iaCh0
eHEpOwo+ID4gKwo+ID4gKwkvKiBzdG9wIHR4IHF1ZXVlIGFuZCBuYXBpICovCj4gPiArCW5ldGlm
X3N0b3Bfc3VicXVldWUodmktPmRldiwgcWluZGV4KTsKPiA+ICsJdmlydG5ldF9uYXBpX3R4X2Rp
c2FibGUoJnNxLT5uYXBpKTsKPgo+Cj4gVGhlcmUncyBubyBuZWVkIHRvIGhvbGQgdHggbG9jayBm
b3IgbmFwaSBkaXNhYmxlLgoKVGhlIG1haW4gcHVycG9zZSBvZiB0eCBsb2NrIGlzIHRvIHdhaXQg
Zm9yIG90aGVyIHhtaXQgY2FsbHMgdG8gZW5kLiBBbmQgc2V0Cm5ldGlmX3N0b3Bfc3VicXVldWUo
KQoKVGhhbmtzLgoKPgo+IFRoYW5rcwo+Cj4KPiA+ICsKPiA+ICsJX19uZXRpZl90eF91bmxvY2tf
YmgodHhxKTsKPiA+ICsKPiA+ICsJLyogcmVzZXQgdGhlIHF1ZXVlICovCj4gPiArCWVyciA9IHZp
cnRpb19yZXNldF92cShzcS0+dnEpOwo+ID4gKwlpZiAoZXJyKSB7Cj4gPiArCQluZXRpZl9zdGFy
dF9zdWJxdWV1ZSh2aS0+ZGV2LCBxaW5kZXgpOwo+ID4gKwkJZ290byBlcnI7Cj4gPiArCX0KPiA+
ICsKPiA+ICsJLyogZnJlZSBidWZzICovCj4gPiArCXZpcnRuZXRfc3FfZnJlZV91bnVzZWRfYnVm
cyh2aSwgc3EpOwo+ID4gKwo+ID4gKwkvKiByZXNldCB2cmluZy4gKi8KPiA+ICsJZXJyID0gdmly
dHF1ZXVlX3Jlc2V0X3ZyaW5nKHNxLT52cSwgcmluZ19udW0pOwo+ID4gKwlpZiAoZXJyKQo+ID4g
KwkJZ290byBlcnI7Cj4gPiArCj4gPiArCS8qIGVuYWJsZSByZXNldCBxdWV1ZSAqLwo+ID4gKwll
cnIgPSB2aXJ0aW9fZW5hYmxlX3Jlc2V0cShzcS0+dnEpOwo+ID4gKwlpZiAoZXJyKQo+ID4gKwkJ
Z290byBlcnI7Cj4gPiArCj4gPiArCS8qIHN0YXJ0IHR4IHF1ZXVlIGFuZCBuYXBpICovCj4gPiAr
CW5ldGlmX3N0YXJ0X3N1YnF1ZXVlKHZpLT5kZXYsIHFpbmRleCk7Cj4gPiArCXZpcnRuZXRfbmFw
aV90eF9lbmFibGUodmksIHNxLT52cSwgJnNxLT5uYXBpKTsKPiA+ICsJcmV0dXJuIDA7Cj4gPiAr
Cj4gPiArZXJyOgo+ID4gKwluZXRkZXZfZXJyKHZpLT5kZXYsCj4gPiArCQkgICAicmVzZXQgdHgg
cmVzZXQgdnEgZmFpbDogdHggcXVldWUgaW5kZXg6ICVsZCBlcnI6ICVkXG4iLAo+ID4gKwkJICAg
c3EgLSB2aS0+c3EsIGVycik7Cj4gPiArCXZpcnRuZXRfbmFwaV90eF9lbmFibGUodmksIHNxLT52
cSwgJnNxLT5uYXBpKTsKPiA+ICsJcmV0dXJuIGVycjsKPiA+ICt9Cj4gPiArCj4gPiAgIC8qCj4g
PiAgICAqIFNlbmQgY29tbWFuZCB2aWEgdGhlIGNvbnRyb2wgdmlydHF1ZXVlIGFuZCBjaGVjayBz
dGF0dXMuICBDb21tYW5kcwo+ID4gICAgKiBzdXBwb3J0ZWQgYnkgdGhlIGh5cGVydmlzb3IsIGFz
IGluZGljYXRlZCBieSBmZWF0dXJlIGJpdHMsIHNob3VsZAo+Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApW
aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxp
bnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
