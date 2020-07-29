Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2283E231C28
	for <lists.virtualization@lfdr.de>; Wed, 29 Jul 2020 11:33:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A328287C17;
	Wed, 29 Jul 2020 09:33:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VuvlzpJfnKNl; Wed, 29 Jul 2020 09:33:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 12D3F8765A;
	Wed, 29 Jul 2020 09:33:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EB1C8C0053;
	Wed, 29 Jul 2020 09:33:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30079C004D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 09:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1E83B84713
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 09:33:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RQ9_oFN-z1yv
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 09:33:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9A6C78454E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 09:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596015232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NcytAw49Ogv+T6nX8O+DUO/ud353HRXDgEw6dxPF2is=;
 b=F4+6Si+XQDWskJTMdGhm3TRK8ydUqS0364w9mXolDuM6CVG/8CP+et2QEZqQ0lq/BgsI0E
 fMpvC0MueoZdryp3edvaOjA9x/yPeO0RSOOJybdheVpPbOGz4/i584QQBh59rBBXl8VYsu
 sgYk8m1xbAiPSTc3PkvuPyU6cE2kVvU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-IqC2wmCtN_6Xj1-G6eL3FQ-1; Wed, 29 Jul 2020 05:33:33 -0400
X-MC-Unique: IqC2wmCtN_6Xj1-G6eL3FQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5207980183C;
 Wed, 29 Jul 2020 09:33:32 +0000 (UTC)
Received: from [10.72.13.120] (ovpn-13-120.pek2.redhat.com [10.72.13.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F0F6512FE;
 Wed, 29 Jul 2020 09:33:05 +0000 (UTC)
Subject: Re: [PATCH] virtio_balloon: fix up endian-ness for free cmd id
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20200727160310.102494-1-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <0dceaf8c-de35-93d6-f81b-67c2fdebf5ef@redhat.com>
Date: Wed, 29 Jul 2020 17:33:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200727160310.102494-1-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: Liang Li <liang.z.li@intel.com>,
 Alexander Duyck <alexander.duyck@gmail.com>,
 virtualization@lists.linux-foundation.org, stable@vger.kernel.org
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

Ck9uIDIwMjAvNy8yOCDkuIrljYgxMjowMywgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+IGZy
ZWUgY21kIGlkIGlzIHJlYWQgdXNpbmcgdmlydGlvIGVuZGlhbiwgc3BlYyBzYXlzIGFsbCBmaWVs
ZHMKPiBpbiBiYWxsb29uIGFyZSBMRS4gRml4IGl0IHVwLgo+Cj4gRml4ZXM6IDg2YTU1OTc4N2U2
ZiAoInZpcnRpby1iYWxsb29uOiBWSVJUSU9fQkFMTE9PTl9GX0ZSRUVfUEFHRV9ISU5UIikKPiBD
Yzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgUy4gVHNp
cmtpbiA8bXN0QHJlZGhhdC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL3ZpcnRpby92aXJ0aW9fYmFs
bG9vbi5jIHwgNiArKysrKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fYmFsbG9v
bi5jIGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX2JhbGxvb24uYwo+IGluZGV4IDc3NGRlYjY1YTli
Yi4uNzk4ZWMzMDRmZTNlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19iYWxs
b29uLmMKPiArKysgYi9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fYmFsbG9vbi5jCj4gQEAgLTU3OCwx
MCArNTc4LDE0IEBAIHN0YXRpYyBpbnQgaW5pdF92cXMoc3RydWN0IHZpcnRpb19iYWxsb29uICp2
YikKPiAgIHN0YXRpYyB1MzIgdmlydGlvX2JhbGxvb25fY21kX2lkX3JlY2VpdmVkKHN0cnVjdCB2
aXJ0aW9fYmFsbG9vbiAqdmIpCj4gICB7Cj4gICAJaWYgKHRlc3RfYW5kX2NsZWFyX2JpdChWSVJU
SU9fQkFMTE9PTl9DT05GSUdfUkVBRF9DTURfSUQsCj4gLQkJCSAgICAgICAmdmItPmNvbmZpZ19y
ZWFkX2JpdG1hcCkpCj4gKwkJCSAgICAgICAmdmItPmNvbmZpZ19yZWFkX2JpdG1hcCkpIHsKPiAg
IAkJdmlydGlvX2NyZWFkKHZiLT52ZGV2LCBzdHJ1Y3QgdmlydGlvX2JhbGxvb25fY29uZmlnLAo+
ICAgCQkJICAgICBmcmVlX3BhZ2VfaGludF9jbWRfaWQsCj4gICAJCQkgICAgICZ2Yi0+Y21kX2lk
X3JlY2VpdmVkX2NhY2hlKTsKPiArCQkvKiBMZWdhY3kgYmFsbG9vbiBjb25maWcgc3BhY2UgaXMg
TEUsIHVubGlrZSBhbGwgb3RoZXIgZGV2aWNlcy4gKi8KPiArCQlpZiAoIXZpcnRpb19oYXNfZmVh
dHVyZSh2Yi0+dmRldiwgVklSVElPX0ZfVkVSU0lPTl8xKSkKPiArCQkJdmItPmNtZF9pZF9yZWNl
aXZlZF9jYWNoZSA9IGxlMzJfdG9fY3B1KChfX2ZvcmNlIF9fbGUzMil2Yi0+Y21kX2lkX3JlY2Vp
dmVkX2NhY2hlKTsKPiArCX0KPiAgIAo+ICAgCXJldHVybiB2Yi0+Y21kX2lkX3JlY2VpdmVkX2Nh
Y2hlOwo+ICAgfQoKCkFja2VkLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxp
emF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9u
Lm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92
aXJ0dWFsaXphdGlvbg==
