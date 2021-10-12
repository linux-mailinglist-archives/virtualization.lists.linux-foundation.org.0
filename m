Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5246142A204
	for <lists.virtualization@lfdr.de>; Tue, 12 Oct 2021 12:27:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0007281761;
	Tue, 12 Oct 2021 10:27:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4tHY0hlXUTJW; Tue, 12 Oct 2021 10:27:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B46D081757;
	Tue, 12 Oct 2021 10:27:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70267C000D;
	Tue, 12 Oct 2021 10:27:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B6F1C000D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Oct 2021 10:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78758406A3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Oct 2021 10:27:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e9DgyEjWM-XG
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Oct 2021 10:26:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E6D11406A1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Oct 2021 10:26:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F358461078;
 Tue, 12 Oct 2021 10:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634034419;
 bh=2NtKq17dEx+8m03kFidHWlFmDOwqnCecgyLNgXswUGY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Lri2PsNVXWSgHJuODBNhyxSs6iCNaiq7y1KNBjG/m/Dh0+1rhv7AqK1sCXJmKMhuw
 ftiefr/tJl8U2KcMa86+7+F3MaOG78OpqnQd393MTe1ZPSpyjJfw+ahvzhg+QRu76m
 CrWe/S2Q4wS2rfooieAnMedWVflhKcSxkvcF08ZYoeNRUkOXZbEVpPH0QLaRM2L0rA
 h1WgLka0y982VLR8KbhQkeNWuVvqAbpiY1sHL7tqv3xF4GW6U7C0iX1QYIpwhrBmYO
 ADS559XD5oGClpu+s7vLB/QXRZZVOSUp/1QtxZBupK49o893ryN/7GWWldSvnTp7UO
 V9wgTlcCqGljA==
From: Leon Romanovsky <leon@kernel.org>
To: Doug Ledford <dledford@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH mlx5-next 3/7] RDMA/mlx5: Remove size from struct
 mlx5_core_mkey
Date: Tue, 12 Oct 2021 13:26:31 +0300
Message-Id: <024e6b2918d48c5f3185032413bafcf45c1488c6.1634033956.git.leonro@nvidia.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1634033956.git.leonro@nvidia.com>
References: <cover.1634033956.git.leonro@nvidia.com>
MIME-Version: 1.0
Cc: Aharon Landau <aharonl@nvidia.com>, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Shay Drory <shayd@nvidia.com>, Jakub Kicinski <kuba@kernel.org>,
 Maor Gottlieb <maorg@nvidia.com>, Saeed Mahameed <saeedm@nvidia.com>
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

From: Aharon Landau <aharonl@nvidia.com>

mkey->size is already stored in ibmr->length, no need to store it here.

Signed-off-by: Aharon Landau <aharonl@nvidia.com>
Reviewed-by: Shay Drory <shayd@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/infiniband/hw/mlx5/devx.c            | 1 -
 drivers/infiniband/hw/mlx5/mr.c              | 5 ++---
 drivers/net/ethernet/mellanox/mlx5/core/mr.c | 1 -
 drivers/vdpa/mlx5/core/resources.c           | 1 -
 include/linux/mlx5/driver.h                  | 1 -
 5 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/infiniband/hw/mlx5/devx.c b/drivers/infiniband/hw/mlx5/devx.c
