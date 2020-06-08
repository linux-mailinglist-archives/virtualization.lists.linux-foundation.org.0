Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C02091F11BA
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 05:32:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D5319204AD;
	Mon,  8 Jun 2020 03:32:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lD-rMOSAfCLe; Mon,  8 Jun 2020 03:32:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DA92F2047E;
	Mon,  8 Jun 2020 03:32:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 963A4C016F;
	Mon,  8 Jun 2020 03:32:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D4293C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 03:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BAD4D8511F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 03:32:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gkFzIgWv7_Fm
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 03:32:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B096E85092
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 03:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591587171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QTHYGJT484CysjTvnzyVCM1DqyJ9Sy2/Nw9/zbDo/eE=;
 b=a7QmUOMuysUVdak9lsmJeGzrtQIWtTqOJyiOVzhN1TognrWAuPIBqWZr4/9HGQBpTh1poQ
 XFoUPUQvC6jOkstaO8cx24isPtmi6FBrlrZ8onFb8xoWFHCWw3XtAXhJXlknvwv6YgRF5W
 BMzccmV8IDPseEcckS9OXLEmPN9TIQA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-gw20i6ilPV-_ApCgzBqQgw-1; Sun, 07 Jun 2020 23:32:49 -0400
X-MC-Unique: gw20i6ilPV-_ApCgzBqQgw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23B8E100CCC0;
 Mon,  8 Jun 2020 03:32:47 +0000 (UTC)
Received: from [10.72.13.71] (ovpn-13-71.pek2.redhat.com [10.72.13.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8F111A933;
 Mon,  8 Jun 2020 03:32:37 +0000 (UTC)
Subject: Re: [PATCH 5/6] vdpa: introduce virtio pci driver
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200529080303.15449-1-jasowang@redhat.com>
 <20200529080303.15449-6-jasowang@redhat.com>
 <20200602010332-mutt-send-email-mst@kernel.org>
 <5dbb0386-beeb-5bf4-d12e-fb5427486bb8@redhat.com>
 <6b1d1ef3-d65e-08c2-5b65-32969bb5ecbc@redhat.com>
 <20200607095012-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <9b1abd2b-232c-aa0f-d8bb-03e65fd47de2@redhat.com>
Date: Mon, 8 Jun 2020 11:32:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200607095012-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjAvNi83IOS4i+WNiDk6NTEsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBG
cmksIEp1biAwNSwgMjAyMCBhdCAwNDo1NDoxN1BNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
PiBPbiAyMDIwLzYvMiDkuIvljYgzOjA4LCBKYXNvbiBXYW5nIHdyb3RlOgo+Pj4+PiArc3RhdGlj
IGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkIHZwX3ZkcGFfaWRfdGFibGVbXSA9IHsKPj4+Pj4g
K8KgwqDCoCB7IFBDSV9ERVZJQ0UoUENJX1ZFTkRPUl9JRF9SRURIQVRfUVVNUkFORVQsIFBDSV9B
TllfSUQpIH0sCj4+Pj4+ICvCoMKgwqAgeyAwIH0KPj4+Pj4gK307Cj4+Pj4gVGhpcyBsb29rcyBs
aWtlIGl0J2xsIGNyZWF0ZSBhIG1lc3Mgd2l0aCBlaXRoZXIgdmlydGlvIHBjaQo+Pj4+IG9yIHZk
cGEgYmVpbmcgbG9hZGVkIGF0IHJhbmRvbS4gTWF5YmUganVzdCBkb24ndCBzcGVjaWZ5Cj4+Pj4g
YW55IElEcyBmb3Igbm93LiBEb3duIHRoZSByb2FkIHdlIGNvdWxkIGdldCBhCj4+Pj4gZGlzdGlu
Y3QgdmVuZG9yIElEIG9yIGEgcmFuZ2Ugb2YgZGV2aWNlIElEcyBmb3IgdGhpcy4KPj4+Cj4+PiBS
aWdodCwgd2lsbCBkby4KPj4+Cj4+PiBUaGFua3MKPj4KPj4gUmV0aGluayBhYm91dCB0aGlzLiBJ
ZiB3ZSBkb24ndCBzcGVjaWZ5IGFueSBJRCwgdGhlIGJpbmRpbmcgd29uJ3Qgd29yay4KPiBXZSBj
YW4gYmluZCBtYW51YWxseS4gSXQncyBub3QgcmVhbGx5IGZvciBwcm9kdWN0aW9uIGFueXdheSwg
c28KPiBub3QgYSBiaWcgZGVhbCBpbWhvLgoKCkkgdGhpbmsgeW91IG1lYW4gZG9pbmcgaXQgdmlh
ICJuZXdfaWQiLCByaWdodC4KCgo+Cj4+IEhvdyBhYm91dCB1c2luZyBhIGRlZGljYXRlZCBzdWJz
eXN0ZW0gdmVuZG9yIGlkIGZvciB0aGlzPwo+Pgo+PiBUaGFua3MKPiBJZiB2aXJ0aW8gdmVuZG9y
IGlkIGlzIHVzZWQgdGhlbiBzdGFuZGFyZCBkcml2ZXIgaXMgZXhwZWN0ZWQKPiB0byBiaW5kLCBy
aWdodD8gTWF5YmUgdXNlIGEgZGVkaWNhdGVkIHZlbmRvciBpZD8KCgpJIG1lYW50IHNvbWV0aGlu
ZyBsaWtlOgoKc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkIHZwX3ZkcGFfaWRfdGFi
bGVbXSA9IHsKIMKgwqDCoCB7IFBDSV9ERVZJQ0VfU1VCKFBDSV9WRU5ET1JfSURfUkVESEFUX1FV
TVJBTkVULCBQQ0lfQU5ZX0lELCAKVlBfVEVTVF9WRU5ET1JfSUQsIFZQX1RFU1RfREVWSUNFX0lE
KSB9LAogwqDCoMKgIHsgMCB9Cn07CgpUaGFua3MKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVh
bGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
