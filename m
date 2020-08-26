Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E51125361B
	for <lists.virtualization@lfdr.de>; Wed, 26 Aug 2020 19:46:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3ADC620495;
	Wed, 26 Aug 2020 17:46:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YFkqePhkmd2c; Wed, 26 Aug 2020 17:46:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6183A2263C;
	Wed, 26 Aug 2020 17:46:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3F5EAC0051;
	Wed, 26 Aug 2020 17:46:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE099C0051
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Aug 2020 17:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AD06121561
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Aug 2020 17:46:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WSZ6ThAVXTAi
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Aug 2020 17:46:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by silver.osuosl.org (Postfix) with ESMTPS id 1511820495
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Aug 2020 17:46:43 +0000 (UTC)
IronPort-SDR: MdhizS4Ev2529+/j/peGxDccPMa4r+Kar9VmxTLQzHBHVUXOV2L7EQbyqAlzVcF+phVwZaLrEE
 zkDYTaVv1aSA==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="155611332"
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="155611332"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 10:46:42 -0700
IronPort-SDR: BQiKKnOcSRSPaRSBrEFoE26a95LFxpwrXQ9gJa8FIZFHaRtbdK0CxgvUZrY2oa/N2Iva9hB3gv
 ei7yIf9ZPTYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="299553464"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO
 ubuntu.ger.corp.intel.com) ([10.252.54.141])
 by orsmga006.jf.intel.com with ESMTP; 26 Aug 2020 10:46:40 -0700
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: kvm@vger.kernel.org
Subject: [PATCH v5 1/4] vhost: convert VHOST_VSOCK_SET_RUNNING to a generic
 ioctl
Date: Wed, 26 Aug 2020 19:46:33 +0200
Message-Id: <20200826174636.23873-2-guennadi.liakhovetski@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200826174636.23873-1-guennadi.liakhovetski@linux.intel.com>
References: <20200826174636.23873-1-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 linux-remoteproc@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 sound-open-firmware@alsa-project.org
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

VHOST_VSOCK_SET_RUNNING is used by the vhost vsock driver to perform
crucial VirtQueue initialisation, like assigning .private fields and
calling vhost_vq_init_access(), and clean up. However, this ioctl is
actually extremely useful for any vhost driver, that doesn't have a
side channel to inform it of a status change, e.g. upon a guest
reboot. This patch makes that ioctl generic, while preserving its
numeric value and also keeping the original alias.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 include/uapi/linux/vhost.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/vhost.h b/include/uapi/linux/vhost.h
index 75232185324a..11a4948b6216 100644
--- a/include/uapi/linux/vhost.h
+++ b/include/uapi/linux/vhost.h
@@ -97,6 +97,8 @@
 #define VHOST_SET_BACKEND_FEATURES _IOW(VHOST_VIRTIO, 0x25, __u64)
 #define VHOST_GET_BACKEND_FEATURES _IOR(VHOST_VIRTIO, 0x26, __u64)
 
+#define VHOST_SET_RUNNING _IOW(VHOST_VIRTIO, 0x61, int)
+
 /* VHOST_NET specific defines */
 
 /* Attach virtio net ring to a raw socket, or tap device.
@@ -118,7 +120,7 @@
 /* VHOST_VSOCK specific defines */
 
 #define VHOST_VSOCK_SET_GUEST_CID	_IOW(VHOST_VIRTIO, 0x60, __u64)
-#define VHOST_VSOCK_SET_RUNNING		_IOW(VHOST_VIRTIO, 0x61, int)
+#define VHOST_VSOCK_SET_RUNNING		VHOST_SET_RUNNING
 
 /* VHOST_VDPA specific defines */
 
-- 
2.28.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
