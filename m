Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7A718FE4B
	for <lists.virtualization@lfdr.de>; Mon, 23 Mar 2020 20:57:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B75CD875A7;
	Mon, 23 Mar 2020 19:57:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id npIqvQ9qIoHB; Mon, 23 Mar 2020 19:57:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B3DF987697;
	Mon, 23 Mar 2020 19:57:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A900DC0177;
	Mon, 23 Mar 2020 19:57:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C6138C1AE2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Mar 2020 19:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B1CD32001E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Mar 2020 19:57:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g-XuWF65Hfq4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Mar 2020 19:57:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from EX13-EDG-OU-001.vmware.com (ex13-edg-ou-001.vmware.com
 [208.91.0.189])
 by silver.osuosl.org (Postfix) with ESMTPS id D408220016
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Mar 2020 19:57:43 +0000 (UTC)
Received: from sc9-mailhost2.vmware.com (10.113.161.72) by
 EX13-EDG-OU-001.vmware.com (10.113.208.155) with Microsoft SMTP Server id
 15.0.1156.6; Mon, 23 Mar 2020 12:57:42 -0700
Received: from localhost.localdomain (unknown [10.118.101.94])
 by sc9-mailhost2.vmware.com (Postfix) with ESMTP id 4F931B24BC;
 Mon, 23 Mar 2020 15:57:43 -0400 (EDT)
To: <x86@kernel.org>
Subject: [PATCH v2 4/5] x86/vmware: Enable steal time accounting
Date: Mon, 23 Mar 2020 19:57:06 +0000
Message-ID: <20200323195707.31242-5-amakhalov@vmware.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20200323195707.31242-1-amakhalov@vmware.com>
References: <20200212200312.2033-1-amakhalov@vmware.com>
 <20200323195707.31242-1-amakhalov@vmware.com>
MIME-Version: 1.0
Received-SPF: None (EX13-EDG-OU-001.vmware.com: amakhalov@vmware.com does not
 designate permitted sender hosts)
Cc: Juergen Gross <jgross@suse.com>, Alexey Makhalov <amakhalov@vmware.com>,
 Jonathan Corbet <corbet@lwn.net>,
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

Set paravirt_steal_rq_enabled if steal clock present.
paravirt_steal_rq_enabled is used in sched/core.c to
adjust task progress by offsetting stolen time.
Use 'no-steal-acc' off switch (share same name with KVM)
to disable steal time accounting.

Signed-off-by: Alexey Makhalov <amakhalov@vmware.com>
Reviewed-by: Thomas Hellstrom <thellstrom@vmware.com>
Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
---
 Documentation/admin-guide/kernel-parameters.txt |  2 +-
 arch/x86/kernel/cpu/vmware.c                    | 13 ++++++++++++-
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a1b7d3ad2a35..6b1a60fa4ad8 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3174,7 +3174,7 @@
 			[X86,PV_OPS] Disable paravirtualized VMware scheduler
 			clock and use the default one.
 
-	no-steal-acc	[X86,KVM,ARM64] Disable paravirtualized steal time
+	no-steal-acc	[X86,PV_OPS,ARM64] Disable paravirtualized steal time
 			accounting. steal time is computed, but won't
 			influence scheduler behaviour
 
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index cc604614f0ae..e885f73bebd4 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -125,6 +125,7 @@ static struct cyc2ns_data vmware_cyc2ns __ro_after_init;
 static int vmw_sched_clock __initdata = 1;
 static DEFINE_PER_CPU_DECRYPTED(struct vmware_steal_time, vmw_steal_time) __aligned(64);
 static bool has_steal_clock;
+static bool steal_acc __initdata = true; /* steal time accounting */
 
 static __init int setup_vmw_sched_clock(char *s)
 {
@@ -133,6 +134,13 @@ static __init int setup_vmw_sched_clock(char *s)
 }
 early_param("no-vmw-sched-clock", setup_vmw_sched_clock);
 
+static __init int parse_no_stealacc(char *arg)
+{
+	steal_acc = false;
+	return 0;
+}
+early_param("no-steal-acc", parse_no_stealacc);
+
 static unsigned long long notrace vmware_sched_clock(void)
 {
 	unsigned long long ns;
@@ -306,8 +314,11 @@ static int vmware_cpu_down_prepare(unsigned int cpu)
 
 static __init int activate_jump_labels(void)
 {
-	if (has_steal_clock)
+	if (has_steal_clock) {
 		static_key_slow_inc(&paravirt_steal_enabled);
+		if (steal_acc)
+			static_key_slow_inc(&paravirt_steal_rq_enabled);
+	}
 
 	return 0;
 }
-- 
2.14.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
