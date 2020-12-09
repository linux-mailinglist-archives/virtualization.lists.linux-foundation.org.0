Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC672D406B
	for <lists.virtualization@lfdr.de>; Wed,  9 Dec 2020 11:58:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 439E787711;
	Wed,  9 Dec 2020 10:58:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yi-9wxlrJilF; Wed,  9 Dec 2020 10:58:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 232A0873C2;
	Wed,  9 Dec 2020 10:58:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 043B2C013B;
	Wed,  9 Dec 2020 10:58:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E872EC013B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 10:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9473F2078B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 10:58:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gnq4Iu3WQW5T
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 10:58:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by silver.osuosl.org (Postfix) with ESMTPS id 851C020551
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 10:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607511516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CgtH182QZzc921P4YWhD7Eorh+vwR+HI0Yw44CrRtXQ=;
 b=PL6b+CBYjAn1sM/TC5hhGhBGNLXBTr+ewSBSe5soHOBjpV2c6qYnvXib5CH4mI++6vvyvF
 AfbUe01dU2gHd0LZYLkcS812WIL2D3Bg+UZFslDA+v6f12ouHgPf0AAKRqRuF9UjGtJHtK
 QQwZr7U5U8BKExSZDh7DpoHtB9PGNQE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-BTqfnyBUMl6ympW4hotifw-1; Wed, 09 Dec 2020 05:58:34 -0500
X-MC-Unique: BTqfnyBUMl6ympW4hotifw-1
Received: by mail-wr1-f72.google.com with SMTP id d26so309910wrb.1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 09 Dec 2020 02:58:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=CgtH182QZzc921P4YWhD7Eorh+vwR+HI0Yw44CrRtXQ=;
 b=WsT3Tpq8IMBFhFCS9/grvVaitEvmZkkE1/Thd387k7owrouh67aWRL4bWblCfoqJ9Z
 OxQ/gVipkRmXucR4A6efhtIzs6pFotgmMGAnkcg0Mi1jo2dpctwEmVdPSo6fxOXe2rLQ
 LeR/bf4HLePtBfOjoz6ufx9Qye5IEZS+CJMNPJScI5eNADsQtzrdJlxrHwggpDmLtwiF
 8037gwAoLlishuq8UJLOHAoNzEdTcbE6U4BqHJyVM1vMiGXZbf9gD8tjZm//p9Q/ZVxh
 FwDlSbbZNBiwyjpuW/meXVMKEk1uVUiOOQRL3RjhZLqyZmWEeJMpVRW9wyGuOEVn5xbu
 Lb5A==
X-Gm-Message-State: AOAM532qkVQBMSI54z6cqhgEUirkxo2a4ELjFCNeV1qDk5e+FrBt2QnM
 5na8QwbtTr9y/QTWgHUgIt5VhUCXw1JMLqSr/hH/zspPSvxwh4Y/3XlMAoULsEwWfkzElwt7SHn
 y/HfYmC3VEDCYbaI1Arx7r8vJ5JJls10fKdZG4EJoxA==
X-Received: by 2002:a1c:f715:: with SMTP id v21mr2176952wmh.2.1607511513088;
 Wed, 09 Dec 2020 02:58:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylVz5XgOq9GoSUV1WCVxh13tyn/JWweRYpU6YEyg62wzZGma1ZTEe30MQA34D+nNxhUwSVyQ==
X-Received: by 2002:a1c:f715:: with SMTP id v21mr2176936wmh.2.1607511512924;
 Wed, 09 Dec 2020 02:58:32 -0800 (PST)
Received: from steredhat (host-79-24-227-66.retail.telecomitalia.it.
 [79.24.227.66])
 by smtp.gmail.com with ESMTPSA id 35sm2621611wro.71.2020.12.09.02.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 02:58:32 -0800 (PST)
Date: Wed, 9 Dec 2020 11:58:29 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v3 05/19] vdpa_sim: remove the limit of IOTLB entries
Message-ID: <20201209105829.6l6ie7xqp2eycds6@steredhat>
References: <20201203170511.216407-1-sgarzare@redhat.com>
 <20201203170511.216407-6-sgarzare@redhat.com>
 <d7b00b70-9785-db1f-1e42-7b9172b7ad90@redhat.com>
