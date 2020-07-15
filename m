Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7962209AC
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 12:17:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 28B1A20459;
	Wed, 15 Jul 2020 10:17:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 44SV64FcOlgK; Wed, 15 Jul 2020 10:17:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 103A620457;
	Wed, 15 Jul 2020 10:17:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BD2D6C0733;
	Wed, 15 Jul 2020 10:17:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 541F2C0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4374C8805D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:17:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oBHxSZdSdHED
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:17:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A4EB088007
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594808252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3T8WpNGiWZXmVvmLpbm2dg48+ovI54Ol7G/vR/Fw97Q=;
 b=Lv4EDgPU4NL6a8PUsS+zLF56bnTmLvB/8v2a5g3kpOzzFpjFPBwQpVa8ja78ChK0KYEgtx
 4UMPCJZauj2LLUIgGJl8OkHnpdeWgObQ1ClGRyyLTp2BvBLBDJFgF0anhPfOsRLTu7E2bX
 Bxn9s1eSjHMFny2OpsInlydhfroEev0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-sGQ40kMOPsOkyM4UynS6Ng-1; Wed, 15 Jul 2020 06:17:28 -0400
X-MC-Unique: sGQ40kMOPsOkyM4UynS6Ng-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D508D1005260;
 Wed, 15 Jul 2020 10:17:26 +0000 (UTC)
