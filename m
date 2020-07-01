Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 68ED2210A07
	for <lists.virtualization@lfdr.de>; Wed,  1 Jul 2020 13:07:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1D81287ACB;
	Wed,  1 Jul 2020 11:07:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h1jHsZPaKzMN; Wed,  1 Jul 2020 11:07:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7AF4087AC8;
	Wed,  1 Jul 2020 11:07:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 51A86C0733;
	Wed,  1 Jul 2020 11:07:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4825EC0733
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 11:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 367BE2FB67
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 11:07:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YTxVTWDf-0nc
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 11:07:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id 1E25320020
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 11:07:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C3C48AC79;
 Wed,  1 Jul 2020 11:07:12 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
Subject: [PATCH v2 0/4] Remove 32-bit Xen PV guest support
Date: Wed,  1 Jul 2020 13:06:46 +0200
Message-Id: <20200701110650.16172-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, "VMware,
 Inc." <pv-drivers@vmware.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
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

The long term plan has been to replace Xen PV guests by PVH. The first
victim of that plan are now 32-bit PV guests, as those are used only
rather seldom these days. Xen on x86 requires 64-bit support and with
Grub2 now supporting PVH officially since version 2.04 there is no
need to keep 32-bit PV guest support alive in the Linux kernel.
Additionally Meltdown mitigation is not available in the kernel running
as 32-bit PV guest, so dropping this mode makes sense from security
point of view, too.

Changes in V2:
- rebase to 5.8 kernel
- addressed comments to V1
- new patches 3 and 4

Juergen Gross (4):
  x86/xen: remove 32-bit Xen PV guest support
  x86/paravirt: remove 32-bit support from PARAVIRT_XXL
  x86/paravirt: cleanup paravirt macros
  x86/paravirt: use CONFIG_PARAVIRT_XXL instead of CONFIG_PARAVIRT

 arch/x86/entry/entry_32.S                   | 109 +------
 arch/x86/entry/entry_64.S                   |   4 +-
 arch/x86/entry/vdso/vdso32/vclock_gettime.c |   1 +
 arch/x86/include/asm/fixmap.h               |   2 +-
 arch/x86/include/asm/paravirt.h             | 107 +-----
 arch/x86/include/asm/paravirt_types.h       |  21 --
 arch/x86/include/asm/pgtable-3level_types.h |   5 -
 arch/x86/include/asm/proto.h                |   2 +-
 arch/x86/include/asm/required-features.h    |   2 +-
 arch/x86/include/asm/segment.h              |   6 +-
 arch/x86/kernel/cpu/common.c                |   8 -
 arch/x86/kernel/head_32.S                   |  31 --
 arch/x86/kernel/kprobes/core.c              |   1 -
 arch/x86/kernel/kprobes/opt.c               |   1 -
 arch/x86/kernel/paravirt.c                  |  18 --
 arch/x86/kernel/paravirt_patch.c            |  17 -
 arch/x86/xen/Kconfig                        |   3 +-
 arch/x86/xen/Makefile                       |   3 +-
 arch/x86/xen/apic.c                         |  17 -
 arch/x86/xen/enlighten_pv.c                 |  52 +--
 arch/x86/xen/mmu_pv.c                       | 340 +++-----------------
 arch/x86/xen/p2m.c                          |   6 +-
 arch/x86/xen/setup.c                        |  35 +-
 arch/x86/xen/smp_pv.c                       |  18 --
 arch/x86/xen/xen-asm.S                      | 182 ++++++++++-
 arch/x86/xen/xen-asm_32.S                   | 185 -----------
 arch/x86/xen/xen-asm_64.S                   | 181 -----------
 arch/x86/xen/xen-head.S                     |   6 -
 drivers/xen/Kconfig                         |   4 +-
 29 files changed, 232 insertions(+), 1135 deletions(-)
 delete mode 100644 arch/x86/xen/xen-asm_32.S
 delete mode 100644 arch/x86/xen/xen-asm_64.S

-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
