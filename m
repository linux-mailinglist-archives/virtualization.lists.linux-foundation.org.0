Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 612FBDCBCF
	for <lists.virtualization@lfdr.de>; Fri, 18 Oct 2019 18:47:35 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C4195BE7;
	Fri, 18 Oct 2019 16:47:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DAD9CB79
	for <virtualization@lists.linux-foundation.org>;
	Fri, 18 Oct 2019 16:47:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 86C99608
	for <virtualization@lists.linux-foundation.org>;
	Fri, 18 Oct 2019 16:47:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C28CA328E;
	Fri, 18 Oct 2019 16:47:25 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-116-247.ams2.redhat.com
	[10.36.116.247])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0A0915D713;
	Fri, 18 Oct 2019 16:47:19 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] virtio_console: allocate inbufs in add_port() only if it is
	needed
Date: Fri, 18 Oct 2019 18:47:18 +0200
Message-Id: <20191018164718.15999-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 18 Oct 2019 16:47:25 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Laurent Vivier <lvivier@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Amit Shah <amit@kernel.org>, virtualization@lists.linux-foundation.org
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

Rather than that, this patch changes add_port() logic to only allocate the
buffers if the in_vq has available free slots.

Fixes: a7a69ec0d8e4 ("virtio_console: free buffers after reset")
Cc: mst@redhat.com
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 drivers/char/virtio_console.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
index 7270e7b69262..77105166fe01 100644
--- a/drivers/char/virtio_console.c
+++ b/drivers/char/virtio_console.c
@@ -1421,12 +1421,17 @@ static int add_port(struct ports_device *portdev, u32 id)
 	spin_lock_init(&port->outvq_lock);
 	init_waitqueue_head(&port->waitqueue);
 
-	/* Fill the in_vq with buffers so the host can send us data. */
-	nr_added_bufs = fill_queue(port->in_vq, &port->inbuf_lock);
-	if (!nr_added_bufs) {
-		dev_err(port->dev, "Error allocating inbufs\n");
-		err = -ENOMEM;
-		goto free_device;
+	/* if the in_vq has not already been filled (the port has already been
+	 * used and unplugged), fill the in_vq with buffers so the host can
+	 * send us data.
+	 */
+	if (port->in_vq->num_free != 0) {
+		nr_added_bufs = fill_queue(port->in_vq, &port->inbuf_lock);
+		if (!nr_added_bufs) {
+			dev_err(port->dev, "Error allocating inbufs\n");
+			err = -ENOMEM;
+			goto free_device;
+		}
 	}
 
 	if (is_rproc_serial(port->portdev->vdev))
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
