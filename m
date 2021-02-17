Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D740931DECC
	for <lists.virtualization@lfdr.de>; Wed, 17 Feb 2021 19:10:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7551885F5F;
	Wed, 17 Feb 2021 18:10:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zL92ZpiRrtee; Wed, 17 Feb 2021 18:10:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1082485081;
	Wed, 17 Feb 2021 18:10:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DB916C0174;
	Wed, 17 Feb 2021 18:10:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 47FF5C013A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 18:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 36787863FD
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 18:10:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PJah0zGtH6IL
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 18:10:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6666086C58
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 18:10:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 97B0B64E62
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 18:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613585401;
 bh=L1OIdISDMiKRSiSWhaILOTGeRPn9DN0OB9U34bRhQek=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tmjHATDWxlVbs//lCjmhXz0QNI7+Gw1Xbz5+af5khjJyi1muOTUw92d/TN1UtGt2+
 1Z/+ybuCpbO2EuU6sV6G2o8r0rOKaIMJnntjfXGRivIE+IA4mvYi4YbzoyMI7hDer/
 W+sMpeU/DLDaMfSZAZqoR6H7pmny3c26/AsJDPnaPUqaignJNnOMxixNqBG5+/ifts
 CzF4JzxfYfG65uKYzuVz7Hvgsk6W8mumOCseKs0S+r2vq7S9vppmiuoK4a5bGMEgTe
 g0nDVaEOni97kwzYuN4Nci8afgF/Ru1s3VKUKUEVwa0DQWACmxa4F/Mwiofk9/5hLe
 afBfHjtP+JZig==
Received: by mail-ed1-f51.google.com with SMTP id s11so17685385edd.5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Feb 2021 10:10:01 -0800 (PST)
X-Gm-Message-State: AOAM533HTvhnm51y8J1GBmObnK+J0FBC7PWJSOvnyHq8tIyzPRKadWxL
 NEGAX1PQdtddvi0pv7LKXuO1sVmU+JOAPNN9q8nQZw==
X-Google-Smtp-Source: ABdhPJzwArcpxgytNfc42oZjlVBrqCPpsnJwfz+6zR5LkK02Ldu1E4mXTepd7vnfdobtpuRYckLoG8BqletPssvhb9Y=
X-Received: by 2002:a17:906:b356:: with SMTP id
 cd22mr175224ejb.253.1613585399128; 
 Wed, 17 Feb 2021 10:09:59 -0800 (PST)
MIME-Version: 1.0
References: <20210217120143.6106-1-joro@8bytes.org>
 <20210217120143.6106-3-joro@8bytes.org>
In-Reply-To: <20210217120143.6106-3-joro@8bytes.org>
From: Andy Lutomirski <luto@kernel.org>
Date: Wed, 17 Feb 2021 10:09:46 -0800
X-Gmail-Original-Message-ID: <CALCETrWw-we3O4_upDoXJ4NzZHsBqNO69ht6nBp3y+QFhwPgKw@mail.gmail.com>
Message-ID: <CALCETrWw-we3O4_upDoXJ4NzZHsBqNO69ht6nBp3y+QFhwPgKw@mail.gmail.com>
Subject: Re: [PATCH 2/3] x86/sev-es: Check if regs->sp is trusted before
 adjusting #VC IST stack
To: Joerg Roedel <joro@8bytes.org>
Cc: kvm list <kvm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Arvind Sankar <nivedita@alum.mit.edu>, "H. Peter Anvin" <hpa@zytor.com>,
 Jiri Slaby <jslaby@suse.cz>, X86 ML <x86@kernel.org>,
 David Rientjes <rientjes@google.com>, Martin Radev <martin.b.radev@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, Cfir Cohen <cfir@google.com>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Juergen Gross <jgross@suse.com>, Mike Stunes <mstunes@vmware.com>,
 Sean Christopherson <seanjc@google.com>, LKML <linux-kernel@vger.kernel.org>,
 stable <stable@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Erdem Aktas <erdemaktas@google.com>
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

On Wed, Feb 17, 2021 at 4:02 AM Joerg Roedel <joro@8bytes.org> wrote:
>
> From: Joerg Roedel <jroedel@suse.de>
>
> The code in the NMI handler to adjust the #VC handler IST stack is
> needed in case an NMI hits when the #VC handler is still using its IST
> stack.
> But the check for this condition also needs to look if the regs->sp
> value is trusted, meaning it was not set by user-space. Extend the
> check to not use regs->sp when the NMI interrupted user-space code or
> the SYSCALL gap.
>
> Reported-by: Andy Lutomirski <luto@kernel.org>
> Fixes: 315562c9af3d5 ("x86/sev-es: Adjust #VC IST Stack on entering NMI handler")
> Cc: stable@vger.kernel.org # 5.10+
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  arch/x86/kernel/sev-es.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
> index 84c1821819af..0df38b185d53 100644
> --- a/arch/x86/kernel/sev-es.c
> +++ b/arch/x86/kernel/sev-es.c
> @@ -144,7 +144,9 @@ void noinstr __sev_es_ist_enter(struct pt_regs *regs)
>         old_ist = __this_cpu_read(cpu_tss_rw.x86_tss.ist[IST_INDEX_VC]);
>
>         /* Make room on the IST stack */
> -       if (on_vc_stack(regs->sp))
> +       if (on_vc_stack(regs->sp) &&
> +           !user_mode(regs) &&
> +           !from_syscall_gap(regs))
>                 new_ist = ALIGN_DOWN(regs->sp, 8) - sizeof(old_ist);
>         else
>

Can you get rid of the linked list hack while you're at it?  This code
is unnecessarily convoluted right now, and it seems to be just asking
for weird bugs.  Just stash the old value in a local variable, please.

Meanwhile, I'm pretty sure I can break this whole scheme if the
hypervisor is messing with us.  As a trivial example, the sequence
SYSCALL gap -> #VC -> NMI -> #VC will go quite poorly.  Is this really
better than just turning IST off for #VC and documenting that we are
not secure against a malicious hypervisor yet?

--Andy
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
