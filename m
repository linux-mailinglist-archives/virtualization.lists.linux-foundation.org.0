Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAF12D34D2
	for <lists.virtualization@lfdr.de>; Tue,  8 Dec 2020 22:08:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EE60086BC4;
	Tue,  8 Dec 2020 21:08:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G8sc79ZPhLdy; Tue,  8 Dec 2020 21:08:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2FE6686BC9;
	Tue,  8 Dec 2020 21:08:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05223C013B;
	Tue,  8 Dec 2020 21:08:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7C929C013B
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Dec 2020 21:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6A898275C6
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Dec 2020 21:08:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RvEMVrlz7rge
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Dec 2020 21:08:13 +0000 (UTC)
X-Greylist: delayed 00:06:03 by SQLgrey-1.7.6
Received: from plasma33.jpberlin.de (plasma33.jpberlin.de [80.241.58.43])
 by silver.osuosl.org (Postfix) with ESMTPS id A31D7275B0
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Dec 2020 21:08:12 +0000 (UTC)
Received: from spamfilter05.heinlein-hosting.de
 (spamfilter05.heinlein-hosting.de [80.241.56.123])
 by plasma.jpberlin.de (Postfix) with ESMTP id 72A57105564;
 Tue,  8 Dec 2020 22:02:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from plasma.jpberlin.de ([80.241.56.76])
 by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de
 [80.241.56.123]) (amavisd-new, port 10030)
 with ESMTP id szCGRUWyRsVe; Tue,  8 Dec 2020 22:02:01 +0100 (CET)
Received: from webmail.opensynergy.com (unknown [217.66.60.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client CN "*.opensynergy.com",
 Issuer "Starfield Secure Certificate Authority - G2" (not verified))
 (Authenticated sender: opensynergy@jpberlin.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id EB3C11054DC;
 Tue,  8 Dec 2020 22:02:00 +0100 (CET)
From: Vasyl Vavrychuk <vasyl.vavrychuk@opensynergy.com>
To: <virtualization@lists.linux-foundation.org>,
 <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: [PATCH RESEND v2] virtio-input: add multi-touch support
Date: Tue, 8 Dec 2020 23:01:50 +0200
Message-ID: <20201208210150.20001-1-vasyl.vavrychuk@opensynergy.com>
MIME-Version: 1.0
X-ClientProxiedBy: SR-MAIL-01.open-synergy.com (10.26.10.21) To
 SR-MAIL-01.open-synergy.com (10.26.10.21)
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -5.38 / 15.00 / 15.00
X-Rspamd-Queue-Id: 72A57105564
X-Rspamd-UID: d20710
Cc: Vasyl Vavrychuk <vasyl.vavrychuk@opensynergy.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Henrik Rydberg <rydberg@bitmath.org>,
 Mathias Crombez <mathias.crombez@faurecia.com>
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

From: Mathias Crombez <mathias.crombez@faurecia.com>

Without multi-touch slots allocated, ABS_MT_SLOT events will be lost by
input_handle_abs_event.

Signed-off-by: Mathias Crombez <mathias.crombez@faurecia.com>
Signed-off-by: Vasyl Vavrychuk <vasyl.vavrychuk@opensynergy.com>
Tested-by: Vasyl Vavrychuk <vasyl.vavrychuk@opensynergy.com>
---
v2: fix patch corrupted by corporate email server

 drivers/virtio/Kconfig        | 11 +++++++++++
 drivers/virtio/virtio_input.c |  8 ++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
index 7b41130d3f35..2cfd5b01d96d 100644
--- a/drivers/virtio/Kconfig
+++ b/drivers/virtio/Kconfig
@@ -111,6 +111,17 @@ config VIRTIO_INPUT
 
 	 If unsure, say M.
 
+config VIRTIO_INPUT_MULTITOUCH_SLOTS
+	depends on VIRTIO_INPUT
+	int "Number of multitouch slots"
+	range 0 64
+	default 10
+	help
+	 Define the number of multitouch slots used. Default to 10.
+	 This parameter is unused if there is no multitouch capability.
+
+	 0 will disable the feature.
+
 config VIRTIO_MMIO
 	tristate "Platform bus driver for memory mapped virtio devices"
 	depends on HAS_IOMEM && HAS_DMA
diff --git a/drivers/virtio/virtio_input.c b/drivers/virtio/virtio_input.c
index f1f6208edcf5..13f3d90e6c30 100644
--- a/drivers/virtio/virtio_input.c
+++ b/drivers/virtio/virtio_input.c
@@ -7,6 +7,7 @@
 
 #include <uapi/linux/virtio_ids.h>
 #include <uapi/linux/virtio_input.h>
+#include <linux/input/mt.h>
 
 struct virtio_input {
 	struct virtio_device       *vdev;
@@ -205,6 +206,7 @@ static int virtinput_probe(struct virtio_device *vdev)
 	unsigned long flags;
 	size_t size;
 	int abs, err;
+	bool is_mt = false;
 
 	if (!virtio_has_feature(vdev, VIRTIO_F_VERSION_1))
 		return -ENODEV;
@@ -287,9 +289,15 @@ static int virtinput_probe(struct virtio_device *vdev)
 		for (abs = 0; abs < ABS_CNT; abs++) {
 			if (!test_bit(abs, vi->idev->absbit))
 				continue;
+			if (input_is_mt_value(abs))
+				is_mt = true;
 			virtinput_cfg_abs(vi, abs);
 		}
 	}
+	if (is_mt)
+		input_mt_init_slots(vi->idev,
+				    CONFIG_VIRTIO_INPUT_MULTITOUCH_SLOTS,
+				    INPUT_MT_DIRECT);
 
 	virtio_device_ready(vdev);
 	vi->ready = true;
-- 
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
