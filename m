Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C261BC28F
	for <lists.virtualization@lfdr.de>; Tue, 28 Apr 2020 17:17:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 56184863DB;
	Tue, 28 Apr 2020 15:17:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fjMvXqIAwCHZ; Tue, 28 Apr 2020 15:17:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3627985F7E;
	Tue, 28 Apr 2020 15:17:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C7CAC0863;
	Tue, 28 Apr 2020 15:17:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5BFBDC0888
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 456D322850
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:17:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id km7IPw4VCmhM
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:17:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 3FC0322803
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 15:17:47 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 3C9966A7; Tue, 28 Apr 2020 17:17:42 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v3 00/75] x86: SEV-ES Guest Support
Date: Tue, 28 Apr 2020 17:16:10 +0200
Message-Id: <20200428151725.31091-1-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Joerg Roedel <jroedel@suse.de>,
 Mike Stunes <mstunes@vmware.com>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Cfir Cohen <cfir@google.com>, Joerg Roedel <joro@8bytes.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Hi,

here is the next version of changes to enable Linux to run as an SEV-ES
guest. The code was rebased to v5.7-rc3 and got a fair number of changes
since the last version.

What is SEV-ES
==============

SEV-ES is an acronym for 'Secure Encrypted Virtualization - Encrypted
State' and means a hardware feature of AMD processors which hides the
register state of VCPUs to the hypervisor by encrypting it. The
hypervisor can't read or make changes to the guests register state.

Most intercepts set by the hypervisor do not cause a #VMEXIT of the
guest anymore, but turn into a VMM Communication Exception (#VC
exception, vector 29) inside the guest. The error-code of this exception
is the intercept exit-code that caused the exception.  The guest handles
the #VC exception by communicating with the hypervisor through a shared
data structure, the 'Guest-Hypervisor-Communication-Block'.

With SEV-ES an untrusted hypervisor can no longer steal secrets from a
guest via inspecting guest memory or guest register contents. A
malicious hypervisor can still interfere with guest operations, but the
SEV-ES client code does its best to detect such situations and crash the
VM if it happens. 

More information about the implementation details can be found in the
cover letter of the initial post of these patches:

	https://lore.kernel.org/lkml/20200211135256.24617-1-joro@8bytes.org/

Current State of the Patches
============================

The patches posted here are considered feature complete and survived a
good amount of functional testing:

	1) Booting an SEV-ES guest VM to the graphical desktop.

	2) Running a 16-vcpu SEV-ES VM with 'perf top' and the x86
	   selftests shipped with the kernel source in a loop in
	   parallel for 18 hours showed no issues.

	3) Various compile testing has been done, including
	   allno/allmod/allyes/defconfig for x86-64 and i386.

	4) Compiled every single commit (single .config only) to check
	   if they build and do not introduce new warnings.

	5) Boot-tested the changes on various machines, including
	   bare-metal on an AMD (with and without mem_encrypt=on) and
	   Intel machine.

A git-tree with these patches applied can be found here:

	https://git.kernel.org/pub/scm/linux/kernel/git/joro/linux.git/log/?h=sev-es-client-v5.7-rc3

Changes to the previous version
===============================

Here is an incomplete list of changes to the previous version of this
patch-set. There have been so many small changes that I havn't kept
track of all, but the most important ones are listed:


	- Rebased to v5.7-rc3

	- Changes the #VC exception handler to use an IST stack. This
	  includes a couple of additional patches to set up and map the
	  IST stack, to make dumpstack aware of them and to fix a race
	  with the NMI handler when shifting the #VC handlers IST entry.

	- The NMI_Complete message to the hypervisor the re-open the NMI
	  window is now sent at the very beginning of do_nmi().

	- The GHCB used in the pre-decompression code is now re-mapped
	  encrypted and flushed from the cache before jumping to the
	  decompressed kernel image. This is needed to make sure the
	  running kernel can safely re-use the page. Actually the page
	  is also unmapped after being re-encrypted to catch any
	  use-after-remap.

	- Added CPUID caching.

	- Mapped the GHCBs to the EFI page-tables as the UEFI BIOS
	  expects to be able to re-use the OS GHCBs.

	- RDTSC and RDTSCP are now also handled in the pre-decompression
	  boot code. These instructions are used by KASLR and some
	  hypervisors might intercept them.

	- Re-implemented nested GHCB handling by keeping a backup GHCB
	  around. This supports one level of GHCB nesting, which is
	  sufficient for now.

	- Moved all SEV-ES related per-cpu data into
	  'struct sev_es_runtime_data'. This struct is allocated and
	  initialized at boot per cpu.

	- Correctly set the protocol and ghcb_usage information when
	  talking to the hypervisor.

