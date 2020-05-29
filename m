Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id F268C1E7954
	for <lists.virtualization@lfdr.de>; Fri, 29 May 2020 11:24:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5989D87465;
	Fri, 29 May 2020 09:24:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T88JFnFO3GdJ; Fri, 29 May 2020 09:24:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BFCCF87469;
	Fri, 29 May 2020 09:24:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A48B3C016F;
	Fri, 29 May 2020 09:24:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 14036C016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 09:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 030E1893B4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 09:24:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fX8iW06UB5JX
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 09:24:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1E203893A2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 09:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590744291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u+ErMh3RNlykDs0Q6FLYjEbsHK/xbH1yzRUXA3RW6tU=;
 b=GnshLUN40DCoxjGlbXN3jSSLKYP7qC1l7nxMbtgNpibHlpjS8KOJXyzGhiOO3R/qmcRM0K
 9cgJ6YPlkNC4KX9e+QxkGXPlmjiHgVxMrmdJds71/9kEPzs4ZHdjA6f+IdtmtmfAQN8QRJ
 auCxRZ8UWI7D+TJ8UEQDRmf2mUJDi5o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-76Yy88yIMa6jris-p_igFA-1; Fri, 29 May 2020 05:24:47 -0400
X-MC-Unique: 76Yy88yIMa6jris-p_igFA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B04B835B43;
 Fri, 29 May 2020 09:24:45 +0000 (UTC)
