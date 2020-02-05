Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C2615252D
	for <lists.virtualization@lfdr.de>; Wed,  5 Feb 2020 04:14:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4908483339;
	Wed,  5 Feb 2020 03:14:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2HW18zCOechz; Wed,  5 Feb 2020 03:14:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6F6A2832C6;
	Wed,  5 Feb 2020 03:14:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3B4DAC0174;
	Wed,  5 Feb 2020 03:14:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ABAA5C0174
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 03:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7AA2320378
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 03:14:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5zoXlDpzXm2F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 03:14:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 8445720006
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 03:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580872469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fkacgs1jrvXkTMH7lk8Z4tp9p1PLEK8Yl3rboqahklw=;
 b=G22icPb5DWFZSEeaM9QNbdRgczVdka1QvP7DzBryyar9KOTTt9naxnAxxkXhz28EJ7RS4Y
 onq4eq+zwpCD5s1Eh2LWpRHa/bcAPMR3cc/Htpsjrl26Ocw2APSugrrSZYsw8muDERh4cl
 zsb7lOeHJED3fNpClUrIsKWf4pN0J40=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-hLQ79f0CMWWDZK02RejDGw-1; Tue, 04 Feb 2020 22:14:27 -0500
X-MC-Unique: hLQ79f0CMWWDZK02RejDGw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDABA1137841;
 Wed,  5 Feb 2020 03:14:24 +0000 (UTC)
Received: from [10.72.13.188] (ovpn-13-188.pek2.redhat.com [10.72.13.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E38BF5D9E2;
 Wed,  5 Feb 2020 03:14:05 +0000 (UTC)
Subject: Re: [PATCH 5/5] vdpasim: vDPA device simulator
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20200116124231.20253-1-jasowang@redhat.com>
 <20200116124231.20253-6-jasowang@redhat.com>
 <1b86d188-0666-f6ab-e3b3-bec1cfbd0c76@linux.intel.com>
 <cca7901b-51dd-4f4b-5c30-c42577ad5194@redhat.com>
 <20200204125204.GS23346@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <920de1cf-a4ee-2d02-a30b-741bfed18ffb@redhat.com>
Date: Wed, 5 Feb 2020 11:14:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200204125204.GS23346@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: jakub.kicinski@netronome.com, kvm@vger.kernel.org, mst@redhat.com,
 mhabets@solarflare.com, virtualization@lists.linux-foundation.org,
 rob.miller@broadcom.com, lulu@redhat.com, hanand@xilinx.com, hch@infradead.org,
 eperezma@redhat.com, haotian.wang@sifive.com, shahafs@mellanox.com,
 parav@mellanox.com, jiri@mellanox.com, xiao.w.wang@intel.com,
 stefanha@redhat.com, zhihong.wang@intel.com, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 Zhu Lingshan <lingshan.zhu@linux.intel.com>, netdev@vger.kernel.org,
 lingshan.zhu@intel.com
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

Ck9uIDIwMjAvMi80IOS4i+WNiDg6NTIsIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiBPbiBUdWUs
IEZlYiAwNCwgMjAyMCBhdCAwNDoyODoyN1BNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+PiBP
biAyMDIwLzIvNCDkuIvljYg0OjIxLCBaaHUgTGluZ3NoYW4gd3JvdGU6Cj4+Pj4gK3N0YXRpYyBj
b25zdCBzdHJ1Y3QgZG1hX21hcF9vcHMgdmRwYXNpbV9kbWFfb3BzID0gewo+Pj4+ICvCoMKgwqAg
Lm1hcF9wYWdlID0gdmRwYXNpbV9tYXBfcGFnZSwKPj4+PiArwqDCoMKgIC51bm1hcF9wYWdlID0g
dmRwYXNpbV91bm1hcF9wYWdlLAo+Pj4+ICvCoMKgwqAgLmFsbG9jID0gdmRwYXNpbV9hbGxvY19j
b2hlcmVudCwKPj4+PiArwqDCoMKgIC5mcmVlID0gdmRwYXNpbV9mcmVlX2NvaGVyZW50LAo+Pj4+
ICt9Owo+Pj4+ICsKPj4+IEhleSBKYXNvbiwKPj4+Cj4+PiBJTUhPLCBpdCB3b3VsZCBiZSBuaWNl
IGlmIGRtYV9vcHMgb2YgdGhlIHBhcmVudCBkZXZpY2UgY291bGQgYmUgcmUtdXNlZC4KPj4+IHZk
cGFfZGV2aWNlIGlzIGV4cGVjdGluZyB0byByZXByZXNlbnQgYSBwaHlzaWNhbCBkZXZpY2UgZXhj
ZXB0IHRoaXMKPj4+IHNpbXVsYXRvciwgaG93ZXZlciwgdGhlcmUgYXJlIG5vdCBlbm91Z2ggaW5m
b3JtYXRpb24gaW4gdmRwYV9kZXZpY2UuZGV2Cj4+PiB0byBpbmRpY2F0aW5nIHdoaWNoIGtpbmQg
cGh5c2ljYWwgZGV2aWNlIGl0IGF0dGFjaGVkIHRvLiBOYW1lbHkKPj4+IGdldF9hcmNoX2RtYV9v
cHMoc3RydWN0IGJ1cyB0eXBlKSBjYW4gbm90IHdvcmsgb24gdmRwYV9kZXZpY2UuZGV2LiBUaGVu
Cj4+PiBpdCBzZWVtcyBkZXZpY2UgZHJpdmVycyBuZWVkIHRvIGltcGxlbWVudCBhIHdyYXAgb2Yg
ZG1hX29wcyBvZiBwYXJlbnQKPj4+IGRldmljZXMuIENhbiB0aGlzIHdvcmsgYmUgZG9uZSBpbiB0
aGUgdmRwYSBmcmFtZXdvcmsgc2luY2UgaXQgbG9va3MgbGlrZQo+Pj4gYSBjb21tb24gdGFzaz8g
Q2FuICJ2ZF9kZXYtPnZkZXYuZGV2LnBhcmVudCA9IHZkcGEtPmRldi0+cGFyZW50OyIgaW4KPj4+
IHZpcnRpb192ZHBhX3Byb2JlKCkgZG8gdGhlIHdvcms/Cj4+Pgo+Pj4gVGhhbmtzLAo+Pj4gQlIK
Pj4+IFpodSBMaW5nc2hhbgo+Pgo+PiBHb29kIGNhdGNoLgo+Pgo+PiBJIHRoaW5rIHdlIGNhbi4K
PiBJTUhPIHlvdSBuZWVkIHRvIHNwZWNpZnkgc29tZSAnZG1hX2RldmljZScsIG5vdCB0cnkgYW5k
IHBsYXkgdHJpY2tzCj4gd2l0aCBkbWFfb3BzLCBvciBhc3N1bWluZyB0aGUgcGFyZW50IGlzIGFs
d2F5cyB0aGUgZGV2aWNlIHVzZWQgZm9yCj4gZG1hLgo+Cj4gSmFzb24KCgpSaWdodCwgdGhpcyBp
cyB3aGF0IGluIG15IG1pbmQgYW5kIGRpc2N1c3NlZCBpbiB0aGUgdmhvc3QtdmRwYSB0aHJlYWQu
CgpXaWxsIGdvIHRoaXMgd2F5LgoKVGhhbmtzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxp
emF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
