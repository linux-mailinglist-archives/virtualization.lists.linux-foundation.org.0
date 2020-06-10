Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A01541F4D23
	for <lists.virtualization@lfdr.de>; Wed, 10 Jun 2020 07:44:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 75DD620443;
	Wed, 10 Jun 2020 05:44:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gfqs8+k9nTjz; Wed, 10 Jun 2020 05:44:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3F28A220C2;
	Wed, 10 Jun 2020 05:44:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E894C016F;
	Wed, 10 Jun 2020 05:44:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3090EC016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 05:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 190D986F2B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 05:44:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jk2khOzMW2Xr
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 05:44:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6268986F28
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 05:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591767884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UfSVmrCHCCa+bGByZwONkn+ZSARIgzp8QM/tmIKlltk=;
 b=L0Tl9bBdV/GU4pFpdzCVBqeToqzg6BcioCYX8J6eW/sqQOueepjMj6p60kXwFwb4vtBa4p
 /fNYOAgpI5INgHsTRthtVnQuBwaX4Eou50UdqkvXqAKQQum+fC3S9UPXN3dXPHUV/EQga7
 y6afWkZFZaX2Fvf+OAzz1IoEtI+9ccc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-CJp_Q_ANOWW3kkcFEqoNuA-1; Wed, 10 Jun 2020 01:44:42 -0400
X-MC-Unique: CJp_Q_ANOWW3kkcFEqoNuA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3203B1005510;
 Wed, 10 Jun 2020 05:44:40 +0000 (UTC)
Received: from [10.72.13.194] (ovpn-13-194.pek2.redhat.com [10.72.13.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D8621001B2B;
 Wed, 10 Jun 2020 05:44:31 +0000 (UTC)
Subject: Re: [PATCH V2] vdpa: introduce virtio pci driver
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200610035920.12078-1-jasowang@redhat.com>
 <20200610004641-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <eaa0739f-4c4b-3ca5-c57d-5962b3c3dbc0@redhat.com>
Date: Wed, 10 Jun 2020 13:44:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200610004641-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: shahafs@mellanox.com, lulu@redhat.com, saugatm@xilinx.com,
 mhabets@solarflare.com, vmireyno@marvell.com, linux-kernel@vger.kernel.org,
 gdawar@xilinx.com, virtualization@lists.linux-foundation.org,
 eperezma@redhat.com, hanand@xilinx.com, zhangweining@ruijie.com.cn,
 eli@mellanox.com, lingshan.zhu@intel.com, rob.miller@broadcom.com
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

Ck9uIDIwMjAvNi8xMCDkuIvljYgxMjo0NywgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+IE9u
IFdlZCwgSnVuIDEwLCAyMDIwIGF0IDExOjU5OjIwQU0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6
Cj4+IFRoaXMgcGF0Y2ggaW50cm9kdWNlIGEgdkRQQSBkcml2ZXIgZm9yIHZpcnRpby1wY2kgZGV2
aWNlLiBJdCBicmlkZ2VzCj4+IHRoZSB2aXJ0aW8tcGNpIGNvbnRyb2wgY29tbWFuZCB0byB0aGUg
dkRQQSBidXMuIFRoaXMgd2lsbCBiZSB1c2VkIGZvcgo+PiBkZXZlbG9waW5nIG5ldyBmZWF0dXJl
cyBmb3IgYm90aCBzb2Z0d2FyZSB2RFBBIGZyYW1ld29yayBhbmQgaGFyZHdhcmUKPj4gdkRQQSBm
ZWF0dXJlLgo+IFRoZSBtYWlsIGhlYWRlcnMgYXJlIG1haWxmb3JtZWQgaGVyZToKPgo+IENvbnRl
bnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1hCj4KPiBzbyBnaXQgYW0gY2FuJ3QgcGFyc2Ug
aXQ6Cj4KPiBlcnJvcjogY2Fubm90IGNvbnZlcnQgZnJvbSBhIHRvIFVURi04Cj4gZmF0YWw6IGNv
dWxkIG5vdCBwYXJzZSBwYXRjaAoKCk15IGJhZCwgbGV0IG1lIHJlcG9zdC4KClRoYW5rcwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRp
b24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3Jn
Cmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1
YWxpemF0aW9u
