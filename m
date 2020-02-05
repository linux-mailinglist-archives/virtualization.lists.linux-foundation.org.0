Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 23374153549
	for <lists.virtualization@lfdr.de>; Wed,  5 Feb 2020 17:34:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D6048832A3;
	Wed,  5 Feb 2020 16:34:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zjhENL2_tVAb; Wed,  5 Feb 2020 16:34:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 68A2F81A2C;
	Wed,  5 Feb 2020 16:34:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5524BC0174;
	Wed,  5 Feb 2020 16:34:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5CC93C0174
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 16:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 498A0811E5
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 16:34:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id osQI5RpVYMqN
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 16:34:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 764D781F17
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 16:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580920461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UcRyPB3D16FS1hVzLFRfsL6mac9y5ECi0rwpQjWwHMc=;
 b=glMUQ8wRYstOwtkmh9gjNAAGRhE0s7JSIXCq+xEJcPm96Wk25rGa8PwpO6acfWnrB4k3dW
 PDZ35ZnMI5H0mLVt77OYeAt4O6/NnHN5vWXQVGAAswpeY0/fcNzw7wFRCnY4kB7Hfl0LDL
 0llhwz2yMg/xC7lCCSHUNB2uNHPnNds=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-vcLuwmAEPOubLDhojSHGcg-1; Wed, 05 Feb 2020 11:34:16 -0500
X-MC-Unique: vcLuwmAEPOubLDhojSHGcg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 706BA8018B7;
 Wed,  5 Feb 2020 16:34:15 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-116-217.ams2.redhat.com [10.36.116.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA5D91001B08;
 Wed,  5 Feb 2020 16:34:13 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] virtio_balloon: Fix memory leaks on errors in
 virtballoon_probe()
Date: Wed,  5 Feb 2020 17:34:01 +0100
Message-Id: <20200205163402.42627-3-david@redhat.com>
In-Reply-To: <20200205163402.42627-1-david@redhat.com>
References: <20200205163402.42627-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: Liang Li <liang.z.li@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org
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

We forget to put the inode and unmount the kernfs used for compaction.

Fixes: 71994620bb25 ("virtio_balloon: replace oom notifier with shrinker")
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Wei Wang <wei.w.wang@intel.com>
Cc: Liang Li <liang.z.li@intel.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/virtio/virtio_balloon.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index abef2306c899..7e5d84caeb94 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -901,8 +901,7 @@ static int virtballoon_probe(struct virtio_device *vdev)
 	vb->vb_dev_info.inode = alloc_anon_inode(balloon_mnt->mnt_sb);
 	if (IS_ERR(vb->vb_dev_info.inode)) {
 		err = PTR_ERR(vb->vb_dev_info.inode);
-		kern_unmount(balloon_mnt);
-		goto out_del_vqs;
+		goto out_kern_unmount;
 	}
 	vb->vb_dev_info.inode->i_mapping->a_ops = &balloon_aops;
 #endif
@@ -913,13 +912,13 @@ static int virtballoon_probe(struct virtio_device *vdev)
 		 */
 		if (virtqueue_get_vring_size(vb->free_page_vq) < 2) {
 			err = -ENOSPC;
-			goto out_del_vqs;
+			goto out_iput;
 		}
 		vb->balloon_wq = alloc_workqueue("balloon-wq",
 					WQ_FREEZABLE | WQ_CPU_INTENSIVE, 0);
 		if (!vb->balloon_wq) {
 			err = -ENOMEM;
-			goto out_del_vqs;
+			goto out_iput;
 		}
 		INIT_WORK(&vb->report_free_page_work, report_free_page_func);
 		vb->cmd_id_received_cache = VIRTIO_BALLOON_CMD_ID_STOP;
@@ -953,6 +952,12 @@ static int virtballoon_probe(struct virtio_device *vdev)
 out_del_balloon_wq:
 	if (virtio_has_feature(vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT))
 		destroy_workqueue(vb->balloon_wq);
+out_iput:
+#ifdef CONFIG_BALLOON_COMPACTION
+	iput(vb->vb_dev_info.inode);
+out_kern_unmount:
+	kern_unmount(balloon_mnt);
+#endif
 out_del_vqs:
 	vdev->config->del_vqs(vdev);
 out_free_vb:
-- 
2.24.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
