Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6967F1F4E0C
	for <lists.virtualization@lfdr.de>; Wed, 10 Jun 2020 08:21:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 14CDF815E5;
	Wed, 10 Jun 2020 06:21:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AZ7dBM9ic-on; Wed, 10 Jun 2020 06:21:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A26CC8142F;
	Wed, 10 Jun 2020 06:21:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 713ADC016F;
	Wed, 10 Jun 2020 06:21:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A2B43C016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 06:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9EFCD86D6E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 06:21:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PlJWvPU6R3t4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 06:21:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E3AFC83337
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 06:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591770080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uc/octOGcZckR4WPK7Q59lSObyrfP0K8f0dnKbVCbdY=;
 b=M9YycLBqwJCuEeq6WDyU7g1eENOapJ45XG0LZax+WbyrApnj2V3GpBCg1NdnapZXvwoVwj
 HDQc9FsfnQRxT/+uuwhnPlWJK2L4WhM5s14oppMaYAKbWxx19t5fzMTcR2mCEkTgNQgDVW
 I3TAINql+SvJ/TFFtRsmrVmvaiGsp3M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-K7Uw0uL6Mvukb4p4SrOfkg-1; Wed, 10 Jun 2020 02:21:18 -0400
X-MC-Unique: K7Uw0uL6Mvukb4p4SrOfkg-1
Received: by mail-wm1-f72.google.com with SMTP id j128so146203wmj.6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 09 Jun 2020 23:21:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=uc/octOGcZckR4WPK7Q59lSObyrfP0K8f0dnKbVCbdY=;
 b=tX5AQi9IGRTpwhfNURAg8dGLs09FhZK9uDUgj8wQTxaHUlOIlL6N41wiXH0qIoS6rq
 ptb4HhXVv6C/zMn7XeTHVMn7nLuaMssMDnVGtLeMsCDQWA5Kt4QnjNFtlz6ybUL1S7ta
 7TVHS5j8iRCCPO9NJKfsFBfugt8mFSINKwwv+GM4CEVic1NjdltoNtemAUSLLh9TJP0l
 odC8JCRuAtF5YDISFc1tF/ctP+8A6qYZygJ3fiCq9m+9Tn9iRkTZ+KlTUXH/dDdVoO87
 M6sZ7tG/h86SaAm7zvfTqErpWnEKLyoRMZrXw/WqbmsJwiOV+2wfzo5yCHWJahBLLcMh
 r1uw==
X-Gm-Message-State: AOAM532qYqWyTX5ATCvYBh2nsAPWA6MoloCB/5li65+RKhgTw4coNvls
 xVbp7rwINCWswrGcfyccdwGdwJOWgFzkFn0BQ2WaUfwTYw7diMnQe7YVhqhcy24gERFj8tyXzi5
 pnDOzoXXL3UgvRC1BxDBlIY0DEzPIN2Jtdm5doBiXfw==
X-Received: by 2002:a5d:6751:: with SMTP id l17mr1821678wrw.179.1591770077597; 
 Tue, 09 Jun 2020 23:21:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHqdcIuVzuBGZWdx6m8Gbz3kMm+7V/vk3O+qedxAg4WyGtib2ogQ4mFQ1rkbXMLTyCZzbW6Q==
X-Received: by 2002:a5d:6751:: with SMTP id l17mr1821589wrw.179.1591770076461; 
 Tue, 09 Jun 2020 23:21:16 -0700 (PDT)
Received: from redhat.com (bzq-79-181-55-232.red.bezeqint.net. [79.181.55.232])
 by smtp.gmail.com with ESMTPSA id d9sm6516480wre.28.2020.06.09.23.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 23:21:16 -0700 (PDT)
Date: Wed, 10 Jun 2020 02:21:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH RESEND V2] vdpa: introduce virtio pci driver
Message-ID: <20200610022030-mutt-send-email-mst@kernel.org>
References: <20200610054951.16197-1-jasowang@redhat.com>
 <20200610020728-mutt-send-email-mst@kernel.org>
 <0964bd2d-8329-a091-41ed-a9b912ec4283@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0964bd2d-8329-a091-41ed-a9b912ec4283@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gV2VkLCBKdW4gMTAsIDIwMjAgYXQgMDI6MTY6MjZQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzYvMTAg5LiL5Y2IMjowNywgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gV2VkLCBKdW4gMTAsIDIwMjAgYXQgMDE6NDk6NTFQTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPiA+ID4gVGhpcyBwYXRjaCBpbnRyb2R1Y2UgYSB2RFBBIGRyaXZlciBmb3Igdmly
