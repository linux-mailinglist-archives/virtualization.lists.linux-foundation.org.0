Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id D907142A202
	for <lists.virtualization@lfdr.de>; Tue, 12 Oct 2021 12:26:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A1AC60B41;
	Tue, 12 Oct 2021 10:26:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LJnOwz0a9Euw; Tue, 12 Oct 2021 10:26:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3EF4060B47;
	Tue, 12 Oct 2021 10:26:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D7DF2C000D;
	Tue, 12 Oct 2021 10:26:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7FF77C000D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Oct 2021 10:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 604D540389
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Oct 2021 10:26:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YSL71qEr1sad
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Oct 2021 10:26:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4ACF240143
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Oct 2021 10:26:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4315A610C7;
 Tue, 12 Oct 2021 10:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634034412;
 bh=HM2oJntcCxsf7EbLYFCsQ76Rl9p/jgR/D3zDE11TI0A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QjY+j8VoDse3VryHKq5jF9Mz0GoPPM+YVtWQdH7rBLg6GZ8WGj9UMsRDueVl09YQh
 vI2w8LjLs5J6kqVyRxPXwPuTtk/+XD2Ia6kNjKfi32Ch8rkTtHId7Yz7meQk+tDsbC
 3lecndv60VDhTv8HaeoDKSZbKFaoTZfXxc31HgZh9bURq0z5+eUqtlelOgUGmK+c16
 TrTvyl8rm0bCFtaM27A6VS6E6e2JUcbP6ET6wR5Rl4tCzw3vFALKcTtrAJjkL7Z6WL
 CqTslAy1kIfXz9afa+k6rbIKxedyWXel4D+hZkqPjc9J4Jz6hmeq1dCQABN5umbl93
 vt619AmVciHpQ==
From: Leon Romanovsky <leon@kernel.org>
To: Doug Ledford <dledford@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH mlx5-next 4/7] RDMA/mlx5: Remove pd from struct mlx5_core_mkey
Date: Tue, 12 Oct 2021 13:26:32 +0300
Message-Id: <63da7254a99d99bfb420f8b6713264eb6c4cd2fc.1634033956.git.leonro@nvidia.com>
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

There is no read of mkey->pd, only write. Remove it.

Signed-off-by: Aharon Landau <aharonl@nvidia.com>
Reviewed-by: Shay Drory <shayd@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/infiniband/hw/mlx5/devx.c            | 1 -
 drivers/infiniband/hw/mlx5/mr.c              | 3 ---
 drivers/net/ethernet/mellanox/mlx5/core/mr.c | 3 ---
 drivers/vdpa/mlx5/core/resources.c           | 3 ---
 include/linux/mlx5/driver.h                  | 1 -
 5 files changed, 11 deletions(-)

