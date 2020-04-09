Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6ED1A2D80
	for <lists.virtualization@lfdr.de>; Thu,  9 Apr 2020 04:05:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D967086B19;
	Thu,  9 Apr 2020 02:05:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jCE3jEJyQ_GY; Thu,  9 Apr 2020 02:05:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 31C5786AEB;
	Thu,  9 Apr 2020 02:05:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 08662C0177;
	Thu,  9 Apr 2020 02:05:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E6FCC0177
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 02:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id ED056203ED
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 02:05:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ByAOWooUazu
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 02:05:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 324B720412
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 02:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586397922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JBPKhyG0v+2jRPxdQ/UjCeONAim5perez3xpMch6z0c=;
 b=hH0AFvHBfmj+3di5/qodY3h31B+Rf/ryDN46l4FrdKlNnuYBaTZYRmy8v19HJFHY/Khshu
 SfsWvetq4kKFTNHzSgjbHQmsyzBij5YrWZBe2DEl7iktAKErblwXlkSThneHZzhef92d04
 03tLnH0dZF4pxR67DPA2fOuVRsU4r+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-wrVzGKVsN_yQvblvbPGyDg-1; Wed, 08 Apr 2020 22:05:20 -0400
X-MC-Unique: wrVzGKVsN_yQvblvbPGyDg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CBC41800D71;
 Thu,  9 Apr 2020 02:05:19 +0000 (UTC)
Received: from [10.72.13.188] (ovpn-13-188.pek2.redhat.com [10.72.13.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C572860BFB;
 Thu,  9 Apr 2020 02:05:14 +0000 (UTC)
Subject: Re: [PATCH 1/2] vdpa: Signedness bugs in vdpasim_work()
To: Dan Carpenter <dan.carpenter@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20200406144509.GE68494@mwanda>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <6d817506-221a-7a50-540d-58ed34a18df3@redhat.com>
Date: Thu, 9 Apr 2020 10:05:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200406144509.GE68494@mwanda>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: kernel-janitors@vger.kernel.org, virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjAvNC82IOS4i+WNiDEwOjQ1LCBEYW4gQ2FycGVudGVyIHdyb3RlOgo+IFRoZSAicmVh
ZCIgYW5kICJ3cml0ZSIgdmFyaWFibGVzIG5lZWQgdG8gYmUgc2lnbmVkIGZvciB0aGUgZXJyb3IK
PiBoYW5kbGluZyB0byB3b3JrLgo+Cj4gRml4ZXM6IDJjNTNkMGY2NGMwNiAoInZkcGFzaW06IHZE
UEEgZGV2aWNlIHNpbXVsYXRvciIpCj4gU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8ZGFu
LmNhcnBlbnRlckBvcmFjbGUuY29tPgo+IC0tLQo+ICAgZHJpdmVycy92ZHBhL3ZkcGFfc2ltL3Zk
cGFfc2ltLmMgfCAzICsrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmRwYS92ZHBhX3NpbS92ZHBhX3Np
bS5jIGIvZHJpdmVycy92ZHBhL3ZkcGFfc2ltL3ZkcGFfc2ltLmMKPiBpbmRleCA2ZThhMGNmMmZk
ZWIuLmIzYzgwMDY1MzA1NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRw
YV9zaW0uYwo+ICsrKyBiL2RyaXZlcnMvdmRwYS92ZHBhX3NpbS92ZHBhX3NpbS5jCj4gQEAgLTEz
Miw3ICsxMzIsOCBAQCBzdGF0aWMgdm9pZCB2ZHBhc2ltX3dvcmsoc3RydWN0IHdvcmtfc3RydWN0
ICp3b3JrKQo+ICAgCQkJCQkJIHZkcGFzaW0sIHdvcmspOwo+ICAgCXN0cnVjdCB2ZHBhc2ltX3Zp
cnRxdWV1ZSAqdHhxID0gJnZkcGFzaW0tPnZxc1sxXTsKPiAgIAlzdHJ1Y3QgdmRwYXNpbV92aXJ0
cXVldWUgKnJ4cSA9ICZ2ZHBhc2ltLT52cXNbMF07Cj4gLQlzaXplX3QgcmVhZCwgd3JpdGUsIHRv
dGFsX3dyaXRlOwo+ICsJc3NpemVfdCByZWFkLCB3cml0ZTsKPiArCXNpemVfdCB0b3RhbF93cml0
ZTsKPiAgIAlpbnQgZXJyOwo+ICAgCWludCBwa3RzID0gMDsKPiAgIAoKCkFja2VkLWJ5OiBKYXNv
biBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFs
aXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
