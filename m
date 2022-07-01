Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBE9562C60
	for <lists.virtualization@lfdr.de>; Fri,  1 Jul 2022 09:12:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D47F3403A7;
	Fri,  1 Jul 2022 07:12:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D47F3403A7
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VC9Ououg
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2ZpCb2WBWKO7; Fri,  1 Jul 2022 07:12:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9680D4026E;
	Fri,  1 Jul 2022 07:11:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9680D4026E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4FB7C007C;
	Fri,  1 Jul 2022 07:11:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E7F07C002D
 for <virtualization@lists.linux-foundation.org>;
 Fri,  1 Jul 2022 07:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AECC74026E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  1 Jul 2022 07:11:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AECC74026E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ilZDXu6t0Pvd
 for <virtualization@lists.linux-foundation.org>;
 Fri,  1 Jul 2022 07:11:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAABA40182
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EAABA40182
 for <virtualization@lists.linux-foundation.org>;
 Fri,  1 Jul 2022 07:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656659515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9H0KysDk28AeFuwB3uKx292zWa+OjfA0oCzCBryi4g4=;
 b=VC9OuougZyqBOPZWcjKhN/QtQ4fVoyHzG+y6EJpzdyO3lF7G/RlYjV6uMwVIZTHUTDNjzW
 gMHv2Ksp/EdswVAF/GeLhZonT4AZwqHaeHS7AAkKGz4NU80Mynpu+ZfuVMG/L/jbCQkWlx
 SVG1pHoE4ddAQVSFUN1JV3KhiyE/9cw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-hZl3QDTJPie2vX4NnfJ5Wg-1; Fri, 01 Jul 2022 03:11:52 -0400
X-MC-Unique: hZl3QDTJPie2vX4NnfJ5Wg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 337AF8001EA;
 Fri,  1 Jul 2022 07:11:52 +0000 (UTC)
Received: from localhost (unknown [10.39.193.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1F17492C3B;
 Fri,  1 Jul 2022 07:11:51 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] virtio: VIRTIO_HARDEN_NOTIFICATION is broken
In-Reply-To: <20220630191559.16738-1-mst@redhat.com>
Organization: Red Hat GmbH
References: <20220630191559.16738-1-mst@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Fri, 01 Jul 2022 09:11:50 +0200
Message-ID: <87iloh2top.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Cc: virtualization@lists.linux-foundation.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Thu, Jun 30 2022, "Michael S. Tsirkin" <mst@redhat.com> wrote:

> This option doesn't really work and breaks too many drivers.
> Not yet sure what's the right thing to do, for now
> let's make sure randconfig isn't broken by this.
>
> Fixes: c346dae4f3fb ("virtio: disable notification hardening by default")
> Cc: "Jason Wang" <jasowang@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  drivers/virtio/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
