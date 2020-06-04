Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0171EEA89
	for <lists.virtualization@lfdr.de>; Thu,  4 Jun 2020 20:50:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A4F5B88A3D;
	Thu,  4 Jun 2020 18:50:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hsAUg9wBtJQH; Thu,  4 Jun 2020 18:50:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2EC8188908;
	Thu,  4 Jun 2020 18:50:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1CFB6C0893;
	Thu,  4 Jun 2020 18:50:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5EA26C016E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 18:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5A1F8878C0
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 18:50:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vZsZiD4vcGtz
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 18:50:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A4BA88638F
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 18:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591296644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W6snlKjU8aRgZULuYnJpe7wNQI9bh2ev/bXaAzVSEvQ=;
 b=WmLl8KBQrOUEGCtp9YoGxmRFPdxgBNUh+NdrV+asBoOHDzqPKZqPR3GVYCyZoBJ11FbsJW
 WI1eq9K3RFxYiMoxl0uITD4p6j2d6B3LM24Hhi8G/BE/hO06XSM0HWUzqFqd0c4V5H1B6Z
 UgoqP4RLZ5z4hCdhuLhlMBFdIRHLmjI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-QDAaXo-7Po6a-iQGO0WwQg-1; Thu, 04 Jun 2020 14:50:42 -0400
X-MC-Unique: QDAaXo-7Po6a-iQGO0WwQg-1
Received: by mail-wr1-f70.google.com with SMTP id z10so2797671wrs.2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 04 Jun 2020 11:50:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=W6snlKjU8aRgZULuYnJpe7wNQI9bh2ev/bXaAzVSEvQ=;
 b=bFv9mJjxk5VchPIhh9gu7+HdoThIDXZDPxCMohbH5drNIBuKommwCSqCMrouRuC5Cp
 RvjYtEDmid+wIddkiiVPyqC9QR/PJt+E+XhW1x5njzR43GQih/lp5WaN3x0gqF6mYlHT
 v6Ru7OIdCt00jDb7vGonwzA+oAsLVLCMfDYh1dSgwpXM4mRjoPM8/YgC2SYIxE17d6aT
 xZOXfn4glPhZhVRGaXq4F3X2UuN0XLpaNj8uKN1tz711YtOgcBCdvceMJUo6Szqw7AY4
 ly8TICF43to/fUeF73nLwLpfkKXOLb7l1m4hjqt1P403gzLrgzixQTCtjYX0TJNfUy9E
 ylTw==
X-Gm-Message-State: AOAM532NGZMVP1LDD3IK7Ho+gxies1ZA2eKljDMYtMxYnfyjBvMZf7GC
 NSEcqgxBrhQzWVXhk8qDU3lvfGHubyGe8qZrBvcUBybdfnxh3AsUnzfwUKrXYxbEeQZomhtCNT1
 9oBtwMY2ferDEFALWlzZQsJBw/nsaRP6P4/bhRcmMFA==
X-Received: by 2002:a1c:b656:: with SMTP id g83mr5563944wmf.151.1591296641701; 
 Thu, 04 Jun 2020 11:50:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFWuENQHpNppZbCtXmj/W7gbwDx2OeFjgcac3birrs4llztufXXrEhiTnzIxGTS74oUPNMZw==
X-Received: by 2002:a1c:b656:: with SMTP id g83mr5563911wmf.151.1591296641446; 
 Thu, 04 Jun 2020 11:50:41 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 d24sm8081830wmb.45.2020.06.04.11.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 11:50:40 -0700 (PDT)
Date: Thu, 4 Jun 2020 14:50:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 5/6] vdpa: introduce virtio pci driver
Message-ID: <20200604145002-mutt-send-email-mst@kernel.org>
References: <20200529080303.15449-1-jasowang@redhat.com>
 <20200529080303.15449-6-jasowang@redhat.com>
 <20200602010809-mutt-send-email-mst@kernel.org>
 <e722bb62-2a72-779a-f542-1096e8f609b8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e722bb62-2a72-779a-f542-1096e8f609b8@redhat.com>
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

T24gVHVlLCBKdW4gMDIsIDIwMjAgYXQgMDM6MTI6MjdQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzYvMiDkuIvljYgxOjA5LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6
Cj4gPiBPbiBGcmksIE1heSAyOSwgMjAyMCBhdCAwNDowMzowMlBNICswODAwLCBKYXNvbiBXYW5n
IHdyb3RlOgo+ID4gPiBOb3RlIHRoYXQgc2luY2UgdmlydGlvIHNwZWNpZmljYXRpb24gZG9lcyBu
b3Qgc3VwcG9ydCBnZXQvcmVzdG9yZQo+ID4gPiB2aXJ0cXVldWUgc3RhdGUuIFNvIHdlIGNhbiBu
b3QgdXNlIHRoaXMgZHJpdmVyIGZvciBWTS4gVGhpcyBjYW4gYmUKPiA+ID4gYWRkcmVzc2VkIGJ5
IGV4dGVuZGluZyB0aGUgdmlydGlvIHNwZWNpZmljYXRpb24uCj4gPiBMb29rcyBsaWtlIGV4YWN0
bHkgdGhlIGtpbmQgb2YgaGFyZHdhcmUgbGltaXRhdGlvbiBWRFBBIGlzIHN1cHBvc2VkIHRvCj4g
PiBwYXBlciBvdmVyIHdpdGhpbiBndWVzdC4gU28gSSBzdWdnZXN0IHdlIHVzZSB0aGlzIGFzCj4g
PiBhIGxpdG11cyB0ZXN0LCBhbmQgZmluZCB3YXlzIGZvciBWRFBBIHRvIGhhbmRsZSB0aGlzIHdp
dGhvdXQKPiA+IHNwZWMgY2hhbmdlcy4KPiAKPiAKPiBZZXMsIGFuZCBqdXN0IHRvIGNvbmZpcm0s
IGRvIHlvdSB0aGluayBpdCdzIGJlbmVmaWNpYWwgdG8gZXh0ZW5kIHZpcnRpbwo+IHNwZWNpZmlj
YXRpb24gdG8gc3VwcG9ydCBzdGF0ZSBnZXQvc2V0Pwo+IAo+IFRoYW5rcwoKTGV0J3MgbGVhdmUg
dGhhdCBmb3IgYW5vdGhlciBkYXkuIEZvciBub3cgdmRwYSBzaG91bGQgYmUgZmxleGlibGUgZW5v
dWdoCnRvIHdvcmsgb24gc3BlYyBjb21wbGlhbnQgVk1zLgoKPiAKPiA+IAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGlu
ZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8v
bGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
