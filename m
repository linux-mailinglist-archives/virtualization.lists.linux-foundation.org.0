Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 00331192CDB
	for <lists.virtualization@lfdr.de>; Wed, 25 Mar 2020 16:40:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9A19D2314A;
	Wed, 25 Mar 2020 15:40:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9OFpJ3KDJvpQ; Wed, 25 Mar 2020 15:39:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3FCE92049A;
	Wed, 25 Mar 2020 15:39:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2B8B9C1D7C;
	Wed, 25 Mar 2020 15:39:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B53D6C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Mar 2020 15:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A2AAF87C2E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Mar 2020 15:39:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 63DHAW9o2QXg
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Mar 2020 15:39:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by whitealder.osuosl.org (Postfix) with ESMTPS id F275487B85
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Mar 2020 15:39:54 +0000 (UTC)
Received: from zn.tnic (p200300EC2F0B0600F597EAD9BBACC1F1.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0b:600:f597:ead9:bbac:c1f1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8D21B1EC0CED;
 Wed, 25 Mar 2020 16:39:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1585150791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=YLgTI2CpRGQHZGrpCofrJEh8+eMyo8By5x3TJ6MG1PY=;
 b=YKro6Bqi33g4OHFZ5pL3ZedugLCCMsqNc56KydrYYPmTZwI5yzA29xDRUlbxZ71yRHbxhJ
 O8WCiyRUuE7ZmsnnidZSJYCLqpT1bK659/zS0D4NGl8ZKvcUgKbNbKczkekYXN5birVDUi
 /hoEo8RwhFmXVb2/Y8AGlyzFItQ9C1M=
Date: Wed, 25 Mar 2020 16:39:45 +0100
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 05/70] x86/insn: Make inat-tables.c suitable for
 pre-decompression code
Message-ID: <20200325153945.GD27261@zn.tnic>
References: <20200319091407.1481-1-joro@8bytes.org>
 <20200319091407.1481-6-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200319091407.1481-6-joro@8bytes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Joerg Roedel <jroedel@suse.de>, Masami Hiramatsu <mhiramat@kernel.org>,
 Andy Lutomirski <luto@kernel.org>, hpa@zytor.com,
 Dan Williams <dan.j.williams@intel.com>, Jiri Slaby <jslaby@suse.cz>
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

+ Masami.

