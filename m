Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EC333756E
	for <lists.virtualization@lfdr.de>; Thu, 11 Mar 2021 15:23:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D14FD8411E;
	Thu, 11 Mar 2021 14:23:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Czwz6t7cCpu5; Thu, 11 Mar 2021 14:23:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B5C084290;
	Thu, 11 Mar 2021 14:23:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DD84CC0013;
	Thu, 11 Mar 2021 14:23:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BFE8EC000A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Mar 2021 14:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7344431D6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Mar 2021 14:23:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=suse.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gb8wPGEtbKtS
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Mar 2021 14:23:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CEA56431CF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Mar 2021 14:23:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1615472606; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/BOg9FE2LyOwuFPT7IjJCD7FUb4zh5arPwZL+WX0RDM=;
 b=lYC9xkByKo6WT3wmk5wHQUXFXo6jo6LRTu64y60i3Tk1K4r3voASTQzXE6taqM3VTJ2vsb
 jRo9P30Gfl0aTwseTZX2hzYOPv8w9R5lgnjXkmlTMho//0Nx3fJXWRxV2DGcn9Vdh36nbk
 +NReG/j0vR1TcwLn7WkHriSIalKbEHE=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 35538AEAE;
 Thu, 11 Mar 2021 14:23:26 +0000 (UTC)
To: xen-devel@lists.xenproject.org, x86@kernel.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 12/14] x86/paravirt: add new macros PVOP_ALT* supporting
 pvops in ALTERNATIVEs
Date: Thu, 11 Mar 2021 15:23:17 +0100
Message-Id: <20210311142319.4723-13-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210311142319.4723-1-jgross@suse.com>
References: <20210311142319.4723-1-jgross@suse.com>
MIME-Version: 1.0
Cc: Juergen Gross <jgross@suse.com>, "VMware, Inc." <pv-drivers@vmware.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>
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

Instead of using paravirt patching for custom code sequences add
support for using ALTERNATIVE handling combined with paravirt call
patching.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
V3:
- drop ____PVOP_ALT_VCALL() macro
---
 arch/x86/include/asm/paravirt_types.h | 49 ++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index 0afdac83f926..0ed976286d49 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -477,44 +477,91 @@ int paravirt_disable_iospace(void);
 		ret;							\
 	})
 
