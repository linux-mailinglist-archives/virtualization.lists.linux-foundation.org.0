Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3AF292CDC
	for <lists.virtualization@lfdr.de>; Mon, 19 Oct 2020 19:32:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D32E58760D;
	Mon, 19 Oct 2020 17:32:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VQpqYG1ZB5mP; Mon, 19 Oct 2020 17:32:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0D72887609;
	Mon, 19 Oct 2020 17:32:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CBA0BC0051;
	Mon, 19 Oct 2020 17:32:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46586C0051
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Oct 2020 17:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 35B8F86C1D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Oct 2020 17:32:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tIcVJJquH4lY
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Oct 2020 17:32:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 29C6B86C15
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Oct 2020 17:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603128741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=IwxK6Q4h+WdvKv/XP6x1buGTHeGA/6smjojpEbN3Qsc=;
 b=EjcKEX4sRwMdQBzh6bjLhpyXikRZnqEFLSnnltGWnR5o/yuUwlgLR2UYF7aGUtxdoknW4i
 btczlltMiP4C/KvukN/RNCYfwaxGN2TrxH5o3G5stuwXNUzsZQLTVe5mOCSes1KHWwTtXK
 nu7Ryr9/63xfH6o3KLDKAvS0nU3yxHA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-5XyT83shPP-dRabLQ59ppw-1; Mon, 19 Oct 2020 13:32:20 -0400
X-MC-Unique: 5XyT83shPP-dRabLQ59ppw-1
Received: by mail-wm1-f70.google.com with SMTP id d197so78452wmd.4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Oct 2020 10:32:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=IwxK6Q4h+WdvKv/XP6x1buGTHeGA/6smjojpEbN3Qsc=;
 b=MEi6sSTGqV/7smiyUTyS0Rl3M0YyPcf7LJ31+KYdJU3tgw5kRQx5O5InFEDh0dPfMe
 IHG2X7N2Fq11h3F2ALSxDzHJhuOCipspJSeJ0j5AdrrJnaJ70AB1+dufoKWOdP5KcDd0
 r0rtBKWp+29IK1oyt/bZedPMqlwf9bemjjjHQAdfOEJYuXRT6TcyBT073B4mv1sHtSE4
 Njkcp+drK1Fm51Ar73AbqQVRYE/h0Jq8lQv+uLvYADfHGFvDtvT4qXfjwpR3cm67rY01
 fxcOy237a20C9hvnDgcT2AvINaHcekxsCYqOsfCOrLfNcKzIT2xP6AayfEKbUJQj2oeY
 7t8w==
X-Gm-Message-State: AOAM531wc7+nloVwgmRvhaRzm7z1nXLCs69J07gdXpKUYSPZAR8Lqkqj
 7HaOTWDSyMd66xHOyGucHDdS3J71xsPT5QibjvnPyoedeKDhTRcSvLmEwMYLT7D7FStZNQK8na7
 Q8Z//PP0iWmwn8sKiqJmvBIHIu5TLPqaG0WEDsAsXmA==
X-Received: by 2002:a7b:ce97:: with SMTP id q23mr300393wmj.19.1603128736827;
 Mon, 19 Oct 2020 10:32:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7z8oVSaWaVNfcjAEoHyyZqhoqznYik9UTpBXMJWvO/x87KAJCbKUUGAAv3K0C8vP5KF0Yww==
X-Received: by 2002:a7b:ce97:: with SMTP id q23mr300362wmj.19.1603128736514;
 Mon, 19 Oct 2020 10:32:16 -0700 (PDT)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id y10sm464362wrq.73.2020.10.19.10.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 10:32:15 -0700 (PDT)
Date: Mon, 19 Oct 2020 13:32:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH net v2] Revert "virtio-net: ethtool configurable RXCSUM"
Message-ID: <20201018103122.454967-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Willem de Bruijn <willemb@google.com>, kernel test robot <lkp@intel.com>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 bpf@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, virtualization@lists.linux-foundation.org,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>
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

This reverts commit 3618ad2a7c0e78e4258386394d5d5f92a3dbccf8.

When the device does not have a control vq (e.g. when using a
version of QEMU based on upstream v0.10 or older, or when specifying
ctrl_vq=off,ctrl_rx=off,ctrl_vlan=off,ctrl_rx_extra=off,ctrl_mac_addr=off
for the device on the QEMU command line), that commit causes a crash:

