Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8742C7D20
	for <lists.virtualization@lfdr.de>; Mon, 30 Nov 2020 04:09:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B8D1A8722B;
	Mon, 30 Nov 2020 03:09:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qycGszsNPDXj; Mon, 30 Nov 2020 03:09:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3803E872FA;
	Mon, 30 Nov 2020 03:09:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 244B5C1833;
	Mon, 30 Nov 2020 03:09:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 40871C0052
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Nov 2020 03:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2F0DF85FA7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Nov 2020 03:09:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ld8NO1GnktkD
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Nov 2020 03:09:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3974783559
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Nov 2020 03:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606705774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PdgQfOMXLri0gk5RJB+KiL8FXJYRE57TjBbYJ6Jm+5M=;
 b=FhIvZXwcr7F7fs2n+TeDgZ9CHJnfgqxElQWfgW+H37psSAfZM+aMOG9u4GDz/Th7fqz/ot
 PLKqcTpeofQgz2N5u22lLkn9tJ5IyOQ5CnanU4pxw7WdDe0soAqwtJjTLNSSwE/7NNyqx2
 7oIjDGvSO5qq3pKMdizwqmARPEDL32E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-_R8frUzIMz-A_Uobltv_WA-1; Sun, 29 Nov 2020 22:09:30 -0500
X-MC-Unique: _R8frUzIMz-A_Uobltv_WA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34ABC1E7E0;
 Mon, 30 Nov 2020 03:09:29 +0000 (UTC)
