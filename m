Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B754D2E75E9
	for <lists.virtualization@lfdr.de>; Wed, 30 Dec 2020 05:00:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 82AB287129;
	Wed, 30 Dec 2020 04:00:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VW7GTOCFhagO; Wed, 30 Dec 2020 04:00:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CD57B87126;
	Wed, 30 Dec 2020 04:00:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9C7F5C0174;
	Wed, 30 Dec 2020 04:00:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8A90C0174
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Dec 2020 04:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A8A2685DF2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Dec 2020 04:00:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kh9m0gz5ZCIT
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Dec 2020 04:00:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C1BE785D9B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Dec 2020 04:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609300840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KZ+tvVxfnnvv+eTht2YPU3/8LnIaN/7WC1RcaN3MqX4=;
 b=Ql+TaECzfZVWHvMTksPeEgURq4A4vPAeRZxzPjwHAOjlrokEF/lvw9jUKC/wPl+jH+eiLY
 3bNXADwpY6NF+rqBwju4NQtMpdbNPEHjo0vH3Yxh4ED26L1FzHPFsZXLltgGW/oEhptb4W
 lMhRrE14SfohgluXFYBDp6X3zMSp/+k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-usxb8T_YOo21w800PIYJBg-1; Tue, 29 Dec 2020 23:00:38 -0500
X-MC-Unique: usxb8T_YOo21w800PIYJBg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8CD5180A096;
 Wed, 30 Dec 2020 04:00:36 +0000 (UTC)
Received: from [10.72.13.30] (ovpn-13-30.pek2.redhat.com [10.72.13.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 46A41709B3;
 Wed, 30 Dec 2020 04:00:01 +0000 (UTC)
Subject: Re: [PATCH 07/21] vdpa: multiple address spaces support
To: Eli Cohen <elic@nvidia.com>
References: <20201216064818.48239-1-jasowang@redhat.com>
 <20201216064818.48239-8-jasowang@redhat.com>
 <20201229072832.GA195479@mtl-vdi-166.wap.labs.mlnx>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <bbd05848-3376-3a35-8914-16f19c74f373@redhat.com>
Date: Wed, 30 Dec 2020 12:00:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201229072832.GA195479@mtl-vdi-166.wap.labs.mlnx>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

Ck9uIDIwMjAvMTIvMjkg5LiL5Y2IMzoyOCwgRWxpIENvaGVuIHdyb3RlOgo+PiBAQCAtNDMsNiAr
NDMsOCBAQCBzdHJ1Y3QgdmRwYV92cV9zdGF0ZSB7Cj4+ICAgICogQGluZGV4OiBkZXZpY2UgaW5k
ZXgKPj4gICAgKiBAZmVhdHVyZXNfdmFsaWQ6IHdlcmUgZmVhdHVyZXMgaW5pdGlhbGl6ZWQ/IGZv
ciBsZWdhY3kgZ3Vlc3RzCj4+ICAgICogQG52cXM6IHRoZSBudW1iZXIgb2YgdmlydHF1ZXVlcwo+
PiArICogQG5ncm91cHM6IHRoZSBudW1iZXIgb2YgdmlydHF1ZXVlIGdyb3Vwcwo+PiArICogQG5h
czogdGhlIG51bWJlciBvZiBhZGRyZXNzIHNwYWNlcwo+IEkgYW0gbm90IHN1cmUgdGhlc2UgY2Fu
IGJlIGNhdGVnb3Jpc2VkIGFzIHBhcnQgb2YgdGhlIHN0YXRlIG9mIHRoZSBWUS4KPiBJdCdzIG1v
cmUgb2YgYSBwcm9wZXJ0eSBzbyBtYXliZSB3ZSBjYW4gaGF2ZSBhIGNhbGxiYWNrIHRvIGdldCB0
aGUKPiBwcm9wZXJ0aWVzIG9mIHRoZSBWUT8KPgo+IE1vcmVvdmVyLCBJIHRoaW5rIHRoZXkgc2hv
dWxkIGJlIGhhbmRsZWQgaW4gdGhlIGhhcmR3YXJlIGRyaXZlcnMgdG8KPiByZXR1cm4gMSBmb3Ig
Ym90aCBuZ3JvdXBzIGFuZCBuYXMuCgoKV2UgY2FuLCBidXQgdGhvc2UgYXJlIHN0YXRpYyBhdHRy
aWJ1dGVzIHRoYXQgaXMgbm90IGV4cGVjdGVkIHRvIGJlIApjaGFuZ2VkIGJ5IHRoZSBkcml2ZXIu
CgpJbnRyb2R1Y2UgY2FsbGJhY2tzIGZvciB0aG9zZSBzdGF0aWMgc3R1ZmZzIGRvZXMgbm90IGdp
dmUgdXMgYW55IGFkdmFudGFnZS4KCkZvciBncm91cCBpZCBhbmQgbm90aWZpY2F0aW9uIGFyZWEs
IHNpbmNlIHdlIGRvbid0IGhhdmUgYSBhYnN0cmFjdCBvZiAKdmRwYV92aXJ0cXVldWUuIFRoZSBv
bmx5IGNob2ljZSBpcyB0byBpbnRyb2R1Y2UgY2FsbGJhY2tzIGZvciB0aGVtLgoKTWF5YmUgaXQn
cyB0aW1lIHRvIGludHJvZHVjZSB2ZHBhX3ZpcnRxdWV1ZS4KClRoYW5rcwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGlu
ZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8v
bGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
