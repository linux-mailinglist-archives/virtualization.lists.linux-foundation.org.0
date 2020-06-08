Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BA31F1A0D
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 15:29:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7B7588608D;
	Mon,  8 Jun 2020 13:29:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2yO-ZwEuA_dQ; Mon,  8 Jun 2020 13:29:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0E5E186078;
	Mon,  8 Jun 2020 13:29:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E9BAAC0894;
	Mon,  8 Jun 2020 13:29:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4F19BC016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 13:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 46B2887918
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 13:29:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uDBcV5KhqjCU
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 13:29:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9B8D087917
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 13:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591622948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tAi5RnB11l/kNjeRk8ozS/jXDdeHeIrWEjaZ8oVwPv4=;
 b=OKWyGkd1pwRdILQTXpSQDQc08uqv3GrWExbVtJsi5G6VY4qEoneqpvj355/9vUc5oPCq39
 b0hAfVVJvOIMfJxHmHDod1+H2tYQfw0B5CIEd2/SM0nb8FgCd1wh2XaPZltsmWUsWce+Oa
 Nes9MmkTGdEclkNrlmd0DAM7bOsHiuY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-nUjOBbTXPgGat6iYS73h4g-1; Mon, 08 Jun 2020 09:29:06 -0400
X-MC-Unique: nUjOBbTXPgGat6iYS73h4g-1
Received: by mail-wr1-f71.google.com with SMTP id a4so7149671wrp.5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 08 Jun 2020 06:29:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=tAi5RnB11l/kNjeRk8ozS/jXDdeHeIrWEjaZ8oVwPv4=;
 b=kieXPaLFwi3mbJ0WkD9MCzqqn9yX5upTcJ3RGA6ZWdVYeQkP/A1wwab6FvIi0dptMP
 dx+wII+he8kDhm4FaqvmswL2E9wGMtEFsTDvFTjutWpYGNdIbdqVxKnFtx3Ajcp6wU1t
 P0vzW1bhgEKb21WPzZSl9xdr8AwFtD3RhYKxezEHgS8L/3qATeloZNW4ojN/NnsnMb31
 Mj1xELF6RgMbpPNpWonvqwmXtNPaeMbUfaanb9tu8I75oNkCg/2dXLKWwYzK+ZmENhtT
 UNr7mPDYkmRPiizeujiFomHpDpIQRtxH1XeDEYo7V6PhUN9nqV5N5DFAbNCm/6bPCtJw
 /F9w==
X-Gm-Message-State: AOAM531CKG0TtJSuOVEBYE0y5/RgBWYM8KLXi3BBvlkf6Umh0HKmO3W1
 vy/EyRVAo8HmD2idr28cBY4608QNlfO6p//6zF/pTFygtfODkSASLSu58CwbdsKrUhRN4xul+DR
 7jpDQRou2xxYxxNLS9JGv7Y5J6KKgumGVdfJQMhivhg==
X-Received: by 2002:a5d:4a45:: with SMTP id v5mr23250537wrs.223.1591622945521; 
 Mon, 08 Jun 2020 06:29:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLsV4zKcIqO3YHdQC1Vbu08DLKVYtIAwGXFJX9rmOu7fddWNahirZvRHnTir6Z4zHxaZCpjg==
X-Received: by 2002:a5d:4a45:: with SMTP id v5mr23250502wrs.223.1591622945243; 
 Mon, 08 Jun 2020 06:29:05 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 o20sm24303052wra.29.2020.06.08.06.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 06:29:04 -0700 (PDT)
Date: Mon, 8 Jun 2020 09:29:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 5/6] vdpa: introduce virtio pci driver
Message-ID: <20200608092530-mutt-send-email-mst@kernel.org>
References: <20200607095012-mutt-send-email-mst@kernel.org>
 <9b1abd2b-232c-aa0f-d8bb-03e65fd47de2@redhat.com>
 <20200608021438-mutt-send-email-mst@kernel.org>
 <a1b1b7fb-b097-17b7-2e3a-0da07d2e48ae@redhat.com>
 <20200608052041-mutt-send-email-mst@kernel.org>
 <9d2571b6-0b95-53b3-6989-b4d801eeb623@redhat.com>
 <20200608054453-mutt-send-email-mst@kernel.org>
 <bc27064c-2309-acf3-ccd8-6182bfa2a4cd@redhat.com>
 <20200608055331-mutt-send-email-mst@kernel.org>
 <61117e6a-2568-d0f4-8713-d831af32814d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <61117e6a-2568-d0f4-8713-d831af32814d@redhat.com>
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

