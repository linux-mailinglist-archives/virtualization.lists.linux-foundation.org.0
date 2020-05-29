Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 205041E76D4
	for <lists.virtualization@lfdr.de>; Fri, 29 May 2020 09:37:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A5EE3892AA;
	Fri, 29 May 2020 07:37:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Z9Evaq0PE1L; Fri, 29 May 2020 07:37:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 37C4F892A5;
	Fri, 29 May 2020 07:37:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 149BDC016F;
	Fri, 29 May 2020 07:37:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5FA33C016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 07:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5CCB4888C4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 07:37:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lbHwi+Glegoc
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 07:37:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CD1E888880
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 07:37:32 +0000 (UTC)
IronPort-SDR: opgZJVh3hKWy3v/ConudGUQZVN/Q7mw7Ipbh2nTLzJ/tTIIwFlGSueDuppxqrtcmbVZoq4dlg8
 oxq6/j2FS87A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2020 00:37:32 -0700
IronPort-SDR: Yk5hmbix2fMfxV3erm00Pbe4bMGr30WTlAv0mbchHXijwBPUBPT7QG7/jIlqw+cfi+PqXZXl6D
 AzJj4ueYlqyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,447,1583222400"; d="scan'208";a="414890374"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO
 ubuntu.ger.corp.intel.com) ([10.252.45.157])
 by orsmga004.jf.intel.com with ESMTP; 29 May 2020 00:37:30 -0700
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: kvm@vger.kernel.org
Subject: [RFC 02/12] ASoC: SOF: extract firmware-related operation into a
 function
Date: Fri, 29 May 2020 09:37:12 +0200
Message-Id: <20200529073722.8184-3-guennadi.liakhovetski@linux.intel.com>
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

In the VirtIO guest case the SOF will not be dealing with the
firmware directly. Extract related functionality into a function to
make the separation easier.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/soc/sof/core.c | 85 ++++++++++++++++++++++++++++++----------------------
 1 file changed, 49 insertions(+), 36 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 339c493..17f264f 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -135,6 +135,53 @@ void snd_sof_get_status(struct snd_sof_dev *sdev, u32 panic_code,
  *	(System Suspend/Runtime Suspend)
  */
 
+static int sof_load_and_run_firmware(struct snd_sof_dev *sdev)
+{
+	/* load the firmware */
+	int ret = snd_sof_load_firmware(sdev);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: failed to load DSP firmware %d\n",
+			ret);
+		return ret;
+	}
+
+	sdev->fw_state = SOF_FW_BOOT_IN_PROGRESS;
+
+	/*
+	 * Boot the firmware. The FW boot status will be modified
+	 * in snd_sof_run_firmware() depending on the outcome.
+	 */
+	ret = snd_sof_run_firmware(sdev);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: failed to boot DSP firmware %d\n",
+			ret);
+		goto fw_run_err;
+	}
+
+	if (IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_ENABLE_FIRMWARE_TRACE) ||
+	    (sof_core_debug & SOF_DBG_ENABLE_TRACE)) {
+		sdev->dtrace_is_supported = true;
+
+		/* init DMA trace */
+		ret = snd_sof_init_trace(sdev);
+		if (ret < 0) {
+			/* non fatal */
+			dev_warn(sdev->dev,
+				 "warning: failed to initialize trace %d\n",
+				 ret);
+		}
+	} else {
+		dev_dbg(sdev->dev, "SOF firmware trace disabled\n");
+	}
+
+	return 0;
+
+fw_run_err:
+	snd_sof_fw_unload(sdev);
+
+	return ret;
+}
+
 static int sof_probe_continue(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_pdata *plat_data = sdev->pdata;
@@ -181,42 +228,9 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 		goto ipc_err;
 	}
 
-	/* load the firmware */
-	ret = snd_sof_load_firmware(sdev);
-	if (ret < 0) {
-		dev_err(sdev->dev, "error: failed to load DSP firmware %d\n",
-			ret);
+	ret = sof_load_and_run_firmware(sdev);
+	if (ret < 0)
 		goto fw_load_err;
-	}
-
-	sdev->fw_state = SOF_FW_BOOT_IN_PROGRESS;
-
-	/*
-	 * Boot the firmware. The FW boot status will be modified
-	 * in snd_sof_run_firmware() depending on the outcome.
-	 */
-	ret = snd_sof_run_firmware(sdev);
-	if (ret < 0) {
-		dev_err(sdev->dev, "error: failed to boot DSP firmware %d\n",
-			ret);
-		goto fw_run_err;
-	}
-
-	if (IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_ENABLE_FIRMWARE_TRACE) ||
-	    (sof_core_debug & SOF_DBG_ENABLE_TRACE)) {
-		sdev->dtrace_is_supported = true;
-
-		/* init DMA trace */
-		ret = snd_sof_init_trace(sdev);
-		if (ret < 0) {
-			/* non fatal */
-			dev_warn(sdev->dev,
-				 "warning: failed to initialize trace %d\n",
-				 ret);
-		}
-	} else {
-		dev_dbg(sdev->dev, "SOF firmware trace disabled\n");
-	}
 
 	/* hereafter all FW boot flows are for PM reasons */
 	sdev->first_boot = false;
@@ -250,7 +264,6 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 
 fw_trace_err:
 	snd_sof_free_trace(sdev);
-fw_run_err:
 	snd_sof_fw_unload(sdev);
 fw_load_err:
 	snd_sof_ipc_free(sdev);
-- 
1.9.3

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
