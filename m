Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6416431D8FC
	for <lists.virtualization@lfdr.de>; Wed, 17 Feb 2021 13:02:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 21C8986084;
	Wed, 17 Feb 2021 12:02:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e16TxxZZZtLa; Wed, 17 Feb 2021 12:02:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 322B7860AD;
	Wed, 17 Feb 2021 12:02:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 15646C1DA9;
	Wed, 17 Feb 2021 12:02:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B880C08A1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 12:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5433387239
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 12:02:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uXqSbhd1qdYt
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 12:02:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 77CEA86F98
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 12:02:12 +0000 (UTC)
Received: from cap.home.8bytes.org (p549adcf6.dip0.t-ipconnect.de
 [84.154.220.246])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id 2E8D9246;
 Wed, 17 Feb 2021 13:02:08 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH 0/3] x86/sev-es: Check for trusted regs->sp in
 __sev_es_ist_enter()
Date: Wed, 17 Feb 2021 13:01:40 +0100
Message-Id: <20210217120143.6106-1-joro@8bytes.org>
X-Mailer: git-send-email 2.30.0
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

here are some changes to the Linux SEV-ES code to check whether the
value in regs->sp can be trusted, before checking whether it points to
the #VC IST stack.

Andy Lutomirski reported that it is entirely possible to reach this
function with a regs->sp value which was set by user-space. So check
for this condition and don't use regs->sp if it can't be trusted.

Also improve the comments around __sev_es_ist_enter/exit() to better
explain what these function do and why they are there.

Please review.

Thanks,

	Joerg

Joerg Roedel (3):
  x86/sev-es: Introduce from_syscall_gap() helper
  x86/sev-es: Check if regs->sp is trusted before adjusting #VC IST
    stack
  x86/sev-es: Improve comments in and around __sev_es_ist_enter/exit()

 arch/x86/include/asm/ptrace.h |  8 ++++++++
 arch/x86/kernel/sev-es.c      | 27 +++++++++++++++++++--------
 arch/x86/kernel/traps.c       |  3 +--
 3 files changed, 28 insertions(+), 10 deletions(-)

-- 
2.30.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
