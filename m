Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6A01B8D22
	for <lists.virtualization@lfdr.de>; Sun, 26 Apr 2020 09:03:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A774820115;
	Sun, 26 Apr 2020 07:03:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I2IBgBh3UHUh; Sun, 26 Apr 2020 07:03:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8144B203C8;
	Sun, 26 Apr 2020 07:03:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A8CAC0172;
	Sun, 26 Apr 2020 07:03:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6EC72C0172
 for <virtualization@lists.linux-foundation.org>;
 Sun, 26 Apr 2020 07:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5938920115
 for <virtualization@lists.linux-foundation.org>;
 Sun, 26 Apr 2020 07:03:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HMhJOoJryG62
 for <virtualization@lists.linux-foundation.org>;
 Sun, 26 Apr 2020 07:03:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 87BD62000E
 for <virtualization@lists.linux-foundation.org>;
 Sun, 26 Apr 2020 07:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587884621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r0+g/GeTH0GPDYkRAev7qPNvYtgSpKx3yr1KGRbtER4=;
 b=DpZL6wfkVt3e3A4/VP208AlywrKf0xWzbRh3aHPW7fN+vNp+7Qgw4XYT2PurjGdNNgY01y
 jaIG2kpA8ospkOx0teSqoy+Tv7COtvw7BntpOFqrcCNNdBt8gLHlTEBr19htkxiCZ7arE1
 Clahzbj1nBOypcqBf1dDKZsts9Nb7g4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-akSujXFqO_it7sC_Ec1N1g-1; Sun, 26 Apr 2020 03:03:37 -0400
X-MC-Unique: akSujXFqO_it7sC_Ec1N1g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86FF6108BD10;
 Sun, 26 Apr 2020 07:03:36 +0000 (UTC)
Received: from [10.72.13.103] (ovpn-13-103.pek2.redhat.com [10.72.13.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C22375D714;
 Sun, 26 Apr 2020 07:03:30 +0000 (UTC)
Subject: Re: [PATCH V2 1/2] vdpa: Support config interrupt in vhost_vdpa
From: Jason Wang <jasowang@redhat.com>
To: Zhu Lingshan <lingshan.zhu@intel.com>, mst@redhat.com,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <1587881384-2133-1-git-send-email-lingshan.zhu@intel.com>
 <1587881384-2133-2-git-send-email-lingshan.zhu@intel.com>
 <055fb826-895d-881b-719c-228d0cc9a7bf@redhat.com>
Message-ID: <e345cc85-aa9d-1173-8308-f0a301fca2b2@redhat.com>
Date: Sun, 26 Apr 2020 15:03:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <055fb826-895d-881b-719c-228d0cc9a7bf@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: lulu@redhat.com
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

Ck9uIDIwMjAvNC8yNiDkuIvljYgyOjU4LCBKYXNvbiBXYW5nIHdyb3RlOgo+Pgo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy92aG9zdC92aG9zdC5oIGIvZHJpdmVycy92aG9zdC92aG9zdC5oCj4+IGlu
ZGV4IDE4MTM4MjEuLjg2NjMxMzkgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvdmhvc3Qvdmhvc3Qu
aAo+PiArKysgYi9kcml2ZXJzL3Zob3N0L3Zob3N0LmgKPj4gQEAgLTE4LDYgKzE4LDggQEAKPj4g
wqAgdHlwZWRlZiB2b2lkICgqdmhvc3Rfd29ya19mbl90KShzdHJ1Y3Qgdmhvc3Rfd29yayAqd29y
ayk7Cj4+IMKgIMKgICNkZWZpbmUgVkhPU1RfV09SS19RVUVVRUQgMQo+PiArI2RlZmluZSBWSE9T
VF9GSUxFX1VOQklORCAtMQo+Cj4KPiBJIHRoaW5rIGl0J3MgYmV0dGVyIHRvIGRvY3VtZW50IHRo
aXMgaW4gdWFwaS4gCgoKSSBtZWFudCBlLmcgaW4gdmhvc3RfdnJpbmdfZmlsZSwgd2UgaGFkIGEg
Y29tbWVudCBvZiB1bmJpbmRpbmc6CgpzdHJ1Y3Qgdmhvc3RfdnJpbmdfZmlsZSB7CiDCoMKgwqAg
dW5zaWduZWQgaW50IGluZGV4OwogwqDCoMKgIGludCBmZDsgLyogUGFzcyAtMSB0byB1bmJpbmQg
ZnJvbSBmaWxlLiAqLwoKfTsKClRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0
aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0
aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
