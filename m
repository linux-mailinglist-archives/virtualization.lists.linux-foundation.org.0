Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA14215986
	for <lists.virtualization@lfdr.de>; Mon,  6 Jul 2020 16:34:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 270AD87BF6;
	Mon,  6 Jul 2020 14:34:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 27eQNTkW8uFF; Mon,  6 Jul 2020 14:34:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2800D87A73;
	Mon,  6 Jul 2020 14:34:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EECAEC08A9;
	Mon,  6 Jul 2020 14:34:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DAE4DC016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 14:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C6A9A87559
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 14:34:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IBqB_zLm1spN
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 14:34:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2EC7087542
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 14:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594046058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hBET4KTCF7VLtikUgOS5OyaCCHxUdfauUuYPMbcHgTI=;
 b=ipe82HpRb4vj7yLs1qxZw908pEIE8JWwwA+Fvm4bFH+0IUr7XE+vHh4qTe8YgVjOFfsfPE
 ZNCDihoFRcRrb4sIUYs8b+WgCOwyTctpuhqyeHdLUfFWlkzhvfXel2PuVm7E8MIrFvI1+J
 DdRKlya2mjKfe3tor/nkwkuGc3sw2A0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-8UAvHL0EOOKZDXFTB_A5Fw-1; Mon, 06 Jul 2020 10:34:16 -0400
X-MC-Unique: 8UAvHL0EOOKZDXFTB_A5Fw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7F1B10506E1;
 Mon,  6 Jul 2020 14:33:49 +0000 (UTC)
