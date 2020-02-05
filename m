Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CF1152929
	for <lists.virtualization@lfdr.de>; Wed,  5 Feb 2020 11:33:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A7021204B7;
	Wed,  5 Feb 2020 10:33:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TbT-mqTvoJ-M; Wed,  5 Feb 2020 10:33:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A4A49204B4;
	Wed,  5 Feb 2020 10:33:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8981CC0174;
	Wed,  5 Feb 2020 10:33:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9341FC0174
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 10:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 817D685C19
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 10:33:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fgi3CazoLPQl
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 10:33:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CA57485C05
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 10:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580898829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fMJo0Joxo+pl/mB5o3Pd3oM2dXap9Kiay0KNytUxRsU=;
 b=ZIWxRiOIzLW96aEkYuzKP+c8c6Yr4VUb/c/lPxeAgEQfDfkgOe5MfIc00azpJg+CofmS5H
 oFRmCVrbW2lAeXJYCkJvCYyvfywqE3Z8VW1XF1CPlZKOc6I3ZkOkPmGu/0ynXMJh1yC7i+
 B9iSR9oVlUUGUgqROv65tADe6ktU4rY=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-kuF1oFoDMpW6zsQ_OffCBA-1; Wed, 05 Feb 2020 05:33:48 -0500
Received: by mail-qk1-f199.google.com with SMTP id m13so963881qka.9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 05 Feb 2020 02:33:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=fMJo0Joxo+pl/mB5o3Pd3oM2dXap9Kiay0KNytUxRsU=;
 b=fuOd2ktlrN6tWDFIttRoDsI8wBEwMAfUHWJF/cairE0o84zlxhWLJyNX7QtR6hvTrk
 qFoIkJqYBFER/RNmwU/nVaI9BNzmXBvn6mBprN26qCkOsRhk1ro50FhN0vyNPf6Xto+r
 E8D1XIYWxk6MDw3Vym/Q7ROGdAtoh2ffJyynZD3M1l2rXO/LzIC9z4NRR7T9MpLKklxC
 CMG0AejYntvQkcZPUlKP7uI/hL9TUZ4sZDMPPw4dOeCZSFCyKAqfxLSAw5/NUC2g1r89
 V2iNRPkR4xiiOfKGNXOW+WR9bnKN/7SsMWLoNlI/Dqws+52JGMgJEX/qn3PbP5KhU4Kd
 y7rg==
X-Gm-Message-State: APjAAAUmdQHmKTH0DIVR2BnfcQ9Y3bON29/aFi/IHuhUjXf62U7t5CXO
 /LykKeSlNumCP6rTgFKcazlTxf3DDlAZLaPLXOqv7+RHPzggWEQuuR6k2bEylhCJJ0muXOCZvdp
 evBU5I5OLgS42FamXAgbLnu8bcNp8fe6RH9J0KTgJVg==
X-Received: by 2002:a37:6853:: with SMTP id d80mr4494835qkc.57.1580898827685; 
 Wed, 05 Feb 2020 02:33:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqxSqc1HJF8dt4Eb/7jFWTJnHSPo1HCY1H3WJbmwy+Vb8UDe9HwZCYMCfYz7+b2DU8mORTzDoA==
X-Received: by 2002:a37:6853:: with SMTP id d80mr4494800qkc.57.1580898827421; 
 Wed, 05 Feb 2020 02:33:47 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id p50sm13949401qtf.5.2020.02.05.02.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 02:33:46 -0800 (PST)
Date: Wed, 5 Feb 2020 05:33:40 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Shahaf Shuler <shahafs@mellanox.com>
Subject: Re: [PATCH] vhost: introduce vDPA based backend
Message-ID: <20200205053129-mutt-send-email-mst@kernel.org>
References: <20200131033651.103534-1-tiwei.bie@intel.com>
 <7aab2892-bb19-a06a-a6d3-9c28bc4c3400@redhat.com>
 <20200205020247.GA368700@___>
 <AM0PR0502MB37952015716C1D5E07E390B6C3020@AM0PR0502MB3795.eurprd05.prod.outlook.com>
 <112858a4-1a01-f4d7-e41a-1afaaa1cad45@redhat.com>
 <AM0PR0502MB3795AD42233D69F350402A8AC3020@AM0PR0502MB3795.eurprd05.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <AM0PR0502MB3795AD42233D69F350402A8AC3020@AM0PR0502MB3795.eurprd05.prod.outlook.com>
