Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C8343AD16
	for <lists.virtualization@lfdr.de>; Tue, 26 Oct 2021 09:20:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2C07608E9;
	Tue, 26 Oct 2021 07:20:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lnkljN8RJRup; Tue, 26 Oct 2021 07:20:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 98550608DA;
	Tue, 26 Oct 2021 07:20:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 34FEBC0021;
	Tue, 26 Oct 2021 07:20:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 33F6CC000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Oct 2021 07:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17178608DF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Oct 2021 07:20:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Uv1XOYJEJC7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Oct 2021 07:20:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7DCA0608DA
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Oct 2021 07:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635232824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xdOuNDX3/xmLdrBREE9VW7efZLufc82SxJkpEXQ7fj8=;
 b=CLMRmlgeYiUvO+l/GXH7ehfGFEQ+AwsFo2sffJrpbfvjg2QpFg6wrMEFb5LuclKgJoSpfK
 4YSthT/UrvddNCZ3fxW9nJAxb76AyY1cTFKkuyym4OqM1rVUwEsV6ziLngRRdQwc0bodAX
 Ha0CMrBAMAncsUhX0GenFkndEI4OCqk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-HVBOHg-bMkqAYUDSmK77LA-1; Tue, 26 Oct 2021 03:20:23 -0400
X-MC-Unique: HVBOHg-bMkqAYUDSmK77LA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2AF55074B;
 Tue, 26 Oct 2021 07:20:21 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-80.pek2.redhat.com [10.72.12.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D208619C79;
 Tue, 26 Oct 2021 07:20:18 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	virtualization@lists.linux-foundation.org
Subject: [PATCH V4 4/4] virtio-scsi: don't let virtio core to validate used
 buffer length
Date: Tue, 26 Oct 2021 15:20:00 +0800
Message-Id: <20211026072000.8699-5-jasowang@redhat.com>
In-Reply-To: <20211026072000.8699-1-jasowang@redhat.com>
References: <20211026072000.8699-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: f.hetzelt@tu-berlin.de, linux-kernel@vger.kernel.org, david.kaplan@amd.com,
 konrad.wilk@oracle.com
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

We never tries to use used length, so the patch prevents the virtio
core from validating used length.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/scsi/virtio_scsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/scsi/virtio_scsi.c b/drivers/scsi/virtio_scsi.c
index 07d0250f17c3..03b09ecea42d 100644
--- a/drivers/scsi/virtio_scsi.c
+++ b/drivers/scsi/virtio_scsi.c
@@ -977,6 +977,7 @@ static unsigned int features[] = {
 static struct virtio_driver virtio_scsi_driver = {
 	.feature_table = features,
 	.feature_table_size = ARRAY_SIZE(features),
+	.suppress_used_validation = true,
 	.driver.name = KBUILD_MODNAME,
 	.driver.owner = THIS_MODULE,
 	.id_table = id_table,
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
