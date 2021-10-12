Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6DB42A206
	for <lists.virtualization@lfdr.de>; Tue, 12 Oct 2021 12:27:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8763860B47;
	Tue, 12 Oct 2021 10:27:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8hJs0-l_TC3S; Tue, 12 Oct 2021 10:27:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id F284360B6D;
	Tue, 12 Oct 2021 10:27:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A17CAC000D;
	Tue, 12 Oct 2021 10:27:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A2281C000D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Oct 2021 10:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85A1881751
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Oct 2021 10:27:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2l2iU3wLU8RZ
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Oct 2021 10:27:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B295C81570
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Oct 2021 10:27:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B173F610D1;
 Tue, 12 Oct 2021 10:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634034423;
 bh=rzUaznX8/js0eCYRNTaJ5ZVAThgQadrCo2aJv/HqEi4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SxHaeHsYC//kEYPDLaUWX3a+Rc28jyD+ZMm+1ljXQb5/C0nR99wFf6XYilMBzlFWo
 xqN29SIzMPCGvnGZGV8WKINm4PJjhVtWUXxswZ856MEGGbYw/PCtumoCdiuYrIYv04
 OKzqCfcfV80d47DtxlzezlakrfAZhJ9CdbJqhP+jtPydwo+39oWxNBPmRceOLon6uW
 N3qrNrXulto34ndWNohcdupyZqQ3VJIRw/mDCD8BC5YgUtxshgIhbbGRrKKP631KYk
 WKHlMRKUUsX7NDU6MSNF0OgjZGMvmdDLEb5TkNM6sZfbP61Z+B6zuz2tKYDXWbnyJ9
 l0WB697Xw6MYw==
From: Leon Romanovsky <leon@kernel.org>
To: Doug Ledford <dledford@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH mlx5-next 7/7] RDMA/mlx5: Attach ndescs to mlx5_ib_mkey
Date: Tue, 12 Oct 2021 13:26:35 +0300
Message-Id: <4bf22f9401a01df13804b90f9c7e90e36c788bd9.1634033957.git.leonro@nvidia.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1634033956.git.leonro@nvidia.com>
References: <cover.1634033956.git.leonro@nvidia.com>
MIME-Version: 1.0
Cc: Aharon Landau <aharonl@nvidia.com>, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Saeed Mahameed <saeedm@nvidia.com>, Shay Drory <shayd@nvidia.com>,
 Jakub Kicinski <kuba@kernel.org>, Maor Gottlieb <maorg@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>
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

Generalize the use of ndescs by adding it to mlx5_ib_mkey.

Signed-off-by: Aharon Landau <aharonl@nvidia.com>
Reviewed-by: Shay Drory <shayd@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/infiniband/hw/mlx5/devx.c    | 10 ++++------
 drivers/infiniband/hw/mlx5/devx.h    |  2 +-
 drivers/infiniband/hw/mlx5/mlx5_ib.h |  8 +-------
 drivers/infiniband/hw/mlx5/mr.c      | 24 ++++++++++++------------
 drivers/infiniband/hw/mlx5/odp.c     | 22 ++--------------------
 drivers/infiniband/hw/mlx5/wr.c      | 10 +++++-----
 6 files changed, 25 insertions(+), 51 deletions(-)

