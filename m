Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5092FD204
	for <lists.virtualization@lfdr.de>; Wed, 20 Jan 2021 14:56:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 540FB86A03;
	Wed, 20 Jan 2021 13:56:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vQ3ri166ibey; Wed, 20 Jan 2021 13:56:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5387C86AA9;
	Wed, 20 Jan 2021 13:56:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 42614C013A;
	Wed, 20 Jan 2021 13:56:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C641AC088B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 13:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B501E86A5C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 13:56:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oUO1Ru2mvAwE
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 13:56:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3BFD3863D9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 13:56:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1611150962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HLdbfKKd8U3U0mpjOuCtG4D+mEzxepybK1454rxDb0I=;
 b=WiWvsvScHDlkgfuMIqC/r2FxIyV9Qk2TprYUF/4XXnbNgBgnKJhNUc9iSIllMbJXL7IABr
 410l3cFN5kQJuHqZzMq3pkQ2MRWdTPdzN59bESvABNgZuCsJyaqOqQlxmQmzNVogv3S+4N
 GexXYpxmTkBkCzr9lGPefaO8SalNLeY=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C33F6B707;
 Wed, 20 Jan 2021 13:56:02 +0000 (UTC)
To: xen-devel@lists.xenproject.org, x86@kernel.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com
Subject: [PATCH v4 11/15] x86/paravirt: simplify paravirt macros
Date: Wed, 20 Jan 2021 14:55:51 +0100
Message-Id: <20210120135555.32594-12-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210120135555.32594-1-jgross@suse.com>
References: <20210120135555.32594-1-jgross@suse.com>
MIME-Version: 1.0
Cc: Juergen Gross <jgross@suse.com>, "VMware, Inc." <pv-drivers@vmware.com>,
 Nick Desaulniers <ndesaulniers@google.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Nathan Chancellor <natechancellor@gmail.com>
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
From: Juergen Gross via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

The central pvops call macros ____PVOP_CALL() and ____PVOP_VCALL() are
looking very similar now.

The main differences are using PVOP_VCALL_ARGS or PVOP_CALL_ARGS, which
are identical, and the return value handling.

So drop PVOP_VCALL_ARGS and instead of ____PVOP_VCALL() just use
(void)____PVOP_CALL(long, ...).

Note that it isn't easily possible to just redefine ____PVOP_VCALL()
to use ____PVOP_CALL() instead, as this would require further hiding of
commas in macro parameters.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch

V4:
- fix build warnings with clang (kernel test robot)
---
 arch/x86/include/asm/paravirt_types.h | 41 ++++++++-------------------
 1 file changed, 12 insertions(+), 29 deletions(-)

diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index 42f9eef84131..45bd21647dd8 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -408,11 +408,9 @@ int paravirt_disable_iospace(void);
  * makes sure the incoming and outgoing types are always correct.
  */
 #ifdef CONFIG_X86_32
-#define PVOP_VCALL_ARGS							\
+#define PVOP_CALL_ARGS							\
 	unsigned long __eax = __eax, __edx = __edx, __ecx = __ecx;
 
-#define PVOP_CALL_ARGS			PVOP_VCALL_ARGS
-
 #define PVOP_CALL_ARG1(x)		"a" ((unsigned long)(x))
 #define PVOP_CALL_ARG2(x)		"d" ((unsigned long)(x))
 #define PVOP_CALL_ARG3(x)		"c" ((unsigned long)(x))
@@ -428,12 +426,10 @@ int paravirt_disable_iospace(void);
 #define VEXTRA_CLOBBERS
 #else  /* CONFIG_X86_64 */
 /* [re]ax isn't an arg, but the return val */
-#define PVOP_VCALL_ARGS						\
+#define PVOP_CALL_ARGS						\
 	unsigned long __edi = __edi, __esi = __esi,		\
 		__edx = __edx, __ecx = __ecx, __eax = __eax;
 
