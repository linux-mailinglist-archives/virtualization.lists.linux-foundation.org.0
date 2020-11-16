Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E21F2B3C0F
	for <lists.virtualization@lfdr.de>; Mon, 16 Nov 2020 05:18:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 90F952041F;
	Mon, 16 Nov 2020 04:18:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XbHn32yV59ha; Mon, 16 Nov 2020 04:18:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5F76D2041E;
	Mon, 16 Nov 2020 04:18:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 390B3C07FF;
	Mon, 16 Nov 2020 04:18:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C11BAC07FF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 04:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A90B985F8F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 04:18:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OxpRd-2RahbG
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 04:18:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2ABAA85F8D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 04:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605500314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UTd99pYLjkoSdfa6jBaQQPlI7Y9KTeBcUMLVgsiGWEo=;
 b=FX4XqMC9F1G6bUAI0EtkAcgL1IPCakXhI0JEcrmNK2Wn5MpBrlLtcKh51/FBMAl41DnJA7
 U1mOvIZbcFYUtI7EUpYI04MMEK34DmdsPxn7EtwQbJBi2gLtu+mXCEo06dmh3w292XASIL
 Sp+ZRe2WZdtbwHhvbn2MoGKY4ZF0BNk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-JSAuC__3Nue-2LvjnMZ9HA-1; Sun, 15 Nov 2020 23:18:30 -0500
X-MC-Unique: JSAuC__3Nue-2LvjnMZ9HA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A134E8030A0;
 Mon, 16 Nov 2020 04:18:29 +0000 (UTC)
Received: from [10.72.13.126] (ovpn-13-126.pek2.redhat.com [10.72.13.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA90D1002C10;
 Mon, 16 Nov 2020 04:18:20 +0000 (UTC)
Subject: Re: [PATCH RFC 07/12] vdpa_sim: move config management outside of the
 core
To: Stefano Garzarella <sgarzare@redhat.com>,
 virtualization@lists.linux-foundation.org
References: <20201113134712.69744-1-sgarzare@redhat.com>
 <20201113134712.69744-8-sgarzare@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <6ee3e73b-257a-3c02-db32-e890cfacae64@redhat.com>
Date: Mon, 16 Nov 2020 12:18:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201113134712.69744-8-sgarzare@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: Laurent Vivier <lvivier@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <elic@nvidia.com>
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

Ck9uIDIwMjAvMTEvMTMg5LiL5Y2IOTo0NywgU3RlZmFubyBHYXJ6YXJlbGxhIHdyb3RlOgo+IElu
IG9yZGVyIHRvIHNpbXBsaWZ5IHRoZSBjb2RlIG9mIHRoZSB2ZHBhX3NpbSBjb3JlLCB3ZSBtb3Zl
IHRoZQo+IGNvbmZpZyBtYW5hZ2VtZW50IGluIGVhY2ggZGV2aWNlIHNpbXVsYXRvci4KPgo+IFRo
ZSBkZXZpY2UgbXVzdCBwcm92aWRlIHRoZSBzaXplIG9mIGNvbmZpZyBzdHJ1Y3R1cmUgYW5kIGEg
Y2FsbGJhY2sKPiB0byB1cGRhdGUgdGhpcyBzdHJ1Y3R1cmUgY2FsbGVkIGR1cmluZyB0aGUgdmRw
YXNpbV9zZXRfZmVhdHVyZXMoKS4KCgpTaW1pbGFybHksIEkgc3VnZ2VzdCB0byBkbyB0aGlzIGJl
Zm9yZSBwYXRjaCAyLCB0aGVuIHRoZXJlJ3Mgbm8gbmVlZCBmb3IgCnRoZSBjb252ZXJzaW9uIG9m
IGJsayBkZXZpY2UuCgoKPgo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gR2FyemFyZWxsYSA8c2dh
cnphcmVAcmVkaGF0LmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvdmRwYS92ZHBhX3NpbS92ZHBhX3Np
bS5oICAgICB8ICA1ICsrKy0tCj4gICBkcml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW0uYyAg
ICAgfCAyOSArKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gICBkcml2ZXJzL3ZkcGEvdmRw
YV9zaW0vdmRwYV9zaW1fYmxrLmMgfCAyNyArKysrKysrKysrKysrKysrLS0tLS0tLS0tLQo+ICAg
ZHJpdmVycy92ZHBhL3ZkcGFfc2ltL3ZkcGFfc2ltX25ldC5jIHwgMTIgKysrKysrKysrKysrCj4g
ICA0IGZpbGVzIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKyksIDM2IGRlbGV0aW9ucygtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmRwYS92ZHBhX3NpbS92ZHBhX3NpbS5oIGIvZHJpdmVycy92
ZHBhL3ZkcGFfc2ltL3ZkcGFfc2ltLmgKPiBpbmRleCA3NmU2NDIwNDJlYjAuLmY3ZTFmZTBhODhk
MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW0uaAo+ICsrKyBi
L2RyaXZlcnMvdmRwYS92ZHBhX3NpbS92ZHBhX3NpbS5oCj4gQEAgLTEwLDggKzEwLDYgQEAKPiAg
ICNpbmNsdWRlIDxsaW51eC92ZHBhLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvdmhvc3RfaW90bGIu
aD4KPiAgICNpbmNsdWRlIDx1YXBpL2xpbnV4L3ZpcnRpb19jb25maWcuaD4KPiAtI2luY2x1ZGUg
PHVhcGkvbGludXgvdmlydGlvX25ldC5oPgo+IC0jaW5jbHVkZSA8dWFwaS9saW51eC92aXJ0aW9f
YmxrLmg+Cj4gICAKPiAgICNkZWZpbmUgRFJWX1ZFUlNJT04gICIwLjEiCj4gICAjZGVmaW5lIERS
Vl9BVVRIT1IgICAiSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4iCj4gQEAgLTQyLDgg
KzQwLDExIEBAIHN0cnVjdCB2ZHBhc2ltX3ZpcnRxdWV1ZSB7Cj4gICAKPiAgIHN0cnVjdCB2ZHBh
c2ltX2RldmljZSB7Cj4gICAJdTY0IHN1cHBvcnRlZF9mZWF0dXJlczsKPiArCXNpemVfdCBjb25m
aWdfc2l6ZTsKPiAgIAl1MzIgaWQ7Cj4gICAJaW50IG52cXM7Cj4gKwo+ICsJdm9pZCAoKnVwZGF0
ZV9jb25maWcpKHN0cnVjdCB2ZHBhc2ltICp2ZHBhc2ltKTsKCgpMZXQncyB1c2Ugc2V0X2NvbmZp
Zy9nZXRfY29uZmlnIHRvIGFsaWduIHdpdGggdmlydGlvL3Zob3N0LgoKT3RoZXIgbG9va3MgZ29v
ZC4KClRoYW5rcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51
eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
