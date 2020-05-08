Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A30D1CA49F
	for <lists.virtualization@lfdr.de>; Fri,  8 May 2020 08:57:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D4B8787A2F;
	Fri,  8 May 2020 06:57:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IEEHciFOrmZj; Fri,  8 May 2020 06:57:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4DD3A875B3;
	Fri,  8 May 2020 06:57:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 40329C07FF;
	Fri,  8 May 2020 06:57:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4FD06C07FF
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 May 2020 06:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3DEAC875E0
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 May 2020 06:57:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y-jaC-M-t2Av
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 May 2020 06:57:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4B24C875B3
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 May 2020 06:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588921059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j5ntPciZTCWKN64isoisXBbo/H8iuO4xx8/GM0cAie0=;
 b=JbO0oV0YtyTGbckiayIj+uzv1NtemOWqyFGF3Nw7G5dKhrtUYxHfkVMC/7dr+TmQP8K/is
 qcs/8GjP5SoK54X/X7zsl2Y+msdJrtZqMmU23j/RCdgqqaFzfaKnS+P2mOe7IzUnvbH3S2
 C0mROx/0GH0FL6/XnjDqFt5lHxN4yLU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-hxsoD0k8MXyIsvWBEEnnQg-1; Fri, 08 May 2020 02:57:35 -0400
X-MC-Unique: hxsoD0k8MXyIsvWBEEnnQg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2BA180183C;
 Fri,  8 May 2020 06:57:33 +0000 (UTC)
Received: from [10.72.13.98] (ovpn-13-98.pek2.redhat.com [10.72.13.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C426B5D9CC;
 Fri,  8 May 2020 06:57:29 +0000 (UTC)
Subject: Re: [PATCH -next] vdpasim: remove unused variable 'ret'
To: "Michael S. Tsirkin" <mst@redhat.com>, YueHaibing <yuehaibing@huawei.com>
References: <20200410115422.42308-1-yuehaibing@huawei.com>
 <20200505203544-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f832450b-03f8-b5b6-76ae-c5c0fe5f2fdb@redhat.com>
Date: Fri, 8 May 2020 14:57:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200505203544-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjAvNS82IOS4iuWNiDg6MzUsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBG
cmksIEFwciAxMCwgMjAyMCBhdCAwNzo1NDoyMlBNICswODAwLCBZdWVIYWliaW5nIHdyb3RlOgo+
PiBkcml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW0uYzo5Mjo2OiB3YXJuaW5nOgo+PiAgIHZh
cmlhYmxlIOKAmHJldOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlh
YmxlXQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5j
b20+Cj4+IC0tLQo+IEVpdGhlciB0aGlzLCBvciBCVUdfT04uICBKYXNvbj8KCgpCVUdfT04gc2Vl
bXMgdG9vIGFnZ3Jlc3NpdmUuIFNvIEkgcHJlZmVyIHRoaXMgcGF0Y2guCgpBY2tlZC1ieTogSmFz
b24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KCgo+Cj4+ICAgZHJpdmVycy92ZHBhL3ZkcGFf
c2ltL3ZkcGFfc2ltLmMgfCAxNSArKysrKysrLS0tLS0tLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwg
NyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92ZHBhL3ZkcGFfc2ltL3ZkcGFfc2ltLmMgYi9kcml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9z
aW0uYwo+PiBpbmRleCA3OTU3ZDJkNDFmYzQuLjAxYzQ1NmY3YzFmNyAxMDA2NDQKPj4gLS0tIGEv
ZHJpdmVycy92ZHBhL3ZkcGFfc2ltL3ZkcGFfc2ltLmMKPj4gKysrIGIvZHJpdmVycy92ZHBhL3Zk
cGFfc2ltL3ZkcGFfc2ltLmMKPj4gQEAgLTg5LDE1ICs4OSwxNCBAQCBzdGF0aWMgc3RydWN0IHZk
cGFzaW0gKmRldl90b19zaW0oc3RydWN0IGRldmljZSAqZGV2KQo+PiAgIHN0YXRpYyB2b2lkIHZk
cGFzaW1fcXVldWVfcmVhZHkoc3RydWN0IHZkcGFzaW0gKnZkcGFzaW0sIHVuc2lnbmVkIGludCBp
ZHgpCj4+ICAgewo+PiAgIAlzdHJ1Y3QgdmRwYXNpbV92aXJ0cXVldWUgKnZxID0gJnZkcGFzaW0t
PnZxc1tpZHhdOwo+PiAtCWludCByZXQ7Cj4+ICAgCj4+IC0JcmV0ID0gdnJpbmdoX2luaXRfaW90
bGIoJnZxLT52cmluZywgdmRwYXNpbV9mZWF0dXJlcywKPj4gLQkJCQlWRFBBU0lNX1FVRVVFX01B
WCwgZmFsc2UsCj4+IC0JCQkJKHN0cnVjdCB2cmluZ19kZXNjICopKHVpbnRwdHJfdCl2cS0+ZGVz
Y19hZGRyLAo+PiAtCQkJCShzdHJ1Y3QgdnJpbmdfYXZhaWwgKikKPj4gLQkJCQkodWludHB0cl90
KXZxLT5kcml2ZXJfYWRkciwKPj4gLQkJCQkoc3RydWN0IHZyaW5nX3VzZWQgKikKPj4gLQkJCQko
dWludHB0cl90KXZxLT5kZXZpY2VfYWRkcik7Cj4+ICsJdnJpbmdoX2luaXRfaW90bGIoJnZxLT52
cmluZywgdmRwYXNpbV9mZWF0dXJlcywKPj4gKwkJCSAgVkRQQVNJTV9RVUVVRV9NQVgsIGZhbHNl
LAo+PiArCQkJICAoc3RydWN0IHZyaW5nX2Rlc2MgKikodWludHB0cl90KXZxLT5kZXNjX2FkZHIs
Cj4+ICsJCQkgIChzdHJ1Y3QgdnJpbmdfYXZhaWwgKikKPj4gKwkJCSAgKHVpbnRwdHJfdCl2cS0+
ZHJpdmVyX2FkZHIsCj4+ICsJCQkgIChzdHJ1Y3QgdnJpbmdfdXNlZCAqKQo+PiArCQkJICAodWlu
dHB0cl90KXZxLT5kZXZpY2VfYWRkcik7Cj4+ICAgfQo+PiAgIAo+PiAgIHN0YXRpYyB2b2lkIHZk
cGFzaW1fdnFfcmVzZXQoc3RydWN0IHZkcGFzaW1fdmlydHF1ZXVlICp2cSkKPj4gLS0gCj4+IDIu
MTcuMQo+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3ZpcnR1YWxpemF0aW9u
