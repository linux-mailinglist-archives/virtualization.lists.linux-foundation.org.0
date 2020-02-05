Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D9E152838
	for <lists.virtualization@lfdr.de>; Wed,  5 Feb 2020 10:24:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 949048664E;
	Wed,  5 Feb 2020 09:24:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y1LZAyFdaKG6; Wed,  5 Feb 2020 09:24:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E510E85BC4;
	Wed,  5 Feb 2020 09:24:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B783EC0174;
	Wed,  5 Feb 2020 09:24:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B6ED0C0174
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 09:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id AED6B85096
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 09:24:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ns1G-F+yOvve
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 09:24:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CEDBF82462
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 09:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580894649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wSY3Qv6hAFiMJ+ZMELgFgVfUvrY9dNbp0gOuOjqy//g=;
 b=hSirP+bVQkqSokdGvewOsk95JplBC4SRu9CJ9kQaZUoLvSga6J5XFC8kNLkuRHAbcm2qqV
 RkaXm1QHYTmYjEplMBJSSgzkuSBp+kgaHW7C8AakIJ0Xi384azgiHm+MtZr8cgI//uTCwk
 WmXsSArc+c3iKVtLVlZM5BkUkT66N90=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-9t5Of618P6WY3izZehvE3w-1; Wed, 05 Feb 2020 04:24:07 -0500
Received: by mail-qt1-f199.google.com with SMTP id p12so935352qtu.6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 05 Feb 2020 01:24:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wSY3Qv6hAFiMJ+ZMELgFgVfUvrY9dNbp0gOuOjqy//g=;
 b=HGdA254H5FOxvJxZ7VaDg+DA1f10jcnlhQdwge/Kfxf24Zb1alwRMbeOd25Cx7zMtC
 +aTAlKcTwElBpfNO3/r7C7RGPdQG9PaGMQ4OSjaNZdoQWEzHe4yL75fQwYeKLaksBDXc
 AZ9fS6Lz/+Mf7oRJJmVVIgPG8wvYUaoCwjdHg8wejWlbmcEw54bunvOJw4hEshtzj8SR
 7o1dTb5WGCyPwfc8trfG/WPp/lA+gJmI3duimyiQ7dqA39/ADL7MCC4oujLW+aWLf01k
 JSQDYNVm8DMXnLly8k2KJvFGoKgZl8X0NuER+4yjb9QDk4EKAnkXgax1laL9cR3U4Hpb
 rjjg==
X-Gm-Message-State: APjAAAUosIpAwQ7RzckYr6s51iOR/KpPGY6d7tuNRXeHZaKTeux+gIva
 zSn3iarQtx1WJ28JsKpZpknhch4sMWD7Sqcp9sgIdHLvnriXQlObJWiReajc4WSBiufBBbuQ8pB
 ImovfziB7Qh8xykjRDPiYMf8Uk3Lv1Vuy8EybXkGi+Q==
X-Received: by 2002:ac8:5353:: with SMTP id d19mr31605211qto.313.1580894647315; 
 Wed, 05 Feb 2020 01:24:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqyyschR+1xoeOuBpiIeSRa2/qJVXKJqzZtd++LLazpwBb3n6x85V08OIQ0LHH/2pAjxc8X/nw==
X-Received: by 2002:ac8:5353:: with SMTP id d19mr31605178qto.313.1580894647051; 
 Wed, 05 Feb 2020 01:24:07 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id e130sm12534407qkb.72.2020.02.05.01.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 01:24:06 -0800 (PST)
Date: Wed, 5 Feb 2020 04:23:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] vhost: introduce vDPA based backend
Message-ID: <20200205042259-mutt-send-email-mst@kernel.org>
References: <20200131033651.103534-1-tiwei.bie@intel.com>
 <7aab2892-bb19-a06a-a6d3-9c28bc4c3400@redhat.com>
 <20200205020247.GA368700@___>
 <AM0PR0502MB37952015716C1D5E07E390B6C3020@AM0PR0502MB3795.eurprd05.prod.outlook.com>
 <112858a4-1a01-f4d7-e41a-1afaaa1cad45@redhat.com>
