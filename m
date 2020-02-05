Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BA5152523
	for <lists.virtualization@lfdr.de>; Wed,  5 Feb 2020 04:11:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 31A018561E;
	Wed,  5 Feb 2020 03:11:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TP3U9uGLvPea; Wed,  5 Feb 2020 03:11:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6F6EC85B73;
	Wed,  5 Feb 2020 03:11:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 52B12C0174;
	Wed,  5 Feb 2020 03:11:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94024C0174
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 03:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8575581E3F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 03:11:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eFCFp7BxtoVY
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 03:11:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0DF2F814F1
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 03:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580872287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=om97GEVSncDJoKUqo0m8J3j6AU1bMxcse0uk6TffhCM=;
 b=A5AkKv7GLFnT2eXTnbIR4CjiAIySxEQNACkZJ/nMdcUwj7tgBOchdNtR5PzZJ+4XmEe6jO
 6irU9cFJbtEr/eC68W0tRVqoECeb1DRENHis63dBMhRVay19rfDqQfTg706YJpWBXrUV4H
 +H5I9/JURytqbg/Cd+ndctjqecGitiM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-LmJy843xOnG34ARnkUMuyQ-1; Tue, 04 Feb 2020 22:11:25 -0500
X-MC-Unique: LmJy843xOnG34ARnkUMuyQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5499618AB2C0;
 Wed,  5 Feb 2020 03:11:23 +0000 (UTC)
Received: from [10.72.13.188] (ovpn-13-188.pek2.redhat.com [10.72.13.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5734C87B12;
 Wed,  5 Feb 2020 03:11:10 +0000 (UTC)
Subject: Re: [PATCH] vhost: introduce vDPA based backend
To: Tiwei Bie <tiwei.bie@intel.com>
References: <20200131033651.103534-1-tiwei.bie@intel.com>
 <7aab2892-bb19-a06a-a6d3-9c28bc4c3400@redhat.com>
 <20200205020247.GA368700@___>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ad1707a0-7884-1329-52c6-8139230a930c@redhat.com>
Date: Wed, 5 Feb 2020 11:11:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200205020247.GA368700@___>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: kvm@vger.kernel.org, mst@redhat.com, mhabets@solarflare.com,
 virtualization@lists.linux-foundation.org, jgg@mellanox.com,
 rob.miller@broadcom.com, lulu@redhat.com, maxime.coquelin@redhat.com,
 hch@infradead.org, eperezma@redhat.com, haotian.wang@sifive.com,
 shahafs@mellanox.com, parav@mellanox.com, jiri@mellanox.com,
 zhihong.wang@intel.com, netdev@vger.kernel.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, hanand@xilinx.com, lingshan.zhu@intel.com
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

Ck9uIDIwMjAvMi81IOS4iuWNiDEwOjAyLCBUaXdlaSBCaWUgd3JvdGU6Cj4+IEJlZm9yZSB0cnlp
bmcgdG8gZG8gdGhpcyBpdCBsb29rcyB0byBtZSB3ZSBuZWVkIHRoZSBmb2xsb3dpbmcgZHVyaW5n
IHRoZQo+PiBwcm9iZQo+Pgo+PiAxKSBpZiBzZXRfbWFwKCkgaXMgbm90IHN1cHBvcnRlZCBieSB0
aGUgdkRQQSBkZXZpY2UgcHJvYmUgdGhlIElPTU1VIHRoYXQgaXMKPj4gc3VwcG9ydGVkIGJ5IHRo
ZSB2RFBBIGRldmljZQo+PiAyKSBhbGxvY2F0ZSBJT01NVSBkb21haW4KPj4KPj4gQW5kIHRoZW46
Cj4+Cj4+IDMpIHBpbiBwYWdlcyB0aHJvdWdoIEdVUCBhbmQgZG8gcHJvcGVyIGFjY291bnRpbmcK
Pj4gNCkgc3RvcmUgR1BBLT5IUEEgbWFwcGluZyBpbiB0aGUgdW1lbQo+PiA1KSBnZW5lcmF0ZSBk
aWZmcyBvZiBtZW1vcnkgdGFibGUgYW5kIHVzaW5nIElPTU1VIEFQSSB0byBzZXR1cCB0aGUgZG1h
Cj4+IG1hcHBpbmcgaW4gdGhpcyBtZXRob2QKPj4KPj4gRm9yIDEpLCBJJ20gbm90IHN1cmUgcGFy
ZW50IGlzIHN1ZmZpY2llbnQgZm9yIHRvIGRvaW5nIHRoaXMgb3IgbmVlZCB0bwo+PiBpbnRyb2R1
Y2UgbmV3IEFQSSBsaWtlIGlvbW11X2RldmljZSBpbiBtZGV2Lgo+IEFncmVlLiBXZSBtYXkgYWxz
byBuZWVkIHRvIGludHJvZHVjZSBzb21ldGhpbmcgbGlrZQo+IHRoZSBpb21tdV9kZXZpY2UuCj4K
ClJpZ2h0LCB0aGlzIGlzIHdoYXQgSSBwbGFuIHRvIGRvIGluIG5leHQgdmVyc2lvbi4KClRoYW5r
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVh
bGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRp
b24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3ZpcnR1YWxpemF0aW9u
