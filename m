Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D73D92E90A8
	for <lists.virtualization@lfdr.de>; Mon,  4 Jan 2021 08:01:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8351D203B8;
	Mon,  4 Jan 2021 07:01:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A2mTlPeLU+iN; Mon,  4 Jan 2021 07:00:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 08000203DC;
	Mon,  4 Jan 2021 07:00:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E02C2C013A;
	Mon,  4 Jan 2021 07:00:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9DA88C013A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 07:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8876F85F5A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 07:00:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7DtWhct3pVBI
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 07:00:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0285885F58
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 07:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609743655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m95EV6wkqZdUunicOxOCYJRjT+GcrUdr9jvQjDQWdyw=;
 b=NYGFSjQ7pEh7gTQ5eX9BbsZsU6TTDJB+0VyG1374V6LBKuO7vy7RJtvdZnyu70xH0O4bR/
 BI6sYVNpxCkbY2fIFlsfaQuJIg17Mc4ceOmyd0LKAqQcwxTHEpdbuGw9i6ea7eN3xMHGaJ
 flLlC3uEG12g9dhqmXbUckJDOT9HKcU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-WqFmXLEtP7KvW6vt9Cgmmg-1; Mon, 04 Jan 2021 02:00:51 -0500
X-MC-Unique: WqFmXLEtP7KvW6vt9Cgmmg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 507F78018AF;
 Mon,  4 Jan 2021 07:00:50 +0000 (UTC)
Received: from [10.72.13.91] (ovpn-13-91.pek2.redhat.com [10.72.13.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8945E27C4E;
 Mon,  4 Jan 2021 07:00:45 +0000 (UTC)
Subject: Re: [PATCH linux-next v2 1/7] vdpa_sim_net: Make mac address array
 static
To: Parav Pandit <parav@nvidia.com>, virtualization@lists.linux-foundation.org
References: <20201112064005.349268-1-parav@nvidia.com>
 <20210104033141.105876-1-parav@nvidia.com>
 <20210104033141.105876-2-parav@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b3832d82-7c32-52fd-cebc-1cbe2119ecfc@redhat.com>
Date: Mon, 4 Jan 2021 15:00:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210104033141.105876-2-parav@nvidia.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

Ck9uIDIwMjEvMS80IOS4iuWNiDExOjMxLCBQYXJhdiBQYW5kaXQgd3JvdGU6Cj4gTUFDIGFkZHJl
c3MgYXJyYXkgaXMgdXNlZCBvbmx5IGluIHZkcGFfc2ltX25ldC5jLgo+IEhlbmNlLCBrZWVwIGl0
IHN0YXRpYy4KPgo+IFNpZ25lZC1vZmYtYnk6IFBhcmF2IFBhbmRpdCA8cGFyYXZAbnZpZGlhLmNv
bT4KPiAtLS0KPiBDaGFuZ2Vsb2c6Cj4gdjEtPnYyOgo+ICAgLSBuZXcgcGF0Y2gKPiAtLS0KPiAg
IGRyaXZlcnMvdmRwYS92ZHBhX3NpbS92ZHBhX3NpbV9uZXQuYyB8IDIgKy0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdmRwYS92ZHBhX3NpbS92ZHBhX3NpbV9uZXQuYyBiL2RyaXZlcnMvdmRwYS92ZHBhX3Np
bS92ZHBhX3NpbV9uZXQuYwo+IGluZGV4IGMxMGI2OTgxZmRhYi4uZjA0ODI0MjcxODZiIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvdmRwYS92ZHBhX3NpbS92ZHBhX3NpbV9uZXQuYwo+ICsrKyBiL2Ry
aXZlcnMvdmRwYS92ZHBhX3NpbS92ZHBhX3NpbV9uZXQuYwo+IEBAIC0zMyw3ICszMyw3IEBAIHN0
YXRpYyBjaGFyICptYWNhZGRyOwo+ICAgbW9kdWxlX3BhcmFtKG1hY2FkZHIsIGNoYXJwLCAwKTsK
PiAgIE1PRFVMRV9QQVJNX0RFU0MobWFjYWRkciwgIkV0aGVybmV0IE1BQyBhZGRyZXNzIik7Cj4g
ICAKPiAtdTggbWFjYWRkcl9idWZbRVRIX0FMRU5dOwo+ICtzdGF0aWMgdTggbWFjYWRkcl9idWZb
RVRIX0FMRU5dOwo+ICAgCj4gICBzdGF0aWMgc3RydWN0IHZkcGFzaW0gKnZkcGFzaW1fbmV0X2Rl
djsKPiAgIAoKCkFja2VkLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0
aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0
dWFsaXphdGlvbg==
