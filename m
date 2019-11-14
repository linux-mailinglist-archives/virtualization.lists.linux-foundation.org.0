Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A3691FC646
	for <lists.virtualization@lfdr.de>; Thu, 14 Nov 2019 13:26:08 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 91CB9101D;
	Thu, 14 Nov 2019 12:26:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A1976FDC
	for <virtualization@lists.linux-foundation.org>;
	Thu, 14 Nov 2019 12:26:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 8BD2F712
	for <virtualization@lists.linux-foundation.org>;
	Thu, 14 Nov 2019 12:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573734357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding;
	bh=a5nk+UsxrkOpZ6P16BSWtrv/YMbcrYuVPUbQaS97uJU=;
	b=hfIlHWVVaVikwwrU6OI8qiRoDZlf1eyIn+phlF+NzJVhn8KT56U8cYmj2fC3KFNdLUTbu1
	rEp4TK1LsfXGpJNsHboKiCsJDu2fUNdQcnwzJlBDWejJIreF60LhnCXDbVFw2+W6ZJlJ94
	laF28qXCx3A8BTKFl6wO0727XGdL3Jc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-275-FGic_7jdPwu8_FGYn3rBrg-1; Thu, 14 Nov 2019 07:25:55 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52DE110CE7B2;
	Thu, 14 Nov 2019 12:25:54 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-117-236.ams2.redhat.com
	[10.36.117.236])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C1AB661356;
	Thu, 14 Nov 2019 12:25:49 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3] virtio_console: allocate inbufs in add_port() only if it
	is needed
Date: Thu, 14 Nov 2019 13:25:48 +0100
Message-Id: <20191114122548.24364-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: FGic_7jdPwu8_FGYn3rBrg-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Laurent Vivier <lvivier@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
	Amit Shah <amit@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Michael S . Tsirkin" <mst@redhat.com>, stable@vger.kernel.org,
	virtualization@lists.linux-foundation.org
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

When we hot unplug a virtserialport and then try to hot plug again,
it fails:

(qemu) chardev-add socket,id=serial0,path=/tmp/serial0,server,nowait
(qemu) device_add virtserialport,bus=virtio-serial0.0,nr=2,\
                  chardev=serial0,id=serial0,name=serial0
(qemu) device_del serial0
(qemu) device_add virtserialport,bus=virtio-serial0.0,nr=2,\
                  chardev=serial0,id=serial0,name=serial0
kernel error:
  virtio-ports vport2p2: Error allocating inbufs
qemu error:
  virtio-serial-bus: Guest failure in adding port 2 for device \
                     virtio-serial0.0

This happens because buffers for the in_vq are allocated when the port is
added but are not released when the port is unplugged.

They are only released when virtconsole is removed (see a7a69ec0d8e4)

To avoid the problem and to be symmetric, we could allocate all the buffers
in init_vqs() as they are released in remove_vqs(), but it sounds like
a waste of memory.

Rather than that, this patch changes add_port() logic to ignore ENOSPC
error in fill_queue(), which means queue has already been filled.

Fixes: a7a69ec0d8e4 ("virtio_console: free buffers after reset")
Cc: mst@redhat.com
Cc: stable@vger.kernel.org
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---

Notes:
    v3: add a comment about ENOSPC error
    v2: making fill_queue return int and testing return code for -ENOSPC

 drivers/char/virtio_console.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
index 7270e7b69262..3259426f01dc 100644
--- a/drivers/char/virtio_console.c
+++ b/drivers/char/virtio_console.c
@@ -1325,24 +1325,24 @@ static void set_console_size(struct port *port, u16 rows, u16 cols)
 	port->cons.ws.ws_col = cols;
 }
 
-static unsigned int fill_queue(struct virtqueue *vq, spinlock_t *lock)
+static int fill_queue(struct virtqueue *vq, spinlock_t *lock)
 {
 	struct port_buffer *buf;
-	unsigned int nr_added_bufs;
+	int nr_added_bufs;
 	int ret;
 
 	nr_added_bufs = 0;
 	do {
 		buf = alloc_buf(vq->vdev, PAGE_SIZE, 0);
 		if (!buf)
-			break;
+			return -ENOMEM;
 
 		spin_lock_irq(lock);
 		ret = add_inbuf(vq, buf);
 		if (ret < 0) {
 			spin_unlock_irq(lock);
 			free_buf(buf, true);
-			break;
+			return ret;
 		}
 		nr_added_bufs++;
 		spin_unlock_irq(lock);
@@ -1362,7 +1362,6 @@ static int add_port(struct ports_device *portdev, u32 id)
 	char debugfs_name[16];
 	struct port *port;
 	dev_t devt;
-	unsigned int nr_added_bufs;
 	int err;
 
 	port = kmalloc(sizeof(*port), GFP_KERNEL);
@@ -1421,11 +1420,13 @@ static int add_port(struct ports_device *portdev, u32 id)
 	spin_lock_init(&port->outvq_lock);
 	init_waitqueue_head(&port->waitqueue);
 
-	/* Fill the in_vq with buffers so the host can send us data. */
-	nr_added_bufs = fill_queue(port->in_vq, &port->inbuf_lock);
-	if (!nr_added_bufs) {
+	/* We can safely ignore ENOSPC because it means
+	 * the queue already has buffers. Buffers are removed
+	 * only by virtcons_remove(), not by unplug_port()
+	 */
+	err = fill_queue(port->in_vq, &port->inbuf_lock);
+	if (err < 0 && err != -ENOSPC) {
 		dev_err(port->dev, "Error allocating inbufs\n");
-		err = -ENOMEM;
 		goto free_device;
 	}
 
@@ -2059,14 +2060,11 @@ static int virtcons_probe(struct virtio_device *vdev)
 	INIT_WORK(&portdev->control_work, &control_work_handler);
 
 	if (multiport) {
-		unsigned int nr_added_bufs;
-
 		spin_lock_init(&portdev->c_ivq_lock);
 		spin_lock_init(&portdev->c_ovq_lock);
 
-		nr_added_bufs = fill_queue(portdev->c_ivq,
-					   &portdev->c_ivq_lock);
-		if (!nr_added_bufs) {
+		err = fill_queue(portdev->c_ivq, &portdev->c_ivq_lock);
+		if (err < 0) {
 			dev_err(&vdev->dev,
 				"Error allocating buffers for control queue\n");
 			/*
@@ -2077,7 +2075,7 @@ static int virtcons_probe(struct virtio_device *vdev)
 					   VIRTIO_CONSOLE_DEVICE_READY, 0);
 			/* Device was functional: we need full cleanup. */
 			virtcons_remove(vdev);
-			return -ENOMEM;
+			return err;
 		}
 	} else {
 		/*
-- 
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
