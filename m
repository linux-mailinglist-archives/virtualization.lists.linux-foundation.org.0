Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B49314F26
	for <lists.virtualization@lfdr.de>; Tue,  9 Feb 2021 13:40:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4C02C86678;
	Tue,  9 Feb 2021 12:40:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qqKsOAMYt+cU; Tue,  9 Feb 2021 12:40:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 770A487112;
	Tue,  9 Feb 2021 12:40:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5BCE4C013A;
	Tue,  9 Feb 2021 12:40:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54B9BC013A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Feb 2021 12:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 43497871C4
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Feb 2021 12:40:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UMQlg-MN1T9G
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Feb 2021 12:40:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 22B5D87152
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Feb 2021 12:40:48 +0000 (UTC)
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id BB82FA160A;
 Tue,  9 Feb 2021 13:40:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=4YEjn2c9Uoo2
 uQ5zVqQaYFCDe5A3c2FRiysy5u0ypDo=; b=1pLhKYC6yKZjWgqJAZpBRxTUGwXf
 Eq6LZxubCrIJrYZ8iQghZatD6hpzMiJuDz3HuVbtfKD9mn5tVC6AhYCgxi2TvH80
 FJdRRecOlYcPvYHRNcg3ZoHGVZLsZvzShXjfL39ZzqceY2M++D8er6doWs9D1VDC
 JDVlkl7ztYZPzyiruW7FQvASOS7BMLgmFt556Pyr0Kdd2qNDqdCklOkoyfswoPH6
 NgkFyw7SFNBHJ3MgV446zVxcWJnotywg3Msl+xBrwGN7bKsA8utZVCK+cU31ltMz
 CMEgGrWAhNRv9A+Nj9mVYxlPr8fR3t2bD0v6W8GkJU0diBSpJp6+58MqqA==
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
To: <virtualization@lists.linux-foundation.org>,
 <alsa-devel@alsa-project.org>, <virtio-dev@lists.oasis-open.org>
Subject: [PATCH v3 5/9] ALSA: virtio: handling control and I/O messages for
 the PCM device
Date: Tue, 9 Feb 2021 13:40:06 +0100
Message-ID: <20210209124011.1224628-6-anton.yakovlev@opensynergy.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209124011.1224628-1-anton.yakovlev@opensynergy.com>
References: <20210209124011.1224628-1-anton.yakovlev@opensynergy.com>
MIME-Version: 1.0
X-ClientProxiedBy: SR-MAIL-02.open-synergy.com (10.26.10.22) To
 SR-MAIL-01.open-synergy.com (10.26.10.21)
Cc: linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, "Michael S. Tsirkin" <mst@redhat.com>
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

The driver implements a message-based transport for I/O substream
operations. Before the start of the substream, the hardware buffer is
sliced into I/O messages, the number of which is equal to the current
number of periods. The size of each message is equal to the current
size of one period.

I/O messages are organized in an ordered queue. The completion of the
I/O message indicates an elapsed period (the only exception is the end
of the stream for the capture substream). Upon completion, the message
is automatically re-added to the end of the queue.

Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
---
 sound/virtio/Makefile         |   3 +-
 sound/virtio/virtio_card.c    |  18 +-
 sound/virtio/virtio_card.h    |   9 +
 sound/virtio/virtio_pcm.c     |  32 +++
 sound/virtio/virtio_pcm.h     |  42 ++++
 sound/virtio/virtio_pcm_msg.c | 393 ++++++++++++++++++++++++++++++++++
 6 files changed, 494 insertions(+), 3 deletions(-)
 create mode 100644 sound/virtio/virtio_pcm_msg.c

diff --git a/sound/virtio/Makefile b/sound/virtio/Makefile
index 69162a545a41..626af3cc3ed7 100644
--- a/sound/virtio/Makefile
+++ b/sound/virtio/Makefile
@@ -5,5 +5,6 @@ obj-$(CONFIG_SND_VIRTIO) += virtio_snd.o
 virtio_snd-objs := \
 	virtio_card.o \
 	virtio_ctl_msg.o \
