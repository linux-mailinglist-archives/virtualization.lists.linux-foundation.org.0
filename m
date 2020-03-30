Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0F7198889
	for <lists.virtualization@lfdr.de>; Tue, 31 Mar 2020 01:47:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 93B5186AAC;
	Mon, 30 Mar 2020 23:47:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GopJSdekjoin; Mon, 30 Mar 2020 23:47:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B628A86A84;
	Mon, 30 Mar 2020 23:47:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97293C07FF;
	Mon, 30 Mar 2020 23:47:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ABC51C07FF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 23:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9E55623B2B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 23:47:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GKjPjFACJIQB
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 23:46:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from gateway33.websitewelcome.com (gateway33.websitewelcome.com
 [192.185.145.9])
 by silver.osuosl.org (Postfix) with ESMTPS id 8839723B28
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 23:46:59 +0000 (UTC)
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
 by gateway33.websitewelcome.com (Postfix) with ESMTP id 9ECA2F9A09
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 18:46:58 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id J47Ojx86L1s2xJ47OjdZIX; Mon, 30 Mar 2020 18:46:58 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
 Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MHojYII/Ua+k7l5hgugppwNvwPqnKoi9qCSV0tIDcMY=; b=WNCS8YARVVpPBy1UXYjUAQe9YQ
 X6c2Xd0hKDmUu0kPnKn8t41HP/yVT8sZYIkv3JeBOsbBDfRQlq5t6x+EDWmdUmriVVWbPWd5tD8xz
 GowGlSXb5Jq+w+PtislgOHg8eZkJMcxfaoI7hvVfWWQBkBv4DAN/3QFUj3nXR6fgMjoWN1gv4aFSu
 vBKaN2abzcQMoalF4KmdvwXhed/SlJzZHdGf07Hp+3zb+jpFW/hIlfRi8f9Z1hS76bTL735ucbXY7
 hNmup79QHHtRJuPUt1zGPS08cYCANg4ZNbwFHa2errdAWcmg5YlblLo2ZK/6JaNOw0LV87U5n/MQi
 cMl/vKrg==;
Received: from cablelink-189-218-116-241.hosts.intercable.net
 ([189.218.116.241]:34376 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1jJ47M-000kyx-S1; Mon, 30 Mar 2020 18:46:56 -0500
Date: Mon, 30 Mar 2020 18:50:40 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Tiwei Bie <tiwei.bie@intel.com>,
 Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: [PATCH] vhost: vdpa: remove unnecessary null check
Message-ID: <20200330235040.GA9997@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.linux-foundation.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.218.116.241
X-Source-L: No
X-Exim-ID: 1jJ47M-000kyx-S1
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: cablelink-189-218-116-241.hosts.intercable.net (embeddedor)
 [189.218.116.241]:34376
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 12
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Cc: netdev@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

container_of is never null, so this null check is
unnecessary.

Addresses-Coverity-ID: 1492006 ("Logically dead code")
Fixes: 20453a45fb06 ("vhost: introduce vDPA-based backend")
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/vhost/vdpa.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
index 421f02a8530a..3d2cb811757a 100644
--- a/drivers/vhost/vdpa.c
+++ b/drivers/vhost/vdpa.c
@@ -678,8 +678,6 @@ static int vhost_vdpa_open(struct inode *inode, struct file *filep)
 	int nvqs, i, r, opened;
 
 	v = container_of(inode->i_cdev, struct vhost_vdpa, cdev);
-	if (!v)
-		return -ENODEV;
 
 	opened = atomic_cmpxchg(&v->opened, 0, 1);
 	if (opened)
-- 
2.26.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
