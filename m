Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4102F1255
	for <lists.virtualization@lfdr.de>; Mon, 11 Jan 2021 13:34:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E902287015;
	Mon, 11 Jan 2021 12:34:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jR1cGQoKiE0p; Mon, 11 Jan 2021 12:34:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 65F8387064;
	Mon, 11 Jan 2021 12:34:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4882BC088B;
	Mon, 11 Jan 2021 12:34:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B7314C013A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 Jan 2021 12:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A4D21866C7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 Jan 2021 12:34:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vLvvrX9cp3Y8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 Jan 2021 12:34:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from EX13-EDG-OU-001.vmware.com (ex13-edg-ou-001.vmware.com
 [208.91.0.189])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9DA0E866B6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 Jan 2021 12:34:04 +0000 (UTC)
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-001.vmware.com (10.113.208.155) with Microsoft SMTP Server id
 15.0.1156.6; Mon, 11 Jan 2021 04:18:53 -0800
Received: from sc-dbc2115.eng.vmware.com (sc-dbc2115.eng.vmware.com
 [10.182.28.6])
 by sc9-mailhost3.vmware.com (Postfix) with ESMTP id 71E33209C1;
 Mon, 11 Jan 2021 04:18:55 -0800 (PST)
From: Jorgen Hansen <jhansen@vmware.com>
To: <linux-kernel@vger.kernel.org>, <virtualization@lists.linux-foundation.org>
Subject: [PATCH] VMCI: Stop log spew when qp allocation isn't possible
Date: Mon, 11 Jan 2021 04:18:54 -0800
Message-ID: <1610367535-4463-2-git-send-email-jhansen@vmware.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1610367535-4463-1-git-send-email-jhansen@vmware.com>
References: <1610367535-4463-1-git-send-email-jhansen@vmware.com>
MIME-Version: 1.0
Received-SPF: None (EX13-EDG-OU-001.vmware.com: jhansen@vmware.com does not
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

VMCI queue pair allocation is disabled, if a VM is in FT mode. In
these cases, VMware Tools may still once in a while attempt to
create a vSocket stream connection, resulting in multiple
warnings in the kernel logs. Therefore downgrade the error log to
a debug log.

Reviewed-by: Vishnu Dasa <vdasa@vmware.com>
Signed-off-by: Jorgen Hansen <jhansen@vmware.com>
---
 drivers/misc/vmw_vmci/vmci_queue_pair.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/vmw_vmci/vmci_queue_pair.c b/drivers/misc/vmw_vmci/vmci_queue_pair.c
index c490658..a3691c1 100644
--- a/drivers/misc/vmw_vmci/vmci_queue_pair.c
+++ b/drivers/misc/vmw_vmci/vmci_queue_pair.c
@@ -1207,7 +1207,7 @@ static int qp_alloc_guest_work(struct vmci_handle *handle,
 	} else {
 		result = qp_alloc_hypercall(queue_pair_entry);
 		if (result < VMCI_SUCCESS) {
-			pr_warn("qp_alloc_hypercall result = %d\n", result);
+			pr_devel("qp_alloc_hypercall result = %d\n", result);
 			goto error;
 		}
 	}
-- 
2.6.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
