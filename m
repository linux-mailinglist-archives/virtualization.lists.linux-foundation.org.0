Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A62152609
	for <lists.virtualization@lfdr.de>; Wed,  5 Feb 2020 06:36:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CEC1186F3A;
	Wed,  5 Feb 2020 05:36:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HQcORmXgpcpy; Wed,  5 Feb 2020 05:36:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8D65C875F4;
	Wed,  5 Feb 2020 05:36:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 66BA4C0174;
	Wed,  5 Feb 2020 05:36:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B035CC0174
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 05:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A5F2A85B4D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 05:36:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id muaO_JjmyX-Q
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 05:36:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C9B8C859D1
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 05:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580881010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XxLib1DyGWA3n/jl6h9rliqNTP1O1RA9Yuhg5J8jnQ8=;
 b=RyoxjiUwJvI2I4ITkzXMhsmSEXwJbLsSPQTdUyivPjtYuDdowFtD4xLWCT+8/+ktVfcUs6
 qVJYpTtp7Fdg8jAx3DNDhJxmsAqibIGJ/HXKJv3n52Y08GwQL/JShhZ34Mtzj0zf6PnmXc
 KX7MTW9Sek0XnVFXNfNIELIM3yCJJxs=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-fpJQWwPHM3SMYRYTjynn6w-1; Wed, 05 Feb 2020 00:36:47 -0500
Received: by mail-qv1-f72.google.com with SMTP id ce2so786145qvb.23
 for <virtualization@lists.linux-foundation.org>;
 Tue, 04 Feb 2020 21:36:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=XxLib1DyGWA3n/jl6h9rliqNTP1O1RA9Yuhg5J8jnQ8=;
 b=a5ouc50xAX4ZSlBkNfzMoGeVic2wHmqqugttp+4CB5/eo7Gw09Tq3pHydA6MdTlS+C
 oXZwKtlkPJvFX+8FHCrDcRGNnoW+BFP1EF5X/XZNqlCzWad9dSdRxOStTRobQ18vDOsx
 XZnAKUkrt8N1nhiYM7iR9kIKu72MNlUR4sunDnablnzxuJi9HaSYrJOql58PlKkxZF4V
 3au7Qfs++IoInW1AYFRaDdbQxyQwBKQ5S3YoUSFquoi24BYESkJ5eCFRVm7PE6Bq99Oe
 qUDcWn/3tuXbRRpmvo04Fp6JJ9cbyVli47JmUCoWyZAwghtIm3JrsU92U4lACI3kM58n
 RFag==
X-Gm-Message-State: APjAAAUEeeBLXzjAX3ZJcpkO2mExTJxfw3wv5R4E3Tg/biMxSPynXfbn
 YMenUrCsbI7lsfwDDPY+79+kcsKkd1AUusfiM0mNU/vd0HT9wlDDHHpjxAOV9zqWX8025mt8x5s
 3NioEjZDUY4eRJ8ov3zproYYP2UTNF3DH1kK6GH50mw==
X-Received: by 2002:a05:620a:1416:: with SMTP id
 d22mr449710qkj.415.1580881007104; 
 Tue, 04 Feb 2020 21:36:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqw0rRf19uckjRT2XyuOTvPcwwSVFIB7TnwPqwZmh7xwjP4vvHrAEcKTKEeGxk7l0EPBEm80AA==
X-Received: by 2002:ac8:4e43:: with SMTP id e3mr32421061qtw.129.1580880686259; 
 Tue, 04 Feb 2020 21:31:26 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id y145sm12328322qkb.87.2020.02.04.21.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 21:31:25 -0800 (PST)
