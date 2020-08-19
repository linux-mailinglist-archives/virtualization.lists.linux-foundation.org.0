Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1BE249316
	for <lists.virtualization@lfdr.de>; Wed, 19 Aug 2020 04:54:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 52DF685456;
	Wed, 19 Aug 2020 02:54:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cFk+kh-FKPcS; Wed, 19 Aug 2020 02:54:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B086986AE3;
	Wed, 19 Aug 2020 02:54:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9A194C0895;
	Wed, 19 Aug 2020 02:54:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 52E4EC0051
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Aug 2020 02:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3B6DD84628
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Aug 2020 02:54:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HvRYSL6pIiZc
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Aug 2020 02:54:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 41926845DB
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Aug 2020 02:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597805680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ahx8zbWbxakgvDf9IO2/ggdi+fLoNSHfDPszQBbqkgk=;
 b=H9lP0AqiqT3o9bbUjm2r3VD/cFD/Z3AYuLjVc3F33AYVIdgIJJVdymeq+5qVjl9CX+k/EA
 ARGDCMYZmKAFAbtK/lt1grLFFhcQisHkcMsDv4gPwdSK1GZ3vI2Mrf8wlVU4m43CXBHO1Y
 r9qe+mIDIE/34R4ZVcaoex7RAV52Ez0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-gf9ngqChPNuCN9cJndog3A-1; Tue, 18 Aug 2020 22:54:38 -0400
X-MC-Unique: gf9ngqChPNuCN9cJndog3A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 064BA18686FD;
 Wed, 19 Aug 2020 02:54:37 +0000 (UTC)
Received: from [10.72.13.88] (ovpn-13-88.pek2.redhat.com [10.72.13.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE8165C88B;
 Wed, 19 Aug 2020 02:54:31 +0000 (UTC)
Subject: Re: [PATCH -next] vdpa/mlx5: Remove duplicate include
To: YueHaibing <yuehaibing@huawei.com>, mst@redhat.com, eli@mellanox.com,
 colin.king@canonical.com
References: <20200818114601.21656-1-yuehaibing@huawei.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <905318ea-d48a-7110-9476-da2670382614@redhat.com>
Date: Wed, 19 Aug 2020 10:54:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200818114601.21656-1-yuehaibing@huawei.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjAvOC8xOCDkuIvljYg3OjQ2LCBZdWVIYWliaW5nIHdyb3RlOgo+IFJlbW92ZSBkdXBs
aWNhdGUgaW5jbHVkZSBmaWxlCj4KPiBTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWli
aW5nQGh1YXdlaS5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL3ZkcGEvbWx4NS9uZXQvbWx4NV92bmV0
LmMgfCAxIC0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy92ZHBhL21seDUvbmV0L21seDVfdm5ldC5jIGIvZHJpdmVycy92ZHBhL21seDUv
bmV0L21seDVfdm5ldC5jCj4gaW5kZXggOWRmNjlkNWVmZThjLi4xMmZiODNkYzFkZTkgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy92ZHBhL21seDUvbmV0L21seDVfdm5ldC5jCj4gKysrIGIvZHJpdmVy
cy92ZHBhL21seDUvbmV0L21seDVfdm5ldC5jCj4gQEAgLTgsNyArOCw2IEBACj4gICAjaW5jbHVk
ZSA8bGludXgvbWx4NS9kZXZpY2UuaD4KPiAgICNpbmNsdWRlIDxsaW51eC9tbHg1L3Zwb3J0Lmg+
Cj4gICAjaW5jbHVkZSA8bGludXgvbWx4NS9mcy5oPgo+IC0jaW5jbHVkZSA8bGludXgvbWx4NS9k
ZXZpY2UuaD4KPiAgICNpbmNsdWRlICJtbHg1X3ZuZXQuaCIKPiAgICNpbmNsdWRlICJtbHg1X3Zk
cGFfaWZjLmgiCj4gICAjaW5jbHVkZSAibWx4NV92ZHBhLmgiCgoKQWNrZWQtYnk6IEphc29uIFdh
bmcgPGphc293YW5nQHJlZGhhdC5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0
aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0
aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
