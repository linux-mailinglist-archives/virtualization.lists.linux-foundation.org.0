Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D837E26E56B
	for <lists.virtualization@lfdr.de>; Thu, 17 Sep 2020 21:46:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 891B48738E;
	Thu, 17 Sep 2020 19:46:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r5cOBfCTtTMn; Thu, 17 Sep 2020 19:46:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D83CF8739B;
	Thu, 17 Sep 2020 19:46:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A7049C0051;
	Thu, 17 Sep 2020 19:46:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 92012C0051
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Sep 2020 19:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8C65F8739B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Sep 2020 19:46:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iyoC31xGeFlu
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Sep 2020 19:46:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1DEB78738E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Sep 2020 19:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=f1R3VqxnNoImr58s5Ei6XYjbvhxFKPOcc7dIvuhbrlk=; b=PZGDndu5AS2FRze2eHvet2zuzo
 cmdlFZAEpwsPBLMOzBqyUaDNZk7t2ToNmb+1AW/mBqBvRCp3p4HrF9F83r4BQPBZdeA9K7EK5lgeE
 jWe6HJGT9ns8/h3ymoxMQimvbU4N8kjKwj88ARAW35nEOcq2jB6wBzStkn0jHWONvQEFnRMeOsgQa
 4200ap5xB0AUCC/MHgli9L7ZnBxtf3bKZUg7BLfnvk3rdmb8312swauZpsUbI/BnRhlxm0nvMJfgK
 g92/x9EGihCuiwaiaMihocH3zzHHWTmfFjUwain8psOQnfi16CP/FYBmg1NRWQsAF2qbzn/I2Bo5l
 lgIjYYSA==;
Received: from [2601:1c0:6280:3f0::19c2]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIzqs-0003P2-P6; Thu, 17 Sep 2020 19:45:55 +0000
To: virtualization@lists.linux-foundation.org,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>,
 Leon Romanovsky <leonro@nvidia.com>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 -next] vdpa: mlx5: change Kconfig depends to fix build
 errors
Message-ID: <22a2bd60-d895-2bfb-50be-4ac3d131ed82@infradead.org>
Date: Thu, 17 Sep 2020 12:45:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Language: en-US
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

From: Randy Dunlap <rdunlap@infradead.org>

drivers/vdpa/mlx5/ uses vhost_iotlb*() interfaces, so add a dependency
on VHOST to eliminate build errors.

ld: drivers/vdpa/mlx5/core/mr.o: in function `add_direct_chain':
mr.c:(.text+0x106): undefined reference to `vhost_iotlb_itree_first'
ld: mr.c:(.text+0x1cf): undefined reference to `vhost_iotlb_itree_next'
ld: mr.c:(.text+0x30d): undefined reference to `vhost_iotlb_itree_first'
ld: mr.c:(.text+0x3e8): undefined reference to `vhost_iotlb_itree_next'
ld: drivers/vdpa/mlx5/core/mr.o: in function `_mlx5_vdpa_create_mr':
mr.c:(.text+0x908): undefined reference to `vhost_iotlb_itree_first'
ld: mr.c:(.text+0x9e6): undefined reference to `vhost_iotlb_itree_next'
ld: drivers/vdpa/mlx5/core/mr.o: in function `mlx5_vdpa_handle_set_map':
mr.c:(.text+0xf1d): undefined reference to `vhost_iotlb_itree_first'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: virtualization@lists.linux-foundation.org
Cc: Saeed Mahameed <saeedm@nvidia.com>
Cc: Leon Romanovsky <leonro@nvidia.com>
Cc: netdev@vger.kernel.org
---
v2: change from select to depends (Saeed)

 drivers/vdpa/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200917.orig/drivers/vdpa/Kconfig
+++ linux-next-20200917/drivers/vdpa/Kconfig
@@ -31,7 +31,7 @@ config IFCVF
 
 config MLX5_VDPA
 	bool "MLX5 VDPA support library for ConnectX devices"
-	depends on MLX5_CORE
+	depends on VHOST && MLX5_CORE
 	default n
 	help
 	  Support library for Mellanox VDPA drivers. Provides code that is

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
