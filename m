Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1696916F602
	for <lists.virtualization@lfdr.de>; Wed, 26 Feb 2020 04:14:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EE3E286A9D;
	Wed, 26 Feb 2020 03:14:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uZx370F2NUeR; Wed, 26 Feb 2020 03:14:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 758A2868BF;
	Wed, 26 Feb 2020 03:14:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4BC0AC0177;
	Wed, 26 Feb 2020 03:14:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E8387C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Feb 2020 03:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D598986269
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Feb 2020 03:14:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LBGlzYSGzRmA
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Feb 2020 03:14:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E286F81DE3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Feb 2020 03:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582686856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zPO9Q4VBlPr6ggd2qAuWkleMNlATunLXOSzyCdyykww=;
 b=H5aznvu46t8bRVjhT7Hw3bTIYopefPdiwIuQR2OCq8YClu4cZE4WZ2iOP+OzPLXLLqVAYd
 iz6W+2eBQHmDB8By880Jrgz8LjwUgRVfVZTnluXKdSV9EsznznZw+NFNLcbXwBTZMOS5Mc
 +qTaNCAs2wefyRD9RN6ccJIPr6F2n1E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-DyPfyrCDO6K9EjXf8mESqA-1; Tue, 25 Feb 2020 22:14:14 -0500
X-MC-Unique: DyPfyrCDO6K9EjXf8mESqA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11C7E1034B20;
 Wed, 26 Feb 2020 03:14:13 +0000 (UTC)
