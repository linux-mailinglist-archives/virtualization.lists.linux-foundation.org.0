Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6CF1F8C68
	for <lists.virtualization@lfdr.de>; Mon, 15 Jun 2020 05:02:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9A28488748;
	Mon, 15 Jun 2020 03:02:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j0D7UNK+umqS; Mon, 15 Jun 2020 03:02:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 169FB88745;
	Mon, 15 Jun 2020 03:02:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DDD4DC016E;
	Mon, 15 Jun 2020 03:02:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A707BC016E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 03:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9AB21241A8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 03:02:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nnQsKHjdPbb1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 03:02:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 5C73F24074
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 03:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592190128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K4U+ztHAwvhjjKgIyDd+AhXpFv+PexCkPkFdjCrijfk=;
 b=FxDCFr39fOmxprTX0ebJsqKYOGD8n+EQDcVda/JavoczsyqDlk+60GoL/T5cxD+g5gqpLk
 q90DwixlN9obZN4qesW3I5kFTMEdfidXrKzNTulfdnenuUEj7fdRZI4Ry4tffojzNPs8ev
 B5q/wWltzASuw4BFqZDJF97+Pa3cGGM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-c7Q0tsasP_2KGTb5GXXjng-1; Sun, 14 Jun 2020 23:02:05 -0400
X-MC-Unique: c7Q0tsasP_2KGTb5GXXjng-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D2B78064D8;
 Mon, 15 Jun 2020 03:02:03 +0000 (UTC)
