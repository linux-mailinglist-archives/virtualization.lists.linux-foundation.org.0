Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D26EA220E93
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 15:58:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 77DC520460;
	Wed, 15 Jul 2020 13:58:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uEPr7dgPui6g; Wed, 15 Jul 2020 13:58:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3F0DC226CF;
	Wed, 15 Jul 2020 13:58:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A310C0733;
	Wed, 15 Jul 2020 13:58:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8DB9BC0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 13:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 801128ADAE
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 13:58:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wy3T4jG1+RQr
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 13:58:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8AF8A8ADAD
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 13:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594821494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=lNYAB5WtdpHZtbrXZUY3IMkmV+ZQSuZpS3mId26/pIw=;
 b=hsSRX7deygPFlhMM3/yvqUAXnoWU9xkuSD7yXYpV0xpvErcqlmqdIqvehkRyIX4MnmJIF6
 wLLgw1aB73wd8cAmkudi+0r9wMN/jOEfZ5NYhu7Xk99eQoxhIchqU5obgOhgcYuKAU/zcJ
 98JJns2p6hVrubdZLdbKblPGaxItpFA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-q1G-upctO22Nnc7Gf4u0xQ-1; Wed, 15 Jul 2020 09:58:12 -0400
X-MC-Unique: q1G-upctO22Nnc7Gf4u0xQ-1
Received: by mail-wr1-f71.google.com with SMTP id b8so1418252wro.19
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 06:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=lNYAB5WtdpHZtbrXZUY3IMkmV+ZQSuZpS3mId26/pIw=;
 b=ZslVC6/BYHjgy4SiJUqAmhudJFT5sLsN+qmOIh0i26OQH2/5eOuJ4N3v/0aty4OcJR
 ZUAsqBvWcKAn/VCafUHEt8h37Vo1rLVxvs2PtHBNbxVpkCVvqJ0gKhnFWbHSJ8n6A5ne
 BFeumNWB5iJfcI+B5GMrcGLYL0SAzmxTE9saHIVGDOshz1W3x1vN5YcAWzfTSAzlRzfi
 O1881wiI4arWdcbGrt9ROfh2SY7LapDsGorOSfOw/041hrnHRjlCC4DycmFnDbr2mbus
 0lsrblHPs2kBvhVyShZg+qvVzEyhq22F6S+fy4UEVYyMt6tpXwTNCm+JQ+7Pl9GLF54L
 fvEA==
X-Gm-Message-State: AOAM5336SIpZw6d26HCc4D8WB7Es/mgFIddDgHz49T4tLEaIvaon+RUM
 HVSzuoRFselZcaasqVfJqbElRjSozL5dlogOCNU5P/RT5geYqhKu1tCv5eRF+bEmvC47CiXkZLw
 tOz2w/sADLmCNxJXUFd2W6w24FY1gfyOHHku5SNVXmQ==
X-Received: by 2002:adf:b608:: with SMTP id f8mr12310156wre.363.1594821491433; 
 Wed, 15 Jul 2020 06:58:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyENFqiva68rgsrhrT1+9cBPKB/7ZYwnr1uTs81wgO+SSDgSYBiKi/nQWV/DVHlvr0G2ndfSA==
X-Received: by 2002:adf:b608:: with SMTP id f8mr12310142wre.363.1594821491254; 
 Wed, 15 Jul 2020 06:58:11 -0700 (PDT)
Received: from redhat.com (bzq-79-180-10-140.red.bezeqint.net. [79.180.10.140])
 by smtp.gmail.com with ESMTPSA id a15sm3956429wrh.54.2020.07.15.06.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 06:58:10 -0700 (PDT)
Date: Wed, 15 Jul 2020 09:58:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC don't apply] vdpa_sim: endian-ness for config space
Message-ID: <20200715135540.22832-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: virtualization@lists.linux-foundation.org
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

VDPA sim stores config space as native endian, but that
is wrong: modern guests expect LE.
I coded up the following to fix it up, but it is wrong too:
vdpasim_create is called before guest features are known.

So what should we do? New ioctl to specify the interface used?
More ideas?

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>


---
 drivers/vdpa/vdpa_sim/vdpa_sim.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
index a9bc5e0fb353..cc754ae0ec15 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
@@ -24,6 +24,7 @@
 #include <linux/etherdevice.h>
 #include <linux/vringh.h>
 #include <linux/vdpa.h>
+#include <linux/virtio_byteorder.h>
 #include <linux/vhost_iotlb.h>
 #include <uapi/linux/virtio_config.h>
 #include <uapi/linux/virtio_net.h>
@@ -72,6 +73,23 @@ struct vdpasim {
 	u64 features;
 };
 
+/* TODO: cross-endian support */
+static inline bool vdpasim_is_little_endian(struct vdpasim *vdpasim)
+{
+	return virtio_legacy_is_little_endian() ||
+		(vdpasim->features & (1ULL << VIRTIO_F_VERSION_1));
+}
+
+static inline u16 vdpasim16_to_cpu(struct vdpasim *vdpasim, __virtio16 val)
+{
+	return __virtio16_to_cpu(vdpasim_is_little_endian(vdpasim), val);
+}
+
+static inline __virtio16 cpu_to_vdpasim16(struct vdpasim *vdpasim, u16 val)
+{
+	return __cpu_to_virtio16(vdpasim_is_little_endian(vdpasim), val);
+}
+
 static struct vdpasim *vdpasim_dev;
 
 static struct vdpasim *vdpa_to_sim(struct vdpa_device *vdpa)
@@ -332,8 +350,8 @@ static struct vdpasim *vdpasim_create(void)
 		goto err_iommu;
 
 	config = &vdpasim->config;
-	config->mtu = 1500;
-	config->status = VIRTIO_NET_S_LINK_UP;
+	config->mtu = cpu_to_vdpasim16(vdpasim, 1500);
+	config->status = cpu_to_vdpasim16(vdpasim, VIRTIO_NET_S_LINK_UP);
 	eth_random_addr(config->mac);
 
 	vringh_set_iotlb(&vdpasim->vqs[0].vring, vdpasim->iommu);
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
