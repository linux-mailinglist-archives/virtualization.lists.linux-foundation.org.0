Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9992CDBCF
	for <lists.virtualization@lfdr.de>; Thu,  3 Dec 2020 18:07:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4AC4787A7E;
	Thu,  3 Dec 2020 17:07:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9u6eb360lfm4; Thu,  3 Dec 2020 17:07:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BAC3487A98;
	Thu,  3 Dec 2020 17:07:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 94608C0FA7;
	Thu,  3 Dec 2020 17:07:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0EAFDC0FA7
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Dec 2020 17:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0A9FF87A78
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Dec 2020 17:07:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZxIHTqKyfWfA
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Dec 2020 17:07:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2EE2F87A98
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Dec 2020 17:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607015252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ucw3KvI5KesqK4TM2XJtpRhg5V4YwJn3gLJrkY2oFY=;
 b=AxE1NHUaASShwEfSgICWgaumoUXOwucWVK9IxzwhHUbed5Y2PSa+g/vY7n/SnJO2T+2X+W
 mNgQW29tJYI4J4cq2X8ZX7RAJmOD7fJw47jOE89vrDWUCoeO9KGcIMw2A+X4QbjGBlaF5i
 dLNN+yaetGKEPaM4oKHLzyusFuLYJ6g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-XB-AGKb_O5WHrjmBLKbn6A-1; Thu, 03 Dec 2020 12:07:27 -0500
X-MC-Unique: XB-AGKb_O5WHrjmBLKbn6A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6A81107ACE4;
 Thu,  3 Dec 2020 17:07:25 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-142.ams2.redhat.com
 [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8140D5D9CA;
 Thu,  3 Dec 2020 17:07:23 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH v3 13/19] vdpa_sim: add get_config callback in vdpasim_dev_attr
Date: Thu,  3 Dec 2020 18:05:05 +0100
Message-Id: <20201203170511.216407-14-sgarzare@redhat.com>
In-Reply-To: <20201203170511.216407-1-sgarzare@redhat.com>
References: <20201203170511.216407-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: Laurent Vivier <lvivier@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 Shahaf Shuler <shahafs@nvidia.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <elic@nvidia.com>, Oren Duer <oren@nvidia.com>
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

The get_config callback can be used by the device to fill the
config structure.
The callback will be invoked in vdpasim_get_config() before copying
bytes into caller buffer.

Move vDPA-net config updates from vdpasim_set_features() in the
new vdpasim_net_get_config() callback.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v3:
- checked if get_config callback is set before call it
---
 drivers/vdpa/vdpa_sim/vdpa_sim.c | 35 +++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
index fe71ed7890e1..f935ade0806b 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
@@ -60,6 +60,8 @@ struct vdpasim_virtqueue {
 #define VDPASIM_NET_FEATURES	(VDPASIM_FEATURES | \
 				 (1ULL << VIRTIO_NET_F_MAC))
 
+struct vdpasim;
+
 struct vdpasim_dev_attr {
 	u64 supported_features;
 	size_t config_size;
@@ -67,6 +69,7 @@ struct vdpasim_dev_attr {
 	u32 id;
 
 	work_func_t work_fn;
+	void (*get_config)(struct vdpasim *vdpasim, void *config);
 };
 
 /* State of each vdpasim device */
@@ -522,8 +525,6 @@ static u64 vdpasim_get_features(struct vdpa_device *vdpa)
 static int vdpasim_set_features(struct vdpa_device *vdpa, u64 features)
 {
 	struct vdpasim *vdpasim = vdpa_to_sim(vdpa);
-	struct virtio_net_config *config =
-		(struct virtio_net_config *)vdpasim->config;
 
 	/* DMA mapping must be done by driver */
 	if (!(features & (1ULL << VIRTIO_F_ACCESS_PLATFORM)))
@@ -531,16 +532,6 @@ static int vdpasim_set_features(struct vdpa_device *vdpa, u64 features)
 
 	vdpasim->features = features & vdpasim->dev_attr.supported_features;
 
-	/* We generally only know whether guest is using the legacy interface
-	 * here, so generally that's the earliest we can set config fields.
-	 * Note: We actually require VIRTIO_F_ACCESS_PLATFORM above which
-	 * implies VIRTIO_F_VERSION_1, but let's not try to be clever here.
-	 */
-
-	config->mtu = cpu_to_vdpasim16(vdpasim, 1500);
-	config->status = cpu_to_vdpasim16(vdpasim, VIRTIO_NET_S_LINK_UP);
-	memcpy(config->mac, macaddr_buf, ETH_ALEN);
-
 	return 0;
 }
 
@@ -595,8 +586,13 @@ static void vdpasim_get_config(struct vdpa_device *vdpa, unsigned int offset,
 {
 	struct vdpasim *vdpasim = vdpa_to_sim(vdpa);
 
-	if (offset + len < vdpasim->dev_attr.config_size)
-		memcpy(buf, vdpasim->config + offset, len);
+	if (offset + len > vdpasim->dev_attr.config_size)
+		return;
+
+	if (vdpasim->dev_attr.get_config)
+		vdpasim->dev_attr.get_config(vdpasim, vdpasim->config);
+
+	memcpy(buf, vdpasim->config + offset, len);
 }
 
 static void vdpasim_set_config(struct vdpa_device *vdpa, unsigned int offset,
@@ -739,6 +735,16 @@ static const struct vdpa_config_ops vdpasim_batch_config_ops = {
 	.free                   = vdpasim_free,
 };
 
+static void vdpasim_net_get_config(struct vdpasim *vdpasim, void *config)
+{
+	struct virtio_net_config *net_config =
+		(struct virtio_net_config *)config;
+
+	net_config->mtu = cpu_to_vdpasim16(vdpasim, 1500);
+	net_config->status = cpu_to_vdpasim16(vdpasim, VIRTIO_NET_S_LINK_UP);
+	memcpy(net_config->mac, macaddr_buf, ETH_ALEN);
+}
+
 static int __init vdpasim_dev_init(void)
 {
 	struct vdpasim_dev_attr dev_attr = {};
@@ -747,6 +753,7 @@ static int __init vdpasim_dev_init(void)
 	dev_attr.supported_features = VDPASIM_NET_FEATURES;
 	dev_attr.nvqs = VDPASIM_VQ_NUM;
 	dev_attr.config_size = sizeof(struct virtio_net_config);
+	dev_attr.get_config = vdpasim_net_get_config;
 	dev_attr.work_fn = vdpasim_net_work;
 
 	vdpasim_dev = vdpasim_create(&dev_attr);
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