Received: from [10.72.13.231] (ovpn-13-231.pek2.redhat.com [10.72.13.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65D965C1C8;
 Fri, 29 May 2020 09:24:35 +0000 (UTC)
Subject: Re: [PATCH 4/6] vhost_vdpa: support doorbell mapping via mmap
To: =?UTF-8?Q?Mika_Penttil=c3=a4?= <mika.penttila@nextfour.com>, mst@redhat.com
References: <20200529080303.15449-1-jasowang@redhat.com>
 <20200529080303.15449-5-jasowang@redhat.com>
 <bab90a3f-f0b3-37d3-89bc-cd17d33f3208@nextfour.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ccc10e39-032e-191d-206e-0f64430ec3e4@redhat.com>
Date: Fri, 29 May 2020 17:24:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <bab90a3f-f0b3-37d3-89bc-cd17d33f3208@nextfour.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: shahafs@mellanox.com, lulu@redhat.com, kvm@vger.kernel.org,
 saugatm@xilinx.com, netdev@vger.kernel.org, mhabets@solarflare.com,
 vmireyno@marvell.com, linux-kernel@vger.kernel.org, gdawar@xilinx.com,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 hanand@xilinx.com, zhangweining@ruijie.com.cn, eli@mellanox.com,
 lingshan.zhu@intel.com, rob.miller@broadcom.com
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

Ck9uIDIwMjAvNS8yOSDkuIvljYg1OjE2LCBNaWthIFBlbnR0aWzDpCB3cm90ZToKPiBIaSwKPgo+
IE9uIDI5LjUuMjAyMCAxMS4wMywgSmFzb24gV2FuZyB3cm90ZToKPj4gQ3VycmVudGx5IHRoZSBk
b29yYmVsbCBpcyByZWxheWVkIHZpYSBldmVudGZkIHdoaWNoIG1heSBoYXZlCj4+IHNpZ25pZmlj
YW50IG92ZXJoZWFkIGJlY2F1c2Ugb2YgdGhlIGNvc3Qgb2Ygdm1leGl0cyBvciBzeXNjYWxsLiBU
aGlzCj4+IHBhdGNoIGludHJvZHVjZXMgbW1hcCgpIGJhc2VkIGRvb3JiZWxsIG1hcHBpbmcgd2hp
Y2ggY2FuIGVsaW1pbmF0ZSB0aGUKPj4gb3ZlcmhlYWQgY2F1c2VkIGJ5IHZtZXhpdCBvciBzeXNj
YWxsLgo+Cj4gSnVzdCB3b25kZXJpbmcuIEkga25vdyB2ZXJ5IGxpdHRsZSBhYm91dCB2ZHBhLiBC
dXQgaG93IGlzIHN1Y2ggYSAic3cgCj4gZG9vcmJlbGwiIG1vbml0b3JlZCBvciBvYnNlcnZlZCwg
aWYgbm8gZmF1bHQgb3Igd21leGl0IGV0Yy4KPiBJcyB0aGVyZSBzb21lIGtpbmQgb2YgcG9sbGlu
ZyB1c2VkPwoKCkhpIE1pa2E6CgpJdCdzIG5vdCBhIHNvZnR3YXJlIGRvb3JiZWxsLiBJdCBqdXN0
IGFsbG93IHVzZXJzcGFjZSB0byBtYXAgcGFnZSBvZiAKaGFyZHdhcmUgZG9vcmJlbGwgZGlyZWN0
bHkgaW50byB1c2Vyc3BhY2UuCgpXaXRob3V0IHRoaXMsIGZvciBLVk0sIGl0IG5lZWRzIHRvIHRy
YXAgdGhlIE1NSU8gYWNjZXNzIG9mIHRoZSBndWVzdCBhbmQgCndyaXRlIHRvIGV2ZW50ZmQsIGZv
ciBvdGhlciB1c2Vyc3BhY2UgZHJpdmVyLCBpdCBuZWVkcyB0byB3cml0ZSB0byAKZXZlbnRmZC4g
dmhvc3QtdkRQQSdzIGV2ZW50ZmQgd2FrZXVwIGZ1bmN0aW9uIG1heSBsZXQgdGhlIGRyaXZlciB0
byBkbyAKdG91Y2ggdGhlIGRvb3JiZWxsLgoKV2l0aCB0aGlzLCBzaW5jZSB0aGUgZG9vcmJlbGwg
cGFnZSBpcyBtYXBwZWQgaW50byB1c2Vyc3BhY2UgYWRkcmVzcyAKc3BhY2UsIGd1ZXN0IG9yIG90
aGVyIHVzZXJzcGFjZSBkcml2ZXIgbWF5IHdyaXRlIGRpcmVjdGx5IHRvIHRoZSAKaGFyZHdhcmUg
ZG9vcmJlbGwgcmVnaXN0ZXIuCgpUaGFua3MKCgo+Cj4+IFRvIGVhc2UgdGhlIHVzZXJzcGFjZSBt
b2RlbGluZyBvZiB0aGUgZG9vcmJlbGwgbGF5b3V0ICh1c3VhbGx5Cj4+IHZpcnRpby1wY2kpLCB0
aGlzIHBhdGNoIHN0YXJ0cyBmcm9tIGEgZG9vcmJlbGwgcGVyIHBhZ2UKPj4gbW9kZWwuIFZob3N0
LXZkcGEgb25seSBzdXBwb3J0IHRoZSBoYXJkd2FyZSBkb29yYmVsbCB0aGF0IHNpdCBhdCB0aGUK
Pj4gYm91bmRhcnkgb2YgYSBwYWdlIGFuZCBkb2VzIG5vdCBzaGFyZSB0aGUgcGFnZSB3aXRoIG90
aGVyIHJlZ2lzdGVycy4KPj4KPj4gRG9vcmJlbGwgb2YgZWFjaCB2aXJ0cXVldWUgbXVzdCBiZSBt
YXBwZWQgc2VwYXJhdGVseSwgcGdvZmYgaXMgdGhlCj4+IGluZGV4IG9mIHRoZSB2aXJ0cXVldWUu
IFRoaXMgYWxsb3dzIHVzZXJzcGFjZSB0byBtYXAgYSBzdWJzZXQgb2YgdGhlCj4+IGRvb3JiZWxs
IHdoaWNoIG1heSBiZSB1c2VmdWwgZm9yIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBzb2Z0d2FyZQo+
PiBhc3Npc3RlZCB2aXJ0cXVldWUgKGNvbnRyb2wgdnEpIGluIHRoZSBmdXR1cmUuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Cj4+IC0tLQo+PiDC
oCBkcml2ZXJzL3Zob3N0L3ZkcGEuYyB8IDU5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA1OSBpbnNlcnRpb25zKCspCj4+
Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L3ZkcGEuYyBiL2RyaXZlcnMvdmhvc3QvdmRw
YS5jCj4+IGluZGV4IDZmZjcyMjg5ZjQ4OC4uYmJlMjNjZWExMzlhIDEwMDY0NAo+PiAtLS0gYS9k
cml2ZXJzL3Zob3N0L3ZkcGEuYwo+PiArKysgYi9kcml2ZXJzL3Zob3N0L3ZkcGEuYwo+PiBAQCAt
MTUsNiArMTUsNyBAQAo+PiDCoCAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4+IMKgICNpbmNs
dWRlIDxsaW51eC9jZGV2Lmg+Cj4+IMKgICNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4KPj4gKyNp
bmNsdWRlIDxsaW51eC9tbS5oPgo+PiDCoCAjaW5jbHVkZSA8bGludXgvaW9tbXUuaD4KPj4gwqAg
I2luY2x1ZGUgPGxpbnV4L3V1aWQuaD4KPj4gwqAgI2luY2x1ZGUgPGxpbnV4L3ZkcGEuaD4KPj4g
QEAgLTc0MSwxMiArNzQyLDcwIEBAIHN0YXRpYyBpbnQgdmhvc3RfdmRwYV9yZWxlYXNlKHN0cnVj
dCBpbm9kZSAKPj4gKmlub2RlLCBzdHJ1Y3QgZmlsZSAqZmlsZXApCj4+IMKgwqDCoMKgwqAgcmV0
dXJuIDA7Cj4+IMKgIH0KPj4gwqAgK3N0YXRpYyB2bV9mYXVsdF90IHZob3N0X3ZkcGFfZmF1bHQo
c3RydWN0IHZtX2ZhdWx0ICp2bWYpCj4+ICt7Cj4+ICvCoMKgwqAgc3RydWN0IHZob3N0X3ZkcGEg
KnYgPSB2bWYtPnZtYS0+dm1fZmlsZS0+cHJpdmF0ZV9kYXRhOwo+PiArwqDCoMKgIHN0cnVjdCB2
ZHBhX2RldmljZSAqdmRwYSA9IHYtPnZkcGE7Cj4+ICvCoMKgwqAgY29uc3Qgc3RydWN0IHZkcGFf
Y29uZmlnX29wcyAqb3BzID0gdmRwYS0+Y29uZmlnOwo+PiArwqDCoMKgIHN0cnVjdCB2ZHBhX25v
dGlmaWNhdGlvbl9hcmVhIG5vdGlmeTsKPj4gK8KgwqDCoCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Qg
KnZtYSA9IHZtZi0+dm1hOwo+PiArwqDCoMKgIHUxNiBpbmRleCA9IHZtYS0+dm1fcGdvZmY7Cj4+
ICsKPj4gK8KgwqDCoCBub3RpZnkgPSBvcHMtPmdldF92cV9ub3RpZmljYXRpb24odmRwYSwgaW5k
ZXgpOwo+PiArCj4+ICvCoMKgwqAgdm1hLT52bV9wYWdlX3Byb3QgPSBwZ3Byb3Rfbm9uY2FjaGVk
KHZtYS0+dm1fcGFnZV9wcm90KTsKPj4gK8KgwqDCoCBpZiAocmVtYXBfcGZuX3JhbmdlKHZtYSwg
dm1mLT5hZGRyZXNzICYgUEFHRV9NQVNLLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIG5vdGlmeS5hZGRyID4+IFBBR0VfU0hJRlQsIFBBR0VfU0laRSwKPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB2bWEtPnZtX3BhZ2VfcHJvdCkpCj4+ICvCoMKgwqDCoMKgwqDC
oCByZXR1cm4gVk1fRkFVTFRfU0lHQlVTOwo+PiArCj4+ICvCoMKgwqAgcmV0dXJuIFZNX0ZBVUxU
X05PUEFHRTsKPj4gK30KPj4gKwo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCB2bV9vcGVyYXRpb25z
X3N0cnVjdCB2aG9zdF92ZHBhX3ZtX29wcyA9IHsKPj4gK8KgwqDCoCAuZmF1bHQgPSB2aG9zdF92
ZHBhX2ZhdWx0LAo+PiArfTsKPj4gKwo+PiArc3RhdGljIGludCB2aG9zdF92ZHBhX21tYXAoc3Ry
dWN0IGZpbGUgKmZpbGUsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAKPj4gKnZtYSkKPj4gK3sKPj4g
K8KgwqDCoCBzdHJ1Y3Qgdmhvc3RfdmRwYSAqdiA9IHZtYS0+dm1fZmlsZS0+cHJpdmF0ZV9kYXRh
Owo+PiArwqDCoMKgIHN0cnVjdCB2ZHBhX2RldmljZSAqdmRwYSA9IHYtPnZkcGE7Cj4+ICvCoMKg
wqAgY29uc3Qgc3RydWN0IHZkcGFfY29uZmlnX29wcyAqb3BzID0gdmRwYS0+Y29uZmlnOwo+PiAr
wqDCoMKgIHN0cnVjdCB2ZHBhX25vdGlmaWNhdGlvbl9hcmVhIG5vdGlmeTsKPj4gK8KgwqDCoCBp
bnQgaW5kZXggPSB2bWEtPnZtX3Bnb2ZmOwo+PiArCj4+ICvCoMKgwqAgaWYgKHZtYS0+dm1fZW5k
IC0gdm1hLT52bV9zdGFydCAhPSBQQUdFX1NJWkUpCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4g
LUVJTlZBTDsKPj4gK8KgwqDCoCBpZiAoKHZtYS0+dm1fZmxhZ3MgJiBWTV9TSEFSRUQpID09IDAp
Cj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4gK8KgwqDCoCBpZiAodm1hLT52
bV9mbGFncyAmIFZNX1JFQUQpCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4g
K8KgwqDCoCBpZiAoaW5kZXggPiA2NTUzNSkKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlO
VkFMOwo+PiArwqDCoMKgIGlmICghb3BzLT5nZXRfdnFfbm90aWZpY2F0aW9uKQo+PiArwqDCoMKg
wqDCoMKgwqAgcmV0dXJuIC1FTk9UU1VQUDsKPj4gKwo+PiArwqDCoMKgIC8qIFRvIGJlIHNhZmUg
YW5kIGVhc2lseSBtb2RlbGxlZCBieSB1c2Vyc3BhY2UsIFdlIG9ubHkKPj4gK8KgwqDCoMKgICog
c3VwcG9ydCB0aGUgZG9vcmJlbGwgd2hpY2ggc2l0cyBvbiB0aGUgcGFnZSBib3VuZGFyeSBhbmQK
Pj4gK8KgwqDCoMKgICogZG9lcyBub3Qgc2hhcmUgdGhlIHBhZ2Ugd2l0aCBvdGhlciByZWdpc3Rl
cnMuCj4+ICvCoMKgwqDCoCAqLwo+PiArwqDCoMKgIG5vdGlmeSA9IG9wcy0+Z2V0X3ZxX25vdGlm
aWNhdGlvbih2ZHBhLCBpbmRleCk7Cj4+ICvCoMKgwqAgaWYgKG5vdGlmeS5hZGRyICYgKFBBR0Vf
U0laRSAtIDEpKQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4+ICvCoMKgwqAg
aWYgKHZtYS0+dm1fZW5kIC0gdm1hLT52bV9zdGFydCAhPSBub3RpZnkuc2l6ZSkKPj4gK8KgwqDC
oMKgwqDCoMKgIHJldHVybiAtRU5PVFNVUFA7Cj4+ICsKPj4gK8KgwqDCoCB2bWEtPnZtX29wcyA9
ICZ2aG9zdF92ZHBhX3ZtX29wczsKPj4gK8KgwqDCoCByZXR1cm4gMDsKPj4gK30KPj4gKwo+PiDC
oCBzdGF0aWMgY29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyB2aG9zdF92ZHBhX2ZvcHMgPSB7
Cj4+IMKgwqDCoMKgwqAgLm93bmVywqDCoMKgwqDCoMKgwqAgPSBUSElTX01PRFVMRSwKPj4gwqDC
oMKgwqDCoCAub3BlbsKgwqDCoMKgwqDCoMKgID0gdmhvc3RfdmRwYV9vcGVuLAo+PiDCoMKgwqDC
oMKgIC5yZWxlYXNlwqDCoMKgID0gdmhvc3RfdmRwYV9yZWxlYXNlLAo+PiDCoMKgwqDCoMKgIC53
cml0ZV9pdGVywqDCoMKgID0gdmhvc3RfdmRwYV9jaHJfd3JpdGVfaXRlciwKPj4gwqDCoMKgwqDC
oCAudW5sb2NrZWRfaW9jdGzCoMKgwqAgPSB2aG9zdF92ZHBhX3VubG9ja2VkX2lvY3RsLAo+PiAr
wqDCoMKgIC5tbWFwwqDCoMKgwqDCoMKgwqAgPSB2aG9zdF92ZHBhX21tYXAsCj4+IMKgwqDCoMKg
wqAgLmNvbXBhdF9pb2N0bMKgwqDCoCA9IGNvbXBhdF9wdHJfaW9jdGwsCj4+IMKgIH07Cj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0
aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0
dWFsaXphdGlvbg==