diff --git a/drivers/infiniband/hw/mlx5/devx.c b/drivers/infiniband/hw/mlx5/devx.c
index 2778b10ffd48..2baecf0367e5 100644
--- a/drivers/infiniband/hw/mlx5/devx.c
+++ b/drivers/infiniband/hw/mlx5/devx.c
@@ -1292,18 +1292,16 @@ static int devx_handle_mkey_indirect(struct devx_obj *obj,
 				     struct mlx5_ib_dev *dev,
 				     void *in, void *out)
 {
-	struct mlx5_ib_devx_mr *devx_mr = &obj->devx_mr;
-	struct mlx5_ib_mkey *mkey;
+	struct mlx5_ib_mkey *mkey = &obj->mkey;
 	void *mkc;
 	u8 key;
 
-	mkey = &devx_mr->mmkey;
 	mkc = MLX5_ADDR_OF(create_mkey_in, in, memory_key_mkey_entry);
 	key = MLX5_GET(mkc, mkc, mkey_7_0);
 	mkey->key = mlx5_idx_to_mkey(
 			MLX5_GET(create_mkey_out, out, mkey_index)) | key;
 	mkey->type = MLX5_MKEY_INDIRECT_DEVX;
-	devx_mr->ndescs = MLX5_GET(mkc, mkc, translations_octword_size);
+	mkey->ndescs = MLX5_GET(mkc, mkc, translations_octword_size);
 	init_waitqueue_head(&mkey->wait);
 
 	return mlx5r_store_odp_mkey(dev, mkey);
@@ -1381,13 +1379,13 @@ static int devx_obj_cleanup(struct ib_uobject *uobject,
 	dev = mlx5_udata_to_mdev(&attrs->driver_udata);
 	if (obj->flags & DEVX_OBJ_FLAGS_INDIRECT_MKEY &&
 	    xa_erase(&obj->ib_dev->odp_mkeys,
-		     mlx5_base_mkey(obj->devx_mr.mmkey.key)))
+		     mlx5_base_mkey(obj->mkey.key)))
 		/*
 		 * The pagefault_single_data_segment() does commands against
 		 * the mmkey, we must wait for that to stop before freeing the
 		 * mkey, as another allocation could get the same mkey #.
 		 */
-		mlx5r_deref_wait_odp_mkey(&obj->devx_mr.mmkey);
+		mlx5r_deref_wait_odp_mkey(&obj->mkey);
 
 	if (obj->flags & DEVX_OBJ_FLAGS_DCT)
 		ret = mlx5_core_destroy_dct(obj->ib_dev, &obj->core_dct);
