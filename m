Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC2A3B03C1
	for <lists.virtualization@lfdr.de>; Tue, 22 Jun 2021 14:08:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33AE8606DD;
	Tue, 22 Jun 2021 12:08:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CjpjQKBmw-L3; Tue, 22 Jun 2021 12:08:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 02F1460778;
	Tue, 22 Jun 2021 12:08:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4E2DAC0022;
	Tue, 22 Jun 2021 12:08:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 60124C000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Jun 2021 12:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47628836CE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Jun 2021 12:08:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J7gOnKhqnZEN
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Jun 2021 12:08:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 27272834F1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 22 Jun 2021 12:08:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 11712613B4;
 Tue, 22 Jun 2021 12:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624363709;
 bh=QgbOICWNWQVZBV9woPMxiJU074KR713S1bjNoE4oqlk=;
 h=From:To:Cc:Subject:Date:From;
 b=lMsWOuYVn8GonHp1D+NeGvhPvHMLCTC2GQbz3IAeYVi6sb0wR1DxJku4Du3RBD6lZ
 IggB5vkt7JSmp/Y5fWncEvCPaFwW5dkfDMR1NJAubitOpGeUmibljZydSGm3UBZjFx
 GUxh7aOi68ql+qWTdNEop2JvNWb/gXgMLP0+9NBoKnEkLVzswm4c9yuqp58gnS4cjS
 lZ4esAsm+4X4AcQseh2XnGBTOrWmBE3HHLZ2hklwVUgu8YuWvpkIBW37W1dRTpOkKm
 02wLF+3gRvD+BRaasUhmD7P2oyFiGGV6Tbeeg1sPRd5mCr58j4mXvOI3jXK4WfHENf
 hxXvRrLsx0PQA==
From: Leon Romanovsky <leon@kernel.org>
To: Doug Ledford <dledford@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH rdma-next 0/5] mlx5 MR cache enhancements
Date: Tue, 22 Jun 2021 15:08:18 +0300
Message-Id: <cover.1624362290.git.leonro@nvidia.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Cc: "Michael S. Tsirkin" <mst@redhat.com>, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org, Aharon Landau <aharonl@nvidia.com>,
 virtualization@lists.linux-foundation.org, Shay Drory <shayd@nvidia.com>,
 Jakub Kicinski <kuba@kernel.org>, Leon Romanovsky <leonro@nvidia.com>,
 Saeed Mahameed <saeedm@nvidia.com>
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

From: Leon Romanovsky <leonro@nvidia.com>

Hi,

This series from Aharon changes how memory region (MR) cache logic
works in mlx5 driver. First 3 patches are global conversions of
internal structures to hold mkeys, while the rest of the patches
changes cache logic in the RDMA subsystem.

Thanks

Aharon Landau (5):
  RDMA/mlx5: Replace struct mlx5_core_mkey by u32 key
  RDMA/mlx5: Move struct mlx5_core_mkey to mlx5_ib
  RDMA/mlx5: Change the cache to hold mkeys instead of MRs
  RDMA/mlx5: Change the cache structure to an rbtree
  RDMA/mlx5: Delay the deregistration of a non-cache mkey

 drivers/infiniband/hw/mlx5/devx.c             |   2 +-
 drivers/infiniband/hw/mlx5/main.c             |   4 +-
 drivers/infiniband/hw/mlx5/mlx5_ib.h          |  99 ++-
 drivers/infiniband/hw/mlx5/mr.c               | 795 ++++++++++++------
 drivers/infiniband/hw/mlx5/odp.c              |  56 +-
 .../mellanox/mlx5/core/diag/fw_tracer.c       |   2 +-
 .../mellanox/mlx5/core/diag/fw_tracer.h       |   2 +-
 .../mellanox/mlx5/core/diag/rsc_dump.c        |   6 +-
 drivers/net/ethernet/mellanox/mlx5/core/en.h  |   2 +-
 .../net/ethernet/mellanox/mlx5/core/en/ptp.c  |   2 +-
 .../net/ethernet/mellanox/mlx5/core/en/trap.c |   2 +-
 .../ethernet/mellanox/mlx5/core/en_common.c   |   3 +-
 .../net/ethernet/mellanox/mlx5/core/en_main.c |  11 +-
 .../ethernet/mellanox/mlx5/core/fpga/conn.c   |   8 +-
 .../ethernet/mellanox/mlx5/core/fpga/core.h   |   2 +-
 drivers/net/ethernet/mellanox/mlx5/core/mr.c  |  26 +-
 .../mellanox/mlx5/core/steering/dr_icm_pool.c |   9 +-
 .../mellanox/mlx5/core/steering/dr_send.c     |   9 +-
 .../mellanox/mlx5/core/steering/dr_types.h    |   2 +-
 drivers/vdpa/mlx5/core/mlx5_vdpa.h            |   8 +-
 drivers/vdpa/mlx5/core/mr.c                   |   6 +-
 drivers/vdpa/mlx5/core/resources.c            |  13 +-
 drivers/vdpa/mlx5/net/mlx5_vnet.c             |   2 +-
 include/linux/mlx5/driver.h                   |  30 +-
 24 files changed, 697 insertions(+), 404 deletions(-)

-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
