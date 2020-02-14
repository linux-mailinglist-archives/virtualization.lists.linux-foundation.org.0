Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E5715D42A
	for <lists.virtualization@lfdr.de>; Fri, 14 Feb 2020 09:57:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EF5F786308;
	Fri, 14 Feb 2020 08:57:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jmjbvermHKut; Fri, 14 Feb 2020 08:57:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8306586027;
	Fri, 14 Feb 2020 08:57:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 62C35C0177;
	Fri, 14 Feb 2020 08:57:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A390DC0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 08:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 91F68861E6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 08:57:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1r92-LQUpFuY
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 08:57:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E57FC8608F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 08:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581670652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hcSjZSHLEnp5ZLdnGZuQU+ROR/fBtg18iFgXLEAHrB0=;
 b=HmVL0XCXyJ5GdCtG0ImT2C/8a3c1OeHGv5N1b17rUDX+vuf+tyOe76jxV/gylovMkFlRGE
 HCypwjFXnOA24bnS8ZCFHFYV826HDAyfkxko1rwl7Tld6Khv6kSiKMIgCzHNyFkl3rPShf
 DuLXk7vzbk9IgzXAG9pzlW42817kiqk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-o3cQdsa8OY63VP8hprtgPg-1; Fri, 14 Feb 2020 03:57:31 -0500
X-MC-Unique: o3cQdsa8OY63VP8hprtgPg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8561801E67;
 Fri, 14 Feb 2020 08:57:29 +0000 (UTC)
Received: from gondolin (dhcp-192-195.str.redhat.com [10.33.192.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0DD215DA88;
 Fri, 14 Feb 2020 08:57:25 +0000 (UTC)
Date: Fri, 14 Feb 2020 09:57:23 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] drm/virtio: fix error check
Message-ID: <20200214095723.0c489524.cohuck@redhat.com>
In-Reply-To: <20200214080100.1273-1-kraxel@redhat.com>
References: <20200214080100.1273-1-kraxel@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: David Airlie <airlied@linux.ie>, smitterl@redhat.com,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 gurchetansingh@chromium.org, Daniel Vetter <daniel@ffwll.ch>, "open
 list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 olvaffe@gmail.com
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

On Fri, 14 Feb 2020 09:01:00 +0100
Gerd Hoffmann <kraxel@redhat.com> wrote:

> The >= compare op must happen in cpu byte order, doing it in
> little endian fails on big endian machines like s390.
> 
> Reported-by: Sebastian Mitterle <smitterl@redhat.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_vq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index cfe9c54f87a3..67caecde623e 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -222,7 +222,7 @@ void virtio_gpu_dequeue_ctrl_func(struct work_struct *work)
>  		trace_virtio_gpu_cmd_response(vgdev->ctrlq.vq, resp);
>  
>  		if (resp->type != cpu_to_le32(VIRTIO_GPU_RESP_OK_NODATA)) {
> -			if (resp->type >= cpu_to_le32(VIRTIO_GPU_RESP_ERR_UNSPEC)) {
> +			if (le32_to_cpu(resp->type) >= VIRTIO_GPU_RESP_ERR_UNSPEC) {
>  				struct virtio_gpu_ctrl_hdr *cmd;
>  				cmd = virtio_gpu_vbuf_ctrl_hdr(entry);
>  				DRM_ERROR_RATELIMITED("response 0x%x (command 0x%x)\n",

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

Endianness continues to be fun.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
