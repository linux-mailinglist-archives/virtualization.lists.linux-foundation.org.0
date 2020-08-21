Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A4524D4D2
	for <lists.virtualization@lfdr.de>; Fri, 21 Aug 2020 14:21:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4D9548839A;
	Fri, 21 Aug 2020 12:21:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KBnp14fpYNAL; Fri, 21 Aug 2020 12:21:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AD22388395;
	Fri, 21 Aug 2020 12:21:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7F40EC0051;
	Fri, 21 Aug 2020 12:21:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A4808C0051
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 12:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9F88386B4E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 12:21:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KGf7nSx8_9tQ
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 12:21:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 84B8B86B45
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 12:21:03 +0000 (UTC)
IronPort-SDR: C4UeMshEwB1MLAKx3k0yDFMJM3HDj5l+8m6QN4CxTnA6AFCrvOJV0DF87rhXJ8Kf36qCChl7Cv
 4Q1nufFCrzpg==
X-IronPort-AV: E=McAfee;i="6000,8403,9719"; a="135054863"
X-IronPort-AV: E=Sophos;i="5.76,335,1592895600"; d="scan'208";a="135054863"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2020 05:21:03 -0700
IronPort-SDR: h5ov/Vxs9uCKdSZAfTvh5kcVy0zh4tPuWg5CPQc1T2djfWE0tQ1f8+7RhonZ4e+Rcb9qdhVBr0
 fd7yFeB7O5+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,335,1592895600"; d="scan'208";a="321243630"
Received: from lkp-server01.sh.intel.com (HELO 91ed66e1ca04) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 21 Aug 2020 05:21:00 -0700
Received: from kbuild by 91ed66e1ca04 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1k962W-00010i-0X; Fri, 21 Aug 2020 12:21:00 +0000
Date: Fri, 21 Aug 2020 20:20:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Wang <jasowang@redhat.com>, mst@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH] vdpa_sim: vdpasim_get_iova_range() can be static
Message-ID: <20200821122051.GA60229@ff58d72860ac>
References: <20200821092813.8952-4-jasowang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200821092813.8952-4-jasowang@redhat.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: shahafs@mellanox.com, kbuild-all@lists.01.org, lulu@redhat.com,
 mhabets@solarflare.com, eperezma@redhat.com, hanand@xilinx.com,
 lingshan.zhu@intel.com, rob.miller@broadcom.com
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


Signed-off-by: kernel test robot <lkp@intel.com>
---
 vdpa_sim.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
index 89854e17c3c27b..ff6c9fd8d879bd 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
@@ -574,7 +574,7 @@ static u32 vdpasim_get_generation(struct vdpa_device *vdpa)
 	return vdpasim->generation;
 }
 
-struct vdpa_iova_range vdpasim_get_iova_range(struct vdpa_device *vdpa)
+static struct vdpa_iova_range vdpasim_get_iova_range(struct vdpa_device *vdpa)
 {
 	struct vdpa_iova_range range = {
 		.first = 0ULL,
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
