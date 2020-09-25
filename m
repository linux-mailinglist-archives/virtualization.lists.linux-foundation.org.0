Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B773127861F
	for <lists.virtualization@lfdr.de>; Fri, 25 Sep 2020 13:42:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 414C186DE0;
	Fri, 25 Sep 2020 11:42:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DwOUVVYG3K7h; Fri, 25 Sep 2020 11:42:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B81F286DE4;
	Fri, 25 Sep 2020 11:42:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7869DC0051;
	Fri, 25 Sep 2020 11:42:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C7DDEC0051
 for <virtualization@lists.linux-foundation.org>;
 Fri, 25 Sep 2020 11:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A70622E16B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 25 Sep 2020 11:41:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X-TTGjCLU4iz
 for <virtualization@lists.linux-foundation.org>;
 Fri, 25 Sep 2020 11:41:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by silver.osuosl.org (Postfix) with ESMTPS id D7B9B2E169
 for <virtualization@lists.linux-foundation.org>;
 Fri, 25 Sep 2020 11:41:58 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601034117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4y1m9JMkkDOJsL4k1JE6OPASJ9H32SGI/WQkPFQ5hvU=;
 b=BehAv66nOqG6+fVz9X/JJ18JBB8nqRlvBbI1jkIqwwuAo6o5JUespK6ltjCjkPoDHY1Ofh
 R4ujNICOJ5TgB3rt0ECTv6P2UJa7uzixSTYIyfRA+pDWfUqjwewI1PxxExwsH3p+DmpZ0t
 NVXeMwkqHDSzPB28yrn1nx0PeYyFvdI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-oSmASuxLNzWLqtK_WBmrYA-1; Fri, 25 Sep 2020 07:41:55 -0400
X-MC-Unique: oSmASuxLNzWLqtK_WBmrYA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6C8B1007382;
 Fri, 25 Sep 2020 11:41:53 +0000 (UTC)
