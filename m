Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F01B1E050F
	for <lists.virtualization@lfdr.de>; Mon, 25 May 2020 05:12:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B3EFB85B36;
	Mon, 25 May 2020 03:12:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3-oC5VWV6EyO; Mon, 25 May 2020 03:12:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BDEB986DF4;
	Mon, 25 May 2020 03:12:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A0F73C016F;
	Mon, 25 May 2020 03:12:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9F8C8C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 May 2020 03:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 90C7985F58
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 May 2020 03:12:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ADMmap9jK67b
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 May 2020 03:12:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8F4E985D54
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 May 2020 03:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590376348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cnz+SecxbJF4VB67gTuVQUxZ7oOwMLV+o3t+dmPe5pU=;
 b=GIlJUKzzlS9LB2JX9KtglBoDkMHN/kiSeRLdq/IRBCyKt++bA0Oh84vp2wda9xfj5DBba/
 RnnPme8mGPOM6JyOsxXDYlWUC5Mf5r140iWczvu2Mty/TolXRJbAlWSA2EDhbjf2dkUBwl
 BukRfNWZ9TnJvVbJoR3rJSJn+KIGNKE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-nEBiy2TBMrq5N4laMrxC4w-1; Sun, 24 May 2020 23:12:26 -0400
X-MC-Unique: nEBiy2TBMrq5N4laMrxC4w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0919C1009440;
 Mon, 25 May 2020 03:12:24 +0000 (UTC)
