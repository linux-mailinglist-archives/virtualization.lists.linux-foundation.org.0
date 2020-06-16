Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D991FA8BD
	for <lists.virtualization@lfdr.de>; Tue, 16 Jun 2020 08:23:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7137188904;
	Tue, 16 Jun 2020 06:23:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hJdcK8oAt3Un; Tue, 16 Jun 2020 06:23:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C062088CC7;
	Tue, 16 Jun 2020 06:23:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7984CC016E;
	Tue, 16 Jun 2020 06:23:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AE43FC016E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 06:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A0A3F8768F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 06:23:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1W-n4TE_VFXl
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 06:23:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BC4BB87513
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 06:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592288580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8VH7R/DoU62ut+esRu7Hjq7cJgKyK7i23Q0GKINZbgM=;
 b=U0HFqBptHCiEBtx0lwwVikXVIfTj+S2mOfZKNI/6XiX0TjipYM+gGGcn/z/FqhVXEybQdv
 j+vHjNXUEo19z6fdKXGmnBDG+LBzBldG6BcGh3VJPWkQP/a50MClIpWXh2s/kALdhgI+eS
 vIExBVKjXzuYdqLWG01o091dPj0gdas=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-dV-6KyFgPMiZJmzQP3PJeQ-1; Tue, 16 Jun 2020 02:22:58 -0400
X-MC-Unique: dV-6KyFgPMiZJmzQP3PJeQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 057271085945;
 Tue, 16 Jun 2020 06:22:57 +0000 (UTC)
