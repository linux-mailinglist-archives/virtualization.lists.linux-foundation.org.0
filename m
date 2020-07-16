Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 808EE221DF0
	for <lists.virtualization@lfdr.de>; Thu, 16 Jul 2020 10:11:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 068BF226FC;
	Thu, 16 Jul 2020 08:11:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 57C5SfDP3giB; Thu, 16 Jul 2020 08:11:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 98721226D4;
	Thu, 16 Jul 2020 08:11:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 729B2C0733;
	Thu, 16 Jul 2020 08:11:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76A13C0733
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 08:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7274E887D8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 08:11:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rBePRfD3AvRx
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 08:11:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6100B887B5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 08:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594887071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+L2ONyaQijNqMbyzSxVRLO1Pc+Tfqc2nXAiP2fBOrgg=;
 b=jINqbe7XSOAXphQH0CToayoBSzt+7zuuxZu4apN2HeyHhBNC8L51oyIc1irpFSTBzLaf7r
 a87FhLj1s+4evAS9lkDvfRVk9XaphoEIVCOaBo4QuF2Y+GB/0oIl+6TEo/aYEK38Dk/+tk
 hh6hSdILsFYIQdPfj8oIyQ0iaA8QItk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-8kxbf2VPMoaGa_C4-2-5Cg-1; Thu, 16 Jul 2020 04:11:09 -0400
X-MC-Unique: 8kxbf2VPMoaGa_C4-2-5Cg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F07238015FB;
 Thu, 16 Jul 2020 08:11:07 +0000 (UTC)
