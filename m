Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE2C21CDD4
	for <lists.virtualization@lfdr.de>; Mon, 13 Jul 2020 05:37:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 673352313B;
	Mon, 13 Jul 2020 03:37:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2BdohjQEsJuh; Mon, 13 Jul 2020 03:37:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id AB315204B9;
	Mon, 13 Jul 2020 03:37:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7CD9BC0733;
	Mon, 13 Jul 2020 03:37:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 731C0C0733
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 03:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 622F987200
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 03:37:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Q4wgeDwbtTM
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 03:37:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A8E91871FB
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 03:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594611424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TuBsngu+9JfDAXP7hTevqic2CkVZxKms9S+GM/5BLQ8=;
 b=EMbWe6POIroP5yktEgnzg9HLYyVvpkuiWF96seKBms6+U3vQtfPpGPTSJD1AI2OpIQNgzR
 mVquLE3TDKU82bU3aWM/8++yTmU2ouf/2MWPiuCUmznLaYUk41yr7gOBvc3n8yAO5wXwQj
 h8EAZjQxvq0ZPYBjM5c/gloRyIo88Eo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-x-1Wj2mAP0Op74d-jbzjgg-1; Sun, 12 Jul 2020 23:37:02 -0400
X-MC-Unique: x-1Wj2mAP0Op74d-jbzjgg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB29C1800D42;
 Mon, 13 Jul 2020 03:37:00 +0000 (UTC)
Received: from [10.72.13.177] (ovpn-13-177.pek2.redhat.com [10.72.13.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5105560BE2;
 Mon, 13 Jul 2020 03:36:53 +0000 (UTC)
Subject: Re: [PATCH] virtio_balloon: clear modern features under legacy
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20200710113046.421366-1-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c0863b67-bd97-63a8-ff11-4f1b0fb655a3@redhat.com>
Date: Mon, 13 Jul 2020 11:36:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200710113046.421366-1-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: virtualization@lists.linux-foundation.org,
 Alexander Duyck <alexander.duyck@gmail.com>, stable@vger.kernel.org
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

Ck9uIDIwMjAvNy8xMCDkuIvljYg3OjMxLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gUGFn
ZSByZXBvcnRpbmcgZmVhdHVyZXMgd2VyZSBuZXZlciBzdXBwb3J0ZWQgYnkgbGVnYWN5IGh5cGVy
dmlzb3JzLgo+IFN1cHBvcnRpbmcgdGhlbSBwb3NlcyBhIHByb2JsZW06IHNob3VsZCB3ZSB1c2Ug
bmF0aXZlIGVuZGlhbi1uZXNzIChsaWtlCj4gY3VycmVudCBjb2RlIGFzc3VtZXMpPyBPciBsaXR0
bGUgZW5kaWFuLW5lc3MgbGlrZSB0aGUgdmlydGlvIHNwZWMgc2F5cz8KPiBSYXRoZXIgdGhhbiB0
cnkgdG8gZmlndXJlIG91dCwgYW5kIHNpbmNlIHJlc3VsdHMgb2YKPiBpbmNvcnJlY3QgZW5kaWFu
LW5lc3MgYXJlIGRpcmUsIGxldCdzIGp1c3QgYmxvY2sgdGhpcyBjb25maWd1cmF0aW9uLgo+Cj4g
Q2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFMuIFRz
aXJraW4gPG1zdEByZWRoYXQuY29tPgo+IC0tLQo+ICAgZHJpdmVycy92aXJ0aW8vdmlydGlvX2Jh
bGxvb24uYyB8IDkgKysrKysrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCsp
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aXJ0aW8vdmlydGlvX2JhbGxvb24uYyBiL2RyaXZl
cnMvdmlydGlvL3ZpcnRpb19iYWxsb29uLmMKPiBpbmRleCA1ZDRiODkxYmY4NGYuLmI5YmMwMzM0
NTE1NyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fYmFsbG9vbi5jCj4gKysr
IGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX2JhbGxvb24uYwo+IEBAIC0xMTA3LDYgKzExMDcsMTUg
QEAgc3RhdGljIGludCB2aXJ0YmFsbG9vbl9yZXN0b3JlKHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2
ZGV2KQo+ICAgCj4gICBzdGF0aWMgaW50IHZpcnRiYWxsb29uX3ZhbGlkYXRlKHN0cnVjdCB2aXJ0
aW9fZGV2aWNlICp2ZGV2KQo+ICAgewo+ICsJLyoKPiArCSAqIExlZ2FjeSBkZXZpY2VzIG5ldmVy
IHNwZWNpZmllZCBob3cgbW9kZXJuIGZlYXR1cmVzIHNob3VsZCBiZWhhdmUuCj4gKwkgKiBFLmcu
IHdoaWNoIGVuZGlhbi1uZXNzIHRvIHVzZT8gQmV0dGVyIG5vdCB0byBhc3N1bWUgYW55dGhpbmcu
Cj4gKwkgKi8KPiArCWlmICghdmlydGlvX2hhc19mZWF0dXJlKHZkZXYsIFZJUlRJT19GX1ZFUlNJ
T05fMSkpIHsKPiArCQlfX3ZpcnRpb19jbGVhcl9iaXQodmRldiwgVklSVElPX0JBTExPT05fRl9G
UkVFX1BBR0VfSElOVCk7Cj4gKwkJX192aXJ0aW9fY2xlYXJfYml0KHZkZXYsIFZJUlRJT19CQUxM
T09OX0ZfUEFHRV9QT0lTT04pOwo+ICsJCV9fdmlydGlvX2NsZWFyX2JpdCh2ZGV2LCBWSVJUSU9f
QkFMTE9PTl9GX1JFUE9SVElORyk7Cj4gKwl9Cj4gICAJLyoKPiAgIAkgKiBJbmZvcm0gdGhlIGh5
cGVydmlzb3IgdGhhdCBvdXIgcGFnZXMgYXJlIHBvaXNvbmVkIG9yCj4gICAJICogaW5pdGlhbGl6
ZWQuIElmIHdlIGNhbm5vdCBkbyB0aGF0IHRoZW4gd2Ugc2hvdWxkIGRpc2FibGUKCgpBY2tlZC1i
eTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QK
VmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5s
aW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
