Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE81198E06
	for <lists.virtualization@lfdr.de>; Tue, 31 Mar 2020 10:11:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5683585BE4;
	Tue, 31 Mar 2020 08:11:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1T6K6C0eRFnH; Tue, 31 Mar 2020 08:11:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DA9DF85E7C;
	Tue, 31 Mar 2020 08:11:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BB7E0C1AE8;
	Tue, 31 Mar 2020 08:11:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 27006C1AE8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 08:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1286887666
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 08:11:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eQ5K98bsL0QT
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 08:11:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4CDFB87678
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 08:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585642275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yzpvZIJ+CRLVofZ/PwFWXaCWdz97NICG/y5tEVt3YUQ=;
 b=GW8YMfVu1PTt52/GGYDBaWEgDGB8wL7VX5DNxcbm3nU+2KtaR3q6KJhjdS43q6NnkMX3q4
 Xf2rJPkJ26e6gaUM4V8tCtrwv7ww3l4B5R8jF6MZ2gapXhxTPyJ3KWPMIcv/plyRgGOdVK
 40J/DrUoPCC4J9DrBGJZdhhKew5BOA8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-ZYcL_ET-MAaE6ZBAqMMkRw-1; Tue, 31 Mar 2020 04:11:11 -0400
X-MC-Unique: ZYcL_ET-MAaE6ZBAqMMkRw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5D5E8017CC;
 Tue, 31 Mar 2020 08:11:09 +0000 (UTC)
Received: from [10.72.12.115] (ovpn-12-115.pek2.redhat.com [10.72.12.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BAE2619C58;
 Tue, 31 Mar 2020 08:11:04 +0000 (UTC)
Subject: Re: [PATCH -next] virtio: vdpa: remove unused variables 'ifcvf' and
 'ifcvf_lm'
To: YueHaibing <yuehaibing@huawei.com>, mst@redhat.com, tiwei.bie@intel.com,
 lingshan.zhu@intel.com, xiao.w.wang@intel.com
References: <20200331080259.33056-1-yuehaibing@huawei.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a69f59a7-f0cc-6b8b-6c3d-61ef72b3ec38@redhat.com>
Date: Tue, 31 Mar 2020 16:11:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200331080259.33056-1-yuehaibing@huawei.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

Ck9uIDIwMjAvMy8zMSDkuIvljYg0OjAyLCBZdWVIYWliaW5nIHdyb3RlOgo+IGRyaXZlcnMvdmly
dGlvL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5jOjM0OjI0Ogo+ICAgd2FybmluZzogdmFyaWFibGUg
4oCYaWZjdmbigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0K
PiBkcml2ZXJzL3ZpcnRpby92ZHBhL2lmY3ZmL2lmY3ZmX2Jhc2UuYzozMDQ6MzE6Cj4gICB3YXJu
aW5nOiB2YXJpYWJsZSDigJhpZmN2Zl9sbeKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1i
dXQtc2V0LXZhcmlhYmxlXQo+Cj4gUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3
ZWkuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNv
bT4KCgpBY2tlZC1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KClRoYW5rcwoK
Cj4gLS0tCj4gICBkcml2ZXJzL3ZpcnRpby92ZHBhL2lmY3ZmL2lmY3ZmX2Jhc2UuYyB8IDIgLS0K
PiAgIGRyaXZlcnMvdmlydGlvL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5jIHwgMiAtLQo+ICAgMiBm
aWxlcyBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmly
dGlvL3ZkcGEvaWZjdmYvaWZjdmZfYmFzZS5jIGIvZHJpdmVycy92aXJ0aW8vdmRwYS9pZmN2Zi9p
ZmN2Zl9iYXNlLmMKPiBpbmRleCBiNjFiMDZlYTI2ZDMuLmUyNDM3MWQ2NDRiNSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL3ZpcnRpby92ZHBhL2lmY3ZmL2lmY3ZmX2Jhc2UuYwo+ICsrKyBiL2RyaXZl
cnMvdmlydGlvL3ZkcGEvaWZjdmYvaWZjdmZfYmFzZS5jCj4gQEAgLTMwMSwxMiArMzAxLDEwIEBA
IGludCBpZmN2Zl9zZXRfdnFfc3RhdGUoc3RydWN0IGlmY3ZmX2h3ICpodywgdTE2IHFpZCwgdTY0
IG51bSkKPiAgIAo+ICAgc3RhdGljIGludCBpZmN2Zl9od19lbmFibGUoc3RydWN0IGlmY3ZmX2h3
ICpodykKPiAgIHsKPiAtCXN0cnVjdCBpZmN2Zl9sbV9jZmcgX19pb21lbSAqaWZjdmZfbG07Cj4g
ICAJc3RydWN0IHZpcnRpb19wY2lfY29tbW9uX2NmZyBfX2lvbWVtICpjZmc7Cj4gICAJc3RydWN0
IGlmY3ZmX2FkYXB0ZXIgKmlmY3ZmOwo+ICAgCXUzMiBpOwo+ICAgCj4gLQlpZmN2Zl9sbSA9IChz
dHJ1Y3QgaWZjdmZfbG1fY2ZnIF9faW9tZW0gKilody0+bG1fY2ZnOwo+ICAgCWlmY3ZmID0gdmZf
dG9fYWRhcHRlcihodyk7Cj4gICAJY2ZnID0gaHctPmNvbW1vbl9jZmc7Cj4gICAJaWZjX2lvd3Jp
dGUxNihJRkNWRl9NU0lfQ09ORklHX09GRiwgJmNmZy0+bXNpeF9jb25maWcpOwo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3ZpcnRpby92ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYyBiL2RyaXZlcnMvdmly
dGlvL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5jCj4gaW5kZXggOGQ1NGRjNWIwOGQyLi4yOGQ5ZTVk
ZTU2NzUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aXJ0aW8vdmRwYS9pZmN2Zi9pZmN2Zl9tYWlu
LmMKPiArKysgYi9kcml2ZXJzL3ZpcnRpby92ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYwo+IEBAIC0z
MSwxMSArMzEsOSBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgaWZjdmZfaW50cl9oYW5kbGVyKGludCBp
cnEsIHZvaWQgKmFyZykKPiAgIHN0YXRpYyBpbnQgaWZjdmZfc3RhcnRfZGF0YXBhdGgodm9pZCAq
cHJpdmF0ZSkKPiAgIHsKPiAgIAlzdHJ1Y3QgaWZjdmZfaHcgKnZmID0gaWZjdmZfcHJpdmF0ZV90
b192Zihwcml2YXRlKTsKPiAtCXN0cnVjdCBpZmN2Zl9hZGFwdGVyICppZmN2ZjsKPiAgIAl1OCBz
dGF0dXM7Cj4gICAJaW50IHJldDsKPiAgIAo+IC0JaWZjdmYgPSB2Zl90b19hZGFwdGVyKHZmKTsK
PiAgIAl2Zi0+bnJfdnJpbmcgPSBJRkNWRl9NQVhfUVVFVUVfUEFJUlMgKiAyOwo+ICAgCXJldCA9
IGlmY3ZmX3N0YXJ0X2h3KHZmKTsKPiAgIAlpZiAocmV0IDwgMCkgewoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBs
aXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
