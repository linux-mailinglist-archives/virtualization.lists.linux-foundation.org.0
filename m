Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F94032A6A4
	for <lists.virtualization@lfdr.de>; Tue,  2 Mar 2021 17:47:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F183D83ABA;
	Tue,  2 Mar 2021 16:47:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1w7Yi2ZsGv-P; Tue,  2 Mar 2021 16:47:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AF4583ABF;
	Tue,  2 Mar 2021 16:47:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0E1F7C0001;
	Tue,  2 Mar 2021 16:47:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D1BA1C0001
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Mar 2021 16:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD1B54EB7C
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Mar 2021 16:47:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=opensynergy.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3_TarVW6fxNA
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Mar 2021 16:47:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D7374D4E0
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Mar 2021 16:47:52 +0000 (UTC)
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id A043DA17C8;
 Tue,  2 Mar 2021 17:47:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=lS71NzR7T2qD
 HBLyNaeJfJUrPuKTSvZakwWbz1G6vPI=; b=gtfC04hN8v72P30qjvmZstA1LXMU
 lM3Gi7imu/7D3be7mPT6kF/iS+QloXOVaAoJS++zzfHuKQkUB6fTAUjIfMp7Avyp
 YlwnK6mQwfUSf/naQ4X+wxE8L2bJn0vXTtZnc9pZ8RgTWwYk5EJIHPGgK7MjFZXg
 R3b9aXfZfo5mgQxUajTC5xRn7dhSxbWpy4YVxFMWmqfHHKK9feelBYzbKz809uPb
 PdZEZjgSzWLJyEifX8wVO1JNTLntXSTlvNBtLi1T+JCpBSlNocKm02FAQltNZljh
 5X5z5F1n241XDsz6KekEewYeYQh/U12Ynuvt1Q5xKkU9vu4mWsK2dmbDOA==
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
To: <virtualization@lists.linux-foundation.org>,
 <alsa-devel@alsa-project.org>, <virtio-dev@lists.oasis-open.org>
Subject: [PATCH v7 7/9] ALSA: virtio: introduce jack support
Date: Tue, 2 Mar 2021 17:47:07 +0100
Message-ID: <20210302164709.3142702-8-anton.yakovlev@opensynergy.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210302164709.3142702-1-anton.yakovlev@opensynergy.com>
References: <20210302164709.3142702-1-anton.yakovlev@opensynergy.com>
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

Enumerate all available jacks and create ALSA controls.

At the moment jacks have a simple implementation and can only be used
to receive notifications about a plugged in/out device.

Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
---
 sound/virtio/Makefile      |   1 +
 sound/virtio/virtio_card.c |  14 +++
 sound/virtio/virtio_card.h |  12 ++
 sound/virtio/virtio_jack.c | 233 +++++++++++++++++++++++++++++++++++++
 4 files changed, 260 insertions(+)
 create mode 100644 sound/virtio/virtio_jack.c

diff --git a/sound/virtio/Makefile b/sound/virtio/Makefile
index 34493226793f..09f485291285 100644
--- a/sound/virtio/Makefile
+++ b/sound/virtio/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_SND_VIRTIO) += virtio_snd.o
 virtio_snd-objs := \
 	virtio_card.o \
 	virtio_ctl_msg.o \
+	virtio_jack.o \
 	virtio_pcm.o \
 	virtio_pcm_msg.o \
 	virtio_pcm_ops.o
