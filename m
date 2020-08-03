Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E5023A3C6
	for <lists.virtualization@lfdr.de>; Mon,  3 Aug 2020 14:04:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 307E220341;
	Mon,  3 Aug 2020 12:04:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TIlOtCvj3PY0; Mon,  3 Aug 2020 12:04:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 52F102033E;
	Mon,  3 Aug 2020 12:04:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 29012C004C;
	Mon,  3 Aug 2020 12:04:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7A529C004C
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Aug 2020 12:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 62B2185AF1
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Aug 2020 12:04:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tlA57131XyNj
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Aug 2020 12:04:38 +0000 (UTC)
X-Greylist: delayed 00:15:46 by SQLgrey-1.7.6
Received: from mxct.zte.com.cn (out1.zte.com.cn [202.103.147.172])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B0E1D85A96
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Aug 2020 12:04:38 +0000 (UTC)
Received: from mse-fl1.zte.com.cn (unknown [10.30.14.238])
 by Forcepoint Email with ESMTPS id 6D3A3CCBE0C8360DBA6B;
 Mon,  3 Aug 2020 19:48:47 +0800 (CST)
Received: from notes_smtp.zte.com.cn (notessmtp.zte.com.cn [10.30.1.239])
 by mse-fl1.zte.com.cn with ESMTP id 073BmjGR014618;
 Mon, 3 Aug 2020 19:48:45 +0800 (GMT-8)
 (envelope-from wang.yi59@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
 by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
 with ESMTP id 2020080319485078-4487275 ;
 Mon, 3 Aug 2020 19:48:50 +0800 
From: Yi Wang <wang.yi59@zte.com.cn>
To: mst@redhat.com
Subject: [PATCH] virtio_pci_modern: Fix the comment of
 virtio_pci_find_capability()
Date: Mon, 3 Aug 2020 19:52:24 +0800
Message-Id: <1596455545-43556-1-git-send-email-wang.yi59@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
 8.5.3FP6|November 21, 2013) at 2020-08-03 19:48:50,
 Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2020-08-03 19:48:46, Serialize complete at 2020-08-03 19:48:46
X-MAIL: mse-fl1.zte.com.cn 073BmjGR014618
Cc: wang.yi59@zte.com.cn, wang.liang82@zte.com.cn, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, xue.zhihong@zte.com.cn,
 Liao Pingfang <liao.pingfang@zte.com.cn>
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

From: Liao Pingfang <liao.pingfang@zte.com.cn>

Fix the comment of virtio_pci_find_capability() by adding missing comment
for the last parameter: bars.

Fixes: 59a5b0f7bf74 ("virtio-pci: alloc only resources actually used.")
Signed-off-by: Liao Pingfang <liao.pingfang@zte.com.cn>
Signed-off-by: Yi Wang <wang.yi59@zte.com.cn>
---
 drivers/virtio/virtio_pci_modern.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
index db93cedd262f..9bdc6f68221f 100644
--- a/drivers/virtio/virtio_pci_modern.c
+++ b/drivers/virtio/virtio_pci_modern.c
@@ -481,6 +481,7 @@ static const struct virtio_config_ops virtio_pci_config_ops = {
  * @dev: the pci device
  * @cfg_type: the VIRTIO_PCI_CAP_* value we seek
  * @ioresource_types: IORESOURCE_MEM and/or IORESOURCE_IO.
+ * @bars: the bitmask of BARs
  *
  * Returns offset of the capability, or 0.
  */
-- 
2.26.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
