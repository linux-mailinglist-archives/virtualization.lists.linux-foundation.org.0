Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B75166DEF
	for <lists.virtualization@lfdr.de>; Fri, 21 Feb 2020 04:42:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5A85A2154F;
	Fri, 21 Feb 2020 03:42:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Chamo97MEAr0; Fri, 21 Feb 2020 03:42:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D95F32155B;
	Fri, 21 Feb 2020 03:42:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BABE5C013E;
	Fri, 21 Feb 2020 03:42:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2548DC013E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 03:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 13D0787C9C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 03:42:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7CCGW8zefdoe
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 03:42:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 227158749A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 03:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582256535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a9R0CosE6GfsLGrjcvEZLtqtG2P/xZ2EzhZiapF0r40=;
 b=NnDOGv1LEM4FSXHrp/MzpuMq3pUC8D84cHeMdWO46mFJkCqDGrCNF8P8shSREeXtwyiE3U
 M7IcB3WKR8RQzLb0C4tLi9CFKjBR6d/6EgMGEnQWgTx6C4luKpsrSLB5e8KgNp+07iRTCJ
 05F8WRFTXlLJBQF1uKJ8bhKRlLj8Tjo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-StAG8-9rMQ-MWoQGwwCsyQ-1; Thu, 20 Feb 2020 22:42:11 -0500
X-MC-Unique: StAG8-9rMQ-MWoQGwwCsyQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E8ECDBA3;
 Fri, 21 Feb 2020 03:42:08 +0000 (UTC)
Received: from [10.72.13.208] (ovpn-13-208.pek2.redhat.com [10.72.13.208])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71D391001281;
 Fri, 21 Feb 2020 03:41:59 +0000 (UTC)
Subject: Re: [PATCH 2/2] virtio: let virtio use DMA API when guest RAM is
 protected
To: David Gibson <david@gibson.dropbear.id.au>, Christoph Hellwig <hch@lst.de>
References: <20200220160606.53156-1-pasic@linux.ibm.com>
 <20200220160606.53156-3-pasic@linux.ibm.com> <20200220161309.GB12709@lst.de>
 <20200221025915.GB2298@umbus.fritz.box>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <8194d502-07d8-b798-a2b5-606a8c05b895@redhat.com>
Date: Fri, 21 Feb 2020 11:41:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200221025915.GB2298@umbus.fritz.box>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 iommu@lists.linux-foundation.org, Michael Mueller <mimu@linux.ibm.com>,
 "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
 Viktor Mihajlovski <mihajlov@linux.ibm.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
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

