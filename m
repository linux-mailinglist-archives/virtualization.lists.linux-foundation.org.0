Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D39A35BAB1
	for <lists.virtualization@lfdr.de>; Mon, 12 Apr 2021 09:16:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7F8860653;
	Mon, 12 Apr 2021 07:16:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hiLxlN5q_5XG; Mon, 12 Apr 2021 07:16:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6771608D1;
	Mon, 12 Apr 2021 07:16:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46DB9C000A;
	Mon, 12 Apr 2021 07:16:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 824EEC000A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 07:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57CFE401B6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 07:16:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QoiT5EukpliM
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 07:16:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5EF97401AD
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 07:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618211786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+6nhImlR+qM3GuM+TRySf0myMMv0WJfLOSpNifcSyi0=;
 b=U80xVAmBy8GdBZ+Gi7kaK3tZMrBqw4JdhMzmmLr0SDzQDgDkrjpaMk29s3PiPSDj+DXAGq
 OepkL/ioc3oMreNmicqVUgiU1sh808wEy+eAsVdVDd7AFqco1d75I56gKGZtMhyJbj7T9F
 +GEPZS9nDnSrH5kjqdI+DcSpePRykTU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-NEo5XLLuME-EhrKf6vyxYQ-1; Mon, 12 Apr 2021 03:16:23 -0400
X-MC-Unique: NEo5XLLuME-EhrKf6vyxYQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C679802B4F;
 Mon, 12 Apr 2021 07:16:21 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-232.pek2.redhat.com
 [10.72.13.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66F2E13488;
 Mon, 12 Apr 2021 07:16:15 +0000 (UTC)
Subject: Re: [PATCH v6 09/10] vduse: Introduce VDUSE - vDPA Device in Userspace
To: Yongji Xie <xieyongji@bytedance.com>
References: <20210331080519.172-1-xieyongji@bytedance.com>
 <20210331080519.172-10-xieyongji@bytedance.com>
 <c817178a-2ac8-bf93-1ed3-528579c657a3@redhat.com>
 <CACycT3v_KFQXoxRbEj8c0Ve6iKn9RbibtBDgBFs=rf0ZOmTBBQ@mail.gmail.com>
 <091dde74-449b-385c-0ec9-11e4847c6c4c@redhat.com>
 <CACycT3vwATp4+Ao0fjuyeeLQN+xHH=dXF+JUyuitkn4k8hELnA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <dc9a90dd-4f86-988c-c1b5-ac606ce5e14b@redhat.com>
Date: Mon, 12 Apr 2021 15:16:13 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <CACycT3vwATp4+Ao0fjuyeeLQN+xHH=dXF+JUyuitkn4k8hELnA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: Jens Axboe <axboe@kernel.dk>, Jonathan Corbet <corbet@lwn.net>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Matthew Wilcox <willy@infradead.org>,
 virtualization@lists.linux-foundation.org,
 Christoph Hellwig <hch@infradead.org>,
 Christian Brauner <christian.brauner@canonical.com>, bcrl@kvack.org,
 viro@zeniv.linux.org.uk, Stefan Hajnoczi <stefanha@redhat.com>,
 linux-fsdevel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>,
 =?UTF-8?Q?Mika_Penttil=c3=a4?= <mika.penttila@nextfour.com>
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

CuWcqCAyMDIxLzQvOSDkuIvljYg0OjAyLCBZb25namkgWGllIOWGmemBkzoKPj4+Pj4gK307Cj4+
Pj4+ICsKPj4+Pj4gK3N0cnVjdCB2ZHVzZV9kZXZfY29uZmlnX2RhdGEgewo+Pj4+PiArICAgICBf
X3UzMiBvZmZzZXQ7IC8qIG9mZnNldCBmcm9tIHRoZSBiZWdpbm5pbmcgb2YgY29uZmlnIHNwYWNl
ICovCj4+Pj4+ICsgICAgIF9fdTMyIGxlbjsgLyogdGhlIGxlbmd0aCB0byByZWFkL3dyaXRlICov
Cj4+Pj4+ICsgICAgIF9fdTggZGF0YVtWRFVTRV9DT05GSUdfREFUQV9MRU5dOyAvKiBkYXRhIGJ1
ZmZlciB1c2VkIHRvIHJlYWQvd3JpdGUgKi8KPj4+PiBOb3RlIHRoYXQgc2luY2UgVkRVU0VfQ09O
RklHX0RBVEFfTEVOIGlzIHBhcnQgb2YgdUFQSSBpdCBtZWFucyB3ZSBjYW4KPj4+PiBub3QgY2hh
bmdlIGl0IGluIHRoZSBmdXR1cmUuCj4+Pj4KPj4+PiBTbyB0aGlzIG1pZ2h0IHN1ZmZjaWVudCBm
b3IgZnV0dXJlIGZlYXR1cmVzIG9yIGFsbCB0eXBlIG9mIHZpcnRpbyBkZXZpY2VzLgo+Pj4+Cj4+
PiBEbyB5b3UgbWVhbiAyNTYgaXMgbm8gZW5vdWdoIGhlcmXvvJ8KPj4gWWVzLgo+Pgo+IEJ1dCB0
aGlzIHJlcXVlc3Qgd2lsbCBiZSBzdWJtaXR0ZWQgbXVsdGlwbGUgdGltZXMgaWYgY29uZmlnIGxl
bmdoIGlzCj4gbGFyZ2VyIHRoYW4gMjU2LiBTbyBkbyB5b3UgdGhpbmsgd2hldGhlciB3ZSBuZWVk
IHRvIGV4dGVudCB0aGUgc2l6ZSB0bwo+IDUxMiBvciBsYXJnZXI/CgoKU28gSSB0aGluayB5b3Un
ZCBiZXR0ZXIgZWl0aGVyOgoKMSkgZG9jdW1lbnQgdGhlIGxpbWl0YXRpb24gKDI1NikgaW4gc29t
ZXdoZXJlLCAoYmV0dGVyIGJvdGggdWFwaSBhbmQgZG9jKQoKb3IKCjIpIG1ha2UgaXQgdmFyaWFi
bGUKClRoYW5rcwoKCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5s
aW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFp
bG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
