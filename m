Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E90447C710D
	for <lists.virtualization@lfdr.de>; Thu, 12 Oct 2023 17:11:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75203400CC;
	Thu, 12 Oct 2023 15:11:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75203400CC
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xz0owk0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id agfJxMXR12mY; Thu, 12 Oct 2023 15:11:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id DAF1E400DC;
	Thu, 12 Oct 2023 15:11:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAF1E400DC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0F2F4C0DD3;
	Thu, 12 Oct 2023 15:11:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7340EC0032
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Oct 2023 15:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C0F681E12
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Oct 2023 15:11:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C0F681E12
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xz0owk0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ngy44ELj_gMp
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Oct 2023 15:10:57 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B3C181E09
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Oct 2023 15:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B3C181E09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697123456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=gvuUvnmAOc+5ancuDYl6HaH66MgYEJMxrZM267ANkfY=;
 b=Xz0owk0FkW/59gR1tS72z0SuswMQwRNxh13pQIdzvyXLz2oVKeRIN6gQvJauP7DJ1KnxoN
 IMdRLFuZECVrgeGaHcCmAJHUN60zRVwj8ITv2vzWNEw67UFsjekQS+Qvm8ZOISLcYOfg7y
 64p3BjS6ARLm49Eu5gvagrL9u+ay41I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-yw6poX3dPTaK7OcfgQ3mhA-1; Thu, 12 Oct 2023 11:10:54 -0400
X-MC-Unique: yw6poX3dPTaK7OcfgQ3mhA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-327cd5c7406so555414f8f.3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Oct 2023 08:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697123453; x=1697728253;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gvuUvnmAOc+5ancuDYl6HaH66MgYEJMxrZM267ANkfY=;
 b=JAD2zjIyqiR+YapntsTTqBHzaJjFdD3OL2+kURcAx7Y5fJIboowTq7YG69QXLc1NSV
 cfi2dE4gWdmQkgoDtsxvfKLYQKodWEmjsGHBuZfaFMoeuT/lHEWCHziSkYucqN9wpsKI
 T4Vd6kqv4Jtk7cH6kHg03fGt1yMliQZMmERFenhaCSf9bxxN5dnblc93qhADu5FKEHul
 /igqNOEQKO6eHWPJNm6G50+QzMppEG53SdjEBxgc6Ha6zDYXIA9DoNcmR4oEW7Cb5ZwU
 Vwplekl9/AI1iWIS/vKey2BA9obSDLraMMuGK/p2cmm7YJCRzeQVXOEcXDReyduHyQNz
 jSug==
X-Gm-Message-State: AOJu0YzFa4lEY5A0+4o7eKBWN88qdByQn1RcQ+6+UTezdb7pzTR++CPr
 Mj2o2dLKrUU7tq3fjWMKo3OU2dkHbk6c1xyrkJps/wFKgyj83qBbhCTwboaTMQ78NaMKc7I2RXZ
 9Wy1v8BMCMF9ssYhLWPFJtkIiPepH8lTseQhkVLzHLQ==
X-Received: by 2002:adf:ef4a:0:b0:32d:8cd1:52e4 with SMTP id
 c10-20020adfef4a000000b0032d8cd152e4mr2450237wrp.6.1697123453198; 
 Thu, 12 Oct 2023 08:10:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5ar2o8WXFfVCyqb0e9PPVTvcWY+gQYuTndZOYtsUVd++yeA3HyBbywLy81/Mo2OC0N3s9Hw==
X-Received: by 2002:adf:ef4a:0:b0:32d:8cd1:52e4 with SMTP id
 c10-20020adfef4a000000b0032d8cd152e4mr2450218wrp.6.1697123452809; 
 Thu, 12 Oct 2023 08:10:52 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
 by smtp.gmail.com with ESMTPSA id
 k23-20020a5d5257000000b003177074f830sm18599917wrc.59.2023.10.12.08.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 08:10:52 -0700 (PDT)
Date: Thu, 12 Oct 2023 17:10:50 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: anton.yakovlev@opensynergy.com, mst@redhat.com
Subject: [RFC PATCH] ALSA: virtio: use copy and fill_silence callbacks
Message-ID: <ZSgMeoMx6NX2zCx/@fedora>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: manos.pitsidianakis@linaro.org, alsa-devel@alsa-project.org,
 mripard@redhat.com, tiwai@suse.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, stefanha@redhat.com,
 pbonzini@redhat.com, perex@perex.cz
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

This commit replaces the mmap mechanism with the copy() and
fill_silence() callbacks for both capturing and playback for the
virtio-sound driver. This change is required to prevent the updating of
the content of a buffer that is already in the available ring.

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

