Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5811EBA22
	for <lists.virtualization@lfdr.de>; Tue,  2 Jun 2020 13:10:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2F76B861B2;
	Tue,  2 Jun 2020 11:10:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xkrsnjxDrADV; Tue,  2 Jun 2020 11:10:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9F46D86155;
	Tue,  2 Jun 2020 11:10:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72409C016E;
	Tue,  2 Jun 2020 11:10:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 93366C016E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 11:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8AD9A88187
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 11:10:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pw9+my62GSgU
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 11:10:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9DEC28815C
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 11:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591096253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e1bN6BFwrFb8HaDkHCOaH4+Ma1lbuG7/W6ik/b1HbRs=;
 b=NZ5CKj3gdNabTPnT/mysHIT6erd8DbIVpwU0x7KBgFYVNSWJeVihyoLsYnM5T7Qn+KDXVL
 KTqtXyKzh4CMzbulc/7v5Z/nZ2yT3gjShuy83Lb4hPjjfKAW7skJ7AvWWdki3R1mZ/Cv5z
 +s1hFgEQTT5ZqLY7DTmAY/317JYLJDQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-peAYYSG6MtaV1fKxi7DMpw-1; Tue, 02 Jun 2020 07:10:49 -0400
X-MC-Unique: peAYYSG6MtaV1fKxi7DMpw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDEAA1883607;
 Tue,  2 Jun 2020 11:10:46 +0000 (UTC)
