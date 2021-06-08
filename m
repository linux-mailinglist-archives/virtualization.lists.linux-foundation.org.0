Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C56B39F305
	for <lists.virtualization@lfdr.de>; Tue,  8 Jun 2021 11:55:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21A4340444;
	Tue,  8 Jun 2021 09:55:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o0A5dg_XZnTy; Tue,  8 Jun 2021 09:54:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id D721E4044B;
	Tue,  8 Jun 2021 09:54:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9013C002B;
	Tue,  8 Jun 2021 09:54:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A8F0C0001
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Jun 2021 09:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1525404C2
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Jun 2021 09:54:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1G6bojIpnhOw
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Jun 2021 09:54:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B35140299
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Jun 2021 09:54:48 +0000 (UTC)
Received: from cap.home.8bytes.org (p4ff2ba7c.dip0.t-ipconnect.de
 [79.242.186.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id 0B5D2222;
 Tue,  8 Jun 2021 11:54:44 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v3 0/7] x86/sev-es: Fixes for SEV-ES Guest Support
Date: Tue,  8 Jun 2021 11:54:32 +0200
Message-Id: <20210608095439.12668-1-joro@8bytes.org>
X-Mailer: git-send-email 2.31.1
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
 linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
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

Hi,

here is the next revision of my pending fixes for SEV-ES guest
support. Changes to the previous version are:

	- Removed the patches already merged
	- Added a new fix to map the EFI MOKVar table encrypted
	- Disabled IRQs when GHCB is active
	- Relaxed state tracking by using irqentry_enter()/exit
	  instead of irqentry_nmi_enter()/exit()
	- Changed error reporting from insn_fetch_from_user*() as
	  requested by Boris

Changes are based on tip/x86/urgent. Please review.

Thanks,

	Joerg

Joerg Roedel (6):
  x86/sev-es: Fix error message in runtime #VC handler
  x86/sev-es: Disable IRQs while GHCB is active
  x86/sev-es: Run #VC handler in plain IRQ state
  x86/insn-eval: Make 0 a valid RIP for insn_get_effective_ip()
  x86/insn: Extend error reporting from
    insn_fetch_from_user[_inatomic]()
  x86/sev-es: Propagate #GP if getting linear instruction address failed

Tom Lendacky (1):
  x86/ioremap: Map efi_mem_reserve() memory as encrypted for SEV

 arch/x86/kernel/sev.c    | 61 +++++++++++++++++++++++++---------------
 arch/x86/kernel/umip.c   | 10 +++----
 arch/x86/lib/insn-eval.c | 22 +++++++++------
 arch/x86/mm/ioremap.c    |  4 ++-
 4 files changed, 59 insertions(+), 38 deletions(-)


base-commit: 009767dbf42ac0dbe3cf48c1ee224f6b778aa85a
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
