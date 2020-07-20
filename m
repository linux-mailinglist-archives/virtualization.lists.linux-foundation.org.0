Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B00225BE1
	for <lists.virtualization@lfdr.de>; Mon, 20 Jul 2020 11:40:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E195485F0A;
	Mon, 20 Jul 2020 09:40:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yRCiUDuVmk9B; Mon, 20 Jul 2020 09:40:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 82BFF85ECE;
	Mon, 20 Jul 2020 09:40:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6C3D4C016F;
	Mon, 20 Jul 2020 09:40:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E2CFCC016F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 09:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DC81087E3C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 09:40:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jj24lsVxLckX
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 09:40:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5563587E19
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 09:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595238044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XRNrRgwLLLMF30OdZNuJ7/SKYD2BOTDMSbZ1OQlAfhU=;
 b=Nfdd6/yZHX34WWVHp0uCyPwOBwVikl0WyS3QItisay/KFBE/3+XbLKAxwExxwlYQ5fxguv
 rFE/VeQfJ6xOlbF5ytYfHVvf0j1TKdVVYoeRqkDZ7opiG+QP0nclkM5mt9hAJz7mPam8j8
 DLynOJrNsg7j296owynERHNvPjqn67E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-s-3AwpSQO0eLnoo6P8H9bg-1; Mon, 20 Jul 2020 05:40:42 -0400
X-MC-Unique: s-3AwpSQO0eLnoo6P8H9bg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81191108B;
 Mon, 20 Jul 2020 09:40:40 +0000 (UTC)
Received: from [10.72.12.53] (ovpn-12-53.pek2.redhat.com [10.72.12.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 015BF5D9DD;
 Mon, 20 Jul 2020 09:40:31 +0000 (UTC)
Subject: Re: [PATCH V2 3/6] vDPA: implement IRQ offloading helpers in vDPA core
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, mst@redhat.com,
 alex.williamson@redhat.com, pbonzini@redhat.com,
 sean.j.christopherson@intel.com, wanpengli@tencent.com
References: <1594898629-18790-1-git-send-email-lingshan.zhu@intel.com>
 <1594898629-18790-4-git-send-email-lingshan.zhu@intel.com>
 <ab4644cc-9668-a909-4dea-5416aacf7221@redhat.com>
 <45b2cc93-6ae1-47c7-aae6-01afdab1094b@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <625c08af-a81f-d834-bb41-538c3dc9acb4@redhat.com>
Date: Mon, 20 Jul 2020 17:40:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <45b2cc93-6ae1-47c7-aae6-01afdab1094b@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Ck9uIDIwMjAvNy8yMCDkuIvljYg1OjA3LCBaaHUsIExpbmdzaGFuIHdyb3RlOgo+Pj4KPj4+ICt9
Cj4+PiArCj4+PiArc3RhdGljIHZvaWQgdmRwYV91bnNldHVwX2lycShzdHJ1Y3QgdmRwYV9kZXZp
Y2UgKnZkZXYsIGludCBxaWQpCj4+PiArewo+Pj4gK8KgwqDCoCBzdHJ1Y3QgdmRwYV9kcml2ZXIg
KmRydiA9IGRydl90b192ZHBhKHZkZXYtPmRldi5kcml2ZXIpOwo+Pj4gKwo+Pj4gK8KgwqDCoCBp
ZiAoZHJ2LT51bnNldHVwX3ZxX2lycSkKPj4+ICvCoMKgwqDCoMKgwqDCoCBkcnYtPnVuc2V0dXBf
dnFfaXJxKHZkZXYsIHFpZCk7Cj4+Cj4+Cj4+IERvIHlvdSBuZWVkIHRvIGNoZWNrIHRoZSBleGlz
dGVuY2Ugb2YgZHJ2IGJlZm9yZSBjYWxsaW5nIHVuc2V0X3ZxX2lycSgpPwo+IFllcywgd2Ugc2hv
dWxkIGNoZWNrIHRoaXMgd2hlbiB3ZSB0YWtlIHRoZSByZWxlYXNpbmcgcGF0aCBpbnRvIGFjY291
bnQuCj4+Cj4+IEFuZCBob3cgY2FuIHRoaXMgc3luY2hyb25pemUgd2l0aCBkcml2ZXIgcmVsZWFz
aW5nIGFuZCBiaW5kaW5nPwo+IFdpbGwgYWRkIGFuIHZkcGFfdW5zZXR1cF9pcnEoKSBjYWxsIGlu
IHZoc290X3ZkcGFfcmVsZWFzZSgpLgo+IEZvciBiaW5kaW5nLCBJIHRoaW5rIGl0IGlzIGEgbmV3
IGRldiBib3VuZCB0byB0aGUgdGhlIGRyaXZlciwKPiBpdCBzaG91bGQgZ28gdGhyb3VnaCB0aGUg
dmRwYV9zZXR1cF9pcnEoKSByb3V0aW5lLiBvciBpZiBpdCBpcwo+IGEgZGV2aWNlIHJlLWJpbmQg
dG8gdmhvc3RfdmRwYSwgSSB0aGluayB3ZSBoYXZlIGNsZWFuZWQgdXAKPiBpcnFfYnlwYXNzX3By
b2R1Y2VyIGZvciBpdCBhcyB3ZSB3b3VsZCBjYWxsIHZoZHBhX3Vuc2V0dXBfaXJxKCkKPiBpbiB0
aGUgcmVsZWFzZSBmdW5jdGlvbi4KCgpJIG1lYW50IGNhbiB0aGUgZm9sbG93aW5nIHRoaW5ncyBo
YXBwZW4/CgoxKSBzb21lIHZEUEEgZGV2aWNlIGRyaXZlciBwcm9iZSB0aGUgaGFyZHdhcmUgYW5k
IGNhbGwgCnZkcGFfcmVxdWVzdF9pcnEoKSBpbiBpdHMgUENJIHByb2JlIGZ1bmN0aW9uLgoyKSB2
RFBBIGRldmljZSBpcyBwcm9iZWQgYnkgdmhvc3QtdkRQQQoKVGhlbiBpcnEgYnlwYXNzIGNhbid0
IHdvcmsgc2luY2Ugd2Ugd2hlbiB2ZHBhX3Vuc2V0dXBfaXJxKCkgaXMgY2FsbGVkLCAKdGhlcmUn
cyBubyBkcml2ZXIgYm91bmQuIE9yIGlzIHRoZXJlIGEgcmVxdWlyZW1lbnQgdGhhdCAKdmRhcF9y
ZXF1ZXN0L2ZyZWVfaXJxKCkgbXVzdCBiZSBjYWxsZWQgc29tZXdoZXJlIChlLmcgaW4gdGhlIHNl
dF9zdGF0dXMgCmJ1cyBvcGVyYXRpb25zKT8gSWYgeWVzLCB3ZSBuZWVkIGRvY3VtZW50IHRob3Nl
IHJlcXVpcmVtZW50cy4KClRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9u
QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9u
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