Received: from [10.72.13.124] (ovpn-13-124.pek2.redhat.com [10.72.13.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72FE71001901;
 Tue, 16 Jun 2020 06:22:46 +0000 (UTC)
Subject: Re: [PATCH v2 1/1] s390: virtio: let arch accept devices without
 IOMMU feature
To: Pierre Morel <pmorel@linux.ibm.com>, linux-kernel@vger.kernel.org
References: <1592224764-1258-1-git-send-email-pmorel@linux.ibm.com>
 <1592224764-1258-2-git-send-email-pmorel@linux.ibm.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b45e321a-5acb-9be2-4cd6-ae75d7f78f05@redhat.com>
Date: Tue, 16 Jun 2020 14:22:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1592224764-1258-2-git-send-email-pmorel@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: linux-s390@vger.kernel.org, frankja@linux.ibm.com, kvm@vger.kernel.org,
 mst@redhat.com, cohuck@redhat.com, virtualization@lists.linux-foundation.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com
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

Ck9uIDIwMjAvNi8xNSDkuIvljYg4OjM5LCBQaWVycmUgTW9yZWwgd3JvdGU6Cj4gQW4gYXJjaGl0
ZWN0dXJlIHByb3RlY3RpbmcgdGhlIGd1ZXN0IG1lbW9yeSBhZ2FpbnN0IHVuYXV0aG9yaXplZCBo
b3N0Cj4gYWNjZXNzIG1heSB3YW50IHRvIGVuZm9yY2UgVklSVElPIEkvTyBkZXZpY2UgcHJvdGVj
dGlvbiB0aHJvdWdoIHRoZQo+IHVzZSBvZiBWSVJUSU9fRl9JT01NVV9QTEFURk9STS4KPgo+IExl
dCdzIGdpdmUgYSBjaGFuY2UgdG8gdGhlIGFyY2hpdGVjdHVyZSB0byBhY2NlcHQgb3Igbm90IGRl
dmljZXMKPiB3aXRob3V0IFZJUlRJT19GX0lPTU1VX1BMQVRGT1JNLgo+Cj4gU2lnbmVkLW9mZi1i
eTogUGllcnJlIE1vcmVsIDxwbW9yZWxAbGludXguaWJtLmNvbT4KCgpBY2tlZC1ieTogSmFzb24g
V2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KCgo+IC0tLQo+ICAgYXJjaC9zMzkwL21tL2luaXQu
YyAgICAgfCA2ICsrKysrKwo+ICAgZHJpdmVycy92aXJ0aW8vdmlydGlvLmMgfCA5ICsrKysrKysr
Kwo+ICAgaW5jbHVkZS9saW51eC92aXJ0aW8uaCAgfCAyICsrCj4gICAzIGZpbGVzIGNoYW5nZWQs
IDE3IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3MzOTAvbW0vaW5pdC5jIGIv
YXJjaC9zMzkwL21tL2luaXQuYwo+IGluZGV4IDg3YjJkMDI0ZTc1YS4uM2YwNGFkMDk2NTBmIDEw
MDY0NAo+IC0tLSBhL2FyY2gvczM5MC9tbS9pbml0LmMKPiArKysgYi9hcmNoL3MzOTAvbW0vaW5p
dC5jCj4gQEAgLTQ2LDYgKzQ2LDcgQEAKPiAgICNpbmNsdWRlIDxhc20va2FzYW4uaD4KPiAgICNp
bmNsdWRlIDxhc20vZG1hLW1hcHBpbmcuaD4KPiAgICNpbmNsdWRlIDxhc20vdXYuaD4KPiArI2lu
Y2x1ZGUgPGxpbnV4L3ZpcnRpby5oPgo+ICAgCj4gICBwZ2RfdCBzd2FwcGVyX3BnX2RpcltQVFJT
X1BFUl9QR0RdIF9fc2VjdGlvbiguYnNzLi5zd2FwcGVyX3BnX2Rpcik7Cj4gICAKPiBAQCAtMTYy
LDYgKzE2MywxMSBAQCBib29sIGZvcmNlX2RtYV91bmVuY3J5cHRlZChzdHJ1Y3QgZGV2aWNlICpk
ZXYpCj4gICAJcmV0dXJuIGlzX3Byb3RfdmlydF9ndWVzdCgpOwo+ICAgfQo+ICAgCj4gK2ludCBh
cmNoX25lZWRzX2lvbW11X3BsYXRmb3JtKHN0cnVjdCB2aXJ0aW9fZGV2aWNlICpkZXYpCj4gK3sK
PiArCXJldHVybiBpc19wcm90X3ZpcnRfZ3Vlc3QoKTsKPiArfQo+ICsKPiAgIC8qIHByb3RlY3Rl
ZCB2aXJ0dWFsaXphdGlvbiAqLwo+ICAgc3RhdGljIHZvaWQgcHZfaW5pdCh2b2lkKQo+ICAgewo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW8uYyBiL2RyaXZlcnMvdmlydGlvL3Zp
cnRpby5jCj4gaW5kZXggYTk3N2UzMmE4OGYyLi4zMDA5MTA4OWJlZTggMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy92aXJ0aW8vdmlydGlvLmMKPiArKysgYi9kcml2ZXJzL3ZpcnRpby92aXJ0aW8uYwo+
IEBAIC0xNjcsNiArMTY3LDExIEBAIHZvaWQgdmlydGlvX2FkZF9zdGF0dXMoc3RydWN0IHZpcnRp
b19kZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IHN0YXR1cykKPiAgIH0KPiAgIEVYUE9SVF9TWU1C
T0xfR1BMKHZpcnRpb19hZGRfc3RhdHVzKTsKPiAgIAo+ICtpbnQgX193ZWFrIGFyY2hfbmVlZHNf
aW9tbXVfcGxhdGZvcm0oc3RydWN0IHZpcnRpb19kZXZpY2UgKmRldikKPiArewo+ICsJcmV0dXJu
IDA7Cj4gK30KPiArCj4gICBpbnQgdmlydGlvX2ZpbmFsaXplX2ZlYXR1cmVzKHN0cnVjdCB2aXJ0
aW9fZGV2aWNlICpkZXYpCj4gICB7Cj4gICAJaW50IHJldCA9IGRldi0+Y29uZmlnLT5maW5hbGl6
ZV9mZWF0dXJlcyhkZXYpOwo+IEBAIC0xNzksNiArMTg0LDEwIEBAIGludCB2aXJ0aW9fZmluYWxp
emVfZmVhdHVyZXMoc3RydWN0IHZpcnRpb19kZXZpY2UgKmRldikKPiAgIAlpZiAoIXZpcnRpb19o
YXNfZmVhdHVyZShkZXYsIFZJUlRJT19GX1ZFUlNJT05fMSkpCj4gICAJCXJldHVybiAwOwo+ICAg
Cj4gKwlpZiAoYXJjaF9uZWVkc19pb21tdV9wbGF0Zm9ybShkZXYpICYmCj4gKwkJIXZpcnRpb19o
YXNfZmVhdHVyZShkZXYsIFZJUlRJT19GX0lPTU1VX1BMQVRGT1JNKSkKPiArCQlyZXR1cm4gLUVJ
TzsKPiArCj4gICAJdmlydGlvX2FkZF9zdGF0dXMoZGV2LCBWSVJUSU9fQ09ORklHX1NfRkVBVFVS
RVNfT0spOwo+ICAgCXN0YXR1cyA9IGRldi0+Y29uZmlnLT5nZXRfc3RhdHVzKGRldik7Cj4gICAJ
aWYgKCEoc3RhdHVzICYgVklSVElPX0NPTkZJR19TX0ZFQVRVUkVTX09LKSkgewo+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L3ZpcnRpby5oIGIvaW5jbHVkZS9saW51eC92aXJ0aW8uaAo+IGlu
ZGV4IGE0OTNlYWMwODM5My4uMmM0NmIzMTBjMzhjIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGlu
dXgvdmlydGlvLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L3ZpcnRpby5oCj4gQEAgLTE5NSw0ICsx
OTUsNiBAQCB2b2lkIHVucmVnaXN0ZXJfdmlydGlvX2RyaXZlcihzdHJ1Y3QgdmlydGlvX2RyaXZl
ciAqZHJ2KTsKPiAgICNkZWZpbmUgbW9kdWxlX3ZpcnRpb19kcml2ZXIoX192aXJ0aW9fZHJpdmVy
KSBcCj4gICAJbW9kdWxlX2RyaXZlcihfX3ZpcnRpb19kcml2ZXIsIHJlZ2lzdGVyX3ZpcnRpb19k
cml2ZXIsIFwKPiAgIAkJCXVucmVnaXN0ZXJfdmlydGlvX2RyaXZlcikKPiArCj4gK2ludCBhcmNo
X25lZWRzX2lvbW11X3BsYXRmb3JtKHN0cnVjdCB2aXJ0aW9fZGV2aWNlICpkZXYpOwo+ICAgI2Vu
ZGlmIC8qIF9MSU5VWF9WSVJUSU9fSCAqLwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0
aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0
aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
