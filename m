Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8370843B2D3
	for <lists.virtualization@lfdr.de>; Tue, 26 Oct 2021 15:01:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2419480F38;
	Tue, 26 Oct 2021 13:01:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jzO4CpAHwtlg; Tue, 26 Oct 2021 13:01:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9CA5280F36;
	Tue, 26 Oct 2021 13:01:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 25140C0021;
	Tue, 26 Oct 2021 13:01:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8DE9BC000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Oct 2021 13:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F589401D3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Oct 2021 13:01:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jv2PoSBVF8VK
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Oct 2021 13:01:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2236B401EF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Oct 2021 13:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635253292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Fe5EZgR3PcKMJtKPY4WLVkQcEinQ7IFPk2YMfqQHmpQ=;
 b=g/juqGrXsgHhFntx9nwhTdA+7j/qlRE+KJ7qCaZWX+c46NRQGzbDwsAlmPTzcdpUzpDV6f
 7qYi1/a3kdt/lhjwFE0Vo5zy30PqwOCkAGhlOty7flhPk9yFMszN88r+QPVHTq3BjzqvoG
 w98cKXeaHWVAphnHa9wOek4O5BlWtX4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-_fReWgcYN0ydO6F5LzOSYg-1; Tue, 26 Oct 2021 09:01:30 -0400
X-MC-Unique: _fReWgcYN0ydO6F5LzOSYg-1
Received: by mail-ed1-f72.google.com with SMTP id
 g6-20020a056402424600b003dd2b85563bso10261520edb.7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Oct 2021 06:01:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Fe5EZgR3PcKMJtKPY4WLVkQcEinQ7IFPk2YMfqQHmpQ=;
 b=y+8T6EgNoijbO5OP3kVtl/3DN4rKZRGUvv5gJxDo4YmdtuM/3wcutWJfVg1qqdNUfm
 mxoH2Wbjdt7sxCA5JGM4hpLS+va11rIxSLTdP/uYvnDlNFA88tGK/1LdjgutpJkdQxQI
 GtacjK9g2jIb9Wx4y8ZbnAM40HH3sG5zTQpBUPgF0Gp4bCbaH9OJT9SNYWnUddDmVpuA
 Nb9SA6c+kpzOuIYLhTpw0tpIt32nU3HLno/YkOhYz7k7jhcf5i/AM9s7ia44xQIEpNmM
 E3MbaxE+8ENAOSGd51/0IknHEvZY8mtmWON/dQzJLHf/0q8MxG2Rf3A7VdH/ip/4Vrc9
 DpDg==
X-Gm-Message-State: AOAM531uvcQC65xetiO+nuhwraDjt9ru6H7bKm+O3UIikSm02+uqpq+a
 qlEMglWyJhcvt5tls9QQPi//26V2DqfYeqG8YmEEx+COSIpNWlS0DcIfX5W/qOU5V/StG+giIex
 5o0AlZxpul7tiCtyLRt2Ml4jaK9N5oMmhV2isunX0aA==
X-Received: by 2002:a17:906:40cd:: with SMTP id
 a13mr2274908ejk.534.1635253289522; 
 Tue, 26 Oct 2021 06:01:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVMSzzxHRaX71oEVp8x+mT83kgUf5NzdTokWyuDwsUrLl6voGN5NckKhJeXL7QM4/0nTBJpw==
X-Received: by 2002:a17:906:40cd:: with SMTP id
 a13mr2274867ejk.534.1635253289221; 
 Tue, 26 Oct 2021 06:01:29 -0700 (PDT)
Received: from steredhat (host-79-30-88-77.retail.telecomitalia.it.
 [79.30.88.77])
 by smtp.gmail.com with ESMTPSA id m1sm9347577ejn.121.2021.10.26.06.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 06:01:28 -0700 (PDT)
Date: Tue, 26 Oct 2021 15:01:25 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Subject: Re: [PATCH linux-next v6 4/8] vdpa: Enable user to set mac and mtu
 of vdpa device
Message-ID: <20211026130125.pxdg7w473xjuftz4@steredhat>
References: <20211026040243.79005-1-parav@nvidia.com>
 <20211026040243.79005-5-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20211026040243.79005-5-parav@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: elic@nvidia.com, mst@redhat.com, virtualization@lists.linux-foundation.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Tue, Oct 26, 2021 at 07:02:39AM +0300, Parav Pandit via Virtualization wrote:
