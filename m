Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C8D2E2A1B
	for <lists.virtualization@lfdr.de>; Fri, 25 Dec 2020 08:02:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6E05986640;
	Fri, 25 Dec 2020 07:02:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aDrsNtNzwlzP; Fri, 25 Dec 2020 07:02:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A7B9286637;
	Fri, 25 Dec 2020 07:02:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7FBA8C1D9F;
	Fri, 25 Dec 2020 07:02:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CB412C0893
 for <virtualization@lists.linux-foundation.org>;
 Fri, 25 Dec 2020 07:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B110286640
 for <virtualization@lists.linux-foundation.org>;
 Fri, 25 Dec 2020 07:02:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TmKdv68cpQvB
 for <virtualization@lists.linux-foundation.org>;
 Fri, 25 Dec 2020 07:02:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D547B86637
 for <virtualization@lists.linux-foundation.org>;
 Fri, 25 Dec 2020 07:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608879756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s8DUQqG91PABTEtj2MPDM1N2c4jECR7hfbdn8/wSpCs=;
 b=F2PjQtDfbPF0awVjbt2dx5MN+Is71ZX6HCJeTCCwyxS6B6cMOGqGbvVquTYOoEn495fqpA
 OZJPb++6oZfrPX6aJCXjaFWEmrcV0afV4dB+NbPY1oDNXEmOiw4j99sAfbvpl/elGbbijl
 Yr+UnahC5Nf7f1GkslUo2fE0VXHaMQU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-VawPKdybPEmy16E223rQWQ-1; Fri, 25 Dec 2020 02:02:32 -0500
X-MC-Unique: VawPKdybPEmy16E223rQWQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E9581005D44;
 Fri, 25 Dec 2020 07:02:30 +0000 (UTC)
