Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4282EA8C5
	for <lists.virtualization@lfdr.de>; Tue,  5 Jan 2021 11:32:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D4FD421FA8;
	Tue,  5 Jan 2021 10:32:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x-Me7zAx4-mt; Tue,  5 Jan 2021 10:32:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1F7AF2153E;
	Tue,  5 Jan 2021 10:32:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E1DD3C013A;
	Tue,  5 Jan 2021 10:32:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9D244C0FA8
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Jan 2021 10:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 83609870AC
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Jan 2021 10:32:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZMShVcLGbup0
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Jan 2021 10:32:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 91E5987021
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Jan 2021 10:32:26 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5ff4403a0000>; Tue, 05 Jan 2021 02:32:26 -0800
Received: from sw-mtx-036.mtx.labs.mlnx (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 5 Jan 2021 10:32:25 +0000
From: Parav Pandit <parav@nvidia.com>
To: <virtualization@lists.linux-foundation.org>
Subject: [PATCH linux-next v3 5/6] vdpa: Enable user to query vdpa device info
Date: Tue, 5 Jan 2021 12:32:02 +0200
Message-ID: <20210105103203.82508-6-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210105103203.82508-1-parav@nvidia.com>
References: <20201112064005.349268-1-parav@nvidia.com>
 <20210105103203.82508-1-parav@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1609842746; bh=G4YN24ZRtil1Q2t+OZA4XXpih9LUlcThycNeO/nlfr8=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
 X-Originating-IP:X-ClientProxiedBy;
 b=KO1iyO9DkkYl04NB/8+Vp9bYUpuOTmaTfbYRTS7PgaJeCYpF9wNSn6rOUXjtCALLu
 4AelJOfyvkkUE0S7uh6c5j1DE4U9xGZIOxLZpmrn6cF5nOJvXKhAdex4fenIkQZXNI
 bCUf2Ezio+DZ3t6Z8N5LMM6fPuGcqI6VLAx5AN8H9NlUg1Q1JqtmuABNvbc3Kqhmwd
 foo7Lp8Jo/gBPjaQScJNs/ygoBH+fB34iazRdcRGTD2tDfACJHHTKpSvgr44aU+aSW
 nnil9gcGdw6iJkstbR8tZsS/IP34KEJOhnnXHCpwj7PO+nt0+wO0fGxE4kLsUrUk/R
 rn/wWiY7eiWeg==
Cc: netdev@vger.kernel.org, elic@nvidia.com, mst@redhat.com
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

Enable user to query vdpa device information.

$ vdpa dev add mgmtdev vdpasim_net name foo2

Show the newly created vdpa device by its name:
$ vdpa dev show foo2
foo2: type network mgmtdev vdpasim_net vendor_id 0 max_vqs 2 max_vq_size 256

$ vdpa dev show foo2 -jp
{
    "dev": {
        "foo2": {
            "type": "network",
            "mgmtdev": "vdpasim_net",
            "vendor_id": 0,
            "max_vqs": 2,
            "max_vq_size": 256
        }
    }
}

Signed-off-by: Parav Pandit <parav@nvidia.com>
Reviewed-by: Eli Cohen <elic@nvidia.com>
Reviewed-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vdpa/vdpa.c       | 131 ++++++++++++++++++++++++++++++++++++++
 include/uapi/linux/vdpa.h |   5 ++
 2 files changed, 136 insertions(+)

diff --git a/drivers/vdpa/vdpa.c b/drivers/vdpa/vdpa.c
index dca67e4d32e5..9700a0adcca0 100644
--- a/drivers/vdpa/vdpa.c
+++ b/drivers/vdpa/vdpa.c
@@ -478,6 +478,131 @@ static int vdpa_nl_cmd_dev_del_set_doit(struct sk_buff *skb, struct genl_info *i
 	return err;
 }
 
+static int
+vdpa_dev_fill(struct vdpa_device *vdev, struct sk_buff *msg, u32 portid, u32 seq,
+	      int flags, struct netlink_ext_ack *extack)
+{
+	u16 max_vq_size;
+	u32 device_id;
+	u32 vendor_id;
+	void *hdr;
+	int err;
+
+	hdr = genlmsg_put(msg, portid, seq, &vdpa_nl_family, flags, VDPA_CMD_DEV_NEW);
+	if (!hdr)
+		return -EMSGSIZE;
+
+	err = vdpa_nl_mgmtdev_handle_fill(msg, vdev->mdev);
+	if (err)
+		goto msg_err;
+
+	device_id = vdev->config->get_device_id(vdev);
+	vendor_id = vdev->config->get_vendor_id(vdev);
+	max_vq_size = vdev->config->get_vq_num_max(vdev);
+
+	err = -EMSGSIZE;
+	if (nla_put_string(msg, VDPA_ATTR_DEV_NAME, dev_name(&vdev->dev)))
+		goto msg_err;
+	if (nla_put_u32(msg, VDPA_ATTR_DEV_ID, device_id))
+		goto msg_err;
+	if (nla_put_u32(msg, VDPA_ATTR_DEV_VENDOR_ID, vendor_id))
+		goto msg_err;
+	if (nla_put_u32(msg, VDPA_ATTR_DEV_MAX_VQS, vdev->nvqs))
+		goto msg_err;
+	if (nla_put_u16(msg, VDPA_ATTR_DEV_MAX_VQ_SIZE, max_vq_size))
+		goto msg_err;
+
+	genlmsg_end(msg, hdr);
+	return 0;
+
+msg_err:
+	genlmsg_cancel(msg, hdr);
+	return err;
+}
+
+static int vdpa_nl_cmd_dev_get_doit(struct sk_buff *skb, struct genl_info *info)
+{
+	struct vdpa_device *vdev;
+	struct sk_buff *msg;
+	const char *devname;
+	struct device *dev;
+	int err;
+
+	if (!info->attrs[VDPA_ATTR_DEV_NAME])
+		return -EINVAL;
+	devname = nla_data(info->attrs[VDPA_ATTR_DEV_NAME]);
+	msg = nlmsg_new(NLMSG_DEFAULT_SIZE, GFP_KERNEL);
+	if (!msg)
+		return -ENOMEM;
+
+	mutex_lock(&vdpa_dev_mutex);
+	dev = bus_find_device(&vdpa_bus, NULL, devname, vdpa_name_match);
+	if (!dev) {
+		mutex_unlock(&vdpa_dev_mutex);
+		NL_SET_ERR_MSG_MOD(info->extack, "device not found");
+		return -ENODEV;
+	}
+	vdev = container_of(dev, struct vdpa_device, dev);
+	if (!vdev->mdev) {
+		mutex_unlock(&vdpa_dev_mutex);
+		put_device(dev);
+		return -EINVAL;
+	}
+	err = vdpa_dev_fill(vdev, msg, info->snd_portid, info->snd_seq, 0, info->extack);
+	if (!err)
+		err = genlmsg_reply(msg, info);
+	put_device(dev);
+	mutex_unlock(&vdpa_dev_mutex);
+
+	if (err)
+		nlmsg_free(msg);
+	return err;
+}
+
+struct vdpa_dev_dump_info {
+	struct sk_buff *msg;
+	struct netlink_callback *cb;
+	int start_idx;
+	int idx;
+};
+
+static int vdpa_dev_dump(struct device *dev, void *data)
+{
+	struct vdpa_device *vdev = container_of(dev, struct vdpa_device, dev);
+	struct vdpa_dev_dump_info *info = data;
+	int err;
+
+	if (!vdev->mdev)
+		return 0;
+	if (info->idx < info->start_idx) {
+		info->idx++;
+		return 0;
+	}
+	err = vdpa_dev_fill(vdev, info->msg, NETLINK_CB(info->cb->skb).portid,
+			    info->cb->nlh->nlmsg_seq, NLM_F_MULTI, info->cb->extack);
+	if (err)
+		return err;
+
+	info->idx++;
+	return 0;
+}
+
+static int vdpa_nl_cmd_dev_get_dumpit(struct sk_buff *msg, struct netlink_callback *cb)
+{
+	struct vdpa_dev_dump_info info;
+
+	info.msg = msg;
+	info.cb = cb;
+	info.start_idx = cb->args[0];
+	info.idx = 0;
+
+	mutex_lock(&vdpa_dev_mutex);
+	bus_for_each_dev(&vdpa_bus, NULL, &info, vdpa_dev_dump);
+	mutex_unlock(&vdpa_dev_mutex);
+	cb->args[0] = info.idx;
+	return msg->len;
+}
+
 static const struct nla_policy vdpa_nl_policy[VDPA_ATTR_MAX] = {
 	[VDPA_ATTR_MGMTDEV_BUS_NAME] = { .type = NLA_NUL_STRING },
 	[VDPA_ATTR_MGMTDEV_DEV_NAME] = { .type = NLA_STRING },
@@ -503,6 +628,12 @@ static const struct genl_ops vdpa_nl_ops[] = {
 		.doit = vdpa_nl_cmd_dev_del_set_doit,
 		.flags = GENL_ADMIN_PERM,
 	},
+	{
+		.cmd = VDPA_CMD_DEV_GET,
+		.validate = GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
+		.doit = vdpa_nl_cmd_dev_get_doit,
+		.dumpit = vdpa_nl_cmd_dev_get_dumpit,
+	},
 };
 
 static struct genl_family vdpa_nl_family __ro_after_init = {
diff --git a/include/uapi/linux/vdpa.h b/include/uapi/linux/vdpa.h
index bb4a1f00eb1c..66a41e4ec163 100644
--- a/include/uapi/linux/vdpa.h
+++ b/include/uapi/linux/vdpa.h
@@ -16,6 +16,7 @@ enum vdpa_command {
 	VDPA_CMD_MGMTDEV_GET,		/* can dump */
 	VDPA_CMD_DEV_NEW,
 	VDPA_CMD_DEV_DEL,
+	VDPA_CMD_DEV_GET,		/* can dump */
 };
 
 enum vdpa_attr {
@@ -27,6 +28,10 @@ enum vdpa_attr {
 	VDPA_ATTR_MGMTDEV_SUPPORTED_CLASSES,	/* u64 */
 
 	VDPA_ATTR_DEV_NAME,			/* string */
+	VDPA_ATTR_DEV_ID,			/* u32 */
+	VDPA_ATTR_DEV_VENDOR_ID,		/* u32 */
+	VDPA_ATTR_DEV_MAX_VQS,			/* u32 */
+	VDPA_ATTR_DEV_MAX_VQ_SIZE,		/* u16 */
 
 	/* new attributes must be added above here */
 	VDPA_ATTR_MAX,
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