Received: from [10.72.12.83] (ovpn-12-83.pek2.redhat.com [10.72.12.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A75B578EFB;
 Tue,  2 Jun 2020 11:10:39 +0000 (UTC)
Subject: Re: [PATCH] vdpa: bypass waking up vhost_woker for vdpa vq kick
From: Jason Wang <jasowang@redhat.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, kbuild@lists.01.org,
 Zhu Lingshan <lingshan.zhu@intel.com>, mst@redhat.com, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
References: <20200602094203.GU30374@kadam>
 <b8ccbccf-f667-8d15-8de2-b87da5f51ec3@redhat.com>
Message-ID: <c2f3cd6c-6f75-15db-080e-9895a35a0456@redhat.com>
Date: Tue, 2 Jun 2020 19:10:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <b8ccbccf-f667-8d15-8de2-b87da5f51ec3@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: kbuild-all@lists.01.org, lkp@intel.com, lulu@redhat.com
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

Ck9uIDIwMjAvNi8yIOS4i+WNiDY6MTYsIEphc29uIFdhbmcgd3JvdGU6Cj4KPiBPbiAyMDIwLzYv
MiDkuIvljYg1OjQyLCBEYW4gQ2FycGVudGVyIHdyb3RlOgo+PiBIaSBaaHUsCj4+Cj4+IHVybDog
Cj4+IGh0dHBzOi8vZ2l0aHViLmNvbS8wZGF5LWNpL2xpbnV4L2NvbW1pdHMvWmh1LUxpbmdzaGFu
L3ZkcGEtYnlwYXNzLXdha2luZy11cC12aG9zdF93b2tlci1mb3ItdmRwYS12cS1raWNrLzIwMjAw
NTI2LTEzMzgxOSAKPj4KPj4gYmFzZTogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvbXN0L3Zob3N0LmdpdCAKPj4gbGludXgtbmV4dAo+PiBjb25maWc6IHg4
Nl82NC1yYW5kY29uZmlnLW0wMDEtMjAyMDA1MjkgKGF0dGFjaGVkIGFzIC5jb25maWcpCj4+IGNv
bXBpbGVyOiBnY2MtOSAoRGViaWFuIDkuMy4wLTEzKSA5LjMuMAo+Pgo+PiBJZiB5b3UgZml4IHRo
ZSBpc3N1ZSwga2luZGx5IGFkZCBmb2xsb3dpbmcgdGFnIGFzIGFwcHJvcHJpYXRlCj4+IFJlcG9y
dGVkLWJ5OiBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPj4gUmVwb3J0ZWQtYnk6
IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KPj4KPj4gc21hdGNoIHdh
cm5pbmdzOgo+PiBkcml2ZXJzL3Zob3N0L3ZkcGEuYzozNDggdmhvc3RfdmRwYV9zZXRfdnJpbmdf
a2ljaygpIGVycm9yOiAKPj4gdW5pbml0aWFsaXplZCBzeW1ib2wgJ3InLgo+Pgo+PiAjIAo+PiBo
dHRwczovL2dpdGh1Yi5jb20vMGRheS1jaS9saW51eC9jb21taXQvYTg0ZGRiZjFlZjI5ZjE4YWFm
YjJiYjhhOTNiY2VkZDRhMjlhOTY3ZCAKPj4KPj4gZ2l0IHJlbW90ZSBhZGQgbGludXgtcmV2aWV3
IGh0dHBzOi8vZ2l0aHViLmNvbS8wZGF5LWNpL2xpbnV4Cj4+IGdpdCByZW1vdGUgdXBkYXRlIGxp
bnV4LXJldmlldwo+PiBnaXQgY2hlY2tvdXQgYTg0ZGRiZjFlZjI5ZjE4YWFmYjJiYjhhOTNiY2Vk
ZDRhMjlhOTY3ZAo+PiB2aW0gKy9yICszNDggZHJpdmVycy92aG9zdC92ZHBhLmMKPj4KPj4gYTg0
ZGRiZjFlZjI5ZjEgWmh1IExpbmdzaGFuIDIwMjAtMDUtMjbCoCAzMTbCoCBzdGF0aWMgbG9uZyAK
Pj4gdmhvc3RfdmRwYV9zZXRfdnJpbmdfa2ljayhzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cSwK
Pj4gYTg0ZGRiZjFlZjI5ZjEgWmh1IExpbmdzaGFuIDIwMjAtMDUtMjYgMzE3wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAKPj4gdm9pZCBfX3VzZXIgKmFyZ3Ap
Cj4+IGE4NGRkYmYxZWYyOWYxIFpodSBMaW5nc2hhbiAyMDIwLTA1LTI2wqAgMzE4wqAgewo+PiBh
ODRkZGJmMWVmMjlmMSBaaHUgTGluZ3NoYW4gMjAyMC0wNS0yNsKgIDMxOcKgwqDCoMKgwqAgYm9v
bCBwb2xsc3RhcnQgPSAKPj4gZmFsc2UsIHBvbGxzdG9wID0gZmFsc2U7Cj4+IGE4NGRkYmYxZWYy
OWYxIFpodSBMaW5nc2hhbiAyMDIwLTA1LTI2wqAgMzIwwqDCoMKgwqDCoCBzdHJ1Y3QgZmlsZSAK
Pj4gKmV2ZW50ZnAsICpmaWxlcCA9IE5VTEw7Cj4+IGE4NGRkYmYxZWYyOWYxIFpodSBMaW5nc2hh
biAyMDIwLTA1LTI2wqAgMzIxwqDCoMKgwqDCoCBzdHJ1Y3QgCj4+IHZob3N0X3ZyaW5nX2ZpbGUg
ZjsKPj4gYTg0ZGRiZjFlZjI5ZjEgWmh1IExpbmdzaGFuIDIwMjAtMDUtMjbCoCAzMjLCoMKgwqDC
oMKgIGxvbmcgcjsKPj4gYTg0ZGRiZjFlZjI5ZjEgWmh1IExpbmdzaGFuIDIwMjAtMDUtMjbCoCAz
MjMKPj4gYTg0ZGRiZjFlZjI5ZjEgWmh1IExpbmdzaGFuIDIwMjAtMDUtMjbCoCAzMjTCoMKgwqDC
oMKgIGlmIAo+PiAoY29weV9mcm9tX3VzZXIoJmYsIGFyZ3AsIHNpemVvZihmKSkpCj4+IGE4NGRk
YmYxZWYyOWYxIFpodSBMaW5nc2hhbiAyMDIwLTA1LTI2wqAgMzI1wqDCoMKgwqDCoMKgwqDCoMKg
IHJldHVybiAtRUZBVUxUOwo+PiBhODRkZGJmMWVmMjlmMSBaaHUgTGluZ3NoYW4gMjAyMC0wNS0y
NsKgIDMyNgo+PiBhODRkZGJmMWVmMjlmMSBaaHUgTGluZ3NoYW4gMjAyMC0wNS0yNsKgIDMyN8Kg
wqDCoMKgwqAgZXZlbnRmcCA9IGYuZmQgPT0gLTEgCj4+ID8gTlVMTCA6IGV2ZW50ZmRfZmdldChm
LmZkKTsKPj4gYTg0ZGRiZjFlZjI5ZjEgWmh1IExpbmdzaGFuIDIwMjAtMDUtMjbCoCAzMjjCoMKg
wqDCoMKgIGlmIChJU19FUlIoZXZlbnRmcCkpIHsKPj4gYTg0ZGRiZjFlZjI5ZjEgWmh1IExpbmdz
aGFuIDIwMjAtMDUtMjbCoCAzMjnCoMKgwqDCoMKgwqDCoMKgwqAgciA9IAo+PiBQVFJfRVJSKGV2
ZW50ZnApOwo+PiBhODRkZGJmMWVmMjlmMSBaaHUgTGluZ3NoYW4gMjAyMC0wNS0yNsKgIDMzMMKg
wqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcjsKPj4gYTg0ZGRiZjFlZjI5ZjEgWmh1IExpbmdzaGFu
IDIwMjAtMDUtMjbCoCAzMzHCoMKgwqDCoMKgIH0KPj4gYTg0ZGRiZjFlZjI5ZjEgWmh1IExpbmdz
aGFuIDIwMjAtMDUtMjbCoCAzMzIKPj4gYTg0ZGRiZjFlZjI5ZjEgWmh1IExpbmdzaGFuIDIwMjAt
MDUtMjbCoCAzMzPCoMKgwqDCoMKgIGlmIChldmVudGZwICE9IAo+PiB2cS0+a2ljaykgewo+PiBh
ODRkZGJmMWVmMjlmMSBaaHUgTGluZ3NoYW4gMjAyMC0wNS0yNsKgIDMzNMKgwqDCoMKgwqDCoMKg
wqDCoCBwb2xsc3RvcCA9IAo+PiAoZmlsZXAgPSB2cS0+a2ljaykgIT0gTlVMTDsKPj4gYTg0ZGRi
ZjFlZjI5ZjEgWmh1IExpbmdzaGFuIDIwMjAtMDUtMjbCoCAzMzXCoMKgwqDCoMKgwqDCoMKgwqAg
cG9sbHN0YXJ0ID0gCj4+ICh2cS0+a2ljayA9IGV2ZW50ZnApICE9IE5VTEw7Cj4+IGE4NGRkYmYx
ZWYyOWYxIFpodSBMaW5nc2hhbiAyMDIwLTA1LTI2wqAgMzM2wqDCoMKgwqDCoCB9IGVsc2UKPj4g
YTg0ZGRiZjFlZjI5ZjEgWmh1IExpbmdzaGFuIDIwMjAtMDUtMjbCoCAzMzfCoMKgwqDCoMKgwqDC
oMKgwqAgZmlsZXAgPSBldmVudGZwOwo+PiBhODRkZGJmMWVmMjlmMSBaaHUgTGluZ3NoYW4gMjAy
MC0wNS0yNsKgIDMzOAo+PiBhODRkZGJmMWVmMjlmMSBaaHUgTGluZ3NoYW4gMjAyMC0wNS0yNsKg
IDMzOcKgwqDCoMKgwqAgaWYgKHBvbGxzdG9wICYmIAo+PiB2cS0+aGFuZGxlX2tpY2spCj4+IGE4
NGRkYmYxZWYyOWYxIFpodSBMaW5nc2hhbiAyMDIwLTA1LTI2wqAgMzQwIHZob3N0X3ZkcGFfcG9s
bF9zdG9wKHZxKTsKPj4gYTg0ZGRiZjFlZjI5ZjEgWmh1IExpbmdzaGFuIDIwMjAtMDUtMjbCoCAz
NDEKPj4gYTg0ZGRiZjFlZjI5ZjEgWmh1IExpbmdzaGFuIDIwMjAtMDUtMjbCoCAzNDLCoMKgwqDC
oMKgIGlmIChmaWxlcCkKPj4gYTg0ZGRiZjFlZjI5ZjEgWmh1IExpbmdzaGFuIDIwMjAtMDUtMjbC
oCAzNDMgZnB1dChmaWxlcCk7Cj4+IGE4NGRkYmYxZWYyOWYxIFpodSBMaW5nc2hhbiAyMDIwLTA1
LTI2wqAgMzQ0Cj4+IGE4NGRkYmYxZWYyOWYxIFpodSBMaW5nc2hhbiAyMDIwLTA1LTI2wqAgMzQ1
wqDCoMKgwqDCoCBpZiAocG9sbHN0YXJ0ICYmIAo+PiB2cS0+aGFuZGxlX2tpY2spCj4+IGE4NGRk
YmYxZWYyOWYxIFpodSBMaW5nc2hhbiAyMDIwLTA1LTI2wqAgMzQ2wqDCoMKgwqDCoMKgwqDCoMKg
IHIgPSAKPj4gdmhvc3RfdmRwYV9wb2xsX3N0YXJ0KHZxKTsKPj4KPj4gInIiIG5vdCBpbml0aWFs
aXplZCBvbiBlbHNlIHBhdGguCj4+Cj4+IGE4NGRkYmYxZWYyOWYxIFpodSBMaW5nc2hhbiAyMDIw
LTA1LTI2wqAgMzQ3Cj4+IGE4NGRkYmYxZWYyOWYxIFpodSBMaW5nc2hhbiAyMDIwLTA1LTI2IEAz
NDjCoMKgwqDCoMKgIHJldHVybiByOwo+PiBhODRkZGJmMWVmMjlmMSBaaHUgTGluZ3NoYW4gMjAy
MC0wNS0yNsKgIDM0OcKgIH0KPgo+Cj4gV2lsbCBmaXguCj4KPiBUaGFua3MgCgoKTGluZ3NoYW4g
cmVtaW5kcyBtZSB0aGF0IHdlJ3ZlIHBvc3RlZCBWMiB3aGljaCByZXVzZXMgdGhlIHZob3N0LmMg
CmltcGxlbWVudGF0aW9uIGZvciBwb2xsaW5nLgoKU28gdGhlcmUncyBubyBuZWVkIGZvciB0aGUg
Zml4LgoKVGhhbmtzCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5s
aW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFp
bG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
