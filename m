Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF2B22082B
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 11:06:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CB1402044C;
	Wed, 15 Jul 2020 09:06:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2IDyk4d6WG7C; Wed, 15 Jul 2020 09:06:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1B06220459;
	Wed, 15 Jul 2020 09:06:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CAB9BC0733;
	Wed, 15 Jul 2020 09:06:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DBAD1C0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B50AA20457
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:06:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TTOCznpUpVeb
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:06:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id C4A992044C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594804011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CkT/mfOztj7MXzinVB5YZHkTYz0nQ/PoAvfbNJ/41g4=;
 b=FZw5vcMzqAEqgTKRv6K9HRq7ey4GojczCebM6X/8VWldX5MLz57RWfN7Y6OdHtMdwbX2NS
 QPVvmsNixl0ebCnIESUgDrT3SevJq60X/xWBC3tYFM1cYfRZTerGwp5XKRNUOKS7pnkH1/
 N8SmoBtoFLm2z4EHRhvhkXPxhc0Uqo8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-_nHiHvUkObuB9D03Lhv-BA-1; Wed, 15 Jul 2020 05:06:50 -0400
X-MC-Unique: _nHiHvUkObuB9D03Lhv-BA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65C5B1087;
 Wed, 15 Jul 2020 09:06:48 +0000 (UTC)
