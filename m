Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF9C158883
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 04:05:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0F41D20460;
	Tue, 11 Feb 2020 03:05:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j55LU9YpUqte; Tue, 11 Feb 2020 03:05:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1C9AA20459;
	Tue, 11 Feb 2020 03:05:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 11C8FC07FE;
	Tue, 11 Feb 2020 03:05:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 63436C07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 03:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4A98D20454
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 03:05:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6PH4KR1vXR0f
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 03:05:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 72EE720453
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 03:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581390321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KvcEiX4twRYkY9tlcW0KR6JhbG2eCzmXY2UKM+U0WS8=;
 b=F2BAN9kwmVjPvwhjS3lsVEYshy9X5xt2YZjdsEj34mVLH2cA3zaC79g1aY7CO+VXeZ0/92
 aEeUNY0KhIkM0cx2tODF7vlTyfKrEmVAOW9cLjHRnEGGfdRzi0LPqsk4pRBjcSnkIRIGEE
 cw91xtIPAXmnMRB9DKciLA/qW4cQ4gs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-ZeDow6a7McejZRi6GEvWJQ-1; Mon, 10 Feb 2020 22:05:20 -0500
X-MC-Unique: ZeDow6a7McejZRi6GEvWJQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 848AB8017DF;
 Tue, 11 Feb 2020 03:05:17 +0000 (UTC)
Received: from [10.72.12.184] (ovpn-12-184.pek2.redhat.com [10.72.12.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3672C60BF4;
 Tue, 11 Feb 2020 03:04:58 +0000 (UTC)
Subject: Re: [PATCH V2 4/5] virtio: introduce a vDPA based transport
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20200210035608.10002-1-jasowang@redhat.com>
 <20200210035608.10002-5-jasowang@redhat.com>
 <20200210133442.GS23346@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <530d9dbe-39c0-db0c-d13a-0719e5ade777@redhat.com>
Date: Tue, 11 Feb 2020 11:04:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200210133442.GS23346@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: kvm@vger.kernel.org, mst@redhat.com, mhabets@solarflare.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 lulu@redhat.com, hanand@xilinx.com, hch@infradead.org, eperezma@redhat.com,
 haotian.wang@sifive.com, shahafs@mellanox.com, parav@mellanox.com,
 jiri@mellanox.com, xiao.w.wang@intel.com, stefanha@redhat.com,
 zhihong.wang@intel.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 maxime.coquelin@redhat.com, netdev@vger.kernel.org, lingshan.zhu@intel.com
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

Ck9uIDIwMjAvMi8xMCDkuIvljYg5OjM0LCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gT24gTW9u
LCBGZWIgMTAsIDIwMjAgYXQgMTE6NTY6MDdBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4g
VGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgdkRQQSB0cmFuc3BvcnQgZm9yIHZpcnRpby4gVGhpcyBp
cyB1c2VkIHRvCj4+IHVzZSBrZXJuZWwgdmlydGlvIGRyaXZlciB0byBkcml2ZSB0aGUgbWVkaWF0
ZWQgZGV2aWNlIHRoYXQgaXMgY2FwYWJsZQo+PiBvZiBwb3B1bGF0aW5nIHZpcnRxdWV1ZSBkaXJl
Y3RseS4KPiBJcyB0aGlzIGNvbW1lbnQgc3RpbGwgcmlnaHQ/IElzIHRoZXJlIGEgbWVkaWF0ZWQg
ZGV2aWNlIHN0aWxsPwo+Cj4gSmFzb24KCgpObywgd2lsbCBmaXguCgpUaGFua3MKCgo+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlv
biBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcK
aHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVh
bGl6YXRpb24=
