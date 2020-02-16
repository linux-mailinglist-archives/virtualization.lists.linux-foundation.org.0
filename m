Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B9511160264
	for <lists.virtualization@lfdr.de>; Sun, 16 Feb 2020 09:05:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 619E0863FF;
	Sun, 16 Feb 2020 08:05:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W1Y045qR9PkS; Sun, 16 Feb 2020 08:05:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DCF5E86102;
	Sun, 16 Feb 2020 08:05:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C2D02C0177;
	Sun, 16 Feb 2020 08:05:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 00951C0177
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 08:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EE4FB86102
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 08:05:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i0B7czrfC1Iq
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 08:05:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B9298860FD
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 08:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581840310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fe+2EiYjd4R9+W3IYivCJLz/1YbX+VFve4j127ah4jg=;
 b=ZoCZeOIjLK+k4ds48el/ivAfoeh3lGon64XvyavO63zkHVu7WcisoEr4qkKgGs5DYiokgr
 x70UaU+dDT9evvXjHjVIJFxAjbyhOX7nYZzCQXM9fuT5/AKW2+tzv3Vj2IJOVXhJhOHvCV
 /vUisTKpjVHdamOL/t9BEsThFSl8ayc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-v_a6EaBONT6K3XqBzYhGWw-1; Sun, 16 Feb 2020 03:05:06 -0500
Received: by mail-wr1-f72.google.com with SMTP id v17so6903377wrm.17
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 00:05:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=XOtjGEIbedMeSAqorVosrRbZsj8B1U3C9ArIGgDEZ2w=;
 b=B0fSO3mqeg9pkxyaQcybYMmLnFCcGBC1woNE4I5pjFsCjDekbZTqlXamlbmJG+nyAr
 mgJxicMfhrPpmLAqSr0H2aoJHOBfvXA8kxUVyHIip6ccz7/GtCEwxHK59CsZmvcF15K/
 6BPYDlJia1ozTEuRschU8zZ8zTxgQQNO2m5NPcmskEAjza6OrkNyJT629IzcpHpF7rgU
 PUCx9F95ngVf/FNTdlSp3JGsffzaqir2rkYBuf2/IzUkFwoahacbsRC5J55ScCPJPycx
 omlLaNkloByBBqWtiASG6UEivlfeerU0hIcqofsK8TMCucBQMqBfDjiLa0tqwKHsdhz7
 b6Eg==
X-Gm-Message-State: APjAAAUoR+lKnNDOZ+b0iDd8IkAuDw2mDtYw9wgiwdUJ1gI03Nmxww2m
 H78i/qRnae1uGVmZRXDSHkOO0HXxkfBb1ORYnhPktc0L8AP9O4347+GGfTkJa6vHLoYYHeZmwjC
 LF41Uhg5P4EbtmlyXiCXDvTs6jyw41W1fHZKPCJHG2g==
X-Received: by 2002:adf:e8ca:: with SMTP id k10mr13940840wrn.50.1581840305095; 
 Sun, 16 Feb 2020 00:05:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqyGXmKr86Nd7T6BOeIKwH3t5TmwJTAXT4j1+KFFsWqbBkC8vpb+ZbELAqZ0A+HoVSoTG/v/6Q==
X-Received: by 2002:adf:e8ca:: with SMTP id k10mr13940820wrn.50.1581840304880; 
 Sun, 16 Feb 2020 00:05:04 -0800 (PST)
Received: from [192.168.3.122] (p5B0C616F.dip0.t-ipconnect.de. [91.12.97.111])
 by smtp.gmail.com with ESMTPSA id
 z6sm15225156wrw.36.2020.02.16.00.05.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Feb 2020 00:05:04 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] virtio_balloon: Fix unused label warning
Date: Sun, 16 Feb 2020 09:05:02 +0100
Message-Id: <FF9BD3B9-7D78-4470-89CD-6F6831F4B6A6@redhat.com>
References: <20200216074639.GA25292@ubuntu-m2-xlarge-x86>
In-Reply-To: <20200216074639.GA25292@ubuntu-m2-xlarge-x86>
To: Nathan Chancellor <natechancellor@gmail.com>
X-Mailer: iPhone Mail (17D50)
X-MC-Unique: v_a6EaBONT6K3XqBzYhGWw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: "Michael S. Tsirkin" <mst@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org, Borislav Petkov <bp@alien8.de>
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

