Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5991C128FA8
	for <lists.virtualization@lfdr.de>; Sun, 22 Dec 2019 20:08:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0D6F720115;
	Sun, 22 Dec 2019 19:08:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oq2-LbnX7WpT; Sun, 22 Dec 2019 19:08:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 182DC20017;
	Sun, 22 Dec 2019 19:08:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 000E9C0881;
	Sun, 22 Dec 2019 19:08:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8DF76C0881
 for <virtualization@lists.linux-foundation.org>;
 Sun, 22 Dec 2019 19:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 73295858C9
 for <virtualization@lists.linux-foundation.org>;
 Sun, 22 Dec 2019 19:08:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bBsLUe1VOQhS
 for <virtualization@lists.linux-foundation.org>;
 Sun, 22 Dec 2019 19:08:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5EAAD85361
 for <virtualization@lists.linux-foundation.org>;
 Sun, 22 Dec 2019 19:08:42 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id p9so6332195plk.9
 for <virtualization@lists.linux-foundation.org>;
 Sun, 22 Dec 2019 11:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=t2pcE/zB/zRFa+D+0DGOcMCSuy9rY9vAk3qxszJwLvo=;
 b=eK3u6NGTjCt3W6n8+0kujic7kEYU+S23lpnUv4W0WBuW1drRdllW/DFgThMGZVF8/Z
 w6PtNPkCPEpyp7kEn/OIqwWI7FlvrHh7pbKWdlUpDP4qMfOB8p8NvSyVkaC9CmlENc5m
 9HbwVrK+GgovJWWsH7G4QJID9V00e9WIpcGVgNblJx+/tGXFWKpQVfV+xZEzUV8ZN1bk
 tfUV2NjuIcskaaBE7v8wywg9z2+BUYgsrCq8xfnfsYfZTO9uu1/7KDQsPsQgs21EObjo
 knHrkV3QDFsg7oToxZ/iVXjdN1R/TNuA4FmrJzpZhkuEWx0De3Lnp8Q1XFcuuWvV9ets
 dCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=t2pcE/zB/zRFa+D+0DGOcMCSuy9rY9vAk3qxszJwLvo=;
 b=lh00MHCFBej2GCxBr8aqYMcNfp1Y1YfiO39Pxf4BVvqCIYeClFZWEyXvrk+mq6O/7h
 Vd9DwAM1mhDRbwEkGE160Gt0bjYa6grgc63k5BxVCyfz7LznZ+FRglmLBBIrZcwY5hv0
 YEgHwLIwpdkJqmPn1WopbB8/XuHMYeiOD+2fhhVdjVkEVF15uKdvqhjNxPmgQKFh/ejm
 GUv81db9mT+QPWXiCclKEUiqf+hVsm8Ucni1bjT05X2Xyo3wxRbSgP8vNd/96o6CD0rx
 9YcBQ+KRS5f/YcCPF98Ep6IMySEzRYTApJvnXzLDkjYERs8z+x4Ta+DnKI2zixILkgqW
 zZTA==
X-Gm-Message-State: APjAAAWefG9i40V6D+zwpCV+Hfrl4s2CFG1Gh1cQ30n09ubJTx78VoEb
 gvLkF9ekqEIeEyv4kA3nPkI=
X-Google-Smtp-Source: APXvYqz39Vp0a6zPzR6fPNDFQyU57GdaiKA8kXCxB1r5wua09/6D53xwbX3AciCIHG6yNWbyBak+nw==
X-Received: by 2002:a17:90a:bb0c:: with SMTP id
 u12mr13130220pjr.100.1577041722010; 
 Sun, 22 Dec 2019 11:08:42 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id p28sm19181262pgb.93.2019.12.22.11.08.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 22 Dec 2019 11:08:41 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH] virtio-mmio: convert to devm_platform_ioremap_resource
Date: Sun, 22 Dec 2019 19:08:39 +0000
Message-Id: <20191222190839.4863-1-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Yangtao Li <tiny.windzz@gmail.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Use devm_platform_ioremap_resource() to simplify code, which
contains platform_get_resource, devm_request_mem_region and
devm_ioremap.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/virtio/virtio_mmio.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
index e09edb5c5e06..97d5725fd9a2 100644
--- a/drivers/virtio/virtio_mmio.c
+++ b/drivers/virtio/virtio_mmio.c
@@ -531,18 +531,9 @@ static void virtio_mmio_release_dev(struct device *_d)
 static int virtio_mmio_probe(struct platform_device *pdev)
 {
 	struct virtio_mmio_device *vm_dev;
-	struct resource *mem;
 	unsigned long magic;
 	int rc;
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!mem)
-		return -EINVAL;
-
-	if (!devm_request_mem_region(&pdev->dev, mem->start,
-			resource_size(mem), pdev->name))
-		return -EBUSY;
-
 	vm_dev = devm_kzalloc(&pdev->dev, sizeof(*vm_dev), GFP_KERNEL);
 	if (!vm_dev)
 		return -ENOMEM;
@@ -554,9 +545,9 @@ static int virtio_mmio_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&vm_dev->virtqueues);
 	spin_lock_init(&vm_dev->lock);
 
-	vm_dev->base = devm_ioremap(&pdev->dev, mem->start, resource_size(mem));
-	if (vm_dev->base == NULL)
-		return -EFAULT;
+	vm_dev->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(vm_dev->base))
+		return PTR_ERR(vm_dev->base);
 
 	/* Check magic value */
 	magic = readl(vm_dev->base + VIRTIO_MMIO_MAGIC_VALUE);
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
