Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B5831CC91
	for <lists.virtualization@lfdr.de>; Tue, 16 Feb 2021 16:04:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 966DD86E48;
	Tue, 16 Feb 2021 15:04:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1T0w2I0Y54Dk; Tue, 16 Feb 2021 15:04:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F215A8703C;
	Tue, 16 Feb 2021 15:04:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CE934C013A;
	Tue, 16 Feb 2021 15:04:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1968AC013A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Feb 2021 15:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 045678462E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Feb 2021 15:04:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EKxs79JUCiNa
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Feb 2021 15:04:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7F54184558
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Feb 2021 15:04:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 79E5F64E02;
 Tue, 16 Feb 2021 15:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1613487857;
 bh=dFqS/nktC66uzqreX4zuPT90X5LT9qN9HzXMa79Su5s=;
 h=From:To:Cc:Subject:Date:From;
 b=t2xLrlnZ97QVGWSRJYz/K8vzxzGlOwJcQIKXk7No1OGDeG8Qnb9oZRTN22qiDe2+o
 V3sA4F5D0qE/kgCLj5VSLoGbTLeQsjpAlB5pJA3YzAdVSLN2TKyziQFC3JS1y9R5Uc
 SGGe9a+s0b774xdIaGl7nzqaS+p4cTsQE29V85/M=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH] virtio_console: remove pointless check for
 debugfs_create_dir()
Date: Tue, 16 Feb 2021 16:04:10 +0100
Message-Id: <20210216150410.3844635-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Amit Shah <amit@kernel.org>
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

It is impossible for debugfs_create_dir() to return NULL, so checking
for it gives people a false sense that they actually are doing something
if an error occurs.  As there is no need to ever change kernel logic if
debugfs is working "properly" or not, there is no need to check the
return value of debugfs calls, so remove the checks here as they will
never be triggered and are wrong.

Cc: Amit Shah <amit@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: virtualization@lists.linux-foundation.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/char/virtio_console.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
index 1836cc56e357..59dfd9c421a1 100644
--- a/drivers/char/virtio_console.c
+++ b/drivers/char/virtio_console.c
@@ -1456,18 +1456,15 @@ static int add_port(struct ports_device *portdev, u32 id)
 	 */
 	send_control_msg(port, VIRTIO_CONSOLE_PORT_READY, 1);
 
-	if (pdrvdata.debugfs_dir) {
-		/*
-		 * Finally, create the debugfs file that we can use to
-		 * inspect a port's state at any time
-		 */
-		snprintf(debugfs_name, sizeof(debugfs_name), "vport%up%u",
-			 port->portdev->vdev->index, id);
-		port->debugfs_file = debugfs_create_file(debugfs_name, 0444,
-							 pdrvdata.debugfs_dir,
-							 port,
-							 &port_debugfs_fops);
-	}
+	/*
+	 * Finally, create the debugfs file that we can use to
+	 * inspect a port's state at any time
+	 */
+	snprintf(debugfs_name, sizeof(debugfs_name), "vport%up%u",
+		 port->portdev->vdev->index, id);
+	port->debugfs_file = debugfs_create_file(debugfs_name, 0444,
+						 pdrvdata.debugfs_dir,
+						 port, &port_debugfs_fops);
 	return 0;
 
 free_inbufs:
@@ -2244,8 +2241,6 @@ static int __init init(void)
 	}
 
 	pdrvdata.debugfs_dir = debugfs_create_dir("virtio-ports", NULL);
-	if (!pdrvdata.debugfs_dir)
-		pr_warn("Error creating debugfs dir for virtio-ports\n");
 	INIT_LIST_HEAD(&pdrvdata.consoles);
 	INIT_LIST_HEAD(&pdrvdata.portdevs);
 
-- 
2.30.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
