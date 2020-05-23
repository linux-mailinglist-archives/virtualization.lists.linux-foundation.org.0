Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 614121DF5D9
	for <lists.virtualization@lfdr.de>; Sat, 23 May 2020 09:59:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E52798820F;
	Sat, 23 May 2020 07:59:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3knnMO6Oa5fm; Sat, 23 May 2020 07:59:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3ADBB8814A;
	Sat, 23 May 2020 07:59:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0AC33C0176;
	Sat, 23 May 2020 07:59:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30662C0176
 for <virtualization@lists.linux-foundation.org>;
 Sat, 23 May 2020 07:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 14A68203C9
 for <virtualization@lists.linux-foundation.org>;
 Sat, 23 May 2020 07:59:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ozXLl8jRRQV6
 for <virtualization@lists.linux-foundation.org>;
 Sat, 23 May 2020 07:59:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by silver.osuosl.org (Postfix) with ESMTPS id 5E9E6203A7
 for <virtualization@lists.linux-foundation.org>;
 Sat, 23 May 2020 07:59:33 +0000 (UTC)
Received: from zn.tnic (p200300ec2f1b96004c59f332ede330a0.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f1b:9600:4c59:f332:ede3:30a0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 215841EC0338;
 Sat, 23 May 2020 09:59:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1590220770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=PIo+t2JcI6yVRedmlgz10X421O+M066c0hltaVL112k=;
 b=ZLEXWPqMrm4G0DwJpbs8Xgi9xF4kgV5KjgjmvT9VK9gOBCLZtVjao6/GkCbl6+4X+V5fwU
 RC9EWJFZV06I1nR899eptspZxrdViE5apbzfahsF0PgTl3LX1V8HCCJUtgslfPsCUj9YUS
 /PGarM2WPPCDvyJoyVnqQyWd5w4+ROU=
Date: Sat, 23 May 2020 09:59:24 +0200
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v3 47/75] x86/sev-es: Add Runtime #VC Exception Handler
Message-ID: <20200523075924.GB27431@zn.tnic>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-48-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428151725.31091-48-joro@8bytes.org>
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

On Tue, Apr 28, 2020 at 05:16:57PM +0200, Joerg Roedel wrote:
> diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
> index a4fa7f351bf2..bc3a58427028 100644
> --- a/arch/x86/kernel/sev-es.c
> +++ b/arch/x86/kernel/sev-es.c
> @@ -10,6 +10,7 @@
>  #include <linux/sched/debug.h>	/* For show_regs() */
>  #include <linux/percpu-defs.h>
>  #include <linux/mem_encrypt.h>
> +#include <linux/lockdep.h>
>  #include <linux/printk.h>
>  #include <linux/mm_types.h>
>  #include <linux/set_memory.h>
> @@ -25,7 +26,7 @@
>  #include <asm/insn-eval.h>
>  #include <asm/fpu/internal.h>
>  #include <asm/processor.h>
> -#include <asm/trap_defs.h>
> +#include <asm/traps.h>
>  #include <asm/svm.h>
>  
>  /* For early boot hypervisor communication in SEV-ES enabled guests */
> @@ -46,10 +47,26 @@ struct sev_es_runtime_data {
>  
>  	/* Physical storage for the per-cpu IST stacks of the #VC handler */
>  	struct vmm_exception_stacks vc_stacks __aligned(PAGE_SIZE);
> +
> +	/* Reserve on page per CPU as backup storage for the unencrypted GHCB */

		  one

> +	struct ghcb backup_ghcb;

I could use some text explaining what those backups are for?

> +	/*
> +	 * Mark the per-cpu GHCBs as in-use to detect nested #VC exceptions.
> +	 * There is no need for it to be atomic, because nothing is written to
> +	 * the GHCB between the read and the write of ghcb_active. So it is safe
> +	 * to use it when a nested #VC exception happens before the write.
> +	 */

Looks liks that is that text... support for nested #VC exceptions.
I'm sure this has come up already but why do we even want to support
nested #VCs? IOW, can we do without them first or are they absolutely
necessary?

I'm guessing VC exceptions inside the VC handler but what are the
sensible use cases?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
