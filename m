Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CE58312740B
	for <lists.virtualization@lfdr.de>; Fri, 20 Dec 2019 04:40:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2A41424F0C;
	Fri, 20 Dec 2019 03:40:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pjWL8HIpl9nG; Fri, 20 Dec 2019 03:40:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9C36824E7D;
	Fri, 20 Dec 2019 03:40:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7DB7CC077D;
	Fri, 20 Dec 2019 03:40:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2620EC077D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Dec 2019 03:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1024A871EC
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Dec 2019 03:40:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XfWrrRy-rG-h
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Dec 2019 03:40:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 55CDF871E2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Dec 2019 03:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576813230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PFBVRMJ+f4l4QVoIfHIgz5QNf+S8Z6WpJRkhA59m9h8=;
 b=InJPeETrdLs52jd+RP6dNIIsqNLHIP8hb3QspKWFkYceEd85y6JnUzpbNuBqkDhQlth0ja
 aTq1HOZ/upMFI19K4jpUTI6R/kOXA71zcDEJppzyJIELBg9w/rMeid5HQVJZha6ApNdkX/
 i+SADXRcO0nyNQoLghV84kbv333uc1s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-aD-4H_m8On2fMRZUaRRUHw-1; Thu, 19 Dec 2019 22:40:25 -0500
X-MC-Unique: aD-4H_m8On2fMRZUaRRUHw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03EEA100551A;
 Fri, 20 Dec 2019 03:40:24 +0000 (UTC)
Received: from [10.72.12.176] (ovpn-12-176.pek2.redhat.com [10.72.12.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F04F5C28F;
 Fri, 20 Dec 2019 03:40:18 +0000 (UTC)
Subject: Re: read_barrier_depends() usage in vhost.c
To: Herbert Xu <herbert@gondor.apana.org.au>, Will Deacon <will@kernel.org>
References: <20191218091906.cmzgqnwyekak5dzv@gondor.apana.org.au>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <9de4e853-3230-bd2c-c109-07d41b4ff6d6@redhat.com>
Date: Fri, 20 Dec 2019 11:40:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191218091906.cmzgqnwyekak5dzv@gondor.apana.org.au>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: paulmck@kernel.org, mst@redhat.com, peterz@infradead.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 stern@rowland.harvard.edu
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

Ck9uIDIwMTkvMTIvMTgg5LiL5Y2INToxOSwgSGVyYmVydCBYdSB3cm90ZToKPiBXaWxsIERlYWNv
biA8d2lsbEBrZXJuZWwub3JnPiB3cm90ZToKPj4+IC0tLT44Cj4+Pgo+Pj4gLy8gZHJpdmVycy92
aG9zdC92aG9zdC5jCj4+PiBzdGF0aWMgaW50IGdldF9pbmRpcmVjdChzdHJ1Y3Qgdmhvc3Rfdmly
dHF1ZXVlICp2cSwKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGlvdmVjIGlvdltd
LCB1bnNpZ25lZCBpbnQgaW92X3NpemUsCj4+PiAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGludCAqb3V0X251bSwgdW5zaWduZWQgaW50ICppbl9udW0sCj4+PiAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCB2aG9zdF9sb2cgKmxvZywgdW5zaWduZWQgaW50ICpsb2dfbnVtLAo+
Pj4gICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgdnJpbmdfZGVzYyAqaW5kaXJlY3QpCj4+
PiB7Cj4+PiAgICAgICAgWy4uLl0KPj4+Cj4+PiAgICAgICAgLyogV2Ugd2lsbCB1c2UgdGhlIHJl
c3VsdCBhcyBhbiBhZGRyZXNzIHRvIHJlYWQgZnJvbSwgc28gbW9zdAo+Pj4gICAgICAgICAqIGFy
Y2hpdGVjdHVyZXMgb25seSBuZWVkIGEgY29tcGlsZXIgYmFycmllciBoZXJlLiAqLwo+Pj4gICAg
ICAgIHJlYWRfYmFycmllcl9kZXBlbmRzKCk7Cj4+Pgo+Pj4gLS0tPjgKPj4+Cj4+PiBVbmZvcnR1
bmF0ZWx5LCBhbHRob3VnaCB0aGUgYmFycmllciBpcyBjb21tZW50ZWQgKGh1cnJhaCEpLCBpdCdz
IG5vdAo+Pj4gcGFydGljdWxhcmx5IGVubGlnaHRlbmluZyBhYm91dCB0aGUgYWNjZXNzZXMgbWFr
aW5nIHVwIHRoZSBkZXBlbmRlbmN5Cj4+PiBjaGFpbiwgYW5kIEkgZG9uJ3QgdW5kZXJzdGFuZCB0
aGUgc3VwcG9zZWQgbmVlZCBmb3IgYSBjb21waWxlciBiYXJyaWVyCj4+PiBlaXRoZXIgKHJlYWRf
YmFycmllcl9kZXBlbmRzKCkgZG9lc24ndCBnZW5lcmFsbHkgcHJvdmlkZSB0aGlzKS4KPj4+Cj4+
PiBEb2VzIGFueWJvZHkga25vdyB3aGljaCBhY2Nlc3NlcyBhcmUgYmVpbmcgb3JkZXJlZCBoZXJl
PyBVc3VhbGx5IHlvdSdkIG5lZWQKPj4+IGEgUkVBRF9PTkNFKCkvcmN1X2RlcmVmZXJlbmNlKCkg
YmVnaW5uaW5nIHRoZSBjaGFpbiwgYnV0IEkgaGF2ZW4ndCBtYW5hZ2VkCj4+PiB0byBmaW5kIG9u
ZS4uLgo+IEkgdGhpbmsgd2hhdCBpdCdzIHRyeWluZyB0byBzZXBhcmF0ZSBpcyB1c2luZyBpbmRp
cmVjdC0+YWRkciBhcyBhCj4gYmFzZSBhbmQgdGhlbiByZWFkaW5nIGZyb20gdGhhdCB0aHJvdWdo
IGNvcHlfZnJvbV9pdGVyLgo+Cj4gQ2hlZXJzLAoKClRoZSBxdWVzdGlvbiBpcyB0aGF0IHRoZXJl
J3MgYSBzbXBfcm1iKCkgYmVmb3JlIGluIHZob3N0X2dldF92cV9kZXNjKCksIAppc24ndCBpdCBz
dWZmaWNpZW50IHRvIGRvIHRoaXM/CgpUaGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFs
aXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
