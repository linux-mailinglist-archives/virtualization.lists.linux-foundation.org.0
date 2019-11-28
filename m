Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5298910CD96
	for <lists.virtualization@lfdr.de>; Thu, 28 Nov 2019 18:15:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D7A2A87BC0;
	Thu, 28 Nov 2019 17:15:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R5kwRqMHMjpu; Thu, 28 Nov 2019 17:15:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 723D787B98;
	Thu, 28 Nov 2019 17:15:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60144C0881;
	Thu, 28 Nov 2019 17:15:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C8F8BC1DD5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Nov 2019 17:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B2911883C6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Nov 2019 17:15:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AiTnzxruPlF8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Nov 2019 17:15:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 98CD3883DA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Nov 2019 17:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574961339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i43hEG8t6TDOi2Mge5CT+4KErjH/1IrCl/OdUkMsEKc=;
 b=AfHoQJ3oweaELN1IzMvpJ9xyE47T7/jYKuDlBX526G3Q2emnjUmjJSKntNk0OIJa2FQExw
 BVYY7QWkkj5z+51kYpeI2tDwmlk+0Q2NgnJuQ3/2tHM1QuDvwQjfZcrK7XUsiYQ6kRWVDm
 PpNbamGKGIXF5IDWLI4mrWl5h984kxo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-V9_Me1OjMuqt2wlDS8MvuQ-1; Thu, 28 Nov 2019 12:15:38 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A2E380183C;
 Thu, 28 Nov 2019 17:15:36 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-168.ams2.redhat.com
 [10.36.117.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 35E0E600C8;
 Thu, 28 Nov 2019 17:15:34 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [RFC PATCH 3/3] vhost/vsock: use netns of process that opens the
 vhost-vsock device
Date: Thu, 28 Nov 2019 18:15:19 +0100
Message-Id: <20191128171519.203979-4-sgarzare@redhat.com>
In-Reply-To: <20191128171519.203979-1-sgarzare@redhat.com>
References: <20191128171519.203979-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: V9_Me1OjMuqt2wlDS8MvuQ-1
X-Mimecast-Spam-Score: 0
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Dexuan Cui <decui@microsoft.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Jorgen Hansen <jhansen@vmware.com>
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

This patch also allows to have different VMs, running in different
network namespace, with the same CID.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 drivers/vhost/vsock.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
index 31b0f3608752..e162b3604302 100644
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
+		if (other_cid == guest_cid && net_eq(net, vsock->net))
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
@@ -606,7 +608,14 @@ static int vhost_vsock_dev_open(struct inode *inode, struct file *file)
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
@@ -628,7 +637,9 @@ static int vhost_vsock_dev_open(struct inode *inode, struct file *file)
 	vhost_work_init(&vsock->send_pkt_work, vhost_transport_send_pkt_work);
 	return 0;
 
-out:
+out_vqs:
+	kfree(vqs);
+out_vsock:
 	vhost_vsock_free(vsock);
 	return ret;
 }
@@ -653,7 +664,7 @@ static void vhost_vsock_reset_orphans(struct sock *sk)
 	 */
 
 	/* If the peer is still valid, no need to reset connection */
-	if (vhost_vsock_get(vsk->remote_addr.svm_cid))
+	if (vhost_vsock_get(vsk->remote_addr.svm_cid, sock_net(sk)))
 		return;
 
 	/* If the close timeout is pending, let it expire.  This avoids races
@@ -701,6 +712,7 @@ static int vhost_vsock_dev_release(struct inode *inode, struct file *file)
 	spin_unlock_bh(&vsock->send_pkt_list_lock);
 
 	vhost_dev_cleanup(&vsock->dev);
+	put_net(vsock->net);
 	kfree(vsock->dev.vqs);
 	vhost_vsock_free(vsock);
 	return 0;
@@ -727,7 +739,7 @@ static int vhost_vsock_set_cid(struct vhost_vsock *vsock, u64 guest_cid)
 
 	/* Refuse if CID is already in use */
 	mutex_lock(&vhost_vsock_mutex);
-	other = vhost_vsock_get(guest_cid);
+	other = vhost_vsock_get(guest_cid, vsock->net);
 	if (other && other != vsock) {
 		mutex_unlock(&vhost_vsock_mutex);
 		return -EADDRINUSE;
-- 
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
