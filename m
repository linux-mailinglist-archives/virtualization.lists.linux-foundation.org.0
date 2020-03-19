Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF8218B1ED
	for <lists.virtualization@lfdr.de>; Thu, 19 Mar 2020 12:02:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 55B948834D;
	Thu, 19 Mar 2020 11:02:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yLTS-oC78Hlw; Thu, 19 Mar 2020 11:02:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DDB818834C;
	Thu, 19 Mar 2020 11:02:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C3385C07FF;
	Thu, 19 Mar 2020 11:02:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 927C1C07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 11:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 84B208832F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 11:02:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wx4nnew68wBv
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 11:02:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9F20788266
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 11:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584615757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wv0CIJUyl8keYTWgcuAGZ94Xhx3biDTfmG+KzaIIjzY=;
 b=Z35VKlFhVBqxLyCfBzP7jz54Ryns9E4tDd2xm+Tu4koDAKWDTsSuSz8rlTEgJA2E2e9K7m
 Zc/dcw+/McxxrNe1RcuA3APHFGVQ5vds8xvFWo82nsVh3pK7UgKrwYoxLagThzVZ9Al/Hg
 I6wN20bTo0rsxtjOVP2IHS8/RqDTFlo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-1-_FJnZKOjStqy_fyQIQYQ-1; Thu, 19 Mar 2020 07:02:33 -0400
X-MC-Unique: 1-_FJnZKOjStqy_fyQIQYQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A93E18C8C02;
 Thu, 19 Mar 2020 11:02:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-49.ams2.redhat.com
 [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 239CB5C1D8;
 Thu, 19 Mar 2020 11:02:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4973E3BD; Thu, 19 Mar 2020 12:02:30 +0100 (CET)
Date: Thu, 19 Mar 2020 12:02:30 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Jiri Slaby <jslaby@suse.cz>
Subject: Re: [PATCH] drm/virtio: fix OOB in virtio_gpu_object_create
Message-ID: <20200319110230.rxezuk3ex5fbov3f@sirius.home.kraxel.org>
References: <20200319100421.16267-1-jslaby@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200319100421.16267-1-jslaby@suse.cz>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 daniel@ffwll.ch, virtualization@lists.linux-foundation.org
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

On Thu, Mar 19, 2020 at 11:04:21AM +0100, Jiri Slaby wrote:
> After commit f651c8b05542, virtio_gpu_create_object allocates too small
> space to fit everything in. It is because it allocates struct
> virtio_gpu_object, but should allocate a newly added struct
> virtio_gpu_object_shmem which has 2 more members.
> 
> So fix that by using correct type in virtio_gpu_create_object.
> 
> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> Fixes: f651c8b05542 ("drm/virtio: factor out the sg_table from virtio_gpu_object")
> Cc: Gurchetan Singh <gurchetansingh@chromium.org>
> Cc: Gerd Hoffmann <kraxel@redhat.com>

That was fast.  Yes, exactly this.  Pushed to drm-misc-next.

thanks,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
