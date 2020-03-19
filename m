Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3A818BF8C
	for <lists.virtualization@lfdr.de>; Thu, 19 Mar 2020 19:43:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 78735220EC;
	Thu, 19 Mar 2020 18:43:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ggPwrVVegUXv; Thu, 19 Mar 2020 18:43:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4813E2048D;
	Thu, 19 Mar 2020 18:43:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2EE36C07FF;
	Thu, 19 Mar 2020 18:43:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E8D6AC07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 18:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E3BAF86CDF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 18:43:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nNGa2M5XLZ-b
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 18:43:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BE78386CDE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 18:43:34 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 43A3B215A4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 18:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584643414;
 bh=16Mv0Bki/NfvJX5iwDxd/8tDdJeb33292LnGanZEgHk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gZnE0N1zX3N4hrpdEBg3hayONMFggbn4LZXMYyZpsRN0k2dZjof1Jfd1Qmvhdh93+
 sGF9hoGmQ3D9O6lCKLVt/Fn4A0XRLnor5uOC07hgnzJMuGptsX7jsAEzADkZqINynv
 dtZbN5mYI74zyy3gDrcqFJNyDt6bH15ZmZzbPenY=
Received: by mail-wm1-f51.google.com with SMTP id z12so3567407wmf.5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 11:43:34 -0700 (PDT)
X-Gm-Message-State: ANhLgQ3X3mmVCTijUAR342o5QvRzVUnNopTPfN7miWhV8snJO0XQkNPU
 cFXv3Zq2Cya8VNJOoOmWertBVb+4JBIz1IX3TU5njQ==
X-Google-Smtp-Source: ADFU+vv10cBd6Yipt9Fp30VfQsiUak847hkVmmyNfiLI7ndWg3gIIQhdPQtda5z9gYC13rmpADmNaW86Fu4VfLkwdyA=
X-Received: by 2002:a1c:1904:: with SMTP id 4mr765861wmz.21.1584643412632;
 Thu, 19 Mar 2020 11:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200319091407.1481-1-joro@8bytes.org>
 <20200319091407.1481-42-joro@8bytes.org>
 <CALCETrW9EYi5dzCKNtKkxM18CC4n5BZxTp1=qQ5qZccwstXjzg@mail.gmail.com>
 <20200319162439.GE5122@8bytes.org>
In-Reply-To: <20200319162439.GE5122@8bytes.org>
From: Andy Lutomirski <luto@kernel.org>
Date: Thu, 19 Mar 2020 11:43:20 -0700
X-Gmail-Original-Message-ID: <CALCETrW6LOwEfjJz-S7fFJvPqgr9BoCkRG2MA-Pk6K_y_rmGHg@mail.gmail.com>
Message-ID: <CALCETrW6LOwEfjJz-S7fFJvPqgr9BoCkRG2MA-Pk6K_y_rmGHg@mail.gmail.com>
Subject: Re: [PATCH 41/70] x86/sev-es: Add Runtime #VC Exception Handler
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

On Thu, Mar 19, 2020 at 9:24 AM Joerg Roedel <joro@8bytes.org> wrote:
>
> On Thu, Mar 19, 2020 at 08:44:03AM -0700, Andy Lutomirski wrote:
> > On Thu, Mar 19, 2020 at 2:14 AM Joerg Roedel <joro@8bytes.org> wrote:
> > >
> > > From: Tom Lendacky <thomas.lendacky@amd.com>
> > >
> > > Add the handler for #VC exceptions invoked at runtime.
> >
> > If I read this correctly, this does not use IST.  If that's true, I
> > don't see how this can possibly work.  There at least two nasty cases
> > that come to mind:
> >
> > 1. SYSCALL followed by NMI.  The NMI IRET hack gets to #VC and we
> > explode.  This is fixable by getting rid of the NMI EFLAGS.TF hack.
>
> Not an issue in this patch-set, the confusion comes from the fact that I
> left some parts of the single-step-over-iret code in the patch. But it
> is not used. The NMI handling in this patch-set sends the NMI-complete
> message before the IRET, when the kernel is still in a safe environment
> (kernel stack, kernel cr3).

Got it!

>
> > 2. tools/testing/selftests/x86/mov_ss_trap_64.  User code does MOV
> > (addr), SS; SYSCALL, where addr has a data breakpoint.  We get #DB
> > promoted to #VC with no stack.
>
> Also not an issue, as debugging is not supported at the moment in SEV-ES
> guests (hardware has no way yet to save/restore the debug registers
> across #VMEXITs). But this will change with future hardware. If you look
> at the implementation for dr7 read/write events, you see that the dr7
> value is cached and returned, but does not make it to the hardware dr7.

Eek.  This would probably benefit from some ptrace / perf logic to
prevent the kernel or userspace from thinking that debugging works.

I guess this means that #DB only happens due to TF or INT01.  I
suppose this is probably okay.

>
> I though about using IST for the #VC handler, but the implications for
> nesting #VC handlers made me decide against it. But for future hardware
> that supports debugging inside SEV-ES guests it will be an issue. I'll
> think about how to fix the problem, it probably has to be IST :(

Or future generations could have enough hardware support for debugging
that #DB doesn't need to be intercepted or can be re-injected
correctly with the #DB vector.

>
> Regards,
>
>         Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
