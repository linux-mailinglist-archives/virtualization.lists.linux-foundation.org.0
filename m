Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D912E361781
	for <lists.virtualization@lfdr.de>; Fri, 16 Apr 2021 04:20:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8CC6401E3;
	Fri, 16 Apr 2021 02:20:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pMfjOFEaGSkV; Fri, 16 Apr 2021 02:20:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9398D40245;
	Fri, 16 Apr 2021 02:20:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 23745C000A;
	Fri, 16 Apr 2021 02:20:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3E0B2C000A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Apr 2021 02:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 300A34185B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Apr 2021 02:20:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zFzggdB1RB11
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Apr 2021 02:20:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A9E314182E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Apr 2021 02:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618539645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=55n7LvBDiipqYGJEcb5TaYPCz2MnXHE0bIABWMH3IxI=;
 b=DyVw+AOZssoKrsDY/NVupasK2wN6TSl3xCCj3w+57xpZM28HDTN/vk9KJXlvOfsYn2mh1P
 xPuFy9boDTqBPrv03e+ITdlx3L6euZhahyCdNFzql5/+bywJ6ZGlIF0684HnhIMpllzBcX
 bDjYxt7Iop+DIPkFX3NqHPqIoBeBTq4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-Ig8URrppP2-56H43IdpRdw-1; Thu, 15 Apr 2021 22:20:41 -0400
