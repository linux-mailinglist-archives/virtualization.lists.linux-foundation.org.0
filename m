Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C93747D6775
	for <lists.virtualization@lfdr.de>; Wed, 25 Oct 2023 11:49:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACFD1850BE;
	Wed, 25 Oct 2023 09:49:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACFD1850BE
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aFSwagYB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5EMrJhKPDLsp; Wed, 25 Oct 2023 09:49:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CE937850F8;
	Wed, 25 Oct 2023 09:49:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE937850F8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19F9DC008C;
	Wed, 25 Oct 2023 09:49:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE051C0032
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Oct 2023 09:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C99156FBB4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Oct 2023 09:49:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C99156FBB4
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=aFSwagYB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1gcd5uVhRPmI
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Oct 2023 09:49:36 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 482DF60FB1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Oct 2023 09:49:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 482DF60FB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698227374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=Ccl0cEpWSY7Q7abylmVR9V2MDOgCLoroXtJWqlW54Xo=;
 b=aFSwagYBCQKL7dHDOBMQ0bK+Lm1KPNBJaNd2k+5VRZYWOoH5x+2DtRN36KGSUuaESBazH6
 55ILWe2W837VeKP3R0KIh48yuGogNyvXuIKijjIOouySLsef6o4krGn1DQkziknXw3uRG/
 hXAm9I7dp3WiXP6yOkvSpwwjFZyJLxU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-el1tDJNAM6qXmUE_DPunUQ-1; Wed, 25 Oct 2023 05:49:24 -0400
X-MC-Unique: el1tDJNAM6qXmUE_DPunUQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7788ea971caso666407885a.2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Oct 2023 02:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698227364; x=1698832164;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ccl0cEpWSY7Q7abylmVR9V2MDOgCLoroXtJWqlW54Xo=;
 b=pRIEvDyEfMB93rJiIVqZS72nHaasI2kZyQvRqkpNuigOzaAP9DxW+uM6y9w6CJ9et/
 HVRKCQJqyDT3dE5V+hw+gVF0BJ9+gB6E+rCOhSvGeNPYKjuZNxn5NY7XJQDuAhoXngNl
 7F5hWmMZ/CobC20R/llAeGPwgSN7zo0BZhROwwZNpuQIDtl0t8TwpcfS6zPRu7eyfiCY
 ADqul6Y68jSm+6eSXuoA10YvRt2GIvyOrJ5unqAMEk2XwHjQHFxhVGbyP263YprwwVfw
 Hh5Fp1ldWnXpdAZ5BchisVsXPVaE3lZ/5H1Vb3bL0RjBD1qyieYk2GbjE8thN1OyptIK
 vFeA==
X-Gm-Message-State: AOJu0YwSKHxkF1lS7xqjyktNUlu5y0N+Yl6zkQu8eYrQ5D9e+6W1dycp
 Dj0NxEhQioBOIdRpsrtp2m830zqCfF61qQrgWAjQrOQ/rYYrPIfRARCaWMkwfiTyLv8WVzyuUrT
 ViaMafrz4MXFkyrQ9k/kMN0Wrfyp9xLNFADlJ/D2e3Q==
X-Received: by 2002:a05:620a:1917:b0:774:3742:31e4 with SMTP id
 bj23-20020a05620a191700b00774374231e4mr15631622qkb.52.1698227364042; 
 Wed, 25 Oct 2023 02:49:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTL33e6oFAjKeVirlLu6b3nY/ZpyOwCVIrxTejwiUZ+OEK+IinMwOWgwbuTl1/wFe8H4KdIg==
X-Received: by 2002:a05:620a:1917:b0:774:3742:31e4 with SMTP id
 bj23-20020a05620a191700b00774374231e4mr15631611qkb.52.1698227363690; 
 Wed, 25 Oct 2023 02:49:23 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
 by smtp.gmail.com with ESMTPSA id
 g21-20020a05620a109500b007659935ce64sm4058867qkk.71.2023.10.25.02.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 02:49:23 -0700 (PDT)
