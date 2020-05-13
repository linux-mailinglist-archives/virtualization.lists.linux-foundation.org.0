Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B701D10D4
	for <lists.virtualization@lfdr.de>; Wed, 13 May 2020 13:13:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 69F2421080;
	Wed, 13 May 2020 11:13:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fnJ1MF7hKJgl; Wed, 13 May 2020 11:13:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 68A782155F;
	Wed, 13 May 2020 11:13:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4365BC016F;
	Wed, 13 May 2020 11:13:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 27025C016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 11:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0F3F984FDD
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 11:13:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o1-4Uea6Sgel
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 11:13:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A246F84F33
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 11:13:46 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0ac30080c108a4f2a14d75.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0a:c300:80c1:8a4:f2a1:4d75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5F1231EC0330;
 Wed, 13 May 2020 13:13:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1589368423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=5DShX4VU/NjBWaapSRN6k1YnbaJnNyw9V9LW9QgRqyo=;
 b=aMIw5BMzlTRYeeZXGKDnswten8IxM5kB72e5LQNSHKB8n9TKQgxYCiOaukgz4TjDNwHYqd
 VB77nQc8kaI/me57e0ilGdxFrJg73P5Yv8efy35fj+KJLA815R2nxO+FoBLDGs6L1E4zlC
 f7It7iW/cILUxz3zZgJ3EpqUE3V8VSQ=
Date: Wed, 13 May 2020 13:13:40 +0200
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v3 24/75] x86/boot/compressed/64: Unmap GHCB page before
 booting the kernel
Message-ID: <20200513111340.GD4025@zn.tnic>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-25-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428151725.31091-25-joro@8bytes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Cfir Cohen <cfir@google.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
 Masami Hiramatsu <mhiramat@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 hpa@zytor.com, Erdem Aktas <erdemaktas@google.com>,
 David Rientjes <rientjes@google.com>, Dan Williams <dan.j.williams@intel.com>,
 Jiri Slaby <jslaby@suse.cz>
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

On Tue, Apr 28, 2020 at 05:16:34PM +0200, Joerg Roedel wrote:
> @@ -302,9 +313,13 @@ void do_boot_page_fault(struct pt_regs *regs, unsigned long error_code)
>  	 *	- User faults
>  	 *	- Reserved bits set
>  	 */
> -	if (error_code & (X86_PF_PROT | X86_PF_USER | X86_PF_RSVD)) {
> +	if (ghcb_fault ||
> +	    error_code & (X86_PF_PROT | X86_PF_USER | X86_PF_RSVD)) {
>  		/* Print some information for debugging */
> -		error_putstr("Unexpected page-fault:");
> +		if (ghcb_fault)
> +			error_putstr("Page-fault on GHCB page:");
> +		else
> +			error_putstr("Unexpected page-fault:");

You could carve out the info dumping into a separate function to
unclutter this if-statement (diff ontop):

diff --git a/arch/x86/boot/compressed/ident_map_64.c b/arch/x86/boot/compressed/ident_map_64.c
index d3771d455249..c1979fc0f853 100644
--- a/arch/x86/boot/compressed/ident_map_64.c
+++ b/arch/x86/boot/compressed/ident_map_64.c
@@ -296,6 +296,22 @@ int set_page_non_present(unsigned long address)
 	return set_clr_page_flags(&mapping_info, address, 0, _PAGE_PRESENT);
 }
 
+static void do_pf_error(const char *msg, unsigned long error_code,
+			unsigned long address, unsigned long ip)
+{
+	error_putstr(msg);
+
+	error_putstr("\nError Code: ");
+	error_puthex(error_code);
+	error_putstr("\nCR2: 0x");
+	error_puthex(address);
+	error_putstr("\nRIP relative to _head: 0x");
+	error_puthex(ip - (unsigned long)_head);
+	error_putstr("\n");
+
+	error("Stopping.\n");
+}
+
 void do_boot_page_fault(struct pt_regs *regs, unsigned long error_code)
 {
 	unsigned long address = native_read_cr2();
@@ -309,27 +325,15 @@ void do_boot_page_fault(struct pt_regs *regs, unsigned long error_code)
 
 	/*
 	 * Check for unexpected error codes. Unexpected are:
+	 *	- Faults on the GHCB page due to unexpected #VCs
 	 *	- Faults on present pages
 	 *	- User faults
 	 *	- Reserved bits set
 	 */
-	if (ghcb_fault ||
-	    error_code & (X86_PF_PROT | X86_PF_USER | X86_PF_RSVD)) {
-		/* Print some information for debugging */
-		if (ghcb_fault)
-			error_putstr("Page-fault on GHCB page:");
-		else
-			error_putstr("Unexpected page-fault:");
-		error_putstr("\nError Code: ");
-		error_puthex(error_code);
-		error_putstr("\nCR2: 0x");
-		error_puthex(address);
-		error_putstr("\nRIP relative to _head: 0x");
-		error_puthex(regs->ip - (unsigned long)_head);
-		error_putstr("\n");
-
-		error("Stopping.\n");
-	}
+	if (ghcb_fault)
+		do_pf_error("Page-fault on GHCB page:", error_code, address, regs->ip);
+	else if (error_code & (X86_PF_PROT | X86_PF_USER | X86_PF_RSVD))
+		do_pf_error("Unexpected page-fault:", error_code, address, regs->ip);
 
 	/*
 	 * Error code is sane - now identity map the 2M region around

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
