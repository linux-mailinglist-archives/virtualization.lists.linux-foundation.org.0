Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA9E1AD88F
	for <lists.virtualization@lfdr.de>; Fri, 17 Apr 2020 10:30:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7C86387B69;
	Fri, 17 Apr 2020 08:30:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xDB9MDGSjE1s; Fri, 17 Apr 2020 08:30:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D42DC879C5;
	Fri, 17 Apr 2020 08:30:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BD411C0172;
	Fri, 17 Apr 2020 08:30:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4F0B4C0172
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 08:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4ACD286199
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 08:30:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I7lbNvYyzAe7
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 08:29:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8B86086169
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 08:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587112198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sq2go4oE4wkjjJo/d/qCXW8H/F2CZmjvC27LSvnbq6k=;
 b=E65N3BFeCQ64cCR1AlsgBIt/+E+ikZXoAxQfpToXxAdkDByFokPrMXWCn5lJO3aob4IPC9
 z36Z9v6QNwseZoKzQijnNACMMS49ZhLzk2XDcYON02BJ91Vk8H57BtRPXrvkKkqstc6PZN
 mZybaFYAl8xuTPLUJI0ew3elDa6nTVc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-94Q8zAI6Omi_WUAdaSKyEw-1; Fri, 17 Apr 2020 04:29:56 -0400
X-MC-Unique: 94Q8zAI6Omi_WUAdaSKyEw-1
Received: by mail-wm1-f71.google.com with SMTP id y1so653293wmj.3
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 01:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=sq2go4oE4wkjjJo/d/qCXW8H/F2CZmjvC27LSvnbq6k=;
 b=a1SBnqbzF8SKkBjdTn0z29w+D9eVJA6syFbhnBj//sVuFLT5MLXWXOOL5al5qnx0vP
 Vp+3+cD+OfV2N3AL9bAG9MH2e0uy50m+2xVPsPmM0idVKuqcd0ixIpj8r95xY4hWWipf
 EwjkXGP3MBLG3NN1p9eHelzyc/6myH5khDhGhkINmVqBD7z0nHkZaRIUIGNwgJRTRG74
 Gj757WZIHWTonF4f5VfUJt5HQf1s+blM3C+kFiCPg+ZhRx6YYBX3a0rsEgipAUJDLSfV
 kzWB98ypA1beET4/T398G/aTLQZ0URVW/BLJlJCxOoT2dUmePUEs4pkZ0xc3dGvy8dEe
 bNUQ==
X-Gm-Message-State: AGi0PuZ7UhWEUdNeaXaYZiK7vvV2cs03fts+XDlFq/jrtLM7fH0oemfS
 gWEa84GT9t4lapfF0ZLY+X/boE+NTIIL1wfBvX/wRdUxJcyr4AIzxjbryaC5/4LKsJXnvUDaGnE
 5rBLMRwVcEfZp2mTpXQYsTbwSa/ShUE7/Xj3Vv8KcjQ==
X-Received: by 2002:a05:600c:2214:: with SMTP id
 z20mr2319819wml.189.1587112195128; 
 Fri, 17 Apr 2020 01:29:55 -0700 (PDT)
X-Google-Smtp-Source: APiQypJKNV66xDbZPbEJ9pvldY03mzn5rKaoaGWZw2nM8sRe1qQQQA0lQolXxgIpPJn0ZvUYcb5Wmw==
X-Received: by 2002:a05:600c:2214:: with SMTP id
 z20mr2319790wml.189.1587112194907; 
 Fri, 17 Apr 2020 01:29:54 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id k133sm7277794wma.0.2020.04.17.01.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 01:29:54 -0700 (PDT)
Date: Fri, 17 Apr 2020 04:29:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2] vhost: do not enable VHOST_MENU by default
Message-ID: <20200417042912-mutt-send-email-mst@kernel.org>
References: <20200415024356.23751-1-jasowang@redhat.com>
 <20200416185426-mutt-send-email-mst@kernel.org>
 <b7e2deb7-cb64-b625-aeb4-760c7b28c0c8@redhat.com>
 <20200417022929-mutt-send-email-mst@kernel.org>
 <4274625d-6feb-81b6-5b0a-695229e7c33d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <4274625d-6feb-81b6-5b0a-695229e7c33d@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-s390@vger.kernel.org, tsbogend@alpha.franken.de,
 benh@kernel.crashing.org, gor@linux.ibm.com, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, heiko.carstens@de.ibm.com,
 linux-mips@vger.kernel.org, virtualization@lists.linux-foundation.org,
 borntraeger@de.ibm.com, geert@linux-m68k.org,
 Michael Ellerman <mpe@ellerman.id.au>, netdev@vger.kernel.org,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org
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

