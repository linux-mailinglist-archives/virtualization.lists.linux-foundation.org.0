Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0BB1EB619
	for <lists.virtualization@lfdr.de>; Tue,  2 Jun 2020 09:04:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 936D7221F0;
	Tue,  2 Jun 2020 07:04:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cF8Od6cz7SxJ; Tue,  2 Jun 2020 07:04:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5215D21549;
	Tue,  2 Jun 2020 07:04:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3A08AC016E;
	Tue,  2 Jun 2020 07:04:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D542C016E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 07:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 12DD9875CD
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 07:04:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zkdktgUHnY3E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 07:04:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B3EC4865D6
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 07:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591081491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7/iZrp8ajGOLBLXyeyKCmBTwZzJz+NsPsDgLUvIijOo=;
 b=am7oN9DAkR3ACdhhBlaCcntG+ZGFSz+XotTYe+H2gU8twOm5A6trAbmNOKXy5oXxKziOzQ
 r+ReA+MprbfqwUjIlu9sn5X4JWjAYP5fEJFpvRr0z4RJ0PiUUG9AQ5A2ltlIguIG/f1s/+
 do8ldGGMQRwfWUEuDNSoSuqtOVbCTJ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-g0qtxZAyOOqho9Wf4GolhQ-1; Tue, 02 Jun 2020 03:04:49 -0400
X-MC-Unique: g0qtxZAyOOqho9Wf4GolhQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACEC3464;
 Tue,  2 Jun 2020 07:04:47 +0000 (UTC)
Received: from [10.72.12.102] (ovpn-12-102.pek2.redhat.com [10.72.12.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F07E5C1D6;
 Tue,  2 Jun 2020 07:04:19 +0000 (UTC)
Subject: Re: [PATCH 1/6] vhost: allow device that does not depend on vhost
 worker
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200529080303.15449-1-jasowang@redhat.com>
 <20200529080303.15449-2-jasowang@redhat.com>
 <20200602005904-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <21e1bfbf-4b0c-5a73-6fdd-a58c43c733ea@redhat.com>
Date: Tue, 2 Jun 2020 15:04:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200602005904-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

Ck9uIDIwMjAvNi8yIOS4i+WNiDE6MDEsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBG
cmksIE1heSAyOSwgMjAyMCBhdCAwNDowMjo1OFBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC92aG9zdC5jIGIvZHJpdmVycy92aG9zdC92aG9z
dC5jCj4+IGluZGV4IGQ0NTBlMTZjNWMyNS4uNzAxMDVlMDQ1NzY4IDEwMDY0NAo+PiAtLS0gYS9k
cml2ZXJzL3Zob3N0L3Zob3N0LmMKPj4gKysrIGIvZHJpdmVycy92aG9zdC92aG9zdC5jCj4+IEBA
IC0xNjYsMTEgKzE2NiwxNiBAQCBzdGF0aWMgaW50IHZob3N0X3BvbGxfd2FrZXVwKHdhaXRfcXVl
dWVfZW50cnlfdCAqd2FpdCwgdW5zaWduZWQgbW9kZSwgaW50IHN5bmMsCj4+ICAgCQkJICAgICB2
b2lkICprZXkpCj4+ICAgewo+PiAgIAlzdHJ1Y3Qgdmhvc3RfcG9sbCAqcG9sbCA9IGNvbnRhaW5l
cl9vZih3YWl0LCBzdHJ1Y3Qgdmhvc3RfcG9sbCwgd2FpdCk7Cj4+ICsJc3RydWN0IHZob3N0X3dv
cmsgKndvcmsgPSAmcG9sbC0+d29yazsKPj4gICAKPj4gICAJaWYgKCEoa2V5X3RvX3BvbGwoa2V5
KSAmIHBvbGwtPm1hc2spKQo+PiAgIAkJcmV0dXJuIDA7Cj4+ICAgCj4+IC0Jdmhvc3RfcG9sbF9x
dWV1ZShwb2xsKTsKPj4gKwlpZiAoIXBvbGwtPmRldi0+dXNlX3dvcmtlcikKPj4gKwkJd29yay0+
Zm4od29yayk7Cj4+ICsJZWxzZQo+PiArCQl2aG9zdF9wb2xsX3F1ZXVlKHBvbGwpOwo+PiArCj4+
ICAgCXJldHVybiAwOwo+PiAgIH0KPj4KPiBTbyBhIHdha2V1cCBmdW5jdGlvbiB3YWtlcyB1cCBl
dmVudGZkIGRpcmVjdGx5Lgo+Cj4gV2hhdCBpZiB1c2VyIHN1cHBsaWVzIGUuZy4gdGhlIHNhbWUg
ZXZlbnRmZCBhcyBpb2V2ZW50ZmQ/Cj4KPiBXb24ndCB0aGlzIGNhdXNlIGluZmluaXRlIGxvb3Bz
PwoKCkknbSBub3Qgc3VyZSBJIGdldCB0aGlzLgoKVGhpcyBiYXNpY2FsbHkgY2FsbHMgaGFuZGxl
X3ZxIGRpcmVjdGx5IHdoZW4gZXZlbnRmZCBpcyB3b2tlbiB1cC4gVGhlIAppbmZpbml0ZSBsb29w
cyBjYW4gb25seSBoYXBwZW4gd2hlbiBoYW5kbGVfdnEoKSB0cmllcyB0byB3cml0ZSB0byAKaW9l
dmVudGZkIGl0c2xlZiB3aGljaCBzaG91bGQgYmUgYSBidWcgb2YgdGhlIGRldmljZS4KClRoYW5r
cwoKCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZp
cnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3Vu
ZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0
aW5mby92aXJ0dWFsaXphdGlvbg==
