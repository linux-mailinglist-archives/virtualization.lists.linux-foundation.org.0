Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D0A2441B
	for <lists.virtualization@lfdr.de>; Tue, 21 May 2019 01:20:07 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E50EBCCC;
	Mon, 20 May 2019 23:20:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EF352CB5
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 23:20:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6FF92875
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 23:20:01 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id y11so7960906pfm.13
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 16:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ziH51J2YkDxbiEVM2GrMAlpVSd+QVOkC6hl+iSpS1bQ=;
	b=eQRQDPc6uBU2Qk0F/htZOfYUHATfTVBNkYwDN/tGGT85UVF+0kNNU6JxQEi80X2jLd
	nOecMr02fvsUklEjSkgaRZyFW8oTUFJ0vBMXfd8I0clvZdaInAdo9I3e++bv+isAWIAS
	SbVUWwQ2uCxdPrlrZR8tJJBmOkDwJZLP5OV3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ziH51J2YkDxbiEVM2GrMAlpVSd+QVOkC6hl+iSpS1bQ=;
	b=F4kakzlZV3JWRPwOluANHy5VQIhrztko0R2QpwFFx557TZVk7gYgmooxk1IHUNGdd2
	iJFLZfWTS6bZ2dwZpFw8mq1/+d87i8l5zcg/Fytz57dTuhSnoGXS1bH58z2ymAzOaEAd
	4PhZuS/N6nhANq7VADEwa8iyDBgqjYCXTR1UtlmUg/YY9nSyAAeRAx+Sk+S5785j3AOC
	kK6TZlbJY25TEbXjJRCjklgfzYE9ry44eCx67gVArDsRgL0H+Y728pYIchqhozSHZ2ZB
	L5BL6gUKBt7aiCXsHL2Q+I3PksNb0vW62HyqNa0msmqJURV7ozg1xufMe+5alIOBGOcN
	3mOA==
X-Gm-Message-State: APjAAAXdbKlRzOqf1/2cpwDpz5XHxoUglGbL+3NT/4Q2zdWYFGOCy6Ah
	WzuL7FMH2MafgWhtFCQKtW86ew==
X-Google-Smtp-Source: APXvYqyF4jfnvmglKBHVKthuceEzZGxOmZsOsky8xSLS2H68VewsiuHrWgBWYJrlDb7GE/qEMLwOnw==
X-Received: by 2002:a63:317:: with SMTP id 23mr78257345pgd.414.1558394401009; 
	Mon, 20 May 2019 16:20:01 -0700 (PDT)
Received: from skynet.sea.corp.google.com
	([2620:0:1008:1100:c4b5:ec23:d87b:d6d3])
	by smtp.gmail.com with ESMTPSA id
	h13sm19350861pgk.55.2019.05.20.16.19.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 16:20:00 -0700 (PDT)
From: Thomas Garnier <thgarnie@chromium.org>
To: kernel-hardening@lists.openwall.com
Subject: [PATCH v7 00/12] x86: PIE support to extend KASLR randomization
Date: Mon, 20 May 2019 16:19:25 -0700
Message-Id: <20190520231948.49693-1-thgarnie@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Feng Tang <feng.tang@intel.com>, kristen@linux.intel.com,
	Peter Zijlstra <peterz@infradead.org>,
	virtualization@lists.linux-foundation.org,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Jan Beulich <JBeulich@suse.com>, Nadav Amit <namit@vmware.com>,
	Pavel Machek <pavel@ucw.cz>, "H. Peter Anvin" <hpa@zytor.com>,
	Thomas Gleixner <tglx@linutronix.de>, Andi Kleen <ak@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>, x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>, Len Brown <len.brown@intel.com>,
	Jann Horn <jannh@google.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>, Alok Kataria <akataria@vmware.com>,
	Juergen Gross <jgross@suse.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	linux-pm@vger.kernel.org, Maran Wilson <maran.wilson@oracle.com>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Garnier <thgarnie@google.com>
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

Splitting the previous serie in two. This part contains assembly code
changes required for PIE but without any direct dependencies with the
rest of the patchset.