-	virtio_pcm.o
+	virtio_pcm.o \
+	virtio_pcm_msg.o
 
diff --git a/sound/virtio/virtio_card.c b/sound/virtio/virtio_card.c
index 235afc25fce7..a845978111d6 100644
--- a/sound/virtio/virtio_card.c
+++ b/sound/virtio/virtio_card.c
@@ -65,8 +65,16 @@ static void virtsnd_event_notify_cb(struct virtqueue *vqueue)
 	spin_lock_irqsave(&queue->lock, flags);
 	do {
 		virtqueue_disable_cb(vqueue);
-		while ((event = virtqueue_get_buf(vqueue, &length)))
+		while ((event = virtqueue_get_buf(vqueue, &length))) {
+			switch (le32_to_cpu(event->hdr.code)) {
+			case VIRTIO_SND_EVT_PCM_PERIOD_ELAPSED:
+			case VIRTIO_SND_EVT_PCM_XRUN:
+				virtsnd_pcm_event(snd, event);
+				break;
+			}
+
 			virtsnd_event_send(vqueue, event, true, GFP_ATOMIC);
+		}
 		if (unlikely(virtqueue_is_broken(vqueue)))
 			break;
 	} while (!virtqueue_enable_cb(vqueue));
@@ -87,7 +95,9 @@ static int virtsnd_find_vqs(struct virtio_snd *snd)
 	struct virtio_device *vdev = snd->vdev;
 	vq_callback_t *callbacks[VIRTIO_SND_VQ_MAX] = {
 		[VIRTIO_SND_VQ_CONTROL] = virtsnd_ctl_notify_cb,
-		[VIRTIO_SND_VQ_EVENT] = virtsnd_event_notify_cb
+		[VIRTIO_SND_VQ_EVENT] = virtsnd_event_notify_cb,
+		[VIRTIO_SND_VQ_TX] = virtsnd_pcm_tx_notify_cb,
+		[VIRTIO_SND_VQ_RX] = virtsnd_pcm_rx_notify_cb
 	};
 	const char *names[VIRTIO_SND_VQ_MAX] = {
 		[VIRTIO_SND_VQ_CONTROL] = "virtsnd-ctl",
@@ -299,6 +309,7 @@ static int virtsnd_probe(struct virtio_device *vdev)
 static void virtsnd_remove(struct virtio_device *vdev)
 {
 	struct virtio_snd *snd = vdev->priv;
+	unsigned int i;
 
 	/* Stop all the virtqueues. */
 	vdev->config->reset(vdev);
@@ -310,6 +321,9 @@ static void virtsnd_remove(struct virtio_device *vdev)
 
 	vdev->config->del_vqs(vdev);
 
+	for (i = 0; snd->substreams && i < snd->nsubstreams; ++i)
+		virtsnd_pcm_msg_free(&snd->substreams[i]);
+
 	kfree(snd->event_msgs);
 }
 
diff --git a/sound/virtio/virtio_card.h b/sound/virtio/virtio_card.h
index 687d3ed6d1c3..aca87059564e 100644
--- a/sound/virtio/virtio_card.h
+++ b/sound/virtio/virtio_card.h
@@ -81,4 +81,13 @@ virtsnd_rx_queue(struct virtio_snd *snd)
 	return &snd->queues[VIRTIO_SND_VQ_RX];
 }
 
+static inline struct virtio_snd_queue *
+virtsnd_pcm_queue(struct virtio_pcm_substream *vss)
+{
+	if (vss->direction == SNDRV_PCM_STREAM_PLAYBACK)
+		return virtsnd_tx_queue(vss->snd);
+	else
+		return virtsnd_rx_queue(vss->snd);
+}
+
 #endif /* VIRTIO_SND_CARD_H */
