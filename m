Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2B315A353
	for <lists.virtualization@lfdr.de>; Wed, 12 Feb 2020 09:27:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1EA068587E;
	Wed, 12 Feb 2020 08:27:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ylpvrVHrYVod; Wed, 12 Feb 2020 08:27:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A331B857FB;
	Wed, 12 Feb 2020 08:27:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 77714C0177;
	Wed, 12 Feb 2020 08:27:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0CF17C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 08:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 01B7E203BD
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 08:27:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GfOzEKLDcYpv
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 08:27:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 8C4D12001C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 08:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581496058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0qA1nDcFUvrV3P04ERfz3LJJdXRR+wWSmOw4ogMcuSU=;
 b=OcUyGKkAkz/wplYYA7cgAVr4h1cgVSf2J5eYVNAqMqmtYlF6I3UMCEWk1pM4uHuO5+Sk2Y
 GgIUDL+/9lXvSJDA+5rA+A6mASe2Bgc3fsb350t69wehaAbnOWLiCrJOM/APPmhPE551oE
 Nl7XhQF0PZyRs1LPtjUIGRUz412X5/I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-v6ZEW2x5PFuPkYDjaZSrCg-1; Wed, 12 Feb 2020 03:27:36 -0500
X-MC-Unique: v6ZEW2x5PFuPkYDjaZSrCg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E058B1857340;
 Wed, 12 Feb 2020 08:27:33 +0000 (UTC)
