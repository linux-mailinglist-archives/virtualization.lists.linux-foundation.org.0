Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A136220966
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 12:04:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 77915226B0;
	Wed, 15 Jul 2020 10:04:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VDY7Ag3x8Dor; Wed, 15 Jul 2020 10:04:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 71E2C22264;
	Wed, 15 Jul 2020 10:04:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 42815C0733;
	Wed, 15 Jul 2020 10:04:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 98D76C0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 946F28AB93
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:04:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jrcbKZRdG9-t
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:04:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E74A38AB78
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594807468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=weZYbeSY39lus+MmvOlHiowxYixXEAHCQmjpqMFvj2c=;
 b=AnFWvOJYy2Y7Q9kBsdj6tOVsIanHzCyHLImjBAx53Osx8Y0bDK4YonmYnPgg09oqcLLdyg
 C54pxCejnwKg4wVsJS0FBWavxrHcCoLMmoXNYQdNCX+E70Qh0Mu7bheU0e2CsjJyvVx8wG
 V28JQdj6QTVvCZYToKHBYQbAKKiX7mk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-RWF5CGyTORe29C-CK25FGA-1; Wed, 15 Jul 2020 06:04:23 -0400
X-MC-Unique: RWF5CGyTORe29C-CK25FGA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A2F8800597;
 Wed, 15 Jul 2020 10:04:22 +0000 (UTC)
