Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0131E76E1
	for <lists.virtualization@lfdr.de>; Fri, 29 May 2020 09:38:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 102B0873CE;
	Fri, 29 May 2020 07:38:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gm6mVJbnRbWS; Fri, 29 May 2020 07:38:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0D8B2873E5;
	Fri, 29 May 2020 07:38:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E277DC016F;
	Fri, 29 May 2020 07:38:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12D92C07FF
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 07:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0BA0388880
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 07:38:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OeztuuAWNZ-e
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 07:38:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 81BA8892B0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 07:38:03 +0000 (UTC)
IronPort-SDR: ye7jx1U3/HFDSw5xQ5vJ0uqLesXZBgdT2DJNv/e4BgpG4iB1oLJhIfJZUluV0mUoRf+srtC/pm
 H9xRqVVI+U6A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2020 00:38:03 -0700
IronPort-SDR: kVIyTg3lFV2z1o+iG4DUP5XoMcQRVi5pCnOOquBizTUL1VmJzyuc4CV7dghqQb9iKdG0JagS4R
 AOmKai9QDekA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,447,1583222400"; d="scan'208";a="414890460"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO
 ubuntu.ger.corp.intel.com) ([10.252.45.157])
 by orsmga004.jf.intel.com with ESMTP; 29 May 2020 00:38:00 -0700
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: kvm@vger.kernel.org
Subject: [RFC 11/12] rpmsg: increase buffer size and reduce buffer number
Date: Fri, 29 May 2020 09:37:21 +0200
Message-Id: <20200529073722.8184-12-guennadi.liakhovetski@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200529073722.8184-1-guennadi.liakhovetski@linux.intel.com>
References: <20200529073722.8184-1-guennadi.liakhovetski@linux.intel.com>
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

It is hard to imagine use-cases where 512 buffers would really be
needed, whereas 512 bytes per buffer might be too little. Change this
to use 16 16KiB buffers instead.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 include/linux/virtio_rpmsg.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/virtio_rpmsg.h b/include/linux/virtio_rpmsg.h
index 679be8b..1add468 100644
--- a/include/linux/virtio_rpmsg.h
+++ b/include/linux/virtio_rpmsg.h
@@ -72,8 +72,8 @@ enum rpmsg_ns_flags {
  * can change this without changing anything in the firmware of the remote
  * processor.
  */
-#define MAX_RPMSG_NUM_BUFS	512
-#define MAX_RPMSG_BUF_SIZE	512
+#define MAX_RPMSG_NUM_BUFS	(512 / 32)
+#define MAX_RPMSG_BUF_SIZE	(512 * 32)
 
 /* Address 53 is reserved for advertising remote services */
 #define RPMSG_NS_ADDR		53
-- 
1.9.3

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
