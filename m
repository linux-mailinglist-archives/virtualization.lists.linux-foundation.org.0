Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD1540980B
	for <lists.virtualization@lfdr.de>; Mon, 13 Sep 2021 17:56:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE03560773;
	Mon, 13 Sep 2021 15:56:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3QCQInZ8gley; Mon, 13 Sep 2021 15:56:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CCDE160643;
	Mon, 13 Sep 2021 15:56:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D7A4EC0025;
	Mon, 13 Sep 2021 15:56:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1DCB5C0023
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Sep 2021 15:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1E9D60643
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Sep 2021 15:56:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id riR6CEIG4yCz
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Sep 2021 15:56:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09C0960720
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Sep 2021 15:56:27 +0000 (UTC)
Received: from cap.home.8bytes.org (p549ad441.dip0.t-ipconnect.de
 [84.154.212.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id B198F10A2;
 Mon, 13 Sep 2021 17:56:23 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org
Subject: [PATCH v2 11/12] x86/sev: Handle CLFLUSH MMIO events
Date: Mon, 13 Sep 2021 17:56:02 +0200
Message-Id: <20210913155603.28383-12-joro@8bytes.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210913155603.28383-1-joro@8bytes.org>
References: <20210913155603.28383-1-joro@8bytes.org>
MIME-Version: 1.0
Cc: kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Arvind Sankar <nivedita@alum.mit.edu>, hpa@zytor.com,
 Jiri Slaby <jslaby@suse.cz>, Joerg Roedel <joro@8bytes.org>,
 David Rientjes <rientjes@google.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Martin Radev <martin.b.radev@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, Cfir Cohen <cfir@google.com>,
 linux-coco@lists.linux.dev, Andy Lutomirski <luto@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Juergen Gross <jgross@suse.com>,
 Mike Stunes <mstunes@vmware.com>, Sean Christopherson <seanjc@google.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 Eric Biederman <ebiederm@xmission.com>, Erdem Aktas <erdemaktas@google.com>
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

From: Joerg Roedel <jroedel@suse.de>

Handle CLFLUSH instruction to MMIO memory in the #VC handler. The
instruction is ignored by the handler, as the Hypervisor is
responsible for cache management of emulated MMIO memory.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/kernel/sev-shared.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/x86/kernel/sev-shared.c b/arch/x86/kernel/sev-shared.c
index a7a0793c4f98..682fa202444f 100644
--- a/arch/x86/kernel/sev-shared.c
+++ b/arch/x86/kernel/sev-shared.c
@@ -632,6 +632,15 @@ static enum es_result vc_handle_mmio_twobyte_ops(struct ghcb *ghcb,
 	long *reg_data;
 
 	switch (insn->opcode.bytes[1]) {
+		/* CLFLUSH */
+	case 0xae:
+		/*
+		 * Ignore CLFLUSHes - those go to emulated MMIO anyway and the
+		 * hypervisor is responsible for cache management.
+		 */
+		ret = ES_OK;
+		break;
+
 		/* MMIO Read w/ zero-extension */
 	case 0xb6:
 		bytes = 1;
-- 
2.33.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
