Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id D993D42A1FD
	for <lists.virtualization@lfdr.de>; Tue, 12 Oct 2021 12:26:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4999760B44;
	Tue, 12 Oct 2021 10:26:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qSMeAGQSB8OR; Tue, 12 Oct 2021 10:26:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id F203960B3D;
	Tue, 12 Oct 2021 10:26:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C58DC000D;
	Tue, 12 Oct 2021 10:26:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A86C0C000D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Oct 2021 10:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A34AB400F6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Oct 2021 10:26:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fS_IM3tYtaLk
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Oct 2021 10:26:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 96D6240389
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Oct 2021 10:26:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 828AF610A3;
 Tue, 12 Oct 2021 10:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634034408;
 bh=DFhmPX20uaAfBqUdFj1bWsDLOYQ9xrYvP6vVVoyrZbA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eHQrz0GtQOtQOEEX+lAIFeMX1mDA77v56EzdNnrjusumMzUdg6dltfYw064BzaY3t
 y4Uw9fFcAamC0+aAeM4tHiXNhMQWcXcOM51hu0lwoQADRRszh2TDp4lZwQb06RBH07
 SQG2Q8+MSrYC6rIm6K92tWbAhL9DFwmRP/9dYTcoaxagEcONEbsdLQALXQ3WUOg7wg
 4/tmbfJyyXASK0ekxTtikicl3ODhkQ3j90vwraSChUzX9Ln3cKG2sP387wcd7eagWf
 6owdQT5xs2NpO5DTv2zLZTzjj5tQ+xhsZXY/B3yQpec0z8U2w2Ctqa9JDUpPCd7/mP
 FGb/cZLeOQnMw==
From: Leon Romanovsky <leon@kernel.org>
To: Doug Ledford <dledford@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH mlx5-next 2/7] RDMA/mlx5: Remove iova from struct
 mlx5_core_mkey
Date: Tue, 12 Oct 2021 13:26:30 +0300
Message-Id: <26b5875f5ffa601ae25413bda4d1df61ea79d268.1634033956.git.leonro@nvidia.com>
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

iova is already stored in ibmr->iova, no need to store it here.

Signed-off-by: Aharon Landau <aharonl@nvidia.com>
Reviewed-by: Shay Drory <shayd@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/infiniband/hw/mlx5/devx.c            |  1 -
 drivers/infiniband/hw/mlx5/mr.c              | 16 ++++++++--------
 drivers/infiniband/hw/mlx5/odp.c             |  8 ++++----
 drivers/net/ethernet/mellanox/mlx5/core/mr.c |  1 -
 drivers/vdpa/mlx5/core/resources.c           |  1 -
 include/linux/mlx5/driver.h                  |  1 -
 6 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/infiniband/hw/mlx5/devx.c b/drivers/infiniband/hw/mlx5/devx.c
index 7c920be2921d..439b62e23afb 100644
--- a/drivers/infiniband/hw/mlx5/devx.c
+++ b/drivers/infiniband/hw/mlx5/devx.c
@@ -1303,7 +1303,6 @@ static int devx_handle_mkey_indirect(struct devx_obj *obj,
 	mkey->key = mlx5_idx_to_mkey(
 			MLX5_GET(create_mkey_out, out, mkey_index)) | key;
 	mkey->type = MLX5_MKEY_INDIRECT_DEVX;
-	mkey->iova = MLX5_GET64(mkc, mkc, start_addr);
 	mkey->size = MLX5_GET64(mkc, mkc, len);
 	mkey->pd = MLX5_GET(mkc, mkc, pd);
 	devx_mr->ndescs = MLX5_GET(mkc, mkc, translations_octword_size);
diff --git a/drivers/infiniband/hw/mlx5/mr.c b/drivers/infiniband/hw/mlx5/mr.c
index 0ffe7f5b77b6..e264c6be38f8 100644
--- a/drivers/infiniband/hw/mlx5/mr.c
+++ b/drivers/infiniband/hw/mlx5/mr.c
@@ -904,12 +904,13 @@ static struct mlx5_cache_ent *mr_cache_ent_from_order(struct mlx5_ib_dev *dev,
 }
 
 static void set_mr_fields(struct mlx5_ib_dev *dev, struct mlx5_ib_mr *mr,
-			  u64 length, int access_flags)
+			  u64 length, int access_flags, u64 iova)
 {
 	mr->ibmr.lkey = mr->mmkey.key;
 	mr->ibmr.rkey = mr->mmkey.key;
 	mr->ibmr.length = length;
 	mr->ibmr.device = &dev->ib_dev;
+	mr->ibmr.iova = iova;
 	mr->access_flags = access_flags;
 }
 
