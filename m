Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C11761D604E
	for <lists.virtualization@lfdr.de>; Sat, 16 May 2020 12:11:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6F90D87515;
	Sat, 16 May 2020 10:11:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VHoRSQXVmOnC; Sat, 16 May 2020 10:11:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0006F8763D;
	Sat, 16 May 2020 10:11:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DB2F5C0865;
	Sat, 16 May 2020 10:11:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D06A4C016F
 for <virtualization@lists.linux-foundation.org>;
 Sat, 16 May 2020 10:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BCCEC870B6
 for <virtualization@lists.linux-foundation.org>;
 Sat, 16 May 2020 10:11:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HwRVPRn7CCmC
 for <virtualization@lists.linux-foundation.org>;
 Sat, 16 May 2020 10:11:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5475D87515
 for <virtualization@lists.linux-foundation.org>;
 Sat, 16 May 2020 10:11:23 +0000 (UTC)
IronPort-SDR: oKZrVHhn9AJFVSlHccR0KeuAm7iGS/NsJDDuRdr3ImvC4Ib5U/A8SYatJLx3aOqjCeSCJ52eC+
 pJt7Ofjo2ksQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2020 03:11:23 -0700
IronPort-SDR: TNk+UMuSMDVjjh2YitQdFTVG7AgpGoifVcsx496qPMiJmSgfztrHYq0d/ZSgY6Q33aAfFWfSas
 QZbPuban1IGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,398,1583222400"; d="scan'208";a="281484351"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO
 ubuntu.ger.corp.intel.com) ([10.249.40.45])
 by orsmga002.jf.intel.com with ESMTP; 16 May 2020 03:11:21 -0700
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: kvm@vger.kernel.org
Subject: [PATCH 6/6] rpmsg: add a device ID to also bind to the ADSP device
Date: Sat, 16 May 2020 12:11:09 +0200
Message-Id: <20200516101109.2624-7-guennadi.liakhovetski@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200516101109.2624-1-guennadi.liakhovetski@linux.intel.com>
References: <20200516101109.2624-1-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 sound-open-firmware@alsa-project.org, linux-remoteproc@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 virtualization@lists.linux-foundation.org
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

The ADSP device uses the RPMsg API to connect vhost and VirtIO SOF
Audio DSP drivers on KVM host and guest.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index f3bd050..ebe3f19 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -949,6 +949,7 @@ static void rpmsg_remove(struct virtio_device *vdev)
 
 static struct virtio_device_id id_table[] = {
 	{ VIRTIO_ID_RPMSG, VIRTIO_DEV_ANY_ID },
+	{ VIRTIO_ID_ADSP, VIRTIO_DEV_ANY_ID },
 	{ 0 },
 };
 
-- 
1.9.3

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
