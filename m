Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 765BA35C1C1
	for <lists.virtualization@lfdr.de>; Mon, 12 Apr 2021 11:45:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 728B840201;
	Mon, 12 Apr 2021 09:45:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eXyFmc2KwNTw; Mon, 12 Apr 2021 09:45:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4EE14032E;
	Mon, 12 Apr 2021 09:45:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 73DBBC000A;
	Mon, 12 Apr 2021 09:45:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4A75C000A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 09:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96D266085E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 09:45:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i-5DjlGOC-Su
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 09:45:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1253C606AF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 09:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618220747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VIbjcuPC8N7M+c8siBXb+nqnEmaj8al3DwWSW085yH4=;
 b=PBzuwSremJ9F+Q7mRYN7UoMS9iIiCKhALmWRlJDd1lKv2XKNQs7q1JWsnpGCHEkSA7lPOp
 BIpQ31PDXNPGDyyt3UrGFfedL0S9y4GaG1IF2r1UqsfGk5uI0Vlygoe+9b6q07TIeW2eOg
 r4WNX56L5cQl3VHUzq5X6UbE7BKlWbQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-HQjvhX-LOsmrxNMG3pSHew-1; Mon, 12 Apr 2021 05:45:44 -0400
X-MC-Unique: HQjvhX-LOsmrxNMG3pSHew-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE1B66415B;
 Mon, 12 Apr 2021 09:45:42 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-232.pek2.redhat.com
 [10.72.13.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 761635C26D;
 Mon, 12 Apr 2021 09:45:36 +0000 (UTC)
Subject: Re: [PATCH] vdpa/mlx5: Set err = -ENOMEM in case dma_map_sg_attrs
 fails
To: Eli Cohen <elic@nvidia.com>, mst@redhat.com, si-wei.liu@oracle.com,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
References: <20210411083646.910546-1-elic@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <427b1f96-9e41-a1e3-1ce5-09fc38799e69@redhat.com>
Date: Mon, 12 Apr 2021 17:45:34 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210411083646.910546-1-elic@nvidia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

CtTaIDIwMjEvNC8xMSDPws7nNDozNiwgRWxpIENvaGVuINC0tcA6Cj4gU2V0IGVyciA9IC1FTk9N
RU0gaWYgZG1hX21hcF9zZ19hdHRycygpIGZhaWxzIHNvIHRoZSBmdW5jdGlvbiByZXV0cm5zCj4g
ZXJyb3IuCj4KPiBGaXhlczogOTRhYmJjY2RmMjkxICgidmRwYS9tbHg1OiBBZGQgc2hhcmVkIG1l
bW9yeSByZWdpc3RyYXRpb24gY29kZSIpCj4gU2lnbmVkLW9mZi1ieTogRWxpIENvaGVuIDxlbGlj
QG52aWRpYS5jb20+Cj4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwu
Y29tPgo+IFJlcG9ydGVkLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5j
b20+Cj4gLS0tCj4gICBkcml2ZXJzL3ZkcGEvbWx4NS9jb3JlL21yLmMgfCA0ICsrKy0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3ZkcGEvbWx4NS9jb3JlL21yLmMgYi9kcml2ZXJzL3ZkcGEvbWx4NS9jb3Jl
L21yLmMKPiBpbmRleCAzOTA4ZmYyOGVlYzAuLjgwMGNmZDE5NjdhZCAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL3ZkcGEvbWx4NS9jb3JlL21yLmMKPiArKysgYi9kcml2ZXJzL3ZkcGEvbWx4NS9jb3Jl
L21yLmMKPiBAQCAtMjc4LDggKzI3OCwxMCBAQCBzdGF0aWMgaW50IG1hcF9kaXJlY3RfbXIoc3Ry
dWN0IG1seDVfdmRwYV9kZXYgKm12ZGV2LCBzdHJ1Y3QgbWx4NV92ZHBhX2RpcmVjdF9tcgo+ICAg
CW1yLT5sb2dfc2l6ZSA9IGxvZ19lbnRpdHlfc2l6ZTsKPiAgIAltci0+bnNnID0gbnNnOwo+ICAg
CW1yLT5uZW50ID0gZG1hX21hcF9zZ19hdHRycyhkbWEsIG1yLT5zZ19oZWFkLnNnbCwgbXItPm5z
ZywgRE1BX0JJRElSRUNUSU9OQUwsIDApOwo+IC0JaWYgKCFtci0+bmVudCkKPiArCWlmICghbXIt
Pm5lbnQpIHsKPiArCQllcnIgPSAtRU5PTUVNOwo+ICAgCQlnb3RvIGVycl9tYXA7Cj4gKwl9Cj4g
ICAKPiAgIAllcnIgPSBjcmVhdGVfZGlyZWN0X21yKG12ZGV2LCBtcik7Cj4gICAJaWYgKGVycikK
CgpBY2tlZC1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWls
aW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6
Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRp
b24=
