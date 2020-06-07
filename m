Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC371F0B83
	for <lists.virtualization@lfdr.de>; Sun,  7 Jun 2020 15:52:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BFF40879B8;
	Sun,  7 Jun 2020 13:52:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UF8Jo9x3NvNI; Sun,  7 Jun 2020 13:52:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1AF6387ACB;
	Sun,  7 Jun 2020 13:52:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EF018C016F;
	Sun,  7 Jun 2020 13:52:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A4ACC016F
 for <virtualization@lists.linux-foundation.org>;
 Sun,  7 Jun 2020 13:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 87FB685259
 for <virtualization@lists.linux-foundation.org>;
 Sun,  7 Jun 2020 13:52:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P5JgPgm1xWR7
 for <virtualization@lists.linux-foundation.org>;
 Sun,  7 Jun 2020 13:52:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3FB6885187
 for <virtualization@lists.linux-foundation.org>;
 Sun,  7 Jun 2020 13:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591537919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j+ZykWK8JdPOlw9O8iBRr/ktzWoLaWuHq+jzWrrmeS4=;
 b=MFipqD/M1CfXyxL0YGbfJYcxSdBc7Ybp6EwnQN27v2NdZnN7tuKZ97ZA45knWaK40cRhOu
 CWVfOVj9guEFnOxqCysQSJbRos0WmpqUH2LY1IekBbqJry4U9DNhO8yXQ1h0Jm9yVA3xex
 CWD8vYV6gL/QS1yjnMQK41Dm2KjxJak=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-CdNn9wi7OG6kNFlkugwO8A-1; Sun, 07 Jun 2020 09:51:58 -0400
X-MC-Unique: CdNn9wi7OG6kNFlkugwO8A-1
Received: by mail-wm1-f72.google.com with SMTP id t145so4276841wmt.2
 for <virtualization@lists.linux-foundation.org>;
 Sun, 07 Jun 2020 06:51:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=j+ZykWK8JdPOlw9O8iBRr/ktzWoLaWuHq+jzWrrmeS4=;
 b=cBidaCHrOly8jPtakeCl7zqSMeo8VNE0y8Vgo/kojTsd1th7bO7wAyjMxPmWgtO7pQ
 MCwEAIS9iMjrrzmooeCP8Pst79OdKSebNmUbBIYFU/Eo3nwZ86G31rOzugCxlWIXOVhh
 g98E/Xc+bsQljNoz9E41iGEhiKhRZmRZQyHUtYr5ieNh60+cnJpN6zVi6sznSrHhWWOU
 O5fbJofxWd97lwc8GUr8XSwnOj2BdGYrz4MBM1CsILs8wU3b/Ko4FoiXvRGQF+0ruvtW
 9ytzATxjA/CU6j3lrLOFbmAWqSgnmtTSPz1yn8+5xS1ou8+M2XGlbx3SUFwo2+5nG9Ma
 BzAg==
X-Gm-Message-State: AOAM531/1zT3RzDpU3E01Z9DoFkjxJXQrAU+dRqVhuOdJJY4R2Ju1k0B
 5Igw3INP9yM34qAhBFLwNkB/KZw6r+G+a0aTQ7Dx7S25PQvFULvIIa9Pk/rle1UIFzr8KgHOS58
 JFQVDYO1zhEBH+WNt/rvWp+II1/OAQmE0bKT+Xn2nwA==
X-Received: by 2002:a1c:3dd6:: with SMTP id k205mr11840977wma.87.1591537916746; 
 Sun, 07 Jun 2020 06:51:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2TmtCKZREalT4txL3yzsCeeXkK6uXYPX7CKkiC1Ju4AXoJxdH2DXwg3C6iSbfZNaMKmJQCQ==
X-Received: by 2002:a1c:3dd6:: with SMTP id k205mr11840969wma.87.1591537916579; 
 Sun, 07 Jun 2020 06:51:56 -0700 (PDT)
Received: from redhat.com (bzq-82-81-31-23.red.bezeqint.net. [82.81.31.23])
 by smtp.gmail.com with ESMTPSA id o8sm19747676wmb.20.2020.06.07.06.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 06:51:56 -0700 (PDT)
Date: Sun, 7 Jun 2020 09:51:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 5/6] vdpa: introduce virtio pci driver
Message-ID: <20200607095012-mutt-send-email-mst@kernel.org>
References: <20200529080303.15449-1-jasowang@redhat.com>
 <20200529080303.15449-6-jasowang@redhat.com>
 <20200602010332-mutt-send-email-mst@kernel.org>
 <5dbb0386-beeb-5bf4-d12e-fb5427486bb8@redhat.com>
 <6b1d1ef3-d65e-08c2-5b65-32969bb5ecbc@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6b1d1ef3-d65e-08c2-5b65-32969bb5ecbc@redhat.com>
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

T24gRnJpLCBKdW4gMDUsIDIwMjAgYXQgMDQ6NTQ6MTdQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzYvMiDkuIvljYgzOjA4LCBKYXNvbiBXYW5nIHdyb3RlOgo+ID4gPiAK
PiA+ID4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkIHZwX3ZkcGFfaWRfdGFi
bGVbXSA9IHsKPiA+ID4gPiArwqDCoMKgIHsgUENJX0RFVklDRShQQ0lfVkVORE9SX0lEX1JFREhB
VF9RVU1SQU5FVCwgUENJX0FOWV9JRCkgfSwKPiA+ID4gPiArwqDCoMKgIHsgMCB9Cj4gPiA+ID4g
K307Cj4gPiA+IFRoaXMgbG9va3MgbGlrZSBpdCdsbCBjcmVhdGUgYSBtZXNzIHdpdGggZWl0aGVy
IHZpcnRpbyBwY2kKPiA+ID4gb3IgdmRwYSBiZWluZyBsb2FkZWQgYXQgcmFuZG9tLiBNYXliZSBq
dXN0IGRvbid0IHNwZWNpZnkKPiA+ID4gYW55IElEcyBmb3Igbm93LiBEb3duIHRoZSByb2FkIHdl
IGNvdWxkIGdldCBhCj4gPiA+IGRpc3RpbmN0IHZlbmRvciBJRCBvciBhIHJhbmdlIG9mIGRldmlj
ZSBJRHMgZm9yIHRoaXMuCj4gPiAKPiA+IAo+ID4gUmlnaHQsIHdpbGwgZG8uCj4gPiAKPiA+IFRo
YW5rcwo+IAo+IAo+IFJldGhpbmsgYWJvdXQgdGhpcy4gSWYgd2UgZG9uJ3Qgc3BlY2lmeSBhbnkg
SUQsIHRoZSBiaW5kaW5nIHdvbid0IHdvcmsuCgpXZSBjYW4gYmluZCBtYW51YWxseS4gSXQncyBu
b3QgcmVhbGx5IGZvciBwcm9kdWN0aW9uIGFueXdheSwgc28Kbm90IGEgYmlnIGRlYWwgaW1oby4K
Cj4gSG93IGFib3V0IHVzaW5nIGEgZGVkaWNhdGVkIHN1YnN5c3RlbSB2ZW5kb3IgaWQgZm9yIHRo
aXM/Cj4gCj4gVGhhbmtzCgpJZiB2aXJ0aW8gdmVuZG9yIGlkIGlzIHVzZWQgdGhlbiBzdGFuZGFy
ZCBkcml2ZXIgaXMgZXhwZWN0ZWQKdG8gYmluZCwgcmlnaHQ/IE1heWJlIHVzZSBhIGRlZGljYXRl
ZCB2ZW5kb3IgaWQ/CgotLSAKTVNUCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25A
bGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24u
b3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