The previous version of the patch-set can be found here:

	https://lore.kernel.org/lkml/20200319091407.1481-1-joro@8bytes.org/

Please review.


Thanks,

	Joerg

Borislav Petkov (1):
  KVM: SVM: Use __packed shorthand

Doug Covelli (1):
  x86/vmware: Add VMware specific handling for VMMCALL under SEV-ES

Joerg Roedel (53):
  KVM: SVM: Add GHCB Accessor functions
  x86/traps: Move some definitions to <asm/trap_defs.h>
  x86/insn: Make inat-tables.c suitable for pre-decompression code
  x86/umip: Factor out instruction fetch
  x86/umip: Factor out instruction decoding
  x86/insn: Add insn_get_modrm_reg_off()
  x86/insn: Add insn_rep_prefix() helper
  x86/boot/compressed/64: Disable red-zone usage
  x86/boot/compressed/64: Switch to __KERNEL_CS after GDT is loaded
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
  x86/idt: Move two function from k/idt.c to i/a/desc.h
  x86/head/64: Install boot GDT
  x86/head/64: Reload GDT after switch to virtual addresses
  x86/head/64: Load segment registers earlier
  x86/head/64: Switch to initial stack earlier
  x86/head/64: Build k/head64.c with -fno-stack-protector
  x86/head/64: Load IDT earlier
  x86/head/64: Move early exception dispatch to C code
  x86/sev-es: Add SEV-ES Feature Detection
  x86/sev-es: Print SEV-ES info into kernel log
  x86/sev-es: Compile early handler code into kernel image
  x86/sev-es: Setup early #VC handler
  x86/sev-es: Setup GHCB based boot #VC handler
  x86/sev-es: Allocate and Map IST stacks for #VC handler
  x86/dumpstack/64: Handle #VC exception stacks
  x86/sev-es: Shift #VC IST Stack in nmi_enter()/nmi_exit()
  x86/sev-es: Wire up existing #VC exit-code handlers
  x86/sev-es: Handle instruction fetches from user-space
  x86/sev-es: Do not crash on #VC exceptions from user-space
  x86/sev-es: Handle MMIO String Instructions
  x86/sev-es: Handle #AC Events
  x86/sev-es: Handle #DB Events
  x86/paravirt: Allow hypervisor specific VMMCALL handling under SEV-ES
  x86/realmode: Add SEV-ES specific trampoline entry point
  x86/head/64: Setup TSS early for secondary CPUs
  x86/head/64: Don't call verify_cpu() on starting APs
  x86/head/64: Rename start_cpu0
  x86/sev-es: Support CPU offline/online
  x86/sev-es: Handle NMI State

