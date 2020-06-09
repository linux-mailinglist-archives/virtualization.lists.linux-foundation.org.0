Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF441F33AD
	for <lists.virtualization@lfdr.de>; Tue,  9 Jun 2020 07:55:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 08A05868CB;
	Tue,  9 Jun 2020 05:55:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GlRokpxemFBQ; Tue,  9 Jun 2020 05:55:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 97186868C4;
	Tue,  9 Jun 2020 05:55:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D475C016F;
	Tue,  9 Jun 2020 05:55:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30079C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Jun 2020 05:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1043B207A8
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Jun 2020 05:55:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oiere2rXC+wL
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Jun 2020 05:55:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id E427E204D7
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Jun 2020 05:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591682136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=08pzgeVHE6/leOw9rkcb4hjTCcujAlE6G/nlp9Vnewk=;
 b=ZjmjesdtpC0JBQ1vh94sOhi+QhAo+UiQX9Q5bhEZLpzaPJFGPQm2x+IDJynbGEsDyEhtEN
 ukpQcii3AcOR+DfxJ8jQ24TpONsh6YAcFeEgT/gwPNjlhJYtM0XN2vybYtSFIA5OFL808a
 DNPRCJzVY9cEAFSCAmGFapG/96ERIo4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-UVqavzv0Or2l_IiTMItEdA-1; Tue, 09 Jun 2020 01:55:32 -0400
X-MC-Unique: UVqavzv0Or2l_IiTMItEdA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40FB81009440;
 Tue,  9 Jun 2020 05:55:30 +0000 (UTC)
Received: from [10.72.12.252] (ovpn-12-252.pek2.redhat.com [10.72.12.252])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B55F160BF3;
 Tue,  9 Jun 2020 05:55:18 +0000 (UTC)
Subject: Re: [PATCH 5/6] vdpa: introduce virtio pci driver
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200607095012-mutt-send-email-mst@kernel.org>
 <9b1abd2b-232c-aa0f-d8bb-03e65fd47de2@redhat.com>
 <20200608021438-mutt-send-email-mst@kernel.org>
 <a1b1b7fb-b097-17b7-2e3a-0da07d2e48ae@redhat.com>
 <20200608052041-mutt-send-email-mst@kernel.org>
 <9d2571b6-0b95-53b3-6989-b4d801eeb623@redhat.com>
 <20200608054453-mutt-send-email-mst@kernel.org>
 <bc27064c-2309-acf3-ccd8-6182bfa2a4cd@redhat.com>
 <20200608055331-mutt-send-email-mst@kernel.org>
 <61117e6a-2568-d0f4-8713-d831af32814d@redhat.com>
 <20200608092530-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a01aced5-2357-b55c-296b-f152008ddbf2@redhat.com>
Date: Tue, 9 Jun 2020 13:55:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200608092530-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

Ck9uIDIwMjAvNi84IOS4i+WNiDk6MjksIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBN
b24sIEp1biAwOCwgMjAyMCBhdCAwNjowNzozNlBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
PiBPbiAyMDIwLzYvOCDkuIvljYg1OjU0LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+PiBP
biBNb24sIEp1biAwOCwgMjAyMCBhdCAwNTo0Njo1MlBNICswODAwLCBKYXNvbiBXYW5nIHdyb3Rl
Ogo+Pj4+IE9uIDIwMjAvNi84IOS4i+WNiDU6NDUsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToK
Pj4+Pj4gT24gTW9uLCBKdW4gMDgsIDIwMjAgYXQgMDU6NDM6NThQTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPj4+Pj4+Pj4gTG9va2luZyBhdAo+Pj4+Pj4+PiBwY2lfbWF0Y2hfb25lX2Rldmlj
ZSgpIGl0IGNoZWNrcyBib3RoIHN1YnZlbmRvciBhbmQgc3ViZGV2aWNlIHRoZXJlLgo+Pj4+Pj4+
Pgo+Pj4+Pj4+PiBUaGFua3MKPj4+Pj4+PiBCdXQgSUlVQyB0aGVyZSBpcyBubyBndWFyYW50ZWUg
dGhhdCBkcml2ZXIgd2l0aCBhIHNwZWNpZmljIHN1YnZlbmRvcgo+Pj4+Pj4+IG1hdGNoZXMgaW4g
cHJlc2VuY2Ugb2YgYSBnZW5lcmljIG9uZS4KPj4+Pj4+PiBTbyBlaXRoZXIgSUZDIG9yIHZpcnRp
byBwY2kgY2FuIHdpbiwgd2hpY2hldmVyIGJpbmRzIGZpcnN0Lgo+Pj4+Pj4gSSdtIG5vdCBzdXJl
IEkgZ2V0IHRoZXJlLiBCdXQgSSB0cnkgbWFudWFsbHkgYmluZCBJRkNWRiB0byBxZW11J3MKPj4+
Pj4+IHZpcnRpby1uZXQtcGNpLCBhbmQgaXQgZmFpbHMuCj4+Pj4+Pgo+Pj4+Pj4gVGhhbmtzCj4+
Pj4+IFJpZ2h0IGJ1dCB0aGUgcmV2ZXJzZSBjYW4gaGFwcGVuOiB2aXJ0aW8tbmV0IGNhbiBiaW5k
IHRvIElGQ1ZGIGZpcnN0Lgo+Pj4+IFRoYXQncyBraW5kIG9mIGV4cGVjdGVkLiBUaGUgUEYgaXMg
ZXhwZWN0ZWQgdG8gYmUgYm91bmQgdG8gdmlydGlvLXBjaSB0bwo+Pj4+IGNyZWF0ZSBWRiB2aWEg
c3lzZnMuCj4+Pj4KPj4+PiBUaGFua3MKPj4+Pgo+Pj4+Cj4+Pj4KPj4+IE9uY2UgVkZzIGFyZSBj
cmVhdGVkLCBkb24ndCB3ZSB3YW50IElGQ1ZGIHRvIGJpbmQgcmF0aGVyIHRoYW4KPj4+IHZpcnRp
by1wY2k/Cj4+Cj4+IFllcywgYnV0IGZvciBQRiB3ZSBuZWVkIHZpcnRpby1wY2kuCj4+Cj4+IFRo
YW5rcwo+Pgo+IChBYil1c2luZyB0aGUgZHJpdmVyX2RhdGEgZmllbGQgZm9yIHRoaXMgaXMgYW4g
b3B0aW9uLgo+IFdoYXQgZG8geW91IHRoaW5rPwoKCk1heWJlIHlvdSBjYW4gZWxhYm9yYXRlIG1v
cmUgb24gdGhpcyBpZGVhPwoKVGhhbmtzCgoKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxp
emF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
