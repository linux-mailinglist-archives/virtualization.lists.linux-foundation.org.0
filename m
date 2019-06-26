Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 78006563B4
	for <lists.virtualization@lfdr.de>; Wed, 26 Jun 2019 09:52:11 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8F189DD6;
	Wed, 26 Jun 2019 07:52:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9ABD2DCE
	for <virtualization@lists.linux-foundation.org>;
	Wed, 26 Jun 2019 07:52:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5C10482D
	for <virtualization@lists.linux-foundation.org>;
	Wed, 26 Jun 2019 07:52:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 985483087BA9;
	Wed, 26 Jun 2019 07:51:58 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 296F660C6E;
	Wed, 26 Jun 2019 07:51:48 +0000 (UTC)
Date: Wed, 26 Jun 2019 09:51:46 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] drm/virtio: move drm_connector_update_edid_property() call
Message-ID: <20190626095146.2731a2dc.cohuck@redhat.com>
In-Reply-To: <20190405044602.2334-1-kraxel@redhat.com>
References: <20190405044602.2334-1-kraxel@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Wed, 26 Jun 2019 07:51:58 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	dri-devel@lists.freedesktop.org, "open list:VIRTIO GPU DRIVER"
	<virtualization@lists.linux-foundation.org>, jcmvbkbc@gmail.com,
	Daniel Vetter <daniel@ffwll.ch>
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

On Fri,  5 Apr 2019 06:46:02 +0200
Gerd Hoffmann <kraxel@redhat.com> wrote:

> drm_connector_update_edid_property can sleep, we must not
> call it while holding a spinlock.  Move the callsize.

s/callsize/callsite/

> 
> Reported-by: Max Filippov <jcmvbkbc@gmail.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_vq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index e62fe24b1a2e..5bb0f0a084e9 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -619,11 +619,11 @@ static void virtio_gpu_cmd_get_edid_cb(struct virtio_gpu_device *vgdev,
>  	output = vgdev->outputs + scanout;
>  
>  	new_edid = drm_do_get_edid(&output->conn, virtio_get_edid_block, resp);
> +	drm_connector_update_edid_property(&output->conn, new_edid);
>  
>  	spin_lock(&vgdev->display_info_lock);
>  	old_edid = output->edid;
>  	output->edid = new_edid;
> -	drm_connector_update_edid_property(&output->conn, output->edid);
>  	spin_unlock(&vgdev->display_info_lock);
>  
>  	kfree(old_edid);

This gets rid of the sleeping while atomic traces I've been seeing with
an s390x guest (both virtio-gpu-pci and virtio-gpu-ccw).

Tested-by: Cornelia Huck <cohuck@redhat.com>

I have also looked at the code a bit, but don't feel confident enough
to give an R-b.

Acked-by: Cornelia Huck <cohuck@redhat.com>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
