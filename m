Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B1413301DA9
	for <lists.virtualization@lfdr.de>; Sun, 24 Jan 2021 17:55:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6F2F78720B;
	Sun, 24 Jan 2021 16:55:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sjmA0MDm+Yz3; Sun, 24 Jan 2021 16:55:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 825FC87226;
	Sun, 24 Jan 2021 16:55:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6C828C013A;
	Sun, 24 Jan 2021 16:55:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DDE0AC013A
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Jan 2021 16:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id CC73D86943
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Jan 2021 16:55:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qi9j4J+fWPSg
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Jan 2021 16:55:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AF0A786950
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Jan 2021 16:55:07 +0000 (UTC)
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id 53591A1492;
 Sun, 24 Jan 2021 17:55:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=ApnEJhDNwnC1
 R3cvImKyMRQX15dHR8UZgjnj9KmAoE8=; b=yecTtDcPCJU+xDMSH/Ud4tLJpC1d
 ZdjJCZVs8QQSZLGC0EE1niGgq3TrWabMLyvHS3h3JSICJSBpimqU08dwFamOhd1a
 xwwFYfbqnOe/5tTzfz7ptDdl1FKPAv+sOxsS/S3NWmP+31u5t4eCnIg6oh+c6Lc4
 r7/r7gmvWV32yyGGtXXHLODmBDQC/iev2SdQAWysNanP2PINM1UDpEsJTBXQNCnR
 zax7MX3bnadK3cSmV/yLp6oOW600/dSlcyQTHkpz9aJJjrWvUjEacxd1/spBS7Vt
 2hdR7XTh1OCrI42RKceQvSgoOjdMIBuFiBjVInie8nRqYyAJk/F1U3rtvQ==
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
To: <virtualization@lists.linux-foundation.org>,
 <alsa-devel@alsa-project.org>, <virtio-dev@lists.oasis-open.org>
Subject: [PATCH v2 8/9] ALSA: virtio: introduce PCM channel map support
Date: Sun, 24 Jan 2021 17:54:07 +0100
Message-ID: <20210124165408.1122868-9-anton.yakovlev@opensynergy.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210124165408.1122868-1-anton.yakovlev@opensynergy.com>
References: <20210124165408.1122868-1-anton.yakovlev@opensynergy.com>
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

Enumerate all available PCM channel maps and create ALSA controls.

Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
---
 sound/virtio/Makefile       |   1 +
 sound/virtio/virtio_card.c  |  15 +++
 sound/virtio/virtio_card.h  |   8 ++
 sound/virtio/virtio_chmap.c | 237 ++++++++++++++++++++++++++++++++++++
 sound/virtio/virtio_pcm.h   |   4 +
 5 files changed, 265 insertions(+)
 create mode 100644 sound/virtio/virtio_chmap.c

diff --git a/sound/virtio/Makefile b/sound/virtio/Makefile
index 09f485291285..2742bddb8874 100644
--- a/sound/virtio/Makefile
+++ b/sound/virtio/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_SND_VIRTIO) += virtio_snd.o
 
 virtio_snd-objs := \
 	virtio_card.o \
+	virtio_chmap.o \
 	virtio_ctl_msg.o \
 	virtio_jack.o \
 	virtio_pcm.o \
diff --git a/sound/virtio/virtio_card.c b/sound/virtio/virtio_card.c
index 1dd709437208..fabf91fc1c9c 100644
--- a/sound/virtio/virtio_card.c
+++ b/sound/virtio/virtio_card.c
@@ -308,6 +308,10 @@ static int virtsnd_build_devs(struct virtio_snd *snd)
 	if (rc)
 		return rc;
 
+	rc = virtsnd_chmap_parse_cfg(snd);
+	if (rc)
+		return rc;
+
 	if (snd->njacks) {
 		rc = virtsnd_jack_build_devs(snd);
 		if (rc)
@@ -320,6 +324,12 @@ static int virtsnd_build_devs(struct virtio_snd *snd)
 			return rc;
 	}
 
+	if (snd->nchmaps) {
+		rc = virtsnd_chmap_build_devs(snd);
+		if (rc)
+			return rc;
+	}
+
 	return snd_card_register(snd->card);
 }
 
@@ -438,6 +448,8 @@ static void virtsnd_remove(struct virtio_device *vdev)
 
 			if (stream->substreams)
 				devm_kfree(&vdev->dev, stream->substreams);