Received: from [10.72.12.44] (ovpn-12-44.pek2.redhat.com [10.72.12.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5FB527BB7;
 Fri, 25 Sep 2020 11:41:38 +0000 (UTC)
Subject: Re: [RFC PATCH 02/24] vhost-vdpa: fix vqs leak in vhost_vdpa_open()
To: Eli Cohen <elic@nvidia.com>
References: <20200924032125.18619-1-jasowang@redhat.com>
 <20200924032125.18619-3-jasowang@redhat.com>
 <20200924074816.GC170403@mtl-vdi-166.wap.labs.mlnx>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <7237334f-10df-6d5b-dce9-c16b38166ae0@redhat.com>
Date: Fri, 25 Sep 2020 19:41:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200924074816.GC170403@mtl-vdi-166.wap.labs.mlnx>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: lulu@redhat.com, kvm@vger.kernel.org, mst@redhat.com,
 netdev@vger.kernel.org, mhabets@solarflare.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 hanand@xilinx.com, stefanha@redhat.com, eli@mellanox.com,
 maxime.coquelin@redhat.com, lingshan.zhu@intel.com, rob.miller@broadcom.com
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

Ck9uIDIwMjAvOS8yNCDkuIvljYgzOjQ4LCBFbGkgQ29oZW4gd3JvdGU6Cj4gT24gVGh1LCBTZXAg
MjQsIDIwMjAgYXQgMTE6MjE6MDNBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4gV2UgbmVl
ZCB0byBmcmVlIHZxcyBkdXJpbmcgdGhlIGVyciBwYXRoIGFmdGVyIGl0IGhhcyBiZWVuIGFsbG9j
YXRlZAo+PiBzaW5jZSB2aG9zdCB3b24ndCBkbyB0aGF0IGZvciB1cy4KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVy
cy92aG9zdC92ZHBhLmMgfCAxMSArKysrKysrKy0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA4IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zo
b3N0L3ZkcGEuYyBiL2RyaXZlcnMvdmhvc3QvdmRwYS5jCj4+IGluZGV4IDc5NmZlOTc5Zjk5Ny4u
OWM2NDEyNzRiOWYzIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3Zob3N0L3ZkcGEuYwo+PiArKysg
Yi9kcml2ZXJzL3Zob3N0L3ZkcGEuYwo+PiBAQCAtNzY0LDYgKzc2NCwxMiBAQCBzdGF0aWMgdm9p
ZCB2aG9zdF92ZHBhX2ZyZWVfZG9tYWluKHN0cnVjdCB2aG9zdF92ZHBhICp2KQo+PiAgIAl2LT5k
b21haW4gPSBOVUxMOwo+PiAgIH0KPj4gICAKPj4gK3N0YXRpYyB2b2lkIHZob3N0X3ZkcGFfY2xl
YW51cChzdHJ1Y3Qgdmhvc3RfdmRwYSAqdikKPj4gK3sKPj4gKwl2aG9zdF9kZXZfY2xlYW51cCgm
di0+dmRldik7Cj4+ICsJa2ZyZWUodi0+dmRldi52cXMpOwo+PiArfQo+PiArCj4gV291bGRuJ3Qg
aXQgYmUgY2xlYW5lciB0byBjYWxsIGtmcmVlKHZxcykgZXhwbGljaWx0eSBpbnNpZGUKPiB2aG9z
dF92ZHBhX29wZW4oKSBpbiBjYXNlIG9mIGZhaWx1cmUgYW5kIGtlZXAgdGhlIHN5bWV0cnkgb2YK
PiB2aG9zdF9kZXZfaW5pdCgpL3Zob3N0X2Rldl9jbGVhbnVwKCk/CgoKVGhhdCdzIGFsc28gZmlu
ZS4KClNlZSAKaHR0cHM6Ly93d3cubWFpbC1hcmNoaXZlLmNvbS92aXJ0dWFsaXphdGlvbkBsaXN0
cy5saW51eC1mb3VuZGF0aW9uLm9yZy9tc2c0MjU1OC5odG1sCgpJIHdpbGwgdXNlIHRoYXQgZm9y
IHRoZSBuZXh0IHZlcnNpb24uCgpUaGFua3MuCgoKPgo+PiAgIHN0YXRpYyBpbnQgdmhvc3RfdmRw
YV9vcGVuKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWxlICpmaWxlcCkKPj4gICB7Cj4+
ICAgCXN0cnVjdCB2aG9zdF92ZHBhICp2Owo+PiBAQCAtODA5LDcgKzgxNSw3IEBAIHN0YXRpYyBp
bnQgdmhvc3RfdmRwYV9vcGVuKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWxlICpmaWxl
cCkKPj4gICAJcmV0dXJuIDA7Cj4+ICAgCj4+ICAgZXJyX2luaXRfaW90bGI6Cj4+IC0Jdmhvc3Rf
ZGV2X2NsZWFudXAoJnYtPnZkZXYpOwo+PiArCXZob3N0X3ZkcGFfY2xlYW51cCh2KTsKPj4gICBl
cnI6Cj4+ICAgCWF0b21pY19kZWMoJnYtPm9wZW5lZCk7Cj4+ICAgCXJldHVybiByOwo+PiBAQCAt
ODQwLDggKzg0Niw3IEBAIHN0YXRpYyBpbnQgdmhvc3RfdmRwYV9yZWxlYXNlKHN0cnVjdCBpbm9k
ZSAqaW5vZGUsIHN0cnVjdCBmaWxlICpmaWxlcCkKPj4gICAJdmhvc3RfdmRwYV9mcmVlX2RvbWFp
bih2KTsKPj4gICAJdmhvc3RfdmRwYV9jb25maWdfcHV0KHYpOwo+PiAgIAl2aG9zdF92ZHBhX2Ns
ZWFuX2lycSh2KTsKPj4gLQl2aG9zdF9kZXZfY2xlYW51cCgmdi0+dmRldik7Cj4+IC0Ja2ZyZWUo
di0+dmRldi52cXMpOwo+PiArCXZob3N0X3ZkcGFfY2xlYW51cCh2KTsKPj4gICAJbXV0ZXhfdW5s
b2NrKCZkLT5tdXRleCk7Cj4+ICAgCj4+ICAgCWF0b21pY19kZWMoJnYtPm9wZW5lZCk7Cj4+IC0t
IAo+PiAyLjIwLjEKPj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5s
aW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFp
bG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
