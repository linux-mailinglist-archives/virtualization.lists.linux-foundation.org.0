Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C15B42F1257
	for <lists.virtualization@lfdr.de>; Mon, 11 Jan 2021 13:34:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B1C2F2094C;
	Mon, 11 Jan 2021 12:34:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D5LF2cjJG2tX; Mon, 11 Jan 2021 12:34:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 98B3B214E6;
	Mon, 11 Jan 2021 12:34:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 858C0C013A;
	Mon, 11 Jan 2021 12:34:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A899C013A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 Jan 2021 12:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1F107204B2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 Jan 2021 12:34:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id he9HC8BE1byQ
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 Jan 2021 12:34:04 +0000 (UTC)
X-Greylist: delayed 00:15:06 by SQLgrey-1.7.6
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by silver.osuosl.org (Postfix) with ESMTPS id 2AF48204B0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 Jan 2021 12:34:04 +0000 (UTC)
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Mon, 11 Jan 2021 04:18:54 -0800
Received: from sc-dbc2115.eng.vmware.com (sc-dbc2115.eng.vmware.com
 [10.182.28.6])
 by sc9-mailhost3.vmware.com (Postfix) with ESMTP id 7652F209C4;
 Mon, 11 Jan 2021 04:18:55 -0800 (PST)
From: Jorgen Hansen <jhansen@vmware.com>
To: <linux-kernel@vger.kernel.org>, <virtualization@lists.linux-foundation.org>
Subject: [PATCH] VMCI: Use set_page_dirty_lock() when unregistering guest
 memory
Date: Mon, 11 Jan 2021 04:18:55 -0800
Message-ID: <1610367535-4463-3-git-send-email-jhansen@vmware.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1610367535-4463-1-git-send-email-jhansen@vmware.com>
References: <1610367535-4463-1-git-send-email-jhansen@vmware.com>
MIME-Version: 1.0
Received-SPF: None (EX13-EDG-OU-002.vmware.com: jhansen@vmware.com does not
 designate permitted sender hosts)
Cc: pv-drivers@vmware.com, gregkh@linuxfoundation.org,
 Jorgen Hansen <jhansen@vmware.com>
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

When the VMCI host support releases guest memory in the case where
the VM was killed, the pinned guest pages aren't locked. Use
set_page_dirty_lock() instead of set_page_dirty().

Testing done: Killed VM while having an active VMCI based vSocket
connection and observed warning from ext4. With this fix, no
warning was observed. Ran various vSocket tests without issues.

Fixes: 06164d2b72aa ("VMCI: queue pairs implementation.")
Reviewed-by: Vishnu Dasa <vdasa@vmware.com>
Signed-off-by: Jorgen Hansen <jhansen@vmware.com>
---
 drivers/misc/vmw_vmci/vmci_queue_pair.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/vmw_vmci/vmci_queue_pair.c b/drivers/misc/vmw_vmci/vmci_queue_pair.c
index a3691c1..525ef96 100644
--- a/drivers/misc/vmw_vmci/vmci_queue_pair.c
+++ b/drivers/misc/vmw_vmci/vmci_queue_pair.c
@@ -630,7 +630,7 @@ static void qp_release_pages(struct page **pages,
 
 	for (i = 0; i < num_pages; i++) {
 		if (dirty)
-			set_page_dirty(pages[i]);
+			set_page_dirty_lock(pages[i]);
 
 		put_page(pages[i]);
 		pages[i] = NULL;
-- 
2.6.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
