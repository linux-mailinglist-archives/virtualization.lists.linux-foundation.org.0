Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C201152525
	for <lists.virtualization@lfdr.de>; Wed,  5 Feb 2020 04:12:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 25C0C8561E;
	Wed,  5 Feb 2020 03:12:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3zx4MEbyY9th; Wed,  5 Feb 2020 03:12:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B21F88567A;
	Wed,  5 Feb 2020 03:12:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9C812C0174;
	Wed,  5 Feb 2020 03:12:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2111DC0174
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 03:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0E9278742F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 03:12:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FY9wnS31Ay6M
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 03:12:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 61BB7873B6
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 03:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580872359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2wZYjlhnV9uQbMJ2hRMQnRxhJ0yidR93PS5+uUhhjmc=;
 b=Stdyg3mjIL71F8OHc4uKa8HaN3z175wsU2fxMZOpR/qR5sXTcN32fRNLH2pX+sWlb+aSes
 LwD4/vtNo3WaTpConuUBGRBjAzBXXt4QDJ3AT3akDt2oeYpOLguFhwmdOaB8c/EBFEKxDs
 ph4u7haZaNELUMll1eyTxsgItwzq/uY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-KYZusS0vPcmHoCCLxMdNTw-1; Tue, 04 Feb 2020 22:12:37 -0500
X-MC-Unique: KYZusS0vPcmHoCCLxMdNTw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C898018AB2C0;
 Wed,  5 Feb 2020 03:12:34 +0000 (UTC)
Received: from [10.72.13.188] (ovpn-13-188.pek2.redhat.com [10.72.13.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 966281001B3F;
 Wed,  5 Feb 2020 03:12:22 +0000 (UTC)
Subject: Re: [PATCH] vhost: introduce vDPA based backend
To: Tiwei Bie <tiwei.bie@intel.com>
References: <20200131033651.103534-1-tiwei.bie@intel.com>
 <7aab2892-bb19-a06a-a6d3-9c28bc4c3400@redhat.com>
 <20200204005306-mutt-send-email-mst@kernel.org>
 <cf485e7f-46e3-20d3-8452-e3058b885d0a@redhat.com>
 <20200205020555.GA369236@___>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <798e5644-ca28-ee46-c953-688af9bccd3b@redhat.com>
Date: Wed, 5 Feb 2020 11:12:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200205020555.GA369236@___>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 mhabets@solarflare.com, virtualization@lists.linux-foundation.org,
 jgg@mellanox.com, rob.miller@broadcom.com, lulu@redhat.com,
 maxime.coquelin@redhat.com, hch@infradead.org, eperezma@redhat.com,
 haotian.wang@sifive.com, shahafs@mellanox.com, parav@mellanox.com,
 jiri@mellanox.com, zhihong.wang@intel.com, netdev@vger.kernel.org,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org, hanand@xilinx.com,
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

Ck9uIDIwMjAvMi81IOS4iuWNiDEwOjA1LCBUaXdlaSBCaWUgd3JvdGU6Cj4gT24gVHVlLCBGZWIg
MDQsIDIwMjAgYXQgMDI6NDY6MTZQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4gT24gMjAy
MC8yLzQg5LiL5Y2IMjowMSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+Pj4gT24gVHVlLCBG
ZWIgMDQsIDIwMjAgYXQgMTE6MzA6MTFBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4+PiA1
KSBnZW5lcmF0ZSBkaWZmcyBvZiBtZW1vcnkgdGFibGUgYW5kIHVzaW5nIElPTU1VIEFQSSB0byBz
ZXR1cCB0aGUgZG1hCj4+Pj4gbWFwcGluZyBpbiB0aGlzIG1ldGhvZAo+Pj4gRnJhbmtseSBJIHRo
aW5rIHRoYXQncyBhIGJ1bmNoIG9mIHdvcmsuIFdoeSBub3QgYSBNQVAvVU5NQVAgaW50ZXJmYWNl
Pwo+Pj4KPj4gU3VyZSwgc28gdGhhdCBiYXNpY2FsbHkgVkhPU1RfSU9UTEJfVVBEQVRFL0lOVkFM
SURBVEUgSSB0aGluaz8KPiBEbyB5b3UgbWVhbiB3ZSBsZXQgdXNlcnNwYWNlIHRvIG9ubHkgdXNl
IFZIT1NUX0lPVExCX1VQREFURS9JTlZBTElEQVRFCj4gdG8gZG8gdGhlIERNQSBtYXBwaW5nIGlu
IHZob3N0LXZkcGEgY2FzZT8gV2hlbiB2SU9NTVUgaXNuJ3QgYXZhaWxhYmxlLAo+IHVzZXJzcGFj
ZSB3aWxsIHNldCBtc2ctPmlvdmEgdG8gR1BBLCBvdGhlcndpc2UgdXNlcnNwYWNlIHdpbGwgc2V0
Cj4gbXNnLT5pb3ZhIHRvIEdJT1ZBLCBhbmQgdmhvc3QtdmRwYSBtb2R1bGUgd2lsbCBnZXQgSFBB
IGZyb20gbXNnLT51YWRkcj8KPgo+IFRoYW5rcywKPiBUaXdlaQoKCkkgdGhpbmsgc28uIE1pY2hh
ZWwsIGRvIHlvdSB0aGluayB0aGlzIG1ha2VzIHNlbnNlPwoKVGhhbmtzCgoKPgo+PiBUaGFua3MK
Pj4KPj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZp
cnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3Vu
ZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0
aW5mby92aXJ0dWFsaXphdGlvbg==