Date: Wed, 25 Oct 2023 11:49:19 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: anton.yakovlev@opensynergy.com, mst@redhat.com
Subject: [PATCH v4] ALSA: virtio: use ack callback
Message-ID: <ZTjkn1YAFz67yfqx@fedora>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: alsa-devel@alsa-project.org, mripard@redhat.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 stefanha@redhat.com, pbonzini@redhat.com, perex@perex.cz
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

This commit uses the ack() callback to determine when a buffer has been
updated, then exposes it to guest.

The current mechanism splits a dma buffer into descriptors that are
exposed to the device. This dma buffer is shared with the user
application. When the device consumes a buffer, the driver moves the
request from the used ring to available ring.

The driver exposes the buffer to the device without knowing if the
content has been updated from the user. The section 2.8.21.1 of the
virtio spec states that: "The device MAY access the descriptor chains
the driver created and the memory they refer to immediately". If the
device picks up buffers from the available ring just after it is
notified, it happens that the content may be old.

When the ack() callback is invoked, the driver exposes only the buffers
that have already been updated, i.e., enqueued in the available ring.
Thus, the device always picks up a buffer that is updated.

For capturing, the driver starts by exposing all the available buffers
to device. After device updates the content of a buffer, it enqueues it
in the used ring. It is only after the ack() for capturing is issued
that the driver re-enqueues the buffer in the available ring.

Co-developed-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
Changelog:
v3 -> v4:
 * Disable rewinds
 * Add SNDRV_PCM_INFO_SYNC_APPLPTR flag
 * Use pcm indirect API for pointer() and ack() callbacks
v2 -> v3:
 * Use ack() callback instead of copy()/fill_silence()
 * Change commit name
 * Rewrite commit message
 * Remove virtsnd_pcm_msg_send_locked()
 * Use single callback for both capture and playback
 * Fix kernel test robot warnings regarding documentation
 * v2 patch at:
   https://lore.kernel.org/lkml/87y1fzkq8c.wl-tiwai@suse.de/T/
v1 -> v2:
 * Use snd_pcm_set_managed_buffer_all()for buffer allocation/freeing.
 * Make virtsnd_pcm_msg_send() generic by specifying the offset and size
   for the modified part of the buffer; this way no assumptions need to
   be made.
 * Disable SNDRV_PCM_INFO_NO_REWINDS since now only sequential
   reading/writing of frames is supported.
 * Correct comment at virtsnd_pcm_msg_send().
 * v1 patch at:
   https://lore.kernel.org/lkml/20231016151000.GE119987@fedora/t/

 sound/virtio/virtio_pcm.c     |   6 +-
 sound/virtio/virtio_pcm.h     |   9 ++-
 sound/virtio/virtio_pcm_msg.c |  79 ++++++++++++---------
 sound/virtio/virtio_pcm_ops.c | 125 +++++++++++++++++++++++++++-------
 4 files changed, 158 insertions(+), 61 deletions(-)