Received: from [10.72.13.173] (ovpn-13-173.pek2.redhat.com [10.72.13.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F57860843;
 Mon, 30 Nov 2020 03:09:19 +0000 (UTC)
Subject: Re: [PATCH v2 06/17] vdpa_sim: add struct vdpasim_dev_attr for device
 attributes
To: Stefano Garzarella <sgarzare@redhat.com>,
 virtualization@lists.linux-foundation.org
References: <20201126144950.92850-1-sgarzare@redhat.com>
 <20201126144950.92850-7-sgarzare@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <9d4db0ca-bb01-a3ad-13c3-c99ed7f955c8@redhat.com>
Date: Mon, 30 Nov 2020 11:09:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201126144950.92850-7-sgarzare@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: Laurent Vivier <lvivier@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <elic@nvidia.com>
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

Ck9uIDIwMjAvMTEvMjYg5LiL5Y2IMTA6NDksIFN0ZWZhbm8gR2FyemFyZWxsYSB3cm90ZToKPiB2
ZHBhc2ltX2Rldl9hdHRyIHdpbGwgY29udGFpbiBkZXZpY2Ugc3BlY2lmaWMgYXR0cmlidXRlcy4g
V2Ugc3RhcnRpbmcKPiBtb3ZpbmcgdGhlIG51bWJlciBvZiB2aXJ0cXVldWVzIChpLmUuIG52cXMp
IHRvIHZkcGFzaW1fZGV2X2F0dHIuCj4KPiB2ZHBhc2ltX2NyZWF0ZSgpIGNyZWF0ZXMgYSBuZXcg
dkRQQSBzaW11bGF0b3IgZm9sbG93aW5nIHRoZSBkZXZpY2UKPiBhdHRyaWJ1dGVzIGRlZmluZWQg
aW4gdGhlIHZkcGFzaW1fZGV2X2F0dHIgcGFyYW1ldGVyLgo+Cj4gQ28tZGV2ZWxvcGVkLWJ5OiBN
YXggR3VydG92b3kgPG1ndXJ0b3ZveUBudmlkaWEuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE1heCBH
dXJ0b3ZveSA8bWd1cnRvdm95QG52aWRpYS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBH
YXJ6YXJlbGxhIDxzZ2FyemFyZUByZWRoYXQuY29tPgo+IC0tLQo+ICAgZHJpdmVycy92ZHBhL3Zk
cGFfc2ltL3ZkcGFfc2ltLmMgfCAyNSArKysrKysrKysrKysrKysrKy0tLS0tLS0tCj4gICAxIGZp
bGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCgpBY2tlZC1ieTog
SmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KCgo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdmRwYS92ZHBhX3NpbS92ZHBhX3NpbS5jIGIvZHJpdmVycy92ZHBhL3ZkcGFfc2ltL3ZkcGFf
c2ltLmMKPiBpbmRleCA2MjIwNGUwNjQ4NDEuLmY5ODI2MmFkZDBlMSAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW0uYwo+ICsrKyBiL2RyaXZlcnMvdmRwYS92ZHBh
X3NpbS92ZHBhX3NpbS5jCj4gQEAgLTU1LDExICs1NSwxNiBAQCBzdGF0aWMgdTY0IHZkcGFzaW1f
ZmVhdHVyZXMgPSAoMVVMTCA8PCBWSVJUSU9fRl9BTllfTEFZT1VUKSB8Cj4gICAJCQkgICAgICAo
MVVMTCA8PCBWSVJUSU9fRl9BQ0NFU1NfUExBVEZPUk0pIHwKPiAgIAkJCSAgICAgICgxVUxMIDw8
IFZJUlRJT19ORVRfRl9NQUMpOwo+ICAgCj4gK3N0cnVjdCB2ZHBhc2ltX2Rldl9hdHRyIHsKPiAr
CWludCBudnFzOwo+ICt9Owo+ICsKPiAgIC8qIFN0YXRlIG9mIGVhY2ggdmRwYXNpbSBkZXZpY2Ug
Ki8KPiAgIHN0cnVjdCB2ZHBhc2ltIHsKPiAgIAlzdHJ1Y3QgdmRwYV9kZXZpY2UgdmRwYTsKPiAg
IAlzdHJ1Y3QgdmRwYXNpbV92aXJ0cXVldWUgKnZxczsKPiAgIAlzdHJ1Y3Qgd29ya19zdHJ1Y3Qg
d29yazsKPiArCXN0cnVjdCB2ZHBhc2ltX2Rldl9hdHRyIGRldl9hdHRyOwo+ICAgCS8qIHNwaW5s
b2NrIHRvIHN5bmNocm9uaXplIHZpcnRxdWV1ZSBzdGF0ZSAqLwo+ICAgCXNwaW5sb2NrX3QgbG9j
azsKPiAgIAlzdHJ1Y3QgdmlydGlvX25ldF9jb25maWcgY29uZmlnOwo+IEBAIC02OCw3ICs3Myw2
IEBAIHN0cnVjdCB2ZHBhc2ltIHsKPiAgIAl1MzIgc3RhdHVzOwo+ICAgCXUzMiBnZW5lcmF0aW9u
Owo+ICAgCXU2NCBmZWF0dXJlczsKPiAtCWludCBudnFzOwo+ICAgCS8qIHNwaW5sb2NrIHRvIHN5
bmNocm9uaXplIGlvbW11IHRhYmxlICovCj4gICAJc3BpbmxvY2tfdCBpb21tdV9sb2NrOwo+ICAg
fTsKPiBAQCAtMTMzLDcgKzEzNyw3IEBAIHN0YXRpYyB2b2lkIHZkcGFzaW1fcmVzZXQoc3RydWN0
IHZkcGFzaW0gKnZkcGFzaW0pCj4gICB7Cj4gICAJaW50IGk7Cj4gICAKPiAtCWZvciAoaSA9IDA7
IGkgPCB2ZHBhc2ltLT5udnFzOyBpKyspCj4gKwlmb3IgKGkgPSAwOyBpIDwgdmRwYXNpbS0+ZGV2
X2F0dHIubnZxczsgaSsrKQo+ICAgCQl2ZHBhc2ltX3ZxX3Jlc2V0KCZ2ZHBhc2ltLT52cXNbaV0p
Owo+ICAgCj4gICAJc3Bpbl9sb2NrKCZ2ZHBhc2ltLT5pb21tdV9sb2NrKTsKPiBAQCAtMzM0LDcg
KzMzOCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1hX21hcF9vcHMgdmRwYXNpbV9kbWFfb3Bz
ID0gewo+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCB2ZHBhX2NvbmZpZ19vcHMgdmRwYXNpbV9jb25m
aWdfb3BzOwo+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCB2ZHBhX2NvbmZpZ19vcHMgdmRwYXNpbV9i
YXRjaF9jb25maWdfb3BzOwo+ICAgCj4gLXN0YXRpYyBzdHJ1Y3QgdmRwYXNpbSAqdmRwYXNpbV9j
cmVhdGUodm9pZCkKPiArc3RhdGljIHN0cnVjdCB2ZHBhc2ltICp2ZHBhc2ltX2NyZWF0ZShzdHJ1
Y3QgdmRwYXNpbV9kZXZfYXR0ciAqZGV2X2F0dHIpCj4gICB7Cj4gICAJY29uc3Qgc3RydWN0IHZk
cGFfY29uZmlnX29wcyAqb3BzOwo+ICAgCXN0cnVjdCB2ZHBhc2ltICp2ZHBhc2ltOwo+IEBAIC0z
NDYsMTEgKzM1MCwxMiBAQCBzdGF0aWMgc3RydWN0IHZkcGFzaW0gKnZkcGFzaW1fY3JlYXRlKHZv
aWQpCj4gICAJZWxzZQo+ICAgCQlvcHMgPSAmdmRwYXNpbV9jb25maWdfb3BzOwo+ICAgCj4gLQl2
ZHBhc2ltID0gdmRwYV9hbGxvY19kZXZpY2Uoc3RydWN0IHZkcGFzaW0sIHZkcGEsIE5VTEwsIG9w
cywgVkRQQVNJTV9WUV9OVU0pOwo+ICsJdmRwYXNpbSA9IHZkcGFfYWxsb2NfZGV2aWNlKHN0cnVj
dCB2ZHBhc2ltLCB2ZHBhLCBOVUxMLCBvcHMsCj4gKwkJCQkgICAgZGV2X2F0dHItPm52cXMpOwo+
ICAgCWlmICghdmRwYXNpbSkKPiAgIAkJZ290byBlcnJfYWxsb2M7Cj4gICAKPiAtCXZkcGFzaW0t
Pm52cXMgPSBWRFBBU0lNX1ZRX05VTTsKPiArCXZkcGFzaW0tPmRldl9hdHRyID0gKmRldl9hdHRy
Owo+ICAgCUlOSVRfV09SSygmdmRwYXNpbS0+d29yaywgdmRwYXNpbV93b3JrKTsKPiAgIAlzcGlu
X2xvY2tfaW5pdCgmdmRwYXNpbS0+bG9jayk7Cj4gICAJc3Bpbl9sb2NrX2luaXQoJnZkcGFzaW0t
PmlvbW11X2xvY2spOwo+IEBAIC0zNjEsNyArMzY2LDcgQEAgc3RhdGljIHN0cnVjdCB2ZHBhc2lt
ICp2ZHBhc2ltX2NyZWF0ZSh2b2lkKQo+ICAgCQlnb3RvIGVycl9pb21tdTsKPiAgIAlzZXRfZG1h
X29wcyhkZXYsICZ2ZHBhc2ltX2RtYV9vcHMpOwo+ICAgCj4gLQl2ZHBhc2ltLT52cXMgPSBrY2Fs
bG9jKHZkcGFzaW0tPm52cXMsIHNpemVvZihzdHJ1Y3QgdmRwYXNpbV92aXJ0cXVldWUpLAo+ICsJ
dmRwYXNpbS0+dnFzID0ga2NhbGxvYyhkZXZfYXR0ci0+bnZxcywgc2l6ZW9mKHN0cnVjdCB2ZHBh
c2ltX3ZpcnRxdWV1ZSksCj4gICAJCQkgICAgICAgR0ZQX0tFUk5FTCk7Cj4gICAJaWYgKCF2ZHBh
c2ltLT52cXMpCj4gICAJCWdvdG8gZXJyX2lvbW11Owo+IEBAIC0zODQsNyArMzg5LDcgQEAgc3Rh
dGljIHN0cnVjdCB2ZHBhc2ltICp2ZHBhc2ltX2NyZWF0ZSh2b2lkKQo+ICAgCQlldGhfcmFuZG9t
X2FkZHIodmRwYXNpbS0+Y29uZmlnLm1hYyk7Cj4gICAJfQo+ICAgCj4gLQlmb3IgKGkgPSAwOyBp
IDwgdmRwYXNpbS0+bnZxczsgaSsrKQo+ICsJZm9yIChpID0gMDsgaSA8IGRldl9hdHRyLT5udnFz
OyBpKyspCj4gICAJCXZyaW5naF9zZXRfaW90bGIoJnZkcGFzaW0tPnZxc1tpXS52cmluZywgdmRw
YXNpbS0+aW9tbXUpOwo+ICAgCj4gICAJdmRwYXNpbS0+dmRwYS5kbWFfZGV2ID0gZGV2Owo+IEBA
IC03MTIsNyArNzE3LDExIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdmRwYV9jb25maWdfb3BzIHZk
cGFzaW1fYmF0Y2hfY29uZmlnX29wcyA9IHsKPiAgIAo+ICAgc3RhdGljIGludCBfX2luaXQgdmRw
YXNpbV9kZXZfaW5pdCh2b2lkKQo+ICAgewo+IC0JdmRwYXNpbV9kZXYgPSB2ZHBhc2ltX2NyZWF0
ZSgpOwo+ICsJc3RydWN0IHZkcGFzaW1fZGV2X2F0dHIgZGV2X2F0dHIgPSB7fTsKPiArCj4gKwlk
ZXZfYXR0ci5udnFzID0gVkRQQVNJTV9WUV9OVU07Cj4gKwo+ICsJdmRwYXNpbV9kZXYgPSB2ZHBh
c2ltX2NyZWF0ZSgmZGV2X2F0dHIpOwo+ICAgCj4gICAJaWYgKCFJU19FUlIodmRwYXNpbV9kZXYp
KQo+ICAgCQlyZXR1cm4gMDsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0
cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcv
bWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