PiBBbSAxNi4wMi4yMDIwIHVtIDA4OjQ2IHNjaHJpZWIgTmF0aGFuIENoYW5jZWxsb3IgPG5hdGVj
aGFuY2VsbG9yQGdtYWlsLmNvbT46Cj4gCj4g77u/T24gTW9uLCBGZWIgMTAsIDIwMjAgYXQgMTA6
MzM6MjhBTSArMDEwMCwgQm9yaXNsYXYgUGV0a292IHdyb3RlOgo+PiBGcm9tOiBCb3Jpc2xhdiBQ
ZXRrb3YgPGJwQHN1c2UuZGU+Cj4+IAo+PiBGaXgKPj4gCj4+ICBkcml2ZXJzL3ZpcnRpby92aXJ0
aW9fYmFsbG9vbi5jOiBJbiBmdW5jdGlvbiDigJh2aXJ0YmFsbG9vbl9wcm9iZeKAmToKPj4gIGRy
aXZlcnMvdmlydGlvL3ZpcnRpb19iYWxsb29uLmM6OTYzOjE6IHdhcm5pbmc6IGxhYmVsIOKAmG91
dF9kZWxfdnFz4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1sYWJlbF0KPj4gICAg
OTYzIHwgb3V0X2RlbF92cXM6Cj4+ICAgICAgICB8IF5+Cj4+IAo+PiBUaGUgQ09ORklHX0JBTExP
T05fQ09NUEFDVElPTiBpZmRlZmZlcnkgc2hvdWxkIGVuY2xvc2UgaXQgdG9vLgo+PiAKPj4gU2ln
bmVkLW9mZi1ieTogQm9yaXNsYXYgUGV0a292IDxicEBzdXNlLmRlPgo+PiBDYzogRGF2aWQgSGls
ZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+Cj4+IC0tLQo+PiBkcml2ZXJzL3ZpcnRpby92aXJ0
aW9fYmFsbG9vbi5jIHwgMiArLQo+PiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPj4gCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fYmFs
bG9vbi5jIGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX2JhbGxvb24uYwo+PiBpbmRleCA3YmZlMzY1
ZDkzNzIuLmI2ZWQ1ZjhiY2NiMSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy92aXJ0aW8vdmlydGlv
X2JhbGxvb24uYwo+PiArKysgYi9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fYmFsbG9vbi5jCj4+IEBA
IC05NTksOSArOTU5LDkgQEAgc3RhdGljIGludCB2aXJ0YmFsbG9vbl9wcm9iZShzdHJ1Y3Qgdmly
dGlvX2RldmljZSAqdmRldikKPj4gICAgaXB1dCh2Yi0+dmJfZGV2X2luZm8uaW5vZGUpOwo+PiBv
dXRfa2Vybl91bm1vdW50Ogo+PiAgICBrZXJuX3VubW91bnQoYmFsbG9vbl9tbnQpOwo+PiAtI2Vu
ZGlmCj4+IG91dF9kZWxfdnFzOgo+PiAgICB2ZGV2LT5jb25maWctPmRlbF92cXModmRldik7Cj4+
ICsjZW5kaWYKPiAKPiBJIG5vdGljZWQgdGhlIHNhbWUgaXNzdWUgYW5kIHNlbnQgYW4gYWxtb3N0
IGlkZW50aWNhbCBwYXRjaCBbMV0gYnV0IEkKPiBrZXB0IHRoZSBjYWxsIHRvIGRlbF92cXMgb3V0
c2lkZSBvZiB0aGUgQ09ORklHX0JBTExPT05fQ09NUEFDVElPTiBndWFyZAo+IHNpbmNlIGl0IHNl
ZW1zIGxpa2UgdGhhdCBzaG91bGQgc3RpbGwgYmUgY2FsbGVkIHdoZW4gdGhhdCBjb25maWcgaXMK
PiB1bnNldCwgYXMgdGhhdCB3YXMgdGhlIGNhc2UgYmVmb3JlIGNvbW1pdCAxYWQ2ZjU4ZWE5MzYg
KCJ2aXJ0aW9fYmFsbG9vbjoKPiBGaXggbWVtb3J5IGxlYWtzIG9uIGVycm9ycyBpbiB2aXJ0YmFs
bG9vbl9wcm9iZSgpIikuIElzIHRoaXMgcGF0Y2ggZnVsbHkKPiBjb3JyZWN0PyBJIGFtIG5vdCBh
IHZpcnRpbyBleHBlcnQgYXQgYWxsLCBqdXN0IG5vdGljaW5nIGZyb20gYSBicmllZgo+IHJlYWRp
bmcgb2YgdGhpcyBmdW5jdGlvbi4KCkkgdGhpbmsgeW91IGFyZSByaWdodCBhbmQgdGhpcyBzcGxp
cHBlZCBteSBleWVzIQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxp
bnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWls
bWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
