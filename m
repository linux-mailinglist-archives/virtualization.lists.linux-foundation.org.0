Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF862441C
	for <lists.virtualization@lfdr.de>; Tue, 21 May 2019 01:20:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 45B97CCA;
	Mon, 20 May 2019 23:20:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 18260CB5
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 23:20:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BF95A821
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 23:20:20 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id c6so7966544pfa.10
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 16:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=M1E8RaUn9zcJYuZZG/7uL4HyNdEDRlNB8oeiw9QadoE=;
	b=BcEzpaCtHDeErP/BWLjRyK7fBTLMOKLcQuvK1NL+Ewf75ZVTEmchKagvJas138fFpL
	etBB19RzMP4xlK44gIOaNkXNur2K5KlwyPYFy+UCAR8CYMqPnPkHC5ZRIuwT9tVZI1X7
	SEpRCJTIhgZIMaMDFFfQ6unPUoEFaArraP16M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=M1E8RaUn9zcJYuZZG/7uL4HyNdEDRlNB8oeiw9QadoE=;
	b=fKkO/wErfx2ztYxXKAzG+Mhd23BceJthkNY3DtHLuXC8bP/ycp4SPLXD4NLro8kg16
	ybhTRfuuJPvew9LPWEfFEl/Z1nSb36mmMz8TqfA8jlwPd1Mgxx0iIgc2UHhARihoXs+V
	7eAhMOvNjPfvat48pCsPaBt+EyH5i04Bh0d48LOG/jNo+GHyh77wI/PcfeAKNDXAhcmK
	VlCEks9ml8TcUp9qvhu1w1VjWiIYLqm+K9KwH0cpBzOKdvcefJWhwLXgpG8gHndJ0KGi
	H2voI/pOvL10zISLtWkhuCEVNDX5AUWFe0lhtbdqnpgM3yZjmlAWnzmtCP2x4Qj5Vav5
	khSg==
X-Gm-Message-State: APjAAAUP582YuxykQR/WhQVIdgsdA2h6HWyvgmmygyMz+E+o9Pkt/ce3
	sq6VEcnETE637LwMeFkIHN/hig==
X-Google-Smtp-Source: APXvYqyT2kryQV+6jF2IYoOf+x3y5b6AlPsCieYaesFkPafg3IMH+szJ+l/D5ocyk156zDt8vQJpkA==
X-Received: by 2002:a63:730f:: with SMTP id o15mr78268823pgc.315.1558394420454;
	Mon, 20 May 2019 16:20:20 -0700 (PDT)
Received: from skynet.sea.corp.google.com
	([2620:0:1008:1100:c4b5:ec23:d87b:d6d3])
	by smtp.gmail.com with ESMTPSA id
	h13sm19350861pgk.55.2019.05.20.16.20.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 16:20:20 -0700 (PDT)
From: Thomas Garnier <thgarnie@chromium.org>
To: kernel-hardening@lists.openwall.com
Subject: [PATCH v7 11/12] x86/paravirt: Adapt assembly for PIE support
Date: Mon, 20 May 2019 16:19:36 -0700
Message-Id: <20190520231948.49693-12-thgarnie@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190520231948.49693-1-thgarnie@chromium.org>
References: <20190520231948.49693-1-thgarnie@chromium.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, Thomas Garnier <thgarnie@google.com>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	kristen@linux.intel.com, "H. Peter Anvin" <hpa@zytor.com>,
	Alok Kataria <akataria@vmware.com>,
	virtualization@lists.linux-foundation.org,
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

From: Thomas Garnier <thgarnie@google.com>

if PIE is enabled, switch the paravirt assembly constraints to be
compatible. The %c/i constrains generate smaller code so is kept by
default.

Position Independent Executable (PIE) support will allow to extend the
KASLR randomization range below 0xffffffff80000000.

Signed-off-by: Thomas Garnier <thgarnie@google.com>
---
 arch/x86/include/asm/paravirt_types.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index 2474e434a6f7..93be18bdb63e 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -343,9 +343,17 @@ extern struct paravirt_patch_template pv_ops;
 #define PARAVIRT_PATCH(x)					\
 	(offsetof(struct paravirt_patch_template, x) / sizeof(void *))
 
+#ifdef CONFIG_X86_PIE
+#define paravirt_opptr_call "a"
+#define paravirt_opptr_type "p"
+#else
+#define paravirt_opptr_call "c"
+#define paravirt_opptr_type "i"
+#endif
+
 #define paravirt_type(op)				\
 	[paravirt_typenum] "i" (PARAVIRT_PATCH(op)),	\
-	[paravirt_opptr] "i" (&(pv_ops.op))
+	[paravirt_opptr] paravirt_opptr_type (&(pv_ops.op))
 #define paravirt_clobber(clobber)		\
 	[paravirt_clobber] "i" (clobber)
 
@@ -393,7 +401,7 @@ int paravirt_disable_iospace(void);
  */
 #define PARAVIRT_CALL					\
 	ANNOTATE_RETPOLINE_SAFE				\
-	"call *%c[paravirt_opptr];"
+	"call *%" paravirt_opptr_call "[paravirt_opptr];"
 
 /*
  * These macros are intended to wrap calls through one of the paravirt
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
