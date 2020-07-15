Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B747220792
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 10:40:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DEC5E8AE08;
	Wed, 15 Jul 2020 08:40:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JXMp884Bk9-0; Wed, 15 Jul 2020 08:40:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F2DBD8AE04;
	Wed, 15 Jul 2020 08:40:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C69E9C0733;
	Wed, 15 Jul 2020 08:40:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3FA18C0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 08:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 34AE38AA2E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 08:40:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SZsV8BxPnypf
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 08:40:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CC61F89D1B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 08:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594802434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/F7UB0C20VNqw+FeXrj3A9Z7I7KbYpRyx/C6DjbnOzc=;
 b=Q3FnEqywEU8RdMNsW7Yr4SsSZbTX4gRLH9Cq62Stiedz/UC+jjbIHW5rUGwxZNbYg43rba
 ebZK6ehpPmOJ4J4RiyPGus22UuL37whOnBZPR3kUAmQ4k+qu/fluAaMsujPmG59cFTo6Qg
 KH/dhLPDyw81ne2TprKJLMrt5A/wI8Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-O8TVwaXDN4uNsMsEh9Ji-w-1; Wed, 15 Jul 2020 04:40:30 -0400
X-MC-Unique: O8TVwaXDN4uNsMsEh9Ji-w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C046410CE780;
 Wed, 15 Jul 2020 08:40:28 +0000 (UTC)
