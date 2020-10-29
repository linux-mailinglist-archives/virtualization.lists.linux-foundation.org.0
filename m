Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6298429EBC1
	for <lists.virtualization@lfdr.de>; Thu, 29 Oct 2020 13:21:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DB00E86B9E;
	Thu, 29 Oct 2020 12:21:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id brsvFdpQLDnx; Thu, 29 Oct 2020 12:21:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 67AAA86BA5;
	Thu, 29 Oct 2020 12:21:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3EA32C0051;
	Thu, 29 Oct 2020 12:21:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8BFEDC0051
 for <virtualization@lists.linux-foundation.org>;
 Thu, 29 Oct 2020 12:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 07F722270C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 29 Oct 2020 12:21:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OIyrNEJ3WnBl
 for <virtualization@lists.linux-foundation.org>;
 Thu, 29 Oct 2020 12:21:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by silver.osuosl.org (Postfix) with ESMTPS id 6EDE521561
 for <virtualization@lists.linux-foundation.org>;
 Thu, 29 Oct 2020 12:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603974061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yhuU63QYYA1pfwdAnRMuQGZDltzslJa5sQvMjC4VHB4=;
 b=GloO3Nsp0RAf+cvhVeLQ/Md6/IWXWwazqRsIu42wwFwWjb9a0TgISlSAQAv3K2kJ2YawAs
 +t3oHtYyzBvycbSsjuUPKuTxStCI2zW6DnvckZ3Hi82ZLQhErpSG3kX3XUZ1DPFsYH181c
 gywN9UXAWT+DHYhsUTtXL6m28nO71fk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-lFnQ0bnJOYGjYECIeoQ01w-1; Thu, 29 Oct 2020 08:20:57 -0400
X-MC-Unique: lFnQ0bnJOYGjYECIeoQ01w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EB4010199A7;
 Thu, 29 Oct 2020 12:20:56 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-113-197.ams2.redhat.com
 [10.36.113.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9DC26266E;
 Thu, 29 Oct 2020 12:20:54 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] vdpasim: allow to assign a MAC address
Date: Thu, 29 Oct 2020 13:20:50 +0100
Message-Id: <20201029122050.776445-3-lvivier@redhat.com>
In-Reply-To: <20201029122050.776445-1-lvivier@redhat.com>
References: <20201029122050.776445-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Laurent Vivier <lvivier@redhat.com>,
 virtualization@lists.linux-foundation.org,
 "Michael S. Tsirkin" <mst@redhat.com>
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

Add macaddr parameter to the module to set the MAC address to use

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 drivers/vdpa/vdpa_sim/vdpa_sim.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
index 7f8ebc9924ac..9cf7079ee185 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
@@ -38,6 +38,10 @@ static int batch_mapping = 1;
 module_param(batch_mapping, int, 0444);
 MODULE_PARM_DESC(batch_mapping, "Batched mapping 1 -Enable; 0 - Disable");
 
+static char *macaddr;
+module_param(macaddr, charp, 0);
+MODULE_PARM_DESC(macaddr, "Ethernet MAC address");
+
 struct vdpasim_virtqueue {
 	struct vringh vring;
 	struct vringh_kiov iov;
@@ -373,7 +377,15 @@ static struct vdpasim *vdpasim_create(void)
 	if (!vdpasim->buffer)
 		goto err_iommu;
 
-	eth_random_addr(vdpasim->config.mac);
+	if (macaddr) {
+		mac_pton(macaddr, vdpasim->config.mac);
+		if (!is_valid_ether_addr(vdpasim->config.mac)) {
+			ret = -EADDRNOTAVAIL;
+			goto err_iommu;
+		}
+	} else {
+		eth_random_addr(vdpasim->config.mac);
+	}
 
 	vringh_set_iotlb(&vdpasim->vqs[0].vring, vdpasim->iommu);
 	vringh_set_iotlb(&vdpasim->vqs[1].vring, vdpasim->iommu);
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
