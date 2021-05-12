Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C7637B72D
	for <lists.virtualization@lfdr.de>; Wed, 12 May 2021 09:55:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0371D607E3;
	Wed, 12 May 2021 07:55:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 42_cJ4R9DVkn; Wed, 12 May 2021 07:55:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC6B46075E;
	Wed, 12 May 2021 07:55:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7CF22C002E;
	Wed, 12 May 2021 07:55:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9BF6BC0001
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 May 2021 07:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7681C4027E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 May 2021 07:55:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uu8F6H6GhKnq
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 May 2021 07:55:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 15F014019A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 May 2021 07:55:11 +0000 (UTC)
Received: from cap.home.8bytes.org (p549ad305.dip0.t-ipconnect.de
 [84.154.211.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id 14ABF3E6;
 Wed, 12 May 2021 09:55:09 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: x86@kernel.org,
	Hyunwook Baek <baekhw@google.com>
Subject: [PATCH 3/6] x86/sev-es: Use __put_user()/__get_user
Date: Wed, 12 May 2021 09:54:42 +0200
Message-Id: <20210512075445.18935-4-joro@8bytes.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210512075445.18935-1-joro@8bytes.org>
References: <20210512075445.18935-1-joro@8bytes.org>
MIME-Version: 1.0
Cc: kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Arvind Sankar <nivedita@alum.mit.edu>, hpa@zytor.com,
 Jiri Slaby <jslaby@suse.cz>, Joerg Roedel <joro@8bytes.org>,
 David Rientjes <rientjes@google.com>, Martin Radev <martin.b.radev@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, Cfir Cohen <cfir@google.com>,
 linux-coco@lists.linux.dev, Andy Lutomirski <luto@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Juergen Gross <jgross@suse.com>,
 Mike Stunes <mstunes@vmware.com>, Sean Christopherson <seanjc@google.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>, Erdem Aktas <erdemaktas@google.com>
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

The put_user() and get_user() functions do checks on the address which is
passed to them. They check whether the address is actually a user-space
address and whether its fine to access it. They also call might_fault()
to indicate that they could fault and possibly sleep.

All of these checks are neither wanted nor required in the #VC exception
handler, which can be invoked from almost any context and also for MMIO
instructions from kernel space on kernel memory. All the #VC handler
wants to know is whether a fault happened when the access was tried.

This is provided by __put_user()/__get_user(), which just do the access
no matter what.

Fixes: f980f9c31a92 ("x86/sev-es: Compile early handler code into kernel image")
Cc: stable@vger.kernel.org # v5.10+
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/x86/kernel/sev.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index 6530a844eb61..110b39345b40 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -342,22 +342,22 @@ static enum es_result vc_write_mem(struct es_em_ctxt *ctxt,
 	switch (size) {
 	case 1:
 		memcpy(&d1, buf, 1);
-		if (put_user(d1, target))
+		if (__put_user(d1, target))
 			goto fault;
 		break;
 	case 2:
 		memcpy(&d2, buf, 2);
-		if (put_user(d2, target))
+		if (__put_user(d2, target))
 			goto fault;
 		break;
 	case 4:
 		memcpy(&d4, buf, 4);
-		if (put_user(d4, target))
+		if (__put_user(d4, target))
 			goto fault;
 		break;
 	case 8:
 		memcpy(&d8, buf, 8);
-		if (put_user(d8, target))
+		if (__put_user(d8, target))
 			goto fault;
 		break;
 	default:
@@ -396,22 +396,22 @@ static enum es_result vc_read_mem(struct es_em_ctxt *ctxt,
 
 	switch (size) {
 	case 1:
-		if (get_user(d1, s))
+		if (__get_user(d1, s))
 			goto fault;
 		memcpy(buf, &d1, 1);
 		break;
 	case 2:
-		if (get_user(d2, s))
+		if (__get_user(d2, s))
 			goto fault;
 		memcpy(buf, &d2, 2);
 		break;
 	case 4:
-		if (get_user(d4, s))
+		if (__get_user(d4, s))
 			goto fault;
 		memcpy(buf, &d4, 4);
 		break;
 	case 8:
-		if (get_user(d8, s))
+		if (__get_user(d8, s))
 			goto fault;
 		memcpy(buf, &d8, 8);
 		break;
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
