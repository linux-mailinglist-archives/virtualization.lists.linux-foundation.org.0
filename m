Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDEF221DF3
	for <lists.virtualization@lfdr.de>; Thu, 16 Jul 2020 10:13:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7B6A18AF14;
	Thu, 16 Jul 2020 08:13:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o+KrAe4hM+rb; Thu, 16 Jul 2020 08:13:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0B19B8AF0B;
	Thu, 16 Jul 2020 08:13:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D428CC0733;
	Thu, 16 Jul 2020 08:13:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8A3A1C0733
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 08:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 667082271C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 08:13:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 97z4nuxy7I+U
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 08:13:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id AFAB6226D4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 08:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594887212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KNspZOYeXPNEGhnpGmkV6yRlFjwe98L5l1zZfV35HAA=;
 b=TRC/vWjhkQgUkQS8h1x8IlsLNYVzx91ALPR6u1jW4VQI5LcbM/BrhTJjvCLQodIIsPqyrg
 fHPYtgYTA6kej5oJ0ICdf+bnA+veko2mz5gf5k9OH7pgnjClizqi1muBufQphf9M4IASXD
 kyElPcYy4GX7QojcN7bEvA2nmhGSrSk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-7O40IOJAPfKPQG8lgD2MZg-1; Thu, 16 Jul 2020 04:13:30 -0400
X-MC-Unique: 7O40IOJAPfKPQG8lgD2MZg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 465061080;
 Thu, 16 Jul 2020 08:13:29 +0000 (UTC)
Received: from [10.72.12.131] (ovpn-12-131.pek2.redhat.com [10.72.12.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B37727980F;
 Thu, 16 Jul 2020 08:13:23 +0000 (UTC)
Subject: Re: [PATCH vhost next 09/10] vdpa/mlx5: Add shared memory
 registration code
To: Eli Cohen <eli@mellanox.com>, mst@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20200716072327.5359-1-eli@mellanox.com>
 <20200716072327.5359-10-eli@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <61765932-5411-9f37-3a4a-ca5ac5daa28e@redhat.com>
Date: Thu, 16 Jul 2020 16:13:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200716072327.5359-10-eli@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: shahafs@mellanox.com, Parav Pandit <parav@mellanox.com>,
 saeedm@mellanox.com
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

Ck9uIDIwMjAvNy8xNiDkuIvljYgzOjIzLCBFbGkgQ29oZW4gd3JvdGU6Cj4gQWRkIGNvZGUgdG8g
c3VwcG9ydCByZWdpc3RlcmluZyBndWVzdCdzIG1lbW9yeSByZWdpb24gZm9yIHRoZSBkZXZpY2Uu
CgoKSXQgd291bGQgYmUgYmV0dGVyIHRvIHVzZSAidXNlcnNwYWNlIiBtZW1vcnkgaGVyZSBzaW5j
ZSB2aG9zdC12RFBBIGNvdWxkIApiZSB1c2VkIGJ5IGUuZyBkcGRrIGFwcGxpY2F0aW9uIG9uIHRo
ZSBob3N0IGluIHRoZSBmdXR1cmUuCgpUaGFua3MKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVh
bGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
