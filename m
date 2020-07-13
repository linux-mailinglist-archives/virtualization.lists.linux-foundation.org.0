Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD3A21CDB5
	for <lists.virtualization@lfdr.de>; Mon, 13 Jul 2020 05:29:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8432A2441E;
	Mon, 13 Jul 2020 03:29:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ElTAH9tMx1Xc; Mon, 13 Jul 2020 03:29:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2BE692313B;
	Mon, 13 Jul 2020 03:29:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 11DC9C0733;
	Mon, 13 Jul 2020 03:29:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 657F1C0733
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 03:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4EE47889A6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 03:29:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id biHM6bVj-XOV
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 03:29:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0571788995
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 03:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594610952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5sqmIa3FOThqJ2P5OGh1edrqCIvFDayENPyYWhN4VO0=;
 b=EEeOUmDzDxG/uNx89SYC7UDU5Ub5PWd07Pg6cLxbj24QTN1IpVkGFn0zlWSwtryDOMNiii
 QsyhFjsajeRWQJeeDI9F2ZeEky9qEpMZu6IE6IsikzZ6DMerFfAXxdMsSD1EdO3f2qkOpU
 6x1h3NexXki+eIxzhJikDOzsRfll6nk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-cgnKb0z2Mb-co7CYRgTzmw-1; Sun, 12 Jul 2020 23:29:11 -0400
X-MC-Unique: cgnKb0z2Mb-co7CYRgTzmw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E1441086;
 Mon, 13 Jul 2020 03:29:10 +0000 (UTC)
Received: from [10.72.13.177] (ovpn-13-177.pek2.redhat.com [10.72.13.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F2FE74F75;
 Mon, 13 Jul 2020 03:29:02 +0000 (UTC)
Subject: Re: [PATCH] virtio_balloon: fix sparse warning
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20200710104837.405966-1-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <2c3b61df-c5c8-536a-01d4-c468e958f6d7@redhat.com>
Date: Mon, 13 Jul 2020 11:29:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200710104837.405966-1-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjAvNy8xMCDkuIvljYg2OjQ4LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gYmFs
bG9vbiB1c2VzIHZpcnRpbzMyX3RvX2NwdSBpbnN0ZWFkIG9mIGNwdV90b192aXJ0aW8zMgo+IHRv
IGNvbnZlcnQgYSBuYXRpdmUgZW5kaWFuIG51bWJlciB0byB2aXJ0aW8uCj4gTm8gcHJhY3RpY2Fs
IGRpZmZlcmVuY2UgYnV0IG1ha2VzIHNwYXJzZSB3YXJuLgo+IEZpeCBpdCB1cC4KPgo+IFNpZ25l
ZC1vZmYtYnk6IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+Cj4gLS0tCj4gICBk
cml2ZXJzL3ZpcnRpby92aXJ0aW9fYmFsbG9vbi5jIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92
aXJ0aW8vdmlydGlvX2JhbGxvb24uYyBiL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19iYWxsb29uLmMK
PiBpbmRleCBmYzczMDE0MDY1NDAuLjVkNGI4OTFiZjg0ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L3ZpcnRpby92aXJ0aW9fYmFsbG9vbi5jCj4gKysrIGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX2Jh
bGxvb24uYwo+IEBAIC01OTYsNyArNTk2LDcgQEAgc3RhdGljIGludCBzZW5kX2NtZF9pZF9zdGFy
dChzdHJ1Y3QgdmlydGlvX2JhbGxvb24gKnZiKQo+ICAgCXdoaWxlICh2aXJ0cXVldWVfZ2V0X2J1
Zih2cSwgJnVudXNlZCkpCj4gICAJCTsKPiAgIAo+IC0JdmItPmNtZF9pZF9hY3RpdmUgPSB2aXJ0
aW8zMl90b19jcHUodmItPnZkZXYsCj4gKwl2Yi0+Y21kX2lkX2FjdGl2ZSA9IGNwdV90b192aXJ0
aW8zMih2Yi0+dmRldiwKPiAgIAkJCQkJdmlydGlvX2JhbGxvb25fY21kX2lkX3JlY2VpdmVkKHZi
KSk7Cj4gICAJc2dfaW5pdF9vbmUoJnNnLCAmdmItPmNtZF9pZF9hY3RpdmUsIHNpemVvZih2Yi0+
Y21kX2lkX2FjdGl2ZSkpOwo+ICAgCWVyciA9IHZpcnRxdWV1ZV9hZGRfb3V0YnVmKHZxLCAmc2cs
IDEsICZ2Yi0+Y21kX2lkX2FjdGl2ZSwgR0ZQX0tFUk5FTCk7CgoKQWNrZWQtYnk6IEphc29uIFdh
bmcgPGphc293YW5nQHJlZGhhdC5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0
aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0
aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
