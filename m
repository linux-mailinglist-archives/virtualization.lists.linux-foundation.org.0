Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D4E6BB6E
	for <lists.virtualization@lfdr.de>; Wed, 17 Jul 2019 13:31:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C8E21EC0;
	Wed, 17 Jul 2019 11:30:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 50392DC3
	for <virtualization@lists.linux-foundation.org>;
	Wed, 17 Jul 2019 11:30:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0AFB471C
	for <virtualization@lists.linux-foundation.org>;
	Wed, 17 Jul 2019 11:30:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8F45D81F19;
	Wed, 17 Jul 2019 11:30:49 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-116-100.ams2.redhat.com
	[10.36.116.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7AFF45C28C;
	Wed, 17 Jul 2019 11:30:47 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [PATCH v4 3/5] vsock/virtio: fix locking in
	virtio_transport_inc_tx_pkt()
Date: Wed, 17 Jul 2019 13:30:28 +0200
Message-Id: <20190717113030.163499-4-sgarzare@redhat.com>
In-Reply-To: <20190717113030.163499-1-sgarzare@redhat.com>
References: <20190717113030.163499-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 17 Jul 2019 11:30:49 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"David S. Miller" <davem@davemloft.net>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

fwd_cnt and last_fwd_cnt are protected by rx_lock, so we should use
the same spinlock also if we are in the TX path.

Move also buf_alloc under the same lock.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 include/linux/virtio_vsock.h            | 2 +-
 net/vmw_vsock/virtio_transport_common.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/virtio_vsock.h b/include/linux/virtio_vsock.h
index 49fc9d20bc43..4c7781f4b29b 100644
--- a/include/linux/virtio_vsock.h
+++ b/include/linux/virtio_vsock.h
@@ -35,7 +35,6 @@ struct virtio_vsock_sock {
 
 	/* Protected by tx_lock */
 	u32 tx_cnt;
-	u32 buf_alloc;
 	u32 peer_fwd_cnt;
 	u32 peer_buf_alloc;
 
@@ -43,6 +42,7 @@ struct virtio_vsock_sock {
 	u32 fwd_cnt;
 	u32 last_fwd_cnt;
 	u32 rx_bytes;
+	u32 buf_alloc;
 	struct list_head rx_queue;
 };
 
diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
index a85559d4d974..34a2b42313b7 100644
--- a/net/vmw_vsock/virtio_transport_common.c
+++ b/net/vmw_vsock/virtio_transport_common.c
@@ -210,11 +210,11 @@ static void virtio_transport_dec_rx_pkt(struct virtio_vsock_sock *vvs,
 
 void virtio_transport_inc_tx_pkt(struct virtio_vsock_sock *vvs, struct virtio_vsock_pkt *pkt)
 {
-	spin_lock_bh(&vvs->tx_lock);
+	spin_lock_bh(&vvs->rx_lock);
 	vvs->last_fwd_cnt = vvs->fwd_cnt;
 	pkt->hdr.fwd_cnt = cpu_to_le32(vvs->fwd_cnt);
 	pkt->hdr.buf_alloc = cpu_to_le32(vvs->buf_alloc);
-	spin_unlock_bh(&vvs->tx_lock);
+	spin_unlock_bh(&vvs->rx_lock);
 }
 EXPORT_SYMBOL_GPL(virtio_transport_inc_tx_pkt);
 
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
