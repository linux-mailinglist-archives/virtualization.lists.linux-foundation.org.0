Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A84E1F4DFD
	for <lists.virtualization@lfdr.de>; Wed, 10 Jun 2020 08:16:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2121287E98;
	Wed, 10 Jun 2020 06:16:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q5YKjntCe1Nu; Wed, 10 Jun 2020 06:16:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1AB5087E43;
	Wed, 10 Jun 2020 06:16:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09C0BC016F;
	Wed, 10 Jun 2020 06:16:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 02B40C016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 06:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E1B6E86E1F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 06:16:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r8nZ6bgRE0RD
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 06:16:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A921386DF7
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 06:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591769802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dd9hSPJklMgRKnOtvAiPIti1OIPB2Shfs7YNJkiFzA4=;
 b=GVm7W76tlsDcUpl2Xh1akyyVsyNooe8HF/ECIB8/+rn6p06tWxU3Eg1ATZb5K153HivOlT
 1l1hz8BHVZEjk3PIfxoG3ey7mVv2oFT+Jtic5SW3EBX0p3MxdyJLg0hw8LbnIcISfYHPD3
 PgIURN/Pk8HNNjOjCbb+HCdAvfNunZw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-WyxVb7iaOrqXm3GFQIDRNg-1; Wed, 10 Jun 2020 02:16:37 -0400
X-MC-Unique: WyxVb7iaOrqXm3GFQIDRNg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AA56107ACCD;
 Wed, 10 Jun 2020 06:16:35 +0000 (UTC)
Received: from [10.72.13.194] (ovpn-13-194.pek2.redhat.com [10.72.13.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC6895D9D3;
 Wed, 10 Jun 2020 06:16:27 +0000 (UTC)
Subject: Re: [PATCH RESEND V2] vdpa: introduce virtio pci driver
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200610054951.16197-1-jasowang@redhat.com>
 <20200610020728-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <0964bd2d-8329-a091-41ed-a9b912ec4283@redhat.com>
Date: Wed, 10 Jun 2020 14:16:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200610020728-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Ck9uIDIwMjAvNi8xMCDkuIvljYgyOjA3LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
V2VkLCBKdW4gMTAsIDIwMjAgYXQgMDE6NDk6NTFQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gVGhpcyBwYXRjaCBpbnRyb2R1Y2UgYSB2RFBBIGRyaXZlciBmb3IgdmlydGlvLXBjaSBkZXZp
Y2UuIEl0IGJyaWRnZXMKPj4gdGhlIHZpcnRpby1wY2kgY29udHJvbCBjb21tYW5kIHRvIHRoZSB2
RFBBIGJ1cy4gVGhpcyB3aWxsIGJlIHVzZWQgZm9yCj4+IGRldmVsb3BpbmcgbmV3IGZlYXR1cmVz
IGZvciBib3RoIHNvZnR3YXJlIHZEUEEgZnJhbWV3b3JrIGFuZCBoYXJkd2FyZQo+PiB2RFBBIGZl
YXR1cmUuCj4+Cj4+IENvbXBhcmVkIHRvIHZkcGFfc2ltLCBpdCBoYXMgc2V2ZXJhbCBhZHZhbnRh
Z2VzOgo+Pgo+PiAtIGl0J3MgYSByZWFsIGRldmljZSBkcml2ZXIgd2hpY2ggYWxsb3cgdXMgdG8g
cGxheSB3aXRoIHJlYWwgaGFyZHdhcmUKPj4gICAgZmVhdHVyZXMKPj4gLSB0eXBlIGluZGVwZW5k
ZW50IGluc3RlYWQgb2YgbmV0d29ya2luZyBzcGVjaWZpYwo+Pgo+PiBOb3RlIHRoYXQgc2luY2Ug
dmlydGlvIHNwZWNpZmljYXRpb24gZG9lcyBub3Qgc3VwcG9ydCBnZXQvcmVzdG9yZQo+PiB2aXJ0
cXVldWUgc3RhdGUuIFNvIHdlIGNhbiBub3QgdXNlIHRoaXMgZHJpdmVyIGZvciBWTS4gVGhpcyBj
YW4gYmUKPj4gYWRkcmVzc2VkIGJ5IGV4dGVuZGluZyB0aGUgdmlydGlvIHNwZWNpZmljYXRpb24u
Cj4+Cj4+IENvbnNpZGVyIHRoZSBkcml2ZXIgaXMgbWFpbmx5IGZvciB0ZXN0aW5nIGFuZCBkZXZl
bG9wbWVudCBmb3IgdkRQQQo+PiBmZWF0dXJlcywgaXQgY2FuIG9ubHkgYmUgYm91bmQgdmlhIGR5
bmFtaWMgaWRzIHRvIG1ha2Ugc3VyZSBpdCdzIG5vdAo+PiBjb25mbGljdCB3aXRoIHRoZSBkcml2
ZXJzIGxpa2UgdmlydGlvLXBjaSBvciBJRkNWRi4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFzb24g
V2FuZzxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+IGVycm9yOiBzaGExIGluZm9ybWF0aW9uIGlzIGxh
Y2tpbmcgb3IgdXNlbGVzcyAoZHJpdmVycy92ZHBhL0tjb25maWcpLgo+Cj4gd2hpY2ggdHJlZSBp
cyB0aGlzIG9uIHRvcCBvZj8KCgpZb3VyIHZob3N0LmdpdCB2aG9zdCBicmFuY2gsIEhFQUQgaXMg
YmJlYTNiY2ZkMWQ2IHZkcGE6IGZpeCB0eXBvcyBpbiB0aGUgCmNvbW1lbnRzIGZvciBfX3ZkcGFf
YWxsb2NfZGV2aWNlKCkKCkRvIEkgbmVlZCB0byB1c2Ugb3RoZXIgYnJhbmNoPwoKVGhhbmtzCgoK
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVh
bGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRp
b24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3ZpcnR1YWxpemF0aW9u
