Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FBC2E90B1
	for <lists.virtualization@lfdr.de>; Mon,  4 Jan 2021 08:05:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3999885F49;
	Mon,  4 Jan 2021 07:05:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pcod8TrD7eVw; Mon,  4 Jan 2021 07:05:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4ACCF85F5C;
	Mon,  4 Jan 2021 07:05:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 20C6CC088B;
	Mon,  4 Jan 2021 07:05:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA96DC013A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 07:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6C35D870A1
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 07:05:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Koybok-g6LoB
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 07:05:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D313C8709E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 07:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609743915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7jV/b1qkJ/bT/FIZ0qTc/fmDTqo3xcqkhKGWdVPv3Ks=;
 b=G5FmqQ1A6Ggcu5AsQ2zB4TXd3UqfRQshW3Jqxjy5J5L4uhfEJet7Pc3sqm9iEm4cQYmQzv
 gO3oOfhj+GGh7fOtYUpFabAGSXCzv79ow9BLYxQ0O4HYbamNsgQfFWEiPB4UMrwVU3CG9i
 NUdfSE7WEfmQ8xf/lbheiPDhQlxD2PQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-Y0yoWDnSPTaaHTKx2YDjvQ-1; Mon, 04 Jan 2021 02:05:13 -0500
X-MC-Unique: Y0yoWDnSPTaaHTKx2YDjvQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A5EE800D55;
 Mon,  4 Jan 2021 07:05:12 +0000 (UTC)
Received: from [10.72.13.91] (ovpn-13-91.pek2.redhat.com [10.72.13.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9AF735D9D3;
 Mon,  4 Jan 2021 07:05:07 +0000 (UTC)
Subject: Re: [PATCH linux-next v2 7/7] vdpa_sim_net: Add support for user
 supported devices
To: Parav Pandit <parav@nvidia.com>, virtualization@lists.linux-foundation.org
References: <20201112064005.349268-1-parav@nvidia.com>
 <20210104033141.105876-1-parav@nvidia.com>
 <20210104033141.105876-8-parav@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ea07c16e-6bc5-0371-4b53-4bf4c75d5af8@redhat.com>
Date: Mon, 4 Jan 2021 15:05:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210104033141.105876-8-parav@nvidia.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: netdev@vger.kernel.org, elic@nvidia.com, mst@redhat.com
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

Ck9uIDIwMjEvMS80IOS4iuWNiDExOjMxLCBQYXJhdiBQYW5kaXQgd3JvdGU6Cj4gICBzdGF0aWMg
aW50IF9faW5pdCB2ZHBhc2ltX25ldF9pbml0KHZvaWQpCj4gICB7Cj4gICAJaW50IHJldCA9IDA7
Cj4gQEAgLTE3Niw2ICsyNjQsOCBAQCBzdGF0aWMgaW50IF9faW5pdCB2ZHBhc2ltX25ldF9pbml0
KHZvaWQpCj4gICAKPiAgIAlpZiAoZGVmYXVsdF9kZXZpY2UpCj4gICAJCXJldCA9IHZkcGFzaW1f
bmV0X2RlZmF1bHRfZGV2X3JlZ2lzdGVyKCk7Cj4gKwllbHNlCj4gKwkJcmV0ID0gdmRwYXNpbV9u
ZXRfbWdtdGRldl9pbml0KCk7Cj4gICAJcmV0dXJuIHJldDsKPiAgIH0KPiAgIAo+IEBAIC0xODMs
NiArMjczLDggQEAgc3RhdGljIHZvaWQgX19leGl0IHZkcGFzaW1fbmV0X2V4aXQodm9pZCkKPiAg
IHsKPiAgIAlpZiAoZGVmYXVsdF9kZXZpY2UpCj4gICAJCXZkcGFzaW1fbmV0X2RlZmF1bHRfZGV2
X3VucmVnaXN0ZXIoKTsKPiArCWVsc2UKPiArCQl2ZHBhc2ltX25ldF9tZ210ZGV2X2NsZWFudXAo
KTsKPiAgIH0KPiAgIAo+ICAgbW9kdWxlX2luaXQodmRwYXNpbV9uZXRfaW5pdCk7Cj4gLS0gMi4y
Ni4yCgoKSSB3b25kZXIgd2hhdCdzIHRoZSB2YWx1ZSBvZiBrZWVwaW5nIHRoZSBkZWZhdWx0IGRl
dmljZSB0aGF0IGlzIG91dCBvZiAKdGhlIGNvbnRyb2wgb2YgbWFuYWdlbWVudCBBUEkuCgpUaGFu
a3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1
YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0
aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5m
by92aXJ0dWFsaXphdGlvbg==