diff --git a/sound/virtio/virtio_pcm.c b/sound/virtio/virtio_pcm.c
index c10d91fff2fb..967e4c45be9b 100644
--- a/sound/virtio/virtio_pcm.c
+++ b/sound/virtio/virtio_pcm.c
@@ -109,7 +109,9 @@ static int virtsnd_pcm_build_hw(struct virtio_pcm_substream *vss,
 		SNDRV_PCM_INFO_BATCH |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
 		SNDRV_PCM_INFO_INTERLEAVED |
-		SNDRV_PCM_INFO_PAUSE;
+		SNDRV_PCM_INFO_PAUSE |
+		SNDRV_PCM_INFO_NO_REWINDS |
+		SNDRV_PCM_INFO_SYNC_APPLPTR;
 
 	if (!info->channels_min || info->channels_min > info->channels_max) {
 		dev_err(&vdev->dev,
@@ -471,7 +473,7 @@ int virtsnd_pcm_build_devs(struct virtio_snd *snd)
 			for (kss = ks->substream; kss; kss = kss->next)
 				vs->substreams[kss->number]->substream = kss;
 
-			snd_pcm_set_ops(vpcm->pcm, i, &virtsnd_pcm_ops);
+			snd_pcm_set_ops(vpcm->pcm, i, &virtsnd_pcm_ops[i]);
 		}
 
 		snd_pcm_set_managed_buffer_all(vpcm->pcm,
diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
index 062eb8e8f2cf..5dd1b43b9493 100644
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -9,6 +9,7 @@
 #include <linux/atomic.h>
 #include <linux/virtio_config.h>
 #include <sound/pcm.h>
+#include <sound/pcm-indirect.h>
 
 struct virtio_pcm;
 struct virtio_pcm_msg;
@@ -21,6 +22,7 @@ struct virtio_pcm_msg;
  * @direction: Stream data flow direction (SNDRV_PCM_STREAM_XXX).
  * @features: Stream VirtIO feature bit map (1 << VIRTIO_SND_PCM_F_XXX).
  * @substream: Kernel ALSA substream.
+ * @pcm_indirect: Kernel indirect pcm structure.
  * @hw: Kernel ALSA substream hardware descriptor.
  * @elapsed_period: Kernel work to handle the elapsed period state.
  * @lock: Spinlock that protects fields shared by interrupt handlers and
@@ -46,6 +48,7 @@ struct virtio_pcm_substream {
 	u32 direction;
 	u32 features;
 	struct snd_pcm_substream *substream;
+	struct snd_pcm_indirect pcm_indirect;
 	struct snd_pcm_hardware hw;
 	struct work_struct elapsed_period;
 	spinlock_t lock;
@@ -57,7 +60,6 @@ struct virtio_pcm_substream {
 	bool suspended;
 	struct virtio_pcm_msg **msgs;
 	unsigned int nmsgs;
-	int msg_last_enqueued;
 	unsigned int msg_count;
 	wait_queue_head_t msg_empty;
 };
@@ -90,7 +92,7 @@ struct virtio_pcm {
 	struct virtio_pcm_stream streams[SNDRV_PCM_STREAM_LAST + 1];
 };
 
-extern const struct snd_pcm_ops virtsnd_pcm_ops;
+extern const struct snd_pcm_ops virtsnd_pcm_ops[];
 
 int virtsnd_pcm_validate(struct virtio_device *vdev);
 
@@ -117,7 +119,8 @@ int virtsnd_pcm_msg_alloc(struct virtio_pcm_substream *vss,
 
 void virtsnd_pcm_msg_free(struct virtio_pcm_substream *vss);
 
-int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss);
+int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss, unsigned long offset,
+			 unsigned long bytes);
 
 unsigned int virtsnd_pcm_msg_pending_num(struct virtio_pcm_substream *vss);
 
diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
index aca2dc1989ba..542446c4c7ba 100644
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -155,7 +155,6 @@ int virtsnd_pcm_msg_alloc(struct virtio_pcm_substream *vss,
 			    sizeof(msg->xfer));
 		sg_init_one(&msg->sgs[PCM_MSG_SG_STATUS], &msg->status,
 			    sizeof(msg->status));
-		msg->length = period_bytes;
 		virtsnd_pcm_sg_from(&msg->sgs[PCM_MSG_SG_DATA], sg_num, data,
 				    period_bytes);
 
@@ -186,61 +185,75 @@ void virtsnd_pcm_msg_free(struct virtio_pcm_substream *vss)
 /**
  * virtsnd_pcm_msg_send() - Send asynchronous I/O messages.
  * @vss: VirtIO PCM substream.
+ * @offset: starting position that has been updated
+ * @bytes: number of bytes that has been updated
  *
  * All messages are organized in an ordered circular list. Each time the
  * function is called, all currently non-enqueued messages are added to the
- * virtqueue. For this, the function keeps track of two values:
- *
- *   msg_last_enqueued = index of the last enqueued message,
- *   msg_count = # of pending messages in the virtqueue.
+ * virtqueue. For this, the function uses offset and bytes to calculate the
+ * messages that need to be added.
  *
  * Context: Any context. Expects the tx/rx queue and the VirtIO substream
  *          spinlocks to be held by caller.
  * Return: 0 on success, -errno on failure.
  */
-int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss)
+int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss, unsigned long offset,
+			 unsigned long bytes)
 {
-	struct snd_pcm_runtime *runtime = vss->substream->runtime;
 	struct virtio_snd *snd = vss->snd;
 	struct virtio_device *vdev = snd->vdev;
 	struct virtqueue *vqueue = virtsnd_pcm_queue(vss)->vqueue;
-	int i;
-	int n;
+	unsigned long period_bytes = snd_pcm_lib_period_bytes(vss->substream);
+	unsigned long start, end, i;
+	unsigned int msg_count = vss->msg_count;
 	bool notify = false;
+	int rc;
 
-	i = (vss->msg_last_enqueued + 1) % runtime->periods;
-	n = runtime->periods - vss->msg_count;
+	start = offset / period_bytes;
+	end = (offset + bytes - 1) / period_bytes;
 
-	for (; n; --n, i = (i + 1) % runtime->periods) {
+	for (i = start; i <= end; i++) {
 		struct virtio_pcm_msg *msg = vss->msgs[i];
 		struct scatterlist *psgs[] = {
 			&msg->sgs[PCM_MSG_SG_XFER],
 			&msg->sgs[PCM_MSG_SG_DATA],
 			&msg->sgs[PCM_MSG_SG_STATUS]
 		};
-		int rc;
-
-		msg->xfer.stream_id = cpu_to_le32(vss->sid);
-		memset(&msg->status, 0, sizeof(msg->status));
-
-		if (vss->direction == SNDRV_PCM_STREAM_PLAYBACK)
-			rc = virtqueue_add_sgs(vqueue, psgs, 2, 1, msg,
-					       GFP_ATOMIC);
-		else
-			rc = virtqueue_add_sgs(vqueue, psgs, 1, 2, msg,
-					       GFP_ATOMIC);
-
-		if (rc) {
-			dev_err(&vdev->dev,
-				"SID %u: failed to send I/O message\n",
-				vss->sid);
-			return rc;
+		unsigned long n;
+
+		n = period_bytes - (offset % period_bytes);
+		if (n > bytes)
+			n = bytes;
+
+		msg->length += n;
+		if (msg->length == period_bytes) {
+			msg->xfer.stream_id = cpu_to_le32(vss->sid);
+			memset(&msg->status, 0, sizeof(msg->status));
+
+			if (vss->direction == SNDRV_PCM_STREAM_PLAYBACK)
+				rc = virtqueue_add_sgs(vqueue, psgs, 2, 1, msg,
+						       GFP_ATOMIC);
+			else
+				rc = virtqueue_add_sgs(vqueue, psgs, 1, 2, msg,
+						       GFP_ATOMIC);
+
+			if (rc) {
+				dev_err(&vdev->dev,
+					"SID %u: failed to send I/O message\n",
+					vss->sid);
+				return rc;
+			}
+
+			vss->msg_count++;
 		}
 
-		vss->msg_last_enqueued = i;
-		vss->msg_count++;
+		offset = 0;
+		bytes -= n;
 	}
 
+	if (msg_count == vss->msg_count)
+		return 0;
+
 	if (!(vss->features & (1U << VIRTIO_SND_PCM_F_MSG_POLLING)))
 		notify = virtqueue_kick_prepare(vqueue);
 
@@ -309,6 +322,8 @@ static void virtsnd_pcm_msg_complete(struct virtio_pcm_msg *msg,
 	if (vss->hw_ptr >= vss->buffer_bytes)
 		vss->hw_ptr -= vss->buffer_bytes;
 
+	msg->length = 0;
+
 	vss->xfer_xrun = false;
 	vss->msg_count--;
 
@@ -320,8 +335,6 @@ static void virtsnd_pcm_msg_complete(struct virtio_pcm_msg *msg,
 					le32_to_cpu(msg->status.latency_bytes));
 
 		schedule_work(&vss->elapsed_period);
-
-		virtsnd_pcm_msg_send(vss);
 	} else if (!vss->msg_count) {
 		wake_up_all(&vss->msg_empty);
 	}
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
index f8bfb87624be..ad12aae52fc3 100644
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -282,7 +282,6 @@ static int virtsnd_pcm_prepare(struct snd_pcm_substream *substream)
 
 		vss->buffer_bytes = snd_pcm_lib_buffer_bytes(substream);
 		vss->hw_ptr = 0;
-		vss->msg_last_enqueued = -1;
 	} else {
 		struct snd_pcm_runtime *runtime = substream->runtime;
 		unsigned int buffer_bytes = snd_pcm_lib_buffer_bytes(substream);
@@ -300,6 +299,11 @@ static int virtsnd_pcm_prepare(struct snd_pcm_substream *substream)
 	vss->suspended = false;
 	vss->msg_count = 0;
 
+	memset(&vss->pcm_indirect, 0, sizeof(vss->pcm_indirect));
+	vss->pcm_indirect.sw_buffer_size =
+		vss->pcm_indirect.hw_buffer_size =
+		snd_pcm_lib_buffer_bytes(substream);
+
 	msg = virtsnd_pcm_ctl_msg_alloc(vss, VIRTIO_SND_R_PCM_PREPARE,
 					GFP_KERNEL);
 	if (!msg)
@@ -324,7 +328,7 @@ static int virtsnd_pcm_trigger(struct snd_pcm_substream *substream, int command)
 	struct virtio_snd_queue *queue;
 	struct virtio_snd_msg *msg;
 	unsigned long flags;
-	int rc;
+	int rc = 0;
 
 	switch (command) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -333,7 +337,8 @@ static int virtsnd_pcm_trigger(struct snd_pcm_substream *substream, int command)
 
 		spin_lock_irqsave(&queue->lock, flags);
 		spin_lock(&vss->lock);
-		rc = virtsnd_pcm_msg_send(vss);
+		if (vss->direction == SNDRV_PCM_STREAM_CAPTURE)
+			rc = virtsnd_pcm_msg_send(vss, 0, vss->buffer_bytes);
 		if (!rc)
 			vss->xfer_enabled = true;
 		spin_unlock(&vss->lock);
@@ -428,37 +433,111 @@ static int virtsnd_pcm_sync_stop(struct snd_pcm_substream *substream)
 }
 
 /**
- * virtsnd_pcm_pointer() - Get the current hardware position for the PCM
- *                         substream.
+ * virtsnd_pcm_pb_pointer() - Get the current hardware position for the PCM
+ *                         substream for playback.
  * @substream: Kernel ALSA substream.
  *
- * Context: Any context. Takes and releases the VirtIO substream spinlock.
+ * Context: Any context.
  * Return: Hardware position in frames inside [0 ... buffer_size) range.
  */
 static snd_pcm_uframes_t
-virtsnd_pcm_pointer(struct snd_pcm_substream *substream)
+virtsnd_pcm_pb_pointer(struct snd_pcm_substream *substream)
+{
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+
+	return snd_pcm_indirect_playback_pointer(substream,
+		&vss->pcm_indirect,
+		vss->hw_ptr);
+}
+
+/**
+ * virtsnd_pcm_cp_pointer() - Get the current hardware position for the PCM
+ *                         substream for capture.
+ * @substream: Kernel ALSA substream.
+ *
+ * Context: Any context.
+ * Return: Hardware position in frames inside [0 ... buffer_size) range.
+ */
+static snd_pcm_uframes_t
+virtsnd_pcm_cp_pointer(struct snd_pcm_substream *substream)
+{
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+
+	return snd_pcm_indirect_capture_pointer(substream,
+		&vss->pcm_indirect,
+		vss->hw_ptr);
+}
+
+static void virtsnd_pcm_trans_copy(struct snd_pcm_substream *substream,
+				   struct snd_pcm_indirect *rec, size_t bytes)
 {
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
-	snd_pcm_uframes_t hw_ptr = SNDRV_PCM_POS_XRUN;
+
+	virtsnd_pcm_msg_send(vss, rec->sw_data, bytes);
+}
+
+static int virtsnd_pcm_pb_ack(struct snd_pcm_substream *substream)
+{
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
+	unsigned long flags;
+	int rc;
+
+	spin_lock_irqsave(&queue->lock, flags);
+	spin_lock(&vss->lock);
+
+	rc = snd_pcm_indirect_playback_transfer(substream, &vss->pcm_indirect,
+						virtsnd_pcm_trans_copy);
+
+	spin_unlock(&vss->lock);
+	spin_unlock_irqrestore(&queue->lock, flags);
+
+	return rc;
+}
+
+static int virtsnd_pcm_cp_ack(struct snd_pcm_substream *substream)
+{
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
 	unsigned long flags;
+	int rc;
+
+	spin_lock_irqsave(&queue->lock, flags);
+	spin_lock(&vss->lock);
+
+	rc = snd_pcm_indirect_capture_transfer(substream, &vss->pcm_indirect,
+					       virtsnd_pcm_trans_copy);
 
-	spin_lock_irqsave(&vss->lock, flags);
-	if (!vss->xfer_xrun)
-		hw_ptr = bytes_to_frames(substream->runtime, vss->hw_ptr);
-	spin_unlock_irqrestore(&vss->lock, flags);
+	spin_unlock(&vss->lock);
+	spin_unlock_irqrestore(&queue->lock, flags);
 
-	return hw_ptr;
+	return rc;
 }
 
 /* PCM substream operators map. */
-const struct snd_pcm_ops virtsnd_pcm_ops = {
-	.open = virtsnd_pcm_open,
-	.close = virtsnd_pcm_close,
-	.ioctl = snd_pcm_lib_ioctl,
-	.hw_params = virtsnd_pcm_hw_params,
-	.hw_free = virtsnd_pcm_hw_free,
-	.prepare = virtsnd_pcm_prepare,
-	.trigger = virtsnd_pcm_trigger,
-	.sync_stop = virtsnd_pcm_sync_stop,
-	.pointer = virtsnd_pcm_pointer,
+const struct snd_pcm_ops virtsnd_pcm_ops[] = {
+	{
+		.open = virtsnd_pcm_open,
+		.close = virtsnd_pcm_close,
+		.ioctl = snd_pcm_lib_ioctl,
+		.hw_params = virtsnd_pcm_hw_params,
+		.hw_free = virtsnd_pcm_hw_free,
+		.prepare = virtsnd_pcm_prepare,
+		.trigger = virtsnd_pcm_trigger,
+		.sync_stop = virtsnd_pcm_sync_stop,
+		.pointer = virtsnd_pcm_pb_pointer,
+		.ack = virtsnd_pcm_pb_ack,
+	},
+	{
+		.open = virtsnd_pcm_open,
+		.close = virtsnd_pcm_close,
+		.ioctl = snd_pcm_lib_ioctl,
+		.hw_params = virtsnd_pcm_hw_params,
+		.hw_free = virtsnd_pcm_hw_free,
+		.prepare = virtsnd_pcm_prepare,
+		.trigger = virtsnd_pcm_trigger,
+		.sync_stop = virtsnd_pcm_sync_stop,
+		.pointer = virtsnd_pcm_cp_pointer,
+		.ack = virtsnd_pcm_cp_ack,
+	},
 };

base-commit: 8a749fd1a8720d4619c91c8b6e7528c0a355c0aa
-- 
2.41.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