@@ -967,11 +968,10 @@ static struct mlx5_ib_mr *alloc_cacheable_mr(struct ib_pd *pd,
 
 	mr->ibmr.pd = pd;
 	mr->umem = umem;
-	mr->mmkey.iova = iova;
 	mr->mmkey.size = umem->length;
 	mr->mmkey.pd = to_mpd(pd)->pdn;
 	mr->page_shift = order_base_2(page_size);
-	set_mr_fields(dev, mr, umem->length, access_flags);
+	set_mr_fields(dev, mr, umem->length, access_flags, iova);
 
 	return mr;
 }
@@ -1081,7 +1081,7 @@ static void *mlx5_ib_create_xlt_wr(struct mlx5_ib_mr *mr,
 	wr->pd = mr->ibmr.pd;
 	wr->mkey = mr->mmkey.key;
 	wr->length = mr->mmkey.size;
-	wr->virt_addr = mr->mmkey.iova;
+	wr->virt_addr = mr->ibmr.iova;
 	wr->access_flags = mr->access_flags;
 	wr->page_shift = mr->page_shift;
 	wr->xlt_size = sg->length;
@@ -1336,7 +1336,7 @@ static struct mlx5_ib_mr *reg_create(struct ib_pd *pd, struct ib_umem *umem,
 	}
 	mr->mmkey.type = MLX5_MKEY_MR;
 	mr->umem = umem;
-	set_mr_fields(dev, mr, umem->length, access_flags);
+	set_mr_fields(dev, mr, umem->length, access_flags, iova);
 	kvfree(in);
 
 	mlx5_ib_dbg(dev, "mkey = 0x%x\n", mr->mmkey.key);
@@ -1383,7 +1383,7 @@ static struct ib_mr *mlx5_ib_get_dm_mr(struct ib_pd *pd, u64 start_addr,
 
 	kfree(in);
 
-	set_mr_fields(dev, mr, length, acc);
+	set_mr_fields(dev, mr, length, acc, start_addr);
 
 	return &mr->ibmr;
 
@@ -1767,7 +1767,7 @@ static int umr_rereg_pas(struct mlx5_ib_mr *mr, struct ib_pd *pd,
 	}
 
 	mr->ibmr.length = new_umem->length;
-	mr->mmkey.iova = iova;
+	mr->ibmr.iova = iova;
 	mr->mmkey.size = new_umem->length;
 	mr->page_shift = order_base_2(page_size);
 	mr->umem = new_umem;
@@ -1847,7 +1847,7 @@ struct ib_mr *mlx5_ib_rereg_user_mr(struct ib_mr *ib_mr, int flags, u64 start,
 		mr->umem = NULL;
 		atomic_sub(ib_umem_num_pages(umem), &dev->mdev->priv.reg_pages);
 
-		return create_real_mr(new_pd, umem, mr->mmkey.iova,
+		return create_real_mr(new_pd, umem, mr->ibmr.iova,
 				      new_access_flags);
 	}
 
diff --git a/drivers/infiniband/hw/mlx5/odp.c b/drivers/infiniband/hw/mlx5/odp.c
index 77890a85fc2d..3b24cfc96d36 100644
--- a/drivers/infiniband/hw/mlx5/odp.c
+++ b/drivers/infiniband/hw/mlx5/odp.c
@@ -430,7 +430,7 @@ static struct mlx5_ib_mr *implicit_get_child_mr(struct mlx5_ib_mr *imr,
 	mr->umem = &odp->umem;
 	mr->ibmr.lkey = mr->mmkey.key;
 	mr->ibmr.rkey = mr->mmkey.key;
-	mr->mmkey.iova = idx * MLX5_IMR_MTT_SIZE;
+	mr->ibmr.iova = idx * MLX5_IMR_MTT_SIZE;
 	mr->parent = imr;
 	odp->private = mr;
 
@@ -500,7 +500,7 @@ struct mlx5_ib_mr *mlx5_ib_alloc_implicit_mr(struct mlx5_ib_pd *pd,
 	}
 
 	imr->ibmr.pd = &pd->ibpd;
-	imr->mmkey.iova = 0;
+	imr->ibmr.iova = 0;
 	imr->umem = &umem_odp->umem;
 	imr->ibmr.lkey = imr->mmkey.key;
 	imr->ibmr.rkey = imr->mmkey.key;
@@ -738,7 +738,7 @@ static int pagefault_mr(struct mlx5_ib_mr *mr, u64 io_virt, size_t bcnt,
 {
 	struct ib_umem_odp *odp = to_ib_umem_odp(mr->umem);
 
-	if (unlikely(io_virt < mr->mmkey.iova))
+	if (unlikely(io_virt < mr->ibmr.iova))
 		return -EFAULT;
 
 	if (mr->umem->is_dmabuf)
@@ -747,7 +747,7 @@ static int pagefault_mr(struct mlx5_ib_mr *mr, u64 io_virt, size_t bcnt,
 	if (!odp->is_implicit_odp) {
 		u64 user_va;
 
-		if (check_add_overflow(io_virt - mr->mmkey.iova,
+		if (check_add_overflow(io_virt - mr->ibmr.iova,
 				       (u64)odp->umem.address, &user_va))
 			return -EFAULT;
 		if (unlikely(user_va >= ib_umem_end(odp) ||
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/mr.c b/drivers/net/ethernet/mellanox/mlx5/core/mr.c
index 174f71ed5280..d239d559994f 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/mr.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/mr.c
@@ -52,7 +52,6 @@ int mlx5_core_create_mkey(struct mlx5_core_dev *dev,
 
 	mkc = MLX5_ADDR_OF(create_mkey_in, in, memory_key_mkey_entry);
 	mkey_index = MLX5_GET(create_mkey_out, lout, mkey_index);
-	mkey->iova = MLX5_GET64(mkc, mkc, start_addr);
 	mkey->size = MLX5_GET64(mkc, mkc, len);
 	mkey->key = (u32)mlx5_mkey_variant(mkey->key) | mlx5_idx_to_mkey(mkey_index);
 	mkey->pd = MLX5_GET(mkc, mkc, pd);
diff --git a/drivers/vdpa/mlx5/core/resources.c b/drivers/vdpa/mlx5/core/resources.c
index 15e266d0e27a..14d4314cdc29 100644
--- a/drivers/vdpa/mlx5/core/resources.c
+++ b/drivers/vdpa/mlx5/core/resources.c
@@ -215,7 +215,6 @@ int mlx5_vdpa_create_mkey(struct mlx5_vdpa_dev *mvdev, struct mlx5_core_mkey *mk
 
 	mkc = MLX5_ADDR_OF(create_mkey_in, in, memory_key_mkey_entry);
 	mkey_index = MLX5_GET(create_mkey_out, lout, mkey_index);
-	mkey->iova = MLX5_GET64(mkc, mkc, start_addr);
 	mkey->size = MLX5_GET64(mkc, mkc, len);
 	mkey->key |= mlx5_idx_to_mkey(mkey_index);
 	mkey->pd = MLX5_GET(mkc, mkc, pd);
diff --git a/include/linux/mlx5/driver.h b/include/linux/mlx5/driver.h
index 1b8bae246b28..573c0cbb0879 100644
--- a/include/linux/mlx5/driver.h
+++ b/include/linux/mlx5/driver.h
@@ -364,7 +364,6 @@ enum {
 };
 
 struct mlx5_core_mkey {
-	u64			iova;
 	u64			size;
 	u32			key;
 	u32			pd;
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