X-MC-Unique: kuF1oFoDMpW6zsQ_OffCBA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Jason Gunthorpe <jgg@mellanox.com>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 Parav Pandit <parav@mellanox.com>, Jiri Pirko <jiri@mellanox.com>,
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

T24gV2VkLCBGZWIgMDUsIDIwMjAgYXQgMDk6MzA6MTRBTSArMDAwMCwgU2hhaGFmIFNodWxlciB3
cm90ZToKPiBXZWRuZXNkYXksIEZlYnJ1YXJ5IDUsIDIwMjAgOTo1MCBBTSwgSmFzb24gV2FuZzoK
PiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHZob3N0OiBpbnRyb2R1Y2UgdkRQQSBiYXNlZCBiYWNr
ZW5kCj4gPiBPbiAyMDIwLzIvNSDkuIvljYgzOjE1LCBTaGFoYWYgU2h1bGVyIHdyb3RlOgo+ID4g
PiBXZWRuZXNkYXksIEZlYnJ1YXJ5IDUsIDIwMjAgNDowMyBBTSwgVGl3ZWkgQmllOgo+ID4gPj4g
U3ViamVjdDogUmU6IFtQQVRDSF0gdmhvc3Q6IGludHJvZHVjZSB2RFBBIGJhc2VkIGJhY2tlbmQK
PiA+ID4+Cj4gPiA+PiBPbiBUdWUsIEZlYiAwNCwgMjAyMCBhdCAxMTozMDoxMUFNICswODAwLCBK
YXNvbiBXYW5nIHdyb3RlOgo+ID4gPj4+IE9uIDIwMjAvMS8zMSDkuIrljYgxMTozNiwgVGl3ZWkg
QmllIHdyb3RlOgo+ID4gPj4+PiBUaGlzIHBhdGNoIGludHJvZHVjZXMgYSB2RFBBIGJhc2VkIHZo
b3N0IGJhY2tlbmQuIFRoaXMgYmFja2VuZCBpcwo+ID4gPj4+PiBidWlsdCBvbiB0b3Agb2YgdGhl
IHNhbWUgaW50ZXJmYWNlIGRlZmluZWQgaW4gdmlydGlvLXZEUEEgYW5kCj4gPiA+Pj4+IHByb3Zp
ZGVzIGEgZ2VuZXJpYyB2aG9zdCBpbnRlcmZhY2UgZm9yIHVzZXJzcGFjZSB0byBhY2NlbGVyYXRl
IHRoZQo+ID4gPj4+PiB2aXJ0aW8gZGV2aWNlcyBpbiBndWVzdC4KPiA+ID4+Pj4KPiA+ID4+Pj4g
VGhpcyBiYWNrZW5kIGlzIGltcGxlbWVudGVkIGFzIGEgdkRQQSBkZXZpY2UgZHJpdmVyIG9uIHRv
cCBvZiB0aGUKPiA+ID4+Pj4gc2FtZSBvcHMgdXNlZCBpbiB2aXJ0aW8tdkRQQS4gSXQgd2lsbCBj
cmVhdGUgY2hhciBkZXZpY2UgZW50cnkKPiA+ID4+Pj4gbmFtZWQgdmhvc3QtdmRwYS8kdmRwYV9k
ZXZpY2VfaW5kZXggZm9yIHVzZXJzcGFjZSB0byB1c2UuCj4gPiBVc2Vyc3BhY2UKPiA+ID4+Pj4g
Y2FuIHVzZSB2aG9zdCBpb2N0bHMgb24gdG9wIG9mIHRoaXMgY2hhciBkZXZpY2UgdG8gc2V0dXAg
dGhlIGJhY2tlbmQuCj4gPiA+Pj4+Cj4gPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IFRpd2VpIEJpZSA8
dGl3ZWkuYmllQGludGVsLmNvbT4KPiA+ID4gWy4uLl0KPiA+ID4KPiA+ID4+Pj4gK3N0YXRpYyBs
b25nIHZob3N0X3ZkcGFfZG9fZG1hX21hcHBpbmcoc3RydWN0IHZob3N0X3ZkcGEgKnYpIHsKPiA+
ID4+Pj4gKwkvKiBUT0RPOiBmaXggdGhpcyAqLwo+ID4gPj4+Cj4gPiA+Pj4gQmVmb3JlIHRyeWlu
ZyB0byBkbyB0aGlzIGl0IGxvb2tzIHRvIG1lIHdlIG5lZWQgdGhlIGZvbGxvd2luZyBkdXJpbmcK
PiA+ID4+PiB0aGUgcHJvYmUKPiA+ID4+Pgo+ID4gPj4+IDEpIGlmIHNldF9tYXAoKSBpcyBub3Qg
c3VwcG9ydGVkIGJ5IHRoZSB2RFBBIGRldmljZSBwcm9iZSB0aGUgSU9NTVUKPiA+ID4+PiB0aGF0
IGlzIHN1cHBvcnRlZCBieSB0aGUgdkRQQSBkZXZpY2UKPiA+ID4+PiAyKSBhbGxvY2F0ZSBJT01N
VSBkb21haW4KPiA+ID4+Pgo+ID4gPj4+IEFuZCB0aGVuOgo+ID4gPj4+Cj4gPiA+Pj4gMykgcGlu
IHBhZ2VzIHRocm91Z2ggR1VQIGFuZCBkbyBwcm9wZXIgYWNjb3VudGluZwo+ID4gPj4+IDQpIHN0
b3JlIEdQQS0+SFBBIG1hcHBpbmcgaW4gdGhlIHVtZW0KPiA+ID4+PiA1KSBnZW5lcmF0ZSBkaWZm
cyBvZiBtZW1vcnkgdGFibGUgYW5kIHVzaW5nIElPTU1VIEFQSSB0byBzZXR1cCB0aGUKPiA+ID4+
PiBkbWEgbWFwcGluZyBpbiB0aGlzIG1ldGhvZAo+ID4gPj4+Cj4gPiA+Pj4gRm9yIDEpLCBJJ20g
bm90IHN1cmUgcGFyZW50IGlzIHN1ZmZpY2llbnQgZm9yIHRvIGRvaW5nIHRoaXMgb3IgbmVlZAo+
ID4gPj4+IHRvIGludHJvZHVjZSBuZXcgQVBJIGxpa2UgaW9tbXVfZGV2aWNlIGluIG1kZXYuCj4g
PiA+PiBBZ3JlZS4gV2UgbWF5IGFsc28gbmVlZCB0byBpbnRyb2R1Y2Ugc29tZXRoaW5nIGxpa2Ug
dGhlIGlvbW11X2RldmljZS4KPiA+ID4+Cj4gPiA+IFdvdWxkIGl0IGJlIGJldHRlciBmb3IgdGhl
IG1hcC91bW5hcCBsb2dpYyB0byBoYXBwZW4gaW5zaWRlIGVhY2ggZGV2aWNlID8KPiA+ID4gRGV2
aWNlcyB0aGF0IG5lZWRzIHRoZSBJT01NVSB3aWxsIGNhbGwgaW9tbXUgQVBJcyBmcm9tIGluc2lk
ZSB0aGUgZHJpdmVyCj4gPiBjYWxsYmFjay4KPiA+IAo+ID4gCj4gPiBUZWNobmljYWxseSwgdGhp
cyBjYW4gd29yay4gQnV0IGlmIGl0IGNhbiBiZSBkb25lIGJ5IHZob3N0LXZwZGEgaXQgd2lsbCBt
YWtlIHRoZQo+ID4gdkRQQSBkcml2ZXIgbW9yZSBjb21wYWN0IGFuZCBlYXNpZXIgdG8gYmUgaW1w
bGVtZW50ZWQuCj4gCj4gTmVlZCB0byBzZWUgdGhlIGxheWVyaW5nIG9mIHN1Y2ggcHJvcG9zYWwg
YnV0IGFtIG5vdCBzdXJlLiAKPiBWaG9zdC12ZHBhIGlzIGdlbmVyaWMgZnJhbWV3b3JrLCB3aGls
ZSB0aGUgRE1BIG1hcHBpbmcgaXMgdmVuZG9yIHNwZWNpZmljLiAKPiBNYXliZSB2aG9zdC12ZHBh
IGNhbiBoYXZlIHNvbWUgc2hhcmVkIGNvZGUgbmVlZGVkIHRvIG9wZXJhdGUgb24gaW9tbXUsIHNv
IGRyaXZlcnMgY2FuIHJlLXVzZSBpdC4gIHRvIG1lIGl0IHNlZW1zIHNpbXBsZXIgdGhhbiBleHBv
c2luZyBhIG5ldyBpb21tdSBkZXZpY2UuIAo+IAo+ID4gCj4gPiAKPiA+ID4gRGV2aWNlcyB0aGF0
IGhhcyBvdGhlciB3YXlzIHRvIGRvIHRoZSBETUEgbWFwcGluZyB3aWxsIGNhbGwgdGhlCj4gPiBw
cm9wcmlldGFyeSBBUElzLgo+ID4gCj4gPiAKPiA+IFRvIGNvbmZpcm0sIGRvIHlvdSBwcmVmZXI6
Cj4gPiAKPiA+IDEpIG1hcC91bm1hcAo+IAo+IEl0IGlzIG5vdCBvbmx5IHRoYXQuIEFGQUlSIHRo
ZXJlIGFsc28gZmx1c2ggYW5kIGludmFsaWRhdGUgY2FsbHMsIHJpZ2h0Pwo+IAo+ID4gCj4gPiBv
cgo+ID4gCj4gPiAyKSBwYXNzIGFsbCBtYXBzIGF0IG9uZSB0aW1lPwo+IAo+IFRvIG1lIHRoaXMg
c2VlbXMgbW9yZSBzdHJhaWdodCBmb3J3YXJkLiAKPiBJdCBpcyBjb3JyZWN0IHRoYXQgdW5kZXIg
aG90cGx1ZyBhbmQgbGFyZ2UgbnVtYmVyIG9mIG1lbW9yeSBzZWdtZW50cwo+IHRoZSBkcml2ZXIg
d2lsbCBuZWVkIHRvIHVuZGVyc3RhbmQgdGhlIGRpZmYgKG9yIG5vdCBhbmQganVzdCByZWxvYWQK
PiB0aGUgbmV3IGNvbmZpZ3VyYXRpb24pLgo+IEhvd2V2ZXIsIG15IGFzc3VtcHRpb24gaGVyZSBp
cyB0aGF0IG1lbW9yeQo+IGhvdHBsdWcgaXMgaGVhdnkgZmxvdyBhbnl3YXksIGFuZCB0aGUgZHJp
dmVyIGV4dHJhIGN5Y2xlcyB3aWxsIG5vdCBiZQo+IHRoYXQgdmlzaWJsZQoKSSB0aGluayB3ZSBj
YW4ganVzdCBhbGxvdyBib3RoLCBhZnRlciBhbGwgdmhvc3QgYWxyZWFkeSBoYXMgYm90aCBpbnRl
cmZhY2VzIC4uLgpXZSBqdXN0IG5lZWQgYSBmbGFnIHRoYXQgdGVsbHMgdXNlcnNwYWNlIHdoZXRo
ZXIgaXQgbmVlZHMgdG8KdXBkYXRlIGFsbCBtYXBzIGFnZ3Jlc3NpdmVseSBvciBjYW4gd2FpdCBm
b3IgYSBmYXVsdC4KCj4gPiAKPiA+IFRoYW5rcwo+ID4gCj4gPiAKPiA+ID4KPiAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1h
aWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXph
dGlvbg==
