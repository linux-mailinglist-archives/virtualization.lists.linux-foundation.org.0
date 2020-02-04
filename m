Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CA00715170D
	for <lists.virtualization@lfdr.de>; Tue,  4 Feb 2020 09:28:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7F7B62050E;
	Tue,  4 Feb 2020 08:28:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NbHzRbo8CH1v; Tue,  4 Feb 2020 08:28:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6A8B720022;
	Tue,  4 Feb 2020 08:28:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5D552C0174;
	Tue,  4 Feb 2020 08:28:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 944FFC0174
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 08:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 86C6620104
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 08:28:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cZev4PsR7wlX
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 08:28:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id B7F1920022
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 08:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580804930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JipmoOe2nr0hGxD7C+f101bb7FTOHzYyEwpTEYgv7tg=;
 b=fcqkr51i4XIx1miBuekqjS7AzBreBOE17Z77lH4I447ZVrALMhWuJCSZQ5m2dH+dZ8m/zd
 kqWBHzIjzPUUhw94RinUWbgv0cp8DwLCS9/4widvBxm+g2+DA+IHo4qTdz0KHvhpA4W3Zi
 pFgG0KTIXgg4dZ6ehlPHl+S9uHcfZQ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-Dqa5HkEuOly10_ZneL--TQ-1; Tue, 04 Feb 2020 03:28:48 -0500
X-MC-Unique: Dqa5HkEuOly10_ZneL--TQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBA80800D54;
 Tue,  4 Feb 2020 08:28:45 +0000 (UTC)
Received: from [10.72.12.170] (ovpn-12-170.pek2.redhat.com [10.72.12.170])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B4F290F49;
 Tue,  4 Feb 2020 08:28:28 +0000 (UTC)
Subject: Re: [PATCH 5/5] vdpasim: vDPA device simulator
To: Zhu Lingshan <lingshan.zhu@linux.intel.com>, mst@redhat.com,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
References: <20200116124231.20253-1-jasowang@redhat.com>
 <20200116124231.20253-6-jasowang@redhat.com>
 <1b86d188-0666-f6ab-e3b3-bec1cfbd0c76@linux.intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <cca7901b-51dd-4f4b-5c30-c42577ad5194@redhat.com>
Date: Tue, 4 Feb 2020 16:28:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1b86d188-0666-f6ab-e3b3-bec1cfbd0c76@linux.intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: jakub.kicinski@netronome.com, mhabets@solarflare.com, jgg@mellanox.com,
 rob.miller@broadcom.com, lulu@redhat.com, hanand@xilinx.com, hch@infradead.org,
 eperezma@redhat.com, haotian.wang@sifive.com, shahafs@mellanox.com,
 parav@mellanox.com, jiri@mellanox.com, xiao.w.wang@intel.com,
 stefanha@redhat.com, zhihong.wang@intel.com, rdunlap@infradead.org,
 maxime.coquelin@redhat.com, lingshan.zhu@intel.com
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

Ck9uIDIwMjAvMi80IOS4i+WNiDQ6MjEsIFpodSBMaW5nc2hhbiB3cm90ZToKPj4gK3N0YXRpYyBj
b25zdCBzdHJ1Y3QgZG1hX21hcF9vcHMgdmRwYXNpbV9kbWFfb3BzID0gewo+PiArwqDCoMKgIC5t
YXBfcGFnZSA9IHZkcGFzaW1fbWFwX3BhZ2UsCj4+ICvCoMKgwqAgLnVubWFwX3BhZ2UgPSB2ZHBh
c2ltX3VubWFwX3BhZ2UsCj4+ICvCoMKgwqAgLmFsbG9jID0gdmRwYXNpbV9hbGxvY19jb2hlcmVu
dCwKPj4gK8KgwqDCoCAuZnJlZSA9IHZkcGFzaW1fZnJlZV9jb2hlcmVudCwKPj4gK307Cj4+ICsK
Pgo+IEhleSBKYXNvbiwKPgo+IElNSE8sIGl0IHdvdWxkIGJlIG5pY2UgaWYgZG1hX29wcyBvZiB0
aGUgcGFyZW50IGRldmljZSBjb3VsZCBiZSAKPiByZS11c2VkLiB2ZHBhX2RldmljZSBpcyBleHBl
Y3RpbmcgdG8gcmVwcmVzZW50IGEgcGh5c2ljYWwgZGV2aWNlIAo+IGV4Y2VwdCB0aGlzIHNpbXVs
YXRvciwgaG93ZXZlciwgdGhlcmUgYXJlIG5vdCBlbm91Z2ggaW5mb3JtYXRpb24gaW4gCj4gdmRw
YV9kZXZpY2UuZGV2IHRvIGluZGljYXRpbmcgd2hpY2gga2luZCBwaHlzaWNhbCBkZXZpY2UgaXQg
YXR0YWNoZWQgCj4gdG8uIE5hbWVseSBnZXRfYXJjaF9kbWFfb3BzKHN0cnVjdCBidXMgdHlwZSkg
Y2FuIG5vdCB3b3JrIG9uIAo+IHZkcGFfZGV2aWNlLmRldi4gVGhlbiBpdCBzZWVtcyBkZXZpY2Ug
ZHJpdmVycyBuZWVkIHRvIGltcGxlbWVudCBhIHdyYXAgCj4gb2YgZG1hX29wcyBvZiBwYXJlbnQg
ZGV2aWNlcy4gQ2FuIHRoaXMgd29yayBiZSBkb25lIGluIHRoZSB2ZHBhIAo+IGZyYW1ld29yayBz
aW5jZSBpdCBsb29rcyBsaWtlIGEgY29tbW9uIHRhc2s/IENhbiAKPiAidmRfZGV2LT52ZGV2LmRl
di5wYXJlbnQgPSB2ZHBhLT5kZXYtPnBhcmVudDsiIGluIHZpcnRpb192ZHBhX3Byb2JlKCkgCj4g
ZG8gdGhlIHdvcms/Cj4KPiBUaGFua3MsCj4gQlIKPiBaaHUgTGluZ3NoYW4gCgoKR29vZCBjYXRj
aC4KCkkgdGhpbmsgd2UgY2FuLgoKVGhhbmtzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6
YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5k
YXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