+#define ____PVOP_ALT_CALL(ret, op, alt, cond, clbr, call_clbr,		\
+			  extra_clbr, ...)				\
+	({								\
+		PVOP_CALL_ARGS;						\
+		PVOP_TEST_NULL(op);					\
+		asm volatile(ALTERNATIVE(paravirt_alt(PARAVIRT_CALL),	\
+					 alt, cond)			\
+			     : call_clbr, ASM_CALL_CONSTRAINT		\
+			     : paravirt_type(op),			\
+			       paravirt_clobber(clbr),			\
+			       ##__VA_ARGS__				\
+			     : "memory", "cc" extra_clbr);		\
+		ret;							\
+	})
+
 #define __PVOP_CALL(rettype, op, ...)					\
 	____PVOP_CALL(PVOP_RETVAL(rettype), op, CLBR_ANY,		\
 		      PVOP_CALL_CLOBBERS, EXTRA_CLOBBERS, ##__VA_ARGS__)
 
+#define __PVOP_ALT_CALL(rettype, op, alt, cond, ...)			\
+	____PVOP_ALT_CALL(PVOP_RETVAL(rettype), op, alt, cond, CLBR_ANY,\
+			  PVOP_CALL_CLOBBERS, EXTRA_CLOBBERS,		\
+			  ##__VA_ARGS__)
+
 #define __PVOP_CALLEESAVE(rettype, op, ...)				\
 	____PVOP_CALL(PVOP_RETVAL(rettype), op.func, CLBR_RET_REG,	\
 		      PVOP_CALLEE_CLOBBERS, , ##__VA_ARGS__)
 
+#define __PVOP_ALT_CALLEESAVE(rettype, op, alt, cond, ...)		\
+	____PVOP_ALT_CALL(PVOP_RETVAL(rettype), op.func, alt, cond,	\
+			  CLBR_RET_REG, PVOP_CALLEE_CLOBBERS, , ##__VA_ARGS__)
+
+
 #define __PVOP_VCALL(op, ...)						\
 	(void)____PVOP_CALL(, op, CLBR_ANY, PVOP_VCALL_CLOBBERS,	\
 		       VEXTRA_CLOBBERS, ##__VA_ARGS__)
 
+#define __PVOP_ALT_VCALL(op, alt, cond, ...)				\
+	(void)____PVOP_ALT_CALL(, op, alt, cond, CLBR_ANY,		\
+				PVOP_VCALL_CLOBBERS, VEXTRA_CLOBBERS,	\
+				##__VA_ARGS__)
+
 #define __PVOP_VCALLEESAVE(op, ...)					\
 	(void)____PVOP_CALL(, op.func, CLBR_RET_REG,			\
-		      PVOP_VCALLEE_CLOBBERS, , ##__VA_ARGS__)
+			    PVOP_VCALLEE_CLOBBERS, , ##__VA_ARGS__)
 
+#define __PVOP_ALT_VCALLEESAVE(op, alt, cond, ...)			\
+	(void)____PVOP_ALT_CALL(, op.func, alt, cond, CLBR_RET_REG,	\
+				PVOP_VCALLEE_CLOBBERS, , ##__VA_ARGS__)
 
 
 #define PVOP_CALL0(rettype, op)						\
 	__PVOP_CALL(rettype, op)
 #define PVOP_VCALL0(op)							\
 	__PVOP_VCALL(op)
+#define PVOP_ALT_CALL0(rettype, op, alt, cond)				\
+	__PVOP_ALT_CALL(rettype, op, alt, cond)
+#define PVOP_ALT_VCALL0(op, alt, cond)					\
+	__PVOP_ALT_VCALL(op, alt, cond)
 
 #define PVOP_CALLEE0(rettype, op)					\
 	__PVOP_CALLEESAVE(rettype, op)
 #define PVOP_VCALLEE0(op)						\
 	__PVOP_VCALLEESAVE(op)
+#define PVOP_ALT_CALLEE0(rettype, op, alt, cond)			\
+	__PVOP_ALT_CALLEESAVE(rettype, op, alt, cond)
+#define PVOP_ALT_VCALLEE0(op, alt, cond)				\
+	__PVOP_ALT_VCALLEESAVE(op, alt, cond)
 
 
 #define PVOP_CALL1(rettype, op, arg1)					\
 	__PVOP_CALL(rettype, op, PVOP_CALL_ARG1(arg1))
 #define PVOP_VCALL1(op, arg1)						\
 	__PVOP_VCALL(op, PVOP_CALL_ARG1(arg1))
+#define PVOP_ALT_VCALL1(op, arg1, alt, cond)				\
+	__PVOP_ALT_VCALL(op, alt, cond, PVOP_CALL_ARG1(arg1))
 
 #define PVOP_CALLEE1(rettype, op, arg1)					\
 	__PVOP_CALLEESAVE(rettype, op, PVOP_CALL_ARG1(arg1))
 #define PVOP_VCALLEE1(op, arg1)						\
 	__PVOP_VCALLEESAVE(op, PVOP_CALL_ARG1(arg1))
+#define PVOP_ALT_CALLEE1(rettype, op, arg1, alt, cond)			\
+	__PVOP_ALT_CALLEESAVE(rettype, op, alt, cond, PVOP_CALL_ARG1(arg1))
+#define PVOP_ALT_VCALLEE1(op, arg1, alt, cond)				\
+	__PVOP_ALT_VCALLEESAVE(op, alt, cond, PVOP_CALL_ARG1(arg1))
 
 
 #define PVOP_CALL2(rettype, op, arg1, arg2)				\
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
