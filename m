Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E62119EEEE
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 02:34:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B76E88708C;
	Mon,  6 Apr 2020 00:34:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ToMJuoWEoWzy; Mon,  6 Apr 2020 00:34:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C6A9787749;
	Mon,  6 Apr 2020 00:34:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2C29C0177;
	Mon,  6 Apr 2020 00:34:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9E029C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 00:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 889BF85C4C
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 00:34:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id my3ZvYm4pNnV
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 00:34:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8964885AE9
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 00:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586133264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T/vU8MPciUEqUMtuOa12EqTvgqLpKqD2sEwuhY285Sk=;
 b=OnfdUpuOW/zwoZCf8RZ+i9RoDvIZvt8Eotq4i0jn7CvV+59zdyBq7XE3A84jlfZDQLPf61
 PSA8fnoG67vPuHbyGSEz0oaYtCW5HR1UZZlaoCaAMjZVEGV6FxwRdVbwIcs25qhz/s/nDL
 2LdiZVQhmtSc8aN38/IKCYZ4WmDRyG8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-C48CUeNuPK-LR6V2Au67Vw-1; Sun, 05 Apr 2020 20:34:22 -0400
X-MC-Unique: C48CUeNuPK-LR6V2Au67Vw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3396F1005513;
 Mon,  6 Apr 2020 00:34:21 +0000 (UTC)
Received: from [10.72.12.50] (ovpn-12-50.pek2.redhat.com [10.72.12.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5AF78385;
 Mon,  6 Apr 2020 00:34:17 +0000 (UTC)
Subject: Re: [PATCH] vdpa-sim: depend on HAS_DMA
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20200405081355.2870-1-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <6e2ad3e3-c4cb-98cb-e15d-8d9e7aa14f50@redhat.com>
Date: Mon, 6 Apr 2020 08:34:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200405081355.2870-1-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

Ck9uIDIwMjAvNC81IOS4i+WNiDQ6MTQsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBzZXRf
ZG1hX29wcyBpc24ndCBhdmFpbGFibGUgb24gYWxsIGFyY2hpdGVjdHVyZXM6Cj4KPiAgICAgICAg
ICBtYWtlIEFSQ0g9dW0KPiAuLi4KPgo+ICAgICBkcml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9z
aW0uYzogSW4gZnVuY3Rpb24gJ3ZkcGFzaW1fY3JlYXRlJzoKPj4+IGRyaXZlcnMvdmRwYS92ZHBh
X3NpbS92ZHBhX3NpbS5jOjMyNDoyOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVu
Y3Rpb24gJ3NldF9kbWFfb3BzJzsgZGlkIHlvdSBtZWFuICdzZXRfZ3JvdXBzJz8KPiArWy1XZXJy
b3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4gICAgICAgc2V0X2RtYV9vcHMoZGV2
LCAmdmRwYXNpbV9kbWFfb3BzKTsKPiAgICAgICBefn5+fn5+fn5+fgo+ICAgICAgIHNldF9ncm91
cHMKPgo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+
Cj4gLS0tCj4gICBkcml2ZXJzL3ZkcGEvS2NvbmZpZyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dmRwYS9LY29uZmlnIGIvZHJpdmVycy92ZHBhL0tjb25maWcKPiBpbmRleCAwOGI2MTVmMmRhMzku
LmQwY2IwZTU4M2E1ZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZkcGEvS2NvbmZpZwo+ICsrKyBi
L2RyaXZlcnMvdmRwYS9LY29uZmlnCj4gQEAgLTE0LDcgKzE0LDcgQEAgaWYgVkRQQV9NRU5VCj4g
ICAKPiAgIGNvbmZpZyBWRFBBX1NJTQo+ICAgCXRyaXN0YXRlICJ2RFBBIGRldmljZSBzaW11bGF0
b3IiCj4gLQlkZXBlbmRzIG9uIFJVTlRJTUVfVEVTVElOR19NRU5VCj4gKwlkZXBlbmRzIG9uIFJV
TlRJTUVfVEVTVElOR19NRU5VICYmIEhBU19ETUEKPiAgIAlzZWxlY3QgVkRQQQo+ICAgCXNlbGVj
dCBWSE9TVF9SSU5HCj4gICAJc2VsZWN0IFZIT1NUX0lPVExCCgoKQWNrZWQtYnk6IEphc29uIFdh
bmcgPGphc293YW5nQHJlZGhhdC5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0
aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0
aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
