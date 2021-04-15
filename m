Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1E336053B
	for <lists.virtualization@lfdr.de>; Thu, 15 Apr 2021 11:05:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9201260816;
	Thu, 15 Apr 2021 09:05:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S6oV-tF6RWPW; Thu, 15 Apr 2021 09:05:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69E2960D75;
	Thu, 15 Apr 2021 09:05:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D0900C000A;
	Thu, 15 Apr 2021 09:05:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30F99C000A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 09:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22B6540F94
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 09:05:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ylj14z2MXSRV
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 09:05:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0083040F31
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 09:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618477520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OzvjiFIzYZkBsqCDMlTdrOnRQkd+YTOFRqgYIvls9tY=;
 b=fFd3c37bP+BWcU0aJCTiNx6s3JrvAQpvKaPDcOwoH/0coUqOPGXrgCoIZkUQFNf3NqJ7uM
 cbMq+virOGipEOCutOapwe7GcgzlTuuz6ZJHfvVq20PtYvR6FJxP2YUOb9bFppWcC3vtih
 Oh7lcBhV3voVSBYWFCVKnNejj7zyj4g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-3fh0e0aYPsqfmelJdH-0Dw-1; Thu, 15 Apr 2021 05:05:16 -0400
X-MC-Unique: 3fh0e0aYPsqfmelJdH-0Dw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3B056D59B;
 Thu, 15 Apr 2021 09:05:13 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-61.pek2.redhat.com
 [10.72.12.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DEDAE610FE;
 Thu, 15 Apr 2021 09:04:59 +0000 (UTC)
Subject: Re: [PATCH v6 10/10] Documentation: Add documentation for VDUSE
From: Jason Wang <jasowang@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>, Yongji Xie <xieyongji@bytedance.com>
References: <20210331080519.172-1-xieyongji@bytedance.com>
 <20210331080519.172-11-xieyongji@bytedance.com>
 <YHb44R4HyLEUVSTF@stefanha-x1.localdomain>
 <CACycT3uNR+nZY5gY0UhPkeOyi7Za6XkX4b=hasuDcgqdc7fqfg@mail.gmail.com>
 <YHfo8pc7dIO9lNc3@stefanha-x1.localdomain>
 <80b31814-9e41-3153-7efb-c0c2fab44feb@redhat.com>
Message-ID: <02c19c22-13ea-ea97-d99b-71edfee0b703@redhat.com>
Date: Thu, 15 Apr 2021 17:04:58 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <80b31814-9e41-3153-7efb-c0c2fab44feb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: Jens Axboe <axboe@kernel.dk>, Jonathan Corbet <corbet@lwn.net>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Matthew Wilcox <willy@infradead.org>,
 virtualization@lists.linux-foundation.org,
 Christoph Hellwig <hch@infradead.org>,
 Christian Brauner <christian.brauner@canonical.com>, bcrl@kvack.org,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 Dan Carpenter <dan.carpenter@oracle.com>,
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

CuWcqCAyMDIxLzQvMTUg5LiL5Y2INDozNiwgSmFzb24gV2FuZyDlhpnpgZM6Cj4+Pgo+PiBQbGVh
c2Ugc3RhdGUgdGhpcyBleHBsaWNpdGx5IGF0IHRoZSBzdGFydCBvZiB0aGUgZG9jdW1lbnQuIEV4
aXN0aW5nCj4+IGludGVyZmFjZXMgbGlrZSBGVVNFIGFyZSBkZXNpZ25lZCB0byBhdm9pZCB0cnVz
dGluZyB1c2Vyc3BhY2UuCj4KPgo+IFRoZXJlJ3JlIHNvbWUgc3VidGxlIGRpZmZlcmVuY2UgaGVy
ZS4gVkRVU0UgcHJlc2VudCBhIGRldmljZSB0byBrZXJuZWwgCj4gd2hpY2ggbWVhbnMgSU9NTVUg
aXMgcHJvYmFibHkgdGhlIG9ubHkgdGhpbmcgdG8gcHJldmVudCBhIG1hbGljb3VzIAo+IGRldmlj
ZS4KPgo+Cj4+IFRoZXJlZm9yZQo+PiBwZW9wbGUgbWlnaHQgdGhpbmsgdGhlIHNhbWUgaXMgdGhl
IGNhc2UgaGVyZS4gSXQncyBjcml0aWNhbCB0aGF0IHBlb3BsZQo+PiBhcmUgYXdhcmUgb2YgdGhp
cyBiZWZvcmUgZGVwbG95aW5nIFZEVVNFIHdpdGggdmlydGlvLXZkcGEuCj4+Cj4+IFdlIHNob3Vs
ZCBwcm9iYWJseSBwYXVzZSBoZXJlIGFuZCB0aGluayBhYm91dCB3aGV0aGVyIGl0J3MgcG9zc2li
bGUgdG8KPj4gYXZvaWQgdHJ1c3RpbmcgdXNlcnNwYWNlLiBFdmVuIGlmIGl0IHRha2VzIHNvbWUg
ZWZmb3J0IGFuZCBjb3N0cyBzb21lCj4+IHBlcmZvcm1hbmNlIGl0IHdvdWxkIHByb2JhYmx5IGJl
IHdvcnRod2hpbGUuCj4KPgo+IFNpbmNlIHRoZSBib3VuY2UgYnVmZmVyIGlzIHVzZWQgdGhlIG9u
bHkgYXR0YWNrIHN1cmZhY2UgaXMgdGhlIAo+IGNvaGVyZW50IGFyZWEsIGlmIHdlIHdhbnQgdG8g
ZW5mb3JjZSBzdHJvbmdlciBpc29sYXRpb24gd2UgbmVlZCB0byB1c2UgCj4gc2hhZG93IHZpcnRx
dWV1ZSAod2hpY2ggaXMgcHJvcG9zZWQgaW4gZWFybGllciB2ZXJzaW9uIGJ5IG1lKSBpbiB0aGlz
IAo+IGNhc2UuIEJ1dCBJJ20gbm90IHN1cmUgaXQncyB3b3J0aCB0byBkbyB0aGF0LgoKCgpTbyB0
aGlzIHJlbWluZHMgbWUgdGhlIGRpc2N1c3Npb24gaW4gdGhlIGVuZCBvZiBsYXN0IHllYXIuIFdl
IG5lZWQgdG8gCm1ha2Ugc3VyZSB3ZSBkb24ndCBzdWZmZXIgZnJvbSB0aGUgc2FtZSBpc3N1ZXMg
Zm9yIFZEVVNFIGF0IGxlYXN0CgpodHRwczovL3loYnQubmV0L2xvcmUvYWxsL2MzNjI5YTI3LTM1
OTAtMWQ5Zi0yMTFiLWMwYjdiZTE1MmIzMkByZWRoYXQuY29tL1QvI21jNmI2ZTIzNDNjYmVmZmNh
NjhjYTdhOTdlMGY0NzNhYWE4NzFjOTViCgpPciB3ZSBjYW4gc29sdmUgaXQgYXQgdmlydGlvIGxl
dmVsLCBlLmcgcmVtZW1iZXIgdGhlIGRtYSBhZGRyZXNzIGluc3RlYWQgCm9mIGRlcGVuZGluZyBv
biB0aGUgYWRkciBpbiB0aGUgZGVzY3JpcHRvciByaW5nCgpUaGFua3MKCgo+Cj4KPj4KPj4gSXMg
dGhlIHNlY3VyaXR5IHNpdHVhdGlvbiBkaWZmZXJlbnQgd2l0aCB2aG9zdC12ZHBhPyBJbiB0aGF0
IGNhc2UgaXQKPj4gc2VlbXMgbW9yZSBsaWtlbHkgdGhhdCB0aGUgaG9zdCBrZXJuZWwgZG9lc24n
dCBuZWVkIHRvIHRydXN0IHRoZQo+PiB1c2Vyc3BhY2UgVkRVU0UgZGV2aWNlLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFp
bGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBz
Oi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0
aW9u
