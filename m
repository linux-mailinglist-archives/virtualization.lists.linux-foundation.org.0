Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 54819860F0
	for <lists.virtualization@lfdr.de>; Thu,  8 Aug 2019 13:36:30 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 84D19F30;
	Thu,  8 Aug 2019 11:36:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DECE3DC0
	for <virtualization@lists.linux-foundation.org>;
	Thu,  8 Aug 2019 11:36:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8E9AE82F
	for <virtualization@lists.linux-foundation.org>;
	Thu,  8 Aug 2019 11:36:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 19EF0300BEA9;
	Thu,  8 Aug 2019 11:36:16 +0000 (UTC)
Received: from dhcp201-121.englab.pnq.redhat.com (unknown [10.65.16.3])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8EF04612BF;
	Thu,  8 Aug 2019 11:36:13 +0000 (UTC)
From: Pankaj Gupta <pagupta@redhat.com>
To: amit@kernel.org,
	mst@redhat.com
Subject: [PATCH v2 1/2] virtio_console: free unused buffers with port delete
Date: Thu,  8 Aug 2019 17:06:05 +0530
Message-Id: <20190808113606.19504-2-pagupta@redhat.com>
In-Reply-To: <20190808113606.19504-1-pagupta@redhat.com>
References: <20190808113606.19504-1-pagupta@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Thu, 08 Aug 2019 11:36:16 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: pagupta@redhat.com, arnd@arndb.de, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

  The commit a7a69ec0d8e4 ("virtio_console: free buffers after reset")
  deferred detaching of unused buffer to virtio device unplug time.

  This causes unplug/replug of single port in virtio device with an
  error "Error allocating inbufs\n". As we don't free the unused buffers
  attached with the port. Re-plug the same port tries to allocate new
  buffers in virtqueue and results in this error if queue is full.

  This patch removes the unused buffers in vq's when we unplug the port.
  This is the best we can do as we cannot call device_reset because virtio
  device is still active.

Reported-by: Xiaohui Li <xiaohli@redhat.com>
Fixes: b3258ff1d6 ("virtio_console: free buffers after reset")
Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
---
 drivers/char/virtio_console.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
index 7270e7b69262..e8be82f1bae9 100644
--- a/drivers/char/virtio_console.c
+++ b/drivers/char/virtio_console.c
@@ -1494,15 +1494,25 @@ static void remove_port(struct kref *kref)
 	kfree(port);
 }
 
+static void remove_unused_bufs(struct virtqueue *vq)
+{
+	struct port_buffer *buf;
+
+	while ((buf = virtqueue_detach_unused_buf(vq)))
+		free_buf(buf, true);
+}
+
 static void remove_port_data(struct port *port)
 {
 	spin_lock_irq(&port->inbuf_lock);
 	/* Remove unused data this port might have received. */
 	discard_port_data(port);
+	remove_unused_bufs(port->in_vq);
 	spin_unlock_irq(&port->inbuf_lock);
 
 	spin_lock_irq(&port->outvq_lock);
 	reclaim_consumed_buffers(port);
+	remove_unused_bufs(port->out_vq);
 	spin_unlock_irq(&port->outvq_lock);
 }
 
@@ -1938,11 +1948,9 @@ static void remove_vqs(struct ports_device *portdev)
 	struct virtqueue *vq;
 
 	virtio_device_for_each_vq(portdev->vdev, vq) {
-		struct port_buffer *buf;
 
 		flush_bufs(vq, true);
-		while ((buf = virtqueue_detach_unused_buf(vq)))
-			free_buf(buf, true);
+		remove_unused_bufs(vq);
 	}
 	portdev->vdev->config->del_vqs(portdev->vdev);
 	kfree(portdev->in_vqs);
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
