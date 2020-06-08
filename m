Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E87051F15D4
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 11:47:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4DDE285EB8;
	Mon,  8 Jun 2020 09:47:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Td2swWkyJr4D; Mon,  8 Jun 2020 09:47:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CAEFE85E9F;
	Mon,  8 Jun 2020 09:47:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B76FAC016F;
	Mon,  8 Jun 2020 09:47:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23255C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1280B86B47
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:47:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id od2GocWYz4bY
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:47:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 47A2485C9A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591609634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oRvR0z9DPHYwpMI8dWRlJVdbfk+Jsh/v5E8QlIJ9FT8=;
 b=L1Kvk0TY0RfO/qr0xq+5E+dkkWTcl1Sn5WA576ZztzJqoBruOhcTcM3+mc7PohCZcQVN9x
 TwZlazfRCGg4BSkDTq+v80yGDwjsI5R3Ixnn6mWwmp/K7+8iZeaB4K86+Xx4D4FMEGNjLD
 tGMVDDYilPI7YbkB3QQAjVSL0Ts7Guw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-2HOf27seOnqEVafcIC1r1A-1; Mon, 08 Jun 2020 05:47:12 -0400
X-MC-Unique: 2HOf27seOnqEVafcIC1r1A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C3E68014D4;
 Mon,  8 Jun 2020 09:47:10 +0000 (UTC)
Received: from [10.72.13.71] (ovpn-13-71.pek2.redhat.com [10.72.13.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5E755D9C9;
 Mon,  8 Jun 2020 09:46:56 +0000 (UTC)
Subject: Re: [PATCH 5/6] vdpa: introduce virtio pci driver
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200529080303.15449-6-jasowang@redhat.com>
 <20200602010332-mutt-send-email-mst@kernel.org>
 <5dbb0386-beeb-5bf4-d12e-fb5427486bb8@redhat.com>
 <6b1d1ef3-d65e-08c2-5b65-32969bb5ecbc@redhat.com>
 <20200607095012-mutt-send-email-mst@kernel.org>
 <9b1abd2b-232c-aa0f-d8bb-03e65fd47de2@redhat.com>
 <20200608021438-mutt-send-email-mst@kernel.org>
 <a1b1b7fb-b097-17b7-2e3a-0da07d2e48ae@redhat.com>
 <20200608052041-mutt-send-email-mst@kernel.org>
 <9d2571b6-0b95-53b3-6989-b4d801eeb623@redhat.com>
 <20200608054453-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <bc27064c-2309-acf3-ccd8-6182bfa2a4cd@redhat.com>
Date: Mon, 8 Jun 2020 17:46:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200608054453-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Ck9uIDIwMjAvNi84IOS4i+WNiDU6NDUsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBN
b24sIEp1biAwOCwgMjAyMCBhdCAwNTo0Mzo1OFBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
Pj4+IExvb2tpbmcgYXQKPj4+PiBwY2lfbWF0Y2hfb25lX2RldmljZSgpIGl0IGNoZWNrcyBib3Ro
IHN1YnZlbmRvciBhbmQgc3ViZGV2aWNlIHRoZXJlLgo+Pj4+Cj4+Pj4gVGhhbmtzCj4+PiBCdXQg
SUlVQyB0aGVyZSBpcyBubyBndWFyYW50ZWUgdGhhdCBkcml2ZXIgd2l0aCBhIHNwZWNpZmljIHN1
YnZlbmRvcgo+Pj4gbWF0Y2hlcyBpbiBwcmVzZW5jZSBvZiBhIGdlbmVyaWMgb25lLgo+Pj4gU28g
ZWl0aGVyIElGQyBvciB2aXJ0aW8gcGNpIGNhbiB3aW4sIHdoaWNoZXZlciBiaW5kcyBmaXJzdC4K
Pj4KPj4gSSdtIG5vdCBzdXJlIEkgZ2V0IHRoZXJlLiBCdXQgSSB0cnkgbWFudWFsbHkgYmluZCBJ
RkNWRiB0byBxZW11J3MKPj4gdmlydGlvLW5ldC1wY2ksIGFuZCBpdCBmYWlscy4KPj4KPj4gVGhh
bmtzCj4gUmlnaHQgYnV0IHRoZSByZXZlcnNlIGNhbiBoYXBwZW46IHZpcnRpby1uZXQgY2FuIGJp
bmQgdG8gSUZDVkYgZmlyc3QuCgoKVGhhdCdzIGtpbmQgb2YgZXhwZWN0ZWQuIFRoZSBQRiBpcyBl
eHBlY3RlZCB0byBiZSBib3VuZCB0byB2aXJ0aW8tcGNpIHRvIApjcmVhdGUgVkYgdmlhIHN5c2Zz
LgoKVGhhbmtzCgoKCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5s
aW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFp
bG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