By providing the copy() callback, the driver first updates the content
of the buffer, and then, exposes the buffer to the device by enqueuing
it in the available ring. Thus, device always picks up a buffer that is
updated.

For capturing, the driver starts by exposing all the available buffers
to device. After device updates the content of a buffer, it enqueues it
in the used ring. It is only after the copy() for capturing is issued
that the driver re-enqueues the buffer in the available ring.

Note that the copy() function assumes that user is always writing a
period. Testing shows that this is true but I may be wrong. This RFC
aims at clarifying this.

Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
 sound/virtio/virtio_pcm.c     | 11 ++--
 sound/virtio/virtio_pcm.h     |  9 +++-
 sound/virtio/virtio_pcm_msg.c | 50 ++++++++++++++++---
 sound/virtio/virtio_pcm_ops.c | 94 +++++++++++++++++++++++++++++++----
 4 files changed, 137 insertions(+), 27 deletions(-)

diff --git a/sound/virtio/virtio_pcm.c b/sound/virtio/virtio_pcm.c
index c10d91fff2fb..bfe982952303 100644
--- a/sound/virtio/virtio_pcm.c
+++ b/sound/virtio/virtio_pcm.c
@@ -104,8 +104,6 @@ static int virtsnd_pcm_build_hw(struct virtio_pcm_substream *vss,
 	 * only message-based transport.
 	 */
 	vss->hw.info =
-		SNDRV_PCM_INFO_MMAP |
-		SNDRV_PCM_INFO_MMAP_VALID |
 		SNDRV_PCM_INFO_BATCH |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
 		SNDRV_PCM_INFO_INTERLEAVED |
@@ -471,12 +469,11 @@ int virtsnd_pcm_build_devs(struct virtio_snd *snd)
 			for (kss = ks->substream; kss; kss = kss->next)
 				vs->substreams[kss->number]->substream = kss;
 
-			snd_pcm_set_ops(vpcm->pcm, i, &virtsnd_pcm_ops);
+			if (i == SNDRV_PCM_STREAM_CAPTURE)
+				snd_pcm_set_ops(vpcm->pcm, i, &virtsnd_pcm_capture_ops);
+			else
+				snd_pcm_set_ops(vpcm->pcm, i, &virtsnd_pcm_playback_ops);
 		}
-
-		snd_pcm_set_managed_buffer_all(vpcm->pcm,
-					       SNDRV_DMA_TYPE_VMALLOC, NULL,
-					       0, 0);
 	}
 
 	return 0;
diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
index 062eb8e8f2cf..1c1106ec971f 100644
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -50,6 +50,8 @@ struct virtio_pcm_substream {
 	struct work_struct elapsed_period;
 	spinlock_t lock;
 	size_t buffer_bytes;
+	u8 *buffer;
+	size_t buffer_sz;
 	size_t hw_ptr;
 	bool xfer_enabled;
 	bool xfer_xrun;
@@ -90,7 +92,8 @@ struct virtio_pcm {
 	struct virtio_pcm_stream streams[SNDRV_PCM_STREAM_LAST + 1];
 };
 
-extern const struct snd_pcm_ops virtsnd_pcm_ops;
+extern const struct snd_pcm_ops virtsnd_pcm_playback_ops;
+extern const struct snd_pcm_ops virtsnd_pcm_capture_ops;
 
 int virtsnd_pcm_validate(struct virtio_device *vdev);
 
@@ -117,7 +120,9 @@ int virtsnd_pcm_msg_alloc(struct virtio_pcm_substream *vss,
 
 void virtsnd_pcm_msg_free(struct virtio_pcm_substream *vss);
 
-int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss);
+int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss, bool single);
+
+int virtsnd_pcm_msg_send_locked(struct virtio_pcm_substream *vss, bool single);
 
 unsigned int virtsnd_pcm_msg_pending_num(struct virtio_pcm_substream *vss);
 
diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
index aca2dc1989ba..9a5f9814cb62 100644
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -132,7 +132,6 @@ static void virtsnd_pcm_sg_from(struct scatterlist *sgs, int nsgs, u8 *data,
 int virtsnd_pcm_msg_alloc(struct virtio_pcm_substream *vss,
 			  unsigned int periods, unsigned int period_bytes)
 {
-	struct snd_pcm_runtime *runtime = vss->substream->runtime;
 	unsigned int i;
 
 	vss->msgs = kcalloc(periods, sizeof(*vss->msgs), GFP_KERNEL);
@@ -142,7 +141,7 @@ int virtsnd_pcm_msg_alloc(struct virtio_pcm_substream *vss,
 	vss->nmsgs = periods;
 
 	for (i = 0; i < periods; ++i) {
-		u8 *data = runtime->dma_area + period_bytes * i;
+		u8 *data = vss->buffer + period_bytes * i;
 		int sg_num = virtsnd_pcm_sg_num(data, period_bytes);
 		struct virtio_pcm_msg *msg;
 
@@ -186,10 +185,12 @@ void virtsnd_pcm_msg_free(struct virtio_pcm_substream *vss)
 /**
  * virtsnd_pcm_msg_send() - Send asynchronous I/O messages.
  * @vss: VirtIO PCM substream.
+ * @single: true to enqueue a single message, false to enqueue all of them.
  *
  * All messages are organized in an ordered circular list. Each time the
- * function is called, all currently non-enqueued messages are added to the
- * virtqueue. For this, the function keeps track of two values:
+ * function is called, first non-enqueued message is added to the virtqueue.
+ * When single is True, only the first message is enqueued. When False, all the
+ * available messages are enqueued.  The function keeps track of two values:
  *
  *   msg_last_enqueued = index of the last enqueued message,
  *   msg_count = # of pending messages in the virtqueue.
@@ -198,7 +199,7 @@ void virtsnd_pcm_msg_free(struct virtio_pcm_substream *vss)
  *          spinlocks to be held by caller.
  * Return: 0 on success, -errno on failure.
  */
-int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss)
+int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss, bool single)
 {
 	struct snd_pcm_runtime *runtime = vss->substream->runtime;
 	struct virtio_snd *snd = vss->snd;
@@ -211,6 +212,13 @@ int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss)
 	i = (vss->msg_last_enqueued + 1) % runtime->periods;
 	n = runtime->periods - vss->msg_count;
 
+	if (single) {
+		if (n < 1)
+			return -EFAULT;
+
+		n = 1;
+	}
+
 	for (; n; --n, i = (i + 1) % runtime->periods) {
 		struct virtio_pcm_msg *msg = vss->msgs[i];
 		struct scatterlist *psgs[] = {
@@ -250,6 +258,36 @@ int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss)
 	return 0;
 }
 
+/**
+ * virtsnd_pcm_msg_send_locked() - Send asynchronous I/O messages.
+ * @vss: VirtIO PCM substream.
+ * @single: true to enqueue a single message, false to enqueue all of them.
+ *
+ * This function holds the tx/rx queue and the VirtIO substream spinlocks
+ * before calling virtsnd_pcm_msg_send(). This is a wrapper function to ease
+ * the invocation of virtsnd_pcm_msg_send().
+ *
+ * Context: Any context.
+ * Return: 0 on success, -errno on failure.
+ */
+
+int virtsnd_pcm_msg_send_locked(struct virtio_pcm_substream *vss, bool single)
+{
+	struct virtio_snd_queue *queue;
+	int rc;
+	unsigned long flags;
+
+	queue = virtsnd_pcm_queue(vss);
+
+	spin_lock_irqsave(&queue->lock, flags);
+	spin_lock(&vss->lock);
+	rc = virtsnd_pcm_msg_send(vss, single);
+	spin_unlock(&vss->lock);
+	spin_unlock_irqrestore(&queue->lock, flags);
+
+	return rc;
+}
+
 /**
  * virtsnd_pcm_msg_pending_num() - Returns the number of pending I/O messages.
  * @vss: VirtIO substream.
@@ -320,8 +358,6 @@ static void virtsnd_pcm_msg_complete(struct virtio_pcm_msg *msg,
 					le32_to_cpu(msg->status.latency_bytes));
 
 		schedule_work(&vss->elapsed_period);
-
-		virtsnd_pcm_msg_send(vss);
 	} else if (!vss->msg_count) {
 		wake_up_all(&vss->msg_empty);
 	}
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
index f8bfb87624be..a208439dbff8 100644
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -238,6 +238,11 @@ static int virtsnd_pcm_hw_params(struct snd_pcm_substream *substream,
 	 */
 	virtsnd_pcm_msg_free(vss);
 
+	vss->buffer_sz = params_buffer_bytes(hw_params);
+	vss->buffer = alloc_pages_exact(vss->buffer_sz, GFP_KERNEL);
+	if (!vss->buffer)
+		return -ENOMEM;
+
 	return virtsnd_pcm_msg_alloc(vss, params_periods(hw_params),
 				     params_period_bytes(hw_params));
 }
@@ -257,6 +262,11 @@ static int virtsnd_pcm_hw_free(struct snd_pcm_substream *substream)
 	if (!virtsnd_pcm_msg_pending_num(vss))
 		virtsnd_pcm_msg_free(vss);
 
+	if (vss->buffer) {
+		free_pages_exact(vss->buffer, vss->buffer_sz);
+		vss->buffer = NULL;
+	}
+
 	return 0;
 }
 
