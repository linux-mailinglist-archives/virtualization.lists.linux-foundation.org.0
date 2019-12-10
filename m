Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CD063118567
	for <lists.virtualization@lfdr.de>; Tue, 10 Dec 2019 11:43:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7D88C8698E;
	Tue, 10 Dec 2019 10:43:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BcyLkqlYW-Qn; Tue, 10 Dec 2019 10:43:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7194F87632;
	Tue, 10 Dec 2019 10:43:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 58C53C0881;
	Tue, 10 Dec 2019 10:43:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 00608C0881
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 10:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id F0FCC8690F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 10:43:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FEA2KPckTnoz
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 10:43:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 341E887646
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 10:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575974612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8fTadIIM/EGcJyroW82UCutvScqyTCaxJaPZkU5T0yE=;
 b=KeBgpt2i0f+tSE8+ICAru/8GKQWozSHtFch6vYVDW2bQVOvXSazUnubdv+EV98aIW3ZUaS
 ayyY51ztsWIUXsXQ2g33iC0fDsxL3BnTCAAGLsHvVG+vwZgP6jQCG7TvxqQnzMIDdm4EPt
 77aduEFbs/cbJQPMRTuvAWLdWCDMy7g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-VouMmq0dMj-tIB48CAjylw-1; Tue, 10 Dec 2019 05:43:28 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EA92104ED28;
 Tue, 10 Dec 2019 10:43:27 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-168.ams2.redhat.com
 [10.36.117.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7246D605AF;
 Tue, 10 Dec 2019 10:43:25 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org,
	davem@davemloft.net
Subject: [PATCH net-next v2 6/6] vsock/virtio: remove loopback handling
Date: Tue, 10 Dec 2019 11:43:07 +0100
Message-Id: <20191210104307.89346-7-sgarzare@redhat.com>
In-Reply-To: <20191210104307.89346-1-sgarzare@redhat.com>
References: <20191210104307.89346-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: VouMmq0dMj-tIB48CAjylw-1
X-Mimecast-Spam-Score: 0
Cc: kvm@vger.kernel.org, Dexuan Cui <decui@microsoft.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Jorgen Hansen <jhansen@vmware.com>
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

We can remove the loopback handling from virtio_transport,
because now the vsock core is able to handle local communication
using the new vsock_loopback device.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 net/vmw_vsock/virtio_transport.c | 61 ++------------------------------
 1 file changed, 2 insertions(+), 59 deletions(-)

diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
index 1458c5c8b64d..dfbaf6bd8b1c 100644
--- a/net/vmw_vsock/virtio_transport.c
+++ b/net/vmw_vsock/virtio_transport.c
@@ -44,10 +44,6 @@ struct virtio_vsock {
 	spinlock_t send_pkt_list_lock;
 	struct list_head send_pkt_list;
 
-	struct work_struct loopback_work;
-	spinlock_t loopback_list_lock; /* protects loopback_list */
-	struct list_head loopback_list;
-
 	atomic_t queued_replies;
 
 	/* The following fields are protected by rx_lock.  vqs[VSOCK_VQ_RX]
@@ -86,20 +82,6 @@ static u32 virtio_transport_get_local_cid(void)
 	return ret;
 }
 
-static int virtio_transport_send_pkt_loopback(struct virtio_vsock *vsock,
-					      struct virtio_vsock_pkt *pkt)
-{
-	int len = pkt->len;
-
-	spin_lock_bh(&vsock->loopback_list_lock);
-	list_add_tail(&pkt->list, &vsock->loopback_list);
-	spin_unlock_bh(&vsock->loopback_list_lock);
-
-	queue_work(virtio_vsock_workqueue, &vsock->loopback_work);
-
-	return len;
-}
-
 static void
 virtio_transport_send_pkt_work(struct work_struct *work)
 {
@@ -194,7 +176,8 @@ virtio_transport_send_pkt(struct virtio_vsock_pkt *pkt)
 	}
 
 	if (le64_to_cpu(pkt->hdr.dst_cid) == vsock->guest_cid) {
-		len = virtio_transport_send_pkt_loopback(vsock, pkt);
+		virtio_transport_free_pkt(pkt);
+		len = -ENODEV;
 		goto out_rcu;
 	}
 
@@ -502,33 +485,6 @@ static struct virtio_transport virtio_transport = {
 	.send_pkt = virtio_transport_send_pkt,
 };
 
-static void virtio_transport_loopback_work(struct work_struct *work)
-{
-	struct virtio_vsock *vsock =
-		container_of(work, struct virtio_vsock, loopback_work);
-	LIST_HEAD(pkts);
-
-	spin_lock_bh(&vsock->loopback_list_lock);
-	list_splice_init(&vsock->loopback_list, &pkts);
-	spin_unlock_bh(&vsock->loopback_list_lock);
-
-	mutex_lock(&vsock->rx_lock);
-
-	if (!vsock->rx_run)
-		goto out;
-
-	while (!list_empty(&pkts)) {
-		struct virtio_vsock_pkt *pkt;
-
-		pkt = list_first_entry(&pkts, struct virtio_vsock_pkt, list);
-		list_del_init(&pkt->list);
-
-		virtio_transport_recv_pkt(&virtio_transport, pkt);
-	}
-out:
-	mutex_unlock(&vsock->rx_lock);
-}
-
 static void virtio_transport_rx_work(struct work_struct *work)
 {
 	struct virtio_vsock *vsock =
@@ -633,13 +589,10 @@ static int virtio_vsock_probe(struct virtio_device *vdev)
 	mutex_init(&vsock->event_lock);
 	spin_lock_init(&vsock->send_pkt_list_lock);
 	INIT_LIST_HEAD(&vsock->send_pkt_list);
-	spin_lock_init(&vsock->loopback_list_lock);
-	INIT_LIST_HEAD(&vsock->loopback_list);
 	INIT_WORK(&vsock->rx_work, virtio_transport_rx_work);
 	INIT_WORK(&vsock->tx_work, virtio_transport_tx_work);
 	INIT_WORK(&vsock->event_work, virtio_transport_event_work);
 	INIT_WORK(&vsock->send_pkt_work, virtio_transport_send_pkt_work);
-	INIT_WORK(&vsock->loopback_work, virtio_transport_loopback_work);
 
 	mutex_lock(&vsock->tx_lock);
 	vsock->tx_run = true;
@@ -720,22 +673,12 @@ static void virtio_vsock_remove(struct virtio_device *vdev)
 	}
 	spin_unlock_bh(&vsock->send_pkt_list_lock);
 
-	spin_lock_bh(&vsock->loopback_list_lock);
-	while (!list_empty(&vsock->loopback_list)) {
-		pkt = list_first_entry(&vsock->loopback_list,
-				       struct virtio_vsock_pkt, list);
-		list_del(&pkt->list);
-		virtio_transport_free_pkt(pkt);
-	}
-	spin_unlock_bh(&vsock->loopback_list_lock);
-
 	/* Delete virtqueues and flush outstanding callbacks if any */
 	vdev->config->del_vqs(vdev);
 
 	/* Other works can be queued before 'config->del_vqs()', so we flush
 	 * all works before to free the vsock object to avoid use after free.
 	 */
-	flush_work(&vsock->loopback_work);
 	flush_work(&vsock->rx_work);
 	flush_work(&vsock->tx_work);
 	flush_work(&vsock->event_work);
-- 
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