Received: from [10.72.13.230] (ovpn-13-230.pek2.redhat.com [10.72.13.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A7B372E63;
 Wed, 15 Jul 2020 08:40:18 +0000 (UTC)
Subject: Re: [PATCH 6/7] ifcvf: replace irq_request/free with helpers in vDPA
 core.
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, mst@redhat.com,
 alex.williamson@redhat.com, pbonzini@redhat.com,
 sean.j.christopherson@intel.com, wanpengli@tencent.com
References: <1594565366-3195-1-git-send-email-lingshan.zhu@intel.com>
 <1594565366-3195-6-git-send-email-lingshan.zhu@intel.com>
 <c7d4eca1-b65a-b795-dfa6-fe7658716cb1@redhat.com>
 <f6fc09e2-7a45-aaa5-2b4a-f1f963c5ce2c@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <09e67c20-dda1-97a2-1858-6a543c64fba6@redhat.com>
Date: Wed, 15 Jul 2020 16:40:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f6fc09e2-7a45-aaa5-2b4a-f1f963c5ce2c@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: netdev@vger.kernel.org, kvm@vger.kernel.org,
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

Ck9uIDIwMjAvNy8xMyDkuIvljYg2OjIyLCBaaHUsIExpbmdzaGFuIHdyb3RlOgo+Cj4KPiBPbiA3
LzEzLzIwMjAgNDozMyBQTSwgSmFzb24gV2FuZyB3cm90ZToKPj4KPj4gT24gMjAyMC83LzEyIOS4
i+WNiDEwOjQ5LCBaaHUgTGluZ3NoYW4gd3JvdGU6Cj4+PiBUaGlzIGNvbW1pdCByZXBsYWNlZCBp
cnFfcmVxdWVzdC9mcmVlKCkgd2l0aCBoZWxwZXJzIGluIHZEUEEKPj4+IGNvcmUsIHNvIHRoYXQg
aXQgY2FuIHJlcXVlc3QvZnJlZSBpcnEgYW5kIHNldHVwIGlycSBvZmZsb2FkaW5nCj4+PiBvbiBv
cmRlci4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBaaHUgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBp
bnRlbC5jb20+Cj4+PiAtLS0KPj4+IMKgIGRyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9tYWluLmMg
fCAxMSArKysrKystLS0tLQo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwg
NSBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZHBhL2lmY3ZmL2lm
Y3ZmX21haW4uYyAKPj4+IGIvZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYwo+Pj4gaW5k
ZXggZjVhNjBjMS4uNjViODRlMSAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvdmRwYS9pZmN2Zi9p
ZmN2Zl9tYWluLmMKPj4+ICsrKyBiL2RyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9tYWluLmMKPj4+
IEBAIC00NywxMSArNDcsMTIgQEAgc3RhdGljIHZvaWQgaWZjdmZfZnJlZV9pcnEoc3RydWN0IGlm
Y3ZmX2FkYXB0ZXIgCj4+PiAqYWRhcHRlciwgaW50IHF1ZXVlcykKPj4+IMKgIHsKPj4+IMKgwqDC
oMKgwqAgc3RydWN0IHBjaV9kZXYgKnBkZXYgPSBhZGFwdGVyLT5wZGV2Owo+Pj4gwqDCoMKgwqDC
oCBzdHJ1Y3QgaWZjdmZfaHcgKnZmID0gJmFkYXB0ZXItPnZmOwo+Pj4gK8KgwqDCoCBzdHJ1Y3Qg
dmRwYV9kZXZpY2UgKnZkcGEgPSAmYWRhcHRlci0+dmRwYTsKPj4+IMKgwqDCoMKgwqAgaW50IGk7
Cj4+PiDCoCDCoCDCoMKgwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBxdWV1ZXM7IGkrKykKPj4+IC3C
oMKgwqDCoMKgwqDCoCBkZXZtX2ZyZWVfaXJxKCZwZGV2LT5kZXYsIHZmLT52cmluZ1tpXS5pcnEs
ICZ2Zi0+dnJpbmdbaV0pOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIHZkcGFfZnJlZV92cV9pcnEoJnBk
ZXYtPmRldiwgdmRwYSwgdmYtPnZyaW5nW2ldLmlycSwgaSwgCj4+PiAmdmYtPnZyaW5nW2ldKTsK
Pj4+IMKgIMKgwqDCoMKgwqAgaWZjdmZfZnJlZV9pcnFfdmVjdG9ycyhwZGV2KTsKPj4+IMKgIH0K
Pj4+IEBAIC02MCw2ICs2MSw3IEBAIHN0YXRpYyBpbnQgaWZjdmZfcmVxdWVzdF9pcnEoc3RydWN0
IGlmY3ZmX2FkYXB0ZXIgCj4+PiAqYWRhcHRlcikKPj4+IMKgIHsKPj4+IMKgwqDCoMKgwqAgc3Ry
dWN0IHBjaV9kZXYgKnBkZXYgPSBhZGFwdGVyLT5wZGV2Owo+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3Qg
aWZjdmZfaHcgKnZmID0gJmFkYXB0ZXItPnZmOwo+Pj4gK8KgwqDCoCBzdHJ1Y3QgdmRwYV9kZXZp
Y2UgKnZkcGEgPSAmYWRhcHRlci0+dmRwYTsKPj4+IMKgwqDCoMKgwqAgaW50IHZlY3RvciwgaSwg
cmV0LCBpcnE7Cj4+PiDCoCDCoMKgwqDCoMKgIHJldCA9IHBjaV9hbGxvY19pcnFfdmVjdG9ycyhw
ZGV2LCBJRkNWRl9NQVhfSU5UUiwKPj4+IEBAIC03Myw2ICs3NSw3IEBAIHN0YXRpYyBpbnQgaWZj
dmZfcmVxdWVzdF9pcnEoc3RydWN0IGlmY3ZmX2FkYXB0ZXIgCj4+PiAqYWRhcHRlcikKPj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHBjaV9uYW1lKHBkZXYpKTsKPj4+IMKgwqDCoMKgwqAgdmVjdG9y
ID0gMDsKPj4+IMKgwqDCoMKgwqAgaXJxID0gcGNpX2lycV92ZWN0b3IocGRldiwgdmVjdG9yKTsK
Pj4+ICvCoMKgwqAgLyogY29uZmlnIGludGVycnVwdCAqLwo+Pgo+Pgo+PiBVbm5lY2Vzc2FyeSBj
aGFuZ2VzLgo+IFRoaXMgaXMgdG8gc2hvdyB3ZSBkaWQgbm90IHNldHVwIHRoaXMgaXJxIG9mZmxv
YWRpbmcgZm9yIGNvbmZpZyAKPiBpbnRlcnJ1cHQsIG9ubHkgc2V0dXAgaXJxIG9mZmxvYWRpbmcg
Zm9yIGRhdGEgdnEuIEJ1dCBjYW4gcmVtb3ZlIHRoaXMgCj4gc2luY2Ugd2UgaGF2ZSBjb25maWdf
bXNpeF9uYW1lIGluIGNvZGUgdG8gc2hvdyB3aGF0IGl0IGlzCgoKQnR3LCBhbnkgcmVhc29uIGZv
ciBub3QgbWFraW5nIGNvbmZpZyBpbnRlcnJ1cHQgd29yayBmb3IgaXJxIG9mZmxvYWRpbmc/IApJ
IGRvbid0IHNlZSBhbnkgdGhpbmcgdGhhdCBibG9ja3MgdGhpcy4KClRoYW5rcwoKCj4gVGhhbmtz
IEJSIFpodSBMaW5nc2hhbgo+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxp
c3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
