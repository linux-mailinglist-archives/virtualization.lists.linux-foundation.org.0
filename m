Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 370C11588A5
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 04:19:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B01C38449A;
	Tue, 11 Feb 2020 03:19:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cls6BJFQSzo0; Tue, 11 Feb 2020 03:19:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3FB518444F;
	Tue, 11 Feb 2020 03:19:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 24C24C07FE;
	Tue, 11 Feb 2020 03:19:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CB118C07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 03:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B4965842C3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 03:19:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 11PsEJr0gD7x
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 03:19:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id F215984076
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 03:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581391187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LVGmAaQelGG2wmtr8ypBYNb9UdLgn2L2ZnfBdIYaqns=;
 b=TfU8LHAbMabHbIzuJy4VAFLh+GOZV/XotmmqttlfZZUYyTGcwWFVIyKVdxDMD5xNhp52iu
 NaJu88zcA64LCYXO1Dcvi4LJ97xRBFtQ/XnchOPjKSoXXJF80eJ7zPt6GRJHBdjtM7pWxb
 Xr/e1n7W0MqwlbuU/8MkyyhNDT+POnY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-IMnbuXGMNLOCkryZsl8Ayg-1; Mon, 10 Feb 2020 22:19:43 -0500
X-MC-Unique: IMnbuXGMNLOCkryZsl8Ayg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7F498017CC;
 Tue, 11 Feb 2020 03:19:42 +0000 (UTC)
