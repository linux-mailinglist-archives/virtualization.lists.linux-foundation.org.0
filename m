Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 100FB1F6067
	for <lists.virtualization@lfdr.de>; Thu, 11 Jun 2020 05:20:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 389AA892AF;
	Thu, 11 Jun 2020 03:20:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XQXsFz6O+DPE; Thu, 11 Jun 2020 03:20:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C28FF89352;
	Thu, 11 Jun 2020 03:20:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9CA29C0894;
	Thu, 11 Jun 2020 03:20:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 20C70C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 03:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D715984A43
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 03:20:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GJKViG61wWCR
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 03:20:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3729986D08
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 03:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591845023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j7nAz4g7AJWZ/u0Oz9E2EcJapBTF/UxDuv9a+vP4pMQ=;
 b=NlcYwDO7/Vq8y3X+ljU7HyjuIK11JAWZJkMItPJ8fw6RX9jYrtAMW2Jt4L+vl6uVtiaFUb
 GlvN+8ljYf0/la0knMw1TYZ7t7i+LdPq60R2gvYqquUI+G6u2Vq9F5UGZSUNujEjAdlXWz
 uR0YRFN22NlIOZvcByTNQKtS9as5Ns8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-28PUtISXOqKJhlRrBZDLPw-1; Wed, 10 Jun 2020 23:10:19 -0400
X-MC-Unique: 28PUtISXOqKJhlRrBZDLPw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51AE21883600;
 Thu, 11 Jun 2020 03:10:18 +0000 (UTC)
Received: from [10.72.12.125] (ovpn-12-125.pek2.redhat.com [10.72.12.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A3EB60BF3;
 Thu, 11 Jun 2020 03:10:09 +0000 (UTC)
Subject: Re: [PATCH] s390: protvirt: virtio: Refuse device without IOMMU
To: Pierre Morel <pmorel@linux.ibm.com>, linux-kernel@vger.kernel.org
References: <1591794711-5915-1-git-send-email-pmorel@linux.ibm.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <467d5b58-b70c-1c45-4130-76b6e18c05af@redhat.com>
Date: Thu, 11 Jun 2020 11:10:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1591794711-5915-1-git-send-email-pmorel@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: linux-s390@vger.kernel.org, frankja@linux.ibm.com, kvm@vger.kernel.org,
 mst@redhat.com, cohuck@redhat.com, virtualization@lists.linux-foundation.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com
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

Ck9uIDIwMjAvNi8xMCDkuIvljYg5OjExLCBQaWVycmUgTW9yZWwgd3JvdGU6Cj4gUHJvdGVjdGVk
IFZpcnR1YWxpc2F0aW9uIHByb3RlY3RzIHRoZSBtZW1vcnkgb2YgdGhlIGd1ZXN0IGFuZAo+IGRv
IG5vdCBhbGxvdyBhIHRoZSBob3N0IHRvIGFjY2VzcyBhbGwgb2YgaXRzIG1lbW9yeS4KPgo+IExl
dCdzIHJlZnVzZSBhIFZJUlRJTyBkZXZpY2Ugd2hpY2ggZG9lcyBub3QgdXNlIElPTU1VCj4gcHJv
dGVjdGVkIGFjY2Vzcy4KPgo+IFNpZ25lZC1vZmYtYnk6IFBpZXJyZSBNb3JlbCA8cG1vcmVsQGxp
bnV4LmlibS5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL3MzOTAvdmlydGlvL3ZpcnRpb19jY3cuYyB8
IDUgKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3MzOTAvdmlydGlvL3ZpcnRpb19jY3cuYyBiL2RyaXZlcnMvczM5MC92aXJ0
aW8vdmlydGlvX2Njdy5jCj4gaW5kZXggNTczMDU3MmI1MmNkLi4wNmZmYmM5NjU4N2EgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9zMzkwL3ZpcnRpby92aXJ0aW9fY2N3LmMKPiArKysgYi9kcml2ZXJz
L3MzOTAvdmlydGlvL3ZpcnRpb19jY3cuYwo+IEBAIC05ODYsNiArOTg2LDExIEBAIHN0YXRpYyB2
b2lkIHZpcnRpb19jY3dfc2V0X3N0YXR1cyhzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldiwgdTgg
c3RhdHVzKQo+ICAgCWlmICghY2N3KQo+ICAgCQlyZXR1cm47Cj4gICAKPiArCS8qIFByb3RlY3Rl
ZCBWaXJ0dWFsaXNhdGlvbiBndWVzdCBuZWVkcyBJT01NVSAqLwo+ICsJaWYgKGlzX3Byb3Rfdmly
dF9ndWVzdCgpICYmCj4gKwkgICAgIV9fdmlydGlvX3Rlc3RfYml0KHZkZXYsIFZJUlRJT19GX0lP
TU1VX1BMQVRGT1JNKSkKPiArCQkJc3RhdHVzICY9IH5WSVJUSU9fQ09ORklHX1NfRkVBVFVSRVNf
T0s7Cj4gKwo+ICAgCS8qIFdyaXRlIHRoZSBzdGF0dXMgdG8gdGhlIGhvc3QuICovCj4gICAJdmNk
ZXYtPmRtYV9hcmVhLT5zdGF0dXMgPSBzdGF0dXM7Cj4gICAJY2N3LT5jbWRfY29kZSA9IENDV19D
TURfV1JJVEVfU1RBVFVTOwoKCkkgd29uZGVyIHdoZXRoZXIgd2UgbmVlZCBtb3ZlIGl0IHRvIHZp
cnRpbyBjb3JlIGluc3RlYWQgb2YgY2N3LgoKSSB0aGluayB0aGUgb3RoZXIgbWVtb3J5IHByb3Rl
Y3Rpb24gdGVjaG5vbG9naWVzIG1heSBzdWZmZXIgZnJvbSB0aGlzIGFzIAp3ZWxsLgoKVGhhbmtz
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFs
aXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlv
bi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8v
dmlydHVhbGl6YXRpb24=
