Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id DB345388FE3
	for <lists.virtualization@lfdr.de>; Wed, 19 May 2021 16:07:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80260403CB;
	Wed, 19 May 2021 14:07:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mdJmqvQAFRH6; Wed, 19 May 2021 14:07:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E31C403E0;
	Wed, 19 May 2021 14:07:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E108CC0001;
	Wed, 19 May 2021 14:07:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 33F29C0001
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 May 2021 14:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2244E4044A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 May 2021 14:07:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N-GXlm1o7WyW
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 May 2021 14:07:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C25494040A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 May 2021 14:07:35 +0000 (UTC)
Received: from dggems704-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FlZQ42kb8zmXDt;
 Wed, 19 May 2021 22:05:16 +0800 (CST)
Received: from dggeml759-chm.china.huawei.com (10.1.199.138) by
 dggems704-chm.china.huawei.com (10.3.19.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 19 May 2021 22:07:32 +0800
Received: from localhost.localdomain (10.175.102.38) by
 dggeml759-chm.china.huawei.com (10.1.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 19 May 2021 22:07:31 +0800
From: Wei Yongjun <weiyongjun1@huawei.com>
To: <weiyongjun1@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, "Jason
 Wang" <jasowang@redhat.com>, Eli Cohen <elic@nvidia.com>, Stefano Garzarella
 <sgarzare@redhat.com>
Subject: [PATCH -next] vp_vdpa: fix error return code in vp_vdpa_probe()
Date: Wed, 19 May 2021 14:16:46 +0000
Message-ID: <20210519141646.3057093-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.102.38]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggeml759-chm.china.huawei.com (10.1.199.138)
X-CFilter-Loop: Reflected
Cc: Hulk Robot <hulkci@huawei.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

Fix to return negative error code -ENOMEM from the error handling
case instead of 0, as done elsewhere in this function.

Fixes: 11d8ffed00b2 ("vp_vdpa: switch to use vp_modern_map_vq_notify()")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/vdpa/virtio_pci/vp_vdpa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/vdpa/virtio_pci/vp_vdpa.c b/drivers/vdpa/virtio_pci/vp_vdpa.c
index c76ebb531212..e5d92db728d3 100644
--- a/drivers/vdpa/virtio_pci/vp_vdpa.c
+++ b/drivers/vdpa/virtio_pci/vp_vdpa.c
@@ -442,6 +442,7 @@ static int vp_vdpa_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 			vp_modern_map_vq_notify(mdev, i,
 						&vp_vdpa->vring[i].notify_pa);
 		if (!vp_vdpa->vring[i].notify) {
+			ret = -ENOMEM;
 			dev_warn(&pdev->dev, "Fail to map vq notify %d\n", i);
 			goto err;
 		}

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
