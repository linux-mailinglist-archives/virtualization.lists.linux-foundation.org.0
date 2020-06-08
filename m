Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 904E11F11EE
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 05:58:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E754885BFB;
	Mon,  8 Jun 2020 03:58:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lMVLUm4JtUb9; Mon,  8 Jun 2020 03:58:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6830885BAE;
	Mon,  8 Jun 2020 03:58:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4B79AC0894;
	Mon,  8 Jun 2020 03:58:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3B12DC016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 03:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1B27D2010A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 03:58:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H63rfDcbWi1X
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 03:58:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 0510520035
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 03:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591588685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=igcFF6sIPo1IwGxhbkOb5ZYxeIEkm6yVF+37+rACCwU=;
 b=FlvBI+oaqfVsgxN3l2NqNWHaSLQehvEZO4L9RCGsena5LXJLzjEIC5lFJvGZ2MU/dTvWAO
 WD2ycJuD6X+QQCtlkdL2nYkzJeRaT8ooAuh8946bugNPOcPvqxvMp+tFX3mujUSddbr3tw
 PxGGodFlTwwmYCD1PoGdSHrum7BGYB4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-N3VRj-sbNZikNPTWUwUu5Q-1; Sun, 07 Jun 2020 23:58:03 -0400
X-MC-Unique: N3VRj-sbNZikNPTWUwUu5Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93E9A1005510;
 Mon,  8 Jun 2020 03:58:02 +0000 (UTC)
Received: from [10.72.13.71] (ovpn-13-71.pek2.redhat.com [10.72.13.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2F4A60BE1;
 Mon,  8 Jun 2020 03:57:50 +0000 (UTC)
Subject: Re: [PATCH RFC v5 13/13] vhost: drop head based APIs
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20200607141057.704085-1-mst@redhat.com>
 <20200607141057.704085-14-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <8e3f5b6f-a47b-73cd-e8e3-959d40f6c91c@redhat.com>
Date: Mon, 8 Jun 2020 11:57:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200607141057.704085-14-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: netdev@vger.kernel.org, eperezma@redhat.com, kvm@vger.kernel.org,
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

Ck9uIDIwMjAvNi83IOS4i+WNiDEwOjExLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gRXZl
cnlvbmUncyB1c2luZyBidWYgQVBJcywgbm8gbmVlZCBmb3IgaGVhZCBiYXNlZCBvbmVzIGFueW1v
cmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFMuIFRzaXJraW48bXN0QHJlZGhhdC5jb20+
Cj4gLS0tCj4gICBkcml2ZXJzL3Zob3N0L3Zob3N0LmMgfCAzNiArKysrKysrKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KPiAgIGRyaXZlcnMvdmhvc3Qvdmhvc3QuaCB8IDEyIC0tLS0tLS0t
LS0tLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDQwIGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYyBiL2RyaXZlcnMvdmhvc3Qv
dmhvc3QuYwo+IGluZGV4IDcyZWU1NWM4MTBjNC4uZTY5MzFiNzYwYjYxIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvdmhvc3Qvdmhvc3QuYwo+ICsrKyBiL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYwo+IEBA
IC0yMjk5LDEyICsyMjk5LDEyIEBAIHN0YXRpYyBpbnQgZmV0Y2hfYnVmKHN0cnVjdCB2aG9zdF92
aXJ0cXVldWUgKnZxKQo+ICAgCXJldHVybiAxOwo+ICAgfQo+ICAgCj4gLS8qIFJldmVyc2UgdGhl
IGVmZmVjdCBvZiB2aG9zdF9nZXRfdnFfZGVzYy4gVXNlZnVsIGZvciBlcnJvciBoYW5kbGluZy4g
Ki8KPiArLyogUmV2ZXJ0IHRoZSBlZmZlY3Qgb2YgZmV0Y2hfYnVmLiBVc2VmdWwgZm9yIGVycm9y
IGhhbmRsaW5nLiAqLwo+ICtzdGF0aWMKPiAgIHZvaWQgdmhvc3RfZGlzY2FyZF92cV9kZXNjKHN0
cnVjdCB2aG9zdF92aXJ0cXVldWUgKnZxLCBpbnQgbikKPiAgIHsKPiAgIAl2cS0+bGFzdF9hdmFp
bF9pZHggLT0gbjsKPiAgIH0KPiAtRVhQT1JUX1NZTUJPTF9HUEwodmhvc3RfZGlzY2FyZF92cV9k
ZXNjKTsKCgpUaGUgc2FtZSBxdWVzdGlvbiBhcyBwcmV2aW91cyB2ZXJzaW9uLgoKRG8gd2UgbmVl
ZCB0byByZXdpbmQgY2FjaGVkIGRlc2NyaXB0b3IgaGVyZT8KClRoYW5rcwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGlu
ZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8v
bGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
