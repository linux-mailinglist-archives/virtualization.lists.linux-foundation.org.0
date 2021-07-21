Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE313D1115
	for <lists.virtualization@lfdr.de>; Wed, 21 Jul 2021 16:20:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F83A83027;
	Wed, 21 Jul 2021 14:20:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nwHlJ0Memf3S; Wed, 21 Jul 2021 14:20:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 32A5483022;
	Wed, 21 Jul 2021 14:20:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BF93BC0022;
	Wed, 21 Jul 2021 14:20:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B4CFC0010
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Jul 2021 14:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D36140282
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Jul 2021 14:20:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ncLIfo-wQlOl
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Jul 2021 14:20:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D4414026E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Jul 2021 14:20:38 +0000 (UTC)
Received: from cap.home.8bytes.org (p4ff2b1ea.dip0.t-ipconnect.de
 [79.242.177.234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id CCB49936;
 Wed, 21 Jul 2021 16:20:24 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org,
	Eric Biederman <ebiederm@xmission.com>
Subject: [PATCH 02/12] x86/kexec/64: Forbid kexec when running as an SEV-ES
 guest
Date: Wed, 21 Jul 2021 16:20:05 +0200
Message-Id: <20210721142015.1401-3-joro@8bytes.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210721142015.1401-1-joro@8bytes.org>
References: <20210721142015.1401-1-joro@8bytes.org>
MIME-Version: 1.0
Cc: kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Arvind Sankar <nivedita@alum.mit.edu>, hpa@zytor.com,
 Jiri Slaby <jslaby@suse.cz>, Joerg Roedel <joro@8bytes.org>,
 David Rientjes <rientjes@google.com>, Martin Radev <martin.b.radev@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, Cfir Cohen <cfir@google.com>,
 linux-coco@lists.linux.dev, Andy Lutomirski <luto@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Juergen Gross <jgross@suse.com>,
 Mike Stunes <mstunes@vmware.com>, Sean Christopherson <seanjc@google.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Erdem Aktas <erdemaktas@google.com>
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

From: Joerg Roedel <jroedel@suse.de>

For now, kexec is not supported when running as an SEV-ES guest. Doing
so requires additional hypervisor support and special code to hand
over the CPUs to the new kernel in a safe way.

Until this is implemented, do not support kexec in SEV-ES guests.

Cc: stable@vger.kernel.org # v5.10+
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/kernel/machine_kexec_64.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/x86/kernel/machine_kexec_64.c b/arch/x86/kernel/machine_kexec_64.c
index 131f30fdcfbd..a8e16a411b40 100644
--- a/arch/x86/kernel/machine_kexec_64.c
+++ b/arch/x86/kernel/machine_kexec_64.c
@@ -591,3 +591,11 @@ void arch_kexec_pre_free_pages(void *vaddr, unsigned int pages)
 	 */
 	set_memory_encrypted((unsigned long)vaddr, pages);
 }
+
+/*
+ * Kexec is not supported in SEV-ES guests yet
+ */
+bool arch_kexec_supported(void)
+{
+	return !sev_es_active();
+}
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
