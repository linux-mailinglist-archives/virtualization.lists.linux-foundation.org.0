Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E086F1BD746
	for <lists.virtualization@lfdr.de>; Wed, 29 Apr 2020 10:28:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 486B28697C;
	Wed, 29 Apr 2020 08:28:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xD6521l3Q-Sy; Wed, 29 Apr 2020 08:28:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D248786278;
	Wed, 29 Apr 2020 08:28:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A0CDFC0172;
	Wed, 29 Apr 2020 08:28:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C5A1EC0172
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 08:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B979684906
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 08:28:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TlgZzrRqTAZW
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 08:28:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E3E3C8436F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 08:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588148922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=307isNnvbFBLVIHqWZVI02AT/E09cU5NkzO3QxAC0lI=;
 b=M9OcU9Unhp4Gve3yeLhAKkzbd8BsWhj8Q/56tXF7aJ/nXVcIGm0vHN2mhyoLER16woQctH
 wMnGMqrSdf2FRF4vk5yAOD4SCdz1k0vJLsDpRSsppLWst7pwCdtGHqt6rloY2eTcnopiU4
 MmbTwCfFWX2RNd3UwghNz0TbDCRc7MQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-ETodXgd1OBKAK3jUQcuNEw-1; Wed, 29 Apr 2020 04:28:41 -0400
X-MC-Unique: ETodXgd1OBKAK3jUQcuNEw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81BFD45F;
 Wed, 29 Apr 2020 08:28:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06B6F5D9E5;
 Wed, 29 Apr 2020 08:28:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BFF5E1753B; Wed, 29 Apr 2020 10:28:37 +0200 (CEST)
Date: Wed, 29 Apr 2020 10:28:37 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vasily Averin <vvs@virtuozzo.com>
Subject: Re: [PATCH 1/1] drm/qxl: add mutex_lock/mutex_unlock to ensure the
 order in which resources are rele
Message-ID: <20200429082837.uedcapxmennuc5a2@sirius.home.kraxel.org>
References: <bc954de7-bfe0-8e0c-79d4-90d726a0ffa6@virtuozzo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bc954de7-bfe0-8e0c-79d4-90d726a0ffa6@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: "Denis V. Lunev" <den@virtuozzo.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org\"" <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Zhangyueqian <zhangyueqian@uniontech.com>, Dave Airlie <airlied@redhat.com>,
 Caicai <caizhaopeng@uniontech.com>
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

  Hi,

> > The only way I see for this to happen is that the guest is preempted
> > between qxl_push_{cursor,command}_ring_release() and
> > qxl_release_fence_buffer_objects() calls.  The host can complete the qxl
> > command then, signal the guest, and the IRQ handler calls
> > qxl_release_free_list() before qxl_release_fence_buffer_objects() runs.
> 
> We think the same: qxl_release was freed by garbage collector before
> original thread had called qxl_release_fence_buffer_objects().

Ok, nice, I think we can consider the issue being analyzed then ;)

> > Looking through the code I think it should be safe to simply swap the
> > qxl_release_fence_buffer_objects() +
> > qxl_push_{cursor,command}_ring_release() calls to close that race
> > window.  Can you try that and see if it fixes the bug for you?
> 
> I'm going to prepare and test such patch but I have one question here:
> qxl_push_*_ring_release can be called with  interruptible=true and fail
> How to correctly handle this case? Is the hunk below correct from your POV?

Oh, right, the error code path will be quite different, checking ...

> --- a/drivers/gpu/drm/qxl/qxl_ioctl.c
> +++ b/drivers/gpu/drm/qxl/qxl_ioctl.c
> @@ -261,12 +261,8 @@ static int qxl_process_single_command(struct qxl_device *qdev,
>                         apply_surf_reloc(qdev, &reloc_info[i]);
>         }
>  
> +       qxl_release_fence_buffer_objects(release);
>         ret = qxl_push_command_ring_release(qdev, release, cmd->type, true);
> -       if (ret)
> -               qxl_release_backoff_reserve_list(release);  <<<< ????
> -       else
> -               qxl_release_fence_buffer_objects(release);
> -
>  out_free_bos:
>  out_free_release:
	if (ret)
		qxl_release_free(qdev, release);

[ code context added ]

qxl_release_free() checks whenever a release is fenced and signals the
fence in case it is so it doesn't wait for the signal forever.  So, yes,
I think qxl_release_free() should cleanup the release properly in any
case and the patch chunk should be correct.

take care,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