T24gRnJpLCBBcHIgMTcsIDIwMjAgYXQgMDM6MzY6NTJQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzQvMTcg5LiL5Y2IMjozMywgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gRnJpLCBBcHIgMTcsIDIwMjAgYXQgMTE6MTI6MTRBTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPiA+ID4gT24gMjAyMC80LzE3IOS4iuWNiDY6NTUsIE1pY2hhZWwgUy4gVHNpcmtp
biB3cm90ZToKPiA+ID4gPiBPbiBXZWQsIEFwciAxNSwgMjAyMCBhdCAxMDo0Mzo1NkFNICswODAw
LCBKYXNvbiBXYW5nIHdyb3RlOgo+ID4gPiA+ID4gV2UgdHJ5IHRvIGtlZXAgdGhlIGRlZmNvbmZp
ZyB1bnRvdWNoZWQgYWZ0ZXIgZGVjb3VwbGluZyBDT05GSUdfVkhPU1QKPiA+ID4gPiA+IG91dCBv
ZiBDT05GSUdfVklSVFVBTElaQVRJT04gaW4gY29tbWl0IDIwYzM4NGYxZWExYQo+ID4gPiA+ID4g
KCJ2aG9zdDogcmVmaW5lIHZob3N0IGFuZCB2cmluZ2gga2NvbmZpZyIpIGJ5IGVuYWJsaW5nIFZI
T1NUX01FTlUgYnkKPiA+ID4gPiA+IGRlZmF1bHQuIFRoZW4gdGhlIGRlZmNvbmZpZ3MgY2FuIGtl
ZXAgZW5hYmxpbmcgQ09ORklHX1ZIT1NUX05FVAo+ID4gPiA+ID4gd2l0aG91dCB0aGUgY2FyaW5n
IG9mIENPTkZJR19WSE9TVC4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gQnV0IHRoaXMgd2lsbCBsZWF2
ZSBhICJDT05GSUdfVkhPU1RfTUVOVT15IiBpbiBhbGwgZGVmY29uZmlncyBhbmQgZXZlbgo+ID4g
PiA+ID4gZm9yIHRoZSBvbmVzIHRoYXQgZG9lc24ndCB3YW50IHZob3N0LiBTbyBpdCBhY3R1YWxs
eSBzaGlmdHMgdGhlCj4gPiA+ID4gPiBidXJkZW5zIHRvIHRoZSBtYWludGFpbmVycyBvZiBhbGwg
b3RoZXIgdG8gYWRkICJDT05GSUdfVkhPU1RfTUVOVSBpcwo+ID4gPiA+ID4gbm90IHNldCIuIFNv
IHRoaXMgcGF0Y2ggdHJpZXMgdG8gZW5hYmxlIENPTkZJR19WSE9TVCBleHBsaWNpdGx5IGluCj4g
PiA+ID4gPiBkZWZjb25maWdzIHRoYXQgZW5hYmxlcyBDT05GSUdfVkhPU1RfTkVUIGFuZCBDT05G
SUdfVkhPU1RfVlNPQ0suCj4gPiA+ID4gPiAKPiA+ID4gPiA+IEFja2VkLWJ5OiBDaHJpc3RpYW4g
Qm9ybnRyYWVnZXI8Ym9ybnRyYWVnZXJAZGUuaWJtLmNvbT4gIChzMzkwKQo+ID4gPiA+ID4gQWNr
ZWQtYnk6IE1pY2hhZWwgRWxsZXJtYW48bXBlQGVsbGVybWFuLmlkLmF1PiAgKHBvd2VycGMpCj4g
PiA+ID4gPiBDYzogVGhvbWFzIEJvZ2VuZG9lcmZlcjx0c2JvZ2VuZEBhbHBoYS5mcmFua2VuLmRl
Pgo+ID4gPiA+ID4gQ2M6IEJlbmphbWluIEhlcnJlbnNjaG1pZHQ8YmVuaEBrZXJuZWwuY3Jhc2hp
bmcub3JnPgo+ID4gPiA+ID4gQ2M6IFBhdWwgTWFja2VycmFzPHBhdWx1c0BzYW1iYS5vcmc+Cj4g
PiA+ID4gPiBDYzogTWljaGFlbCBFbGxlcm1hbjxtcGVAZWxsZXJtYW4uaWQuYXU+Cj4gPiA+ID4g
PiBDYzogSGVpa28gQ2Fyc3RlbnM8aGVpa28uY2Fyc3RlbnNAZGUuaWJtLmNvbT4KPiA+ID4gPiA+
IENjOiBWYXNpbHkgR29yYmlrPGdvckBsaW51eC5pYm0uY29tPgo+ID4gPiA+ID4gQ2M6IENocmlz
dGlhbiBCb3JudHJhZWdlcjxib3JudHJhZWdlckBkZS5pYm0uY29tPgo+ID4gPiA+ID4gUmVwb3J0
ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbjxnZWVydEBsaW51eC1tNjhrLm9yZz4KPiA+ID4gPiA+
IFNpZ25lZC1vZmYtYnk6IEphc29uIFdhbmc8amFzb3dhbmdAcmVkaGF0LmNvbT4KPiA+ID4gPiBJ
IHJlYmFzZWQgdGhpcyBvbiB0b3Agb2YgT0FCSSBmaXggc2luY2UgdGhhdAo+ID4gPiA+IHNlZW1z
IG1vcmUgb3JnZW50IHRvIGZpeC4KPiA+ID4gPiBQdXNoZWQgdG8gbXkgdmhvc3QgYnJhbmNoIHBs
cyB0YWtlIGEgbG9vayBhbmQKPiA+ID4gPiBpZiBwb3NzaWJsZSB0ZXN0Lgo+ID4gPiA+IFRoYW5r
cyEKPiA+ID4gCj4gPiA+IEkgdGVzdCB0aGlzIHBhdGNoIGJ5IGdlbmVyYXRpbmcgdGhlIGRlZmNv
bmZpZ3MgdGhhdCB3YW50cyB2aG9zdF9uZXQgb3IKPiA+ID4gdmhvc3RfdnNvY2suIEFsbCBsb29r
cyBmaW5lLgo+ID4gPiAKPiA+ID4gQnV0IGhhdmluZyBDT05GSUdfVkhPU1RfRFBOPXkgbWF5IGVu
ZCB1cCB3aXRoIHRoZSBzaW1pbGFyIHNpdHVhdGlvbiB0aGF0Cj4gPiA+IHRoaXMgcGF0Y2ggd2Fu
dCB0byBhZGRyZXNzLgo+ID4gPiBNYXliZSB3ZSBjYW4gbGV0IENPTkZJR19WSE9TVCBkZXBlbmRz
IG9uICFBUk0gfHwgQUVBQkkgdGhlbiBhZGQgYW5vdGhlcgo+ID4gPiBtZW51Y29uZmlnIGZvciBW
SE9TVF9SSU5HIGFuZCBkbyBzb21ldGhpbmcgc2ltaWxhcj8KPiA+ID4gCj4gPiA+IFRoYW5rcwo+
ID4gU29ycnkgSSBkb24ndCB1bmRlcnN0YW5kLiBBZnRlciB0aGlzIHBhdGNoIENPTkZJR19WSE9T
VF9EUE4gaXMganVzdAo+ID4gYW4gaW50ZXJuYWwgdmFyaWFibGUgZm9yIHRoZSBPQUJJIGZpeC4g
SSBrZXB0IGl0IHNlcGFyYXRlCj4gPiBzbyBpdCdzIGVhc3kgdG8gcmV2ZXJ0IGZvciA1LjguIFll
cyB3ZSBjb3VsZCBzcXVhc2ggaXQgaW50bwo+ID4gVkhPU1QgZGlyZWN0bHkgYnV0IEkgZG9uJ3Qg
c2VlIGhvdyB0aGF0IGNoYW5nZXMgbG9naWMgYXQgYWxsLgo+IAo+IAo+IFNvcnJ5IGZvciBiZWlu
ZyB1bmNsZWFyLgo+IAo+IEkgbWVhbnQgc2luY2UgaXQgd2FzIGVuYWJsZWQgYnkgZGVmYXVsdCwg
IkNPTkZJR19WSE9TVF9EUE49eSIgd2lsbCBiZSBsZWZ0Cj4gaW4gdGhlIGRlZmNvbmZpZ3MuCgpC
dXQgd2hvIGNhcmVzPyBUaGF0IGRvZXMgbm90IGFkZCBhbnkgY29kZSwgZG9lcyBpdD8KCj4gVGhp
cyByZXF1aXJlcyB0aGUgYXJjaCBtYWludGFpbmVycyB0byBhZGQKPiAiQ09ORklHX1ZIT1NUX1ZE
UE4gaXMgbm90IHNldCIuIChHZWVydCBjb21wbGFpbnMgYWJvdXQgdGhpcykKPiAKPiBUaGFua3MK
PiAKPiAKPiA+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4
LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
