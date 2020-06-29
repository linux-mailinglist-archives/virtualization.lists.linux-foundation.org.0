Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF4920CFAD
	for <lists.virtualization@lfdr.de>; Mon, 29 Jun 2020 17:28:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 491A48744B;
	Mon, 29 Jun 2020 15:28:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h30-qlhdvth9; Mon, 29 Jun 2020 15:28:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BA89987448;
	Mon, 29 Jun 2020 15:28:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91448C016E;
	Mon, 29 Jun 2020 15:28:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 321F3C016E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 15:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1E080892A5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 15:28:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ui-ukJHC1d9Y
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 15:28:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id ECF5589290
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 15:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593444527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K0zqM4fozodfs5Zl/LL6zY80CPq4jQW26NEQVOlMlns=;
 b=Ce0akTI0UvAcFpSAETzvoFpHkeYVLjaFKlev9rzfNkRcNj8uF2rw0i+6zCcXI4b6d7UVjR
 GHILpXJ/vwawYfeA8+IwXWDDz3AHB2czCtOFWfyxjQEHARPjEAdvIHfRNH6rNiYAtSnbHM
 1QiTKRVHYmYbJX0GbSNV9HRYvgd8xVA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-u3657UDkM-qKEOtiDvzkow-1; Mon, 29 Jun 2020 11:28:45 -0400
X-MC-Unique: u3657UDkM-qKEOtiDvzkow-1
Received: by mail-wr1-f70.google.com with SMTP id z3so16623344wrr.7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 08:28:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=K0zqM4fozodfs5Zl/LL6zY80CPq4jQW26NEQVOlMlns=;
 b=M7X32EK6dUlq2kETYzYr/NZJRS93gC3BbEteUCRsH3eXTmvqGnC0U/z0gw5UX8Yc8J
 4/3eEq1fAJzxMsVdiQ/wgQHe2bdLUHM5nIfBdZYRrBCBKSQl7kliP9oDriDtrdiSqhOb
 OmsMEJ2KE8EesKgEiDFBXJOzzp3tpT8JJqyt9dfwgWeR2l8Ainy+pgPfkNVyT4QHIsIF
 DQI/CM/nzwqJf2z6XDSAG42WsjNmgiaDW04KFS335JK627JcSFr6ljNg7GgePi7ckEC5
 gWoJ9t25ssegNh3hT0gwaPapz1bb6tjqGjUsNhB2CEzcVkDG/07kgBty6wxrT1JXWMsN
 A1zA==
X-Gm-Message-State: AOAM530hL/re8b27IraVvu8+1wjWquoVE7tlAy0hkjA5Nm9QBBTxDbRB
 Xyc2Hx2eXQxQtznnWBIefNJNc94jUAZiJRFxdBh+A0IOT9+DycM79EfRFMw+6WuphYO+JlPXVvP
 dmGFzTqqMNrpj3m4rv6CAILenZRfEnweMVISTprb9bQ==
X-Received: by 2002:a7b:c952:: with SMTP id i18mr18275087wml.65.1593444524743; 
 Mon, 29 Jun 2020 08:28:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7RMK2Tq8coYJFEBNUmuEHP3h5aGlELHq7DlEEAKWPLImLhTJ9vgAoBLyzyynl78hZbHgVSQ==
X-Received: by 2002:a7b:c952:: with SMTP id i18mr18275068wml.65.1593444524502; 
 Mon, 29 Jun 2020 08:28:44 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 r10sm97700wrm.17.2020.06.29.08.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 08:28:43 -0700 (PDT)
Date: Mon, 29 Jun 2020 11:28:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: [RFC 0/3] virtio: NUMA-aware memory allocation
Message-ID: <20200629112212-mutt-send-email-mst@kernel.org>
References: <20200625135752.227293-1-stefanha@redhat.com>
 <9cd725b5-4954-efd9-4d1b-3a448a436472@redhat.com>
 <20200629092646.GC31392@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20200629092646.GC31392@stefanha-x1.localdomain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
 virtualization@lists.linux-foundation.org
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

