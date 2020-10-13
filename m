Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDF428C851
	for <lists.virtualization@lfdr.de>; Tue, 13 Oct 2020 07:41:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C3AA627400;
	Tue, 13 Oct 2020 05:41:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4dDQD1EJSbPV; Tue, 13 Oct 2020 05:41:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DD0E927404;
	Tue, 13 Oct 2020 05:41:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B81B3C0051;
	Tue, 13 Oct 2020 05:41:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 83A5CC0051
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Oct 2020 05:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6A8C287A60
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Oct 2020 05:41:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OOcpmFZjrmfv
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Oct 2020 05:41:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8FED687A5D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Oct 2020 05:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602567663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=an1gCRpqueGjFmWqkLo6oeT53oDVqi18CPdvDvMunMk=;
 b=X3ve+OGg2MPMo+vkoCD/dib5jC633PZUlK3NfQEkMV1ZQhCZsGjDy9gTxzTd42CK4MUt7f
 +6EbGbEofCfwBS3LBGmiQ7cYqrEeGGAa29tv5vWcA7rduYDh56cAV6S3fQvMXgIBqS/46g
 ZwBK3p89bj4z9RsAg1rwtO41Erb+Kxc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-wFv5dTD3NV6L4xTTMKvdjg-1; Tue, 13 Oct 2020 01:41:01 -0400
X-MC-Unique: wFv5dTD3NV6L4xTTMKvdjg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E71C21018F63;
 Tue, 13 Oct 2020 05:40:59 +0000 (UTC)
Received: from [10.72.13.59] (ovpn-13-59.pek2.redhat.com [10.72.13.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B11261A92A;
 Tue, 13 Oct 2020 05:40:45 +0000 (UTC)
Subject: Re: [RFC PATCH 10/24] vdpa: introduce config operations for
 associating ASID to a virtqueue group
To: Eli Cohen <elic@nvidia.com>
References: <20200924032125.18619-1-jasowang@redhat.com>
 <20200924032125.18619-11-jasowang@redhat.com>
 <20201001132927.GC32363@mtl-vdi-166.wap.labs.mlnx>
 <70af3ff0-74ed-e519-56f5-d61e6a48767f@redhat.com>
 <20201012065931.GA42327@mtl-vdi-166.wap.labs.mlnx>
 <b1ac150b-0845-874f-75d0-7440133a1d41@redhat.com>
 <20201012081725.GB42327@mtl-vdi-166.wap.labs.mlnx>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <3e4a8bea-f187-3843-c1d1-75d0b86a137b@redhat.com>
Date: Tue, 13 Oct 2020 13:40:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201012081725.GB42327@mtl-vdi-166.wap.labs.mlnx>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: lulu@redhat.com, kvm@vger.kernel.org, mst@redhat.com,
 netdev@vger.kernel.org, mhabets@solarflare.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 hanand@xilinx.com, stefanha@redhat.com, maxime.coquelin@redhat.com,
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

Ck9uIDIwMjAvMTAvMTIg5LiL5Y2INDoxNywgRWxpIENvaGVuIHdyb3RlOgo+IE9uIE1vbiwgT2N0
IDEyLCAyMDIwIGF0IDAzOjQ1OjEwUE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+PiBTbyBp
biB0aGVvcnkgd2UgY2FuIGhhdmUgc2V2ZXJhbCBhc2lkJ3MgKGZvciBkaWZmZXJlbnQgdmlydHF1
ZXVlcyksIGVhY2gKPj4+IG9uZSBzaG91bGQgYmUgZm9sbG93ZWQgYnkgYSBzcGVjaWZpYyBzZXRf
bWFwIGNhbGwuIElmIHRoaXMgaXMgc28sIGhvdyBkbwo+Pj4gSSBrbm93IGlmIEkgbWV0IGFsbCB0
aGUgY29uZGl0aW9ucyBydW4gbXkgZHJpdmVyPyBNYXliZSB3ZSBuZWVkIGFub3RoZXIKPj4+IGNh
bGxiYWNrIHRvIGxldCB0aGUgZHJpdmVyIGtub3cgaXQgc2hvdWxkIG5vdCBleHBlY3QgbW9yZSBz
ZXRfbWFwcygpLgo+Pgo+PiBUaGlzIHNob3VsZCB3b3JrIHNpbWlsYXJseSBhcyBpbiB0aGUgcGFz
dC4gVHdvIHBhcnRzIG9mIHRoZSB3b3JrIGlzIGV4cGVjdGVkCj4+IHRvIGJlIGRvbmUgYnkgdGhl
IGRyaXZlcjoKPj4KPj4gMSkgc3RvcmUgdGhlIG1hcHBpbmcgc29tZXdoZXJlIChlLmcgaGFyZHdh
cmUpIGR1cmluZyBzZXRfbWFwKCkKPj4gMikgYXNzb2NpYXRpbmcgbWFwcGluZyB3aXRoIGEgc3Bl
Y2lmaWMgdmlydHF1ZXVlCj4+Cj4+IFRoZSBvbmx5IGRpZmZlcmVuY2UgaXMgdGhhdCBtb3JlIHRo
YW4gb25lIG1hcHBpbmcgaXMgdXNlZCBub3cuCj4gb2ssIHNvIGxpa2UgdG9kYXksIEkgd2lsbCBh
bHdheXMgZ2V0IERSSVZFUl9PSyBhZnRlciBJIGdvdCBhbGwgdGhlCj4gc2V0X21hcHMoKSwgcmln
aHQ/CgoKWWVzLgoKVGhhbmtzCgoKPgo+PiBGb3IgdGhlIGlzc3VlIG9mIG1vcmUgc2V0X21hcHMo
KSwgZHJpdmVyIHNob3VsZCBiZSBhbHdheXMgcmVhZHkgZm9yIHRoZSBuZXcKPj4gc2V0X21hcHMo
KSBjYWxsIGluc3RlYWQgb2Ygbm90IGV4cGVjdGluZyBuZXcgc2V0X21hcHMoKSBzaW5jZSBndWVz
dCBtZW1vcnkKPj4gdG9wb2xvZ3kgY291bGQgYmUgY2hhbmdlZCBkdWUgdG8gc2V2ZXJhbCByZWFz
b25zLgo+Pgo+PiBRZW11IG9yIHZob3N0LXZEUEEgd2lsbCB0cnkgdGhlaXIgYmVzdCB0byBhdm9p
ZCB0aGUgZnJlcXVlbmN5IG9mIHNldF9tYXBzKCkKPj4gZm9yIGJldHRlciBwZXJmb3JtYW5jZSAo
ZS5nIHRocm91Z2ggYmF0Y2hlZCBJT1RMQiB1cGRhdGluZykuIEUuZyB0aGVyZQo+PiBzaG91bGQg
YmUgYXQgbW9zdCBvbmUgc2V0X21hcCgpIGR1cmluZyBvbmUgdGltZSBvZiBndWVzdCBib290aW5n
Lgo+Pgo+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3ZpcnR1YWxpemF0aW9u
