Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F16A44CA0C
	for <lists.virtualization@lfdr.de>; Wed, 10 Nov 2021 21:05:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 940B3401F8;
	Wed, 10 Nov 2021 20:05:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lloAhDp7Op3z; Wed, 10 Nov 2021 20:05:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 388EA400CE;
	Wed, 10 Nov 2021 20:05:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C35EFC0036;
	Wed, 10 Nov 2021 20:05:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF761C001E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Nov 2021 20:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE76680D26
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Nov 2021 20:05:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qF14unqhhtkb
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Nov 2021 20:05:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from outgoing-stata.csail.mit.edu (outgoing-stata.csail.mit.edu
 [128.30.2.210])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4125880CF9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Nov 2021 20:05:03 +0000 (UTC)
Received: from [128.177.79.46] (helo=[10.118.101.22])
 by outgoing-stata.csail.mit.edu with esmtpsa
 (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256) (Exim 4.82)
 (envelope-from <srivatsa@csail.mit.edu>)
 id 1mktq9-000YVe-97; Wed, 10 Nov 2021 15:05:01 -0500
Subject: [PATCH v3 1/3] MAINTAINERS: Update maintainers for paravirt ops and
 VMware hypervisor interface
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
To: jgross@suse.com, x86@kernel.org, pv-drivers@vmware.com
Date: Wed, 10 Nov 2021 12:08:16 -0800
Message-ID: <163657487268.84207.5604596767569015608.stgit@srivatsa-dev>
In-Reply-To: <163657479269.84207.13658789048079672839.stgit@srivatsa-dev>
References: <163657479269.84207.13658789048079672839.stgit@srivatsa-dev>
User-Agent: StGit/0.21
MIME-Version: 1.0
Cc: anishs@vmware.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 virtualization@lists.linux-foundation.org, keerthanak@vmware.com,
 namit@vmware.com, rostedt@goodmis.org, amakhalov@vmware.com, joe@perches.com,
 kuba@kernel.org
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

From: Srivatsa S. Bhat (VMware) <srivatsa@csail.mit.edu>

Deep has decided to transfer maintainership of the VMware hypervisor
interface to Srivatsa, and the joint-maintainership of paravirt ops in
the Linux kernel to Srivatsa and Alexey. Update the MAINTAINERS file
to reflect this change.

Signed-off-by: Srivatsa S. Bhat (VMware) <srivatsa@csail.mit.edu>
Acked-by: Alexey Makhalov <amakhalov@vmware.com>
Acked-by: Deep Shah <sdeep@vmware.com>
Acked-by: Juergen Gross <jgross@suse.com>
Cc: stable@vger.kernel.org
---

 MAINTAINERS |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0ad926ba362f..0329d67c5bcf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14188,7 +14188,7 @@ F:	include/uapi/linux/ppdev.h
 
 PARAVIRT_OPS INTERFACE
 M:	Juergen Gross <jgross@suse.com>
-M:	Deep Shah <sdeep@vmware.com>
+M:	Srivatsa S. Bhat (VMware) <srivatsa@csail.mit.edu>
 M:	"VMware, Inc." <pv-drivers@vmware.com>
 L:	virtualization@lists.linux-foundation.org
 L:	x86@kernel.org
@@ -20038,10 +20038,13 @@ S:	Maintained
 F:	drivers/misc/vmw_balloon.c
 
 VMWARE HYPERVISOR INTERFACE
-M:	Deep Shah <sdeep@vmware.com>
+M:	Srivatsa S. Bhat (VMware) <srivatsa@csail.mit.edu>
+M:	Alexey Makhalov <amakhalov@vmware.com>
 M:	"VMware, Inc." <pv-drivers@vmware.com>
 L:	virtualization@lists.linux-foundation.org
+L:	x86@kernel.org
 S:	Supported
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/vmware
 F:	arch/x86/include/asm/vmware.h
 F:	arch/x86/kernel/cpu/vmware.c
 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
