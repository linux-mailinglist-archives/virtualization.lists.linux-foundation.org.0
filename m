Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7EA358478
	for <lists.virtualization@lfdr.de>; Thu,  8 Apr 2021 15:18:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D95460676;
	Thu,  8 Apr 2021 13:18:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 80ywdNt75BQK; Thu,  8 Apr 2021 13:18:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42F4C606DF;
	Thu,  8 Apr 2021 13:18:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CCADDC000A;
	Thu,  8 Apr 2021 13:18:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8DABFC000A
 for <virtualization@lists.linux-foundation.org>;
 Thu,  8 Apr 2021 13:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F858606DE
 for <virtualization@lists.linux-foundation.org>;
 Thu,  8 Apr 2021 13:18:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fEJ77qQZkchP
 for <virtualization@lists.linux-foundation.org>;
 Thu,  8 Apr 2021 13:18:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA76260676
 for <virtualization@lists.linux-foundation.org>;
 Thu,  8 Apr 2021 13:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617887918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PiO3GvP9OJOtaO934VB9+eCT8vSHoSl1RS40T3FyfR4=;
 b=S/sU7MBiavapUHRo7tNkVcp25RPAalpNUUtcdIaBj1A2pEgK0BrPan9KcVKNVJCaBa7rRV
 UCUOgZDT0XOZENjuBaoCoA+raPJe+lBTfJdMjPe/TXSiur0xw26O0n8BNAYGnngCERt1Up
 5Lr9adQyQOym9Q+PKF2VAM+qPfIqThY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-1pPep34SOE21HGMUXwbNcg-1; Thu, 08 Apr 2021 09:18:35 -0400
X-MC-Unique: 1pPep34SOE21HGMUXwbNcg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32C59107ACCA;
 Thu,  8 Apr 2021 13:18:34 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-93.pek2.redhat.com
 [10.72.12.93])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A70A95C1C4;
 Thu,  8 Apr 2021 13:18:28 +0000 (UTC)
Subject: Re: [PATCH v2 2/3] virito_pci: add timeout to reset device operation
To: Max Gurtovoy <mgurtovoy@nvidia.com>, mst@redhat.com, kvm@vger.kernel.org, 
 virtualization@lists.linux-foundation.org
References: <20210408081109.56537-1-mgurtovoy@nvidia.com>
 <20210408081109.56537-2-mgurtovoy@nvidia.com>
 <2bead2b3-fa23-dc1e-3200-ddfa24944b75@redhat.com>
 <a00abefe-790d-8239-ac42-9f70daa7a25c@nvidia.com>
 <93221213-8fc3-96ef-7e89-b7c03bea5322@redhat.com>
 <7ed9cafa-498e-156d-c667-6da3fa432b18@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <2b4edcaf-779d-b197-0437-c6cb8e82e8e1@redhat.com>
Date: Thu, 8 Apr 2021 21:18:26 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <7ed9cafa-498e-156d-c667-6da3fa432b18@nvidia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: nitzanc@nvidia.com, oren@nvidia.com, cohuck@redhat.com
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

