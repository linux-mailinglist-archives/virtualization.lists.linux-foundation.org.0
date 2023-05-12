Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EED6700DAF
	for <lists.virtualization@lfdr.de>; Fri, 12 May 2023 19:10:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B69C384A8D;
	Fri, 12 May 2023 17:10:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B69C384A8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 519ph9G7V-qR; Fri, 12 May 2023 17:10:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7F15684A0D;
	Fri, 12 May 2023 17:10:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F15684A0D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AFBEAC0089;
	Fri, 12 May 2023 17:10:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 70321C002A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 May 2023 17:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 589D961392
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 May 2023 17:10:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 589D961392
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5RZ9kEFRrxCv
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 May 2023 17:10:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80D8060804
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu
 [128.30.2.78])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 80D8060804
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 May 2023 17:10:06 +0000 (UTC)
Received: from [64.186.27.43] (helo=srivatsa-dev.eng.vmware.com)
 by outgoing2021.csail.mit.edu with esmtpa (Exim 4.95)
 (envelope-from <srivatsa@csail.mit.edu>) id 1pxVyD-001Zzx-3Z;
 Fri, 12 May 2023 12:50:17 -0400
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
To: jgross@suse.com, bp@suse.de, tglx@linutronix.de, kuba@kernel.org,
 davem@davemloft.net, richardcochran@gmail.com
Subject: [PATCH 1/3] MAINTAINERS: Update maintainers for paravirt-ops
Date: Fri, 12 May 2023 09:49:56 -0700
Message-Id: <20230512164958.575174-1-srivatsa@csail.mit.edu>
X-Mailer: git-send-email 2.25.1
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

I have decided to change employers and I'm not sure if I'll be able to
spend as much time on the paravirt-ops subsystem going forward. So, I
would like to remove myself from the maintainer role for paravirt-ops.

Remove Srivatsa from the maintainers entry and add Ajay Kaher as an
additional reviewer for paravirt-ops. Also, add an entry to CREDITS
for Srivatsa.

Signed-off-by: Srivatsa S. Bhat (VMware) <srivatsa@csail.mit.edu>
Acked-by: Alexey Makhalov <amakhalov@vmware.com>
Acked-by: Ajay Kaher <akaher@vmware.com>
---
 CREDITS     | 4 ++++
 MAINTAINERS | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/CREDITS b/CREDITS
index 2d9da9a7defa..5d48f1a201f2 100644
--- a/CREDITS
+++ b/CREDITS
@@ -383,6 +383,10 @@ E: tomas@nocrew.org
 W: http://tomas.nocrew.org/
 D: dsp56k device driver
 
+N: Srivatsa S. Bhat
+E: srivatsa@csail.mit.edu
+D: Maintainer of Generic Paravirt-Ops subsystem
+
 N: Ross Biro
 E: ross.biro@gmail.com
 D: Original author of the Linux networking code
diff --git a/MAINTAINERS b/MAINTAINERS
index e0ad886d3163..2d8d000353b5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15929,7 +15929,7 @@ F:	include/uapi/linux/ppdev.h
 
 PARAVIRT_OPS INTERFACE
 M:	Juergen Gross <jgross@suse.com>
-M:	Srivatsa S. Bhat (VMware) <srivatsa@csail.mit.edu>
+R:	Ajay Kaher <akaher@vmware.com>
 R:	Alexey Makhalov <amakhalov@vmware.com>
 R:	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>
 L:	virtualization@lists.linux-foundation.org
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
