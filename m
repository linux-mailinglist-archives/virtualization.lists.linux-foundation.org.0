Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAD822C9B4
	for <lists.virtualization@lfdr.de>; Fri, 24 Jul 2020 18:04:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2F16B88A64;
	Fri, 24 Jul 2020 16:04:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wL7UAJUZx1VZ; Fri, 24 Jul 2020 16:04:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C8AEE88A71;
	Fri, 24 Jul 2020 16:04:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1BDEC004D;
	Fri, 24 Jul 2020 16:04:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA39DC004C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 16:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C428088A53
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 16:04:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A-LfKcHVJKCG
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 16:04:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EA1D588A47
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 16:03:59 +0000 (UTC)
Received: from cap.home.8bytes.org (p5b006776.dip0.t-ipconnect.de
 [91.0.103.118])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id 1963A272;
 Fri, 24 Jul 2020 18:03:56 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v5 00/75] x86: SEV-ES Guest Support
Date: Fri, 24 Jul 2020 18:02:21 +0200
Message-Id: <20200724160336.5435-1-joro@8bytes.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Joerg Roedel <jroedel@suse.de>, Mike Stunes <mstunes@vmware.com>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Cfir Cohen <cfir@google.com>,
 Joerg Roedel <joro@8bytes.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 virtualization@lists.linux-foundation.org,
 Martin Radev <martin.b.radev@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 hpa@zytor.com, Erdem Aktas <erdemaktas@google.com>,
 David Rientjes <rientjes@google.com>, Dan Williams <dan.j.williams@intel.com>,
 Jiri Slaby <jslaby@suse.cz>
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

here is a rebased version of the latest SEV-ES patches. They are now
based on latest tip/master instead of upstream Linux and include the
necessary changes.

