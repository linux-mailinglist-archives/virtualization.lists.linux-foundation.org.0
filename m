Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E43E1E10DF
	for <lists.virtualization@lfdr.de>; Mon, 25 May 2020 16:45:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3C98486819;
	Mon, 25 May 2020 14:45:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tlxWnKMRkjaF; Mon, 25 May 2020 14:45:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A4E0886A14;
	Mon, 25 May 2020 14:45:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70CA5C016F;
	Mon, 25 May 2020 14:45:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B3977C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 May 2020 14:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9DD6E21F5A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 May 2020 14:45:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CIz5ukBOWiWy
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 May 2020 14:45:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by silver.osuosl.org (Postfix) with ESMTPS id 699712052B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 May 2020 14:45:03 +0000 (UTC)
IronPort-SDR: xCnzHkhSOBoJ1UBD+LSu6bkiu2DsfOTCQgTkkXiQ3KP/woopkZoa8XNRsjqRPj+1HUk3uqJopk
 vxhXXWLwU7rg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2020 07:45:02 -0700
IronPort-SDR: yV9Ov9Gz0kuWU9Db5dVuhIzcw6jQcENaX56MOivfEnDBMq2FTcuyEcc8IgmIL0CDheHN5rBXhg
 666GxjYJsifQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,433,1583222400"; d="scan'208";a="266165815"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO
 ubuntu.ger.corp.intel.com) ([10.249.41.109])
 by orsmga003.jf.intel.com with ESMTP; 25 May 2020 07:44:59 -0700
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: kvm@vger.kernel.org
Subject: [PATCH v2 0/5] Add a vhost RPMsg API
Date: Mon, 25 May 2020 16:44:53 +0200
Message-Id: <20200525144458.8413-1-guennadi.liakhovetski@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Ohad Ben-Cohen <ohad@wizery.com>, "Michael S. Tsirkin" <mst@redhat.com>,
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

v2:
- remove "default n" from Kconfig
- drop patch #6 - it depends on a different patch, that is currently 
  an RFC
- update patch #5 with a correct vhost_dev_init() prototype

Linux supports RPMsg over VirtIO for "remote processor" /AMP use
cases. It can however also be used for virtualisation scenarios,
e.g. when using KVM to run Linux on both the host and the guests.
This patch set adds a wrapper API to facilitate writing vhost
drivers for such RPMsg-based solutions. The first use case is an
audio DSP virtualisation project, currently under development, ready
for review and submission, available at
https://github.com/thesofproject/linux/pull/1501/commits
A further patch for the ADSP vhost RPMsg driver will be sent
separately for review only since it cannot be merged without audio
patches being upstreamed first.

Thanks
Guennadi

Guennadi Liakhovetski (5):
  vhost: convert VHOST_VSOCK_SET_RUNNING to a generic ioctl
  vhost: (cosmetic) remove a superfluous variable initialisation
  rpmsg: move common structures and defines to headers
  rpmsg: update documentation
  vhost: add an rpmsg API

 Documentation/rpmsg.txt          |   2 +-
 drivers/rpmsg/virtio_rpmsg_bus.c |  78 +-------
 drivers/vhost/Kconfig            |   7 +
 drivers/vhost/Makefile           |   3 +
 drivers/vhost/rpmsg.c            | 372 +++++++++++++++++++++++++++++++++++++++
 drivers/vhost/vhost.c            |   2 +-
 drivers/vhost/vhost_rpmsg.h      |  74 ++++++++
 include/linux/virtio_rpmsg.h     |  81 +++++++++
 include/uapi/linux/rpmsg.h       |   3 +
 include/uapi/linux/vhost.h       |   4 +-
 10 files changed, 547 insertions(+), 79 deletions(-)
 create mode 100644 drivers/vhost/rpmsg.c
 create mode 100644 drivers/vhost/vhost_rpmsg.h
 create mode 100644 include/linux/virtio_rpmsg.h

-- 
1.9.3

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
