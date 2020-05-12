Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6774E1CEC88
	for <lists.virtualization@lfdr.de>; Tue, 12 May 2020 07:51:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 164FB88550;
	Tue, 12 May 2020 05:51:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H6conapebJbY; Tue, 12 May 2020 05:51:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 309F18844B;
	Tue, 12 May 2020 05:51:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1028FC016F;
	Tue, 12 May 2020 05:51:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76024C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 May 2020 05:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5DE8D88415
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 May 2020 05:51:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1mIiGSxlOYW4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 May 2020 05:51:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4E5BD8840C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 May 2020 05:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589262697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x/cVjxQ0JMstZElAHAVEHp9fs0uKy63dNO0knF8a+TY=;
 b=TrVwEgKs5S8NLd7ItNWnjxua50X4CKXHUpuBGA2hd74GDXRO4FTZtDoStpEwV+bAZdRFBc
 LdXKnHm0eSr2VAfP5Q6vZ0qoaP5wt+nm/3yNC8WP9t/QsIcvynzFoPet0kEQCgOGNKyzAD
 qh9KJTiew+Xp4vKptpj8e7DDLU2ag8k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-zRaLtNK4OEuDBvfkmqU5wg-1; Tue, 12 May 2020 01:51:34 -0400
X-MC-Unique: zRaLtNK4OEuDBvfkmqU5wg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62D808005B7;
 Tue, 12 May 2020 05:51:33 +0000 (UTC)
