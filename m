Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C787123DB81
	for <lists.virtualization@lfdr.de>; Thu,  6 Aug 2020 18:08:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7895F88382;
	Thu,  6 Aug 2020 16:08:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pO7c48hpSNSU; Thu,  6 Aug 2020 16:08:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 76A2A88384;
	Thu,  6 Aug 2020 16:08:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 458DEC004C;
	Thu,  6 Aug 2020 16:08:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 56E5EC004C
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Aug 2020 16:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 44ACD88574
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Aug 2020 16:08:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0jC-tBT0QBWc
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Aug 2020 16:08:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 43B2C8855F
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Aug 2020 16:08:34 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1k3iRR-0001NL-01; Thu, 06 Aug 2020 16:08:29 +0000
From: Colin King <colin.king@canonical.com>
To: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Parav Pandit <parav@mellanox.com>,
 virtualization@lists.linux-foundation.org
Subject: [PATCH][next] vdpa/mlx5: fix memory allocation failure checks
Date: Thu,  6 Aug 2020 17:08:28 +0100
Message-Id: <20200806160828.90463-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

From: Colin Ian King <colin.king@canonical.com>

The memory allocation failure checking for in and out is currently
checking if the pointers are valid rather than the contents of what
they point to. Hence the null check on failed memory allocations is
incorrect.  Fix this by adding the missing indirection in the check.
Also for the default case, just set the *in and *out to null as
these don't have any thing allocated to kfree. Finally remove the
redundant *in and *out check as these have been already done on each
allocation in the case statement.

Addresses-Coverity: ("Null pointer dereference")
Fixes: 1a86b377aa21 ("vdpa/mlx5: Add VDPA driver for supported mlx5 devices")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/vdpa/mlx5/net/mlx5_vnet.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/mlx5_vnet.c
index 3ec44a4f0e45..55bc58e1dae9 100644
--- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
+++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
@@ -867,7 +867,7 @@ static void alloc_inout(struct mlx5_vdpa_net *ndev, int cmd, void **in, int *inl
 		*outlen = MLX5_ST_SZ_BYTES(qp_2rst_out);
 		*in = kzalloc(*inlen, GFP_KERNEL);
 		*out = kzalloc(*outlen, GFP_KERNEL);
-		if (!in || !out)
+		if (!*in || !*out)
 			goto outerr;
 
 		MLX5_SET(qp_2rst_in, *in, opcode, cmd);
@@ -879,7 +879,7 @@ static void alloc_inout(struct mlx5_vdpa_net *ndev, int cmd, void **in, int *inl
 		*outlen = MLX5_ST_SZ_BYTES(rst2init_qp_out);
 		*in = kzalloc(*inlen, GFP_KERNEL);
 		*out = kzalloc(MLX5_ST_SZ_BYTES(rst2init_qp_out), GFP_KERNEL);
-		if (!in || !out)
+		if (!*in || !*out)
 			goto outerr;
 
 		MLX5_SET(rst2init_qp_in, *in, opcode, cmd);
@@ -896,7 +896,7 @@ static void alloc_inout(struct mlx5_vdpa_net *ndev, int cmd, void **in, int *inl
 		*outlen = MLX5_ST_SZ_BYTES(init2rtr_qp_out);
 		*in = kzalloc(*inlen, GFP_KERNEL);
 		*out = kzalloc(MLX5_ST_SZ_BYTES(init2rtr_qp_out), GFP_KERNEL);
-		if (!in || !out)
+		if (!*in || !*out)
 			goto outerr;
 
 		MLX5_SET(init2rtr_qp_in, *in, opcode, cmd);
@@ -914,7 +914,7 @@ static void alloc_inout(struct mlx5_vdpa_net *ndev, int cmd, void **in, int *inl
 		*outlen = MLX5_ST_SZ_BYTES(rtr2rts_qp_out);
 		*in = kzalloc(*inlen, GFP_KERNEL);
 		*out = kzalloc(MLX5_ST_SZ_BYTES(rtr2rts_qp_out), GFP_KERNEL);
-		if (!in || !out)
+		if (!*in || !*out)
 			goto outerr;
 
 		MLX5_SET(rtr2rts_qp_in, *in, opcode, cmd);
@@ -927,16 +927,15 @@ static void alloc_inout(struct mlx5_vdpa_net *ndev, int cmd, void **in, int *inl
 		MLX5_SET(qpc, qpc, rnr_retry, 7);
 		break;
 	default:
-		goto outerr;
+		goto outerr_nullify;
 	}
-	if (!*in || !*out)
-		goto outerr;
 
 	return;
 
 outerr:
 	kfree(*in);
 	kfree(*out);
+outerr_nullify:
 	*in = NULL;
 	*out = NULL;
 }
-- 
2.27.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
