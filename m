Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FD32E23B9
	for <lists.virtualization@lfdr.de>; Thu, 24 Dec 2020 03:41:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CEE2B86FC2;
	Thu, 24 Dec 2020 02:41:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tlY1Y8156ffe; Thu, 24 Dec 2020 02:41:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E06DE8704B;
	Thu, 24 Dec 2020 02:41:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B43A8C1787;
	Thu, 24 Dec 2020 02:41:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12A86C0893
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Dec 2020 02:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 096538674A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Dec 2020 02:41:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F+bjMnJPT8aT
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Dec 2020 02:41:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7E34086744
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Dec 2020 02:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608777708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4p4XCLcT9Cy4rfmz8sdmumlkVjWox2OdnsnLNXRg9jc=;
 b=FMW9w2lITeMDC7cirifzU/AMyMcq7uDxHNRMRnB0YqXik1K+TmcvZ+qNDzHtkSzzAVsuQP
 a0Jf03plo9x3B0ni02KNp7IYDfzUCwk51FQz4J5TB22lP2VEA2mHWg5iyf51dONc/8UbbU
 R1IHEcL4wMaX1JP2DMbE/ccbDEbg67s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-YdIz8xygPwCd8x_rcseEqg-1; Wed, 23 Dec 2020 21:41:46 -0500
X-MC-Unique: YdIz8xygPwCd8x_rcseEqg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3C15800D53;
 Thu, 24 Dec 2020 02:41:43 +0000 (UTC)
