Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 112CC1F029E
	for <lists.virtualization@lfdr.de>; Fri,  5 Jun 2020 23:46:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 214EC884A1;
	Fri,  5 Jun 2020 21:46:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NSl2Zjwgik9D; Fri,  5 Jun 2020 21:46:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E39C288518;
	Fri,  5 Jun 2020 21:46:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C253FC016E;
	Fri,  5 Jun 2020 21:46:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DA576C016E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 21:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B995C2582D
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 21:46:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v0UIfoKDnCMW
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 21:46:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by silver.osuosl.org (Postfix) with ESMTPS id 9CA6D204C8
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 21:46:39 +0000 (UTC)
IronPort-SDR: /nUhyO30I3pkKF1gU5/UE+qwOnJPyWVn3XOH3EjKTo8K7fz4GZvqn37bQfXkmTm+8G07iO7PRo
 yw3g/VfcaHsg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2020 14:46:38 -0700
IronPort-SDR: X1qOiYmG5RxnudBOEYCfiQaRWs8jnViLoIelTHgXuNYq7lAcBCCIVn/h3WSz93Q7xJrS3Lndb3
 ijVk6diV9DEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,477,1583222400"; d="scan'208";a="258142861"
Received: from sjchrist-coffee.jf.intel.com ([10.54.74.152])
 by fmsmga007.fm.intel.com with ESMTP; 05 Jun 2020 14:46:38 -0700
From: Sean Christopherson <sean.j.christopherson@intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>
Subject: [PATCH] virtio_net: Unregister and re-register xdp_rxq across
 freeze/restore
Date: Fri,  5 Jun 2020 14:46:24 -0700
Message-Id: <20200605214624.21430-1-sean.j.christopherson@intel.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 virtualization@lists.linux-foundation.org,
 Jesper Dangaard Brouer <brouer@redhat.com>, bpf@vger.kernel.org
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

Unregister each queue's xdp_rxq during freeze, and re-register the new
instance during restore.  All queues are released during free and
recreated during restore, i.e. the pre-freeze xdp_rxq will be lost.

The bug is detected by WARNs in xdp_rxq_info_unreg() and
xdp_rxq_info_unreg_mem_model() that fire after a suspend/resume cycle as
virtnet_close() attempts to unregister an uninitialized xdp_rxq object.

  ------------[ cut here ]------------
  Driver BUG
  WARNING: CPU: 0 PID: 880 at net/core/xdp.c:163 xdp_rxq_info_unreg+0x48/0x50
  Modules linked in:
  CPU: 0 PID: 880 Comm: ip Not tainted 5.7.0-rc5+ #80
  Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 0.0.0 02/06/2015
  RIP: 0010:xdp_rxq_info_unreg+0x48/0x50
  Code: <0f> 0b eb ca 0f 1f 40 00 0f 1f 44 00 00 53 48 83 ec 10 8b 47 0c 83
  RSP: 0018:ffffc900001ab540 EFLAGS: 00010286
  RAX: 0000000000000000 RBX: ffff88827f83ac80 RCX: 0000000000000000
  RDX: 000000000000000a RSI: ffffffff8253bc2a RDI: ffffffff825397ec
  RBP: 0000000000000000 R08: ffffffff8253bc20 R09: 000000000000000a
  R10: ffffc900001ab548 R11: 0000000000000370 R12: ffff88817a89c000
  R13: 0000000000000000 R14: ffffc900001abbc8 R15: 0000000000000001
  FS:  00007f48b70e70c0(0000) GS:ffff88817bc00000(0000) knlGS:0000000000000000
  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  CR2: 00007f48b6634950 CR3: 0000000277f1d002 CR4: 0000000000160eb0
  Call Trace:
   virtnet_close+0x6a/0xb0
   __dev_close_many+0x91/0x100
   __dev_change_flags+0xc1/0x1c0
   dev_change_flags+0x23/0x60
   do_setlink+0x350/0xdf0
   __rtnl_newlink+0x553/0x860
   rtnl_newlink+0x43/0x60
   rtnetlink_rcv_msg+0x289/0x340
   netlink_rcv_skb+0xd1/0x110
   netlink_unicast+0x203/0x310
   netlink_sendmsg+0x32b/0x460
   sock_sendmsg+0x5b/0x60
   ____sys_sendmsg+0x23e/0x260
   ___sys_sendmsg+0x88/0xd0
   __sys_sendmsg+0x63/0xa0
   do_syscall_64+0x4c/0x170
   entry_SYSCALL_64_after_hwframe+0x44/0xa9
  ------------[ cut here ]------------

