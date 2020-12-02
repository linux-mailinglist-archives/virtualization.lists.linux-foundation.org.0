Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 443E32CB681
	for <lists.virtualization@lfdr.de>; Wed,  2 Dec 2020 09:14:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 007A3877A0;
	Wed,  2 Dec 2020 08:14:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YE3uk0lpAWSZ; Wed,  2 Dec 2020 08:14:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8B085877C1;
	Wed,  2 Dec 2020 08:14:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 674AAC0052;
	Wed,  2 Dec 2020 08:14:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7C8BDC0052
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Dec 2020 08:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5A0772E1D6
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Dec 2020 08:14:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q1L4cziKItxn
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Dec 2020 08:14:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by silver.osuosl.org (Postfix) with ESMTPS id A564F2E1D3
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Dec 2020 08:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TSArC6dGGVsRkfFz7XmGCs7/7Y4wrkwjTBmdaGQey7s=;
 b=MiMNAbV8v/T8ML09dEAz49/7TN71g8N5iqcrLli//g1w0KOGPmnz0D0feYUYCIRp94jxCu
 0ETFMp+aG0oMD68d/ypkYLYbPtgmFQYiJMzX52R59mGMimqxRmwuqnbvAYQqag9H61w/pq
 LGXNokBewsfM3bmFKJ+oA3N2u+ClMDg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-aSLoB9UzM86IkAz7KaUL4w-1; Wed, 02 Dec 2020 03:14:02 -0500
X-MC-Unique: aSLoB9UzM86IkAz7KaUL4w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0B9F185E486;
 Wed,  2 Dec 2020 08:14:00 +0000 (UTC)
Received: from [10.72.13.145] (ovpn-13-145.pek2.redhat.com [10.72.13.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 829575D705;
 Wed,  2 Dec 2020 08:13:55 +0000 (UTC)
Subject: Re: [PATCH] vhost_vdpa: return -EFAULT if copy_to_user() fails
To: Dan Carpenter <dan.carpenter@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <X8c32z5EtDsMyyIL@mwanda>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a94dfe3f-2202-7848-ed61-a8b682a7643d@redhat.com>
Date: Wed, 2 Dec 2020 16:13:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X8c32z5EtDsMyyIL@mwanda>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: kernel-janitors@vger.kernel.org, kvm@vger.kernel.org,
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

Ck9uIDIwMjAvMTIvMiDkuIvljYgyOjQ0LCBEYW4gQ2FycGVudGVyIHdyb3RlOgo+IFRoZSBjb3B5
X3RvX3VzZXIoKSBmdW5jdGlvbiByZXR1cm5zIHRoZSBudW1iZXIgb2YgYnl0ZXMgcmVtYWluaW5n
IHRvIGJlCj4gY29waWVkIGJ1dCB0aGlzIHNob3VsZCByZXR1cm4gLUVGQVVMVCB0byB0aGUgdXNl
ci4KPgo+IEZpeGVzOiAxYjQ4ZGMwM2U1NzUgKCJ2aG9zdDogdmRwYTogcmVwb3J0IGlvdmEgcmFu
Z2UiKQo+IFNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xl
LmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvdmhvc3QvdmRwYS5jIHwgNCArKystCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy92aG9zdC92ZHBhLmMgYi9kcml2ZXJzL3Zob3N0L3ZkcGEuYwo+IGluZGV4IGQ2YTM3
YjY2NzcwYi4uZWY2ODhjOGMwZTBlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmhvc3QvdmRwYS5j
Cj4gKysrIGIvZHJpdmVycy92aG9zdC92ZHBhLmMKPiBAQCAtMzQ0LDcgKzM0NCw5IEBAIHN0YXRp
YyBsb25nIHZob3N0X3ZkcGFfZ2V0X2lvdmFfcmFuZ2Uoc3RydWN0IHZob3N0X3ZkcGEgKnYsIHUz
MiBfX3VzZXIgKmFyZ3ApCj4gICAJCS5sYXN0ID0gdi0+cmFuZ2UubGFzdCwKPiAgIAl9Owo+ICAg
Cj4gLQlyZXR1cm4gY29weV90b191c2VyKGFyZ3AsICZyYW5nZSwgc2l6ZW9mKHJhbmdlKSk7Cj4g
KwlpZiAoY29weV90b191c2VyKGFyZ3AsICZyYW5nZSwgc2l6ZW9mKHJhbmdlKSkpCj4gKwkJcmV0
dXJuIC1FRkFVTFQ7Cj4gKwlyZXR1cm4gMDsKPiAgIH0KPiAgIAo+ICAgc3RhdGljIGxvbmcgdmhv
c3RfdmRwYV92cmluZ19pb2N0bChzdHJ1Y3Qgdmhvc3RfdmRwYSAqdiwgdW5zaWduZWQgaW50IGNt
ZCwKCgpBY2tlZC1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KClRoYW5rcwoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxp
emF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9u
Lm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92
aXJ0dWFsaXphdGlvbg==
