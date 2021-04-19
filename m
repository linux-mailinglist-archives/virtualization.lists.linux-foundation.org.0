Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 555173639AC
	for <lists.virtualization@lfdr.de>; Mon, 19 Apr 2021 05:18:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1766606D6;
	Mon, 19 Apr 2021 03:18:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hGrdnfgmWLsa; Mon, 19 Apr 2021 03:18:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 941D36072C;
	Mon, 19 Apr 2021 03:18:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 328CEC000B;
	Mon, 19 Apr 2021 03:18:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D028AC000B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Apr 2021 03:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEB628355F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Apr 2021 03:17:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DEYxKCTlQx72
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Apr 2021 03:17:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B450B83503
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Apr 2021 03:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618802274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kqu7b/R1y+iNn3LQCUv3CxvSNt0vkP4D2ZFqD/1uXRc=;
 b=NsnZjA7fXzZwod00f67khSsDshqryxARWrK9NXHpm6tNDVVsyDmdJfNlKyYLW/M3OnyWEl
 TnPoSMTf5Dz16llejaHGd5nMjZM9xY8Z6B4qV57V5D6aNpDM9tkdlz/S14ji8EEEhgoOU1
 x/AIdKoqgwxq4z3eBtWbvNiAf1UM10M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-yl9jzV4EMmCooe1ydXK_hg-1; Sun, 18 Apr 2021 23:17:50 -0400
X-MC-Unique: yl9jzV4EMmCooe1ydXK_hg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 741A5100A605;
 Mon, 19 Apr 2021 03:17:49 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-157.pek2.redhat.com
 [10.72.12.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 13C0519C66;
 Mon, 19 Apr 2021 03:17:41 +0000 (UTC)
Subject: Re: [PATCH V3 3/3] vDPA/ifcvf: get_config_size should return dev
 specific config size
To: Zhu Lingshan <lingshan.zhu@intel.com>, mst@redhat.com, lulu@redhat.com,
 sgarzare@redhat.com
References: <20210416071628.4984-1-lingshan.zhu@intel.com>
 <20210416071628.4984-4-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c1afa91f-b0a1-9ea8-8827-a0920a26f16e@redhat.com>
Date: Mon, 19 Apr 2021 11:17:40 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210416071628.4984-4-lingshan.zhu@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

CtTaIDIwMjEvNC8xNiDPws7nMzoxNiwgWmh1IExpbmdzaGFuINC0tcA6Cj4gZ2V0X2NvbmZpZ19z
aXplKCkgc2hvdWxkIHJldHVybiB0aGUgc2l6ZSBiYXNlZCBvbiB0aGUgZGVjZWN0ZWQKPiBkZXZp
Y2UgdHlwZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFpodSBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGlu
dGVsLmNvbT4KCgpBY2tlZC1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KCgo+
IC0tLQo+ICAgZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYyB8IDE5ICsrKysrKysrKysr
KysrKysrKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYyBiL2Ry
aXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9tYWluLmMKPiBpbmRleCAzNzZiMjAxNDkxNmEuLjNiNmY3
ODYyZGJiOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5jCj4g
KysrIGIvZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYwo+IEBAIC0zNTYsNyArMzU2LDI0
IEBAIHN0YXRpYyB1MzIgaWZjdmZfdmRwYV9nZXRfdnFfYWxpZ24oc3RydWN0IHZkcGFfZGV2aWNl
ICp2ZHBhX2RldikKPiAgIAo+ICAgc3RhdGljIHNpemVfdCBpZmN2Zl92ZHBhX2dldF9jb25maWdf
c2l6ZShzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkcGFfZGV2KQo+ICAgewo+IC0JcmV0dXJuIHNpemVv
ZihzdHJ1Y3QgdmlydGlvX25ldF9jb25maWcpOwo+ICsJc3RydWN0IGlmY3ZmX2FkYXB0ZXIgKmFk
YXB0ZXIgPSB2ZHBhX3RvX2FkYXB0ZXIodmRwYV9kZXYpOwo+ICsJc3RydWN0IGlmY3ZmX2h3ICp2
ZiA9IHZkcGFfdG9fdmYodmRwYV9kZXYpOwo+ICsJc3RydWN0IHBjaV9kZXYgKnBkZXYgPSBhZGFw
dGVyLT5wZGV2Owo+ICsJc2l6ZV90IHNpemU7Cj4gKwo+ICsJc3dpdGNoICh2Zi0+ZGV2X3R5cGUp
IHsKPiArCWNhc2UgVklSVElPX0lEX05FVDoKPiArCQlzaXplID0gc2l6ZW9mKHN0cnVjdCB2aXJ0
aW9fbmV0X2NvbmZpZyk7Cj4gKwkJYnJlYWs7Cj4gKwljYXNlIFZJUlRJT19JRF9CTE9DSzoKPiAr
CQlzaXplID0gc2l6ZW9mKHN0cnVjdCB2aXJ0aW9fYmxrX2NvbmZpZyk7Cj4gKwkJYnJlYWs7Cj4g
KwlkZWZhdWx0Ogo+ICsJCXNpemUgPSAwOwo+ICsJCUlGQ1ZGX0VSUihwZGV2LCAiVklSVElPIElE
ICV1IG5vdCBzdXBwb3J0ZWRcbiIsIHZmLT5kZXZfdHlwZSk7Cj4gKwl9Cj4gKwo+ICsJcmV0dXJu
IHNpemU7Cj4gICB9Cj4gICAKPiAgIHN0YXRpYyB2b2lkIGlmY3ZmX3ZkcGFfZ2V0X2NvbmZpZyhz
dHJ1Y3QgdmRwYV9kZXZpY2UgKnZkcGFfZGV2LAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxp
emF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