MIME-Version: 1.0
In-Reply-To: <112858a4-1a01-f4d7-e41a-1afaaa1cad45@redhat.com>
X-MC-Unique: 9t5Of618P6WY3izZehvE3w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Jason Gunthorpe <jgg@mellanox.com>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 Shahaf Shuler <shahafs@mellanox.com>, Parav Pandit <parav@mellanox.com>,
 Jiri Pirko <jiri@mellanox.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "hanand@xilinx.com" <hanand@xilinx.com>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
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

T24gV2VkLCBGZWIgMDUsIDIwMjAgYXQgMDM6NTA6MTRQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzIvNSDkuIvljYgzOjE1LCBTaGFoYWYgU2h1bGVyIHdyb3RlOgo+ID4g
V2VkbmVzZGF5LCBGZWJydWFyeSA1LCAyMDIwIDQ6MDMgQU0sIFRpd2VpIEJpZToKPiA+ID4gU3Vi
amVjdDogUmU6IFtQQVRDSF0gdmhvc3Q6IGludHJvZHVjZSB2RFBBIGJhc2VkIGJhY2tlbmQKPiA+
ID4gCj4gPiA+IE9uIFR1ZSwgRmViIDA0LCAyMDIwIGF0IDExOjMwOjExQU0gKzA4MDAsIEphc29u
IFdhbmcgd3JvdGU6Cj4gPiA+ID4gT24gMjAyMC8xLzMxIOS4iuWNiDExOjM2LCBUaXdlaSBCaWUg
d3JvdGU6Cj4gPiA+ID4gPiBUaGlzIHBhdGNoIGludHJvZHVjZXMgYSB2RFBBIGJhc2VkIHZob3N0
IGJhY2tlbmQuIFRoaXMgYmFja2VuZCBpcwo+ID4gPiA+ID4gYnVpbHQgb24gdG9wIG9mIHRoZSBz
YW1lIGludGVyZmFjZSBkZWZpbmVkIGluIHZpcnRpby12RFBBIGFuZAo+ID4gPiA+ID4gcHJvdmlk
ZXMgYSBnZW5lcmljIHZob3N0IGludGVyZmFjZSBmb3IgdXNlcnNwYWNlIHRvIGFjY2VsZXJhdGUg
dGhlCj4gPiA+ID4gPiB2aXJ0aW8gZGV2aWNlcyBpbiBndWVzdC4KPiA+ID4gPiA+IAo+ID4gPiA+
ID4gVGhpcyBiYWNrZW5kIGlzIGltcGxlbWVudGVkIGFzIGEgdkRQQSBkZXZpY2UgZHJpdmVyIG9u
IHRvcCBvZiB0aGUKPiA+ID4gPiA+IHNhbWUgb3BzIHVzZWQgaW4gdmlydGlvLXZEUEEuIEl0IHdp
bGwgY3JlYXRlIGNoYXIgZGV2aWNlIGVudHJ5IG5hbWVkCj4gPiA+ID4gPiB2aG9zdC12ZHBhLyR2
ZHBhX2RldmljZV9pbmRleCBmb3IgdXNlcnNwYWNlIHRvIHVzZS4gVXNlcnNwYWNlIGNhbgo+ID4g
PiA+ID4gdXNlIHZob3N0IGlvY3RscyBvbiB0b3Agb2YgdGhpcyBjaGFyIGRldmljZSB0byBzZXR1
cCB0aGUgYmFja2VuZC4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogVGl3ZWkg
QmllIDx0aXdlaS5iaWVAaW50ZWwuY29tPgo+ID4gWy4uLl0KPiA+IAo+ID4gPiA+ID4gK3N0YXRp
YyBsb25nIHZob3N0X3ZkcGFfZG9fZG1hX21hcHBpbmcoc3RydWN0IHZob3N0X3ZkcGEgKnYpIHsK
PiA+ID4gPiA+ICsJLyogVE9ETzogZml4IHRoaXMgKi8KPiA+ID4gPiAKPiA+ID4gPiBCZWZvcmUg
dHJ5aW5nIHRvIGRvIHRoaXMgaXQgbG9va3MgdG8gbWUgd2UgbmVlZCB0aGUgZm9sbG93aW5nIGR1
cmluZwo+ID4gPiA+IHRoZSBwcm9iZQo+ID4gPiA+IAo+ID4gPiA+IDEpIGlmIHNldF9tYXAoKSBp
cyBub3Qgc3VwcG9ydGVkIGJ5IHRoZSB2RFBBIGRldmljZSBwcm9iZSB0aGUgSU9NTVUKPiA+ID4g
PiB0aGF0IGlzIHN1cHBvcnRlZCBieSB0aGUgdkRQQSBkZXZpY2UKPiA+ID4gPiAyKSBhbGxvY2F0
ZSBJT01NVSBkb21haW4KPiA+ID4gPiAKPiA+ID4gPiBBbmQgdGhlbjoKPiA+ID4gPiAKPiA+ID4g
PiAzKSBwaW4gcGFnZXMgdGhyb3VnaCBHVVAgYW5kIGRvIHByb3BlciBhY2NvdW50aW5nCj4gPiA+
ID4gNCkgc3RvcmUgR1BBLT5IUEEgbWFwcGluZyBpbiB0aGUgdW1lbQo+ID4gPiA+IDUpIGdlbmVy
YXRlIGRpZmZzIG9mIG1lbW9yeSB0YWJsZSBhbmQgdXNpbmcgSU9NTVUgQVBJIHRvIHNldHVwIHRo
ZSBkbWEKPiA+ID4gPiBtYXBwaW5nIGluIHRoaXMgbWV0aG9kCj4gPiA+ID4gCj4gPiA+ID4gRm9y
IDEpLCBJJ20gbm90IHN1cmUgcGFyZW50IGlzIHN1ZmZpY2llbnQgZm9yIHRvIGRvaW5nIHRoaXMg
b3IgbmVlZCB0bwo+ID4gPiA+IGludHJvZHVjZSBuZXcgQVBJIGxpa2UgaW9tbXVfZGV2aWNlIGlu
IG1kZXYuCj4gPiA+IEFncmVlLiBXZSBtYXkgYWxzbyBuZWVkIHRvIGludHJvZHVjZSBzb21ldGhp
bmcgbGlrZSB0aGUgaW9tbXVfZGV2aWNlLgo+ID4gPiAKPiA+IFdvdWxkIGl0IGJlIGJldHRlciBm
b3IgdGhlIG1hcC91bW5hcCBsb2dpYyB0byBoYXBwZW4gaW5zaWRlIGVhY2ggZGV2aWNlID8KPiA+
IERldmljZXMgdGhhdCBuZWVkcyB0aGUgSU9NTVUgd2lsbCBjYWxsIGlvbW11IEFQSXMgZnJvbSBp
bnNpZGUgdGhlIGRyaXZlciBjYWxsYmFjay4KPiAKPiAKPiBUZWNobmljYWxseSwgdGhpcyBjYW4g
d29yay4gQnV0IGlmIGl0IGNhbiBiZSBkb25lIGJ5IHZob3N0LXZwZGEgaXQgd2lsbCBtYWtlCj4g
dGhlIHZEUEEgZHJpdmVyIG1vcmUgY29tcGFjdCBhbmQgZWFzaWVyIHRvIGJlIGltcGxlbWVudGVk
Lgo+IAo+IAo+ID4gRGV2aWNlcyB0aGF0IGhhcyBvdGhlciB3YXlzIHRvIGRvIHRoZSBETUEgbWFw
cGluZyB3aWxsIGNhbGwgdGhlIHByb3ByaWV0YXJ5IEFQSXMuCj4gCj4gCj4gVG8gY29uZmlybSwg
ZG8geW91IHByZWZlcjoKPiAKPiAxKSBtYXAvdW5tYXAKPiAKPiBvcgo+IAo+IDIpIHBhc3MgYWxs
IG1hcHMgYXQgb25lIHRpbWU/Cj4gCj4gVGhhbmtzCj4gCj4gCgpJIG1lYW4gd2UgcmVhbGx5IGFs
cmVhZHkgaGF2ZSBib3RoIHJpZ2h0PyBBVE0gMSBpcyB1c2VkIHdpdGggYW4gaW9tbXUKYW5kIDIg
d2l0aG91dC4gSSBndWVzcyB3ZSBjYW4gYWxzbyBoYXZlIGRyaXZlcnMgYXNrIGZvciBlaXRoZXIg
b3IgYm90aAouLi4KCi0tIApNU1QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBs
aXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5v
cmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
