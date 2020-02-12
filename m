Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 153B715B1AC
	for <lists.virtualization@lfdr.de>; Wed, 12 Feb 2020 21:19:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0A9E61FEAE;
	Wed, 12 Feb 2020 20:18:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id daOVDAofqHeJ; Wed, 12 Feb 2020 20:18:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B969E2079C;
	Wed, 12 Feb 2020 20:18:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AC54AC0177;
	Wed, 12 Feb 2020 20:18:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 93F45C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 20:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7A71084AE1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 20:18:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M_WUzYpT9Fzg
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 20:18:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from EX13-EDG-OU-001.vmware.com (ex13-edg-ou-001.vmware.com
 [208.91.0.189])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id F2CAB85E9F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 20:18:54 +0000 (UTC)
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-001.vmware.com (10.113.208.155) with Microsoft SMTP Server id
 15.0.1156.6; Wed, 12 Feb 2020 12:03:47 -0800
Received: from localhost.localdomain (unknown [10.118.101.94])
 by sc9-mailhost3.vmware.com (Postfix) with ESMTP id A813240771;
 Wed, 12 Feb 2020 12:03:49 -0800 (PST)
To: <x86@kernel.org>
Subject: [PATCH 5/5] x86/vmware: Use bool type for vmw_sched_clock
Date: Wed, 12 Feb 2020 20:03:12 +0000
Message-ID: <20200212200312.2033-6-amakhalov@vmware.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20200212200312.2033-1-amakhalov@vmware.com>
References: <20200212200312.2033-1-amakhalov@vmware.com>
MIME-Version: 1.0
Received-SPF: None (EX13-EDG-OU-001.vmware.com: amakhalov@vmware.com does not
 designate permitted sender hosts)
Cc: Juergen Gross <jgross@suse.com>, Alexey Makhalov <amakhalov@vmware.com>,
 Jonathan Corbet <corbet@lwn.net>, "VMware, Inc." <pv-drivers@vmware.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>
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
From: Alexey Makhalov via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Alexey Makhalov <amakhalov@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

To be aligned with other bool variables.

Signed-off-by: Alexey Makhalov <amakhalov@vmware.com>
---
 arch/x86/kernel/cpu/vmware.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 0c65d661d88b..54e57931051d 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -122,14 +122,14 @@ static unsigned long vmware_get_tsc_khz(void)
 
 #ifdef CONFIG_PARAVIRT
 static struct cyc2ns_data vmware_cyc2ns __ro_after_init;
-static int vmw_sched_clock __initdata = 1;
+static bool vmw_sched_clock __initdata = true;
 static DEFINE_PER_CPU_DECRYPTED(struct vmware_steal_time, steal_time) __aligned(64);
 static bool has_steal_clock;
 static bool steal_acc __initdata = true; /* steal time accounting */
 
 static __init int setup_vmw_sched_clock(char *s)
 {
-	vmw_sched_clock = 0;
+	vmw_sched_clock = false;
 	return 0;
 }
 early_param("no-vmw-sched-clock", setup_vmw_sched_clock);
-- 
2.14.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
