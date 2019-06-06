Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A7A36D7A
	for <lists.virtualization@lfdr.de>; Thu,  6 Jun 2019 09:41:30 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0C855C11;
	Thu,  6 Jun 2019 07:41:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 99D40B65
	for <virtualization@lists.linux-foundation.org>;
	Thu,  6 Jun 2019 07:41:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4634B34F
	for <virtualization@lists.linux-foundation.org>;
	Thu,  6 Jun 2019 07:41:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 73A11C04FFF1;
	Thu,  6 Jun 2019 07:41:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-131.ams2.redhat.com
	[10.36.117.131])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 233192E040;
	Thu,  6 Jun 2019 07:41:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 637F511AAF; Thu,  6 Jun 2019 09:41:22 +0200 (CEST)
Date: Thu, 6 Jun 2019 09:41:22 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: davidriley@chromium.org
Subject: Re: [PATCH 4/4] drm/virtio: Add memory barriers for capset cache.
Message-ID: <20190606074122.csocqu6g3in7dgbj@sirius.home.kraxel.org>
References: <20190605234423.11348-1-davidriley@chromium.org>
	<20190605234423.11348-4-davidriley@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190605234423.11348-4-davidriley@chromium.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 06 Jun 2019 07:41:23 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
	Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Wed, Jun 05, 2019 at 04:44:23PM -0700, davidriley@chromium.org wrote:
> From: David Riley <davidriley@chromium.org>
> 
> After data is copied to the cache entry, atomic_set is used indicate
> that the data is the entry is valid without appropriate memory barriers.
> Similarly the read side was missing the same memory barries.
> 
> Signed-off-by: David Riley <davidriley@chromium.org>
> ---
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 3 +++
>  drivers/gpu/drm/virtio/virtgpu_vq.c    | 2 ++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index 88c1ed57a3c5..502f5f7c2298 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -542,6 +542,9 @@ static int virtio_gpu_get_caps_ioctl(struct drm_device *dev,
>  	if (!ret)
>  		return -EBUSY;
>  
> +	/* is_valid check must proceed before copy of the cache entry. */
> +	virt_rmb();

I don't think you need virt_rmb() here.  This isn't guest <=> host
communication, so a normal barrier should do.

The other three fixes are queued up for drm-misc-next.

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
