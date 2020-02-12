Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C15415B1AB
	for <lists.virtualization@lfdr.de>; Wed, 12 Feb 2020 21:18:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 60BED8442D;
	Wed, 12 Feb 2020 20:18:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eiq+-k425Shx; Wed, 12 Feb 2020 20:18:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C553886A7C;
	Wed, 12 Feb 2020 20:18:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1DB0C0177;
	Wed, 12 Feb 2020 20:18:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38172C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 20:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 260B886797
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 20:18:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HMM8-eQABIe3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 20:18:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from EX13-EDG-OU-001.vmware.com (ex13-edg-ou-001.vmware.com
 [208.91.0.189])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 937A6842FC
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 20:18:50 +0000 (UTC)
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-001.vmware.com (10.113.208.155) with Microsoft SMTP Server id
 15.0.1156.6; Wed, 12 Feb 2020 12:03:45 -0800
Received: from localhost.localdomain (unknown [10.118.101.94])
 by sc9-mailhost3.vmware.com (Postfix) with ESMTP id 0978240775;
 Wed, 12 Feb 2020 12:03:48 -0800 (PST)
To: <x86@kernel.org>
Subject: [PATCH 1/5] x86/vmware: Make vmware_select_hypercall() __init
Date: Wed, 12 Feb 2020 20:03:08 +0000
Message-ID: <20200212200312.2033-2-amakhalov@vmware.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20200212200312.2033-1-amakhalov@vmware.com>
References: <20200212200312.2033-1-amakhalov@vmware.com>
MIME-Version: 1.0
Received-SPF: None (EX13-EDG-OU-001.vmware.com: amakhalov@vmware.com does not
 designate permitted sender hosts)
Cc: Juergen Gross <jgross@suse.com>, Alexey
 Makhalov <amakhalov@vmware.com>, Jonathan Corbet <corbet@lwn.net>, "VMware,
 Inc." <pv-drivers@vmware.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
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
From: Alexey Makhalov via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Alexey Makhalov <amakhalov@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

vmware_select_hypercall() is used only by the __init
functions, and should be annotated with __init as well.

Signed-off-by: Alexey Makhalov <amakhalov@vmware.com>
Reviewed-by: Thomas Hellstrom <thellstrom@vmware.com>
---
 arch/x86/kernel/cpu/vmware.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 46d732696c1c..d280560fd75e 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -213,7 +213,7 @@ static void __init vmware_platform_setup(void)
 	vmware_set_capabilities();
 }
 
-static u8 vmware_select_hypercall(void)
+static u8 __init vmware_select_hypercall(void)
 {
 	int eax, ebx, ecx, edx;
 
-- 
2.14.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
