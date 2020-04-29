Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7FC1BE0C8
	for <lists.virtualization@lfdr.de>; Wed, 29 Apr 2020 16:23:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7CCE6203C7;
	Wed, 29 Apr 2020 14:23:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l4HHpRbuWYcx; Wed, 29 Apr 2020 14:23:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 36988203E7;
	Wed, 29 Apr 2020 14:23:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 06E7FC0172;
	Wed, 29 Apr 2020 14:23:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1FB01C0172
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 14:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1BA9C88396
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 14:23:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YYf9DwmdAw4H
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 14:23:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DD71188393
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 14:23:28 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.129]) with ESMTPA (Nemesis) id
 1N7iOw-1j8KpB09eU-014iMZ; Wed, 29 Apr 2020 16:23:19 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>
Subject: [PATCH] vhost: fix default for vhost_iotlb
Date: Wed, 29 Apr 2020 16:23:04 +0200
Message-Id: <20200429142317.1847441-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:b3pbp/XZSd+qFAXvZ9I7UjuleCw3GTy1vtyionbvaNjSrD6kYrH
 y/IBPt43A5XriZwjpg/iVL+DG+MEIGNcDlWlMfkFbLwqZGn3pMma6Xx0viUdy8bDJdYLpx4
 Lt9B3isKWwO+iGzLngj6QapH5GuypPJSDv//HUUaylj17ZdCqAsqXaqYgEDbLhcGG+xHkJk
 FAgf2eV+mFETYygqDSJbA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cHnxtw5s88I=:liybKe0ZyJzauaYbhV1tR4
 v+detTxqBVhe77qXrhR+LJDZDMNMOV9mkaPORuAXHIO5xefWpUdkz7/jiaLp1rVYj2t2+IZXW
 gshFy77aTRiWP9IpwdC7VXhAMHccPlBSLN3hOlCaY8AuVBKJbH4zlgAI6RriDPkTOroUsBhQu
 Bub16qn/gv6uBFl5q8Mv6yfgOGbDoMBT+Iy59/H9BOg6yCTIBNZNaR0kKt55xjXZRFY9nCeIz
 fprxjDfT8ScG5bD0YZXz8EpefMvdPdPekIcs/ntCx4f5Brr9ND7oq8cpkWPdCpSrI0gLsnpdi
 oTc1r8Xe87uRzZXf8hQ6sjtoBmS7kj8RaIEsyERkpCXyoES858LWCSlfQHpSxkNVZ6XSAP7OY
 Ir3zR49Q5LlOIx5i6GpH5DLsCrOpenvCyZ4SeKcBvwrZCMeXvJaMLqfCYo8MsTRSwKbPokI01
 1mNrqwi3kWN45VD/6TFDZ5fbTjlzmzwIz2/8aZhVjtSITAgicPam99N3mDGx0k6Vs8TFnhhcp
 rO1P5mJi5QQhgvmGKXLkBJAIH7DfNPKIuzBL0GWXOQFAzMfM4W0BJbTQcSAhh8cShtglo/RsN
 lAOvUduj4mF3d/+TzX8M/wA0ciSJd/K37cwbwyrSOXHTHwe9f/cwweHkCPwYBl4snwOFa7lKF
 S+dQUFMv9GoCpx4RCmGtGm3hnL/EUd+moTge+fJmVdqv79d7rIx+kiZXeTay19bhIB4NWeB4K
 HSJJK8hYrPtPyRvsAAH4oJnDSlMvq9s2gDZ8OGRC37fKsYgkiDOthoi3KmKJbELyTstVJ0w5c
 tS93kyVDjAmyLIv1AtkY5kjjiIpVAnOkIKdLzwZcK39cVbgrKg=
Cc: Arnd Bergmann <arnd@arndb.de>, Tiwei Bie <tiwei.bie@intel.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, kvm@vger.kernel.org
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

During randconfig build testing, I ran into a configuration that has
CONFIG_VHOST=m, CONFIG_VHOST_IOTLB=m and CONFIG_VHOST_RING=y, which
makes the iotlb implementation left out from vhost_ring, and in turn
leads to a link failure of the vdpa_sim module:

ERROR: modpost: "vringh_set_iotlb" [drivers/vdpa/vdpa_sim/vdpa_sim.ko] undefined!
ERROR: modpost: "vringh_init_iotlb" [drivers/vdpa/vdpa_sim/vdpa_sim.ko] undefined!
ERROR: modpost: "vringh_iov_push_iotlb" [drivers/vdpa/vdpa_sim/vdpa_sim.ko] undefined!
ERROR: modpost: "vringh_iov_pull_iotlb" [drivers/vdpa/vdpa_sim/vdpa_sim.ko] undefined!
ERROR: modpost: "vringh_complete_iotlb" [drivers/vdpa/vdpa_sim/vdpa_sim.ko] undefined!
ERROR: modpost: "vringh_getdesc_iotlb" [drivers/vdpa/vdpa_sim/vdpa_sim.ko] undefined!

Work around it by setting the default for VHOST_IOTLB to avoid this
configuration.

Fixes: e6faeaa12841 ("vhost: drop vring dependency on iotlb")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I fixed this a while ago locally but never got around to sending the
fix. If the problem has been addressed differently in the meantime,
please ignore this one.
---
 drivers/vhost/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
index 2c75d164b827..ee5f85761024 100644
--- a/drivers/vhost/Kconfig
+++ b/drivers/vhost/Kconfig
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VHOST_IOTLB
 	tristate
+	default y if VHOST=m && VHOST_RING=y
 	help
 	  Generic IOTLB implementation for vhost and vringh.
 	  This option is selected by any driver which needs to support
-- 
2.26.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
