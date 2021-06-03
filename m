Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A639A39A226
	for <lists.virtualization@lfdr.de>; Thu,  3 Jun 2021 15:23:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35593400CA;
	Thu,  3 Jun 2021 13:23:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Be3O25R7cpgx; Thu,  3 Jun 2021 13:23:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A22A40518;
	Thu,  3 Jun 2021 13:23:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5563BC0027;
	Thu,  3 Jun 2021 13:23:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18DAAC0001
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Jun 2021 13:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 083B060B25
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Jun 2021 13:23:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sUunMP0_Vt4m
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Jun 2021 13:23:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E94E460645
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Jun 2021 13:23:01 +0000 (UTC)
Received: from cap.home.8bytes.org (p4ff2ba7c.dip0.t-ipconnect.de
 [79.242.186.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id E20F9374;
 Thu,  3 Jun 2021 15:22:58 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: Eric Biederman <ebiederm@xmission.com>,
	x86@kernel.org
Subject: [PATCH v2 1/2] kexec: Allow architecture code to opt-out at runtime
Date: Thu,  3 Jun 2021 15:22:32 +0200
Message-Id: <20210603132233.10004-2-joro@8bytes.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603132233.10004-1-joro@8bytes.org>
References: <20210603132233.10004-1-joro@8bytes.org>
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
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>, Erdem Aktas <erdemaktas@google.com>
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

Allow a runtime opt-out of kexec support for architecture code in case
the kernel is running in an environment where kexec is not properly
supported yet.

This will be used on x86 when the kernel is running as an SEV-ES
guest. SEV-ES guests need special handling for kexec to hand over all
CPUs to the new kernel. This requires special hypervisor support and
handling code in the guest which is not yet implemented.

Cc: stable@vger.kernel.org # v5.10+
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 include/linux/kexec.h |  1 +
 kernel/kexec.c        | 14 ++++++++++++++
 kernel/kexec_file.c   |  9 +++++++++
 3 files changed, 24 insertions(+)

diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index 0c994ae37729..85c30dcd0bdc 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -201,6 +201,7 @@ int arch_kexec_kernel_verify_sig(struct kimage *image, void *buf,
 				 unsigned long buf_len);
 #endif
 int arch_kexec_locate_mem_hole(struct kexec_buf *kbuf);
+bool arch_kexec_supported(void);
 
 extern int kexec_add_buffer(struct kexec_buf *kbuf);
 int kexec_locate_mem_hole(struct kexec_buf *kbuf);
diff --git a/kernel/kexec.c b/kernel/kexec.c
index c82c6c06f051..d03134160458 100644
--- a/kernel/kexec.c
+++ b/kernel/kexec.c
@@ -195,11 +195,25 @@ static int do_kexec_load(unsigned long entry, unsigned long nr_segments,
  * that to happen you need to do that yourself.
  */
 
+bool __weak arch_kexec_supported(void)
+{
+	return true;
+}
+
 static inline int kexec_load_check(unsigned long nr_segments,
 				   unsigned long flags)
 {
 	int result;
 
+	/*
+	 * The architecture may support kexec in general, but the kernel could
+	 * run in an environment where it is not (yet) possible to execute a new
+	 * kernel. Allow the architecture code to opt-out of kexec support when
+	 * it is running in such an environment.
+	 */
+	if (!arch_kexec_supported())
+		return -ENOSYS;
+
 	/* We only trust the superuser with rebooting the system. */
 	if (!capable(CAP_SYS_BOOT) || kexec_load_disabled)
 		return -EPERM;
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index 33400ff051a8..96d08a512e9c 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -358,6 +358,15 @@ SYSCALL_DEFINE5(kexec_file_load, int, kernel_fd, int, initrd_fd,
 	int ret = 0, i;
 	struct kimage **dest_image, *image;
 
+	/*
+	 * The architecture may support kexec in general, but the kernel could
+	 * run in an environment where it is not (yet) possible to execute a new
+	 * kernel. Allow the architecture code to opt-out of kexec support when
+	 * it is running in such an environment.
+	 */
+	if (!arch_kexec_supported())
+		return -ENOSYS;
+
 	/* We only trust the superuser with rebooting the system. */
 	if (!capable(CAP_SYS_BOOT) || kexec_load_disabled)
 		return -EPERM;
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