>$ vdpa dev add name bar mgmtdev vdpasim_net mac 00:11:22:33:44:55 mtu 9000
>
>$ vdpa dev config show
>bar: mac 00:11:22:33:44:55 link up link_announce false mtu 9000
>
>$ vdpa dev config show -jp
>{
>    "config": {
>        "bar": {
>            "mac": "00:11:22:33:44:55",
>            "link ": "up",
>            "link_announce ": false,
>            "mtu": 9000,
>        }
>    }
>}
>
>Signed-off-by: Parav Pandit <parav@nvidia.com>
>Reviewed-by: Eli Cohen <elic@nvidia.com>
>Acked-by: Jason Wang <jasowang@redhat.com>
>
>---
>changelog:
>v4->v5:
> - added comment for checking device capabilities
>v3->v4:
> - provide config attributes during device addition time
>---
> drivers/vdpa/ifcvf/ifcvf_main.c      |  3 ++-
> drivers/vdpa/mlx5/net/mlx5_vnet.c    |  3 ++-
> drivers/vdpa/vdpa.c                  | 38 ++++++++++++++++++++++++++--
> drivers/vdpa/vdpa_sim/vdpa_sim_blk.c |  3 ++-
> drivers/vdpa/vdpa_sim/vdpa_sim_net.c |  3 ++-
> drivers/vdpa/vdpa_user/vduse_dev.c   |  3 ++-
> include/linux/vdpa.h                 | 17 ++++++++++++-
> 7 files changed, 62 insertions(+), 8 deletions(-)
>
>diff --git a/drivers/vdpa/ifcvf/ifcvf_main.c b/drivers/vdpa/ifcvf/ifcvf_main.c
>index dcd648e1f7e7..6dc75ca70b37 100644
>--- a/drivers/vdpa/ifcvf/ifcvf_main.c
>+++ b/drivers/vdpa/ifcvf/ifcvf_main.c
>@@ -499,7 +499,8 @@ static u32 get_dev_type(struct pci_dev *pdev)
> 	return dev_type;
> }
>
>-static int ifcvf_vdpa_dev_add(struct vdpa_mgmt_dev *mdev, const char *name)
>+static int ifcvf_vdpa_dev_add(struct vdpa_mgmt_dev *mdev, const char *name,
>+			      const struct vdpa_dev_set_config *config)
> {
> 	struct ifcvf_vdpa_mgmt_dev *ifcvf_mgmt_dev;
> 	struct ifcvf_adapter *adapter;
>diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/mlx5_vnet.c
>index b5bd1a553256..6bbdc0ece707 100644
>--- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
>+++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
>@@ -2482,7 +2482,8 @@ static int event_handler(struct notifier_block *nb, unsigned long event, void *p
> 	return ret;
> }
>
>-static int mlx5_vdpa_dev_add(struct vdpa_mgmt_dev *v_mdev, const char *name)
>+static int mlx5_vdpa_dev_add(struct vdpa_mgmt_dev *v_mdev, const char *name,
>+			     const struct vdpa_dev_set_config 
>*add_config)
> {
> 	struct mlx5_vdpa_mgmtdev *mgtdev = container_of(v_mdev, struct 
> 	mlx5_vdpa_mgmtdev, mgtdev);
> 	struct virtio_net_config *config;
>diff --git a/drivers/vdpa/vdpa.c b/drivers/vdpa/vdpa.c
>index 973c56fb60b9..a1168a7fa8b8 100644
>--- a/drivers/vdpa/vdpa.c
>+++ b/drivers/vdpa/vdpa.c
>@@ -14,7 +14,6 @@
> #include <uapi/linux/vdpa.h>
> #include <net/genetlink.h>
> #include <linux/mod_devicetable.h>
>-#include <linux/virtio_net.h>
> #include <linux/virtio_ids.h>
>
> static LIST_HEAD(mdev_head);
>@@ -480,9 +479,15 @@ vdpa_nl_cmd_mgmtdev_get_dumpit(struct sk_buff 
>*msg, struct netlink_callback *cb)
> 	return msg->len;
> }
>
>+#define VDPA_DEV_NET_ATTRS_MASK ((1 << VDPA_ATTR_DEV_NET_CFG_MACADDR) | \
>+				 (1 << VDPA_ATTR_DEV_NET_CFG_MTU))
>+
> static int vdpa_nl_cmd_dev_add_set_doit(struct sk_buff *skb, struct genl_info *info)
> {
>+	struct vdpa_dev_set_config config = {};
>+	struct nlattr **nl_attrs = info->attrs;
> 	struct vdpa_mgmt_dev *mdev;
>+	const u8 *macaddr;
> 	const char *name;
> 	int err = 0;
>
>@@ -491,6 +496,26 @@ static int vdpa_nl_cmd_dev_add_set_doit(struct sk_buff *skb, struct genl_info *i
>
> 	name = nla_data(info->attrs[VDPA_ATTR_DEV_NAME]);
>
>+	if (nl_attrs[VDPA_ATTR_DEV_NET_CFG_MACADDR]) {
>+		macaddr = nla_data(nl_attrs[VDPA_ATTR_DEV_NET_CFG_MACADDR]);
>+		memcpy(config.net.mac, macaddr, sizeof(config.net.mac));
>+		config.mask |= (1 << VDPA_ATTR_DEV_NET_CFG_MACADDR);
>+	}
>+	if (nl_attrs[VDPA_ATTR_DEV_NET_CFG_MTU]) {
>+		config.net.mtu =
>+			nla_get_u16(nl_attrs[VDPA_ATTR_DEV_NET_CFG_MTU]);
>+		config.mask |= (1 << VDPA_ATTR_DEV_NET_CFG_MTU);
>+	}
>+
>+	/* Skip checking capability if user didn't prefer to configure any
>+	 * device networking attributes. It is likely that user might have used
>+	 * a device specific method to configure such attributes or using device
>+	 * default attributes.
>+	 */
>+	if ((config.mask & VDPA_DEV_NET_ATTRS_MASK) &&
>+	    !netlink_capable(skb, CAP_NET_ADMIN))
>+		return -EPERM;
>+
> 	mutex_lock(&vdpa_dev_mutex);
> 	mdev = vdpa_mgmtdev_get_from_attr(info->attrs);
> 	if (IS_ERR(mdev)) {
>@@ -498,8 +523,14 @@ static int vdpa_nl_cmd_dev_add_set_doit(struct sk_buff *skb, struct genl_info *i
> 		err = PTR_ERR(mdev);
> 		goto err;
> 	}
>+	if ((config.mask & mdev->config_attr_mask) != config.mask) {
>+		NL_SET_ERR_MSG_MOD(info->extack,
>+				   "All provided attributes are not supported");
>+		err = -EOPNOTSUPP;
>+		goto err;
>+	}
>
>-	err = mdev->ops->dev_add(mdev, name);
>+	err = mdev->ops->dev_add(mdev, name, &config);
> err:
> 	mutex_unlock(&vdpa_dev_mutex);
> 	return err;
>@@ -835,6 +866,9 @@ static const struct nla_policy vdpa_nl_policy[VDPA_ATTR_MAX + 1] = {
> 	[VDPA_ATTR_MGMTDEV_BUS_NAME] = { .type = NLA_NUL_STRING },
> 	[VDPA_ATTR_MGMTDEV_DEV_NAME] = { .type = NLA_STRING },
> 	[VDPA_ATTR_DEV_NAME] = { .type = NLA_STRING },
>+	[VDPA_ATTR_DEV_NET_CFG_MACADDR] = NLA_POLICY_ETH_ADDR,
>+	/* virtio spec 1.1 section 5.1.4.1 for valid MTU range */
>+	[VDPA_ATTR_DEV_NET_CFG_MTU] = NLA_POLICY_MIN(NLA_U16, 68),
> };
>
> static const struct genl_ops vdpa_nl_ops[] = {
>diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim_blk.c b/drivers/vdpa/vdpa_sim/vdpa_sim_blk.c
>index a790903f243e..42d401d43911 100644
>--- a/drivers/vdpa/vdpa_sim/vdpa_sim_blk.c
>+++ b/drivers/vdpa/vdpa_sim/vdpa_sim_blk.c
>@@ -248,7 +248,8 @@ static struct device vdpasim_blk_mgmtdev = {
> 	.release = vdpasim_blk_mgmtdev_release,
> };
>
>-static int vdpasim_blk_dev_add(struct vdpa_mgmt_dev *mdev, const char *name)
>+static int vdpasim_blk_dev_add(struct vdpa_mgmt_dev *mdev, const char *name,
>+			       const struct vdpa_dev_set_config *config)
> {
> 	struct vdpasim_dev_attr dev_attr = {};
> 	struct vdpasim *simdev;
>diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim_net.c b/drivers/vdpa/vdpa_sim/vdpa_sim_net.c
>index a1ab6163f7d1..d681e423e64f 100644
>--- a/drivers/vdpa/vdpa_sim/vdpa_sim_net.c
>+++ b/drivers/vdpa/vdpa_sim/vdpa_sim_net.c
>@@ -126,7 +126,8 @@ static struct device vdpasim_net_mgmtdev = {
> 	.release = vdpasim_net_mgmtdev_release,
> };
>
>-static int vdpasim_net_dev_add(struct vdpa_mgmt_dev *mdev, const char *name)
>+static int vdpasim_net_dev_add(struct vdpa_mgmt_dev *mdev, const char *name,
>+			       const struct vdpa_dev_set_config *config)
> {
> 	struct vdpasim_dev_attr dev_attr = {};
> 	struct vdpasim *simdev;
>diff --git a/drivers/vdpa/vdpa_user/vduse_dev.c b/drivers/vdpa/vdpa_user/vduse_dev.c
>index 841667a896dd..c9204c62f339 100644
>--- a/drivers/vdpa/vdpa_user/vduse_dev.c
>+++ b/drivers/vdpa/vdpa_user/vduse_dev.c
>@@ -1503,7 +1503,8 @@ static int vduse_dev_init_vdpa(struct vduse_dev *dev, const char *name)
> 	return 0;
> }
>
>-static int vdpa_dev_add(struct vdpa_mgmt_dev *mdev, const char *name)
>+static int vdpa_dev_add(struct vdpa_mgmt_dev *mdev, const char *name,
>+			const struct vdpa_dev_set_config *config)
> {
> 	struct vduse_dev *dev;
> 	int ret;
>diff --git a/include/linux/vdpa.h b/include/linux/vdpa.h
>index fafb7202482c..bf9ddf743e2f 100644
>--- a/include/linux/vdpa.h
>+++ b/include/linux/vdpa.h
>@@ -6,6 +6,8 @@
> #include <linux/device.h>
> #include <linux/interrupt.h>
> #include <linux/vhost_iotlb.h>
>+#include <linux/virtio_net.h>
>+#include <linux/if_ether.h>
>
> /**
>  * struct vdpa_calllback - vDPA callback definition.
>@@ -93,6 +95,14 @@ struct vdpa_iova_range {
> 	u64 last;
> };
>
>+struct vdpa_dev_set_config {
>+	struct {
>+		u8 mac[ETH_ALEN];
>+		u16 mtu;
>+	} net;
>+	u64 mask;
>+};
>+
> /**
>  * Corresponding file area for device memory mapping
>  * @file: vma->vm_file for the mapping
>@@ -397,6 +407,7 @@ void vdpa_set_config(struct vdpa_device *dev, unsigned int offset,
>  * @dev_add: Add a vdpa device using alloc and register
>  *	     @mdev: parent device to use for device addition
>  *	     @name: name of the new vdpa device
>+ *	     @config: config attributes to apply to the device under creation
>  *	     Driver need to add a new device using _vdpa_register_device()
>  *	     after fully initializing the vdpa device. Driver must return 0
>  *	     on success or appropriate error code.
>@@ -407,7 +418,8 @@ void vdpa_set_config(struct vdpa_device *dev, unsigned int offset,
>  *	     _vdpa_unregister_device().
>  */
> struct vdpa_mgmtdev_ops {
>-	int (*dev_add)(struct vdpa_mgmt_dev *mdev, const char *name);
>+	int (*dev_add)(struct vdpa_mgmt_dev *mdev, const char *name,
>+		       const struct vdpa_dev_set_config *config);
> 	void (*dev_del)(struct vdpa_mgmt_dev *mdev, struct vdpa_device *dev);
> };
>
>@@ -416,12 +428,15 @@ struct vdpa_mgmtdev_ops {
>  * @device: Management parent device
>  * @ops: operations supported by management device
>  * @id_table: Pointer to device id table of supported ids
>+ * @config_attr_mask: bit mask of attributes of type enum vdpa_attr 
>that
>+ *		      management devie support during dev_add callback

s/devie/divice

Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
