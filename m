Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 282E91FC4A6
	for <lists.virtualization@lfdr.de>; Wed, 17 Jun 2020 05:30:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A335D87551;
	Wed, 17 Jun 2020 03:30:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W7yAj43nSemd; Wed, 17 Jun 2020 03:30:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5017B8754B;
	Wed, 17 Jun 2020 03:30:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 40073C016E;
	Wed, 17 Jun 2020 03:30:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04689C016E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Jun 2020 03:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 00EDD8953D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Jun 2020 03:30:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sOwY91zafyt8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Jun 2020 03:30:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7BFDC89491
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Jun 2020 03:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592364628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ZZXQEp1varx5CR2s6EKgHR6uqmX28df2mtW01Bo6oc=;
 b=N684Z3UkUS5ioylxx2zQu5xwl+kvnSHt7vIUQmXvV0387Wp4YFFE8IctKHhULscniqTdmK
 tR4K6xnIXN1I5c6p+HHonUeZUAxDVTCaVavR6t+Y2B62gslm7VB2UDr/0v1UMdCWPzERlz
 1Mnd0Uq9dgNX+3ZXAyHZeVcZ0zIR4jU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-X6qc-4UqMiif4jM_1owsrQ-1; Tue, 16 Jun 2020 23:30:27 -0400
X-MC-Unique: X6qc-4UqMiif4jM_1owsrQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30BB787342D;
 Wed, 17 Jun 2020 03:30:25 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-217.pek2.redhat.com [10.72.13.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0D475C1BD;
 Wed, 17 Jun 2020 03:30:18 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] vdpa: get_iova_range() is mandatory for device specific
 DMA translation
Date: Wed, 17 Jun 2020 11:29:46 +0800
Message-Id: <20200617032947.6371-4-jasowang@redhat.com>
In-Reply-To: <20200617032947.6371-1-jasowang@redhat.com>
References: <20200617032947.6371-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: shahafs@mellanox.com, lulu@redhat.com, saugatm@xilinx.com,
 mhabets@solarflare.com, vmireyno@marvell.com, gdawar@xilinx.com,
 eperezma@redhat.com, hanand@xilinx.com, zhangweining@ruijie.com.cn,
 eli@mellanox.com, lingshan.zhu@intel.com, rob.miller@broadcom.com
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

In order to let userspace work correctly, get_iova_range() is a must
for the device that has its own DMA translation logic.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vdpa/vdpa.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/vdpa/vdpa.c b/drivers/vdpa/vdpa.c
index de211ef3738c..ab7af978ef70 100644
--- a/drivers/vdpa/vdpa.c
+++ b/drivers/vdpa/vdpa.c
@@ -82,6 +82,10 @@ struct vdpa_device *__vdpa_alloc_device(struct device *parent,
 	if (!!config->dma_map != !!config->dma_unmap)
 		goto err;
 
+	if ((config->dma_map || config->set_map) &&
+	    !config->get_iova_range)
+		goto err;
+
 	err = -ENOMEM;
 	vdev = kzalloc(size, GFP_KERNEL);
 	if (!vdev)
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
