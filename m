Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E137D7B157
	for <lists.virtualization@lfdr.de>; Tue, 30 Jul 2019 20:13:54 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1BEAD316D;
	Tue, 30 Jul 2019 18:13:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 595A32E7D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 30 Jul 2019 18:01:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C83D6A8
	for <virtualization@lists.linux-foundation.org>;
	Tue, 30 Jul 2019 18:01:52 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id k189so11413357pgk.13
	for <virtualization@lists.linux-foundation.org>;
	Tue, 30 Jul 2019 11:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=e4oBhvl2JGL/g7znlpJb17wcZ4f4c/GlFLmGamjl13c=;
	b=fbKhNQxzz82g4sdnAhZ57A0hb0uBcdzsGtvJIewH6J8HFiWd4v1DbjhZme3+FPpHN+
	CgVrRWW5s0YuozJII/YB+2NZ5r573QGkU38HNUz7maBvW4CAJRPZpo9gRRMOu66NfgT1
	4s1JAmGCs8uLjMqep+2ShT7MpdeLsB0l8QKaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=e4oBhvl2JGL/g7znlpJb17wcZ4f4c/GlFLmGamjl13c=;
	b=kWijdAhcOAPtmSl7jb9UQbDzw9i6s74P6O8oGevic4ZerUa/UxApUiwtY0Hw0GIpG5
	WYT1hGTwcZSdoVNE0k6uLVgIcexcebpg31VIxSt66oJLj4VxPxosXva1Z9sMmiSGR5AU
	+Bf8cq+NSiZPTEEAfT4N9OnHhzWvEMpjr/9+zSl4Y/xVAxVXZxDSyRPznXd1TCg5rGJM
	qPp8zcaqbgvr8jN+fESXI4oABy0VciO7w2c6NAy0+earPYti/liqu7GKWKT5kw9IVUZS
	YqbOBT08PaSn2pLq9EZXl0CPQJJ2lFwFole9rUCnNYrAMgfCrAY7Vehos4RO0jCkuGuG
	PwXg==
X-Gm-Message-State: APjAAAW4tBORA45pztym6BVl6AaT7G+0ADZnZnyLVor2ru45f6dwPyZp
	yetC24ds8Uj0t/ZF4imVaXTzRQ==
X-Google-Smtp-Source: APXvYqxjt+I4v/sdEnywIDMFxpX9dhohJ2h/xcn+2r0A6Nitb41VcNHFgzjYokT3yWbk7qgmF27dvQ==
X-Received: by 2002:a17:90a:cb12:: with SMTP id
	z18mr112668727pjt.82.1564509712356; 
	Tue, 30 Jul 2019 11:01:52 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id c7sm7783391pgq.31.2019.07.30.11.01.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Jul 2019 11:01:51 -0700 (PDT)
Date: Tue, 30 Jul 2019 11:01:50 -0700
From: Kees Cook <keescook@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v8 00/11] x86: PIE support to extend KASLR randomization
Message-ID: <201907301100.90BB865078@keescook>
References: <20190708174913.123308-1-thgarnie@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190708174913.123308-1-thgarnie@chromium.org>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Feng Tang <feng.tang@intel.com>, kristen@linux.intel.com,
	kernel-hardening@lists.openwall.com, Peter Zijlstra <peterz@infradead.org>,
	virtualization@lists.linux-foundation.org,
	Thomas Garnier <thgarnie@chromium.org>,
	Pavel Machek <pavel@ucw.cz>, "H. Peter Anvin" <hpa@zytor.com>,
	Alok Kataria <akataria@vmware.com>,
	Herbert Xu <herbert@gondor.apana.org.au>, x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>, Len Brown <len.brown@intel.com>,
	Jann Horn <jannh@google.com>, Alexios Zavras <alexios.zavras@intel.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>, Maran Wilson <maran.wilson@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	Nadav Amit <namit@vmware.com>, Andrew Morton <akpm@linux-foundation.org>,
	Enrico Weigelt <info@metux.net>, "David S. Miller" <davem@davemloft.net>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Mon, Jul 08, 2019 at 10:48:53AM -0700, Thomas Garnier wrote:
> Splitting the previous series in two. This part contains assembly code
> changes required for PIE but without any direct dependencies with the
> rest of the patchset.
> 
> Changes:
>  - patch v8 (assembly):
>    - Fix issues in crypto changes (thanks to Eric Biggers).
>    - Remove unnecessary jump table change.
>    - Change author and signoff to chromium email address.

With -rc2 done, is this a good time for this to land in -tip? Are there
more steps needed for review?

Thanks!

-Kees

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
> add the PIE option and larger architecture changes.
> 
> The patches:
>  - 1, 3-11: Change in assembly code to be PIE compliant.
>  - 2: Add a new _ASM_MOVABS macro to fetch a symbol address generically.
> 
> diffstat:
>  crypto/aegis128-aesni-asm.S         |    6 +-
>  crypto/aegis128l-aesni-asm.S        |    8 +--
>  crypto/aegis256-aesni-asm.S         |    6 +-
>  crypto/aes-x86_64-asm_64.S          |   45 ++++++++++------
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
>  crypto/morus1280-avx2-asm.S         |    4 -
>  crypto/morus1280-sse2-asm.S         |    8 +--
>  crypto/morus640-sse2-asm.S          |    6 +-
>  crypto/sha256-avx2-asm.S            |   18 ++++--
>  entry/entry_64.S                    |   16 ++++--
>  include/asm/alternative.h           |    6 +-
>  include/asm/asm.h                   |    1 
>  include/asm/paravirt_types.h        |   25 +++++++--
>  include/asm/pm-trace.h              |    2 
>  include/asm/processor.h             |    6 +-
>  kernel/acpi/wakeup_64.S             |   31 ++++++-----
>  kernel/head_64.S                    |   16 +++---
>  kernel/relocate_kernel_64.S         |    2 
>  power/hibernate_asm_64.S            |    4 -
>  29 files changed, 306 insertions(+), 213 deletions(-)
> 
> Patchset is based on next-20190708.
> 
> 

-- 
Kees Cook
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
