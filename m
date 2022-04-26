Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D5450FF47
	for <lists.virtualization@lfdr.de>; Tue, 26 Apr 2022 15:40:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BC4F8294A;
	Tue, 26 Apr 2022 13:40:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1mD9-bBTxQ1Y; Tue, 26 Apr 2022 13:40:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D43BE82BC8;
	Tue, 26 Apr 2022 13:40:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 40DA9C0081;
	Tue, 26 Apr 2022 13:40:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6FF98C002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Apr 2022 13:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E80C82D0F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Apr 2022 13:40:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cvnwsduWMPJ5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Apr 2022 13:40:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BC5882CCA
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Apr 2022 13:40:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 085AD1F388;
 Tue, 26 Apr 2022 13:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1650980427; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GG2/24loSbPlV806594gWkld0KggttOumq+zKG7ktIg=;
 b=iCatdcTkIdF9yVZmiEFGO6jxUleCkjmBzcA4j8AtRDE8PRGhttdcZVsGvGPTPFpXmFtjod
 drCYBMBhGEP0vsH1ShSavOYO91HFx4nrvNBlzFA6Pw1snBnOZmIbrNzLpnpcUfkfOPuRpo
 wojlzerPy/lLPxqnsDksaJe8AiZcxc8=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5214813AE0;
 Tue, 26 Apr 2022 13:40:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qLK/Ekr2Z2ImNQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 26 Apr 2022 13:40:26 +0000
To: linux-kernel@vger.kernel.org, x86@kernel.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux-foundation.org
Subject: [PATCH 1/2] kernel: add platform_has() infrastructure
Date: Tue, 26 Apr 2022 15:40:20 +0200
Message-Id: <20220426134021.11210-2-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426134021.11210-1-jgross@suse.com>
References: <20220426134021.11210-1-jgross@suse.com>
MIME-Version: 1.0
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Dexuan Cui <decui@microsoft.com>, Christoph Hellwig <hch@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Juergen Gross <jgross@suse.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>,
 Sven Schnelle <svens@linux.ibm.com>
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

Add a simple infrastructure for setting, resetting and querying
platform feature flags.

Flags can be either global or architecture specific.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 MAINTAINERS                            |  8 +++++++
 include/asm-generic/Kbuild             |  1 +
 include/asm-generic/platform-feature.h |  8 +++++++
 include/linux/platform-feature.h       | 29 ++++++++++++++++++++++++++
 kernel/Makefile                        |  2 +-
 kernel/platform-feature.c              |  7 +++++++
 6 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 include/asm-generic/platform-feature.h
 create mode 100644 include/linux/platform-feature.h
 create mode 100644 kernel/platform-feature.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 5e8c2f611766..eb943f089eda 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15650,6 +15650,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.yaml
 F:	drivers/iio/chemical/pms7003.c
 
+PLATFORM FEATURE INFRASTRUCTURE
+M:	Juergen Gross <jgross@suse.com>
+S:	Maintained
+F:	arch/*/include/asm/platform-feature.h
+F:	include/asm-generic/platform-feature.h
+F:	include/linux/platform-feature.h
+F:	kernel/platform-feature.c
+
 PLDMFW LIBRARY
 M:	Jacob Keller <jacob.e.keller@intel.com>
 S:	Maintained
diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuild
index 302506bbc2a4..8e47d483b524 100644
--- a/include/asm-generic/Kbuild
+++ b/include/asm-generic/Kbuild
@@ -44,6 +44,7 @@ mandatory-y += msi.h
 mandatory-y += pci.h
 mandatory-y += percpu.h
 mandatory-y += pgalloc.h
+mandatory-y += platform-feature.h
 mandatory-y += preempt.h
 mandatory-y += rwonce.h
 mandatory-y += sections.h
diff --git a/include/asm-generic/platform-feature.h b/include/asm-generic/platform-feature.h
new file mode 100644
index 000000000000..4b0af3d51588
--- /dev/null
+++ b/include/asm-generic/platform-feature.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_GENERIC_PLATFORM_FEATURE_H
+#define _ASM_GENERIC_PLATFORM_FEATURE_H
+
+/* Number of arch specific feature flags. */
+#define PLATFORM_ARCH_FEAT_N	0
+
+#endif /* _ASM_GENERIC_PLATFORM_FEATURE_H */
diff --git a/include/linux/platform-feature.h b/include/linux/platform-feature.h
new file mode 100644
index 000000000000..df393d502a4f
--- /dev/null
+++ b/include/linux/platform-feature.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _PLATFORM_FEATURE_H
+#define _PLATFORM_FEATURE_H
+
+#include <linux/bitops.h>
+#include <asm/platform-feature.h>
+
+/* The platform features are starting with the architecture specific ones. */
+#define PLATFORM_FEAT_N				(0 + PLATFORM_ARCH_FEAT_N)
+
+#define PLATFORM_FEAT_ARRAY_SZ	BITS_TO_LONGS(PLATFORM_FEAT_N)
+extern unsigned long platform_features[PLATFORM_FEAT_ARRAY_SZ];
+
+static inline void platform_set_feature(unsigned int feature)
+{
+	set_bit(feature, platform_features);
+}
+
+static inline void platform_reset_feature(unsigned int feature)
+{
+	clear_bit(feature, platform_features);
+}
+
+static inline bool platform_has(unsigned int feature)
+{
+	return test_bit(feature, platform_features);
+}
+
+#endif /* _PLATFORM_FEATURE_H */
diff --git a/kernel/Makefile b/kernel/Makefile
index 847a82bfe0e3..2f412f80110d 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -7,7 +7,7 @@ obj-y     = fork.o exec_domain.o panic.o \
 	    cpu.o exit.o softirq.o resource.o \
 	    sysctl.o capability.o ptrace.o user.o \
 	    signal.o sys.o umh.o workqueue.o pid.o task_work.o \
-	    extable.o params.o \
+	    extable.o params.o platform-feature.o \
 	    kthread.o sys_ni.o nsproxy.o \
 	    notifier.o ksysfs.o cred.o reboot.o \
 	    async.o range.o smpboot.o ucount.o regset.o
diff --git a/kernel/platform-feature.c b/kernel/platform-feature.c
new file mode 100644
index 000000000000..2d52f8442cd5
--- /dev/null
+++ b/kernel/platform-feature.c
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/cache.h>
+#include <linux/platform-feature.h>
+
+unsigned long __read_mostly platform_features[PLATFORM_FEAT_ARRAY_SZ];
+EXPORT_SYMBOL_GPL(platform_features);
-- 
2.34.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