On Thu, Mar 19, 2020 at 10:13:02AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> The inat-tables.c file has some arrays in it that contain pointers to
> other arrays. These pointers need to be relocated when the kernel
> image is moved to a different location.
> 
> The pre-decompression boot-code has no support for applying ELF
> relocations, so initialize these arrays at runtime in the
> pre-decompression code to make sure all pointers are correctly
> initialized.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  arch/x86/tools/gen-insn-attr-x86.awk       | 50 +++++++++++++++++++++-
>  tools/arch/x86/tools/gen-insn-attr-x86.awk | 50 +++++++++++++++++++++-
>  2 files changed, 98 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/tools/gen-insn-attr-x86.awk b/arch/x86/tools/gen-insn-attr-x86.awk
> index a42015b305f4..af38469afd14 100644
> --- a/arch/x86/tools/gen-insn-attr-x86.awk
> +++ b/arch/x86/tools/gen-insn-attr-x86.awk
> @@ -362,6 +362,9 @@ function convert_operands(count,opnd,       i,j,imm,mod)
>  END {
>  	if (awkchecked != "")
>  		exit 1
> +
> +	print "#ifndef __BOOT_COMPRESSED\n"
> +
>  	# print escape opcode map's array
>  	print "/* Escape opcode map array */"
>  	print "const insn_attr_t * const inat_escape_tables[INAT_ESC_MAX + 1]" \
> @@ -388,6 +391,51 @@ END {
>  		for (j = 0; j < max_lprefix; j++)
>  			if (atable[i,j])
>  				print "	["i"]["j"] = "atable[i,j]","
> -	print "};"
> +	print "};\n"
> +
> +	print "#else /* !__BOOT_COMPRESSED */\n"
> +
> +	print "/* Escape opcode map array */"
> +	print "static const insn_attr_t *inat_escape_tables[INAT_ESC_MAX + 1]" \
> +	      "[INAT_LSTPFX_MAX + 1];"
> +	print ""
> +
> +	print "/* Group opcode map array */"
> +	print "static const insn_attr_t *inat_group_tables[INAT_GRP_MAX + 1]"\
> +	      "[INAT_LSTPFX_MAX + 1];"
> +	print ""
> +
> +	print "/* AVX opcode map array */"
> +	print "static const insn_attr_t *inat_avx_tables[X86_VEX_M_MAX + 1]"\
> +	      "[INAT_LSTPFX_MAX + 1];"
> +	print ""
> +
> +	print "static void inat_init_tables(void)"
> +	print "{"
> +
> +	# print escape opcode map's array
> +	print "\t/* Print Escape opcode map array */"
> +	for (i = 0; i < geid; i++)
> +		for (j = 0; j < max_lprefix; j++)
> +			if (etable[i,j])
> +				print "\tinat_escape_tables["i"]["j"] = "etable[i,j]";"
> +	print ""
> +
> +	# print group opcode map's array
> +	print "\t/* Print Group opcode map array */"
> +	for (i = 0; i < ggid; i++)
> +		for (j = 0; j < max_lprefix; j++)
> +			if (gtable[i,j])
> +				print "\tinat_group_tables["i"]["j"] = "gtable[i,j]";"
> +	print ""
> +	# print AVX opcode map's array
> +	print "\t/* Print AVX opcode map array */"
> +	for (i = 0; i < gaid; i++)
> +		for (j = 0; j < max_lprefix; j++)
> +			if (atable[i,j])
> +				print "\tinat_avx_tables["i"]["j"] = "atable[i,j]";"
> +
> +	print "}"
> +	print "#endif"
>  }
>  
> diff --git a/tools/arch/x86/tools/gen-insn-attr-x86.awk b/tools/arch/x86/tools/gen-insn-attr-x86.awk
> index a42015b305f4..af38469afd14 100644
> --- a/tools/arch/x86/tools/gen-insn-attr-x86.awk
> +++ b/tools/arch/x86/tools/gen-insn-attr-x86.awk
> @@ -362,6 +362,9 @@ function convert_operands(count,opnd,       i,j,imm,mod)
>  END {
>  	if (awkchecked != "")
>  		exit 1
> +
> +	print "#ifndef __BOOT_COMPRESSED\n"
> +
>  	# print escape opcode map's array
>  	print "/* Escape opcode map array */"
>  	print "const insn_attr_t * const inat_escape_tables[INAT_ESC_MAX + 1]" \
> @@ -388,6 +391,51 @@ END {
>  		for (j = 0; j < max_lprefix; j++)
>  			if (atable[i,j])
>  				print "	["i"]["j"] = "atable[i,j]","
> -	print "};"
> +	print "};\n"
> +
> +	print "#else /* !__BOOT_COMPRESSED */\n"
> +
> +	print "/* Escape opcode map array */"
> +	print "static const insn_attr_t *inat_escape_tables[INAT_ESC_MAX + 1]" \
> +	      "[INAT_LSTPFX_MAX + 1];"
> +	print ""
> +
> +	print "/* Group opcode map array */"
> +	print "static const insn_attr_t *inat_group_tables[INAT_GRP_MAX + 1]"\
> +	      "[INAT_LSTPFX_MAX + 1];"
> +	print ""
> +
> +	print "/* AVX opcode map array */"
> +	print "static const insn_attr_t *inat_avx_tables[X86_VEX_M_MAX + 1]"\
> +	      "[INAT_LSTPFX_MAX + 1];"
> +	print ""
> +
> +	print "static void inat_init_tables(void)"
> +	print "{"
> +
> +	# print escape opcode map's array
> +	print "\t/* Print Escape opcode map array */"
> +	for (i = 0; i < geid; i++)
> +		for (j = 0; j < max_lprefix; j++)
> +			if (etable[i,j])
> +				print "\tinat_escape_tables["i"]["j"] = "etable[i,j]";"
> +	print ""
> +
> +	# print group opcode map's array
> +	print "\t/* Print Group opcode map array */"
> +	for (i = 0; i < ggid; i++)
> +		for (j = 0; j < max_lprefix; j++)
> +			if (gtable[i,j])
> +				print "\tinat_group_tables["i"]["j"] = "gtable[i,j]";"
> +	print ""
> +	# print AVX opcode map's array
> +	print "\t/* Print AVX opcode map array */"
> +	for (i = 0; i < gaid; i++)
> +		for (j = 0; j < max_lprefix; j++)
> +			if (atable[i,j])
> +				print "\tinat_avx_tables["i"]["j"] = "atable[i,j]";"
> +
> +	print "}"
> +	print "#endif"
>  }
>  
> -- 
> 2.17.1
> 

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
