Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EE9176E44
	for <lists.virtualization@lfdr.de>; Tue,  3 Mar 2020 06:02:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5FE8586D2D;
	Tue,  3 Mar 2020 05:02:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zCE3g7PU6ozs; Tue,  3 Mar 2020 05:02:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7973D86CD3;
	Tue,  3 Mar 2020 05:02:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6302AC013E;
	Tue,  3 Mar 2020 05:02:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D750BC013E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 05:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C04B583791
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 05:02:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ycpz27fRYqNd
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 05:02:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9D85F836F1
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 05:02:17 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id g12so767586plo.3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 02 Mar 2020 21:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Q35xHdWKJJDozqgC+DE0AkepRfor0WoHxwu3tIn+R2o=;
 b=eM1bRdtSZ21RFCiu3jUoxsurIubkaafgJWUsxzqiQyxFo7G2KBL2RG/I/wfAF1UYea
 Xddni38mDnMFm2IKvCz4VSolutjZv4ttQqpL+flyNOMJA62Ny43fYEbLDP6dNZ32iYUY
 8v23/qNQpbLvAQG60wWdJDvpXEeqSQ62YQm+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q35xHdWKJJDozqgC+DE0AkepRfor0WoHxwu3tIn+R2o=;
 b=nRvkOqSgEWuOE89XaIcKe8ddgH8eku8ZeLsT00NLpkRR1jfPPx5ly3F7awFZUoQK7D
 EJ/odl5wdhL3ujmmTAbSS/fUG8frY638wrJa5imTvzh8YZaG2XZCej/2iwLGXQ1F5PYL
 6hFZnmXGgL92QA3Vn4xERED1I0ajeUu/UB7T6ZpoEngYTkA4P9AjZhrM+Us1m3v9wgT2
 wnHI98BjtnqPAT4ZYqPuoGj85IFLp8kB50CCIF5wIP+Ku6VH/ZneWLChDsgMEb6C2i3C
 T39hoPk7prhuoyP36bQqvP9WWlrxiSg0gs+f6+0od0wQfZGO+DLVdJRCd6JjhD9RtuMp
 nwTg==
X-Gm-Message-State: ANhLgQ1j+D6AtFQTW0uQOkv+WjkIw4qYNZzYYVF1hp4ML9nH7Boz01H1
 3c1VPjJ0CdwfNl/0gqWdfSMpMA==
X-Google-Smtp-Source: ADFU+vvEQbUyygn93oWCIMo6EP7RE0Je117ZwkjgVdAneWftAbKV9R8PWH6lnNIep/0z+sFWAbUeBA==
X-Received: by 2002:a17:90a:5d97:: with SMTP id
 t23mr2156642pji.61.1583211737104; 
 Mon, 02 Mar 2020 21:02:17 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id w17sm22267976pfi.56.2020.03.02.21.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 21:02:16 -0800 (PST)
Date: Mon, 2 Mar 2020 21:02:15 -0800
From: Kees Cook <keescook@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Garnier <thgarnie@chromium.org>
Subject: Re: [PATCH v11 00/11] x86: PIE support to extend KASLR randomization
Message-ID: <202003022100.54CEEE60F@keescook>
References: <20200228000105.165012-1-thgarnie@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200228000105.165012-1-thgarnie@chromium.org>
Cc: kristen@linux.intel.com, kernel-hardening@lists.openwall.com, "VMware,
 Inc." <pv-drivers@vmware.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 virtualization@lists.linux-foundation.org, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Thomas Hellstrom <thellstrom@vmware.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Jiri Slaby <jslaby@suse.cz>,
 x86@kernel.org, Peter Zijlstra <peterz@infradead.org>,
 linux-crypto@vger.kernel.org, Len Brown <len.brown@intel.com>,
 linux-pm@vger.kernel.org, Cao jin <caoj.fnst@cn.fujitsu.com>,
 Andy Lutomirski <luto@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Allison Randal <allison@lohutok.net>, Juergen Gross <jgross@suse.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
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

On Thu, Feb 27, 2020 at 04:00:45PM -0800, Thomas Garnier wrote:
> Minor changes based on feedback and rebase from v10.
> 
> Splitting the previous serie in two. This part contains assembly code
> changes required for PIE but without any direct dependencies with the
> rest of the patchset.
> 
> Note: Using objtool to detect non-compliant PIE relocations is not yet
> possible as this patchset only includes the simplest PIE changes.
> Additional changes are needed in kvm, xen and percpu code.
> 
> Changes:
>  - patch v11 (assembly);
>    - Fix comments on x86/entry/64.
>    - Remove KASLR PIE explanation on all commits.
>    - Add note on objtool not being possible at this stage of the patchset.

This moves us closer to PIE in a clean first step. I think these patches
look good to go, and unblock the work in kvm, xen, and percpu code. Can
one of the x86 maintainers pick this series up?

Thanks!

-Kees

