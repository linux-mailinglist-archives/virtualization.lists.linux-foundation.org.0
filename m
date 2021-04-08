Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A82357EA2
	for <lists.virtualization@lfdr.de>; Thu,  8 Apr 2021 11:01:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA78D400E6;
	Thu,  8 Apr 2021 09:01:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rolZP0cb_vSX; Thu,  8 Apr 2021 09:01:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99E55405C4;
	Thu,  8 Apr 2021 09:01:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 18EF3C000A;
	Thu,  8 Apr 2021 09:01:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 33DBBC000A
 for <virtualization@lists.linux-foundation.org>;
 Thu,  8 Apr 2021 09:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CC8141872
 for <virtualization@lists.linux-foundation.org>;
 Thu,  8 Apr 2021 09:01:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sanMVdiPJ0oA
 for <virtualization@lists.linux-foundation.org>;
 Thu,  8 Apr 2021 09:01:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 322D340E9A
 for <virtualization@lists.linux-foundation.org>;
 Thu,  8 Apr 2021 09:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617872509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bd0XkAkp0u7oQzy6N4znighkJ1TVo4lYhUV0ZZUVvFQ=;
 b=ByFYvHHp+md9au9zfxknTQj9i3fPZxbkYe+T8tzHZ00ATwrXAM1yiOY1EymEFPSUj/nEAp
 6cNrOSGsR+lOBj8rpwIBv/Mh1kB/gZrHvkT5mP5jtPxEfNenrzUaBrS32q2yxWjC8SFpf6
 vMR8oDUIy0GwRiKn/1EnP2Nz3h1g77o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-h-I7I4jcP2S4GNT2yL1UHg-1; Thu, 08 Apr 2021 05:01:45 -0400
