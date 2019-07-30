Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A267B333
	for <lists.virtualization@lfdr.de>; Tue, 30 Jul 2019 21:25:22 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3A5DF3300;
	Tue, 30 Jul 2019 19:24:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 88D053276
	for <virtualization@lists.linux-foundation.org>;
	Tue, 30 Jul 2019 19:13:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 125B1A8
	for <virtualization@lists.linux-foundation.org>;
	Tue, 30 Jul 2019 19:13:09 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id t132so30541671pgb.9
	for <virtualization@lists.linux-foundation.org>;
	Tue, 30 Jul 2019 12:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PQpQB1xhGd1BWNwCOVPVq65dOaaamVfa0p9XxE9K8UE=;
	b=UeEkx54frGpuY2a5hI6uujVV6CP+NOOrqZjevpUoKoJ93cmYNk/k3rMiq3AadGoCKK
	4u7ZW5L9P5D/w1F6ZopTCab2PdKgv5sovzVTiDlesGwqHNwk1iQ59Z1CIqJUVPimrjCH
	2d2E01pLBsNwq9CrfIuERHJQKh4JgFunTybsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PQpQB1xhGd1BWNwCOVPVq65dOaaamVfa0p9XxE9K8UE=;
	b=GzUWfD9PSd395z5nUTkNCAPJkiMUabaVfOd/bSCDDJE75mbBI4RXudrBhdfM0IfRiX
	qGS2WVhrn9ou4O/8mKFrKNSMktmB6gSv2/r4KEhq01quP+wqQQ0vWIiNaAa7+FP/YCs8
	2AyZVeaDj6X3jwNUWO27rvpAYcR40UuRtPgozqTlkB3cZfH7Oxwslb0znTROAcqQsCGc
	yhWz2Srjzlsks0S9XIamipe4AyKkk8umoEYuHCmjD7bX3udMLruDWtrBexc7X87Vp+Uk
	V4XhRaU+smrRJy79W+wDvxuW2ATaz29pkkXAH9/wP8E1++fDorpaWXBffo0jDVRmkLb/
	et1Q==
X-Gm-Message-State: APjAAAWCnGbOCbMGfINg6VLdb1ONKRw3MxwvMDeEljyl/TA+xo7mHO4B
	ovN1WyJ+uFmyWV1zSNdRmObGog==
X-Google-Smtp-Source: APXvYqwcn2k0Dv3q6ck7IZ44pYsx+KVg4rymizIuUGPzamZY74Xu3UwxOdhjJWwI8/DCuTdbmMo2qQ==
X-Received: by 2002:a63:8a49:: with SMTP id y70mr15370050pgd.271.1564513988658;
	Tue, 30 Jul 2019 12:13:08 -0700 (PDT)
Received: from skynet.sea.corp.google.com
	([2620:0:1008:1100:c4b5:ec23:d87b:d6d3])
	by smtp.gmail.com with ESMTPSA id
	n89sm84649540pjc.0.2019.07.30.12.13.07
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 30 Jul 2019 12:13:08 -0700 (PDT)
From: Thomas Garnier <thgarnie@chromium.org>
To: kernel-hardening@lists.openwall.com
Subject: [PATCH v9 00/11] x86: PIE support to extend KASLR randomization
Date: Tue, 30 Jul 2019 12:12:44 -0700
Message-Id: <20190730191303.206365-1-thgarnie@chromium.org>
X-Mailer: git-send-email 2.22.0.770.g0f2c4a37fd-goog
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Feng Tang <feng.tang@intel.com>, kristen@linux.intel.com,
	Thomas Garnier <thgarnie@chromium.org>, "VMware,
	Inc." <pv-drivers@vmware.com>, virtualization@lists.linux-foundation.org,
	Nadav Amit <namit@vmware.com>, Pavel Machek <pavel@ucw.cz>,
	"H. Peter Anvin" <hpa@zytor.com>, Thomas Hellstrom <thellstrom@vmware.com>,
	Herbert Xu <herbert@gondor.apana.org.au>, x86@kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Len Brown <len.brown@intel.com>,
	keescook@chromium.org, Jann Horn <jannh@google.com>,
	Alexios Zavras <alexios.zavras@intel.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Allison Randal <allison@lohutok.net>, Juergen Gross <jgross@suse.com>,
	Maran Wilson <maran.wilson@oracle.com>, linux-pm@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
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

Minor changes based on feedback and rebase from v8.

Splitting the previous serie in two. This part contains assembly code
changes required for PIE but without any direct dependencies with the
rest of the patchset.

Changes:
 - patch v9 (assembly):
   - Moved to relative reference for sync_core based on feedback.
   - x86/crypto had multiple algorithms deleted, removed PIE changes to them.
   - fix typo on comment end line.
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
 23 files changed, 261 insertions(+), 181 deletions(-)

Patchset is based on next-20190729.


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