diff --git a/sound/virtio/virtio_pcm.c b/sound/virtio/virtio_pcm.c
index 92f2f4cb338f..a74fbfb9f35c 100644
--- a/sound/virtio/virtio_pcm.c
+++ b/sound/virtio/virtio_pcm.c
@@ -338,6 +338,8 @@ int virtsnd_pcm_parse_cfg(struct virtio_snd *snd)
 
 		vss->snd = snd;
 		vss->sid = i;
+		init_waitqueue_head(&vss->msg_empty);
+		spin_lock_init(&vss->lock);
 
 		rc = virtsnd_pcm_build_hw(vss, &info[i]);
 		if (rc)
@@ -462,3 +464,33 @@ int virtsnd_pcm_build_devs(struct virtio_snd *snd)
 
 	return 0;
 }
+
+/**
+ * virtsnd_pcm_event() - Handle the PCM device event notification.
+ * @snd: VirtIO sound device.
+ * @event: VirtIO sound event.
+ *
+ * Context: Interrupt context.
+ */
+void virtsnd_pcm_event(struct virtio_snd *snd, struct virtio_snd_event *event)
+{
+	struct virtio_pcm_substream *vss;
+	unsigned int sid = le32_to_cpu(event->data);
+
+	if (sid >= snd->nsubstreams)
+		return;
+
+	vss = &snd->substreams[sid];
+
+	switch (le32_to_cpu(event->hdr.code)) {
+	case VIRTIO_SND_EVT_PCM_PERIOD_ELAPSED:
+		/* TODO: deal with shmem elapsed period */
+		break;
+	case VIRTIO_SND_EVT_PCM_XRUN:
+		spin_lock(&vss->lock);
+		if (vss->xfer_enabled)
+			vss->xfer_xrun = true;
+		spin_unlock(&vss->lock);
+		break;
+	}
+}
diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
index 42d592da41e5..d6be62b52421 100644
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -22,6 +22,19 @@ struct virtio_pcm_msg;
  * @features: Stream VirtIO feature bit map (1 << VIRTIO_SND_PCM_F_XXX).
  * @substream: Kernel ALSA substream.
  * @hw: Kernel ALSA substream hardware descriptor.
