Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0392766DE
	for <lists.virtualization@lfdr.de>; Thu, 24 Sep 2020 05:22:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 279252DE22;
	Thu, 24 Sep 2020 03:22:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FrbxeNzWhK0T; Thu, 24 Sep 2020 03:22:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3C7B522D24;
	Thu, 24 Sep 2020 03:22:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2946FC0051;
	Thu, 24 Sep 2020 03:22:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7EC55C0051
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 03:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 67439237C8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 03:22:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wNySXwIxr+XM
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 03:22:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by silver.osuosl.org (Postfix) with ESMTPS id 6264D22D24
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 03:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600917731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yL5gnmJjXM50BmL15PZqm3Qryv26tfuJ/8EBJBgWRs8=;
 b=ZoaSq8Nh60hWkXdR9MnzuXQX1s3ck+W+0tl6lsRV6oxU8xA1IZdVPfzqqs0s22BvCzd1WV
 qxi9BZvgjQKgUFoMt4ZA4Nj5RHC20XQAJDGRamgaQPEpC2SBTpkxn2LkR/uivilyYKHxfG
 GwL5ieXO7LxytZD8eccO0oJNTI5oHn0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-3to2PfkSM_eUuEe1qWyNBA-1; Wed, 23 Sep 2020 23:22:09 -0400
X-MC-Unique: 3to2PfkSM_eUuEe1qWyNBA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2008F1074652;
 Thu, 24 Sep 2020 03:22:06 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-193.pek2.redhat.com [10.72.13.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA91355768;
 Thu, 24 Sep 2020 03:21:50 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [RFC PATCH 02/24] vhost-vdpa: fix vqs leak in vhost_vdpa_open()
Date: Thu, 24 Sep 2020 11:21:03 +0800
Message-Id: <20200924032125.18619-3-jasowang@redhat.com>
In-Reply-To: <20200924032125.18619-1-jasowang@redhat.com>
References: <20200924032125.18619-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: lulu@redhat.com, kvm@vger.kernel.org, netdev@vger.kernel.org,
 mhabets@solarflare.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 hanand@xilinx.com, stefanha@redhat.com, eli@mellanox.com,
 maxime.coquelin@redhat.com, lingshan.zhu@intel.com, rob.miller@broadcom.com
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

We need to free vqs during the err path after it has been allocated
since vhost won't do that for us.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vhost/vdpa.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
index 796fe979f997..9c641274b9f3 100644
--- a/drivers/vhost/vdpa.c
+++ b/drivers/vhost/vdpa.c
@@ -764,6 +764,12 @@ static void vhost_vdpa_free_domain(struct vhost_vdpa *v)
 	v->domain = NULL;
 }
 
+static void vhost_vdpa_cleanup(struct vhost_vdpa *v)
+{
+	vhost_dev_cleanup(&v->vdev);
+	kfree(v->vdev.vqs);
+}
+
 static int vhost_vdpa_open(struct inode *inode, struct file *filep)
 {
 	struct vhost_vdpa *v;
@@ -809,7 +815,7 @@ static int vhost_vdpa_open(struct inode *inode, struct file *filep)
 	return 0;
 
 err_init_iotlb:
-	vhost_dev_cleanup(&v->vdev);
+	vhost_vdpa_cleanup(v);
 err:
 	atomic_dec(&v->opened);
 	return r;
@@ -840,8 +846,7 @@ static int vhost_vdpa_release(struct inode *inode, struct file *filep)
 	vhost_vdpa_free_domain(v);
 	vhost_vdpa_config_put(v);
 	vhost_vdpa_clean_irq(v);
-	vhost_dev_cleanup(&v->vdev);
-	kfree(v->vdev.vqs);
+	vhost_vdpa_cleanup(v);
 	mutex_unlock(&d->mutex);
 
 	atomic_dec(&v->opened);
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
