Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E351E76D6
	for <lists.virtualization@lfdr.de>; Fri, 29 May 2020 09:37:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2841C25D07;
	Fri, 29 May 2020 07:37:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wcTQB66gL3oX; Fri, 29 May 2020 07:37:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A812A25CF1;
	Fri, 29 May 2020 07:37:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B73AC016F;
	Fri, 29 May 2020 07:37:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9820BC016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 07:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7F0B588880
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 07:37:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hv5cN0wtCLDL
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 07:37:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DF8CA892A2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 07:37:35 +0000 (UTC)
IronPort-SDR: tNiZDN+rtUvymsnUETOdRG33P9tuvMTexQ4Vn2lRheE6gLUWLa1QwOg6AKjxBL6iwPaWmWX61P
 1+2j2UKry4yw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2020 00:37:35 -0700
IronPort-SDR: yXU9IEbkDS3OKReBnCVaMacKdpVei8yJmMxJchZU+cm7nXCudLiumOhf87YDkyAZlS0CzKy9ap
 1EKa7eGXNeRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,447,1583222400"; d="scan'208";a="414890383"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO
 ubuntu.ger.corp.intel.com) ([10.252.45.157])
 by orsmga004.jf.intel.com with ESMTP; 29 May 2020 00:37:32 -0700
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: kvm@vger.kernel.org
Subject: [RFC 03/12] ASoC: SOF: support IPC with immediate response
Date: Fri, 29 May 2020 09:37:13 +0200
Message-Id: <20200529073722.8184-4-guennadi.liakhovetski@linux.intel.com>
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

Usually when an IPC message is sent, we have to wait for a reply from
the DSP or from the host in the VirtIO case. However, sometimes in
the VirtIO case a response is available immediately. Skip sleeping in
such cases.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/soc/sof/ipc.c | 11 +++++++----
 sound/soc/sof/ops.h | 10 +++++++++-
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index f7a0353..b3e1587 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -262,6 +262,12 @@ static int sof_ipc_tx_message_unlocked(struct snd_sof_ipc *ipc, u32 header,
 
 	sdev->msg = msg;
 
+	/*
+	 * If snd_sof_dsp_send_msg() returns a positive number it means, that a
+	 * response is already available, no need to sleep waiting for it. In
+	 * such a case msg->ipc_complete will stay true and tx_wait_done() will
+	 * return immediately.
+	 */
 	ret = snd_sof_dsp_send_msg(sdev, msg);
 	/* Next reply that we receive will be related to this message */
 	if (!ret)
@@ -279,10 +285,7 @@ static int sof_ipc_tx_message_unlocked(struct snd_sof_ipc *ipc, u32 header,
 	ipc_log_header(sdev->dev, "ipc tx", msg->header);
 
 	/* now wait for completion */
-	if (!ret)
-		ret = tx_wait_done(ipc, msg, reply_data);
-
-	return ret;
+	return tx_wait_done(ipc, msg, reply_data);
 }
 
 /* send IPC message from host to DSP */
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index b21632f..bf91467 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -274,7 +274,15 @@ static inline void snd_sof_dsp_block_write(struct snd_sof_dev *sdev, u32 bar,
 	sof_ops(sdev)->block_write(sdev, bar, offset, src, bytes);
 }
 
-/* ipc */
+/**
+ * snd_sof_dsp_send_msg - call sdev ops to send a message
+ * @sdev:	sdev context
+ * @msg:	message to send
+ *
+ * Returns	< 0 - an error code
+ *		  0 - the message has been sent, wait for a reply
+ *		> 0 - the message has been sent, a reply is already available
+ */
 static inline int snd_sof_dsp_send_msg(struct snd_sof_dev *sdev,
 				       struct snd_sof_ipc_msg *msg)
 {
-- 
1.9.3

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
