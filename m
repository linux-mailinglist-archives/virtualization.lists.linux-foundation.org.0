Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B346A19AF2C
	for <lists.virtualization@lfdr.de>; Wed,  1 Apr 2020 17:57:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DEC0186DB2;
	Wed,  1 Apr 2020 15:57:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yaxVL5n3dp5z; Wed,  1 Apr 2020 15:57:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2D67486C6E;
	Wed,  1 Apr 2020 15:57:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1D55EC089F;
	Wed,  1 Apr 2020 15:57:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0935DC089F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 15:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EC2E486C6E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 15:57:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z8y_sxmfi4uJ
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 15:57:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 203DF86C6A
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 15:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585756643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MJvti0HQwxkGVr50UmLlXHEkmoOLavfcErw++olR+Jo=;
 b=YU2bBKijT6CWfrdyETj97cBby7OAxjy+9Tjzjo0un7WxfanqWalS7+CJrBQLBSKHKHTZ/j
 /mFM/TDfZ0n/qK4H66umu1KI+trEAME7vlIEQksmebmEQxmmj1yEylP+BeAbcP8F1HXg6E
 haFyn9dwESBgZhL+/o61uP9wUCVLqfU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-6mCs5ZcHP5y28uUR3wGacw-1; Wed, 01 Apr 2020 11:57:20 -0400
X-MC-Unique: 6mCs5ZcHP5y28uUR3wGacw-1
Received: by mail-wr1-f70.google.com with SMTP id b2so44976wrq.8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 01 Apr 2020 08:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=MJvti0HQwxkGVr50UmLlXHEkmoOLavfcErw++olR+Jo=;
 b=QpQBm49gYPeOehtZyPo32U3IuCYJfwXdMbkdxdbQMnMhBzRm2umy2NqQjZIeGCavnV
 3m7R/dO4NNjXIawM9BvnARvEJ6UoYXyZbDmWAlEMsNabBRxWo9I7fVUBN2bZ2+ot4zll
 ZXoIDElfEUB2eSrnI7rosHBkJaID5l+cNu0Z7CMC46iAwjS9u/Yio2DCTLUNmCDAI7C7
 iM3e5WDWiGFL8p2AV3EoF2wGrNSOvMhBGCow6GMpQMM6gcK2HT2VwLd7DhvacTZFBQR0
 Buzz+M77ThWDHwbicJHbPx2cPN+CZkQJN63OLsLhoSW/qWPqfW39iA25Go9i1YPWbrnQ
 Rh1g==
X-Gm-Message-State: AGi0PubEnlIShUMAcBb4o85Jstm96WhzOav9DAyKxqa7vuWaHIqWhl7j
 DKyacmfUBieLUTdtNgvFH1HPWYnOGGpYhS6lLKn2cj7LL2d3BOFKoqjdTCVfOPP5BaE9aZY856B
 iga9hJZpcoJmo13jIL3/ReQoJjRrxXDz50OMMhsa8Zw==
X-Received: by 2002:a1c:1942:: with SMTP id 63mr5209040wmz.133.1585756639449; 
 Wed, 01 Apr 2020 08:57:19 -0700 (PDT)
X-Google-Smtp-Source: APiQypKA2aA36/p1yS+4iSBINIMZYbsrQcGfbJmIXDjaLpAeYKGxwb5JBIS+CYjNIECD0H1M4kXpUQ==
X-Received: by 2002:a1c:1942:: with SMTP id 63mr5209012wmz.133.1585756639201; 
 Wed, 01 Apr 2020 08:57:19 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id a8sm2954348wmb.39.2020.04.01.08.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 08:57:18 -0700 (PDT)
Date: Wed, 1 Apr 2020 11:57:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V9 1/9] vhost: refine vhost and vringh kconfig
Message-ID: <20200401115650-mutt-send-email-mst@kernel.org>
References: <20200326140125.19794-1-jasowang@redhat.com>
 <20200326140125.19794-2-jasowang@redhat.com>
 <fde312a4-56bd-f11f-799f-8aa952008012@de.ibm.com>
 <41ee1f6a-3124-d44b-bf34-0f26604f9514@redhat.com>
 <4726da4c-11ec-3b6e-1218-6d6d365d5038@de.ibm.com>
 <39b96e3a-9f4e-6e1d-e988-8c4bcfb55879@de.ibm.com>
 <c423c5b1-7817-7417-d7af-e07bef6368e7@redhat.com>
 <20200401102631-mutt-send-email-mst@kernel.org>
 <5e409bb4-2b06-5193-20c3-a9ddaafacf5a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <5e409bb4-2b06-5193-20c3-a9ddaafacf5a@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm@vger.kernel.org, mhabets@solarflare.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 saugatm@xilinx.com, lulu@redhat.com,
 Christian Borntraeger <borntraeger@de.ibm.com>, hanand@xilinx.com,
 hch@infradead.org, eperezma@redhat.com, jgg@mellanox.com, shahafs@mellanox.com,
 parav@mellanox.com, vmireyno@marvell.com, gdawar@xilinx.com, jiri@mellanox.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, zhihong.wang@intel.com,
 zhangweining@ruijie.com.cn, netdev@vger.kernel.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com
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