Changes:
 - patch v7 (assembly):
   - Split patchset and reorder changes.
 - patch v6:
   - Rebase on latest changes in jump tables and crypto.
   - Fix wording on couple commits.
   - Revisit checkpatch warnings.
   - Moving to @chromium.org.
 - patch v5:
   - Adapt new crypto modules for PIE.
   - Improve per-cpu commit message.
   - Fix xen 32-bit build error with .quad.
   - Remove extra code for ftrace.
 - patch v4:
   - Simplify early boot by removing global variables.
   - Modify the mcount location script for __mcount_loc intead of the address
     read in the ftrace implementation.
   - Edit commit description to explain better where the kernel can be located.
   - Streamlined the testing done on each patch proposal. Always testing
     hibernation, suspend, ftrace and kprobe to ensure no regressions.
 - patch v3:
   - Update on message to describe longer term PIE goal.
   - Minor change on ftrace if condition.
   - Changed code using xchgq.
 - patch v2:
   - Adapt patch to work post KPTI and compiler changes
   - Redo all performance testing with latest configs and compilers
   - Simplify mov macro on PIE (MOVABS now)
   - Reduce GOT footprint
 - patch v1:
   - Simplify ftrace implementation.
   - Use gcc mstack-protector-guard-reg=%gs with PIE when possible.
 - rfc v3:
   - Use --emit-relocs instead of -pie to reduce dynamic relocation space on
     mapped memory. It also simplifies the relocation process.
   - Move the start the module section next to the kernel. Remove the need for
     -mcmodel=large on modules. Extends module space from 1 to 2G maximum.
   - Support for XEN PVH as 32-bit relocations can be ignored with
     --emit-relocs.
   - Support for GOT relocations previously done automatically with -pie.
   - Remove need for dynamic PLT in modules.
   - Support dymamic GOT for modules.
 - rfc v2:
   - Add support for global stack cookie while compiler default to fs without
     mcmodel=kernel
   - Change patch 7 to correctly jump out of the identity mapping on kexec load
     preserve.

These patches make some of the changes necessary to build the kernel as
Position Independent Executable (PIE) on x86_64. Another patchset will
add the PIE option and larger architecture changes.

The patches:
 - 1-2, 4-12: Change in assembly code to be PIE compliant.
 - 3: Add a new _ASM_MOVABS macro to fetch a symbol address generically.

diffstat:
 crypto/aegis128-aesni-asm.S         |    6 +-
 crypto/aegis128l-aesni-asm.S        |    8 +--
 crypto/aegis256-aesni-asm.S         |    6 +-
 crypto/aes-x86_64-asm_64.S          |   45 ++++++++++------
 crypto/aesni-intel_asm.S            |    8 +--
 crypto/camellia-aesni-avx-asm_64.S  |   42 +++++++--------
 crypto/camellia-aesni-avx2-asm_64.S |   44 ++++++++--------
 crypto/camellia-x86_64-asm_64.S     |    8 +--
 crypto/cast5-avx-x86_64-asm_64.S    |   50 ++++++++++--------
 crypto/cast6-avx-x86_64-asm_64.S    |   44 +++++++++-------
 crypto/des3_ede-asm_64.S            |   96 ++++++++++++++++++++++++------------
 crypto/ghash-clmulni-intel_asm.S    |    4 -
 crypto/glue_helper-asm-avx.S        |    4 -
 crypto/glue_helper-asm-avx2.S       |    6 +-
 crypto/morus1280-avx2-asm.S         |    4 -
 crypto/morus1280-sse2-asm.S         |    8 +--
 crypto/morus640-sse2-asm.S          |    6 +-
 crypto/sha256-avx2-asm.S            |   23 +++++---
 entry/entry_64.S                    |   16 ++++--
 include/asm/alternative.h           |    6 +-
 include/asm/asm.h                   |    1 
 include/asm/jump_label.h            |    8 +--
 include/asm/paravirt_types.h        |   12 +++-
 include/asm/pm-trace.h              |    2 
 include/asm/processor.h             |    6 +-
 kernel/acpi/wakeup_64.S             |   31 ++++++-----
 kernel/head_64.S                    |   16 +++---
 kernel/relocate_kernel_64.S         |    2 
 power/hibernate_asm_64.S            |    4 -
 29 files changed, 299 insertions(+), 217 deletions(-)

Patchset is based on next-20190515.


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
