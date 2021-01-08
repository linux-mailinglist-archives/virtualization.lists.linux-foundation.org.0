Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A342EEBEC
	for <lists.virtualization@lfdr.de>; Fri,  8 Jan 2021 04:41:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 904E220442;
	Fri,  8 Jan 2021 03:41:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TlqHeKlVAEgS; Fri,  8 Jan 2021 03:41:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 741EC20423;
	Fri,  8 Jan 2021 03:41:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3F9A6C013A;
	Fri,  8 Jan 2021 03:41:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AC019C013A
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 Jan 2021 03:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9225F87455
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 Jan 2021 03:41:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U64DwzbT8uon
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 Jan 2021 03:41:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 008A487452
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 Jan 2021 03:41:37 +0000 (UTC)
IronPort-SDR: 9cZl/mVZ9Ndf2gIDHGwKVtt7TU6BpKpK83pp8oQKN9By62dayHNSuh0kMTrqAWz2PG18nYLvsh
 ztA6s6afPJbw==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="196100128"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; d="scan'208";a="196100128"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2021 19:41:37 -0800
IronPort-SDR: 3Ps9BcQoldNuUzkLTt/ZDENe5nblFF2iLHxdw9VV0drtLwUtEKx4y+6Cw/0Y+5D0/VnWCsoJHO
 X+bk1teW0ZYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; d="scan'208";a="463270096"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.33])
 by fmsmga001.fm.intel.com with ESMTP; 07 Jan 2021 19:41:35 -0800
From: Colin Xu <colin.xu@intel.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH] virtio_input: Prevent EV_MSC/MSC_TIMESTAMP loop storm for MT.
Date: Fri,  8 Jan 2021 11:41:30 +0800
Message-Id: <20210108034130.499055-1-colin.xu@intel.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, mst@redhat.com
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

In 'commit 29cc309d8bf1 ("HID: hid-multitouch: forward MSC_TIMESTAMP")',
EV_MSC/MSC_TIMESTAMP is added to each before EV_SYN event. EV_MSC is
configured as INPUT_PASS_TO_ALL.
In case of a touch device which report MSC_TIMESTAMP:
  BE pass EV_MSC/MSC_TIMESTAMP to FE on receiving event from evdev.
  FE pass EV_MSC/MSC_TIMESTAMP back to BE.
  BE writes EV_MSC/MSC_TIMESTAMP to evdev due to INPUT_PASS_TO_ALL.
  BE receives extra EV_MSC/MSC_TIMESTAMP and pass to FE.
>>> Each new frame becomes larger and larger.

Disable EV_MSC/MSC_TIMESTAMP forwarding for MT.

Signed-off-by: Colin Xu <colin.xu@intel.com>
---
 drivers/virtio/virtio_input.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/virtio/virtio_input.c b/drivers/virtio/virtio_input.c
index f1f6208edcf5..244965c20d9b 100644
--- a/drivers/virtio/virtio_input.c
+++ b/drivers/virtio/virtio_input.c
@@ -64,6 +64,21 @@ static int virtinput_send_status(struct virtio_input *vi,
 	unsigned long flags;
 	int rc;
 
+	/*
+	 * Since 29cc309d8bf1 (HID: hid-multitouch: forward MSC_TIMESTAMP),
+	 * EV_MSC/MSC_TIMESTAMP is added to each before EV_SYN event.
+	 * EV_MSC is configured as INPUT_PASS_TO_ALL.
+	 * In case of touch device:
+	 *   BE pass EV_MSC/MSC_TIMESTAMP to FE on receiving event from evdev.
+	 *   FE pass EV_MSC/MSC_TIMESTAMP back to BE.
+	 *   BE writes EV_MSC/MSC_TIMESTAMP to evdev due to INPUT_PASS_TO_ALL.
+	 *   BE receives extra EV_MSC/MSC_TIMESTAMP and pass to FE.
+	 *   >>> Each new frame becomes larger and larger.
+	 * Disable EV_MSC/MSC_TIMESTAMP forwarding for MT.
+	 */
+	if (vi->idev->mt && type == EV_MSC && code == MSC_TIMESTAMP)
+		return 0;
+
 	stsbuf = kzalloc(sizeof(*stsbuf), GFP_ATOMIC);
 	if (!stsbuf)
 		return -ENOMEM;
-- 
2.30.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
