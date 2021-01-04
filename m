Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E1A2E8F8C
	for <lists.virtualization@lfdr.de>; Mon,  4 Jan 2021 04:32:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E715485DFF;
	Mon,  4 Jan 2021 03:32:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WkNCpFjqHr_2; Mon,  4 Jan 2021 03:32:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C5CD085E47;
	Mon,  4 Jan 2021 03:32:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AF764C013A;
	Mon,  4 Jan 2021 03:32:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5EA28C013A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 03:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4C8408680C
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 03:32:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yA4y7vm9+hw7
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 03:32:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 97ECA8681B
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jan 2021 03:32:18 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5ff28c420000>; Sun, 03 Jan 2021 19:32:18 -0800
Received: from sw-mtx-036.mtx.labs.mlnx (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 4 Jan 2021 03:32:17 +0000
From: Parav Pandit <parav@nvidia.com>
To: <virtualization@lists.linux-foundation.org>
Subject: [PATCH linux-next v2 1/7] vdpa_sim_net: Make mac address array static
Date: Mon, 4 Jan 2021 05:31:35 +0200
Message-ID: <20210104033141.105876-2-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210104033141.105876-1-parav@nvidia.com>
References: <20201112064005.349268-1-parav@nvidia.com>
 <20210104033141.105876-1-parav@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1609731138; bh=IOLgtQ8wjhNIKDKoZd+WM4eBiMFNdcNz29O7F2JDlb0=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
 X-Originating-IP:X-ClientProxiedBy;
 b=cwJP/sM3XEWinIjH34eV2QdYSaiWvmW/QM/0N/Pia64VC7jFc//UoX0nXwe8a/KWZ
 NM1qMCDmbBNDf+Ay2o96+G3pQXeIURq8abvjooPLb+B3gmzRk5Nhumbm1u4QnFFD/E
 IJsZtmBDGgpV8GjDuYIlz11E2QS/GYAgfWrXnSYoTgUOvwjth352o0dPJDrkZw4/aQ
 eAmtKwTE+gtGNI1ww7NoInR6fTEtiszPJl3rlXnjK00auxbgUAE0xgP2FwpBN5bXgj
 Js4OGfAW3xE87Jhk4vQ23IyUb57faWoSWIqmfIdYfOI47X+7ScTtoMl9COwB5MHkLq
 gML/R6ZK6vQ+g==
Cc: netdev@vger.kernel.org, elic@nvidia.com, mst@redhat.com
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

MAC address array is used only in vdpa_sim_net.c.
Hence, keep it static.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
Changelog:
v1->v2:
 - new patch
---
 drivers/vdpa/vdpa_sim/vdpa_sim_net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim_net.c b/drivers/vdpa/vdpa_sim/vdpa_sim_net.c
index c10b6981fdab..f0482427186b 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim_net.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim_net.c
@@ -33,7 +33,7 @@ static char *macaddr;
 module_param(macaddr, charp, 0);
 MODULE_PARM_DESC(macaddr, "Ethernet MAC address");
 
-u8 macaddr_buf[ETH_ALEN];
+static u8 macaddr_buf[ETH_ALEN];
 
 static struct vdpasim *vdpasim_net_dev;
 
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
