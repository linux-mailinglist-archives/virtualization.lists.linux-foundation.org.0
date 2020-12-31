Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 993772E7DB4
	for <lists.virtualization@lfdr.de>; Thu, 31 Dec 2020 03:37:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1D8402E0FA;
	Thu, 31 Dec 2020 02:37:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 04Y3rl-nHoml; Thu, 31 Dec 2020 02:37:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2DF952E0F9;
	Thu, 31 Dec 2020 02:37:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ED0EBC013A;
	Thu, 31 Dec 2020 02:37:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2177FC013A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 31 Dec 2020 02:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 07BD886A00
 for <virtualization@lists.linux-foundation.org>;
 Thu, 31 Dec 2020 02:37:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4eiv37BbiK8N
 for <virtualization@lists.linux-foundation.org>;
 Thu, 31 Dec 2020 02:37:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A84038697D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 31 Dec 2020 02:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609382234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bT6v+Ec3+GbfoduwGKdxSsf6srhaUGcfdLab8NVdm2s=;
 b=O4BPz8IiqhYfWBhividbbnNVC0Nt2u7axhnTtpAaJ8f/NGa/7Jm8ycgDxY0z54A8yUZISq
 wCZY+vq+9UTwcVJgMXOtaycYej6qPt8Ndm7zyUCU71V4mZwGBATtOXSQfTMyD2//3f4awL
 gt83u3bQcSQiXxBJV8BJtDtrQ+pPv+k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-GeJektIsNXyPt9-_fNw6JQ-1; Wed, 30 Dec 2020 21:37:12 -0500
X-MC-Unique: GeJektIsNXyPt9-_fNw6JQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D02418030A1;
 Thu, 31 Dec 2020 02:37:10 +0000 (UTC)
Received: from [10.72.12.236] (ovpn-12-236.pek2.redhat.com [10.72.12.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4058D60BE2;
 Thu, 31 Dec 2020 02:36:59 +0000 (UTC)
Subject: Re: [PATCH 12/21] vhost-vdpa: introduce uAPI to get the number of
 virtqueue groups
To: Eli Cohen <elic@nvidia.com>
References: <20201216064818.48239-1-jasowang@redhat.com>
 <20201216064818.48239-13-jasowang@redhat.com>
 <20201230100506.GB5241@mtl-vdi-166.wap.labs.mlnx>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c3fe570c-6130-c8c8-1209-54e2120d93f0@redhat.com>
Date: Thu, 31 Dec 2020 10:36:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201230100506.GB5241@mtl-vdi-166.wap.labs.mlnx>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: lulu@redhat.com, kvm@vger.kernel.org, mst@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 stefanha@redhat.com, eli@mellanox.com, lingshan.zhu@intel.com,
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

Ck9uIDIwMjAvMTIvMzAg5LiL5Y2INjowNSwgRWxpIENvaGVuIHdyb3RlOgo+IE9uIFdlZCwgRGVj
IDE2LCAyMDIwIGF0IDAyOjQ4OjA5UE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+IEZvbGxv
d3MgdGhlIHZEUEEgc3VwcG9ydCBmb3IgbXVsdGlwbGUgYWRkcmVzcyBzcGFjZXMsIHRoaXMgcGF0
Y2gKPj4gaW50cm9kdWNlIHVBUEkgZm9yIHRoZSB1c2Vyc3BhY2UgdG8ga25vdyB0aGUgbnVtYmVy
IG9mIHZpcnRxdWV1ZQo+PiBncm91cHMgc3VwcG9ydGVkIGJ5IHRoZSB2RFBBIGRldmljZS4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogSmFzb24gV2FuZzxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+PiAtLS0K
Pj4gICBkcml2ZXJzL3Zob3N0L3ZkcGEuYyAgICAgICB8IDQgKysrKwo+PiAgIGluY2x1ZGUvdWFw
aS9saW51eC92aG9zdC5oIHwgMyArKysKPj4gICAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC92ZHBhLmMgYi9kcml2ZXJzL3Zo
b3N0L3ZkcGEuYwo+PiBpbmRleCAwNjBkNWI1YjdlNjQuLjFiYTU5MDFiMjhlNyAxMDA2NDQKPj4g
LS0tIGEvZHJpdmVycy92aG9zdC92ZHBhLmMKPj4gKysrIGIvZHJpdmVycy92aG9zdC92ZHBhLmMK
Pj4gQEAgLTUzNiw2ICs1MzYsMTAgQEAgc3RhdGljIGxvbmcgdmhvc3RfdmRwYV91bmxvY2tlZF9p
b2N0bChzdHJ1Y3QgZmlsZSAqZmlsZXAsCj4+ICAgCWNhc2UgVkhPU1RfVkRQQV9HRVRfVlJJTkdf
TlVNOgo+PiAgIAkJciA9IHZob3N0X3ZkcGFfZ2V0X3ZyaW5nX251bSh2LCBhcmdwKTsKPj4gICAJ
CWJyZWFrOwo+PiArCWNhc2UgVkhPU1RfVkRQQV9HRVRfR1JPVVBfTlVNOgo+PiArCQlyID0gY29w
eV90b191c2VyKGFyZ3AsICZ2LT52ZHBhLT5uZ3JvdXBzLAo+PiArCQkJCSBzaXplb2Yodi0+dmRw
YS0+bmdyb3VwcykpOwo+PiArCQlicmVhazsKPiBJcyB0aGlzIGFuZCBvdGhlciBpb2N0bHMgYWxy
ZWFkeSBzdXBwb3J0ZWQgaW4gcWVtdT8KCgpOb3QgeWV0LCB0aGUgcHJvdG90eXBlIGlzIHVuZGVy
IGRldmVsb3BtZW50LgoKSSB0ZXN0IHRoZSBzZXJpZXMgd2l0aCBhIHNtYWxsIGFuZCBkZWRpY2F0
ZWQgdXNlcnNwYWNlIHByb2dyYW0uCgpUaGFua3MKCgo+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmly
dHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51
eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
