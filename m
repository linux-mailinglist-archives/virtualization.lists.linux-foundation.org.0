Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 974DA58FD43
	for <lists.virtualization@lfdr.de>; Thu, 11 Aug 2022 15:19:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36930830C0;
	Thu, 11 Aug 2022 13:19:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36930830C0
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BesED0su
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6LFbvqKrVth1; Thu, 11 Aug 2022 13:19:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 11DD18308D;
	Thu, 11 Aug 2022 13:19:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11DD18308D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 49581C007B;
	Thu, 11 Aug 2022 13:19:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D0BD7C002D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Aug 2022 13:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA48C4182A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Aug 2022 13:19:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA48C4182A
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=BesED0su
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7cCcn5v3mc7Z
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Aug 2022 13:19:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0FFA41822
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B0FFA41822
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Aug 2022 13:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660223967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p0uKFDfXP8UK2kv9F4U2RkkSlS76ekQt9UIZaGMUKKM=;
 b=BesED0sugOcNhpvuJPLEjSQT1q531Rp5hUk4gUZBVjjItqnByNkMjXqyxGT67B1ed+hFY3
 +Qjt7SmoXFtDgBZv/ckv/bkzvGs/B1Fufdle6DjhNF9SU1D6fVX7biPYASw8Xpx9/FoI36
 4DIYLTfO0MhMFh4T9MAfdHK+T7Sjwdw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-jASUlZ3DM8WAWgojT95a5Q-1; Thu, 11 Aug 2022 09:19:23 -0400
X-MC-Unique: jASUlZ3DM8WAWgojT95a5Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E7BA3C01DA8;
 Thu, 11 Aug 2022 13:19:23 +0000 (UTC)
Received: from localhost (unknown [10.39.193.95])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C70132166B26;
 Thu, 11 Aug 2022 13:19:22 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] virtio: kerneldocs fixes and enhancements
In-Reply-To: <20220810094004.1250-2-ricardo.canuelo@collabora.com>
Organization: Red Hat GmbH
References: <20220810094004.1250-1-ricardo.canuelo@collabora.com>
 <20220810094004.1250-2-ricardo.canuelo@collabora.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Thu, 11 Aug 2022 15:19:21 +0200
Message-ID: <87fsi2dijq.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Cc: mst@redhat.com, kernel@collabora.com, bagasdotme@gmail.com,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gV2VkLCBBdWcgMTAgMjAyMiwgUmljYXJkbyBDYcOxdWVsbyA8cmljYXJkby5jYW51ZWxvQGNv
bGxhYm9yYS5jb20+IHdyb3RlOgoKPiBGaXggdmFyaWFibGUgbmFtZXMgaW4gc29tZSBrZXJuZWxk
b2NzLCBuYW1pbmcgaW4gb3RoZXJzLgo+IEFkZCBrZXJuZWxkb2NzIGZvciBzdHJ1Y3QgdnJpbmdf
ZGVzYyBhbmQgdnJpbmdfaW50ZXJydXB0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogUmljYXJkbyBDYcOx
dWVsbyA8cmljYXJkby5jYW51ZWxvQGNvbGxhYm9yYS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvdmly
dGlvL3ZpcnRpb19yaW5nLmMgICAgIHwgIDggKysrKysrKysKPiAgaW5jbHVkZS9saW51eC92aXJ0
aW8uaCAgICAgICAgICAgfCAgNiArKystLS0KPiAgaW5jbHVkZS9saW51eC92aXJ0aW9fY29uZmln
LmggICAgfCAgNiArKystLS0KPiAgaW5jbHVkZS91YXBpL2xpbnV4L3ZpcnRpb19yaW5nLmggfCAx
NiArKysrKysrKysrKy0tLS0tCj4gIDQgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwg
MTEgZGVsZXRpb25zKC0pCgpSZXZpZXdlZC1ieTogQ29ybmVsaWEgSHVjayA8Y29odWNrQHJlZGhh
dC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpW
aXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91
bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlz
dGluZm8vdmlydHVhbGl6YXRpb24=
