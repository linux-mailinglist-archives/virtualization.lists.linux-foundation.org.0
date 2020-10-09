Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 628FA2880FE
	for <lists.virtualization@lfdr.de>; Fri,  9 Oct 2020 06:05:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D1992873C7;
	Fri,  9 Oct 2020 04:05:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3NshFX8ZkyTn; Fri,  9 Oct 2020 04:05:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B03C0873C9;
	Fri,  9 Oct 2020 04:05:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9B043C0051;
	Fri,  9 Oct 2020 04:05:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1A0ACC0051
 for <virtualization@lists.linux-foundation.org>;
 Fri,  9 Oct 2020 04:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0188586F0E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  9 Oct 2020 04:05:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qf4aAVEquUzD
 for <virtualization@lists.linux-foundation.org>;
 Fri,  9 Oct 2020 04:05:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CA3B986F0C
 for <virtualization@lists.linux-foundation.org>;
 Fri,  9 Oct 2020 04:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602216343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YKXcX1Zdg1COG+JHgP7kxCkfawMp8ssx2TcF3Bvm0fI=;
 b=TTwroaamE2V/V7AqPCfK5KlBszS5iOb37Dk+/jhbbEf5U0a7coi4awOVa4g1Xp127gkhny
 jrYAOytxgcmThliTRUIhVfRph9aS/j2bhux9QPPYrKn8d5L3+nN+I1cZleQca3FR3OqfOI
 JJ65iNFwm1VjFwr2e6y2Hip4nYj6Oio=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-MQnK_CGjM6qCMDUK3oEmaQ-1; Fri, 09 Oct 2020 00:05:41 -0400
X-MC-Unique: MQnK_CGjM6qCMDUK3oEmaQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06F5280B70A;
 Fri,  9 Oct 2020 04:05:40 +0000 (UTC)