Received: from [10.72.12.131] (ovpn-12-131.pek2.redhat.com [10.72.12.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 803B210098A4;
 Thu, 16 Jul 2020 08:11:02 +0000 (UTC)
Subject: Re: [PATCH vhost next 06/10] vdpa: Add means to communicate vq status
 on get_vq_state
To: Eli Cohen <eli@mellanox.com>, mst@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20200716072327.5359-1-eli@mellanox.com>
 <20200716072327.5359-7-eli@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <cb9bced7-1a7e-150a-875c-1b75f77ee853@redhat.com>
Date: Thu, 16 Jul 2020 16:11:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200716072327.5359-7-eli@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: shahafs@mellanox.com, Parav Pandit <parav@mellanox.com>,
 saeedm@mellanox.com
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

Ck9uIDIwMjAvNy8xNiDkuIvljYgzOjIzLCBFbGkgQ29oZW4gd3JvdGU6Cj4gQ3VycmVudGx5LCBn
ZXRfdnFfc3RhdGUoKSBpcyB1c2VkIG9ubHkgdG8gcGFzcyB0aGUgYXZhaWxhYmxlIGluZGV4IHZh
bHVlCj4gb2YgYSB2cS4gRXh0ZW5kIHRoZSBzdHJ1Y3QgdG8gcmV0dXJuIHN0YXR1cyBvbiB0aGUg
VlEgdG8gdGhlIGNhbGxlci4KPiBGb3Igbm93LCBkZWZpbmUgVlFfU1RBVEVfTk9UX1JFQURZLiBJ
biB0aGUgZnV0dXJlIGl0IHdpbGwgYmUgZXh0ZW5kZWQgdG8KPiBpbmNsdWRlIG90aGVyIGluZm9t
cmF0aW9uLgo+Cj4gTW9kaWZ5IGN1cnJlbnQgdmRwYSBkcml2ZXIgdG8gdXBkYXRlIHRoaXMgZmll
bGQuCj4KPiBSZXZpZXdlZC1ieTogUGFyYXYgUGFuZGl0IDxwYXJhdkBtZWxsYW5veC5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogRWxpIENvaGVuIDxlbGlAbWVsbGFub3guY29tPgoKCldoYXQncyB0aGUg
ZGlmZmVyZW5jZSBiZXR3ZWVuIHRoaXMgYW5kIGdldF92cV9yZWFkeSgpPwoKVGhhbmtzCgoKPiAt
LS0KPiAgIGRyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9tYWluLmMgIHwgMSArCj4gICBkcml2ZXJz
L3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW0uYyB8IDEgKwo+ICAgaW5jbHVkZS9saW51eC92ZHBhLmgg
ICAgICAgICAgICAgfCA5ICsrKysrKysrKwo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRp
b25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYyBi
L2RyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9tYWluLmMKPiBpbmRleCA2OTAzMmVlOTc4MjQuLjc3
ZTNiM2Q5MTE2NyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5j
Cj4gKysrIGIvZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYwo+IEBAIC0yNDAsNiArMjQw
LDcgQEAgc3RhdGljIHZvaWQgaWZjdmZfdmRwYV9nZXRfdnFfc3RhdGUoc3RydWN0IHZkcGFfZGV2
aWNlICp2ZHBhX2RldiwgdTE2IHFpZCwKPiAgIHsKPiAgIAlzdHJ1Y3QgaWZjdmZfaHcgKnZmID0g
dmRwYV90b192Zih2ZHBhX2Rldik7Cj4gICAKPiArCXN0YXRlLT5zdGF0ZSA9IHZmLT52cmluZ1tx
aWRdLnJlYWR5ID8gMCA6IEJJVChWUV9TVEFURV9OT1RfUkVBRFkpOwo+ICAgCXN0YXRlLT5hdmFp
bF9pbmRleCA9IGlmY3ZmX2dldF92cV9zdGF0ZSh2ZiwgcWlkKTsKPiAgIH0KPiAgIAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW0uYyBiL2RyaXZlcnMvdmRwYS92
ZHBhX3NpbS92ZHBhX3NpbS5jCj4gaW5kZXggNTk5NTE5MDM5ZjhkLi4wNmQ5NzRiNGJkN2IgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy92ZHBhL3ZkcGFfc2ltL3ZkcGFfc2ltLmMKPiArKysgYi9kcml2
ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW0uYwo+IEBAIC00MzQsNiArNDM0LDcgQEAgc3RhdGlj
IHZvaWQgdmRwYXNpbV9nZXRfdnFfc3RhdGUoc3RydWN0IHZkcGFfZGV2aWNlICp2ZHBhLCB1MTYg
aWR4LAo+ICAgCXN0cnVjdCB2ZHBhc2ltX3ZpcnRxdWV1ZSAqdnEgPSAmdmRwYXNpbS0+dnFzW2lk
eF07Cj4gICAJc3RydWN0IHZyaW5naCAqdnJoID0gJnZxLT52cmluZzsKPiAgIAo+ICsJc3RhdGUt
PnN0YXRlID0gdnEtPnJlYWR5ID8gMCA6IEJJVChWUV9TVEFURV9OT1RfUkVBRFkpOwo+ICAgCXN0
YXRlLT5hdmFpbF9pbmRleCA9IHZyaC0+bGFzdF9hdmFpbF9pZHg7Cj4gICB9Cj4gICAKPiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9saW51eC92ZHBhLmggYi9pbmNsdWRlL2xpbnV4L3ZkcGEuaAo+IGlu
ZGV4IDdiMDg4YmViZmZlOC4uYmNlZmEzMGEzYjJmIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGlu
dXgvdmRwYS5oCj4gKysrIGIvaW5jbHVkZS9saW51eC92ZHBhLmgKPiBAQCAtMjcsMTIgKzI3LDIx
IEBAIHN0cnVjdCB2ZHBhX25vdGlmaWNhdGlvbl9hcmVhIHsKPiAgIAlyZXNvdXJjZV9zaXplX3Qg
c2l6ZTsKPiAgIH07Cj4gICAKPiArLyoqCj4gKyAqIEJpdG1hc2sgZGVzY3JpYmluZyB0aGUgc3Rh
dHVzIG9mIHRoZSB2cQo+ICsgKi8KPiArZW51bSB7Cj4gKwlWUV9TVEFURV9OT1RfUkVBRFkgPSAw
LAo+ICt9Owo+ICsKPiAgIC8qKgo+ICAgICogdkRQQSB2cV9zdGF0ZSBkZWZpbml0aW9uCj4gICAg
KiBAYXZhaWxfaW5kZXg6IGF2YWlsYWJsZSBpbmRleAo+ICsgKiBAc3RhdGU6IHJldHVybmVkIHN0
YXR1cyBmcm9tIGdldF92cV9zdGF0ZQo+ICAgICovCj4gICBzdHJ1Y3QgdmRwYV92cV9zdGF0ZSB7
Cj4gICAJdTE2CWF2YWlsX2luZGV4Owo+ICsJdTMyCXN0YXRlOwo+ICAgfTsKPiAgIAo+ICAgLyoq
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFs
aXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlv
bi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8v
dmlydHVhbGl6YXRpb24=
