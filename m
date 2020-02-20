Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D45616570A
	for <lists.virtualization@lfdr.de>; Thu, 20 Feb 2020 06:40:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E21C083775;
	Thu, 20 Feb 2020 05:40:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ehJDc-2g9ybU; Thu, 20 Feb 2020 05:40:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3102583E0F;
	Thu, 20 Feb 2020 05:40:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 07912C013E;
	Thu, 20 Feb 2020 05:40:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 06589C013E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 05:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E8D5B84F24
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 05:40:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ovM5sD2cAbPS
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 05:40:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5F46A84EEB
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 05:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582177206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J9NrFI8gvvH8gN3m+EAbf89V4rNzqsdM3V845EEW2jg=;
 b=ODbEDpu8QEZBcClQD0IIPXeh+GaBZn0ZuJxOv2tNbg0QkQIrVMyCCisR1HJOuaTHfWWVH7
 T6z5zLc7kVNg11i2FAUr7BmiA5wujfcNqSBL/zQjQq5mIs5Zs0S6X+J/U6DcmlHJtPqPfz
 Qs/FXRBGvTxJeS4rw4nM6zQaBHPBApI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-OnCytqH4M4yaDNXjpZfCEA-1; Thu, 20 Feb 2020 00:40:04 -0500
X-MC-Unique: OnCytqH4M4yaDNXjpZfCEA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B286DB23;
 Thu, 20 Feb 2020 05:40:01 +0000 (UTC)
