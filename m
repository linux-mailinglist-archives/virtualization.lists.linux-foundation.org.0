Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D652207A8
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 10:43:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 49B8887C3F;
	Wed, 15 Jul 2020 08:43:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z3m3qzcpJwVK; Wed, 15 Jul 2020 08:43:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7A89287C82;
	Wed, 15 Jul 2020 08:43:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53A2AC08A9;
	Wed, 15 Jul 2020 08:43:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C6DDEC0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 08:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B4CD68ADFE
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 08:43:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bC2g8fcC5GIH
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 08:43:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DCE678ADF3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 08:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594802596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g3ATeHeFF1J37NbSRujlNcK6+iTDVTNL3b6nVYG9gNI=;
 b=BdCsp6n4x6lml+v1/P0NIfy4epVqOnRGmryBJDQYcrkTzngcy0PkdV/sP3ZFTgI26R2zV8
 jfJOT09/hSkw9a6JaHQV0RqPTooqGlECq3YTRpZvxEXw4Lh7AqCejgu9E5uMV5SSYPqxRd
 ZRPSO5beS5puYTu/ihXOMitk4AS4yEc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-k8z0oujvNH-_u1V4kBvS-Q-1; Wed, 15 Jul 2020 04:43:14 -0400
X-MC-Unique: k8z0oujvNH-_u1V4kBvS-Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A5FC100CCC1;
 Wed, 15 Jul 2020 08:43:13 +0000 (UTC)
Received: from [10.72.13.230] (ovpn-13-230.pek2.redhat.com [10.72.13.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F7D66FEF4;
 Wed, 15 Jul 2020 08:43:06 +0000 (UTC)
Subject: Re: [PATCH 5/7] virtio_vdpa: init IRQ offloading function pointers to
 NULL.
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, mst@redhat.com,
 alex.williamson@redhat.com, pbonzini@redhat.com,
 sean.j.christopherson@intel.com, wanpengli@tencent.com
References: <1594565366-3195-1-git-send-email-lingshan.zhu@intel.com>
 <1594565366-3195-5-git-send-email-lingshan.zhu@intel.com>
 <276bf939-8e12-e28a-64f7-1767851e0db5@redhat.com>
 <ba1ea94c-b0ae-8bd8-8425-64b096512d3d@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d5b12368-7d78-6c0b-e593-289594d11985@redhat.com>
Date: Wed, 15 Jul 2020 16:43:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ba1ea94c-b0ae-8bd8-8425-64b096512d3d@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

Ck9uIDIwMjAvNy8xMyDkuIvljYg2OjIwLCBaaHUsIExpbmdzaGFuIHdyb3RlOgo+Cj4KPiBPbiA3
LzEzLzIwMjAgNDoyOCBQTSwgSmFzb24gV2FuZyB3cm90ZToKPj4KPj4gT24gMjAyMC83LzEyIOS4
i+WNiDEwOjQ5LCBaaHUgTGluZ3NoYW4gd3JvdGU6Cj4+PiBUaGlzIGNvbW1pdCBpbml0aWFsaXpl
IElSUSBvZmZsb2FkaW5nIGZ1bmN0aW9uIHBvaW50ZXJzIGluCj4+PiB2aXJ0aW9fdmRwYV9kcml2
ZXIgdG8gTlVMTC4gQmVjYXN1ZSBpcnEgb2ZmbG9hZGluZyBvbmx5IGZvY3VzCj4+PiBvbiBWTXMg
Zm9yIHZob3N0X3ZkcGEuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogWmh1IExpbmdzaGFuIDxsaW5n
c2hhbi56aHVAaW50ZWwuY29tPgo+Pj4gLS0tCj4+PiDCoCBkcml2ZXJzL3ZpcnRpby92aXJ0aW9f
dmRwYS5jIHwgMiArKwo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Pj4K
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fdmRwYS5jIAo+Pj4gYi9kcml2
ZXJzL3ZpcnRpby92aXJ0aW9fdmRwYS5jCj4+PiBpbmRleCBjMzBlYjU1Li4xZThhY2I5IDEwMDY0
NAo+Pj4gLS0tIGEvZHJpdmVycy92aXJ0aW8vdmlydGlvX3ZkcGEuYwo+Pj4gKysrIGIvZHJpdmVy
cy92aXJ0aW8vdmlydGlvX3ZkcGEuYwo+Pj4gQEAgLTM4Niw2ICszODYsOCBAQCBzdGF0aWMgdm9p
ZCB2aXJ0aW9fdmRwYV9yZW1vdmUoc3RydWN0IAo+Pj4gdmRwYV9kZXZpY2UgKnZkcGEpCj4+PiDC
oMKgwqDCoMKgIH0sCj4+PiDCoMKgwqDCoMKgIC5wcm9iZcKgwqDCoCA9IHZpcnRpb192ZHBhX3By
b2JlLAo+Pj4gwqDCoMKgwqDCoCAucmVtb3ZlID0gdmlydGlvX3ZkcGFfcmVtb3ZlLAo+Pj4gK8Kg
wqDCoCAuc2V0dXBfdnFfaXJxID0gTlVMTCwKPj4+ICvCoMKgwqAgLnVuc2V0dXBfdnFfaXJxID0g
TlVMTCwKPj4+IMKgIH07Cj4+Cj4+Cj4+IElzIHRoaXMgcmVhbGx5IG5lZWRlZCBjb25zaWRlciB0
aGUgaXQncyBzdGF0aWM/Cj4+Cj4+IFRoYW5rcwo+IFRoaXMgaXMgZm9yIHJlYWRhYmlsaXR5LCB0
byBzaG93IHRoZXkgYXJlIE5VTEwsIHNvIHZpcnRpb192ZHBhIHdvdWxkIG5vdCBnbyB0aHJvdWdo
IGlycSBmb3J3YXJkaW5nIC8gb2ZmbG9hZGluZy4KPgo+IERvZXMgdGhpcyBtYWtlIHNlbnNlPwoK
ClByb2JhYmx5IG5vdCwgcGxlYXNlIHJlZmVyIHdoYXQgaXMgZG9uZSBieSBvdGhlciBzdWJzeXN0
ZW1zLgoKVGhhbmtzCgoKPgo+IFRoYW5rcywKPiBCUgo+IFpodSBMaW5nc2hhbgo+Pgo+Pgo+Pj4g
bW9kdWxlX3ZkcGFfZHJpdmVyKHZpcnRpb192ZHBhX2RyaXZlcik7Cj4+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5n
IGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9s
aXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
