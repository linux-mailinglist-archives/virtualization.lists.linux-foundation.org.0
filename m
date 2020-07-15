Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id EF59E220E62
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 15:44:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 32D1F8ADF9;
	Wed, 15 Jul 2020 13:44:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id prDL9dvium4A; Wed, 15 Jul 2020 13:44:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A45588AE41;
	Wed, 15 Jul 2020 13:44:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 725C5C0733;
	Wed, 15 Jul 2020 13:44:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EFB7FC0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 13:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DF27081C8D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 13:44:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VknKs2-9RVom
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 13:44:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 016CF8077F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 13:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594820652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V8KfLaWJHj6Y1OsyGGHKMqQxSStqbhxCI0TTzkwPyUk=;
 b=IKYY/7bBfNoZ74aVCgrf42Cef6KxzkLM9KKKy/niEAiOgq1z5TgvFDaX10l3SW4gc6jqre
 Mn3g3yeYWJRWfvdyXK0IX7t0ILBhu0iQVLKLGVR4k+2bPzshvur0dkAyTZxxAVjtM9HvMB
 F4LMvaAuhFoItzS8JQdRHRwCPeXxaCo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-BIX9PabbOfakh4mznntczw-1; Wed, 15 Jul 2020 09:44:10 -0400
X-MC-Unique: BIX9PabbOfakh4mznntczw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64B41800EB6;
 Wed, 15 Jul 2020 13:44:09 +0000 (UTC)