Received: from [10.72.13.96] (ovpn-13-96.pek2.redhat.com [10.72.13.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2838738F;
 Tue, 12 May 2020 05:51:26 +0000 (UTC)
Subject: Re: [PATCH] ifcvf: move IRQ request/free to status change handlers
From: Jason Wang <jasowang@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, mst@redhat.com,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <1589181563-38400-1-git-send-email-lingshan.zhu@intel.com>
 <22d9dcdb-e790-0a68-ba41-b9530b2bf9fd@redhat.com>
 <0f822630-14ad-e0cd-4171-6213c30f0799@intel.com>
 <24d5875e-6f44-ce43-74f0-e641e02f8f42@redhat.com>
Message-ID: <47713210-e9d9-d185-6e2e-433e2c436de9@redhat.com>
Date: Tue, 12 May 2020 13:51:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <24d5875e-6f44-ce43-74f0-e641e02f8f42@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

Ck9uIDIwMjAvNS8xMiDkuIrljYgxMTozOCwgSmFzb24gV2FuZyB3cm90ZToKPj4+Pgo+Pj4+IMKg
IHN0YXRpYyBpbnQgaWZjdmZfc3RhcnRfZGF0YXBhdGgodm9pZCAqcHJpdmF0ZSkKPj4+PiDCoCB7
Cj4+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgaWZjdmZfaHcgKnZmID0gaWZjdmZfcHJpdmF0ZV90b192
Zihwcml2YXRlKTsKPj4+PiBAQCAtMTE4LDkgKzE3MiwxMiBAQCBzdGF0aWMgdm9pZCBpZmN2Zl92
ZHBhX3NldF9zdGF0dXMoc3RydWN0IAo+Pj4+IHZkcGFfZGV2aWNlICp2ZHBhX2RldiwgdTggc3Rh
dHVzKQo+Pj4+IMKgIHsKPj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBpZmN2Zl9hZGFwdGVyICphZGFw
dGVyOwo+Pj4+IMKgwqDCoMKgwqAgc3RydWN0IGlmY3ZmX2h3ICp2ZjsKPj4+PiArwqDCoMKgIHU4
IHN0YXR1c19vbGQ7Cj4+Pj4gK8KgwqDCoCBpbnQgcmV0Owo+Pj4+IMKgIMKgwqDCoMKgwqAgdmbC
oCA9IHZkcGFfdG9fdmYodmRwYV9kZXYpOwo+Pj4+IMKgwqDCoMKgwqAgYWRhcHRlciA9IGRldl9n
ZXRfZHJ2ZGF0YSh2ZHBhX2Rldi0+ZGV2LnBhcmVudCk7Cj4+Pj4gK8KgwqDCoCBzdGF0dXNfb2xk
ID0gaWZjdmZfZ2V0X3N0YXR1cyh2Zik7Cj4+Pj4gwqAgwqDCoMKgwqDCoCBpZiAoc3RhdHVzID09
IDApIHsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWZjdmZfc3RvcF9kYXRhcGF0aChhZGFwdGVy
KTsKPj4+PiBAQCAtMTI4LDcgKzE4NSwyMiBAQCBzdGF0aWMgdm9pZCBpZmN2Zl92ZHBhX3NldF9z
dGF0dXMoc3RydWN0IAo+Pj4+IHZkcGFfZGV2aWNlICp2ZHBhX2RldiwgdTggc3RhdHVzKQo+Pj4+
IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm47Cj4+Pj4gwqDCoMKgwqDCoCB9Cj4+Pj4gwqAgLcKg
wqDCoCBpZiAoc3RhdHVzICYgVklSVElPX0NPTkZJR19TX0RSSVZFUl9PSykgewo+Pj4+ICvCoMKg
wqAgaWYgKChzdGF0dXNfb2xkICYgVklSVElPX0NPTkZJR19TX0RSSVZFUl9PSykgJiYKPj4+PiAr
wqDCoMKgwqDCoMKgwqAgIShzdGF0dXMgJiBWSVJUSU9fQ09ORklHX1NfRFJJVkVSX09LKSkgewo+
Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZmN2Zl9zdG9wX2RhdGFwYXRoKGFkYXB0ZXIpOwo+Pj4+ICvC
oMKgwqDCoMKgwqDCoCBpZmN2Zl9mcmVlX2lycShhZGFwdGVyLCBJRkNWRl9NQVhfUVVFVUVfUEFJ
UlMgKiAyKTsKPj4+PiArwqDCoMKgIH0KPj4+PiArCj4+Pj4gK8KgwqDCoCBpZiAoKHN0YXR1cyAm
IFZJUlRJT19DT05GSUdfU19EUklWRVJfT0spICYmCj4+Pj4gK8KgwqDCoMKgwqDCoMKgICEoc3Rh
dHVzX29sZCAmIFZJUlRJT19DT05GSUdfU19EUklWRVJfT0spKSB7Cj4+Pj4gK8KgwqDCoMKgwqDC
oMKgIHJldCA9IGlmY3ZmX3JlcXVlc3RfaXJxKGFkYXB0ZXIpOwo+Pj4+ICvCoMKgwqDCoMKgwqDC
oCBpZiAocmV0KSB7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RhdHVzID0gaWZjdmZf
Z2V0X3N0YXR1cyh2Zik7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RhdHVzIHw9IFZJ
UlRJT19DT05GSUdfU19GQUlMRUQ7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWZjdmZf
c2V0X3N0YXR1cyh2Ziwgc3RhdHVzKTsKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1
cm47Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4+PiArCj4+Pgo+Pj4KPj4+IEhhdmUgYSBoYXJk
IHRob3VnaCBvbiB0aGUgbG9naWMgaGVyZS4KPj4+Cj4+PiBUaGlzIGRlcGVuZHMgb24gdGhlIHN0
YXR1cyBzZXR0aW5nIGZyb20gZ3Vlc3Qgb3IgdXNlcnNwYWNlLiBXaGljaCAKPj4+IG1lYW5zIGl0
IGNhbiBub3QgZGVhbCB3aXRoIGUuZyB3aGVuIHFlbXUgb3IgdXNlcnNwYWNlIGlzIGNyYXNoZWQ/
IERvIAo+Pj4gd2UgbmVlZCB0byBjYXJlIHRoaXMgb3IgaXQncyBhIG92ZXIgZW5naW5lZXJpbmc/
Cj4+Pgo+Pj4gVGhhbmtzCj4+IElmIHFlbXUgY3Jhc2gsIEkgZ3Vlc3MgdXNlcnMgbWF5IHJlLXJ1
biBxbWV1IC8gcmUtaW5pdGlhbGl6ZSB0aGUgCj4+IGRldmljZSwgYWNjb3JkaW5nIHRvIHRoZSBz
cGVjLCB0aGVyZSBzaG91bGQgYmUgYSByZXNldCByb3V0aW5lLgo+PiBUaGlzIGNvZGUgcGllY2Ug
aGFuZGxlcyBzdGF0dXMgY2hhbmdlIG9uIERSSVZFUl9PSyBmbGlwcGluZy4gSSBhbSBub3QgCj4+
IHN1cmUgSSBnZXQgeW91ciBwb2ludCwgbWluZCB0byBnaXZlIG1vcmUgaGludHM/Cj4KPgo+IFRo
ZSBwcm9ibGVtIGlzIGlmIHdlIGRvbid0IGxhdW5jaCBuZXcgcWVtdSBpbnN0YW5jZSwgdGhlIGlu
dGVycnVwdCAKPiB3aWxsIGJlIHN0aWxsIHRoZXJlPwoKCk9rLCB3ZSByZXNldCBvbiB2aG9zdF92
ZHBhX3JlbGVhc2UoKSBzbyB0aGUgZm9sbG93aW5nIGlzIHN1c3BpY2lvdXM6CgpXaXRoIHRoZSBw
YXRjaCwgd2UgZG86CgpzdGF0aWMgdm9pZCBpZmN2Zl92ZHBhX3NldF9zdGF0dXMoc3RydWN0IHZk
cGFfZGV2aWNlICp2ZHBhX2RldiwgdTggc3RhdHVzKQp7CiDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qg
aWZjdmZfYWRhcHRlciAqYWRhcHRlcjsKIMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBpZmN2Zl9odyAq
dmY7CiDCoMKgwqDCoMKgwqDCoCB1OCBzdGF0dXNfb2xkOwogwqDCoMKgwqDCoMKgwqAgaW50IHJl
dDsKCiDCoMKgwqDCoMKgwqDCoCB2ZsKgID0gdmRwYV90b192Zih2ZHBhX2Rldik7CiDCoMKgwqDC
oMKgwqDCoCBhZGFwdGVyID0gZGV2X2dldF9kcnZkYXRhKHZkcGFfZGV2LT5kZXYucGFyZW50KTsK
IMKgwqDCoMKgwqDCoMKgIHN0YXR1c19vbGQgPSBpZmN2Zl9nZXRfc3RhdHVzKHZmKTsKCiDCoMKg
wqDCoMKgwqDCoCBpZiAoc3RhdHVzID09IDApIHsKIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBpZmN2Zl9zdG9wX2RhdGFwYXRoKGFkYXB0ZXIpOwogwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGlmY3ZmX3Jlc2V0X3ZyaW5nKGFkYXB0ZXIpOwogwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHJldHVybjsKIMKgwqDCoMKgwqDCoMKgIH0KCiDCoMKgwqDCoMKgwqDCoCBp
ZiAoKHN0YXR1c19vbGQgJiBWSVJUSU9fQ09ORklHX1NfRFJJVkVSX09LKSAmJgogwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAhKHN0YXR1cyAmIFZJUlRJT19DT05GSUdfU19EUklWRVJfT0spKSB7CiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWZjdmZfc3RvcF9kYXRhcGF0aChhZGFwdGVy
KTsKIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZmN2Zl9mcmVlX2lycShhZGFwdGVy
LCBJRkNWRl9NQVhfUVVFVUVfUEFJUlMgKiAyKTsKIMKgwqDCoMKgwqDCoMKgIH0KCi4uLgoKU28g
dGhlIGhhbmRsaW5nIG9mIHN0YXR1cyA9PSAwIGxvb2tzIHdyb25nLgoKVGhlIE9LIC0+ICFPSyBj
aGVjayBzaG91bGQgYWxyZWFkeSBjb3ZlciB0aGUgZGF0YXBhdGggc3RvcHBpbmcgYW5kIGlycSAK
c3R1ZmZzLgoKV2Ugb25seSBuZWVkIHRvIGRlYWwgd2l0aCB2cmluZyByZXNldCBhbmQgb25seSBu
ZWVkIHRvIGRvIGl0IGFmdGVyIHdlIApzdG9wIHRoZSBkYXRhcGF0aC9pcnEgc3R1ZmZzLgoKVGhh
bmtzCgoKCj4KPiBUaGFua3MgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlz
dHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3Jn
L21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