Cc: Jesper Dangaard Brouer <brouer@redhat.com>
Fixes: 754b8a21a96d5 ("virtio_net: setup xdp_rxq_info")
Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
---

Disclaimer: I am not remotely confident that this patch is 100% correct
or complete, my VirtIO knowledge is poor and my networking knowledge is
downright abysmal.

 drivers/net/virtio_net.c | 37 +++++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index ba38765dc490..61055be3615e 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -1469,6 +1469,21 @@ static int virtnet_poll(struct napi_struct *napi, int budget)
 	return received;
 }
 
+static int virtnet_reg_xdp(struct xdp_rxq_info *xdp_rxq,
+			   struct net_device *dev, u32 queue_index)
+{
+	int err;
+
+	err = xdp_rxq_info_reg(xdp_rxq, dev, queue_index);
+	if (err < 0)
+		return err;
+
+	err = xdp_rxq_info_reg_mem_model(xdp_rxq, MEM_TYPE_PAGE_SHARED, NULL);
+	if (err < 0)
+		xdp_rxq_info_unreg(xdp_rxq);
+	return err;
+}
+
 static int virtnet_open(struct net_device *dev)
 {
 	struct virtnet_info *vi = netdev_priv(dev);
@@ -1480,17 +1495,10 @@ static int virtnet_open(struct net_device *dev)
 			if (!try_fill_recv(vi, &vi->rq[i], GFP_KERNEL))
 				schedule_delayed_work(&vi->refill, 0);
 
-		err = xdp_rxq_info_reg(&vi->rq[i].xdp_rxq, dev, i);
+		err = virtnet_reg_xdp(&vi->rq[i].xdp_rxq, dev, i);
 		if (err < 0)
 			return err;
 
-		err = xdp_rxq_info_reg_mem_model(&vi->rq[i].xdp_rxq,
-						 MEM_TYPE_PAGE_SHARED, NULL);
-		if (err < 0) {
-			xdp_rxq_info_unreg(&vi->rq[i].xdp_rxq);
-			return err;
-		}
-
 		virtnet_napi_enable(vi->rq[i].vq, &vi->rq[i].napi);
 		virtnet_napi_tx_enable(vi, vi->sq[i].vq, &vi->sq[i].napi);
 	}
@@ -2306,6 +2314,7 @@ static void virtnet_freeze_down(struct virtio_device *vdev)
 
 	if (netif_running(vi->dev)) {
 		for (i = 0; i < vi->max_queue_pairs; i++) {
+			xdp_rxq_info_unreg(&vi->rq[i].xdp_rxq);
 			napi_disable(&vi->rq[i].napi);
 			virtnet_napi_tx_disable(&vi->sq[i].napi);
 		}
@@ -2313,6 +2322,8 @@ static void virtnet_freeze_down(struct virtio_device *vdev)
 }
 
 static int init_vqs(struct virtnet_info *vi);
+static void virtnet_del_vqs(struct virtnet_info *vi);
+static void free_receive_page_frags(struct virtnet_info *vi);
 
 static int virtnet_restore_up(struct virtio_device *vdev)
 {
@@ -2331,6 +2342,10 @@ static int virtnet_restore_up(struct virtio_device *vdev)
 				schedule_delayed_work(&vi->refill, 0);
 
 		for (i = 0; i < vi->max_queue_pairs; i++) {
+			err = virtnet_reg_xdp(&vi->rq[i].xdp_rxq, vi->dev, i);
+			if (err)
+				goto free_vqs;
+
 			virtnet_napi_enable(vi->rq[i].vq, &vi->rq[i].napi);
 			virtnet_napi_tx_enable(vi, vi->sq[i].vq,
 					       &vi->sq[i].napi);
@@ -2340,6 +2355,12 @@ static int virtnet_restore_up(struct virtio_device *vdev)
 	netif_tx_lock_bh(vi->dev);
 	netif_device_attach(vi->dev);
 	netif_tx_unlock_bh(vi->dev);
+	return 0;
+
+free_vqs:
+	cancel_delayed_work_sync(&vi->refill);
+	free_receive_page_frags(vi);
+	virtnet_del_vqs(vi);
 	return err;
 }
 
-- 
2.26.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
