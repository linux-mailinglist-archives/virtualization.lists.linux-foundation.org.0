Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D45B22AB86
	for <lists.virtualization@lfdr.de>; Thu, 23 Jul 2020 11:13:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B1D36874AD;
	Thu, 23 Jul 2020 09:13:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZpBpA4v3NkKb; Thu, 23 Jul 2020 09:13:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 44E528764C;
	Thu, 23 Jul 2020 09:13:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 12117C004C;
	Thu, 23 Jul 2020 09:13:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B32ABC004C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 09:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9C22889C69
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 09:13:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sIrAX90GLaq7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 09:13:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CD71089C65
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 09:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595495587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=RSy4LtbaD8levFOBIayUOWSmIYzMSd7fCPXVTaSTU+s=;
 b=ZscayFnEXyMSkZN8ePLA4M/LSEzRHRu4+U5B4XrqVJRsS6rhce/Xs4ouBGuOOehPs8Wdum
 PtS8ouwivtmR+0zX2LL+kbgVVHlugBKj3EnjWh8NXdDR4T2mNssFk7awI0X8A2MzahmfYZ
 xpe2dBgJzNx6X9bORZdHZ6wDWCiy628=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-2gLebz6nP6-9gOiGYakW6w-1; Thu, 23 Jul 2020 05:13:04 -0400
X-MC-Unique: 2gLebz6nP6-9gOiGYakW6w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6809691271;
 Thu, 23 Jul 2020 09:13:03 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-141.pek2.redhat.com [10.72.13.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D44870596;
 Thu, 23 Jul 2020 09:12:58 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] vdpa: ifcvf: return err when fail to request config irq
Date: Thu, 23 Jul 2020 17:12:53 +0800
Message-Id: <20200723091254.20617-1-jasowang@redhat.com>
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

We ignore the err of requesting config interrupt, fix this.

Fixes: e7991f376a4d ("ifcvf: implement config interrupt in IFCVF")
Cc: Zhu Lingshan <lingshan.zhu@intel.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vdpa/ifcvf/ifcvf_main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/vdpa/ifcvf/ifcvf_main.c b/drivers/vdpa/ifcvf/ifcvf_main.c
index f5a60c14b979..ae7110955a44 100644
--- a/drivers/vdpa/ifcvf/ifcvf_main.c
+++ b/drivers/vdpa/ifcvf/ifcvf_main.c
@@ -76,6 +76,10 @@ static int ifcvf_request_irq(struct ifcvf_adapter *adapter)
 	ret = devm_request_irq(&pdev->dev, irq,
 			       ifcvf_config_changed, 0,
 			       vf->config_msix_name, vf);
+	if (ret) {
+		IFCVF_ERR(pdev, "Failed to request config irq\n");
+		return ret;
+	}
 
 	for (i = 0; i < IFCVF_MAX_QUEUE_PAIRS * 2; i++) {
 		snprintf(vf->vring[i].msix_name, 256, "ifcvf[%s]-%d\n",
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