Received: from [10.72.12.184] (ovpn-12-184.pek2.redhat.com [10.72.12.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56F335C1D4;
 Tue, 11 Feb 2020 03:19:39 +0000 (UTC)
Subject: Re: [PATCH v2] tools/virtio: option to build an out of tree module
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20200207073327.1205669-1-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <e361e68d-e7c8-1fe0-45c1-21e6be8333d1@redhat.com>
Date: Tue, 11 Feb 2020 11:19:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200207073327.1205669-1-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjAvMi83IOS4i+WNiDM6MzUsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBIYW5k
eSBmb3IgdGVzdGluZyB3aXRoIGRpc3RybyBrZXJuZWxzLgo+IFdhcm4gdGhhdCB0aGUgcmVzdWx0
aW5nIG1vZHVsZSBpcyBjb21wbGV0ZWx5IHVuc3VwcG9ydGVkLAo+IGFuZCBpc24ndCBpbnRlbmRl
ZCBmb3IgcHJvZHVjdGlvbiB1c2UuCj4KPiBVc2FnZToKPiAgICAgICAgICBtYWtlIG9vdCAjIGJ1
aWxkcyB2aG9zdF90ZXN0LmtvLCB2aG9zdC5rbwo+ICAgICAgICAgIG1ha2Ugb290LWNsZWFuICMg
Y2xlYW5zIG91dCBmaWxlcyBjcmVhdGVkCj4KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFMuIFRz
aXJraW4gPG1zdEByZWRoYXQuY29tPgo+IC0tLQo+Cj4gY2hhbmdlcyBmcm9tIHYxOgo+IAlsb3Rz
IG9mIHJlZmFjdG9yaW5nCj4gCWRpc2FibGUgYWxsIG1vZHVsZXMgZXhjZXB0IHZob3N0IGJ5IGRl
ZmF1bHQgKG1vcmUgb2YgYSBjaGFuY2UKPiAJCQkJCQkgICAgIGl0J2xsIGJ1aWxkKQo+IAlvb3Qt
Y2xlYW4gdGFyZ2V0Cj4KPiAgIHRvb2xzL3ZpcnRpby9NYWtlZmlsZSB8IDI3ICsrKysrKysrKysr
KysrKysrKysrKysrKysrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS90b29scy92aXJ0aW8vTWFrZWZpbGUgYi90b29s
cy92aXJ0aW8vTWFrZWZpbGUKPiBpbmRleCA4ZTJhOTA4MTE1YzIuLmYzM2YzMmYxZDIwOCAxMDA2
NDQKPiAtLS0gYS90b29scy92aXJ0aW8vTWFrZWZpbGUKPiArKysgYi90b29scy92aXJ0aW8vTWFr
ZWZpbGUKPiBAQCAtOCw3ICs4LDMyIEBAIENGTEFHUyArPSAtZyAtTzIgLVdlcnJvciAtV2FsbCAt
SS4gLUkuLi9pbmNsdWRlLyAtSSAuLi8uLi91c3IvaW5jbHVkZS8gLVduby1wb2luCj4gICB2cGF0
aCAlLmMgLi4vLi4vZHJpdmVycy92aXJ0aW8gLi4vLi4vZHJpdmVycy92aG9zdAo+ICAgbW9kOgo+
ICAgCSR7TUFLRX0gLUMgYHB3ZGAvLi4vLi4gTT1gcHdkYC92aG9zdF90ZXN0IFY9JHtWfQo+IC0u
UEhPTlk6IGFsbCB0ZXN0IG1vZCBjbGVhbgo+ICsKPiArI29vdDogYnVpbGQgdmhvc3QgYXMgYW4g
b3V0IG9mIHRyZWUgbW9kdWxlIGZvciBhIGRpc3RybyBrZXJuZWwKPiArI25vIGVmZm9ydCBpcyB0
YWtlbiB0byBtYWtlIGl0IGFjdHVhbGx5IGJ1aWxkIG9yIHdvcmssIGJ1dCB0ZW5kcyB0byBtb3N0
bHkgd29yawo+ICsjaWYgdGhlIGRpc3RybyBrZXJuZWwgaXMgdmVyeSBjbG9zZSB0byB1cHN0cmVh
bQo+ICsjdW5zdXBwb3J0ZWQhIHRoaXMgaXMgYSBkZXZlbG9wbWVudCB0b29sIG9ubHksIGRvbid0
IHVzZSB0aGUKPiArI3Jlc3VsdGluZyBtb2R1bGVzIGluIHByb2R1Y3Rpb24hCj4gK09PVF9LU1JD
PS9saWIvbW9kdWxlcy8kJCh1bmFtZSAtcikvYnVpbGQKPiArT09UX1ZIT1NUPWBwd2RgLy4uLy4u
L2RyaXZlcnMvdmhvc3QKPiArI0V2ZXJ5b25lIGRlcGVuZHMgb24gdmhvc3QKPiArI1R3ZWFrIHRo
ZSBiZWxvdyB0byBlbmFibGUgbW9yZSBtb2R1bGVzCj4gK09PVF9DT05GSUdTPVwKPiArCUNPTkZJ
R19WSE9TVD1tIFwKPiArCUNPTkZJR19WSE9TVF9ORVQ9biBcCj4gKwlDT05GSUdfVkhPU1RfU0NT
ST1uIFwKPiArCUNPTkZJR19WSE9TVF9WU09DSz1uCj4gK09PVF9CVUlMRD1LQ0ZMQUdTPSItSSAi
JHtPT1RfVkhPU1R9ICR7TUFLRX0gLUMgJHtPT1RfS1NSQ30gVj0ke1Z9Cj4gK29vdC1idWlsZDoK
PiArCWVjaG8gIlVOU1VQUE9SVEVEISBEb24ndCB1c2UgdGhlIHJlc3VsdGluZyBtb2R1bGVzIGlu
IHByb2R1Y3Rpb24hIgo+ICsJJHtPT1RfQlVJTER9IE09YHB3ZGAvdmhvc3RfdGVzdAo+ICsJJHtP
T1RfQlVJTER9IE09JHtPT1RfVkhPU1R9ICR7T09UX0NPTkZJR1N9Cj4gKwo+ICtvb3QtY2xlYW46
IG9vdC1idWlsZAo+ICtvb3Q6IG9vdC1idWlsZAo+ICtvb3QtY2xlYW46IE9PVF9CVUlMRCs9Y2xl
YW4KPiArCj4gKy5QSE9OWTogYWxsIHRlc3QgbW9kIGNsZWFuIHZob3N0IG9vdCBvb3QtY2xlYW4g
b290LWJ1aWxkCj4gICBjbGVhbjoKPiAgIAkke1JNfSAqLm8gdnJpbmdoX3Rlc3QgdmlydGlvX3Rl
c3Qgdmhvc3RfdGVzdC8qLm8gdmhvc3RfdGVzdC8uKi5jbWQgXAo+ICAgICAgICAgICAgICAgICB2
aG9zdF90ZXN0L01vZHVsZS5zeW12ZXJzIHZob3N0X3Rlc3QvbW9kdWxlcy5vcmRlciAqLmQKCgpB
Y2tlZC1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5n
IGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9s
aXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
