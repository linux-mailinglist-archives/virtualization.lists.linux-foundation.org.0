Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C940A22AB88
	for <lists.virtualization@lfdr.de>; Thu, 23 Jul 2020 11:13:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0140A279E9;
	Thu, 23 Jul 2020 09:13:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Di+q+5T1Jx-t; Thu, 23 Jul 2020 09:13:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6A0F427D1F;
	Thu, 23 Jul 2020 09:13:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 47C9EC004C;
	Thu, 23 Jul 2020 09:13:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 93932C004C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 09:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8C9B889C6A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 09:13:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TXbm1I2Cn09P
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 09:13:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E9BAE89C65
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 09:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595495589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DV/00EyCP590tmCFq6jIThJcEZgsODjna9x+BTGXHYM=;
 b=Avs4LYyfxc4OS7R86rEz+rJpw6E5t0aeVRaOr3zxBhbSb2wXFPCFj62IY/QTtVOyIRnD6D
 l3FF7qox0B2O8J8Yt3bgT8lIdTkEEybhT8+HHaBzm4RnDcQlJpcRbN0SrdnIkkJhTSDZrp
 1899U0MSATmT/JvsHpwWkVZ2Hw3KPeI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-N4SglXDZNtOGwyhkG2emPw-1; Thu, 23 Jul 2020 05:13:07 -0400
X-MC-Unique: N4SglXDZNtOGwyhkG2emPw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B25A6800597;
 Thu, 23 Jul 2020 09:13:06 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-141.pek2.redhat.com [10.72.13.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2658619B5;
 Thu, 23 Jul 2020 09:13:03 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] vdpa: ifcvf: free config irq in ifcvf_free_irq()
Date: Thu, 23 Jul 2020 17:12:54 +0800
Message-Id: <20200723091254.20617-2-jasowang@redhat.com>
In-Reply-To: <20200723091254.20617-1-jasowang@redhat.com>
References: <20200723091254.20617-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: Zhu Lingshan <lingshan.zhu@intel.com>
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

We don't free config irq in ifcvf_free_irq() which will trigger a
BUG() in pci core since we try to free the vectors that has an
action. Fixing this by recording the config irq in ifcvf_hw structure
and free it in ifcvf_free_irq().

Fixes: e7991f376a4d ("ifcvf: implement config interrupt in IFCVF")
Cc: Zhu Lingshan <lingshan.zhu@intel.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vdpa/ifcvf/ifcvf_base.h | 2 +-
 drivers/vdpa/ifcvf/ifcvf_main.c | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/vdpa/ifcvf/ifcvf_base.h b/drivers/vdpa/ifcvf/ifcvf_base.h
index f4554412e607..29efa75cdfce 100644
--- a/drivers/vdpa/ifcvf/ifcvf_base.h
+++ b/drivers/vdpa/ifcvf/ifcvf_base.h
@@ -84,7 +84,7 @@ struct ifcvf_hw {
 	void __iomem * const *base;
 	char config_msix_name[256];
 	struct vdpa_callback config_cb;
-
+	unsigned int config_irq;
 };
 
 struct ifcvf_adapter {
diff --git a/drivers/vdpa/ifcvf/ifcvf_main.c b/drivers/vdpa/ifcvf/ifcvf_main.c
index ae7110955a44..7a6d899e541d 100644
--- a/drivers/vdpa/ifcvf/ifcvf_main.c
+++ b/drivers/vdpa/ifcvf/ifcvf_main.c
@@ -53,6 +53,7 @@ static void ifcvf_free_irq(struct ifcvf_adapter *adapter, int queues)
 	for (i = 0; i < queues; i++)
 		devm_free_irq(&pdev->dev, vf->vring[i].irq, &vf->vring[i]);
 
+	devm_free_irq(&pdev->dev, vf->config_irq, vf);
 	ifcvf_free_irq_vectors(pdev);
 }
 
@@ -72,8 +73,8 @@ static int ifcvf_request_irq(struct ifcvf_adapter *adapter)
 	snprintf(vf->config_msix_name, 256, "ifcvf[%s]-config\n",
 		 pci_name(pdev));
 	vector = 0;
-	irq = pci_irq_vector(pdev, vector);
-	ret = devm_request_irq(&pdev->dev, irq,
+	vf->config_irq = pci_irq_vector(pdev, vector);
+	ret = devm_request_irq(&pdev->dev, vf->config_irq,
 			       ifcvf_config_changed, 0,
 			       vf->config_msix_name, vf);
 	if (ret) {
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
