Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BA9700DB0
	for <lists.virtualization@lfdr.de>; Fri, 12 May 2023 19:10:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F33D42D9E;
	Fri, 12 May 2023 17:10:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F33D42D9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rN8mOSwScOn2; Fri, 12 May 2023 17:10:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0C7D342DA5;
	Fri, 12 May 2023 17:10:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C7D342DA5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E3878C008E;
	Fri, 12 May 2023 17:10:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5B3EDC002A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 May 2023 17:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35CD5613AB
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 May 2023 17:10:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35CD5613AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6dC5FcgCg8eT
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 May 2023 17:10:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 841F460804
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu
 [128.30.2.78])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 841F460804
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 May 2023 17:10:08 +0000 (UTC)
Received: from [64.186.27.43] (helo=srivatsa-dev.eng.vmware.com)
 by outgoing2021.csail.mit.edu with esmtpa (Exim 4.95)
 (envelope-from <srivatsa@csail.mit.edu>) id 1pxVyN-001Zzx-6w;
 Fri, 12 May 2023 12:50:27 -0400
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
To: jgross@suse.com, bp@suse.de, tglx@linutronix.de, kuba@kernel.org,
 davem@davemloft.net, richardcochran@gmail.com
Subject: [PATCH net 3/3] MAINTAINERS: Update maintainers for VMware virtual
 PTP clock driver
Date: Fri, 12 May 2023 09:49:58 -0700
Message-Id: <20230512164958.575174-3-srivatsa@csail.mit.edu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230512164958.575174-1-srivatsa@csail.mit.edu>
References: <20230512164958.575174-1-srivatsa@csail.mit.edu>
MIME-Version: 1.0
Cc: pv-drivers@vmware.com, netdev@vger.kernel.org, vsirnapalli@vmware.com,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, akaher@vmware.com,
 amakhalov@vmware.com
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

From: "Srivatsa S. Bhat (VMware)" <srivatsa@csail.mit.edu>

I have decided to change employers, so I would like to remove myself
from the maintainer role for VMware-supported subsystems.

Remove Srivatsa from the maintainers entry for VMware virtual PTP
clock driver (ptp_vmw) and add Ajay Kaher as an additional reviewer.
Also, update CREDITS for Srivatsa.

Signed-off-by: Srivatsa S. Bhat (VMware) <srivatsa@csail.mit.edu>
Acked-by: Ajay Kaher <akaher@vmware.com>
Acked-by: Alexey Makhalov <amakhalov@vmware.com>
Acked-by: Deep Shah <sdeep@vmware.com>
---
 CREDITS     | 1 +
 MAINTAINERS | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/CREDITS b/CREDITS
index 313435c93e2c..670c256aff5d 100644
--- a/CREDITS
+++ b/CREDITS
@@ -387,6 +387,7 @@ N: Srivatsa S. Bhat
 E: srivatsa@csail.mit.edu
 D: Maintainer of Generic Paravirt-Ops subsystem
 D: Maintainer of VMware hypervisor interface
+D: Maintainer of VMware virtual PTP clock driver (ptp_vmw)
 
 N: Ross Biro
 E: ross.biro@gmail.com
diff --git a/MAINTAINERS b/MAINTAINERS
index 309d4cc325f9..a00bea4d7438 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22520,8 +22520,8 @@ F:	drivers/scsi/vmw_pvscsi.c
 F:	drivers/scsi/vmw_pvscsi.h
 
 VMWARE VIRTUAL PTP CLOCK DRIVER
-M:	Srivatsa S. Bhat (VMware) <srivatsa@csail.mit.edu>
 M:	Deep Shah <sdeep@vmware.com>
+R:	Ajay Kaher <akaher@vmware.com>
 R:	Alexey Makhalov <amakhalov@vmware.com>
 R:	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>
 L:	netdev@vger.kernel.org
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
