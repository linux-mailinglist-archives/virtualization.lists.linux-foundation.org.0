Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1CF1E3D6B
	for <lists.virtualization@lfdr.de>; Wed, 27 May 2020 11:17:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3556086BC4;
	Wed, 27 May 2020 09:17:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1GMuk4V8i-3S; Wed, 27 May 2020 09:17:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CC5CF86BE1;
	Wed, 27 May 2020 09:17:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A5A0BC016F;
	Wed, 27 May 2020 09:17:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DA182C016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 May 2020 09:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C8DD086BC9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 May 2020 09:17:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kd0QiifriAJU
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 May 2020 09:17:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5424886BC4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 May 2020 09:17:47 +0000 (UTC)
IronPort-SDR: y6m9lMHPZiHE2fvCGjexuMfE9K9evtg9rKWGGzmmNW/MQc/mcB0ZXXxwXSVUb7TG85R9P66yPE
 o8/h3UK+IuBw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2020 02:17:46 -0700
IronPort-SDR: 40oXLoq2PILk5e50dpXaB6hUneU0F+HlXUvD3DxEWqiiKhfzcf7eE1X1PvDXbUadDuvii9iRTR
 PYV49oHaa5nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,440,1583222400"; d="scan'208";a="414138598"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 27 May 2020 02:17:44 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jdsBz-000Bjv-75; Wed, 27 May 2020 17:17:43 +0800
Date: Wed, 27 May 2020 17:16:46 +0800
From: kbuild test robot <lkp@intel.com>
To: Zhu Lingshan <lingshan.zhu@intel.com>, mst@redhat.com,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, jasowang@redhat.com
Subject: [RFC PATCH] vdpa: vhost_vdpa_poll_stop() can be static
Message-ID: <20200527091646.GA80910@369e1fe990b8>
References: <1590471145-4436-1-git-send-email-lingshan.zhu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1590471145-4436-1-git-send-email-lingshan.zhu@intel.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Zhu Lingshan <lingshan.zhu@intel.com>, kbuild-all@lists.01.org,
 lulu@redhat.com
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


Signed-off-by: kbuild test robot <lkp@intel.com>
---
 vdpa.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
index d3a2acafedecd4..5037ce7f48cd42 100644
--- a/drivers/vhost/vdpa.c
+++ b/drivers/vhost/vdpa.c
@@ -287,12 +287,12 @@ static long vhost_vdpa_get_vring_num(struct vhost_vdpa *v, u16 __user *argp)
 
 	return 0;
 }
-void vhost_vdpa_poll_stop(struct vhost_virtqueue *vq)
+static void vhost_vdpa_poll_stop(struct vhost_virtqueue *vq)
 {
 	vhost_poll_stop(&vq->poll);
 }
 
-int vhost_vdpa_poll_start(struct vhost_virtqueue *vq)
+static int vhost_vdpa_poll_start(struct vhost_virtqueue *vq)
 {
 	struct vhost_poll *poll = &vq->poll;
 	struct file *file = vq->kick;
@@ -747,7 +747,7 @@ static int vhost_vdpa_poll_worker(wait_queue_entry_t *wait, unsigned int mode,
 	return 0;
 }
 
-void vhost_vdpa_poll_init(struct vhost_dev *dev)
+static void vhost_vdpa_poll_init(struct vhost_dev *dev)
 {
 	struct vhost_virtqueue *vq;
 	struct vhost_poll *poll;
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
