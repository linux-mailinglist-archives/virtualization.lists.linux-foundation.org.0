Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C6A6AB8D3
	for <lists.virtualization@lfdr.de>; Mon,  6 Mar 2023 09:51:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 212038149E;
	Mon,  6 Mar 2023 08:51:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 212038149E
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=Qx2LNM8G
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rlIzNH2hjdCw; Mon,  6 Mar 2023 08:51:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D582E8149D;
	Mon,  6 Mar 2023 08:51:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D582E8149D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 124E9C008B;
	Mon,  6 Mar 2023 08:51:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 00947C0032
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Mar 2023 08:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCEF240385
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Mar 2023 08:51:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCEF240385
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=alien8.de header.i=@alien8.de
 header.a=rsa-sha256 header.s=dkim header.b=Qx2LNM8G
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eMlbCHgzB6gu
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Mar 2023 08:51:35 +0000 (UTC)
X-Greylist: delayed 00:10:04 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4714B40140
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4714B40140
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Mar 2023 08:51:35 +0000 (UTC)
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 364BD1EC0554;
 Mon,  6 Mar 2023 09:41:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1678092083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=Ch2JqcQidKQQw3jxmmjcy3XtJaLHvZg4719TcnfXY28=;
 b=Qx2LNM8GAehIIoRwD6DIBt12Y5dpKRZm+CSgKO+pDq6m4Xe438WsLBNmOQg6NKRA3ywcQ5
 LJE1fX9vDOQbHArJ99nI+xx1I2w/W+UEGxcn4QY6UKQEBvGEq5lZ1JEnIu+MfHiejEZE/z
 aGW6efJMwgYssl+dV21lAbF+6UBau7E=
Date: Mon, 6 Mar 2023 09:41:17 +0100
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] x86/paravirt: merge activate_mm and dup_mmap callbacks
Message-ID: <20230306084117.GAZAWnLeGI09VLsXkC@fat_crate.local>
References: <20230207075902.7539-1-jgross@suse.com>
 <dc5fbb2e-6a23-15e5-a451-e069e90a0656@csail.mit.edu>
 <2b4b0590-8327-3567-f4cd-e610d52fbf1c@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2b4b0590-8327-3567-f4cd-e610d52fbf1c@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alexey Makhalov <amakhalov@vmware.com>,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
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

On Thu, Feb 23, 2023 at 04:05:51PM +0100, Juergen Gross wrote:
> x86 maintainers, I think this patch should be carried via the tip tree.

You missed a spot. I'll whack it.

diff --git a/arch/x86/include/asm/mmu_context.h b/arch/x86/include/asm/mmu_context.h
index a8b323266179..c3ad8a526378 100644
--- a/arch/x86/include/asm/mmu_context.h
+++ b/arch/x86/include/asm/mmu_context.h
@@ -16,13 +16,6 @@
 
 extern atomic64_t last_mm_ctx_id;
 
-#ifndef CONFIG_PARAVIRT_XXL
-static inline void paravirt_activate_mm(struct mm_struct *prev,
-					struct mm_struct *next)
-{
-}
-#endif	/* !CONFIG_PARAVIRT_XXL */
-
 #ifdef CONFIG_PERF_EVENTS
 DECLARE_STATIC_KEY_FALSE(rdpmc_never_available_key);
 DECLARE_STATIC_KEY_FALSE(rdpmc_always_available_key);

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