index 439b62e23afb..3d416850bba8 100644
--- a/drivers/infiniband/hw/mlx5/devx.c
+++ b/drivers/infiniband/hw/mlx5/devx.c
@@ -1303,7 +1303,6 @@ static int devx_handle_mkey_indirect(struct devx_obj *obj,
 	mkey->key = mlx5_idx_to_mkey(
 			MLX5_GET(create_mkey_out, out, mkey_index)) | key;
 	mkey->type = MLX5_MKEY_INDIRECT_DEVX;
-	mkey->size = MLX5_GET64(mkc, mkc, len);
 	mkey->pd = MLX5_GET(mkc, mkc, pd);
 	devx_mr->ndescs = MLX5_GET(mkc, mkc, translations_octword_size);
 	init_waitqueue_head(&mkey->wait);
diff --git a/drivers/infiniband/hw/mlx5/mr.c b/drivers/infiniband/hw/mlx5/mr.c
index e264c6be38f8..6f831598b987 100644
--- a/drivers/infiniband/hw/mlx5/mr.c
+++ b/drivers/infiniband/hw/mlx5/mr.c
@@ -968,7 +968,6 @@ static struct mlx5_ib_mr *alloc_cacheable_mr(struct ib_pd *pd,
 
 	mr->ibmr.pd = pd;
 	mr->umem = umem;
-	mr->mmkey.size = umem->length;
 	mr->mmkey.pd = to_mpd(pd)->pdn;
 	mr->page_shift = order_base_2(page_size);
 	set_mr_fields(dev, mr, umem->length, access_flags, iova);
@@ -1080,7 +1079,7 @@ static void *mlx5_ib_create_xlt_wr(struct mlx5_ib_mr *mr,
 	wr->wr.opcode = MLX5_IB_WR_UMR;
 	wr->pd = mr->ibmr.pd;
 	wr->mkey = mr->mmkey.key;
-	wr->length = mr->mmkey.size;
+	wr->length = mr->ibmr.length;
 	wr->virt_addr = mr->ibmr.iova;
 	wr->access_flags = mr->access_flags;
 	wr->page_shift = mr->page_shift;
@@ -1768,7 +1767,7 @@ static int umr_rereg_pas(struct mlx5_ib_mr *mr, struct ib_pd *pd,
 
 	mr->ibmr.length = new_umem->length;
 	mr->ibmr.iova = iova;
-	mr->mmkey.size = new_umem->length;
+	mr->ibmr.length = new_umem->length;
 	mr->page_shift = order_base_2(page_size);
 	mr->umem = new_umem;
 	err = mlx5_ib_update_mr_pas(mr, upd_flags);
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/mr.c b/drivers/net/ethernet/mellanox/mlx5/core/mr.c
index d239d559994f..b5dd44944265 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/mr.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/mr.c
@@ -52,7 +52,6 @@ int mlx5_core_create_mkey(struct mlx5_core_dev *dev,
 
 	mkc = MLX5_ADDR_OF(create_mkey_in, in, memory_key_mkey_entry);
 	mkey_index = MLX5_GET(create_mkey_out, lout, mkey_index);
-	mkey->size = MLX5_GET64(mkc, mkc, len);
 	mkey->key = (u32)mlx5_mkey_variant(mkey->key) | mlx5_idx_to_mkey(mkey_index);
 	mkey->pd = MLX5_GET(mkc, mkc, pd);
 	init_waitqueue_head(&mkey->wait);
diff --git a/drivers/vdpa/mlx5/core/resources.c b/drivers/vdpa/mlx5/core/resources.c
index 14d4314cdc29..d3d8b8b4e377 100644
--- a/drivers/vdpa/mlx5/core/resources.c
+++ b/drivers/vdpa/mlx5/core/resources.c
@@ -215,7 +215,6 @@ int mlx5_vdpa_create_mkey(struct mlx5_vdpa_dev *mvdev, struct mlx5_core_mkey *mk
 
 	mkc = MLX5_ADDR_OF(create_mkey_in, in, memory_key_mkey_entry);
 	mkey_index = MLX5_GET(create_mkey_out, lout, mkey_index);
-	mkey->size = MLX5_GET64(mkc, mkc, len);
 	mkey->key |= mlx5_idx_to_mkey(mkey_index);
 	mkey->pd = MLX5_GET(mkc, mkc, pd);
 	return 0;
diff --git a/include/linux/mlx5/driver.h b/include/linux/mlx5/driver.h
index 573c0cbb0879..cba157689ca8 100644
--- a/include/linux/mlx5/driver.h
+++ b/include/linux/mlx5/driver.h
@@ -364,7 +364,6 @@ enum {
 };
 
 struct mlx5_core_mkey {
-	u64			size;
 	u32			key;
 	u32			pd;
 	u32			type;
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