Ck9uIDIwMjAvMi8yMSDkuIrljYgxMDo1OSwgRGF2aWQgR2lic29uIHdyb3RlOgo+IE9uIFRodSwg
RmViIDIwLCAyMDIwIGF0IDA1OjEzOjA5UE0gKzAxMDAsIENocmlzdG9waCBIZWxsd2lnIHdyb3Rl
Ogo+PiBPbiBUaHUsIEZlYiAyMCwgMjAyMCBhdCAwNTowNjowNlBNICswMTAwLCBIYWxpbCBQYXNp
YyB3cm90ZToKPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jIGIv
ZHJpdmVycy92aXJ0aW8vdmlydGlvX3JpbmcuYwo+Pj4gaW5kZXggODY3YzdlYmQzZjEwLi5mYWZj
OGY5MjQ5NTUgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jCj4+
PiArKysgYi9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jCj4+PiBAQCAtMjQzLDYgKzI0Myw5
IEBAIHN0YXRpYyBib29sIHZyaW5nX3VzZV9kbWFfYXBpKHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2
ZGV2KQo+Pj4gICAJaWYgKCF2aXJ0aW9faGFzX2lvbW11X3F1aXJrKHZkZXYpKQo+Pj4gICAJCXJl
dHVybiB0cnVlOwo+Pj4gICAKPj4+ICsJaWYgKGZvcmNlX2RtYV91bmVuY3J5cHRlZCgmdmRldi0+
ZGV2KSkKPj4+ICsJCXJldHVybiB0cnVlOwo+PiBIZWxsIG5vLiAgVGhpcyBpcyBhIGRldGFpbCBv
ZiB0aGUgcGxhdGZvcm0gRE1BIGRpcmVjdCBpbXBsZW1lbnRhdGlvbi4KPj4gRHJpdmVycyBoYXZl
IG5vIGJ1c2luZXNzIGxvb2tpbmcgYXQgdGhpcyBmbGFnLCBhbmQgdmlydGlvIGZpbmFsbHkgbmVl
ZHMKPj4gdG8gYmUgZml4ZWQgdG8gdXNlIHRoZSBETUEgQVBJIHByb3Blcmx5IGZvciBldmVyeXRo
aW5nIGJ1dCBsZWdhY3kgZGV2aWNlcy4KPiBTbywgdGhpcyBwYXRjaCBkZWZpbml0ZWx5IGlzbid0
IHJpZ2h0IGFzIGl0IHN0YW5kcywgYnV0IEknbSBzdHJ1Z2dsaW5nCj4gdG8gdW5kZXJzdGFuZCB3
aGF0IGl0IGlzIHlvdSdyZSBzYXlpbmcgaXMgdGhlIHJpZ2h0IHdheS4KPgo+IEJ5ICJsZWdhY3kg
ZGV2aWNlcyIgSSBhc3N1bWUgeW91IG1lYW4gcHJlLXZpcnRpby0xLjAgZGV2aWNlcywgdGhhdAo+
IGxhY2sgdGhlIEZfVkVSU0lPTl8xIGZlYXR1cmUgZmxhZy4gIElzIHRoYXQgcmlnaHQ/ICBCZWNh
dXNlIEkgZG9uJ3QKPiBzZWUgaG93IGJlaW5nIGEgbGVnYWN5IGRldmljZSBvciBub3QgcmVsYXRl
cyB0byB1c2Ugb2YgdGhlIERNQSBBUEkuCj4KPiBJICp0aGluayogd2hhdCB5b3UgYXJlIHN1Z2dl
c3RpbmcgaGVyZSBpcyB0aGF0IHZpcnRpbyBkZXZpY2VzIHRoYXQKPiBoYXZlICFGX0lPTU1VX1BM
QVRGT1JNIHNob3VsZCBoYXZlIHRoZWlyIGRtYV9vcHMgc2V0IHVwIHNvIHRoYXQgdGhlCj4gRE1B
IEFQSSB0cmVhdHMgSU9WQT09UEEsIHdoaWNoIHdpbGwgc2F0aXNmeSB3aGF0IHRoZSBkZXZpY2Ug
ZXhwZWN0cy4KCgpDYW4gdGhpcyB3b3JrIGZvciBzd2lvdGxiPwoKVGhhbmtzCgoKPiBUaGVuIHRo
ZSB2aXJ0aW8gZHJpdmVyIGNhbiB1c2UgdGhlIERNQSBBUEkgdGhlIHNhbWUgd2F5IGZvciBib3Ro
Cj4gRl9JT01NVV9QTEFURk9STSBhbmQgIUZfSU9NTVVfUExBVEZPUk0gZGV2aWNlcy4KPgo+IEJ1
dCBpZiB0aGF0IHdvcmtzIGZvciAhRl9JT01NVV9QTEFURk9STV9ERVZJQ0VTK0ZfVkVSU0lPTl8x
IGRldmljZXMsCj4gdGhlbiBBRkFJQ1QgaXQgd2lsbCB3b3JrIGVxdWFsbHkgd2VsbCBmb3IgbGVn
YWN5IGRldmljZXMuCj4KPiBVc2luZyB0aGUgRE1BIEFQSSBmb3IgKmV2ZXJ5dGhpbmcqIGluIHZp
cnRpbywgbGVnYWN5IG9yIG5vdCwgc2VlbXMKPiBsaWtlIGEgcmVhc29uYWJsZSBhcHByb2FjaCB0
byBtZS4gIEJ1dCwgQUZBSUNULCB0aGF0IGRvZXMgcmVxdWlyZSB0aGUKPiBETUEgbGF5ZXIgdG8g
aGF2ZSBzb21lIGtpbmQgb2YgZXhwbGljaXQgY2FsbCB0byB0dXJuIG9uIHRoaXMKPiBiZWhhdmlv
dXIsIHdoaWNoIHRoZSB2aXJ0aW8gZHJpdmVyIHdvdWxkIGNhbGwgZHVyaW5nIGluaXRpYWxpenNh
dGlvbi4KPiBJIGRvbid0IHRoaW5rIHdlIGNhbiBkbyBpdCAxMDAlIHdpdGhpbiB0aGUgRE1BIGxh
eWVyLCBiZWNhdXNlIG9ubHkgdGhlCj4gZHJpdmVyIGNhbiByZWFzb25hYmx5IGtub3cgd2hlbiBh
IGRldmljZSBoYXMgdGhpcyB3ZWlyZCBub24tc3RhbmRhcmQKPiBETUEgYmVoYXZpb3VyLgo+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXph
dGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5v
cmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmly
dHVhbGl6YXRpb24=
