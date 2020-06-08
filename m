Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EEC1F13A1
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 09:35:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D720187E72;
	Mon,  8 Jun 2020 07:35:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oO65g7S8iF58; Mon,  8 Jun 2020 07:35:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 620E687E88;
	Mon,  8 Jun 2020 07:35:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41992C016F;
	Mon,  8 Jun 2020 07:35:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BB3E6C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 07:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B3EA586651
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 07:35:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cPxQ+THQSlAs
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 07:35:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 819C886576
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 07:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591601702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/kMiBhcOXzosQSdYsA77R56LRAWoI6pYX34+ejaPG6I=;
 b=gnZqmHIiNVJMlecxnnx2YTsOE4zW6UftqWsMn/sCCw6n6VO+MRjnEfniKj/viGCl1vpUEC
 LqecEejITbwGckBu5t7++7FtYyN94dZwIB/UOtrRRb1MKIfSd9h6u6uuUdJmGQRIj/g4eo
 LLkaQDIxZXI3OGSaK65lYCW4H3TnrvE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-D_ryV8xDPx2-B198Y2xPEw-1; Mon, 08 Jun 2020 03:34:58 -0400
X-MC-Unique: D_ryV8xDPx2-B198Y2xPEw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8B72107B265;
 Mon,  8 Jun 2020 07:34:56 +0000 (UTC)
Received: from [10.36.113.136] (ovpn-113-136.ams2.redhat.com [10.36.113.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9ED125D9C9;
 Mon,  8 Jun 2020 07:34:52 +0000 (UTC)
Subject: Re: [PATCH] virtio_mem: prevent overflow with subblock size
To: teawater <teawaterz@linux.alibaba.com>
References: <20200608061406.709211-1-mst@redhat.com>
 <0930c9d0-0708-c079-29bd-b80d4e3ce446@redhat.com>
 <2D9A07BA-6FDC-48FF-9A1F-62272695B3EF@linux.alibaba.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <201e8ab5-ec50-af86-0ffc-d25befdba14e@redhat.com>
Date: Mon, 8 Jun 2020 09:34:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <2D9A07BA-6FDC-48FF-9A1F-62272695B3EF@linux.alibaba.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 virtualization@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gMDguMDYuMjAgMDk6MTIsIHRlYXdhdGVyIHdyb3RlOgo+IAo+IAo+PiAyMDIw5bm0NuaciDjm
l6UgMTQ6NTjvvIxEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4g5YaZ6YGT77ya
Cj4+Cj4+IE9uIDA4LjA2LjIwIDA4OjE0LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+PiBJ
ZiBzdWJibG9jayBzaXplIGlzIGxhcmdlIChlLmcuIDFHKSAzMiBiaXQgbWF0aCBpbnZvbHZpbmcg
aXQKPj4+IGNhbiBvdmVyZmxvdy4gUmF0aGVyIHRoYW4gdHJ5IHRvIGNhdGNoIGFsbCBpbnN0YW5j
ZXMgb2YgdGhhdCwKPj4+IGxldCdzIHR3ZWFrIGJsb2NrIHNpemUgdG8gNjQgYml0Lgo+Pgo+PiBJ
IGZhaWwgdG8gc2VlIHdoZXJlIHdlIGNvdWxkIGFjdHVhbGx5IHRyaWdnZXIgYW4gb3ZlcmZsb3cu
IFRoZSByZXBvcnRlZAo+PiB3YXJuaW5nIGxvb2tlZCBsaWtlIGEgZmFsc2UgcG9zaXRpdmUgdG8g
bWUuCj4+Cj4+Pgo+Pj4gSXQgcmlwcGxlcyB0aHJvdWdoIFVBUEkgd2hpY2ggaXMgYW4gQUJJIGNo
YW5nZSwgYnV0IGl0J3Mgbm90IHRvbyBsYXRlIHRvCj4+PiBtYWtlIGl0LCBhbmQgaXQgd2lsbCBh
bGxvdyBzdXBwb3J0aW5nID40R2J5dGUgYmxvY2tzIHdoaWxlIG1pZ2h0Cj4+PiBiZWNvbWUgbmVj
ZXNzYXJ5IGRvd24gdGhlIHJvYWQuCj4+Pgo+Pgo+PiBUaGlzIG1pZ2h0IGJyZWFrIGNsb3VkLWh5
cGVydmlzb3IsIHdobydzIGFscmVhZHkgaW1wbGVtZW50aW5nIHRoaXMKPj4gcHJvdG9jb2wgdXBz
dHJlYW0gKGNjaW5nIEh1aSkuCj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9jbG91ZC1oeXBlcnZpc29y
L2Nsb3VkLWh5cGVydmlzb3IvYmxvYi9tYXN0ZXIvdm0tdmlydGlvL3NyYy9tZW0ucnMKPj4KPj4g
KGJsb2NrcyBpbiB0aGUgZ2lnYWJ5dGUgcmFuZ2Ugd2VyZSBuZXZlciB0aGUgb3JpZ2luYWwgaW50
ZW50aW9uIG9mCj4+IHZpcnRpby1tZW0sIGJ1dCBJIGFtIG5vdCBjb21wbGV0ZWx5IG9wcG9zZWQg
dG8gdGhhdCkKPiAKPiBJZiB5b3UgdGhpbmsgdmlydGlvX21lbSBuZWVkIHRoaXMgcGF0Y2gsIEkg
dGhpbmsgY2xvdWQtaHlwZXJ2aXNvciBzaG91bGQgZm9sbG93IHRoaXMgdXBkYXRlIChJIHdpbGwg
cG9zdCBQUiBmb3IgaXQpLgoKVGhhbmtzIEh1aS4gU28gd2UgY2FuIHN0aWxsIGRvIGxhc3QtbWlu
dXRlIGNoYW5nZXMgaWYgd2UgYWxsIGFncmVlIGl0Cm1ha2VzIHNlbnNlLgoKQE1TVCBjYW4geW91
IHJlcGhyYXNlIHRoZSBwYXRjaCBkZXNjcmlwdGlvbiB0byBoaWdobGlnaHQgdGhhdCB0aGlzIGlz
IGEKcHJlcGFyYXRpb24gZm9yIHRoZSBmdXR1cmUgb25seSBhbmQgbm90IGFjdHVhbGx5IGN1cnJl
bnRseSBicm9rZW4/CiJ2aXJ0aW8tbWVtOiBjb252ZXJ0IGRldmljZSBibG9jayBzaXplIGludG8g
NjRiaXQiIC4uLgoKV2l0aCB0aGF0CgpBY2tlZC1ieTogRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlk
QHJlZGhhdC5jb20+CgotLSAKVGhhbmtzLAoKRGF2aWQgLyBkaGlsZGVuYgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGlu
ZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8v
bGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