Received: from [10.72.12.159] (ovpn-12-159.pek2.redhat.com [10.72.12.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87A229077C;
 Thu, 20 Feb 2020 05:39:41 +0000 (UTC)
Subject: Re: [PATCH V3 1/5] vhost: factor out IOTLB
To: Randy Dunlap <rdunlap@infradead.org>, mst@redhat.com,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
References: <20200220035650.7986-1-jasowang@redhat.com>
 <20200220035650.7986-2-jasowang@redhat.com>
 <61d64892-ce77-3e86-acb8-a49679fc0047@infradead.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b348cb04-3b5b-1a11-a4c5-4b05d31e88c0@redhat.com>
Date: Thu, 20 Feb 2020 13:39:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <61d64892-ce77-3e86-acb8-a49679fc0047@infradead.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: shahafs@mellanox.com, jiri@mellanox.com, lulu@redhat.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, haotian.wang@sifive.com,
 hch@infradead.org, eperezma@redhat.com, maxime.coquelin@redhat.com,
 jgg@mellanox.com, hanand@xilinx.com, parav@mellanox.com,
 zhihong.wang@intel.com, lingshan.zhu@intel.com, mhabets@solarflare.com,
 rob.miller@broadcom.com
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

Ck9uIDIwMjAvMi8yMCDkuIvljYgxMjowNCwgUmFuZHkgRHVubGFwIHdyb3RlOgo+IE9uIDIvMTkv
MjAgNzo1NiBQTSwgSmFzb24gV2FuZyB3cm90ZToKPj4gVGhpcyBwYXRjaCBmYWN0b3JzIG91dCBJ
T1RMQiBpbnRvIGEgZGVkaWNhdGVkIG1vZHVsZSBpbiBvcmRlciB0byBiZQo+PiByZXVzZWQgYnkg
b3RoZXIgbW9kdWxlcyBsaWtlIHZyaW5naC4gVXNlciBtYXkgY2hvb3NlIHRvIGVuYWJsZSB0aGUK
Pj4gYXV0b21hdGljIHJldGlyaW5nIGJ5IHNwZWNpZnlpbmcgVkhPU1RfSU9UTEJfRkxBR19SRVRJ
UkUgZmxhZyB0byBmaXQKPj4gZm9yIHRoZSBjYXNlIG9mIHZob3N0IGRldmljZSBJT1RMQiBpbXBs
ZW1lbnRhdGlvbi4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVk
aGF0LmNvbT4KPj4gLS0tCj4+ICAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgIHwgICAxICsK
Pj4gICBkcml2ZXJzL3Zob3N0L0tjb25maWcgICAgICAgfCAgIDcgKysKPj4gICBkcml2ZXJzL3Zo
b3N0L01ha2VmaWxlICAgICAgfCAgIDIgKwo+PiAgIGRyaXZlcnMvdmhvc3QvbmV0LmMgICAgICAg
ICB8ICAgMiArLQo+PiAgIGRyaXZlcnMvdmhvc3Qvdmhvc3QuYyAgICAgICB8IDIyMSArKysrKysr
KysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gICBkcml2ZXJzL3Zob3N0L3Zob3N0Lmgg
ICAgICAgfCAgMzYgKystLS0tCj4+ICAgZHJpdmVycy92aG9zdC92aG9zdF9pb3RsYi5jIHwgMTcx
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gICBpbmNsdWRlL2xpbnV4L3Zob3N0X2lv
dGxiLmggfCAgNDUgKysrKysrKysKPj4gICA4IGZpbGVzIGNoYW5nZWQsIDMwNCBpbnNlcnRpb25z
KCspLCAxODEgZGVsZXRpb25zKC0pCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmhv
c3Qvdmhvc3RfaW90bGIuYwo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L3Zo
b3N0X2lvdGxiLmgKPj4KPiBIaSwKPiBTb3JyeSBpZiB5b3UgaGF2ZSBnb25lIG92ZXIgdGhpcyBw
cmV2aW91c2x5OgoKClRoYW5rcyBmb3IgdGhlIHJldmlldywgaXQncyByZWFsbHkgaGVscGZ1bC4K
Cgo+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L0tjb25maWcgYi9kcml2ZXJzL3Zob3N0
L0tjb25maWcKPj4gaW5kZXggM2QwM2NjYmQxYWRjLi5lZWY2MzRmZjlhNmUgMTAwNjQ0Cj4+IC0t
LSBhL2RyaXZlcnMvdmhvc3QvS2NvbmZpZwo+PiArKysgYi9kcml2ZXJzL3Zob3N0L0tjb25maWcK
Pj4gQEAgLTM2LDYgKzM2LDcgQEAgY29uZmlnIFZIT1NUX1ZTT0NLCj4+ICAgCj4+ICAgY29uZmln
IFZIT1NUCj4+ICAgCXRyaXN0YXRlCj4+ICsJc2VsZWN0IFZIT1NUX0lPVExCCj4+ICAgCS0tLWhl
bHAtLS0KPj4gICAJICBUaGlzIG9wdGlvbiBpcyBzZWxlY3RlZCBieSBhbnkgZHJpdmVyIHdoaWNo
IG5lZWRzIHRvIGFjY2Vzcwo+PiAgIAkgIHRoZSBjb3JlIG9mIHZob3N0Lgo+PiBAQCAtNTQsMyAr
NTUsOSBAQCBjb25maWcgVkhPU1RfQ1JPU1NfRU5ESUFOX0xFR0FDWQo+PiAgIAkgIGFkZHMgc29t
ZSBvdmVyaGVhZCwgaXQgaXMgZGlzYWJsZWQgYnkgZGVmYXVsdC4KPj4gICAKPj4gICAJICBJZiB1
bnN1cmUsIHNheSAiTiIuCj4+ICsKPj4gK2NvbmZpZyBWSE9TVF9JT1RMQgo+PiArCXRyaXN0YXRl
Cj4+ICsJZGVmYXVsdCBtCj4gImRlZmF1bHQgbSIgc2hvdWxkIG5vdCBiZSBuZWVkZWQuIEp1c3Qg
bWFrZSB3aGF0ZXZlciBuZWVkcyBpdCBzZWxlY3QgaXQuCgoKWWVzLCB3aWxsIGZpeC4KClRoYW5r
cwoKCj4KPj4gKwloZWxwCj4+ICsJICBHZW5lcmljIElPVExCIGltcGxlbWVudGF0aW9uIGZvciB2
aG9zdCBhbmQgdnJpbmdoLgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlz
dHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3Jn
L21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
