Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 764D91E1EB2
	for <lists.virtualization@lfdr.de>; Tue, 26 May 2020 11:36:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1699422763;
	Tue, 26 May 2020 09:36:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bh55-ZhMUIPU; Tue, 26 May 2020 09:36:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E18482283C;
	Tue, 26 May 2020 09:36:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C3123C016F;
	Tue, 26 May 2020 09:36:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 89E27C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 May 2020 09:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6BB59863BE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 May 2020 09:36:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lcCEHGizmhDJ
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 May 2020 09:36:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B64A986473
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 May 2020 09:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590485798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=N9CrJGv37BpytimFY2SmZJooBun68CG0VTdXjYuGNU0=;
 b=Zu2sTYVpyeM1r/hC0aq9cfUZw8Ied+y1WzF0GssxZ6V78G6ZeC8yx/NKmhUhoup0hzBUeD
 zBDW90Rx+MmGSqjJDKPuAHCTjnTPH1glqrxYtFg6jrvLmLX6WIctl06JKPSgAPqUHbTy7d
 GCrN9LuBGl9vwx6o2jQ3qoSrPgOuGho=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-LiCUBOrPOJ2m6HPSepfNzQ-1; Tue, 26 May 2020 05:36:34 -0400
X-MC-Unique: LiCUBOrPOJ2m6HPSepfNzQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46F80100A8F2;
 Tue, 26 May 2020 09:36:33 +0000 (UTC)
Received: from localhost (ovpn-113-77.ams2.redhat.com [10.36.113.77])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D96596EF8C;
 Tue, 26 May 2020 09:36:32 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: [PATCH] s390/virtio: remove unused pm callbacks
Date: Tue, 26 May 2020 11:36:29 +0200
Message-Id: <20200526093629.257649-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: linux-s390@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
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

Support for hibernation on s390 has been recently been removed with
commit 394216275c7d ("s390: remove broken hibernate / power management
support"), no need to keep unused code around.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 drivers/s390/virtio/virtio_ccw.c | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/s390/virtio/virtio_ccw.c b/drivers/s390/virtio/virtio_ccw.c
index 957889a42d2e..5730572b52cd 100644
--- a/drivers/s390/virtio/virtio_ccw.c
+++ b/drivers/s390/virtio/virtio_ccw.c
@@ -1372,27 +1372,6 @@ static struct ccw_device_id virtio_ids[] = {
 	{},
 };
 
-#ifdef CONFIG_PM_SLEEP
-static int virtio_ccw_freeze(struct ccw_device *cdev)
-{
-	struct virtio_ccw_device *vcdev = dev_get_drvdata(&cdev->dev);
-
-	return virtio_device_freeze(&vcdev->vdev);
-}
-
-static int virtio_ccw_restore(struct ccw_device *cdev)
-{
-	struct virtio_ccw_device *vcdev = dev_get_drvdata(&cdev->dev);
-	int ret;
-
-	ret = virtio_ccw_set_transport_rev(vcdev);
-	if (ret)
-		return ret;
-
-	return virtio_device_restore(&vcdev->vdev);
-}
-#endif
-
 static struct ccw_driver virtio_ccw_driver = {
 	.driver = {
 		.owner = THIS_MODULE,
@@ -1405,11 +1384,6 @@ static struct ccw_driver virtio_ccw_driver = {
 	.set_online = virtio_ccw_online,
 	.notify = virtio_ccw_cio_notify,
 	.int_class = IRQIO_VIR,
-#ifdef CONFIG_PM_SLEEP
-	.freeze = virtio_ccw_freeze,
-	.thaw = virtio_ccw_restore,
-	.restore = virtio_ccw_restore,
-#endif
 };
 
 static int __init pure_hex(char **cp, unsigned int *val, int min_digit,
-- 
2.25.4

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