Received: from [10.72.13.111] (ovpn-13-111.pek2.redhat.com [10.72.13.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03FA85DA83;
 Wed, 12 Feb 2020 08:27:17 +0000 (UTC)
Subject: Re: [PATCH V2 5/5] vdpasim: vDPA device simulator
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20200210035608.10002-1-jasowang@redhat.com>
 <20200210035608.10002-6-jasowang@redhat.com>
 <20200211135254.GJ4271@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <3dbadf4e-c4c5-22cc-f970-f25fa42c13d8@redhat.com>
Date: Wed, 12 Feb 2020 16:27:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200211135254.GJ4271@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: kvm@vger.kernel.org, mst@redhat.com, mhabets@solarflare.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 lulu@redhat.com, hanand@xilinx.com, hch@infradead.org, eperezma@redhat.com,
 haotian.wang@sifive.com, shahafs@mellanox.com, parav@mellanox.com,
 jiri@mellanox.com, xiao.w.wang@intel.com, stefanha@redhat.com,
 zhihong.wang@intel.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 maxime.coquelin@redhat.com, netdev@vger.kernel.org, lingshan.zhu@intel.com
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

Ck9uIDIwMjAvMi8xMSDkuIvljYg5OjUyLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gT24gTW9u
LCBGZWIgMTAsIDIwMjAgYXQgMTE6NTY6MDhBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4g
Kwo+PiArc3RhdGljIHN0cnVjdCB2ZHBhc2ltICp2ZHBhc2ltX2NyZWF0ZSh2b2lkKQo+PiArewo+
PiArCXN0cnVjdCB2ZHBhc2ltICp2ZHBhc2ltOwo+PiArCXN0cnVjdCB2aXJ0aW9fbmV0X2NvbmZp
ZyAqY29uZmlnOwo+PiArCXN0cnVjdCB2ZHBhX2RldmljZSAqdmRwYTsKPj4gKwlzdHJ1Y3QgZGV2
aWNlICpkZXY7Cj4+ICsJaW50IHJldCA9IC1FTk9NRU07Cj4+ICsKPj4gKwl2ZHBhc2ltID0ga3ph
bGxvYyhzaXplb2YoKnZkcGFzaW0pLCBHRlBfS0VSTkVMKTsKPj4gKwlpZiAoIXZkcGFzaW0pCj4+
ICsJCWdvdG8gZXJyX3ZkcGFfYWxsb2M7Cj4+ICsKPj4gKwl2ZHBhc2ltLT5idWZmZXIgPSBrbWFs
bG9jKFBBR0VfU0laRSwgR0ZQX0tFUk5FTCk7Cj4+ICsJaWYgKCF2ZHBhc2ltLT5idWZmZXIpCj4+
ICsJCWdvdG8gZXJyX2J1ZmZlcl9hbGxvYzsKPj4gKwo+PiArCXZkcGFzaW0tPmlvbW11ID0gdmhv
c3RfaW90bGJfYWxsb2MoMjA0OCwgMCk7Cj4+ICsJaWYgKCF2ZHBhc2ltLT5pb21tdSkKPj4gKwkJ
Z290byBlcnJfaW90bGI7Cj4+ICsKPj4gKwljb25maWcgPSAmdmRwYXNpbS0+Y29uZmlnOwo+PiAr
CWNvbmZpZy0+bXR1ID0gMTUwMDsKPj4gKwljb25maWctPnN0YXR1cyA9IFZJUlRJT19ORVRfU19M
SU5LX1VQOwo+PiArCWV0aF9yYW5kb21fYWRkcihjb25maWctPm1hYyk7Cj4+ICsKPj4gKwlJTklU
X1dPUksoJnZkcGFzaW0tPndvcmssIHZkcGFzaW1fd29yayk7Cj4+ICsJc3Bpbl9sb2NrX2luaXQo
JnZkcGFzaW0tPmxvY2spOwo+PiArCj4+ICsJdmRwYSA9ICZ2ZHBhc2ltLT52ZHBhOwo+PiArCXZk
cGEtPmRldi5yZWxlYXNlID0gdmRwYXNpbV9yZWxlYXNlX2RldjsKPiBUaGUgZHJpdmVyIHNob3Vs
ZCBub3QgcHJvdmlkZSB0aGUgcmVsZWFzZSBmdW5jdGlvbi4KPgo+IEFnYWluIHRoZSBzYWZlc3Qg
bW9kZWwgaXMgJ3ZkcGFfYWxsb2NfZGV2aWNlJyB3aGljaCBjb21iaW5lcyB0aGUKPiBremFsbG9j
IGFuZCB0aGUgdmRwYV9pbml0X2RldmljZSgpIGFuZCByZXR1cm5zIHNvbWV0aGluZyB0aGF0IGlz
Cj4gZXJyb3IgdW53b3VuZCB3aXRoIHB1dF9kZXZpY2UoKQo+Cj4gVGhlIHN1YnN5c3RlbSBvd25z
IHRoZSByZWxlYXNlIGFuZCBkb2VzIHRoZSBrZnJlZSBhbmQgb3RoZXIgY2xlYW51cAo+IGxpa2Ug
cmVsZWFzaW5nIHRoZSBJREEuCgoKU28gSSB0aGluayBpZiB3ZSBhZ3JlZSBidXMgaW5zdGVhZCBv
ZiBjbGFzcyBpcyB1c2VkLiB2RFBBIGJ1cyBjYW4gCnByb3ZpZGUgYSByZWxlYXNlIGZ1bmN0aW9u
IGluIHZkcGFfYWxsb2NfZGV2aWNlKCk/CgoKPgo+PiArCXZyaW5naF9zZXRfaW90bGIoJnZkcGFz
aW0tPnZxc1swXS52cmluZywgdmRwYXNpbS0+aW9tbXUpOwo+PiArCXZyaW5naF9zZXRfaW90bGIo
JnZkcGFzaW0tPnZxc1sxXS52cmluZywgdmRwYXNpbS0+aW9tbXUpOwo+PiArCj4+ICsJZGV2ID0g
JnZkcGEtPmRldjsKPj4gKwlkZXYtPmNvaGVyZW50X2RtYV9tYXNrID0gRE1BX0JJVF9NQVNLKDY0
KTsKPj4gKwlzZXRfZG1hX29wcyhkZXYsICZ2ZHBhc2ltX2RtYV9vcHMpOwo+PiArCj4+ICsJcmV0
ID0gdmRwYV9pbml0X2RldmljZSh2ZHBhLCAmdmRwYXNpbV9kZXYtPmRldiwgZGV2LAo+PiArCQkJ
ICAgICAgICZ2ZHBhc2ltX25ldF9jb25maWdfb3BzKTsKPj4gKwlpZiAocmV0KQo+PiArCQlnb3Rv
IGVycl9pbml0Owo+PiArCj4+ICsJcmV0ID0gdmRwYV9yZWdpc3Rlcl9kZXZpY2UodmRwYSk7Cj4+
ICsJaWYgKHJldCkKPj4gKwkJZ290byBlcnJfcmVnaXN0ZXI7Cj4gU2VlPyBUaGlzIGVycm9yIHVu
d2luZCBpcyBub3cgYWxsIHdyb25nOgo+Cj4+ICsKPj4gKwlyZXR1cm4gdmRwYXNpbTsKPj4gKwo+
PiArZXJyX3JlZ2lzdGVyOgo+PiArCXB1dF9kZXZpY2UoJnZkcGEtPmRldik7Cj4gRG91YmxlIHB1
dF9kZXZpY2UKCgpZZXMuCgoKPgo+PiArZXJyX2luaXQ6Cj4+ICsJdmhvc3RfaW90bGJfZnJlZSh2
ZHBhc2ltLT5pb21tdSk7Cj4+ICtlcnJfaW90bGI6Cj4+ICsJa2ZyZWUodmRwYXNpbS0+YnVmZmVy
KTsKPj4gK2Vycl9idWZmZXJfYWxsb2M6Cj4+ICsJa2ZyZWUodmRwYXNpbSk7Cj4ga2ZyZWUgYWZ0
ZXIgdmRwYV9pbml0X2RldmljZSgpIGlzIGluY29ycmVjdCwgYXMgdGhlIHB1dF9kZXZpY2Ugbm93
Cj4gZG9lcyBrZnJlZSB2aWEgcmVsZWFzZQoKCk9rLCB3aWxsIGZpeC4KCgo+Cj4+ICtzdGF0aWMg
aW50IF9faW5pdCB2ZHBhc2ltX2Rldl9pbml0KHZvaWQpCj4+ICt7Cj4+ICsJc3RydWN0IGRldmlj
ZSAqZGV2Owo+PiArCWludCByZXQgPSAwOwo+PiArCj4+ICsJdmRwYXNpbV9kZXYgPSBremFsbG9j
KHNpemVvZigqdmRwYXNpbV9kZXYpLCBHRlBfS0VSTkVMKTsKPj4gKwlpZiAoIXZkcGFzaW1fZGV2
KQo+PiArCQlyZXR1cm4gLUVOT01FTTsKPj4gKwo+PiArCWRldiA9ICZ2ZHBhc2ltX2Rldi0+ZGV2
Owo+PiArCWRldi0+cmVsZWFzZSA9IHZkcGFzaW1fZGV2aWNlX3JlbGVhc2U7Cj4+ICsJZGV2X3Nl
dF9uYW1lKGRldiwgIiVzIiwgVkRQQVNJTV9OQU1FKTsKPj4gKwo+PiArCXJldCA9IGRldmljZV9y
ZWdpc3RlcigmdmRwYXNpbV9kZXYtPmRldik7Cj4+ICsJaWYgKHJldCkKPj4gKwkJZ290byBlcnJf
cmVnaXN0ZXI7Cj4+ICsKPj4gKwlpZiAoIXZkcGFzaW1fY3JlYXRlKCkpCj4+ICsJCWdvdG8gZXJy
X3JlZ2lzdGVyOwo+IFdyb25nIGVycm9yIHVud2luZCBoZXJlIHRvbwoKCldpbGwgZml4LgoKVGhh
bmtzCgoKPgo+PiArCXJldHVybiAwOwo+PiArCj4+ICtlcnJfcmVnaXN0ZXI6Cj4+ICsJa2ZyZWUo
dmRwYXNpbV9kZXYpOwo+PiArCXZkcGFzaW1fZGV2ID0gTlVMTDsKPj4gKwlyZXR1cm4gcmV0Owo+
PiArfQo+IEphc29uCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5s
aW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFp
bG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
