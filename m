Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD5A366398
	for <lists.virtualization@lfdr.de>; Wed, 21 Apr 2021 04:19:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BD8D83DC7;
	Wed, 21 Apr 2021 02:19:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nU1oUrIKap35; Wed, 21 Apr 2021 02:19:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F56883DC6;
	Wed, 21 Apr 2021 02:19:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EE2DDC000B;
	Wed, 21 Apr 2021 02:19:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EAC03C000B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Apr 2021 02:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D774D83D9C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Apr 2021 02:19:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kjsXnfMuIIrz
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Apr 2021 02:18:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5FCFF83D9A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Apr 2021 02:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618971537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9yVWRiTHEeiJqibXK+e+btFkthskENsxGNffKLisiss=;
 b=cdElWFCe467FXfLw114D55njFCKCMRkvU7SolYzuz5WHiuBEVfo7hHfsVsQtlDeKjO+7IB
 pnV5dLxsz1eXASrBRL/NiDWafmeG9/RQyXxehudOPky60mE3eacdm/vWvu0MYPKM9Gw1gY
 NH6gdr1yKUTdInkXaBSQMeagqjudIVk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-mztFxCmlM0KYyf41_JgvWQ-1; Tue, 20 Apr 2021 22:18:53 -0400
X-MC-Unique: mztFxCmlM0KYyf41_JgvWQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D86D8189CE;
 Wed, 21 Apr 2021 02:18:51 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-189.pek2.redhat.com
 [10.72.13.189])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8EDDE5032C;
 Wed, 21 Apr 2021 02:18:45 +0000 (UTC)
Subject: Re: [PATCH net-next] virtio-net: restrict build_skb() use to some
 arches
To: Eric Dumazet <eric.dumazet@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
References: <20210420200144.4189597-1-eric.dumazet@gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <179b050d-52b0-7201-9b1c-702d0978d496@redhat.com>
Date: Wed, 21 Apr 2021 10:18:43 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210420200144.4189597-1-eric.dumazet@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, netdev <netdev@vger.kernel.org>,
 virtualization@lists.linux-foundation.org, Eric Dumazet <edumazet@google.com>,
 Guenter Roeck <linux@roeck-us.net>
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

CtTaIDIwMjEvNC8yMSDJz87nNDowMSwgRXJpYyBEdW1hemV0INC0tcA6Cj4gRnJvbTogRXJpYyBE
dW1hemV0IDxlZHVtYXpldEBnb29nbGUuY29tPgo+Cj4gYnVpbGRfc2tiKCkgaXMgc3VwcG9zZWQg
dG8gYmUgZm9sbG93ZWQgYnkKPiBza2JfcmVzZXJ2ZShza2IsIE5FVF9JUF9BTElHTiksIHNvIHRo
YXQgSVAgaGVhZGVycyBhcmUgd29yZC1hbGlnbmVkLgo+IChCZXN0IHByYWN0aWNlIGlzIHRvIHJl
c2VydmUgTkVUX0lQX0FMSUdOK05FVF9TS0JfUEFELCBidXQgdGhlIE5FVF9TS0JfUEFECj4gcGFy
dCBpcyBvbmx5IGEgcGVyZm9ybWFuY2Ugb3B0aW1pemF0aW9uIGlmIHR1bm5lbCBlbmNhcHMgYXJl
IGFkZGVkLikKPgo+IFVuZm9ydHVuYXRlbHkgdmlydGlvX25ldCBoYXMgbm90IHByb3Zpc2lvbmVk
IHRoaXMgcmVzZXJ2ZS4KPiBXZSBjYW4gb25seSB1c2UgYnVpbGRfc2tiKCkgZm9yIGFyY2hlcyB3
aGVyZSBORVRfSVBfQUxJR04gPT0gMAo+Cj4gV2UgbWlnaHQgcmVmaW5lIHRoaXMgbGF0ZXIsIHdp
dGggZW5vdWdoIHRlc3RpbmcuCj4KPiBGaXhlczogZmIzMjg1NmIxNmFkICgidmlydGlvLW5ldDog
cGFnZV90b19za2IoKSB1c2UgYnVpbGRfc2tiIHdoZW4gdGhlcmUncyBzdWZmaWNpZW50IHRhaWxy
b29tIikKPiBTaWduZWQtb2ZmLWJ5OiBFcmljIER1bWF6ZXQgPGVkdW1hemV0QGdvb2dsZS5jb20+
Cj4gUmVwb3J0ZWQtYnk6IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4KPiBDYzog
WHVhbiBaaHVvIDx4dWFuemh1b0BsaW51eC5hbGliYWJhLmNvbT4KPiBDYzogSmFzb24gV2FuZyA8
amFzb3dhbmdAcmVkaGF0LmNvbT4KPiBDYzogIk1pY2hhZWwgUy4gVHNpcmtpbiIgPG1zdEByZWRo
YXQuY29tPgo+IENjOiB2aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwoK
CkFja2VkLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgoKCj4gLS0tCj4gICBk
cml2ZXJzL25ldC92aXJ0aW9fbmV0LmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC92aXJ0
aW9fbmV0LmMgYi9kcml2ZXJzL25ldC92aXJ0aW9fbmV0LmMKPiBpbmRleCAyZTI4YzA0YWE2MzUx
ZDJiNDAxNmY3ZDI3N2NlMTA0YzQ5NzAwNjlkLi43NGQyZDQ5MjY0ZjNmM2I3MDM5YmU3MDMzMWQ0
YTQ0YzUzYjhjYzI4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L3ZpcnRpb19uZXQuYwo+ICsr
KyBiL2RyaXZlcnMvbmV0L3ZpcnRpb19uZXQuYwo+IEBAIC00MTYsNyArNDE2LDcgQEAgc3RhdGlj
IHN0cnVjdCBza19idWZmICpwYWdlX3RvX3NrYihzdHJ1Y3QgdmlydG5ldF9pbmZvICp2aSwKPiAg
IAo+ICAgCXNoaW5mb19zaXplID0gU0tCX0RBVEFfQUxJR04oc2l6ZW9mKHN0cnVjdCBza2Jfc2hh
cmVkX2luZm8pKTsKPiAgIAo+IC0JaWYgKGxlbiA+IEdPT0RfQ09QWV9MRU4gJiYgdGFpbHJvb20g
Pj0gc2hpbmZvX3NpemUpIHsKPiArCWlmICghTkVUX0lQX0FMSUdOICYmIGxlbiA+IEdPT0RfQ09Q
WV9MRU4gJiYgdGFpbHJvb20gPj0gc2hpbmZvX3NpemUpIHsKPiAgIAkJc2tiID0gYnVpbGRfc2ti
KHAsIHRydWVzaXplKTsKPiAgIAkJaWYgKHVubGlrZWx5KCFza2IpKQo+ICAgCQkJcmV0dXJuIE5V
TEw7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0
dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRh
dGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGlu
Zm8vdmlydHVhbGl6YXRpb24=
