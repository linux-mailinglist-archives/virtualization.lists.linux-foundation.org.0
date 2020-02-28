Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C705172CB1
	for <lists.virtualization@lfdr.de>; Fri, 28 Feb 2020 01:01:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 52BB286ACB;
	Fri, 28 Feb 2020 00:01:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C3Ly5W5NPOp2; Fri, 28 Feb 2020 00:01:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5D09686AC7;
	Fri, 28 Feb 2020 00:01:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53D9BC0177;
	Fri, 28 Feb 2020 00:01:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4F3D4C0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 00:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 455E820400
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 00:01:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q1v0mtKwQ72U
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 00:01:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by silver.osuosl.org (Postfix) with ESMTPS id B7229203EA
 for <virtualization@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 00:01:26 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id z12so525074pgl.4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Feb 2020 16:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H9FWlvjeU2XqZhHoJiWspMH4kFGj3K9GjGYd2WRMYmQ=;
 b=oEStjVPt0S31nPacabrXXaqaOo12Uk+r85uXc9Xl7Tu1lXk9HmiONOEKMda7M1yCLl
 DfI6JExzzhDdrzGWYDMCWToyRPzvherlO6BerSNdsLYxiTTSYaVvNUHXPBhmY/g7c40t
 6aZqMcdDUuTRkqEUDTm4BWTIy0OXUsHY+h8Gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H9FWlvjeU2XqZhHoJiWspMH4kFGj3K9GjGYd2WRMYmQ=;
 b=sBB186+HXKNf7Y1wMyCn4sU//NeIZiqU/hFJwlxhZ0TmTM9ya+PNl0I8WCL3pl/M/0
 +f2Sfrux/IP2/JjgiZIHuzXKw+8wJpXhgDIw/YL98NXiviYVcCS2Y4X0TeorFw4N4SYF
 eO9A5+CGgK8cdSp3YH1d5dJBWicM1zi5l4kQ8L0ruUTDeNWBtrxEx9wB8c62NmkPglkv
 HlrWlTFpr3IH1TRp1wQIf7FNEd+Vo+kVCDqrZ2w3S6PR6whSgo0zEp20nqtL7t9XMs4+
 yQhGnLmMSHRyrXMK6DdIccvm8n/TZCUa8NmlftGWaG7LpTDyYJgbesstcEljojPM6k9j
 cPeA==
X-Gm-Message-State: APjAAAXSJpta3bycInAYk/Xlgl783RWueH+wgTr6P5rFsQlB6zQDmuQv
 NC7LLeDVGD2G64jEpN7N69m7qA==
X-Google-Smtp-Source: APXvYqzm3a/ZFJ1l5Nvdz79Gm4AfpVbhjeL86Hhy3RQsCyWjAO+rF4ZDCotN8wJqbSnZ9y96RTh5JA==
X-Received: by 2002:a63:df02:: with SMTP id u2mr1689153pgg.403.1582848086381; 
 Thu, 27 Feb 2020 16:01:26 -0800 (PST)
Received: from thgarnie.kir.corp.google.com
 ([2620:0:1008:1100:6e62:16fa:a60c:1d24])
 by smtp.gmail.com with ESMTPSA id c18sm7314476pgw.17.2020.02.27.16.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 16:01:26 -0800 (PST)
From: Thomas Garnier <thgarnie@chromium.org>
To: kernel-hardening@lists.openwall.com
Subject: [PATCH v11 10/11] x86/paravirt: Adapt assembly for PIE support
Date: Thu, 27 Feb 2020 16:00:55 -0800
Message-Id: <20200228000105.165012-11-thgarnie@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200228000105.165012-1-thgarnie@chromium.org>
References: <20200228000105.165012-1-thgarnie@chromium.org>
MIME-Version: 1.0
Cc: Juergen Gross <jgross@suse.com>, Thomas Hellstrom <thellstrom@vmware.com>,
 keescook@chromium.org, Thomas Garnier <thgarnie@chromium.org>, "VMware,
 Inc." <pv-drivers@vmware.com>, x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, kristen@linux.intel.com,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
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

If PIE is enabled, switch the paravirt assembly constraints to be
compatible. The %c/i constrains generate smaller code so is kept by
default.

Signed-off-by: Thomas Garnier <thgarnie@chromium.org>
Acked-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/paravirt_types.h | 32 +++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index 84812964d3dd..82f7ca22e0ae 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -336,9 +336,32 @@ extern struct paravirt_patch_template pv_ops;
 #define PARAVIRT_PATCH(x)					\
 	(offsetof(struct paravirt_patch_template, x) / sizeof(void *))
 
+#ifdef CONFIG_X86_PIE
+#define paravirt_opptr_call "a"
+#define paravirt_opptr_type "p"
+
+/*
+ * Alternative patching requires a maximum of 7 bytes but the relative call is
+ * only 6 bytes. If PIE is enabled, add an additional nop to the call
+ * instruction to ensure patching is possible.
+ *
+ * Without PIE, the call is reg/mem64:
+ * ff 14 25 68 37 02 82    callq  *0xffffffff82023768
+ *
+ * With PIE, it is relative to %rip and take 1-less byte:
+ * ff 15 fa d9 ff 00       callq  *0xffd9fa(%rip) # <pv_ops+0x30>
+ *
+ */
+#define PARAVIRT_CALL_POST  "nop;"
+#else
+#define paravirt_opptr_call "c"
+#define paravirt_opptr_type "i"
+#define PARAVIRT_CALL_POST  ""
+#endif
+
 #define paravirt_type(op)				\
 	[paravirt_typenum] "i" (PARAVIRT_PATCH(op)),	\
-	[paravirt_opptr] "i" (&(pv_ops.op))
+	[paravirt_opptr] paravirt_opptr_type (&(pv_ops.op))
 #define paravirt_clobber(clobber)		\
 	[paravirt_clobber] "i" (clobber)
 
@@ -377,9 +400,10 @@ int paravirt_disable_iospace(void);
  * offset into the paravirt_patch_template structure, and can therefore be
  * freely converted back into a structure offset.
  */
-#define PARAVIRT_CALL					\
-	ANNOTATE_RETPOLINE_SAFE				\
-	"call *%c[paravirt_opptr];"
+#define PARAVIRT_CALL						\
+	ANNOTATE_RETPOLINE_SAFE					\
+	"call *%" paravirt_opptr_call "[paravirt_opptr];"	\
+	PARAVIRT_CALL_POST
 
 /*
  * These macros are intended to wrap calls through one of the paravirt
-- 
2.25.1.481.gfbce0eb801-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
