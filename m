Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A89901E4CBC
	for <lists.virtualization@lfdr.de>; Wed, 27 May 2020 20:05:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 45F0C20503;
	Wed, 27 May 2020 18:05:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pq9uu4iL9+8o; Wed, 27 May 2020 18:05:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4E29724E36;
	Wed, 27 May 2020 18:05:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2B59BC0891;
	Wed, 27 May 2020 18:05:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EDDEAC088D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 May 2020 18:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D3A2687E35
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 May 2020 18:05:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BPhTx5yGLejS
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 May 2020 18:05:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3E54B87D9E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 May 2020 18:05:51 +0000 (UTC)
IronPort-SDR: wIfREilL7vRjJOPO712X2w2jX+a6c9KjpKjD1/JconWjGFM8TezfLJySrk3N3n9lhT4AaodxUw
 ReEYmZe+oBgQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2020 11:05:50 -0700
IronPort-SDR: Wk9f826CT694njIGCz0rU9NA7TecnTRkUKJvPVo4JiD55VnSwCqLjlIxypZzjUe1XVVfAk3DMu
 1EvTULowg/JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,442,1583222400"; d="scan'208";a="270553305"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO
 ubuntu.ger.corp.intel.com) ([10.252.42.249])
 by orsmga006.jf.intel.com with ESMTP; 27 May 2020 11:05:48 -0700
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: kvm@vger.kernel.org
Subject: [PATCH v3 2/5] vhost: (cosmetic) remove a superfluous variable
 initialisation
Date: Wed, 27 May 2020 20:05:38 +0200
Message-Id: <20200527180541.5570-3-guennadi.liakhovetski@linux.intel.com>
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

Even the compiler is able to figure out that in this case the
initialisation is superfluous.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 drivers/vhost/vhost.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index 2f4383bb..2b9ad8a 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -895,7 +895,7 @@ static inline void __user *__vhost_get_user(struct vhost_virtqueue *vq,
 
 #define vhost_put_user(vq, x, ptr)		\
 ({ \
-	int ret = -EFAULT; \
+	int ret; \
 	if (!vq->iotlb) { \
 		ret = __put_user(x, ptr); \
 	} else { \
-- 
1.9.3

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
