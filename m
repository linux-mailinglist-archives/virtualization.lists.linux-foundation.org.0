Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8167B1C78
	for <lists.virtualization@lfdr.de>; Thu, 28 Sep 2023 14:31:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65DCF41B74;
	Thu, 28 Sep 2023 12:24:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65DCF41B74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jTJaiAo3LKaz; Thu, 28 Sep 2023 12:24:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 937C341A55;
	Thu, 28 Sep 2023 12:24:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 937C341A55
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C96BAC008C;
	Thu, 28 Sep 2023 12:24:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 36A00C0032
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Sep 2023 12:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A0E4822BF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Sep 2023 12:24:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A0E4822BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 62gFk7MHlH5D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Sep 2023 12:24:26 +0000 (UTC)
X-Greylist: delayed 348 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 28 Sep 2023 12:24:25 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEBA382278
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EEBA382278
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Sep 2023 12:24:25 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:e207:8adb:af22:7f1e])
 by albert.telenet-ops.be with bizsmtp
 id rQJa2A0083w8i7m06QJa0y; Thu, 28 Sep 2023 14:18:34 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qlpy5-004mRe-LC;
 Thu, 28 Sep 2023 14:18:34 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qlpyU-001ODc-3r;
 Thu, 28 Sep 2023 14:18:34 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mike Christie <michael.christie@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH] vhost-scsi: Spelling s/preceeding/preceding/g
Date: Thu, 28 Sep 2023 14:18:33 +0200
Message-Id: <b57b882675809f1f9dacbf42cf6b920b2bea9cba.1695903476.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Fix a misspelling of "preceding".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/vhost/scsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
index abef0619c7901af0..2d689181bafef241 100644
--- a/drivers/vhost/scsi.c
+++ b/drivers/vhost/scsi.c
@@ -1158,7 +1158,7 @@ vhost_scsi_handle_vq(struct vhost_scsi *vs, struct vhost_virtqueue *vq)
 			/*
 			 * Set prot_iter to data_iter and truncate it to
 			 * prot_bytes, and advance data_iter past any
-			 * preceeding prot_bytes that may be present.
+			 * preceding prot_bytes that may be present.
 			 *
 			 * Also fix up the exp_data_len to reflect only the
 			 * actual data payload length.
-- 
2.34.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