Received: from [10.72.13.226] (ovpn-13-226.pek2.redhat.com [10.72.13.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1C4B5D9DC;
 Mon, 25 May 2020 03:12:16 +0000 (UTC)
Subject: Re: [PATCH 1/2] crypto: virtio: fix src/dst scatterlist calculation
To: "Longpeng(Mike)" <longpeng2@huawei.com>, linux-crypto@vger.kernel.org
References: <20200525005627.707-1-longpeng2@huawei.com>
 <20200525005627.707-2-longpeng2@huawei.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <25cff618-601c-e899-a3cc-b289863a7407@redhat.com>
Date: Mon, 25 May 2020 11:12:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200525005627.707-2-longpeng2@huawei.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 LABBE Corentin <clabbe@baylibre.com>, "David S. Miller" <davem@davemloft.net>
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

Ck9uIDIwMjAvNS8yNSDkuIrljYg4OjU2LCBMb25ncGVuZyhNaWtlKSB3cm90ZToKPiBUaGUgc3lz
dGVtIHdpbGwgY3Jhc2ggd2hlbiB3ZSBpbnNtb2QgY3J5cHRvL3RjcnlwdC5rbyB3aGl0IG1vZGU9
MzguCj4KPiBVc3VhbGx5IHRoZSBuZXh0IGVudHJ5IG9mIG9uZSBzZyB3aWxsIGJlIEBzZ0AgKyAx
LCBidXQgaWYgdGhpcyBzZyBlbGVtZW50Cj4gaXMgcGFydCBvZiBhIGNoYWluZWQgc2NhdHRlcmxp
c3QsIGl0IGNvdWxkIGp1bXAgdG8gdGhlIHN0YXJ0IG9mIGEgbmV3Cj4gc2NhdHRlcmxpc3QgYXJy
YXkuIExldCdzIGZpeCBpdCBieSBzZ19uZXh0KCkgb24gY2FsY3VsYXRpb24gb2Ygc3JjL2RzdAo+
IHNjYXR0ZXJsaXN0Lgo+Cj4gQlRXIEkgYWRkIGEgY2hlY2sgZm9yIHNnX25lbnRzX2Zvcl9sZW4o
KSBpdHMgcmV0dXJuIHZhbHVlIHNpbmNlCj4gc2dfbmVudHNfZm9yX2xlbigpIGZ1bmN0aW9uIGNv
dWxkIGZhaWwuCj4KPiBDYzogR29uZ2xlaSA8YXJlaS5nb25nbGVpQGh1YXdlaS5jb20+Cj4gQ2M6
IEhlcmJlcnQgWHUgPGhlcmJlcnRAZ29uZG9yLmFwYW5hLm9yZy5hdT4KPiBDYzogIk1pY2hhZWwg
Uy4gVHNpcmtpbiIgPG1zdEByZWRoYXQuY29tPgo+IENjOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
ZWRoYXQuY29tPgo+IENjOiAiRGF2aWQgUy4gTWlsbGVyIiA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD4K
PiBDYzogdmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKPiBDYzogbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+Cj4gUmVwb3J0ZWQtYnk6IExBQkJFIENvcmVudGlu
IDxjbGFiYmVAYmF5bGlicmUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEdvbmdsZWkgPGFyZWkuZ29u
Z2xlaUBodWF3ZWkuY29tPgo+IFNpZ25lZC1vZmYtYnk6IExvbmdwZW5nKE1pa2UpIDxsb25ncGVu
ZzJAaHVhd2VpLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvY3J5cHRvL3ZpcnRpby92aXJ0aW9fY3J5
cHRvX2FsZ3MuYyB8IDE0ICsrKysrKysrKystLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2NyeXB0
by92aXJ0aW8vdmlydGlvX2NyeXB0b19hbGdzLmMgYi9kcml2ZXJzL2NyeXB0by92aXJ0aW8vdmly
dGlvX2NyeXB0b19hbGdzLmMKPiBpbmRleCAzNzJiYWJiNDQxMTIuLjJmYTExMjlmOTZkNiAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2NyeXB0by92aXJ0aW8vdmlydGlvX2NyeXB0b19hbGdzLmMKPiAr
KysgYi9kcml2ZXJzL2NyeXB0by92aXJ0aW8vdmlydGlvX2NyeXB0b19hbGdzLmMKPiBAQCAtMzU5
LDggKzM1OSwxNCBAQCBfX3ZpcnRpb19jcnlwdG9fc2tjaXBoZXJfZG9fcmVxKHN0cnVjdCB2aXJ0
aW9fY3J5cHRvX3N5bV9yZXF1ZXN0ICp2Y19zeW1fcmVxLAo+ICAgCXVuc2lnbmVkIGludCBudW1f
b3V0ID0gMCwgbnVtX2luID0gMDsKPiAgIAlpbnQgc2dfdG90YWw7Cj4gICAJdWludDhfdCAqaXY7
Cj4gKwlzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNnOwo+ICAgCj4gICAJc3JjX25lbnRzID0gc2dfbmVu
dHNfZm9yX2xlbihyZXEtPnNyYywgcmVxLT5jcnlwdGxlbik7Cj4gKwlpZiAoc3JjX25lbnRzIDwg
MCkgewo+ICsJCXByX2VycigiSW52YWxpZCBudW1iZXIgb2Ygc3JjIFNHLlxuIik7Cj4gKwkJcmV0
dXJuIHNyY19uZW50czsKPiArCX0KPiArCj4gICAJZHN0X25lbnRzID0gc2dfbmVudHMocmVxLT5k
c3QpOwo+ICAgCj4gICAJcHJfZGVidWcoInZpcnRpb19jcnlwdG86IE51bWJlciBvZiBzZ3MgKHNy
Y19uZW50czogJWQsIGRzdF9uZW50czogJWQpXG4iLAo+IEBAIC00NDYsMTIgKzQ1MiwxMiBAQCBf
X3ZpcnRpb19jcnlwdG9fc2tjaXBoZXJfZG9fcmVxKHN0cnVjdCB2aXJ0aW9fY3J5cHRvX3N5bV9y
ZXF1ZXN0ICp2Y19zeW1fcmVxLAo+ICAgCXZjX3N5bV9yZXEtPml2ID0gaXY7Cj4gICAKPiAgIAkv
KiBTb3VyY2UgZGF0YSAqLwo+IC0JZm9yIChpID0gMDsgaSA8IHNyY19uZW50czsgaSsrKQo+IC0J
CXNnc1tudW1fb3V0KytdID0gJnJlcS0+c3JjW2ldOwo+ICsJZm9yIChzZyA9IHJlcS0+c3JjLCBp
ID0gMDsgc2cgJiYgaSA8IHNyY19uZW50czsgc2cgPSBzZ19uZXh0KHNnKSwgaSsrKQoKCkFueSBy
ZWFzb24gc2cgaXMgY2hlY2tlZCBoZXJlPwoKSSBiZWxpZXZlIGl0IHNob3VsZCBiZSBjaGVja2Vk
IGluIHNnX25lbnRzX2Zvcl9sZW4oKS4KCgo+ICsJCXNnc1tudW1fb3V0KytdID0gc2c7Cj4gICAK
PiAgIAkvKiBEZXN0aW5hdGlvbiBkYXRhICovCj4gLQlmb3IgKGkgPSAwOyBpIDwgZHN0X25lbnRz
OyBpKyspCj4gLQkJc2dzW251bV9vdXQgKyBudW1faW4rK10gPSAmcmVxLT5kc3RbaV07Cj4gKwlm
b3IgKHNnID0gcmVxLT5kc3QsIGkgPSAwOyBzZyAmJiBpIDwgZHN0X25lbnRzOyBzZyA9IHNnX25l
eHQoc2cpLCBpKyspCj4gKwkJc2dzW251bV9vdXQgKyBudW1faW4rK10gPSBzZzsKCgpJIGJlbGll
dmUgc2cgc2hvdWxkIGJlIGNoZWNrZWQgaW4gc2dfbmVudHMoKS4KClRoYW5rcwoKCj4gICAKPiAg
IAkvKiBTdGF0dXMgKi8KPiAgIAlzZ19pbml0X29uZSgmc3RhdHVzX3NnLCAmdmNfcmVxLT5zdGF0
dXMsIHNpemVvZih2Y19yZXEtPnN0YXR1cykpOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxp
emF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
