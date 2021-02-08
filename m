Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C8F3129AA
	for <lists.virtualization@lfdr.de>; Mon,  8 Feb 2021 05:15:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E985220009;
	Mon,  8 Feb 2021 04:15:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hZU5hohJoMY7; Mon,  8 Feb 2021 04:15:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3DAE820027;
	Mon,  8 Feb 2021 04:15:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 157EFC013A;
	Mon,  8 Feb 2021 04:15:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 932DEC013A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 04:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 87E8985621
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 04:15:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aHsZTUBM8qdt
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 04:15:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B81A88561E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 04:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612757751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tgeC64i1kjNEGNpncvkRVMjI5koc16zoFV1Q6tI8jiI=;
 b=UsVXf0IzqfuE6uJFnsamqNdAdKe23a7I9pDeMfE7Yr09PedV4TaOLx19y24/tG+TMtEQ6I
 KR37f4h8wdDENcY/E5bn6YIBiOj04OOmc6Y6c4KqDeGpeyFvNW5tvCWUOPfJw9P00V5o4i
 hYjkPmNMpnQO6bIeJv/eNYwKQm1+38M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-gI7zhTsbOQ63T7BN92t-zw-1; Sun, 07 Feb 2021 23:15:47 -0500
X-MC-Unique: gI7zhTsbOQ63T7BN92t-zw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7302B192D785;
 Mon,  8 Feb 2021 04:15:46 +0000 (UTC)
Received: from [10.72.13.185] (ovpn-13-185.pek2.redhat.com [10.72.13.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32E935D9C6;
 Mon,  8 Feb 2021 04:15:40 +0000 (UTC)
Subject: Re: [PATCH V3 18/19] virtio_vdpa: don't warn when fail to disable vq
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20210104065503.199631-1-jasowang@redhat.com>
 <20210104065503.199631-19-jasowang@redhat.com>
 <20210205102442-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <2911e3c2-84ff-006a-24ba-fb6aea9d25d5@redhat.com>
Date: Mon, 8 Feb 2021 12:15:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210205102442-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: shahafs@mellanox.com, lulu@redhat.com, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjEvMi81IOS4i+WNiDExOjI0LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
TW9uLCBKYW4gMDQsIDIwMjEgYXQgMDI6NTU6MDJQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gVGhlcmUncyBubyBndWFyYW50ZWUgdGhhdCB0aGUgZGV2aWNlIGNhbiBkaXNhYmxlIGEgc3Bl
Y2lmaWMgdmlydHF1ZXVlCj4+IHRocm91Z2ggc2V0X3ZxX3JlYWR5KCkuIE9uZSBleGFtcGxlIGlz
IHRoZSBtb2Rlcm4gdmlydGlvLXBjaQo+PiBkZXZpY2UuIFNvIHRoaXMgcGF0Y2ggcmVtb3ZlcyB0
aGUgd2FybmluZy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVk
aGF0LmNvbT4KPgo+IERvIHdlIG5lZWQgdGhlIHJlYWQgYXMgYSBraW5kIG9mIGZsdXNoIHRob3Vn
aD8KCgpUaGUgcHJvYmxlbSBpcyB0aGF0IFBDSSBmb3JiaWRzIHdyaXRlIDAgdG8gcXVldWVfZW5h
YmxlLiBTbyBJJ20gbm90IHN1cmUgCndoYXQga2luZCBvZiBmbHVzaCBkbyB3ZSBuZWVkIGhlcmU/
CgpUaGFua3MKCgo+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvdmlydGlvL3ZpcnRpb192ZHBhLmMgfCAz
ICstLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkK
Pj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlydGlvL3ZpcnRpb192ZHBhLmMgYi9kcml2ZXJz
L3ZpcnRpby92aXJ0aW9fdmRwYS5jCj4+IGluZGV4IDRhOWRkYjQ0YjJhNy4uZTI4YWNmNDgyZTBj
IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fdmRwYS5jCj4+ICsrKyBiL2Ry
aXZlcnMvdmlydGlvL3ZpcnRpb192ZHBhLmMKPj4gQEAgLTIyNSw5ICsyMjUsOCBAQCBzdGF0aWMg
dm9pZCB2aXJ0aW9fdmRwYV9kZWxfdnEoc3RydWN0IHZpcnRxdWV1ZSAqdnEpCj4+ICAgCWxpc3Rf
ZGVsKCZpbmZvLT5ub2RlKTsKPj4gICAJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmdmRfZGV2LT5s
b2NrLCBmbGFncyk7Cj4+ICAgCj4+IC0JLyogU2VsZWN0IGFuZCBkZWFjdGl2YXRlIHRoZSBxdWV1
ZSAqLwo+PiArCS8qIFNlbGVjdCBhbmQgZGVhY3RpdmF0ZSB0aGUgcXVldWUgKGJlc3QgZWZmb3J0
KSAqLwo+PiAgIAlvcHMtPnNldF92cV9yZWFkeSh2ZHBhLCBpbmRleCwgMCk7Cj4+IC0JV0FSTl9P
TihvcHMtPmdldF92cV9yZWFkeSh2ZHBhLCBpbmRleCkpOwo+PiAgIAo+PiAgIAl2cmluZ19kZWxf
dmlydHF1ZXVlKHZxKTsKPj4gICAKPj4gLS0gCj4+IDIuMjUuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0
ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