T24gV2VkLCBBcHIgMDEsIDIwMjAgYXQgMTA6NTA6NTBQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzQvMSDkuIvljYgxMDoyNywgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gV2VkLCBBcHIgMDEsIDIwMjAgYXQgMTA6MTM6MjlQTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPiA+ID4gT24gMjAyMC80LzEg5LiL5Y2IOTowMiwgQ2hyaXN0aWFuIEJvcm50cmFl
Z2VyIHdyb3RlOgo+ID4gPiA+IE9uIDAxLjA0LjIwIDE0OjU2LCBDaHJpc3RpYW4gQm9ybnRyYWVn
ZXIgd3JvdGU6Cj4gPiA+ID4gPiBPbiAwMS4wNC4yMCAxNDo1MCwgSmFzb24gV2FuZyB3cm90ZToK
PiA+ID4gPiA+ID4gT24gMjAyMC80LzEg5LiL5Y2INzoyMSwgQ2hyaXN0aWFuIEJvcm50cmFlZ2Vy
IHdyb3RlOgo+ID4gPiA+ID4gPiA+IE9uIDI2LjAzLjIwIDE1OjAxLCBKYXNvbiBXYW5nIHdyb3Rl
Ogo+ID4gPiA+ID4gPiA+ID4gQ3VycmVudGx5LCBDT05GSUdfVkhPU1QgZGVwZW5kcyBvbiBDT05G
SUdfVklSVFVBTElaQVRJT04uIEJ1dCB2aG9zdCBpcwo+ID4gPiA+ID4gPiA+ID4gbm90IG5lY2Vz
c2FyaWx5IGZvciBWTSBzaW5jZSBpdCdzIGEgZ2VuZXJpYyB1c2Vyc3BhY2UgYW5kIGtlcm5lbAo+
ID4gPiA+ID4gPiA+ID4gY29tbXVuaWNhdGlvbiBwcm90b2NvbC4gU3VjaCBkZXBlbmRlbmN5IG1h
eSBwcmV2ZW50IGFyY2hzIHdpdGhvdXQKPiA+ID4gPiA+ID4gPiA+IHZpcnR1YWxpemF0aW9uIHN1
cHBvcnQgZnJvbSB1c2luZyB2aG9zdC4KPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4g
VG8gc29sdmUgdGhpcywgYSBkZWRpY2F0ZWQgdmhvc3QgbWVudSBpcyBjcmVhdGVkIHVuZGVyIGRy
aXZlcnMgc28KPiA+ID4gPiA+ID4gPiA+IENPTklGR19WSE9TVCBjYW4gYmUgZGVjb3VwbGVkIG91
dCBvZiBDT05GSUdfVklSVFVBTElaQVRJT04uCj4gPiA+ID4gPiA+ID4gRldJVywgdGhpcyBub3cg
cmVzdWx0cyBpbiB2aG9zdCBub3QgYmVpbmcgYnVpbGQgd2l0aCBkZWZjb25maWcga2VybmVscyAo
aW4gdG9kYXlzCj4gPiA+ID4gPiA+ID4gbGludXgtbmV4dCkuCj4gPiA+ID4gPiA+ID4gCj4gPiA+
ID4gPiA+IEhpIENocmlzdGlhbjoKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IERpZCB5b3UgbWVl
dCBpdCBldmVuIHdpdGggdGhpcyBjb21taXTCoGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5naXQvY29tbWl0Lz9pZD1hNGJlNDBj
YmNlZGJhOWI1YjcxNGYzYzk1MTgyZThhNDUxNzZlNDJkPwo+ID4gPiA+ID4gSSBzaW1wbHkgdXNl
ZCBsaW51eC1uZXh0LiBUaGUgZGVmY29uZmlnIGRvZXMgTk9UIGNvbnRhaW4gQ09ORklHX1ZIT1NU
IGFuZCB0aGVyZWZvcmUgQ09ORklHX1ZIT1NUX05FVCBhbmQgZnJpZW5kcwo+ID4gPiA+ID4gY2Fu
IG5vdCBiZSBzZWxlY3RlZC4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gJCBnaXQgY2hlY2tvdXQgbmV4
dC0yMDIwMDQwMQo+ID4gPiA+ID4gJCBtYWtlIGRlZmNvbmZpZwo+ID4gPiA+ID4gICAgIEhPU1RD
QyAgc2NyaXB0cy9iYXNpYy9maXhkZXAKPiA+ID4gPiA+ICAgICBIT1NUQ0MgIHNjcmlwdHMva2Nv
bmZpZy9jb25mLm8KPiA+ID4gPiA+ICAgICBIT1NUQ0MgIHNjcmlwdHMva2NvbmZpZy9jb25mZGF0
YS5vCj4gPiA+ID4gPiAgICAgSE9TVENDICBzY3JpcHRzL2tjb25maWcvZXhwci5vCj4gPiA+ID4g
PiAgICAgTEVYICAgICBzY3JpcHRzL2tjb25maWcvbGV4ZXIubGV4LmMKPiA+ID4gPiA+ICAgICBZ
QUNDICAgIHNjcmlwdHMva2NvbmZpZy9wYXJzZXIudGFiLltjaF0KPiA+ID4gPiA+ICAgICBIT1NU
Q0MgIHNjcmlwdHMva2NvbmZpZy9sZXhlci5sZXgubwo+ID4gPiA+ID4gICAgIEhPU1RDQyAgc2Ny
aXB0cy9rY29uZmlnL3BhcnNlci50YWIubwo+ID4gPiA+ID4gICAgIEhPU1RDQyAgc2NyaXB0cy9r
Y29uZmlnL3ByZXByb2Nlc3Mubwo+ID4gPiA+ID4gICAgIEhPU1RDQyAgc2NyaXB0cy9rY29uZmln
L3N5bWJvbC5vCj4gPiA+ID4gPiAgICAgSE9TVENDICBzY3JpcHRzL2tjb25maWcvdXRpbC5vCj4g
PiA+ID4gPiAgICAgSE9TVExEICBzY3JpcHRzL2tjb25maWcvY29uZgo+ID4gPiA+ID4gKioqIERl
ZmF1bHQgY29uZmlndXJhdGlvbiBpcyBiYXNlZCBvbiAneDg2XzY0X2RlZmNvbmZpZycKPiA+ID4g
PiA+ICMKPiA+ID4gPiA+ICMgY29uZmlndXJhdGlvbiB3cml0dGVuIHRvIC5jb25maWcKPiA+ID4g
PiA+ICMKPiA+ID4gPiA+IAo+ID4gPiA+ID4gJCBncmVwIFZIT1NUIC5jb25maWcKPiA+ID4gPiA+
ICMgQ09ORklHX1ZIT1NUIGlzIG5vdCBzZXQKPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBJZiB5ZXMs
IHdoYXQncyB5b3VyIGJ1aWxkIGNvbmZpZyBsb29rcyBsaWtlPwo+ID4gPiA+ID4gPiAKPiA+ID4g
PiA+ID4gVGhhbmtzCj4gPiA+ID4gVGhpcyB3YXMgeDg2LiBOb3Qgc3VyZSBpZiB0aGF0IGRpZCB3
b3JrIGJlZm9yZS4KPiA+ID4gPiBPbiBzMzkwIHRoaXMgaXMgZGVmaW5pdGVseSBhIHJlZ3Jlc3Np
b24gYXMgdGhlIGRlZmNvbmZpZyBmaWxlcwo+ID4gPiA+IGZvciBzMzkwIGRvIHNlbGVjdCBWSE9T
VF9ORVQKPiA+ID4gPiAKPiA+ID4gPiBncmVwIFZIT1NUIGFyY2gvczM5MC9jb25maWdzLyoKPiA+
ID4gPiBhcmNoL3MzOTAvY29uZmlncy9kZWJ1Z19kZWZjb25maWc6Q09ORklHX1ZIT1NUX05FVD1t
Cj4gPiA+ID4gYXJjaC9zMzkwL2NvbmZpZ3MvZGVidWdfZGVmY29uZmlnOkNPTkZJR19WSE9TVF9W
U09DSz1tCj4gPiA+ID4gYXJjaC9zMzkwL2NvbmZpZ3MvZGVmY29uZmlnOkNPTkZJR19WSE9TVF9O
RVQ9bQo+ID4gPiA+IGFyY2gvczM5MC9jb25maWdzL2RlZmNvbmZpZzpDT05GSUdfVkhPU1RfVlNP
Q0s9bQo+ID4gPiA+IAo+ID4gPiA+IGFuZCB0aGlzIHdvcmtlZCB3aXRoIDUuNiwgYnV0IGRvZXMg
bm90IHdvcmsgd2l0aCBuZXh0LiBKdXN0IGFkZGluZwo+ID4gPiA+IENPTkZJR19WSE9TVD1tIHRv
IHRoZSBkZWZjb25maWcgc29sdmVzIHRoZSBpc3N1ZSwgc29tZXRoaW5nIGxpa2UKPiA+ID4gCj4g
PiA+IFJpZ2h0LCBJIHRoaW5rIHdlIHByb2JhYmx5IG5lZWQKPiA+ID4gCj4gPiA+IDEpIGFkZCBD
T05GSUdfVkhPU1Q9bSB0byBhbGwgZGVmY29uZmlncyB0aGF0IGVuYWJsZXMKPiA+ID4gQ09ORklH
X1ZIT1NUX05FVC9WU09DSy9TQ1NJLgo+ID4gPiAKPiA+ID4gb3IKPiA+ID4gCj4gPiA+IDIpIGRv
bid0IHVzZSBtZW51Y29uZmlnIGZvciBDT05GSUdfVkhPU1QsIGxldCBORVQvU0NTSS9WRFBBIGp1
c3Qgc2VsZWN0IGl0Lgo+ID4gPiAKPiA+ID4gVGhhbmtzCj4gPiBPSyBJIHRyaWVkIHRoaXM6Cj4g
PiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L0tjb25maWcgYi9kcml2ZXJzL3Zob3N0
L0tjb25maWcKPiA+IGluZGV4IDI1MjNhMWQ0MjkwYS4uYTMxNGI5MDBkNDc5IDEwMDY0NAo+ID4g
LS0tIGEvZHJpdmVycy92aG9zdC9LY29uZmlnCj4gPiArKysgYi9kcml2ZXJzL3Zob3N0L0tjb25m
aWcKPiA+IEBAIC0xOSwxMSArMTksMTAgQEAgbWVudWNvbmZpZyBWSE9TVAo+ID4gICAJICBUaGlz
IG9wdGlvbiBpcyBzZWxlY3RlZCBieSBhbnkgZHJpdmVyIHdoaWNoIG5lZWRzIHRvIGFjY2Vzcwo+
ID4gICAJICB0aGUgY29yZSBvZiB2aG9zdC4KPiA+IC1pZiBWSE9TVAo+ID4gLQo+ID4gICBjb25m
aWcgVkhPU1RfTkVUCj4gPiAgIAl0cmlzdGF0ZSAiSG9zdCBrZXJuZWwgYWNjZWxlcmF0b3IgZm9y
IHZpcnRpbyBuZXQiCj4gPiAgIAlkZXBlbmRzIG9uIE5FVCAmJiBFVkVOVEZEICYmIChUVU4gfHwg
IVRVTikgJiYgKFRBUCB8fCAhVEFQKQo+ID4gKwlzZWxlY3QgVkhPU1QKPiA+ICAgCS0tLWhlbHAt
LS0KPiA+ICAgCSAgVGhpcyBrZXJuZWwgbW9kdWxlIGNhbiBiZSBsb2FkZWQgaW4gaG9zdCBrZXJu
ZWwgdG8gYWNjZWxlcmF0ZQo+ID4gICAJICBndWVzdCBuZXR3b3JraW5nIHdpdGggdmlydGlvX25l
dC4gTm90IHRvIGJlIGNvbmZ1c2VkIHdpdGggdmlydGlvX25ldAo+ID4gQEAgLTM1LDYgKzM0LDcg
QEAgY29uZmlnIFZIT1NUX05FVAo+ID4gICBjb25maWcgVkhPU1RfU0NTSQo+ID4gICAJdHJpc3Rh
dGUgIlZIT1NUX1NDU0kgVENNIGZhYnJpYyBkcml2ZXIiCj4gPiAgIAlkZXBlbmRzIG9uIFRBUkdF
VF9DT1JFICYmIEVWRU5URkQKPiA+ICsJc2VsZWN0IFZIT1NUCj4gPiAgIAlkZWZhdWx0IG4KPiA+
ICAgCS0tLWhlbHAtLS0KPiA+ICAgCVNheSBNIGhlcmUgdG8gZW5hYmxlIHRoZSB2aG9zdF9zY3Np
IFRDTSBmYWJyaWMgbW9kdWxlCj4gPiBAQCAtNDQsNiArNDQsNyBAQCBjb25maWcgVkhPU1RfVlNP
Q0sKPiA+ICAgCXRyaXN0YXRlICJ2aG9zdCB2aXJ0aW8tdnNvY2sgZHJpdmVyIgo+ID4gICAJZGVw
ZW5kcyBvbiBWU09DS0VUUyAmJiBFVkVOVEZECj4gPiAgIAlzZWxlY3QgVklSVElPX1ZTT0NLRVRT
X0NPTU1PTgo+ID4gKwlzZWxlY3QgVkhPU1QKPiA+ICAgCWRlZmF1bHQgbgo+ID4gICAJLS0taGVs
cC0tLQo+ID4gICAJVGhpcyBrZXJuZWwgbW9kdWxlIGNhbiBiZSBsb2FkZWQgaW4gdGhlIGhvc3Qg
a2VybmVsIHRvIHByb3ZpZGUgQUZfVlNPQ0sKPiA+IEBAIC01Nyw2ICs1OCw3IEBAIGNvbmZpZyBW
SE9TVF9WRFBBCj4gPiAgIAl0cmlzdGF0ZSAiVmhvc3QgZHJpdmVyIGZvciB2RFBBLWJhc2VkIGJh
Y2tlbmQiCj4gPiAgIAlkZXBlbmRzIG9uIEVWRU5URkQKPiA+ICAgCXNlbGVjdCBWRFBBCj4gPiAr
CXNlbGVjdCBWSE9TVAo+ID4gICAJaGVscAo+ID4gICAJICBUaGlzIGtlcm5lbCBtb2R1bGUgY2Fu
IGJlIGxvYWRlZCBpbiBob3N0IGtlcm5lbCB0byBhY2NlbGVyYXRlCj4gPiAgIAkgIGd1ZXN0IHZp
cnRpbyBkZXZpY2VzIHdpdGggdGhlIHZEUEEtYmFzZWQgYmFja2VuZHMuCj4gPiBAQCAtNzgsNSAr
ODAsMyBAQCBjb25maWcgVkhPU1RfQ1JPU1NfRU5ESUFOX0xFR0FDWQo+ID4gICAJICBhZGRzIHNv
bWUgb3ZlcmhlYWQsIGl0IGlzIGRpc2FibGVkIGJ5IGRlZmF1bHQuCj4gPiAgIAkgIElmIHVuc3Vy
ZSwgc2F5ICJOIi4KPiA+IC0KPiA+IC1lbmRpZgo+ID4gCj4gPiAKPiA+IEJ1dCBub3cgQ09ORklH
X1ZIT1NUIGlzIGFsd2F5cyAieSIsIG5ldmVyICJtIi4KPiA+IFdoaWNoIEkgdGhpbmsgd2lsbCBt
YWtlIGl0IGEgYnVpbHQtaW4uCj4gPiBEaWRuJ3QgZmlndXJlIG91dCB3aHkgeWV0Lgo+IAo+IAo+
IElzIGl0IGJlY2F1c2UgdGhlIGRlcGVuZGVuY3kgb2YgRVZFTlRGRCBmb3IgQ09ORklHX1ZIT1NU
PwoKT2ggbm8sIGl0J3MgYmVjYXVzZSBJIGZvcmdvdCB0byBjaGFuZ2UgbWVudWNvbmZpZyB0byBj
b25maWcuCgoKPiBSZW1vdmUgdGhhdCBvbmUgZm9yIHRoaXMgcGF0Y2gsIEkgY2FuIGdldCBDT05G
SUdfVkhPU1Q9bS4KPiAKPiBCdXQgYWNjb3JkaW5nIHRvIGRvY3VtZW50YXRpb24va2J1aWxkL2tj
b25maWcucnN0LCBzZWxlY3QgaXMgdXNlZCBmb3Igb3B0aW9uCj4gd2l0aG91dCBwcm9tcHQuCj4g
Cj4gVGhhbmtzCj4gCj4gCj4gPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBs
aXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5v
cmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
