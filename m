Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 256872C42F7
	for <lists.virtualization@lfdr.de>; Wed, 25 Nov 2020 16:36:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B0B7186D6B;
	Wed, 25 Nov 2020 15:36:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Df7XTyUiOdJq; Wed, 25 Nov 2020 15:36:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0610D86D7D;
	Wed, 25 Nov 2020 15:36:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DD217C1836;
	Wed, 25 Nov 2020 15:36:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9C504C0052
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 15:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8B4C487249
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 15:36:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KgXkSFzrYApX
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 15:36:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EA4CD87239
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 15:36:14 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 90B03208CA;
 Wed, 25 Nov 2020 15:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606318574;
 bh=PF4DyltYMiXeqtX1ZkatjLYdcckflbeLZAslTMDY33M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WYeD3ZGqkSZdhEIk+/cRs6e4Jf+9ZCoMFZkGU19OW1RSuvZXk4JtGkT/re0kdtNCT
 0lwPkvBqoH4smoHi/iXrou+WiPVTzt0lowmJ4hNhtKJwIx3VV9JPk8H7zt1U/KO90u
 AKx7KC7qy9E8oqLkaWSu8wRHyhZacsnvyFxCz/rQ=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 18/33] vdpasim: fix "mac_pton" undefined error
Date: Wed, 25 Nov 2020 10:35:35 -0500
Message-Id: <20201125153550.810101-18-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201125153550.810101-1-sashal@kernel.org>
References: <20201125153550.810101-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Laurent Vivier <lvivier@redhat.com>, Sasha Levin <sashal@kernel.org>,
 kernel test robot <lkp@intel.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Randy Dunlap <rdunlap@infradead.org>,
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

From: Laurent Vivier <lvivier@redhat.com>

[ Upstream commit a312db697cb05dfa781848afe8585a1e1f2a5a99 ]

   ERROR: modpost: "mac_pton" [drivers/vdpa/vdpa_sim/vdpa_sim.ko] undefined!

mac_pton() is defined in lib/net_utils.c and is not built if NET is not set.

Select GENERIC_NET_UTILS as vdpasim doesn't depend on NET.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Link: https://lore.kernel.org/r/20201113155706.599434-1-lvivier@redhat.com
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/vdpa/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/vdpa/Kconfig b/drivers/vdpa/Kconfig
index d7d32b6561021..358f6048dd3ce 100644
--- a/drivers/vdpa/Kconfig
+++ b/drivers/vdpa/Kconfig
@@ -13,6 +13,7 @@ config VDPA_SIM
 	depends on RUNTIME_TESTING_MENU && HAS_DMA
 	select DMA_OPS
 	select VHOST_RING
+	select GENERIC_NET_UTILS
 	default n
 	help
 	  vDPA networking device simulator which loop TX traffic back
-- 
2.27.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