MIME-Version: 1.0
In-Reply-To: <d7b00b70-9785-db1f-1e42-7b9172b7ad90@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Laurent Vivier <lvivier@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Shahaf Shuler <shahafs@nvidia.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <elic@nvidia.com>,
 Oren Duer <oren@nvidia.com>
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

T24gTW9uLCBEZWMgMDcsIDIwMjAgYXQgMTI6MDA6MDdQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPgo+T24gMjAyMC8xMi80IOS4iuWNiDE6MDQsIFN0ZWZhbm8gR2FyemFyZWxsYSB3cm90ZToK
Pj5UaGUgc2ltdWxhdGVkIGRldmljZXMgY2FuIHN1cHBvcnQgbXVsdGlwbGUgcXVldWVzLCBzbyB0
aGlzIGxpbWl0Cj4+c2hvdWxkIGJlIGRlZmluZWQgYWNjb3JkaW5nIHRvIHRoZSBudW1iZXIgb2Yg
cXVldWVzIHN1cHBvcnRlZCBieQo+PnRoZSBkZXZpY2UuCj4+Cj4+U2luY2Ugd2UgYXJlIGluIGEg
c2ltdWxhdG9yLCBsZXQncyBzaW1wbHkgcmVtb3ZlIHRoYXQgbGltaXQuCj4+Cj4+U3VnZ2VzdGVk
LWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+PkFja2VkLWJ5OiBKYXNvbiBX
YW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+PlNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gR2FyemFy
ZWxsYSA8c2dhcnphcmVAcmVkaGF0LmNvbT4KPgo+Cj5SZXRoaW5rIGFib3V0IHRoaXMsIHNpbmNl
IHNpbXVsYXRvciBjYW4gYmUgdXNlZCBieSBWTSwgc28gdGhlIAo+YWxsb2NhdGlvbiBpcyBhY3R1
YWxseSBndWVzdCB0cmlnZ2VyLWFibGUgd2hlbiB2SU9NTVUgaXMgZW5hYmxlZC4KPgo+VGhpcyBt
ZWFucyB3ZSBuZWVkIGEgbGltaXQgc29tZWhvdywgKGUuZyBJIHJlbWVtYmVyIHN3aW90bGIgaXMg
YWJvdXQgCj42NE1CIGJ5IGRlZmF1bHQpLiBPciBoYXZpbmcgYSBtb2R1bGUgcGFyYW1ldGVyIGZv
ciB0aGlzLgo+Cj5CdHcsIGhhdmUgeW91IG1ldCBhbnkgaXNzdWUgd2hlbiB1c2luZyAyMDQ4LCBJ
IGd1ZXNzIGl0IGNhbiBoYXBwZW4gCj53aGVuIHdlIHJ1biBzZXZlcmFsIHByb2Nlc3NlcyBpbiBw
YXJhbGxlbD8KPgoKTm8sIEkgZGlkbid0IHRyeSB3aXRoIHRoZSBsaW1pdC4KVGhpcyBjYW1lIGZy
b20gdGhlIHJldmlld3MgdG8gTWF4J3MgcGF0Y2hlcy4KCkFueXdheSBJIGNhbiBhZGQgYSBtb2R1
bGUgcGFyYW1ldGVyIHRvIGNvbnRyb2wgdGhhdCBsaW1pdCwgZG8geW91IHRoaW5rIAppcyBiZXR0
ZXIgdG8gc2V0IGEgbGltaXQgcGVyIHF1ZXVlICh0aGUgcGFyYW1ldGVyIHBlciBudW1iZXIgb2Yg
cXVldWVzKSwgCm9yIGp1c3QgYSB2YWx1ZSBmb3IgdGhlIGVudGlyZSBkZXZpY2U/CgpUaGFua3Ms
ClN0ZWZhbm8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
ClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1m
b3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9s
aXN0aW5mby92aXJ0dWFsaXphdGlvbg==
