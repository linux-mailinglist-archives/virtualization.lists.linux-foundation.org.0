Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFA7199738
	for <lists.virtualization@lfdr.de>; Tue, 31 Mar 2020 15:16:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E1BDB87A73;
	Tue, 31 Mar 2020 13:16:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qVMEqVX4ll5q; Tue, 31 Mar 2020 13:16:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 32558877D0;
	Tue, 31 Mar 2020 13:16:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 143E3C07FF;
	Tue, 31 Mar 2020 13:16:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CC6E5C07FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 13:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B5FC6877D0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 13:16:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KeXd8KDpuPXn
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 13:16:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 23ED7876C9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 13:16:16 +0000 (UTC)
Received: from zn.tnic (p200300EC2F0C0900E4DD424C85240D45.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0c:900:e4dd:424c:8524:d45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 63FBE1EC0CE4;
 Tue, 31 Mar 2020 15:16:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1585660572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=1Scx1x8rSpYx1k4WbB+KFUIoBzS4PNnsA/vPnSnULrY=;
 b=rMZVZmFDBZFwnZKWPfk/C5wN5xF0oa+6qsyU2v7Dg+Z/ezln4w+3mgXLhZz8x+1/kh9GEH
 p0c3K9Q8kHzZmGeHrCrfkleWSza5tuw2sJeCNgc6yRcmH/zYgg1rhTQ3BSnY/XS0PT61Ou
 ywsgbtIHRLfkY4RshaZXzuIeiU3wKBM=
Date: Tue, 31 Mar 2020 15:16:06 +0200
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 11/70] x86/boot/compressed/64: Disable red-zone usage
Message-ID: <20200331131606.GC29131@zn.tnic>
References: <20200319091407.1481-1-joro@8bytes.org>
 <20200319091407.1481-12-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200319091407.1481-12-joro@8bytes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Joerg Roedel <jroedel@suse.de>, Andy Lutomirski <luto@kernel.org>,
 hpa@zytor.com, Dan Williams <dan.j.williams@intel.com>,
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

On Thu, Mar 19, 2020 at 10:13:08AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> The x86-64 ABI defines a red-zone on the stack:
> 
>   The 128-byte area beyond the location pointed to by %rsp is
>   considered to be reserved and shall not be modified by signal or
>   interrupt handlers. 10 Therefore, functions may use this area for
			^^

That 10 is the footnote number from the pdf. :)

>   temporary data that is not needed across function calls. In
>   particular, leaf functions may use this area for their entire stack
>   frame, rather than adjusting the stack pointer in the prologue and
>   epilogue. This area is known as the red zone.
> 
> This is not compatible with exception handling, so disable it for the

I could use some blurb as to what the problem is, for future reference.

> pre-decompression boot code.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  arch/x86/boot/Makefile            | 2 +-
>  arch/x86/boot/compressed/Makefile | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
> index 012b82fc8617..8f55e4ce1ccc 100644
> --- a/arch/x86/boot/Makefile
> +++ b/arch/x86/boot/Makefile
> @@ -65,7 +65,7 @@ clean-files += cpustr.h
>  
>  # ---------------------------------------------------------------------------
>  
> -KBUILD_CFLAGS	:= $(REALMODE_CFLAGS) -D_SETUP
> +KBUILD_CFLAGS	:= $(REALMODE_CFLAGS) -D_SETUP -mno-red-zone
>  KBUILD_AFLAGS	:= $(KBUILD_CFLAGS) -D__ASSEMBLY__
>  KBUILD_CFLAGS	+= $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
>  GCOV_PROFILE := n
> diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
> index 26050ae0b27e..e186cc0b628d 100644
> --- a/arch/x86/boot/compressed/Makefile
> +++ b/arch/x86/boot/compressed/Makefile
> @@ -30,7 +30,7 @@ KBUILD_CFLAGS := -m$(BITS) -O2
>  KBUILD_CFLAGS += -fno-strict-aliasing $(call cc-option, -fPIE, -fPIC)
>  KBUILD_CFLAGS += -DDISABLE_BRANCH_PROFILING
>  cflags-$(CONFIG_X86_32) := -march=i386
> -cflags-$(CONFIG_X86_64) := -mcmodel=small
> +cflags-$(CONFIG_X86_64) := -mcmodel=small -mno-red-zone
>  KBUILD_CFLAGS += $(cflags-y)
>  KBUILD_CFLAGS += -mno-mmx -mno-sse
>  KBUILD_CFLAGS += $(call cc-option,-ffreestanding)
> @@ -87,7 +87,7 @@ endif
>  
>  vmlinux-objs-$(CONFIG_ACPI) += $(obj)/acpi.o
>  
> -$(obj)/eboot.o: KBUILD_CFLAGS += -fshort-wchar -mno-red-zone
> +$(obj)/eboot.o: KBUILD_CFLAGS += -fshort-wchar
>  
>  vmlinux-objs-$(CONFIG_EFI_STUB) += $(obj)/eboot.o \
>  	$(objtree)/drivers/firmware/efi/libstub/lib.a

That last chunk is not needed anymore after

c2d0b470154c ("efi/libstub/x86: Incorporate eboot.c into libstub")

AFAICT.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