T24gTW9uLCBKdW4gMDgsIDIwMjAgYXQgMDY6MDc6MzZQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzYvOCDkuIvljYg1OjU0LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6
Cj4gPiBPbiBNb24sIEp1biAwOCwgMjAyMCBhdCAwNTo0Njo1MlBNICswODAwLCBKYXNvbiBXYW5n
IHdyb3RlOgo+ID4gPiBPbiAyMDIwLzYvOCDkuIvljYg1OjQ1LCBNaWNoYWVsIFMuIFRzaXJraW4g
d3JvdGU6Cj4gPiA+ID4gT24gTW9uLCBKdW4gMDgsIDIwMjAgYXQgMDU6NDM6NThQTSArMDgwMCwg
SmFzb24gV2FuZyB3cm90ZToKPiA+ID4gPiA+ID4gPiBMb29raW5nIGF0Cj4gPiA+ID4gPiA+ID4g
cGNpX21hdGNoX29uZV9kZXZpY2UoKSBpdCBjaGVja3MgYm90aCBzdWJ2ZW5kb3IgYW5kIHN1YmRl
dmljZSB0aGVyZS4KPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBUaGFua3MKPiA+ID4gPiA+
ID4gQnV0IElJVUMgdGhlcmUgaXMgbm8gZ3VhcmFudGVlIHRoYXQgZHJpdmVyIHdpdGggYSBzcGVj
aWZpYyBzdWJ2ZW5kb3IKPiA+ID4gPiA+ID4gbWF0Y2hlcyBpbiBwcmVzZW5jZSBvZiBhIGdlbmVy
aWMgb25lLgo+ID4gPiA+ID4gPiBTbyBlaXRoZXIgSUZDIG9yIHZpcnRpbyBwY2kgY2FuIHdpbiwg
d2hpY2hldmVyIGJpbmRzIGZpcnN0Lgo+ID4gPiA+ID4gSSdtIG5vdCBzdXJlIEkgZ2V0IHRoZXJl
LiBCdXQgSSB0cnkgbWFudWFsbHkgYmluZCBJRkNWRiB0byBxZW11J3MKPiA+ID4gPiA+IHZpcnRp
by1uZXQtcGNpLCBhbmQgaXQgZmFpbHMuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFRoYW5rcwo+ID4g
PiA+IFJpZ2h0IGJ1dCB0aGUgcmV2ZXJzZSBjYW4gaGFwcGVuOiB2aXJ0aW8tbmV0IGNhbiBiaW5k
IHRvIElGQ1ZGIGZpcnN0Lgo+ID4gPiAKPiA+ID4gVGhhdCdzIGtpbmQgb2YgZXhwZWN0ZWQuIFRo
ZSBQRiBpcyBleHBlY3RlZCB0byBiZSBib3VuZCB0byB2aXJ0aW8tcGNpIHRvCj4gPiA+IGNyZWF0
ZSBWRiB2aWEgc3lzZnMuCj4gPiA+IAo+ID4gPiBUaGFua3MKPiA+ID4gCj4gPiA+IAo+ID4gPiAK
PiA+IE9uY2UgVkZzIGFyZSBjcmVhdGVkLCBkb24ndCB3ZSB3YW50IElGQ1ZGIHRvIGJpbmQgcmF0
aGVyIHRoYW4KPiA+IHZpcnRpby1wY2k/Cj4gCj4gCj4gWWVzLCBidXQgZm9yIFBGIHdlIG5lZWQg
dmlydGlvLXBjaS4KPiAKPiBUaGFua3MKPiAKCihBYil1c2luZyB0aGUgZHJpdmVyX2RhdGEgZmll
bGQgZm9yIHRoaXMgaXMgYW4gb3B0aW9uLgpXaGF0IGRvIHlvdSB0aGluaz8KCi0tIApNU1QKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0
aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0
dWFsaXphdGlvbg==
