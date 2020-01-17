Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CE9140619
	for <lists.virtualization@lfdr.de>; Fri, 17 Jan 2020 10:34:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 018732046C;
	Fri, 17 Jan 2020 09:34:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BHF9HgafkCr1; Fri, 17 Jan 2020 09:34:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 27408220DF;
	Fri, 17 Jan 2020 09:34:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 191C1C077D;
	Fri, 17 Jan 2020 09:34:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A7295C077D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 09:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A357F84549
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 09:34:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i1OKAAkq-ZPb
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 09:34:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0C47F8454F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 09:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579253668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zImW82m1PTihmZyDGaiVEDwS5NVR+NMTox5Q4NiymVk=;
 b=FguwRF6P3KDgLdObYJA1nLkj5xCJBp+gVGeZusCzufIV4mc7f3Ezaksn+in5zFh9xfGAk8
 iefXnFmxtS5JoExv32b3/vEEZMuzGbs4WR7W+t8n7s0zXsvaU375LTqjqMCq8BW4s7cJJn
 C8QZvWF/SXCe5ArRKF0Ztg749Wq/ThI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-Tiljfj8BNmWS7qs6djDupQ-1; Fri, 17 Jan 2020 04:34:27 -0500
X-MC-Unique: Tiljfj8BNmWS7qs6djDupQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC844800D48;
 Fri, 17 Jan 2020 09:34:24 +0000 (UTC)
Received: from [10.72.12.168] (ovpn-12-168.pek2.redhat.com [10.72.12.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 18BBB5D9CD;
 Fri, 17 Jan 2020 09:34:07 +0000 (UTC)
Subject: Re: [PATCH 1/5] vhost: factor out IOTLB
To: Randy Dunlap <rdunlap@infradead.org>, mst@redhat.com,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
References: <20200116124231.20253-1-jasowang@redhat.com>
 <20200116124231.20253-2-jasowang@redhat.com>
 <4a577560-d42a-eed2-97a0-42d2f91495e2@infradead.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <38b62ebe-9b9d-612b-acd3-0cbe4ae34db9@redhat.com>
Date: Fri, 17 Jan 2020 17:34:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4a577560-d42a-eed2-97a0-42d2f91495e2@infradead.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Ck9uIDIwMjAvMS8xNyDkuIvljYgxMjoxNCwgUmFuZHkgRHVubGFwIHdyb3RlOgo+IE9uIDEvMTYv
MjAgNDo0MiBBTSwgSmFzb24gV2FuZyB3cm90ZToKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhv
c3QvS2NvbmZpZyBiL2RyaXZlcnMvdmhvc3QvS2NvbmZpZwo+PiBpbmRleCAzZDAzY2NiZDFhZGMu
LmYyMWM0NWFhNWUwNyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy92aG9zdC9LY29uZmlnCj4+ICsr
KyBiL2RyaXZlcnMvdmhvc3QvS2NvbmZpZwo+PiBAQCAtMzYsNiArMzYsNyBAQCBjb25maWcgVkhP
U1RfVlNPQ0sKPj4gICAKPj4gICBjb25maWcgVkhPU1QKPj4gICAJdHJpc3RhdGUKPj4gKyAgICAg
ICAgZGVwZW5kcyBvbiBWSE9TVF9JT1RMQgo+PiAgIAktLS1oZWxwLS0tCj4+ICAgCSAgVGhpcyBv
cHRpb24gaXMgc2VsZWN0ZWQgYnkgYW55IGRyaXZlciB3aGljaCBuZWVkcyB0byBhY2Nlc3MKPj4g
ICAJICB0aGUgY29yZSBvZiB2aG9zdC4KPj4gQEAgLTU0LDMgKzU1LDkgQEAgY29uZmlnIFZIT1NU
X0NST1NTX0VORElBTl9MRUdBQ1kKPj4gICAJICBhZGRzIHNvbWUgb3ZlcmhlYWQsIGl0IGlzIGRp
c2FibGVkIGJ5IGRlZmF1bHQuCj4+ICAgCj4+ICAgCSAgSWYgdW5zdXJlLCBzYXkgIk4iLgo+PiAr
Cj4+ICtjb25maWcgVkhPU1RfSU9UTEIKPj4gKwl0cmlzdGF0ZQo+PiArICAgICAgICBkZWZhdWx0
IG0KPj4gKyAgICAgICAgaGVscAo+PiArICAgICAgICAgIEdlbmVyaWMgSU9UTEIgaW1wbGVtZW50
YXRpb24gZm9yIHZob3N0IGFuZCB2cmluZ2guCj4gVXNlIHRhYiArIDIgc3BhY2VzIGZvciBLY29u
ZmlnIGluZGVudGF0aW9uLgoKCldpbGwgZml4LgoKSSB3b25kZXIgd2h5IGNoZWNrcGF0aCBkb2Vz
bid0IGNvbXBsYWluIGFib3V0IHRoaXMgOikKClRoYW5rcwoKCj4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlz
dApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3Rz
LmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
