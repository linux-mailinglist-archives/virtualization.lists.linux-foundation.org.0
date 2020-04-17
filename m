Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 305161AD629
	for <lists.virtualization@lfdr.de>; Fri, 17 Apr 2020 08:33:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CF465856F4;
	Fri, 17 Apr 2020 06:33:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hcVz78T0v0EJ; Fri, 17 Apr 2020 06:33:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4B43A83AF8;
	Fri, 17 Apr 2020 06:33:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2B97BC0172;
	Fri, 17 Apr 2020 06:33:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA687C0172
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 06:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B7C4B83AF8
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 06:33:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jRGcubjfVae2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 06:33:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 080E381CF3
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 06:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587105229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aRp3vqzXNggkBlbb5TjXuZYOr8GevPVbWARU6hChYxw=;
 b=BQvsNxMBhEALmRdbfDIofO55JqjmOWKMAVF7K+z6iTQAlzSMNIrjpFGLD6cdS+Mew2Kzvh
 F2ejn2zNSseH0aaeGosuz0/1A37XSp3VcjPEBftzTvBI8/xAo68WWroxC7ymxwapto/kGs
 3klNTwxZ5IE0vjax/kndl/bHMXar1js=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-I4dO37npMKKx-AWMcA5K4Q-1; Fri, 17 Apr 2020 02:33:48 -0400
X-MC-Unique: I4dO37npMKKx-AWMcA5K4Q-1
Received: by mail-wm1-f70.google.com with SMTP id 72so2188739wmb.1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 23:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=aRp3vqzXNggkBlbb5TjXuZYOr8GevPVbWARU6hChYxw=;
 b=Y+7OJRYV+ASWLdCbh4RqGU73WHrzrQ5WWb+QsBVApBR+6JDQ+x1CT40dT/7dJjf8MZ
 orWeQnr3IhA4WATiKLCqOrAUxnoYXwyR4FcPiAkLfIG+M8NZW6rBlO1tDwpmK/l29roC
 YrL/1jbGNyFeybFbpLNNmuWa8kf+BLPX2y+soUM9vJYu0JoTJew7kYsyUlx+JcKVlG8s
 NJ3Ul+9C+CmvR/JdVZTO0HDQiwZbDE2Z+nYcPwUJkOIyIqkLvGzlsl485eZaqAigvjJ9
 gSy/tHjMFJuS0bNql6GuQ3M09tPxzezAsrL3Scefm2//QomIfKwsekHrHUociLehh4TG
 OkcA==
X-Gm-Message-State: AGi0Pua7o43xVOM8lDlO+XGJs0lhQzC7gMzuA+/+TrbLc9EWdX2Kfq1J
 F0T1VyMTP8EGtNArcimk8YHeayf2g4lHiaNdpSRgkmDM4D7+myftDhQTJsLMUqa6HRMHIcNH+K3
 YXJ53G3992eFMlNenfOmrMrXyQZxYFFNPPtdxQ9LaXw==
X-Received: by 2002:a1c:5a06:: with SMTP id o6mr1725634wmb.34.1587105227185;
 Thu, 16 Apr 2020 23:33:47 -0700 (PDT)
X-Google-Smtp-Source: APiQypLC+56jzTsL7mtJ8WJVomZZD1bGAAbZ16bTvi8qD3oQHVUMVTlOszcQ+jGs26hCvKjQJ7zNyQ==
X-Received: by 2002:a1c:5a06:: with SMTP id o6mr1725618wmb.34.1587105226999;
 Thu, 16 Apr 2020 23:33:46 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id k184sm6461323wmf.9.2020.04.16.23.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 23:33:46 -0700 (PDT)
Date: Fri, 17 Apr 2020 02:33:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2] vhost: do not enable VHOST_MENU by default
Message-ID: <20200417022929-mutt-send-email-mst@kernel.org>
References: <20200415024356.23751-1-jasowang@redhat.com>
 <20200416185426-mutt-send-email-mst@kernel.org>
 <b7e2deb7-cb64-b625-aeb4-760c7b28c0c8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b7e2deb7-cb64-b625-aeb4-760c7b28c0c8@redhat.com>
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

