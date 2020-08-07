Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CB023E665
	for <lists.virtualization@lfdr.de>; Fri,  7 Aug 2020 05:52:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9B90488538;
	Fri,  7 Aug 2020 03:52:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sikMNl7Iup7A; Fri,  7 Aug 2020 03:52:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 42503884A7;
	Fri,  7 Aug 2020 03:52:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17A39C004C;
	Fri,  7 Aug 2020 03:52:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 06B3FC004C
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Aug 2020 03:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EA53E8844E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Aug 2020 03:52:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5IxFZWa07tiM
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Aug 2020 03:52:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 148BB883A3
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Aug 2020 03:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596772339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XWEf4pn49dLkVtcRCpVfMFyzG0kkdDtY0L/o/mAs7Gg=;
 b=gp3DkOrfJQ+2guwoapSq3QqlGpF4zGjhp/pK99AIbcNjDFCJidgqOSXKvJ6Oc1/wX1lvvr
 jzRJhG0kB1CFfXuSeEXgg4Vgth9aDXLawyPN59zczlKh61P8DNRb2htSWFV9cggx8h2Z4Q
 moI9Wm+jHq/H6doKsjpg6o8SQjeMjPc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-IdSPMwuRP9iPilSmJ22-ZQ-1; Thu, 06 Aug 2020 23:52:15 -0400
X-MC-Unique: IdSPMwuRP9iPilSmJ22-ZQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4901C7466;
 Fri,  7 Aug 2020 03:52:14 +0000 (UTC)
Received: from [10.72.13.215] (ovpn-13-215.pek2.redhat.com [10.72.13.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C339B6842F;
 Fri,  7 Aug 2020 03:52:10 +0000 (UTC)
Subject: Re: [PATCH 1/2] vdpa: ifcvf: return err when fail to request config
 irq
To: mst@redhat.com, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
References: <20200723091254.20617-1-jasowang@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <87ec5f62-4d99-e7b4-00dc-28664f8eb111@redhat.com>
Date: Fri, 7 Aug 2020 11:52:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200723091254.20617-1-jasowang@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: Zhu Lingshan <lingshan.zhu@intel.com>
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

Ck9uIDIwMjAvNy8yMyDkuIvljYg1OjEyLCBKYXNvbiBXYW5nIHdyb3RlOgo+IFdlIGlnbm9yZSB0
aGUgZXJyIG9mIHJlcXVlc3RpbmcgY29uZmlnIGludGVycnVwdCwgZml4IHRoaXMuCj4KPiBGaXhl
czogZTc5OTFmMzc2YTRkICgiaWZjdmY6IGltcGxlbWVudCBjb25maWcgaW50ZXJydXB0IGluIElG
Q1ZGIikKPiBDYzogWmh1IExpbmdzaGFuIDxsaW5nc2hhbi56aHVAaW50ZWwuY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Cj4gLS0tCj4gICBkcml2
ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5jIHwgNCArKysrCj4gICAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3Zm
X21haW4uYyBiL2RyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9tYWluLmMKPiBpbmRleCBmNWE2MGMx
NGI5NzkuLmFlNzExMDk1NWE0NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZkcGEvaWZjdmYvaWZj
dmZfbWFpbi5jCj4gKysrIGIvZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYwo+IEBAIC03
Niw2ICs3NiwxMCBAQCBzdGF0aWMgaW50IGlmY3ZmX3JlcXVlc3RfaXJxKHN0cnVjdCBpZmN2Zl9h
ZGFwdGVyICphZGFwdGVyKQo+ICAgCXJldCA9IGRldm1fcmVxdWVzdF9pcnEoJnBkZXYtPmRldiwg
aXJxLAo+ICAgCQkJICAgICAgIGlmY3ZmX2NvbmZpZ19jaGFuZ2VkLCAwLAo+ICAgCQkJICAgICAg
IHZmLT5jb25maWdfbXNpeF9uYW1lLCB2Zik7Cj4gKwlpZiAocmV0KSB7Cj4gKwkJSUZDVkZfRVJS
KHBkZXYsICJGYWlsZWQgdG8gcmVxdWVzdCBjb25maWcgaXJxXG4iKTsKPiArCQlyZXR1cm4gcmV0
Owo+ICsJfQo+ICAgCj4gICAJZm9yIChpID0gMDsgaSA8IElGQ1ZGX01BWF9RVUVVRV9QQUlSUyAq
IDI7IGkrKykgewo+ICAgCQlzbnByaW50Zih2Zi0+dnJpbmdbaV0ubXNpeF9uYW1lLCAyNTYsICJp
ZmN2Zlslc10tJWRcbiIsCgoKSGkgTWljaGFlbDoKCkFueSBjb21tZW50cyBvbiB0aGlzIHNlcmll
cz8KClRoYW5rcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51
eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
