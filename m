Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BCC2272E
	for <lists.virtualization@lfdr.de>; Sun, 19 May 2019 18:19:13 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9EFDDA59;
	Sun, 19 May 2019 16:17:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7491842AC
	for <virtualization@lists.linux-foundation.org>;
	Sun,  5 May 2019 01:53:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9813987
	for <virtualization@lists.linux-foundation.org>;
	Sun,  5 May 2019 01:53:55 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id t22so4643767pgi.10
	for <virtualization@lists.linux-foundation.org>;
	Sat, 04 May 2019 18:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bytedance-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=km6nvMFOsSwfEhLerIzEth+9iCizOTyYju+loT0I83o=;
	b=sQp6UxKr7uhqm11eKXZj0r3ycIeOua2uD3eP6V4NK0AXF1W2EmzjfumW2bnGLWFtAJ
	02gmAu84af2WuLRdtuBKwWutQ1aQVLK0I8tjBJrTFG2WVYU6xM37A5vJIBbCnyBDiuXC
	c2qjhB8MFx55OR/93NWkh8x1wyktKmAF8nWIcmRbA2FD4BQhWY//XHZEdeQtyK3VBTXx
	T+VxBESrQFR+qWyryt1JDNIzmdKssaGjLhMg2hHsXTcVgdK0dAf2bz3W+f+NPJ08jDbL
	qbufY2a42LT3n5T80W3XIFXa2Nb7XQtzkkH8wzhJz0qEXNkmEb96gmHyOKXOBOzf6nPM
	JHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=km6nvMFOsSwfEhLerIzEth+9iCizOTyYju+loT0I83o=;
	b=fzhk3I8nB8Y6j6cuiEHLcCssUXhxlMU1IAFQa1LgNM7SFQlqth4cm7Nv1Lvbcrlto8
	pzyPET2PuVVmgvOFzGyGauRDZw0Hjf37FYYhmOtCu/Pm+kY7+b466qOLvux0MprJzYff
	irZ58bpqUnPMY3eAQxBpGTSdLsiKJx8vgJyGrQTKv0wuR1zLfGs59CldlQ37pvvQb7AA
	Xey9CvQ2EjOxbtZapQ2O/wQoMB6nOD2BPZzAmvWe0f02D4VVTKNk+2efmAwks5sPRNom
	aDfiQMSTfbu9gfTq+Kla5Azcb3NNXUEuO5rzA5usU2jRGN/GxLkqeYzlbEIDKJkVzFub
	1rdQ==
X-Gm-Message-State: APjAAAWzG+42rkR5EEfz1DZpruCBKzwvzYgkLOkzWWW7i2vPNkqgVHbQ
	vGN5oGJsci3JGHkMs/qqYHY7Fg==
X-Google-Smtp-Source: APXvYqyQtLpEoifSX/2dZlgVV/Kt/1fOK6SLnyj8gwJqY1dF3VPwiE14cIMt3z4H60jzjadH4YDE3w==
X-Received: by 2002:a65:6688:: with SMTP id b8mr21704064pgw.81.1557021235040; 
	Sat, 04 May 2019 18:53:55 -0700 (PDT)
Received: from always-ThinkPad-T480.bytedance.net ([61.120.150.76])
	by smtp.gmail.com with ESMTPSA id
	b77sm14112877pfj.99.2019.05.04.18.53.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 18:53:54 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: amit@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Subject: [PATCH] virtio_console: remove vq buf while unpluging port
Date: Sun,  5 May 2019 09:53:42 +0800
Message-Id: <1557021222-5133-1-git-send-email-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Sun, 19 May 2019 16:17:22 +0000
Cc: linux-kernel@vger.kernel.org, pizhenwei@bytedance.com,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

A bug can be easily reproduced:
Host# cat guest-agent.xml
<channel type="unix">
  <source mode="bind" path="/var/lib/libvirt/qemu/stretch.agent"/>
  <target type="virtio" name="org.qemu.guest_agent.0" state="connected"/>
</channel>
Host# virsh attach-device instance guest-agent.xml
Host# virsh detach-device instance guest-agent.xml
Host# virsh attach-device instance guest-agent.xml

and guest report: virtio-ports vport0p1: Error allocating inbufs

The reason is that the port is unplugged and the vq buf still remained.
So, fix two cases in this patch:
1, fix memory leak with attach-device/detach-device.
2, fix logic bug with attach-device/detach-device/attach-device.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 drivers/char/virtio_console.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
index fbeb719..f6e37f4 100644
--- a/drivers/char/virtio_console.c
+++ b/drivers/char/virtio_console.c
@@ -251,6 +251,7 @@ struct port {
 
 /* This is the very early arch-specified put chars function. */
 static int (*early_put_chars)(u32, const char *, int);
+static void remove_vq(struct virtqueue *vq);
 
 static struct port *find_port_by_vtermno(u32 vtermno)
 {
@@ -1550,6 +1551,9 @@ static void unplug_port(struct port *port)
 	}
 
 	remove_port_data(port);
+	spin_lock_irq(&port->inbuf_lock);
+	remove_vq(port->in_vq);
+	spin_unlock_irq(&port->inbuf_lock);
 
 	/*
 	 * We should just assume the device itself has gone off --
@@ -1945,17 +1949,22 @@ static const struct file_operations portdev_fops = {
 	.owner = THIS_MODULE,
 };
 
+static void remove_vq(struct virtqueue *vq)
+{
+	struct port_buffer *buf;
+
+	flush_bufs(vq, true);
+	while ((buf = virtqueue_detach_unused_buf(vq)))
+		free_buf(buf, true);
+}
+
 static void remove_vqs(struct ports_device *portdev)
 {
 	struct virtqueue *vq;
 
-	virtio_device_for_each_vq(portdev->vdev, vq) {
-		struct port_buffer *buf;
+	virtio_device_for_each_vq(portdev->vdev, vq)
+		remove_vq(vq);
 
-		flush_bufs(vq, true);
-		while ((buf = virtqueue_detach_unused_buf(vq)))
-			free_buf(buf, true);
-	}
 	portdev->vdev->config->del_vqs(portdev->vdev);
 	kfree(portdev->in_vqs);
 	kfree(portdev->out_vqs);
-- 
2.7.4

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
