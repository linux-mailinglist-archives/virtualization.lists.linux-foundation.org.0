Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A3D296B9D
	for <lists.virtualization@lfdr.de>; Fri, 23 Oct 2020 11:01:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E9C1887277;
	Fri, 23 Oct 2020 09:01:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yp6sGuTdJTB1; Fri, 23 Oct 2020 09:01:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7E76487268;
	Fri, 23 Oct 2020 09:01:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5265EC0051;
	Fri, 23 Oct 2020 09:01:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 855EDC0051
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Oct 2020 09:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 70A3C87277
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Oct 2020 09:01:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id huRGovDmrB3A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Oct 2020 09:01:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 497C787268
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Oct 2020 09:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603443660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=dkRMpWaUloTYnrKHXbZYIz2Z4yObRhEiBSWPNEaSME8=;
 b=b7MWXaQI0I7nPAvOnlgx+GYLhCa0AjaE5JACNh+lceOE9zgyuZd4OwUWdztUrhoe79Orla
 /DcEqLO/wO5LUNCqdz8bizOM346UwPxQJxXy/G50eKqfJX+mXQDTuJfyP9wL4up8jZSch2
 I+Jhu+Kl1stQUTLDE4s/Q/hx1Lsx/RY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-iRbf0L6kO-yDAxYr_W32GA-1; Fri, 23 Oct 2020 05:00:56 -0400
X-MC-Unique: iRbf0L6kO-yDAxYr_W32GA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48E64804B72;
 Fri, 23 Oct 2020 09:00:54 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-85.pek2.redhat.com [10.72.13.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2362D5B4C3;
 Fri, 23 Oct 2020 09:00:45 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH V4 0/3] vDPA: API for reporting IOVA range
Date: Fri, 23 Oct 2020 17:00:40 +0800
Message-Id: <20201023090043.14430-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

Hi All:

This series introduces API for reporing IOVA range. This is a must for
userspace to work correclty:

- for the process that uses vhost-vDPA directly, the IOVA must be
  allocated from this range.
- for VM(qemu), when vIOMMU is not enabled, fail early if GPA is out
  of range
- for VM(qemu), when vIOMMU is enabled, determine a valid guest
  address width and then guest IOVA allocator can behave correctly.

Please review.

Changes from V3:

- really silent build warnings

Changes from V2:

- silent build warnings

Changes from V1:

- do not mandate get_iova_range() for device with its own DMA
  translation logic and assume a [0, ULLONG_MAX] range
- mandate IOVA range only for IOMMU that forcing aperture
- forbid the map which is out of the IOVA range in vhost-vDPA

Jason Wang (3):
  vdpa: introduce config op to get valid iova range
  vhost: vdpa: report iova range
  vdpa_sim: implement get_iova_range()

 drivers/vdpa/vdpa_sim/vdpa_sim.c | 12 ++++++++++
 drivers/vhost/vdpa.c             | 41 ++++++++++++++++++++++++++++++++
 include/linux/vdpa.h             | 15 ++++++++++++
 include/uapi/linux/vhost.h       |  4 ++++
 include/uapi/linux/vhost_types.h |  9 +++++++
 5 files changed, 81 insertions(+)

-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
