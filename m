Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8891A2D87
	for <lists.virtualization@lfdr.de>; Thu,  9 Apr 2020 04:06:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D1CCE86B21;
	Thu,  9 Apr 2020 02:06:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 96FJilWwGo_4; Thu,  9 Apr 2020 02:06:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 703F686A54;
	Thu,  9 Apr 2020 02:06:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6061EC1AE8;
	Thu,  9 Apr 2020 02:06:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D5EE3C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 02:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D2606204C6
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 02:06:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0QbVKsxE8iIG
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 02:06:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 1992A20412
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 02:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586398004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jb0XW8Q7NTla9I4KOfElXRxKDzIVaSfCW8rC9NnVEEk=;
 b=VAaE04dUt5AHboIIqTwiZupvcWPj++7PDbmfyIMCSDkrrzmbs/rsIGgKmzJwOC1+Jnu73d
 2vYwKXDFXX+jUGP9SNjZCVT6043hwoUF6YxesYeZL+XbOr5QDqfAVfC3f3tXurRyDRHVIR
 snhJ2labvpHYbp3PUaRQdYk/+DVY9F8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-INAbm9-hMjWW_0xk6Fq6rQ-1; Wed, 08 Apr 2020 22:06:42 -0400
X-MC-Unique: INAbm9-hMjWW_0xk6Fq6rQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A49AC18AB2C3;
 Thu,  9 Apr 2020 02:06:41 +0000 (UTC)
Received: from [10.72.13.188] (ovpn-13-188.pek2.redhat.com [10.72.13.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3AB451001DC2;
 Thu,  9 Apr 2020 02:06:36 +0000 (UTC)
Subject: Re: [PATCH 2/2] vdpa: Fix pointer math bug in vdpasim_get_config()
To: Dan Carpenter <dan.carpenter@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20200406144552.GF68494@mwanda>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d463d227-92ff-d35f-6b3c-b86b85613da1@redhat.com>
Date: Thu, 9 Apr 2020 10:06:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200406144552.GF68494@mwanda>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

Ck9uIDIwMjAvNC82IOS4i+WNiDEwOjQ1LCBEYW4gQ2FycGVudGVyIHdyb3RlOgo+IElmICJvZmZz
ZXQiIGlzIG5vbi16ZXJvIHRoZW4gd2UgZW5kIHVwIGNvcHlpbmcgZnJvbSBiZXlvbmQgdGhlIGVu
ZCBvZgo+IHRoZSBjb25maWcgYmVjYXVzZSBvZiBwb2ludGVyIG1hdGguICBXZSBjYW4gZml4IHRo
aXMgYnkgY2FzdGluZyB0aGUKPiBzdHJ1Y3QgdG8gYSB1OCBwb2ludGVyLgo+Cj4gRml4ZXM6IDJj
NTNkMGY2NGMwNiAoInZkcGFzaW06IHZEUEEgZGV2aWNlIHNpbXVsYXRvciIpCj4gU2lnbmVkLW9m
Zi1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgo+IC0tLQo+IElz
IGl0IHJlYWxseSB3b3J0aCBsZXR0aW5nIHBlb3BsZSBzcGVjaWZ5IHRoZSBvZmZzZXQ/Cj4KPiAg
IGRyaXZlcnMvdmRwYS92ZHBhX3NpbS92ZHBhX3NpbS5jIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92ZHBhL3ZkcGFfc2ltL3ZkcGFfc2ltLmMgYi9kcml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9z
aW0uYwo+IGluZGV4IGIzYzgwMDY1MzA1Ni4uZTAzYzI1NzY1NTEzIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvdmRwYS92ZHBhX3NpbS92ZHBhX3NpbS5jCj4gKysrIGIvZHJpdmVycy92ZHBhL3ZkcGFf
c2ltL3ZkcGFfc2ltLmMKPiBAQCAtNTA5LDcgKzUwOSw3IEBAIHN0YXRpYyB2b2lkIHZkcGFzaW1f
Z2V0X2NvbmZpZyhzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkcGEsIHVuc2lnbmVkIGludCBvZmZzZXQs
Cj4gICAJc3RydWN0IHZkcGFzaW0gKnZkcGFzaW0gPSB2ZHBhX3RvX3NpbSh2ZHBhKTsKPiAgIAo+
ICAgCWlmIChvZmZzZXQgKyBsZW4gPCBzaXplb2Yoc3RydWN0IHZpcnRpb19uZXRfY29uZmlnKSkK
PiAtCQltZW1jcHkoYnVmLCAmdmRwYXNpbS0+Y29uZmlnICsgb2Zmc2V0LCBsZW4pOwo+ICsJCW1l
bWNweShidWYsICh1OCAqKSZ2ZHBhc2ltLT5jb25maWcgKyBvZmZzZXQsIGxlbik7Cj4gICB9Cj4g
ICAKPiAgIHN0YXRpYyB2b2lkIHZkcGFzaW1fc2V0X2NvbmZpZyhzdHJ1Y3QgdmRwYV9kZXZpY2Ug
KnZkcGEsIHVuc2lnbmVkIGludCBvZmZzZXQsCgoKQWNrZWQtYnk6IEphc29uIFdhbmcgPGphc293
YW5nQHJlZGhhdC5jb20+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0
cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcv
bWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
