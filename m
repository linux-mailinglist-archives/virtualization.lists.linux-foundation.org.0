Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 61091627BF
	for <lists.virtualization@lfdr.de>; Mon,  8 Jul 2019 19:55:06 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 635C828BE;
	Mon,  8 Jul 2019 17:54:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 849C02863
	for <virtualization@lists.linux-foundation.org>;
	Mon,  8 Jul 2019 17:49:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 303FA8C0
	for <virtualization@lists.linux-foundation.org>;
	Mon,  8 Jul 2019 17:49:41 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id q4so8058336pgj.8
	for <virtualization@lists.linux-foundation.org>;
	Mon, 08 Jul 2019 10:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=zk4/OPGo86ftMBdGr+5okqxNxr1xkvSdReLqcT2u18A=;
	b=XsOl+a4RAnXCWhNEVRPeVMhX4ouKgXngCNqnfUxMciMui+pL4rHn4H1iwCHUjJmJIC
	2ElaPOflyt6/Xi//KGH/Fy7duud9Gy23ek+J89nJPK8tVN1aiJv5zeg2ri/hk0NA12K1
	l48hzBjCqkjo8vewPUND3AMeDcQR6+1oul5jU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zk4/OPGo86ftMBdGr+5okqxNxr1xkvSdReLqcT2u18A=;
	b=sReN75P8vz4fnjtCK8Vfr5YiEm2/ocXcNyf55tt4abNHSVvQ1CnV+cOa2J6W9rLxL/
	H7STYwzL793Z3XQUj9BKioy5YMp08AkzQOu+fMt13ogUytxIDfuwqUzjjI+Lt1jZqaI/
	VJZR3jpZB+wVePcrqwnI79jyCJ7znV9Kag0gOZZlwYVgQu/G9YwbEZP3a8ygJWOLQZVr
	q92bNT1eYtxIvB/ZXBgKHXpRD9YCM+bku37BIr9qN//M8opzwrn3kN63eIe0mn0JJKOo
	zRjzKr3M2gZaGBTH/4rJEQh0CgqyHJaxmWr5LP4M+Fsroin/R45WLRZEemoR3HFw849C
	gfgQ==
X-Gm-Message-State: APjAAAU9Ro4ScuKB/JuEyiJ8iXwx+dvcnIl/WxMYNbQmYTGAjunHjYmY
	PbWwJOBTXhIXTLTq2NZMW2aEEQ==
X-Google-Smtp-Source: APXvYqwGon64A3Eg43O0xpcjziuFJrMuP/ARJjBIDsIb1lPDikUr28nYvEkK1nyoH64klte1o9Y66Q==
X-Received: by 2002:a63:7e1d:: with SMTP id z29mr25328202pgc.346.1562608180745;
	Mon, 08 Jul 2019 10:49:40 -0700 (PDT)
Received: from skynet.sea.corp.google.com
	([2620:0:1008:1100:c4b5:ec23:d87b:d6d3])
	by smtp.gmail.com with ESMTPSA id
	j1sm20151686pfe.101.2019.07.08.10.49.40
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 08 Jul 2019 10:49:40 -0700 (PDT)
From: Thomas Garnier <thgarnie@chromium.org>
To: kernel-hardening@lists.openwall.com
Subject: [PATCH v8 10/11] x86/paravirt: Adapt assembly for PIE support
Date: Mon,  8 Jul 2019 10:49:03 -0700
Message-Id: <20190708174913.123308-11-thgarnie@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190708174913.123308-1-thgarnie@chromium.org>
References: <20190708174913.123308-1-thgarnie@chromium.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>, keescook@chromium.org,
	Thomas Garnier <thgarnie@chromium.org>, x86@kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	kristen@linux.intel.com, "H. Peter Anvin" <hpa@zytor.com>,
	Alok Kataria <akataria@vmware.com>, Thomas Gleixner <tglx@linutronix.de>
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

if PIE is enabled, switch the paravirt assembly constraints to be
compatible. The %c/i constrains generate smaller code so is kept by
default.

Position Independent Executable (PIE) support will allow to extend the
KASLR randomization range below 0xffffffff80000000.

Signed-off-by: Thomas Garnier <thgarnie@chromium.org>
Acked-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/paravirt_types.h | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index 946f8f1f1efc..5ec59abc5cb5 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -343,9 +343,25 @@ extern struct paravirt_patch_template pv_ops;
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
+ * */
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
 
@@ -384,9 +400,10 @@ int paravirt_disable_iospace(void);
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
2.22.0.410.gd8fdbe21b5-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
