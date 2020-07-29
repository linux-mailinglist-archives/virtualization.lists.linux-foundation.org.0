Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B846232599
	for <lists.virtualization@lfdr.de>; Wed, 29 Jul 2020 21:48:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B2C2F844E4;
	Wed, 29 Jul 2020 19:48:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JKY5X-hm7XHx; Wed, 29 Jul 2020 19:48:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5C62C844B4;
	Wed, 29 Jul 2020 19:48:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3A663C004D;
	Wed, 29 Jul 2020 19:48:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5D378C004D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 19:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4476287E41
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 19:48:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LHroRoCCPZFT
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 19:48:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7515387E45
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 19:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596052102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CgfetowmgmpIHlSMpqa8J/+66H7aoCSwd4gSByA73AQ=;
 b=hfzi107GV+6b+DwUeGTj/t25uvP7Tx9xFM6SpXvf6GKRfHFMYR0AmYtHI0sdtGHmCSHUMu
 vai1Okvl2eOMKu4oK22e2qWppwgguvgaOa6VFXjuJkXfHJcGUY3nIfWRbS71p9rfyRQ4sK
 RqC/I6EN/BdCDgQrSL5tegUuQQlxIpk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-ykVM02ExOlS8Ew11TJ5Ddw-1; Wed, 29 Jul 2020 15:48:20 -0400
X-MC-Unique: ykVM02ExOlS8Ew11TJ5Ddw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40E478015CE;
 Wed, 29 Jul 2020 19:48:19 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 834385C6C0;
 Wed, 29 Jul 2020 19:48:16 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] scsi: virtio-scsi: handle correctly case when all LUNs
 were unplugged
Date: Wed, 29 Jul 2020 22:48:06 +0300
Message-Id: <20200729194806.4933-2-mlevitsk@redhat.com>
In-Reply-To: <20200729194806.4933-1-mlevitsk@redhat.com>
References: <20200729194806.4933-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: "open list:SCSI SUBSYSTEM" <linux-scsi@vger.kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "open list:VIRTIO BLOCK AND SCSI DRIVERS"
 <virtualization@lists.linux-foundation.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
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

Commit 5ff843721467 ("scsi: virtio_scsi: unplug LUNs when events missed"),
almost fixed the case of mass unpluging of LUNs, but it missed a
corner case in which all the LUNs are unplugged at the same time.

In this case INQUIRY ends with DID_BAD_TARGET.
Detect this and unplug the LUN.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 drivers/scsi/virtio_scsi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/scsi/virtio_scsi.c b/drivers/scsi/virtio_scsi.c
index 0e0910c5b9424..c7f0c22b6f11d 100644
--- a/drivers/scsi/virtio_scsi.c
+++ b/drivers/scsi/virtio_scsi.c
@@ -351,6 +351,16 @@ static void virtscsi_rescan_hotunplug(struct virtio_scsi *vscsi)
 			/* PQ indicates the LUN is not attached */
 			scsi_remove_device(sdev);
 		}
+
+		else if (host_byte(result) == DID_BAD_TARGET) {
+			/*
+			 * if all LUNs of a virtio-scsi device are unplugged,
+			 * it will respond with BAD TARGET on any INQUIRY
+			 * command.
+			 * Remove the device in this case as well
+			 */
+			scsi_remove_device(sdev);
+		}
 	}
 
 	kfree(inq_result);
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