Received: from [10.72.13.232] (ovpn-13-232.pek2.redhat.com [10.72.13.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E19610013D6;
 Mon, 15 Jun 2020 03:01:56 +0000 (UTC)
Subject: Re: [PATCH] s390: protvirt: virtio: Refuse device without IOMMU
To: Pierre Morel <pmorel@linux.ibm.com>, linux-kernel@vger.kernel.org
References: <1591794711-5915-1-git-send-email-pmorel@linux.ibm.com>
 <467d5b58-b70c-1c45-4130-76b6e18c05af@redhat.com>
 <f7eb1154-0f52-0f12-129f-2b511f5a4685@linux.ibm.com>
 <6356ba7f-afab-75e1-05ff-4a22b88c610e@linux.ibm.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a02b9f94-eb48-4ae2-0ade-a4ce26b61ad8@redhat.com>
Date: Mon, 15 Jun 2020 11:01:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <6356ba7f-afab-75e1-05ff-4a22b88c610e@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

Ck9uIDIwMjAvNi8xMiDkuIvljYg3OjM4LCBQaWVycmUgTW9yZWwgd3JvdGU6Cj4KPgo+IE9uIDIw
MjAtMDYtMTIgMTE6MjEsIFBpZXJyZSBNb3JlbCB3cm90ZToKPj4KPj4KPj4gT24gMjAyMC0wNi0x
MSAwNToxMCwgSmFzb24gV2FuZyB3cm90ZToKPj4+Cj4+PiBPbiAyMDIwLzYvMTAg5LiL5Y2IOTox
MSwgUGllcnJlIE1vcmVsIHdyb3RlOgo+Pj4+IFByb3RlY3RlZCBWaXJ0dWFsaXNhdGlvbiBwcm90
ZWN0cyB0aGUgbWVtb3J5IG9mIHRoZSBndWVzdCBhbmQKPj4+PiBkbyBub3QgYWxsb3cgYSB0aGUg
aG9zdCB0byBhY2Nlc3MgYWxsIG9mIGl0cyBtZW1vcnkuCj4+Pj4KPj4+PiBMZXQncyByZWZ1c2Ug
YSBWSVJUSU8gZGV2aWNlIHdoaWNoIGRvZXMgbm90IHVzZSBJT01NVQo+Pj4+IHByb3RlY3RlZCBh
Y2Nlc3MuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBQaWVycmUgTW9yZWwgPHBtb3JlbEBsaW51
eC5pYm0uY29tPgo+Pj4+IC0tLQo+Pj4+IMKgIGRyaXZlcnMvczM5MC92aXJ0aW8vdmlydGlvX2Nj
dy5jIHwgNSArKysrKwo+Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPj4+
Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3MzOTAvdmlydGlvL3ZpcnRpb19jY3cuYyAKPj4+
PiBiL2RyaXZlcnMvczM5MC92aXJ0aW8vdmlydGlvX2Njdy5jCj4+Pj4gaW5kZXggNTczMDU3MmI1
MmNkLi4wNmZmYmM5NjU4N2EgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9zMzkwL3ZpcnRpby92
aXJ0aW9fY2N3LmMKPj4+PiArKysgYi9kcml2ZXJzL3MzOTAvdmlydGlvL3ZpcnRpb19jY3cuYwo+
Pj4+IEBAIC05ODYsNiArOTg2LDExIEBAIHN0YXRpYyB2b2lkIHZpcnRpb19jY3dfc2V0X3N0YXR1
cyhzdHJ1Y3QgCj4+Pj4gdmlydGlvX2RldmljZSAqdmRldiwgdTggc3RhdHVzKQo+Pj4+IMKgwqDC
oMKgwqAgaWYgKCFjY3cpCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybjsKPj4+PiArwqDC
oMKgIC8qIFByb3RlY3RlZCBWaXJ0dWFsaXNhdGlvbiBndWVzdCBuZWVkcyBJT01NVSAqLwo+Pj4+
ICvCoMKgwqAgaWYgKGlzX3Byb3RfdmlydF9ndWVzdCgpICYmCj4+Pj4gK8KgwqDCoMKgwqDCoMKg
ICFfX3ZpcnRpb190ZXN0X2JpdCh2ZGV2LCBWSVJUSU9fRl9JT01NVV9QTEFURk9STSkpCj4+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RhdHVzICY9IH5WSVJUSU9fQ09ORklHX1NfRkVBVFVS
RVNfT0s7Cj4+Pj4gKwo+Pj4+IMKgwqDCoMKgwqAgLyogV3JpdGUgdGhlIHN0YXR1cyB0byB0aGUg
aG9zdC4gKi8KPj4+PiDCoMKgwqDCoMKgIHZjZGV2LT5kbWFfYXJlYS0+c3RhdHVzID0gc3RhdHVz
Owo+Pj4+IMKgwqDCoMKgwqAgY2N3LT5jbWRfY29kZSA9IENDV19DTURfV1JJVEVfU1RBVFVTOwo+
Pj4KPj4+Cj4+PiBJIHdvbmRlciB3aGV0aGVyIHdlIG5lZWQgbW92ZSBpdCB0byB2aXJ0aW8gY29y
ZSBpbnN0ZWFkIG9mIGNjdy4KPj4+Cj4+PiBJIHRoaW5rIHRoZSBvdGhlciBtZW1vcnkgcHJvdGVj
dGlvbiB0ZWNobm9sb2dpZXMgbWF5IHN1ZmZlciBmcm9tIAo+Pj4gdGhpcyBhcyB3ZWxsLgo+Pj4K
Pj4+IFRoYW5rcwo+Pj4KPj4KPj4KPj4gV2hhdCB3b3VsZCB5b3UgdGhpbmsgb2YgdGhlIGZvbGxv
d2luZywgYWxzbyB0YWtpbmcgaW50byBhY2NvdW50IAo+PiBDb25uaWUncyBjb21tZW50IG9uIHdo
ZXJlIHRoZSB0ZXN0IHNob3VsZCBiZSBkb25lOgo+Pgo+PiAtIGRlY2xhcmUgYSB3ZWFrIGZ1bmN0
aW9uIGluIHZpcnRpby5jIGNvZGUsIHJldHVybmluZyB0aGF0IG1lbW9yeSAKPj4gcHJvdGVjdGlv
biBpcyBub3QgaW4gdXNlLgo+Pgo+PiAtIG92ZXJ3cml0ZSB0aGUgZnVuY3Rpb24gaW4gdGhlIGFy
Y2ggY29kZQo+Pgo+PiAtIGNhbGwgdGhpcyBmdW5jdGlvbiBpbnNpZGUgY29yZSB2aXJ0aW9fZmlu
YWxpemVfZmVhdHVyZXMoKSBhbmQgaWYgCj4+IHJlcXVpcmVkIGZhaWwgaWYgdGhlIGRldmljZSBk
b24ndCBoYXZlIFZJUlRJT19GX0lPTU1VX1BMQVRGT1JNLgoKCkkgdGhpbmsgdGhpcyBpcyBmaW5l
LgoKCj4+Cj4+IEFsdGVybmF0aXZlIGNvdWxkIGJlIHRvIHRlc3QgYSBnbG9iYWwgdmFyaWFibGUg
dGhhdCB0aGUgYXJjaGl0ZWN0dXJlIAo+PiB3b3VsZCBvdmVyd3JpdGUgaWYgbmVlZGVkIGJ1dCBJ
IGZpbmQgdGhlIHdlYWsgZnVuY3Rpb24gc29sdXRpb24gbW9yZSAKPj4gZmxleGlibGUuCj4+Cj4+
IFdpdGggYSBmdW5jdGlvbiwgd2UgYWxzbyBoYXZlIHRoZSBwb3NzaWJpbGl0eSB0byBwcm92aWRl
IHRoZSBkZXZpY2UgCj4+IGFzIGFyZ3VtZW50IGFuZCB0YWtlIGFjdGlvbnMgZGVwZW5kaW5nIGl0
LCB0aGlzIG1heSBhbnN3ZXIgSGFsaWwncyAKPj4gY29uY2Vybi4KPj4KPj4gUmVnYXJkcywKPj4g
UGllcnJlCj4+Cj4KPiBodW0sIGluIGJldHdlZW4gSSBmb3VuZCBhbm90aGVyIHdheSB3aGljaCBz
ZWVtcyB0byBtZSBtdWNoIGJldHRlcjoKPgo+IFdlIGFscmVhZHkgaGF2ZSB0aGUgZm9yY2VfZG1h
X3VuZW5jcnlwdGVkKCkgZnVuY3Rpb24gYXZhaWxhYmxlIHdoaWNoIAo+IEFGQUlVIGlzIHdoYXQg
d2Ugd2FudCBmb3IgZW5jcnlwdGVkIG1lbW9yeSBwcm90ZWN0aW9uIGFuZCBpcyBhbHJlYWR5IAo+
IHVzZWQgYnkgcG93ZXIgYW5kIHg4NiBTRVYvU01FIGluIGEgd2F5IHRoYXQgc2VlbXMgQUZBSVUg
Y29tcGF0aWJsZSAKPiB3aXRoIG91ciBwcm9ibGVtLgo+Cj4gRXZlbiBETUEgYW5kIElPTU1VIGFy
ZSBkaWZmZXJlbnQgdGhpbmdzLCBJIHRoaW5rIHRoZXkgc2hvdWxkIGJlIHVzZWQgCj4gdG9nZXRo
ZXIgaW4gb3VyIGNhc2UuCj4KPiBXaGF0IGRvIHlvdSB0aGluaz8KPgo+IFRoZSBwYXRjaCB3b3Vs
ZCB0aGVuIGJlIHNvbWV0aGluZyBsaWtlOgo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlydGlv
L3ZpcnRpby5jIGIvZHJpdmVycy92aXJ0aW8vdmlydGlvLmMKPiBpbmRleCBhOTc3ZTMyYTg4ZjIu
LjUzNDc2ZDViYmUzNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW8uYwo+ICsr
KyBiL2RyaXZlcnMvdmlydGlvL3ZpcnRpby5jCj4gQEAgLTQsNiArNCw3IEBACj4gwqAjaW5jbHVk
ZSA8bGludXgvdmlydGlvX2NvbmZpZy5oPgo+IMKgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+
IMKgI2luY2x1ZGUgPGxpbnV4L2lkci5oPgo+ICsjaW5jbHVkZSA8bGludXgvZG1hLWRpcmVjdC5o
Pgo+IMKgI2luY2x1ZGUgPHVhcGkvbGludXgvdmlydGlvX2lkcy5oPgo+Cj4gwqAvKiBVbmlxdWUg
bnVtYmVyaW5nIGZvciB2aXJ0aW8gZGV2aWNlcy4gKi8KPiBAQCAtMTc5LDYgKzE4MCwxMCBAQCBp
bnQgdmlydGlvX2ZpbmFsaXplX2ZlYXR1cmVzKHN0cnVjdCB2aXJ0aW9fZGV2aWNlIAo+ICpkZXYp
Cj4gwqDCoMKgwqDCoMKgwqAgaWYgKCF2aXJ0aW9faGFzX2ZlYXR1cmUoZGV2LCBWSVJUSU9fRl9W
RVJTSU9OXzEpKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsKPgo+
ICvCoMKgwqDCoMKgwqAgaWYgKGZvcmNlX2RtYV91bmVuY3J5cHRlZCgmZGV2LT5kZXYpICYmCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgICF2aXJ0aW9faGFzX2ZlYXR1cmUoZGV2LCBWSVJUSU9fRl9J
T01NVV9QTEFURk9STSkpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1F
SU87Cj4gKwo+IMKgwqDCoMKgwqDCoMKgIHZpcnRpb19hZGRfc3RhdHVzKGRldiwgVklSVElPX0NP
TkZJR19TX0ZFQVRVUkVTX09LKTsKPiDCoMKgwqDCoMKgwqDCoCBzdGF0dXMgPSBkZXYtPmNvbmZp
Zy0+Z2V0X3N0YXR1cyhkZXYpOwo+IMKgwqDCoMKgwqDCoMKgIGlmICghKHN0YXR1cyAmIFZJUlRJ
T19DT05GSUdfU19GRUFUVVJFU19PSykpIHsKCgpJIHRoaW5rIHRoaXMgY2FuIHdvcmsgYnV0IG5l
ZWQgdG8gbGlzdGVuIGZyb20gTWljaGFlbC4KClRoYW5rcwoKCj4KPgo+IFJlZ2FyZHMsCj4gUGll
cnJlCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZp
cnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3Vu
ZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0
aW5mby92aXJ0dWFsaXphdGlvbg==
