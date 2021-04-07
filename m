Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A767356DAB
	for <lists.virtualization@lfdr.de>; Wed,  7 Apr 2021 15:45:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3027405B6;
	Wed,  7 Apr 2021 13:45:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zDin7QhkFtCc; Wed,  7 Apr 2021 13:45:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94E21405D3;
	Wed,  7 Apr 2021 13:44:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 37A1FC0012;
	Wed,  7 Apr 2021 13:44:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C159C000A
 for <virtualization@lists.linux-foundation.org>;
 Wed,  7 Apr 2021 13:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CA55405BD
 for <virtualization@lists.linux-foundation.org>;
 Wed,  7 Apr 2021 13:44:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0-N-jYoof2MB
 for <virtualization@lists.linux-foundation.org>;
 Wed,  7 Apr 2021 13:44:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B92B405B1
 for <virtualization@lists.linux-foundation.org>;
 Wed,  7 Apr 2021 13:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617803095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+qfQSPZh07voq3kELp2Besk6GzaixAE/JVns2pfUdis=;
 b=iDlA5rQNLSwo4eSCiXdp215BwFBCmYmm+VmIU6mS/Rr/gn20d6A/4UJszeVmu+qGGWtuJh
 GE8g+2i/6LxfgWjkz7aLAw5o8XdsPsEvkTmCAYbzxSbMCQ/OtaZhYlRaIXeJc1pJ3JhcA3
 zNGjlH9TQ9muBlOFrB/ehVII6ydMbVA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-aPoKjIlxODKAQJre3BW9AA-1; Wed, 07 Apr 2021 09:44:54 -0400
X-MC-Unique: aPoKjIlxODKAQJre3BW9AA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D89D660E;
 Wed,  7 Apr 2021 13:44:52 +0000 (UTC)
Received: from gondolin (ovpn-113-88.ams2.redhat.com [10.36.113.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7570760C04;
 Wed,  7 Apr 2021 13:44:47 +0000 (UTC)
Date: Wed, 7 Apr 2021 15:44:44 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Subject: Re: [PATCH 1/3] virtio: update reset callback to return status
Message-ID: <20210407154444.04d6304b.cohuck@redhat.com>
In-Reply-To: <20210407120924.133294-1-mgurtovoy@nvidia.com>
References: <20210407120924.133294-1-mgurtovoy@nvidia.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: kvm@vger.kernel.org, mst@redhat.com,
 virtualization@lists.linux-foundation.org, nitzanc@nvidia.com, oren@nvidia.com
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

On Wed, 7 Apr 2021 12:09:22 +0000
Max Gurtovoy <mgurtovoy@nvidia.com> wrote:

> The reset device operation, usually is an operation that might fail from
> various reasons. For example, the controller might be in a bad state and
> can't answer to any request. Usually, the paravirt SW based virtio
> devices always succeed in reset operation but this is not the case for
> HW based virtio devices.
> 
> This commit is also a preparation for adding a timeout mechanism for
> resetting virtio devices.
> 
> Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
> ---
>  drivers/remoteproc/remoteproc_virtio.c |  3 ++-
>  drivers/virtio/virtio.c                | 22 +++++++++++++++-------
>  drivers/virtio/virtio_mmio.c           |  3 ++-
>  drivers/virtio/virtio_pci_legacy.c     |  3 ++-
>  drivers/virtio/virtio_pci_modern.c     |  3 ++-
>  drivers/virtio/virtio_vdpa.c           |  3 ++-
>  include/linux/virtio_config.h          |  5 +++--
>  7 files changed, 28 insertions(+), 14 deletions(-)

You missed drivers/s390/virtio/virtio_ccw.c.

virtio_ccw_reset() should probably return -ENOMEM on allocation failure
and forward the return code of ccw_io_helper().

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
