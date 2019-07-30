Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACAD7B334
	for <lists.virtualization@lfdr.de>; Tue, 30 Jul 2019 21:25:32 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 72AFA3303;
	Tue, 30 Jul 2019 19:24:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 112833276
	for <virtualization@lists.linux-foundation.org>;
	Tue, 30 Jul 2019 19:13:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AF8A3A8
	for <virtualization@lists.linux-foundation.org>;
	Tue, 30 Jul 2019 19:13:24 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id f20so21322526pgj.0
	for <virtualization@lists.linux-foundation.org>;
	Tue, 30 Jul 2019 12:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4p7Yl4EvALrNapOIPblFQ4RqIFxBJYtmcwuhdJ36a4M=;
	b=gqg94NNJOdf9cHSR+XH6US+L0jKiqTwG0Xmx1oLuP1Hhp+nDgjGFTPn60im+Ecit12
	y/IVI2h60aZld1+y9XWSydA3vMe0xeJM9dR6rAMy+Kp7VanoIic5nQjtZLeRn6MaGJms
	8PRL5H4oh61RS+rUbxcD5n83K03BRRSwK4xJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4p7Yl4EvALrNapOIPblFQ4RqIFxBJYtmcwuhdJ36a4M=;
	b=lqThBTUKRnSIUI2sdnJwLQnXZa2aQA4/zhqIKvF3z5Helg1HLWRZGDvSf3XqXBTY+3
	Q1F8VOf/d7siRyzSj82Gb6xa3EWyP6oVWiLw0/rYmgVYR5JSpnDSeKFm8lE4L/b+d6Rh
	BneuPD57csObKESQgl/Jkc8kaEKMvM3iBOSaqXuTS5XDqGV43nsfxcrXUp+DDYS6qNWy
	VF4sRatmOFgpUv+7c9jZBJu1UIG/eFtKdienATdfBlvSgPzqRKk+BnjonvYfREcawJ4k
	3UHR+SKbc6e9xmlO6BoFsPfa1jHV9USwoDjRiC95ZILl5W3Gwc4mhaOz3GOE8JTF0njD
	qJvw==
X-Gm-Message-State: APjAAAUqWm1vhrmSscAlonei4soxInxkI8LAMoVgCMoK/yyxTarUBtLR
	Jmn5tZs66WCe7a8tLjo67AdVkQ==
X-Google-Smtp-Source: APXvYqwoE5YtV9czMWqYh5jaOXzzNfppyGGX1LntKX22Zkz6VcJhYSb1VjmmI91pfMMS60cxTSLgPQ==
X-Received: by 2002:aa7:9407:: with SMTP id x7mr44914613pfo.163.1564514004448; 
	Tue, 30 Jul 2019 12:13:24 -0700 (PDT)
Received: from skynet.sea.corp.google.com
	([2620:0:1008:1100:c4b5:ec23:d87b:d6d3])
	by smtp.gmail.com with ESMTPSA id
	n89sm84649540pjc.0.2019.07.30.12.13.23
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 30 Jul 2019 12:13:23 -0700 (PDT)
From: Thomas Garnier <thgarnie@chromium.org>
To: kernel-hardening@lists.openwall.com
Subject: [PATCH v9 10/11] x86/paravirt: Adapt assembly for PIE support
Date: Tue, 30 Jul 2019 12:12:54 -0700
Message-Id: <20190730191303.206365-11-thgarnie@chromium.org>
X-Mailer: git-send-email 2.22.0.770.g0f2c4a37fd-goog
In-Reply-To: <20190730191303.206365-1-thgarnie@chromium.org>
References: <20190730191303.206365-1-thgarnie@chromium.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>, Thomas Hellstrom <thellstrom@vmware.com>,
	keescook@chromium.org, Thomas Garnier <thgarnie@chromium.org>,
	"VMware, Inc." <pv-drivers@vmware.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	kristen@linux.intel.com, "H. Peter Anvin" <hpa@zytor.com>,
	Thomas Gleixner <tglx@linutronix.de>
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
index 70b654f3ffe5..fd7dc37d0010 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -338,9 +338,25 @@ extern struct paravirt_patch_template pv_ops;
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
 
@@ -379,9 +395,10 @@ int paravirt_disable_iospace(void);
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
2.22.0.770.g0f2c4a37fd-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
