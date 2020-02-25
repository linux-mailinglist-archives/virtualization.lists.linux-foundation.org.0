Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 717DA16B92E
	for <lists.virtualization@lfdr.de>; Tue, 25 Feb 2020 06:40:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0461B870AD;
	Tue, 25 Feb 2020 05:39:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2eEgQoyWw79C; Tue, 25 Feb 2020 05:39:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7903B870A9;
	Tue, 25 Feb 2020 05:39:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5D3C6C0177;
	Tue, 25 Feb 2020 05:39:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A0F0C0177
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 05:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2591F20506
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 05:39:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M6OY+izJirJU
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 05:39:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 2A626204FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 05:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582609194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yvyMr31DEcUC3wl6gi1vnkH+1S5pTodyIZXAYjl8UxA=;
 b=En+pd2BZMstAE8xSKWiy+S6eiUQAoegB05+F4N6iBYik9YQtdEklJWrr9yMpsYqVZsB1Oj
 yK9tBVUI4jhnxpnlfXRGOaEyZPQDTxHtr/+Lfdsj9g/50XZ8FP4IvF0vVPIGxTzM7pBdIu
 OYo9ewnDOnN0CCQYa0OjMTyeBU8sOEQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-ZxyOww8YMguspF5qMtIFnQ-1; Tue, 25 Feb 2020 00:39:50 -0500
X-MC-Unique: ZxyOww8YMguspF5qMtIFnQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D0BD18AB2C2;
 Tue, 25 Feb 2020 05:39:49 +0000 (UTC)
Received: from [10.72.13.170] (ovpn-13-170.pek2.redhat.com [10.72.13.170])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 001D1393;
 Tue, 25 Feb 2020 05:39:43 +0000 (UTC)
Subject: Re: [PATCH] virtio_ring: Fix mem leak with vring_new_virtqueue()
To: Suman Anna <s-anna@ti.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20200224212643.30672-1-s-anna@ti.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b622c831-9adb-b9af-dd4a-21605bc124a8@redhat.com>
Date: Tue, 25 Feb 2020 13:39:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200224212643.30672-1-s-anna@ti.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
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

Ck9uIDIwMjAvMi8yNSDkuIrljYg1OjI2LCBTdW1hbiBBbm5hIHdyb3RlOgo+IFRoZSBmdW5jdGlv
bnMgdnJpbmdfbmV3X3ZpcnRxdWV1ZSgpIGFuZCBfX3ZyaW5nX25ld192aXJ0cXVldWUoKSBhcmUg
dXNlZAo+IHdpdGggc3BsaXQgcmluZ3MsIGFuZCBhbnkgYWxsb2NhdGlvbnMgd2l0aGluIHRoZXNl
IGZ1bmN0aW9ucyBhcmUgbWFuYWdlZAo+IG91dHNpZGUgb2YgdGhlIC53ZV9vd25fcmluZyBmbGFn
LiBUaGUgY29tbWl0IGNiZWVkYjcyYjk3YSAoInZpcnRpb19yaW5nOgo+IGFsbG9jYXRlIGRlc2Mg
c3RhdGUgZm9yIHNwbGl0IHJpbmcgc2VwYXJhdGVseSIpIGFsbG9jYXRlcyB0aGUgZGVzYyBzdGF0
ZQo+IHdpdGhpbiB0aGUgX192cmluZ19uZXdfdmlydHF1ZXVlKCkgYnV0IGZyZWVzIGl0IG9ubHkg
d2hlbiB0aGUgLndlX293bl9yaW5nCj4gZmxhZyBpcyBzZXQuIFRoaXMgbGVhZHMgdG8gYSBtZW1v
cnkgbGVhayB3aGVuIGZyZWVpbmcgc3VjaCBhbGxvY2F0ZWQKPiB2aXJ0cXVldWVzIHdpdGggdGhl
IHZyaW5nX2RlbF92aXJ0cXVldWUoKSBmdW5jdGlvbi4KPgo+IEZpeCB0aGlzIGJ5IG1vdmluZyB0
aGUgZGVzY19zdGF0ZSBmcmVlIGNvZGUgb3V0c2lkZSB0aGUgZmxhZyBhbmQgb25seQo+IGZvciBz
cGxpdCByaW5ncy4gSXNzdWUgd2FzIGRpc2NvdmVyZWQgZHVyaW5nIHRlc3Rpbmcgd2l0aCByZW1v
dGVwcm9jCj4gYW5kIHZpcnRpb19ycG1zZy4KPgo+IEZpeGVzOiBjYmVlZGI3MmI5N2EgKCJ2aXJ0
aW9fcmluZzogYWxsb2NhdGUgZGVzYyBzdGF0ZSBmb3Igc3BsaXQgcmluZyBzZXBhcmF0ZWx5IikK
PiBTaWduZWQtb2ZmLWJ5OiBTdW1hbiBBbm5hIDxzLWFubmFAdGkuY29tPgo+IC0tLQo+ICAgZHJp
dmVycy92aXJ0aW8vdmlydGlvX3JpbmcuYyB8IDQgKystLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zp
cnRpby92aXJ0aW9fcmluZy5jIGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX3JpbmcuYwo+IGluZGV4
IDg2N2M3ZWJkM2YxMC4uNThiOTZiYWE4ZDQ4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlydGlv
L3ZpcnRpb19yaW5nLmMKPiArKysgYi9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jCj4gQEAg
LTIyMDMsMTAgKzIyMDMsMTAgQEAgdm9pZCB2cmluZ19kZWxfdmlydHF1ZXVlKHN0cnVjdCB2aXJ0
cXVldWUgKl92cSkKPiAgIAkJCQkJIHZxLT5zcGxpdC5xdWV1ZV9zaXplX2luX2J5dGVzLAo+ICAg
CQkJCQkgdnEtPnNwbGl0LnZyaW5nLmRlc2MsCj4gICAJCQkJCSB2cS0+c3BsaXQucXVldWVfZG1h
X2FkZHIpOwo+IC0KPiAtCQkJa2ZyZWUodnEtPnNwbGl0LmRlc2Nfc3RhdGUpOwo+ICAgCQl9Cj4g
ICAJfQo+ICsJaWYgKCF2cS0+cGFja2VkX3JpbmcpCj4gKwkJa2ZyZWUodnEtPnNwbGl0LmRlc2Nf
c3RhdGUpOwoKCk5pdHBpY2ssIGl0IGxvb2tzIHRvIG1lIGl0IHdvdWxkIGJlIG1vcmUgY2xlYXIg
aWYgd2UganVzdCBmcmVlIApkZXNjX3N0YXRlIHVuY29uZGl0aW9uYWxseSBoZXJlIChhbmQgcmVt
b3ZlIHRoZSBrZnJlZSBmb3IgcGFja2VkIGFib3ZlKS4KCkFueXdheSBkZXNjX3N0YXRlIHdpbGwg
YmUgYWxsb2NhdGVkIGJ5IHVzZSBldmVuIGlmICF3ZV9vd25fcmluZy4KClRoYW5rcwoKCj4gICAJ
bGlzdF9kZWwoJl92cS0+bGlzdCk7Cj4gICAJa2ZyZWUodnEpOwo+ICAgfQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGlu
ZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8v
bGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
