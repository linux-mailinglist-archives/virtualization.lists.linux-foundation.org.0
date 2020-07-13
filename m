Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A8721CDCD
	for <lists.virtualization@lfdr.de>; Mon, 13 Jul 2020 05:35:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 99F218720A;
	Mon, 13 Jul 2020 03:35:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dGswlzuvpcEO; Mon, 13 Jul 2020 03:35:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2DB55871FB;
	Mon, 13 Jul 2020 03:35:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 08F0BC0733;
	Mon, 13 Jul 2020 03:35:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B1653C0733
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 03:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8907521FAD
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 03:35:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NBrdanixYhGd
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 03:35:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id EEE39204B9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 03:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594611303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MEz69PaaqgAlR8wzuF7Cwup3jj6XAPARgQbOCVhmOI4=;
 b=MZe+axczCl+6Exkn+dUBAMVf5SDdncx+tfKl0hZdVnFEpNiHqK4IqkP+/83h02963EgiIx
 w4xBFl0tpI4g8WnVEAB7UvqaksxRyg2zUUlVioE3Q/irHaOaEXxOnGk8LWpxkhKvNLzL5E
 Mb8PJIiIEbI7LkIiQAYehWelaIj6TCg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-Gdj5sj8lO7iapfasuFQEow-1; Sun, 12 Jul 2020 23:35:01 -0400
X-MC-Unique: Gdj5sj8lO7iapfasuFQEow-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32F8D1080;
 Mon, 13 Jul 2020 03:35:00 +0000 (UTC)
Received: from [10.72.13.177] (ovpn-13-177.pek2.redhat.com [10.72.13.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3260E5C298;
 Mon, 13 Jul 2020 03:34:55 +0000 (UTC)
Subject: Re: [PATCH] virtio_ring: sparse warning fixup
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20200710104900.406084-1-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <64117f46-6cad-afd0-7753-1636d6474731@redhat.com>
Date: Mon, 13 Jul 2020 11:34:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200710104900.406084-1-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

Ck9uIDIwMjAvNy8xMCDkuIvljYg2OjQ5LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gdmly
dGlvX3N0b3JlX21iIHdhcyBidWlsdCB3aXRoIHNwbGl0IHJpbmcgaW4gbWluZCBzbyBpdCBhY2Nl
cHRzCj4gX192aXJ0aW8xNiBhcmd1bWVudHMuIFBhY2tlZCByaW5nIHVzZXMgX19sZTE2IHZhbHVl
cywgc28gc3BhcnNlCj4gY29tcGxhaW5zLiAgSXQncyBqdXN0IGEgc3RvcmUgd2l0aCBzb21lIGJh
cnJpZXJzIHNvIGxldCdzIGNvbnZlcnQgaXQgdG8KPiBhIG1hY3JvLCB3ZSBkb24ndCBsb29zZSB0
b28gbXVjaCB0eXBlIHNhZmV0eSBieSBkb2luZyB0aGF0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogTWlj
aGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4KPiAtLS0KPiAgIGluY2x1ZGUvbGludXgv
dmlydGlvX3JpbmcuaCB8IDE5ICsrKysrKysrKy0tLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCA5IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvdmlydGlvX3JpbmcuaCBiL2luY2x1ZGUvbGludXgvdmlydGlvX3JpbmcuaAo+IGlu
ZGV4IDNkYzcwYWRmZTVmNS4uYjQ4NWIxM2ZhNTBiIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGlu
dXgvdmlydGlvX3JpbmcuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvdmlydGlvX3JpbmcuaAo+IEBA
IC00NiwxNiArNDYsMTUgQEAgc3RhdGljIGlubGluZSB2b2lkIHZpcnRpb193bWIoYm9vbCB3ZWFr
X2JhcnJpZXJzKQo+ICAgCQlkbWFfd21iKCk7Cj4gICB9Cj4gICAKPiAtc3RhdGljIGlubGluZSB2
b2lkIHZpcnRpb19zdG9yZV9tYihib29sIHdlYWtfYmFycmllcnMsCj4gLQkJCQkgICBfX3ZpcnRp
bzE2ICpwLCBfX3ZpcnRpbzE2IHYpCj4gLXsKPiAtCWlmICh3ZWFrX2JhcnJpZXJzKSB7Cj4gLQkJ
dmlydF9zdG9yZV9tYigqcCwgdik7Cj4gLQl9IGVsc2Ugewo+IC0JCVdSSVRFX09OQ0UoKnAsIHYp
Owo+IC0JCW1iKCk7Cj4gLQl9Cj4gLX0KPiArI2RlZmluZSB2aXJ0aW9fc3RvcmVfbWIod2Vha19i
YXJyaWVycywgcCwgdikgXAo+ICtkbyB7IFwKPiArCWlmICh3ZWFrX2JhcnJpZXJzKSB7IFwKPiAr
CQl2aXJ0X3N0b3JlX21iKCpwLCB2KTsgXAo+ICsJfSBlbHNlIHsgXAo+ICsJCVdSSVRFX09OQ0Uo
KnAsIHYpOyBcCj4gKwkJbWIoKTsgXAo+ICsJfSBcCj4gK30gd2hpbGUgKDApIFwKPiAgIAo+ICAg
c3RydWN0IHZpcnRpb19kZXZpY2U7Cj4gICBzdHJ1Y3QgdmlydHF1ZXVlOwoKCkFja2VkLWJ5OiBK
YXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0
dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4
Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
