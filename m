Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D07122729
	for <lists.virtualization@lfdr.de>; Sun, 19 May 2019 18:18:24 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2D946BE4;
	Sun, 19 May 2019 16:17:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EBF071B11
	for <virtualization@lists.linux-foundation.org>;
	Sun, 28 Apr 2019 01:50:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 80FBD71C
	for <virtualization@lists.linux-foundation.org>;
	Sun, 28 Apr 2019 01:50:11 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id z8so3359886pln.4
	for <virtualization@lists.linux-foundation.org>;
	Sat, 27 Apr 2019 18:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bytedance-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=km6nvMFOsSwfEhLerIzEth+9iCizOTyYju+loT0I83o=;
	b=jQLqlF84DIuvSU/M49N2V9MjXSTIvD8x3osrCxUMBbW2s6ihFsDPhgMO8+Qjp3zhjQ
	wYXhJzfgmHDAMxRWTr55M2uPpVu+1DJpU18TdOKGPsXHb7vf43Aiifp/5Z8EUSavFa6O
	o42G7iWrcv3jN39cbKtjbVj9GF1+mB3P5EAqR5PnQQyLg8SW8Xcn91ESiumoU2UfWmlL
	i5+/lXnWnqGXetW1gqM4bxwP2HqJyhhMdytXAK5H41f9ZGTuwcj/Xd6ep5Qijs7NeRM7
	fMyLIq73bA182xzs/IzAxPC9wDumw50ArG56A/6wtTZAg1SMfjy18sC2VnnpjfCAQdCA
	32+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=km6nvMFOsSwfEhLerIzEth+9iCizOTyYju+loT0I83o=;
	b=rtq/nXb7kgHRlRS514gnKY5uAa8eQJrVXqOH+1JAUBms6UxlrAt9CW3Z+FlHV0my/3
	kgVxA5QO5XIUozSlJ7NjDlRs6HCOR0jCD0bPcMlq9jlInLNRZoChVmnZqsZe8BVmKv7U
	oo0+mdCLQhIGTY8WnDt3bHKatcBTqzEdM1tEc/NIVCCRh6XOi5k0buElSE6A+nda3IT3
	rvksCvMKvG/oNbkilDu0stNlPxjLceVSsE0LECrBh2s6KAs6GTWc/yA9M4N8wc81Ywdi
	u3va+ypwV4GSMHawS0PSo+gX4QEQyEcVKpa5xzticeu8LEfOjVfWiHzoZhyctM9TORu7
	ojCw==
X-Gm-Message-State: APjAAAUFZ23r4PzpDQ/5qpqkZ0YJmQCALNz+U/RV6JmDvTOknl1vv0Gb
	i4qm+LoU75H6kmQTk+6PfWs+sg==
X-Google-Smtp-Source: APXvYqw3cjqwBUbWVRIw2KkzcON84vhFih1xRtKjnqg2bMnhFOcX1TpqmM5A6Ma6oxhNk1oJONB94Q==
X-Received: by 2002:a17:902:2de4:: with SMTP id
	p91mr54620308plb.191.1556416210711; 
	Sat, 27 Apr 2019 18:50:10 -0700 (PDT)
Received: from always-ThinkPad-T480.bytedance.net ([61.120.150.76])
	by smtp.gmail.com with ESMTPSA id
	l15sm37555522pfi.79.2019.04.27.18.50.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Apr 2019 18:50:09 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: amit@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Subject: [PATCH] virtio_console: remove vq buf while unpluging port
Date: Sun, 28 Apr 2019 09:50:04 +0800
Message-Id: <1556416204-30311-1-git-send-email-pizhenwei@bytedance.com>
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
