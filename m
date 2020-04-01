Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5786219AC05
	for <lists.virtualization@lfdr.de>; Wed,  1 Apr 2020 14:51:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BFF752039E;
	Wed,  1 Apr 2020 12:51:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gnFn6RFnIM6D; Wed,  1 Apr 2020 12:51:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1F39320104;
	Wed,  1 Apr 2020 12:51:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EE703C089F;
	Wed,  1 Apr 2020 12:51:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 14166C089F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 12:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id F377B85CD0
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 12:51:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5VY4VxgATa7w
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 12:51:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0BDF685CAA
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 12:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585745465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KZrEIeJJf1z/466R4PTGZhsuBRjfB99OXepaDxzJjTA=;
 b=QGfhPHu0qbTRlC5zF+G2AnEC3HUuHihNcAiQKacmcqvmBCTXCbvA1WqbfD+rJA8g72p40X
 PgNMKssEpc6uxf0Mj2l2V70JnFOvmi3N/bi2pmJqGmW1PH0nASvNwuC3gz82wv33rPlmkk
 u8OSuUFXeP3E4HSKz2msEVV8OsHBCYA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-2txM6OSVP8OwClyVv-NhKQ-1; Wed, 01 Apr 2020 08:50:58 -0400
X-MC-Unique: 2txM6OSVP8OwClyVv-NhKQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B6AE477;
 Wed,  1 Apr 2020 12:50:55 +0000 (UTC)
Received: from [10.72.12.139] (ovpn-12-139.pek2.redhat.com [10.72.12.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 46B9A18A85;
 Wed,  1 Apr 2020 12:50:37 +0000 (UTC)
Subject: Re: [PATCH V9 1/9] vhost: refine vhost and vringh kconfig
To: Christian Borntraeger <borntraeger@de.ibm.com>, mst@redhat.com,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
References: <20200326140125.19794-1-jasowang@redhat.com>
 <20200326140125.19794-2-jasowang@redhat.com>
 <fde312a4-56bd-f11f-799f-8aa952008012@de.ibm.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <41ee1f6a-3124-d44b-bf34-0f26604f9514@redhat.com>
Date: Wed, 1 Apr 2020 20:50:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <fde312a4-56bd-f11f-799f-8aa952008012@de.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: mhabets@solarflare.com, rob.miller@broadcom.com, saugatm@xilinx.com,
 lulu@redhat.com, hanand@xilinx.com, hch@infradead.org, eperezma@redhat.com,
 jgg@mellanox.com, shahafs@mellanox.com, parav@mellanox.com,
 vmireyno@marvell.com, gdawar@xilinx.com, jiri@mellanox.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, zhihong.wang@intel.com,
 zhangweining@ruijie.com.cn, rdunlap@infradead.org, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com
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

Ck9uIDIwMjAvNC8xIOS4i+WNiDc6MjEsIENocmlzdGlhbiBCb3JudHJhZWdlciB3cm90ZToKPiBP
biAyNi4wMy4yMCAxNTowMSwgSmFzb24gV2FuZyB3cm90ZToKPj4gQ3VycmVudGx5LCBDT05GSUdf
VkhPU1QgZGVwZW5kcyBvbiBDT05GSUdfVklSVFVBTElaQVRJT04uIEJ1dCB2aG9zdCBpcwo+PiBu
b3QgbmVjZXNzYXJpbHkgZm9yIFZNIHNpbmNlIGl0J3MgYSBnZW5lcmljIHVzZXJzcGFjZSBhbmQg
a2VybmVsCj4+IGNvbW11bmljYXRpb24gcHJvdG9jb2wuIFN1Y2ggZGVwZW5kZW5jeSBtYXkgcHJl
dmVudCBhcmNocyB3aXRob3V0Cj4+IHZpcnR1YWxpemF0aW9uIHN1cHBvcnQgZnJvbSB1c2luZyB2
aG9zdC4KPj4KPj4gVG8gc29sdmUgdGhpcywgYSBkZWRpY2F0ZWQgdmhvc3QgbWVudSBpcyBjcmVh
dGVkIHVuZGVyIGRyaXZlcnMgc28KPj4gQ09OSUZHX1ZIT1NUIGNhbiBiZSBkZWNvdXBsZWQgb3V0
IG9mIENPTkZJR19WSVJUVUFMSVpBVElPTi4KPiBGV0lXLCB0aGlzIG5vdyByZXN1bHRzIGluIHZo
b3N0IG5vdCBiZWluZyBidWlsZCB3aXRoIGRlZmNvbmZpZyBrZXJuZWxzIChpbiB0b2RheXMKPiBs
aW51eC1uZXh0KS4KPgoKSGkgQ2hyaXN0aWFuOgoKRGlkIHlvdSBtZWV0IGl0IGV2ZW4gd2l0aCB0
aGlzIApjb21taXTCoGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L25leHQvbGludXgtbmV4dC5naXQvY29tbWl0Lz9pZD1hNGJlNDBjYmNlZGJhOWI1YjcxNGYz
Yzk1MTgyZThhNDUxNzZlNDJkPwoKSWYgeWVzLCB3aGF0J3MgeW91ciBidWlsZCBjb25maWcgbG9v
a3MgbGlrZT8KClRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3Rz
LmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
