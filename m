Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8B2247E27
	for <lists.virtualization@lfdr.de>; Tue, 18 Aug 2020 08:00:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 90FFE20113;
	Tue, 18 Aug 2020 06:00:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OEwlBfrvXYS3; Tue, 18 Aug 2020 06:00:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 519EF2010E;
	Tue, 18 Aug 2020 06:00:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2009CC0051;
	Tue, 18 Aug 2020 06:00:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B7645C0051
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Aug 2020 06:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AD7592010E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Aug 2020 06:00:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AhY3lnCi+T3i
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Aug 2020 06:00:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 3BC2220113
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Aug 2020 06:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597730404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ETkqLyVFzRYqMgbcRFKBAG7Km4x+4gDnlzbCjLqix38=;
 b=PTnj8hApCY/SBCepGFQV/4I3+7K5oYdfEM0jhZiXQF2+QK8kZjHFGf5JPM5xFytyhVR+lx
 PRBkYtdRSS029fwWvnuJ87D8CxYQM0xNLCbCkHpet4JBedJe9Tqg0M2M4MZQXZcZwaGluE
 sAd/oVASHRPi2Cz7UbKD5yFiIi9nn4w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-8UBKwuVyNTeLOGkX_s5Ztg-1; Tue, 18 Aug 2020 01:59:58 -0400
X-MC-Unique: 8UBKwuVyNTeLOGkX_s5Ztg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5760580732F;
 Tue, 18 Aug 2020 05:59:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com
 [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C83E616597;
 Tue, 18 Aug 2020 05:59:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C0B321753B; Tue, 18 Aug 2020 07:59:49 +0200 (CEST)
Date: Tue, 18 Aug 2020 07:59:49 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v6 0/3] Support virtio cross-device resources
Message-ID: <20200818055949.6si4jzuubba5dx5u@sirius.home.kraxel.org>
References: <20200818013744.3327271-1-stevensd@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200818013744.3327271-1-stevensd@chromium.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

On Tue, Aug 18, 2020 at 10:37:41AM +0900, David Stevens wrote:
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
> v5 -> v6 changes:
>  - Fix >80 character comment

Hmm, checkpatch still complains, full log below.

IIRC "dim checkpatch" runs scripts/checkpatch.pl with --strict
so it is a bit more picky ...

The FILE_PATH_CHANGES isn't a problem given that the new file
is covered by existing wildcard.

take care,
  Gerd

---------------------------------------------------------------
+ dim checkpatch drm-misc-next..drm-qemu-next drm-misc
ee194dc222ae virtio: add dma-buf support for exported objects
-:29: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#29: 
new file mode 100644

-:65: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#65: FILE: include/linux/virtio_dma_buf.h:32:
+struct dma_buf *virtio_dma_buf_export(

-:112: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#112: FILE: drivers/virtio/virtio_dma_buf.c:19:
+struct dma_buf *virtio_dma_buf_export(

-:115: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#115: FILE: drivers/virtio/virtio_dma_buf.c:22:
+	const struct virtio_dma_buf_ops *virtio_ops = container_of(

-:119: CHECK:LOGICAL_CONTINUATIONS: Logical continuations should be on the previous line
#119: FILE: drivers/virtio/virtio_dma_buf.c:26:
+	if (!exp_info->ops
+		|| exp_info->ops->attach != &virtio_dma_buf_attach

-:120: CHECK:LOGICAL_CONTINUATIONS: Logical continuations should be on the previous line
#120: FILE: drivers/virtio/virtio_dma_buf.c:27:
+		|| exp_info->ops->attach != &virtio_dma_buf_attach
+		|| !virtio_ops->get_uuid) {

-:135: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#135: FILE: drivers/virtio/virtio_dma_buf.c:42:
+	const struct virtio_dma_buf_ops *ops = container_of(

-:167: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#167: FILE: drivers/virtio/virtio_dma_buf.c:74:
+	const struct virtio_dma_buf_ops *ops = container_of(

total: 0 errors, 1 warnings, 7 checks, 144 lines checked
76c9c2abbe6b virtio-gpu: add VIRTIO_GPU_F_RESOURCE_UUID feature
9c3f3edd1cc4 (HEAD -> drm-qemu-next, kraxel.org/drm-qemu-next) drm/virtio: Support virtgpu exported resources
-:53: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#53: FILE: drivers/gpu/drm/virtio/virtgpu_drv.h:222:
+	spinlock_t resource_export_lock;

-:250: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#250: FILE: drivers/gpu/drm/virtio/virtgpu_vq.c:1118:
+	uint32_t resp_type = le32_to_cpu(resp->hdr.type);

-:256: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#256: FILE: drivers/gpu/drm/virtio/virtgpu_vq.c:1124:
+	if (resp_type == VIRTIO_GPU_RESP_OK_RESOURCE_UUID &&
+			obj->uuid_state == UUID_INITIALIZING) {

-:286: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#286: FILE: drivers/gpu/drm/virtio/virtgpu_vq.c:1154:
+	cmd_p = virtio_gpu_alloc_cmd_resp(vgdev,
+		virtio_gpu_cmd_resource_uuid_cb, &vbuf, sizeof(*cmd_p),

total: 0 errors, 0 warnings, 4 checks, 250 lines checked
+ exit 1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