Changes to v4 are in particular:

	- Moved early IDT setup code to idt.c, because the idt_descr
	  and the idt_table are now static

	- This required to make stack protector work early (or disable
	  it for idt.c, but I didn't go that road), so MSR_GS_BASE is
	  now set up very early too, before calling into any C code that
	  has stack protector checks.

	- As a result I decided to move the setup code which is needed
	  before the kernel switches to virtual addresses into a C
	  function as well. This should be much easier to maintain.

	- paranoid_entry/exit now uses FSGSBASE instructions, so some
	  refactoring was needed to make that work early for secondary
	  CPUs too.

	- As a result, some state of the APs is now set up on the
	  boot-cpu already, like the TSS and the CPU_NODE GDT entry,
	  so that the AP only needs to load the descriptors to handle
	  exceptions early.

The previous versions can be found as a linked-list starting here:

	https://lore.kernel.org/lkml/20200714120917.11253-1-joro@8bytes.org/

There you also find more detailed information about SEV-ES in general
and its implications.

Please review.

Thanks,

	Joerg

Borislav Petkov (1):
  KVM: SVM: Use __packed shorthand

Doug Covelli (1):
  x86/vmware: Add VMware specific handling for VMMCALL under SEV-ES

Joerg Roedel (53):
  KVM: SVM: Add GHCB Accessor functions
  x86/traps: Move pf error codes to <asm/trap_pf.h>
  x86/insn: Make inat-tables.c suitable for pre-decompression code
  x86/umip: Factor out instruction fetch
  x86/umip: Factor out instruction decoding
  x86/insn: Add insn_get_modrm_reg_off()
  x86/insn: Add insn_has_rep_prefix() helper
  x86/boot/compressed/64: Disable red-zone usage
  x86/boot/compressed/64: Add IDT Infrastructure
  x86/boot/compressed/64: Rename kaslr_64.c to ident_map_64.c
  x86/boot/compressed/64: Add page-fault handler
  x86/boot/compressed/64: Always switch to own page-table
  x86/boot/compressed/64: Don't pre-map memory in KASLR code
  x86/boot/compressed/64: Change add_identity_map() to take start and
    end
  x86/boot/compressed/64: Add stage1 #VC handler
  x86/boot/compressed/64: Call set_sev_encryption_mask earlier
  x86/boot/compressed/64: Check return value of
    kernel_ident_mapping_init()
  x86/boot/compressed/64: Add set_page_en/decrypted() helpers
  x86/boot/compressed/64: Setup GHCB Based VC Exception handler
  x86/boot/compressed/64: Unmap GHCB page before booting the kernel
  x86/fpu: Move xgetbv()/xsetbv() into separate header
  x86/idt: Move IDT to data segment
  x86/idt: Split idt_data setup out of set_intr_gate()
  x86/head/64: Install startup GDT
  x86/head/64: Setup MSR_GS_BASE before calling into C code
  x86/head/64: Load GDT after switch to virtual addresses
  x86/head/64: Load segment registers earlier
  x86/head/64: Switch to initial stack earlier
  x86/head/64: Make fixup_pointer() static inline
  x86/head/64: Load IDT earlier
  x86/head/64: Move early exception dispatch to C code
  x86/head/64: Set CR4.FSGSBASE early
  x86/sev-es: Add SEV-ES Feature Detection
  x86/sev-es: Print SEV-ES info into kernel log
  x86/sev-es: Compile early handler code into kernel image
  x86/sev-es: Setup early #VC handler
  x86/sev-es: Setup GHCB based boot #VC handler
  x86/sev-es: Allocate and Map IST stack for #VC handler
  x86/sev-es: Adjust #VC IST Stack on entering NMI handler
  x86/dumpstack/64: Add noinstr version of get_stack_info()
  x86/entry/64: Add entry code for #VC handler
  x86/sev-es: Wire up existing #VC exit-code handlers
  x86/sev-es: Handle instruction fetches from user-space
  x86/sev-es: Handle MMIO String Instructions
  x86/sev-es: Handle #AC Events
  x86/sev-es: Handle #DB Events
  x86/paravirt: Allow hypervisor specific VMMCALL handling under SEV-ES
  x86/realmode: Add SEV-ES specific trampoline entry point
  x86/smpboot: Setup TSS for starting AP
  x86/head/64: Don't call verify_cpu() on starting APs
  x86/head/64: Rename start_cpu0
  x86/sev-es: Support CPU offline/online
  x86/sev-es: Handle NMI State

Martin Radev (1):
  x86/sev-es: Check required CPU features for SEV-ES

Tom Lendacky (19):
  KVM: SVM: Add GHCB definitions
  x86/cpufeatures: Add SEV-ES CPU feature
  x86/sev-es: Add support for handling IOIO exceptions
  x86/sev-es: Add CPUID handling to #VC handler
  x86/sev-es: Setup per-cpu GHCBs for the runtime handler
  x86/sev-es: Add Runtime #VC Exception Handler
  x86/sev-es: Handle MMIO events
  x86/sev-es: Handle MSR events
  x86/sev-es: Handle DR7 read/write events
  x86/sev-es: Handle WBINVD Events
  x86/sev-es: Handle RDTSC(P) Events
  x86/sev-es: Handle RDPMC Events
  x86/sev-es: Handle INVD Events
  x86/sev-es: Handle MONITOR/MONITORX Events
  x86/sev-es: Handle MWAIT/MWAITX Events
  x86/sev-es: Handle VMMCALL Events
  x86/kvm: Add KVM specific VMMCALL handling under SEV-ES
  x86/realmode: Setup AP jump table
  x86/efi: Add GHCB mappings when SEV-ES is active

 arch/x86/Kconfig                           |    1 +
 arch/x86/boot/Makefile                     |    2 +-
 arch/x86/boot/compressed/Makefile          |    9 +-
 arch/x86/boot/compressed/cpuflags.c        |    4 -
 arch/x86/boot/compressed/head_64.S         |   32 +-
 arch/x86/boot/compressed/ident_map_64.c    |  349 +++++
 arch/x86/boot/compressed/idt_64.c          |   54 +
 arch/x86/boot/compressed/idt_handlers_64.S |   77 ++
 arch/x86/boot/compressed/kaslr.c           |   36 +-
 arch/x86/boot/compressed/kaslr_64.c        |  153 ---
 arch/x86/boot/compressed/misc.c            |    7 +
 arch/x86/boot/compressed/misc.h            |   50 +-
 arch/x86/boot/compressed/sev-es.c          |  214 +++
 arch/x86/entry/entry_64.S                  |   78 ++
 arch/x86/include/asm/cpu.h                 |    2 +-
 arch/x86/include/asm/cpu_entry_area.h      |   33 +-
 arch/x86/include/asm/cpufeatures.h         |    1 +
 arch/x86/include/asm/desc_defs.h           |    3 +
 arch/x86/include/asm/fpu/internal.h        |   33 +-
 arch/x86/include/asm/fpu/xcr.h             |   37 +
 arch/x86/include/asm/idtentry.h            |   49 +
 arch/x86/include/asm/insn-eval.h           |    6 +
 arch/x86/include/asm/mem_encrypt.h         |    5 +
 arch/x86/include/asm/msr-index.h           |    3 +
 arch/x86/include/asm/page_64_types.h       |    1 +
 arch/x86/include/asm/pgtable.h             |    2 +-
 arch/x86/include/asm/processor.h           |    7 +
 arch/x86/include/asm/proto.h               |    1 +
 arch/x86/include/asm/realmode.h            |    4 +
 arch/x86/include/asm/segment.h             |    2 +-
 arch/x86/include/asm/setup.h               |   16 +-
 arch/x86/include/asm/sev-es.h              |  113 ++
 arch/x86/include/asm/stacktrace.h          |    2 +
 arch/x86/include/asm/svm.h                 |  118 +-
 arch/x86/include/asm/trap_pf.h             |   24 +
 arch/x86/include/asm/trapnr.h              |    1 +
 arch/x86/include/asm/traps.h               |   20 +-
 arch/x86/include/asm/x86_init.h            |   16 +-
 arch/x86/include/uapi/asm/svm.h            |   11 +
 arch/x86/kernel/Makefile                   |    1 +
 arch/x86/kernel/cpu/amd.c                  |    3 +-
 arch/x86/kernel/cpu/common.c               |   37 +-
 arch/x86/kernel/cpu/scattered.c            |    1 +
 arch/x86/kernel/cpu/vmware.c               |   50 +-
 arch/x86/kernel/dumpstack.c                |    7 +-
 arch/x86/kernel/dumpstack_64.c             |   47 +-
 arch/x86/kernel/head64.c                   |   85 +-
 arch/x86/kernel/head_32.S                  |    4 +-
 arch/x86/kernel/head_64.S                  |  159 ++-
 arch/x86/kernel/idt.c                      |   94 +-
 arch/x86/kernel/kvm.c                      |   35 +-
 arch/x86/kernel/nmi.c                      |   12 +
 arch/x86/kernel/sev-es-shared.c            |  507 +++++++
 arch/x86/kernel/sev-es.c                   | 1404 ++++++++++++++++++++
 arch/x86/kernel/smpboot.c                  |   10 +-
 arch/x86/kernel/traps.c                    |   56 +
 arch/x86/kernel/umip.c                     |   49 +-
 arch/x86/kvm/svm/svm.c                     |    2 +
 arch/x86/lib/insn-eval.c                   |  130 ++
 arch/x86/mm/cpu_entry_area.c               |    3 +-
 arch/x86/mm/extable.c                      |    1 +
 arch/x86/mm/mem_encrypt.c                  |   38 +-
 arch/x86/mm/mem_encrypt_identity.c         |    3 +
 arch/x86/platform/efi/efi_64.c             |   10 +
 arch/x86/realmode/init.c                   |   24 +-
 arch/x86/realmode/rm/header.S              |    3 +
 arch/x86/realmode/rm/trampoline_64.S       |   20 +
 arch/x86/tools/gen-insn-attr-x86.awk       |   50 +-
 tools/arch/x86/tools/gen-insn-attr-x86.awk |   50 +-
 69 files changed, 4025 insertions(+), 446 deletions(-)
 create mode 100644 arch/x86/boot/compressed/ident_map_64.c
 create mode 100644 arch/x86/boot/compressed/idt_64.c
 create mode 100644 arch/x86/boot/compressed/idt_handlers_64.S
 delete mode 100644 arch/x86/boot/compressed/kaslr_64.c
 create mode 100644 arch/x86/boot/compressed/sev-es.c
 create mode 100644 arch/x86/include/asm/fpu/xcr.h
 create mode 100644 arch/x86/include/asm/sev-es.h
 create mode 100644 arch/x86/include/asm/trap_pf.h
 create mode 100644 arch/x86/kernel/sev-es-shared.c
 create mode 100644 arch/x86/kernel/sev-es.c

-- 
2.27.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