+ * @frame_bytes: Current frame size in bytes.
+ * @period_size: Current period size in frames.
+ * @buffer_size: Current buffer size in frames.
+ * @lock: Spinlock that protects fields shared by interrupt handlers and
+ *        substream operators.
+ * @hw_ptr: Substream hardware pointer value in frames [0 ... buffer_size).
+ * @xfer_enabled: Data transfer state (0 - off, 1 - on).
+ * @xfer_xrun: Data underflow/overflow state (0 - no xrun, 1 - xrun).
+ * @msgs: Allocated I/O messages.
+ * @nmsgs: Number of allocated I/O messages.
+ * @msg_last_enqueued: Index of the last I/O message added to the virtqueue.
+ * @msg_count: Number of pending I/O messages in the virtqueue.
+ * @msg_empty: Notify when msg_count is zero.
  */
 struct virtio_pcm_substream {
 	struct virtio_snd *snd;
@@ -31,6 +44,18 @@ struct virtio_pcm_substream {
 	u32 features;
 	struct snd_pcm_substream *substream;
 	struct snd_pcm_hardware hw;
+	unsigned int frame_bytes;
+	snd_pcm_uframes_t period_size;
+	snd_pcm_uframes_t buffer_size;
+	spinlock_t lock;
+	snd_pcm_uframes_t hw_ptr;
+	bool xfer_enabled;
+	bool xfer_xrun;
+	struct virtio_pcm_msg **msgs;
+	unsigned int nmsgs;
+	int msg_last_enqueued;
+	unsigned int msg_count;
+	wait_queue_head_t msg_empty;
 };
 
 /**
@@ -63,9 +88,26 @@ int virtsnd_pcm_parse_cfg(struct virtio_snd *snd);
 
 int virtsnd_pcm_build_devs(struct virtio_snd *snd);
 
+void virtsnd_pcm_event(struct virtio_snd *snd, struct virtio_snd_event *event);
+
+void virtsnd_pcm_tx_notify_cb(struct virtqueue *vqueue);
+
+void virtsnd_pcm_rx_notify_cb(struct virtqueue *vqueue);
+
 struct virtio_pcm *virtsnd_pcm_find(struct virtio_snd *snd, unsigned int nid);
 
 struct virtio_pcm *virtsnd_pcm_find_or_create(struct virtio_snd *snd,
 					      unsigned int nid);
 
+struct virtio_snd_msg *
+virtsnd_pcm_ctl_msg_alloc(struct virtio_pcm_substream *vss,
+			  unsigned int command, gfp_t gfp);
+
+int virtsnd_pcm_msg_alloc(struct virtio_pcm_substream *vss,
+			  unsigned int periods, unsigned int period_bytes);
+
+void virtsnd_pcm_msg_free(struct virtio_pcm_substream *vss);
+
+int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss);
+
 #endif /* VIRTIO_SND_PCM_H */
diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
new file mode 100644
index 000000000000..38748e93b5b4
--- /dev/null
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -0,0 +1,393 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * virtio-snd: Virtio sound device
+ * Copyright (C) 2021 OpenSynergy GmbH
+ */
+#include <sound/pcm_params.h>
+
+#include "virtio_card.h"
+
+/**
+ * struct virtio_pcm_msg - VirtIO I/O message.
+ * @substream: VirtIO PCM substream.
+ * @xfer: Request header payload.
+ * @status: Response header payload.
+ * @sgs: Payload scatter-gather table.
+ */
+struct virtio_pcm_msg {
+	struct virtio_pcm_substream *substream;
+	struct virtio_snd_pcm_xfer xfer;
+	struct virtio_snd_pcm_status status;
+	struct scatterlist sgs[0];
+};
+
+/**
+ * enum pcm_msg_sg_index - Index values for the virtio_pcm_msg->sgs field in
+ *                         an I/O message.
+ * @PCM_MSG_SG_XFER: Element containing a virtio_snd_pcm_xfer structure.
+ * @PCM_MSG_SG_STATUS: Element containing a virtio_snd_pcm_status structure.
+ * @PCM_MSG_SG_DATA: The first element containing a data buffer.
+ */
+enum pcm_msg_sg_index {
+	PCM_MSG_SG_XFER = 0,
+	PCM_MSG_SG_STATUS,
+	PCM_MSG_SG_DATA
+};
+
+/**
+ * virtsnd_pcm_sg_num() - Count the number of sg-elements required to represent
+ *                        vmalloc'ed buffer.
+ * @data: Pointer to vmalloc'ed buffer.
+ * @length: Buffer size.
+ *
+ * Context: Any context.
+ * Return: Number of physically contiguous parts in the @data.
+ */
+static int virtsnd_pcm_sg_num(u8 *data, unsigned int length)
+{
+	phys_addr_t sg_address;
+	unsigned int sg_length;
+	int num = 0;
+
+	while (length) {
+		struct page *pg = vmalloc_to_page(data);
+		phys_addr_t pg_address = page_to_phys(pg);
+		size_t pg_length;
+
+		pg_length = PAGE_SIZE - offset_in_page(data);
+		if (pg_length > length)
+			pg_length = length;
+
+		if (!num || sg_address + sg_length != pg_address) {
+			sg_address = pg_address;
+			sg_length = pg_length;
+			num++;
+		} else {
+			sg_length += pg_length;
+		}
+
+		data += pg_length;
+		length -= pg_length;
+	}
+
+	return num;
+}
+
+/**
+ * virtsnd_pcm_sg_from() - Build sg-list from vmalloc'ed buffer.
+ * @sgs: Preallocated sg-list to populate.
+ * @nsgs: The maximum number of elements in the @sgs.
+ * @data: Pointer to vmalloc'ed buffer.
+ * @length: Buffer size.
+ *
+ * Splits the buffer into physically contiguous parts and makes an sg-list of
+ * such parts.
+ *
+ * Context: Any context.
+ */
+static void virtsnd_pcm_sg_from(struct scatterlist *sgs, int nsgs, u8 *data,
+				unsigned int length)
+{
+	int idx = -1;
+
+	while (length) {
+		struct page *pg = vmalloc_to_page(data);
+		size_t pg_length;
+
+		pg_length = PAGE_SIZE - offset_in_page(data);
+		if (pg_length > length)
+			pg_length = length;
+
+		if (idx == -1 ||
+		    sg_phys(&sgs[idx]) + sgs[idx].length != page_to_phys(pg)) {
+			if (idx + 1 == nsgs)
+				break;
+			sg_set_page(&sgs[++idx], pg, pg_length,
+				    offset_in_page(data));
+		} else {
+			sgs[idx].length += pg_length;
+		}
+
+		data += pg_length;
+		length -= pg_length;
+	}
+
+	sg_mark_end(&sgs[idx]);
+}
+
+/**
+ * virtsnd_pcm_msg_alloc() - Allocate I/O messages.
+ * @vss: VirtIO PCM substream.
+ * @periods: Current number of periods.
+ * @period_bytes: Current period size in bytes.
+ *
+ * The function slices the buffer into @periods parts (each with the size of
+ * @period_bytes), and creates @periods corresponding I/O messages.
+ *
+ * Context: Any context that permits to sleep.
+ * Return: 0 on success, -ENOMEM on failure.
+ */
+int virtsnd_pcm_msg_alloc(struct virtio_pcm_substream *vss,
+			  unsigned int periods, unsigned int period_bytes)
+{
+	struct snd_pcm_runtime *runtime = vss->substream->runtime;
+	unsigned int i;
+
+	/* Free previously allocated messages (if any). */
+	virtsnd_pcm_msg_free(vss);
+
+	vss->msgs = kcalloc(periods, sizeof(*vss->msgs), GFP_KERNEL);
+	if (!vss->msgs)
+		return -ENOMEM;
+
+	vss->nmsgs = periods;
+
+	for (i = 0; i < periods; ++i) {
+		u8 *data = runtime->dma_area + period_bytes * i;
+		int sg_num = virtsnd_pcm_sg_num(data, period_bytes);
+		struct virtio_pcm_msg *msg;
+
+		msg = kzalloc(sizeof(*msg) + sizeof(*msg->sgs) * (sg_num + 2),
+			      GFP_KERNEL);
+		if (!msg)
+			return -ENOMEM;
+
+		msg->substream = vss;
+		sg_init_one(&msg->sgs[PCM_MSG_SG_XFER], &msg->xfer,
+			    sizeof(msg->xfer));
+		sg_init_one(&msg->sgs[PCM_MSG_SG_STATUS], &msg->status,
+			    sizeof(msg->status));
+		virtsnd_pcm_sg_from(&msg->sgs[PCM_MSG_SG_DATA], sg_num, data,
+				    period_bytes);
+
+		vss->msgs[i] = msg;
+	}
+
+	return 0;
+}
+
+/**
+ * virtsnd_pcm_msg_free() - Free all allocated I/O messages.
+ * @vss: VirtIO PCM substream.
+ *
+ * Context: Any context.
+ */
+void virtsnd_pcm_msg_free(struct virtio_pcm_substream *vss)
+{
+	unsigned int i;
+
+	for (i = 0; i < vss->nmsgs; ++i)
+		kfree(vss->msgs[i]);
+	kfree(vss->msgs);
+
+	vss->msgs = NULL;
+	vss->nmsgs = 0;
+}
+
+/**
+ * virtsnd_pcm_msg_send() - Send asynchronous I/O messages.
+ * @vss: VirtIO PCM substream.
+ *
+ * All messages are organized in an ordered circular list. Each time the
+ * function is called, all currently non-enqueued messages are added to the
+ * virtqueue. For this, the function keeps track of two values:
+ *
+ *   msg_last_enqueued = index of the last enqueued message,
+ *   msg_count = # of pending messages in the virtqueue.
+ *
+ * Context: Any context. Expects the tx/rx queue and the VirtIO substream
+ *          spinlocks to be held by caller.
+ * Return: 0 on success, -errno on failure.
+ */
+int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss)
+{
+	struct snd_pcm_runtime *runtime = vss->substream->runtime;
+	struct virtio_snd *snd = vss->snd;
+	struct virtio_device *vdev = snd->vdev;
+	struct virtqueue *vqueue = virtsnd_pcm_queue(vss)->vqueue;
+	int i;
+	int n;
+	bool notify = false;
+
+	i = (vss->msg_last_enqueued + 1) % runtime->periods;
+	n = runtime->periods - vss->msg_count;
+
+	for (; n; --n, i = (i + 1) % runtime->periods) {
+		struct virtio_pcm_msg *msg = vss->msgs[i];
+		struct scatterlist *psgs[] = {
+			&msg->sgs[PCM_MSG_SG_XFER],
+			&msg->sgs[PCM_MSG_SG_DATA],
+			&msg->sgs[PCM_MSG_SG_STATUS]
+		};
+		int rc;
+
+		msg->xfer.stream_id = cpu_to_virtio32(vdev, vss->sid);
+		memset(&msg->status, 0, sizeof(msg->status));
+
+		if (vss->direction == SNDRV_PCM_STREAM_PLAYBACK)
+			rc = virtqueue_add_sgs(vqueue, psgs, 2, 1, msg,
+					       GFP_ATOMIC);
+		else
+			rc = virtqueue_add_sgs(vqueue, psgs, 1, 2, msg,
+					       GFP_ATOMIC);
+
+		if (rc) {
+			dev_err(&vdev->dev,
+				"SID %u: failed to send I/O message\n",
+				vss->sid);
+			return rc;
+		}
+
+		vss->msg_last_enqueued = i;
+		vss->msg_count++;
+	}
+
+	if (!(vss->features & (1U << VIRTIO_SND_PCM_F_MSG_POLLING)))
+		notify = virtqueue_kick_prepare(vqueue);
+
+	if (notify)
+		virtqueue_notify(vqueue);
+
+	return 0;
+}
+
+/**
+ * virtsnd_pcm_msg_complete() - Complete an I/O message.
+ * @msg: I/O message.
+ * @size: Number of bytes written.
+ *
+ * Completion of the message means the elapsed period.
+ *
+ * Context: Interrupt context. Takes and releases the VirtIO substream spinlock.
+ */
+static void virtsnd_pcm_msg_complete(struct virtio_pcm_msg *msg, size_t size)
+{
+	struct virtio_pcm_substream *vss = msg->substream;
+
+	/*
+	 * hw_ptr always indicates the buffer position of the first I/O message
+	 * in the virtqueue. Therefore, on each completion of an I/O message,
+	 * the hw_ptr value is unconditionally advanced.
+	 */
+	spin_lock(&vss->lock);
+	/*
+	 * If the capture substream returned an incorrect status, then just
+	 * increase the hw_ptr by the period size.
+	 */
+	if (vss->direction == SNDRV_PCM_STREAM_PLAYBACK ||
+	    size <= sizeof(msg->status)) {
+		vss->hw_ptr += vss->period_size;
+	} else {
+		size -= sizeof(msg->status);
+		vss->hw_ptr += size / vss->frame_bytes;
+	}
+
+	vss->hw_ptr %= vss->buffer_size;
+	vss->xfer_xrun = false;
+	vss->msg_count--;
+
+	if (vss->xfer_enabled) {
+		struct snd_pcm_runtime *runtime = vss->substream->runtime;
+
+		runtime->delay =
+			bytes_to_frames(runtime,
+					le32_to_cpu(msg->status.latency_bytes));
+
+		spin_unlock(&vss->lock);
+		snd_pcm_period_elapsed(vss->substream);
+		spin_lock(&vss->lock);
+
+		virtsnd_pcm_msg_send(vss);
+	} else if (!vss->msg_count) {
+		wake_up_all(&vss->msg_empty);
+	}
+	spin_unlock(&vss->lock);
+}
+
+/**
+ * virtsnd_pcm_notify_cb() - Process all completed I/O messages.
+ * @queue: Underlying tx/rx virtqueue.
+ *
+ * If transmission is allowed, then each completed message is immediately placed
+ * back at the end of the queue.
+ *
+ * Context: Interrupt context. Takes and releases the tx/rx queue spinlock.
+ */
+static inline void virtsnd_pcm_notify_cb(struct virtio_snd_queue *queue)
+{
+	struct virtio_pcm_msg *msg;
+	u32 length;
+	unsigned long flags;
+
+	spin_lock_irqsave(&queue->lock, flags);
+	do {
+		virtqueue_disable_cb(queue->vqueue);
+		while ((msg = virtqueue_get_buf(queue->vqueue, &length)))
+			virtsnd_pcm_msg_complete(msg, length);
+		if (unlikely(virtqueue_is_broken(queue->vqueue)))
+			break;
+	} while (!virtqueue_enable_cb(queue->vqueue));
+	spin_unlock_irqrestore(&queue->lock, flags);
+}
+
+/**
+ * virtsnd_pcm_tx_notify_cb() - Process all completed TX messages.
+ * @vqueue: Underlying tx virtqueue.
+ *
+ * Context: Interrupt context.
+ */
+void virtsnd_pcm_tx_notify_cb(struct virtqueue *vqueue)
+{
+	struct virtio_snd *snd = vqueue->vdev->priv;
+
+	virtsnd_pcm_notify_cb(virtsnd_tx_queue(snd));
+}
+
+/**
+ * virtsnd_pcm_rx_notify_cb() - Process all completed RX messages.
+ * @vqueue: Underlying rx virtqueue.
+ *
+ * Context: Interrupt context.
+ */
+void virtsnd_pcm_rx_notify_cb(struct virtqueue *vqueue)
+{
+	struct virtio_snd *snd = vqueue->vdev->priv;
+
+	virtsnd_pcm_notify_cb(virtsnd_rx_queue(snd));
+}
+
+/**
+ * virtsnd_pcm_ctl_msg_alloc() - Allocate and initialize the PCM device control
+ *                               message for the specified substream.
+ * @vss: VirtIO PCM substream.
+ * @command: Control request code (VIRTIO_SND_R_PCM_XXX).
+ * @gfp: Kernel flags for memory allocation.
+ *
+ * Context: Any context. May sleep if @gfp flags permit.
+ * Return: Allocated message on success, NULL on failure.
+ */
+struct virtio_snd_msg *
+virtsnd_pcm_ctl_msg_alloc(struct virtio_pcm_substream *vss,
+			  unsigned int command, gfp_t gfp)
+{
+	struct virtio_device *vdev = vss->snd->vdev;
+	size_t request_size = sizeof(struct virtio_snd_pcm_hdr);
+	size_t response_size = sizeof(struct virtio_snd_hdr);
+	struct virtio_snd_msg *msg;
+
+	switch (command) {
+	case VIRTIO_SND_R_PCM_SET_PARAMS:
+		request_size = sizeof(struct virtio_snd_pcm_set_params);
+		break;
+	}
+
+	msg = virtsnd_ctl_msg_alloc(request_size, response_size, gfp);
+	if (msg) {
+		struct virtio_snd_pcm_hdr *hdr = virtsnd_ctl_msg_request(msg);
+
+		hdr->hdr.code = cpu_to_virtio32(vdev, command);
+		hdr->stream_id = cpu_to_virtio32(vdev, vss->sid);
+	}
+
+	return msg;
+}
-- 
2.30.0


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
