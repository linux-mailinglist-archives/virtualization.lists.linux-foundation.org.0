Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 916C21E4CBB
	for <lists.virtualization@lfdr.de>; Wed, 27 May 2020 20:05:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 10F7B204AD;
	Wed, 27 May 2020 18:05:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kB7j3axJK7U6; Wed, 27 May 2020 18:05:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 23A9E24D71;
	Wed, 27 May 2020 18:05:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CE25FC016F;
	Wed, 27 May 2020 18:05:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D3EE6C016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 May 2020 18:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B680D87E35
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 May 2020 18:05:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Y+wDsId0RC6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 May 2020 18:05:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4FC2F87E2B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 May 2020 18:05:48 +0000 (UTC)
IronPort-SDR: 6CYDC0SNuQePK4D55ylxOYjLTEPfOuIe3S1cMh7QVIdJfm1OqzxzzBBhu6OZdwxjWsaXQ3v+IZ
 Mab7Zgk2gPpQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2020 11:05:48 -0700
IronPort-SDR: 4UsyZtFFCxi4B9q9Mkk3x08+aT/JYRBr7ju1ejj11/RmcPfyoVUItqp2IjQ2aW/2E4hOlqG/Ni
 z67gX2OVkpXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,442,1583222400"; d="scan'208";a="270553297"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO
 ubuntu.ger.corp.intel.com) ([10.252.42.249])
 by orsmga006.jf.intel.com with ESMTP; 27 May 2020 11:05:45 -0700
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: kvm@vger.kernel.org
Subject: [PATCH v3 1/5] vhost: convert VHOST_VSOCK_SET_RUNNING to a generic
 ioctl
Date: Wed, 27 May 2020 20:05:37 +0200
Message-Id: <20200527180541.5570-2-guennadi.liakhovetski@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200527180541.5570-1-guennadi.liakhovetski@linux.intel.com>
References: <20200527180541.5570-1-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-remoteproc@vger.kernel.org,
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
index 9fe72e4..b54af9d 100644
--- a/include/uapi/linux/vhost.h
+++ b/include/uapi/linux/vhost.h
@@ -93,6 +93,8 @@
 #define VHOST_SET_BACKEND_FEATURES _IOW(VHOST_VIRTIO, 0x25, __u64)
 #define VHOST_GET_BACKEND_FEATURES _IOR(VHOST_VIRTIO, 0x26, __u64)
 
+#define VHOST_SET_RUNNING _IOW(VHOST_VIRTIO, 0x61, int)
+
 /* VHOST_NET specific defines */
 
 /* Attach virtio net ring to a raw socket, or tap device.
@@ -114,7 +116,7 @@
 /* VHOST_VSOCK specific defines */
 
 #define VHOST_VSOCK_SET_GUEST_CID	_IOW(VHOST_VIRTIO, 0x60, __u64)
-#define VHOST_VSOCK_SET_RUNNING		_IOW(VHOST_VIRTIO, 0x61, int)
+#define VHOST_VSOCK_SET_RUNNING		VHOST_SET_RUNNING
 
 /* VHOST_VDPA specific defines */
 
-- 
1.9.3

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
