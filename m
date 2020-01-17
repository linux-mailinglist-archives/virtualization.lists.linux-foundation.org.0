Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF6D14061A
	for <lists.virtualization@lfdr.de>; Fri, 17 Jan 2020 10:35:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DE4C18634C;
	Fri, 17 Jan 2020 09:35:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZlX0Gdt3MKJl; Fri, 17 Jan 2020 09:35:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 713AD86357;
	Fri, 17 Jan 2020 09:35:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 62699C077D;
	Fri, 17 Jan 2020 09:35:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AAF65C077D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 09:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 98D628809E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 09:35:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ghn4ppbzI50E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 09:35:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0172088075
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 09:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579253703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nu3Vp7+fg9qn8Lm5n1B7l7mycGGYWiANJs0CEehFMnI=;
 b=iUxmebV94r7vENVUyxQA32WDcllFl3MS3GpwAtFShfrYbyYZf+TBF8qs0NtOdWteNqbXUv
 XhFC54mpxn/NXofcJHnvqdpGaBAeQpAJlyNBKOJJ/dPss0yABAskl4g0J/c9cbkVmd6p4K
 9upUPQFRG/OZ9aawJRKH9hwdP0KWuV8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-DhT6pOBPNFqi9OWJQVeXoQ-1; Fri, 17 Jan 2020 04:35:01 -0500
X-MC-Unique: DhT6pOBPNFqi9OWJQVeXoQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75B7918C35A2;
 Fri, 17 Jan 2020 09:34:58 +0000 (UTC)
Received: from [10.72.12.168] (ovpn-12-168.pek2.redhat.com [10.72.12.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7EB05C3FA;
 Fri, 17 Jan 2020 09:34:35 +0000 (UTC)
Subject: Re: [PATCH 3/5] vDPA: introduce vDPA bus
To: Randy Dunlap <rdunlap@infradead.org>, mst@redhat.com,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
References: <20200116124231.20253-1-jasowang@redhat.com>
 <20200116124231.20253-4-jasowang@redhat.com>
 <3d0951af-a854-3b4a-99e4-d501a7fa7a9c@infradead.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <6388c5ca-0b42-29ec-0fcd-e720651972d1@redhat.com>
Date: Fri, 17 Jan 2020 17:34:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3d0951af-a854-3b4a-99e4-d501a7fa7a9c@infradead.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: shahafs@mellanox.com, jakub.kicinski@netronome.com, lulu@redhat.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, haotian.wang@sifive.com,
 hch@infradead.org, eperezma@redhat.com, maxime.coquelin@redhat.com,
 jgg@mellanox.com, hanand@xilinx.com, parav@mellanox.com,
 zhihong.wang@intel.com, lingshan.zhu@intel.com, jiri@mellanox.com,
 mhabets@solarflare.com, rob.miller@broadcom.com
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

Ck9uIDIwMjAvMS8xNyDkuIvljYgxMjoxNiwgUmFuZHkgRHVubGFwIHdyb3RlOgo+IE9uIDEvMTYv
MjAgNDo0MiBBTSwgSmFzb24gV2FuZyB3cm90ZToKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmly
dGlvL3ZkcGEvS2NvbmZpZyBiL2RyaXZlcnMvdmlydGlvL3ZkcGEvS2NvbmZpZwo+PiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjMwMzI3MjdiNGQ5OAo+PiAtLS0g
L2Rldi9udWxsCj4+ICsrKyBiL2RyaXZlcnMvdmlydGlvL3ZkcGEvS2NvbmZpZwo+PiBAQCAtMCww
ICsxLDkgQEAKPj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQo+PiAr
Y29uZmlnIFZEUEEKPj4gKwl0cmlzdGF0ZQo+PiArICAgICAgICBkZWZhdWx0IG4KPj4gKyAgICAg
ICAgaGVscAo+PiArICAgICAgICAgIEVuYWJsZSB0aGlzIG1vZHVsZSB0byBzdXBwb3J0IHZEUEEg
ZGV2aWNlIHRoYXQgdXNlcyBhCj4gCSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBkZXZpY2VzCj4KPj4gKyAgICAgICAgICBkYXRhcGF0aCB3aGljaCBjb21wbGllcyB3aXRo
IHZpcnRpbyBzcGVjaWZpY2F0aW9ucyB3aXRoCj4+ICsgICAgICAgICAgdmVuZG9yIHNwZWNpZmlj
IGNvbnRyb2wgcGF0aC4KPj4gKwo+IFVzZSB0YWIgKyAyIHNwYWNlcyBmb3IgS2NvbmZpZyBpbmRl
bnRhdGlvbi4KCgpXaWxsIGZpeC4KClRoYW5rcwoKPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1
YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhm
b3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