diff --git a/sound/virtio/virtio_card.c b/sound/virtio/virtio_card.c
index 57b9b7f3a9c0..89bd66c1256e 100644
--- a/sound/virtio/virtio_card.c
+++ b/sound/virtio/virtio_card.c
@@ -56,6 +56,10 @@ static void virtsnd_event_dispatch(struct virtio_snd *snd,
 				   struct virtio_snd_event *event)
 {
 	switch (le32_to_cpu(event->hdr.code)) {
+	case VIRTIO_SND_EVT_JACK_CONNECTED:
+	case VIRTIO_SND_EVT_JACK_DISCONNECTED:
+		virtsnd_jack_event(snd, event);
+		break;
 	case VIRTIO_SND_EVT_PCM_PERIOD_ELAPSED:
 	case VIRTIO_SND_EVT_PCM_XRUN:
 		virtsnd_pcm_event(snd, event);
@@ -219,10 +223,20 @@ static int virtsnd_build_devs(struct virtio_snd *snd)
 			 VIRTIO_SND_CARD_NAME " at %s/%s",
 			 dev_name(dev->parent), dev_name(dev));
 
+	rc = virtsnd_jack_parse_cfg(snd);
+	if (rc)
+		return rc;
+
 	rc = virtsnd_pcm_parse_cfg(snd);
 	if (rc)
 		return rc;
 
+	if (snd->njacks) {
+		rc = virtsnd_jack_build_devs(snd);
+		if (rc)
+			return rc;
+	}
+
 	if (snd->nsubstreams) {
 		rc = virtsnd_pcm_build_devs(snd);
 		if (rc)
diff --git a/sound/virtio/virtio_card.h b/sound/virtio/virtio_card.h
index c43f9744d362..f154313c79fd 100644
--- a/sound/virtio/virtio_card.h
+++ b/sound/virtio/virtio_card.h
@@ -18,6 +18,7 @@
 #define VIRTIO_SND_CARD_NAME	"VirtIO SoundCard"
 #define VIRTIO_SND_PCM_NAME	"VirtIO PCM"
 
+struct virtio_jack;
 struct virtio_pcm_substream;
 
 /**
@@ -38,6 +39,8 @@ struct virtio_snd_queue {
  * @ctl_msgs: Pending control request list.
  * @event_msgs: Device events.
  * @pcm_list: VirtIO PCM device list.
+ * @jacks: VirtIO jacks.
+ * @njacks: Number of jacks.
  * @substreams: VirtIO PCM substreams.
  * @nsubstreams: Number of PCM substreams.
  */
@@ -48,6 +51,8 @@ struct virtio_snd {
 	struct list_head ctl_msgs;
 	struct virtio_snd_event *event_msgs;
 	struct list_head pcm_list;
+	struct virtio_jack *jacks;
+	u32 njacks;
 	struct virtio_pcm_substream *substreams;
 	u32 nsubstreams;
 };
@@ -88,4 +93,11 @@ virtsnd_pcm_queue(struct virtio_pcm_substream *vss)
 		return virtsnd_rx_queue(vss->snd);
 }
 
+int virtsnd_jack_parse_cfg(struct virtio_snd *snd);
+
+int virtsnd_jack_build_devs(struct virtio_snd *snd);
+
+void virtsnd_jack_event(struct virtio_snd *snd,
+			struct virtio_snd_event *event);
+
 #endif /* VIRTIO_SND_CARD_H */
diff --git a/sound/virtio/virtio_jack.c b/sound/virtio/virtio_jack.c
new file mode 100644
index 000000000000..c69f1dcdcc84
--- /dev/null
+++ b/sound/virtio/virtio_jack.c
@@ -0,0 +1,233 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * virtio-snd: Virtio sound device
+ * Copyright (C) 2021 OpenSynergy GmbH
+ */
+#include <linux/virtio_config.h>
+#include <sound/jack.h>
+#include <sound/hda_verbs.h>
+
+#include "virtio_card.h"
+
+/**
+ * DOC: Implementation Status
+ *
+ * At the moment jacks have a simple implementation and can only be used to
+ * receive notifications about a plugged in/out device.
+ *
+ * VIRTIO_SND_R_JACK_REMAP
+ *   is not supported
+ */
+
+/**
+ * struct virtio_jack - VirtIO jack.
+ * @jack: Kernel jack control.
+ * @nid: Functional group node identifier.
+ * @features: Jack virtio feature bit map (1 << VIRTIO_SND_JACK_F_XXX).
+ * @defconf: Pin default configuration value.
+ * @caps: Pin capabilities value.
+ * @connected: Current jack connection status.
+ * @type: Kernel jack type (SND_JACK_XXX).
+ */
+struct virtio_jack {
+	struct snd_jack *jack;
+	u32 nid;
+	u32 features;
+	u32 defconf;
+	u32 caps;
+	bool connected;
+	int type;
+};
+
+/**
+ * virtsnd_jack_get_label() - Get the name string for the jack.
+ * @vjack: VirtIO jack.
+ *
+ * Returns the jack name based on the default pin configuration value (see HDA
+ * specification).
+ *
+ * Context: Any context.
+ * Return: Name string.
+ */
+static const char *virtsnd_jack_get_label(struct virtio_jack *vjack)
+{
+	unsigned int defconf = vjack->defconf;
+	unsigned int device =
+		(defconf & AC_DEFCFG_DEVICE) >> AC_DEFCFG_DEVICE_SHIFT;
+	unsigned int location =
+		(defconf & AC_DEFCFG_LOCATION) >> AC_DEFCFG_LOCATION_SHIFT;
+
+	switch (device) {
+	case AC_JACK_LINE_OUT:
+		return "Line Out";
+	case AC_JACK_SPEAKER:
+		return "Speaker";
+	case AC_JACK_HP_OUT:
+		return "Headphone";
+	case AC_JACK_CD:
+		return "CD";
+	case AC_JACK_SPDIF_OUT:
+	case AC_JACK_DIG_OTHER_OUT:
+		if (location == AC_JACK_LOC_HDMI)
+			return "HDMI Out";
+		else
+			return "SPDIF Out";
+	case AC_JACK_LINE_IN:
+		return "Line";
+	case AC_JACK_AUX:
+		return "Aux";
+	case AC_JACK_MIC_IN:
+		return "Mic";
+	case AC_JACK_SPDIF_IN:
+		return "SPDIF In";
+	case AC_JACK_DIG_OTHER_IN:
+		return "Digital In";
+	default:
+		return "Misc";
+	}
+}
+
+/**
+ * virtsnd_jack_get_type() - Get the type for the jack.
+ * @vjack: VirtIO jack.
+ *
+ * Returns the jack type based on the default pin configuration value (see HDA
+ * specification).
+ *
+ * Context: Any context.
+ * Return: SND_JACK_XXX value.
+ */
+static int virtsnd_jack_get_type(struct virtio_jack *vjack)
+{
+	unsigned int defconf = vjack->defconf;
+	unsigned int device =
+		(defconf & AC_DEFCFG_DEVICE) >> AC_DEFCFG_DEVICE_SHIFT;
+
+	switch (device) {
+	case AC_JACK_LINE_OUT:
+	case AC_JACK_SPEAKER:
+		return SND_JACK_LINEOUT;
+	case AC_JACK_HP_OUT:
+		return SND_JACK_HEADPHONE;
+	case AC_JACK_SPDIF_OUT:
+	case AC_JACK_DIG_OTHER_OUT:
+		return SND_JACK_AVOUT;
+	case AC_JACK_MIC_IN:
+		return SND_JACK_MICROPHONE;
+	default:
+		return SND_JACK_LINEIN;
+	}
+}
+
+/**
+ * virtsnd_jack_parse_cfg() - Parse the jack configuration.
+ * @snd: VirtIO sound device.
+ *
+ * This function is called during initial device initialization.
+ *
+ * Context: Any context that permits to sleep.
+ * Return: 0 on success, -errno on failure.
+ */
+int virtsnd_jack_parse_cfg(struct virtio_snd *snd)
+{
+	struct virtio_device *vdev = snd->vdev;
+	struct virtio_snd_jack_info *info;
+	u32 i;
+	int rc;
+
+	virtio_cread_le(vdev, struct virtio_snd_config, jacks, &snd->njacks);
+	if (!snd->njacks)
+		return 0;
+
+	snd->jacks = devm_kcalloc(&vdev->dev, snd->njacks, sizeof(*snd->jacks),
+				  GFP_KERNEL);
+	if (!snd->jacks)
+		return -ENOMEM;
+
+	info = kcalloc(snd->njacks, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	rc = virtsnd_ctl_query_info(snd, VIRTIO_SND_R_JACK_INFO, 0, snd->njacks,
+				    sizeof(*info), info);
+	if (rc)
+		goto on_exit;
+
+	for (i = 0; i < snd->njacks; ++i) {
+		struct virtio_jack *vjack = &snd->jacks[i];
+
+		vjack->nid = le32_to_cpu(info[i].hdr.hda_fn_nid);
+		vjack->features = le32_to_cpu(info[i].features);
+		vjack->defconf = le32_to_cpu(info[i].hda_reg_defconf);
+		vjack->caps = le32_to_cpu(info[i].hda_reg_caps);
+		vjack->connected = info[i].connected;
+	}
+
+on_exit:
+	kfree(info);
+
+	return rc;
+}
+
+/**
+ * virtsnd_jack_build_devs() - Build ALSA controls for jacks.
+ * @snd: VirtIO sound device.
+ *
+ * Context: Any context that permits to sleep.
+ * Return: 0 on success, -errno on failure.
+ */
+int virtsnd_jack_build_devs(struct virtio_snd *snd)
+{
+	u32 i;
+	int rc;
+
+	for (i = 0; i < snd->njacks; ++i) {
+		struct virtio_jack *vjack = &snd->jacks[i];
+
+		vjack->type = virtsnd_jack_get_type(vjack);
+
+		rc = snd_jack_new(snd->card, virtsnd_jack_get_label(vjack),
+				  vjack->type, &vjack->jack, true, true);
+		if (rc)
+			return rc;
+
+		if (vjack->jack)
+			vjack->jack->private_data = vjack;
+
+		snd_jack_report(vjack->jack,
+				vjack->connected ? vjack->type : 0);
+	}
+
+	return 0;
+}
+
+/**
+ * virtsnd_jack_event() - Handle the jack event notification.
+ * @snd: VirtIO sound device.
+ * @event: VirtIO sound event.
+ *
+ * Context: Interrupt context.
+ */
+void virtsnd_jack_event(struct virtio_snd *snd, struct virtio_snd_event *event)
+{
+	u32 jack_id = le32_to_cpu(event->data);
+	struct virtio_jack *vjack;
+
+	if (jack_id >= snd->njacks)
+		return;
+
+	vjack = &snd->jacks[jack_id];
+
+	switch (le32_to_cpu(event->hdr.code)) {
+	case VIRTIO_SND_EVT_JACK_CONNECTED:
+		vjack->connected = true;
+		break;
+	case VIRTIO_SND_EVT_JACK_DISCONNECTED:
+		vjack->connected = false;
+		break;
+	default:
+		return;
+	}
+
+	snd_jack_report(vjack->jack, vjack->connected ? vjack->type : 0);
+}
-- 
2.30.1


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