T24gTW9uLCBKdW4gMjksIDIwMjAgYXQgMTA6MjY6NDZBTSArMDEwMCwgU3RlZmFuIEhham5vY3pp
IHdyb3RlOgo+IE9uIFN1biwgSnVuIDI4LCAyMDIwIGF0IDAyOjM0OjM3UE0gKzA4MDAsIEphc29u
IFdhbmcgd3JvdGU6Cj4gPiAKPiA+IE9uIDIwMjAvNi8yNSDkuIvljYg5OjU3LCBTdGVmYW4gSGFq
bm9jemkgd3JvdGU6Cj4gPiA+IFRoZXNlIHBhdGNoZXMgYXJlIG5vdCByZWFkeSB0byBiZSBtZXJn
ZWQgYmVjYXVzZSBJIHdhcyB1bmFibGUgdG8gbWVhc3VyZSBhCj4gPiA+IHBlcmZvcm1hbmNlIGlt
cHJvdmVtZW50LiBJJ20gcHVibGlzaGluZyB0aGVtIHNvIHRoZXkgYXJlIGFyY2hpdmVkIGluIGNh
c2UKPiA+ID4gc29tZW9uZSBwaWNrcyB1cCB0aGlzIHdvcmsgYWdhaW4gaW4gdGhlIGZ1dHVyZS4K
PiA+ID4gCj4gPiA+IFRoZSBnb2FsIG9mIHRoZXNlIHBhdGNoZXMgaXMgdG8gYWxsb2NhdGUgdmly
dHF1ZXVlcyBhbmQgZHJpdmVyIHN0YXRlIGZyb20gdGhlCj4gPiA+IGRldmljZSdzIE5VTUEgbm9k
ZSBmb3Igb3B0aW1hbCBtZW1vcnkgYWNjZXNzIGxhdGVuY3kuIE9ubHkgZ3Vlc3RzIHdpdGggYSB2
TlVNQQo+ID4gPiB0b3BvbG9neSBhbmQgdmlydGlvIGRldmljZXMgc3ByZWFkIGFjcm9zcyB2TlVN
QSBub2RlcyBiZW5lZml0IGZyb20gdGhpcy4gIEluCj4gPiA+IG90aGVyIGNhc2VzIHRoZSBtZW1v
cnkgcGxhY2VtZW50IGlzIGZpbmUgYW5kIHdlIGRvbid0IG5lZWQgdG8gdGFrZSBOVU1BIGludG8K
PiA+ID4gYWNjb3VudCBpbnNpZGUgdGhlIGd1ZXN0Lgo+ID4gPiAKPiA+ID4gVGhlc2UgcGF0Y2hl
cyBjb3VsZCBiZSBleHRlbmRlZCB0byB2aXJ0aW9fbmV0LmtvIGFuZCBvdGhlciBkZXZpY2VzIGlu
IHRoZQo+ID4gPiBmdXR1cmUuIEkgb25seSB0ZXN0ZWQgdmlydGlvX2Jsay5rby4KPiA+ID4gCj4g
PiA+IFRoZSBiZW5jaG1hcmsgY29uZmlndXJhdGlvbiB3YXMgZGVzaWduZWQgdG8gdHJpZ2dlciB3
b3JzdC1jYXNlIE5VTUEgcGxhY2VtZW50Ogo+ID4gPiAgICogUGh5c2ljYWwgTlZNZSBzdG9yYWdl
IGNvbnRyb2xsZXIgb24gaG9zdCBOVU1BIG5vZGUgMAoKSXQncyBwb3NzaWJsZSB0aGF0IG51bWEg
aXMgbm90IHN1Y2ggYSBiaWcgZGVhbCBmb3IgTlZNZS4KQW5kIGl0J3MgcG9zc2libGUgdGhhdCBi
aW9zIG1pc2NvbmZpZ3VyZXMgQUNQSSByZXBvcnRpbmcgTlVNQSBwbGFjZW1lbnQKaW5jb3JyZWN0
bHkuCkkgdGhpbmsgdGhhdCB0aGUgYmVzdCB0aGluZyB0byB0cnkgaXMgdG8gdXNlIGEgcmFtZGlz
awpvbiBhIHNwZWNpZmljIG51bWEgbm9kZS4KCj4gPiA+ICAgKiBJT1RocmVhZCBwaW5uZWQgdG8g
aG9zdCBOVU1BIG5vZGUgMAo+ID4gPiAgICogdmlydGlvLWJsay1wY2kgZGV2aWNlIGluIHZOVU1B
IG5vZGUgMQo+ID4gPiAgICogdkNQVSAwIG9uIGhvc3QgTlVNQSBub2RlIDEgYW5kIHZDUFUgMSBv
biBob3N0IE5VTUEgbm9kZSAwCj4gPiA+ICAgKiB2Q1BVIDAgaW4gdk5VTUEgbm9kZSAwIGFuZCB2
Q1BVIDEgaW4gdk5VTUEgbm9kZSAxCj4gPiA+IAo+ID4gPiBUaGUgaW50ZW50IGlzIHRvIGhhdmUg
LnByb2JlKCkgY29kZSBydW4gb24gdkNQVSAwIGluIHZOVU1BIG5vZGUgMCAoaG9zdCBOVU1BCj4g
PiA+IG5vZGUgMSkgc28gdGhhdCBtZW1vcnkgaXMgaW4gdGhlIHdyb25nIE5VTUEgbm9kZSBmb3Ig
dGhlIHZpcnRpby1ibGstcGNpIGRldmljPQo+ID4gPiBlLgo+ID4gPiBBcHBseWluZyB0aGVzZSBw
YXRjaGVzIGZpeGVzIG1lbW9yeSBwbGFjZW1lbnQgc28gdGhhdCB2aXJ0cXVldWVzIGFuZCBkcml2
ZXIKPiA+ID4gc3RhdGUgaXMgYWxsb2NhdGVkIGluIHZOVU1BIG5vZGUgMSB3aGVyZSB0aGUgdmly
dGlvLWJsay1wY2kgZGV2aWNlIGlzIGxvY2F0ZWQuCj4gPiA+IAo+ID4gPiBUaGUgZmlvIDRLQiBy
YW5kcmVhZCBiZW5jaG1hcmsgcmVzdWx0cyBkbyBub3Qgc2hvdyBhIHNpZ25pZmljYW50IGltcHJv
dmVtZW50Ogo+ID4gPiAKPiA+ID4gTmFtZSAgICAgICAgICAgICAgICAgIElPUFMgICBFcnJvcgo+
ID4gPiB2aXJ0aW8tYmxrICAgICAgICA0MjM3My43OSA9QzI9QjEgMC41NCUKPiA+ID4gdmlydGlv
LWJsay1udW1hICAgNDI1MTcuMDcgPUMyPUIxIDAuNzklCj4gPiAKPiA+IAo+ID4gSSByZW1lbWJl
ciBJIGRpZCBzb21ldGhpbmcgc2ltaWxhciBpbiB2aG9zdCBieSB1c2luZyBwYWdlX3RvX25pZCgp
IGZvcgo+ID4gZGVzY3JpcHRvciByaW5nLiBBbmQgSSBnZXQgbGl0dGxlIGltcHJvdmVtZW50IGFz
IHNob3duIGhlcmUuCj4gPiAKPiA+IE1pY2hhZWwgcmVtaW5kcyB0aGF0IGl0IHdhcyBwcm9iYWJs
eSBiZWNhdXNlIGFsbCBkYXRhIHdlcmUgY2FjaGVkLiBTbyBJCj4gPiBkb3VidCBpZiB0aGUgdGVz
dCBsYWNrcyBzdWZmaWNpZW50IHN0cmVzcyBvbiB0aGUgY2FjaGUgLi4uCj4gCj4gWWVzLCB0aGF0
IHNvdW5kcyBsaWtlbHkuIElmIHRoZXJlJ3Mgbm8gcmVhbC13b3JsZCBwZXJmb3JtYW5jZQo+IGlt
cHJvdmVtZW50IHRoZW4gSSdtIGhhcHB5IHRvIGxlYXZlIHRoZXNlIHBhdGNoZXMgdW5tZXJnZWQu
Cj4gCj4gU3RlZmFuCgoKV2VsbCB0aGF0IHdhcyBmb3Igdmhvc3QgdGhvdWdoLiBUaGlzIGlzIHZp
cnRpbywgd2hpY2ggaXMgZGlmZmVyZW50LgpEb2Vzbid0IHNvbWUgYmVuY2htYXJrIHB1dCBwcmVz
c3VyZSBvbiB0aGUgQ1BVIGNhY2hlPwoKCkkga2luZCBvZiBmZWVsIHRoZXJlIHNob3VsZCBiZSBh
IGRpZmZlcmVuY2UsIGFuZCB0aGUgZmFjdCB0aGVyZSBpc24ndAptZWFucyB0aGVyZSdzIHNvbWUg
b3RoZXIgYm90dGxlbmVjayBzb21ld2hlcmUuIE1pZ2h0IGJlIHdvcnRoCmZpZ3VyaW5nIG91dC4K
Ci0tIApNU1QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
ClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1m
b3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9s
aXN0aW5mby92aXJ0dWFsaXphdGlvbg==
