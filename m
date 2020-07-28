Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C792B231416
	for <lists.virtualization@lfdr.de>; Tue, 28 Jul 2020 22:40:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6501388215;
	Tue, 28 Jul 2020 20:40:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kkwNAKdv-YR6; Tue, 28 Jul 2020 20:40:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B223688218;
	Tue, 28 Jul 2020 20:40:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 89F62C004D;
	Tue, 28 Jul 2020 20:40:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 566D4C004D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 20:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4565888218
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 20:40:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eJR6zBy90Sr6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 20:40:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 84C5888215
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 20:40:36 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 074701C0BD8; Tue, 28 Jul 2020 22:40:31 +0200 (CEST)
Date: Tue, 28 Jul 2020 22:40:30 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3 19/19] arm64: lto: Strengthen READ_ONCE() to acquire
 when CONFIG_LTO=y
Message-ID: <20200728204029.GB1012@bug>
References: <20200710165203.31284-1-will@kernel.org>
 <20200710165203.31284-20-will@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200710165203.31284-20-will@kernel.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Joel Fernandes <joelaf@google.com>, Mark Rutland <mark.rutland@arm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 virtualization@lists.linux-foundation.org, Arnd Bergmann <arnd@arndb.de>,
 Alan Stern <stern@rowland.harvard.edu>,
 Sami Tolvanen <samitolvanen@google.com>, Matt Turner <mattst88@gmail.com>,
 kernel-team@android.com, Marco Elver <elver@google.com>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org
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

On Fri 2020-07-10 17:52:03, Will Deacon wrote:
> When building with LTO, there is an increased risk of the compiler
> converting an address dependency headed by a READ_ONCE() invocation
> into a control dependency and consequently allowing for harmful
> reordering by the CPU.
> 
> Ensure that such transformations are harmless by overriding the generic
> READ_ONCE() definition with one that provides acquire semantics when
> building with LTO.

Traditionally, READ_ONCE had only effects on compiler optimalizations, not on
special semantics of the load instruction.

Do you have example how LTO optimalizations break the code?

Should some documentation be added? Because I believe users will need to understand
what is going on there. 

It is not LTO-only problem and it is not arm64-only problem, right?

Best regards,
									Pavel


> +#ifdef CONFIG_AS_HAS_LDAPR
> +#define __LOAD_RCPC(sfx, regs...)					\
> +	ALTERNATIVE(							\
> +		"ldar"	#sfx "\t" #regs,				\
> +		".arch_extension rcpc\n"				\
> +		"ldapr"	#sfx "\t" #regs,				\
> +	ARM64_HAS_LDAPR)
> +#else
> +#define __LOAD_RCPC(sfx, regs...)	"ldar" #sfx "\t" #regs
> +#endif /* CONFIG_AS_HAS_LDAPR */
> +
> +#define __READ_ONCE(x)							\
> +({									\
> +	typeof(&(x)) __x = &(x);					\
> +	int atomic = 1;							\
> +	union { __unqual_scalar_typeof(*__x) __val; char __c[1]; } __u;	\
> +	switch (sizeof(x)) {						\
> +	case 1:								\
> +		asm volatile(__LOAD_RCPC(b, %w0, %1)			\
> +			: "=r" (*(__u8 *)__u.__c)			\
> +			: "Q" (*__x) : "memory");			\
> +		break;							\
> +	case 2:								\
> +		asm volatile(__LOAD_RCPC(h, %w0, %1)			\
> +			: "=r" (*(__u16 *)__u.__c)			\
> +			: "Q" (*__x) : "memory");			\
> +		break;							\
> +	case 4:								\
> +		asm volatile(__LOAD_RCPC(, %w0, %1)			\
> +			: "=r" (*(__u32 *)__u.__c)			\
> +			: "Q" (*__x) : "memory");			\
> +		break;							\
> +	case 8:								\
> +		asm volatile(__LOAD_RCPC(, %0, %1)			\
> +			: "=r" (*(__u64 *)__u.__c)			\
> +			: "Q" (*__x) : "memory");			\
> +		break;							\
> +	default:							\
> +		atomic = 0;						\
> +	}								\
> +	atomic ? (typeof(*__x))__u.__val : (*(volatile typeof(__x))__x);\
> +})
> +
> +#endif	/* !BUILD_VDSO */
> +#endif	/* CONFIG_LTO */
> +
> +#include <asm-generic/rwonce.h>
> +
> +#endif	/* __ASM_RWONCE_H */
> diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
> index 45d5cfe46429..60df97f2e7de 100644
> --- a/arch/arm64/kernel/vdso/Makefile
> +++ b/arch/arm64/kernel/vdso/Makefile
> @@ -28,7 +28,7 @@ ldflags-y := -shared -nostdlib -soname=linux-vdso.so.1 --hash-style=sysv	\
>  	     $(btildflags-y) -T
>  
>  ccflags-y := -fno-common -fno-builtin -fno-stack-protector -ffixed-x18
> -ccflags-y += -DDISABLE_BRANCH_PROFILING
> +ccflags-y += -DDISABLE_BRANCH_PROFILING -DBUILD_VDSO
>  
>  CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) -Os $(CC_FLAGS_SCS) $(GCC_PLUGINS_CFLAGS)
>  KBUILD_CFLAGS			+= $(DISABLE_LTO)
> diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
> index d88148bef6b0..4fdf3754a058 100644
> --- a/arch/arm64/kernel/vdso32/Makefile
> +++ b/arch/arm64/kernel/vdso32/Makefile
> @@ -43,7 +43,7 @@ cc32-as-instr = $(call try-run,\
>  # As a result we set our own flags here.
>  
>  # KBUILD_CPPFLAGS and NOSTDINC_FLAGS from top-level Makefile
> -VDSO_CPPFLAGS := -D__KERNEL__ -nostdinc -isystem $(shell $(CC_COMPAT) -print-file-name=include)
> +VDSO_CPPFLAGS := -DBUILD_VDSO -D__KERNEL__ -nostdinc -isystem $(shell $(CC_COMPAT) -print-file-name=include)
>  VDSO_CPPFLAGS += $(LINUXINCLUDE)
>  
>  # Common C and assembly flags
> -- 
> 2.27.0.383.g050319c2ae-goog

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
