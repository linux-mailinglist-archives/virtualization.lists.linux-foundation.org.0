Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DA51E5AB3
	for <lists.virtualization@lfdr.de>; Thu, 28 May 2020 10:25:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CA2F98803D;
	Thu, 28 May 2020 08:25:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2yMAMWWClNcg; Thu, 28 May 2020 08:25:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 68AB187BD7;
	Thu, 28 May 2020 08:25:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41DFEC016F;
	Thu, 28 May 2020 08:25:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C8094C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 May 2020 08:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C419788B52
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 May 2020 08:25:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BxOvhtF2QxDb
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 May 2020 08:25:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3485288B33
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 May 2020 08:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590654331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1FDw7BpJ0xSW8IzVxPgO7pxHBiOIkmFjhO2DpZUWbXM=;
 b=PvrnZG4bdIJ3zr/2ApmvVEBjxR8z7hK9lFk40LOcB0sNHJ6/DfVo6QLWj3xWllXjLT6aC+
 TyCsFvVMjrd6HaswHxFLsIuiprVzW8LHrywUUvjivKn55NaLg0yv6KSDQZo4MhxUtY6w5s
 hZGc7EP91FXQHpEpXBi+U77P4j7NXjo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-5Hmout4CMqiH080guzY__Q-1; Thu, 28 May 2020 04:25:27 -0400
X-MC-Unique: 5Hmout4CMqiH080guzY__Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18FA1800D24;
 Thu, 28 May 2020 08:25:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 387CB10021B3;
 Thu, 28 May 2020 08:25:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0552C16E2C; Thu, 28 May 2020 10:25:24 +0200 (CEST)
Date: Thu, 28 May 2020 10:25:23 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dongyang Zhan <zdyzztq@gmail.com>
Subject: Re: Potential Memory Leak Bugs in
 drivers/gpu/drm/virtio/virtgpu_vq.c (Linux 5.6).
Message-ID: <20200528082523.mvurcvr6ohbziad5@sirius.home.kraxel.org>
References: <CAFSR4ctYjWc8LSqb96Suwprv9=Gd0+vVPZ5pLn+5u1CV7wTq9Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFSR4ctYjWc8LSqb96Suwprv9=Gd0+vVPZ5pLn+5u1CV7wTq9Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Thu, May 28, 2020 at 03:57:05PM +0800, Dongyang Zhan wrote:
> Hi,
> My name is Dongyang Zhan, I am a security researcher.
> Currently, I found two possible memory bugs in
> drivers/gpu/drm/virtio/virtgpu_vq.c (Linux 5.6).
> I hope you can help me to confirm them. Thank you.

Sorry.  Not confirmed.  You should do a better job verifying your
claims before bugging people.

> The first one is resp_buf will not be release in
> virtio_gpu_cmd_get_display_info() with the condition
> (resp_size <= MAX_INLINE_RESP_SIZE) in virtio_gpu_alloc_cmd_resp().

In that code path resp_size equals sizeof(struct
virtio_gpu_resp_display_info) which is larger than MAX_INLINE_RESP_SIZE
so the condition is never true and no leak happens.

take care,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
