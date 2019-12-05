Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4258611389A
	for <lists.virtualization@lfdr.de>; Thu,  5 Dec 2019 01:18:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9C7C087FEA;
	Thu,  5 Dec 2019 00:18:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NEEJWltg-Oj3; Thu,  5 Dec 2019 00:18:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 403BE87EEC;
	Thu,  5 Dec 2019 00:18:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 26883C077D;
	Thu,  5 Dec 2019 00:18:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8A849C077D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Dec 2019 00:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 75F2386F42
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Dec 2019 00:18:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1YafB6ppb3_Y
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Dec 2019 00:18:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id F382185C47
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Dec 2019 00:18:30 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id l24so687524pgk.2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 04 Dec 2019 16:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wom0YuEw+sxPN46lShSOJcleDb+6/uebIAUT9UJe6O4=;
 b=TYU9biznX4Fr+oXplt8t6lZVC875R5GdQpDtGyoG7jHn1dhskEBnd09tvZhJGAFU/g
 LrL5kio9op22EkuMbWapAdZnmHsJNSN3VvpSYWblpjxw1xSpBmEfPLeFLApm+7QNnUe1
 b/lOwzkq65DhE5MjKUY1R1NraoVNUwtPyd4uk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wom0YuEw+sxPN46lShSOJcleDb+6/uebIAUT9UJe6O4=;
 b=pLmRyRcU9QSXGUtrfP9FS1sXo2m6fegv/8FWvCa7JBSxsI3pRdC22bfkci6sKSXX7J
 U+7E2r87KK1+kZlwQxLomUGn1xIv588TiBRitaz9/biy5lzGxLgdHHrEGzEwKOAB8K4X
 241Iot21s24Nwvn0ZL48afNZLkO22B9lLiRpa6ymGxIGWpyOYhG6ddakWu/F+bXFy8/N
 5WotT20z+DT3yQ89kej9lRxggHK0XKVeV1aEJrjejzP3ax3g6DTnDo3mQMTH2U30//zr
 toGujzc9MJeP/4hHAFvnuYvJ6FA8LZV8stywWGfZkg1mnvE6aL2UB8ZiCmZvMlXxWQc3
 oLNw==
X-Gm-Message-State: APjAAAWO/oeUFuzGoWxvXooxvPipFWC5ym/DOJsUfLGV3D5u3EENclfv
 WIiqcH6Z3hqUX9xXTVGZ+YBpmw==
X-Google-Smtp-Source: APXvYqx+rdjo7KYD764+cA3j+DYShZXYaqzplHV9aZLeeWqpbwUsyT49bWt0YB2+lFklCCpyLgsBCw==
X-Received: by 2002:aa7:9afb:: with SMTP id y27mr6140094pfp.91.1575504624844; 
 Wed, 04 Dec 2019 16:10:24 -0800 (PST)
Received: from thgarnie.kir.corp.google.com
 ([2620:0:1008:1100:d6ba:ac27:4f7b:28d7])
 by smtp.gmail.com with ESMTPSA id 73sm8422303pgc.13.2019.12.04.16.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 16:10:24 -0800 (PST)
From: Thomas Garnier <thgarnie@chromium.org>
To: kernel-hardening@lists.openwall.com
Subject: [PATCH v10 10/11] x86/paravirt: Adapt assembly for PIE support
Date: Wed,  4 Dec 2019 16:09:47 -0800
Message-Id: <20191205000957.112719-11-thgarnie@chromium.org>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
In-Reply-To: <20191205000957.112719-1-thgarnie@chromium.org>
References: <20191205000957.112719-1-thgarnie@chromium.org>
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

Position Independent Executable (PIE) support will allow to extend the
KASLR randomization range below 0xffffffff80000000.

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
2.24.0.393.g34dc348eaf-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
