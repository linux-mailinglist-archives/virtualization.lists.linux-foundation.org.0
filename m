Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A8918BF83
	for <lists.virtualization@lfdr.de>; Thu, 19 Mar 2020 19:40:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 720F98846E;
	Thu, 19 Mar 2020 18:40:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X+0RS8reJNqS; Thu, 19 Mar 2020 18:40:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 94205883F6;
	Thu, 19 Mar 2020 18:40:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 85C36C07FF;
	Thu, 19 Mar 2020 18:40:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF5ECC07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 18:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9A8B087E97
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 18:40:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aFWpE68UoBWO
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 18:40:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D090187A33
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 18:40:52 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 57D5D2078C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 18:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584643252;
 bh=Nnz8DKyINwp4/CvCy4G7iAxgaPQesPB+hm/vCt15eTU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=R55Y0XT+kDu4C+QH9pSvmerrrpvk8vLjCLyhz6RGjBEy+fuKyV/rBtZviY5CH2bji
 i224dYCMGcoHWaxtOQJty0JTZzlS1PN6iuSbG/Wuu4j5JlPKdprJK/yKOP6Xvpa3E7
 eUIY9FLatITEQ3vemNqnCSh3CuYYaov+WXaxPVpE=
Received: by mail-wm1-f50.google.com with SMTP id 11so3773896wmo.2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 11:40:52 -0700 (PDT)
X-Gm-Message-State: ANhLgQ06qO7Wk+/ADFmy4OEdWWN/xFOoWC76udNpIsgWpGE3YvsBb7vA
 OUDEfz2U8y425ULjgwQFvde+McTXNfkVj8KxRvBg6w==
X-Google-Smtp-Source: ADFU+vvWBH0AH3H+Jf2dJbQy+fo/OsWleVD+wRMeOKLdEDzg7ZJ7+mROEy3ck/x1sUe+/gBAEu7toV/J5yrTI9VoQ/4=
X-Received: by 2002:a1c:b0c3:: with SMTP id z186mr5129118wme.36.1584643250721; 
 Thu, 19 Mar 2020 11:40:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200319091407.1481-1-joro@8bytes.org>
 <20200319091407.1481-71-joro@8bytes.org>
 <CALCETrUOQneBHjoZkP-7T5PDijb=WOyv7xF7TD0GLR2Aw77vyA@mail.gmail.com>
 <20200319160749.GC5122@8bytes.org>
In-Reply-To: <20200319160749.GC5122@8bytes.org>
From: Andy Lutomirski <luto@kernel.org>
Date: Thu, 19 Mar 2020 11:40:39 -0700
X-Gmail-Original-Message-ID: <CALCETrXY5M87C1Fc3QvTkc6MdbQ_3gAuOPUeWJktAzK4T60QNQ@mail.gmail.com>
Message-ID: <CALCETrXY5M87C1Fc3QvTkc6MdbQ_3gAuOPUeWJktAzK4T60QNQ@mail.gmail.com>
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

On Thu, Mar 19, 2020 at 9:07 AM Joerg Roedel <joro@8bytes.org> wrote:
>
> Hi Andy,
>
> On Thu, Mar 19, 2020 at 08:35:59AM -0700, Andy Lutomirski wrote:
> > On Thu, Mar 19, 2020 at 2:14 AM Joerg Roedel <joro@8bytes.org> wrote:
> > >
> > > From: Joerg Roedel <jroedel@suse.de>
> > >
> > > Keep NMI state in SEV-ES code so the kernel can re-enable NMIs for the
> > > vCPU when it reaches IRET.
> >
> > IIRC I suggested just re-enabling NMI in C from do_nmi().  What was
> > wrong with that approach?
>
> If I understand the code correctly a nested NMI will just reset the
> interrupted NMI handler to start executing again at 'restart_nmi'.
> The interrupted NMI handler could be in the #VC handler, and it is not
> safe to just jump back to the start of the NMI handler from somewhere
> within the #VC handler.

Nope.  A nested NMI will reset the interrupted NMI's return frame to
cause it to run again when it's done.  I don't think this will have
any real interaction with #VC.  There's no longjmp() here.

>
> So I decided to not allow NMI nesting for SEV-ES and only re-enable the
> NMI window when the first NMI returns. This is not implemented in this
> patch, but I will do that once Thomas' entry-code rewrite is upstream.
>

I certainly *like* preventing nesting, but I don't think we really
want a whole alternate NMI path just for a couple of messed-up AMD
generations.  And the TF trick is not so pretty either.

> > This causes us to pop the NMI frame off the stack.  Assuming the NMI
> > restart logic is invoked (which is maybe impossible?), we get #DB,
> > which presumably is actually delivered.  And we end up on the #DB
> > stack, which might already have been in use, so we have a potential
> > increase in nesting.  Also, #DB may be called from an unexpected
> > context.
>
> An SEV-ES hypervisor is required to intercept #DB, which means that the
> #DB exception actually ends up being a #VC exception. So it will not end
> up on the #DB stack.

With your patch set, #DB doesn't seem to end up on the #DB stack either.

>
> > I think there are two credible ways to approach this:
> >
> > 1. Just put the NMI unmask in do_nmi().  The kernel *already* knows
> > how to handle running do_nmi() with NMIs unmasked.  This is much, much
> > simpler than your code.
>
> Right, and I thought about that, but the implication is that the
> complexity is moved somewhere else, namely into the #VC handler, which
> then has to be restartable.

As above, I don't think there's an actual problem here.

>
> > 2. Have an entirely separate NMI path for the
> > SEV-ES-on-misdesigned-CPU case.  And have very clear documentation for
> > what prevents this code from being executed on future CPUs (Zen3?)
> > that have this issue fixed for real?
>
> That sounds like a good alternative, I will investigate this approach.
> The NMI handler should be much simpler as it doesn't need to allow NMI
> nesting. The question is, does the C code down the NMI path depend on
> the NMI handlers stack frame layout (e.g. the in-nmi flag)?

Nope.  In particular, the 32-bit path doesn't have all this.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