X-MC-Unique: h-I7I4jcP2S4GNT2yL1UHg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F14418766D2;
 Thu,  8 Apr 2021 09:01:44 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-53.pek2.redhat.com
 [10.72.13.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AAED65C1C4;
 Thu,  8 Apr 2021 09:01:34 +0000 (UTC)
Subject: Re: [PATCH v2 2/3] virito_pci: add timeout to reset device operation
To: Max Gurtovoy <mgurtovoy@nvidia.com>, mst@redhat.com, kvm@vger.kernel.org, 
 virtualization@lists.linux-foundation.org
References: <20210408081109.56537-1-mgurtovoy@nvidia.com>
 <20210408081109.56537-2-mgurtovoy@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <2bead2b3-fa23-dc1e-3200-ddfa24944b75@redhat.com>
Date: Thu, 8 Apr 2021 17:01:32 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210408081109.56537-2-mgurtovoy@nvidia.com>
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

CtTaIDIwMjEvNC84IM/Czuc0OjExLCBNYXggR3VydG92b3kg0LS1wDoKPiBBY2NvcmRpbmcgdG8g
dGhlIHNwZWMgYWZ0ZXIgd3JpdGluZyAwIHRvIGRldmljZV9zdGF0dXMsIHRoZSBkcml2ZXIgTVVT
VAo+IHdhaXQgZm9yIGEgcmVhZCBvZiBkZXZpY2Vfc3RhdHVzIHRvIHJldHVybiAwIGJlZm9yZSBy
ZWluaXRpYWxpemluZyB0aGUKPiBkZXZpY2UuIEluIGNhc2Ugd2UgaGF2ZSBhIGRldmljZSB0aGF0
IHdvbid0IHJldHVybiAwLCB0aGUgcmVzZXQKPiBvcGVyYXRpb24gd2lsbCBsb29wIGZvcmV2ZXIg
YW5kIGNhdXNlIHRoZSBob3N0L3ZtIHRvIHN0dWNrLiBTZXQgdGltZW91dAo+IGZvciAzIG1pbnV0
ZXMgYmVmb3JlIGdpdmluZyB1cCBvbiB0aGUgZGV2aWNlLgo+Cj4gU2lnbmVkLW9mZi1ieTogTWF4
IEd1cnRvdm95IDxtZ3VydG92b3lAbnZpZGlhLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvdmlydGlv
L3ZpcnRpb19wY2lfbW9kZXJuLmMgfCAxMCArKysrKysrKystCj4gICAxIGZpbGUgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92
aXJ0aW8vdmlydGlvX3BjaV9tb2Rlcm4uYyBiL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19wY2lfbW9k
ZXJuLmMKPiBpbmRleCBjYzM0MTJhOTZhMTcuLmRjZWU2MTZlOGQyMSAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL3ZpcnRpby92aXJ0aW9fcGNpX21vZGVybi5jCj4gKysrIGIvZHJpdmVycy92aXJ0aW8v
dmlydGlvX3BjaV9tb2Rlcm4uYwo+IEBAIC0xNjIsNiArMTYyLDcgQEAgc3RhdGljIGludCB2cF9y
ZXNldChzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldikKPiAgIHsKPiAgIAlzdHJ1Y3QgdmlydGlv
X3BjaV9kZXZpY2UgKnZwX2RldiA9IHRvX3ZwX2RldmljZSh2ZGV2KTsKPiAgIAlzdHJ1Y3Qgdmly
dGlvX3BjaV9tb2Rlcm5fZGV2aWNlICptZGV2ID0gJnZwX2Rldi0+bWRldjsKPiArCXVuc2lnbmVk
IGxvbmcgdGltZW91dCA9IGppZmZpZXMgKyBtc2Vjc190b19qaWZmaWVzKDE4MDAwMCk7Cj4gICAK
PiAgIAkvKiAwIHN0YXR1cyBtZWFucyBhIHJlc2V0LiAqLwo+ICAgCXZwX21vZGVybl9zZXRfc3Rh
dHVzKG1kZXYsIDApOwo+IEBAIC0xNjksOSArMTcwLDE2IEBAIHN0YXRpYyBpbnQgdnBfcmVzZXQo
c3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYpCj4gICAJICogZGV2aWNlX3N0YXR1cyB0byByZXR1
cm4gMCBiZWZvcmUgcmVpbml0aWFsaXppbmcgdGhlIGRldmljZS4KPiAgIAkgKiBUaGlzIHdpbGwg
Zmx1c2ggb3V0IHRoZSBzdGF0dXMgd3JpdGUsIGFuZCBmbHVzaCBpbiBkZXZpY2Ugd3JpdGVzLAo+
ICAgCSAqIGluY2x1ZGluZyBNU0ktWCBpbnRlcnJ1cHRzLCBpZiBhbnkuCj4gKwkgKiBTZXQgYSB0
aW1lb3V0IGJlZm9yZSBnaXZpbmcgdXAgb24gdGhlIGRldmljZS4KPiAgIAkgKi8KPiAtCXdoaWxl
ICh2cF9tb2Rlcm5fZ2V0X3N0YXR1cyhtZGV2KSkKPiArCXdoaWxlICh2cF9tb2Rlcm5fZ2V0X3N0
YXR1cyhtZGV2KSkgewo+ICsJCWlmICh0aW1lX2FmdGVyKGppZmZpZXMsIHRpbWVvdXQpKSB7CgoK
V2hhdCBoYXBwZW5zIGlmIHRoZSBkZXZpY2UgZmluaXNoIHRoZSByZXN0IGFmdGVyIHRoZSB0aW1l
b3V0PwoKVGhhbmtzCgoKPiArCQkJZGV2X2VycigmdmRldi0+ZGV2LCAidmlydGlvOiBkZXZpY2Ug
bm90IHJlYWR5LiAiCj4gKwkJCQkiQWJvcnRpbmcuIFRyeSBhZ2FpbiBsYXRlclxuIik7Cj4gKwkJ
CXJldHVybiAtRUFHQUlOOwo+ICsJCX0KPiAgIAkJbXNsZWVwKDEpOwo+ICsJfQo+ICAgCS8qIEZs
dXNoIHBlbmRpbmcgVlEvY29uZmlndXJhdGlvbiBjYWxsYmFja3MuICovCj4gICAJdnBfc3luY2hy
b25pemVfdmVjdG9ycyh2ZGV2KTsKPiAgIAlyZXR1cm4gMDsKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApW
aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxp
bnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
