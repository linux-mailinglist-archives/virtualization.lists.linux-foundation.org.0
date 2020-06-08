Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 654E41F129B
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 08:00:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 98679204C1;
	Mon,  8 Jun 2020 06:00:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YdYSpZiQ9Ymd; Mon,  8 Jun 2020 06:00:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 488FC20476;
	Mon,  8 Jun 2020 06:00:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 23683C016F;
	Mon,  8 Jun 2020 06:00:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8D00FC016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 05:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6F5DA85570
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 05:59:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w2O9Z8ohF6Ub
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 05:59:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C1E2D85540
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 05:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591595997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KEx8ZqL8ihg/Wp01+GT3ORMPuHVkx1qLDRLe1b2G/YM=;
 b=MIjjkgQmmtGUVwTAbCE1+ib8Wou8DWJe/jhaTbLRfVYOnt2dBFRKt5ak/fYPJDxDEoCOvL
 Z3tMvmwI35Zq3CbcDulgtfPzjF24Pk6kP8RswLpRC8Fnmt+q9Y+3dIOQ1Xub6vE/lIiPmN
 JMIeOnhRSpfX5gp8R/lCMYqTS+n7N6M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-uAPymGhDMT-eKX29LkcFSA-1; Mon, 08 Jun 2020 01:59:55 -0400
X-MC-Unique: uAPymGhDMT-eKX29LkcFSA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19D7818A8220;
 Mon,  8 Jun 2020 05:59:54 +0000 (UTC)
Received: from [10.72.13.71] (ovpn-13-71.pek2.redhat.com [10.72.13.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3CBCA1A927;
 Mon,  8 Jun 2020 05:59:42 +0000 (UTC)
Subject: Re: [PATCH] virtio-mem: drop unnecessary initialization
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20200608054517.708167-1-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <5d00d5e0-0430-dabd-9486-ca363453928f@redhat.com>
Date: Mon, 8 Jun 2020 13:59:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200608054517.708167-1-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 virtualization@lists.linux-foundation.org, kernel test robot <lkp@intel.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjAvNi84IOS4i+WNiDE6NDUsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiByYyBp
cyBpbml0aWFsaXplZCB0byAtRU5JVkFMIGJ1dCB0aGF0J3MgbmV2ZXIgdXNlZC4gRHJvcCBpdC4K
Pgo+IEZpeGVzOiA1ZjFmNzliYmM5ZTIgKCJ2aXJ0aW8tbWVtOiBQYXJhdmlydHVhbGl6ZWQgbWVt
b3J5IGhvdHBsdWciKQo+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVs
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29t
Pgo+IC0tLQo+ICAgZHJpdmVycy92aXJ0aW8vdmlydGlvX21lbS5jIHwgMiArLQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy92aXJ0aW8vdmlydGlvX21lbS5jIGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX21lbS5j
Cj4gaW5kZXggZjY1OGZlOTE0OWJlLi4yZjM1NzE0MmVhNWUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy92aXJ0aW8vdmlydGlvX21lbS5jCj4gKysrIGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX21lbS5j
Cj4gQEAgLTE3NjgsNyArMTc2OCw3IEBAIHN0YXRpYyB2b2lkIHZpcnRpb19tZW1fZGVsZXRlX3Jl
c291cmNlKHN0cnVjdCB2aXJ0aW9fbWVtICp2bSkKPiAgIHN0YXRpYyBpbnQgdmlydGlvX21lbV9w
cm9iZShzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldikKPiAgIHsKPiAgIAlzdHJ1Y3QgdmlydGlv
X21lbSAqdm07Cj4gLQlpbnQgcmMgPSAtRUlOVkFMOwo+ICsJaW50IHJjOwo+ICAgCj4gICAJQlVJ
TERfQlVHX09OKHNpemVvZihzdHJ1Y3QgdmlydGlvX21lbV9yZXEpICE9IDI0KTsKPiAgIAlCVUlM
RF9CVUdfT04oc2l6ZW9mKHN0cnVjdCB2aXJ0aW9fbWVtX3Jlc3ApICE9IDEwKTsKCgpBY2tlZC1i
eTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QK
VmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5s
aW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
