Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DD51CA05D
	for <lists.virtualization@lfdr.de>; Fri,  8 May 2020 03:56:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D8B058852E;
	Fri,  8 May 2020 01:56:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QO566mtb8pyo; Fri,  8 May 2020 01:56:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 692368852D;
	Fri,  8 May 2020 01:56:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 409FDC07FF;
	Fri,  8 May 2020 01:56:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D939BC07FF
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 May 2020 01:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AC0642050A
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 May 2020 01:56:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B1GXYw+Obo7q
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 May 2020 01:56:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 015C5204E6
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 May 2020 01:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588903009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JT05FM/qFjOhlzVbidfMllXSBmmMs5hu8jLgUO53t7w=;
 b=XcCGcoifhYmUdgA3GzlVGIVDUI672LJU4ks5eDxO7wKSRJAMmwBRfUAqcY/xYaBweMNO9j
 UXOHG+tbO43vkEg+OdFGVqHktJR95cHcLU3LPD+KaLGMM9DOPmU+OGaw2HS5TjOUmdFMSX
 4bQFlmj+/41MlXg+IOtH0Dov7Zb1O7w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-MdXXWQgiPJ-p7NVrRQ1dJg-1; Thu, 07 May 2020 21:56:47 -0400
X-MC-Unique: MdXXWQgiPJ-p7NVrRQ1dJg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AFB5107ACCA;
 Fri,  8 May 2020 01:56:46 +0000 (UTC)
Received: from [10.72.13.98] (ovpn-13-98.pek2.redhat.com [10.72.13.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D48125C1B0;
 Fri,  8 May 2020 01:56:39 +0000 (UTC)
Subject: Re: [PATCH net-next 1/2] virtio-net: don't reserve space for vnet
 header for XDP
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200506061633.16327-1-jasowang@redhat.com>
 <20200506033834-mutt-send-email-mst@kernel.org>
 <7a169b06-b6b9-eac1-f03a-39dd1cfcce57@redhat.com>
 <20200506055436-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c1df2cdf-eaff-f146-1804-f0a6cad6bb2d@redhat.com>
Date: Fri, 8 May 2020 09:56:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200506055436-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org,
 Jesper Dangaard Brouer <brouer@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjAvNS82IOS4i+WNiDU6NTQsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBX
ZWQsIE1heSAwNiwgMjAyMCBhdCAwNDoxOTo0MFBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
PiBPbiAyMDIwLzUvNiDkuIvljYgzOjUzLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+PiBP
biBXZWQsIE1heSAwNiwgMjAyMCBhdCAwMjoxNjozMlBNICswODAwLCBKYXNvbiBXYW5nIHdyb3Rl
Ogo+Pj4+IFdlIHRyaWVkIHRvIHJlc2VydmUgc3BhY2UgZm9yIHZuZXQgaGVhZGVyIGJlZm9yZQo+
Pj4+IHhkcC5kYXRhX2hhcmRfc3RhcnQuIEJ1dCB0aGlzIGlzIHVzZWxlc3Mgc2luY2UgdGhlIHBh
Y2tldCBjb3VsZCBiZQo+Pj4+IG1vZGlmaWVkIGJ5IFhEUCB3aGljaCBtYXkgaW52YWxpZGF0ZSB0
aGUgaW5mb3JtYXRpb24gc3RvcmVkIGluIHRoZQo+Pj4+IGhlYWRlciBhbmQgdGhlcmUncyBubyB3
YXkgZm9yIFhEUCB0byBrbm93IHRoZSBleGlzdGVuY2Ugb2YgdGhlIHZuZXQKPj4+PiBoZWFkZXIg
Y3VycmVudGx5Lgo+Pj4gV2hhdCBkbyB5b3UgbWVhbj8gRG9lc24ndCBYRFBfUEFTUyB1c2UgdGhl
IGhlYWRlciBpbiB0aGUgYnVmZmVyPwo+PiBXZSBkb24ndCwgc2VlIDQzNmM5NDUzYTFhYzAgKCJ2
aXJ0aW8tbmV0OiBrZWVwIHZuZXQgaGVhZGVyIHplcm9lZCBhZnRlcgo+PiBwcm9jZXNzaW5nIFhE
UCIpCj4+Cj4+IElmIHRoZXJlJ3Mgb3RoZXIgcGxhY2UsIGl0IHNob3VsZCBiZSBhIGJ1Zy4KPj4K
Pj4KPj4+PiBTbyBsZXQncyBqdXN0IG5vdCByZXNlcnZlIHNwYWNlIGZvciB2bmV0IGhlYWRlciBp
biB0aGlzIGNhc2UuCj4+PiBJbiBhbnkgY2FzZSwgd2UgY2FuIGZpbmQgb3V0IFhEUCBkb2VzIGhl
YWQgYWRqdXN0bWVudHMKPj4+IGlmIHdlIG5lZWQgdG8uCj4+IEJ1dCBYRFAgcHJvZ3JhbSBjYW4g
bW9kaWZ5IHRoZSBwYWNrZXRzIHdpdGhvdXQgYWRqdXN0aW5nIGhlYWRlcnMuCj4+Cj4+IFRoYW5r
cwo+IFRoZW4gd2hhdCdzIHRoZSBwcm9ibGVtPwoKClRoZW4gd2UgY2FuJ3QgZG8gYW55dGhpbmcg
bW9yZSB0aGFuIGp1c3QgaW52YWxpZGF0aW5nIHZuZXQgaGVhZGVyIHNpbmNlIAp3ZSBkb24ndCBr
bm93IHdoZXRoZXIgb3Igbm90IHRoZSBwYWNrZXQgaGFzIGJlZW4gbW9kaWZpZWQgb3Igbm90LgoK
VGVjaG5pY2FsbHksIFhEUCBjYW4gZ2l2ZSB0aGUgZHJpdmVyIHNvbWUgaGludCBhYm91dCB3aGV0
aGVyIG9yIG5vdCB0aGUgCnBhY2tldCBoYXMgYmVlbiBtb2RpZmllZCwgYnV0IEFGQUlLIHdlIGhh
dmVuJ3QgaW1wbGVtZW50ZWQgdGhpcyB5ZXQuCgpUaGFua3MKCgo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxp
c3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0
cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
