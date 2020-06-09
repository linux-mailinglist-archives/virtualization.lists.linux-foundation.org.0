Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D34F1F33B2
	for <lists.virtualization@lfdr.de>; Tue,  9 Jun 2020 07:56:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 58D938722F;
	Tue,  9 Jun 2020 05:56:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RoutpYyOwCsu; Tue,  9 Jun 2020 05:56:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CD7AD869E4;
	Tue,  9 Jun 2020 05:56:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BBB27C016F;
	Tue,  9 Jun 2020 05:56:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4EEF4C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Jun 2020 05:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3DB4C8698F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Jun 2020 05:56:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aLuHmw8MTQYz
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Jun 2020 05:56:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 735A8868C8
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Jun 2020 05:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591682205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VMPdQG03WTh1A9nxuWQDwAq/IcZQ1gIyc3Bod/f+MHs=;
 b=DvK+cQ70zbI+QrLVbe61JTrKG80RYZFAaHCWV16vdkt/rORHrpoPoPA+KkOCc/d3/O09TH
 tw4YCKGZEwGhjhe7iFWzF/FzYPgVz29qeAexusaasoZDS8MGdVAzjoBxF55jUYdON6ZCv1
 Je4uUiKFofsNG8mwMVaxC8NRu/ORvKE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-L_KUJZZbOdmRFowIgXr-4A-1; Tue, 09 Jun 2020 01:56:41 -0400
X-MC-Unique: L_KUJZZbOdmRFowIgXr-4A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B720819200C0;
 Tue,  9 Jun 2020 05:56:39 +0000 (UTC)
Received: from [10.72.12.252] (ovpn-12-252.pek2.redhat.com [10.72.12.252])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4C9C60BF3;
 Tue,  9 Jun 2020 05:56:31 +0000 (UTC)
Subject: Re: [PATCH] vhost/test: fix up after API change
From: Jason Wang <jasowang@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20200608124254.727184-1-mst@redhat.com>
 <e747a953-3135-fef9-b098-fca11755d6e4@redhat.com>
Message-ID: <8ca24e37-d319-fbf7-0114-ddf7eb110781@redhat.com>
Date: Tue, 9 Jun 2020 13:56:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <e747a953-3135-fef9-b098-fca11755d6e4@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: netdev@vger.kernel.org, Zhu Lingshan <lingshan.zhu@intel.com>,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjAvNi85IOS4i+WNiDE6NTMsIEphc29uIFdhbmcgd3JvdGU6Cj4KPiBPbiAyMDIwLzYv
OCDkuIvljYg4OjQyLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+IFBhc3MgYSBmbGFnIHRv
IHJlcXVlc3Qga2VybmVsIHRocmVhZCB1c2UuCj4+Cj4+IEZpeGVzOiAwMWZjYjFjYmM4OGUgKCJ2
aG9zdDogYWxsb3cgZGV2aWNlIHRoYXQgZG9lcyBub3QgZGVwZW5kIG9uIAo+PiB2aG9zdCB3b3Jr
ZXIiKQo+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29t
Pgo+PiAtLS0KPj4gwqAgZHJpdmVycy92aG9zdC90ZXN0LmMgfCAyICstCj4+IMKgIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy92aG9zdC90ZXN0LmMgYi9kcml2ZXJzL3Zob3N0L3Rlc3QuYwo+PiBpbmRleCBmNTVj
YjU4NGI4NGEuLjEyMzA0ZWI4ZGExNSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy92aG9zdC90ZXN0
LmMKPj4gKysrIGIvZHJpdmVycy92aG9zdC90ZXN0LmMKPj4gQEAgLTEyMiw3ICsxMjIsNyBAQCBz
dGF0aWMgaW50IHZob3N0X3Rlc3Rfb3BlbihzdHJ1Y3QgaW5vZGUgKmlub2RlLCAKPj4gc3RydWN0
IGZpbGUgKmYpCj4+IMKgwqDCoMKgwqAgdnFzW1ZIT1NUX1RFU1RfVlFdID0gJm4tPnZxc1tWSE9T
VF9URVNUX1ZRXTsKPj4gwqDCoMKgwqDCoCBuLT52cXNbVkhPU1RfVEVTVF9WUV0uaGFuZGxlX2tp
Y2sgPSBoYW5kbGVfdnFfa2ljazsKPj4gwqDCoMKgwqDCoCB2aG9zdF9kZXZfaW5pdChkZXYsIHZx
cywgVkhPU1RfVEVTVF9WUV9NQVgsIFVJT19NQVhJT1YgKyA2NCwKPj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgVkhPU1RfVEVTVF9QS1RfV0VJR0hULCBWSE9TVF9URVNUX1dFSUdIVCwg
TlVMTCk7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFZIT1NUX1RFU1RfUEtUX1dF
SUdIVCwgVkhPU1RfVEVTVF9XRUlHSFQsIHRydWUsIE5VTEwpOwo+PiDCoCDCoMKgwqDCoMKgIGYt
PnByaXZhdGVfZGF0YSA9IG47Cj4KPgo+IEFja2VkLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
ZWRoYXQuY29tPgo+Cj4gSnVzdCB0byBjb25maXJtLCBoYXZlIHlvdSBxdWV1ZWQgdGhlIGRvb3Ji
ZWxsIG1hcHBpbmcgcGF0Y2hlcyBhbHJlYWR5PyAKPiBPciB5b3UgZXhwZWN0IEkgc3F1YXNoIHRo
aXMgaW50byB2MiBvZiBkb29yYmVsbCBtYXBwaW5nIHNlcmllcz8KCgpPaywgSSBzYXcgdGhlIHBh
dGNoZXMgaW4geW91ciBsaW51eC1uZXh0IGJyYW5jaC4KClRoYW5rcwoKCj4KPiBUaGFua3MKPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6
YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24u
b3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3Zp
cnR1YWxpemF0aW9u
