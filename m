Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D01832DEBE0
	for <lists.virtualization@lfdr.de>; Sat, 19 Dec 2020 00:18:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5328C87C5B;
	Fri, 18 Dec 2020 23:18:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 06yX+ruuDBxL; Fri, 18 Dec 2020 23:18:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 97E2F87C5F;
	Fri, 18 Dec 2020 23:18:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 62F8BC0893;
	Fri, 18 Dec 2020 23:18:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30CA2C0893
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Dec 2020 23:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1E9A687C5B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Dec 2020 23:18:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bH-kn5dISq5p
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Dec 2020 23:18:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from plasma4.jpberlin.de (plasma4.jpberlin.de [80.241.57.33])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 91C2587C5A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Dec 2020 23:18:09 +0000 (UTC)
Received: from spamfilter05.heinlein-hosting.de
 (spamfilter05.heinlein-hosting.de [80.241.56.123])
 by plasma.jpberlin.de (Postfix) with ESMTP id ABD19AAB1A;
 Sat, 19 Dec 2020 00:18:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from plasma.jpberlin.de ([80.241.56.68])
 by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de
 [80.241.56.123]) (amavisd-new, port 10030)
 with ESMTP id 52UN0snNzPPf; Sat, 19 Dec 2020 00:18:04 +0100 (CET)
Received: from webmail.opensynergy.com (unknown [217.66.60.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client CN "*.opensynergy.com",
 Issuer "Starfield Secure Certificate Authority - G2" (not verified))
 (Authenticated sender: opensynergy@jpberlin.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id 526F4AA8E3;
 Sat, 19 Dec 2020 00:18:04 +0100 (CET)
From: Vasyl Vavrychuk <vasyl.vavrychuk@opensynergy.com>
To: <virtualization@lists.linux-foundation.org>,
 <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.or>
Subject: [PATCH v3] virtio-input: add multi-touch support
Date: Sat, 19 Dec 2020 01:17:51 +0200
Message-ID: <20201218231751.27420-1-vasyl.vavrychuk@opensynergy.com>
MIME-Version: 1.0
X-ClientProxiedBy: SR-MAIL-02.open-synergy.com (10.26.10.22) To
 SR-MAIL-01.open-synergy.com (10.26.10.21)
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -3.49 / 15.00 / 15.00
X-Rspamd-Queue-Id: ABD19AAB1A
X-Rspamd-UID: 7f919c
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Henrik Rydberg <rydberg@bitmath.org>,
 Vasyl Vavrychuk <vasyl.vavrychuk@opensynergy.com>,
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

Implementation is based on uinput_create_device.

Signed-off-by: Mathias Crombez <mathias.crombez@faurecia.com>
Co-developed-by: Vasyl Vavrychuk <vasyl.vavrychuk@opensynergy.com>
Signed-off-by: Vasyl Vavrychuk <vasyl.vavrychuk@opensynergy.com>
---
v2: fix patch corrupted by corporate email server
v3: use number of slots from the host

 drivers/virtio/virtio_input.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_input.c b/drivers/virtio/virtio_input.c
index f1f6208edcf5..f643536807dd 100644
--- a/drivers/virtio/virtio_input.c
+++ b/drivers/virtio/virtio_input.c
@@ -7,6 +7,7 @@
 
 #include <uapi/linux/virtio_ids.h>
 #include <uapi/linux/virtio_input.h>
+#include <linux/input/mt.h>
 
 struct virtio_input {
 	struct virtio_device       *vdev;
@@ -204,7 +205,7 @@ static int virtinput_probe(struct virtio_device *vdev)
 	struct virtio_input *vi;
 	unsigned long flags;
 	size_t size;
-	int abs, err;
+	int abs, err, nslots;
 
 	if (!virtio_has_feature(vdev, VIRTIO_F_VERSION_1))
 		return -ENODEV;
@@ -289,6 +290,13 @@ static int virtinput_probe(struct virtio_device *vdev)
 				continue;
 			virtinput_cfg_abs(vi, abs);
 		}
+
+		if (test_bit(ABS_MT_SLOT, vi->idev->absbit)) {
+			nslots = input_abs_get_max(vi->idev, ABS_MT_SLOT) + 1;
+			err = input_mt_init_slots(vi->idev, nslots, 0);
+			if (err)
+				goto err_mt_init_slots;
+		}
 	}
 
 	virtio_device_ready(vdev);
@@ -304,6 +312,7 @@ static int virtinput_probe(struct virtio_device *vdev)
 	spin_lock_irqsave(&vi->lock, flags);
 	vi->ready = false;
 	spin_unlock_irqrestore(&vi->lock, flags);
+err_mt_init_slots:
 	input_free_device(vi->idev);
 err_input_alloc:
 	vdev->config->del_vqs(vdev);
-- 
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