diff --git a/drivers/infiniband/hw/mlx5/devx.c b/drivers/infiniband/hw/mlx5/devx.c
index 3d416850bba8..465ea835f854 100644
--- a/drivers/infiniband/hw/mlx5/devx.c
+++ b/drivers/infiniband/hw/mlx5/devx.c
@@ -1303,7 +1303,6 @@ static int devx_handle_mkey_indirect(struct devx_obj *obj,
 	mkey->key = mlx5_idx_to_mkey(
 			MLX5_GET(create_mkey_out, out, mkey_index)) | key;
 	mkey->type = MLX5_MKEY_INDIRECT_DEVX;
-	mkey->pd = MLX5_GET(mkc, mkc, pd);
 	devx_mr->ndescs = MLX5_GET(mkc, mkc, translations_octword_size);
 	init_waitqueue_head(&mkey->wait);
 
diff --git a/drivers/infiniband/hw/mlx5/mr.c b/drivers/infiniband/hw/mlx5/mr.c
index 6f831598b987..1450c2f0da00 100644
--- a/drivers/infiniband/hw/mlx5/mr.c
+++ b/drivers/infiniband/hw/mlx5/mr.c
@@ -968,7 +968,6 @@ static struct mlx5_ib_mr *alloc_cacheable_mr(struct ib_pd *pd,
 
 	mr->ibmr.pd = pd;
 	mr->umem = umem;
-	mr->mmkey.pd = to_mpd(pd)->pdn;
 	mr->page_shift = order_base_2(page_size);
 	set_mr_fields(dev, mr, umem->length, access_flags, iova);
 
@@ -1712,7 +1711,6 @@ static int umr_rereg_pd_access(struct mlx5_ib_mr *mr, struct ib_pd *pd,
 		return err;
 
 	mr->access_flags = access_flags;
-	mr->mmkey.pd = to_mpd(pd)->pdn;
 	return 0;
 }
 
@@ -1757,7 +1755,6 @@ static int umr_rereg_pas(struct mlx5_ib_mr *mr, struct ib_pd *pd,
 
 	if (flags & IB_MR_REREG_PD) {
 		mr->ibmr.pd = pd;
-		mr->mmkey.pd = to_mpd(pd)->pdn;
 		upd_flags |= MLX5_IB_UPD_XLT_PD;
 	}
 	if (flags & IB_MR_REREG_ACCESS) {
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/mr.c b/drivers/net/ethernet/mellanox/mlx5/core/mr.c
index b5dd44944265..6e99fd166f98 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/mr.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/mr.c
@@ -41,7 +41,6 @@ int mlx5_core_create_mkey(struct mlx5_core_dev *dev,
 {
 	u32 lout[MLX5_ST_SZ_DW(create_mkey_out)] = {};
 	u32 mkey_index;
-	void *mkc;
 	int err;
 
 	MLX5_SET(create_mkey_in, in, opcode, MLX5_CMD_OP_CREATE_MKEY);
@@ -50,10 +49,8 @@ int mlx5_core_create_mkey(struct mlx5_core_dev *dev,
 	if (err)
 		return err;
 
-	mkc = MLX5_ADDR_OF(create_mkey_in, in, memory_key_mkey_entry);
 	mkey_index = MLX5_GET(create_mkey_out, lout, mkey_index);
 	mkey->key = (u32)mlx5_mkey_variant(mkey->key) | mlx5_idx_to_mkey(mkey_index);
-	mkey->pd = MLX5_GET(mkc, mkc, pd);
 	init_waitqueue_head(&mkey->wait);
 
 	mlx5_core_dbg(dev, "out 0x%x, mkey 0x%x\n", mkey_index, mkey->key);
diff --git a/drivers/vdpa/mlx5/core/resources.c b/drivers/vdpa/mlx5/core/resources.c
index d3d8b8b4e377..72b2d80e75b0 100644
--- a/drivers/vdpa/mlx5/core/resources.c
+++ b/drivers/vdpa/mlx5/core/resources.c
@@ -203,7 +203,6 @@ int mlx5_vdpa_create_mkey(struct mlx5_vdpa_dev *mvdev, struct mlx5_core_mkey *mk
 {
 	u32 lout[MLX5_ST_SZ_DW(create_mkey_out)] = {};
 	u32 mkey_index;
-	void *mkc;
 	int err;
 
 	MLX5_SET(create_mkey_in, in, opcode, MLX5_CMD_OP_CREATE_MKEY);
@@ -213,10 +212,8 @@ int mlx5_vdpa_create_mkey(struct mlx5_vdpa_dev *mvdev, struct mlx5_core_mkey *mk
 	if (err)
 		return err;
 
-	mkc = MLX5_ADDR_OF(create_mkey_in, in, memory_key_mkey_entry);
 	mkey_index = MLX5_GET(create_mkey_out, lout, mkey_index);
 	mkey->key |= mlx5_idx_to_mkey(mkey_index);
-	mkey->pd = MLX5_GET(mkc, mkc, pd);
 	return 0;
 }
 
diff --git a/include/linux/mlx5/driver.h b/include/linux/mlx5/driver.h
index cba157689ca8..31e19f06bc3a 100644
--- a/include/linux/mlx5/driver.h
+++ b/include/linux/mlx5/driver.h
@@ -365,7 +365,6 @@ enum {
 
 struct mlx5_core_mkey {
 	u32			key;
-	u32			pd;
 	u32			type;
 	struct wait_queue_head wait;
 	refcount_t usecount;
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