[   72.229171] kernel BUG at drivers/net/virtio_net.c:1667!
[   72.230266] invalid opcode: 0000 [#1] PREEMPT SMP
[   72.231172] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.9.0-rc8-02934-g3618ad2a7c0e7 #1
[   72.231172] EIP: virtnet_send_command+0x120/0x140
[   72.231172] Code: 00 0f 94 c0 8b 7d f0 65 33 3d 14 00 00 00 75 1c 8d 65 f4 5b 5e 5f 5d c3 66 90 be 01 00 00 00 e9 6e ff ff ff 8d b6 00
+00 00 00 <0f> 0b e8 d9 bb 82 00 eb 17 8d b4 26 00 00 00 00 8d b4 26 00 00 00
[   72.231172] EAX: 0000000d EBX: f72895c0 ECX: 00000017 EDX: 00000011
[   72.231172] ESI: f7197800 EDI: ed69bd00 EBP: ed69bcf4 ESP: ed69bc98
[   72.231172] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010246
[   72.231172] CR0: 80050033 CR2: 00000000 CR3: 02c84000 CR4: 000406f0
[   72.231172] Call Trace:
[   72.231172]  ? __virt_addr_valid+0x45/0x60
[   72.231172]  ? ___cache_free+0x51f/0x760
[   72.231172]  ? kobject_uevent_env+0xf4/0x560
[   72.231172]  virtnet_set_guest_offloads+0x4d/0x80
[   72.231172]  virtnet_set_features+0x85/0x120
[   72.231172]  ? virtnet_set_guest_offloads+0x80/0x80
[   72.231172]  __netdev_update_features+0x27a/0x8e0
[   72.231172]  ? kobject_uevent+0xa/0x20
[   72.231172]  ? netdev_register_kobject+0x12c/0x160
[   72.231172]  register_netdevice+0x4fe/0x740
[   72.231172]  register_netdev+0x1c/0x40
[   72.231172]  virtnet_probe+0x728/0xb60
[   72.231172]  ? _raw_spin_unlock+0x1d/0x40
[   72.231172]  ? virtio_vdpa_get_status+0x1c/0x20
[   72.231172]  virtio_dev_probe+0x1c6/0x271
[   72.231172]  really_probe+0x195/0x2e0
[   72.231172]  driver_probe_device+0x26/0x60
[   72.231172]  device_driver_attach+0x49/0x60
[   72.231172]  __driver_attach+0x46/0xc0
[   72.231172]  ? device_driver_attach+0x60/0x60
[   72.231172]  bus_add_driver+0x197/0x1c0
[   72.231172]  driver_register+0x66/0xc0
[   72.231172]  register_virtio_driver+0x1b/0x40
[   72.231172]  virtio_net_driver_init+0x61/0x86
[   72.231172]  ? veth_init+0x14/0x14
[   72.231172]  do_one_initcall+0x76/0x2e4
[   72.231172]  ? rdinit_setup+0x2a/0x2a
[   72.231172]  do_initcalls+0xb2/0xd5
[   72.231172]  kernel_init_freeable+0x14f/0x179
[   72.231172]  ? rest_init+0x100/0x100
[   72.231172]  kernel_init+0xd/0xe0
[   72.231172]  ret_from_fork+0x1c/0x30
[   72.231172] Modules linked in:
[   72.269563] ---[ end trace a6ebc4afea0e6cb1 ]---

The reason is that virtnet_set_features now calls virtnet_set_guest_offloads
unconditionally, it used to only call it when there is something
to configure.

If device does not have a control vq, everything breaks.

Looking at this some more, I noticed that it's not really checking the
hardware too much. E.g.

        if ((dev->features ^ features) & NETIF_F_LRO) {
                if (features & NETIF_F_LRO)
                        offloads |= GUEST_OFFLOAD_LRO_MASK &
                                    vi->guest_offloads_capable;
                else
                        offloads &= ~GUEST_OFFLOAD_LRO_MASK;
        }

and

                                (1ULL << VIRTIO_NET_F_GUEST_TSO6) | \
                                (1ULL << VIRTIO_NET_F_GUEST_ECN)  | \
                                (1ULL << VIRTIO_NET_F_GUEST_UFO))

But there's no guarantee that e.g. VIRTIO_NET_F_GUEST_TSO6 is set.

If it isn't command should not send it.

Further