T24gRnJpLCBBcHIgMTcsIDIwMjAgYXQgMTE6MTI6MTRBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzQvMTcg5LiK5Y2INjo1NSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gV2VkLCBBcHIgMTUsIDIwMjAgYXQgMTA6NDM6NTZBTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPiA+ID4gV2UgdHJ5IHRvIGtlZXAgdGhlIGRlZmNvbmZpZyB1bnRvdWNoZWQgYWZ0
ZXIgZGVjb3VwbGluZyBDT05GSUdfVkhPU1QKPiA+ID4gb3V0IG9mIENPTkZJR19WSVJUVUFMSVpB
VElPTiBpbiBjb21taXQgMjBjMzg0ZjFlYTFhCj4gPiA+ICgidmhvc3Q6IHJlZmluZSB2aG9zdCBh
bmQgdnJpbmdoIGtjb25maWciKSBieSBlbmFibGluZyBWSE9TVF9NRU5VIGJ5Cj4gPiA+IGRlZmF1
bHQuIFRoZW4gdGhlIGRlZmNvbmZpZ3MgY2FuIGtlZXAgZW5hYmxpbmcgQ09ORklHX1ZIT1NUX05F
VAo+ID4gPiB3aXRob3V0IHRoZSBjYXJpbmcgb2YgQ09ORklHX1ZIT1NULgo+ID4gPiAKPiA+ID4g
QnV0IHRoaXMgd2lsbCBsZWF2ZSBhICJDT05GSUdfVkhPU1RfTUVOVT15IiBpbiBhbGwgZGVmY29u
ZmlncyBhbmQgZXZlbgo+ID4gPiBmb3IgdGhlIG9uZXMgdGhhdCBkb2Vzbid0IHdhbnQgdmhvc3Qu
IFNvIGl0IGFjdHVhbGx5IHNoaWZ0cyB0aGUKPiA+ID4gYnVyZGVucyB0byB0aGUgbWFpbnRhaW5l
cnMgb2YgYWxsIG90aGVyIHRvIGFkZCAiQ09ORklHX1ZIT1NUX01FTlUgaXMKPiA+ID4gbm90IHNl
dCIuIFNvIHRoaXMgcGF0Y2ggdHJpZXMgdG8gZW5hYmxlIENPTkZJR19WSE9TVCBleHBsaWNpdGx5
IGluCj4gPiA+IGRlZmNvbmZpZ3MgdGhhdCBlbmFibGVzIENPTkZJR19WSE9TVF9ORVQgYW5kIENP
TkZJR19WSE9TVF9WU09DSy4KPiA+ID4gCj4gPiA+IEFja2VkLWJ5OiBDaHJpc3RpYW4gQm9ybnRy
YWVnZXI8Ym9ybnRyYWVnZXJAZGUuaWJtLmNvbT4gIChzMzkwKQo+ID4gPiBBY2tlZC1ieTogTWlj
aGFlbCBFbGxlcm1hbjxtcGVAZWxsZXJtYW4uaWQuYXU+ICAocG93ZXJwYykKPiA+ID4gQ2M6IFRo
b21hcyBCb2dlbmRvZXJmZXI8dHNib2dlbmRAYWxwaGEuZnJhbmtlbi5kZT4KPiA+ID4gQ2M6IEJl
bmphbWluIEhlcnJlbnNjaG1pZHQ8YmVuaEBrZXJuZWwuY3Jhc2hpbmcub3JnPgo+ID4gPiBDYzog
UGF1bCBNYWNrZXJyYXM8cGF1bHVzQHNhbWJhLm9yZz4KPiA+ID4gQ2M6IE1pY2hhZWwgRWxsZXJt
YW48bXBlQGVsbGVybWFuLmlkLmF1Pgo+ID4gPiBDYzogSGVpa28gQ2Fyc3RlbnM8aGVpa28uY2Fy
c3RlbnNAZGUuaWJtLmNvbT4KPiA+ID4gQ2M6IFZhc2lseSBHb3JiaWs8Z29yQGxpbnV4LmlibS5j
b20+Cj4gPiA+IENjOiBDaHJpc3RpYW4gQm9ybnRyYWVnZXI8Ym9ybnRyYWVnZXJAZGUuaWJtLmNv
bT4KPiA+ID4gUmVwb3J0ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbjxnZWVydEBsaW51eC1tNjhr
Lm9yZz4KPiA+ID4gU2lnbmVkLW9mZi1ieTogSmFzb24gV2FuZzxqYXNvd2FuZ0ByZWRoYXQuY29t
Pgo+ID4gSSByZWJhc2VkIHRoaXMgb24gdG9wIG9mIE9BQkkgZml4IHNpbmNlIHRoYXQKPiA+IHNl
ZW1zIG1vcmUgb3JnZW50IHRvIGZpeC4KPiA+IFB1c2hlZCB0byBteSB2aG9zdCBicmFuY2ggcGxz
IHRha2UgYSBsb29rIGFuZAo+ID4gaWYgcG9zc2libGUgdGVzdC4KPiA+IFRoYW5rcyEKPiAKPiAK
PiBJIHRlc3QgdGhpcyBwYXRjaCBieSBnZW5lcmF0aW5nIHRoZSBkZWZjb25maWdzIHRoYXQgd2Fu
dHMgdmhvc3RfbmV0IG9yCj4gdmhvc3RfdnNvY2suIEFsbCBsb29rcyBmaW5lLgo+IAo+IEJ1dCBo
YXZpbmcgQ09ORklHX1ZIT1NUX0RQTj15IG1heSBlbmQgdXAgd2l0aCB0aGUgc2ltaWxhciBzaXR1
YXRpb24gdGhhdAo+IHRoaXMgcGF0Y2ggd2FudCB0byBhZGRyZXNzLgo+IE1heWJlIHdlIGNhbiBs
ZXQgQ09ORklHX1ZIT1NUIGRlcGVuZHMgb24gIUFSTSB8fCBBRUFCSSB0aGVuIGFkZCBhbm90aGVy
Cj4gbWVudWNvbmZpZyBmb3IgVkhPU1RfUklORyBhbmQgZG8gc29tZXRoaW5nIHNpbWlsYXI/Cj4g
Cj4gVGhhbmtzCgpTb3JyeSBJIGRvbid0IHVuZGVyc3RhbmQuIEFmdGVyIHRoaXMgcGF0Y2ggQ09O
RklHX1ZIT1NUX0RQTiBpcyBqdXN0CmFuIGludGVybmFsIHZhcmlhYmxlIGZvciB0aGUgT0FCSSBm
aXguIEkga2VwdCBpdCBzZXBhcmF0ZQpzbyBpdCdzIGVhc3kgdG8gcmV2ZXJ0IGZvciA1LjguIFll
cyB3ZSBjb3VsZCBzcXVhc2ggaXQgaW50bwpWSE9TVCBkaXJlY3RseSBidXQgSSBkb24ndCBzZWUg
aG93IHRoYXQgY2hhbmdlcyBsb2dpYyBhdCBhbGwuCgotLSAKTVNUCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxp
c3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0
cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