diff --git a/drivers/infiniband/hw/mlx5/devx.h b/drivers/infiniband/hw/mlx5/devx.h
index 1f69866aed16..ee2213275fd6 100644
--- a/drivers/infiniband/hw/mlx5/devx.h
+++ b/drivers/infiniband/hw/mlx5/devx.h
@@ -16,7 +16,7 @@ struct devx_obj {
 	u32			dinbox[MLX5_MAX_DESTROY_INBOX_SIZE_DW];
 	u32			flags;
 	union {
-		struct mlx5_ib_devx_mr	devx_mr;
+		struct mlx5_ib_mkey	mkey;
 		struct mlx5_core_dct	core_dct;
 		struct mlx5_core_cq	core_cq;
 		u32			flow_counter_bulk_size;
diff --git a/drivers/infiniband/hw/mlx5/mlx5_ib.h b/drivers/infiniband/hw/mlx5/mlx5_ib.h
index ef6087a9f93b..ed173af8ae75 100644
--- a/drivers/infiniband/hw/mlx5/mlx5_ib.h
+++ b/drivers/infiniband/hw/mlx5/mlx5_ib.h
@@ -637,6 +637,7 @@ enum mlx5_mkey_type {
 struct mlx5_ib_mkey {
 	u32			key;
 	enum mlx5_mkey_type	type;
+	int			ndescs;
 	struct wait_queue_head wait;
 	refcount_t usecount;
 };
@@ -681,7 +682,6 @@ struct mlx5_ib_mr {
 			void *descs_alloc;
 			dma_addr_t desc_map;
 			int max_descs;
-			int ndescs;
 			int desc_size;
 			int access_mode;
 
@@ -736,12 +736,6 @@ static inline bool is_dmabuf_mr(struct mlx5_ib_mr *mr)
 struct mlx5_ib_mw {
 	struct ib_mw		ibmw;
 	struct mlx5_ib_mkey	mmkey;
-	int			ndescs;
-};
-
-struct mlx5_ib_devx_mr {
-	struct mlx5_ib_mkey	mmkey;
-	int			ndescs;
 };
 
 struct mlx5_ib_umr_context {
diff --git a/drivers/infiniband/hw/mlx5/mr.c b/drivers/infiniband/hw/mlx5/mr.c
index 675be5b1de9c..0c4a5ac2544c 100644
--- a/drivers/infiniband/hw/mlx5/mr.c
+++ b/drivers/infiniband/hw/mlx5/mr.c
@@ -2335,7 +2335,7 @@ int mlx5_ib_alloc_mw(struct ib_mw *ibmw, struct ib_udata *udata)
 
 	mw->mmkey.type = MLX5_MKEY_MW;
 	ibmw->rkey = mw->mmkey.key;
-	mw->ndescs = ndescs;
+	mw->mmkey.ndescs = ndescs;
 
 	resp.response_length =
 		min(offsetofend(typeof(resp), response_length), udata->outlen);
@@ -2431,7 +2431,7 @@ mlx5_ib_map_pa_mr_sg_pi(struct ib_mr *ibmr, struct scatterlist *data_sg,
 	mr->meta_length = 0;
 	if (data_sg_nents == 1) {
 		n++;
-		mr->ndescs = 1;
+		mr->mmkey.ndescs = 1;
 		if (data_sg_offset)
 			sg_offset = *data_sg_offset;
 		mr->data_length = sg_dma_len(data_sg) - sg_offset;
@@ -2484,7 +2484,7 @@ mlx5_ib_sg_to_klms(struct mlx5_ib_mr *mr,
 	if (sg_offset_p)
 		*sg_offset_p = sg_offset;
 
-	mr->ndescs = i;
+	mr->mmkey.ndescs = i;
 	mr->data_length = mr->ibmr.length;
 
 	if (meta_sg_nents) {
@@ -2517,11 +2517,11 @@ static int mlx5_set_page(struct ib_mr *ibmr, u64 addr)
 	struct mlx5_ib_mr *mr = to_mmr(ibmr);
 	__be64 *descs;
 
-	if (unlikely(mr->ndescs == mr->max_descs))
+	if (unlikely(mr->mmkey.ndescs == mr->max_descs))
 		return -ENOMEM;
 
 	descs = mr->descs;
-	descs[mr->ndescs++] = cpu_to_be64(addr | MLX5_EN_RD | MLX5_EN_WR);
+	descs[mr->mmkey.ndescs++] = cpu_to_be64(addr | MLX5_EN_RD | MLX5_EN_WR);
 
 	return 0;
 }
@@ -2531,11 +2531,11 @@ static int mlx5_set_page_pi(struct ib_mr *ibmr, u64 addr)
 	struct mlx5_ib_mr *mr = to_mmr(ibmr);
 	__be64 *descs;
 
-	if (unlikely(mr->ndescs + mr->meta_ndescs == mr->max_descs))
+	if (unlikely(mr->mmkey.ndescs + mr->meta_ndescs == mr->max_descs))
 		return -ENOMEM;
 
 	descs = mr->descs;
-	descs[mr->ndescs + mr->meta_ndescs++] =
+	descs[mr->mmkey.ndescs + mr->meta_ndescs++] =
 		cpu_to_be64(addr | MLX5_EN_RD | MLX5_EN_WR);
 
 	return 0;
@@ -2551,7 +2551,7 @@ mlx5_ib_map_mtt_mr_sg_pi(struct ib_mr *ibmr, struct scatterlist *data_sg,
 	struct mlx5_ib_mr *pi_mr = mr->mtt_mr;
 	int n;
 
-	pi_mr->ndescs = 0;
+	pi_mr->mmkey.ndescs = 0;
 	pi_mr->meta_ndescs = 0;
 	pi_mr->meta_length = 0;
 
@@ -2585,7 +2585,7 @@ mlx5_ib_map_mtt_mr_sg_pi(struct ib_mr *ibmr, struct scatterlist *data_sg,
 		 * metadata offset at the first metadata page
 		 */
 		pi_mr->pi_iova = (iova & page_mask) +
-				 pi_mr->ndescs * ibmr->page_size +
+				 pi_mr->mmkey.ndescs * ibmr->page_size +
 				 (pi_mr->ibmr.iova & ~page_mask);
 		/*
 		 * In order to use one MTT MR for data and metadata, we register
@@ -2616,7 +2616,7 @@ mlx5_ib_map_klm_mr_sg_pi(struct ib_mr *ibmr, struct scatterlist *data_sg,
 	struct mlx5_ib_mr *pi_mr = mr->klm_mr;
 	int n;
 
-	pi_mr->ndescs = 0;
+	pi_mr->mmkey.ndescs = 0;
 	pi_mr->meta_ndescs = 0;
 	pi_mr->meta_length = 0;
 
@@ -2651,7 +2651,7 @@ int mlx5_ib_map_mr_sg_pi(struct ib_mr *ibmr, struct scatterlist *data_sg,
 
 	WARN_ON(ibmr->type != IB_MR_TYPE_INTEGRITY);
 
-	mr->ndescs = 0;
+	mr->mmkey.ndescs = 0;
 	mr->data_length = 0;
 	mr->data_iova = 0;
 	mr->meta_ndescs = 0;
@@ -2707,7 +2707,7 @@ int mlx5_ib_map_mr_sg(struct ib_mr *ibmr, struct scatterlist *sg, int sg_nents,
 	struct mlx5_ib_mr *mr = to_mmr(ibmr);
 	int n;
 
-	mr->ndescs = 0;
+	mr->mmkey.ndescs = 0;
 
 	ib_dma_sync_single_for_cpu(ibmr->device, mr->desc_map,
 				   mr->desc_size * mr->max_descs,
diff --git a/drivers/infiniband/hw/mlx5/odp.c b/drivers/infiniband/hw/mlx5/odp.c
index 8dd9d8457767..31596d8c5212 100644
--- a/drivers/infiniband/hw/mlx5/odp.c
+++ b/drivers/infiniband/hw/mlx5/odp.c
@@ -797,21 +797,6 @@ static bool mkey_is_eq(struct mlx5_ib_mkey *mmkey, u32 key)
 	return mmkey->key == key;
 }
 
-static int get_indirect_num_descs(struct mlx5_ib_mkey *mmkey)
-{
-	struct mlx5_ib_mw *mw;
-	struct mlx5_ib_devx_mr *devx_mr;
-
-	if (mmkey->type == MLX5_MKEY_MW) {
-		mw = container_of(mmkey, struct mlx5_ib_mw, mmkey);
-		return mw->ndescs;
-	}
-
-	devx_mr = container_of(mmkey, struct mlx5_ib_devx_mr,
-			       mmkey);
-	return devx_mr->ndescs;
-}
-
 /*
  * Handle a single data segment in a page-fault WQE or RDMA region.
  *
@@ -836,7 +821,6 @@ static int pagefault_single_data_segment(struct mlx5_ib_dev *dev,
 	struct mlx5_klm *pklm;
 	u32 *out = NULL;
 	size_t offset;
-	int ndescs;
 
 	io_virt += *bytes_committed;
 	bcnt -= *bytes_committed;
@@ -885,8 +869,6 @@ static int pagefault_single_data_segment(struct mlx5_ib_dev *dev,
 
 	case MLX5_MKEY_MW:
 	case MLX5_MKEY_INDIRECT_DEVX:
-		ndescs = get_indirect_num_descs(mmkey);
-
 		if (depth >= MLX5_CAP_GEN(dev->mdev, max_indirection)) {
 			mlx5_ib_dbg(dev, "indirection level exceeded\n");
 			ret = -EFAULT;
@@ -894,7 +876,7 @@ static int pagefault_single_data_segment(struct mlx5_ib_dev *dev,
 		}
 
 		outlen = MLX5_ST_SZ_BYTES(query_mkey_out) +
-			sizeof(*pklm) * (ndescs - 2);
+			sizeof(*pklm) * (mmkey->ndescs - 2);
 
 		if (outlen > cur_outlen) {
 			kfree(out);
@@ -916,7 +898,7 @@ static int pagefault_single_data_segment(struct mlx5_ib_dev *dev,
 		offset = io_virt - MLX5_GET64(query_mkey_out, out,
 					      memory_key_mkey_entry.start_addr);
 
-		for (i = 0; bcnt && i < ndescs; i++, pklm++) {
+		for (i = 0; bcnt && i < mmkey->ndescs; i++, pklm++) {
 			if (offset >= be32_to_cpu(pklm->bcount)) {
 				offset -= be32_to_cpu(pklm->bcount);
 				continue;
diff --git a/drivers/infiniband/hw/mlx5/wr.c b/drivers/infiniband/hw/mlx5/wr.c
index 8841620af82f..51e48ca9016e 100644
--- a/drivers/infiniband/hw/mlx5/wr.c
+++ b/drivers/infiniband/hw/mlx5/wr.c
@@ -217,7 +217,7 @@ static __be64 sig_mkey_mask(void)
 static void set_reg_umr_seg(struct mlx5_wqe_umr_ctrl_seg *umr,
 			    struct mlx5_ib_mr *mr, u8 flags, bool atomic)
 {
-	int size = (mr->ndescs + mr->meta_ndescs) * mr->desc_size;
+	int size = (mr->mmkey.ndescs + mr->meta_ndescs) * mr->desc_size;
 
 	memset(umr, 0, sizeof(*umr));
 
@@ -374,7 +374,7 @@ static void set_reg_mkey_seg(struct mlx5_mkey_seg *seg,
 			     struct mlx5_ib_mr *mr,
 			     u32 key, int access)
 {
-	int ndescs = ALIGN(mr->ndescs + mr->meta_ndescs, 8) >> 1;
+	int ndescs = ALIGN(mr->mmkey.ndescs + mr->meta_ndescs, 8) >> 1;
 
 	memset(seg, 0, sizeof(*seg));
 
@@ -439,7 +439,7 @@ static void set_reg_data_seg(struct mlx5_wqe_data_seg *dseg,
 			     struct mlx5_ib_mr *mr,
 			     struct mlx5_ib_pd *pd)
 {
-	int bcount = mr->desc_size * (mr->ndescs + mr->meta_ndescs);
+	int bcount = mr->desc_size * (mr->mmkey.ndescs + mr->meta_ndescs);
 
 	dseg->addr = cpu_to_be64(mr->desc_map);
 	dseg->byte_count = cpu_to_be32(ALIGN(bcount, 64));
@@ -861,7 +861,7 @@ static int set_reg_wr(struct mlx5_ib_qp *qp,
 	struct mlx5_ib_mr *mr = to_mmr(wr->mr);
 	struct mlx5_ib_pd *pd = to_mpd(qp->ibqp.pd);
 	struct mlx5_ib_dev *dev = to_mdev(pd->ibpd.device);
-	int mr_list_size = (mr->ndescs + mr->meta_ndescs) * mr->desc_size;
+	int mr_list_size = (mr->mmkey.ndescs + mr->meta_ndescs) * mr->desc_size;
 	bool umr_inline = mr_list_size <= MLX5_IB_SQ_UMR_INLINE_THRESHOLD;
 	bool atomic = wr->access & IB_ACCESS_REMOTE_ATOMIC;
 	u8 flags = 0;
@@ -1111,7 +1111,7 @@ static int handle_reg_mr_integrity(struct mlx5_ib_dev *dev,
 		memset(&pa_pi_mr, 0, sizeof(struct mlx5_ib_mr));
 		/* No UMR, use local_dma_lkey */
 		pa_pi_mr.ibmr.lkey = mr->ibmr.pd->local_dma_lkey;
-		pa_pi_mr.ndescs = mr->ndescs;
+		pa_pi_mr.mmkey.ndescs = mr->mmkey.ndescs;
 		pa_pi_mr.data_length = mr->data_length;
 		pa_pi_mr.data_iova = mr->data_iova;
 		if (mr->meta_ndescs) {
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
