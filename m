Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A5913E753
	for <lists.virtualization@lfdr.de>; Thu, 16 Jan 2020 18:25:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1ACC320341;
	Thu, 16 Jan 2020 17:25:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TooX7Xj2xXyu; Thu, 16 Jan 2020 17:25:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7216221FA9;
	Thu, 16 Jan 2020 17:25:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A8B9C077D;
	Thu, 16 Jan 2020 17:25:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38F97C077D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 17:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 361AA2206D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 17:25:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gP-VX0x7dOPK
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 17:24:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 19DB120341
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 17:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579195495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rJXCaurapNQ3l0l2gppkZEC8B+0gvsSxNTKA5/PN+5k=;
 b=UCN+paU/wQyQ6BTwPFumvC9JIx0Ubm1/ikweKV4QQMKD1tHx8Vk2Mqc52IGh6rXmeRjEYt
 v663eqs+wmRTbXzDuq/3M0xbFsdFs/wOfL00SesM61/4zBhU9YbFfLdKen3jwgLujlovSp
 h14kqg7JFrAAjhEIsmWYfbRNhCmzGIQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-D6q33l1yOH-_YtBkUiFYyg-1; Thu, 16 Jan 2020 12:24:53 -0500
X-MC-Unique: D6q33l1yOH-_YtBkUiFYyg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BD63477;
 Thu, 16 Jan 2020 17:24:52 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-242.ams2.redhat.com
 [10.36.117.242])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A6405C1D8;
 Thu, 16 Jan 2020 17:24:48 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: davem@davemloft.net,
	netdev@vger.kernel.org
Subject: [PATCH net-next 3/3] vhost/vsock: use netns of process that opens the
 vhost-vsock device
Date: Thu, 16 Jan 2020 18:24:28 +0100
Message-Id: <20200116172428.311437-4-sgarzare@redhat.com>
In-Reply-To: <20200116172428.311437-1-sgarzare@redhat.com>
References: <20200116172428.311437-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Dexuan Cui <decui@microsoft.com>,
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

This patch assigns the network namespace of the process that opened
vhost-vsock device (e.g. VMM) to the packets coming from the guest,
allowing only host sockets in the same network namespace to
communicate with the guest.

This patch also allows having different VMs, running in different
network namespace, with the same CID.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
RFC -> v1
 * used 'vsock_net_eq()' insted of 'net_eq()'
---
 drivers/vhost/vsock.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
index f1d39939d5e4..8b0169105559 100644
--- a/drivers/vhost/vsock.c
+++ b/drivers/vhost/vsock.c
@@ -40,6 +40,7 @@ static DEFINE_READ_MOSTLY_HASHTABLE(vhost_vsock_hash, 8);
 struct vhost_vsock {
 	struct vhost_dev dev;
 	struct vhost_virtqueue vqs[2];
+	struct net *net;
 
 	/* Link to global vhost_vsock_hash, writes use vhost_vsock_mutex */
 	struct hlist_node hash;
@@ -61,7 +62,7 @@ static u32 vhost_transport_get_local_cid(void)
 /* Callers that dereference the return value must hold vhost_vsock_mutex or the
  * RCU read lock.
  */
-static struct vhost_vsock *vhost_vsock_get(u32 guest_cid)
+static struct vhost_vsock *vhost_vsock_get(u32 guest_cid, struct net *net)
 {
 	struct vhost_vsock *vsock;
 
@@ -72,7 +73,7 @@ static struct vhost_vsock *vhost_vsock_get(u32 guest_cid)
 		if (other_cid == 0)
 			continue;
 
-		if (other_cid == guest_cid)
+		if (other_cid == guest_cid && vsock_net_eq(net, vsock->net))
 			return vsock;
 
 	}
@@ -245,7 +246,7 @@ vhost_transport_send_pkt(struct virtio_vsock_pkt *pkt)
 	rcu_read_lock();
 
 	/* Find the vhost_vsock according to guest context id  */
-	vsock = vhost_vsock_get(le64_to_cpu(pkt->hdr.dst_cid));
+	vsock = vhost_vsock_get(le64_to_cpu(pkt->hdr.dst_cid), pkt->net);
 	if (!vsock) {
 		rcu_read_unlock();
 		virtio_transport_free_pkt(pkt);
@@ -277,7 +278,8 @@ vhost_transport_cancel_pkt(struct vsock_sock *vsk)
 	rcu_read_lock();
 
 	/* Find the vhost_vsock according to guest context id  */
-	vsock = vhost_vsock_get(vsk->remote_addr.svm_cid);
+	vsock = vhost_vsock_get(vsk->remote_addr.svm_cid,
+				sock_net(sk_vsock(vsk)));
 	if (!vsock)
 		goto out;
 
@@ -474,7 +476,7 @@ static void vhost_vsock_handle_tx_kick(struct vhost_work *work)
 			continue;
 		}
 
-		pkt->net = vsock_default_net();
+		pkt->net = vsock->net;
 		len = pkt->len;
 
 		/* Deliver to monitoring devices all received packets */
@@ -608,7 +610,14 @@ static int vhost_vsock_dev_open(struct inode *inode, struct file *file)
 	vqs = kmalloc_array(ARRAY_SIZE(vsock->vqs), sizeof(*vqs), GFP_KERNEL);
 	if (!vqs) {
 		ret = -ENOMEM;
-		goto out;
+		goto out_vsock;
+	}
+
+	/* Derive the network namespace from the pid opening the device */
+	vsock->net = get_net_ns_by_pid(current->pid);
+	if (IS_ERR(vsock->net)) {
+		ret = PTR_ERR(vsock->net);
+		goto out_vqs;
 	}
 
 	vsock->guest_cid = 0; /* no CID assigned yet */
@@ -630,7 +639,9 @@ static int vhost_vsock_dev_open(struct inode *inode, struct file *file)
 	vhost_work_init(&vsock->send_pkt_work, vhost_transport_send_pkt_work);
 	return 0;
 
-out:
+out_vqs:
+	kfree(vqs);
+out_vsock:
 	vhost_vsock_free(vsock);
 	return ret;
 }
@@ -655,7 +666,7 @@ static void vhost_vsock_reset_orphans(struct sock *sk)
 	 */
 
 	/* If the peer is still valid, no need to reset connection */
-	if (vhost_vsock_get(vsk->remote_addr.svm_cid))
+	if (vhost_vsock_get(vsk->remote_addr.svm_cid, sock_net(sk)))
 		return;
 
 	/* If the close timeout is pending, let it expire.  This avoids races
@@ -703,6 +714,7 @@ static int vhost_vsock_dev_release(struct inode *inode, struct file *file)
 	spin_unlock_bh(&vsock->send_pkt_list_lock);
 
 	vhost_dev_cleanup(&vsock->dev);
+	put_net(vsock->net);
 	kfree(vsock->dev.vqs);
 	vhost_vsock_free(vsock);
 	return 0;
@@ -729,7 +741,7 @@ static int vhost_vsock_set_cid(struct vhost_vsock *vsock, u64 guest_cid)
 
 	/* Refuse if CID is already in use */
 	mutex_lock(&vhost_vsock_mutex);
-	other = vhost_vsock_get(guest_cid);
+	other = vhost_vsock_get(guest_cid, vsock->net);
 	if (other && other != vsock) {
 		mutex_unlock(&vhost_vsock_mutex);
 		return -EADDRINUSE;
-- 
2.24.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