>  - patch v10 (assembly):
>    - Swap rax for rdx on entry/64 changes based on feedback.
>    - Addressed feedback from Borislav Petkov on boot, paravirt, alternatives
>      and globally.
>    - Rebased the patchset and ensure it works with large kaslr (not included).
>  - patch v9 (assembly):
>    - Moved to relative reference for sync_core based on feedback.
>    - x86/crypto had multiple algorithms deleted, removed PIE changes to them.
>    - fix typo on comment end line.
>  - patch v8 (assembly):
>    - Fix issues in crypto changes (thanks to Eric Biggers).
>    - Remove unnecessary jump table change.
>    - Change author and signoff to chromium email address.
>  - patch v7 (assembly):
>    - Split patchset and reorder changes.
>  - patch v6:
>    - Rebase on latest changes in jump tables and crypto.
>    - Fix wording on couple commits.
>    - Revisit checkpatch warnings.
>    - Moving to @chromium.org.
>  - patch v5:
>    - Adapt new crypto modules for PIE.
>    - Improve per-cpu commit message.
>    - Fix xen 32-bit build error with .quad.
>    - Remove extra code for ftrace.
>  - patch v4:
>    - Simplify early boot by removing global variables.
>    - Modify the mcount location script for __mcount_loc intead of the address
>      read in the ftrace implementation.
>    - Edit commit description to explain better where the kernel can be located.
>    - Streamlined the testing done on each patch proposal. Always testing
>      hibernation, suspend, ftrace and kprobe to ensure no regressions.
>  - patch v3:
>    - Update on message to describe longer term PIE goal.
>    - Minor change on ftrace if condition.
>    - Changed code using xchgq.
>  - patch v2:
>    - Adapt patch to work post KPTI and compiler changes
>    - Redo all performance testing with latest configs and compilers
>    - Simplify mov macro on PIE (MOVABS now)
>    - Reduce GOT footprint
>  - patch v1:
>    - Simplify ftrace implementation.
>    - Use gcc mstack-protector-guard-reg=%gs with PIE when possible.
>  - rfc v3:
>    - Use --emit-relocs instead of -pie to reduce dynamic relocation space on
>      mapped memory. It also simplifies the relocation process.
>    - Move the start the module section next to the kernel. Remove the need for
>      -mcmodel=large on modules. Extends module space from 1 to 2G maximum.
>    - Support for XEN PVH as 32-bit relocations can be ignored with
>      --emit-relocs.
>    - Support for GOT relocations previously done automatically with -pie.
>    - Remove need for dynamic PLT in modules.
>    - Support dymamic GOT for modules.
>  - rfc v2:
>    - Add support for global stack cookie while compiler default to fs without
>      mcmodel=kernel
>    - Change patch 7 to correctly jump out of the identity mapping on kexec load
>      preserve.
> 
> These patches make some of the changes necessary to build the kernel as
> Position Independent Executable (PIE) on x86_64. Another patchset will
> add the PIE option and larger architecture changes. PIE allows the kernel to be
> placed below the 0xffffffff80000000 increasing the range of KASLR.
> 
> The patches:
>  - 1, 3-11: Change in assembly code to be PIE compliant.
>  - 2: Add a new _ASM_MOVABS macro to fetch a symbol address generically.
> 
> diffstat:
>  crypto/aegis128-aesni-asm.S         |    6 +-
>  crypto/aesni-intel_asm.S            |    8 +--
>  crypto/aesni-intel_avx-x86_64.S     |    3 -
>  crypto/camellia-aesni-avx-asm_64.S  |   42 +++++++--------
>  crypto/camellia-aesni-avx2-asm_64.S |   44 ++++++++--------
>  crypto/camellia-x86_64-asm_64.S     |    8 +--
>  crypto/cast5-avx-x86_64-asm_64.S    |   50 ++++++++++--------
>  crypto/cast6-avx-x86_64-asm_64.S    |   44 +++++++++-------
>  crypto/des3_ede-asm_64.S            |   96 ++++++++++++++++++++++++------------
>  crypto/ghash-clmulni-intel_asm.S    |    4 -
>  crypto/glue_helper-asm-avx.S        |    4 -
>  crypto/glue_helper-asm-avx2.S       |    6 +-
>  crypto/sha256-avx2-asm.S            |   18 ++++--
>  entry/entry_64.S                    |   16 ++++--
>  include/asm/alternative.h           |    6 +-
>  include/asm/asm.h                   |    1 
>  include/asm/bug.h                   |    2 
>  include/asm/paravirt_types.h        |   32 ++++++++++--
>  include/asm/pm-trace.h              |    2 
>  include/asm/processor.h             |    6 +-
>  kernel/acpi/wakeup_64.S             |   31 ++++++-----
>  kernel/head_64.S                    |   15 +++--
>  kernel/relocate_kernel_64.S         |    2 
>  power/hibernate_asm_64.S            |    4 -
>  24 files changed, 268 insertions(+), 182 deletions(-)
> 
> Patchset is based on next-20200227.
> 
> 

-- 
Kees Cook
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
