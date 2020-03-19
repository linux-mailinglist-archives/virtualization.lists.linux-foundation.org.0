Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D0B18BB37
	for <lists.virtualization@lfdr.de>; Thu, 19 Mar 2020 16:36:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DF9D986C37;
	Thu, 19 Mar 2020 15:36:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ofBJK6ZP5ZMy; Thu, 19 Mar 2020 15:36:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 659A986C47;
	Thu, 19 Mar 2020 15:36:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 39460C07FF;
	Thu, 19 Mar 2020 15:36:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4516C07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 15:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B00AD883DA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 15:36:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vF89MQFqo2pN
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 15:36:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8830788363
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 15:36:12 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 13685214D8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 15:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584632172;
 bh=p/B+fhi7kTckDWuDXt2TkHFiBI1WQNcNA2Sa0G/Pzkk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kDtEIJR+zlEaQ/No+7kRn4gYAD3sfU2FohOc6I6bLex8EKbRZ+YiNu5pKvs8E4Dz+
 y1kTaB6IzP0VvgIVn7CnlGmTQKijL05V4UIwcb8uBS/RdloqjAAsyyP+qTCKfZoZBN
 u9YvM1HKyem8L7u8RA9ZyHUpN5AZ7WyKdzwXgpx0=
Received: by mail-wm1-f54.google.com with SMTP id 25so2959675wmk.3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 08:36:11 -0700 (PDT)
X-Gm-Message-State: ANhLgQ3vDpl32TbiZ+wmyadVSd27HBflKBsgR3phKzSpJ/Tw7g/dlcx9
 l82IJtHfe++VBZvJfLZSyi7K3Qi5MJi51G64eycMHQ==
X-Google-Smtp-Source: ADFU+vsYJk1iHN4pEM4zZ66rCnKS3xMKlbrb8V+A2LRCAZxaX77pLeIiTvN2Ikuq0ELD0wy47MEn9E4nb4r2hME/0yY=
X-Received: by 2002:a1c:b0c3:: with SMTP id z186mr4272698wme.36.1584632170436; 
 Thu, 19 Mar 2020 08:36:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200319091407.1481-1-joro@8bytes.org>
 <20200319091407.1481-71-joro@8bytes.org>
In-Reply-To: <20200319091407.1481-71-joro@8bytes.org>
From: Andy Lutomirski <luto@kernel.org>
Date: Thu, 19 Mar 2020 08:35:59 -0700
X-Gmail-Original-Message-ID: <CALCETrUOQneBHjoZkP-7T5PDijb=WOyv7xF7TD0GLR2Aw77vyA@mail.gmail.com>
Message-ID: <CALCETrUOQneBHjoZkP-7T5PDijb=WOyv7xF7TD0GLR2Aw77vyA@mail.gmail.com>
Subject: Re: [PATCH 70/70] x86/sev-es: Add NMI state tracking
To: Joerg Roedel <joro@8bytes.org>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 kvm list <kvm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Joerg Roedel <jroedel@suse.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Dan Williams <dan.j.williams@intel.com>,
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

On Thu, Mar 19, 2020 at 2:14 AM Joerg Roedel <joro@8bytes.org> wrote:
>
> From: Joerg Roedel <jroedel@suse.de>
>
> Keep NMI state in SEV-ES code so the kernel can re-enable NMIs for the
> vCPU when it reaches IRET.

IIRC I suggested just re-enabling NMI in C from do_nmi().  What was
wrong with that approach?

> +#ifdef CONFIG_AMD_MEM_ENCRYPT
> +SYM_CODE_START(sev_es_iret_user)
> +       UNWIND_HINT_IRET_REGS offset=8
> +       /*
> +        * The kernel jumps here directly from
> +        * swapgs_restore_regs_and_return_to_usermode. %rsp points already to
> +        * trampoline stack, but %cr3 is still from kernel. User-regs are live
> +        * except %rdi. Switch to user CR3, restore user %rdi and user gs_base
> +        * and single-step over IRET
> +        */
> +       SWITCH_TO_USER_CR3_STACK scratch_reg=%rdi
> +       popq    %rdi
> +       SWAPGS
> +       /*
> +        * Enable single-stepping and execute IRET. When IRET is
> +        * finished the resulting #DB exception will cause a #VC
> +        * exception to be raised. The #VC exception handler will send a
> +        * NMI-complete message to the hypervisor to re-open the NMI
> +        * window.

This is distressing to say the least.  The sequence if events is, roughly:

1. We're here with NMI masking in an unknown state because do_nmi()
and any nested faults could have done IRET, at least architecturally.
NMI could occur or it could not.  I suppose that, on SEV-ES, as least
on current CPUs, NMI is definitely masked.  What about on newer CPUs?
What if we migrate?

> +        */
> +sev_es_iret_kernel:
> +       pushf
> +       btsq $X86_EFLAGS_TF_BIT, (%rsp)
> +       popf

Now we have TF on, NMIs (architecturally) in unknown state.

> +       iretq

This causes us to pop the NMI frame off the stack.  Assuming the NMI
restart logic is invoked (which is maybe impossible?), we get #DB,
which presumably is actually delivered.  And we end up on the #DB
stack, which might already have been in use, so we have a potential
increase in nesting.  Also, #DB may be called from an unexpected
context.

Now somehow #DB is supposed to invoke #VC, which is supposed to do the
magic hypercall, and all of this is supposed to be safe?  Or is #DB
unconditionally redirected to #VC?  What happens if we had no stack
(e.g. we interrupted SYSCALL) or we were already in #VC to begin with?

I think there are two credible ways to approach this:

1. Just put the NMI unmask in do_nmi().  The kernel *already* knows
how to handle running do_nmi() with NMIs unmasked.  This is much, much
simpler than your code.

2. Have an entirely separate NMI path for the
SEV-ES-on-misdesigned-CPU case.  And have very clear documentation for
what prevents this code from being executed on future CPUs (Zen3?)
that have this issue fixed for real?

This hybrid code is no good.

--Andy
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
