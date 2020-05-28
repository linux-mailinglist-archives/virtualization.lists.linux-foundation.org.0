Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EBF1E5AD0
	for <lists.virtualization@lfdr.de>; Thu, 28 May 2020 10:31:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D53BF806F4;
	Thu, 28 May 2020 08:31:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Z7mpJPd-phw; Thu, 28 May 2020 08:31:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5C631881E1;
	Thu, 28 May 2020 08:31:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 224D3C088D;
	Thu, 28 May 2020 08:31:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C7314C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 May 2020 08:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A8FD0203DE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 May 2020 08:31:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xPLrf8QDbXpm
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 May 2020 08:31:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 8D20D203D6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 May 2020 08:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590654688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gYZwLjj7CzD0ymsoazFzJV5eo30qTW4FW8DTfD17Jfg=;
 b=Vyk+lWFUm6D6WOApcnDYM0ukHG3YBuPkqwJc5ht4bTw+UrNuudCtYU2wi2cGMgBOPpUJXA
 sDTGwGy9tlVEFJ07wXoWRZrOg6JsxNy5dfgXi9uAjFt7UXh8QI8++Elwa5CkXG6k5yoVIe
 JnDInMql/nh0TakE44Mytxl0NOeT68M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-X8CmvGu5MHitdtBIJs14og-1; Thu, 28 May 2020 04:31:21 -0400
X-MC-Unique: X8CmvGu5MHitdtBIJs14og-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E9FCBFC2;
 Thu, 28 May 2020 08:31:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09ADE62932;
 Thu, 28 May 2020 08:31:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 450E616E2C; Thu, 28 May 2020 10:31:15 +0200 (CEST)
Date: Thu, 28 May 2020 10:31:15 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v4 0/3] Support virtio cross-device resources
Message-ID: <20200528083115.a6p3y24x3vqzcj4k@sirius.home.kraxel.org>
References: <20200526105811.30784-1-stevensd@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200526105811.30784-1-stevensd@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: virtio-dev@lists.oasis-open.org, Thomas Zimmermann <tzimmermann@suse.de>,
 "Michael S . Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
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

On Tue, May 26, 2020 at 07:58:08PM +0900, David Stevens wrote:
> This patchset implements the current proposal for virtio cross-device
> resource sharing [1]. It will be used to import virtio resources into
> the virtio-video driver currently under discussion [2]. The patch
> under consideration to add support in the virtio-video driver is [3].
> It uses the APIs from v3 of this series, but the changes to update it
> are relatively minor.
> 
> This patchset adds a new flavor of dma-bufs that supports querying the
> underlying virtio object UUID, as well as adding support for exporting
> resources from virtgpu.
> 
> [1] https://markmail.org/thread/2ypjt5cfeu3m6lxu
> [2] https://markmail.org/thread/p5d3k566srtdtute
> [3] https://markmail.org/thread/j4xlqaaim266qpks
> 
> v3 -> v4 changes:
>  - Replace dma-buf hooks with virtio dma-buf from v1.
>  - Remove virtio_attach callback, as the work that had been done
>    in that callback is now done on dma-buf export. The documented
>    requirement that get_uuid only be called on attached virtio
>    dma-bufs is also removed.
>  - Rebase and add call to virtio_gpu_notify for ASSIGN_UUID.
> 
> David Stevens (3):
>   virtio: add dma-buf support for exported objects
>   virtio-gpu: add VIRTIO_GPU_F_RESOURCE_UUID feature
>   drm/virtio: Support virtgpu exported resources

Looks all sane to me.  mst, have you looked at the virtio core changes?
How we are going to merge this?  If you ack I can merge via
drm-misc-next.  Merging through virtio queue would be fine too.

thanks,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
