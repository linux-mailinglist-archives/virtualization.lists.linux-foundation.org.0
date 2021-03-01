Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEDB32767D
	for <lists.virtualization@lfdr.de>; Mon,  1 Mar 2021 04:53:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48FE6831D5;
	Mon,  1 Mar 2021 03:53:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JtplVdxGiARq; Mon,  1 Mar 2021 03:53:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2024C831D6;
	Mon,  1 Mar 2021 03:53:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ABE84C0001;
	Mon,  1 Mar 2021 03:53:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B3F7FC0001
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Mar 2021 03:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 946994ED8A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Mar 2021 03:53:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fD2EnfaN7wsI
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Mar 2021 03:53:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B53444EC62
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Mar 2021 03:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614570796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uLH9M0I0CMwxLIlKabThSQ9LIWBinbU59JWEShdZQWQ=;
 b=JVJoQ48zVP1p8x1Vkgs0wSpaJbs4HIvwE+JVKiMGep7GHpC6MHY5ckgWHBgIXX47NzT6kU
 LGon1aiyHXuXjohrjkJ4zTzZaTKU+frRtJzhmFLAJRmwpxFNMB+X9NdKP1uiEF/fVnphoU
 7ZyYDgRhl9niJa/oaNHGKqS/C1pQYfM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-ENPFafOsPduOMSBAOY-e8g-1; Sun, 28 Feb 2021 22:53:12 -0500
X-MC-Unique: ENPFafOsPduOMSBAOY-e8g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22E1880196C;
 Mon,  1 Mar 2021 03:53:11 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-164.pek2.redhat.com
 [10.72.12.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A7836E406;
 Mon,  1 Mar 2021 03:53:05 +0000 (UTC)
Subject: Re: [PATCH] vdpa/mlx5: set_features should allow reset to zero
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20210223082536-mutt-send-email-mst@kernel.org>
 <3ff5fd23-1db0-2f95-4cf9-711ef403fb62@oracle.com>
 <20210224000057-mutt-send-email-mst@kernel.org>
 <0559fd8c-ff44-cb7a-8a74-71976dd2ee33@redhat.com>
 <20210224014232-mutt-send-email-mst@kernel.org>
 <ce6b0380-bc4c-bcb8-db82-2605e819702c@redhat.com>
 <20210224021222-mutt-send-email-mst@kernel.org>
 <babc654d-8dcd-d8a2-c3b6-d20cc4fc554c@redhat.com>
 <20210224034240-mutt-send-email-mst@kernel.org>
 <d2992c03-d639-54e3-4599-c168ceeac148@redhat.com>
 <20210228162909-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <4ac87dc6-4629-78fa-c080-b4cd1eaaccb7@redhat.com>
Date: Mon, 1 Mar 2021 11:53:04 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210228162909-mutt-send-email-mst@kernel.org>
Content-Language: en-GB
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: Si-Wei Liu <si-wei.liu@oracle.com>, netdev@vger.kernel.org, elic@nvidia.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjEvMy8xIDU6MzAg5LiK5Y2ILCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
V2VkLCBGZWIgMjQsIDIwMjEgYXQgMDU6MzA6MzdQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAyMS8yLzI0IDQ6NDMg5LiL5Y2ILCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+
PiBPbiBXZWQsIEZlYiAyNCwgMjAyMSBhdCAwNDoyNjo0M1BNICswODAwLCBKYXNvbiBXYW5nIHdy
b3RlOgo+Pj4+ICAgICAgIEJhc2ljYWxseSBvbiBmaXJzdCBndWVzdCBhY2Nlc3MgUUVNVSB3b3Vs
ZCB0ZWxsIGtlcm5lbCB3aGV0aGVyCj4+Pj4gICAgICAgZ3Vlc3QgaXMgdXNpbmcgdGhlIGxlZ2Fj
eSBvciB0aGUgbW9kZXJuIGludGVyZmFjZS4KPj4+PiAgICAgICBFLmcuIHZpcnRpb19wY2lfY29u
ZmlnX3JlYWQvdmlydGlvX3BjaV9jb25maWdfd3JpdGUgd2lsbCBjYWxsIGlvY3RsKEVOQUJMRV9M
RUdBQ1ksIDEpCj4+Pj4gICAgICAgd2hpbGUgdmlydGlvX3BjaV9jb21tb25fcmVhZCB3aWxsIGNh
bGwgaW9jdGwoRU5BQkxFX0xFR0FDWSwgMCkKPj4+Pgo+Pj4+Cj4+Pj4gQnV0IHRoaXMgdHJpY2sg
d29yayBvbmx5IGZvciBQQ0kgSSB0aGluaz8KPj4+Pgo+Pj4+IFRoYW5rcwo+Pj4gY2N3IGhhcyBh
IHJldmlzaW9uIGl0IGNhbiBjaGVjay4gbW1pbyBkb2VzIG5vdCBoYXZlIHRyYW5zaXRpb25hbCBk
ZXZpY2VzCj4+PiBhdCBhbGwuCj4+Cj4+IE9rLCB0aGVuIHdlIGNhbiBkbyB0aGUgd29ya2Fyb3Vu
ZCBpbiB0aGUgcWVtdSwgaXNuJ3QgaXQ/Cj4+Cj4+IFRoYW5rcwo+IHdoaWNoIG9uZSBkbyB5b3Ug
bWVhbj8KCgpJIG1lYW50IHRoZSB3b3JrYXJvdW5kIHRoYXQgaXMgZG9uZSBieSA0NTI2MzlhNjRh
ZDggKCJ2ZHBhOiBtYWtlIHN1cmUgCnNldF9mZWF0dXJlcyBpcyBpbnZva2VkIGZvciBsZWdhY3ki
KS4KClRoYW5rcwoKCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5s
aW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFp
bG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