+			if (stream->chmaps)
+				devm_kfree(&vdev->dev, stream->chmaps);
 		}
 
 		devm_kfree(&vdev->dev, pcm);
@@ -449,6 +461,9 @@ static void virtsnd_remove(struct virtio_device *vdev)
 	if (snd->substreams)
 		devm_kfree(&vdev->dev, snd->substreams);
 
+	if (snd->chmaps)
+		devm_kfree(&vdev->dev, snd->chmaps);
+
 	devm_kfree(&vdev->dev, snd);
 
 	vdev->priv = NULL;
diff --git a/sound/virtio/virtio_card.h b/sound/virtio/virtio_card.h
index df4b0696e8c4..09c6e9ab80ca 100644
--- a/sound/virtio/virtio_card.h
+++ b/sound/virtio/virtio_card.h
@@ -52,6 +52,8 @@ struct virtio_snd_queue {
  * @njacks: Number of jacks.
  * @substreams: VirtIO PCM substreams.
  * @nsubstreams: Number of PCM substreams.
+ * @chmaps: VirtIO channel maps.
+ * @nchmaps: Number of channel maps.
  */
 struct virtio_snd {
 	struct virtio_device *vdev;
@@ -65,6 +67,8 @@ struct virtio_snd {
 	unsigned int njacks;
 	struct virtio_pcm_substream *substreams;
 	unsigned int nsubstreams;
+	struct virtio_snd_chmap_info *chmaps;
+	unsigned int nchmaps;
 };
 
 /* Message completion timeout in milliseconds (module parameter). */
@@ -110,4 +114,8 @@ int virtsnd_jack_build_devs(struct virtio_snd *snd);
 void virtsnd_jack_event(struct virtio_snd *snd,
 			struct virtio_snd_event *event);
 
+int virtsnd_chmap_parse_cfg(struct virtio_snd *snd);
+
+int virtsnd_chmap_build_devs(struct virtio_snd *snd);
+
 #endif /* VIRTIO_SND_CARD_H */
diff --git a/sound/virtio/virtio_chmap.c b/sound/virtio/virtio_chmap.c
new file mode 100644
index 000000000000..8a2ddc4dcffb
--- /dev/null
+++ b/sound/virtio/virtio_chmap.c
@@ -0,0 +1,237 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Sound card driver for virtio
+ * Copyright (C) 2020  OpenSynergy GmbH
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#include <linux/virtio_config.h>
+
+#include "virtio_card.h"
+
+/* VirtIO->ALSA channel position map */
+static const u8 g_v2a_position_map[] = {
+	[VIRTIO_SND_CHMAP_NONE] = SNDRV_CHMAP_UNKNOWN,
+	[VIRTIO_SND_CHMAP_NA] = SNDRV_CHMAP_NA,
+	[VIRTIO_SND_CHMAP_MONO] = SNDRV_CHMAP_MONO,
+	[VIRTIO_SND_CHMAP_FL] = SNDRV_CHMAP_FL,
+	[VIRTIO_SND_CHMAP_FR] = SNDRV_CHMAP_FR,
+	[VIRTIO_SND_CHMAP_RL] = SNDRV_CHMAP_RL,
+	[VIRTIO_SND_CHMAP_RR] = SNDRV_CHMAP_RR,
+	[VIRTIO_SND_CHMAP_FC] = SNDRV_CHMAP_FC,
+	[VIRTIO_SND_CHMAP_LFE] = SNDRV_CHMAP_LFE,
+	[VIRTIO_SND_CHMAP_SL] = SNDRV_CHMAP_SL,
+	[VIRTIO_SND_CHMAP_SR] = SNDRV_CHMAP_SR,
+	[VIRTIO_SND_CHMAP_RC] = SNDRV_CHMAP_RC,
+	[VIRTIO_SND_CHMAP_FLC] = SNDRV_CHMAP_FLC,
+	[VIRTIO_SND_CHMAP_FRC] = SNDRV_CHMAP_FRC,
+	[VIRTIO_SND_CHMAP_RLC] = SNDRV_CHMAP_RLC,
+	[VIRTIO_SND_CHMAP_RRC] = SNDRV_CHMAP_RRC,
+	[VIRTIO_SND_CHMAP_FLW] = SNDRV_CHMAP_FLW,
+	[VIRTIO_SND_CHMAP_FRW] = SNDRV_CHMAP_FRW,
+	[VIRTIO_SND_CHMAP_FLH] = SNDRV_CHMAP_FLH,
+	[VIRTIO_SND_CHMAP_FCH] = SNDRV_CHMAP_FCH,
+	[VIRTIO_SND_CHMAP_FRH] = SNDRV_CHMAP_FRH,
+	[VIRTIO_SND_CHMAP_TC] = SNDRV_CHMAP_TC,
+	[VIRTIO_SND_CHMAP_TFL] = SNDRV_CHMAP_TFL,
+	[VIRTIO_SND_CHMAP_TFR] = SNDRV_CHMAP_TFR,
+	[VIRTIO_SND_CHMAP_TFC] = SNDRV_CHMAP_TFC,
+	[VIRTIO_SND_CHMAP_TRL] = SNDRV_CHMAP_TRL,
+	[VIRTIO_SND_CHMAP_TRR] = SNDRV_CHMAP_TRR,
+	[VIRTIO_SND_CHMAP_TRC] = SNDRV_CHMAP_TRC,
+	[VIRTIO_SND_CHMAP_TFLC] = SNDRV_CHMAP_TFLC,
+	[VIRTIO_SND_CHMAP_TFRC] = SNDRV_CHMAP_TFRC,
+	[VIRTIO_SND_CHMAP_TSL] = SNDRV_CHMAP_TSL,
+	[VIRTIO_SND_CHMAP_TSR] = SNDRV_CHMAP_TSR,
+	[VIRTIO_SND_CHMAP_LLFE] = SNDRV_CHMAP_LLFE,
+	[VIRTIO_SND_CHMAP_RLFE] = SNDRV_CHMAP_RLFE,
+	[VIRTIO_SND_CHMAP_BC] = SNDRV_CHMAP_BC,
+	[VIRTIO_SND_CHMAP_BLC] = SNDRV_CHMAP_BLC,
+	[VIRTIO_SND_CHMAP_BRC] = SNDRV_CHMAP_BRC
+};
+
+/**
+ * virtsnd_chmap_parse_cfg() - Parse the channel map configuration.
+ * @snd: VirtIO sound device.
+ *
+ * This function is called during initial device initialization.
+ *
+ * Context: Any context that permits to sleep.
+ * Return: 0 on success, -errno on failure.
+ */
+int virtsnd_chmap_parse_cfg(struct virtio_snd *snd)
+{
+	struct virtio_device *vdev = snd->vdev;
+	unsigned int i;
+	int rc;
+
+	virtio_cread(vdev, struct virtio_snd_config, chmaps, &snd->nchmaps);
+	if (!snd->nchmaps)
+		return 0;
+
+	snd->chmaps = devm_kcalloc(&vdev->dev, snd->nchmaps,
+				   sizeof(*snd->chmaps), GFP_KERNEL);
+	if (!snd->chmaps)
+		return -ENOMEM;
+
+	rc = virtsnd_ctl_query_info(snd, VIRTIO_SND_R_CHMAP_INFO, 0,
+				    snd->nchmaps, sizeof(*snd->chmaps),
+				    snd->chmaps);
+	if (rc)
+		return rc;
+
+	/* Count the number of channel maps per each PCM device/stream. */
+	for (i = 0; i < snd->nchmaps; ++i) {
+		struct virtio_snd_chmap_info *info = &snd->chmaps[i];
+		unsigned int nid = le32_to_cpu(info->hdr.hda_fn_nid);
+		struct virtio_pcm *pcm;
+		struct virtio_pcm_stream *stream;
+
+		pcm = virtsnd_pcm_find_or_create(snd, nid);
+		if (IS_ERR(pcm))
+			return PTR_ERR(pcm);
+
+		switch (info->direction) {
+		case VIRTIO_SND_D_OUTPUT: {
+			stream = &pcm->streams[SNDRV_PCM_STREAM_PLAYBACK];
+			break;
+		}
+		case VIRTIO_SND_D_INPUT: {
+			stream = &pcm->streams[SNDRV_PCM_STREAM_CAPTURE];
+			break;
+		}
+		default: {
+			dev_err(&vdev->dev,
+				"chmap #%u: unknown direction (%u)\n", i,
+				info->direction);
+			return -EINVAL;
+		}
+		}
+
+		stream->nchmaps++;
+	}
+
+	return 0;
+}
+
+/**
+ * virtsnd_chmap_add_ctls() - Create an ALSA control for channel maps.
+ * @pcm: ALSA PCM device.
+ * @direction: PCM stream direction (SNDRV_PCM_STREAM_XXX).
+ * @stream: VirtIO PCM stream.
+ *
+ * Context: Any context.
+ * Return: 0 on success, -errno on failure.
+ */
+static int virtsnd_chmap_add_ctls(struct snd_pcm *pcm, int direction,
+				  struct virtio_pcm_stream *stream)
+{
+	unsigned int i;
+	int max_channels = 0;
+
+	for (i = 0; i < stream->nchmaps; i++)
+		if (max_channels < stream->chmaps[i].channels)
+			max_channels = stream->chmaps[i].channels;
+
+	return snd_pcm_add_chmap_ctls(pcm, direction, stream->chmaps,
+				      max_channels, 0, NULL);
+}
+
+/**
+ * virtsnd_chmap_build_devs() - Build ALSA controls for channel maps.
+ * @snd: VirtIO sound device.
+ *
+ * Context: Any context.
+ * Return: 0 on success, -errno on failure.
+ */
+int virtsnd_chmap_build_devs(struct virtio_snd *snd)
+{
+	struct virtio_device *vdev = snd->vdev;
+	struct virtio_pcm *pcm;
+	struct virtio_pcm_stream *stream;
+	unsigned int i;
+	int rc;
+
+	/* Allocate channel map elements per each PCM device/stream. */
+	list_for_each_entry(pcm, &snd->pcm_list, list) {
+		for (i = 0; i < ARRAY_SIZE(pcm->streams); ++i) {
+			stream = &pcm->streams[i];
+
+			if (!stream->nchmaps)
+				continue;
+
+			stream->chmaps = devm_kcalloc(&vdev->dev,
+						      stream->nchmaps + 1,
+						      sizeof(*stream->chmaps),
+						      GFP_KERNEL);
+			if (!stream->chmaps)
+				return -ENOMEM;
+
+			stream->nchmaps = 0;
+		}
+	}
+
+	/* Initialize channel maps per each PCM device/stream. */
+	for (i = 0; i < snd->nchmaps; ++i) {
+		struct virtio_snd_chmap_info *info = &snd->chmaps[i];
+		unsigned int nid = le32_to_cpu(info->hdr.hda_fn_nid);
+		unsigned int channels = info->channels;
+		unsigned int ch;
+		struct snd_pcm_chmap_elem *chmap;
+
+		pcm = virtsnd_pcm_find(snd, nid);
+		if (IS_ERR(pcm))
+			return PTR_ERR(pcm);
+
+		if (info->direction == VIRTIO_SND_D_OUTPUT)
+			stream = &pcm->streams[SNDRV_PCM_STREAM_PLAYBACK];
+		else
+			stream = &pcm->streams[SNDRV_PCM_STREAM_CAPTURE];
+
+		chmap = &stream->chmaps[stream->nchmaps++];
+
+		if (channels > ARRAY_SIZE(chmap->map))
+			channels = ARRAY_SIZE(chmap->map);
+
+		chmap->channels = channels;
+
+		for (ch = 0; ch < channels; ++ch) {
+			u8 position = info->positions[ch];
+
+			if (position >= ARRAY_SIZE(g_v2a_position_map))
+				return -EINVAL;
+
+			chmap->map[ch] = g_v2a_position_map[position];
+		}
+	}
+
+	/* Create an ALSA control per each PCM device/stream. */
+	list_for_each_entry(pcm, &snd->pcm_list, list) {
+		if (!pcm->pcm)
+			continue;
+
+		for (i = 0; i < ARRAY_SIZE(pcm->streams); ++i) {
+			stream = &pcm->streams[i];
+
+			if (!stream->nchmaps)
+				continue;
+
+			rc = virtsnd_chmap_add_ctls(pcm->pcm, i, stream);
+			if (rc)
+				return rc;
+		}
+	}
+
+	return 0;
+}
diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
index fe467bc05d8b..a326b921b947 100644
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -70,10 +70,14 @@ struct virtio_pcm_substream {
  * struct virtio_pcm_stream - VirtIO PCM stream.
  * @substreams: Virtio substreams belonging to the stream.
  * @nsubstreams: Number of substreams.
+ * @chmaps: Kernel channel maps belonging to the stream.
+ * @nchmaps: Number of channel maps.
  */
 struct virtio_pcm_stream {
 	struct virtio_pcm_substream **substreams;
 	unsigned int nsubstreams;
+	struct snd_pcm_chmap_elem *chmaps;
+	unsigned int nchmaps;
 };
 
 /**
-- 
2.30.0


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