Received: from [10.72.13.230] (ovpn-13-230.pek2.redhat.com [10.72.13.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F55B5C1BD;
 Wed, 15 Jul 2020 10:04:13 +0000 (UTC)
Subject: Re: [PATCH 6/7] ifcvf: replace irq_request/free with helpers in vDPA
 core.
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1594565366-3195-1-git-send-email-lingshan.zhu@intel.com>
 <1594565366-3195-6-git-send-email-lingshan.zhu@intel.com>
 <c7d4eca1-b65a-b795-dfa6-fe7658716cb1@redhat.com>
 <f6fc09e2-7a45-aaa5-2b4a-f1f963c5ce2c@intel.com>
 <09e67c20-dda1-97a2-1858-6a543c64fba6@redhat.com>
 <20200715055538-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <eefc2969-c91e-059e-ed4a-20ce8fa6dfe9@redhat.com>
Date: Wed, 15 Jul 2020 18:04:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200715055538-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: wanpengli@tencent.com, kvm@vger.kernel.org, netdev@vger.kernel.org,
 sean.j.christopherson@intel.com, virtualization@lists.linux-foundation.org,
 pbonzini@redhat.com, "Zhu, Lingshan" <lingshan.zhu@intel.com>
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

Ck9uIDIwMjAvNy8xNSDkuIvljYg2OjAxLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
V2VkLCBKdWwgMTUsIDIwMjAgYXQgMDQ6NDA6MTdQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAyMC83LzEzIOS4i+WNiDY6MjIsIFpodSwgTGluZ3NoYW4gd3JvdGU6Cj4+PiBPbiA3
LzEzLzIwMjAgNDozMyBQTSwgSmFzb24gV2FuZyB3cm90ZToKPj4+PiBPbiAyMDIwLzcvMTIg5LiL
5Y2IMTA6NDksIFpodSBMaW5nc2hhbiB3cm90ZToKPj4+Pj4gVGhpcyBjb21taXQgcmVwbGFjZWQg
aXJxX3JlcXVlc3QvZnJlZSgpIHdpdGggaGVscGVycyBpbiB2RFBBCj4+Pj4+IGNvcmUsIHNvIHRo
YXQgaXQgY2FuIHJlcXVlc3QvZnJlZSBpcnEgYW5kIHNldHVwIGlycSBvZmZsb2FkaW5nCj4+Pj4+
IG9uIG9yZGVyLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBaaHUgTGluZ3NoYW48bGluZ3No
YW4uemh1QGludGVsLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+ICDCoCBkcml2ZXJzL3ZkcGEvaWZjdmYv
aWZjdmZfbWFpbi5jIHwgMTEgKysrKysrLS0tLS0KPj4+Pj4gIMKgIDEgZmlsZSBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5jCj4+Pj4+IGIvZHJpdmVycy92ZHBhL2lmY3Zm
L2lmY3ZmX21haW4uYwo+Pj4+PiBpbmRleCBmNWE2MGMxLi42NWI4NGUxIDEwMDY0NAo+Pj4+PiAt
LS0gYS9kcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5jCj4+Pj4+ICsrKyBiL2RyaXZlcnMv
dmRwYS9pZmN2Zi9pZmN2Zl9tYWluLmMKPj4+Pj4gQEAgLTQ3LDExICs0NywxMiBAQCBzdGF0aWMg
dm9pZCBpZmN2Zl9mcmVlX2lycShzdHJ1Y3QKPj4+Pj4gaWZjdmZfYWRhcHRlciAqYWRhcHRlciwg
aW50IHF1ZXVlcykKPj4+Pj4gIMKgIHsKPj4+Pj4gIMKgwqDCoMKgwqAgc3RydWN0IHBjaV9kZXYg
KnBkZXYgPSBhZGFwdGVyLT5wZGV2Owo+Pj4+PiAgwqDCoMKgwqDCoCBzdHJ1Y3QgaWZjdmZfaHcg
KnZmID0gJmFkYXB0ZXItPnZmOwo+Pj4+PiArwqDCoMKgIHN0cnVjdCB2ZHBhX2RldmljZSAqdmRw
YSA9ICZhZGFwdGVyLT52ZHBhOwo+Pj4+PiAgwqDCoMKgwqDCoCBpbnQgaTsKPj4+Pj4gIMKgIMKg
IMKgwqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IHF1ZXVlczsgaSsrKQo+Pj4+PiAtwqDCoMKgwqDC
oMKgwqAgZGV2bV9mcmVlX2lycSgmcGRldi0+ZGV2LCB2Zi0+dnJpbmdbaV0uaXJxLCAmdmYtPnZy
aW5nW2ldKTsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHZkcGFfZnJlZV92cV9pcnEoJnBkZXYtPmRl
diwgdmRwYSwgdmYtPnZyaW5nW2ldLmlycSwgaSwKPj4+Pj4gJnZmLT52cmluZ1tpXSk7Cj4+Pj4+
ICDCoCDCoMKgwqDCoMKgIGlmY3ZmX2ZyZWVfaXJxX3ZlY3RvcnMocGRldik7Cj4+Pj4+ICDCoCB9
Cj4+Pj4+IEBAIC02MCw2ICs2MSw3IEBAIHN0YXRpYyBpbnQgaWZjdmZfcmVxdWVzdF9pcnEoc3Ry
dWN0Cj4+Pj4+IGlmY3ZmX2FkYXB0ZXIgKmFkYXB0ZXIpCj4+Pj4+ICDCoCB7Cj4+Pj4+ICDCoMKg
wqDCoMKgIHN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gYWRhcHRlci0+cGRldjsKPj4+Pj4gIMKgwqDC
oMKgwqAgc3RydWN0IGlmY3ZmX2h3ICp2ZiA9ICZhZGFwdGVyLT52ZjsKPj4+Pj4gK8KgwqDCoCBz
dHJ1Y3QgdmRwYV9kZXZpY2UgKnZkcGEgPSAmYWRhcHRlci0+dmRwYTsKPj4+Pj4gIMKgwqDCoMKg
wqAgaW50IHZlY3RvciwgaSwgcmV0LCBpcnE7Cj4+Pj4+ICDCoCDCoMKgwqDCoMKgIHJldCA9IHBj
aV9hbGxvY19pcnFfdmVjdG9ycyhwZGV2LCBJRkNWRl9NQVhfSU5UUiwKPj4+Pj4gQEAgLTczLDYg
Kzc1LDcgQEAgc3RhdGljIGludCBpZmN2Zl9yZXF1ZXN0X2lycShzdHJ1Y3QKPj4+Pj4gaWZjdmZf
YWRhcHRlciAqYWRhcHRlcikKPj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBjaV9uYW1lKHBk
ZXYpKTsKPj4+Pj4gIMKgwqDCoMKgwqAgdmVjdG9yID0gMDsKPj4+Pj4gIMKgwqDCoMKgwqAgaXJx
ID0gcGNpX2lycV92ZWN0b3IocGRldiwgdmVjdG9yKTsKPj4+Pj4gK8KgwqDCoCAvKiBjb25maWcg
aW50ZXJydXB0ICovCj4+Pj4gVW5uZWNlc3NhcnkgY2hhbmdlcy4KPj4+IFRoaXMgaXMgdG8gc2hv
dyB3ZSBkaWQgbm90IHNldHVwIHRoaXMgaXJxIG9mZmxvYWRpbmcgZm9yIGNvbmZpZwo+Pj4gaW50
ZXJydXB0LCBvbmx5IHNldHVwIGlycSBvZmZsb2FkaW5nIGZvciBkYXRhIHZxLiBCdXQgY2FuIHJl
bW92ZSB0aGlzCj4+PiBzaW5jZSB3ZSBoYXZlIGNvbmZpZ19tc2l4X25hbWUgaW4gY29kZSB0byBz
aG93IHdoYXQgaXQgaXMKPj4gQnR3LCBhbnkgcmVhc29uIGZvciBub3QgbWFraW5nIGNvbmZpZyBp
bnRlcnJ1cHQgd29yayBmb3IgaXJxIG9mZmxvYWRpbmc/IEkKPj4gZG9uJ3Qgc2VlIGFueSB0aGlu
ZyB0aGF0IGJsb2NrcyB0aGlzLgo+Pgo+PiBUaGFua3MKPiBXZWxsIGNvbmZpZyBhY2Nlc3NlcyBh
bGwgZ28gdGhyb3VnaCB1c2Vyc3BhY2UgcmlnaHQ/Cj4gRG9pbmcgY29uZmlnIGludGVycnVwdCBk
aXJlY3RseSB3b3VsZCBqdXN0IGJlIG1lc3N5IC4uLgoKClJpZ2h0LCBzbyBJIHRoaW5rIHdlIG5l
ZWQgYSBiZXR0ZXIgY29tbWVudCBoZXJlLgoKVGhhbmtzCgoKPgo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxp
c3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0
cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
