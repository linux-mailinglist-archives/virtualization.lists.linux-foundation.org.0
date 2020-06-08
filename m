Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D301F165E
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 12:08:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3F96587B18;
	Mon,  8 Jun 2020 10:08:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TLEK77ZgUJy7; Mon,  8 Jun 2020 10:08:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B4A7887B60;
	Mon,  8 Jun 2020 10:08:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 99036C016F;
	Mon,  8 Jun 2020 10:08:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2DF97C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 10:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1C28E87B5D
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 10:08:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R-uWku9aShuZ
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 10:08:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 80F8987B18
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 10:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591610881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J8KdBsIeUG7CqXgAwlXgq2ronkJRHUa9z02ZSl84hDE=;
 b=VhN6ad/IeR5esTgruLJL6HoVyrDob6gDLcxWTxf+dfMqMnGmYBsIAqlvbksTPYk5Ew9p/H
 4FFm4Utyw9CfqKjeLSJFQwGoR3daOJXbD861xrnr1JlDpWH3BPYUfzajnKLPk7PY9NkwUI
 L5fy9SQWoKcfjC9T2DE72Xo9AdcpwTM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-RuHe18uhO4ac4yGJwcfsCw-1; Mon, 08 Jun 2020 06:07:58 -0400
X-MC-Unique: RuHe18uhO4ac4yGJwcfsCw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C584D8018AD;
 Mon,  8 Jun 2020 10:07:56 +0000 (UTC)
Received: from [10.72.13.71] (ovpn-13-71.pek2.redhat.com [10.72.13.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C69136FF1B;
 Mon,  8 Jun 2020 10:07:40 +0000 (UTC)
Subject: Re: [PATCH 5/6] vdpa: introduce virtio pci driver
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <5dbb0386-beeb-5bf4-d12e-fb5427486bb8@redhat.com>
 <6b1d1ef3-d65e-08c2-5b65-32969bb5ecbc@redhat.com>
 <20200607095012-mutt-send-email-mst@kernel.org>
 <9b1abd2b-232c-aa0f-d8bb-03e65fd47de2@redhat.com>
 <20200608021438-mutt-send-email-mst@kernel.org>
 <a1b1b7fb-b097-17b7-2e3a-0da07d2e48ae@redhat.com>
 <20200608052041-mutt-send-email-mst@kernel.org>
 <9d2571b6-0b95-53b3-6989-b4d801eeb623@redhat.com>
 <20200608054453-mutt-send-email-mst@kernel.org>
 <bc27064c-2309-acf3-ccd8-6182bfa2a4cd@redhat.com>
 <20200608055331-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <61117e6a-2568-d0f4-8713-d831af32814d@redhat.com>
Date: Mon, 8 Jun 2020 18:07:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200608055331-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: shahafs@mellanox.com, lulu@redhat.com, kvm@vger.kernel.org,
 saugatm@xilinx.com, netdev@vger.kernel.org, mhabets@solarflare.com,
 vmireyno@marvell.com, linux-kernel@vger.kernel.org, gdawar@xilinx.com,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 hanand@xilinx.com, zhangweining@ruijie.com.cn, eli@mellanox.com,
 lingshan.zhu@intel.com, rob.miller@broadcom.com
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

Ck9uIDIwMjAvNi84IOS4i+WNiDU6NTQsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBN
b24sIEp1biAwOCwgMjAyMCBhdCAwNTo0Njo1MlBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
PiBPbiAyMDIwLzYvOCDkuIvljYg1OjQ1LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+PiBP
biBNb24sIEp1biAwOCwgMjAyMCBhdCAwNTo0Mzo1OFBNICswODAwLCBKYXNvbiBXYW5nIHdyb3Rl
Ogo+Pj4+Pj4gTG9va2luZyBhdAo+Pj4+Pj4gcGNpX21hdGNoX29uZV9kZXZpY2UoKSBpdCBjaGVj
a3MgYm90aCBzdWJ2ZW5kb3IgYW5kIHN1YmRldmljZSB0aGVyZS4KPj4+Pj4+Cj4+Pj4+PiBUaGFu
a3MKPj4+Pj4gQnV0IElJVUMgdGhlcmUgaXMgbm8gZ3VhcmFudGVlIHRoYXQgZHJpdmVyIHdpdGgg
YSBzcGVjaWZpYyBzdWJ2ZW5kb3IKPj4+Pj4gbWF0Y2hlcyBpbiBwcmVzZW5jZSBvZiBhIGdlbmVy
aWMgb25lLgo+Pj4+PiBTbyBlaXRoZXIgSUZDIG9yIHZpcnRpbyBwY2kgY2FuIHdpbiwgd2hpY2hl
dmVyIGJpbmRzIGZpcnN0Lgo+Pj4+IEknbSBub3Qgc3VyZSBJIGdldCB0aGVyZS4gQnV0IEkgdHJ5
IG1hbnVhbGx5IGJpbmQgSUZDVkYgdG8gcWVtdSdzCj4+Pj4gdmlydGlvLW5ldC1wY2ksIGFuZCBp
dCBmYWlscy4KPj4+Pgo+Pj4+IFRoYW5rcwo+Pj4gUmlnaHQgYnV0IHRoZSByZXZlcnNlIGNhbiBo
YXBwZW46IHZpcnRpby1uZXQgY2FuIGJpbmQgdG8gSUZDVkYgZmlyc3QuCj4+Cj4+IFRoYXQncyBr
aW5kIG9mIGV4cGVjdGVkLiBUaGUgUEYgaXMgZXhwZWN0ZWQgdG8gYmUgYm91bmQgdG8gdmlydGlv
LXBjaSB0bwo+PiBjcmVhdGUgVkYgdmlhIHN5c2ZzLgo+Pgo+PiBUaGFua3MKPj4KPj4KPj4KPiBP
bmNlIFZGcyBhcmUgY3JlYXRlZCwgZG9uJ3Qgd2Ugd2FudCBJRkNWRiB0byBiaW5kIHJhdGhlciB0
aGFuCj4gdmlydGlvLXBjaT8KCgpZZXMsIGJ1dCBmb3IgUEYgd2UgbmVlZCB2aXJ0aW8tcGNpLgoK
VGhhbmtzCgoKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4
LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