Received: from [10.72.13.230] (ovpn-13-230.pek2.redhat.com [10.72.13.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5698372E53;
 Wed, 15 Jul 2020 13:43:57 +0000 (UTC)
Subject: Re: [PATCH 0/7] *** IRQ offloading for vDPA ***
To: Zhu Lingshan <lingshan.zhu@intel.com>, mst@redhat.com,
 alex.williamson@redhat.com, pbonzini@redhat.com,
 sean.j.christopherson@intel.com, wanpengli@tencent.com
References: <1594565524-3394-1-git-send-email-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <70244d80-08a4-da91-3226-7bfd2019467e@redhat.com>
Date: Wed, 15 Jul 2020 21:43:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594565524-3394-1-git-send-email-lingshan.zhu@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: netdev@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjAvNy8xMiDkuIvljYgxMDo1MiwgWmh1IExpbmdzaGFuIHdyb3RlOgo+IEhpIEFsbCwK
Pgo+IFRoaXMgc2VyaWVzIGludGVuZHMgdG8gaW1wbGVtZW50IElSUSBvZmZsb2FkaW5nIGZvcgo+
IHZob3N0X3ZkcGEuCj4KPiBCeSB0aGUgZmVhdCBvZiBpcnEgZm9yd2FyZGluZyBmYWNpbGl0aWVz
IGxpa2UgcG9zdGVkCj4gaW50ZXJydXB0IG9uIFg4NiwgaXJxIGJ5cGFzcyBjYW4gIGhlbHAgZGVs
aXZlcgo+IGludGVycnVwdHMgdG8gdkNQVSBkaXJlY3RseS4KPgo+IHZEUEEgZGV2aWNlcyBoYXZl
IGRlZGljYXRlZCBoYXJkd2FyZSBiYWNrZW5kcyBsaWtlIFZGSU8KPiBwYXNzLXRocm91Z2hlZCBk
ZXZpY2VzLiBTbyBpdCB3b3VsZCBiZSBwb3NzaWJsZSB0byBzZXR1cAo+IGlycSBvZmZsb2FkaW5n
KGlycSBieXBhc3MpIGZvciB2RFBBIGRldmljZXMgYW5kIGdhaW4KPiBwZXJmb3JtYW5jZSBpbXBy
b3ZlbWVudHMuCj4KPiBJbiBteSB0ZXN0aW5nLCB3aXRoIHRoaXMgZmVhdHVyZSwgd2UgY2FuIHNh
dmUgMC4xbXMKPiBpbiBhIHBpbmcgYmV0d2VlbiB0d28gVkZzIG9uIGF2ZXJhZ2UuCgoKSGkgTGlu
Z3NoYW46CgpEdXJpbmcgdGhlIHZpcnRpby1uZXR3b3JraW5nIG1lZXRpbmcsIE1pY2hhZWwgc3Bv
dHMgdHdvIHBvc3NpYmxlIGlzc3VlczoKCjEpIGRvIHdlIG5lZWQgYW4gbmV3IHVBUEkgdG8gc3Rv
cCB0aGUgaXJxIG9mZmxvYWRpbmc/CjIpIGNhbiBpbnRlcnJ1cHQgbG9zdCBkdXJpbmcgdGhlIGV2
ZW50ZmQgY3R4PwoKRm9yIDEpIEkgdGhpbmsgd2UgcHJvYmFibHkgbm90LCB3ZSBjYW4gYWxsb2Nh
dGUgYW4gaW5kZXBlbmRlbnQgZXZlbnRmZCAKd2hpY2ggZG9lcyBub3QgbWFwIHRvIE1TSVguIFNv
IHRoZSBjb25zdW1lciBjYW4ndCBtYXRjaCB0aGUgcHJvZHVjZXIgYW5kIAp3ZSBmYWxsYmFjayB0
byBldmVudGZkIGJhc2VkIGlycS4KRm9yIDIpIGl0IGxvb2tzIHRvIG1lIGd1ZXN0IHNob3VsZCBk
ZWFsIHdpdGggdGhlIGlycSBzeW5jaHJvbml6YXRpb24gCndoZW4gbWFzayBvciB1bm1hc2sgTVNJ
WCB2ZWN0b3JzLgoKV2hhdCdzIHlvdXIgdGhvdWdodD8KClRoYW5rcwoKCj4KPgo+IFpodSBMaW5n
c2hhbiAoNyk6Cj4gICAgdmhvc3Q6IGludHJvZHVjZSB2aG9zdF9jYWxsX2N0eAo+ICAgIGt2bS92
ZmlvOiBkZXRlY3QgYXNzaWduZWQgZGV2aWNlIHZpYSBpcnFieXBhc3MgbWFuYWdlcgo+ICAgIHZo
b3N0X3ZkcGE6IGltcGxlbWVudCBJUlEgb2ZmbG9hZGluZyBmdW5jdGlvbnMgaW4gdmhvc3RfdmRw
YQo+ICAgIHZEUEE6IGltcGxlbWVudCBJUlEgb2ZmbG9hZGluZyBoZWxwZXJzIGluIHZEUEEgY29y
ZQo+ICAgIHZpcnRpb192ZHBhOiBpbml0IElSUSBvZmZsb2FkaW5nIGZ1bmN0aW9uIHBvaW50ZXJz
IHRvIE5VTEwuCj4gICAgaWZjdmY6IHJlcGxhY2UgaXJxX3JlcXVlc3QvZnJlZSB3aXRoIGhlbHBl
cnMgaW4gdkRQQSBjb3JlLgo+ICAgIGlycWJ5cGFzczogZG8gbm90IHN0YXJ0IGNvbnN1bWVyIG9y
IHByb2R1Y2VyIHdoZW4gZmFpbGVkIHRvIGNvbm5lY3QKPgo+ICAgYXJjaC94ODYva3ZtL3g4Ni5j
ICAgICAgICAgICAgICB8IDEwICsrKystLQo+ICAgZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX21h
aW4uYyB8IDExICsrKy0tLQo+ICAgZHJpdmVycy92ZHBhL3ZkcGEuYyAgICAgICAgICAgICB8IDQ2
ICsrKysrKysrKysrKysrKysrKysrKysrKysKPiAgIGRyaXZlcnMvdmhvc3QvS2NvbmZpZyAgICAg
ICAgICAgfCAgMSArCj4gICBkcml2ZXJzL3Zob3N0L3ZkcGEuYyAgICAgICAgICAgIHwgNzUgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0KPiAgIGRyaXZlcnMvdmhvc3Qv
dmhvc3QuYyAgICAgICAgICAgfCAyMiArKysrKysrKy0tLS0KPiAgIGRyaXZlcnMvdmhvc3Qvdmhv
c3QuaCAgICAgICAgICAgfCAgOSArKysrLQo+ICAgZHJpdmVycy92aXJ0aW8vdmlydGlvX3ZkcGEu
YyAgICB8ICAyICsrCj4gICBpbmNsdWRlL2xpbnV4L3ZkcGEuaCAgICAgICAgICAgIHwgMTEgKysr
KysrCj4gICB2aXJ0L2t2bS92ZmlvLmMgICAgICAgICAgICAgICAgIHwgIDIgLS0KPiAgIHZpcnQv
bGliL2lycWJ5cGFzcy5jICAgICAgICAgICAgfCAxNiArKysrKy0tLS0KPiAgIDExIGZpbGVzIGNo
YW5nZWQsIDE4MSBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMoLSkKPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGlu
ZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8v
bGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
