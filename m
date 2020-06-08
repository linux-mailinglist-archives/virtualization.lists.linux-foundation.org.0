Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 148271F15EE
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 11:55:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4C8BA879A7;
	Mon,  8 Jun 2020 09:55:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sGfTWILZhmF6; Mon,  8 Jun 2020 09:55:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D131587EB0;
	Mon,  8 Jun 2020 09:55:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1691C016F;
	Mon,  8 Jun 2020 09:55:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 06861C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E937E8778F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:55:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IPy0iEdVWjM7
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:55:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 601AA87447
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591610106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zwRQYwEhlzI9fhHIuV2ZDsHSs0DHTOaRaWRbv3sTP+c=;
 b=d/12E/PTZZOS/m71x9FcAvx0JclAsrIKYJnZ3jHZtixotEEjN547/6UBhSSmi41G0KUuPB
 pqZqIjVfdUC7xacohLVbGSNhF9IjRUTWyr5NnKCVoACZ6rqu96iLbqaQpntQFBXeKK0npj
 wXTsg66DIgitT1UHYMUPnFhY9jeC4gI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-VglqavcaOgONhBEaiMI0Xg-1; Mon, 08 Jun 2020 05:55:04 -0400
X-MC-Unique: VglqavcaOgONhBEaiMI0Xg-1
Received: by mail-wm1-f72.google.com with SMTP id h6so3747191wmb.7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 08 Jun 2020 02:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=zwRQYwEhlzI9fhHIuV2ZDsHSs0DHTOaRaWRbv3sTP+c=;
 b=hpFVK7s+k1dTLrVnNEwr+fCl5V9TmeJmxGCcdPUAzdOnNDHcVEY1+YLOTzmnskvDm3
 iGVrWJ1HhWrhDg86u/rkbfe/UM8U25JwdrDw+wF90cMmt+aZP8ElmG3gyFxH9u8EKeL0
 VK314ZWZ3ZlAG5Ov+RvY0nw+4g6GFC39kdYczJjuN4fqZUat8NyDSLeeXQa7rHIEChkz
 yLlwdio2IVTIoPmS5Erc8VkUClUb6tiRrEOmHZ3OGNRLHkAF9UPr+NN1YVky5E3tB+oZ
 mlElzMl6+FHEvHAZkZC0ZMBZI2Kju2kZcD+W4k+CTppAGnuMjzbV+1woHTbT0qYpwKRE
 M33w==
X-Gm-Message-State: AOAM53237ZXZCceq6xVIAIFJgA6LCinkYlP9CnrMX/i+ckwViwz4IS4b
 cUSNluQ6kyqyFaXgeoSyIZy1wq0lRXbp3IRDdE7SD7WzWuin9NvMYF1gjTlg/SP4tokv011SOII
 nprWIrBFFZQSifMZHVFPWinNWEZkz0eQby6yNi6yzDw==
X-Received: by 2002:a7b:cf06:: with SMTP id l6mr15633409wmg.63.1591610103134; 
 Mon, 08 Jun 2020 02:55:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyikeAcTqFLpMRWXI7wepdD3aO0/ujjV4fOTEz+k46ZIFoeVHzdsv1BhrAhul2cvz6zw90caQ==
X-Received: by 2002:a7b:cf06:: with SMTP id l6mr15633384wmg.63.1591610102957; 
 Mon, 08 Jun 2020 02:55:02 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 o15sm23160537wrv.48.2020.06.08.02.55.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 02:55:02 -0700 (PDT)
Date: Mon, 8 Jun 2020 05:54:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 5/6] vdpa: introduce virtio pci driver
Message-ID: <20200608055331-mutt-send-email-mst@kernel.org>
References: <5dbb0386-beeb-5bf4-d12e-fb5427486bb8@redhat.com>
 <6b1d1ef3-d65e-08c2-5b65-32969bb5ecbc@redhat.com>
 <20200607095012-mutt-send-email-mst@kernel.org>
 <9b1abd2b-232c-aa0f-d8bb-03e65fd47de2@redhat.com>
 <20200608021438-mutt-send-email-mst@kernel.org>
 <a1b1b7fb-b097-17b7-2e3a-0da07d2e48ae@redhat.com>
 <20200608052041-mutt-send-email-mst@kernel.org>
 <9d2571b6-0b95-53b3-6989-b4d801eeb623@redhat.com>
 <20200608054453-mutt-send-email-mst@kernel.org>
 <bc27064c-2309-acf3-ccd8-6182bfa2a4cd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <bc27064c-2309-acf3-ccd8-6182bfa2a4cd@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gTW9uLCBKdW4gMDgsIDIwMjAgYXQgMDU6NDY6NTJQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzYvOCDkuIvljYg1OjQ1LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6
Cj4gPiBPbiBNb24sIEp1biAwOCwgMjAyMCBhdCAwNTo0Mzo1OFBNICswODAwLCBKYXNvbiBXYW5n
IHdyb3RlOgo+ID4gPiA+ID4gTG9va2luZyBhdAo+ID4gPiA+ID4gcGNpX21hdGNoX29uZV9kZXZp
Y2UoKSBpdCBjaGVja3MgYm90aCBzdWJ2ZW5kb3IgYW5kIHN1YmRldmljZSB0aGVyZS4KPiA+ID4g
PiA+IAo+ID4gPiA+ID4gVGhhbmtzCj4gPiA+ID4gQnV0IElJVUMgdGhlcmUgaXMgbm8gZ3VhcmFu
dGVlIHRoYXQgZHJpdmVyIHdpdGggYSBzcGVjaWZpYyBzdWJ2ZW5kb3IKPiA+ID4gPiBtYXRjaGVz
IGluIHByZXNlbmNlIG9mIGEgZ2VuZXJpYyBvbmUuCj4gPiA+ID4gU28gZWl0aGVyIElGQyBvciB2
aXJ0aW8gcGNpIGNhbiB3aW4sIHdoaWNoZXZlciBiaW5kcyBmaXJzdC4KPiA+ID4gCj4gPiA+IEkn
bSBub3Qgc3VyZSBJIGdldCB0aGVyZS4gQnV0IEkgdHJ5IG1hbnVhbGx5IGJpbmQgSUZDVkYgdG8g
cWVtdSdzCj4gPiA+IHZpcnRpby1uZXQtcGNpLCBhbmQgaXQgZmFpbHMuCj4gPiA+IAo+ID4gPiBU
aGFua3MKPiA+IFJpZ2h0IGJ1dCB0aGUgcmV2ZXJzZSBjYW4gaGFwcGVuOiB2aXJ0aW8tbmV0IGNh
biBiaW5kIHRvIElGQ1ZGIGZpcnN0Lgo+IAo+IAo+IFRoYXQncyBraW5kIG9mIGV4cGVjdGVkLiBU
aGUgUEYgaXMgZXhwZWN0ZWQgdG8gYmUgYm91bmQgdG8gdmlydGlvLXBjaSB0bwo+IGNyZWF0ZSBW
RiB2aWEgc3lzZnMuCj4gCj4gVGhhbmtzCj4gCj4gCj4gCgpPbmNlIFZGcyBhcmUgY3JlYXRlZCwg
ZG9uJ3Qgd2Ugd2FudCBJRkNWRiB0byBiaW5kIHJhdGhlciB0aGFuCnZpcnRpby1wY2k/CgotLSAK
TVNUCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0
dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRh
dGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGlu
Zm8vdmlydHVhbGl6YXRpb24=