Received: from gondolin (ovpn-112-234.ams2.redhat.com [10.36.112.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C3B41A914;
 Mon,  6 Jul 2020 14:33:43 +0000 (UTC)
Date: Mon, 6 Jul 2020 16:33:40 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH v3 1/1] s390: virtio: let arch accept devices without
 IOMMU feature
Message-ID: <20200706163340.2ce7a5f2.cohuck@redhat.com>
In-Reply-To: <a677decc-5be3-8095-bc33-0f95634011f6@linux.ibm.com>
References: <1592390637-17441-1-git-send-email-pmorel@linux.ibm.com>
 <1592390637-17441-2-git-send-email-pmorel@linux.ibm.com>
 <20200629115651-mutt-send-email-mst@kernel.org>
 <20200629180526.41d0732b.cohuck@redhat.com>
 <26ecd4c6-837b-1ce6-170b-a0155e4dd4d4@linux.ibm.com>
 <a677decc-5be3-8095-bc33-0f95634011f6@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: gor@linux.ibm.com, linux-s390@vger.kernel.org, frankja@linux.ibm.com,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 heiko.carstens@de.ibm.com, linuxram@us.ibm.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, thomas.lendacky@amd.com, david@gibson.dropbear.id.au
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gTW9uLCA2IEp1bCAyMDIwIDE1OjM3OjM3ICswMjAwClBpZXJyZSBNb3JlbCA8cG1vcmVsQGxp
bnV4LmlibS5jb20+IHdyb3RlOgoKPiBPbiAyMDIwLTA3LTAyIDE1OjAzLCBQaWVycmUgTW9yZWwg
d3JvdGU6Cj4gPiAKPiA+IAo+ID4gT24gMjAyMC0wNi0yOSAxODowNSwgQ29ybmVsaWEgSHVjayB3
cm90ZTogIAo+ID4+IE9uIE1vbiwgMjkgSnVuIDIwMjAgMTE6NTc6MTQgLTA0MDAKPiA+PiAiTWlj
aGFlbCBTLiBUc2lya2luIiA8bXN0QHJlZGhhdC5jb20+IHdyb3RlOgo+ID4+ICAKPiA+Pj4gT24g
V2VkLCBKdW4gMTcsIDIwMjAgYXQgMTI6NDM6NTdQTSArMDIwMCwgUGllcnJlIE1vcmVsIHdyb3Rl
OiAgCj4gPj4+PiBBbiBhcmNoaXRlY3R1cmUgcHJvdGVjdGluZyB0aGUgZ3Vlc3QgbWVtb3J5IGFn
YWluc3QgdW5hdXRob3JpemVkIGhvc3QKPiA+Pj4+IGFjY2VzcyBtYXkgd2FudCB0byBlbmZvcmNl
IFZJUlRJTyBJL08gZGV2aWNlIHByb3RlY3Rpb24gdGhyb3VnaCB0aGUKPiA+Pj4+IHVzZSBvZiBW
SVJUSU9fRl9JT01NVV9QTEFURk9STS4KPiA+Pj4+Cj4gPj4+PiBMZXQncyBnaXZlIGEgY2hhbmNl
IHRvIHRoZSBhcmNoaXRlY3R1cmUgdG8gYWNjZXB0IG9yIG5vdCBkZXZpY2VzCj4gPj4+PiB3aXRo
b3V0IFZJUlRJT19GX0lPTU1VX1BMQVRGT1JNLgo+ID4+Pj4KPiA+Pj4+IFNpZ25lZC1vZmYtYnk6
IFBpZXJyZSBNb3JlbCA8cG1vcmVsQGxpbnV4LmlibS5jb20+Cj4gPj4+PiBBY2tlZC1ieTogSmFz
b24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPiA+Pj4+IEFja2VkLWJ5OiBDaHJpc3RpYW4g
Qm9ybnRyYWVnZXIgPGJvcm50cmFlZ2VyQGRlLmlibS5jb20+Cj4gPj4+PiAtLS0KPiA+Pj4+IMKg
IGFyY2gvczM5MC9tbS9pbml0LmPCoMKgwqDCoCB8wqAgNiArKysrKysKPiA+Pj4+IMKgIGRyaXZl
cnMvdmlydGlvL3ZpcnRpby5jIHwgMjIgKysrKysrKysrKysrKysrKysrKysrKwo+ID4+Pj4gwqAg
aW5jbHVkZS9saW51eC92aXJ0aW8uaMKgIHzCoCAyICsrCj4gPj4+PiDCoCAzIGZpbGVzIGNoYW5n
ZWQsIDMwIGluc2VydGlvbnMoKykgIAo+ID4+ICAKPiA+Pj4+IEBAIC0xNzksNiArMTk0LDEzIEBA
IGludCB2aXJ0aW9fZmluYWxpemVfZmVhdHVyZXMoc3RydWN0IAo+ID4+Pj4gdmlydGlvX2Rldmlj
ZSAqZGV2KQo+ID4+Pj4gwqDCoMKgwqDCoCBpZiAoIXZpcnRpb19oYXNfZmVhdHVyZShkZXYsIFZJ
UlRJT19GX1ZFUlNJT05fMSkpCj4gPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4g
Pj4+PiArwqDCoMKgIGlmIChhcmNoX25lZWRzX3ZpcnRpb19pb21tdV9wbGF0Zm9ybShkZXYpICYm
Cj4gPj4+PiArwqDCoMKgwqDCoMKgwqAgIXZpcnRpb19oYXNfZmVhdHVyZShkZXYsIFZJUlRJT19G
X0lPTU1VX1BMQVRGT1JNKSkgewo+ID4+Pj4gK8KgwqDCoMKgwqDCoMKgIGRldl93YXJuKCZkZXYt
PmRldiwKPiA+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgInZpcnRpbzogZGV2aWNlIG11
c3QgcHJvdmlkZSBWSVJUSU9fRl9JT01NVV9QTEFURk9STVxuIik7Cj4gPj4+PiArwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIC1FTk9ERVY7Cj4gPj4+PiArwqDCoMKgIH0KPiA+Pj4+ICsKPiA+Pj4+IMKg
wqDCoMKgwqAgdmlydGlvX2FkZF9zdGF0dXMoZGV2LCBWSVJUSU9fQ09ORklHX1NfRkVBVFVSRVNf
T0spOwo+ID4+Pj4gwqDCoMKgwqDCoCBzdGF0dXMgPSBkZXYtPmNvbmZpZy0+Z2V0X3N0YXR1cyhk
ZXYpOwo+ID4+Pj4gwqDCoMKgwqDCoCBpZiAoIShzdGF0dXMgJiBWSVJUSU9fQ09ORklHX1NfRkVB
VFVSRVNfT0spKSB7ICAKPiA+Pj4KPiA+Pj4gV2VsbCBkb24ndCB5b3UgbmVlZCB0byBjaGVjayBp
dCAqYmVmb3JlKiBWSVJUSU9fRl9WRVJTSU9OXzEsIG5vdCBhZnRlcj8gIAo+ID4+Cj4gPj4gQnV0
IGl0J3Mgb25seSBhdmFpbGFibGUgd2l0aCBWRVJTSU9OXzEgYW55d2F5LCBpc24ndCBpdD8gU28g
aXQgcHJvYmFibHkKPiA+PiBhbHNvIG5lZWRzIHRvIGZhaWwgd2hlbiB0aGlzIGZlYXR1cmUgaXMg
bmVlZGVkIGlmIFZFUlNJT05fMSBoYXMgbm90IGJlZW4KPiA+PiBuZWdvdGlhdGVkLCBJIHRoaW5r
LiAgCj4gCj4gCj4gd291bGQgYmUgc29tZXRoaW5nIGxpa2U6Cj4gCj4gLSAgICAgICBpZiAoIXZp
cnRpb19oYXNfZmVhdHVyZShkZXYsIFZJUlRJT19GX1ZFUlNJT05fMSkpCj4gLSAgICAgICAgICAg
ICAgIHJldHVybiAwOwo+ICsgICAgICAgaWYgKCF2aXJ0aW9faGFzX2ZlYXR1cmUoZGV2LCBWSVJU
SU9fRl9WRVJTSU9OXzEpKSB7Cj4gKyAgICAgICAgICAgICAgIHJldCA9IGFyY2hfYWNjZXB0X3Zp
cnRpb19mZWF0dXJlcyhkZXYpOwo+ICsgICAgICAgICAgICAgICBpZiAocmV0KQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGRldl93YXJuKCZkZXYtPmRldiwKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAidmlydGlvOiBkZXZpY2UgbXVzdCBwcm92aWRlIAo+IFZJUlRJT19GX1ZF
UlNJT05fMVxuIik7Cj4gKyAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gKyAgICAgICB9CgpU
aGF0IGxvb2tzIHdyb25nOyBJIHRoaW5rIHdlIHdhbnQgdG8gdmFsaWRhdGUgaW4gYWxsIGNhc2Vz
LiBXaGF0IGFib3V0OgoKcmV0ID0gYXJjaF9hY2NlcHRfdmlydGlvX2ZlYXR1cmVzKGRldik7IC8v
IHRoaXMgY2FuIGluY2x1ZGUgY2hlY2tpbmcgZm9yCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAvLyBvbGRlciBvciBuZXdlciBmZWF0dXJlcwppZiAocmV0KQoJLy8gYXNz
dW1lIHRoYXQgdGhlIGFyY2ggY2FsbGJhY2sgbW9hbmVkIGFscmVhZHkKCXJldHVybiByZXQ7Cgpp
ZiAoIXZpcnRpb19oYXNfZmVhdHVyZShkZXYsIFZJUlRJT19GX1ZFUlNJT05fMSkpCglyZXR1cm4g
MDsKCi8vIGRvIHRoZSB2aXJ0aW8tMSBvbmx5IEZFQVRVUkVTX09LIGRhbmNlCgo+IAo+IAo+IGp1
c3QgYSB0aG91Z2h0IG9uIHRoZSBmdW5jdGlvbiBuYW1lOgo+IEl0IGJlY29tZXMgbW9yZSBnZW5l
cmFsIHRoYW4ganVzdCBJT01NVV9QTEFURk9STSByZWxhdGVkLgo+IAo+IFdoYXQgZG8geW91IHRo
aW5rIG9mOgo+IAo+IGFyY2hfYWNjZXB0X3ZpcnRpb19mZWF0dXJlcygpCgpPciBtYXliZSBhcmNo
X3ZhbGlkYXRlX3ZpcnRpb19mZWF0dXJlcygpPwoKPiAKPiA/Cj4gCj4gUmVnYXJkcywKPiBQaWVy
cmUKPiAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
ClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1m
b3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9s
aXN0aW5mby92aXJ0dWFsaXphdGlvbg==