Received: from [10.72.13.217] (ovpn-13-217.pek2.redhat.com [10.72.13.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC1435C13D;
 Wed, 26 Feb 2020 03:14:00 +0000 (UTC)
Subject: Re: [PATCH] virtio_ring: Fix mem leak with vring_new_virtqueue()
To: Suman Anna <s-anna@ti.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20200224212643.30672-1-s-anna@ti.com>
 <b622c831-9adb-b9af-dd4a-21605bc124a8@redhat.com>
 <0ace3a3b-cf2f-7977-5337-f74f530afbe1@ti.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <1ce2bee4-64ed-f630-2695-8e8b9b8e27c1@redhat.com>
Date: Wed, 26 Feb 2020 11:13:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0ace3a3b-cf2f-7977-5337-f74f530afbe1@ti.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjAvMi8yNiDkuIrljYgxMjo1MSwgU3VtYW4gQW5uYSB3cm90ZToKPiBIaSBKYXNvbiwK
Pgo+IE9uIDIvMjQvMjAgMTE6MzkgUE0sIEphc29uIFdhbmcgd3JvdGU6Cj4+IE9uIDIwMjAvMi8y
NSDkuIrljYg1OjI2LCBTdW1hbiBBbm5hIHdyb3RlOgo+Pj4gVGhlIGZ1bmN0aW9ucyB2cmluZ19u
ZXdfdmlydHF1ZXVlKCkgYW5kIF9fdnJpbmdfbmV3X3ZpcnRxdWV1ZSgpIGFyZSB1c2VkCj4+PiB3
aXRoIHNwbGl0IHJpbmdzLCBhbmQgYW55IGFsbG9jYXRpb25zIHdpdGhpbiB0aGVzZSBmdW5jdGlv
bnMgYXJlIG1hbmFnZWQKPj4+IG91dHNpZGUgb2YgdGhlIC53ZV9vd25fcmluZyBmbGFnLiBUaGUg
Y29tbWl0IGNiZWVkYjcyYjk3YSAoInZpcnRpb19yaW5nOgo+Pj4gYWxsb2NhdGUgZGVzYyBzdGF0
ZSBmb3Igc3BsaXQgcmluZyBzZXBhcmF0ZWx5IikgYWxsb2NhdGVzIHRoZSBkZXNjIHN0YXRlCj4+
PiB3aXRoaW4gdGhlIF9fdnJpbmdfbmV3X3ZpcnRxdWV1ZSgpIGJ1dCBmcmVlcyBpdCBvbmx5IHdo
ZW4gdGhlCj4+PiAud2Vfb3duX3JpbmcKPj4+IGZsYWcgaXMgc2V0LiBUaGlzIGxlYWRzIHRvIGEg
bWVtb3J5IGxlYWsgd2hlbiBmcmVlaW5nIHN1Y2ggYWxsb2NhdGVkCj4+PiB2aXJ0cXVldWVzIHdp
dGggdGhlIHZyaW5nX2RlbF92aXJ0cXVldWUoKSBmdW5jdGlvbi4KPj4+Cj4+PiBGaXggdGhpcyBi
eSBtb3ZpbmcgdGhlIGRlc2Nfc3RhdGUgZnJlZSBjb2RlIG91dHNpZGUgdGhlIGZsYWcgYW5kIG9u
bHkKPj4+IGZvciBzcGxpdCByaW5ncy4gSXNzdWUgd2FzIGRpc2NvdmVyZWQgZHVyaW5nIHRlc3Rp
bmcgd2l0aCByZW1vdGVwcm9jCj4+PiBhbmQgdmlydGlvX3JwbXNnLgo+Pj4KPj4+IEZpeGVzOiBj
YmVlZGI3MmI5N2EgKCJ2aXJ0aW9fcmluZzogYWxsb2NhdGUgZGVzYyBzdGF0ZSBmb3Igc3BsaXQg
cmluZwo+Pj4gc2VwYXJhdGVseSIpCj4+PiBTaWduZWQtb2ZmLWJ5OiBTdW1hbiBBbm5hPHMtYW5u
YUB0aS5jb20+Cj4+PiAtLS0KPj4+ICDCoCBkcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jIHwg
NCArKy0tCj4+PiAgwqAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aXJ0aW8vdmlydGlvX3JpbmcuYyBi
L2RyaXZlcnMvdmlydGlvL3ZpcnRpb19yaW5nLmMKPj4+IGluZGV4IDg2N2M3ZWJkM2YxMC4uNThi
OTZiYWE4ZDQ4IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy92aXJ0aW8vdmlydGlvX3JpbmcuYwo+
Pj4gKysrIGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX3JpbmcuYwo+Pj4gQEAgLTIyMDMsMTAgKzIy
MDMsMTAgQEAgdm9pZCB2cmluZ19kZWxfdmlydHF1ZXVlKHN0cnVjdCB2aXJ0cXVldWUgKl92cSkK
Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2cS0+c3Bs
aXQucXVldWVfc2l6ZV9pbl9ieXRlcywKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB2cS0+c3BsaXQudnJpbmcuZGVzYywKPj4+ICDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2cS0+c3BsaXQucXVldWVfZG1hX2FkZHIp
Owo+Pj4gLQo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAga2ZyZWUodnEtPnNwbGl0LmRlc2Nf
c3RhdGUpOwo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+PiAgwqDCoMKgwqDCoCB9Cj4+PiAr
wqDCoMKgIGlmICghdnEtPnBhY2tlZF9yaW5nKQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGtmcmVlKHZx
LT5zcGxpdC5kZXNjX3N0YXRlKTsKPj4gTml0cGljaywgaXQgbG9va3MgdG8gbWUgaXQgd291bGQg
YmUgbW9yZSBjbGVhciBpZiB3ZSBqdXN0IGZyZWUKPj4gZGVzY19zdGF0ZSB1bmNvbmRpdGlvbmFs
bHkgaGVyZSAoYW5kIHJlbW92ZSB0aGUga2ZyZWUgZm9yIHBhY2tlZCBhYm92ZSkuCj4gT0ssIGFy
ZSB5b3Ugc3VyZSB5b3Ugd2FudCB0aGF0IHRvIGJlIGZvbGRlZCBpbnRvIHRoaXMgcGF0Y2g/IEl0
IGxvb2tzIHRvCj4gbWUgYSBzZXBhcmF0ZSBjbGVhbnVwL2NvbnNvbGlkYXRpb24gcGF0Y2gsIGFu
ZCBwYWNrZWQgZGVzY19zdGF0ZSBkb2VzCj4gbm90IHN1ZmZlciB0aGlzIG1lbWxlYWssIGFuZCBu
ZWVkIG5vdCBiZSBiYWNrcG9ydGVkIGludG8gc3RhYmxlIGtlcm5lbHMuCj4KPiByZWdhcmRzCj4g
U3VtYW4KCgpUaG91Z2ggaXQncyBqdXN0IGEgc21hbGwgdHdlYWssIEknbSBmaW5lIGZvciBsZWF2
aW5nIGl0IGZvciBmdXR1cmUuCgpTbwoKQWNrZWQtYnk6IEphc29uIFdhbmcgPGphc293YW5nQHJl
ZGhhdC5jb20+CgpUaGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0
cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcv
bWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
