Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F6E35D56F
	for <lists.virtualization@lfdr.de>; Tue, 13 Apr 2021 04:50:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 227E383CE6;
	Tue, 13 Apr 2021 02:50:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BqgxLY3US9xM; Tue, 13 Apr 2021 02:50:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDD3A842F0;
	Tue, 13 Apr 2021 02:50:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91701C000A;
	Tue, 13 Apr 2021 02:50:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 519ABC000A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Apr 2021 02:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3320B40543
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Apr 2021 02:50:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XCsfoJuQMdTI
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Apr 2021 02:50:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ECB6040558
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Apr 2021 02:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618282225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YyE+pkrv5YpxkS266b/YlxpyGvd3ASdLwkFrSnEarAM=;
 b=DYa6yFG4o6IAg5JYQcSyV/RPOdwN0PtFTjTo6tWHwQmzXPGUCGO4L6EGaDBEDb/cphpg77
 c4nC71soAwdq7j64NOwzaQhUsgQ3Be1Gb4l5fLRumUxL8drgjcHzDkDsw57Mtjibn6ep8a
 E/d9w9a/yWdpgzLwfqHQUEcCksesA68=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-vXD9VxVfMLC2zkix_baDKA-1; Mon, 12 Apr 2021 22:50:23 -0400
X-MC-Unique: vXD9VxVfMLC2zkix_baDKA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B73AB6D249;
 Tue, 13 Apr 2021 02:50:22 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-128.pek2.redhat.com
 [10.72.13.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A247C19D61;
 Tue, 13 Apr 2021 02:50:16 +0000 (UTC)
Subject: Re: [PATCH][next] vdpa/mlx5: Fix resource leak of mgtdev due to
 incorrect kfree
To: Colin King <colin.king@canonical.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Parav Pandit <parav@nvidia.com>,
 virtualization@lists.linux-foundation.org
References: <20210412162804.1628738-1-colin.king@canonical.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <fac15f54-2c25-0017-f92a-bec88a28dea5@redhat.com>
Date: Tue, 13 Apr 2021 10:50:14 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210412162804.1628738-1-colin.king@canonical.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

CuWcqCAyMDIxLzQvMTMg5LiK5Y2IMTI6MjgsIENvbGluIEtpbmcg5YaZ6YGTOgo+IEZyb206IENv
bGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4KPiBTdGF0aWMgYW5hbHlz
aXMgaXMgcmVwb3J0aW5nIGEgbWVtb3J5IGxlYWsgb24gbWd0ZGV2LCBpdCBhcHBlYXJzCj4gdGhh
dCB0aGUgd3Jvbmcgb2JqZWN0IGlzIGJlaW5nIGtmcmVlJ2QuIEZpeCB0aGlzIGJ5IGtmcmVlJ2lu
Zwo+IG1ndGRldiByYXRoZXIgdGhhbiBtZGV2Lgo+Cj4gQWRkcmVzc2VzLUNvdmVyaXR5OiAoIlJl
c291cmNlIGxlYWsiKQo+IEZpeGVzOiBjOGEyZDRjNzNlNzAgKCJ2ZHBhL21seDU6IEVuYWJsZSB1
c2VyIHRvIGFkZC9kZWxldGUgdmRwYSBkZXZpY2UiKQo+IFNpZ25lZC1vZmYtYnk6IENvbGluIElh
biBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL3ZkcGEv
bWx4NS9uZXQvbWx4NV92bmV0LmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZkcGEvbWx4NS9u
ZXQvbWx4NV92bmV0LmMgYi9kcml2ZXJzL3ZkcGEvbWx4NS9uZXQvbWx4NV92bmV0LmMKPiBpbmRl
eCAxMGM1ZmVmM2MwMjAuLjI1NTMzZGIwMWY1ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZkcGEv
bWx4NS9uZXQvbWx4NV92bmV0LmMKPiArKysgYi9kcml2ZXJzL3ZkcGEvbWx4NS9uZXQvbWx4NV92
bmV0LmMKPiBAQCAtMjA4OSw3ICsyMDg5LDcgQEAgc3RhdGljIGludCBtbHg1dl9wcm9iZShzdHJ1
Y3QgYXV4aWxpYXJ5X2RldmljZSAqYWRldiwKPiAgIAlyZXR1cm4gMDsKPiAgIAo+ICAgcmVnX2Vy
cjoKPiAtCWtmcmVlKG1kZXYpOwo+ICsJa2ZyZWUobWd0ZGV2KTsKPiAgIAlyZXR1cm4gZXJyOwo+
ICAgfQo+ICAgCgoKQWNrZWQtYnk6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6
YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24u
b3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3Zp
cnR1YWxpemF0aW9u
