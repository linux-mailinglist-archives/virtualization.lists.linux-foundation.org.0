Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A113F198BB2
	for <lists.virtualization@lfdr.de>; Tue, 31 Mar 2020 07:30:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 12B3124B59;
	Tue, 31 Mar 2020 05:30:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N5BfXe-daapc; Tue, 31 Mar 2020 05:30:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D6B91248A1;
	Tue, 31 Mar 2020 05:30:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9802BC07FF;
	Tue, 31 Mar 2020 05:30:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 910BBC07FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 05:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8040C24B04
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 05:30:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jGERT-V4Bf25
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 05:30:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 7915E248A1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 05:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585632606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cFqXXNouokcEA1ClxFQy3YMBVLAfkUsYqF77czd6ZxU=;
 b=NJyM3bSg7yn6ptssQMdH7O5Q/nWR67+9itlcYvfprPLZKfNAmq01r+J0CZNZ31WmAf3gq6
 wum0k2TEC/sRLTLQUgBE4LRQQUf6Gs0SMZgTTX2LZrU6V7wtojh4ku5lJ1UEmm7BmvwRls
 FWW4/kzBpTHhYancWmx0ex83NPVllIY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-nzdgtpyaMqO2qBGBZY26tQ-1; Tue, 31 Mar 2020 01:30:04 -0400
X-MC-Unique: nzdgtpyaMqO2qBGBZY26tQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96E19800D5C;
 Tue, 31 Mar 2020 05:30:02 +0000 (UTC)
Received: from [10.72.12.115] (ovpn-12-115.pek2.redhat.com [10.72.12.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 669CCD767B;
 Tue, 31 Mar 2020 05:29:57 +0000 (UTC)
Subject: Re: [PATCH -next] vdpasim: Rerun status in vdpasim_get_status
To: YueHaibing <yuehaibing@huawei.com>, mst@redhat.com
References: <20200331033501.31272-1-yuehaibing@huawei.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <096a742b-9387-370e-db22-81f220cf7c70@redhat.com>
Date: Tue, 31 Mar 2020 13:29:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200331033501.31272-1-yuehaibing@huawei.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

Ck9uIDIwMjAvMy8zMSDkuIrljYgxMTozNSwgWXVlSGFpYmluZyB3cm90ZToKPiB2ZHBhc2ltLT5z
dGF0dXMgc2hvdWxkIGFjcXVpcmVkIHVuZGVyIHNwaW4gbG9jay4KPgo+IEZpeGVzOiA4NzA0NDhj
MzE3NzUgKCJ2ZHBhc2ltOiB2RFBBIGRldmljZSBzaW11bGF0b3IiKQo+IFNpZ25lZC1vZmYtYnk6
IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvdmly
dGlvL3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW0uYyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmly
dGlvL3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW0uYyBiL2RyaXZlcnMvdmlydGlvL3ZkcGEvdmRwYV9z
aW0vdmRwYV9zaW0uYwo+IGluZGV4IDZlOGEwY2YyZmRlYi4uNzI4NjNkMDFhMTJhIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvdmlydGlvL3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW0uYwo+ICsrKyBiL2Ry
aXZlcnMvdmlydGlvL3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW0uYwo+IEBAIC00ODgsNyArNDg4LDcg
QEAgc3RhdGljIHU4IHZkcGFzaW1fZ2V0X3N0YXR1cyhzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkcGEp
Cj4gICAJc3RhdHVzID0gdmRwYXNpbS0+c3RhdHVzOwo+ICAgCXNwaW5fdW5sb2NrKCZ2ZHBhc2lt
LT5sb2NrKTsKPiAgIAo+IC0JcmV0dXJuIHZkcGFzaW0tPnN0YXR1czsKPiArCXJldHVybiBzdGF0
dXM7Cj4gICB9Cj4gICAKPiAgIHN0YXRpYyB2b2lkIHZkcGFzaW1fc2V0X3N0YXR1cyhzdHJ1Y3Qg
dmRwYV9kZXZpY2UgKnZkcGEsIHU4IHN0YXR1cykKCgpUeXBvIGluIHRoZSB0aXRsZSBidXQgcGF0
Y2ggbG9va3MgZ29vZC4KCkFja2VkLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29t
PgoKVGhhbmtzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4
LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