Received: from [10.72.13.109] (ovpn-13-109.pek2.redhat.com [10.72.13.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B45E60C04;
 Thu, 24 Dec 2020 02:41:26 +0000 (UTC)
Subject: Re: [External] Re: [RFC v2 09/13] vduse: Add support for processing
 vhost iotlb message
To: Yongji Xie <xieyongji@bytedance.com>
References: <20201222145221.711-1-xieyongji@bytedance.com>
 <20201222145221.711-10-xieyongji@bytedance.com>
 <6818a214-d587-4f0b-7de6-13c4e7e94ab6@redhat.com>
 <CACycT3vVU9vg6R6UujSnSdk8cwxWPVgeJJs0JaBH_Zg4xC-epQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <595fe7d6-7876-26e4-0b7c-1d63ca6d7a97@redhat.com>
Date: Thu, 24 Dec 2020 10:41:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACycT3vVU9vg6R6UujSnSdk8cwxWPVgeJJs0JaBH_Zg4xC-epQ@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

Ck9uIDIwMjAvMTIvMjMg5LiL5Y2IODoxNCwgWW9uZ2ppIFhpZSB3cm90ZToKPiBPbiBXZWQsIERl
YyAyMywgMjAyMCBhdCA1OjA1IFBNIEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+IHdy
b3RlOgo+Pgo+PiBPbiAyMDIwLzEyLzIyIOS4i+WNiDEwOjUyLCBYaWUgWW9uZ2ppIHdyb3RlOgo+
Pj4gVG8gc3VwcG9ydCB2aG9zdC12ZHBhIGJ1cyBkcml2ZXIsIHdlIG5lZWQgYSB3YXkgdG8gc2hh
cmUgdGhlCj4+PiB2aG9zdC12ZHBhIGJhY2tlbmQgcHJvY2VzcydzIG1lbW9yeSB3aXRoIHRoZSB1
c2Vyc3BhY2UgVkRVU0UgcHJvY2Vzcy4KPj4+Cj4+PiBUaGlzIHBhdGNoIHRyaWVzIHRvIG1ha2Ug
dXNlIG9mIHRoZSB2aG9zdCBpb3RsYiBtZXNzYWdlIHRvIGFjaGlldmUKPj4+IHRoYXQuIFdlIHdp
bGwgZ2V0IHRoZSBzaG0gZmlsZSBmcm9tIHRoZSBpb3RsYiBtZXNzYWdlIGFuZCBwYXNzIGl0Cj4+
PiB0byB0aGUgdXNlcnNwYWNlIFZEVVNFIHByb2Nlc3MuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTog
WGllIFlvbmdqaSA8eGlleW9uZ2ppQGJ5dGVkYW5jZS5jb20+Cj4+PiAtLS0KPj4+ICAgIERvY3Vt
ZW50YXRpb24vZHJpdmVyLWFwaS92ZHVzZS5yc3QgfCAgMTUgKysrLQo+Pj4gICAgZHJpdmVycy92
ZHBhL3ZkcGFfdXNlci92ZHVzZV9kZXYuYyB8IDE0NyArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKystCj4+PiAgICBpbmNsdWRlL3VhcGkvbGludXgvdmR1c2UuaCAgICAgICAgIHwg
IDExICsrKwo+Pj4gICAgMyBmaWxlcyBjaGFuZ2VkLCAxNzEgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3Zk
dXNlLnJzdCBiL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS92ZHVzZS5yc3QKPj4+IGluZGV4IDYy
M2Y3YjA0MGNjZi4uNDhlNGIxYmEzNTNmIDEwMDY0NAo+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9k
cml2ZXItYXBpL3ZkdXNlLnJzdAo+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3Zk
dXNlLnJzdAo+Pj4gQEAgLTQ2LDEzICs0NiwyNiBAQCBUaGUgZm9sbG93aW5nIHR5cGVzIG9mIG1l
c3NhZ2VzIGFyZSBwcm92aWRlZCBieSB0aGUgVkRVU0UgZnJhbWV3b3JrIG5vdzoKPj4+Cj4+PiAg
ICAtIFZEVVNFX0dFVF9DT05GSUc6IFJlYWQgZnJvbSBkZXZpY2Ugc3BlY2lmaWMgY29uZmlndXJh
dGlvbiBzcGFjZQo+Pj4KPj4+ICstIFZEVVNFX1VQREFURV9JT1RMQjogVXBkYXRlIHRoZSBtZW1v
cnkgbWFwcGluZyBpbiBkZXZpY2UgSU9UTEIKPj4+ICsKPj4+ICstIFZEVVNFX0lOVkFMSURBVEVf
SU9UTEI6IEludmFsaWRhdGUgdGhlIG1lbW9yeSBtYXBwaW5nIGluIGRldmljZSBJT1RMQgo+Pj4g
Kwo+Pj4gICAgUGxlYXNlIHNlZSBpbmNsdWRlL2xpbnV4L3ZkcGEuaCBmb3IgZGV0YWlscy4KPj4+
Cj4+PiAtSW4gdGhlIGRhdGEgcGF0aCwgVkRVU0UgZnJhbWV3b3JrIGltcGxlbWVudHMgYSBNTVUt
YmFzZWQgb24tY2hpcCBJT01NVQo+Pj4gK1RoZSBkYXRhIHBhdGggb2YgdXNlcnNwYWNlIHZEUEEg
ZGV2aWNlIGlzIGltcGxlbWVudGVkIGluIGRpZmZlcmVudCB3YXlzCj4+PiArZGVwZW5kaW5nIG9u
IHRoZSB2ZHBhIGJ1cyB0byB3aGljaCBpdCBpcyBhdHRhY2hlZC4KPj4+ICsKPj4+ICtJbiB2aXJ0
aW8tdmRwYSBjYXNlLCBWRFVTRSBmcmFtZXdvcmsgaW1wbGVtZW50cyBhIE1NVS1iYXNlZCBvbi1j
aGlwIElPTU1VCj4+PiAgICBkcml2ZXIgd2hpY2ggc3VwcG9ydHMgbWFwcGluZyB0aGUga2VybmVs
IGRtYSBidWZmZXIgdG8gYSB1c2Vyc3BhY2UgaW92YQo+Pj4gICAgcmVnaW9uIGR5bmFtaWNhbGx5
LiBUaGUgdXNlcnNwYWNlIGlvdmEgcmVnaW9uIGNhbiBiZSBjcmVhdGVkIGJ5IHBhc3NpbmcKPj4+
ICAgIHRoZSB1c2Vyc3BhY2UgdkRQQSBkZXZpY2UgZmQgdG8gbW1hcCgyKS4KPj4+Cj4+PiArSW4g
dmhvc3QtdmRwYSBjYXNlLCB0aGUgZG1hIGJ1ZmZlciBpcyByZXNpZGUgaW4gYSB1c2Vyc3BhY2Ug
bWVtb3J5IHJlZ2lvbgo+Pj4gK3doaWNoIHdpbGwgYmUgc2hhcmVkIHRvIHRoZSBWRFVTRSB1c2Vy
c3BhY2UgcHJvY2Vzc3MgdmlhIHRoZSBmaWxlCj4+PiArZGVzY3JpcHRvciBpbiBWRFVTRV9VUERB
VEVfSU9UTEIgbWVzc2FnZS4gQW5kIHRoZSBjb3JyZXNwb25kaW5nIGFkZHJlc3MKPj4+ICttYXBw
aW5nIChJT1ZBIG9mIGRtYSBidWZmZXIgPC0+IFZBIG9mIHRoZSBtZW1vcnkgcmVnaW9uKSBpcyBh
bHNvIGluY2x1ZGVkCj4+PiAraW4gdGhpcyBtZXNzYWdlLgo+Pj4gKwo+Pj4gICAgQmVzaWRlcywg
dGhlIGV2ZW50ZmQgbWVjaGFuaXNtIGlzIHVzZWQgdG8gdHJpZ2dlciBpbnRlcnJ1cHQgY2FsbGJh
Y2tzIGFuZAo+Pj4gICAgcmVjZWl2ZSB2aXJ0cXVldWUga2lja3MgaW4gdXNlcnNwYWNlLiBUaGUg
Zm9sbG93aW5nIGlvY3RscyBvbiB0aGUgdXNlcnNwYWNlCj4+PiAgICB2RFBBIGRldmljZSBmZCBh
cmUgcHJvdmlkZWQgdG8gc3VwcG9ydCB0aGF0Ogo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmRw
YS92ZHBhX3VzZXIvdmR1c2VfZGV2LmMgYi9kcml2ZXJzL3ZkcGEvdmRwYV91c2VyL3ZkdXNlX2Rl
di5jCj4+PiBpbmRleCBiOTc0MzMzZWQ0ZTkuLmQyNGFhYWNiNjAwOCAxMDA2NDQKPj4+IC0tLSBh
L2RyaXZlcnMvdmRwYS92ZHBhX3VzZXIvdmR1c2VfZGV2LmMKPj4+ICsrKyBiL2RyaXZlcnMvdmRw
YS92ZHBhX3VzZXIvdmR1c2VfZGV2LmMKPj4+IEBAIC0zNCw2ICszNCw3IEBACj4+Pgo+Pj4gICAg
c3RydWN0IHZkdXNlX2Rldl9tc2cgewo+Pj4gICAgICAgIHN0cnVjdCB2ZHVzZV9kZXZfcmVxdWVz
dCByZXE7Cj4+PiArICAgICBzdHJ1Y3QgZmlsZSAqaW90bGJfZmlsZTsKPj4+ICAgICAgICBzdHJ1
Y3QgdmR1c2VfZGV2X3Jlc3BvbnNlIHJlc3A7Cj4+PiAgICAgICAgc3RydWN0IGxpc3RfaGVhZCBs
aXN0Owo+Pj4gICAgICAgIHdhaXRfcXVldWVfaGVhZF90IHdhaXRxOwo+Pj4gQEAgLTMyNSwxMiAr
MzI2LDgwIEBAIHN0YXRpYyBpbnQgdmR1c2VfZGV2X3NldF92cV9zdGF0ZShzdHJ1Y3QgdmR1c2Vf
ZGV2ICpkZXYsCj4+PiAgICAgICAgcmV0dXJuIHJldDsKPj4+ICAgIH0KPj4+Cj4+PiArc3RhdGlj
IGludCB2ZHVzZV9kZXZfdXBkYXRlX2lvdGxiKHN0cnVjdCB2ZHVzZV9kZXYgKmRldiwgc3RydWN0
IGZpbGUgKmZpbGUsCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1NjQgb2Zmc2V0
LCB1NjQgaW92YSwgdTY0IHNpemUsIHU4IHBlcm0pCj4+PiArewo+Pj4gKyAgICAgc3RydWN0IHZk
dXNlX2Rldl9tc2cgKm1zZzsKPj4+ICsgICAgIGludCByZXQ7Cj4+PiArCj4+PiArICAgICBpZiAo
IXNpemUpCj4+PiArICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+Pj4gKwo+Pj4gKyAgICAg
bXNnID0gdmR1c2VfZGV2X25ld19tc2coZGV2LCBWRFVTRV9VUERBVEVfSU9UTEIpOwo+Pj4gKyAg
ICAgbXNnLT5yZXEuc2l6ZSA9IHNpemVvZihzdHJ1Y3QgdmR1c2VfaW90bGIpOwo+Pj4gKyAgICAg
bXNnLT5yZXEuaW90bGIub2Zmc2V0ID0gb2Zmc2V0Owo+Pj4gKyAgICAgbXNnLT5yZXEuaW90bGIu
aW92YSA9IGlvdmE7Cj4+PiArICAgICBtc2ctPnJlcS5pb3RsYi5zaXplID0gc2l6ZTsKPj4+ICsg
ICAgIG1zZy0+cmVxLmlvdGxiLnBlcm0gPSBwZXJtOwo+Pj4gKyAgICAgbXNnLT5yZXEuaW90bGIu
ZmQgPSAtMTsKPj4+ICsgICAgIG1zZy0+aW90bGJfZmlsZSA9IGdldF9maWxlKGZpbGUpOwo+Pj4g
Kwo+Pj4gKyAgICAgcmV0ID0gdmR1c2VfZGV2X21zZ19zeW5jKGRldiwgbXNnKTsKPj4KPj4gTXkg
ZmVlbGluZyBpcyB0aGF0IHdlIHNob3VsZCBwcm92aWRlIGNvbnNpc3RlbnQgQVBJIGZvciB0aGUg
dXNlcnNwYWNlCj4+IGRldmljZSB0byB1c2UuCj4+Cj4+IEUuZyB3ZSdkIGJldHRlciBjYXJyeSB0
aGUgSU9UTEIgbWVzc2FnZSBmb3IgYm90aCB2aXJ0aW8vdmhvc3QgZHJpdmVycy4KPj4KPj4gSXQg
bG9va3MgdG8gbWUgZm9yIHZpcnRpbyBkcml2ZXJzIHdlIGNhbiBzdGlsbCB1c2UgVVBEQVRfSU9U
TEIgbWVzc2FnZQo+PiBieSB1c2luZyBWRFVTRSBmaWxlIGFzIG1zZy0+aW90bGJfZmlsZSBoZXJl
Lgo+Pgo+IEl0J3MgT0sgZm9yIG1lLiBPbmUgcHJvYmxlbSBpcyB3aGVuIHRvIHRyYW5zZmVyIHRo
ZSBVUERBVEVfSU9UTEIKPiBtZXNzYWdlIGluIHZpcnRpbyBjYXNlcy4KCgpJbnN0ZWFkIG9mIGdl
bmVyYXRpbmcgSU9UTEIgbWVzc2FnZXMgZm9yIHVzZXJzcGFjZS4KCkhvdyBhYm91dCByZWNvcmQg
dGhlIG1hcHBpbmdzICh3aGljaCBpcyBhIGNvbW1vbiBjYXNlIGZvciBkZXZpY2UgaGF2ZSAKb24t
Y2hpcCBJT01NVSBlLmcgbWx4NWUgYW5kIHZkcGEgc2ltbGF0b3IpLCB0aGVuIHdlIGNhbiBpbnRy
b2R1Y2UgaW9jdGwgCmZvciB1c2Vyc3BhY2UgdG8gcXVlcnk/CgpUaGFua3MKCgo+Cj4+PiArICAg
ICB2ZHVzZV9kZXZfbXNnX3B1dChtc2cpOwo+Pj4gKyAgICAgZnB1dChmaWxlKTsKPj4+ICsKPj4+
ICsgICAgIHJldHVybiByZXQ7Cj4+PiArfQo+Pj4gKwo+Pj4gK3N0YXRpYyBpbnQgdmR1c2VfZGV2
X2ludmFsaWRhdGVfaW90bGIoc3RydWN0IHZkdXNlX2RldiAqZGV2LAo+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1NjQgaW92YSwgdTY0IHNpemUpCj4+PiArewo+Pj4g
KyAgICAgc3RydWN0IHZkdXNlX2Rldl9tc2cgKm1zZzsKPj4+ICsgICAgIGludCByZXQ7Cj4+PiAr
Cj4+PiArICAgICBpZiAoIXNpemUpCj4+PiArICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+
Pj4gKwo+Pj4gKyAgICAgbXNnID0gdmR1c2VfZGV2X25ld19tc2coZGV2LCBWRFVTRV9JTlZBTElE
QVRFX0lPVExCKTsKPj4+ICsgICAgIG1zZy0+cmVxLnNpemUgPSBzaXplb2Yoc3RydWN0IHZkdXNl
X2lvdGxiKTsKPj4+ICsgICAgIG1zZy0+cmVxLmlvdGxiLmlvdmEgPSBpb3ZhOwo+Pj4gKyAgICAg
bXNnLT5yZXEuaW90bGIuc2l6ZSA9IHNpemU7Cj4+PiArCj4+PiArICAgICByZXQgPSB2ZHVzZV9k
ZXZfbXNnX3N5bmMoZGV2LCBtc2cpOwo+Pj4gKyAgICAgdmR1c2VfZGV2X21zZ19wdXQobXNnKTsK
Pj4+ICsKPj4+ICsgICAgIHJldHVybiByZXQ7Cj4+PiArfQo+Pj4gKwo+Pj4gK3N0YXRpYyB1bnNp
Z25lZCBpbnQgcGVybV90b19maWxlX2ZsYWdzKHU4IHBlcm0pCj4+PiArewo+Pj4gKyAgICAgdW5z
aWduZWQgaW50IGZsYWdzID0gMDsKPj4+ICsKPj4+ICsgICAgIHN3aXRjaCAocGVybSkgewo+Pj4g
KyAgICAgY2FzZSBWSE9TVF9BQ0NFU1NfV086Cj4+PiArICAgICAgICAgICAgIGZsYWdzIHw9IE9f
V1JPTkxZOwo+Pj4gKyAgICAgICAgICAgICBicmVhazsKPj4+ICsgICAgIGNhc2UgVkhPU1RfQUND
RVNTX1JPOgo+Pj4gKyAgICAgICAgICAgICBmbGFncyB8PSBPX1JET05MWTsKPj4+ICsgICAgICAg
ICAgICAgYnJlYWs7Cj4+PiArICAgICBjYXNlIFZIT1NUX0FDQ0VTU19SVzoKPj4+ICsgICAgICAg
ICAgICAgZmxhZ3MgfD0gT19SRFdSOwo+Pj4gKyAgICAgICAgICAgICBicmVhazsKPj4+ICsgICAg
IGRlZmF1bHQ6Cj4+PiArICAgICAgICAgICAgIFdBUk4oMSwgImludmFsaWRhdGUgdmhvc3QgSU9U
TEIgcGVybWlzc2lvblxuIik7Cj4+PiArICAgICAgICAgICAgIGJyZWFrOwo+Pj4gKyAgICAgfQo+
Pj4gKwo+Pj4gKyAgICAgcmV0dXJuIGZsYWdzOwo+Pj4gK30KPj4+ICsKPj4+ICAgIHN0YXRpYyBz
c2l6ZV90IHZkdXNlX2Rldl9yZWFkX2l0ZXIoc3RydWN0IGtpb2NiICppb2NiLCBzdHJ1Y3QgaW92
X2l0ZXIgKnRvKQo+Pj4gICAgewo+Pj4gICAgICAgIHN0cnVjdCBmaWxlICpmaWxlID0gaW9jYi0+
a2lfZmlscDsKPj4+ICAgICAgICBzdHJ1Y3QgdmR1c2VfZGV2ICpkZXYgPSBmaWxlLT5wcml2YXRl
X2RhdGE7Cj4+PiAgICAgICAgc3RydWN0IHZkdXNlX2Rldl9tc2cgKm1zZzsKPj4+IC0gICAgIGlu
dCBzaXplID0gc2l6ZW9mKHN0cnVjdCB2ZHVzZV9kZXZfcmVxdWVzdCk7Cj4+PiArICAgICB1bnNp
Z25lZCBpbnQgZmxhZ3M7Cj4+PiArICAgICBpbnQgZmQsIHNpemUgPSBzaXplb2Yoc3RydWN0IHZk
dXNlX2Rldl9yZXF1ZXN0KTsKPj4+ICAgICAgICBzc2l6ZV90IHJldCA9IDA7Cj4+Pgo+Pj4gICAg
ICAgIGlmIChpb3ZfaXRlcl9jb3VudCh0bykgPCBzaXplKQo+Pj4gQEAgLTM0OSw2ICs0MTgsMTgg
QEAgc3RhdGljIHNzaXplX3QgdmR1c2VfZGV2X3JlYWRfaXRlcihzdHJ1Y3Qga2lvY2IgKmlvY2Is
IHN0cnVjdCBpb3ZfaXRlciAqdG8pCj4+PiAgICAgICAgICAgICAgICBpZiAocmV0KQo+Pj4gICAg
ICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+Pj4gICAgICAgIH0KPj4+ICsKPj4+ICsg
ICAgIGlmIChtc2ctPnJlcS50eXBlID09IFZEVVNFX1VQREFURV9JT1RMQiAmJiBtc2ctPnJlcS5p
b3RsYi5mZCA9PSAtMSkgewo+Pj4gKyAgICAgICAgICAgICBmbGFncyA9IHBlcm1fdG9fZmlsZV9m
bGFncyhtc2ctPnJlcS5pb3RsYi5wZXJtKTsKPj4+ICsgICAgICAgICAgICAgZmQgPSBnZXRfdW51
c2VkX2ZkX2ZsYWdzKGZsYWdzKTsKPj4+ICsgICAgICAgICAgICAgaWYgKGZkIDwgMCkgewo+Pj4g
KyAgICAgICAgICAgICAgICAgICAgIHZkdXNlX2Rldl9lbnF1ZXVlX21zZyhkZXYsIG1zZywgJmRl
di0+c2VuZF9saXN0KTsKPj4+ICsgICAgICAgICAgICAgICAgICAgICByZXR1cm4gZmQ7Cj4+PiAr
ICAgICAgICAgICAgIH0KPj4+ICsgICAgICAgICAgICAgZmRfaW5zdGFsbChmZCwgZ2V0X2ZpbGUo
bXNnLT5pb3RsYl9maWxlKSk7Cj4+PiArICAgICAgICAgICAgIG1zZy0+cmVxLmlvdGxiLmZkID0g
ZmQ7Cj4+PiArICAgICB9Cj4+PiArCj4+PiAgICAgICAgcmV0ID0gY29weV90b19pdGVyKCZtc2ct
PnJlcSwgc2l6ZSwgdG8pOwo+Pj4gICAgICAgIGlmIChyZXQgIT0gc2l6ZSkgewo+Pj4gICAgICAg
ICAgICAgICAgdmR1c2VfZGV2X2VucXVldWVfbXNnKGRldiwgbXNnLCAmZGV2LT5zZW5kX2xpc3Qp
Owo+Pj4gQEAgLTU2NSw2ICs2NDYsNjkgQEAgc3RhdGljIHZvaWQgdmR1c2VfdmRwYV9zZXRfY29u
ZmlnKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRwYSwgdW5zaWduZWQgaW50IG9mZnNldCwKPj4+ICAg
ICAgICB2ZHVzZV9kZXZfc2V0X2NvbmZpZyhkZXYsIG9mZnNldCwgYnVmLCBsZW4pOwo+Pj4gICAg
fQo+Pj4KPj4+ICtzdGF0aWMgdm9pZCB2ZHVzZV92ZHBhX2ludmFsaWRhdGVfaW90bGIoc3RydWN0
IHZkdXNlX2RldiAqZGV2LAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3Qgdmhvc3RfaW90bGJfbXNnICptc2cpCj4+PiArewo+Pj4gKyAgICAgdmR1c2VfZGV2
X2ludmFsaWRhdGVfaW90bGIoZGV2LCBtc2ctPmlvdmEsIG1zZy0+c2l6ZSk7Cj4+PiArfQo+Pj4g
Kwo+Pj4gK3N0YXRpYyBpbnQgdmR1c2VfdmRwYV91cGRhdGVfaW90bGIoc3RydWN0IHZkdXNlX2Rl
diAqZGV2LAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qg
dmhvc3RfaW90bGJfbXNnICptc2cpCj4+PiArewo+Pj4gKyAgICAgdTY0IHVhZGRyID0gbXNnLT51
YWRkcjsKPj4+ICsgICAgIHU2NCBpb3ZhID0gbXNnLT5pb3ZhOwo+Pj4gKyAgICAgdTY0IHNpemUg
PSBtc2ctPnNpemU7Cj4+PiArICAgICB1NjQgb2Zmc2V0Owo+Pj4gKyAgICAgc3RydWN0IHZtX2Fy
ZWFfc3RydWN0ICp2bWE7Cj4+PiArICAgICBpbnQgcmV0Owo+Pj4gKwo+Pj4gKyAgICAgd2hpbGUg
KHVhZGRyIDwgbXNnLT51YWRkciArIG1zZy0+c2l6ZSkgewo+Pj4gKyAgICAgICAgICAgICB2bWEg
PSBmaW5kX3ZtYShjdXJyZW50LT5tbSwgdWFkZHIpOwo+Pj4gKyAgICAgICAgICAgICByZXQgPSAt
RUlOVkFMOwo+Pj4gKyAgICAgICAgICAgICBpZiAoIXZtYSkKPj4+ICsgICAgICAgICAgICAgICAg
ICAgICBnb3RvIGVycjsKPj4+ICsKPj4+ICsgICAgICAgICAgICAgc2l6ZSA9IG1pbihtc2ctPnNp
emUsIHZtYS0+dm1fZW5kIC0gdWFkZHIpOwo+Pj4gKyAgICAgICAgICAgICBvZmZzZXQgPSAodm1h
LT52bV9wZ29mZiA8PCBQQUdFX1NISUZUKSArIHVhZGRyIC0gdm1hLT52bV9zdGFydDsKPj4+ICsg
ICAgICAgICAgICAgaWYgKHZtYS0+dm1fZmlsZSAmJiAodm1hLT52bV9mbGFncyAmIFZNX1NIQVJF
RCkpIHsKPj4+ICsgICAgICAgICAgICAgICAgICAgICByZXQgPSB2ZHVzZV9kZXZfdXBkYXRlX2lv
dGxiKGRldiwgdm1hLT52bV9maWxlLCBvZmZzZXQsCj4+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpb3ZhLCBzaXplLCBtc2ctPnBlcm0pOwo+
Pj4gKyAgICAgICAgICAgICAgICAgICAgIGlmIChyZXQpCj4+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBnb3RvIGVycjsKPj4KPj4gTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHZtYSBp
cyBzb21ldGhpbmcgdGhhdCBzaG91bGQgbm90IGJlIGtub3duIGJ5IGEKPj4gZGV2aWNlLiBTbyBJ
IHN1Z2dlc3QgdG8gbW92ZSB0aGUgYWJvdmUgcHJvY2Vzc2luZyB0byB2aG9zdC12ZHBhLmMuCj4+
Cj4gV2lsbCBkbyBpdC4KPgo+IFRoYW5rcywKPiBZb25namkKPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0
ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