dGlvLXBjaSBkZXZpY2UuIEl0IGJyaWRnZXMKPiA+ID4gdGhlIHZpcnRpby1wY2kgY29udHJvbCBj
b21tYW5kIHRvIHRoZSB2RFBBIGJ1cy4gVGhpcyB3aWxsIGJlIHVzZWQgZm9yCj4gPiA+IGRldmVs
b3BpbmcgbmV3IGZlYXR1cmVzIGZvciBib3RoIHNvZnR3YXJlIHZEUEEgZnJhbWV3b3JrIGFuZCBo
YXJkd2FyZQo+ID4gPiB2RFBBIGZlYXR1cmUuCj4gPiA+IAo+ID4gPiBDb21wYXJlZCB0byB2ZHBh
X3NpbSwgaXQgaGFzIHNldmVyYWwgYWR2YW50YWdlczoKPiA+ID4gCj4gPiA+IC0gaXQncyBhIHJl
YWwgZGV2aWNlIGRyaXZlciB3aGljaCBhbGxvdyB1cyB0byBwbGF5IHdpdGggcmVhbCBoYXJkd2Fy
ZQo+ID4gPiAgICBmZWF0dXJlcwo+ID4gPiAtIHR5cGUgaW5kZXBlbmRlbnQgaW5zdGVhZCBvZiBu
ZXR3b3JraW5nIHNwZWNpZmljCj4gPiA+IAo+ID4gPiBOb3RlIHRoYXQgc2luY2UgdmlydGlvIHNw
ZWNpZmljYXRpb24gZG9lcyBub3Qgc3VwcG9ydCBnZXQvcmVzdG9yZQo+ID4gPiB2aXJ0cXVldWUg
c3RhdGUuIFNvIHdlIGNhbiBub3QgdXNlIHRoaXMgZHJpdmVyIGZvciBWTS4gVGhpcyBjYW4gYmUK
PiA+ID4gYWRkcmVzc2VkIGJ5IGV4dGVuZGluZyB0aGUgdmlydGlvIHNwZWNpZmljYXRpb24uCj4g
PiA+IAo+ID4gPiBDb25zaWRlciB0aGUgZHJpdmVyIGlzIG1haW5seSBmb3IgdGVzdGluZyBhbmQg
ZGV2ZWxvcG1lbnQgZm9yIHZEUEEKPiA+ID4gZmVhdHVyZXMsIGl0IGNhbiBvbmx5IGJlIGJvdW5k
IHZpYSBkeW5hbWljIGlkcyB0byBtYWtlIHN1cmUgaXQncyBub3QKPiA+ID4gY29uZmxpY3Qgd2l0
aCB0aGUgZHJpdmVycyBsaWtlIHZpcnRpby1wY2kgb3IgSUZDVkYuCj4gPiA+IAo+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBKYXNvbiBXYW5nPGphc293YW5nQHJlZGhhdC5jb20+Cj4gPiBlcnJvcjogc2hh
MSBpbmZvcm1hdGlvbiBpcyBsYWNraW5nIG9yIHVzZWxlc3MgKGRyaXZlcnMvdmRwYS9LY29uZmln
KS4KPiA+IAo+ID4gd2hpY2ggdHJlZSBpcyB0aGlzIG9uIHRvcCBvZj8KPiAKPiAKPiBZb3VyIHZo
b3N0LmdpdCB2aG9zdCBicmFuY2gsIEhFQUQgaXMgYmJlYTNiY2ZkMWQ2IHZkcGE6IGZpeCB0eXBv
cyBpbiB0aGUKPiBjb21tZW50cyBmb3IgX192ZHBhX2FsbG9jX2RldmljZSgpCj4gCj4gRG8gSSBu
ZWVkIHRvIHVzZSBvdGhlciBicmFuY2g/Cj4gCj4gVGhhbmtzCgpObyBpdCdzIG9rLCBJIGFtIGp1
c3Qgd29uZGVyaW5nIHdoeSBkb2Vzbid0IGl0IGFwcGx5IHRoZW4uCgo+IAo+ID4gCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBt
YWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0
cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6
YXRpb24=
