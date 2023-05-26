Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E176712081
	for <lists.virtualization@lfdr.de>; Fri, 26 May 2023 08:53:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE5956F4F7;
	Fri, 26 May 2023 06:53:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE5956F4F7
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VDmA3gSK
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZM6HrmX33Os5; Fri, 26 May 2023 06:53:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 53BA66F4FB;
	Fri, 26 May 2023 06:53:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53BA66F4FB
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9947BC008C;
	Fri, 26 May 2023 06:53:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4F20C0036
 for <virtualization@lists.linux-foundation.org>;
 Fri, 26 May 2023 06:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D5AB42C84
 for <virtualization@lists.linux-foundation.org>;
 Fri, 26 May 2023 06:53:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D5AB42C84
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.a=rsa-sha256 header.s=Intel header.b=VDmA3gSK
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1NoCmv5fdZpQ
 for <virtualization@lists.linux-foundation.org>;
 Fri, 26 May 2023 06:53:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E08642C8A
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E08642C8A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 26 May 2023 06:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685084001; x=1716620001;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZBWOw07m/hHaHLIFB+LuVTOe9YLUwGBjZU22pkQCtUs=;
 b=VDmA3gSKYUv/cneW0EydYJYYyzm9nshv0ILsfhepCCUmKEIp6cNc+mrs
 Bv9lB6qilA5YBxKeHabzzjon6TGJHGfmgYudgaPirqegsU0ahU5+iKDAd
 Bp4KZgfDPScldbG/uDNIiaovpNmYCjtayhUjnUeu6rVYIXWNT/4rkvK1O
 9w5bcqEHoZKlKsxy4Yj+GmIJglswKbFSFjbyV8n+M4c9PNQ9U/OnWqhxj
 3teDOd8ofoTudpLc4z0/Bl0aO4FRGE9t/59uCwK3PbBsaoFFYEUbILBax
 3Ze/tA8hiwz8sOmCzVXCzEUAu5bcvBe7K6kh7NC2NiLT7eArk8MsdHKg5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="333763405"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; d="scan'208";a="333763405"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 23:53:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="770241658"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; d="scan'208";a="770241658"
Received: from lingshan-icx.bj.intel.com ([10.240.192.125])
 by fmsmga008.fm.intel.com with ESMTP; 25 May 2023 23:53:19 -0700
From: Zhu Lingshan <lingshan.zhu@intel.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH V3 5/5] vDPA/ifcvf: a vendor driver should not set
 _CONFIG_S_FAILED
Date: Fri, 26 May 2023 22:52:54 +0800
Message-Id: <20230526145254.39537-6-lingshan.zhu@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230526145254.39537-1-lingshan.zhu@intel.com>
References: <20230526145254.39537-1-lingshan.zhu@intel.com>
MIME-Version: 1.0
Cc: virtualization@lists.linux-foundation.org
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

VIRTIO_CONFIG_S_FAILED indicates the guest driver has given up
the device due to fatal errors. So it is the guest decision,
the vendor driver should not set this status to the device.

Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vdpa/ifcvf/ifcvf_main.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/vdpa/ifcvf/ifcvf_main.c b/drivers/vdpa/ifcvf/ifcvf_main.c
index 5b7156209602..6e47ac2c669a 100644
--- a/drivers/vdpa/ifcvf/ifcvf_main.c
+++ b/drivers/vdpa/ifcvf/ifcvf_main.c
@@ -426,9 +426,7 @@ static void ifcvf_vdpa_set_status(struct vdpa_device *vdpa_dev, u8 status)
 	    !(status_old & VIRTIO_CONFIG_S_DRIVER_OK)) {
 		ret = ifcvf_request_irq(vf);
 		if (ret) {
-			status = ifcvf_get_status(vf);
-			status |= VIRTIO_CONFIG_S_FAILED;
-			ifcvf_set_status(vf, status);
+			IFCVF_ERR(vf->pdev, "failed to request irq with error %d\n", ret);
 			return;
 		}
 	}
-- 
2.39.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