Received: from [10.72.13.230] (ovpn-13-230.pek2.redhat.com [10.72.13.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C6061059583;
 Wed, 15 Jul 2020 10:17:00 +0000 (UTC)
Subject: Re: [PATCH v7 2/2] s390: virtio: PV needs VIRTIO I/O device protection
To: "Michael S. Tsirkin" <mst@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>
References: <1594801869-13365-1-git-send-email-pmorel@linux.ibm.com>
 <1594801869-13365-3-git-send-email-pmorel@linux.ibm.com>
 <20200715054807-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <bc5e09ad-faaf-8b38-83e0-5f4a4b1daeb0@redhat.com>
Date: Wed, 15 Jul 2020 18:16:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200715054807-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: gor@linux.ibm.com, linux-s390@vger.kernel.org, frankja@linux.ibm.com,
 kvm@vger.kernel.org, thomas.lendacky@amd.com, hca@linux.ibm.com,
 cohuck@redhat.com, linuxram@us.ibm.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, david@gibson.dropbear.id.au
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

Ck9uIDIwMjAvNy8xNSDkuIvljYg1OjUwLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
V2VkLCBKdWwgMTUsIDIwMjAgYXQgMTA6MzE6MDlBTSArMDIwMCwgUGllcnJlIE1vcmVsIHdyb3Rl
Ogo+PiBJZiBwcm90ZWN0ZWQgdmlydHVhbGl6YXRpb24gaXMgYWN0aXZlIG9uIHMzOTAsIHRoZSB2
aXJ0aW8gcXVldWVzIGFyZQo+PiBub3QgYWNjZXNzaWJsZSB0byB0aGUgaG9zdCwgdW5sZXNzIFZJ
UlRJT19GX0lPTU1VX1BMQVRGT1JNIGhhcyBiZWVuCj4+IG5lZ290aWF0ZWQuIFVzZSB0aGUgbmV3
IGFyY2hfdmFsaWRhdGVfdmlydGlvX2ZlYXR1cmVzKCkgaW50ZXJmYWNlIHRvCj4+IGZhaWwgcHJv
YmUgaWYgdGhhdCdzIG5vdCB0aGUgY2FzZSwgcHJldmVudGluZyBhIGhvc3QgZXJyb3Igb24gYWNj
ZXNzCj4+IGF0dGVtcHQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBpZXJyZSBNb3JlbCA8cG1vcmVs
QGxpbnV4LmlibS5jb20+Cj4+IFJldmlld2VkLWJ5OiBDb3JuZWxpYSBIdWNrIDxjb2h1Y2tAcmVk
aGF0LmNvbT4KPj4gQWNrZWQtYnk6IEhhbGlsIFBhc2ljIDxwYXNpY0BsaW51eC5pYm0uY29tPgo+
PiBBY2tlZC1ieTogQ2hyaXN0aWFuIEJvcm50cmFlZ2VyIDxib3JudHJhZWdlckBkZS5pYm0uY29t
Pgo+PiAtLS0KPj4gICBhcmNoL3MzOTAvbW0vaW5pdC5jIHwgMjggKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspCj4+Cj4+IGRp
ZmYgLS1naXQgYS9hcmNoL3MzOTAvbW0vaW5pdC5jIGIvYXJjaC9zMzkwL21tL2luaXQuYwo+PiBp
bmRleCA2ZGM3YzNiNjBlZjYuLmQzOWFmNjU1NGQ0ZiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9zMzkw
L21tL2luaXQuYwo+PiArKysgYi9hcmNoL3MzOTAvbW0vaW5pdC5jCj4+IEBAIC00NSw2ICs0NSw3
IEBACj4+ICAgI2luY2x1ZGUgPGFzbS9rYXNhbi5oPgo+PiAgICNpbmNsdWRlIDxhc20vZG1hLW1h
cHBpbmcuaD4KPj4gICAjaW5jbHVkZSA8YXNtL3V2Lmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvdmly
dGlvX2NvbmZpZy5oPgo+PiAgIAo+PiAgIHBnZF90IHN3YXBwZXJfcGdfZGlyW1BUUlNfUEVSX1BH
RF0gX19zZWN0aW9uKC5ic3MuLnN3YXBwZXJfcGdfZGlyKTsKPj4gICAKPj4gQEAgLTE2MSw2ICsx
NjIsMzMgQEAgYm9vbCBmb3JjZV9kbWFfdW5lbmNyeXB0ZWQoc3RydWN0IGRldmljZSAqZGV2KQo+
PiAgIAlyZXR1cm4gaXNfcHJvdF92aXJ0X2d1ZXN0KCk7Cj4+ICAgfQo+PiAgIAo+PiArLyoKPj4g
KyAqIGFyY2hfdmFsaWRhdGVfdmlydGlvX2ZlYXR1cmVzCj4+ICsgKiBAZGV2OiB0aGUgVklSVElP
IGRldmljZSBiZWluZyBhZGRlZAo+PiArICoKPj4gKyAqIFJldHVybiBhbiBlcnJvciBpZiByZXF1
aXJlZCBmZWF0dXJlcyBhcmUgbWlzc2luZyBvbiBhIGd1ZXN0IHJ1bm5pbmcKPj4gKyAqIHdpdGgg
cHJvdGVjdGVkIHZpcnR1YWxpemF0aW9uLgo+PiArICovCj4+ICtpbnQgYXJjaF92YWxpZGF0ZV92
aXJ0aW9fZmVhdHVyZXMoc3RydWN0IHZpcnRpb19kZXZpY2UgKmRldikKPj4gK3sKPj4gKwlpZiAo
IWlzX3Byb3RfdmlydF9ndWVzdCgpKQo+PiArCQlyZXR1cm4gMDsKPj4gKwo+PiArCWlmICghdmly
dGlvX2hhc19mZWF0dXJlKGRldiwgVklSVElPX0ZfVkVSU0lPTl8xKSkgewo+PiArCQlkZXZfd2Fy
bigmZGV2LT5kZXYsCj4+ICsJCQkgImxlZ2FjeSB2aXJ0aW8gbm90IHN1cHBvcnRlZCB3aXRoIHBy
b3RlY3RlZCB2aXJ0dWFsaXphdGlvblxuIik7Cj4+ICsJCXJldHVybiAtRU5PREVWOwo+PiArCX0K
Pj4gKwo+PiArCWlmICghdmlydGlvX2hhc19mZWF0dXJlKGRldiwgVklSVElPX0ZfSU9NTVVfUExB
VEZPUk0pKSB7Cj4+ICsJCWRldl93YXJuKCZkZXYtPmRldiwKPj4gKwkJCSAic3VwcG9ydCBmb3Ig
bGltaXRlZCBtZW1vcnkgYWNjZXNzIHJlcXVpcmVkIGZvciBwcm90ZWN0ZWQgdmlydHVhbGl6YXRp
b25cbiIpOwo+PiArCQlyZXR1cm4gLUVOT0RFVjsKPj4gKwl9Cj4+ICsKPj4gKwlyZXR1cm4gMDsK
Pj4gK30KPj4gKwo+PiAgIC8qIHByb3RlY3RlZCB2aXJ0dWFsaXphdGlvbiAqLwo+PiAgIHN0YXRp
YyB2b2lkIHB2X2luaXQodm9pZCkKPj4gICB7Cj4gV2hhdCBib3RoZXJzIG1lIGhlcmUgaXMgdGhh
dCBhcmNoIGNvZGUgZGVwZW5kcyBvbiB2aXJ0aW8gbm93Lgo+IEl0IHdvcmtzIGV2ZW4gd2l0aCBh
IG1vZHVsYXIgdmlydGlvIHdoZW4gZnVuY3Rpb25zIGFyZSBpbmxpbmUsCj4gYnV0IGl0IHNlZW1z
IGZyYWdpbGU6IGUuZy4gaXQgYnJlYWtzIHZpcnRpbyBhcyBhbiBvdXQgb2YgdHJlZSBtb2R1bGUs
Cj4gc2luY2UgbGF5b3V0IG9mIHN0cnVjdCB2aXJ0aW9fZGV2aWNlIGNhbiBjaGFuZ2UuCgoKVGhl
IGNvZGUgd2FzIG9ubHkgY2FsbGVkIGZyb20gdmlydGlvLmMgc28gaXQgc2hvdWxkIGJlIGZpbmUu
CgpBbmQgbXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHdlIGRvbid0IG5lZWQgdG8gY2FyZSBhYm91
dCB0aGUga0FCSSBpc3N1ZSAKZHVyaW5nIHVwc3RyZWFtIGRldmVsb3BtZW50PwoKVGhhbmtzCgoK
Pgo+IEknbSBub3Qgc3VyZSB3aGF0IHRvIGRvIHdpdGggdGhpcyB5ZXQsIHdpbGwgdHJ5IHRvIHRo
aW5rIGFib3V0IGl0Cj4gb3ZlciB0aGUgd2Vla2VuZC4gVGhhbmtzIQo+Cj4KPj4gLS0gCj4+IDIu
MjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmly
dHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5k
YXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3ZpcnR1YWxpemF0aW9u
