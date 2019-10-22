Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 251BDDFF00
	for <lists.virtualization@lfdr.de>; Tue, 22 Oct 2019 10:06:13 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id ADF161370;
	Tue, 22 Oct 2019 08:05:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 861A1135E
	for <virtualization@lists.linux-foundation.org>;
	Tue, 22 Oct 2019 08:05:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 176FC87E
	for <virtualization@lists.linux-foundation.org>;
	Tue, 22 Oct 2019 08:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571731555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=GtZmqzFgxn1pwN65/xIkar281NrAbaBtoHehY0Fvb0U=;
	b=hlM8DH4ed8/ZSpdtugPPcRsq+kjXUS37ilg17f9eNDilkfM5kyYzP1vJ07gET1tvRABVqg
	qrA/zZ3+QNhAMPDTSqYypN4nmBxnUawUq5OnMy4hUiC2nncMgD4aIs7E292yHEl/Lqlo2J
	r+43S8rptKA1T3FckuENd7GTlfz3x0Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-78-quF3-_HKNCqdkw3peQ_QqA-1; Tue, 22 Oct 2019 04:05:51 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D687800D56;
	Tue, 22 Oct 2019 08:05:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com
	[10.36.116.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 711B65C22C;
	Tue, 22 Oct 2019 08:05:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id BFBCF9D76; Tue, 22 Oct 2019 10:05:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/virtio: fix byteorder handling in
	virtio_gpu_cmd_transfer_{from, to}_host_3d functions
Date: Tue, 22 Oct 2019 10:05:44 +0200
Message-Id: <20191022080546.19769-4-kraxel@redhat.com>
In-Reply-To: <20191022080546.19769-1-kraxel@redhat.com>
References: <20191022080546.19769-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: quF3-_HKNCqdkw3peQ_QqA-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	"open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	Gurchetan Singh <gurchetansingh@chromium.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Be consistent with the rest of the code base.
No functional change.

In theory this change is incompatible on bigendian machines,
but in practice 3d acceleration is supported only on little
endian machines, so the affected code paths never run on
bigendian machines.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_vq.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 74ad3bc3ebe8..0bf60914ece2 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -987,7 +987,12 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_TRANSFER_TO_HOST_3D);
 	cmd_p->hdr.ctx_id = cpu_to_le32(ctx_id);
 	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
-	cmd_p->box = *box;
+	cmd_p->box.x = cpu_to_le32(box->x);
+	cmd_p->box.y = cpu_to_le32(box->y);
+	cmd_p->box.z = cpu_to_le32(box->z);
+	cmd_p->box.w = cpu_to_le32(box->w);
+	cmd_p->box.h = cpu_to_le32(box->h);
+	cmd_p->box.d = cpu_to_le32(box->d);
 	cmd_p->offset = cpu_to_le64(offset);
 	cmd_p->level = cpu_to_le32(level);
 
@@ -1013,7 +1018,12 @@ void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_TRANSFER_FROM_HOST_3D);
 	cmd_p->hdr.ctx_id = cpu_to_le32(ctx_id);
 	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
-	cmd_p->box = *box;
+	cmd_p->box.x = cpu_to_le32(box->x);
+	cmd_p->box.y = cpu_to_le32(box->y);
+	cmd_p->box.z = cpu_to_le32(box->z);
+	cmd_p->box.w = cpu_to_le32(box->w);
+	cmd_p->box.h = cpu_to_le32(box->h);
+	cmd_p->box.d = cpu_to_le32(box->d);
 	cmd_p->offset = cpu_to_le64(offset);
 	cmd_p->level = cpu_to_le32(level);
 
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