Mike Stunes (1):
  x86/sev-es: Cache CPUID results for improved performance

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
 arch/x86/boot/compressed/head_64.S         |   40 +-
 arch/x86/boot/compressed/ident_map_64.c    |  339 +++++
 arch/x86/boot/compressed/idt_64.c          |   53 +
 arch/x86/boot/compressed/idt_handlers_64.S |   76 ++
 arch/x86/boot/compressed/kaslr.c           |   36 +-
 arch/x86/boot/compressed/kaslr_64.c        |  153 ---
 arch/x86/boot/compressed/misc.c            |    7 +
 arch/x86/boot/compressed/misc.h            |   45 +-
 arch/x86/boot/compressed/sev-es.c          |  210 +++
 arch/x86/entry/entry_64.S                  |    4 +
 arch/x86/include/asm/cpu.h                 |    2 +-
 arch/x86/include/asm/cpu_entry_area.h      |   62 +
 arch/x86/include/asm/cpufeatures.h         |    1 +
 arch/x86/include/asm/desc.h                |   30 +
 arch/x86/include/asm/desc_defs.h           |   10 +
 arch/x86/include/asm/fpu/internal.h        |   29 +-
 arch/x86/include/asm/fpu/xcr.h             |   32 +
 arch/x86/include/asm/hardirq.h             |   14 +
 arch/x86/include/asm/insn-eval.h           |    6 +
 arch/x86/include/asm/mem_encrypt.h         |    5 +
 arch/x86/include/asm/msr-index.h           |    3 +
 arch/x86/include/asm/page_64_types.h       |    1 +
 arch/x86/include/asm/pgtable.h             |    2 +-
 arch/x86/include/asm/processor.h           |    1 +
 arch/x86/include/asm/realmode.h            |    4 +
 arch/x86/include/asm/segment.h             |    2 +-
 arch/x86/include/asm/setup.h               |    1 -
 arch/x86/include/asm/sev-es.h              |  107 ++
 arch/x86/include/asm/stacktrace.h          |    4 +
 arch/x86/include/asm/svm.h                 |  115 +-
 arch/x86/include/asm/trap_defs.h           |   50 +
 arch/x86/include/asm/traps.h               |   51 +-
 arch/x86/include/asm/x86_init.h            |   16 +-
 arch/x86/include/uapi/asm/svm.h            |   11 +
 arch/x86/kernel/Makefile                   |    5 +
 arch/x86/kernel/asm-offsets_64.c           |    1 +
 arch/x86/kernel/cpu/amd.c                  |    3 +-
 arch/x86/kernel/cpu/common.c               |    1 +
 arch/x86/kernel/cpu/scattered.c            |    1 +
 arch/x86/kernel/cpu/vmware.c               |   50 +-
 arch/x86/kernel/dumpstack_64.c             |   47 +
 arch/x86/kernel/head64.c                   |   70 +-
 arch/x86/kernel/head_32.S                  |    4 +-
 arch/x86/kernel/head_64.S                  |  176 ++-
 arch/x86/kernel/idt.c                      |   52 +-
 arch/x86/kernel/kvm.c                      |   35 +-
 arch/x86/kernel/nmi.c                      |    8 +
 arch/x86/kernel/sev-es-shared.c            |  479 +++++++
 arch/x86/kernel/sev-es.c                   | 1428 ++++++++++++++++++++
 arch/x86/kernel/smpboot.c                  |    4 +-
 arch/x86/kernel/traps.c                    |    3 +
 arch/x86/kernel/umip.c                     |   49 +-
 arch/x86/lib/insn-eval.c                   |  130 ++
 arch/x86/mm/extable.c                      |    1 +
 arch/x86/mm/mem_encrypt.c                  |   39 +-
 arch/x86/mm/mem_encrypt_identity.c         |    3 +
 arch/x86/platform/efi/efi_64.c             |   10 +
 arch/x86/realmode/init.c                   |   12 +
 arch/x86/realmode/rm/header.S              |    3 +
 arch/x86/realmode/rm/trampoline_64.S       |   20 +
 arch/x86/tools/gen-insn-attr-x86.awk       |   50 +-
 tools/arch/x86/tools/gen-insn-attr-x86.awk |   50 +-
 65 files changed, 3842 insertions(+), 426 deletions(-)
 create mode 100644 arch/x86/boot/compressed/ident_map_64.c
 create mode 100644 arch/x86/boot/compressed/idt_64.c
 create mode 100644 arch/x86/boot/compressed/idt_handlers_64.S
 delete mode 100644 arch/x86/boot/compressed/kaslr_64.c
 create mode 100644 arch/x86/boot/compressed/sev-es.c
 create mode 100644 arch/x86/include/asm/fpu/xcr.h
 create mode 100644 arch/x86/include/asm/sev-es.h
 create mode 100644 arch/x86/include/asm/trap_defs.h
 create mode 100644 arch/x86/kernel/sev-es-shared.c
 create mode 100644 arch/x86/kernel/sev-es.c

-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