Received: from [10.72.13.133] (ovpn-13-133.pek2.redhat.com [10.72.13.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8BB42100164C;
 Fri,  9 Oct 2020 04:05:20 +0000 (UTC)
Subject: Re: [PATCH v2] vringh: fix __vringh_iov() when riov and wiov are
 different
To: Stefano Garzarella <sgarzare@redhat.com>, mst@redhat.com
References: <20201008204256.162292-1-sgarzare@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <8d84abcb-2f2e-8f24-039f-447e8686b878@redhat.com>
Date: Fri, 9 Oct 2020 12:05:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201008204256.162292-1-sgarzare@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org,
 Rusty Russell <rusty@rustcorp.com.au>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjAvMTAvOSDkuIrljYg0OjQyLCBTdGVmYW5vIEdhcnphcmVsbGEgd3JvdGU6Cj4gSWYg
cmlvdiBhbmQgd2lvdiBhcmUgYm90aCBkZWZpbmVkIGFuZCB0aGV5IHBvaW50IHRvIGRpZmZlcmVu
dAo+IG9iamVjdHMsIG9ubHkgcmlvdiBpcyBpbml0aWFsaXplZC4gSWYgdGhlIHdpb3YgaXMgbm90
IGluaXRpYWxpemVkCj4gYnkgdGhlIGNhbGxlciwgdGhlIGZ1bmN0aW9uIGZhaWxzIHJldHVybmlu
ZyAtRUlOVkFMIGFuZCBwcmludGluZwo+ICJSZWFkYWJsZSBkZXNjIDB4Li4uIGFmdGVyIHdyaXRh
YmxlIiBlcnJvciBtZXNzYWdlLgo+Cj4gVGhpcyBpc3N1ZSBoYXBwZW5zIHdoZW4gZGVzY3JpcHRv
cnMgaGF2ZSBib3RoIHJlYWRhYmxlIGFuZCB3cml0YWJsZQo+IGJ1ZmZlcnMgKGVnLiB2aXJ0aW8t
YmxrIGRldmljZXMgaGFzIHZpcnRpb19ibGtfb3V0aGRyIGluIHRoZSByZWFkYWJsZQo+IGJ1ZmZl
ciBhbmQgc3RhdHVzIGFzIGxhc3QgYnl0ZSBvZiB3cml0YWJsZSBidWZmZXIpIGFuZCB3ZSBjYWxs
Cj4gX192cmluZ2hfaW92KCkgdG8gZ2V0IGJvdGggdHlwZSBvZiBidWZmZXJzIGluIHR3byBkaWZm
ZXJlbnQgaW92ZWNzLgo+Cj4gTGV0J3MgcmVwbGFjZSB0aGUgJ2Vsc2UgaWYnIGNsYXVzZSB3aXRo
ICdpZicgdG8gaW5pdGlhbGl6ZSBib3RoCj4gcmlvdiBhbmQgd2lvdiBpZiB0aGV5IGFyZSBub3Qg
TlVMTC4KPgo+IEFzIGNoZWNrcGF0Y2ggcG9pbnRlZCBvdXQsIHdlIGFsc28gYXZvaWQgY3Jhc2hp
bmcgdGhlIGtlcm5lbAo+IHdoZW4gcmlvdiBhbmQgd2lvdiBhcmUgYm90aCBOVUxMLCByZXBsYWNp
bmcgQlVHKCkgd2l0aCBXQVJOX09OKCkKPiBhbmQgcmV0dXJuaW5nIC1FSU5WQUwuCgoKSXQgbG9v
a3MgbGlrZSBJIG1ldCB0aGUgZXhhY3Qgc2ltaWxhciBpc3N1ZSB3aGVuIGRldmVsb3BpbmcgY3Ry
bCB2cSAKc3VwcG9ydCAod2hpY2ggcmVxdWlyZXMgYm90aCBSRUFEIGFuZCBXUklURSBkZXNjcmlw
dG9yKS4KCldoaWxlIEkgd2FzIHRyeWluZyB0byBmaXggdGhlIGlzc3VlIEkgZm91bmQgdGhlIGZv
bGxvd2luZyBjb21tZW50OgoKIMKgKiBOb3RlIHRoYXQgeW91IG1heSBuZWVkIHRvIGNsZWFuIHVw
IHJpb3YgYW5kIHdpb3YsIGV2ZW4gb24gZXJyb3IhCiDCoCovCmludCB2cmluZ2hfZ2V0ZGVzY19p
b3RsYihzdHJ1Y3QgdnJpbmdoICp2cmgsCgpJIHNhdyBzb21lIGRyaXZlciBjYWxsIHZyaW5naF9r
aW92X2NsZWFudXAoKS4KClNvIEkganVzdCBmb2xsb3cgdG8gdXNlIHRoYXQuCgpJJ20gbm90IHF1
aXRlIHN1cmUgd2hpY2ggb25lIGlzIGJldHRlci4KClRoYW5rcwoKCj4KPiBGaXhlczogZjg3ZDBm
YmI1Nzk4ICgidnJpbmdoOiBob3N0LXNpZGUgaW1wbGVtZW50YXRpb24gb2YgdmlydGlvIHJpbmdz
LiIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5v
IEdhcnphcmVsbGEgPHNnYXJ6YXJlQHJlZGhhdC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL3Zob3N0
L3ZyaW5naC5jIHwgOSArKysrKy0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC92cmluZ2gu
YyBiL2RyaXZlcnMvdmhvc3QvdnJpbmdoLmMKPiBpbmRleCBlMDU5YTlhNDdjZGYuLjhiZDhiNDAz
ZjA4NyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3Zob3N0L3ZyaW5naC5jCj4gKysrIGIvZHJpdmVy
cy92aG9zdC92cmluZ2guYwo+IEBAIC0yODQsMTMgKzI4NCwxNCBAQCBfX3ZyaW5naF9pb3Yoc3Ry
dWN0IHZyaW5naCAqdnJoLCB1MTYgaSwKPiAgIAlkZXNjX21heCA9IHZyaC0+dnJpbmcubnVtOwo+
ICAgCXVwX25leHQgPSAtMTsKPiAgIAo+ICsJLyogWW91IG11c3Qgd2FudCBzb21ldGhpbmchICov
Cj4gKwlpZiAoV0FSTl9PTighcmlvdiAmJiAhd2lvdikpCj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4g
Kwo+ICAgCWlmIChyaW92KQo+ICAgCQlyaW92LT5pID0gcmlvdi0+dXNlZCA9IDA7Cj4gLQllbHNl
IGlmICh3aW92KQo+ICsJaWYgKHdpb3YpCj4gICAJCXdpb3YtPmkgPSB3aW92LT51c2VkID0gMDsK
PiAtCWVsc2UKPiAtCQkvKiBZb3UgbXVzdCB3YW50IHNvbWV0aGluZyEgKi8KPiAtCQlCVUcoKTsK
PiAgIAo+ICAgCWZvciAoOzspIHsKPiAgIAkJdm9pZCAqYWRkcjsKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlz
dApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3Rz
LmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
