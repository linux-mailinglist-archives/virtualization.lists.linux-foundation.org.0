Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D702AFFC1
	for <lists.virtualization@lfdr.de>; Thu, 12 Nov 2020 07:40:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 801C686DD9;
	Thu, 12 Nov 2020 06:40:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wwryexTWaKuU; Thu, 12 Nov 2020 06:40:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 254F586DD6;
	Thu, 12 Nov 2020 06:40:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B438C08A1;
	Thu, 12 Nov 2020 06:40:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D6F10C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 06:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B4C8A8765B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 06:40:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TIHjx4h3yYPB
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 06:40:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DC48187657
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 06:40:31 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5facd8e60000>; Wed, 11 Nov 2020 22:40:38 -0800
Received: from sw-mtx-036.mtx.labs.mlnx (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 12 Nov
 2020 06:40:30 +0000
From: Parav Pandit <parav@nvidia.com>
To: <virtualization@lists.linux-foundation.org>
Subject: [PATCH 2/7] vdpa: Use simpler version of ida allocation
Date: Thu, 12 Nov 2020 08:40:00 +0200
Message-ID: <20201112064005.349268-3-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201112064005.349268-1-parav@nvidia.com>
References: <20201112064005.349268-1-parav@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1605163239; bh=obxQ+8CkZMWkGpFrT7wuL+J6qEJIL2OCsM+PzwuIu98=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
 X-Originating-IP:X-ClientProxiedBy;
 b=FTdm7feQL1zGlazsOD1efEw5oJ8haRvqmBTGZcs2EC3wm3StoPvxSn3AkbbEigwC6
 KegA4W+NIxFwo2LjwiJ11Zl8u9UBgESdg4GR13HMYeyOSWWXdPGOvqKZtEEsIc0sju
 M33ikb6LGk9DQryqPmSr0QKGg2cGf9V2la6RbnlCxdG3aS7ojfa5r+delagU1zS3BW
 7vIm+rizY/4v3NUvnXDgWgXsHVWuFlCb4WTp1/pc6Zn7Vje6+TK/pn3xi/Zl2Uso4W
 oi5sBsQU8lclXIJp+0hO3jvqEKeLZQ/Fge4Ugtdt/gvSLfBAhp2H5HthHt69PL0Yco
 6Nt4z3fsGAFNA==
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

vdpa doesn't have any specific need to define start and end range of the
device index.
Hence use the simper version of the ida allocator.

Signed-off-by: Parav Pandit <parav@nvidia.com>
Reviewed-by: Eli Cohen <elic@nvidia.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vdpa/vdpa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vdpa/vdpa.c b/drivers/vdpa/vdpa.c
index a69ffc991e13..c0825650c055 100644
--- a/drivers/vdpa/vdpa.c
+++ b/drivers/vdpa/vdpa.c
@@ -89,7 +89,7 @@ struct vdpa_device *__vdpa_alloc_device(struct device *parent,
 	if (!vdev)
 		goto err;
 
-	err = ida_simple_get(&vdpa_index_ida, 0, 0, GFP_KERNEL);
+	err = ida_alloc(&vdpa_index_ida, GFP_KERNEL);
 	if (err < 0)
 		goto err_ida;
 
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