Received: from [10.72.12.97] (ovpn-12-97.pek2.redhat.com [10.72.12.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEA7560C5B;
 Fri, 25 Dec 2020 07:02:12 +0000 (UTC)
Subject: Re: [RFC v2 09/13] vduse: Add support for processing vhost iotlb
 message
To: Yongji Xie <xieyongji@bytedance.com>
References: <20201222145221.711-1-xieyongji@bytedance.com>
 <20201222145221.711-10-xieyongji@bytedance.com>
 <6818a214-d587-4f0b-7de6-13c4e7e94ab6@redhat.com>
 <CACycT3vVU9vg6R6UujSnSdk8cwxWPVgeJJs0JaBH_Zg4xC-epQ@mail.gmail.com>
 <595fe7d6-7876-26e4-0b7c-1d63ca6d7a97@redhat.com>
 <CACycT3s=m=PQb5WFoMGhz8TNGme4+=rmbbBTtrugF9ZmNnWxEw@mail.gmail.com>
 <CACycT3tLG=13fDdY0YPzViK2-AUy5F+uJor2cmVDFOGjXTOaYA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <cc8b670c-66b9-9513-1ffb-b0bcef6ccf21@redhat.com>
Date: Fri, 25 Dec 2020 15:02:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACycT3tLG=13fDdY0YPzViK2-AUy5F+uJor2cmVDFOGjXTOaYA@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: axboe@kernel.dk, corbet@lwn.net, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-aio@kvack.org,
 netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Matthew Wilcox <willy@infradead.org>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org, bcrl@kvack.org,
 viro@zeniv.linux.org.uk, Stefan Hajnoczi <stefanha@redhat.com>,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org
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

Ck9uIDIwMjAvMTIvMjUg5LiK5Y2IMTA6MzcsIFlvbmdqaSBYaWUgd3JvdGU6Cj4gT24gVGh1LCBE
ZWMgMjQsIDIwMjAgYXQgMzozNyBQTSBZb25namkgWGllIDx4aWV5b25namlAYnl0ZWRhbmNlLmNv
bT4gd3JvdGU6Cj4+IE9uIFRodSwgRGVjIDI0LCAyMDIwIGF0IDEwOjQxIEFNIEphc29uIFdhbmcg
PGphc293YW5nQHJlZGhhdC5jb20+IHdyb3RlOgo+Pj4KPj4+IE9uIDIwMjAvMTIvMjMg5LiL5Y2I
ODoxNCwgWW9uZ2ppIFhpZSB3cm90ZToKPj4+PiBPbiBXZWQsIERlYyAyMywgMjAyMCBhdCA1OjA1
IFBNIEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+IHdyb3RlOgo+Pj4+PiBPbiAyMDIw
LzEyLzIyIOS4i+WNiDEwOjUyLCBYaWUgWW9uZ2ppIHdyb3RlOgo+Pj4+Pj4gVG8gc3VwcG9ydCB2
aG9zdC12ZHBhIGJ1cyBkcml2ZXIsIHdlIG5lZWQgYSB3YXkgdG8gc2hhcmUgdGhlCj4+Pj4+PiB2
aG9zdC12ZHBhIGJhY2tlbmQgcHJvY2VzcydzIG1lbW9yeSB3aXRoIHRoZSB1c2Vyc3BhY2UgVkRV
U0UgcHJvY2Vzcy4KPj4+Pj4+Cj4+Pj4+PiBUaGlzIHBhdGNoIHRyaWVzIHRvIG1ha2UgdXNlIG9m
IHRoZSB2aG9zdCBpb3RsYiBtZXNzYWdlIHRvIGFjaGlldmUKPj4+Pj4+IHRoYXQuIFdlIHdpbGwg
Z2V0IHRoZSBzaG0gZmlsZSBmcm9tIHRoZSBpb3RsYiBtZXNzYWdlIGFuZCBwYXNzIGl0Cj4+Pj4+
PiB0byB0aGUgdXNlcnNwYWNlIFZEVVNFIHByb2Nlc3MuCj4+Pj4+Pgo+Pj4+Pj4gU2lnbmVkLW9m
Zi1ieTogWGllIFlvbmdqaSA8eGlleW9uZ2ppQGJ5dGVkYW5jZS5jb20+Cj4+Pj4+PiAtLS0KPj4+
Pj4+ICAgICBEb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvdmR1c2UucnN0IHwgIDE1ICsrKy0KPj4+
Pj4+ICAgICBkcml2ZXJzL3ZkcGEvdmRwYV91c2VyL3ZkdXNlX2Rldi5jIHwgMTQ3ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPj4+Pj4+ICAgICBpbmNsdWRlL3VhcGkvbGlu
dXgvdmR1c2UuaCAgICAgICAgIHwgIDExICsrKwo+Pj4+Pj4gICAgIDMgZmlsZXMgY2hhbmdlZCwg
MTcxIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Pj4+Pgo+Pj4+Pj4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS92ZHVzZS5yc3QgYi9Eb2N1bWVudGF0aW9uL2Ry
aXZlci1hcGkvdmR1c2UucnN0Cj4+Pj4+PiBpbmRleCA2MjNmN2IwNDBjY2YuLjQ4ZTRiMWJhMzUz
ZiAxMDA2NDQKPj4+Pj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS92ZHVzZS5yc3QK
Pj4+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS92ZHVzZS5yc3QKPj4+Pj4+IEBA
IC00NiwxMyArNDYsMjYgQEAgVGhlIGZvbGxvd2luZyB0eXBlcyBvZiBtZXNzYWdlcyBhcmUgcHJv
dmlkZWQgYnkgdGhlIFZEVVNFIGZyYW1ld29yayBub3c6Cj4+Pj4+Pgo+Pj4+Pj4gICAgIC0gVkRV
U0VfR0VUX0NPTkZJRzogUmVhZCBmcm9tIGRldmljZSBzcGVjaWZpYyBjb25maWd1cmF0aW9uIHNw
YWNlCj4+Pj4+Pgo+Pj4+Pj4gKy0gVkRVU0VfVVBEQVRFX0lPVExCOiBVcGRhdGUgdGhlIG1lbW9y
eSBtYXBwaW5nIGluIGRldmljZSBJT1RMQgo+Pj4+Pj4gKwo+Pj4+Pj4gKy0gVkRVU0VfSU5WQUxJ
REFURV9JT1RMQjogSW52YWxpZGF0ZSB0aGUgbWVtb3J5IG1hcHBpbmcgaW4gZGV2aWNlIElPVExC
Cj4+Pj4+PiArCj4+Pj4+PiAgICAgUGxlYXNlIHNlZSBpbmNsdWRlL2xpbnV4L3ZkcGEuaCBmb3Ig
ZGV0YWlscy4KPj4+Pj4+Cj4+Pj4+PiAtSW4gdGhlIGRhdGEgcGF0aCwgVkRVU0UgZnJhbWV3b3Jr
IGltcGxlbWVudHMgYSBNTVUtYmFzZWQgb24tY2hpcCBJT01NVQo+Pj4+Pj4gK1RoZSBkYXRhIHBh
dGggb2YgdXNlcnNwYWNlIHZEUEEgZGV2aWNlIGlzIGltcGxlbWVudGVkIGluIGRpZmZlcmVudCB3
YXlzCj4+Pj4+PiArZGVwZW5kaW5nIG9uIHRoZSB2ZHBhIGJ1cyB0byB3aGljaCBpdCBpcyBhdHRh
Y2hlZC4KPj4+Pj4+ICsKPj4+Pj4+ICtJbiB2aXJ0aW8tdmRwYSBjYXNlLCBWRFVTRSBmcmFtZXdv
cmsgaW1wbGVtZW50cyBhIE1NVS1iYXNlZCBvbi1jaGlwIElPTU1VCj4+Pj4+PiAgICAgZHJpdmVy
IHdoaWNoIHN1cHBvcnRzIG1hcHBpbmcgdGhlIGtlcm5lbCBkbWEgYnVmZmVyIHRvIGEgdXNlcnNw
YWNlIGlvdmEKPj4+Pj4+ICAgICByZWdpb24gZHluYW1pY2FsbHkuIFRoZSB1c2Vyc3BhY2UgaW92
YSByZWdpb24gY2FuIGJlIGNyZWF0ZWQgYnkgcGFzc2luZwo+Pj4+Pj4gICAgIHRoZSB1c2Vyc3Bh
Y2UgdkRQQSBkZXZpY2UgZmQgdG8gbW1hcCgyKS4KPj4+Pj4+Cj4+Pj4+PiArSW4gdmhvc3QtdmRw
YSBjYXNlLCB0aGUgZG1hIGJ1ZmZlciBpcyByZXNpZGUgaW4gYSB1c2Vyc3BhY2UgbWVtb3J5IHJl
Z2lvbgo+Pj4+Pj4gK3doaWNoIHdpbGwgYmUgc2hhcmVkIHRvIHRoZSBWRFVTRSB1c2Vyc3BhY2Ug
cHJvY2Vzc3MgdmlhIHRoZSBmaWxlCj4+Pj4+PiArZGVzY3JpcHRvciBpbiBWRFVTRV9VUERBVEVf
SU9UTEIgbWVzc2FnZS4gQW5kIHRoZSBjb3JyZXNwb25kaW5nIGFkZHJlc3MKPj4+Pj4+ICttYXBw
aW5nIChJT1ZBIG9mIGRtYSBidWZmZXIgPC0+IFZBIG9mIHRoZSBtZW1vcnkgcmVnaW9uKSBpcyBh
bHNvIGluY2x1ZGVkCj4+Pj4+PiAraW4gdGhpcyBtZXNzYWdlLgo+Pj4+Pj4gKwo+Pj4+Pj4gICAg
IEJlc2lkZXMsIHRoZSBldmVudGZkIG1lY2hhbmlzbSBpcyB1c2VkIHRvIHRyaWdnZXIgaW50ZXJy
dXB0IGNhbGxiYWNrcyBhbmQKPj4+Pj4+ICAgICByZWNlaXZlIHZpcnRxdWV1ZSBraWNrcyBpbiB1
c2Vyc3BhY2UuIFRoZSBmb2xsb3dpbmcgaW9jdGxzIG9uIHRoZSB1c2Vyc3BhY2UKPj4+Pj4+ICAg
ICB2RFBBIGRldmljZSBmZCBhcmUgcHJvdmlkZWQgdG8gc3VwcG9ydCB0aGF0Ogo+Pj4+Pj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdmRwYS92ZHBhX3VzZXIvdmR1c2VfZGV2LmMgYi9kcml2ZXJzL3Zk
cGEvdmRwYV91c2VyL3ZkdXNlX2Rldi5jCj4+Pj4+PiBpbmRleCBiOTc0MzMzZWQ0ZTkuLmQyNGFh
YWNiNjAwOCAxMDA2NDQKPj4+Pj4+IC0tLSBhL2RyaXZlcnMvdmRwYS92ZHBhX3VzZXIvdmR1c2Vf
ZGV2LmMKPj4+Pj4+ICsrKyBiL2RyaXZlcnMvdmRwYS92ZHBhX3VzZXIvdmR1c2VfZGV2LmMKPj4+
Pj4+IEBAIC0zNCw2ICszNCw3IEBACj4+Pj4+Pgo+Pj4+Pj4gICAgIHN0cnVjdCB2ZHVzZV9kZXZf
bXNnIHsKPj4+Pj4+ICAgICAgICAgc3RydWN0IHZkdXNlX2Rldl9yZXF1ZXN0IHJlcTsKPj4+Pj4+
ICsgICAgIHN0cnVjdCBmaWxlICppb3RsYl9maWxlOwo+Pj4+Pj4gICAgICAgICBzdHJ1Y3QgdmR1
c2VfZGV2X3Jlc3BvbnNlIHJlc3A7Cj4+Pj4+PiAgICAgICAgIHN0cnVjdCBsaXN0X2hlYWQgbGlz
dDsKPj4+Pj4+ICAgICAgICAgd2FpdF9xdWV1ZV9oZWFkX3Qgd2FpdHE7Cj4+Pj4+PiBAQCAtMzI1
LDEyICszMjYsODAgQEAgc3RhdGljIGludCB2ZHVzZV9kZXZfc2V0X3ZxX3N0YXRlKHN0cnVjdCB2
ZHVzZV9kZXYgKmRldiwKPj4+Pj4+ICAgICAgICAgcmV0dXJuIHJldDsKPj4+Pj4+ICAgICB9Cj4+
Pj4+Pgo+Pj4+Pj4gK3N0YXRpYyBpbnQgdmR1c2VfZGV2X3VwZGF0ZV9pb3RsYihzdHJ1Y3QgdmR1
c2VfZGV2ICpkZXYsIHN0cnVjdCBmaWxlICpmaWxlLAo+Pj4+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdTY0IG9mZnNldCwgdTY0IGlvdmEsIHU2NCBzaXplLCB1OCBwZXJtKQo+Pj4+
Pj4gK3sKPj4+Pj4+ICsgICAgIHN0cnVjdCB2ZHVzZV9kZXZfbXNnICptc2c7Cj4+Pj4+PiArICAg
ICBpbnQgcmV0Owo+Pj4+Pj4gKwo+Pj4+Pj4gKyAgICAgaWYgKCFzaXplKQo+Pj4+Pj4gKyAgICAg
ICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4+Pj4+ICsKPj4+Pj4+ICsgICAgIG1zZyA9IHZkdXNl
X2Rldl9uZXdfbXNnKGRldiwgVkRVU0VfVVBEQVRFX0lPVExCKTsKPj4+Pj4+ICsgICAgIG1zZy0+
cmVxLnNpemUgPSBzaXplb2Yoc3RydWN0IHZkdXNlX2lvdGxiKTsKPj4+Pj4+ICsgICAgIG1zZy0+
cmVxLmlvdGxiLm9mZnNldCA9IG9mZnNldDsKPj4+Pj4+ICsgICAgIG1zZy0+cmVxLmlvdGxiLmlv
dmEgPSBpb3ZhOwo+Pj4+Pj4gKyAgICAgbXNnLT5yZXEuaW90bGIuc2l6ZSA9IHNpemU7Cj4+Pj4+
PiArICAgICBtc2ctPnJlcS5pb3RsYi5wZXJtID0gcGVybTsKPj4+Pj4+ICsgICAgIG1zZy0+cmVx
LmlvdGxiLmZkID0gLTE7Cj4+Pj4+PiArICAgICBtc2ctPmlvdGxiX2ZpbGUgPSBnZXRfZmlsZShm
aWxlKTsKPj4+Pj4+ICsKPj4+Pj4+ICsgICAgIHJldCA9IHZkdXNlX2Rldl9tc2dfc3luYyhkZXYs
IG1zZyk7Cj4+Pj4+IE15IGZlZWxpbmcgaXMgdGhhdCB3ZSBzaG91bGQgcHJvdmlkZSBjb25zaXN0
ZW50IEFQSSBmb3IgdGhlIHVzZXJzcGFjZQo+Pj4+PiBkZXZpY2UgdG8gdXNlLgo+Pj4+Pgo+Pj4+
PiBFLmcgd2UnZCBiZXR0ZXIgY2FycnkgdGhlIElPVExCIG1lc3NhZ2UgZm9yIGJvdGggdmlydGlv
L3Zob3N0IGRyaXZlcnMuCj4+Pj4+Cj4+Pj4+IEl0IGxvb2tzIHRvIG1lIGZvciB2aXJ0aW8gZHJp
dmVycyB3ZSBjYW4gc3RpbGwgdXNlIFVQREFUX0lPVExCIG1lc3NhZ2UKPj4+Pj4gYnkgdXNpbmcg
VkRVU0UgZmlsZSBhcyBtc2ctPmlvdGxiX2ZpbGUgaGVyZS4KPj4+Pj4KPj4+PiBJdCdzIE9LIGZv
ciBtZS4gT25lIHByb2JsZW0gaXMgd2hlbiB0byB0cmFuc2ZlciB0aGUgVVBEQVRFX0lPVExCCj4+
Pj4gbWVzc2FnZSBpbiB2aXJ0aW8gY2FzZXMuCj4+Pgo+Pj4gSW5zdGVhZCBvZiBnZW5lcmF0aW5n
IElPVExCIG1lc3NhZ2VzIGZvciB1c2Vyc3BhY2UuCj4+Pgo+Pj4gSG93IGFib3V0IHJlY29yZCB0
aGUgbWFwcGluZ3MgKHdoaWNoIGlzIGEgY29tbW9uIGNhc2UgZm9yIGRldmljZSBoYXZlCj4+PiBv
bi1jaGlwIElPTU1VIGUuZyBtbHg1ZSBhbmQgdmRwYSBzaW1sYXRvciksIHRoZW4gd2UgY2FuIGlu
dHJvZHVjZSBpb2N0bAo+Pj4gZm9yIHVzZXJzcGFjZSB0byBxdWVyeT8KPj4+Cj4+IElmIHNvLCB0
aGUgSU9UTEIgVVBEQVRFIGlzIGFjdHVhbGx5IHRyaWdnZXJlZCBieSBpb2N0bCwgYnV0Cj4+IElP
VExCX0lOVkFMSURBVEUgaXMgdHJpZ2dlcmVkIGJ5IHRoZSBtZXNzYWdlLiBJcyBpdCBhIGxpdHRs
ZSBvZGQ/IE9yCj4+IGhvdyBhYm91dCB0cmlnZ2VyIGl0IHdoZW4gdXNlcnNwYWNlIGNhbGwgbW1h
cCgpIG9uIHRoZSBkZXZpY2UgZmQ/Cj4+Cj4gT2ggc29ycnksIGxvb2tzIGxpa2UgbW1hcCgpIG5l
ZWRzIHRvIGJlIGNhbGxlZCBpbiBJT1RMQiBVUERBVEUgbWVzc2FnZQo+IGhhbmRsZXIuIElzIGl0
IHBvc3NpYmxlIGZvciB0aGUgdmRwYSBkZXZpY2UgdG8ga25vdyB3aGljaCB2ZHBhIGJ1cyBpdAo+
IGlzIGF0dGFjaGVkIHRvPwoKCldlJ2QgYmV0dGVyIG5vdC4gSXQncyBraW5kIG9mIGxheWVyIHZp
b2xhdGlvbi4KClRoYW5rcwoKCj4gICBTbyB0aGF0IHdlIGNhbiBnZW5lcmF0ZSB0aGlzIG1lc3Nh
Z2UgZHVyaW5nIHByb2JpbmcuCj4gT3RoZXJ3aXNlLCB3ZSBkb24ndCBrbm93IHdoZXRoZXIgdGhl
IGlvdmEgZG9tYWluIG9mIE1NVS1iYXNlZCBJT01NVSBpcwo+IG5lZWRlZC4KPgo+IFRoYW5rcywK
PiBZb25namkKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4
LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