static int virtnet_set_features(struct net_device *dev,
                                netdev_features_t features)
{
        struct virtnet_info *vi = netdev_priv(dev);
        u64 offloads = vi->guest_offloads;

seems wrong since guest_offloads is zero initialized,
it does not reflect the state after reset which comes from
the features.

Revert the original commit for now.

Cc: Tonghao Zhang <xiangxia.m.yue@gmail.com>
Cc: Willem de Bruijn <willemb@google.com>
Fixes: 3618ad2a7c0e7 ("virtio-net: ethtool configurable RXCSUM")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

changes from v1:
	- clarify how to reproduce the bug in the log


 drivers/net/virtio_net.c | 50 +++++++++++-----------------------------
 1 file changed, 13 insertions(+), 37 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index d2d2c4a53cf2..21b71148c532 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -68,8 +68,6 @@ static const unsigned long guest_offloads[] = {
 				(1ULL << VIRTIO_NET_F_GUEST_ECN)  | \
 				(1ULL << VIRTIO_NET_F_GUEST_UFO))
 
-#define GUEST_OFFLOAD_CSUM_MASK (1ULL << VIRTIO_NET_F_GUEST_CSUM)
-
 struct virtnet_stat_desc {
 	char desc[ETH_GSTRING_LEN];
 	size_t offset;
@@ -2524,48 +2522,29 @@ static int virtnet_get_phys_port_name(struct net_device *dev, char *buf,
 	return 0;
 }
 
-static netdev_features_t virtnet_fix_features(struct net_device *netdev,
-					      netdev_features_t features)
-{
-	/* If Rx checksum is disabled, LRO should also be disabled. */
-	if (!(features & NETIF_F_RXCSUM))
-		features &= ~NETIF_F_LRO;
-
-	return features;
-}
-
 static int virtnet_set_features(struct net_device *dev,
 				netdev_features_t features)
 {
 	struct virtnet_info *vi = netdev_priv(dev);
-	u64 offloads = vi->guest_offloads;
+	u64 offloads;
 	int err;
 
-	/* Don't allow configuration while XDP is active. */
-	if (vi->xdp_queue_pairs)
-		return -EBUSY;
-
 	if ((dev->features ^ features) & NETIF_F_LRO) {
+		if (vi->xdp_queue_pairs)
+			return -EBUSY;
+
 		if (features & NETIF_F_LRO)
-			offloads |= GUEST_OFFLOAD_LRO_MASK &
-				    vi->guest_offloads_capable;
+			offloads = vi->guest_offloads_capable;
 		else
-			offloads &= ~GUEST_OFFLOAD_LRO_MASK;
+			offloads = vi->guest_offloads_capable &
+				   ~GUEST_OFFLOAD_LRO_MASK;
+
+		err = virtnet_set_guest_offloads(vi, offloads);
+		if (err)
+			return err;
+		vi->guest_offloads = offloads;
 	}
 
-	if ((dev->features ^ features) & NETIF_F_RXCSUM) {
-		if (features & NETIF_F_RXCSUM)
-			offloads |= GUEST_OFFLOAD_CSUM_MASK &
-				    vi->guest_offloads_capable;
-		else
-			offloads &= ~GUEST_OFFLOAD_CSUM_MASK;
-	}
-
-	err = virtnet_set_guest_offloads(vi, offloads);
-	if (err)
-		return err;
-
-	vi->guest_offloads = offloads;
 	return 0;
 }
 
@@ -2584,7 +2563,6 @@ static const struct net_device_ops virtnet_netdev = {
 	.ndo_features_check	= passthru_features_check,
 	.ndo_get_phys_port_name	= virtnet_get_phys_port_name,
 	.ndo_set_features	= virtnet_set_features,
-	.ndo_fix_features	= virtnet_fix_features,
 };
 
 static void virtnet_config_changed_work(struct work_struct *work)
@@ -3035,10 +3013,8 @@ static int virtnet_probe(struct virtio_device *vdev)
 	if (virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_TSO4) ||
 	    virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_TSO6))
 		dev->features |= NETIF_F_LRO;
-	if (virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_GUEST_OFFLOADS)) {
-		dev->hw_features |= NETIF_F_RXCSUM;
+	if (virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_GUEST_OFFLOADS))
 		dev->hw_features |= NETIF_F_LRO;
-	}
 
 	dev->vlan_features = dev->features;
 
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
