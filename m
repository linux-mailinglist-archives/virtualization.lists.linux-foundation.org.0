Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF3F1B957A
	for <lists.virtualization@lfdr.de>; Mon, 27 Apr 2020 05:31:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D14D220517;
	Mon, 27 Apr 2020 03:31:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A4U-KNS1mApW; Mon, 27 Apr 2020 03:31:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3F20A2048E;
	Mon, 27 Apr 2020 03:31:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2D31DC1D87;
	Mon, 27 Apr 2020 03:31:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D7FFCC0172
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 03:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C067F8448B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 03:31:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ryrc-dVtXgu3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 03:31:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2CA4783F31
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 03:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587958275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0WoA+56dUoJ/42TBfEa8gnCTKtqRiC7Gj8GgqmhVbnk=;
 b=Dz8JzZTVTOo9q8Ox1Vo90CQ5LtyLYbTaQKLE78KvPL0/5pTAFP+4KpEEyxB24HDTFCtA6e
 Wkixeo0/rPqg5eiXFsMW6dM5E9FIn0JgfDAkXy9JEoXIO/XWauaYtNHzWWP/5c26/Dwlqj
 XFI/FrgPIe9kUCz8nyF4Nj5bjvi60uo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-mbCEEtQlNV2GbyXyosO0mw-1; Sun, 26 Apr 2020 23:31:14 -0400
X-MC-Unique: mbCEEtQlNV2GbyXyosO0mw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 072B918FE863;
 Mon, 27 Apr 2020 03:31:13 +0000 (UTC)
Received: from [10.72.12.205] (ovpn-12-205.pek2.redhat.com [10.72.12.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57E371001281;
 Mon, 27 Apr 2020 03:31:07 +0000 (UTC)
Subject: Re: [PATCH V4 0/3] vdpa: Support config interrupt in vhost_vdpa
To: Zhu Lingshan <lingshan.zhu@intel.com>, mst@redhat.com,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <1587901406-27400-1-git-send-email-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ff2471ae-254e-7697-72b7-6601a561c3d9@redhat.com>
Date: Mon, 27 Apr 2020 11:31:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1587901406-27400-1-git-send-email-lingshan.zhu@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: lulu@redhat.com
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

Ck9uIDIwMjAvNC8yNiDkuIvljYg3OjQzLCBaaHUgTGluZ3NoYW4gd3JvdGU6Cj4gVGhpcyBzZXJp
ZXMgaW5jbHVkZXMgdHdvIHBhdGNoZXMsIG9uZSBpbnRyb2R1Y2VkCj4gY29uZmlnIGludGVycnVw
dCBzdXBwb3J0IGluIFZEUEEgY29yZSwgdGhlIG90aGVyCj4gb25lIGltcGxlbWVudGVkIGNvbmZp
ZyBpbnRlcnJ1cHQgaW4gSUZDVkYuCj4KPiBjaGFuZ2VzIGZyb20gVjM6Cj4gbW92ZSBjaGFuZ2Vz
IGluIGRyaXZlci92aG9zdC92aG9zdC5jIHRvIGEKPiBzZXBhcmF0ZWQgcGF0Y2guCj4KPiBjaGFu
Z2VzIGZyb20gVjI6Cj4gbW92ZSBWSE9TVF9GSUxFX1VOQklORCB0byB0aGUgdWFwaSBoZWFkZXIu
Cj4KPiBjaGFuZ2VzIGZyb20gVjE6Cj4gdmRwYTogbW9yZSBlZmZpY2llbnQgY29kZSB0byBoYW5k
bGUgZXZlbnRmZCB1bmJpbmQuCj4gaWZjdmY6IGFkZCBWSVJUSU9fTkVUX0ZfU1RBVFVTIGZlYXR1
cmUgYml0LgoKCjUuOCBtYXRlcmlhbCBJIHRoaW5rLgoKQWNrZWQtYnk6IEphc29uIFdhbmcgPGph
c293YW5nQHJlZGhhdC5jb20+CgoKPgo+IFpodSBMaW5nc2hhbiAoMyk6Cj4gICAgdmRwYTogU3Vw
cG9ydCBjb25maWcgaW50ZXJydXB0IGluIHZob3N0X3ZkcGEKPiAgICB2aG9zdDogcmVwbGFjZSAt
MSB3aXRoICBWSE9TVF9GSUxFX1VOQklORCBpbiBpb3RjbHMKPiAgICB2ZHBhOiBpbXBsZW1lbnQg
Y29uZmlnIGludGVycnVwdCBpbiBJRkNWRgo+Cj4gICBkcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZf
YmFzZS5jIHwgIDMgKysrCj4gICBkcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfYmFzZS5oIHwgIDMg
KysrCj4gICBkcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5jIHwgMjIgKysrKysrKysrKysr
KysrKysrLQo+ICAgZHJpdmVycy92aG9zdC92ZHBhLmMgICAgICAgICAgICB8IDQ3ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gICBkcml2ZXJzL3Zob3N0L3Zob3N0
LmMgICAgICAgICAgIHwgIDggKysrLS0tLQo+ICAgaW5jbHVkZS91YXBpL2xpbnV4L3Zob3N0Lmgg
ICAgICB8ICA0ICsrKysKPiAgIDYgZmlsZXMgY2hhbmdlZCwgODIgaW5zZXJ0aW9ucygrKSwgNSBk
ZWxldGlvbnMoLSkKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxp
bnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWls
bWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
