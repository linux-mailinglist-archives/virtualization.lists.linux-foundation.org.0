Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D73A62A215A
	for <lists.virtualization@lfdr.de>; Sun,  1 Nov 2020 21:16:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7D07B2033E;
	Sun,  1 Nov 2020 20:16:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 12-uMZ+JK2rI; Sun,  1 Nov 2020 20:16:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6A0912043B;
	Sun,  1 Nov 2020 20:16:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5EE78C0051;
	Sun,  1 Nov 2020 20:16:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 710A9C0051
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Nov 2020 20:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5B82D2033E
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Nov 2020 20:16:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KjQOIj5YuFrP
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Nov 2020 20:16:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 22B602010C
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Nov 2020 20:16:11 +0000 (UTC)
Received: from localhost (host-213-179-129-39.customer.m-online.net
 [213.179.129.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D324B221FC;
 Sun,  1 Nov 2020 20:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604261770;
 bh=ou9JtZERET8ZmSnvUKYRRC09q0ibwQbMaizdIBPNUAg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qqN3H5tvXzLGgbioXpsi+7tW01vyNxMV1Z6Pmv6t3g3NYZLqn8EGbT1sFhEIPvrOM
 nDIr1QYbUBypj52IJ0/7eCWExBgGKrQDPNmdeCgN20vfZbtUFhMn07HLWlHLuecCLc
 MWXowwmU+oyw9UToQyy9NFR9RqRlA4MWsoEwIXhc=
From: Leon Romanovsky <leon@kernel.org>
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 gregkh <gregkh@linuxfoundation.org>
Subject: [PATCH mlx5-next v1 07/11] net/mlx5e: Connect ethernet part to
 auxiliary bus
Date: Sun,  1 Nov 2020 22:15:38 +0200
Message-Id: <20201101201542.2027568-8-leon@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201101201542.2027568-1-leon@kernel.org>
References: <20201101201542.2027568-1-leon@kernel.org>
MIME-Version: 1.0
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kiran.patil@intel.com, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, virtualization@lists.linux-foundation.org,
 fred.oh@linux.intel.com, tiwai@suse.de, broonie@kernel.org,
 Parav Pandit <parav@nvidia.com>, Roi Dayan <roid@nvidia.com>,
 shiraz.saleem@intel.com, Jakub Kicinski <kuba@kernel.org>,
 dan.j.williams@intel.com, Leon Romanovsky <leonro@nvidia.com>,
 Saeed Mahameed <saeedm@nvidia.com>, linux-kernel@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>
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

Reuse auxiliary bus to perform device management of the
ethernet part of the mlx5 driver.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/dev.c |  74 ++++++++++
 .../net/ethernet/mellanox/mlx5/core/en_main.c | 133 ++++++++----------
 .../net/ethernet/mellanox/mlx5/core/en_rep.c  |  41 +++++-
 .../net/ethernet/mellanox/mlx5/core/en_rep.h  |   6 +-
 .../net/ethernet/mellanox/mlx5/core/eswitch.c |   6 +-
 drivers/net/ethernet/mellanox/mlx5/core/lag.c |   2 +
 .../net/ethernet/mellanox/mlx5/core/main.c    |   6 +-
 .../ethernet/mellanox/mlx5/core/mlx5_core.h   |   2 +-
 8 files changed, 181 insertions(+), 89 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/dev.c b/drivers/net/ethernet/mellanox/mlx5/core/dev.c
index 76eb09f4adba..6d413c622785 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/dev.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/dev.c
@@ -31,6 +31,7 @@
  */

 #include <linux/mlx5/driver.h>
+#include <linux/mlx5/eswitch.h>
 #include <linux/mlx5/mlx5_ifc_vdpa.h>
 #include "mlx5_core.h"

@@ -52,6 +53,75 @@ enum {
 	MLX5_INTERFACE_ATTACHED,
 };

+static bool is_eth_rep_supported(struct mlx5_core_dev *dev)
+{
+	if (!IS_ENABLED(CONFIG_MLX5_ESWITCH))
+		return false;
+
+	if (!MLX5_ESWITCH_MANAGER(dev))
+		return false;
+
+	if (mlx5_eswitch_mode(dev->priv.eswitch) != MLX5_ESWITCH_OFFLOADS)
+		return false;
+
+	return true;
+}
+
+static bool is_eth_supported(struct mlx5_core_dev *dev)
+{
+	if (!IS_ENABLED(CONFIG_MLX5_CORE_EN))
+		return false;
+
+	if (is_eth_rep_supported(dev))
+		return false;
+
+	if (MLX5_CAP_GEN(dev, port_type) != MLX5_CAP_PORT_TYPE_ETH)
+		return false;
+
+	if (!MLX5_CAP_GEN(dev, eth_net_offloads)) {
+		mlx5_core_warn(dev, "Missing eth_net_offloads capability\n");
+		return false;
+	}
+
+	if (!MLX5_CAP_GEN(dev, nic_flow_table)) {
+		mlx5_core_warn(dev, "Missing nic_flow_table capability\n");
+		return false;
+	}
+
+	if (!MLX5_CAP_ETH(dev, csum_cap)) {
+		mlx5_core_warn(dev, "Missing csum_cap capability\n");
+		return false;
+	}
+
+	if (!MLX5_CAP_ETH(dev, max_lso_cap)) {
+		mlx5_core_warn(dev, "Missing max_lso_cap capability\n");
+		return false;
+	}
+
+	if (!MLX5_CAP_ETH(dev, vlan_cap)) {
+		mlx5_core_warn(dev, "Missing vlan_cap capability\n");
+		return false;
+	}
+
+	if (!MLX5_CAP_ETH(dev, rss_ind_tbl_cap)) {
+		mlx5_core_warn(dev, "Missing rss_ind_tbl_cap capability\n");
+		return false;
+	}
+
+	if (MLX5_CAP_FLOWTABLE(dev,
+			       flow_table_properties_nic_receive.max_ft_level) < 3) {
+		mlx5_core_warn(dev, "max_ft_level < 3\n");
+		return false;
+	}
+
+	if (!MLX5_CAP_ETH(dev, self_lb_en_modifiable))
+		mlx5_core_warn(dev, "Self loop back prevention is not supported\n");
+	if (!MLX5_CAP_GEN(dev, cq_moderation))
+		mlx5_core_warn(dev, "CQ moderation is not supported\n");
+
+	return true;
+}
+
 static bool is_vnet_supported(struct mlx5_core_dev *dev)
 {
 	if (!IS_ENABLED(CONFIG_MLX5_VDPA_NET))
@@ -80,6 +150,10 @@ static const struct mlx5_adev_device {
 } mlx5_adev_devices[] = {
 	[MLX5_INTERFACE_PROTOCOL_VDPA] = { .suffix = "vnet",
 					   .is_supported = &is_vnet_supported },
+	[MLX5_INTERFACE_PROTOCOL_ETH] = { .suffix = "eth",
+					  .is_supported = &is_eth_supported },
+	[MLX5_INTERFACE_PROTOCOL_ETH_REP] = { .suffix = "eth-rep",
+					   .is_supported = &is_eth_rep_supported },
 };

 int mlx5_adev_idx_alloc(void)
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
index b3f02aac7f26..3c4f880c6329 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
@@ -4597,31 +4597,6 @@ const struct net_device_ops mlx5e_netdev_ops = {
 	.ndo_get_devlink_port    = mlx5e_get_devlink_port,
 };

-static int mlx5e_check_required_hca_cap(struct mlx5_core_dev *mdev)
-{
-	if (MLX5_CAP_GEN(mdev, port_type) != MLX5_CAP_PORT_TYPE_ETH)
-		return -EOPNOTSUPP;
-	if (!MLX5_CAP_GEN(mdev, eth_net_offloads) ||
-	    !MLX5_CAP_GEN(mdev, nic_flow_table) ||
-	    !MLX5_CAP_ETH(mdev, csum_cap) ||
-	    !MLX5_CAP_ETH(mdev, max_lso_cap) ||
-	    !MLX5_CAP_ETH(mdev, vlan_cap) ||
-	    !MLX5_CAP_ETH(mdev, rss_ind_tbl_cap) ||
-	    MLX5_CAP_FLOWTABLE(mdev,
-			       flow_table_properties_nic_receive.max_ft_level)
-			       < 3) {
-		mlx5_core_warn(mdev,
-			       "Not creating net device, some required device capabilities are missing\n");
-		return -EOPNOTSUPP;
-	}
-	if (!MLX5_CAP_ETH(mdev, self_lb_en_modifiable))
-		mlx5_core_warn(mdev, "Self loop back prevention is not supported\n");
-	if (!MLX5_CAP_GEN(mdev, cq_moderation))
-		mlx5_core_warn(mdev, "CQ moderation is not supported\n");
-
-	return 0;
-}
-
 void mlx5e_build_default_indir_rqt(u32 *indirection_rqt, int len,
 				   int num_channels)
 {
@@ -5440,13 +5415,12 @@ void mlx5e_destroy_netdev(struct mlx5e_priv *priv)
 	free_netdev(netdev);
 }

-/* mlx5e_attach and mlx5e_detach scope should be only creating/destroying
- * hardware contexts and to connect it to the current netdev.
- */
-static int mlx5e_attach(struct mlx5_core_dev *mdev, void *vpriv)
+static int mlx5e_resume(struct auxiliary_device *adev)
 {
-	struct mlx5e_priv *priv = vpriv;
+	struct mlx5_adev *edev = container_of(adev, struct mlx5_adev, adev);
+	struct mlx5e_priv *priv = dev_get_drvdata(&adev->dev);
 	struct net_device *netdev = priv->netdev;
+	struct mlx5_core_dev *mdev = edev->mdev;
 	int err;

 	if (netif_device_present(netdev))
@@ -5465,109 +5439,112 @@ static int mlx5e_attach(struct mlx5_core_dev *mdev, void *vpriv)
 	return 0;
 }

-static void mlx5e_detach(struct mlx5_core_dev *mdev, void *vpriv)
+static int mlx5e_suspend(struct auxiliary_device *adev, pm_message_t state)
 {
-	struct mlx5e_priv *priv = vpriv;
+	struct mlx5e_priv *priv = dev_get_drvdata(&adev->dev);
 	struct net_device *netdev = priv->netdev;
-
-#ifdef CONFIG_MLX5_ESWITCH
-	if (MLX5_ESWITCH_MANAGER(mdev) && vpriv == mdev)
-		return;
-#endif
+	struct mlx5_core_dev *mdev = priv->mdev;

 	if (!netif_device_present(netdev))
-		return;
+		return -ENODEV;

 	mlx5e_detach_netdev(priv);
 	mlx5e_destroy_mdev_resources(mdev);
+	return 0;
 }

-static void *mlx5e_add(struct mlx5_core_dev *mdev)
+static int mlx5e_probe(struct auxiliary_device *adev,
+		       const struct auxiliary_device_id *id)
 {
+	struct mlx5_adev *edev = container_of(adev, struct mlx5_adev, adev);
+	struct mlx5_core_dev *mdev = edev->mdev;
 	struct net_device *netdev;
+	pm_message_t state = {};
 	void *priv;
 	int err;
 	int nch;

-	err = mlx5e_check_required_hca_cap(mdev);
-	if (err)
-		return NULL;
-
-#ifdef CONFIG_MLX5_ESWITCH
-	if (MLX5_ESWITCH_MANAGER(mdev) &&
-	    mlx5_eswitch_mode(mdev->priv.eswitch) == MLX5_ESWITCH_OFFLOADS) {
-		mlx5e_rep_register_vport_reps(mdev);
-		return mdev;
-	}
-#endif
-
 	nch = mlx5e_get_max_num_channels(mdev);
 	netdev = mlx5e_create_netdev(mdev, &mlx5e_nic_profile, nch, NULL);
 	if (!netdev) {
 		mlx5_core_err(mdev, "mlx5e_create_netdev failed\n");
-		return NULL;
+		return -ENOMEM;
 	}

 	dev_net_set(netdev, mlx5_core_net(mdev));
 	priv = netdev_priv(netdev);
+	dev_set_drvdata(&adev->dev, priv);

-	err = mlx5e_attach(mdev, priv);
+	err = mlx5e_resume(adev);
 	if (err) {
-		mlx5_core_err(mdev, "mlx5e_attach failed, %d\n", err);
+		mlx5_core_err(mdev, "mlx5e_resume failed, %d\n", err);
 		goto err_destroy_netdev;
 	}

 	err = register_netdev(netdev);
 	if (err) {
 		mlx5_core_err(mdev, "register_netdev failed, %d\n", err);
-		goto err_detach;
+		goto err_resume;
 	}

 	mlx5e_devlink_port_type_eth_set(priv);

 	mlx5e_dcbnl_init_app(priv);
-	return priv;
+	return 0;

-err_detach:
-	mlx5e_detach(mdev, priv);
+err_resume:
+	mlx5e_suspend(adev, state);
 err_destroy_netdev:
 	mlx5e_destroy_netdev(priv);
-	return NULL;
+	return err;
 }

-static void mlx5e_remove(struct mlx5_core_dev *mdev, void *vpriv)
+static int mlx5e_remove(struct auxiliary_device *adev)
 {
-	struct mlx5e_priv *priv;
+	struct mlx5e_priv *priv = dev_get_drvdata(&adev->dev);
+	pm_message_t state = {};

-#ifdef CONFIG_MLX5_ESWITCH
-	if (MLX5_ESWITCH_MANAGER(mdev) && vpriv == mdev) {
-		mlx5e_rep_unregister_vport_reps(mdev);
-		return;
-	}
-#endif
-	priv = vpriv;
 	mlx5e_dcbnl_delete_app(priv);
 	unregister_netdev(priv->netdev);
-	mlx5e_detach(mdev, vpriv);
+	mlx5e_suspend(adev, state);
 	mlx5e_destroy_netdev(priv);
+	return 0;
 }

-static struct mlx5_interface mlx5e_interface = {
-	.add       = mlx5e_add,
-	.remove    = mlx5e_remove,
-	.attach    = mlx5e_attach,
-	.detach    = mlx5e_detach,
-	.protocol  = MLX5_INTERFACE_PROTOCOL_ETH,
+static const struct auxiliary_device_id mlx5e_id_table[] = {
+	{ .name = MLX5_ADEV_NAME ".eth", },
+	{},
 };

-void mlx5e_init(void)
+MODULE_DEVICE_TABLE(auxiliary, mlx5e_id_table);
+
+static struct auxiliary_driver mlx5e_driver = {
+	.name = "eth",
+	.probe = mlx5e_probe,
+	.remove = mlx5e_remove,
+	.suspend = mlx5e_suspend,
+	.resume = mlx5e_resume,
+	.id_table = mlx5e_id_table,
+};
+
+int mlx5e_init(void)
 {
+	int ret;
+
 	mlx5e_ipsec_build_inverse_table();
 	mlx5e_build_ptys2ethtool_map();
-	mlx5_register_interface(&mlx5e_interface);
+	ret = mlx5e_rep_init();
+	if (ret)
+		return ret;
+
+	ret = auxiliary_driver_register(&mlx5e_driver);
+	if (ret)
+		mlx5e_rep_cleanup();
+	return ret;
 }

 void mlx5e_cleanup(void)
 {
-	mlx5_unregister_interface(&mlx5e_interface);
+	auxiliary_driver_unregister(&mlx5e_driver);
+	mlx5e_rep_cleanup();
 }
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_rep.c b/drivers/net/ethernet/mellanox/mlx5/core/en_rep.c
index ef2f8889ba0f..6a65a732de56 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_rep.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_rep.c
@@ -1315,16 +1315,49 @@ static const struct mlx5_eswitch_rep_ops rep_ops = {
 	.get_proto_dev = mlx5e_vport_rep_get_proto_dev
 };

-void mlx5e_rep_register_vport_reps(struct mlx5_core_dev *mdev)
+static int mlx5e_rep_probe(struct auxiliary_device *adev,
+			   const struct auxiliary_device_id *id)
 {
-	struct mlx5_eswitch *esw = mdev->priv.eswitch;
+	struct mlx5_adev *edev = container_of(adev, struct mlx5_adev, adev);
+	struct mlx5_core_dev *mdev = edev->mdev;
+	struct mlx5_eswitch *esw;

+	esw = mdev->priv.eswitch;
 	mlx5_eswitch_register_vport_reps(esw, &rep_ops, REP_ETH);
+	return 0;
 }

-void mlx5e_rep_unregister_vport_reps(struct mlx5_core_dev *mdev)
+static int mlx5e_rep_remove(struct auxiliary_device *adev)
 {
-	struct mlx5_eswitch *esw = mdev->priv.eswitch;
+	struct mlx5_adev *vdev = container_of(adev, struct mlx5_adev, adev);
+	struct mlx5_core_dev *mdev = vdev->mdev;
+	struct mlx5_eswitch *esw;

+	esw = mdev->priv.eswitch;
 	mlx5_eswitch_unregister_vport_reps(esw, REP_ETH);
+	return 0;
+}
+
+static const struct auxiliary_device_id mlx5e_rep_id_table[] = {
+	{ .name = MLX5_ADEV_NAME ".eth-rep", },
+	{},
+};
+
+MODULE_DEVICE_TABLE(auxiliary, mlx5e_rep_id_table);
+
+static struct auxiliary_driver mlx5e_rep_driver = {
+	.name = "eth-rep",
+	.probe = mlx5e_rep_probe,
+	.remove = mlx5e_rep_remove,
+	.id_table = mlx5e_rep_id_table,
+};
+
+int mlx5e_rep_init(void)
+{
+	return auxiliary_driver_register(&mlx5e_rep_driver);
+}
+
+void mlx5e_rep_cleanup(void)
+{
+	auxiliary_driver_unregister(&mlx5e_rep_driver);
 }
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_rep.h b/drivers/net/ethernet/mellanox/mlx5/core/en_rep.h
index 9020d1419bcf..5709b30bf4e1 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_rep.h
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_rep.h
@@ -203,8 +203,8 @@ struct mlx5e_rep_sq {
 	struct list_head	 list;
 };

-void mlx5e_rep_register_vport_reps(struct mlx5_core_dev *mdev);
-void mlx5e_rep_unregister_vport_reps(struct mlx5_core_dev *mdev);
+int mlx5e_rep_init(void);
+void mlx5e_rep_cleanup(void);
 int mlx5e_rep_bond_init(struct mlx5e_rep_priv *rpriv);
 void mlx5e_rep_bond_cleanup(struct mlx5e_rep_priv *rpriv);
 int mlx5e_rep_bond_enslave(struct mlx5_eswitch *esw, struct net_device *netdev,
@@ -232,6 +232,8 @@ static inline bool mlx5e_eswitch_rep(struct net_device *netdev)
 static inline bool mlx5e_is_uplink_rep(struct mlx5e_priv *priv) { return false; }
 static inline int mlx5e_add_sqs_fwd_rules(struct mlx5e_priv *priv) { return 0; }
 static inline void mlx5e_remove_sqs_fwd_rules(struct mlx5e_priv *priv) {}
+static inline int mlx5e_rep_init(void) { return 0; };
+static inline void mlx5e_rep_cleanup(void) {};
 #endif

 static inline bool mlx5e_is_vport_rep(struct mlx5e_priv *priv)
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/eswitch.c b/drivers/net/ethernet/mellanox/mlx5/core/eswitch.c
index 2e14bf238588..78a854926b00 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/eswitch.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/eswitch.c
@@ -1616,7 +1616,7 @@ int mlx5_eswitch_enable_locked(struct mlx5_eswitch *esw, int mode, int num_vfs)
 	if (mode == MLX5_ESWITCH_LEGACY) {
 		err = esw_legacy_enable(esw);
 	} else {
-		mlx5_reload_interface(esw->dev, MLX5_INTERFACE_PROTOCOL_ETH);
+		mlx5_rescan_drivers(esw->dev);
 		mlx5_reload_interface(esw->dev, MLX5_INTERFACE_PROTOCOL_IB);
 		err = esw_offloads_enable(esw);
 	}
@@ -1637,7 +1637,7 @@ int mlx5_eswitch_enable_locked(struct mlx5_eswitch *esw, int mode, int num_vfs)

 	if (mode == MLX5_ESWITCH_OFFLOADS) {
 		mlx5_reload_interface(esw->dev, MLX5_INTERFACE_PROTOCOL_IB);
-		mlx5_reload_interface(esw->dev, MLX5_INTERFACE_PROTOCOL_ETH);
+		mlx5_rescan_drivers(esw->dev);
 	}
 	esw_destroy_tsar(esw);
 	return err;
@@ -1701,7 +1701,7 @@ void mlx5_eswitch_disable_locked(struct mlx5_eswitch *esw, bool clear_vf)

 	if (old_mode == MLX5_ESWITCH_OFFLOADS) {
 		mlx5_reload_interface(esw->dev, MLX5_INTERFACE_PROTOCOL_IB);
-		mlx5_reload_interface(esw->dev, MLX5_INTERFACE_PROTOCOL_ETH);
+		mlx5_rescan_drivers(esw->dev);
 	}
 	esw_destroy_tsar(esw);

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/lag.c b/drivers/net/ethernet/mellanox/mlx5/core/lag.c
index 33081b24f10a..e4d4de1719bd 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/lag.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/lag.c
@@ -596,6 +596,8 @@ void mlx5_lag_add(struct mlx5_core_dev *dev, struct net_device *netdev)
 	if (err)
 		mlx5_core_err(dev, "Failed to init multipath lag err=%d\n",
 			      err);
+
+	return;
 }

 /* Must be called with intf_mutex held */
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/main.c b/drivers/net/ethernet/mellanox/mlx5/core/main.c
index 9397762c3a69..0b4793aff274 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/main.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/main.c
@@ -1677,7 +1677,11 @@ static int __init init(void)
 		goto err_debug;

 #ifdef CONFIG_MLX5_CORE_EN
-	mlx5e_init();
+	err = mlx5e_init();
+	if (err) {
+		pci_unregister_driver(&mlx5_core_driver);
+		goto err_debug;
+	}
 #endif

 	return 0;
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.h b/drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.h
index 11195381a870..f7e44e04d465 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.h
+++ b/drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.h
@@ -217,7 +217,7 @@ int mlx5_firmware_flash(struct mlx5_core_dev *dev, const struct firmware *fw,
 int mlx5_fw_version_query(struct mlx5_core_dev *dev,
 			  u32 *running_ver, u32 *stored_ver);

-void mlx5e_init(void);
+int mlx5e_init(void);
 void mlx5e_cleanup(void);

 static inline bool mlx5_sriov_is_enabled(struct mlx5_core_dev *dev)
--
2.28.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
