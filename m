Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5E522077E
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 10:36:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6605F2051E;
	Wed, 15 Jul 2020 08:36:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7sIXbiQfzf2a; Wed, 15 Jul 2020 08:36:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4FC6620510;
	Wed, 15 Jul 2020 08:36:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 234E4C0733;
	Wed, 15 Jul 2020 08:36:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D612C0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 08:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EF9F487865
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 08:36:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kHktAQDakHz8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 08:36:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BAF93876D6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 08:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594802183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MNvetRDl2vilUXFbqgzafA8aBGGCQYNGMYLuLzvct9U=;
 b=T3gPvTDmkfeeWqx6IwI/uer9QCzHpnnmC8Lvb+LlK5Gpiv+IhqgFPd+FQDis5kGKmYnLJC
 RKNrASeazLz3iNlP5flXYn01uW6wMDp5zSk2lX2lI71DAO0B/u9Pmorb0B15cnz7fEYid4
 8QQ12P1mR2Qwxc9oqSibrMy956N1MkU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-WsPBMdGtNm-5uARAGULH1w-1; Wed, 15 Jul 2020 04:36:19 -0400
X-MC-Unique: WsPBMdGtNm-5uARAGULH1w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D42101083E94;
 Wed, 15 Jul 2020 08:36:17 +0000 (UTC)
Received: from [10.72.13.230] (ovpn-13-230.pek2.redhat.com [10.72.13.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C4D679CE4;
 Wed, 15 Jul 2020 08:36:11 +0000 (UTC)
Subject: Re: [PATCH v7 0/2] s390: virtio: let arch validate VIRTIO features
To: Pierre Morel <pmorel@linux.ibm.com>, linux-kernel@vger.kernel.org
References: <1594801869-13365-1-git-send-email-pmorel@linux.ibm.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <73459586-3315-44cf-8d82-13a394bdf115@redhat.com>
Date: Wed, 15 Jul 2020 16:36:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594801869-13365-1-git-send-email-pmorel@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: gor@linux.ibm.com, linux-s390@vger.kernel.org, frankja@linux.ibm.com,
 kvm@vger.kernel.org, mst@redhat.com, hca@linux.ibm.com, cohuck@redhat.com,
 linuxram@us.ibm.com, virtualization@lists.linux-foundation.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, thomas.lendacky@amd.com,
 david@gibson.dropbear.id.au
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

Ck9uIDIwMjAvNy8xNSDkuIvljYg0OjMxLCBQaWVycmUgTW9yZWwgd3JvdGU6Cj4gSGkgYWxsLAo+
Cj4gVGhlIGdvYWwgb2YgdGhlIHNlcmllcyBpcyB0byBnaXZlIGEgY2hhbmNlIHRvIHRoZSBhcmNo
aXRlY3R1cmUKPiB0byB2YWxpZGF0ZSBWSVJUSU8gZGV2aWNlIGZlYXR1cmVzLgo+Cj4gaW4gdGhp
cyByZXNwaW46Cj4KPiAxKSBJIGtlcHQgcmVtb3ZlZCB0aGUgYWNrIGZyb20gSmFzb24gYXMgSSBy
ZXdvcmtlZCB0aGUgcGF0Y2gKPiAgICAgQEphc29uLCB0aGUgbmF0dXJlIGFuZCBnb2FsIG9mIHRo
ZSBwYXRjaCBkaWQgbm90IHJlYWxseSBjaGFuZ2VkCj4gICAgICAgICAgICAgcGxlYXNlIGNhbiBJ
IGdldCBiYWNrIHlvdXIgYWNrZWQtYnkgd2l0aCB0aGVzZSBjaGFuZ2VzPwoKClllcy4KCkFja2Vk
LWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgoKVGhhbmtzCgoKPgo+IDIpIFJl
d29yZGluZyBmb3Igd2FybmluZyBtZXNzYWdlcwo+Cj4gUmVnYXJkcywKPiBQaWVycmUKPgo+IFBp
ZXJyZSBNb3JlbCAoMik6Cj4gICAgdmlydGlvOiBsZXQgYXJjaCB2YWxpZGF0ZSBWSVJUSU8gZmVh
dHVyZXMKPiAgICBzMzkwOiB2aXJ0aW86IFBWIG5lZWRzIFZJUlRJTyBJL08gZGV2aWNlIHByb3Rl
Y3Rpb24KPgo+ICAgYXJjaC9zMzkwL21tL2luaXQuYyAgICAgICAgICAgfCAyOCArKysrKysrKysr
KysrKysrKysrKysrKysrKysrCj4gICBkcml2ZXJzL3ZpcnRpby92aXJ0aW8uYyAgICAgICB8IDE5
ICsrKysrKysrKysrKysrKysrKysKPiAgIGluY2x1ZGUvbGludXgvdmlydGlvX2NvbmZpZy5oIHwg
IDEgKwo+ICAgMyBmaWxlcyBjaGFuZ2VkLCA0OCBpbnNlcnRpb25zKCspCj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxp
bmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlv
bg==