Date: Wed, 5 Feb 2020 00:31:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] vhost: introduce vDPA based backend
Message-ID: <20200205003048-mutt-send-email-mst@kernel.org>
References: <20200131033651.103534-1-tiwei.bie@intel.com>
 <7aab2892-bb19-a06a-a6d3-9c28bc4c3400@redhat.com>
 <20200204005306-mutt-send-email-mst@kernel.org>
 <cf485e7f-46e3-20d3-8452-e3058b885d0a@redhat.com>
 <20200205020555.GA369236@___>
 <798e5644-ca28-ee46-c953-688af9bccd3b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <798e5644-ca28-ee46-c953-688af9bccd3b@redhat.com>
X-MC-Unique: fpJQWwPHM3SMYRYTjynn6w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm@vger.kernel.org, mhabets@solarflare.com,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gV2VkLCBGZWIgMDUsIDIwMjAgYXQgMTE6MTI6MjFBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzIvNSDkuIrljYgxMDowNSwgVGl3ZWkgQmllIHdyb3RlOgo+ID4gT24g
VHVlLCBGZWIgMDQsIDIwMjAgYXQgMDI6NDY6MTZQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
PiA+ID4gT24gMjAyMC8yLzQg5LiL5Y2IMjowMSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+
ID4gPiA+IE9uIFR1ZSwgRmViIDA0LCAyMDIwIGF0IDExOjMwOjExQU0gKzA4MDAsIEphc29uIFdh
bmcgd3JvdGU6Cj4gPiA+ID4gPiA1KSBnZW5lcmF0ZSBkaWZmcyBvZiBtZW1vcnkgdGFibGUgYW5k
IHVzaW5nIElPTU1VIEFQSSB0byBzZXR1cCB0aGUgZG1hCj4gPiA+ID4gPiBtYXBwaW5nIGluIHRo
aXMgbWV0aG9kCj4gPiA+ID4gRnJhbmtseSBJIHRoaW5rIHRoYXQncyBhIGJ1bmNoIG9mIHdvcmsu
IFdoeSBub3QgYSBNQVAvVU5NQVAgaW50ZXJmYWNlPwo+ID4gPiA+IAo+ID4gPiBTdXJlLCBzbyB0
aGF0IGJhc2ljYWxseSBWSE9TVF9JT1RMQl9VUERBVEUvSU5WQUxJREFURSBJIHRoaW5rPwo+ID4g
RG8geW91IG1lYW4gd2UgbGV0IHVzZXJzcGFjZSB0byBvbmx5IHVzZSBWSE9TVF9JT1RMQl9VUERB
VEUvSU5WQUxJREFURQo+ID4gdG8gZG8gdGhlIERNQSBtYXBwaW5nIGluIHZob3N0LXZkcGEgY2Fz
ZT8gV2hlbiB2SU9NTVUgaXNuJ3QgYXZhaWxhYmxlLAo+ID4gdXNlcnNwYWNlIHdpbGwgc2V0IG1z
Zy0+aW92YSB0byBHUEEsIG90aGVyd2lzZSB1c2Vyc3BhY2Ugd2lsbCBzZXQKPiA+IG1zZy0+aW92
YSB0byBHSU9WQSwgYW5kIHZob3N0LXZkcGEgbW9kdWxlIHdpbGwgZ2V0IEhQQSBmcm9tIG1zZy0+
dWFkZHI/Cj4gPiAKPiA+IFRoYW5rcywKPiA+IFRpd2VpCj4gCj4gCj4gSSB0aGluayBzby4gTWlj
aGFlbCwgZG8geW91IHRoaW5rIHRoaXMgbWFrZXMgc2Vuc2U/Cj4gCj4gVGhhbmtzCgp0byBtYWtl
IHN1cmUsIGNvdWxkIHlvdSBwb3N0IHRoZSBzdWdnZXN0ZWQgYXJndW1lbnQgZm9ybWF0IGZvcgp0
aGVzZSBpb2N0bHM/Cgo+IAo+ID4gCj4gPiA+IFRoYW5rcwo+ID4gPiAKPiA+ID4gCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBt
YWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0
cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6
YXRpb24=