X-MC-Unique: Ig8URrppP2-56H43IdpRdw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D2138030A1;
 Fri, 16 Apr 2021 02:20:40 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-140.pek2.redhat.com
 [10.72.13.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 864C16294D;
 Fri, 16 Apr 2021 02:20:27 +0000 (UTC)
Subject: Re: [PATCH v6 10/10] Documentation: Add documentation for VDUSE
To: Yongji Xie <xieyongji@bytedance.com>
References: <20210331080519.172-1-xieyongji@bytedance.com>
 <20210331080519.172-11-xieyongji@bytedance.com>
 <YHb44R4HyLEUVSTF@stefanha-x1.localdomain>
 <CACycT3uNR+nZY5gY0UhPkeOyi7Za6XkX4b=hasuDcgqdc7fqfg@mail.gmail.com>
 <YHfo8pc7dIO9lNc3@stefanha-x1.localdomain>
 <80b31814-9e41-3153-7efb-c0c2fab44feb@redhat.com>
 <02c19c22-13ea-ea97-d99b-71edfee0b703@redhat.com>
 <CACycT3tL7URz3n-KhMAwYH+Sn1e1TSyfU+RKcc8jpPDJ7WcZ2w@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <5beabeaf-52a6-7ee5-b666-f3616ea82811@redhat.com>
Date: Fri, 16 Apr 2021 10:20:25 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <CACycT3tL7URz3n-KhMAwYH+Sn1e1TSyfU+RKcc8jpPDJ7WcZ2w@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Jens Axboe <axboe@kernel.dk>, Jonathan Corbet <corbet@lwn.net>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Matthew Wilcox <willy@infradead.org>,
 virtualization@lists.linux-foundation.org,
 Christoph Hellwig <hch@infradead.org>,
 Christian Brauner <christian.brauner@canonical.com>, bcrl@kvack.org,
 viro@zeniv.linux.org.uk, Stefan Hajnoczi <stefanha@redhat.com>,
 linux-fsdevel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>,
 =?UTF-8?Q?Mika_Penttil=c3=a4?= <mika.penttila@nextfour.com>
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

CuWcqCAyMDIxLzQvMTUg5LiL5Y2INzoxNywgWW9uZ2ppIFhpZSDlhpnpgZM6Cj4gT24gVGh1LCBB
cHIgMTUsIDIwMjEgYXQgNTowNSBQTSBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPiB3
cm90ZToKPj4KPj4g5ZyoIDIwMjEvNC8xNSDkuIvljYg0OjM2LCBKYXNvbiBXYW5nIOWGmemBkzoK
Pj4+PiBQbGVhc2Ugc3RhdGUgdGhpcyBleHBsaWNpdGx5IGF0IHRoZSBzdGFydCBvZiB0aGUgZG9j
dW1lbnQuIEV4aXN0aW5nCj4+Pj4gaW50ZXJmYWNlcyBsaWtlIEZVU0UgYXJlIGRlc2lnbmVkIHRv
IGF2b2lkIHRydXN0aW5nIHVzZXJzcGFjZS4KPj4+Cj4+PiBUaGVyZSdyZSBzb21lIHN1YnRsZSBk
aWZmZXJlbmNlIGhlcmUuIFZEVVNFIHByZXNlbnQgYSBkZXZpY2UgdG8ga2VybmVsCj4+PiB3aGlj
aCBtZWFucyBJT01NVSBpcyBwcm9iYWJseSB0aGUgb25seSB0aGluZyB0byBwcmV2ZW50IGEgbWFs
aWNvdXMKPj4+IGRldmljZS4KPj4+Cj4+Pgo+Pj4+IFRoZXJlZm9yZQo+Pj4+IHBlb3BsZSBtaWdo
dCB0aGluayB0aGUgc2FtZSBpcyB0aGUgY2FzZSBoZXJlLiBJdCdzIGNyaXRpY2FsIHRoYXQgcGVv
cGxlCj4+Pj4gYXJlIGF3YXJlIG9mIHRoaXMgYmVmb3JlIGRlcGxveWluZyBWRFVTRSB3aXRoIHZp
cnRpby12ZHBhLgo+Pj4+Cj4+Pj4gV2Ugc2hvdWxkIHByb2JhYmx5IHBhdXNlIGhlcmUgYW5kIHRo
aW5rIGFib3V0IHdoZXRoZXIgaXQncyBwb3NzaWJsZSB0bwo+Pj4+IGF2b2lkIHRydXN0aW5nIHVz
ZXJzcGFjZS4gRXZlbiBpZiBpdCB0YWtlcyBzb21lIGVmZm9ydCBhbmQgY29zdHMgc29tZQo+Pj4+
IHBlcmZvcm1hbmNlIGl0IHdvdWxkIHByb2JhYmx5IGJlIHdvcnRod2hpbGUuCj4+Pgo+Pj4gU2lu
Y2UgdGhlIGJvdW5jZSBidWZmZXIgaXMgdXNlZCB0aGUgb25seSBhdHRhY2sgc3VyZmFjZSBpcyB0
aGUKPj4+IGNvaGVyZW50IGFyZWEsIGlmIHdlIHdhbnQgdG8gZW5mb3JjZSBzdHJvbmdlciBpc29s
YXRpb24gd2UgbmVlZCB0byB1c2UKPj4+IHNoYWRvdyB2aXJ0cXVldWUgKHdoaWNoIGlzIHByb3Bv
c2VkIGluIGVhcmxpZXIgdmVyc2lvbiBieSBtZSkgaW4gdGhpcwo+Pj4gY2FzZS4gQnV0IEknbSBu
b3Qgc3VyZSBpdCdzIHdvcnRoIHRvIGRvIHRoYXQuCj4+Cj4+Cj4+IFNvIHRoaXMgcmVtaW5kcyBt
ZSB0aGUgZGlzY3Vzc2lvbiBpbiB0aGUgZW5kIG9mIGxhc3QgeWVhci4gV2UgbmVlZCB0bwo+PiBt
YWtlIHN1cmUgd2UgZG9uJ3Qgc3VmZmVyIGZyb20gdGhlIHNhbWUgaXNzdWVzIGZvciBWRFVTRSBh
dCBsZWFzdAo+Pgo+PiBodHRwczovL3loYnQubmV0L2xvcmUvYWxsL2MzNjI5YTI3LTM1OTAtMWQ5
Zi0yMTFiLWMwYjdiZTE1MmIzMkByZWRoYXQuY29tL1QvI21jNmI2ZTIzNDNjYmVmZmNhNjhjYTdh
OTdlMGY0NzNhYWE4NzFjOTViCj4+Cj4+IE9yIHdlIGNhbiBzb2x2ZSBpdCBhdCB2aXJ0aW8gbGV2
ZWwsIGUuZyByZW1lbWJlciB0aGUgZG1hIGFkZHJlc3MgaW5zdGVhZAo+PiBvZiBkZXBlbmRpbmcg
b24gdGhlIGFkZHIgaW4gdGhlIGRlc2NyaXB0b3IgcmluZwo+Pgo+IEkgbWlnaHQgbWlzcyBzb21l
dGhpbmcuIEJ1dCBWRFVTRSBoYXMgcmVjb3JkZWQgdGhlIGRtYSBhZGRyZXNzIGR1cmluZwo+IGRt
YSBtYXBwaW5nLCBzbyB3ZSB3b3VsZCBub3QgZG8gYm91bmNpbmcgaWYgdGhlIGFkZHIvbGVuZ3Ro
IGlzIGludmFsaWQKPiBkdXJpbmcgZG1hIHVubWFwcGluZy4gSXMgaXQgZW5vdWdoPwoKCkUuZyBt
YWxpY291cyBkZXZpY2Ugd3JpdGUgYSBidWdneSBkbWEgYWRkcmVzcyBpbiB0aGUgZGVzY3JpcHRv
ciByaW5nLCBzbyAKd2UgaGFkOgoKdnJpbmdfdW5tYXBfb25lX3NwbGl0KGRlc2MtPmFkZHIsIGRl
c2MtPmxlbikKIMKgwqDCoCBkbWFfdW5tYXBfc2luZ2xlKCkKIMKgwqDCoCDCoMKgwqAgdmR1c2Vf
ZGV2X3VubWFwX3BhZ2UoKQogwqDCoMKgIMKgwqDCoCDCoMKgwqAgdmR1c2VfZG9tYWluX2JvdW5j
ZSgpCgpBbmQgaW4gdmR1c2VfZG9tYWluX2JvdW5jZSgpIHdlIGhhZDoKCiDCoMKgwqDCoMKgwqDC
oCB3aGlsZSAoc2l6ZSkgewogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1hcCA9ICZk
b21haW4tPmJvdW5jZV9tYXBzW2lvdmEgPj4gUEFHRV9TSElGVF07CiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgb2Zmc2V0ID0gb2Zmc2V0X2luX3BhZ2UoaW92YSk7CiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgc3ogPSBtaW5fdChzaXplX3QsIFBBR0VfU0laRSAtIG9mZnNl
dCwgc2l6ZSk7CgpUaGlzIG1lYW5zIHdlIHRydXN0IHRoZSBpb3ZhIHdoaWNoIGlzIGRhbmdlcm91
cyBhbmQgZXhhY2x5IHRoZSBpc3N1ZSAKbWVudGlvbmVkIGluIHRoZSBhYm92ZSBsaW5rLgoKIEZy
b20gVkRVU0UgbGV2ZWwgbmVlZCB0byBtYWtlIHN1cmUgaW92YSBpcyBsZWdhbC4KCiBGcm9tIHZp
cnRpbyBsZXZlbCwgd2Ugc2hvdWxkIG5vdCB0cnVzZSBkZXNjLT5hZGRyLgoKVGhhbmtzCgoKPgo+
IFRoYW5rcywKPiBZb25namkKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxp
c3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
