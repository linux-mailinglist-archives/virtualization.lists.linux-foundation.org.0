Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F69C262EA7
	for <lists.virtualization@lfdr.de>; Wed,  9 Sep 2020 14:44:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 11AEA870A3;
	Wed,  9 Sep 2020 12:44:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PE434NPcsu1N; Wed,  9 Sep 2020 12:44:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 43FEC870BB;
	Wed,  9 Sep 2020 12:44:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 14229C0051;
	Wed,  9 Sep 2020 12:44:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB0EEC0051
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Sep 2020 12:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E2EE086FE7
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Sep 2020 12:44:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Kr5A39hdrpS
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Sep 2020 12:44:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 149D286FE2
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Sep 2020 12:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599655470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2LEvLH4S2H9jUJcOeCzV2MBXCNffq0ezxxi6qZw1j9g=;
 b=ALNIjZFsmBqHpJvkxJDj2G//xxFGEXytAow6zNWgS6LMVDoMzj20RTMOhdAE3Zp/K6XNP9
 WZyjC1cHIUnT8l8o3RIPplEvRPtdq73cOOqMKyPZOy/9APhsdf4L8T5yPTquiA2TgTBIbR
 aeM4j3PgPdmkeFfPN5KtwKoTZKci8I4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-hbWNKOuJOvO148_JqMoGJg-1; Wed, 09 Sep 2020 08:44:26 -0400
