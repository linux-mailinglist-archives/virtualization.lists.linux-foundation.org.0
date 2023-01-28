Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A53F67F33D
	for <lists.virtualization@lfdr.de>; Sat, 28 Jan 2023 01:38:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B00F416BA;
	Sat, 28 Jan 2023 00:38:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B00F416BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZXyVGxH3zA9V; Sat, 28 Jan 2023 00:38:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 13318416D1;
	Sat, 28 Jan 2023 00:38:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13318416D1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33443C0078;
	Sat, 28 Jan 2023 00:38:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CD325C002D
 for <virtualization@lists.linux-foundation.org>;
 Sat, 28 Jan 2023 00:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1DA08144D
 for <virtualization@lists.linux-foundation.org>;
 Sat, 28 Jan 2023 00:38:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1DA08144D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ikcOVTlll4Tq
 for <virtualization@lists.linux-foundation.org>;
 Sat, 28 Jan 2023 00:38:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E20048140F
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu
 [128.30.2.78])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E20048140F
 for <virtualization@lists.linux-foundation.org>;
 Sat, 28 Jan 2023 00:38:46 +0000 (UTC)
Received: from [64.186.27.43] (helo=srivatsa-dev.eng.vmware.com)
 by outgoing2021.csail.mit.edu with esmtpa (Exim 4.95)
 (envelope-from <srivatsa@csail.mit.edu>) id 1pLZER-000elb-VP;
 Fri, 27 Jan 2023 19:38:12 -0500
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
To: tglx@linutronix.de, mingo@redhat.com, x86@kernel.org, peterz@infradead.org,
 hpa@zytor.com
Subject: [PATCH] x86/hotplug: Remove incorrect comment about mwait_play_dead()
Date: Fri, 27 Jan 2023 16:37:51 -0800
Message-Id: <20230128003751.141317-1-srivatsa@csail.mit.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: kvm@vger.kernel.org, pv-drivers@vmware.com, dave.hansen@linux.intel.com,
 virtualization@lists.linux-foundation.org, ganb@vmware.com, ankitja@vmware.com,
 namit@vmware.com, amakhalov@vmware.com, rafael.j.wysocki@intel.com,
 bordoloih@vmware.com, xen-devel@lists.xenproject.org, wyes.karny@amd.com,
 thomas.lendacky@amd.com, paulmck@kernel.org, keerthanak@vmware.com,
 bp@alien8.de, jgross@suse.com, seanjc@google.com, linux-kernel@vger.kernel.org,
 lewis.carroll@amd.com, imammedo@redhat.com, blamoreaux@vmware.com
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

The comment that says mwait_play_dead() returns only on failure is a
bit misleading because mwait_play_dead() could actually return for
valid reasons (such as mwait not being supported by the platform) that
do not indicate a failure of the CPU offline operation. So, remove the
comment.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Srivatsa S. Bhat (VMware) <srivatsa@csail.mit.edu>
---
 arch/x86/kernel/smpboot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 55cad72715d9..9013bb28255a 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -1833,7 +1833,7 @@ void native_play_dead(void)
 	play_dead_common();
 	tboot_shutdown(TB_SHUTDOWN_WFS);
 
-	mwait_play_dead();	/* Only returns on failure */
+	mwait_play_dead();
 	if (cpuidle_play_dead())
 		hlt_play_dead();
 }
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
