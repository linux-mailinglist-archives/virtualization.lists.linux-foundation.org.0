Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 986021E76D1
	for <lists.virtualization@lfdr.de>; Fri, 29 May 2020 09:37:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4305C87383;
	Fri, 29 May 2020 07:37:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6IZPbsTx_qqx; Fri, 29 May 2020 07:37:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B2A408737E;
	Fri, 29 May 2020 07:37:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90C55C016F;
	Fri, 29 May 2020 07:37:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4677EC016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 07:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2DA468887B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 07:37:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y0G3TMJaIGjD
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 07:37:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 40B7388870
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 07:37:27 +0000 (UTC)
IronPort-SDR: YCVKcy+BQ+8aXQRh39MNwXLVa4l0Tj8PG268Gx9lWQzh92qS0AHYVzpQRnepabtTY76ELZTqdy
 dYqG3RCzE9pA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2020 00:37:26 -0700
IronPort-SDR: HcCYIZYD/Z4CmmflZf6FQUC70P+hV24/JFkV51FSThkviFTiLcVQ44QuNUxtvENiDwXZD0muGY
 s8tcJ0WmV2/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,447,1583222400"; d="scan'208";a="414890362"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO
 ubuntu.ger.corp.intel.com) ([10.252.45.157])
 by orsmga004.jf.intel.com with ESMTP; 29 May 2020 00:37:23 -0700
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: kvm@vger.kernel.org
Subject: [RFC 00/12] Audio DSP VirtIO and vhost drivers
Date: Fri, 29 May 2020 09:37:10 +0200
Message-Id: <20200529073722.8184-1-guennadi.liakhovetski@linux.intel.com>
X-Mailer: git-send-email 2.20.1
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

This patch set is a follow up to "Add a vhost RPMsg API" [1], it is
marked as an RFC because firstly it depends on the RPMsg API series
and secondly it is currently being reviewed on ALSA and SOF mailing
lists, but any early comments from virtualisation developers would be
highly appreciated too!

Thanks
Guennadi

[1] https://mailman.alsa-project.org/pipermail/sound-open-firmware/2020-May/003879.html

Guennadi Liakhovetski (12):
  ASoC: add function parameters to enable forced path pruning
  ASoC: SOF: extract firmware-related operation into a function
  ASoC: SOF: support IPC with immediate response
  ASoC: SOF: add a power status IPC
  ASoC: SOF: add two helper lookup functions
  ASoC: SOF: add an RPMsg VirtIO DSP driver
  ASoC: SOF: use a macro instead of a hard-coded value
  ASoC: SOF: add a vhost driver: sound part
  ASoC: SOF: VirtIO: free guest pipelines upon termination
  vhost: add an SOF Audio DSP driver
  rpmsg: increase buffer size and reduce buffer number
  rpmsg: add a device ID to also bind to the ADSP device

 drivers/rpmsg/virtio_rpmsg_bus.c |    1 +
 drivers/vhost/Kconfig            |   10 +
 drivers/vhost/Makefile           |    3 +
 drivers/vhost/adsp.c             |  618 +++++++++++++++++++
 include/linux/virtio_rpmsg.h     |    4 +-
 include/sound/soc-dpcm.h         |   28 +-
 include/sound/soc-topology.h     |    3 +
 include/sound/sof.h              |    4 +
 include/sound/sof/header.h       |    3 +
 include/sound/sof/rpmsg.h        |  196 ++++++
 include/sound/sof/topology.h     |    9 +-
 include/uapi/linux/vhost.h       |    5 +
 include/uapi/linux/vhost_types.h |    7 +
 include/uapi/linux/virtio_ids.h  |    1 +
 sound/soc/soc-compress.c         |    2 +-
 sound/soc/soc-dapm.c             |    8 +-
 sound/soc/soc-pcm.c              |   98 ++-
 sound/soc/sof/Kconfig            |    7 +
 sound/soc/sof/Makefile           |    2 +
 sound/soc/sof/core.c             |  114 ++--
 sound/soc/sof/ipc.c              |   34 +-
 sound/soc/sof/loader.c           |    4 +
 sound/soc/sof/ops.h              |   10 +-
 sound/soc/sof/pcm.c              |   13 +-
 sound/soc/sof/pm.c               |    6 +-
 sound/soc/sof/rpmsg-vfe.c        |  881 ++++++++++++++++++++++++++
 sound/soc/sof/sof-audio.c        |   33 +
 sound/soc/sof/sof-audio.h        |   21 +
 sound/soc/sof/sof-priv.h         |   48 ++
 sound/soc/sof/topology.c         |   71 ++-
 sound/soc/sof/vhost-vbe.c        | 1258 ++++++++++++++++++++++++++++++++++++++
 31 files changed, 3391 insertions(+), 111 deletions(-)
 create mode 100644 drivers/vhost/adsp.c
 create mode 100644 include/sound/sof/rpmsg.h
 create mode 100644 sound/soc/sof/rpmsg-vfe.c
 create mode 100644 sound/soc/sof/vhost-vbe.c

-- 
1.9.3

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