Received: from [10.72.13.230] (ovpn-13-230.pek2.redhat.com [10.72.13.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C1EAA74F71;
 Wed, 15 Jul 2020 09:06:38 +0000 (UTC)
Subject: Re: [PATCH 3/7] vhost_vdpa: implement IRQ offloading functions in
 vhost_vdpa
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, mst@redhat.com,
 alex.williamson@redhat.com, pbonzini@redhat.com,
 sean.j.christopherson@intel.com, wanpengli@tencent.com
References: <1594565366-3195-1-git-send-email-lingshan.zhu@intel.com>
 <1594565366-3195-3-git-send-email-lingshan.zhu@intel.com>
 <3fb9ecfc-a325-69b5-f5b7-476a5683a324@redhat.com>
 <e06f9706-441f-0d7a-c8c0-cd43a26c5296@intel.com>
 <f352a1d1-6732-3237-c85e-ffca085195ff@redhat.com>
 <8f52ee3a-7a08-db14-9194-8085432481a4@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <2bd946e3-1524-efa5-df2b-3f6da66d2069@redhat.com>
Date: Wed, 15 Jul 2020 17:06:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8f52ee3a-7a08-db14-9194-8085432481a4@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

Ck9uIDIwMjAvNy8xNSDkuIvljYg0OjU2LCBaaHUsIExpbmdzaGFuIHdyb3RlOgo+Cj4KPiBPbiA3
LzE1LzIwMjAgNDo1MSBQTSwgSmFzb24gV2FuZyB3cm90ZToKPj4KPj4gT24gMjAyMC83LzEzIOS4
i+WNiDU6NDcsIFpodSwgTGluZ3NoYW4gd3JvdGU6Cj4+Pgo+Pj4KPj4+IE9uIDcvMTMvMjAyMCA0
OjIyIFBNLCBKYXNvbiBXYW5nIHdyb3RlOgo+Pj4+Cj4+Pj4gT24gMjAyMC83LzEyIOS4i+WNiDEw
OjQ5LCBaaHUgTGluZ3NoYW4gd3JvdGU6Cj4+Pj4+IFRoaXMgcGF0Y2ggaW50cm9kdWNlIGEgc2V0
IG9mIGZ1bmN0aW9ucyBmb3Igc2V0dXAvdW5zZXR1cAo+Pj4+PiBhbmQgdXBkYXRlIGlycSBvZmZs
b2FkaW5nIHJlc3BlY3RpdmVseSBieSByZWdpc3Rlci91bnJlZ2lzdGVyCj4+Pj4+IGFuZCByZS1y
ZWdpc3RlciB0aGUgaXJxX2J5cGFzc19wcm9kdWNlci4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1i
eTogWmh1IExpbmdzaGFuIDxsaW5nc2hhbi56aHVAaW50ZWwuY29tPgo+Pj4+PiAtLS0KPj4+Pj4g
wqAgZHJpdmVycy92aG9zdC92ZHBhLmMgfCA2OSAKPj4+Pj4gKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwg
NjkgaW5zZXJ0aW9ucygrKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC92
ZHBhLmMgYi9kcml2ZXJzL3Zob3N0L3ZkcGEuYwo+Pj4+PiBpbmRleCAyZmNjNDIyLi45MjY4M2U0
IDEwMDY0NAo+Pj4+PiAtLS0gYS9kcml2ZXJzL3Zob3N0L3ZkcGEuYwo+Pj4+PiArKysgYi9kcml2
ZXJzL3Zob3N0L3ZkcGEuYwo+Pj4+PiBAQCAtMTE1LDYgKzExNSw2MyBAQCBzdGF0aWMgaXJxcmV0
dXJuX3Qgdmhvc3RfdmRwYV9jb25maWdfY2Iodm9pZCAKPj4+Pj4gKnByaXZhdGUpCj4+Pj4+IMKg
wqDCoMKgwqAgcmV0dXJuIElSUV9IQU5ETEVEOwo+Pj4+PiDCoCB9Cj4+Pj4+IMKgICtzdGF0aWMg
dm9pZCB2aG9zdF92ZHBhX3NldHVwX3ZxX2lycShzdHJ1Y3QgdmRwYV9kZXZpY2UgKmRldiwgCj4+
Pj4+IGludCBxaWQsIGludCBpcnEpCj4+Pj4+ICt7Cj4+Pj4+ICvCoMKgwqAgc3RydWN0IHZob3N0
X3ZkcGEgKnYgPSB2ZHBhX2dldF9kcnZkYXRhKGRldik7Cj4+Pj4+ICvCoMKgwqAgc3RydWN0IHZo
b3N0X3ZpcnRxdWV1ZSAqdnEgPSAmdi0+dnFzW3FpZF07Cj4+Pj4+ICvCoMKgwqAgaW50IHJldDsK
Pj4+Pj4gKwo+Pj4+PiArwqDCoMKgIHZxX2Vycih2cSwgInNldHVwIGlycSBieXBhc3MgZm9yIHZx
ICVkIHdpdGggaXJxID0gJWRcbiIsIHFpZCwgCj4+Pj4+IGlycSk7Cj4+Pj4+ICvCoMKgwqAgc3Bp
bl9sb2NrKCZ2cS0+Y2FsbF9jdHguY3R4X2xvY2spOwo+Pj4+PiArwqDCoMKgIGlmICghdnEtPmNh
bGxfY3R4LmN0eCkKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybjsKPj4+Pj4gKwo+Pj4+PiAr
wqDCoMKgIHZxLT5jYWxsX2N0eC5wcm9kdWNlci50b2tlbiA9IHZxLT5jYWxsX2N0eC5jdHg7Cj4+
Pj4+ICvCoMKgwqAgdnEtPmNhbGxfY3R4LnByb2R1Y2VyLmlycSA9IGlycTsKPj4+Pj4gK8KgwqDC
oCByZXQgPSBpcnFfYnlwYXNzX3JlZ2lzdGVyX3Byb2R1Y2VyKCZ2cS0+Y2FsbF9jdHgucHJvZHVj
ZXIpOwo+Pj4+PiArwqDCoMKgIHNwaW5fdW5sb2NrKCZ2cS0+Y2FsbF9jdHguY3R4X2xvY2spOwo+
Pj4+PiArCj4+Pj4+ICvCoMKgwqAgaWYgKHVubGlrZWx5KHJldCkpCj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoCB2cV9lcnIodnEsCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAiaXJxIGJ5cGFzcyBwcm9kdWNl
ciAodG9rZW4gJXAgcmVnaXN0cmF0aW9uIGZhaWxzOiAlZFxuIiwKPj4+Pj4gK8KgwqDCoMKgwqDC
oMKgIHZxLT5jYWxsX2N0eC5wcm9kdWNlci50b2tlbiwgcmV0KTsKPj4+Pgo+Pj4+Cj4+Pj4gTm90
IHN1cmUgdGhpcyBkZXNlcnZlcyBhIHZxX2VycigpLCBpcnEgd2lsbCBiZSByZWxheWVkIHRocm91
Z2ggCj4+Pj4gZXZlbnRmZCBpZiBpcnEgYnlwYXNzIG1hbmFnZXIgY2FuJ3Qgd29yay4KPj4+IE9L
LCBJIHNlZSB2cV9lcnIoKSB3aWxsIGV2ZW50ZmRfc2lnbmFsIGVycl9jdHggdGhhbiBqdXN0IHBy
aW50IGEgCj4+PiBtZXNzYWdlLCB3aWxsIHJlbW92ZSBhbGwgdnFfZXJyKCkuCj4+Pj4KPj4+Pgo+
Pj4+PiArfQo+Pj4+PiArCj4+Pj4+ICtzdGF0aWMgdm9pZCB2aG9zdF92ZHBhX3Vuc2V0dXBfdnFf
aXJxKHN0cnVjdCB2ZHBhX2RldmljZSAqZGV2LCAKPj4+Pj4gaW50IHFpZCkKPj4+Pj4gK3sKPj4+
Pj4gK8KgwqDCoCBzdHJ1Y3Qgdmhvc3RfdmRwYSAqdiA9IHZkcGFfZ2V0X2RydmRhdGEoZGV2KTsK
Pj4+Pj4gK8KgwqDCoCBzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cSA9ICZ2LT52cXNbcWlkXTsK
Pj4+Pj4gKwo+Pj4+PiArwqDCoMKgIHNwaW5fbG9jaygmdnEtPmNhbGxfY3R4LmN0eF9sb2NrKTsK
Pj4+Pj4gKyBpcnFfYnlwYXNzX3VucmVnaXN0ZXJfcHJvZHVjZXIoJnZxLT5jYWxsX2N0eC5wcm9k
dWNlcik7Cj4+Pj4+ICvCoMKgwqAgc3Bpbl91bmxvY2soJnZxLT5jYWxsX2N0eC5jdHhfbG9jayk7
Cj4+Pj4+ICsKPj4+Pj4gK8KgwqDCoCB2cV9lcnIodnEsICJ1bnNldHVwIGlycSBieXBhc3MgZm9y
IHZxICVkXG4iLCBxaWQpOwo+Pj4+Cj4+Pj4KPj4+PiBXaHkgY2FsbCB2cV9lcnIoKSBoZXJlPwo+
Pj4+Cj4+Pj4KPj4+Pj4gK30KPj4+Pj4gKwo+Pj4+PiArc3RhdGljIHZvaWQgdmhvc3RfdmRwYV91
cGRhdGVfdnFfaXJxKHN0cnVjdCB2aG9zdF92aXJ0cXVldWUgKnZxKQo+Pj4+PiArewo+Pj4+PiAr
wqDCoMKgIHN0cnVjdCBldmVudGZkX2N0eCAqY3R4Owo+Pj4+PiArwqDCoMKgIHZvaWQgKnRva2Vu
Owo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgc3Bpbl9sb2NrKCZ2cS0+Y2FsbF9jdHguY3R4X2xvY2sp
Owo+Pj4+PiArwqDCoMKgIGN0eCA9IHZxLT5jYWxsX2N0eC5jdHg7Cj4+Pj4+ICvCoMKgwqAgdG9r
ZW4gPSB2cS0+Y2FsbF9jdHgucHJvZHVjZXIudG9rZW47Cj4+Pj4+ICvCoMKgwqAgaWYgKGN0eCA9
PSB0b2tlbikKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybjsKPj4+Pgo+Pj4+Cj4+Pj4gTmVl
ZCBkbyB1bmxvY2sgaGVyZS4KPj4+IHN1cmUhCj4+Pj4KPj4+Pgo+Pj4+PiArCj4+Pj4+ICvCoMKg
wqAgaWYgKCFjdHggJiYgdG9rZW4pCj4+Pj4+ICsgaXJxX2J5cGFzc191bnJlZ2lzdGVyX3Byb2R1
Y2VyKCZ2cS0+Y2FsbF9jdHgucHJvZHVjZXIpOwo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgaWYgKGN0
eCAmJiBjdHggIT0gdG9rZW4pIHsKPj4+Pj4gKyBpcnFfYnlwYXNzX3VucmVnaXN0ZXJfcHJvZHVj
ZXIoJnZxLT5jYWxsX2N0eC5wcm9kdWNlcik7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCB2cS0+Y2Fs
bF9jdHgucHJvZHVjZXIudG9rZW4gPSBjdHg7Cj4+Pj4+ICsgaXJxX2J5cGFzc19yZWdpc3Rlcl9w
cm9kdWNlcigmdnEtPmNhbGxfY3R4LnByb2R1Y2VyKTsKPj4+Pj4gK8KgwqDCoCB9Cj4+Pj4+ICsK
Pj4+Pj4gK8KgwqDCoCBzcGluX3VubG9jaygmdnEtPmNhbGxfY3R4LmN0eF9sb2NrKTsKPj4+Pgo+
Pj4+Cj4+Pj4gVGhpcyBzaG91bGQgYmUgcmFyZSBzbyBJJ2QgdXNlIHNpbXBsZSBjb2RlcyBqdXN0
IGRvIHVucmVnaXN0ZXIgYW5kIAo+Pj4+IHJlZ2lzdGVyLgo+Pj4KPj4+IGRvIHlvdSBtZWFuIHJl
bW92ZSAiaWYgKGN0eCAmJiBjdHggIT0gdG9rZW4pIj8gSSB0aGluayB0aGlzIGNvdWxkIGJlIAo+
Pj4gdXNlZnVsLCB3ZSBzaG91bGQgb25seSB1cGRhdGUgaXQgd2hlbiBjdHghPU5VTEwgYW5kIGN0
eCE9IGV4aXN0aW5nIAo+Pj4gdG9rZW4uCj4+Pgo+Pgo+PiBJIG1lYW50IHNvbWV0aGluZyBsaWtl
Ogo+Pgo+PiB1bnJlZ2lzdGVyKCk7Cj4+IHZxLT5jYWxsX2N0eC5wcm9kdWNlci50b2tlbiA9IGN0
eDsKPj4gcmVnaXN0ZXIoKTsKPiBUaGlzIGlzIHdoYXQgd2UgYXJlIGRvaW5nIG5vdywgb3IgSSBt
dXN0IG1pc3NlZCBzb21ldGhpZzoKPiBpZiAoY3R4ICYmIGN0eCAhPSB0b2tlbikgewo+IAlpcnFf
YnlwYXNzX3VucmVnaXN0ZXJfcHJvZHVjZXIoJnZxLT5jYWxsX2N0eC5wcm9kdWNlcik7Cj4gCXZx
LT5jYWxsX2N0eC5wcm9kdWNlci50b2tlbiA9IGN0eDsKPiAJaXJxX2J5cGFzc19yZWdpc3Rlcl9w
cm9kdWNlcigmdnEtPmNhbGxfY3R4LnByb2R1Y2VyKTsKPgo+IH0KPgo+IEl0IGp1c3QgdW5yZWdp
c3RlciBhbmQgcmVnaXN0ZXIuCgoKSSBtZWFudCB0aGVyZSdzIHByb2JhYmx5IG5vIG5lZWQgZm9y
IHRoZSBjaGVjayBhbmQgYW5vdGhlciBjaGVjayBhbmQgCnVucmVnaXN0ZXIgYmVmb3JlLiBUaGUg
d2hvbGUgZnVuY3Rpb24gaXMgYXMgc2ltcGxlIGFzIEkgc3VnZ2VzdGVkIGFib3ZlLgoKVGhhbmtz
CgoKPgo+IFRoYW5rcywKPiBCUgo+IFpodSBMaW5nc2hhbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZp
cnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGlu
dXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
