Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4826883D
	for <lists.virtualization@lfdr.de>; Mon, 15 Jul 2019 13:37:55 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 38B31D2E;
	Mon, 15 Jul 2019 11:37:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AC082CDE
	for <virtualization@lists.linux-foundation.org>;
	Mon, 15 Jul 2019 11:37:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2CC4F756
	for <virtualization@lists.linux-foundation.org>;
	Mon, 15 Jul 2019 11:37:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 996C8ADBF;
	Mon, 15 Jul 2019 11:37:44 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
Subject: [PATCH 0/2] Remove 32-bit Xen PV guest support
Date: Mon, 15 Jul 2019 13:37:37 +0200
Message-Id: <20190715113739.17694-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alok Kataria <akataria@vmware.com>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

The long term plan has been to replace Xen PV guests by PVH. The first
victim of that plan are now 32-bit PV guests, as those are used only
rather seldom these days. Xen on x86 requires 64-bit support and with
Grub2 now supporting PVH officially since version 2.04 there is no
need to keep 32-bit PV guest support alive in the Linux kernel.
Additionally Meltdown mitigation is not available in the kernel running
as 32-bit PV guest, so dropping this mode makes sense from security
point of view, too.

Juergen Gross (2):
  x86/xen: remove 32-bit Xen PV guest support
  x86/paravirt: remove 32-bit support from PARAVIRT_XXL

 arch/x86/entry/entry_32.S                   |  93 --------
 arch/x86/entry/vdso/vdso32/vclock_gettime.c |   1 +
 arch/x86/include/asm/paravirt.h             | 105 +--------
 arch/x86/include/asm/paravirt_types.h       |  20 --
 arch/x86/include/asm/pgtable-3level_types.h |   5 -
 arch/x86/include/asm/proto.h                |   2 +-
 arch/x86/include/asm/segment.h              |   2 +-
 arch/x86/include/asm/traps.h                |   2 +-
 arch/x86/kernel/cpu/common.c                |   8 -
 arch/x86/kernel/paravirt.c                  |  17 --
 arch/x86/kernel/paravirt_patch_32.c         |  36 +--
 arch/x86/xen/Kconfig                        |   3 +-
 arch/x86/xen/Makefile                       |   4 +-
 arch/x86/xen/apic.c                         |  17 --
 arch/x86/xen/enlighten_pv.c                 |  45 +---
 arch/x86/xen/mmu_pv.c                       | 326 +++-------------------------
 arch/x86/xen/p2m.c                          |   4 -
 arch/x86/xen/setup.c                        |  44 +---
 arch/x86/xen/smp_pv.c                       |  19 +-
 arch/x86/xen/xen-asm.S                      |  14 --
 arch/x86/xen/xen-asm_32.S                   | 207 ------------------
 arch/x86/xen/xen-head.S                     |   6 -
 arch/x86/xen/xen-ops.h                      |   5 -
 drivers/xen/Kconfig                         |   4 +-
 24 files changed, 57 insertions(+), 932 deletions(-)
 delete mode 100644 arch/x86/xen/xen-asm_32.S

-- 
2.16.4

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