CuWcqCAyMDIxLzQvOCDkuIvljYg4OjU3LCBNYXggR3VydG92b3kg5YaZ6YGTOgo+Cj4gT24gNC84
LzIwMjEgMzo0NSBQTSwgSmFzb24gV2FuZyB3cm90ZToKPj4KPj4g5ZyoIDIwMjEvNC84IOS4i+WN
iDU6NDQsIE1heCBHdXJ0b3ZveSDlhpnpgZM6Cj4+Pgo+Pj4gT24gNC84LzIwMjEgMTI6MDEgUE0s
IEphc29uIFdhbmcgd3JvdGU6Cj4+Pj4KPj4+PiDlnKggMjAyMS80Lzgg5LiL5Y2INDoxMSwgTWF4
IEd1cnRvdm95IOWGmemBkzoKPj4+Pj4gQWNjb3JkaW5nIHRvIHRoZSBzcGVjIGFmdGVyIHdyaXRp
bmcgMCB0byBkZXZpY2Vfc3RhdHVzLCB0aGUgZHJpdmVyIAo+Pj4+PiBNVVNUCj4+Pj4+IHdhaXQg
Zm9yIGEgcmVhZCBvZiBkZXZpY2Vfc3RhdHVzIHRvIHJldHVybiAwIGJlZm9yZSByZWluaXRpYWxp
emluZyAKPj4+Pj4gdGhlCj4+Pj4+IGRldmljZS4gSW4gY2FzZSB3ZSBoYXZlIGEgZGV2aWNlIHRo
YXQgd29uJ3QgcmV0dXJuIDAsIHRoZSByZXNldAo+Pj4+PiBvcGVyYXRpb24gd2lsbCBsb29wIGZv
cmV2ZXIgYW5kIGNhdXNlIHRoZSBob3N0L3ZtIHRvIHN0dWNrLiBTZXQgCj4+Pj4+IHRpbWVvdXQK
Pj4+Pj4gZm9yIDMgbWludXRlcyBiZWZvcmUgZ2l2aW5nIHVwIG9uIHRoZSBkZXZpY2UuCj4+Pj4+
Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IE1heCBHdXJ0b3ZveSA8bWd1cnRvdm95QG52aWRpYS5jb20+
Cj4+Pj4+IC0tLQo+Pj4+PiDCoCBkcml2ZXJzL3ZpcnRpby92aXJ0aW9fcGNpX21vZGVybi5jIHwg
MTAgKysrKysrKysrLQo+Pj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnRpby92aXJ0
aW9fcGNpX21vZGVybi5jIAo+Pj4+PiBiL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19wY2lfbW9kZXJu
LmMKPj4+Pj4gaW5kZXggY2MzNDEyYTk2YTE3Li5kY2VlNjE2ZThkMjEgMTAwNjQ0Cj4+Pj4+IC0t
LSBhL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19wY2lfbW9kZXJuLmMKPj4+Pj4gKysrIGIvZHJpdmVy
cy92aXJ0aW8vdmlydGlvX3BjaV9tb2Rlcm4uYwo+Pj4+PiBAQCAtMTYyLDYgKzE2Miw3IEBAIHN0
YXRpYyBpbnQgdnBfcmVzZXQoc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYpCj4+Pj4+IMKgIHsK
Pj4+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgdmlydGlvX3BjaV9kZXZpY2UgKnZwX2RldiA9IHRvX3Zw
X2RldmljZSh2ZGV2KTsKPj4+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgdmlydGlvX3BjaV9tb2Rlcm5f
ZGV2aWNlICptZGV2ID0gJnZwX2Rldi0+bWRldjsKPj4+Pj4gK8KgwqDCoCB1bnNpZ25lZCBsb25n
IHRpbWVvdXQgPSBqaWZmaWVzICsgbXNlY3NfdG9famlmZmllcygxODAwMDApOwo+Pj4+PiDCoCDC
oMKgwqDCoMKgIC8qIDAgc3RhdHVzIG1lYW5zIGEgcmVzZXQuICovCj4+Pj4+IMKgwqDCoMKgwqAg
dnBfbW9kZXJuX3NldF9zdGF0dXMobWRldiwgMCk7Cj4+Pj4+IEBAIC0xNjksOSArMTcwLDE2IEBA
IHN0YXRpYyBpbnQgdnBfcmVzZXQoc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYpCj4+Pj4+IMKg
wqDCoMKgwqDCoCAqIGRldmljZV9zdGF0dXMgdG8gcmV0dXJuIDAgYmVmb3JlIHJlaW5pdGlhbGl6
aW5nIHRoZSBkZXZpY2UuCj4+Pj4+IMKgwqDCoMKgwqDCoCAqIFRoaXMgd2lsbCBmbHVzaCBvdXQg
dGhlIHN0YXR1cyB3cml0ZSwgYW5kIGZsdXNoIGluIGRldmljZSAKPj4+Pj4gd3JpdGVzLAo+Pj4+
PiDCoMKgwqDCoMKgwqAgKiBpbmNsdWRpbmcgTVNJLVggaW50ZXJydXB0cywgaWYgYW55Lgo+Pj4+
PiArwqDCoMKgwqAgKiBTZXQgYSB0aW1lb3V0IGJlZm9yZSBnaXZpbmcgdXAgb24gdGhlIGRldmlj
ZS4KPj4+Pj4gwqDCoMKgwqDCoMKgICovCj4+Pj4+IC3CoMKgwqAgd2hpbGUgKHZwX21vZGVybl9n
ZXRfc3RhdHVzKG1kZXYpKQo+Pj4+PiArwqDCoMKgIHdoaWxlICh2cF9tb2Rlcm5fZ2V0X3N0YXR1
cyhtZGV2KSkgewo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHRpbWVfYWZ0ZXIoamlmZmllcywg
dGltZW91dCkpIHsKPj4+Pgo+Pj4+Cj4+Pj4gV2hhdCBoYXBwZW5zIGlmIHRoZSBkZXZpY2UgZmlu
aXNoIHRoZSByZXN0IGFmdGVyIHRoZSB0aW1lb3V0Pwo+Pj4KPj4+Cj4+PiBUaGUgZHJpdmVyIHdp
bGwgc2V0IFZJUlRJT19DT05GSUdfU19GQUlMRUQgYW5kIG9uZSBjYW4gcmUtcHJvYmUgaXQgCj4+
PiBsYXRlciBvbiAoZS5nIGJ5IHJlLXNjYW5uaW5nIHRoZSBwY2kgYnVzKS4KPj4KPj4KPj4gT2ss
IHNvIGRvIHdlIG5lZWQgdGhlIGZsdXNoIHRocm91Z2ggdnBfc3luY2hyb25pemVfdmVjdG9ycygp
IGhlcmU/Cj4KPiBJZiB0aGUgZGV2aWNlIGRpZG4ndCB3cml0ZSAwIHRvIHN0YXR1cyBJIGd1ZXNz
IHdlIGRvbid0IG5lZWQgdGhhdC4KPgo+IFRoZSBkZXZpY2Ugc2hvdWxkbid0IHJhaXNlIGFueSBp
bnRlcnJ1cHQgYmVmb3JlIG5lZ290aWF0aW9uIGZpbmlzaCAKPiBzdWNjZXNzZnVsbHkuCgoKVGhl
IHJlc2V0IGNvdWxkIGJlIHRyaWdnZXJlZCBpbiBvdGhlciBwbGFjZXMgbGlrZSBkcml2ZXIgcmVt
b3ZpbmcuCgpUaGFua3MKCgo+Cj4gTVNULCBpcyB0aGF0IGNvcnJlY3QgPwo+Cj4+Cj4+IFRoYW5r
cwo+Pgo+Pgo+Pj4KPj4+Cj4+Pj4KPj4+PiBUaGFua3MKPj4+Pgo+Pj4+Cj4+Pj4+ICsgZGV2X2Vy
cigmdmRldi0+ZGV2LCAidmlydGlvOiBkZXZpY2Ugbm90IHJlYWR5LiAiCj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIkFib3J0aW5nLiBUcnkgYWdhaW4gbGF0ZXJcbiIpOwo+
Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVBR0FJTjsKPj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIH0KPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIG1zbGVlcCgxKTsKPj4+Pj4gK8Kg
wqDCoCB9Cj4+Pj4+IMKgwqDCoMKgwqAgLyogRmx1c2ggcGVuZGluZyBWUS9jb25maWd1cmF0aW9u
IGNhbGxiYWNrcy4gKi8KPj4+Pj4gwqDCoMKgwqDCoCB2cF9zeW5jaHJvbml6ZV92ZWN0b3JzKHZk
ZXYpOwo+Pj4+PiDCoMKgwqDCoMKgIHJldHVybiAwOwo+Pj4+Cj4+Pgo+Pgo+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWls
aW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6
Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRp
b24=
