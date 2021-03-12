Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id A6171338D31
	for <lists.virtualization@lfdr.de>; Fri, 12 Mar 2021 13:38:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D55FC6FA1E;
	Fri, 12 Mar 2021 12:38:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PqkD_gUWrRGD; Fri, 12 Mar 2021 12:38:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92BEB6FAD1;
	Fri, 12 Mar 2021 12:38:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 87545C0016;
	Fri, 12 Mar 2021 12:38:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 02B4FC000B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Mar 2021 12:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D61AB43027
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Mar 2021 12:38:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xu55UUdcrAQC
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Mar 2021 12:38:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B9E5843014
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Mar 2021 12:38:34 +0000 (UTC)
Received: from cap.home.8bytes.org (p549adcf6.dip0.t-ipconnect.de
 [84.154.220.246])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id 724822A6;
 Fri, 12 Mar 2021 13:38:30 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v3 0/8] x86/seves: Support 32-bit boot path and other updates
Date: Fri, 12 Mar 2021 13:38:16 +0100
Message-Id: <20210312123824.306-1-joro@8bytes.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Cc: kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Arvind Sankar <nivedita@alum.mit.edu>, hpa@zytor.com,
 Jiri Slaby <jslaby@suse.cz>, Joerg Roedel <joro@8bytes.org>,
 David Rientjes <rientjes@google.com>, Martin Radev <martin.b.radev@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, Cfir Cohen <cfir@google.com>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Juergen Gross <jgross@suse.com>, Mike Stunes <mstunes@vmware.com>,
 Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org,
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

Hi,

these patches add support for the 32-bit boot in the decompressor
code. This is needed to boot an SEV-ES guest on some firmware and grub
versions. The patches also add the necessary CPUID sanity checks and a
32-bit version of the C-bit check.

Other updates included here:

        1. Add code to shut down exception handling in the
           decompressor code before jumping to the real kernel.
           Once in the real kernel it is not safe anymore to jump
           back to the decompressor code via exceptions.

        2. Replace open-coded hlt loops with proper calls to
           sev_es_terminate().

Please review.

Thanks,

	Joerg

Changes v2->v3:

	- Added a patch to remove the check for the Hypervisor CPUID
	  bit for detecting SEV

Changes v1->v2:

	- Addressed Boris' review comments.
	- Fixed a bug which caused the cbit-check to never be
	  executed even in an SEV guest.

Joerg Roedel (8):
  x86/boot/compressed/64: Cleanup exception handling before booting
    kernel
  x86/sev: Do not require Hypervisor CPUID bit for SEV guests
  x86/boot/compressed/64: Reload CS in startup_32
  x86/boot/compressed/64: Setup IDT in startup_32 boot path
  x86/boot/compressed/64: Add 32-bit boot #VC handler
  x86/boot/compressed/64: Add CPUID sanity check to 32-bit boot-path
  x86/boot/compressed/64: Check SEV encryption in 32-bit boot-path
  x86/sev-es: Replace open-coded hlt-loops with sev_es_terminate()

 arch/x86/boot/compressed/head_64.S     | 170 ++++++++++++++++++++++++-
 arch/x86/boot/compressed/idt_64.c      |  14 ++
 arch/x86/boot/compressed/mem_encrypt.S | 130 ++++++++++++++++++-
 arch/x86/boot/compressed/misc.c        |   7 +-
 arch/x86/boot/compressed/misc.h        |   6 +
 arch/x86/boot/compressed/sev-es.c      |  12 +-
 arch/x86/kernel/sev-es-shared.c        |  16 +--
 arch/x86/mm/mem_encrypt_identity.c     |  35 ++---
 8 files changed, 340 insertions(+), 50 deletions(-)

-- 
2.30.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