-#define PVOP_CALL_ARGS		PVOP_VCALL_ARGS
-
 #define PVOP_CALL_ARG1(x)		"D" ((unsigned long)(x))
 #define PVOP_CALL_ARG2(x)		"S" ((unsigned long)(x))
 #define PVOP_CALL_ARG3(x)		"d" ((unsigned long)(x))
@@ -458,59 +454,46 @@ int paravirt_disable_iospace(void);
 #define PVOP_TEST_NULL(op)	((void)pv_ops.op)
 #endif
 
-#define PVOP_RETMASK(rettype)						\
+#define PVOP_RETVAL(rettype)						\
 	({	unsigned long __mask = ~0UL;				\
+		BUILD_BUG_ON(sizeof(rettype) > sizeof(unsigned long));	\
 		switch (sizeof(rettype)) {				\
 		case 1: __mask =       0xffUL; break;			\
 		case 2: __mask =     0xffffUL; break;			\
 		case 4: __mask = 0xffffffffUL; break;			\
 		default: break;						\
 		}							\
-		__mask;							\
+		__mask & __eax;						\
 	})
 
 
-#define ____PVOP_CALL(rettype, op, clbr, call_clbr, extra_clbr, ...)	\
+#define ____PVOP_CALL(ret, op, clbr, call_clbr, extra_clbr, ...)	\
 	({								\
 		PVOP_CALL_ARGS;						\
 		PVOP_TEST_NULL(op);					\
-		BUILD_BUG_ON(sizeof(rettype) > sizeof(unsigned long));	\
 		asm volatile(paravirt_alt(PARAVIRT_CALL)		\
 			     : call_clbr, ASM_CALL_CONSTRAINT		\
 			     : paravirt_type(op),			\
 			       paravirt_clobber(clbr),			\
 			       ##__VA_ARGS__				\
 			     : "memory", "cc" extra_clbr);		\
-		(rettype)(__eax & PVOP_RETMASK(rettype));		\
+		ret;							\
 	})
 
 #define __PVOP_CALL(rettype, op, ...)					\
-	____PVOP_CALL(rettype, op, CLBR_ANY, PVOP_CALL_CLOBBERS,	\
-		      EXTRA_CLOBBERS, ##__VA_ARGS__)
+	____PVOP_CALL(PVOP_RETVAL(rettype), op, CLBR_ANY,		\
+		      PVOP_CALL_CLOBBERS, EXTRA_CLOBBERS, ##__VA_ARGS__)
 
 #define __PVOP_CALLEESAVE(rettype, op, ...)				\
-	____PVOP_CALL(rettype, op.func, CLBR_RET_REG,			\
+	____PVOP_CALL(PVOP_RETVAL(rettype), op.func, CLBR_RET_REG,	\
 		      PVOP_CALLEE_CLOBBERS, , ##__VA_ARGS__)
 
-
-#define ____PVOP_VCALL(op, clbr, call_clbr, extra_clbr, ...)		\
-	({								\
-		PVOP_VCALL_ARGS;					\
-		PVOP_TEST_NULL(op);					\
-		asm volatile(paravirt_alt(PARAVIRT_CALL)		\
-			     : call_clbr, ASM_CALL_CONSTRAINT		\
-			     : paravirt_type(op),			\
-			       paravirt_clobber(clbr),			\
-			       ##__VA_ARGS__				\
-			     : "memory", "cc" extra_clbr);		\
-	})
-
 #define __PVOP_VCALL(op, ...)						\
-	____PVOP_VCALL(op, CLBR_ANY, PVOP_VCALL_CLOBBERS,		\
+	(void)____PVOP_CALL(, op, CLBR_ANY, PVOP_VCALL_CLOBBERS,	\
 		       VEXTRA_CLOBBERS, ##__VA_ARGS__)
 
 #define __PVOP_VCALLEESAVE(op, ...)					\
-	____PVOP_VCALL(op.func, CLBR_RET_REG,				\
+	(void)____PVOP_CALL(, op.func, CLBR_RET_REG,			\
 		      PVOP_VCALLEE_CLOBBERS, , ##__VA_ARGS__)
 
 
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
