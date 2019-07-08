Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C3C627BE
	for <lists.virtualization@lfdr.de>; Mon,  8 Jul 2019 19:54:57 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 19DF228AF;
	Mon,  8 Jul 2019 17:54:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5F7642863
	for <virtualization@lists.linux-foundation.org>;
	Mon,  8 Jul 2019 17:49:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D5AC0880
	for <virtualization@lists.linux-foundation.org>;
	Mon,  8 Jul 2019 17:49:24 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id w24so8643086plp.2
	for <virtualization@lists.linux-foundation.org>;
	Mon, 08 Jul 2019 10:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=u3wADtOhWERBIwfgOKqVInl3i4gu5vwcVNjYQ611JUc=;
	b=Cp2JMiqRMbHHc8yVRj5gwNVXKSXDh307ZJxdfhj5m5wZqxjCcjOB1cq6Hoydsv5OFo
	14RVaNEV9QQ8pm4bi7zWlnTUgO/o0R9Nb9nSi+ekxv0wRSSnm/Ntf2nDLjSDt3fpc+ag
	If9clYeN+kLlkea7uIf7yLK5X+UGvuATfkHc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=u3wADtOhWERBIwfgOKqVInl3i4gu5vwcVNjYQ611JUc=;
	b=DsgilwAnYGYXtN8Gsg1MLctHyBT3hRrqZbuubBCV3K4jx9uHkkNJS2KpubHSsZR5po
	Y3houHW7gquc84BX42GOIcqj3VJ8pvL2SKgDBNWbBdJn0M1ez9vzUDm+f3YJoE8ecUxe
	rsUZ4DARPxEVrPRtPTq+e0njPkvw+ugrnHUYCfOr2vCXvIuHrMPk1R8qS3rI9WuPCq9r
	ndQGSlahyFVAFfzJfSIa2Eu4qVfTRYskzopTBtGqWM4GdteUXFgdMeRZmy889+8L/rdS
	gdBBhSqUUrL8OeGFb20p2AqNiR4p7G916JM8IvwY8FC9dUmoDOex/MkeE9bH+dUBogqo
	DFkA==
X-Gm-Message-State: APjAAAW5KR99NF0dj+wccubF0T/sCxFrb3BaN2xKTwepmh5uVCaH8zgZ
	a76rvBfXtKSTUJ24nOVBcJ0YIQ==
X-Google-Smtp-Source: APXvYqx5LipVNdbKqMBoKjNn4lRTatM0sZZZf8RlaGam+sYAQe4c/KcA1glvKLTNDdd17g2N+PzrMw==
X-Received: by 2002:a17:902:6b02:: with SMTP id
	o2mr24590139plk.99.1562608164453; 
	Mon, 08 Jul 2019 10:49:24 -0700 (PDT)
Received: from skynet.sea.corp.google.com
	([2620:0:1008:1100:c4b5:ec23:d87b:d6d3])
	by smtp.gmail.com with ESMTPSA id
	j1sm20151686pfe.101.2019.07.08.10.49.23
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 08 Jul 2019 10:49:23 -0700 (PDT)
From: Thomas Garnier <thgarnie@chromium.org>
To: kernel-hardening@lists.openwall.com
Subject: [PATCH v8 00/11] x86: PIE support to extend KASLR randomization
Date: Mon,  8 Jul 2019 10:48:53 -0700
Message-Id: <20190708174913.123308-1-thgarnie@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Feng Tang <feng.tang@intel.com>, kristen@linux.intel.com,
	Thomas Garnier <thgarnie@chromium.org>,
	Peter Zijlstra <peterz@infradead.org>,
	virtualization@lists.linux-foundation.org,
	Nadav Amit <namit@vmware.com>, Pavel Machek <pavel@ucw.cz>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Herbert Xu <herbert@gondor.apana.org.au>, x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>, Len Brown <len.brown@intel.com>,
	keescook@chromium.org, Jann Horn <jannh@google.com>,
	Alexios Zavras <alexios.zavras@intel.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>, Alok Kataria <akataria@vmware.com>,
	Juergen Gross <jgross@suse.com>, Maran Wilson <maran.wilson@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>, linux-crypto@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>, Enrico Weigelt <info@metux.net>,
	"David S. Miller" <davem@davemloft.net>
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
 - patch v8 (assembly):
   - Fix issues in crypto changes (thanks to Eric Biggers).
   - Remove unnecessary jump table change.
   - Change author and signoff to chromium email address.
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
 - 1, 3-11: Change in assembly code to be PIE compliant.
 - 2: Add a new _ASM_MOVABS macro to fetch a symbol address generically.

diffstat:
 crypto/aegis128-aesni-asm.S         |    6 +-
 crypto/aegis128l-aesni-asm.S        |    8 +--
 crypto/aegis256-aesni-asm.S         |    6 +-
 crypto/aes-x86_64-asm_64.S          |   45 ++++++++++------
 crypto/aesni-intel_asm.S            |    8 +--
 crypto/aesni-intel_avx-x86_64.S     |    3 -
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
 crypto/sha256-avx2-asm.S            |   18 ++++--
 entry/entry_64.S                    |   16 ++++--
 include/asm/alternative.h           |    6 +-
 include/asm/asm.h                   |    1 
 include/asm/paravirt_types.h        |   25 +++++++--
 include/asm/pm-trace.h              |    2 
 include/asm/processor.h             |    6 +-
 kernel/acpi/wakeup_64.S             |   31 ++++++-----
 kernel/head_64.S                    |   16 +++---
 kernel/relocate_kernel_64.S         |    2 
 power/hibernate_asm_64.S            |    4 -
 29 files changed, 306 insertions(+), 213 deletions(-)

Patchset is based on next-20190708.


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