@@ -331,15 +341,18 @@ static int virtsnd_pcm_trigger(struct snd_pcm_substream *substream, int command)
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		queue = virtsnd_pcm_queue(vss);
 
-		spin_lock_irqsave(&queue->lock, flags);
-		spin_lock(&vss->lock);
-		rc = virtsnd_pcm_msg_send(vss);
-		if (!rc)
-			vss->xfer_enabled = true;
-		spin_unlock(&vss->lock);
-		spin_unlock_irqrestore(&queue->lock, flags);
-		if (rc)
-			return rc;
+		// The buffers should be exposed first during capturing so that
+		// the device can consume them. Capturing cannot begin
+		// otherwise.
+		if (vss->direction == SNDRV_PCM_STREAM_CAPTURE) {
+			rc = virtsnd_pcm_msg_send_locked(vss, false);
+			if (rc)
+				return rc;
+		}
+
+		spin_lock_irqsave(&vss->lock, flags);
+		vss->xfer_enabled = true;
+		spin_unlock_irqrestore(&vss->lock, flags);
 
 		msg = virtsnd_pcm_ctl_msg_alloc(vss, VIRTIO_SND_R_PCM_START,
 						GFP_KERNEL);
@@ -450,8 +463,66 @@ virtsnd_pcm_pointer(struct snd_pcm_substream *substream)
 	return hw_ptr;
 }
 
-/* PCM substream operators map. */
-const struct snd_pcm_ops virtsnd_pcm_ops = {
+static int virtsnd_pcm_pb_copy(struct snd_pcm_substream *substream,
+			       int channel, unsigned long pos, struct iov_iter
+			       *src, unsigned long count)
+{
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+
+	if (unlikely(pos + count > vss->buffer_sz))
+		return -EINVAL;
+
+	if (copy_from_iter(vss->buffer + pos, count, src) != count)
+		return -EFAULT;
+
+	return virtsnd_pcm_msg_send_locked(vss, true);
+}
+
+static int virtsnd_pcm_cap_copy(struct snd_pcm_substream *substream,
+				int channel, unsigned long pos, struct iov_iter
+				*dst, unsigned long count)
+{
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+
+	if (unlikely(pos + count > vss->buffer_sz))
+		return -EINVAL;
+
+	if (copy_to_iter(vss->buffer + pos, count, dst) != count)
+		return -EFAULT;
+
+	return virtsnd_pcm_msg_send_locked(vss, true);
+}
+
+static int virtsnd_pcm_pb_silence(struct snd_pcm_substream *substream, int channel,
+				  unsigned long pos, unsigned long count)
+{
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+
+	if (unlikely(pos + count > vss->buffer_sz))
+		return -EINVAL;
+
+	memset(vss->buffer + pos, 0, count);
+
+	return virtsnd_pcm_msg_send_locked(vss, true);
+}
+
+/* PCM substream operators map for playback. */
+const struct snd_pcm_ops virtsnd_pcm_playback_ops = {
+	.open = virtsnd_pcm_open,
+	.close = virtsnd_pcm_close,
+	.ioctl = snd_pcm_lib_ioctl,
+	.hw_params = virtsnd_pcm_hw_params,
+	.hw_free = virtsnd_pcm_hw_free,
+	.prepare = virtsnd_pcm_prepare,
+	.trigger = virtsnd_pcm_trigger,
+	.sync_stop = virtsnd_pcm_sync_stop,
+	.pointer = virtsnd_pcm_pointer,
+	.copy = virtsnd_pcm_pb_copy,
+	.fill_silence = virtsnd_pcm_pb_silence,
+};
+
+/* PCM substream operators map for capturing. */
+const struct snd_pcm_ops virtsnd_pcm_capture_ops = {
 	.open = virtsnd_pcm_open,
 	.close = virtsnd_pcm_close,
 	.ioctl = snd_pcm_lib_ioctl,
@@ -461,4 +532,5 @@ const struct snd_pcm_ops virtsnd_pcm_ops = {
 	.trigger = virtsnd_pcm_trigger,
 	.sync_stop = virtsnd_pcm_sync_stop,
 	.pointer = virtsnd_pcm_pointer,
+	.copy = virtsnd_pcm_cap_copy,
 };

base-commit: 8a749fd1a8720d4619c91c8b6e7528c0a355c0aa
-- 
2.41.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