X-MC-Unique: hbWNKOuJOvO148_JqMoGJg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 524168015A6;
 Wed,  9 Sep 2020 12:44:22 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-114-82.ams2.redhat.com
 [10.36.114.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 680F61A886;
 Wed,  9 Sep 2020 12:44:15 +0000 (UTC)
Subject: Re: [PATCH v7 71/72] x86/efi: Add GHCB mappings when SEV-ES is active
To: Ard Biesheuvel <ardb@kernel.org>, Borislav Petkov <bp@alien8.de>,
 brijesh.singh@amd.com
References: <20200907131613.12703-1-joro@8bytes.org>
 <20200907131613.12703-72-joro@8bytes.org> <20200908174616.GJ25236@zn.tnic>
 <CAMj1kXHbePrDYXGbVG0fHfH5=M19ZpCLm9YVTs-yKTuR_jFLDg@mail.gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <e3911fe6-84e8-cb50-d95d-e33f8ae005f8@redhat.com>
Date: Wed, 9 Sep 2020 14:44:14 +0200
MIME-Version: 1.0
In-Reply-To: <CAMj1kXHbePrDYXGbVG0fHfH5=M19ZpCLm9YVTs-yKTuR_jFLDg@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org, "H. Peter Anvin" <hpa@zytor.com>,
 Jiri Slaby <jslaby@suse.cz>, Joerg Roedel <joro@8bytes.org>,
 X86 ML <x86@kernel.org>, David Rientjes <rientjes@google.com>,
 Martin Radev <martin.b.radev@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, Cfir Cohen <cfir@google.com>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Juergen Gross <jgross@suse.com>, Mike Stunes <mstunes@vmware.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
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

On 09/09/20 10:27, Ard Biesheuvel wrote:
> (adding Laszlo and Brijesh)
>
> On Tue, 8 Sep 2020 at 20:46, Borislav Petkov <bp@alien8.de> wrote:
>>
>> + Ard so that he can ack the efi bits.
>>
>> On Mon, Sep 07, 2020 at 03:16:12PM +0200, Joerg Roedel wrote:
>>> From: Tom Lendacky <thomas.lendacky@amd.com>
>>>
>>> Calling down to EFI runtime services can result in the firmware
>>> performing VMGEXIT calls. The firmware is likely to use the GHCB of
>>> the OS (e.g., for setting EFI variables),

I've had to stare at this for a while.

Because, normally a VMGEXIT is supposed to occur like this:

- guest does something privileged
- resultant non-automatic exit (NAE) injects a #VC exception
- exception handler figures out what that privileged thing was
- exception handler submits request to hypervisor via GHCB contents plus
  VMGEXIT instruction

Point being, the agent that "owns" the exception handler is supposed to
pre-allocate or otherwise provide the GHCB too, for information passing.

So... what is the particular NAE that occurs during the execution of
UEFI runtime services (at OS runtime)?

And assuming it occurs, I'm unsure if the exception handler (IDT) at
that point is owned (temporarily?) by the firmware.

- If the #VC handler comes from the firmware, then I don't know why it
would use the OS's GHCB.

- If the #VC handler comes from the OS, then I don't understand why the
commit message says "firmware performing VMGEXIT", given that in this
case it would be the OS's #VC handler executing VMGEXIT.

So, I think the above commit message implies a VMGEXIT *without* a NAE /
#VC context. (Because, I fail to interpret the commit message in a NAE /
#VC context in any way; see above.)

OK, so let's see where the firmware performs a VMGEXIT *outside* of an
exception handler, *while* at OS runtime. There seems to be one, in file
"OvmfPkg/QemuFlashFvbServicesRuntimeDxe/QemuFlashDxe.c":

> VOID
> QemuFlashPtrWrite (
>   IN        volatile UINT8    *Ptr,
>   IN        UINT8             Value
>   )
> {
>   if (MemEncryptSevEsIsEnabled ()) {
>     MSR_SEV_ES_GHCB_REGISTER  Msr;
>     GHCB                      *Ghcb;
>
>     Msr.GhcbPhysicalAddress = AsmReadMsr64 (MSR_SEV_ES_GHCB);
>     Ghcb = Msr.Ghcb;
>
>     //
>     // Writing to flash is emulated by the hypervisor through the use of write
>     // protection. This won't work for an SEV-ES guest because the write won't
>     // be recognized as a true MMIO write, which would result in the required
>     // #VC exception. Instead, use the the VMGEXIT MMIO write support directly
>     // to perform the update.
>     //
>     VmgInit (Ghcb);
>     Ghcb->SharedBuffer[0] = Value;
>     Ghcb->SaveArea.SwScratch = (UINT64) (UINTN) Ghcb->SharedBuffer;
>     VmgExit (Ghcb, SVM_EXIT_MMIO_WRITE, (UINT64) (UINTN) Ptr, 1);
>     VmgDone (Ghcb);
>   } else {
>     *Ptr = Value;
>   }
> }

This function *does* run at OS runtime (as a part of non-volatile UEFI
variable writes).

And note that, wherever MSR_SEV_ES_GHCB points to at the moment, is used
as GHCB.

If the guest kernel allocates its own GHCB and writes the allocation
address to MSR_SEV_ES_GHCB, then indeed the firmware will use the GHCB
of the OS.

I reviewed edk2 commit 437eb3f7a8db
("OvmfPkg/QemuFlashFvbServicesRuntimeDxe: Bypass flash detection with
SEV-ES", 2020-08-17), but I admit I never thought of the guest OS
changing MSR_SEV_ES_GHCB. I'm sorry about that.

As long as this driver is running before OS runtime (i.e., during the
DXE and BDS phases), MSR_SEV_ES_GHCB is supposed to carry the value we
set in "OvmfPkg/PlatformPei/AmdSev.c":

> STATIC
> VOID
> AmdSevEsInitialize (
>   VOID
>   )
> {
>   VOID              *GhcbBase;
>   PHYSICAL_ADDRESS  GhcbBasePa;
>   UINTN             GhcbPageCount, PageCount;
>   RETURN_STATUS     PcdStatus, DecryptStatus;
>   IA32_DESCRIPTOR   Gdtr;
>   VOID              *Gdt;
>
>   if (!MemEncryptSevEsIsEnabled ()) {
>     return;
>   }
>
>   PcdStatus = PcdSetBoolS (PcdSevEsIsEnabled, TRUE);
>   ASSERT_RETURN_ERROR (PcdStatus);
>
>   //
>   // Allocate GHCB and per-CPU variable pages.
>   //   Since the pages must survive across the UEFI to OS transition
>   //   make them reserved.
>   //
>   GhcbPageCount = mMaxCpuCount * 2;
>   GhcbBase = AllocateReservedPages (GhcbPageCount);
>   ASSERT (GhcbBase != NULL);
>
>   GhcbBasePa = (PHYSICAL_ADDRESS)(UINTN) GhcbBase;
>
>   //
>   // Each vCPU gets two consecutive pages, the first is the GHCB and the
>   // second is the per-CPU variable page. Loop through the allocation and
>   // only clear the encryption mask for the GHCB pages.
>   //
>   for (PageCount = 0; PageCount < GhcbPageCount; PageCount += 2) {
>     DecryptStatus = MemEncryptSevClearPageEncMask (
>       0,
>       GhcbBasePa + EFI_PAGES_TO_SIZE (PageCount),
>       1,
>       TRUE
>       );
>     ASSERT_RETURN_ERROR (DecryptStatus);
>   }
>
>   ZeroMem (GhcbBase, EFI_PAGES_TO_SIZE (GhcbPageCount));
>
>   PcdStatus = PcdSet64S (PcdGhcbBase, GhcbBasePa);
>   ASSERT_RETURN_ERROR (PcdStatus);
>   PcdStatus = PcdSet64S (PcdGhcbSize, EFI_PAGES_TO_SIZE (GhcbPageCount));
>   ASSERT_RETURN_ERROR (PcdStatus);
>
>   DEBUG ((DEBUG_INFO,
>     "SEV-ES is enabled, %lu GHCB pages allocated starting at 0x%p\n",
>     (UINT64)GhcbPageCount, GhcbBase));
>
>   AsmWriteMsr64 (MSR_SEV_ES_GHCB, GhcbBasePa);

So what is the *actual* problem at OS runtime:

- Is it that MSR_SEV_ES_GHCB still points at this PEI-phase *reserved*
  memory allocation (and so when QemuFlashPtrWrite() tries to access it
  during OS runtime, it doesn't have a runtime mapping for it)?

- Or is it that the OS actively changes MSR_SEV_ES_GHCB, pointing to a
  memory area that the OS owns -- and *that* area is what
  QemuFlashPtrWrite() cannot access at OS runtime?

The first problem statement does *not* seem to apply, given -- again --
that the commit message says, "firmware is likely to use the GHCB of the
OS".

So I think the second problem statement must apply.

(I think the "reserved allocation" above is "reserved" only because we
want to keep the OS out of it around the ExitBootServices() transition.)

Back to the email:

On 09/09/20 10:27, Ard Biesheuvel wrote:
> On Tue, 8 Sep 2020 at 20:46, Borislav Petkov <bp@alien8.de> wrote:
>> On Mon, Sep 07, 2020 at 03:16:12PM +0200, Joerg Roedel wrote:
>>> so each GHCB in the system needs to be identity
>>> mapped in the EFI page tables, as unencrypted, to avoid page faults.

Not sure I agree about this, but at least it seems to confirm my
understanding -- apparently the idea is, for the OS, to satisfy
QemuFlashPtrWrite() in the firmware, by putting the "expected" mapping
-- for wherever MSR_SEV_ES_GHCB is going to point to -- in place.

>>>
>>> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
>>> [ jroedel@suse.de: Moved GHCB mapping loop to sev-es.c ]
>>> Signed-off-by: Joerg Roedel <jroedel@suse.de>
>
>
> This looks like it is papering over a more fundamental issue: any
> memory region that the firmware itself needs to access during the
> execution of runtime services needs to be described in the UEFI memory
> map, with the appropriate annotations so that the OS knows it should
> include these in the EFI runtime page tables. So why has this been
> omitted in this case?

So yeah, the issue seems to be that the QemuFlashFvbServicesRuntimeDxe
driver does not *own* the GHCB that it attempts to use at OS runtime. It
doesn't know where MSR_SEV_ES_GHCB is going to point.

Is QemuFlashFvbServicesRuntimeDxe permitted to change MSR_SEV_ES_GHCB
*temporarily* at OS runtime?

Because, in that case:

- QemuFlashFvbServicesRuntimeDxe should allocate a Runtime Services Data
  block for GHCB when it starts up (if SEV-ES is active),

- QemuFlashFvbServicesRuntimeDxe should register a SetVirtualAddressMap
  handler, and use EfiConvertPointer() from UefiRuntimeLib to convert
  the "runtime GHCB" address to virtual address, in that handler,

- QemuFlashPtrWrite() should call EfiAtRuntime() from UefiRuntimeLib,
  and if the latter returns TRUE, then (a) use the runtime-converted
  address for populating the GHCB, and (b) temporarily swap
  MSR_SEV_ES_GHCB with the address of the self-allocated GHCB. (The MSR
  needs a *physical* address, so QemuFlashFvbServicesRuntimeDxe would
  have to remember / retain the original (physical) allocation address
  too.)

If QemuFlashFvbServicesRuntimeDxe is not permitted to change
MSR_SEV_ES_GHCB even temporarily (at OS runtime), then I think the
approach proposed in this (guest kernel) patch is valid.

Let me skim the code below...

>
>
>
>>> ---
>>>  arch/x86/boot/compressed/sev-es.c |  1 +
>>>  arch/x86/include/asm/sev-es.h     |  2 ++
>>>  arch/x86/kernel/sev-es.c          | 30 ++++++++++++++++++++++++++++++
>>>  arch/x86/platform/efi/efi_64.c    | 10 ++++++++++
>>>  4 files changed, 43 insertions(+)
>>>
>>> diff --git a/arch/x86/boot/compressed/sev-es.c b/arch/x86/boot/compressed/sev-es.c
>>> index 45702b866c33..0a9a248ca33d 100644
>>> --- a/arch/x86/boot/compressed/sev-es.c
>>> +++ b/arch/x86/boot/compressed/sev-es.c
>>> @@ -12,6 +12,7 @@
>>>   */
>>>  #include "misc.h"
>>>
>>> +#include <asm/pgtable_types.h>
>>>  #include <asm/sev-es.h>
>>>  #include <asm/trapnr.h>
>>>  #include <asm/trap_pf.h>
>>> diff --git a/arch/x86/include/asm/sev-es.h b/arch/x86/include/asm/sev-es.h
>>> index e919f09ae33c..cf1d957c7091 100644
>>> --- a/arch/x86/include/asm/sev-es.h
>>> +++ b/arch/x86/include/asm/sev-es.h
>>> @@ -102,11 +102,13 @@ static __always_inline void sev_es_nmi_complete(void)
>>>       if (static_branch_unlikely(&sev_es_enable_key))
>>>               __sev_es_nmi_complete();
>>>  }
>>> +extern int __init sev_es_efi_map_ghcbs(pgd_t *pgd);
>>>  #else
>>>  static inline void sev_es_ist_enter(struct pt_regs *regs) { }
>>>  static inline void sev_es_ist_exit(void) { }
>>>  static inline int sev_es_setup_ap_jump_table(struct real_mode_header *rmh) { return 0; }
>>>  static inline void sev_es_nmi_complete(void) { }
>>> +static inline int sev_es_efi_map_ghcbs(pgd_t *pgd) { return 0; }
>>>  #endif
>>>
>>>  #endif
>>> diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
>>> index 9ab3a4dfecd8..4e2b7e4d9b87 100644
>>> --- a/arch/x86/kernel/sev-es.c
>>> +++ b/arch/x86/kernel/sev-es.c
>>> @@ -491,6 +491,36 @@ int sev_es_setup_ap_jump_table(struct real_mode_header *rmh)
>>>       return 0;
>>>  }
>>>
>>> +/*
>>> + * This is needed by the OVMF UEFI firmware which will use whatever it finds in
>>> + * the GHCB MSR as its GHCB to talk to the hypervisor. So make sure the per-cpu
>>> + * runtime GHCBs used by the kernel are also mapped in the EFI page-table.

Yup, this pretty much confirms my suspicion that QemuFlashPtrWrite() is
at the center of this.

(BTW, I don't think that the runtime services data allocation, in
QemuFlashFvbServicesRuntimeDxe, for OS runtime GHCB purposes, would have
to be "per CPU". Refer to "Table 35. Rules for Reentry Into Runtime
Services" in the UEFI spec -- if one processor is executing
SetVariable(), then no other processor must enter SetVariable(). And so
we'll have *at most* one VCPU in QemuFlashPtrWrite(), at any time.)

>>> + */
>>> +int __init sev_es_efi_map_ghcbs(pgd_t *pgd)
>>> +{
>>> +     struct sev_es_runtime_data *data;
>>> +     unsigned long address, pflags;
>>> +     int cpu;
>>> +     u64 pfn;
>>> +
>>> +     if (!sev_es_active())
>>> +             return 0;
>>> +
>>> +     pflags = _PAGE_NX | _PAGE_RW;
>>> +
>>> +     for_each_possible_cpu(cpu) {
>>> +             data = per_cpu(runtime_data, cpu);
>>> +
>>> +             address = __pa(&data->ghcb_page);
>>> +             pfn = address >> PAGE_SHIFT;
>>> +
>>> +             if (kernel_map_pages_in_pgd(pgd, pfn, address, 1, pflags))
>>> +                     return 1;
>>> +     }
>>> +
>>> +     return 0;
>>> +}
>>> +
>>>  static enum es_result vc_handle_msr(struct ghcb *ghcb, struct es_em_ctxt *ctxt)
>>>  {
>>>       struct pt_regs *regs = ctxt->regs;
>>> diff --git a/arch/x86/platform/efi/efi_64.c b/arch/x86/platform/efi/efi_64.c
>>> index 6af4da1149ba..8f5759df7776 100644
>>> --- a/arch/x86/platform/efi/efi_64.c
>>> +++ b/arch/x86/platform/efi/efi_64.c
>>> @@ -47,6 +47,7 @@
>>>  #include <asm/realmode.h>
>>>  #include <asm/time.h>
>>>  #include <asm/pgalloc.h>
>>> +#include <asm/sev-es.h>
>>>
>>>  /*
>>>   * We allocate runtime services regions top-down, starting from -4G, i.e.
>>> @@ -229,6 +230,15 @@ int __init efi_setup_page_tables(unsigned long pa_memmap, unsigned num_pages)
>>>               return 1;
>>>       }
>>>
>>> +     /*
>>> +      * When SEV-ES is active, the GHCB as set by the kernel will be used
>>> +      * by firmware. Create a 1:1 unencrypted mapping for each GHCB.
>>> +      */
>>> +     if (sev_es_efi_map_ghcbs(pgd)) {
>>> +             pr_err("Failed to create 1:1 mapping for the GHCBs!\n");
>>> +             return 1;
>>> +     }
>>> +
>>>       /*
>>>        * When making calls to the firmware everything needs to be 1:1
>>>        * mapped and addressable with 32-bit pointers. Map the kernel

Good point!

And it even makes me wonder if the QemuFlashFvbServicesRuntimeDxe
approach, with the runtime services data type memory allocation, is
feasible at all. Namely, a page's encryption status, under SEV, is
controlled through the PTE.

And for this particular UEFI runtime area, it would *not* suffice for
the OS to just virt-map it. The OS would also have to *decrypt* the area
(mark the PTE as "plaintext").

In other words, it would be an "unprecedented" PTE for the OS to set up:
the PTE would not only map the GVA to GPA, but also mark the area as
"plaintext".

Otherwise -- if the OS covers *just* the virt-mapping --,
QemuFlashFvbServicesRuntimeDxe would populate its own "runtime GHCB"
area just fine, but the actual data hitting the host RAM would be
encrypted. And so the hypervisor could not interpret the GHCB.

*If* QemuFlashFvbServicesRuntimeDxe should not change the kernel-owned
PTE at runtime, even temporarily, for marking the GHCB as "plaintext",
then the problem is indeed only solvable in the guest kernel, in my
opinion.

There simply isn't an "architected annotation" for telling the kernel,
"virt-map this runtime services data type memory range, *and* mark it as
plaintext at the same time".

This would be necessary, as both actions affect the exact same PTE, and
the firmware is not really allowed to touch the PTE at runtime. But we
don't have such a hint.


To summarize: for QemuFlashFvbServicesRuntimeDxe to allocate UEFI
Runtime Services Data type memory, for its own runtime GHCB, two
permissions are necessary (together), at OS runtime:

- QemuFlashFvbServicesRuntimeDxe must be allowed to swap MSR_SEV_ES_GHCB
  temporarily (before executing VMGEXIT),

- QemuFlashFvbServicesRuntimeDxe must be allowed to change the OS-owned
  PTE temporarily (for remapping the GHCB as plaintext, before writing
  to it).

Thanks
Laszlo

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
